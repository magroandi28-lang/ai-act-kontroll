"use server";

import { createClient } from "../../../../lib/supabase/server";
import { evaluateRule } from "../../../../lib/rule-engine";

export async function evaluateSystem(systemId) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return { error: "Nincs bejelentkezve." };

  const { data: system } = await supabase
    .from("aic_ai_systems")
    .select("id")
    .eq("id", systemId)
    .maybeSingle();
  if (!system) return { error: "A rendszer nem található." };

  const { data: factRow } = await supabase
    .from("aic_system_facts")
    .select("facts, completion_status")
    .eq("system_id", system.id)
    .maybeSingle();
  if (!factRow || factRow.completion_status !== "complete") {
    return { error: "A rendszer alkalmazási adatainak ellenőrzése még nincs befejezve." };
  }

  const { data: rules, error: rulesError } = await supabase
    .from("aic_compliance_rules")
    .select("id, condition_groups_operator, aic_rule_condition_groups(id, group_operator, aic_rule_conditions(fact_key, comparison_operator, expected_value))")
    .in("lifecycle_status", ["approved", "under_review"]);
  if (rulesError) return { error: "A szabályok nem tölthetők be." };

  const results = rules.map((rule) => evaluateRule(rule, factRow.facts));
  const matched = results.filter((item) => item.evaluation_status === "matched").length;
  const insufficient = results.filter((item) => item.evaluation_status === "insufficient_data").length;
  const status = insufficient ? "needs_review" : "completed";

  const { data: assessment, error: assessmentError } = await supabase
    .from("aic_assessments")
    .insert({
      system_id: system.id,
      status,
      facts_snapshot: factRow.facts,
      rules_evaluated: results.length,
      matched_count: matched,
      insufficient_count: insufficient,
      created_by: user.id,
    })
    .select("id")
    .single();
  if (assessmentError) return { error: "Az értékelés nem menthető." };

  const { error: resultError } = await supabase
    .from("aic_assessment_results")
    .insert(results.map((result) => ({ assessment_id: assessment.id, ...result })));
  if (resultError) return { error: "Az eredmények nem menthetők." };

  await supabase
    .from("aic_ai_systems")
    .update({ assessment_status: status, updated_by: user.id })
    .eq("id", system.id);

  return { assessmentId: assessment.id };
}
