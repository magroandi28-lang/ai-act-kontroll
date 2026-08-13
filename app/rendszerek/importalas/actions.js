"use server";

import ExcelJS from "exceljs";
import { createClient } from "../../../lib/supabase/server";

const MAX_FILE_SIZE = 2 * 1024 * 1024;
const MAX_ROWS = 100;

function normalize(value) {
  return String(value ?? "").replace(/^\uFEFF/, "").trim().replace(/\s+/g, " ").toLocaleLowerCase("hu-HU");
}

function cellText(cell) {
  if (cell == null) return "";
  if (typeof cell === "object") {
    if (Array.isArray(cell.richText)) return cell.richText.map((part) => part.text).join("");
    if (cell.text != null) return String(cell.text);
    if (cell.result != null) return String(cell.result);
  }
  return String(cell);
}

function parseCsv(text) {
  const rows = [];
  let row = [];
  let value = "";
  let quoted = false;

  for (let index = 0; index < text.length; index += 1) {
    const char = text[index];
    if (char === '"' && quoted && text[index + 1] === '"') {
      value += '"';
      index += 1;
    } else if (char === '"') {
      quoted = !quoted;
    } else if ((char === "," || char === ";") && !quoted) {
      row.push(value);
      value = "";
    } else if ((char === "\n" || char === "\r") && !quoted) {
      if (char === "\r" && text[index + 1] === "\n") index += 1;
      row.push(value);
      if (row.some((item) => item.trim())) rows.push(row);
      row = [];
      value = "";
    } else {
      value += char;
    }
  }
  row.push(value);
  if (row.some((item) => item.trim())) rows.push(row);
  return rows;
}

function findDataRows(rows) {
  const headerIndex = rows.findIndex((row) => {
    const values = row.map(normalize);
    return values.includes("rendszer neve") && values.includes("használati profil");
  });
  if (headerIndex < 0) throw new Error("Nem található a „Rendszer neve” és „Használati profil” fejléc.");

  const headers = rows[headerIndex].map(normalize);
  const nameIndex = headers.indexOf("rendszer neve");
  const profileIndex = headers.indexOf("használati profil");
  return rows.slice(headerIndex + 1).map((row, offset) => ({
    rowNumber: headerIndex + offset + 2,
    name: cellText(row[nameIndex]),
    enteredProfile: cellText(row[profileIndex]),
  })).filter((row) => row.name.trim() || row.enteredProfile.trim());
}

async function readRows(file) {
  const extension = file.name.split(".").pop()?.toLowerCase();
  if (extension === "csv") {
    return findDataRows(parseCsv(await file.text()));
  }
  if (extension !== "xlsx") throw new Error("Csak XLSX vagy CSV fájl tölthető fel.");

  const workbook = new ExcelJS.Workbook();
  await workbook.xlsx.load(Buffer.from(await file.arrayBuffer()));
  const sheet = workbook.getWorksheet("Rendszerek") || workbook.worksheets[0];
  if (!sheet) throw new Error("A munkafüzet nem tartalmaz feldolgozható lapot.");

  const rows = [];
  sheet.eachRow({ includeEmpty: true }, (sheetRow) => {
    const values = [];
    for (let column = 1; column <= Math.max(sheetRow.cellCount, 2); column += 1) {
      values.push(sheetRow.getCell(column).value);
    }
    rows.push(values);
  });
  return findDataRows(rows);
}

async function getContext() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) throw new Error("A művelethez bejelentkezés szükséges.");

  const { data: membership } = await supabase
    .from("aic_organisation_members")
    .select("organisation_id")
    .eq("user_id", user.id)
    .maybeSingle();
  if (!membership) throw new Error("A szervezet nem érhető el.");
  return { supabase, organisationId: membership.organisation_id };
}

export async function previewImport(formData) {
  try {
    const file = formData.get("file");
    if (!file || typeof file.arrayBuffer !== "function" || file.size === 0) return { error: "Válassz ki egy XLSX vagy CSV fájlt." };
    if (file.size > MAX_FILE_SIZE) return { error: "A fájl legfeljebb 2 MB méretű lehet." };

    const sourceRows = await readRows(file);
    if (!sourceRows.length) return { error: "A fájl nem tartalmaz kitöltött adatsort." };
    if (sourceRows.length > MAX_ROWS) return { error: `Egyszerre legfeljebb ${MAX_ROWS} rendszer ellenőrizhető.` };

    const { supabase, organisationId } = await getContext();
    const [{ data: profiles, error: profileError }, { data: systems, error: systemError }] = await Promise.all([
      supabase.from("aic_usage_profiles").select("code, name_hu").eq("active", true),
      supabase.from("aic_ai_systems").select("name").eq("organisation_id", organisationId).eq("inventory_status", "active"),
    ]);
    if (profileError || systemError) throw new Error("Az ellenőrzéshez szükséges adatok nem tölthetők be.");

    const profileMap = new Map();
    for (const profile of profiles || []) {
      profileMap.set(normalize(profile.code), profile);
      profileMap.set(normalize(profile.name_hu), profile);
    }
    const existingNames = new Set((systems || []).map((system) => normalize(system.name)));
    const fileNames = new Map();
    for (const row of sourceRows) {
      const key = normalize(row.name);
      if (key) fileNames.set(key, (fileNames.get(key) || 0) + 1);
    }

    const rows = sourceRows.map((row) => {
      const errors = [];
      const cleanName = row.name.trim().replace(/\s+/g, " ");
      const nameKey = normalize(cleanName);
      const profile = profileMap.get(normalize(row.enteredProfile));
      if (!cleanName) errors.push("Hiányzik a rendszer neve.");
      if (!row.enteredProfile.trim()) errors.push("Hiányzik a használati profil.");
      else if (!profile) errors.push("Ismeretlen használati profil.");
      if (nameKey && fileNames.get(nameKey) > 1) errors.push("A név többször szerepel a fájlban.");
      if (nameKey && existingNames.has(nameKey)) errors.push("Ilyen nevű rendszer már létezik.");

      return {
        rowNumber: row.rowNumber,
        name: cleanName,
        enteredProfile: row.enteredProfile.trim(),
        profileCode: profile?.code || "",
        profileName: profile?.name_hu || "",
        valid: errors.length === 0,
        errors,
      };
    });

    return { rows, validCount: rows.filter((row) => row.valid).length, errorCount: rows.filter((row) => !row.valid).length };
  } catch (error) {
    return { error: error.message || "A fájl feldolgozása nem sikerült." };
  }
}

export async function importSystems(rows, confirmed) {
  try {
    if (!confirmed) return { error: "Az importálás előtt erősítsd meg a profilfeltételeket." };
    if (!Array.isArray(rows) || rows.length === 0 || rows.length > MAX_ROWS) return { error: "Nincs importálható adatsor." };
    if (rows.some((row) => !row.valid || !row.name || !row.profileCode)) return { error: "A hibás sorokat az importálás előtt javítani kell." };

    const { supabase, organisationId } = await getContext();
    const { data, error } = await supabase.rpc("aic_import_ai_systems_from_profiles", {
      p_organisation_id: organisationId,
      p_rows: rows.map((row) => ({ name: row.name, profile_code: row.profileCode })),
      p_conditions_confirmed: true,
    });
    if (error) return { error: error.message || "Az importálás nem sikerült." };
    return { success: true, importedCount: data?.imported_count || rows.length };
  } catch (error) {
    return { error: error.message || "Az importálás nem sikerült." };
  }
}
