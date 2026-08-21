"use client";

import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from '@/lib/supabase/client';

const SZEREPKOROK = [
  ["deployer", "Használjuk", "A szervezet saját felelősségére használja vagy üzemelteti."],
  ["provider", "Fejlesztjük vagy szolgáltatjuk", "Fejlesztjük, fejlesztetjük, vagy saját néven hozzuk forgalomba."],
  ["importer", "Importáljuk", "Unión kívüli szolgáltató rendszerét hozzuk az uniós piacra."],
  ["distributor", "Továbbadjuk", "Az uniós piacon továbbforgalmazzuk a rendszert."],
  ["authorised_representative", "Képviseljük", "Unión kívüli szolgáltatót képviselünk írásbeli megbízás alapján."],
];

const CSOPORT_CIMKEK = {
  contact: "Kapcsolat és kommunikáció",
  content_data: "Tartalom és adatok",
  decision: "Döntés és értékelés",
  development: "Fejlesztés és működtetés",
  sensitive: "Érzékeny működés",
  high_risk_use: "Használati környezet",
};

const KAPUK = [
  {
    key: "GATE_HUMAN_SERVICE",
    label: "Emberekkel kommunikál, ügyet kezel vagy ajánlatot ad?",
    description: "Ide tartozik az ügyfélszolgálat, a beadványfogadás, az ajánlás és az emberrel történő közvetlen kapcsolat.",
    group: "contact",
    round: 1,
    children: ["DIRECT_HUMAN_INTERACTION", "CASE_INTAKE_HANDLING", "OPERATES_CUSTOMER_SERVICE", "COMMERCIAL_PRACTICE"],
  },
  {
    key: "GATE_DECISION",
    label: "Személyeket vagy kritikus folyamatokat értékel, profiloz vagy döntést hoz?",
    description: "A döntéstámogatás, profilalkotás, tiltott működések és kiemelt használati környezetek közös kapuja.",
    group: "decision",
    round: 1,
    children: [
      "PROFILES_NATURAL_PERSONS", "AUTOMATED_DECISION", "SUBLIMINAL_MANIPULATION",
      "EXPLOITS_VULNERABILITY", "SOCIAL_SCORING", "CRIMINAL_RISK_PREDICTION",
      "USE_CRITICAL_INFRASTRUCTURE", "USE_EDUCATION", "USE_EMPLOYMENT",
      "USE_ESSENTIAL_SERVICES", "USE_LAW_ENFORCEMENT", "USE_MIGRATION_BORDER",
      "USE_JUSTICE_DEMOCRACY",
    ],
  },
  {
    key: "GATE_DATA_BIOMETRIC",
    label: "Személyes, biometrikus vagy használati adatot kezel?",
    description: "Csak érintettség esetén kérdezünk rá az adattípusokra, a célzott elemzésre és a biometrikus működésre.",
    group: "sensitive",
    round: 1,
    children: ["PROCESSES_PERSONAL_DATA", "ANALYTICS_OR_TARGETING", "FACE_SCRAPING", "EMOTION_RECOGNITION", "BIOMETRIC_CATEGORISATION", "REALTIME_REMOTE_BIOMETRIC_ID"],
  },
  {
    key: "GATE_CONTENT",
    label: "Tartalmat állít elő vagy módosít?",
    description: "Szöveg, kép, hang vagy videó létrehozása és átalakítása tartozik ide.",
    group: "content_data",
    round: 2,
    children: ["GENERATES_SYNTHETIC_CONTENT"],
  },
  {
    key: "GATE_DEVELOPMENT",
    label: "Modellt fejleszt, tanít, külső szolgáltatót használ vagy szabályozott termék részeként működik?",
    description: "A fejlesztési, tanítási, folyamatos tanulási, beszállítói és termékbiztonsági működés közös kapuja.",
    group: "development",
    round: 2,
    children: ["USES_EXTERNAL_PROVIDER", "TRAINS_OR_FINETUNES_MODEL", "CONTINUOUS_LEARNING", "ANNEX_I_PRODUCT"],
  },
];

const ENERGETIKAI_AG = {
  key: "GATE_ENERGY",
  label: "Érint energetikai ügyfélfolyamatot vagy mérési adatot?",
  description: "Ez az ág csak az energetikai iparág kiválasztása miatt jelenik meg.",
  group: "high_risk_use",
  round: 2,
  children: ["ENERGY_CUSTOMER_MATTERS", "SMART_METERING_DATA", "DATA_DISCLOSURE_ON_REQUEST"],
};

const FAZIS_SORREND = ["azonositas", "iparag", "szerepkor", "funkciok", "pontositas", "osszegzes"];
const MOZGAS_IDO = 260;
const HUZASI_KUSZOB = 86;

function sajatKulcs(objektum, kulcs) {
  return Object.prototype.hasOwnProperty.call(objektum, kulcs);
}

function megvalaszolt(tetel, valaszok) {
  if (!tetel || !sajatKulcs(valaszok, tetel.key)) return false;
  if (tetel.input === "multi") return Array.isArray(valaszok[tetel.key]);
  return typeof valaszok[tetel.key] === "boolean";
}

function opcioKod(opcio) {
  return opcio?.kod ?? opcio?.code ?? opcio?.value;
}

function opcioCimke(opcio) {
  return opcio?.cimke ?? opcio?.label ?? opcio?.nev ?? opcioKod(opcio);
}

function visszaallitas(aktualis, elozoErtekek) {
  const kovetkezo = { ...aktualis };
  Object.entries(elozoErtekek).forEach(([kulcs, elozo]) => {
    if (elozo.letezett) kovetkezo[kulcs] = elozo.ertek;
    else delete kovetkezo[kulcs];
  });
  return kovetkezo;
}

function elozoErtekek(valaszok, valtozasok) {
  return Object.fromEntries(Object.keys(valtozasok).map((kulcs) => [
    kulcs,
    { letezett: sajatKulcs(valaszok, kulcs), ertek: valaszok[kulcs] },
  ]));
}

function ReszletSzerkeszto({ tetelek, ertekek, onChange }) {
  return (
    <div className="felvitel-reszletek">
      {tetelek.map((tetel) => {
        const ertek = ertekek[tetel.key];
        if (tetel.input === "multi") {
          return (
            <fieldset className="felvitel-reszlet" key={tetel.key}>
              <legend>{tetel.question || tetel.label}</legend>
              {tetel.description && <p>{tetel.description}</p>}
              <div className="felvitel-chip-sor">
                {(tetel.options || []).map((opcio) => {
                  const kod = opcioKod(opcio);
                  const aktiv = Array.isArray(ertek) && ertek.includes(kod);
                  return (
                    <button
                      type="button"
                      key={kod}
                      className={aktiv ? "felvitel-chip is-aktiv" : "felvitel-chip"}
                      aria-pressed={aktiv}
                      onClick={() => {
                        const jelenlegi = Array.isArray(ertek) ? ertek : [];
                        onChange(tetel.key, aktiv
                          ? jelenlegi.filter((elem) => elem !== kod)
                          : [...jelenlegi, kod]);
                      }}
                    >
                      {opcioCimke(opcio)}
                    </button>
                  );
                })}
              </div>
            </fieldset>
          );
        }

        return (
          <fieldset className="felvitel-reszlet" key={tetel.key}>
            <legend>{tetel.question || tetel.label}</legend>
            {tetel.description && <p>{tetel.description}</p>}
            <div className="felvitel-mini-igennem">
              <button
                type="button"
                className={ertek === true ? "is-aktiv" : ""}
                aria-pressed={ertek === true}
                onClick={() => onChange(tetel.key, true)}
              >
                Igen
              </button>
              <button
                type="button"
                className={ertek === false ? "is-aktiv" : ""}
                aria-pressed={ertek === false}
                onClick={() => onChange(tetel.key, false)}
              >
                Nem
              </button>
            </div>
          </fieldset>
        );
      })}
    </div>
  );
}

function KapuReszletSzerkeszto({ tetelek, ertekek, onChange }) {
  return (
    <div className="felvitel-valasztek">
      {tetelek.map((tetel) => {
        const aktiv = ertekek[tetel.key] === true;
        return (
          <button
            type="button"
            key={tetel.key}
            className={aktiv ? "felvitel-opcio is-aktiv" : "felvitel-opcio"}
            aria-pressed={aktiv}
            onClick={() => onChange(tetel.key, !aktiv)}
          >
            <strong>{tetel.label}</strong>
          </button>
        );
      })}
    </div>
  );
}

export default function NewSystemForm({
  organisationId,
  organisationIndustry,
  industries,
}) {
  const router = useRouter();
  const supabase = useMemo(() => createClient(), []);

  const [fazis, setFazis] = useState("azonositas");
  const [nev, setNev] = useState("");
  const [iparag, setIparag] = useState(organisationIndustry || "general");
  const [szerepkorok, setSzerepkorok] = useState([]);
  const [valaszok, setValaszok] = useState({});

  const [katalogus, setKatalogus] = useState(null);
  const [funkcioIndex, setFunkcioIndex] = useState(0);
  const [merfoldko, setMerfoldko] = useState(false);
  const [merfoldkoMegvolt, setMerfoldkoMegvolt] = useState(false);
  const [reszletMod, setReszletMod] = useState(false);
  const [reszletErtekek, setReszletErtekek] = useState({});
  const [pontositasok, setPontositasok] = useState([]);
  const [pontositasIndex, setPontositasIndex] = useState(0);
  const [pontositasErtekek, setPontositasErtekek] = useState({});
  const [elozmeny, setElozmeny] = useState([]);
  const [elonezet, setElonezet] = useState(null);

  const [betoltes, setBetoltes] = useState(false);
  const [mentes, setMentes] = useState(false);
  const [uzenet, setUzenet] = useState("");
  const [kilepes, setKilepes] = useState(null);
  const [belepes, setBelepes] = useState("elore");
  const [huzas, setHuzas] = useState(0);
  const [kezmutato, setKezmutato] = useState(true);

  const idozito = useRef(null);
  const huzasKezdete = useRef(null);

  const katalogusKartyak = katalogus?.cards || [];
  const kartyak = useMemo(() => {
    const terkep = new Map(katalogusKartyak.map((kartya) => [kartya.key, kartya]));
    const kapuk = [...KAPUK, ...(iparag === "energy" ? [ENERGETIKAI_AG] : [])];
    return kapuk.map((kapu) => ({
      ...kapu,
      isGateway: true,
      details: kapu.children.map((kulcs) => terkep.get(kulcs)).filter(Boolean),
    })).filter((kapu) => kapu.details.length > 0);
  }, [katalogusKartyak, iparag]);
  const aktualisKartya = kartyak[funkcioIndex] || null;
  const elsoKorDarab = useMemo(
    () => kartyak.filter((kartya) => Number(kartya.round) === 1).length,
    [kartyak],
  );
  const aktualisPontositas = pontositasok[pontositasIndex] || null;

  const reszletTetelek = useMemo(() => {
    if (!aktualisKartya) return [];
    if (aktualisKartya.input === "multi") return [aktualisKartya];
    return aktualisKartya.details || [];
  }, [aktualisKartya]);

  const reszletTeljes = aktualisKartya?.isGateway
    ? reszletTetelek.some((tetel) => reszletErtekek[tetel.key] === true)
    : reszletTetelek.every((tetel) => {
    const ertek = reszletErtekek[tetel.key];
    if (tetel.input === "multi") return Array.isArray(ertek) && ertek.length > 0;
    return typeof ertek === "boolean";
    });

  const pontositasTeljes = aktualisPontositas?.input === "multi"
    ? Array.isArray(pontositasErtekek[aktualisPontositas?.key])
      && pontositasErtekek[aktualisPontositas?.key].length > 0
    : typeof pontositasErtekek[aktualisPontositas?.key] === "boolean";

  const hatralevoTema = fazis === "funkciok"
    ? Math.max(1, kartyak.length - funkcioIndex)
    : null;

  const katalogusBetoltese = useCallback(async (tenyek) => {
    const { data, error } = await supabase.rpc("aic_felviteli_katalogus_v2", {
      p_organisation_id: organisationId,
      p_iparag: iparag,
      p_szerepkorok: szerepkorok,
      p_valaszok: tenyek,
    });
    if (error) throw error;
    return data;
  }, [supabase, organisationId, iparag, szerepkorok]);

  const elonezetBetoltese = useCallback(async (tenyek) => {
    const { data, error } = await supabase.rpc("aic_felvitel_elonezet_v2", {
      p_organisation_id: organisationId,
      p_valaszok: tenyek,
      p_szerepkorok: szerepkorok,
      p_iparag: iparag,
    });
    if (error) throw error;
    return data;
  }, [supabase, organisationId, iparag, szerepkorok]);

  function animaltValtas(mozgas, muvelet) {
    if (kilepes) return;
    setKilepes(mozgas);
    if (idozito.current) clearTimeout(idozito.current);
    idozito.current = setTimeout(() => {
      setBelepes(mozgas.includes("vissza") ? "vissza" : mozgas.includes("balra") ? "jobbra" : mozgas.includes("jobbra") ? "balra" : "elore");
      muvelet();
      setHuzas(0);
      setKilepes(null);
    }, MOZGAS_IDO);
  }

  function fazisValtas(ujFazis, vissza = false) {
    animaltValtas(vissza ? "ki-vissza" : "ki-elore", () => setFazis(ujFazis));
  }

  function szerepkorValt(kod) {
    setSzerepkorok((elozo) => (
      elozo.includes(kod) ? elozo.filter((elem) => elem !== kod) : [...elozo, kod]
    ));
    setKatalogus(null);
    setElonezet(null);
  }

  async function funkciokInditasa() {
    if (szerepkorok.length === 0 || betoltes) return;
    setBetoltes(true);
    setUzenet("");
    try {
      const adat = await katalogusBetoltese(valaszok);
      setKatalogus(adat);
      setFunkcioIndex(0);
      setMerfoldko(false);
      setMerfoldkoMegvolt(false);
      setReszletMod(false);
      fazisValtas("funkciok");
    } catch (error) {
      setUzenet(error.message || "A funkciók betöltése nem sikerült.");
    } finally {
      setBetoltes(false);
    }
  }

  function valtozasRogzitese(valtozasok, hely) {
    setElozmeny((elozo) => [...elozo, {
      ...hely,
      elozoErtekek: elozoErtekek(valaszok, valtozasok),
    }]);
    const kovetkezo = { ...valaszok, ...valtozasok };
    setValaszok(kovetkezo);
    return kovetkezo;
  }

  async function felvitelLezarasa(tenyek) {
    setFazis("pontositas");
    setBetoltes(true);
    setUzenet("");
    try {
      const adat = await katalogusBetoltese(tenyek);
      setKatalogus(adat);

      const kartyaTerkep = new Map();
      (adat.cards || []).forEach((kartya) => {
        kartyaTerkep.set(kartya.key, kartya);
        (kartya.details || []).forEach((reszlet) => kartyaTerkep.set(reszlet.key, reszlet));
      });
      (adat.role_details || []).forEach((reszlet) => kartyaTerkep.set(reszlet.key, reszlet));
      (adat.legal_review || []).forEach((reszlet) => kartyaTerkep.set(reszlet.key, reszlet));

      const hianyzoKulcsok = (adat.missing?.cards || []).map((elem) => elem.key);
      const hianyzoKartyak = hianyzoKulcsok
        .map((kulcs) => kartyaTerkep.get(kulcs))
        .filter(Boolean)
        .filter((tetel) => !megvalaszolt(tetel, tenyek));
      const szerepReszletek = (adat.role_details || [])
        .filter((tetel) => !megvalaszolt(tetel, tenyek));
      const jogiReszletek = (adat.legal_review || [])
        .filter((tetel) => !megvalaszolt(tetel, tenyek));

      const egyedi = [];
      const latott = new Set();
      [...hianyzoKartyak, ...szerepReszletek, ...jogiReszletek].forEach((tetel) => {
        if (!latott.has(tetel.key)) {
          latott.add(tetel.key);
          egyedi.push(tetel);
        }
      });

      if (egyedi.length > 0) {
        setPontositasok(egyedi);
        setPontositasIndex(0);
        setPontositasErtekek({});
        setFazis("pontositas");
        return;
      }

      if ((adat.missing?.internal || []).length > 0) {
        setUzenet("A szabálykapcsoláshoz szükséges belső levezetés hiányzik. A rendszer nem menthető véglegesen.");
        setFazis("pontositas");
        return;
      }

      const elonezetiAdat = await elonezetBetoltese(tenyek);
      if (elonezetiAdat.needs_data_count > 0) {
        setUzenet("Van még tisztázatlan alkalmazhatósági feltétel; a mentés előtt ezt rendezni kell.");
        setFazis("pontositas");
        return;
      }
      setElonezet(elonezetiAdat);
      setFazis("osszegzes");
    } catch (error) {
      setUzenet(error.message || "A Jogtár-kapcsolatok ellenőrzése nem sikerült.");
    } finally {
      setBetoltes(false);
    }
  }

  function kovetkezoFunkcio(tenyek) {
    setReszletMod(false);
    setReszletErtekek({});
    if (funkcioIndex >= kartyak.length - 1) {
      felvitelLezarasa(tenyek);
      return;
    }
    if (!merfoldkoMegvolt && funkcioIndex + 1 === elsoKorDarab) {
      setMerfoldko(true);
      return;
    }
    setFunkcioIndex((index) => index + 1);
  }

  function funkcioValasz(igen, reszletbol = false) {
    if (!aktualisKartya || kilepes || betoltes || (reszletMod && !reszletbol) || merfoldko) return;
    setKezmutato(false);

    if (igen && aktualisKartya.isGateway && reszletTetelek.length === 1) {
      const valtozasok = { [reszletTetelek[0].key]: true };
      animaltValtas("ki-jobbra", () => {
        const tenyek = valtozasRogzitese(valtozasok, { fazis: "funkciok", index: funkcioIndex });
        kovetkezoFunkcio(tenyek);
      });
      return;
    }

    if (igen && (aktualisKartya.input === "multi" || (aktualisKartya.details || []).length > 0)) {
      const kezdo = {};
      reszletTetelek.forEach((tetel) => {
        if (sajatKulcs(valaszok, tetel.key)) kezdo[tetel.key] = valaszok[tetel.key];
      });
      setReszletErtekek(kezdo);
      setReszletMod(true);
      setBelepes("reszlet");
      return;
    }

    const valtozasok = aktualisKartya.isGateway
      ? Object.fromEntries(reszletTetelek.map((tetel) => [tetel.key, false]))
      : { [aktualisKartya.key]: igen };
    if (aktualisKartya.input === "multi") valtozasok[aktualisKartya.key] = [];
    const mozgas = igen ? "ki-jobbra" : "ki-balra";
    animaltValtas(mozgas, () => {
      const tenyek = valtozasRogzitese(valtozasok, {
        fazis: "funkciok",
        index: funkcioIndex,
      });
      kovetkezoFunkcio(tenyek);
    });
  }

  function reszletekMentese() {
    if (!reszletTeljes || !aktualisKartya) return;
    const valtozasok = aktualisKartya.isGateway
      ? Object.fromEntries(reszletTetelek.map((tetel) => [tetel.key, reszletErtekek[tetel.key] === true]))
      : aktualisKartya.input === "multi"
      ? { [aktualisKartya.key]: reszletErtekek[aktualisKartya.key] }
      : { [aktualisKartya.key]: true, ...reszletErtekek };
    animaltValtas("ki-jobbra", () => {
      const tenyek = valtozasRogzitese(valtozasok, {
        fazis: "funkciok",
        index: funkcioIndex,
      });
      kovetkezoFunkcio(tenyek);
    });
  }

  function merfoldkoFolytatasa() {
    animaltValtas("ki-elore", () => {
      setMerfoldko(false);
      setMerfoldkoMegvolt(true);
      setFunkcioIndex((index) => index + 1);
    });
  }

  function pontositasValasz(ertek) {
    if (!aktualisPontositas || kilepes || betoltes) return;
    const valtozasok = { [aktualisPontositas.key]: ertek };
    animaltValtas(ertek === true ? "ki-jobbra" : "ki-balra", () => {
      const tenyek = valtozasRogzitese(valtozasok, {
        fazis: "pontositas",
        index: pontositasIndex,
      });
      felvitelLezarasa(tenyek);
    });
  }

  function pontositasMentese() {
    if (!aktualisPontositas || !pontositasTeljes) return;
    pontositasValasz(pontositasErtekek[aktualisPontositas.key]);
  }

  function visszavonas() {
    if (reszletMod) {
      setReszletMod(false);
      setReszletErtekek({});
      return;
    }
    const utolso = elozmeny[elozmeny.length - 1];
    if (!utolso) {
      if (fazis === "funkciok") fazisValtas("szerepkor", true);
      else if (fazis === "iparag") fazisValtas("azonositas", true);
      else if (fazis === "szerepkor") fazisValtas("iparag", true);
      return;
    }

    const kovetkezo = visszaallitas(valaszok, utolso.elozoErtekek);
    setElozmeny((elozo) => elozo.slice(0, -1));
    setValaszok(kovetkezo);
    setMerfoldko(false);
    setReszletMod(false);
    setUzenet("");

    if (utolso.fazis === "funkciok") {
      setFunkcioIndex(utolso.index);
      setFazis("funkciok");
      return;
    }

    setFazis("pontositas");
    felvitelLezarasa(kovetkezo);
  }

  function alapVissza() {
    if (fazis === "azonositas") return;
    if (fazis === "iparag") fazisValtas("azonositas", true);
    else if (fazis === "szerepkor") fazisValtas("iparag", true);
    else visszavonas();
  }

  function huzasIndul(event) {
    if (fazis !== "funkciok" || reszletMod || merfoldko || betoltes || kilepes) return;
    if (event.target.closest("button, input, textarea, fieldset")) return;
    huzasKezdete.current = { id: event.pointerId, x: event.clientX };
    event.currentTarget.setPointerCapture(event.pointerId);
    setKezmutato(false);
  }

  function huzasMozog(event) {
    if (!huzasKezdete.current || huzasKezdete.current.id !== event.pointerId) return;
    setHuzas(event.clientX - huzasKezdete.current.x);
  }

  function huzasVege(event) {
    if (!huzasKezdete.current || huzasKezdete.current.id !== event.pointerId) return;
    const tavolsag = event.clientX - huzasKezdete.current.x;
    huzasKezdete.current = null;
    if (Math.abs(tavolsag) >= HUZASI_KUSZOB) funkcioValasz(tavolsag > 0);
    else setHuzas(0);
  }

  useEffect(() => {
    function billentyu(event) {
      const cel = event.target;
      const szerkeszto = cel instanceof HTMLElement
        && (cel.matches("input, textarea, button") || cel.closest("fieldset"));
      if (szerkeszto) return;

      if (fazis === "funkciok" && !reszletMod && !merfoldko) {
        if (event.key === "ArrowLeft") {
          event.preventDefault();
          funkcioValasz(false);
        }
        if (event.key === "ArrowRight") {
          event.preventDefault();
          funkcioValasz(true);
        }
      }
      if ((event.key === "Escape" || event.key === "Backspace") && fazis !== "azonositas") {
        event.preventDefault();
        alapVissza();
      }
    }
    window.addEventListener("keydown", billentyu);
    return () => window.removeEventListener("keydown", billentyu);
  });

  useEffect(() => () => {
    if (idozito.current) clearTimeout(idozito.current);
  }, []);

  async function mentesKezelese() {
    const tisztaNev = nev.trim().replace(/\s+/g, " ");
    if (!tisztaNev || szerepkorok.length === 0 || mentes) return;
    const kivalasztottFunkciok = katalogusKartyak
      .filter((kartya) => valaszok[kartya.key] === true)
      .map((kartya) => kartya.label)
      .slice(0, 6);
    const generaltRendeltetes = kivalasztottFunkciok.length
      ? kivalasztottFunkciok.join("; ")
      : "Szervezeti MI-rendszer használata";
    setMentes(true);
    setUzenet("");
    const { data, error } = await supabase.rpc("aic_eszkoz_mentese_v2", {
      p_organisation_id: organisationId,
      p_nev: tisztaNev,
      p_valaszok: valaszok,
      p_szerepkorok: szerepkorok,
      p_iparag: iparag,
      p_rendeltetes: generaltRendeltetes,
      p_system_id: null,
      p_vegleges: true,
    });
    setMentes(false);

    if (error?.code === "23505") {
      setUzenet(`A szervezetnél már létezik „${tisztaNev}” nevű MI-rendszer.`);
      return;
    }
    if (error) {
      setUzenet(error.message || "A mentés nem sikerült.");
      return;
    }
    router.push(`/rendszerek/${data.system_id}`);
    router.refresh();
  }

  const fazisIndex = FAZIS_SORREND.indexOf(fazis);
  const aktualisKor = Number(aktualisKartya?.round || 1);
  const korKartyak = kartyak.filter((kartya) => Number(kartya.round) === aktualisKor);
  const koronBeluliIndex = Math.max(0, korKartyak.findIndex((kartya) => kartya.key === aktualisKartya?.key));
  const kartyaStilus = huzas && !kilepes ? {
    transform: `translateX(${huzas}px) rotate(${huzas / 28}deg)`,
    opacity: Math.max(0.62, 1 - Math.abs(huzas) / 500),
  } : undefined;

  return (
    <div className="felvitel">
      <div className="felvitel-allapot">
        <span>{fazisIndex + 1}. szakasz</span>
        <span>{fazis === "funkciok" ? `Még ${hatralevoTema} rövid témakör van hátra` : fazis === "pontositas" ? "Csak a szükséges pontosítások" : "Rövid felvitel"}</span>
      </div>

      <div className="felvitel-szinpad">
        <section
          key={`${fazis}-${funkcioIndex}-${pontositasIndex}-${reszletMod}-${merfoldko}`}
          className={`felvitel-kartya ${fazis === "funkciok" && !reszletMod && !merfoldko ? "felvitel-swipe-kartya" : ""} ${kilepes || `be-${belepes}`}`}
          style={kartyaStilus}
          onPointerDown={huzasIndul}
          onPointerMove={huzasMozog}
          onPointerUp={huzasVege}
          onPointerCancel={huzasVege}
        >
          {fazis === "azonositas" && (
            <>
              <span className="felvitel-felirat">Azonosítás</span>
              <h2>Mi az MI-rendszer neve?</h2>
              <p className="felvitel-sugo">A szervezet által használt belső elnevezést add meg.</p>
              <label className="felvitel-mezo-cimke" htmlFor="rendszer-nev">MI-rendszer neve</label>
              <input
                id="rendszer-nev"
                autoFocus
                className="felvitel-mezo"
                value={nev}
                placeholder="Például: EnergiaChat"
                onChange={(event) => setNev(event.target.value)}
              />
            </>
          )}

          {fazis === "iparag" && (
            <>
              <span className="felvitel-felirat">Iparág</span>
              <h2>Melyik területen használják?</h2>
              <p className="felvitel-sugo">Ezzel csak az ágazatspecifikus kész Jogtár-szövegeket szűrjük.</p>
              <div className="felvitel-valasztek felvitel-valasztek-ketto">
                {industries.map((elem) => (
                  <button
                    type="button"
                    key={elem.code}
                    className={iparag === elem.code ? "felvitel-opcio is-aktiv" : "felvitel-opcio"}
                    aria-pressed={iparag === elem.code}
                    onClick={() => {
                      setIparag(elem.code);
                      setKatalogus(null);
                      setElonezet(null);
                    }}
                  >
                    <strong>{elem.name_hu}</strong>
                  </button>
                ))}
              </div>
            </>
          )}

          {fazis === "szerepkor" && (
            <>
              <span className="felvitel-felirat">Szerepkör</span>
              <h2>Milyen minőségben jár el a szervezet?</h2>
              <p className="felvitel-sugo">Több szerepkör is kiválasztható. Ez a kötelezettségeket szűri, nem a rendszer funkcióit.</p>
              <div className="felvitel-valasztek">
                {SZEREPKOROK.map(([kod, cimke, leiras]) => (
                  <button
                    type="button"
                    key={kod}
                    className={szerepkorok.includes(kod) ? "felvitel-opcio is-aktiv" : "felvitel-opcio"}
                    aria-pressed={szerepkorok.includes(kod)}
                    onClick={() => szerepkorValt(kod)}
                  >
                    <strong>{cimke}</strong>
                    <em>{leiras}</em>
                  </button>
                ))}
              </div>
            </>
          )}

          {fazis === "funkciok" && merfoldko && (
            <div className="felvitel-merfoldko" aria-live="polite">
              <span className="felvitel-merfoldko-jel">✓</span>
              <span className="felvitel-felirat">Első kör kész</span>
              <h2>Kitartás, már a nehezén túl vagy!</h2>
              <p>A következő kör rövidebb: a tartalom- és fejlesztési működést nézzük át.</p>
              <button type="button" className="felvitel-tovabb" onClick={merfoldkoFolytatasa}>
                Jöhet a rövidebb kör
              </button>
            </div>
          )}

          {fazis === "funkciok" && aktualisKartya && !merfoldko && !reszletMod && (
            <>
              <div className="felvitel-kartya-fej">
                <span className="felvitel-felirat">{CSOPORT_CIMKEK[aktualisKartya.group] || "Funkció"}</span>
                <span>{aktualisKor}. kör · {koronBeluliIndex + 1}/{korKartyak.length}</span>
              </div>
              <h2>{aktualisKartya.question || aktualisKartya.label}</h2>
              {aktualisKartya.description && <p className="felvitel-sugo">{aktualisKartya.description}</p>}

              <div className={`felvitel-huzas-visszajelzes ${huzas < -25 ? "is-bal" : ""} ${huzas > 25 ? "is-jobb" : ""}`} aria-hidden="true">
                <span>← Nem érinti</span>
                <span>Érinti →</span>
              </div>

              {kezmutato && funkcioIndex === 0 && (
                <div className="felvitel-kezmutato" aria-hidden="true">
                  <span className="felvitel-kez">☝</span>
                  <span>Húzd balra vagy jobbra</span>
                </div>
              )}

              <div className="felvitel-dontesek">
                <button type="button" className="felvitel-nem" onClick={() => funkcioValasz(false)}>
                  <span>←</span> Nem érinti
                </button>
                <button type="button" className="felvitel-igen" onClick={() => funkcioValasz(true)}>
                  Érinti <span>→</span>
                </button>
              </div>
              <p className="felvitel-billentyu">Egérrel, érintéssel vagy a ← → billentyűkkel is választhatsz.</p>
            </>
          )}

          {fazis === "funkciok" && aktualisKartya && reszletMod && (
            <>
              <span className="felvitel-felirat">Érintett funkciók</span>
              <h2>Melyik működés jellemző a rendszerre?</h2>
              <p className="felvitel-sugo">Jelöld meg az összes érintett funkciót. A többit a rendszer nem érintettként rögzíti.</p>
              {aktualisKartya.isGateway ? (
                <KapuReszletSzerkeszto
                  tetelek={reszletTetelek}
                  ertekek={reszletErtekek}
                  onChange={(kulcs, ertek) => setReszletErtekek((elozo) => ({ ...elozo, [kulcs]: ertek }))}
                />
              ) : (
                <ReszletSzerkeszto
                  tetelek={reszletTetelek}
                  ertekek={reszletErtekek}
                  onChange={(kulcs, ertek) => setReszletErtekek((elozo) => ({ ...elozo, [kulcs]: ertek }))}
                />
              )}
              <div className="felvitel-reszlet-lab">
                <button type="button" className="felvitel-egyiksem" onClick={() => funkcioValasz(false, true)}>
                  Egyik sem
                </button>
                <button type="button" className="felvitel-tovabb" disabled={!reszletTeljes} onClick={reszletekMentese}>
                  Kiválasztás mentése
                </button>
              </div>
            </>
          )}

          {fazis === "pontositas" && betoltes && (
            <div className="felvitel-betoltes" aria-live="polite">
              <span />
              <h2>A szükséges pontosításokat ellenőrzöm…</h2>
              <p>Csak a kiválasztott funkciókhoz kapcsolódó kérdés jelenik meg.</p>
            </div>
          )}

          {fazis === "pontositas" && !betoltes && aktualisPontositas && (
            <>
              <span className="felvitel-felirat">Szükséges pontosítás</span>
              <h2>{aktualisPontositas.question || aktualisPontositas.label}</h2>
              {aktualisPontositas.description && <p className="felvitel-sugo">{aktualisPontositas.description}</p>}
              {aktualisPontositas.input === "multi" ? (
                <>
                  <ReszletSzerkeszto
                    tetelek={[aktualisPontositas]}
                    ertekek={pontositasErtekek}
                    onChange={(kulcs, ertek) => setPontositasErtekek({ [kulcs]: ertek })}
                  />
                  <button type="button" className="felvitel-tovabb" disabled={!pontositasTeljes} onClick={pontositasMentese}>
                    Mentem és ellenőrzöm
                  </button>
                </>
              ) : (
                <div className="felvitel-dontesek">
                  <button type="button" className="felvitel-nem" onClick={() => pontositasValasz(false)}>Nem</button>
                  <button type="button" className="felvitel-igen" onClick={() => pontositasValasz(true)}>Igen</button>
                </div>
              )}
            </>
          )}

          {fazis === "pontositas" && !betoltes && !aktualisPontositas && uzenet && (
            <div className="felvitel-betoltes">
              <span className="felvitel-hiba-jel">!</span>
              <h2>Az ellenőrzés megállt</h2>
              <p>A részletes hibaüzenet lent látható. A visszavonással javítható az utolsó válasz.</p>
            </div>
          )}

          {fazis === "osszegzes" && (
            <>
              <span className="felvitel-felirat">Mentésre kész</span>
              <h2>{nev.trim()}</h2>
              <p className="felvitel-sugo">Mentéskor a rendszerhez ezek a már kész Jogtár-szövegek kapcsolódnak.</p>
              <div className="felvitel-osszegzes">
                <div>
                  <span>Kész Jogtár-szöveg</span>
                  <strong>{elonezet?.applicable_count ?? 0}</strong>
                </div>
                <div>
                  <span>Kockázati besorolás</span>
                  <strong>{elonezet?.high_risk ? "Magas" : "Nem magas"}</strong>
                </div>
                <div>
                  <span>Tisztázatlan feltétel</span>
                  <strong>{elonezet?.needs_data_count ?? 0}</strong>
                </div>
              </div>
              <div className="felvitel-szabalylista">
                {(elonezet?.applicable_modules || []).slice(0, 5).map((modul) => (
                  <span key={modul.module_id}>✓ {modul.title}</span>
                ))}
                {(elonezet?.applicable_modules || []).length > 5 && (
                  <em>és további {(elonezet?.applicable_modules || []).length - 5} kész szöveg</em>
                )}
              </div>
            </>
          )}
        </section>
      </div>

      {uzenet && <p className="felvitel-uzenet" role="alert">{uzenet}</p>}

      <div className="felvitel-lab">
        {fazis !== "azonositas" && fazis !== "osszegzes" && (
          <button type="button" className="felvitel-vissza" onClick={alapVissza} disabled={!!kilepes || betoltes}>
            {fazis === "funkciok" || fazis === "pontositas" ? "↶ Visszavonom" : "Vissza"}
          </button>
        )}

        {fazis === "azonositas" && (
          <button
            type="button"
            className="felvitel-tovabb"
            disabled={!nev.trim() || !!kilepes}
            onClick={() => fazisValtas("iparag")}
          >
            Tovább
          </button>
        )}
        {fazis === "iparag" && (
          <button type="button" className="felvitel-tovabb" disabled={!iparag || !!kilepes} onClick={() => fazisValtas("szerepkor")}>
            Tovább
          </button>
        )}
        {fazis === "szerepkor" && (
          <button type="button" className="felvitel-tovabb" disabled={szerepkorok.length === 0 || betoltes || !!kilepes} onClick={funkciokInditasa}>
            {betoltes ? "Betöltés…" : "Funkciók áttekintése"}
          </button>
        )}
        {fazis === "osszegzes" && (
          <>
            <button type="button" className="felvitel-vissza" onClick={visszavonas} disabled={mentes}>↶ Utolsó válasz javítása</button>
            <button type="button" className="felvitel-tovabb" onClick={mentesKezelese} disabled={mentes || (elonezet?.needs_data_count ?? 1) > 0}>
              {mentes ? "Mentés…" : "Rendszer mentése"}
            </button>
          </>
        )}

        {fazis === "funkciok" && aktualisKartya && !merfoldko && (
          <span className="felvitel-futo">Még {hatralevoTema} rövid témakör</span>
        )}
      </div>
    </div>
  );
}
