"use client";

import { useCallback, useEffect, useMemo, useState } from "react";
import { createClient } from "../../lib/supabase/client";

// A képernyő egy döntésre van szabva: bal oldalon a szabályok, jobb oldalon
// egyetlen szabály és a mögötte álló jogszabályhely. A törvény teljes szövege
// nem ömlik rá a jogászra, csak a ténylegesen hivatkozott bekezdés látszik.

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

// Jogszabályhely emberi jelölése: "56/A. § (1)–(3)".
function helyJelolese(cikk, bekezdes) {
  if (!cikk) return "";
  const szam = /^\d/.test(cikk) ? `${cikk}. §` : cikk;
  return bekezdes ? `${szam} (${bekezdes})` : szam;
}

// Egy bekezdés szövege gyakran több számozott pontot tartalmaz egy tömbben.
// A számozásnál tördeljük; a szöveget nem változtatjuk.
function tordel(szoveg) {
  if (!szoveg) return [];
  const tiszta = szoveg.replace(/\r\n/g, "\n").trim();
  if (tiszta.length < 400) return [tiszta];

  const betus = tiszta
    .split(/(?=(?:^|\s)[a-z]\)\s)/g)
    .map((d) => d.trim())
    .filter(Boolean);

  return betus.length > 1 ? betus : [tiszta];
}

export default function JogtarView({ kezdoLista, iparagak, dontheto }) {
  const supabase = useMemo(() => createClient(), []);

  const [lista, setLista] = useState(kezdoLista);
  const [reteg, setReteg] = useState("mind");
  const [szerepkor, setSzerepkor] = useState("");
  const [allapot, setAllapot] = useState("jovahagyasra_var");

  const [nyitottKod, setNyitottKod] = useState(null);
  const [szabaly, setSzabaly] = useState(null);
  const [betolt, setBetolt] = useState(false);
  const [uzenet, setUzenet] = useState("");

  const [szerkesztett, setSzerkesztett] = useState(null);
  const [mentesFolyik, setMentesFolyik] = useState(false);
  const [nyitottSzakasz, setNyitottSzakasz] = useState(null);

  // A törzs önálló szűrő, ezért az ugyanezt jelentő iparágat nem mutatjuk
  // külön gombként.
  const valodiIparagak = useMemo(
    () => (iparagak || []).filter((i) => !["general", "all", "any"].includes(i.code)),
    [iparagak]
  );

  const listaFrissites = useCallback(async () => {
    const { data, error } = await supabase.rpc("aic_jogtar_szabalyok", {
      p_reteg: reteg,
      p_szerepkor: szerepkor || null,
      p_allapot: allapot,
    });
    if (error) {
      setUzenet(error.message);
      return;
    }
    setUzenet("");
    setLista(data);
  }, [supabase, reteg, szerepkor, allapot]);

  useEffect(() => {
    listaFrissites();
  }, [listaFrissites]);

  const szabalyMegnyitasa = useCallback(
    async (ruleCode) => {
      setNyitottKod(ruleCode);
      setBetolt(true);
      setSzerkesztett(null);
      setNyitottSzakasz(null);
      const { data, error } = await supabase.rpc("aic_jogtar_szabaly", {
        p_rule_code: ruleCode,
      });
      setBetolt(false);
      if (error) {
        setUzenet(error.message);
        return;
      }
      setSzabaly(data);
    },
    [supabase]
  );

  // Szűrőváltás után a megnyitott szabály kikerülhet a listából. Ha bent
  // hagynánk, egy odanem illő szabály maradna a jobb oldalon, és úgy tűnne,
  // hogy a szűrő nem működik.
  useEffect(() => {
    const kodok = (lista?.forrasok || []).flatMap((f) =>
      (f.szabalyok || []).map((sz) => sz.rule_code)
    );
    if (nyitottKod && !kodok.includes(nyitottKod)) {
      setNyitottKod(null);
      setSzabaly(null);
      return;
    }
    if (!nyitottKod && kodok.length > 0) {
      szabalyMegnyitasa(kodok[0]);
    }
  }, [lista, nyitottKod, szabalyMegnyitasa]);

  async function jovahagyas() {
    setMentesFolyik(true);
    const { error } = await supabase.rpc("aic_approve_compliance_rule", {
      p_rule_code: nyitottKod,
      p_note: null,
    });
    setMentesFolyik(false);
    if (error) {
      setUzenet(error.message);
      return;
    }
    setUzenet("");
    await szabalyMegnyitasa(nyitottKod);
    await listaFrissites();
  }

  async function szovegMentese() {
    if (szerkesztett === null) return;
    setMentesFolyik(true);
    const { error } = await supabase.rpc("aic_szabaly_mentese", {
      p_rule_code: nyitottKod,
      p_szoveg: szerkesztett,
      p_ertelmezes: null,
    });
    setMentesFolyik(false);
    if (error) {
      setUzenet(error.message);
      return;
    }
    setUzenet("");
    await szabalyMegnyitasa(nyitottKod);
    await listaFrissites();
  }

  const ossz = lista?.osszesites || {};
  const forrasok = lista?.forrasok || [];
  const ures = forrasok.length === 0;

  const szoveg = szerkesztett !== null ? szerkesztett : szabaly?.szoveg || "";
  const valtozott = szerkesztett !== null && szerkesztett !== (szabaly?.szoveg || "");
  const elsoAlap = szabaly?.jogalapok?.[0];

  return (
    <div className="jogtar">
      <header className="jogtar-fejlec">
        <div className="jogtar-fejlec-bal">
          <p className="jogtar-eyebrow">Jogtár · szabályok jóváhagyása</p>
          <h1>{szabaly?.cim || "Jogtár"}</h1>
          {elsoAlap && (
            <p className="jogtar-alcim">
              {elsoAlap.forras} · {helyJelolese(elsoAlap.cikk, elsoAlap.bekezdes)}
            </p>
          )}
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
            className={reteg === "mind" ? "jogtar-chip is-active" : "jogtar-chip"}
            onClick={() => setReteg("mind")}
          >
            Mind
          </button>
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
        </div>

        <div className="jogtar-szuro-csoport">
          <select
            aria-label="Szerepkör"
            value={szerepkor}
            onChange={(e) => setSzerepkor(e.target.value)}
          >
            {SZEREPKOROK.map(([ertek, cimke]) => (
              <option key={cimke} value={ertek}>{cimke}</option>
            ))}
          </select>
          <select
            aria-label="Állapot"
            value={allapot}
            onChange={(e) => setAllapot(e.target.value)}
          >
            {ALLAPOTOK.map(([ertek, cimke]) => (
              <option key={ertek} value={ertek}>{cimke}</option>
            ))}
          </select>
        </div>
      </div>

      {uzenet && <p className="jogtar-uzenet" role="alert">{uzenet}</p>}

      <div className="jogtar-torzs">
        <nav className="jogtar-nav" aria-label="Szabályok">
          {ures && <p className="jogtar-ures">Ehhez a szűréshez nincs szabály.</p>}
          {forrasok.map((f) => (
            <section key={f.forras}>
              <p className="jogtar-nav-forras">{f.forras}</p>
              {(f.szabalyok || []).map((sz) => (
                <button
                  key={sz.rule_code}
                  type="button"
                  className={
                    nyitottKod === sz.rule_code
                      ? "jogtar-nav-szabaly is-active"
                      : "jogtar-nav-szabaly"
                  }
                  onClick={() => szabalyMegnyitasa(sz.rule_code)}
                >
                  <span className="jogtar-nav-cim">{sz.cim}</span>
                  <span className="jogtar-nav-meta">
                    {helyJelolese(sz.cikk, sz.bekezdes)} · {SZEREP_CIMKE[sz.szerep] || sz.szerep}
                  </span>
                  {sz.jovahagyva && <span className="jogtar-nav-pipa">jóváhagyva</span>}
                </button>
              ))}
            </section>
          ))}
        </nav>

        <article className="jogtar-tartalom">
          {betolt && <p className="jogtar-ures">Betöltés…</p>}

          {!betolt && ures && (
            <div className="jogtar-nincs-talalat">
              <p className="jogtar-blokkcim">Ehhez a szűréshez nincs szabály</p>
              <p>
                {reteg !== "torzs" && reteg !== "mind" && szerepkor
                  ? `Az ágazati jog azt kötelezi, aki az adott ágazatban engedélyes — ez a rendszer üzemeltetője. A(z) ${
                      SZEREPKOROK.find(([k]) => k === szerepkor)?.[1] || szerepkor
                    } kötelezettségei az MI-rendeletből és a GDPR-ból erednek: válts a Törzs rétegre.`
                  : "Válts réteget, szerepkört vagy állapotot."}
              </p>
            </div>
          )}

          {!betolt && szabaly && (
            <>
              {szabaly.jovahagyva && (
                <p className="jogtar-allapotsav">
                  Jóváhagyva · {datum(szabaly.jovahagyva_mikor)}
                </p>
              )}

              <section className="jogtar-blokk">
                <p className="jogtar-blokkcim">Az előírás</p>
                {szabaly.osszefoglalo && (
                  <p className="jogtar-osszefoglalo">{szabaly.osszefoglalo}</p>
                )}
                <textarea
                  className="jogtar-szoveg"
                  value={szoveg}
                  rows={Math.min(16, Math.max(4, Math.ceil((szoveg || "").length / 88)))}
                  disabled={!dontheto || mentesFolyik}
                  onChange={(e) => setSzerkesztett(e.target.value)}
                />
                <p className="jogtar-meta">
                  Kit köt: {SZEREP_CIMKE[szabaly.szerep] || szabaly.szerep}
                  {szabaly.verzio ? ` · verzió ${szabaly.verzio}` : ""}
                  {szabaly.hatalyos_tol && new Date(szabaly.hatalyos_tol) > new Date()
                    ? ` · ${datum(szabaly.hatalyos_tol)} napjától alkalmazandó`
                    : ""}
                </p>
              </section>

              {(szabaly.kapcsolok || []).length > 0 && (
                <section className="jogtar-blokk">
                  <p className="jogtar-blokkcim">Akkor lép be, ha az eszközre igaz</p>
                  <div className="jogtar-kapcsolok">
                    {szabaly.kapcsolok.map((k) => (
                      <span key={k.kulcs} title={k.kerdes || ""}>{k.nev}</span>
                    ))}
                  </div>
                </section>
              )}

              {(szabaly.teendok || []).length > 0 && (
                <section className="jogtar-blokk">
                  <p className="jogtar-blokkcim">Amit el kell végezni</p>
                  <ul className="jogtar-teendok">
                    {szabaly.teendok.map((t, i) => (
                      <li key={i}>
                        <strong>{t.cim}</strong>
                        {t.leiras && <span>{t.leiras}</span>}
                      </li>
                    ))}
                  </ul>
                </section>
              )}

              <section className="jogtar-blokk">
                <p className="jogtar-blokkcim">Jogalap</p>
                {(szabaly.jogalapok || []).map((alap, i) => {
                  const kulcs = `${alap.cikk}-${i}`;
                  const nyitva = nyitottSzakasz === kulcs;
                  const tobbi = alap.tobbi || [];
                  const hivatkozott = alap.hivatkozott || [];
                  return (
                    <div key={kulcs} className="jogtar-jogalap">
                      <p className="jogtar-jogalap-fej">
                        {alap.forras} · {helyJelolese(alap.cikk, alap.bekezdes)}
                      </p>
                      {alap.fejlec && <p className="jogtar-jogalap-cim">{alap.fejlec}</p>}

                      {hivatkozott.length > 0
                        ? hivatkozott.map((b) => (
                            <div key={b.bekezdes}>
                              {tordel(b.szoveg).map((resz, j) => (
                                <p key={j} className="jogtar-torvenyszoveg">
                                  {j === 0 && (
                                    <span className="jogtar-bekezdesjel">({b.bekezdes})</span>
                                  )}{" "}
                                  {resz}
                                </p>
                              ))}
                            </div>
                          ))
                        : tordel(alap.kivonat || alap.teljes_szoveg).map((resz, j) => (
                            <p key={j} className="jogtar-torvenyszoveg">{resz}</p>
                          ))}

                      {tobbi.length > 0 && (
                        <>
                          <button
                            type="button"
                            className="jogtar-tobbi-gomb"
                            aria-expanded={nyitva}
                            onClick={() => setNyitottSzakasz(nyitva ? null : kulcs)}
                          >
                            {nyitva
                              ? "A szakasz többi bekezdésének elrejtése"
                              : `A szakasz többi bekezdése (${tobbi.length}) — nem ebből ered az előírás`}
                          </button>
                          {nyitva &&
                            tobbi.map((b) => (
                              <p key={b.bekezdes} className="jogtar-torvenyszoveg is-halvany">
                                <span className="jogtar-bekezdesjel">({b.bekezdes})</span>{" "}
                                {b.szoveg}
                              </p>
                            ))}
                        </>
                      )}

                      {alap.melylink && (
                        <a
                          className="jogtar-forraslink"
                          href={alap.melylink}
                          target="_blank"
                          rel="noreferrer"
                        >
                          Hivatalos szöveg ↗
                        </a>
                      )}
                    </div>
                  );
                })}

                {(szabaly.tamogato || []).length > 0 && (
                  <p className="jogtar-tamogato">
                    Támogató hivatkozás:{" "}
                    {szabaly.tamogato
                      .map((t) => `${t.forras} ${helyJelolese(t.cikk, t.bekezdes)}`)
                      .join(" · ")}
                  </p>
                )}
              </section>

              {szabaly.ertelmezes && (
                <section className="jogtar-blokk">
                  <p className="jogtar-blokkcim">Jogászi értelmezés</p>
                  <p className="jogtar-ertelmezes">{szabaly.ertelmezes}</p>
                </section>
              )}

              {dontheto ? (
                <div className="jogtar-dontes">
                  <button
                    type="button"
                    className="jogtar-gomb-elsodleges"
                    disabled={mentesFolyik || valtozott || szabaly.jovahagyva}
                    onClick={jovahagyas}
                  >
                    {szabaly.jovahagyva
                      ? "Jóváhagyva"
                      : mentesFolyik
                        ? "Mentés…"
                        : "Jóváhagyom"}
                  </button>
                  <button
                    type="button"
                    disabled={!valtozott || mentesFolyik}
                    onClick={szovegMentese}
                  >
                    Módosítás mentése
                  </button>
                  {valtozott && (
                    <span className="jogtar-figyelmeztetes">
                      Módosítottad — előbb mentsd, utána hagyhatod jóvá.
                    </span>
                  )}
                </div>
              ) : (
                <p className="jogtar-figyelmeztetes">
                  A jóváhagyás jogász vagy tulajdonos jogosultsághoz kötött.
                </p>
              )}
            </>
          )}
        </article>
      </div>
    </div>
  );
}
