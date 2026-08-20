"use client";

import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "../../../lib/supabase/client";

// Egy kártya, egy kérdés. Válasz után a kártya felfelé kicsúszik, a következő
// alulról érkezik. A kérdéssort a kapcsolókatalógus adja: a szerepkör dönti el,
// mit kérdezünk, a korábbi válaszok pedig kiváltják a követő kérdéseket.

const SZEREPKOROK = [
  ["deployer", "Használjuk", "A szervezet saját felelősségére üzemelteti."],
  ["provider", "Mi fejlesztjük", "Fejlesztjük, fejlesztetjük, vagy saját néven hozzuk forgalomba."],
  ["importer", "Importáljuk", "Unión kívüli szolgáltató rendszerét hozzuk az uniós piacra."],
  ["distributor", "Továbbadjuk", "Továbbforgalmazzuk, de nem mi fejlesztettük és nem mi importáljuk."],
  ["authorised_representative", "Képviseljük", "Unión kívüli szolgáltatót képviselünk írásbeli megbízás alapján."],
];

export default function NewSystemForm({
  organisationId,
  organisationIndustry,
  industries,
  systemTypes,
}) {
  const router = useRouter();
  const supabase = useMemo(() => createClient(), []);

  const [nev, setNev] = useState("");
  const [tipusKod, setTipusKod] = useState("");
  const [iparag, setIparag] = useState(organisationIndustry || "general");
  const [rendeltetes, setRendeltetes] = useState("");
  const [szerepkorok, setSzerepkorok] = useState([]);
  const [valaszok, setValaszok] = useState({});

  const [kerdesek, setKerdesek] = useState([]);
  const [csoportok, setCsoportok] = useState([]);
  const [elonezet, setElonezet] = useState(null);
  const [uzenet, setUzenet] = useState("");
  const [mentes, setMentes] = useState(false);

  const [lepes, setLepes] = useState(0);
  const [irany, setIrany] = useState("elore");

  // A kérdéseket a szerver adja, a válaszok minden változásánál újra. Így a
  // követő kérdések ott jelennek meg, ahol kell, és a felület nem dönt semmit.
  const idozito = useRef(null);
  const frissit = useCallback(async () => {
    if (!tipusKod || szerepkorok.length === 0) {
      setKerdesek([]);
      setElonezet(null);
      return;
    }
    const [{ data: k, error: kh }, { data: e }] = await Promise.all([
      supabase.rpc("aic_felviteli_kerdesek", {
        p_system_type_code: tipusKod,
        p_valaszok: valaszok,
        p_iparag: iparag,
        p_szerepkorok: szerepkorok,
      }),
      supabase.rpc("aic_felvitel_elonezet", {
        p_organisation_id: organisationId,
        p_system_type_code: tipusKod,
        p_valaszok: valaszok,
        p_szerepkorok: szerepkorok,
        p_iparag: iparag,
      }),
    ]);
    if (kh) {
      setUzenet(kh.message);
      return;
    }
    setUzenet("");
    setKerdesek(k?.kerdesek || []);
    setCsoportok(k?.csoportok || []);
    setElonezet(e || null);
  }, [supabase, tipusKod, valaszok, iparag, szerepkorok, organisationId]);

  useEffect(() => {
    if (idozito.current) clearTimeout(idozito.current);
    idozito.current = setTimeout(frissit, 200);
    return () => clearTimeout(idozito.current);
  }, [frissit]);

  // A kártyák sora: négy alapadat, a szerepkör, majd a kérdéscsoportok.
  const kartyak = useMemo(() => {
    const lista = [
      { fajta: "nev" },
      { fajta: "tipus" },
      { fajta: "iparag" },
      { fajta: "szerepkor" },
    ];
    if (!tipusKod || szerepkorok.length === 0) return lista;

    const csoportSorrend = new Map(csoportok.map((c) => [c.csoport, c]));
    const beosztva = new Map();
    const onalloak = [];

    for (const k of kerdesek) {
      if (k.csoport) {
        if (!beosztva.has(k.csoport)) beosztva.set(k.csoport, []);
        beosztva.get(k.csoport).push(k);
      } else {
        onalloak.push(k);
      }
    }

    const csoportKartyak = [...beosztva.entries()]
      .map(([csoport, tetelek]) => ({
        fajta: "csoport",
        csoport,
        fej: csoportSorrend.get(csoport) || { cim: "Kérdések" },
        tetelek,
        sorrend: csoportSorrend.get(csoport)?.sorrend ?? 100,
      }))
      .sort((a, b) => a.sorrend - b.sorrend);

    return [
      ...lista,
      ...csoportKartyak,
      ...onalloak.map((k) => ({ fajta: "kerdes", kerdes: k })),
      { fajta: "rendeltetes" },
      { fajta: "osszegzes" },
    ];
  }, [kerdesek, csoportok, tipusKod, szerepkorok]);

  const aktualis = kartyak[Math.min(lepes, kartyak.length - 1)];
  const utolso = lepes >= kartyak.length - 1;

  const tovabbLehet = useMemo(() => {
    if (!aktualis) return false;
    if (aktualis.fajta === "nev") return nev.trim().length > 0;
    if (aktualis.fajta === "tipus") return !!tipusKod;
    if (aktualis.fajta === "szerepkor") return szerepkorok.length > 0;
    return true;
  }, [aktualis, nev, tipusKod, szerepkorok]);

  function tovabb() {
    if (!tovabbLehet || utolso) return;
    setIrany("elore");
    setLepes((l) => l + 1);
  }

  function vissza() {
    if (lepes === 0) return;
    setIrany("vissza");
    setLepes((l) => l - 1);
  }

  function valaszValt(kulcs, ertek) {
    setValaszok((elozo) => ({ ...elozo, [kulcs]: ertek }));
  }

  // "Egyiket sem": a csoport minden tétele nemre áll, és lépünk tovább.
  function egyikSem(tetelek) {
    setValaszok((elozo) => {
      const uj = { ...elozo };
      tetelek.forEach((t) => { uj[t.kulcs] = false; });
      return uj;
    });
    setTimeout(tovabb, 120);
  }

  function szerepkorValt(kod) {
    setSzerepkorok((elozo) =>
      elozo.includes(kod) ? elozo.filter((x) => x !== kod) : [...elozo, kod]
    );
  }

  // Enter visz tovább, kivéve a hosszú szöveges mezőben.
  useEffect(() => {
    function billentyu(e) {
      if (e.key === "Enter" && !e.shiftKey && aktualis?.fajta !== "rendeltetes") {
        e.preventDefault();
        if (utolso) mentesKezelese();
        else tovabb();
      }
      if (e.key === "Escape") vissza();
    }
    window.addEventListener("keydown", billentyu);
    return () => window.removeEventListener("keydown", billentyu);
  });

  async function mentesKezelese() {
    const tisztaNev = nev.trim().replace(/\s+/g, " ");
    if (!tisztaNev || !tipusKod || szerepkorok.length === 0) return;

    setMentes(true);
    const { data, error } = await supabase.rpc("aic_eszkoz_mentese", {
      p_organisation_id: organisationId,
      p_nev: tisztaNev,
      p_system_type_code: tipusKod,
      p_valaszok: valaszok,
      p_szerepkorok: szerepkorok,
      p_rendeltetes: rendeltetes.trim() || null,
      p_system_id: null,
    });
    setMentes(false);

    if (error?.code === "23505") {
      setUzenet(`A szervezetnél már létezik „${tisztaNev}" nevű MI-rendszer.`);
      return;
    }
    if (error) {
      setUzenet(error.message || "A mentés nem sikerült.");
      return;
    }
    router.push(`/rendszerek/${data.system_id}`);
    router.refresh();
  }

  const kivalasztottTipus = systemTypes.find((t) => t.type_code === tipusKod);

  return (
    <div className="felvitel">
      <div className="felvitel-halado">
        <div
          className="felvitel-halado-sav"
          style={{ width: `${((lepes + 1) / kartyak.length) * 100}%` }}
        />
      </div>
      <p className="felvitel-lepesszam">
        {lepes + 1} / {kartyak.length}
      </p>

      <div className="felvitel-szinpad">
        <section
          key={`${lepes}-${aktualis?.fajta}-${aktualis?.csoport || ""}`}
          className={irany === "elore" ? "felvitel-kartya be-elore" : "felvitel-kartya be-vissza"}
        >
          {aktualis?.fajta === "nev" && (
            <>
              <h2>Mi a rendszer neve?</h2>
              <p className="felvitel-sugo">Ahogy a szervezeten belül hívjátok.</p>
              <input
                autoFocus
                className="felvitel-mezo"
                value={nev}
                placeholder="Például: EnergiaChat"
                onChange={(e) => setNev(e.target.value)}
              />
            </>
          )}

          {aktualis?.fajta === "tipus" && (
            <>
              <h2>Milyen típusú rendszer?</h2>
              <p className="felvitel-sugo">A típus csak a kérdések szűkítésére szolgál.</p>
              <div className="felvitel-valasztek">
                {systemTypes.map((t) => (
                  <button
                    key={t.type_code}
                    type="button"
                    className={tipusKod === t.type_code ? "felvitel-opcio is-aktiv" : "felvitel-opcio"}
                    onClick={() => { setTipusKod(t.type_code); setValaszok({}); }}
                  >
                    <strong>{t.name_hu}</strong>
                    {t.description_hu && <em>{t.description_hu}</em>}
                  </button>
                ))}
              </div>
              {kivalasztottTipus && (
                <p className="felvitel-sugo">Kiválasztva: {kivalasztottTipus.name_hu}</p>
              )}
            </>
          )}

          {aktualis?.fajta === "iparag" && (
            <>
              <h2>Melyik területen használják?</h2>
              <p className="felvitel-sugo">Az ágazati előírások ettől függenek.</p>
              <div className="felvitel-valasztek">
                {industries.map((i) => (
                  <button
                    key={i.code}
                    type="button"
                    className={iparag === i.code ? "felvitel-opcio is-aktiv" : "felvitel-opcio"}
                    onClick={() => setIparag(i.code)}
                  >
                    <strong>{i.name_hu}</strong>
                  </button>
                ))}
              </div>
            </>
          )}

          {aktualis?.fajta === "szerepkor" && (
            <>
              <h2>Milyen minőségben jártok el?</h2>
              <p className="felvitel-sugo">
                Több is lehet. Ez dönti el, milyen kötelezettségek terhelnek, és mit kérdezünk.
              </p>
              <div className="felvitel-valasztek">
                {SZEREPKOROK.map(([kod, cimke, leiras]) => (
                  <button
                    key={kod}
                    type="button"
                    className={szerepkorok.includes(kod) ? "felvitel-opcio is-aktiv" : "felvitel-opcio"}
                    onClick={() => szerepkorValt(kod)}
                    aria-pressed={szerepkorok.includes(kod)}
                  >
                    <strong>{cimke}</strong>
                    <em>{leiras}</em>
                  </button>
                ))}
              </div>
            </>
          )}

          {aktualis?.fajta === "csoport" && (
            <>
              <h2>{aktualis.fej.cim}</h2>
              {aktualis.fej.leiras && <p className="felvitel-sugo">{aktualis.fej.leiras}</p>}
              <div className="felvitel-pipak">
                {aktualis.tetelek.map((t) => (
                  <label
                    key={t.kulcs}
                    className={valaszok[t.kulcs] === true ? "felvitel-pipa is-aktiv" : "felvitel-pipa"}
                  >
                    <input
                      type="checkbox"
                      checked={valaszok[t.kulcs] === true}
                      onChange={(e) => valaszValt(t.kulcs, e.target.checked)}
                    />
                    <span>
                      <strong>{t.nev}</strong>
                      {t.magyarazat && <em>{t.magyarazat}</em>}
                    </span>
                  </label>
                ))}
              </div>
              <button
                type="button"
                className="felvitel-egyiksem"
                onClick={() => egyikSem(aktualis.tetelek)}
              >
                {aktualis.fej.nincs_egyik_cimke || "Egyiket sem"}
              </button>
            </>
          )}

          {aktualis?.fajta === "kerdes" && (
            <>
              <h2>{aktualis.kerdes.kerdes || aktualis.kerdes.nev}</h2>
              {aktualis.kerdes.magyarazat && (
                <p className="felvitel-sugo">{aktualis.kerdes.magyarazat}</p>
              )}
              <div className="felvitel-igennem">
                <button
                  type="button"
                  className={valaszok[aktualis.kerdes.kulcs] === true ? "felvitel-opcio is-aktiv" : "felvitel-opcio"}
                  onClick={() => { valaszValt(aktualis.kerdes.kulcs, true); setTimeout(tovabb, 120); }}
                >
                  <strong>Igen</strong>
                </button>
                <button
                  type="button"
                  className={valaszok[aktualis.kerdes.kulcs] === false ? "felvitel-opcio is-aktiv" : "felvitel-opcio"}
                  onClick={() => { valaszValt(aktualis.kerdes.kulcs, false); setTimeout(tovabb, 120); }}
                >
                  <strong>Nem</strong>
                </button>
              </div>
            </>
          )}

          {aktualis?.fajta === "rendeltetes" && (
            <>
              <h2>Mi a rendszer rendeltetése?</h2>
              <p className="felvitel-sugo">
                Ez a mondat szó szerint bekerül a szabályzatba. Enter helyett a Tovább gomb visz előre.
              </p>
              <textarea
                autoFocus
                className="felvitel-mezo felvitel-hosszu"
                rows={4}
                value={rendeltetes}
                placeholder="Például: beérkező dokumentumok osztályozása és az ügyintéző támogatása."
                onChange={(e) => setRendeltetes(e.target.value)}
              />
            </>
          )}

          {aktualis?.fajta === "osszegzes" && (
            <>
              <h2>{nev || "A rendszer"}</h2>
              <p className="felvitel-sugo">Ez következik a válaszokból.</p>
              <div className="felvitel-osszegzes">
                <div>
                  <span>Besorolás</span>
                  <strong>
                    {elonezet?.nagy_kockazatu ? "Nagy kockázatú" : "Nem nagy kockázatú"}
                  </strong>
                </div>
                <div>
                  <span>Alkalmazandó előírás</span>
                  <strong>{elonezet?.szabaly_szam ?? 0}</strong>
                </div>
                <div>
                  <span>Ebből jóváhagyott</span>
                  <strong>{elonezet?.jovahagyott_szabaly ?? 0}</strong>
                </div>
              </div>
              {elonezet?.besorolas_indok && (
                <p className="felvitel-indok">{elonezet.besorolas_indok}</p>
              )}
            </>
          )}
        </section>
      </div>

      {uzenet && <p className="felvitel-uzenet" role="alert">{uzenet}</p>}

      <div className="felvitel-lab">
        <button type="button" className="felvitel-vissza" onClick={vissza} disabled={lepes === 0}>
          Vissza
        </button>

        {utolso ? (
          <button
            type="button"
            className="felvitel-tovabb"
            onClick={mentesKezelese}
            disabled={mentes}
          >
            {mentes ? "Mentés…" : "Rendszer mentése"}
          </button>
        ) : (
          <button
            type="button"
            className="felvitel-tovabb"
            onClick={tovabb}
            disabled={!tovabbLehet}
          >
            Tovább
          </button>
        )}

        {elonezet && lepes > 3 && (
          <span className="felvitel-futo">
            {elonezet.szabaly_szam} előírás
            {elonezet.nagy_kockazatu ? " · nagy kockázatú" : ""}
          </span>
        )}
      </div>
    </div>
  );
}
