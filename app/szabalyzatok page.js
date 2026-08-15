import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "../../lib/supabase/server";

const statusLabels = {
  draft: "Piszkozat",
  in_review: "Felülvizsgálat alatt",
  approved: "Jóváhagyva",
  rejected: "Elutasítva",
  published: "Közzétéve",
  archived: "Archivált",
};

// A szűrők sorrendje a jóváhagyó munkamenetét követi: elsőként az látszik,
// amiben döntenie kell.
const filters = [
  { key: "ram-var", label: "Rám vár", statuses: ["in_review"] },
  { key: "piszkozat", label: "Piszkozat", statuses: ["draft", "rejected"] },
  { key: "jovahagyott", label: "Jóváhagyott", statuses: ["approved", "published"] },
  { key: "mind", label: "Mind", statuses: null },
];

function formatDate(value) {
  if (!value) return null;
  return new Intl.DateTimeFormat("hu-HU", { dateStyle: "long" }).format(new Date(value));
}

export default async function PolicyQueuePage({ searchParams }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const activeKey = filters.some((filter) => filter.key === searchParams?.allapot)
    ? searchParams.allapot
    : "ram-var";
  const activeFilter = filters.find((filter) => filter.key === activeKey);

  const { data: policies } = await supabase
    .from("aic_generated_policies")
    .select("id,version,status,updated_at,submitted_at,reviewed_at,review_note,ai_system_id,aic_ai_systems(name,inventory_status)")
    .order("updated_at", { ascending: false });

  // Rendszerenként csak a legfrissebb verzió tartozik a sorra.
  const latestBySystem = new Map();
  for (const policy of policies || []) {
    if (policy.aic_ai_systems?.inventory_status !== "active") continue;
    const current = latestBySystem.get(policy.ai_system_id);
    if (!current || policy.version > current.version) latestBySystem.set(policy.ai_system_id, policy);
  }
  const allPolicies = [...latestBySystem.values()];

  const counts = Object.fromEntries(
    filters.map((filter) => [
      filter.key,
      filter.statuses
        ? allPolicies.filter((policy) => filter.statuses.includes(policy.status)).length
        : allPolicies.length,
    ])
  );

  const visible = (activeFilter.statuses
    ? allPolicies.filter((policy) => activeFilter.statuses.includes(policy.status))
    : allPolicies
  ).sort((a, b) => new Date(b.updated_at) - new Date(a.updated_at));

  return (
    <main className="queue-page">
      <section className="queue-shell">
        <Link className="back-link" href="/vezerlopult">← Vissza az irányítópultra</Link>
        <p className="system-form-eyebrow">SZABÁLYZATOK</p>
        <h1>Jóváhagyásra vár</h1>
        <p className="queue-intro">
          {counts["ram-var"] > 0
            ? `${counts["ram-var"]} szabályzat vár döntésre.`
            : "Jelenleg egyetlen szabályzat sem vár döntésre."}
        </p>

        <nav className="queue-filters" aria-label="Szűrés állapot szerint">
          {filters.map((filter) => (
            <Link
              key={filter.key}
              className={`queue-filter ${filter.key === activeKey ? "is-active" : ""}`}
              href={`/szabalyzatok?allapot=${filter.key}`}
              aria-current={filter.key === activeKey ? "page" : undefined}
            >
              {filter.label} · {counts[filter.key]}
            </Link>
          ))}
        </nav>

        {visible.length === 0 ? (
          <p className="queue-empty">Ebben a nézetben nincs szabályzat.</p>
        ) : (
          <div className="queue-list">
            {visible.map((policy) => (
              <article className="queue-card" key={policy.id}>
                <div className="queue-card-main">
                  <div className="queue-card-title">
                    <h2>{policy.aic_ai_systems?.name || "Névtelen rendszer"}</h2>
                    <span className={`queue-badge queue-badge-${policy.status}`}>
                      {statusLabels[policy.status] || policy.status}
                    </span>
                  </div>
                  <p className="queue-card-meta">
                    {policy.version}. verzió
                    {policy.status === "in_review" && policy.submitted_at
                      ? ` · beküldve ${formatDate(policy.submitted_at)}`
                      : ""}
                    {policy.status === "approved" && policy.reviewed_at
                      ? ` · jóváhagyva ${formatDate(policy.reviewed_at)}`
                      : ""}
                  </p>
                  {policy.status === "rejected" && policy.review_note && (
                    <p className="queue-card-note">{policy.review_note}</p>
                  )}
                </div>
                <Link
                  className={policy.status === "in_review" ? "primary-button" : "secondary-button"}
                  href={`/rendszerek/${policy.ai_system_id}/szabalyzat`}
                >
                  Megnyitás
                </Link>
              </article>
            ))}
          </div>
        )}
      </section>
    </main>
  );
}
