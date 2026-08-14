import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../lib/supabase/server";

const specialCapabilities = new Set([
  "BILLING_INFORMATION", "METER_READING_INTAKE", "COMPLAINT_INTAKE",
  "DEBT_DISCONNECTION_SUPPORT", "VULNERABLE_CUSTOMER_SUPPORT",
]);

export default async function SystemRoute({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: system } = await supabase
    .from("aic_ai_systems")
    .select("id,name,intended_purpose,usage_profile_code,aic_usage_profiles(name_hu),aic_ai_system_capabilities(capability_code)")
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

  const configuredSpecialCount = (system.aic_ai_system_capabilities || [])
    .filter((item) => specialCapabilities.has(item.capability_code)).length;
  const needsFunctionSetup = system.usage_profile_code === "ENERGY_CHAT_COMBINED" && configuredSpecialCount < 2;

  return (
    <main className="system-form-page">
      <section className="system-form-shell edit-system-shell">
        <Link className="back-link" href={`/rendszerek?rendszer=${system.id}`}>← Vissza ehhez a rendszerhez</Link>
        <p className="system-form-eyebrow">SZABÁLYZAT</p>
        <h1>{system.name}</h1>
        <p className="system-form-intro">{system.intended_purpose}</p>

        {needsFunctionSetup ? (
          <section className="profile-confirmation">
            <h2>A szabályzat még nem készíthető el</h2>
            <p>A kombinált profilhoz előbb legalább két tényleges funkciót kell megadni.</p>
            <Link className="primary-button" href={`/rendszerek/${system.id}/szerkesztes`}>Funkciók megadása</Link>
          </section>
        ) : (
          <section className="profile-confirmation">
            <p className="profile-label">{system.aic_usage_profiles?.name_hu || "Nincs érvényes használati profil"}</p>
            <h2>{latestPolicy ? "Megnyitod a szabályzatot?" : "Elkészíted a szabályzatot?"}</h2>
            <p>{latestPolicy
              ? `A mentett szabályzat ${latestPolicy.version}. verziója elérhető. Megnyitáskor a rendszer ellenőrzi, változtak-e a forrásmodulok.`
              : "A művelet a jóváhagyott profil és a dokumentált funkciók alapján készíti el a szabályzatot."}</p>
            <Link className="primary-button" href={latestPolicy ? `/rendszerek/${system.id}/szabalyzat` : `/rendszerek/${system.id}/szabalyzat?inditas=1`}>
              {latestPolicy ? "Szabályzat megnyitása" : "Szabályzat elkészítése"}
            </Link>
          </section>
        )}
      </section>
    </main>
  );
}
