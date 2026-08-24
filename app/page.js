"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "../lib/supabase/client";
import { createInitialAccountData } from "../lib/auth/bootstrap";
import "./belepes.css";

/* ───────────────────────── szövegek ───────────────────────── */

const COPY = {
  hu: {
    loginTitle: "Belépés",
    email: "E-mail-cím",
    password: "Jelszó",
    privacyPre: "Elfogadom az",
    privacyLink: "adatkezelési nyilatkozatot",
    loginBtn: "Belépés",
    loginBusy: "Belépés…",
    forgot: "Elfelejtett jelszó?",
    demoBtn: "Kipróbálom regisztráció nélkül",
    demoBusy: "Demó indítása…",
    demoHelp: "Saját, elkülönített próbakörnyezetet kapsz.",
    register: "Regisztráció",
    showPw: "Jelszó megjelenítése",
    hidePw: "Jelszó elrejtése",
    errPrivacy: "A belépéshez fogadd el az adatkezelési nyilatkozatot.",
    errPrivacyDemo: "A demó indításához fogadd el az adatkezelési nyilatkozatot.",
    errLogin: "Hibás e-mail-cím vagy jelszó.",
    introSorok: [
      "Az MI-rendelet már alkalmazandó.",
      "A szabályzat néhány perc alatt elkészül.",
    ],
    introNev: "AI Act Kontroll",
    introLead:
      "Az AI Act Kontroll nyilvántartja a vállalat MI-rendszereit, azonosítja a rájuk vonatkozó követelményeket, és összeállítja a szükséges szabályzatokat.",
    introCta: "Nézze meg, hogyan működik",
    prev: "Vissza",
    next: "Tovább",
    szunet: "Szünet",
    folytatas: "Folytatás",
    closeTour: "Bemutató bezárása",
    jogiZarolag:
      "Az alkalmazás nem ad jogi tanácsot. A szabályzatot kiadás előtt jogásznak kell jóváhagynia.",
    zaroSor: "Próbálja ki működés közben, regisztráció nélkül.",
    closeCta: "Belépés a demóba",
    frames: [
      { cim: "MI-rendszer rögzítése", sor: "Néhány kérdés a rendszer tényleges működéséről." },
      { cim: "Jogtár", sor: "A jogász egyszer átnézi a jogszabályt — onnantól minden szabályzat abból épül." },
      { cim: "Jogszabályfrissítés", sor: "A rendszer figyeli a jogforrások szövegét." },
      { cim: "Szabályzat", sor: "Kiadható dokumentum, minden előírás alatt a jogszabályhellyel." },
      { cim: "Mentett MI-rendszerek", sor: "A teljes MI-leltár egy helyen, a szabályzatok állapotával." },
      { cim: "Tömeges felvitel", sor: "Több rendszer egyetlen táblázatból, soronkénti ellenőrzéssel." },
      { cim: "Verziókövetés", sor: "Minden módosítás új verziót képez, a korábbi megmarad." },
    ],
  },
  en: {
    loginTitle: "Sign in",
    email: "Email address",
    password: "Password",
    privacyPre: "I accept the",
    privacyLink: "privacy notice",
    loginBtn: "Sign in",
    loginBusy: "Signing in…",
    forgot: "Forgot your password?",
    demoBtn: "Try it without signing up",
    demoBusy: "Starting demo…",
    demoHelp: "You get your own isolated demo workspace.",
    register: "Create account",
    showPw: "Show password",
    hidePw: "Hide password",
    errPrivacy: "Please accept the privacy notice to sign in.",
    errPrivacyDemo: "Please accept the privacy notice to start the demo.",
    errLogin: "Incorrect email address or password.",
    introSorok: [
      "The AI Act already applies.",
      "The policy is ready in minutes.",
    ],
    introNev: "AI Act Kontroll",
    introLead:
      "AI Act Kontroll keeps a register of your company's AI systems, identifies the requirements that apply to them, and assembles the policies you need.",
    introCta: "See how it works",
    prev: "Back",
    next: "Next",
    szunet: "Pause",
    folytatas: "Resume",
    closeTour: "Close the tour",
    jogiZarolag:
      "This application does not give legal advice. The policy must be approved by a lawyer before it is issued.",
    zaroSor: "Try it in action, no sign-up needed.",
    closeCta: "Enter the demo",
    frames: [
      { cim: "Recording an AI system", sor: "A few questions about how the system actually works." },
      { cim: "Legal library", sor: "A lawyer checks the legislation once — every policy is built from it." },
      { cim: "Monitoring the law", sor: "The system watches the text of each legal source." },
      { cim: "Policy", sor: "An issuable document, each requirement citing its provision." },
      { cim: "Saved AI systems", sor: "The whole AI inventory in one place, with policy status." },
      { cim: "Bulk upload", sor: "Several systems from one spreadsheet, validated row by row." },
      { cim: "Version history", sor: "Every change creates a new version; the previous one is kept." },
    ],
  },
};

const KINDS = ["plus", "scale", "refresh", "doc", "stack", "grid", "branch"];

/* ───────────────────────── ikonok ───────────────────────── */

const GLYPHS = {
  plus: <g strokeLinecap="round"><circle cx="50" cy="50" r="14" /><path d="M50 43v14M43 50h14" /></g>,
  scale: (
    <g strokeLinecap="round" strokeLinejoin="round">
      <path d="M50 31v35M41 66h18M33 41h34M33 41l-8 13.5h16L33 41ZM67 41l-8 13.5h16L67 41Z" />
      <circle cx="50" cy="34" r="2.4" fill="currentColor" stroke="none" />
    </g>
  ),
  refresh: (
    <g strokeLinecap="round" strokeLinejoin="round">
      <path d="M34 50a16 16 0 0 1 27-11.6" />
      <path d="M65 32v10h-10" />
      <path d="M66 50a16 16 0 0 1-27 11.6" />
      <path d="M35 68V58h10" />
    </g>
  ),
  doc: (
    <g strokeLinecap="round" strokeLinejoin="round">
      <path d="M38 31h17l9 9v29H38V31ZM55 31v9h9M45 51h13M45 59h13" />
    </g>
  ),
  stack: (
    <g strokeLinejoin="round">
      <rect x="33" y="35" width="34" height="9" rx="2.5" />
      <rect x="33" y="47" width="34" height="9" rx="2.5" />
      <rect x="33" y="59" width="34" height="9" rx="2.5" />
    </g>
  ),
  grid: (
    <g strokeLinejoin="round">
      <rect x="31" y="35" width="38" height="30" rx="3" />
      <path d="M31 45h38M31 55h38M44 35v30M56 35v30" />
    </g>
  ),
  branch: (
    <g strokeLinecap="round" strokeLinejoin="round">
      <circle cx="39" cy="37" r="4.2" />
      <circle cx="39" cy="63" r="4.2" />
      <circle cx="62" cy="50" r="4.2" />
      <path d="M39 41.2v17.6M43.4 37h9.6a5 5 0 0 1 5 5v3.8M43.4 63h9.6a5 5 0 0 0 5-5v-3.8" />
    </g>
  ),
};

function HexIcon({ kind, className }) {
  return (
    <svg viewBox="0 0 100 100" className={className} aria-hidden="true">
      <path d="M50 7 87 28.5v43L50 93 13 71.5v-43L50 7Z" fill="none" stroke="currentColor" strokeWidth="2.4" />
      <g fill="none" stroke="currentColor" strokeWidth="2.4">
        {GLYPHS[kind]}
      </g>
    </svg>
  );
}

function MailIcon() {
  return (
    <svg viewBox="0 0 24 24" aria-hidden="true">
      <rect x="2.5" y="5" width="19" height="14" rx="2" />
      <path d="M3 7l9 6.5L21 7" />
    </svg>
  );
}

function LockIcon() {
  return (
    <svg viewBox="0 0 24 24" aria-hidden="true">
      <rect x="5" y="10.5" width="14" height="10.5" rx="2.2" />
      <path d="M8 10.5V7.6a4 4 0 0 1 8 0v2.9" />
    </svg>
  );
}

function EyeIcon({ off }) {
  return (
    <svg viewBox="0 0 24 24" aria-hidden="true">
      <path d="M2 12s4-6.5 10-6.5S22 12 22 12s-4 6.5-10 6.5S2 12 2 12Z" />
      <circle cx="12" cy="12" r="2.6" />
      {off && <path d="m4 4 16 16" />}
    </svg>
  );
}

/* ───────────────────────── nyelvváltó ───────────────────────── */

function LangSwitch({ lang, onChange }) {
  return (
    <div className="belepes-lang">
      <button type="button" className={lang === "hu" ? "is-active" : ""} onClick={() => onChange("hu")} aria-label="Magyar">HU</button>
      <button type="button" className={lang === "en" ? "is-active" : ""} onClick={() => onChange("en")} aria-label="English">EN</button>
    </div>
  );
}

/* ───────────────────────── bemutató modal ───────────────────────── */

/* ───────────────────────── bemutató ─────────────────────────

   A bemutató magától pereg, mint egy rövid film. Képkockánként egy sor
   szöveg, alatta a felület valódi tartalma. A korábbi 3D-s körhinta helyett
   ez azért jobb, mert minden olvasható marad, és nem kell húzogatni.

   A képernyőrészletek tartalma a valódi jogtárból származik: a felviteli
   kérdés a kapcsolókatalógusból, a szabály és a jogalap a jogtárból, a
   szabályzatrészlet egy elkészült dokumentumból.
   ------------------------------------------------------------------- */

const KEPKOCKA_IDO = 5200;

function Kerdes() {
  return (
    <div className="film-kep">
      <div className="film-kerdes">
        <p className="film-kerdes-felirat">Döntés és értékelés · 3/6</p>
        <p className="film-kerdes-szoveg">
          Értékel a rendszer személyeket hosszabb időn át társadalmi viselkedésük vagy személyes
          jellemzőik alapján?
        </p>
        <div className="film-kerdes-gombok">
          <span>← Nem érinti</span>
          <span className="is-igen">Érinti →</span>
        </div>
      </div>
    </div>
  );
}

function Szabaly() {
  return (
    <div className="film-kep">
      <div className="film-sor film-sor-fej">
        <span className="film-kod">GDPR 35. cikk</span>
        <span className="film-cimke is-jo">Ellenőrizve</span>
      </div>
      <p className="film-cim">Adatvédelmi hatásvizsgálat elvégzése</p>
      <p className="film-szoveg">
        Ha az adatkezelés – jellegére, hatókörére és céljaira tekintettel – valószínűsíthetően magas
        kockázattal jár a természetes személyek jogaira nézve, a szervezet az adatkezelés megkezdése
        előtt hatásvizsgálatot végez.
      </p>
    </div>
  );
}

function Kovetes() {
  const forrasok = [
    ["MI-rendelet", "2024/1689"],
    ["GDPR", "2016/679"],
    ["VET", "2007. évi LXXXVI."],
    ["Ekertv.", "2001. évi CVIII."],
    ["Fttv.", "2008. évi XLVII."],
  ];
  return (
    <div className="film-kep">
      <div className="film-sor film-sor-fej">
        <span className="film-kod">15 jogforrás figyelve</span>
        <span className="film-cimke is-jo">Nincs eltérés</span>
      </div>
      <ul className="film-lista">
        {forrasok.map(([nev, azon]) => (
          <li key={nev}>
            <span>{nev}</span>
            <span className="film-halvany">{azon}</span>
          </li>
        ))}
      </ul>
      <p className="film-labjegyzet">
        A rendszer a szöveg tartalmi ujjlenyomatát hasonlítja össze, és megmutatja, melyik mondat
        változott.
      </p>
    </div>
  );
}

function Szabalyzat() {
  return (
    <div className="film-kep">
      <div className="film-sor film-sor-fej">
        <span className="film-kod">Ügyfélszolgálati chatbot · 3. verzió</span>
        <span className="film-cimke">1. szakasz</span>
      </div>
      <p className="film-cim">Tudásforrások irányítása és elsőbbségi rendje</p>
      <p className="film-szoveg">
        A rendszer kimenetének forrási sorrendje: hatályos jogszabály; hatósági követelmény;
        jóváhagyott belső szabályzat. Ellentmondás vagy lejárt forrás esetén a rendszer nem pótolhatja
        becsléssel, hanem emberi felülvizsgálatra irányít.
      </p>
      <p className="film-hivatkozas">MI-rendelet 26. cikk — Alkalmazói kötelezettségek</p>
    </div>
  );
}

function Leltar() {
  const sorok = [
    ["Ügyfélszolgálati chatbot", "Hatályos", "is-jo"],
    ["Számla Segéd", "Hatályos", "is-jo"],
    ["Mérőállás Asszisztens", "Hatályos", "is-jo"],
    ["Panasz Kapu", "Nincs szabályzat", "is-varo"],
  ];
  return (
    <div className="film-kep">
      <ul className="film-lista">
        {sorok.map(([nev, allapot, jel]) => (
          <li key={nev}>
            <span>{nev}</span>
            <span className={"film-cimke " + jel}>{allapot}</span>
          </li>
        ))}
      </ul>
      <p className="film-labjegyzet">
        Ha a működés vagy a jogszabály változik, az érintett szabályzat elavultként jelenik meg.
      </p>
    </div>
  );
}

function Tomeges() {
  const sorok = [
    ["2", "Energia Tudástár", "Rendben", "is-jo"],
    ["3", "Fogyasztás Magyarázó", "Rendben", "is-jo"],
    ["4", "Tartozás Tájékoztató", "Hiányzik a szerepkör", "is-hiba"],
  ];
  return (
    <div className="film-kep">
      <div className="film-sor film-sor-fej">
        <span className="film-kod">Ellenőrzési eredmény</span>
        <span className="film-cimke">2 megfelelő, 1 hibás sor</span>
      </div>
      <ul className="film-lista">
        {sorok.map(([szam, nev, allapot, jel]) => (
          <li key={szam}>
            <span>
              <span className="film-halvany">{szam}.</span> {nev}
            </span>
            <span className={"film-cimke " + jel}>{allapot}</span>
          </li>
        ))}
      </ul>
      <p className="film-labjegyzet">Hibás fájl nem importálható. A program soronként ellenőriz.</p>
    </div>
  );
}

function Verziok() {
  const sorok = [
    ["3. verzió", "2026. 08. 14.", "Hatályos", "is-jo"],
    ["2. verzió", "2026. 06. 02.", "Archív", ""],
    ["1. verzió", "2026. 04. 18.", "Archív", ""],
  ];
  return (
    <div className="film-kep">
      <ul className="film-lista">
        {sorok.map(([verzio, datum, allapot, jel]) => (
          <li key={verzio}>
            <span>
              {verzio} <span className="film-halvany">{datum}</span>
            </span>
            <span className={"film-cimke " + jel}>{allapot}</span>
          </li>
        ))}
      </ul>
      <p className="film-labjegyzet">
        Auditnál visszakereshető, mikor mi volt hatályban, és melyik jogszabályhelyen alapult.
      </p>
    </div>
  );
}

const KEPERNYOK = [Kerdes, Szabaly, Kovetes, Szabalyzat, Leltar, Tomeges, Verziok];

function TourModal({ lang, onLang, onClose }) {
  const t = COPY[lang];
  const n = t.frames.length;

  const [fazis, setFazis] = useState("intro");
  const [index, setIndex] = useState(0);
  const [all, setAll] = useState(false);

  // A film magától lép tovább, amíg meg nem állítják. Az utolsó képkocka
  // után a záró szöveg jön, nem ugrik vissza az elejére.
  useEffect(() => {
    if (fazis !== "film" || all) return undefined;
    const ido = setTimeout(() => {
      setIndex((i) => {
        if (i >= n - 1) {
          setFazis("zaras");
          return i;
        }
        return i + 1;
      });
    }, KEPKOCKA_IDO);
    return () => clearTimeout(ido);
  }, [fazis, all, index, n]);

  const lep = useCallback(
    (irany) => {
      setAll(true);
      setIndex((i) => Math.min(n - 1, Math.max(0, i + irany)));
    },
    [n],
  );

  useEffect(() => {
    function billentyu(e) {
      if (e.key === "Escape") onClose();
      if (fazis !== "film") return;
      if (e.key === "ArrowRight") lep(1);
      if (e.key === "ArrowLeft") lep(-1);
      if (e.key === " ") {
        e.preventDefault();
        setAll((v) => !v);
      }
    }
    window.addEventListener("keydown", billentyu);
    return () => window.removeEventListener("keydown", billentyu);
  }, [fazis, lep, onClose]);

  const Kepernyo = KEPERNYOK[index];
  const kocka = t.frames[index];

  return (
    <div className="tour-overlay" role="dialog" aria-modal="true" aria-label={t.introNev}>
      <div className="tour-panel">
        <div className="tour-head">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img src="/logo-ai-act-kontroll.png" alt="AI Act Kontroll" />
          <div className="tour-head-actions">
            {fazis === "film" && (
              <button
                type="button"
                className="film-szunet"
                onClick={() => setAll((v) => !v)}
                aria-label={all ? t.folytatas : t.szunet}
              >
                {all ? "▶" : "❚❚"}
              </button>
            )}
            <LangSwitch lang={lang} onChange={onLang} />
            <button type="button" className="tour-close" onClick={onClose} aria-label={t.closeTour}>
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6" aria-hidden="true">
                <path d="m6 6 12 12M18 6 6 18" />
              </svg>
            </button>
          </div>
        </div>

        {fazis === "intro" && (
          <div className="film-intro">
            {t.introSorok.map((sor, i) => (
              <p key={sor} className="film-intro-sor" style={{ animationDelay: 120 + i * 420 + "ms" }}>
                {sor}
              </p>
            ))}
            <p className="film-intro-nev" style={{ animationDelay: "960ms" }}>
              {t.introNev}
            </p>
            <p className="film-intro-leiras" style={{ animationDelay: "1180ms" }}>
              {t.introLead}
            </p>
            <button
              type="button"
              className="tour-cta"
              style={{ animationDelay: "1400ms" }}
              onClick={() => {
                setFazis("film");
                setIndex(0);
                setAll(false);
              }}
            >
              {t.introCta} <span aria-hidden="true">→</span>
            </button>
          </div>
        )}

        {fazis === "film" && (
          <div className="film">
            <div className="film-fej" key={"fej" + index}>
              <p className="film-felirat">
                {"0" + (index + 1)} — {kocka.cim}
              </p>
              <p className="film-sor-nagy">{kocka.sor}</p>
            </div>
            <div className="film-szinpad" key={"kep" + index}>
              <Kepernyo />
            </div>
            <div className="film-halado" role="tablist" aria-label={t.introNev}>
              {t.frames.map((f, i) => (
                <button
                  key={f.cim}
                  type="button"
                  role="tab"
                  aria-selected={i === index}
                  aria-label={f.cim}
                  className={"film-vonal" + (i === index ? " is-aktiv" : "") + (i < index ? " is-kesz" : "")}
                  onClick={() => {
                    setAll(true);
                    setIndex(i);
                  }}
                />
              ))}
            </div>
            <div className="film-lab">
              <button type="button" className="tour-nav-prev" onClick={() => lep(-1)} disabled={index === 0}>
                <span aria-hidden="true">←</span> {t.prev}
              </button>
              <button
                type="button"
                className="tour-nav-next"
                onClick={() => (index >= n - 1 ? setFazis("zaras") : lep(1))}
              >
                {t.next} <span aria-hidden="true">→</span>
              </button>
            </div>
          </div>
        )}

        {fazis === "zaras" && (
          <div className="film-intro">
            <p className="film-intro-sor" style={{ animationDelay: "80ms" }}>
              {t.zaroSor}
            </p>
            <button
              type="button"
              className="tour-cta"
              style={{ animationDelay: "420ms" }}
              onClick={() => onClose(true)}
            >
              {t.closeCta} <span aria-hidden="true">→</span>
            </button>
          </div>
        )}

        <p className="film-jogi">{t.jogiZarolag}</p>
      </div>
    </div>
  );
}

/* ───────────────────────── belépés ───────────────────────── */

export default function LoginPage() {
  const router = useRouter();
  const [lang, setLang] = useState("hu");
  const [tourOpen, setTourOpen] = useState(true);
  // Ha a bemutatót a záró gombbal hagyták el, a belépési oldalon a demó
  // indítására mutatunk rá: fókusz a gombra, és kiemeljük a nyilatkozat sorát,
  // mert e nélkül a demó nem indítható.
  const [demoraMutat, setDemoraMutat] = useState(false);
  const demoGombRef = useRef(null);
  const [showPassword, setShowPassword] = useState(false);
  const [message, setMessage] = useState("");
  const [loadingMode, setLoadingMode] = useState(null);
  const loading = Boolean(loadingMode);
  const t = COPY[lang];

  useEffect(() => {
    const mentett = localStorage.getItem("aiact_lang");
    if (mentett === "hu" || mentett === "en") setLang(mentett);
  }, []);

  function valtNyelv(next) {
    setLang(next);
    localStorage.setItem("aiact_lang", next);
  }

  useEffect(() => {
    document.body.style.overflow = tourOpen ? "hidden" : "";
    return () => { document.body.style.overflow = ""; };
  }, [tourOpen]);

  useEffect(() => {
    if (tourOpen || !demoraMutat) return;
    const gomb = demoGombRef.current;
    if (!gomb) return;
    gomb.scrollIntoView({ block: "center", behavior: "smooth" });
    gomb.focus({ preventScroll: true });
  }, [tourOpen, demoraMutat]);

  function rememberPrivacyChoice(event) {
    const form = event.currentTarget.closest("form");
    if (form?.elements?.privacy?.checked) {
      sessionStorage.setItem("energiaai_privacy_accepted", "true");
    } else {
      sessionStorage.removeItem("energiaai_privacy_accepted");
    }
  }

  async function handleSubmit(event) {
    event.preventDefault();
    setMessage("");
    const data = new FormData(event.currentTarget);

    if (!data.get("privacy")) {
      setMessage(t.errPrivacy);
      return;
    }

    setLoadingMode("login");
    const supabase = createClient();
    const { error } = await supabase.auth.signInWithPassword({
      email: String(data.get("email") || "").trim(),
      password: String(data.get("password") || ""),
    });

    if (error) {
      setLoadingMode(null);
      setMessage(t.errLogin);
      return;
    }

    router.replace("/vezerlopult");
    router.refresh();
  }

  async function handleDemo(event) {
    const form = event.currentTarget.closest("form");
    setMessage("");

    if (!form?.elements?.privacy?.checked) {
      setMessage(t.errPrivacyDemo);
      return;
    }

    setLoadingMode("demo");
    const supabase = createClient();
    const { data, error } = await supabase.auth.signInAnonymously({
      options: {
        data: { full_name: "Demó látogató", demo_mode: true },
      },
    });

    if (error || !data.user) {
      setLoadingMode(null);
      setMessage(`Auth hiba: ${error?.message || "Nem sikerült azonosítani a felhasználót."}`);
      return;
    }

    // A demó látogató a meglévő, tartalommal rendelkező szervezet tagja lesz,
    // így ugyanazt látja, mint egy éles felhasználó. Ennek FUTNIA KELL a
    // createInitialAccountData előtt, különben az üres demó szervezetet hoz létre.
    const { error: joinError } = await supabase.rpc("aic_demo_csatlakozas");
    if (joinError) {
      setLoadingMode(null);
      setMessage(`A demó nem indítható: ${joinError.message}`);
      return;
    }

    try {
      await createInitialAccountData(supabase, data.user);
    } catch (err) {
      console.error("Demó létrehozási hiba:", err);
      setLoadingMode(null);
      setMessage(`Adatbázis hiba: ${err.message || JSON.stringify(err)}`);
      return;
    }

    router.replace("/vezerlopult");
    router.refresh();
  }

  return (
    <main className="belepes-page">
      <div className="belepes-racs" aria-hidden="true" />
      <span className="belepes-csik belepes-csik-1" aria-hidden="true" />
      <span className="belepes-csik belepes-csik-2" aria-hidden="true" />
      <span className="belepes-csik belepes-csik-3" aria-hidden="true" />
      <span className="belepes-csik belepes-csik-4" aria-hidden="true" />
      <span className="belepes-csik belepes-csik-5" aria-hidden="true" />
      <span className="belepes-csik belepes-csik-6" aria-hidden="true" />
      <span className="belepes-szemcse belepes-szemcse-1" aria-hidden="true" />
      <span className="belepes-szemcse belepes-szemcse-2" aria-hidden="true" />
      <div className="belepes-padlo" aria-hidden="true" />

      <div className="belepes-keret">
        <div className="belepes-fejlec">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img className="belepes-logo" src="/logo-ai-act-kontroll.png" alt="AI Act Kontroll" />
          <LangSwitch lang={lang} onChange={valtNyelv} />
        </div>

        <form className="belepes-kartya" onSubmit={handleSubmit} noValidate>
          <div className="belepes-oszlopok">
            <div>
              <h1>{t.loginTitle}</h1>

              <label htmlFor="email">{t.email}</label>
              <div className="belepes-mezo-sor">
                <MailIcon />
                <input id="email" name="email" type="email" className="belepes-mezo" placeholder={t.email} autoComplete="email" required disabled={loading} />
              </div>

              <label htmlFor="password">{t.password}</label>
              <div className="belepes-mezo-sor belepes-mezo-sor-jelszo">
                <LockIcon />
                <input
                  id="password"
                  name="password"
                  type={showPassword ? "text" : "password"}
                  className="belepes-mezo belepes-mezo-jelszo"
                  placeholder={t.password}
                  autoComplete="current-password"
                  required
                  disabled={loading}
                />
                <button
                  className="belepes-szem"
                  type="button"
                  onClick={() => setShowPassword((v) => !v)}
                  aria-label={showPassword ? t.hidePw : t.showPw}
                >
                  <EyeIcon off={showPassword} />
                </button>
              </div>

              <label className={"belepes-privacy" + (demoraMutat ? " is-kiemelt" : "")}>
                <input name="privacy" type="checkbox" disabled={loading} />
                <span>
                  {t.privacyPre} <a href="/adatkezeles">{t.privacyLink}</a>
                </span>
              </label>
            </div>

            <div className="belepes-valaszto" aria-hidden="true" />

            <div className="belepes-jobb">
              <button className="belepes-fo-gomb" type="submit" disabled={loading}>
                {loadingMode === "login" ? t.loginBusy : t.loginBtn}
              </button>

              <div className="belepes-elvalaszto" aria-hidden="true" />

              <a className="belepes-elfelejtett" href="/jelszo">{t.forgot}</a>

              <button
                ref={demoGombRef}
                className={"belepes-demo-gomb" + (demoraMutat ? " is-kiemelt" : "")}
                type="button"
                onClick={handleDemo}
                disabled={loading}
              >
                {loadingMode === "demo" ? t.demoBusy : t.demoBtn}
              </button>

              <p className="belepes-demo-sugo">{t.demoHelp}</p>

              <a className="belepes-regisztracio" href="/regisztracio" onClick={rememberPrivacyChoice}>
                {t.register}
              </a>

              {message && <p className="belepes-uzenet" role="alert">{message}</p>}
            </div>
          </div>

          <span className="belepes-glow" aria-hidden="true" />
          <span className="belepes-fenycsik" aria-hidden="true" />
        </form>
      </div>

      {tourOpen && (
        <TourModal
          lang={lang}
          onLang={valtNyelv}
          onClose={(demoFele) => {
            setTourOpen(false);
            if (demoFele) setDemoraMutat(true);
          }}
        />
      )}
    </main>
  );
}
