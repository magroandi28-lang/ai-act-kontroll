import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../../lib/supabase/server";
import AssessmentForm from "./AssessmentForm";

export default async function AssessmentPage({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: system } = await supabase.from("aic_ai_systems")
    .select("id, name, system_type_id, organisation_role, lifecycle_stage, aic_system_type_templates(type_code, name_hu, default_facts)")
    .eq("id", params.id).maybeSingle();
  if (!system) notFound();

  const { data: saved } = await supabase.from("aic_system_facts")
    .select("facts").eq("system_id", system.id).maybeSingle();

  const { data: questions } = await supabase.from("aic_template_questions")
    .select("id, question_key, fact_key, question_text_hu, help_text_hu, answer_type, answer_options, required, question_order, show_when")
    .eq("template_id", system.system_type_id).order("question_order");

  const inferredFacts = {
    use_is_purely_personal_non_professional: false,
    persons_operate_or_use_ai_on_behalf: true,
    ...(system.organisation_role === "deployer" ? { uses_ai_system_under_own_authority: true } : {}),
    ...(system.aic_system_type_templates?.type_code === "CUSTOMER_CHATBOT" ? {
      synthetic_content_type: "text",
      article_50_2_exception_applies: false,
    } : {}),
  };

  return (
    <main className="assessment-page">
      <section className="assessment-shell">
        <Link className="back-link" href={`/rendszerek/${system.id}`}>← Vissza a rendszer adatlapjára</Link>
        <p className="system-form-eyebrow">{system.aic_system_type_templates?.name_hu}</p>
        <h1>Rövid szabályozási vizsgálat</h1>
        <p className="assessment-intro">Csak a kiválasztott rendszertípushoz szükséges rövid kérdések jelennek meg.</p>
        <AssessmentForm systemId={system.id} userId={user.id} questions={questions || []} defaultFacts={{ ...(system.aic_system_type_templates?.default_facts || {}), ...inferredFacts }} savedFacts={saved?.facts || {}} />
      </section>
    </main>
  );
}
