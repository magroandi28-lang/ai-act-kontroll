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

  const { data: templates } = await supabase
    .from("aic_system_type_templates")
    .select("id, type_code, name_hu, description_hu")
    .eq("active", true)
    .order("sort_order");

  const { data: industries } = await supabase
    .from("aic_industries")
    .select("code, name_hu, description_hu")
    .eq("active", true)
    .order("sort_order");

  const { data: capabilities } = await supabase
    .from("aic_capabilities")
    .select("code, name_hu, description_hu, selection_hint_hu, system_type_codes, industry_codes")
    .eq("active", true)
    .order("sort_order");

  return (
    <main className="system-form-page">
      <section className="system-form-shell">
        <Link className="back-link" href="/vezerlopult">← Vissza az irányítópultra</Link>
        <p className="system-form-eyebrow">{membership.aic_organisations?.name}</p>
        <h1>Új MI-rendszer</h1>
        <p className="system-form-intro">Válaszd ki az iparágat, a rendszer típusát és a dokumentált képességeit. Ezek alapján készül majd a követelménydokumentum.</p>
        <NewSystemForm
          organisationId={membership.organisation_id}
          templates={templates || []}
          industries={industries || []}
          capabilities={capabilities || []}
        />
      </section>
    </main>
  );
}
