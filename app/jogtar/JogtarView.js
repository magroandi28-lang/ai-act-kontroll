"use client";

import { useCallback, useEffect, useMemo, useState } from "react";
import { createClient } from "../../lib/supabase/client";

// A jogtár világos olvasófelület a sötét alkalmazáson belül. Itt hosszú
// törvényszöveget kell olvasni, ezért a tipográfia fontosabb, mint a kezelőelemek.

const ALLAPOTOK = [
  ["jovahagyasra_var", "Jóváhagyásra vár"],
  ["jovahagyott", "Jóváhagyva"],
  ["mind", "Mind"],
];

const SZEREPKOROK = [
  ["", "Minden szerepkör"],
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

// A törvény néha egyetlen bekezdésbe zsúfol több tucat számozott pontot – a
// fogalommeghatározások tipikusan ilyenek. Olvashatatlan egy tömbben, ezért a
// számozásnál tördeljük. A szöveget nem változtatjuk, csak sortörést teszünk be.
function tordel(szoveg) {
  if (!szoveg) return [];
  const tiszta = szoveg.replace(/\r\n/g, "\n").trim();
  if (tiszta.length < 400) return [tiszta];

  const darabok = tiszta
    .split(/(?=(?:^|\s)\d{1,3}\.\s+[„"])/g)
    .map((d) => d.trim())
    .filter(Boolean);

  if (darabok.length > 1) return darabok;

  const betus = tiszta
    .split(/(?=(?:^|\s)[a-z]\)\s)/g)
    .map((d) => d.trim())
    .filter(Boolean);

  return betus.length > 1 ? betus : [tiszta];
}

export default function JogtarView({ kezdoLista, iparagak, dontheto }) {
  const supabase = useMemo(() => createClient(), []);

  const [lista, setLista] = useState(kezdoLista);
  const [reteg, setReteg] = useState("torzs");
  const [szerepkor, setSzerepkor] = useState("");
  const [allapot, setAllapot] = useState("jovahagyasra_var");

  const [nyitottCikk, setNyitottCikk] = useState(null);
  const [cikk, setCikk] = useState(null);
  const [nyitottSzabaly, setNyitottSzabaly] = useState(null);
  const [betolt, setBetolt] = useState(false);
  const [uzenet, setUzenet] = useState("");

  const [szerkesztett, setSzerkesztett] = useState({});
  const [mentesFolyik, setMentesFolyik] = useState(null);

  // A törzs önálló szűrő, ezért az ugyanezt jelentő iparágat nem mutatjuk
  // külön gombként.
  const valodiIparagak = useMemo(
    () => (iparagak || []).filter((i) => !["general", "all", "any"].includes(i.code)),
    [iparagak]
  );

  const listaFrissites = useCallback(async () => {
    const { data, error } = await supabase.rpc("aic_jogtar_lista", {
      p_reteg: reteg,
      p_szerepkor: szerepkor || null,
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
      setNyitottSzabaly(null);
      const { data, error } = await supabase.rpc("aic_jogtar_cikk", {
        p_source_id: sourceId,
        p_cikk: cikkszam,
        p_szerepkor: szerepkor || null,
        p_reteg: reteg,
      });
      setBetolt(false);
      if (error) {
        setUzenet(error.message);
        return;
      }
      setCikk(data);
      const elso = (data?.szabalyok || []).find((sz) => !sz.jovahagyva);
      setNyitottSzabaly(elso?.rule_code || null);
    },
    [supabase, szerepkor, reteg]
  );

  // Induláskor az első olyan cikkre nyitunk, ahol van jóváhagyásra váró
  // szabály. Üres cikkel indulni azt a látszatot kelti, hogy nem működik.
  useEffect(() => {
    if (nyitottCikk || !lista?.forrasok?.length) return;
    let cel = null;
    for (const f of lista.forrasok) {
      cel = (f.cikkek || []).find((c) => c.szabaly_szam > c.jovahagyott);
      if (cel) break;
    }
    if (!cel) cel = lista.forrasok[0]?.cikkek?.[0];
    if (cel) cikkMegnyitasa(cel.source_id, cel.cikk);
  }, [lista, nyitottCikk, cikkMegnyitasa]);

  // Szűrőváltásnál a megnyitott cikket is újra kell kérni, mert más szabályok
  // tartoznak hozzá.
  useEffect(() => {
    if (nyitottCikk) cikkMegnyitasa(nyitottCikk.sourceId, nyitottCikk.cikkszam);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [szerepkor, reteg]);

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

  const ossz = lista?.osszesites || {};
  const szabalyok = cikk?.szabalyok || [];

  return (
    <div className="jogtar">
      <header className="jogtar-fejlec">
        <div>
          <p className="jogtar-eyebrow">Jogtár</p>
          <h1>
            {cikk ? `${cikk.forras?.split("–")[0]?.trim()} — ${cikk.cikk}. cikk` : "Jogtár"}
          </h1>
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
          {valodiIparagak.map((i) => (
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
          <select value={szerepkor} onChange={(e) => setSzerepkor(e.target.value)}>
            {SZEREPKOROK.map(([ertek, cimke]) => (
              <option key={cimke} value={ertek}>{cimke}</option>
            ))}
          </select>
          <select value={allapot} onChange={(e) => setAllapot(e.target.value)}>
            {ALLAPOTOK.map(([ertek, cimke]) => (
              <option key={ertek} value={ertek}>{cimke}</option>
            ))}
          </select>
        </div>
      </div>

      {uzenet && <p className="jogtar-uzenet" role="alert">{uzenet}</p>}

      <div className="jogtar-torzs">
        <nav className="jogtar-nav" aria-label="Jogszabályhelyek">
          {(lista?.forrasok || []).length === 0 && <p className="jogtar-ures">Nincs találat.</p>}
          {(lista?.forrasok || []).map((f) => (
            <section key={f.forras}>
              <p className="jogtar-nav-forras">{f.forras}</p>
              {(f.cikkek || []).map((c) => {
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
                      <em>{c.jovahagyott}/{c.szabaly_szam}</em>
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

              {(cikk.bekezdesek || []).length > 0
                ? (cikk.bekezdesek || []).map((b) => (
                    <div key={b.bekezdes}>
                      {tordel(b.szoveg).map((resz, i) => (
                        <p key={i} className="jogtar-torvenyszoveg">
                          {i === 0 && <span className="jogtar-bekezdesjel">({b.bekezdes})</span>}{" "}
                          {resz}
                        </p>
                      ))}
                    </div>
                  ))
                : tordel(cikk.teljes_szoveg).map((resz, i) => (
                    <p key={i} className="jogtar-torvenyszoveg">{resz}</p>
                  ))}

              {cikk.melylink && (
                <a
                  className="jogtar-forraslink"
                  href={cikk.melylink}
                  target="_blank"
                  rel="noreferrer"
                >
                  Hivatalos szöveg ↗
                </a>
              )}

              <div className="jogtar-valaszto" />

              {szabalyok.length === 0 && (
                <div className="jogtar-nincs-szabaly">
                  <p className="jogtar-blokkcim">Ehhez a helyhez nem tartozik szabályzati előírás</p>
                  <p>{cikk.lefedettseg?.indok || "Nincs rögzített indoklás."}</p>
                </div>
              )}

              {szabalyok.length > 0 && (
                <p className="jogtar-blokkcim">
                  Szabályzat — {szabalyok.length} előírás
                </p>
              )}

              {/* A szabályok összecsukva állnak. Egyszerre egy van nyitva, mert
                  a jóváhagyás egyenkénti döntés, nem átfutás. */}
              {szabalyok.map((sz) => {
                const nyitva = nyitottSzabaly === sz.rule_code;
                const szoveg =
                  szerkesztett[sz.rule_code] !== undefined
                    ? szerkesztett[sz.rule_code]
                    : sz.szoveg;
                const valtozott =
                  szerkesztett[sz.rule_code] !== undefined &&
                  szerkesztett[sz.rule_code] !== sz.szoveg;

                return (
                  <section
                    key={sz.rule_code}
                    className={
                      sz.jovahagyva
                        ? "jogtar-szabaly is-kesz"
                        : nyitva
                          ? "jogtar-szabaly is-nyitva"
                          : "jogtar-szabaly"
                    }
                  >
                    <button
                      type="button"
                      className="jogtar-szabaly-fej"
                      onClick={() => setNyitottSzabaly(nyitva ? null : sz.rule_code)}
                      aria-expanded={nyitva}
                    >
                      <span className="jogtar-szabaly-cim">{sz.cim}</span>
                      <span className="jogtar-szerep">
                        {SZEREP_CIMKE[sz.szerep] || sz.szerep}
                      </span>
                      {sz.jovahagyva && (
                        <span className="jogtar-kesz-jel">
                          jóváhagyva · {datum(sz.jovahagyva_mikor)}
                        </span>
                      )}
                    </button>

                    {nyitva && (
                      <div className="jogtar-szabaly-torzs">
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
                          rows={Math.min(14, Math.max(3, Math.ceil((szoveg || "").length / 90)))}
                          disabled={!dontheto || mentesFolyik === sz.rule_code}
                          onChange={(e) =>
                            setSzerkesztett((elozo) => ({
                              ...elozo,
                              [sz.rule_code]: e.target.value,
                            }))
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

                        {dontheto && !sz.jovahagyva && (
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
                                Módosítottad — előbb mentsd, utána hagyhatod jóvá.
                              </span>
                            )}
                          </div>
                        )}

                        {!dontheto && (
                          <p className="jogtar-figyelmeztetes">
                            A jóváhagyás jogász vagy tulajdonos jogosultsághoz kötött.
                          </p>
                        )}
                      </div>
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
