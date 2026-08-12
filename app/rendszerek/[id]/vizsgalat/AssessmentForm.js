"use client";
import { useState } from "react";
import { createClient } from "../../../../lib/supabase/client";

const questions = [
  ["ai_interaction_obvious", "Egyértelműen jelzi a chatbot, hogy a felhasználó MI-rendszerrel kommunikál?"],
  ["materially_influences_decision", "Hoz vagy érdemben befolyásol a chatbot az ügyfélre vonatkozó döntést?"],
  ["annex_iii_biometrics_use_case", "Használ a chatbot biometrikus azonosítást vagy biometrikus elemzést?"],
  ["infers_natural_person_emotions", "Próbál a chatbot érzelmeket felismerni vagy kikövetkeztetni?"],
  ["generates_synthetic_content", "Generál a chatbot új szöveget, hangot, képet vagy más tartalmat?"],
];

export default function AssessmentForm({ systemId, userId, defaultFacts, savedFacts }) {
  const [answers, setAnswers] = useState(savedFacts);
  const [message, setMessage] = useState("");
  const [saving, setSaving] = useState(false);
  const choose = (key, value) => { setAnswers((current) => ({ ...current, [key]: value })); setMessage(""); };
  const visible = [...questions];
  if (answers.materially_influences_decision === true) visible.splice(2, 0, ["annex_iii_ai_assisted_significant_individual_decision", "Lehet a döntésnek jogi vagy hasonlóan jelentős hatása az ügyfélre?"]);
  const complete = visible.every(([key]) => typeof answers[key] === "boolean");

  async function saveAssessment() {
    if (!complete) { setMessage("Válaszolj minden látható kérdésre."); return; }
    setSaving(true); setMessage("");
    const facts = { ...defaultFacts, ...answers, law_enforcement_exception_applies: false };
    const supabase = createClient();
    const { error } = await supabase.from("aic_system_facts").upsert({ system_id: systemId, facts, completion_status: "complete", updated_by: userId, updated_at: new Date().toISOString() }, { onConflict: "system_id" });
    if (!error) await supabase.from("aic_ai_systems").update({ assessment_status: "in_progress", updated_by: userId }).eq("id", systemId);
    setSaving(false);
    setMessage(error ? "A válaszok mentése nem sikerült." : "A válaszokat elmentettük. Következik a szabályok kiértékelése.");
  }

  return <div className="assessment-form">
    {visible.map(([key, text], index) => <section className="assessment-question" key={key}>
      <span>{String(index + 1).padStart(2, "0")}</span><h2>{text}</h2>
      <div className="binary-choice"><button className={answers[key] === true ? "selected" : ""} type="button" onClick={() => choose(key, true)}>Igen</button><button className={answers[key] === false ? "selected" : ""} type="button" onClick={() => choose(key, false)}>Nem</button></div>
    </section>)}
    {message && <p className={message.startsWith("A válaszokat") ? "assessment-message success" : "assessment-message"} role="status">{message}</p>}
    <button className="assessment-save-button" type="button" onClick={saveAssessment} disabled={saving}>{saving ? "Mentés…" : "Válaszok mentése"}</button>
  </div>;
}
