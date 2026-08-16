"use server";

import ExcelJS from "exceljs";
import { createClient } from "../../../lib/supabase/server";

const MAX_FILE_SIZE = 2 * 1024 * 1024;
const MAX_ROWS = 100;
const VALID_ROLES = new Set(["provider", "deployer", "importer", "distributor", "authorised_representative"]);
const VALID_LIFECYCLES = new Set(["planned", "development", "testing", "pilot", "production", "suspended", "retired"]);

// A sablon minden oszlopa kötelező. Korábban a hiányzó oszlopokat néma
// alapértelmezés pótolta, ami rossz iparág- vagy szerepkör-besorolást,
// azon keresztül pedig hibás szabályzatot eredményezett.
const REQUIRED_HEADERS = [
  "rendszer neve",
  "rendszertípus kód",
  "iparág kód",
  "rendeltetés",
  "eszköz funkciók kódjai",
  "szervezeti szerep",
  "életciklus",
  "eu-ban használják",
  "mi-használat egyértelmű",
  "nincs tiltott gyakorlat",
  "szabályozott termékbe épül",
];

// A nyilatkozatoszlopok Igen/Nem értéket vesznek fel. Üres cellát nem
// tekintünk válasznak: az importáló kifejezetten nyilatkozzon.
function igenNem(ertek) {
  const tisztitott = normalize(ertek);
  if (tisztitott === "igen" || tisztitott === "i" || tisztitott === "yes") return true;
  if (tisztitott === "nem" || tisztitott === "n" || tisztitott === "no") return false;
  return null;
}

function normalize(value) {
  return String(value ?? "").replace(/^﻿/, "").trim().replace(/\s+/g, " ").toLocaleLowerCase("hu-HU");
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
    } else if (char === '"') quoted = !quoted;
    else if ((char === "," || char === ";") && !quoted) {
      row.push(value);
      value = "";
    } else if ((char === "\n" || char === "\r") && !quoted) {
      if (char === "\r" && text[index + 1] === "\n") index += 1;
      row.push(value);
      if (row.some((item) => item.trim())) rows.push(row);
      row = [];
      value = "";
    } else value += char;
  }
  row.push(value);
  if (row.some((item) => item.trim())) rows.push(row);
  return rows;
}

function findDataRows(rows) {
  const headerIndex = rows.findIndex((row) => {
    const values = row.map((cell) => normalize(cellText(cell)));
    return values.includes("rendszer neve") && values.includes("rendszertípus kód");
  });
  if (headerIndex < 0) throw new Error("A feltöltött fájl nem az általános MI-rendszerimport sablonja.");

  const headers = rows[headerIndex].map((cell) => normalize(cellText(cell)));
  const column = (name) => headers.indexOf(name);

  const missingHeaders = REQUIRED_HEADERS.filter((header) => column(header) < 0);
  if (missingHeaders.length) {
    throw new Error(
      `A sablon kötelező oszlopai hiányoznak vagy át lettek nevezve: ${missingHeaders.join(", ")}. ` +
        "Töltsd le újra az importsablont, és abba másold az adatokat."
    );
  }

  return rows.slice(headerIndex + 1).map((row, offset) => {
    const capabilityCodes = cellText(row[column("eszköz funkciók kódjai")])
      .split(/[;,|]/).map((code) => code.trim().toUpperCase()).filter(Boolean);
    return {
      rowNumber: headerIndex + offset + 2,
      name: cellText(row[column("rendszer neve")]).trim().replace(/\s+/g, " "),
      system_type_code: cellText(row[column("rendszertípus kód")]).trim().toUpperCase(),
      industry_code: cellText(row[column("iparág kód")]).trim().toLowerCase(),
      intended_purpose: cellText(row[column("rendeltetés")]).trim(),
      capability_codes: [...new Set(capabilityCodes)].sort(),
      organisation_role: cellText(row[column("szervezeti szerep")]).trim().toLowerCase(),
      lifecycle_stage: cellText(row[column("életciklus")]).trim().toLowerCase(),
      eu_hasznalat: igenNem(cellText(row[column("eu-ban használják")])),
      mi_egyertelmu: igenNem(cellText(row[column("mi-használat egyértelmű")])),
      nincs_tiltott_gyakorlat: igenNem(cellText(row[column("nincs tiltott gyakorlat")])),
      szabalyozott_termek: igenNem(cellText(row[column("szabályozott termékbe épül")])),
    };
  }).filter((row) => row.name || row.system_type_code || row.intended_purpose || row.capability_codes.length);
}

async function readRows(file) {
  const extension = file.name.split(".").pop()?.toLowerCase();
  if (extension === "csv") return findDataRows(parseCsv(await file.text()));
  if (extension !== "xlsx") throw new Error("Csak XLSX vagy CSV fájl tölthető fel.");
  const workbook = new ExcelJS.Workbook();
  await workbook.xlsx.load(Buffer.from(await file.arrayBuffer()));
  const sheet = workbook.getWorksheet("Rendszerleltár") || workbook.worksheets[0];
  if (!sheet) throw new Error("A munkafüzet nem tartalmaz feldolgozható lapot.");
  const rows = [];
  sheet.eachRow({ includeEmpty: true }, (sheetRow) => {
    rows.push(Array.from({ length: Math.max(sheetRow.cellCount, 11) }, (_, index) => sheetRow.getCell(index + 1).value));
  });
  return findDataRows(rows);
}

async function getContext(requestedOrganisationId) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) throw new Error("A művelethez bejelentkezés szükséges.");

  // Egy felhasználó több szervezetnek is tagja lehet, ezért az összes tagságot
  // lekérjük. Egyértelmű választás nélkül nem tippelünk.
  const { data: memberships, error } = await supabase
    .from("aic_organisation_members")
    .select("organisation_id, member_role")
    .eq("user_id", user.id)
    .in("member_role", ["owner", "admin", "compliance", "editor"])
    .order("organisation_id");

  if (error) throw new Error("A szervezeti tagság nem ellenőrizhető.");
  if (!memberships?.length) throw new Error("Nincs olyan szervezeted, amelybe rendszert rögzíthetnél.");

  if (requestedOrganisationId) {
    const match = memberships.find((item) => item.organisation_id === requestedOrganisationId);
    if (!match) throw new Error("A megadott szervezethez nincs jogosultságod.");
    return { supabase, organisationId: match.organisation_id };
  }

  if (memberships.length > 1) {
    throw new Error("Több szervezetnek is tagja vagy. Válaszd ki, melyikbe történjen az importálás.");
  }

  return { supabase, organisationId: memberships[0].organisation_id };
}

async function loadMasterData(supabase, organisationId) {
  const [typesResult, industriesResult, capabilitiesResult, dependenciesResult, systemsResult] = await Promise.all([
    supabase.from("aic_system_type_templates").select("type_code,name_hu").eq("active", true),
    supabase.from("aic_industries").select("code,name_hu").eq("active", true),
    supabase.from("aic_capabilities").select("code,name_hu,system_type_codes,industry_codes").eq("active", true),
    supabase.from("aic_capability_dependencies").select("capability_code,requires_capability_code,reason_hu"),
    supabase.from("aic_ai_systems").select("name").eq("organisation_id", organisationId).eq("inventory_status", "active"),
  ]);

  if ([typesResult, industriesResult, capabilitiesResult, dependenciesResult, systemsResult].some((result) => result.error)) {
    throw new Error("Az import ellenőrzéséhez szükséges törzsadatok nem tölthetők be.");
  }

  return {
    types: new Map(typesResult.data.map((item) => [item.type_code, item])),
    industries: new Map(industriesResult.data.map((item) => [item.code, item])),
    capabilities: new Map(capabilitiesResult.data.map((item) => [item.code, item])),
    dependencies: dependenciesResult.data,
    existingNames: new Set(systemsResult.data.map((item) => normalize(item.name))),
  };
}

// A validálás egyetlen helyen él, és az ellenőrzés és a mentés is ezt hívja.
// Így a mentés nem a böngészőtől kapott "rendben" jelzésben bízik.
function validateRows(sourceRows, master) {
  const fileNames = new Map();
  for (const row of sourceRows) {
    const key = normalize(row.name);
    if (key) fileNames.set(key, (fileNames.get(key) || 0) + 1);
  }

  return sourceRows.map((row) => {
    const errors = [];
    const nameKey = normalize(row.name);

    if (!row.name) errors.push("Hiányzik a rendszer neve.");
    if (!row.intended_purpose) errors.push("Hiányzik a rendszer rendeltetése.");
    if (!master.types.has(row.system_type_code)) errors.push(`Ismeretlen rendszertípus: ${row.system_type_code || "—"}.`);
    if (!row.industry_code) errors.push("Hiányzik az iparág kódja.");
    else if (!master.industries.has(row.industry_code)) errors.push(`Ismeretlen iparág: ${row.industry_code}.`);
    if (!row.organisation_role) errors.push("Hiányzik a szervezeti szerep.");
    else if (!VALID_ROLES.has(row.organisation_role)) errors.push(`Érvénytelen szervezeti szerep: ${row.organisation_role}.`);
    if (!row.lifecycle_stage) errors.push("Hiányzik az életciklus-állapot.");
    else if (!VALID_LIFECYCLES.has(row.lifecycle_stage)) errors.push(`Érvénytelen életciklus: ${row.lifecycle_stage}.`);
    if (nameKey && fileNames.get(nameKey) > 1) errors.push("A név többször szerepel a fájlban.");
    if (nameKey && master.existingNames.has(nameKey)) errors.push("Ilyen nevű rendszer már létezik.");

    if (row.eu_hasznalat === null) errors.push("Az „EU-ban használják” oszlop Igen vagy Nem lehet.");
    if (row.mi_egyertelmu === null) errors.push("A „MI-használat egyértelmű” oszlop Igen vagy Nem lehet.");
    if (row.nincs_tiltott_gyakorlat === null) errors.push("A „Nincs tiltott gyakorlat” oszlop Igen vagy Nem lehet.");
    if (row.szabalyozott_termek === null) errors.push("A „Szabályozott termékbe épül” oszlop Igen vagy Nem lehet.");

    for (const code of row.capability_codes) {
      const capability = master.capabilities.get(code);
      if (!capability) {
        errors.push(`Ismeretlen aktív funkció: ${code}.`);
        continue;
      }
      if (capability.system_type_codes?.length && !capability.system_type_codes.includes(row.system_type_code)) {
        errors.push(`${code} nem használható a kiválasztott rendszertípusnál.`);
      }
      if (capability.industry_codes?.length && !capability.industry_codes.includes(row.industry_code)) {
        errors.push(`${code} nem használható a kiválasztott iparágnál.`);
      }
    }

    for (const dependency of master.dependencies) {
      if (row.capability_codes.includes(dependency.capability_code) && !row.capability_codes.includes(dependency.requires_capability_code)) {
        errors.push(`${dependency.capability_code} mellől hiányzik: ${dependency.requires_capability_code}.`);
      }
    }

    return {
      ...row,
      system_type_name: master.types.get(row.system_type_code)?.name_hu || "—",
      valid: errors.length === 0,
      errors,
    };
  });
}

// A böngészőtől érkező sorokból csak a nyers adatmezőket vesszük át.
// A "valid" jelzést és a hibalistát szándékosan eldobjuk.
function sanitizeRow(row) {
  const capabilityCodes = Array.isArray(row?.capability_codes) ? row.capability_codes : [];
  return {
    rowNumber: Number(row?.rowNumber) || 0,
    name: String(row?.name ?? "").trim().replace(/\s+/g, " "),
    system_type_code: String(row?.system_type_code ?? "").trim().toUpperCase(),
    industry_code: String(row?.industry_code ?? "").trim().toLowerCase(),
    intended_purpose: String(row?.intended_purpose ?? "").trim(),
    capability_codes: [...new Set(capabilityCodes.map((code) => String(code).trim().toUpperCase()).filter(Boolean))].sort(),
    organisation_role: String(row?.organisation_role ?? "").trim().toLowerCase(),
    lifecycle_stage: String(row?.lifecycle_stage ?? "").trim().toLowerCase(),
    eu_hasznalat: typeof row?.eu_hasznalat === "boolean" ? row.eu_hasznalat : null,
    mi_egyertelmu: typeof row?.mi_egyertelmu === "boolean" ? row.mi_egyertelmu : null,
    nincs_tiltott_gyakorlat:
      typeof row?.nincs_tiltott_gyakorlat === "boolean" ? row.nincs_tiltott_gyakorlat : null,
    szabalyozott_termek:
      typeof row?.szabalyozott_termek === "boolean" ? row.szabalyozott_termek : null,
  };
}

export async function previewImport(formData) {
  try {
    const file = formData.get("file");
    if (!file || typeof file.arrayBuffer !== "function" || file.size === 0) {
      return { error: "Válassz ki egy XLSX vagy CSV fájlt." };
    }
    if (file.size > MAX_FILE_SIZE) return { error: "A fájl legfeljebb 2 MB méretű lehet." };

    const sourceRows = await readRows(file);
    if (!sourceRows.length) return { error: "A fájl nem tartalmaz kitöltött adatsort." };
    if (sourceRows.length > MAX_ROWS) return { error: `Egyszerre legfeljebb ${MAX_ROWS} rendszer ellenőrizhető.` };

    const { supabase, organisationId } = await getContext(formData.get("organisationId") || null);
    const master = await loadMasterData(supabase, organisationId);
    const rows = validateRows(sourceRows, master);

    return {
      rows,
      organisationId,
      validCount: rows.filter((row) => row.valid).length,
      errorCount: rows.filter((row) => !row.valid).length,
    };
  } catch (error) {
    return { error: error.message || "A fájl feldolgozása nem sikerült." };
  }
}

export async function importSystems(rows, confirmed, organisationId = null) {
  try {
    if (!confirmed) {
      return { error: "Az importálás előtt erősítsd meg, hogy az adatok a rendszerek tényleges működését írják le." };
    }
    if (!Array.isArray(rows) || rows.length === 0 || rows.length > MAX_ROWS) {
      return { error: "Nincs importálható adatsor." };
    }

    const { supabase, organisationId: resolvedOrganisationId } = await getContext(organisationId);
    const master = await loadMasterData(supabase, resolvedOrganisationId);

    // Teljes újraellenőrzés friss törzsadatokkal, a kliens állításaitól függetlenül.
    const sanitized = rows.map(sanitizeRow);
    const revalidated = validateRows(sanitized, master);
    const invalid = revalidated.filter((row) => !row.valid);

    if (invalid.length) {
      const details = invalid
        .slice(0, 5)
        .map((row) => `${row.rowNumber || "?"}. sor: ${row.errors.join(" ")}`)
        .join(" ");
      return {
        error: `Az importálás elmaradt, mert az ellenőrzés ${invalid.length} hibás sort talált. ${details}`,
        rows: revalidated,
      };
    }

    const payload = revalidated.map(({ valid, errors, rowNumber, system_type_name, ...row }) => row);
    const { data, error } = await supabase.rpc("aic_import_ai_systems", {
      p_organisation_id: resolvedOrganisationId,
      p_rows: payload,
      p_data_confirmed: true,
    });

    if (error) return { error: error.message || "Az importálás nem sikerült." };
    return { success: true, importedCount: data?.imported_count || payload.length };
  } catch (error) {
    return { error: error.message || "Az importálás nem sikerült." };
  }
}
