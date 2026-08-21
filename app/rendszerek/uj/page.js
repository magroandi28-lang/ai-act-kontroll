import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "../../../lib/supabase/server";
import NewSystemForm from "./NewSystemForm";
import "./felvitel.css";

export const dynamic = "force-dynamic";

export default async function NewSystemPage() {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/");

  // 1. Tagság lekérése
  let { data: membership } = await supabase
    .from("aic_organisation_members")
    .select("organisation_id, aic_organisations(name, industry)")
    .eq("user_id", user.id)
    .maybeSingle();

  // 2. Ha nincs közvetlen tagság, felveszünk egy alapértelmezett szervezetet
  if (!membership) {
    const { data: defaultOrg } = await supabase
      .from("aic_organisations")
      .select("id, name, industry")
      .limit(1)
      .maybeSingle();

    if (defaultOrg) {
      membership = {
        organisation_id: defaultOrg.id,
        aic_organisations: {
          name: defaultOrg.name,
          industry: defaultOrg.industry,
        },
      };
    }
  }

  // 3. Ha még így sincs szervezet, hibaoldal
  if (!membership) {
    return (
      <main className="felvitel-page">
        <section className="felvitel-hibalap">
          <Link className="felvitel-back" href="/vezerlopult">← Vissza az irányítópultra</Link>
          <h1>A szervezet nem érhető el</h1>
          <p>A fiókhoz nem tartozik szervezet.</p>
        </section>
      </main>
    );
  }

  const { data: industries } = await supabase
    .from("aic_industries")
    .select("code, name_hu")
    .eq("active", true)
    .order("sort_order");

  return (
    <main className="felvitel-page">
      <div className="felvitel-topbar">
        <Link className="felvitel-back" href="/vezerlopult">← Vissza az irányítópultra</Link>
        <span className="felvitel-szervezet">{membership.aic_organisations?.name}</span>
      </div>

      <NewSystemForm
        organisationId={membership.organisation_id}
        organisationIndustry={membership.aic_organisations?.industry || null}
        industries={industries || []}
      />
    </main>
  );
}
