import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../../lib/supabase/server";
import EditSystemForm from "./EditSystemForm";

export default async function EditSystemPage({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: system } = await supabase
    .from("aic_ai_systems")
    .select("id,name,lifecycle_stage,inventory_status,aic_usage_profiles(name_hu)")
    .eq("id", params.id)
    .eq("inventory_status", "active")
    .maybeSingle();

  if (!system) notFound();

  return (
    <main className="system-form-page">
      <section className="system-form-shell edit-system-shell">
        <Link className="back-link" href={`/rendszerek?rendszer=${system.id}`}>← Vissza ehhez a rendszerhez</Link>
        <p className="system-form-eyebrow">RENDSZERADATOK JAVÍTÁSA</p>
        <h1>{system.name}</h1>
        <p className="system-form-intro">Itt javíthatod az elírt nevet és az életciklus-állapotot. A módosítás után a szabályzat a helyes rendszernevet használja.</p>
        <EditSystemForm system={system} />
      </section>
    </main>
  );
}
