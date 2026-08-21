import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "../../../lib/supabase/server";
import ImportForm from "@/components/rendszerek/ImportForm";

export default async function ImportPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: membership } = await supabase
    .from("aic_organisation_members")
    .select("organisation_id, aic_organisations(name)")
    .eq("user_id", user.id)
    .maybeSingle();
  if (!membership) redirect("/vezerlopult");

  return (
    <main className="system-form-page import-page">
      <section className="import-shell">
        <Link className="back-link" href="/rendszerek">← Vissza a mentett rendszerekhez</Link>
        <p className="system-form-eyebrow">{membership.aic_organisations?.name}</p>
        <h1>Több MI-rendszer feltöltése</h1>
        <p className="system-form-intro">Az XLSX-sablonnal bármilyen MI-rendszert rögzíthetsz. Az alkalmazás mentés előtt ellenőrzi a rendszertípust, az aktív funkciókat és azok függőségeit.</p>
        <ImportForm />
      </section>
    </main>
  );
}
