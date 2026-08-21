import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "../../lib/supabase/server";
import SystemFinder from '@/components/rendszerek/SystemFinder';

const PAGE_SIZE = 5;

export default async function SystemsPage({ searchParams }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const requestedPage = Number.parseInt(searchParams?.oldal || "1", 10);
  const currentPage = Number.isFinite(requestedPage) && requestedPage > 0 ? requestedPage : 1;
  const selectedSystemId = searchParams?.rendszer || "";

  const { data: membership } = await supabase
    .from("aic_organisation_members")
    .select("organisation_id, aic_organisations(name)")
    .eq("user_id", user.id)
    .maybeSingle();

  if (!membership) redirect("/vezerlopult");

  const { data: allSystems } = await supabase
    .from("aic_ai_systems")
    .select("id, name, intended_purpose, created_at, aic_system_type_templates(name_hu)")
    .eq("organisation_id", membership.organisation_id)
    .eq("inventory_status", "active")
    .order("created_at", { ascending: false });

  const from = (currentPage - 1) * PAGE_SIZE;
  const to = from + PAGE_SIZE - 1;
  let systemsQuery = supabase
    .from("aic_ai_systems")
    .select("id, name, intended_purpose, organisation_role, lifecycle_stage, assessment_status, created_at, aic_system_type_templates(name_hu)")
    .eq("organisation_id", membership.organisation_id)
    .eq("inventory_status", "active")
    .order("created_at", { ascending: false });

  const { data: systems } = selectedSystemId
    ? await systemsQuery.eq("id", selectedSystemId).limit(1)
    : await systemsQuery.range(from, to);

  if (selectedSystemId && !systems?.length) redirect("/rendszerek");

  const systemIds = (systems || []).map((system) => system.id);
  const { data: generatedPolicies } = systemIds.length
    ? await supabase.from("aic_generated_policies").select("ai_system_id").in("ai_system_id", systemIds)
    : { data: [] };
  const systemsWithPolicy = new Set((generatedPolicies || []).map((policy) => policy.ai_system_id));

  const total = (allSystems || []).length;
  const totalPages = Math.max(1, Math.ceil(total / PAGE_SIZE));
  if (currentPage > totalPages && total > 0) redirect(`/rendszerek?oldal=${totalPages}`);

  const finderSystems = (allSystems || []).map((system, index) => ({
    id: system.id,
    name: system.name,
    purpose: system.intended_purpose,
    type: system.aic_system_type_templates?.name_hu || "Egyéb MI-rendszer",
    page: Math.floor(index / PAGE_SIZE) + 1,
  }));

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
          <div className="systems-actions">
            <Link className="systems-import-button" href="/rendszerek/importalas">Több rendszer feltöltése</Link>
            <Link className="systems-add-button" href="/rendszerek/uj">+ Új MI-rendszer</Link>
          </div>
        </div>

        {searchParams?.letrehozva === "1" && (
          <p className="systems-success" role="status">Az MI-rendszer mentése sikerült.</p>
        )}
        {Number.parseInt(searchParams?.importalva || "0", 10) > 0 && (
          <p className="systems-success" role="status">{searchParams.importalva} MI-rendszer importálása sikerült.</p>
        )}
        {searchParams?.modositva === "1" && (
          <p className="systems-success" role="status">A rendszer adatainak módosítása sikerült.</p>
        )}
        {searchParams?.torolve === "1" && (
          <p className="systems-success" role="status">A rendszer törlése sikerült. Az előzményei archiválva megmaradtak.</p>
        )}

        <SystemFinder key={selectedSystemId || "all"} systems={finderSystems} selectedSystemId={selectedSystemId} />

        {systems?.length ? (
          <div className="systems-list">
            {systems.map((system) => {
              const hasPolicy = systemsWithPolicy.has(system.id);
              const policyHref = hasPolicy ? `/rendszerek/${system.id}/szabalyzat` : `/rendszerek/${system.id}`;
              return (
              <article className="system-row-wrap" key={system.id}>
              <div className="system-row" id={`rendszer-${system.id}`}>
                <div className="system-row-main">
                  <span>{system.aic_system_type_templates?.name_hu || "Egyéb MI-rendszer"}</span>
                  <h2>{system.name}</h2>
                  <p>{system.intended_purpose}</p>
                </div>
                <div className="system-row-buttons">
                  <Link className="system-row-edit" href={`/rendszerek/${system.id}/szerkesztes`}>Szerkesztés</Link>
                  <Link className="system-row-policy" href={policyHref}>
                    {hasPolicy ? "Szabályzat megnyitása" : "Szabályzat elkészítése"}
                  </Link>
                </div>
              </div>
              </article>
              );
            })}
          </div>
        ) : (
          <div className="systems-empty">
            <h2>Még nincs mentett MI-rendszer</h2>
            <p>Az első rendszer rögzítésével megkezdheted a szabályozási vizsgálatot.</p>
            <Link className="systems-add-button" href="/rendszerek/uj">Új MI-rendszer rögzítése</Link>
          </div>
        )}

        {!selectedSystemId && totalPages > 1 && (
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
