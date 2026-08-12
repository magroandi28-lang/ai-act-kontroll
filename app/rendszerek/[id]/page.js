import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../lib/supabase/server";

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
  not_started: "Értékelés nincs elkezdve",
  in_progress: "Értékelés folyamatban",
  needs_review: "Pontosítás szükséges",
  completed: "Értékelés elkészült",
};

export default async function SystemDetailPage({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: system } = await supabase
    .from("aic_ai_systems")
    .select("id, name, description, intended_purpose, provider_name, organisation_role, deployment_context, lifecycle_stage, assessment_status, created_at, aic_system_type_templates(name_hu), aic_organisations(name)")
    .eq("id", params.id)
    .maybeSingle();

  if (!system) notFound();

  return (
    <main className="system-detail-page">
      <section className="system-detail-shell">
        <Link className="back-link" href="/rendszerek">← Vissza a mentett rendszerekhez</Link>

        <header className="system-detail-header">
          <div>
            <p className="system-form-eyebrow">{system.aic_organisations?.name}</p>
            <span className="system-detail-type">{system.aic_system_type_templates?.name_hu}</span>
            <h1>{system.name}</h1>
            <p>{system.intended_purpose}</p>
          </div>
          <span className={`assessment-badge assessment-badge-${system.assessment_status || "not_started"}`}>
            {assessmentLabels[system.assessment_status] || assessmentLabels.not_started}
          </span>
        </header>

        <div className="system-detail-grid">
          <section className="system-detail-card">
            <h2>Rendszeradatok</h2>
            <dl className="detail-list">
              <div><dt>Szerep</dt><dd>{roleLabels[system.organisation_role] || "Még nem ismert"}</dd></div>
              <div><dt>Életciklus</dt><dd>{lifecycleLabels[system.lifecycle_stage] || system.lifecycle_stage}</dd></div>
              <div><dt>Szolgáltató</dt><dd>{system.provider_name || "Nincs megadva"}</dd></div>
              <div><dt>Alkalmazási környezet</dt><dd>{system.deployment_context || "Nincs megadva"}</dd></div>
            </dl>
            {system.description && <p className="system-detail-description">{system.description}</p>}
          </section>

          <section className="assessment-start-card">
            <div className="assessment-orbit" aria-hidden="true"><span /></div>
            <p className="system-form-eyebrow">{["completed", "needs_review"].includes(system.assessment_status) ? "Elkészült" : "Következő lépés"}</p>
            <h2>Szabályozási vizsgálat</h2>
            <p>Az alkalmazás a rendszer tényei alapján, determinisztikus szabályokkal választja ki a vonatkozó AI Act-követelményeket.</p>
            {["completed", "needs_review"].includes(system.assessment_status) ? (
              <Link className="assessment-start-button" href={`/rendszerek/${system.id}/eredmeny`}>Eredmény megnyitása →</Link>
            ) : (
              <Link className="assessment-start-button" href={`/rendszerek/${system.id}/vizsgalat`}>Vizsgálat indítása →</Link>
            )}
          </section>
        </div>
      </section>
    </main>
  );
}
