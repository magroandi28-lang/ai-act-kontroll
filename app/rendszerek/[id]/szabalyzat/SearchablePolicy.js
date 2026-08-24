"use client";

import { useMemo, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { frissitsSzabalyzat } from "./actions";
// A jóváhagyás a jogtárban történik, szabályonként. A szabályzatnak nincs
// külön felülvizsgálati köre, ezért innen kikerültek a beküldő és döntő
// műveletek. Az állapot a benne lévő előírások jóváhagyottságából következik.

const statusLabels = {
  draft: "Piszkozat — van benne jóváhagyásra váró előírás",
  approved: "Kiadható — minden előírása jóváhagyott",
  published: "Közzétéve",
  archived: "Archivált",
};

function formatDate(value) {
  if (!value) return null;
  return new Intl.DateTimeFormat("hu-HU", { dateStyle: "long", timeStyle: "short" })
    .format(new Date(value));
}

// A jóváhagyási sáv a dokumentum tetején. A jogosultságot az adatbázis dönti el,
// ezért itt minden művelet felkínálható: illetéktelen hívást a szerver utasít el.
function ApprovalPanel({ policy, systemId }) {
  const router = useRouter();
  const [uzenet, setUzenet] = useState("");
  const [folyamatban, startTransition] = useTransition();
  const status = policy.status || "draft";
  const elavult = Boolean(policy.elavult_ok);

  function frissites() {
    setUzenet("");
    startTransition(async () => {
      const eredmeny = await frissitsSzabalyzat(systemId);
      if (eredmeny?.error) {
        setUzenet(eredmeny.error);
        return;
      }
      router.refresh();
    });
  }

  return (
    <section className={`policy-approval policy-approval-${status}`} aria-live="polite">
      <div className="policy-approval-header">
        <div>
          <p className="profile-label">A dokumentum állapota</p>
          <strong>{statusLabels[status] || status}</strong>
        </div>
        {policy.updated_at && (
          <p className="policy-approval-meta">
            Utolsó frissítés: {formatDate(policy.updated_at)}
          </p>
        )}
      </div>

      {/* A rendszer adatai a szabályzat elkészítése óta megváltoztak. Az új
          verziót nem készítjük el magától: más kötelezettségeket hozhat. */}
      {elavult && (
        <div className="policy-outdated">
          <p><strong>A szabályzat elavult.</strong> {policy.elavult_ok}</p>
          <p>
            Frissítéskor új verzió készül a mostani adatokból. A korábbi verzió
            megmarad, visszakereshető.
          </p>
          <button
            className="primary-button"
            type="button"
            disabled={folyamatban}
            onClick={frissites}
          >
            {folyamatban ? "Frissítés…" : "Szabályzat frissítése"}
          </button>
        </div>
      )}

      {status === "draft" && !elavult && (
        <p className="policy-approval-note">
          A szabályzat akkor válik kiadhatóvá, ha a jogász a jogtárban minden
          benne szereplő előírást jóváhagyott. Külön beküldés nem szükséges.
        </p>
      )}

      {uzenet && <p className="system-form-message is-error" role="alert">{uzenet}</p>}
    </section>
  );
}

function normalise(value) {
  return String(value || "")
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLocaleLowerCase("hu-HU");
}

function legalReferenceLabel(reference) {
  // A hivatkozásban a rövid név szerepel: a teljes cím egy bekezdésnyi lenne,
  // és egy szabályzatban tízszer is előfordul. A teljes cím a forrásjegyzékben.
  const sourceTitle =
    reference.source_short || reference.source_title || "Hivatalos jogforrás";
  if (!reference.article_number) return `${sourceTitle} – ${reference.heading || "kapcsolódó rendelkezés"}`;
  // Az uniós jogi aktusoknak cikke van, a magyar jogszabályoknak szakasza.
  // A magyar címekben "évi ... törvény" vagy "Korm. rendelet" szerepel, az
  // uniósakban "(EU)" vagy "irányelv".
  const unios = /\(EU\)|\bGDPR\b|irányelv|AI Act/i.test(sourceTitle);
  const suffix = /melléklet/i.test(reference.article_number) ? ""
    : unios ? "cikk" : "§";
  const hely = `${reference.article_number}${suffix ? `. ${suffix}` : ""}`;
  const bekezdes = reference.paragraph_number ? ` (${reference.paragraph_number})` : "";
  return `${sourceTitle} – ${hely}${bekezdes}`;
}

function moduleKindLabel(moduleKind) {
  if (moduleKind === "legal_requirement") return "Kötelező jogi követelmény";
  if (moduleKind === "internal_control") return "Belső működési kontroll";
  return "Alkalmazási útmutató";
}

export default function SearchablePolicy({ policy, system, generatedDate, refreshWarning }) {
  const [query, setQuery] = useState("");
  const sections = Array.isArray(policy.document_sections) ? policy.document_sections : [];
  const normalisedQuery = normalise(query.trim());

  const matches = useMemo(() => sections.map((section) => {
    if (!normalisedQuery) return true;
    return normalise(`${section.title} ${section.summary} ${section.content}`).includes(normalisedQuery);
  }), [sections, normalisedQuery]);

  const matchCount = matches.filter(Boolean).length;

  // Hány fejezet mögött áll még szakmailag jóvá nem hagyott szabály.
  const pendingReview = sections.filter(
    (section) =>
      (section.module_lifecycle_status && section.module_lifecycle_status !== "approved") ||
      section.requires_human_review
  ).length;

  return (
    <main className="policy-page">
      <div className="policy-toolbar">
        <Link href={`/rendszerek?rendszer=${system.id}`}>← Vissza ehhez a rendszerhez</Link>
        <div className="policy-toolbar-actions">
          <label className="policy-search">
            <span className="sr-only">Keresés a szabályzatban</span>
            <input
              type="search"
              placeholder="Keresés, például: képzés"
              value={query}
              onChange={(event) => setQuery(event.target.value)}
            />
          </label>
          <button className="policy-print-button" type="button" onClick={() => window.print()}>
            Nyomtatás / Mentés PDF-ként
          </button>
        </div>
      </div>

      <ApprovalPanel policy={policy} systemId={system.id} />

      {refreshWarning && (
        <section className="policy-refresh-warning" role="status">
          <div>
            <strong>A szabályzat megtekinthető, de frissítésre vár</strong>
            <p>{refreshWarning}</p>
          </div>
          <Link href={`/rendszerek/${system.id}/szerkesztes`}>Profil ellenőrzése és megerősítése</Link>
        </section>
      )}

      {normalisedQuery && (
        <p className="policy-search-status" role="status">
          {matchCount ? `${matchCount} fejezetben található egyezés.` : "Nincs találat a szabályzatban."}
        </p>
      )}

      <article className="policy-document">
        <header className="policy-cover">
          <p>ENERGIAAI KONTROLL</p>
          <h1>{system.name} alkalmazandó szabályozási és megfelelőségi követelményei</h1>
          <dl>
            <div><dt>Szervezet</dt><dd>{system.aic_organisations?.name || "Nincs megadva"}</dd></div>
            <div><dt>MI-rendszer</dt><dd>{system.name}</dd></div>
            <div><dt>Dokumentum verziója</dt><dd>{policy.version}. verzió</dd></div>
            <div><dt>Frissítés dátuma</dt><dd>{generatedDate}</dd></div>
          </dl>
        </header>

        {pendingReview > 0 && (
          <section className="policy-review-notice" role="note">
            <strong>Szakmai felülvizsgálatra vár: {pendingReview} fejezet a {sections.length}-ből</strong>
            <p>
              Az így megjelölt fejezetek mögött álló szabályt még nem hagyta jóvá szakember.
              A dokumentum ezért felülvizsgálati tervezetnek tekintendő.
            </p>
          </section>
        )}

        <section className="policy-section policy-summary">
          <h2>Vezetői összefoglaló</h2>
          <p>{policy.executive_summary}</p>
        </section>

        <nav className="policy-toc policy-section" aria-label="A követelménydokumentum tartalomjegyzéke">
          <h2>Tartalomjegyzék</h2>
          <ol>
            {sections.map((section, index) => (
              <li className={matches[index] ? "" : "is-search-muted"} key={section.section_key || index}>
                <a href={`#fejezet-${section.number || index + 1}`}>{section.title}</a>
              </li>
            ))}
          </ol>
        </nav>

        <section className="policy-section">
          <h2>Alkalmazandó követelmények és kontrollok</h2>
          {sections.map((section, index) => (
            <section
              className={`policy-chapter policy-generated-chapter ${matches[index] ? "" : "is-search-hidden"}`}
              id={`fejezet-${section.number || index + 1}`}
              key={section.section_key || index}
            >
              {/* A besorolás a cím sorába kerül: külön sorban megtörte a
                  fejezet elejét. */}
              <div className="policy-chapter-head">
                <h3>{section.number || index + 1}. {section.title}</h3>
                <span className="policy-kind-row">
                  <span className={`policy-kind policy-kind-${section.module_kind || "guidance"}`}>
                    {moduleKindLabel(section.module_kind)}
                  </span>
                  {((section.module_lifecycle_status && section.module_lifecycle_status !== "approved") ||
                    section.requires_human_review) && (
                    <span className="policy-kind policy-kind-pending">Jogászi jóváhagyásra vár</span>
                  )}
                </span>
              </div>
              <p>{section.content}</p>
              {section.legal_references?.length > 0 && (
                <p className="policy-legal-reference">
                  <strong>Jogforrás: </strong>
                  {section.legal_references.map((reference, referenceIndex) => (
                    <span key={`${reference.article_number}-${referenceIndex}`}>
                      {referenceIndex ? "; " : ""}
                      {reference.official_url ? (
                        <a href={reference.official_url} target="_blank" rel="noreferrer">
                          {legalReferenceLabel(reference)}
                        </a>
                      ) : (
                        legalReferenceLabel(reference)
                      )}
                    </span>
                  ))}
                </p>
              )}
            </section>
          ))}
        </section>

        <footer className="policy-footer">
          <dl className="policy-closing">
            <div>
              <dt>Kiállító szervezet</dt>
              <dd>{system.aic_organisations?.name || "Nincs megadva"}</dd>
            </div>
            <div>
              <dt>Kiállítás dátuma</dt>
              <dd>{generatedDate}</dd>
            </div>
            <div>
              <dt>Verzió</dt>
              <dd>{policy.version}.</dd>
            </div>
            {policy.content_sha256 && (
              <div>
                <dt>Dokumentumazonosító</dt>
                <dd><code>{policy.content_sha256.slice(0, 16)}</code></dd>
              </div>
            )}
          </dl>
          {policy.content_sha256 && (
            <p className="policy-closing-note">
              A dokumentumazonosító a tartalomból számítódik. Ha a tartalom
              megváltozik, az azonosító is más lesz — ezzel igazolható, hogy a
              példány a kiadottal azonos.
            </p>
          )}
          <p>
            A követelménydokumentumot az EnergiaAI Kontroll determinisztikus
            szabálymotorja állította össze: minden előírás mögött megjelölt
            jogszabályhely áll. A dokumentum nem minősül egyedi jogi tanácsadásnak.
          </p>
        </footer>
      </article>
    </main>
  );
}
