"use client";

import { useCallback, useEffect, useMemo, useState } from "react";
import { createClient } from "../../lib/supabase/client";

// A jogtár világos olvasófelület a sötét alkalmazáson belül. Ez szándékos:
// itt hosszú törvényszöveget kell olvasni, néha órákig. A többi oldal marad
// sötét.

const ALLAPOTOK = [
  ["mind", "Mind"],
  ["jovahagyasra_var", "Jóváhagyásra vár"],
  ["jovahagyott", "Jóváhagyva"],
  ["nincs_szabaly", "Nincs szabály"],
];

const SZEREPKOROK = [
  [null, "Minden szerepkör"],
  ["deployer", "Alkalmazó"],
  ["provider", "Szolgáltató"],
  ["importer", "Importőr"],
  ["distributor", "Forgalmazó"],
];

const SZEREP_CIMKE = {
  deployer: "alkalmazó",
  provider: "szolgáltató",
  importer: "importőr",
  distributor: "forgalmazó",
  product_manufacturer: "termékgyártó",
  authorised_representative: "meghatalmazott képviselő",
  affected_person: "érintett személy",
  any: "bármely szerepkör",
};

function datum(ertek) {
  if (!ertek) return null;
  return new Intl.DateTimeFormat("hu-HU", { dateStyle: "medium" }).format(new Date(ertek));
}

export default function JogtarView({ kezdoLista, iparagak, dontheto }) {
  const supabase = useMemo(() => createClient(), []);

  const [lista, setLista] = useState(kezdoLista);
  const [reteg, setReteg] = useState("mind");
  const [szerepkor, setSzerepkor] = useState(null);
  const [allapot, setAllapot] = useState("mind");
  const [kereses, setKereses] = useState("");

  const [nyitottCikk, setNyitottCikk] = useState(null);
  const [cikk, setCikk] = useState(null);
  const [betolt, setBetolt] = useState(false);
  const [uzenet, setUzenet] = useState("");

  const [szerkesztett, setSzerkesztett] = useState({});
  const [mentesFolyik, setMentesFolyik] = useState(null);

  const listaFrissites = useCallback(async () => {
    const { data, error } = await supabase.rpc("aic_jogtar_lista", {
      p_reteg: reteg,
      p_szerepkor: szerepkor,
      p_allapot: allapot,
    });
    if (error) {
      setUzenet(error.message);
      return;
    }
    setLista(data);
  }, [supabase, reteg, szerepkor, allapot]);

  useEffect(() => {
    listaFrissites();
  }, [listaFrissites]);

  const cikkMegnyitasa = useCallback(
    async (sourceId, cikkszam) => {
      setNyitottCikk({ sourceId, cikkszam });
      setBetolt(true);
      setSzerkesztett({});
      const { data, error } = await supabase.rpc("aic_jogtar_cikk", {
        p_source_id: sourceId,
        p_cikk: cikkszam,
      });
      setBetolt(false);
      if (error) {
        setUzenet(error.message);
        return;
      }
      setCikk(data);
    },
    [supabase]
  );

  // Az első cikk megnyitása induláskor, hogy ne üres képernyő fogadjon.
  useEffect(() => {
    if (nyitottCikk || !lista?.forrasok?.length) return;
    const elso = lista.forrasok[0];
    const elsoCikk = elso?.cikkek?.[0];
    if (elsoCikk) cikkMegnyitasa(elsoCikk.source_id, elsoCikk.cikk);
  }, [lista, nyitottCikk, cikkMegnyitasa]);

  async function jovahagyas(ruleCode) {
    setMentesFolyik(ruleCode);
    const { error } = await supabase.rpc("aic_approve_compliance_rule", {
      p_rule_code: ruleCode,
      p_note: null,
    });
    setMentesFolyik(null);
    if (error) {
      setUzenet(error.message);
      return;
    }
    setUzenet("");
    await cikkMegnyitasa(nyitottCikk.sourceId, nyitottCikk.cikkszam);
    await listaFrissites();
  }

  async function szovegMentese(ruleCode) {
    const uj = szerkesztett[ruleCode];
    if (uj === undefined) return;
    setMentesFolyik(ruleCode);
    const { error } = await supabase.rpc("aic_szabaly_mentese", {
      p_rule_code: ruleCode,
      p_szoveg: uj,
      p_ertelmezes: null,
    });
    setMentesFolyik(null);
    if (error) {
      setUzenet(error.message);
      return;
    }
    setUzenet("");
    await cikkMegnyitasa(nyitottCikk.sourceId, nyitottCikk.cikkszam);
    await listaFrissites();
  }

  const szurtForrasok = useMemo(() => {
    if (!kereses.trim()) return lista?.forrasok || [];
    const k = kereses.trim().toLowerCase();
    return (lista?.forrasok || [])
      .map((f) => ({
        ...f,
        cikkek: (f.cikkek || []).filter(
          (c) =>
            `${c.cikk}`.toLowerCase().includes(k) ||
            (c.cim || "").toLowerCase().includes(k)
        ),
      }))
      .filter((f) => f.cikkek.length > 0);
  }, [lista, kereses]);

  const ossz = lista?.osszesites || {};

  return (
    <div className="jogtar">
      <header className="jogtar-fejlec">
        <div>
          <p className="jogtar-eyebrow">Jogtár</p>
          <h1>{cikk ? `${cikk.forras?.split("–")[0]?.trim()} — ${cikk.cikk}. cikk` : "Jogtár"}</h1>
          {cikk?.cim && <p className="jogtar-cikkcim">{cikk.cim}</p>}
        </div>
        <div className="jogtar-szamlalo">
          <span>Jóváhagyva</span>
          <strong>
            {ossz.jovahagyott ?? 0} <em>/ {ossz.szabaly ?? 0}</em>
          </strong>
        </div>
      </header>

      <div className="jogtar-szurok">
        <div className="jogtar-szuro-csoport">
          <button
            type="button"
            className={reteg === "torzs" ? "jogtar-chip is-active" : "jogtar-chip"}
            onClick={() => setReteg("torzs")}
          >
            Törzs
          </button>
          {iparagak.map((i) => (
            <button
              key={i.code}
              type="button"
              className={reteg === i.code ? "jogtar-chip is-active" : "jogtar-chip"}
              onClick={() => setReteg(i.code)}
            >
              {i.name_hu}
            </button>
          ))}
          <button
            type="button"
            className={reteg === "mind" ? "jogtar-chip is-active" : "jogtar-chip"}
            onClick={() => setReteg("mind")}
          >
            Mind
          </button>
        </div>

        <div className="jogtar-szuro-csoport">
          <select value={szerepkor || ""} onChange={(e) => setSzerepkor(e.target.value || null)}>
            {SZEREPKOROK.map(([ertek, cimke]) => (
              <option key={cimke} value={ertek || ""}>{cimke}</option>
            ))}
          </select>
          <select value={allapot} onChange={(e) => setAllapot(e.target.value)}>
            {ALLAPOTOK.map(([ertek, cimke]) => (
              <option key={ertek} value={ertek}>{cimke}</option>
            ))}
          </select>
          <input
            type="search"
            value={kereses}
            onChange={(e) => setKereses(e.target.value)}
            placeholder="Keresés cikkszám vagy cím szerint"
          />
        </div>
      </div>

      {uzenet && <p className="jogtar-uzenet" role="alert">{uzenet}</p>}

      <div className="jogtar-torzs">
        <nav className="jogtar-nav" aria-label="Jogszabályhelyek">
          {szurtForrasok.length === 0 && <p className="jogtar-ures">Nincs találat.</p>}
          {szurtForrasok.map((f) => (
            <section key={f.forras}>
              <p className="jogtar-nav-forras">{f.forras}</p>
              {f.cikkek.map((c) => {
                const aktiv =
                  nyitottCikk?.sourceId === c.source_id && nyitottCikk?.cikkszam === c.cikk;
                return (
                  <button
                    key={`${c.source_id}-${c.cikk}`}
                    type="button"
                    className={aktiv ? "jogtar-nav-cikk is-active" : "jogtar-nav-cikk"}
                    onClick={() => cikkMegnyitasa(c.source_id, c.cikk)}
                  >
                    <span>{c.cikk}</span>
                    {c.szabaly_szam > 0 && (
                      <em>
                        {c.jovahagyott}/{c.szabaly_szam}
                      </em>
                    )}
                  </button>
                );
              })}
            </section>
          ))}
        </nav>

        <article className="jogtar-tartalom">
          {betolt && <p className="jogtar-ures">Betöltés…</p>}

          {!betolt && cikk && (
            <>
              <p className="jogtar-blokkcim">Hatályos jogszabályszöveg</p>

              {(cikk.bekezdesek || []).length > 0 ? (
                (cikk.bekezdesek || []).map((b) => (
                  <p key={b.bekezdes} className="jogtar-torvenyszoveg">
                    <span className="jogtar-bekezdesjel">({b.bekezdes})</span> {b.szoveg}
                  </p>
                ))
              ) : (
                <p className="jogtar-torvenyszoveg">{cikk.teljes_szoveg}</p>
              )}

              {cikk.melylink && (
                <a className="jogtar-forraslink" href={cikk.melylink} target="_blank" rel="noreferrer">
                  Hivatalos szöveg ↗
                </a>
              )}

              <div className="jogtar-valaszto" />

              {(cikk.szabalyok || []).length === 0 && (
                <div className="jogtar-nincs-szabaly">
                  <p className="jogtar-blokkcim">Ehhez a helyhez nem tartozik szabály</p>
                  <p>{cikk.lefedettseg?.indok || "Nincs rögzített indoklás."}</p>
                </div>
              )}

              {(cikk.szabalyok || []).map((sz) => {
                const jovahagyva = sz.jovahagyva;
                const szoveg =
                  szerkesztett[sz.rule_code] !== undefined
                    ? szerkesztett[sz.rule_code]
                    : sz.szoveg;
                const valtozott = szerkesztett[sz.rule_code] !== undefined
                  && szerkesztett[sz.rule_code] !== sz.szoveg;

                if (jovahagyva) {
                  return (
                    <div key={sz.rule_code} className="jogtar-kesz">
                      <span>{sz.cim}</span>
                      <em>jóváhagyva · {datum(sz.jovahagyva_mikor)}</em>
                    </div>
                  );
                }

                return (
                  <section key={sz.rule_code} className="jogtar-szabaly">
                    <div className="jogtar-szabaly-fejlec">
                      <p className="jogtar-blokkcim">Amit ebből írtunk</p>
                      <span className="jogtar-szerep">{SZEREP_CIMKE[sz.szerep] || sz.szerep}</span>
                    </div>
                    <h2>{sz.cim}</h2>

                    {(sz.kapcsolok || []).length > 0 && (
                      <>
                        <p className="jogtar-kapcsolo-cim">Akkor lép be, ha az eszközre igaz</p>
                        <div className="jogtar-kapcsolok">
                          {sz.kapcsolok.map((k) => (
                            <span key={k.kulcs}>{k.nev}</span>
                          ))}
                        </div>
                      </>
                    )}

                    <textarea
                      className="jogtar-szoveg"
                      value={szoveg}
                      rows={5}
                      disabled={!dontheto || mentesFolyik === sz.rule_code}
                      onChange={(e) =>
                        setSzerkesztett((elozo) => ({ ...elozo, [sz.rule_code]: e.target.value }))
                      }
                    />

                    {sz.ertelmezes && (
                      <div className="jogtar-ertelmezes">
                        <strong>Értelmezés.</strong> {sz.ertelmezes}
                      </div>
                    )}

                    {sz.hatalyos_tol && new Date(sz.hatalyos_tol) > new Date() && (
                      <p className="jogtar-jovobeli">
                        Ez a kötelezettség {datum(sz.hatalyos_tol)} napjától alkalmazandó.
                      </p>
                    )}

                    {dontheto && (
                      <div className="jogtar-gombok">
                        <button
                          type="button"
                          className="jogtar-gomb-elsodleges"
                          disabled={mentesFolyik === sz.rule_code || valtozott}
                          onClick={() => jovahagyas(sz.rule_code)}
                        >
                          {mentesFolyik === sz.rule_code ? "Mentés…" : "Jóváhagyom"}
                        </button>
                        <button
                          type="button"
                          disabled={!valtozott || mentesFolyik === sz.rule_code}
                          onClick={() => szovegMentese(sz.rule_code)}
                        >
                          Mentés jóváhagyás nélkül
                        </button>
                        {valtozott && (
                          <span className="jogtar-figyelmeztetes">
                            A szöveget módosítottad — előbb mentsd, utána hagyhatod jóvá.
                          </span>
                        )}
                      </div>
                    )}

                    {!dontheto && (
                      <p className="jogtar-figyelmeztetes">
                        A szabályok jóváhagyása jogász vagy tulajdonos jogosultsághoz kötött.
                      </p>
                    )}
                  </section>
                );
              })}
            </>
          )}
        </article>
      </div>
    </div>
  );
}
