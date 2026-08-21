import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../lib/supabase/server";

export default async function SystemRoute({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: system } = await supabase
    .from("aic_ai_systems")
    .select("id,name,intended_purpose,aic_system_type_templates(name_hu),aic_ai_system_capabilities(capability_code)")
    .eq("id", params.id)
    .eq("inventory_status", "active")
    .maybeSingle();
  if (!system) notFound();

  const { data: latestPolicy } = await supabase
    .from("aic_generated_policies")
    .select("id,version")
    .eq("ai_system_id", system.id)
    .order("version", { ascending: false })
    .limit(1)
    .maybeSingle();

  return (
    <main className="system-form-page">
      <section className="system-form-shell edit-system-shell">
        <Link className="back-link" href={`/rendszerek?rendszer=${system.id}`}>← Vissza ehhez a rendszerhez</Link>
        <p className="system-form-eyebrow">SZABÁLYZAT</p>
        <h1>{system.name}</h1>
        <p className="system-form-intro">{system.intended_purpose}</p>

        <section className="profile-confirmation">
            <p className="profile-label">{system.aic_system_type_templates?.name_hu}</p>
            <h2>{latestPolicy ? "Megnyitod a szabályzatot?" : "Elkészíted a szabályzatot?"}</h2>
            <p>{latestPolicy
              ? `A mentett szabályzat ${latestPolicy.version}. verziója elérhető. Megnyitáskor a rendszer ellenőrzi, változtak-e a forrásmodulok.`
              : "A művelet a dokumentált aktív funkciók és az ellenőrzött alkalmazási adatok alapján készíti el a szabályzatot."}</p>
            <Link className="profile-policy-button" href={latestPolicy ? `/rendszerek/${system.id}/szabalyzat` : `/rendszerek/${system.id}/szabalyzat?inditas=1`}>
              <span>{latestPolicy ? "Szabályzat megnyitása" : "Szabályzat elkészítése"}</span>
              <span className="profile-policy-arrow" aria-hidden="true">→</span>
            </Link>
        </section>
      </section>
    </main>
  );
}
