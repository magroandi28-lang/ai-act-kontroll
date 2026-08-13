import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "../../lib/supabase/server";

const PAGE_SIZE = 5;

const roleLabels = {
  provider: "Szolgáltató", deployer: "Alkalmazó", importer: "Importőr",
  distributor: "Forgalmazó", product_manufacturer: "Termékgyártó",
  authorised_representative: "Meghatalmazott képviselő", multiple: "Több szerep", unknown: "Még nem ismert",
};

const lifecycleLabels = {
  planned: "Tervezett", development: "Fejlesztés alatt", testing: "Tesztelés alatt",
  pilot: "Próbaüzem", production: "Éles üzemben", suspended: "Felfüggesztett", retired: "Kivezetett",
};

const assessmentLabels = {
  not_started: "Nincs elkezdve", in_progress: "Folyamatban",
  completed: "Befejezve", needs_review: "Felülvizsgálat szükséges",
};

export default async function SystemsPage({ searchParams }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const requestedPage = Number.parseInt(searchParams?.oldal || "1", 10);
  const currentPage = Number.isFinite(requestedPage) && requestedPage > 0 ? requestedPage : 1;

  const { data: membership } = await supabase
    .from("aic_organisation_members")
    .select("organisation_id, aic_organisations(name)")
    .eq("user_id", user.id)
    .maybeSingle();

  if (!membership) redirect("/vezerlopult");

  const from = (currentPage - 1) * PAGE_SIZE;
  const to = from + PAGE_SIZE - 1;
  const { data: systems, count } = await supabase
    .from("aic_ai_systems")
    .select("id, name, intended_purpose, organisation_role, lifecycle_stage, assessment_status, created_at, aic_system_type_templates(name_hu)", { count: "exact" })
    .eq("organisation_id", membership.organisation_id)
    .eq("inventory_status", "active")
    .order("created_at", { ascending: false })
    .range(from, to);

  const total = count || 0;
  const totalPages = Math.max(1, Math.ceil(total / PAGE_SIZE));
  if (currentPage > totalPages && total > 0) redirect(`/rendszerek?oldal=${totalPages}`);

  return (
    <main className="systems-page">
      <section className="systems-shell">
        <div className="systems-topbar">
          <div>
            <Link className="back-link" href="/vezerlopult">← Vissza az irányítópultra</Link>
            <p className="system-form-eyebrow">{membership.aic_organisations?.name}</p>
            <h1>Mentett MI-rendszerek</h1>
            <p>{total} nyilvántartott rendszer</p>
          </div>
        </div>

        {searchParams?.letrehozva === "1" && (
          <p className="systems-success" role="status">Az MI-rendszer mentése sikerült.</p>
        )}

        {systems?.length ? (
          <div className="systems-list">
            {systems.map((system) => (
              <Link className="system-row" href={`/rendszerek/${system.id}/szabalyzat`} key={system.id}>
                <div className="system-row-main">
                  <span>{system.aic_system_type_templates?.name_hu || "Egyéb MI-rendszer"}</span>
                  <h2>{system.name}</h2>
                  <p>{system.intended_purpose}</p>
                </div>
                <dl className="system-row-meta">
                  <div><dt>Szerep</dt><dd>{roleLabels[system.organisation_role] || "Még nem ismert"}</dd></div>
                  <div><dt>Állapot</dt><dd>{lifecycleLabels[system.lifecycle_stage] || system.lifecycle_stage}</dd></div>
                  <div><dt>Értékelés</dt><dd>{assessmentLabels[system.assessment_status] || system.assessment_status}</dd></div>
                </dl>
                <span className="system-row-arrow" aria-hidden="true">→</span>
              </Link>
            ))}
          </div>
        ) : (
          <div className="systems-empty">
            <h2>Még nincs mentett MI-rendszer</h2>
            <p>Az első rendszer rögzítésével megkezdheted a szabályozási vizsgálatot.</p>
            <Link className="systems-add-button" href="/rendszerek/uj">Új MI-rendszer rögzítése</Link>
          </div>
        )}

        {totalPages > 1 && (
          <nav className="pagination" aria-label="Lapozás">
            {currentPage > 1 ? <Link href={`/rendszerek?oldal=${currentPage - 1}`}>← Előző</Link> : <span />}
            <span>{currentPage} / {totalPages}. oldal</span>
            {currentPage < totalPages ? <Link href={`/rendszerek?oldal=${currentPage + 1}`}>Következő →</Link> : <span />}
          </nav>
        )}
      </section>
    </main>
  );
}
