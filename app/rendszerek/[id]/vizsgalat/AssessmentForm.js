"use client";
import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "../../../../lib/supabase/client";
import { evaluateRule } from "../../../../lib/rule-engine";

export default function AssessmentForm({ systemId, userId, questions, defaultFacts, savedFacts }) {
  const router = useRouter();
  const [answers, setAnswers] = useState(savedFacts);
  const [message, setMessage] = useState("");
  const [saving, setSaving] = useState(false);
  const choose = (key, value) => { setAnswers((current) => ({ ...current, [key]: value })); setMessage(""); };
  const visible = questions.filter((question) => !question.show_when || answers[question.show_when.fact_key] === question.show_when.equals);
  const complete = visible.filter((question) => question.required).every((question) => typeof answers[question.fact_key] === "boolean");

  async function saveAssessment() {
    if (!complete) { setMessage("Válaszolj minden látható kérdésre."); return; }
    setSaving(true); setMessage("");
    const visibleAnswers = Object.fromEntries(visible.map((question) => [question.fact_key, answers[question.fact_key]]));
    const baseFacts = {
      ...defaultFacts,
      ...savedFacts,
      ...visibleAnswers,
      law_enforcement_exception_applies: false,
      persons_operate_or_use_ai_on_behalf: true,
      ai_compliance_database_in_use: true,
      selection_basis: "active_capabilities_and_system_facts",
    };
    const annexIIIListed = [
      "annex_iii_biometrics_use_case",
      "annex_iii_critical_infrastructure",
      "annex_iii_education_use_case",
      "annex_iii_employment_use_case",
      "annex_iii_essential_services_use_case",
      "annex_iii_law_enforcement_use_case",
      "annex_iii_migration_border_use_case",
      "annex_iii_justice_democracy_use_case",
    ].some((key) => baseFacts[key] === true);
    const facts = {
      ...baseFacts,
      direct_two_way_interaction: baseFacts.interaction_with_natural_person === true,
      natural_person_exposed: baseFacts.interaction_with_natural_person === true,
      annex_iii_listed: baseFacts.annex_iii_listed === true || annexIIIListed,
      system_is_high_risk:
        baseFacts.system_is_high_risk === true ||
        (annexIIIListed && baseFacts.performs_limited_article_6_3_task !== true) ||
        (baseFacts.annex_i_product_or_safety_component === true && baseFacts.third_party_conformity_assessment_required === true),
      article_50_notice_required:
        (baseFacts.interaction_with_natural_person === true && baseFacts.ai_interaction_obvious === false) ||
        baseFacts.generates_synthetic_content === true,
      facts_validated: true,
      profile_revalidation_required: false,
    };
    const supabase = createClient();
    const { error } = await supabase.from("aic_system_facts").upsert({ system_id: systemId, facts, completion_status: "complete", updated_by: userId, updated_at: new Date().toISOString() }, { onConflict: "system_id" });
    if (error) {
      setSaving(false);
      setMessage("A válaszok mentése nem sikerült.");
      return;
    }
    await supabase.from("aic_ai_systems").update({ assessment_status: "in_progress", updated_by: userId }).eq("id", systemId);
    setMessage("A válaszokat elmentettük. A szabályok kiértékelése folyamatban…");
    const { data: rules, error: rulesError } = await supabase
      .from("aic_compliance_rules")
      .select("id, condition_groups_operator, aic_rule_condition_groups(id, group_operator, aic_rule_conditions(fact_key, comparison_operator, expected_value))")
      .in("lifecycle_status", ["approved", "under_review"]);
    if (rulesError) {
      setSaving(false);
      setMessage("A szabályok nem tölthetők be.");
      return;
    }

    const results = rules.map((rule) => evaluateRule(rule, facts));
    const matched = results.filter((item) => item.evaluation_status === "matched").length;
    const insufficient = results.filter((item) => item.evaluation_status === "insufficient_data").length;
    const status = insufficient ? "needs_review" : "completed";
    const { data: assessment, error: assessmentError } = await supabase
      .from("aic_assessments")
      .insert({ system_id: systemId, status, facts_snapshot: facts, rules_evaluated: results.length, matched_count: matched, insufficient_count: insufficient, created_by: userId })
      .select("id")
      .single();
    if (assessmentError) {
      setSaving(false);
      setMessage("Az értékelés nem menthető.");
      return;
    }

    const { error: resultError } = await supabase
      .from("aic_assessment_results")
      .insert(results.map((result) => ({ assessment_id: assessment.id, ...result })));
    if (resultError) {
      setSaving(false);
      setMessage("Az eredmények nem menthetők.");
      return;
    }

    await supabase.from("aic_ai_systems").update({ assessment_status: status, updated_by: userId }).eq("id", systemId);
    router.push(`/rendszerek/${systemId}/eredmeny`);
    router.refresh();
  }

  return <div className="assessment-form">
    {visible.map((question, index) => <section className="assessment-question" key={question.id}>
      <span>{String(index + 1).padStart(2, "0")}</span><div><h2>{question.question_text_hu}</h2>{question.help_text_hu && <p>{question.help_text_hu}</p>}</div>
      <div className="binary-choice"><button className={answers[question.fact_key] === true ? "selected" : ""} type="button" onClick={() => choose(question.fact_key, true)}>Igen</button><button className={answers[question.fact_key] === false ? "selected" : ""} type="button" onClick={() => choose(question.fact_key, false)}>Nem</button></div>
    </section>)}
    {message && <p className={message.startsWith("A válaszokat") ? "assessment-message success" : "assessment-message"} role="status">{message}</p>}
    <button className="assessment-save-button" type="button" onClick={saveAssessment} disabled={saving}>{saving ? "Kiértékelés…" : "Mentés és kiértékelés"}</button>
  </div>;
}
