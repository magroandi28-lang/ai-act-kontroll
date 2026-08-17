"use client";

import { useMemo, useState, useTransition } from "react";
import Link from "next/link";
import {
  approveDocument, approveRule, editSection, insertModule, resetSection, sendBack,
} from "./actions";

const SULYOSSAG = { magas: "Magas", kozepes: "Közepes", alacsony: "Alacsony" };

function Fejezet({ fejezet, policyId, dontheteek, pending, run }) {
  const [nyitva, setNyitva] = useState(false);
  const [szerkeszt, setSzerkeszt] = useState(false);
  const [cim, setCim] = useState(fejezet.cim || "");
  const [tartalom, setTartalom] = useState(fejezet.tartalom || "");

  const jelzesek = fejezet.elemzes?.jelzesek || [];
  const kesz = fejezet.szabaly_jovahagyva;

  if (kesz && !szerkeszt) {
    return (
      <li className="rev-chapter rev-chapter-done">
        <span className="rev-tick" aria-hidden="true">✓</span>
        <span className="rev-done-title">{fejezet.szam}. {fejezet.cim}</span>
        <span className="rev-done-note">jóváhagyva</span>
      </li>
    );
  }

  return (
    <li className="rev-chapter">
      <div className="rev-chapter-head">
        <h2>{fejezet.szam}. {fejezet.cim}</h2>
        {fejezet.szerkesztett && <span className="rev-flag">szerkesztett</span>}
        {fejezet.jogszabaly?.[0]?.cimke && (
          fejezet.jogszabaly[0].link ? (
            <a className="rev-ref" href={fejezet.jogszabaly[0].link} target="_blank" rel="noreferrer">
              {fejezet.jogszabaly[0].cimke} ↗
            </a>
          ) : (
            <span className="rev-ref">{fejezet.jogszabaly[0].cimke}</span>
          )
        )}
      </div>

      {!szerkeszt && <p className="rev-text">{fejezet.tartalom}</p>}

      {szerkeszt && (
        <div className="rev-edit">
          <label htmlFor={`cim-${fejezet.szam}`}>Fejezet címe</label>
          <input id={`cim-${fejezet.szam}`} value={cim} disabled={pending}
            onChange={(e) => setCim(e.target.value)} />
          <label htmlFor={`tart-${fejezet.szam}`}>Fejezet szövege</label>
          <textarea id={`tart-${fejezet.szam}`} rows={12} value={tartalom} disabled={pending}
            onChange={(e) => setTartalom(e.target.value)} />
          <div className="rev-buttons">
            <button type="button" className="rev-primary" disabled={pending}
              onClick={() => run(async () => {
                const r = await editSection(policyId, Number(fejezet.szam), cim, tartalom);
                if (!r.error) setSzerkeszt(false);
                return r;
              })}>
              Mentés
            </button>
            <button type="button" className="rev-quiet" disabled={pending}
              onClick={() => { setCim(fejezet.cim || ""); setTartalom(fejezet.tartalom || ""); setSzerkeszt(false); }}>
              Mégsem
            </button>
            {fejezet.szerkesztett && (
              <button type="button" className="rev-quiet" disabled={pending}
                onClick={() => run(() => resetSection(policyId, Number(fejezet.szam)))}>
                Eredeti visszaállítása
              </button>
            )}
          </div>
        </div>
      )}

      {jelzesek.length > 0 && (
        <div className="rev-signals">
          <strong>Az automatikus ellenőrzés {jelzesek.length} eltérést jelez:</strong>
          <ul>
            {jelzesek.map((jel, i) => (
              <li key={i}>
                <span className={`rev-sev rev-sev-${jel.sulyossag}`}>
                  {SULYOSSAG[jel.sulyossag] || jel.sulyossag}
                </span>
                {jel.uzenet}
              </li>
            ))}
          </ul>
        </div>
      )}

      {jelzesek.length === 0 && fejezet.elemzes?.elemezheto && (
        <p className="rev-signals rev-signals-clean">
          Az automatikus ellenőrzés nem talált eltérést a jogszabály szövegéhez képest.
        </p>
      )}

      {fejezet.jogszabaly?.length > 0 && (
        <div className="rev-legal">
          <button type="button" className="rev-legal-toggle" onClick={() => setNyitva((v) => !v)}>
            {nyitva ? "Jogszabályszöveg elrejtése" : `Jogszabályszöveg megjelenítése (${fejezet.jogszabaly.length})`}
          </button>
          {nyitva && fejezet.jogszabaly.map((jog, i) => (
            <div className="rev-legal-item" key={i}>
              <p className="rev-legal-label">
                {jog.cimke}
                {jog.link && <a href={jog.link} target="_blank" rel="noreferrer"> · forrás</a>}
              </p>
              <p className="rev-legal-text">{jog.szoveg || "A szöveg még nincs betöltve."}</p>
            </div>
          ))}
        </div>
      )}

      {!szerkeszt && (
        <div className="rev-buttons">
          {dontheteek && (
            <button type="button" className="rev-primary" disabled={pending}
              onClick={() => run(() => approveRule(policyId, fejezet.rule_code))}>
              Rendben, jóváhagyom
            </button>
          )}
          <button type="button" className="rev-quiet" disabled={pending}
            onClick={() => setSzerkeszt(true)}>
            Szerkesztem
          </button>
        </div>
      )}
    </li>
  );
}

export default function ReviewDocument({ doc, catalogue }) {
  const [pending, startTransition] = useTransition();
  const [message, setMessage] = useState(null);
  const [megjegyzes, setMegjegyzes] = useState("");
  const [modul, setModul] = useState("");

  const policyId = doc.policy.id;
  const dontheteek = doc.dontheteek;
  const fejezetek = doc.fejezetek || [];
  const jovahagyott = Number(doc.jovahagyott || 0);
  const osszesen = Number(doc.osszesen || 0);
  const hatra = osszesen - jovahagyott;

  const beemelheto = useMemo(
    () => (catalogue || []).filter((m) => !m.already_in_document),
    [catalogue]
  );

  function run(action) {
    setMessage(null);
    startTransition(async () => {
      const result = await action();
      if (result?.error) setMessage({ type: "error", text: result.error });
      else if (result?.message) setMessage({ type: "ok", text: result.message });
      return result;
    });
  }

  return (
    <main className="rev-page">
      <div className="rev-shell">
        <Link className="org-back" href="/szabalyzatok">← Vissza a listához</Link>
        <p className="dashboard-eyebrow">Jogi felülvizsgálat</p>
        <h1>{doc.policy.rendszer}</h1>

        <div className="rev-progress">
          <div className="rev-progress-bar">
            <span style={{ width: `${osszesen ? (jovahagyott / osszesen) * 100 : 0}%` }} />
          </div>
          <p>
            {jovahagyott} / {osszesen} fejezet jóváhagyva
            {hatra > 0 ? ` · ${hatra} vár rád` : " · minden fejezet kész"}
          </p>
        </div>

        {!dontheteek && (
          <p className="rev-notice" role="status">
            Ezt a dokumentumot megnézheted, de jóváhagyni csak jogász szerepkörrel lehet.
          </p>
        )}

        {message && (
          <p className={`org-message org-message-${message.type}`} role="alert">{message.text}</p>
        )}

        <ul className="rev-list">
          {fejezetek.map((f) => (
            <Fejezet key={f.szam} fejezet={f} policyId={policyId}
              dontheteek={dontheteek} pending={pending} run={run} />
          ))}
        </ul>

        {dontheteek && beemelheto.length > 0 && (
          <section className="rev-block">
            <h2>Hiányzik egy fejezet?</h2>
            <p className="org-note">
              A katalógusból beemelt fejezet ehhez a dokumentumhoz kerül hozzá.
            </p>
            <select value={modul} disabled={pending} onChange={(e) => setModul(e.target.value)}>
              <option value="">Válassz fejezetet</option>
              {beemelheto.map((m) => (
                <option key={m.module_code} value={m.module_code}>{m.title}</option>
              ))}
            </select>
            <button type="button" className="rev-quiet" disabled={pending || !modul}
              onClick={() => run(async () => {
                const r = await insertModule(policyId, modul);
                if (!r.error) setModul("");
                return r;
              })}>
              Beemelem
            </button>
          </section>
        )}

        {dontheteek && (
          <section className="rev-block rev-final">
            <h2>A dokumentum lezárása</h2>
            <label htmlFor="megjegyzes">Megjegyzés</label>
            <textarea id="megjegyzes" rows={3} value={megjegyzes} disabled={pending}
              placeholder="Nem kötelező. Visszaküldésnél viszont írd le, melyik adat hibás a rendszerről."
              onChange={(e) => setMegjegyzes(e.target.value)} />

            <div className="rev-buttons">
              <button type="button" className="rev-primary" disabled={pending || hatra > 0}
                onClick={() => run(() => approveDocument(policyId, megjegyzes))}>
                {hatra > 0 ? `Még ${hatra} fejezet hiányzik` : "Dokumentum jóváhagyása"}
              </button>
              <button type="button" className="rev-quiet" disabled={pending}
                onClick={() => run(() => sendBack(policyId, megjegyzes))}>
                Vissza a rögzítőhöz — hibás rendszeradat
              </button>
            </div>
          </section>
        )}
      </div>
    </main>
  );
}
