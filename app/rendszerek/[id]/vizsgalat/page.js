import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../../lib/supabase/server";
import AssessmentForm from "./AssessmentForm";

export default async function AssessmentPage({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: system } = await supabase.from("aic_ai_systems")
    .select("id, name, aic_system_type_templates(type_code, name_hu, default_facts)")
    .eq("id", params.id).maybeSingle();
  if (!system) notFound();

  const { data: saved } = await supabase.from("aic_system_facts")
    .select("facts").eq("system_id", system.id).maybeSingle();

  return (
    <main className="assessment-page">
      <section className="assessment-shell">
        <Link className="back-link" href={`/rendszerek/${system.id}`}>← Vissza a rendszer adatlapjára</Link>
        <p className="system-form-eyebrow">{system.aic_system_type_templates?.name_hu}</p>
        <h1>Rövid szabályozási vizsgálat</h1>
        <p className="assessment-intro">Öt rövid kérdés. További kérdés csak akkor jelenik meg, ha a chatbot döntést is befolyásol.</p>
        <AssessmentForm systemId={system.id} userId={user.id} defaultFacts={system.aic_system_type_templates?.default_facts || {}} savedFacts={saved?.facts || {}} />
      </section>
    </main>
  );
}
