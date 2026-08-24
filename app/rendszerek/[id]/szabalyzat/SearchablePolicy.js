"use client";

import { useMemo, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
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
function ApprovalPanel({ policy }) {
  const status = policy.status || "draft";

  return (
    <section className={`policy-approval policy-approval-${status}`} aria-live="polite">
      <div className="policy-approval-header">
        <div>
          <p className="profile-label">A dokumentum állapota</p>
          <strong>{statusLabels[status] || status}</strong>
        </div>
        {status === "approved" && policy.updated_at && (
          <p className="policy-approval-meta">
            Utolsó frissítés: {formatDate(policy.updated_at)}
          </p>
        )}
      </div>

      {status === "draft" && (
        <p className="policy-approval-note">
          A szabályzat akkor válik kiadhatóvá, ha a jogász a jogtárban minden
          benne szereplő előírást jóváhagyott. Külön beküldés nem szükséges.
        </p>
      )}

      {status === "approved" && policy.content_sha256 && (
        <p className="policy-approval-hash">
          Tartalmi ujjlenyomat: <code>{policy.content_sha256.slice(0, 16)}…</code>
        </p>
      )}
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
  const sourceTitle = reference.source_title || "Hivatalos jogforrás";
  if (!reference.article_number) return `${sourceTitle} – ${reference.heading || "kapcsolódó rendelkezés"}`;
  const suffix = /AI Act|Data Protection Regulation|GDPR/i.test(sourceTitle) ? "cikk" :
    /melléklet/i.test(reference.article_number) ? "" : "§";
  return `${sourceTitle} – ${reference.article_number}${suffix ? `. ${suffix}` : ""}`;
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
              <span className={`policy-kind policy-kind-${section.module_kind || "guidance"}`}>
                {moduleKindLabel(section.module_kind)}
              </span>
              {(section.module_lifecycle_status && section.module_lifecycle_status !== "approved") ||
              section.requires_human_review ? (
                <span className="policy-kind policy-kind-pending">Szakértői jóváhagyásra vár</span>
              ) : null}
              <h3>{section.number || index + 1}. {section.title}</h3>
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
          <p>A követelménydokumentumot az EnergiaAI Kontroll determinisztikus szabálymotorja állította össze. A kötelező jogi követelményeket, a belső működési kontrollokat és az alkalmazási útmutatókat elkülönítve jeleníti meg. A dokumentum nem minősül egyedi jogi tanácsadásnak.</p>
        </footer>
      </article>
    </main>
  );
}
