"use client";

import { useMemo, useState } from "react";
import Link from "next/link";

function normalise(value) {
  return String(value || "")
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLocaleLowerCase("hu-HU");
}

export default function SearchablePolicy({ policy, system, generatedDate }) {
  const [query, setQuery] = useState("");
  const sections = Array.isArray(policy.document_sections) ? policy.document_sections : [];
  const normalisedQuery = normalise(query.trim());

  const matches = useMemo(() => sections.map((section) => {
    if (!normalisedQuery) return true;
    return normalise(`${section.title} ${section.summary} ${section.content}`).includes(normalisedQuery);
  }), [sections, normalisedQuery]);

  const matchCount = matches.filter(Boolean).length;

  return (
    <main className="policy-page">
      <div className="policy-toolbar">
        <Link href="/rendszerek">← Mentett szabályzatok</Link>
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

      {normalisedQuery && (
        <p className="policy-search-status" role="status">
          {matchCount ? `${matchCount} fejezetben található egyezés.` : "Nincs találat a szabályzatban."}
        </p>
      )}

      <article className="policy-document">
        <header className="policy-cover">
          <p>ENERGIAAI KONTROLL</p>
          <h1>{policy.title}</h1>
          <dl>
            <div><dt>Szervezet</dt><dd>{system.aic_organisations?.name || "Nincs megadva"}</dd></div>
            <div><dt>MI-rendszer</dt><dd>{system.name}</dd></div>
            <div><dt>Szabályzat verziója</dt><dd>{policy.version}. verzió</dd></div>
            <div><dt>Frissítés dátuma</dt><dd>{generatedDate}</dd></div>
          </dl>
        </header>

        <section className="policy-section policy-summary">
          <h2>Vezetői összefoglaló</h2>
          <p>{policy.executive_summary}</p>
        </section>

        <nav className="policy-toc policy-section" aria-label="A szabályzat tartalomjegyzéke">
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
          <h2>A szabályzat rendelkezései</h2>
          {sections.map((section, index) => (
            <section
              className={`policy-chapter policy-generated-chapter ${matches[index] ? "" : "is-search-hidden"}`}
              id={`fejezet-${section.number || index + 1}`}
              key={section.section_key || index}
            >
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
                          {reference.article_number ? `AI Act ${reference.article_number}. cikk` : reference.heading}
                        </a>
                      ) : (
                        reference.article_number ? `AI Act ${reference.article_number}. cikk` : reference.heading
                      )}
                    </span>
                  ))}
                </p>
              )}
            </section>
          ))}
        </section>

        <footer className="policy-footer">
          <p>A szabályzatot az EnergiaAI Kontroll determinisztikus szabálymotorja állította össze. A dokumentum nem minősül egyedi jogi tanácsadásnak.</p>
        </footer>
      </article>
    </main>
  );
}
