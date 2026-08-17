"use server";

import { revalidatePath } from "next/cache";
import { createClient } from "../../../lib/supabase/server";

async function hitelesitett() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) throw new Error("A művelethez bejelentkezés szükséges.");
  return supabase;
}

// A nyers adatbázis-üzenetek angolul és technikai nyelven érkeznek. A saját
// hibáinkat magyarul fogalmaztuk meg, azokat átengedjük; a többit lefordítjuk.
function olvashato(uzenet) {
  const szoveg = String(uzenet || "");
  if (/row-level security/i.test(szoveg)) {
    return "Ehhez a művelethez nincs jogosultságod.";
  }
  if (/violates|constraint|duplicate key/i.test(szoveg)) {
    return "A művelet nem hajtható végre a jelenlegi állapotban.";
  }
  return szoveg || "A művelet nem sikerült.";
}

async function futtat(policyId, rpc, params) {
  let supabase;
  try {
    supabase = await hitelesitett();
  } catch (error) {
    return { error: error.message };
  }
  const { error } = await supabase.rpc(rpc, params);
  if (error) return { error: olvashato(error.message) };
  revalidatePath(`/szabalyzatok/${policyId}`);
  revalidatePath("/szabalyzatok");
  return { success: true };
}

// Egy fejezet jóváhagyása a mögötte álló szabályt hagyja jóvá, minden
// dokumentumban egyszerre. Ezért fogy a hátralévő munka dokumentumról
// dokumentumra.
export async function approveRule(policyId, ruleCode, note) {
  if (!ruleCode) return { error: "Ehhez a fejezethez nem tartozik szabály." };
  const result = await futtat(policyId, "aic_approve_compliance_rule", {
    p_rule_code: ruleCode,
    p_note: note || null,
  });
  return result.success ? { ...result, message: "A szabály jóváhagyva." } : result;
}

export async function editSection(policyId, sectionNumber, title, content) {
  if (!String(content || "").trim()) {
    return { error: "A fejezet szövege nem lehet üres." };
  }
  const result = await futtat(policyId, "aic_edit_policy_section", {
    p_policy_id: policyId,
    p_section_number: sectionNumber,
    p_title: title,
    p_content: content,
  });
  return result.success ? { ...result, message: "A fejezet módosítva." } : result;
}

export async function resetSection(policyId, sectionNumber) {
  const result = await futtat(policyId, "aic_reset_policy_section", {
    p_policy_id: policyId,
    p_section_number: sectionNumber,
  });
  return result.success ? { ...result, message: "A fejezet visszaállítva." } : result;
}

export async function insertModule(policyId, moduleCode, note) {
  if (!moduleCode) return { error: "Válassz fejezetet a katalógusból." };
  const result = await futtat(policyId, "aic_insert_catalogue_module", {
    p_policy_id: policyId,
    p_module_code: moduleCode,
    p_note: note || null,
  });
  return result.success ? { ...result, message: "A fejezet beemelve." } : result;
}

export async function approveDocument(policyId, note) {
  const result = await futtat(policyId, "aic_approve_policy", {
    p_policy_id: policyId,
    p_note: note || null,
  });
  return result.success ? { ...result, message: "A dokumentum jóváhagyva és lezárva." } : result;
}

// Nem elutasítás: a rendszerről rögzített adat hibás, ezt csak az tudja
// javítani, aki a rendszert ismeri.
export async function sendBack(policyId, note) {
  if (!String(note || "").trim()) {
    return { error: "Írd le, melyik adat hibás a rendszerről." };
  }
  const result = await futtat(policyId, "aic_reject_policy", {
    p_policy_id: policyId,
    p_note: note.trim(),
    p_reason_type: "system_data",
  });
  return result.success ? { ...result, message: "Visszaküldve a rögzítőnek." } : result;
}
