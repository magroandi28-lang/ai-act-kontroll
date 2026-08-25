"use client";

import { useCallback, useEffect, useMemo, useState } from "react";
import { createClient } from "../../lib/supabase/client";

// Egy képernyő, egy döntés. A szabály a főszöveg; a törvény bizonyíték, ezért
// alapból összecsukva áll, és bekezdésenként nyitható. A döntési gombok az
// ablak aljára ragadnak, hogy hosszú szabálynál se kelljen görgetni értük.

const ALLAPOTOK = [
  ["jovahagyasra_var", "Jóváhagyásra vár"],
  ["felulvizsgalando", "Változás miatt felülvizsgálandó"],
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

function helyJelolese(cikk, bekezdes) {
  if (!cikk) return "";
  const szam = /^\d/.test(cikk) ? `${cikk}. §` : cikk;
  return bekezdes ? `${szam} (${bekezdes})` : szam;
}

// Az első mondat a bekezdésből – ennyi látszik összecsukva.
function elsoMondat(szoveg, hossz = 110) {
  if (!szoveg) return "";
  const tiszta = szoveg.replace(/\s+/g, " ").trim();
  if (tiszta.length <= hossz) return tiszta;
  return tiszta.slice(0, hossz).replace(/\s\S*$/, "") + "…";
}


// Szóalapú összehasonlítás: a két szöveget egyetlen folyamban mutatjuk, a
// törölt részt áthúzva, az újat kiemelve. Kétszer kiírni a teljes bekezdést
// olvashatatlan, mert a szöveg nagy része azonos.
function osszehasonlitas(regi, uj) {
  const a = (regi || "").split(/(\s+)/);
  const b = (uj || "").split(/(\s+)/);

  // Közös eleje
  let elol = 0;
  while (elol < a.length && elol < b.length && a[elol] === b[elol]) elol += 1;

  // Közös vége
  let hatul = 0;
  while (
    hatul < a.length - elol &&
    hatul < b.length - elol &&
    a[a.length - 1 - hatul] === b[b.length - 1 - hatul]
  ) hatul += 1;

  return {
    elotte: a.slice(0, elol).join(""),
    torolt: a.slice(elol, a.length - hatul).join(""),
    uj: b.slice(elol, b.length - hatul).join(""),
    utana: a.slice(a.length - hatul).join(""),
  };
}

export default function JogtarView({ kezdoLista, iparagak, dontheto }) {
  const supabase = useMemo(() => createClient(), []);

  const [lista, setLista] = useState(kezdoLista);
  const [reteg, setReteg] = useState("mind");
  const [szerepkor, setSzerepkor] = useState("");
  // Belépéskor a jóváhagyott jogszabályok látszanak, mert azokból van tartalom:
  // korábban a „Jóváhagyásra vár" volt az alapállapot, és üres képernyő fogadta
  // azt, aki nem állította át. A munkalista egy kattintás az Állapot legördülőben.
  const [allapot, setAllapot] = useState("jovahagyott");
  const [kereses, setKereses] = useState("");
  const [keresesMezo, setKeresesMezo] = useState("");

  const [nyitottKod, setNyitottKod] = useState(null);
  const [szabaly, setSzabaly] = useState(null);
  const [betolt, setBetolt] = useState(false);
  const [uzenet, setUzenet] = useState("");

  const [szoveg, setSzoveg] = useState(null);
  const [indokolas, setIndokolas] = useState(null);
  const [mentesFolyik, setMentesFolyik] = useState(false);
  const [nyitottBekezdes, setNyitottBekezdes] = useState({});
  const [nyitottJogalap, setNyitottJogalap] = useState({});

  const valodiIparagak = useMemo(
    () => (iparagak || []).filter((i) => !["general", "all", "any"].includes(i.code)),
    [iparagak]
  );

  // A keresés gépelés közben ne indítson lekérdezést minden betűre.
  useEffect(() => {
    const t = setTimeout(() => setKereses(keresesMezo), 300);
    return () => clearTimeout(t);
  }, [keresesMezo]);

  const listaFrissites = useCallback(async () => {
    const { data, error } = await supabase.rpc("aic_jogtar_szabalyok", {
      p_reteg: reteg,
      p_szerepkor: szerepkor || null,
      p_allapot: allapot,
      p_kereses: kereses || null,
    });
    if (error) {
      setUzenet(error.message);
      return;
    }
    setUzenet("");
    setLista(data);
  }, [supabase, reteg, szerepkor, allapot, kereses]);

  useEffect(() => {
    listaFrissites();
  }, [listaFrissites]);

  const szabalyMegnyitasa = useCallback(
    async (ruleCode) => {
      setNyitottKod(ruleCode);
      setBetolt(true);
      setSzoveg(null);
      setIndokolas(null);
      setNyitottBekezdes({});
      setNyitottJogalap({});
      const { data, error } = await supabase.rpc("aic_jogtar_szabaly", {
        p_rule_code: ruleCode,
      });
      setBetolt(false);
      if (error) {
        setUzenet(error.message);
        return;
      }
      setSzabaly(data);
      if (typeof window !== "undefined") window.scrollTo({ top: 0 });
    },
    [supabase]
  );

  const sorrend = useMemo(() => lista?.sorrend || [], [lista]);

  // Szűrőváltás után a megnyitott szabály kikerülhet a listából. Ilyenkor a
  // következő függőben lévőt nyitjuk, nem hagyunk oda nem illő szabályt bent.
  useEffect(() => {
    if (nyitottKod && !sorrend.includes(nyitottKod)) {
      setNyitottKod(null);
      setSzabaly(null);
      return;
    }
    if (!nyitottKod && sorrend.length > 0) {
      szabalyMegnyitasa(sorrend[0]);
    }
  }, [sorrend, nyitottKod, szabalyMegnyitasa]);

  const kovetkezoFuggo = useCallback(() => {
    const jovahagyottak = new Set();
    (lista?.forrasok || []).forEach((f) =>
      (f.szabalyok || []).forEach((sz) => sz.jovahagyva && jovahagyottak.add(sz.rule_code))
    );
    const kezdet = sorrend.indexOf(nyitottKod);
    for (let i = kezdet + 1; i < sorrend.length; i += 1) {
      if (!jovahagyottak.has(sorrend[i])) return sorrend[i];
    }
    return sorrend.find((k) => !jovahagyottak.has(k) && k !== nyitottKod) || null;
  }, [lista, sorrend, nyitottKod]);

  async function mentes({ jovahagyas }) {
    setMentesFolyik(true);
    const { error } = await supabase.rpc("aic_szabaly_mentese", {
      p_rule_code: nyitottKod,
      p_szoveg: szoveg,
      p_indokolas: indokolas,
      p_jovahagyas: jovahagyas,
    });
    setMentesFolyik(false);
    if (error) {
      setUzenet(error.message);
      return;
    }
    setUzenet("");
    const kovetkezo = jovahagyas ? kovetkezoFuggo() : null;
    await listaFrissites();
    if (kovetkezo) {
      await szabalyMegnyitasa(kovetkezo);
    } else {
      await szabalyMegnyitasa(nyitottKod);
    }
  }

  const ossz = lista?.osszesites || {};
  const forrasok = lista?.forrasok || [];
  const ures = forrasok.length === 0;

  const aktSzoveg = szoveg !== null ? szoveg : szabaly?.szoveg || "";
  const aktIndokolas = indokolas !== null ? indokolas : szabaly?.indokolas || "";
  const valtozott =
    (szoveg !== null && szoveg !== (szabaly?.szoveg || "")) ||
    (indokolas !== null && indokolas !== (szabaly?.indokolas || ""));

  const helyzet = nyitottKod ? sorrend.indexOf(nyitottKod) + 1 : 0;
  const elsoAlap = szabaly?.jogalapok?.[0];

  return (
    <div className="jogtar">
      <header className="jogtar-fejlec">
        <div className="jogtar-fejlec-bal">
          <p className="jogtar-eyebrow">Jogtár</p>
          <h1>{szabaly?.cim || "Jogtár"}</h1>
          {elsoAlap && (
            <p className="jogtar-alcim">
              {elsoAlap.forras} · {helyJelolese(elsoAlap.cikk, elsoAlap.bekezdes)}
            </p>
          )}
        </div>
        <div className="jogtar-szamlalo">
          {helyzet > 0 && (
            <span className="jogtar-helyzet">
              {helyzet}. a {ossz.szabaly ?? 0}-ból
            </span>
          )}
          <span>Jóváhagyva</span>
          <strong>
            {ossz.jovahagyott ?? 0} <em>/ {ossz.szabaly ?? 0}</em>
          </strong>
        </div>
      </header>

      <div className="jogtar-szurok">
        <div className="jogtar-szuro-csoport">
          {[["mind", "Mind"], ["torzs", "Törzs"]].map(([ertek, cimke]) => (
            <button
              key={ertek}
              type="button"
              className={reteg === ertek ? "jogtar-chip is-active" : "jogtar-chip"}
              onClick={() => setReteg(ertek)}
            >
              {cimke}
            </button>
          ))}
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
          <input
            className="jogtar-kereso"
            type="search"
            value={keresesMezo}
            placeholder="Keresés: cím, jogszabályhely, szöveg"
            onChange={(e) => setKeresesMezo(e.target.value)}
          />
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
                  className={[
                    "jogtar-nav-szabaly",
                    nyitottKod === sz.rule_code ? "is-active" : "",
                    sz.jovahagyva ? "is-kesz" : "",
                    sz.felulvizsgalando ? "is-valtozott" : "",
                  ].join(" ").trim()}
                  onClick={() => szabalyMegnyitasa(sz.rule_code)}
                >
                  <span className="jogtar-nav-cim">{sz.cim}</span>
                  <span className="jogtar-nav-meta">
                    {helyJelolese(sz.cikk, sz.bekezdes)} · {SZEREP_CIMKE[sz.szerep] || sz.szerep}
                  </span>
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
                {kereses
                  ? `A keresésre („${kereses}") nincs találat ebben a szűrésben.`
                  : reteg !== "torzs" && reteg !== "mind" && szerepkor
                    ? `Az ágazati jog azt kötelezi, aki az adott ágazatban engedélyes — ez a rendszer üzemeltetője. A(z) ${
                        SZEREPKOROK.find(([k]) => k === szerepkor)?.[1] || szerepkor
                      } kötelezettségei az MI-rendeletből és a GDPR-ból erednek: válts a Törzs rétegre.`
                    : "Válts réteget, szerepkört vagy állapotot."}
              </p>
            </div>
          )}

          {!betolt && szabaly && (
            <>
              {szabaly.valtozas && (() => {
                const d = osszehasonlitas(
                  szabaly.valtozas.regi_szoveg,
                  szabaly.valtozas.uj_szoveg
                );
                return (
                  <section className="jogtar-valtozas">
                    <p className="jogtar-valtozas-fej">
                      A jogalap megváltozott — {szabaly.valtozas.forras}{" "}
                      {helyJelolese(szabaly.valtozas.cikk, null)} ·{" "}
                      {datum(szabaly.valtozas.mikor)}
                    </p>

                    <p className="jogtar-valtozas-szoveg">
                      <span className="jogtar-valtozatlan">{d.elotte}</span>
                      {d.torolt && <del>{d.torolt}</del>}
                      {d.uj && <ins>{d.uj}</ins>}
                      <span className="jogtar-valtozatlan">{d.utana}</span>
                    </p>

                    <p className="jogtar-valtozas-labjegyzet">
                      Áthúzva a törölt, kiemelve az új szövegrész. A halvány rész
                      változatlan. A jóváhagyás a hatályos szövegre szól.
                    </p>
                  </section>
                );
              })()}

              {szabaly.jovahagyva && (
                <p className="jogtar-allapotsav">
                  Jóváhagyva · {datum(szabaly.jovahagyva_mikor)}
                </p>
              )}

              <section className="jogtar-blokk">
                {szabaly.osszefoglalo && (
                  <p className="jogtar-osszefoglalo">{szabaly.osszefoglalo}</p>
                )}
                <textarea
                  className="jogtar-szoveg"
                  value={aktSzoveg}
                  rows={Math.min(18, Math.max(5, Math.ceil((aktSzoveg || "").length / 80)))}
                  disabled={!dontheto || mentesFolyik}
                  onChange={(e) => setSzoveg(e.target.value)}
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

              <section className="jogtar-blokk">
                <p className="jogtar-blokkcim">Jogalap</p>
                {(szabaly.jogalapok || []).map((alap, i) => {
                  const kulcs = `${alap.cikk}-${i}`;
                  const nyitva = !!nyitottJogalap[kulcs];
                  const hivatkozott = alap.hivatkozott || [];
                  const tobbi = alap.tobbi || [];
                  return (
                    <div key={kulcs} className="jogtar-jogalap">
                      <button
                        type="button"
                        className="jogtar-jogalap-fej"
                        aria-expanded={nyitva}
                        onClick={() =>
                          setNyitottJogalap((e) => ({ ...e, [kulcs]: !e[kulcs] }))
                        }
                      >
                        <span>
                          <strong>{alap.forras}</strong> · {helyJelolese(alap.cikk, alap.bekezdes)}
                          {alap.fejlec ? ` — ${alap.fejlec}` : ""}
                        </span>
                        <em>{nyitva ? "Bezár" : "Törvényszöveg"}</em>
                      </button>

                      {nyitva && (
                        <div className="jogtar-jogalap-torzs">
                          {hivatkozott.map((b) => (
                            <p key={b.bekezdes} className="jogtar-torvenyszoveg">
                              <span className="jogtar-bekezdesjel">({b.bekezdes})</span>{" "}
                              {b.szoveg}
                            </p>
                          ))}

                          {hivatkozott.length === 0 && alap.teljes_szoveg && (
                            <p className="jogtar-torvenyszoveg">{alap.teljes_szoveg}</p>
                          )}

                          {tobbi.length > 0 && (
                            <div className="jogtar-tobbi">
                              <p className="jogtar-tobbi-cim">
                                A szakasz további {tobbi.length} bekezdése — nem ebből ered az előírás
                              </p>
                              {tobbi.map((b) => {
                                const bk = `${kulcs}-${b.bekezdes}`;
                                const bnyitva = !!nyitottBekezdes[bk];
                                return (
                                  <button
                                    key={bk}
                                    type="button"
                                    className={
                                      bnyitva
                                        ? "jogtar-bekezdes is-nyitva"
                                        : "jogtar-bekezdes"
                                    }
                                    onClick={() =>
                                      setNyitottBekezdes((e) => ({ ...e, [bk]: !e[bk] }))
                                    }
                                  >
                                    <span className="jogtar-bekezdesjel">({b.bekezdes})</span>{" "}
                                    {bnyitva ? b.szoveg : elsoMondat(b.szoveg)}
                                  </button>
                                );
                              })}
                            </div>
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

              <section className="jogtar-blokk">
                <p className="jogtar-blokkcim">Jogi indokolás</p>
                {aktIndokolas || dontheto ? (
                  <textarea
                    className="jogtar-indokolas"
                    value={aktIndokolas}
                    rows={Math.min(10, Math.max(3, Math.ceil((aktIndokolas || "").length / 90)))}
                    disabled={!dontheto || mentesFolyik}
                    placeholder="Miért következik ez a jogszabályhelyből? Ez az indokolás a jóváhagyással együtt mentődik."
                    onChange={(e) => setIndokolas(e.target.value)}
                  />
                ) : (
                  <p className="jogtar-nincs-ertelmezes">
                    Ez a szabály a jogszabály szövegét adja vissza, nincs benne értelmezés.
                  </p>
                )}
              </section>

              <p className="jogtar-kovetkezmeny">
                {szabaly.erintett_rendszer > 0
                  ? `Ez a szabály jelenleg ${szabaly.erintett_rendszer} nyilvántartott rendszert érint.`
                  : "Jelenleg egyetlen nyilvántartott rendszert sem érint."}
              </p>
            </>
          )}
        </article>
      </div>

      {szabaly && !betolt && (
        <div className="jogtar-dontessav">
          <div className="jogtar-dontessav-belso">
            {dontheto ? (
              <>
                <button
                  type="button"
                  className="jogtar-gomb-elsodleges"
                  disabled={mentesFolyik}
                  onClick={() => mentes({ jovahagyas: true })}
                >
                  {mentesFolyik
                    ? "Mentés…"
                    : valtozott
                      ? "Mentés és jóváhagyás"
                      : szabaly.jovahagyva
                        ? "Jóváhagyva — tovább"
                        : "Jóváhagyom és tovább"}
                </button>
                <button
                  type="button"
                  disabled={!valtozott || mentesFolyik}
                  onClick={() => mentes({ jovahagyas: false })}
                >
                  Mentés jóváhagyás nélkül
                </button>
                {valtozott && (
                  <span className="jogtar-figyelmeztetes">Mentetlen módosítás</span>
                )}
              </>
            ) : (
              <span className="jogtar-figyelmeztetes">
                A jóváhagyás jogász vagy tulajdonos jogosultsághoz kötött.
              </span>
            )}
          </div>
        </div>
      )}
    </div>
  );
}
