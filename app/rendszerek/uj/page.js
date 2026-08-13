import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "../../../lib/supabase/server";
import NewSystemForm from "./NewSystemForm";

export default async function NewSystemPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: membership } = await supabase
    .from("aic_organisation_members")
    .select("organisation_id, aic_organisations(name)")
    .eq("user_id", user.id)
    .maybeSingle();

  if (!membership) {
    return (
      <main className="simple-page">
        <section className="auth-panel">
          <Link className="back-link" href="/vezerlopult">← Vissza az irányítópultra</Link>
          <h1>A szervezet nem érhető el</h1>
          <p>A rendszer nem talált a fiókhoz kapcsolódó szervezetet.</p>
        </section>
      </main>
    );
  }

  const { data: industries } = await supabase
    .from("aic_industries")
    .select("code, name_hu, description_hu")
    .eq("active", true)
    .order("sort_order");

  const { data: profiles } = await supabase
    .from("aic_usage_profiles")
    .select("code, industry_code, system_type_code, name_hu, description_hu, required_assertions")
    .eq("active", true)
    .order("sort_order");

  return (
    <main className="system-form-page">
      <section className="system-form-shell">
        <Link className="back-link" href="/vezerlopult">← Vissza az irányítópultra</Link>
        <p className="system-form-eyebrow">{membership.aic_organisations?.name}</p>
        <h1>Új MI-rendszer</h1>
        <p className="system-form-intro">Három rövid adat alapján rögzítheted a rendszert. A részletes besorolást és leírást a kiválasztott profil automatikusan elkészíti.</p>
        <NewSystemForm
          organisationId={membership.organisation_id}
          industries={industries || []}
          profiles={profiles || []}
        />
      </section>
    </main>
  );
}
