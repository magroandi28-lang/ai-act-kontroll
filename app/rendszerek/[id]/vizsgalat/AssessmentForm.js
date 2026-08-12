"use client";
import { useState } from "react";
import { createClient } from "../../../../lib/supabase/client";

export default function AssessmentForm({ systemId, userId, questions, defaultFacts, savedFacts }) {
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
    const facts = { ...defaultFacts, ...visibleAnswers, law_enforcement_exception_applies: false };
    const supabase = createClient();
    const { error } = await supabase.from("aic_system_facts").upsert({ system_id: systemId, facts, completion_status: "complete", updated_by: userId, updated_at: new Date().toISOString() }, { onConflict: "system_id" });
    if (!error) await supabase.from("aic_ai_systems").update({ assessment_status: "in_progress", updated_by: userId }).eq("id", systemId);
    setSaving(false);
    setMessage(error ? "A válaszok mentése nem sikerült." : "A válaszokat elmentettük. Következik a szabályok kiértékelése.");
  }

  return <div className="assessment-form">
    {visible.map((question, index) => <section className="assessment-question" key={question.id}>
      <span>{String(index + 1).padStart(2, "0")}</span><div><h2>{question.question_text_hu}</h2>{question.help_text_hu && <p>{question.help_text_hu}</p>}</div>
      <div className="binary-choice"><button className={answers[question.fact_key] === true ? "selected" : ""} type="button" onClick={() => choose(question.fact_key, true)}>Igen</button><button className={answers[question.fact_key] === false ? "selected" : ""} type="button" onClick={() => choose(question.fact_key, false)}>Nem</button></div>
    </section>)}
    {message && <p className={message.startsWith("A válaszokat") ? "assessment-message success" : "assessment-message"} role="status">{message}</p>}
    <button className="assessment-save-button" type="button" onClick={saveAssessment} disabled={saving}>{saving ? "Mentés…" : "Válaszok mentése"}</button>
  </div>;
}
