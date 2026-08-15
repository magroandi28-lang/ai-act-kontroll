import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../../lib/supabase/server";
import AssessmentForm from "./AssessmentForm";

export default async function AssessmentPage({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: system } = await supabase
    .from("aic_ai_systems")
    .select("id,name,intended_purpose,system_type_id,aic_system_type_templates(name_hu,description_hu,default_facts),aic_system_facts(facts,completion_status)")
    .eq("id", params.id)
    .eq("inventory_status", "active")
    .maybeSingle();
  if (!system) notFound();

  const { data: questions } = await supabase
    .from("aic_template_questions")
    .select("id,question_key,fact_key,question_text_hu,help_text_hu,answer_type,required,question_order,show_when")
    .eq("template_id", system.system_type_id)
    .order("question_order");

  return (
    <main className="system-form-page">
      <section className="system-form-shell assessment-shell">
        <Link className="back-link" href={`/rendszerek?rendszer=${system.id}`}>← Vissza ehhez a rendszerhez</Link>
        <p className="system-form-eyebrow">TÉNYALAPÚ BESOROLÁS</p>
        <h1>{system.name}</h1>
        <p className="system-form-intro">
          {system.aic_system_type_templates?.name_hu}. A válaszokból a determinisztikus szabálymotor választja ki az alkalmazandó követelményeket; használati profil nem ír felül semmit.
        </p>
        <AssessmentForm
          systemId={system.id}
          userId={user.id}
          questions={questions || []}
          defaultFacts={system.aic_system_type_templates?.default_facts || {}}
          savedFacts={system.aic_system_facts?.facts || {}}
        />
      </section>
    </main>
  );
}
