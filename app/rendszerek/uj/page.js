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
    .select("id, type_code, name_hu")
    .eq("active", true)
    .order("sort_order");

  return (
    <main className="system-form-page">
      <section className="system-form-shell">
        <Link className="back-link" href="/vezerlopult">← Vissza az irányítópultra</Link>
        <p className="system-form-eyebrow">{membership.aic_organisations?.name}</p>
        <h1>Új MI-rendszer</h1>
        <p className="system-form-intro">Először rögzítsd a rendszer alapadatait. A szabályozási kérdések a mentés után következnek.</p>
        <NewSystemForm organisationId={membership.organisation_id} userId={user.id} templates={templates || []} />
      </section>
    </main>
  );
}
