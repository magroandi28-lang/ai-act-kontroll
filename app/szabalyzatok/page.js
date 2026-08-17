import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "../../lib/supabase/server";

export const dynamic = "force-dynamic";

const STATUS_LABELS = {
  draft: "Piszkozat",
  in_review: "Felülvizsgálat alatt",
  approved: "Jóváhagyva",
  rejected: "Javításra vár",
  archived: "Archivált",
};

// A szűrők sorrendje szándékos: elöl az, ami cselekvést kíván.
const FILTERS = [
  ["varakozo", "Rám vár", (row) => row.status === "in_review"],
  ["javitando", "Javításra vár", (row) => row.status === "rejected"],
  ["piszkozat", "Piszkozat", (row) => row.status === "draft"],
  ["jovahagyott", "Jóváhagyva", (row) => row.status === "approved"],
  ["mind", "Mind", () => true],
];

function datum(ertek) {
  if (!ertek) return null;
  return new Intl.DateTimeFormat("hu-HU", { dateStyle: "medium" }).format(new Date(ertek));
}

export default async function PolicyQueuePage({ searchParams }) {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: organisations } = await supabase.rpc("aic_szervezeteim");
  const organisation = organisations?.[0] || null;

  let rows = [];
  let listError = null;

  if (organisation) {
    const result = await supabase.rpc("aic_felulvizsgalati_lista", {
      p_organisation_id: organisation.organisation_id,
    });
    rows = result.data || [];
    listError = result.error?.message || null;
  }

  const aktivSzuro = FILTERS.some(([kod]) => kod === searchParams?.szures)
    ? searchParams.szures
    : "varakozo";

  const szuro = FILTERS.find(([kod]) => kod === aktivSzuro);
  const lathato = rows.filter(szuro[2]);

  // A jóváhagyás a szabálymodult hagyja jóvá, nem csak a fejezetet, ezért
  // érdemes megmutatni, hány különböző szabály vár még döntésre összesen.
  const varakozoOsszesen = rows.filter((row) => row.status === "in_review").length;

  return (
    <main className="queue-page">
      <div className="queue-shell">
        <Link className="org-back" href="/vezerlopult">← Vissza a vezérlőpultra</Link>
        <p className="dashboard-eyebrow">Jogi felülvizsgálat</p>
        <h1>Szabályzatok</h1>
        <p className="queue-intro">
          {varakozoOsszesen > 0
            ? `${varakozoOsszesen} dokumentum vár a jóváhagyásodra.`
            : "Nincs jóváhagyásra váró dokumentum."}
        </p>

        {!organisation && (
          <p className="org-error" role="alert">
            Nincs olyan szervezet, amelynek tagja lennél.
          </p>
        )}

        {listError && (
          <p className="org-error" role="alert">A lista nem tölthető be: {listError}</p>
        )}

        <nav className="queue-filters" aria-label="Szűrés állapot szerint">
          {FILTERS.map(([kod, cimke, feltetel]) => {
            const darab = rows.filter(feltetel).length;
            return (
              <Link
                key={kod}
                className={`queue-filter${kod === aktivSzuro ? " is-active" : ""}`}
                href={`/szabalyzatok?szures=${kod}`}
              >
                {cimke} ({darab})
              </Link>
            );
          })}
        </nav>

        {lathato.length === 0 ? (
          <p className="queue-empty">Ebben az állapotban nincs dokumentum.</p>
        ) : (
          <div className="queue-list">
            {lathato.map((row) => (
              <article className="queue-card" key={row.policy_id}>
                <div className="queue-card-main">
                  <div className="queue-card-title">
                    <h2>{row.system_name}</h2>
                    <span className={`queue-badge queue-badge-${row.status}`}>
                      {STATUS_LABELS[row.status] || row.status}
                    </span>
                  </div>

                  <p className="queue-card-meta">
                    {row.version}. verzió · {row.section_count} fejezet
                    {row.pending_rule_count > 0
                      ? ` · ebből ${row.pending_rule_count} még jóváhagyásra vár`
                      : " · mind jóváhagyva"}
                  </p>
                  <p className="queue-card-meta">
                    {row.status === "in_review" && row.submitted_at
                      ? `Beküldve ${datum(row.submitted_at)}`
                      : row.status === "approved" && row.reviewed_at
                        ? `Jóváhagyva ${datum(row.reviewed_at)}`
                        : `Módosítva ${datum(row.updated_at)}`}
                  </p>

                  {row.status === "rejected" && row.review_note && (
                    <p className="queue-card-note">
                      <strong>Javítandó: </strong>
                      {row.review_note}
                    </p>
                  )}
                </div>

                <Link
                  className={row.status === "in_review" ? "queue-open" : "queue-open-quiet"}
                  href={`/rendszerek/${row.ai_system_id}/szabalyzat`}
                >
                  {row.status === "in_review" ? "Felülvizsgálat" : "Megnyitás"}
                </Link>
              </article>
            ))}
          </div>
        )}
      </div>
    </main>
  );
}
