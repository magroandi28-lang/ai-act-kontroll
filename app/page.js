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
    introLead:
      "Az EnergiaAI Kontroll elkészíti azt a szabályzatot, amelyet az MI-rendelet megkövetel.",
    introQ:
      "A rendszer működésének rögzítése után meghatározza, mely jogszabályi kötelezettségek vonatkoznak rá, és ezekből kiadható dokumentumot állít össze – minden előírás mögött a hivatkozott jogszabályhellyel. Az MI-rendelet 2026. augusztus 2-tól alkalmazandó.",
    introCta: "Nézd meg, hogyan működik",
    prev: "Előző",
    next: "Következő",
    dragHint: "Húzza el a kártyákat",
    closingLine: "Lépj be! Regisztráció nélkül is kipróbálhatod!",
    closeCta: "Lépj be!",
    closeTour: "Bemutató bezárása",
    cards: [
      { title: "Rendszernyilvántartás",
        body: "A szervezet MI-rendszereinek rögzítése: rendeltetés, működési jellemzők, szerepkör." },
      { title: "A kötelezettségek meghatározása",
        body: "Az alkalmazandó előírások a rögzített működésből és a hatályos jogszabályokból következnek." },
      { title: "Jogi jóváhagyás",
        body: "Az előírásokat jogász hagyja jóvá, szükség esetén átfogalmazza, és rögzíti hozzá az értelmezést." },
      { title: "Megfelelőségi szabályzat",
        body: "A jóváhagyott előírásokból kiadható dokumentum áll össze, jogforrás-hivatkozásokkal." },
      { title: "Jogszabálykövetés",
        body: "Jogszabályváltozás esetén az érintett előírások felülvizsgálati állapotba kerülnek." },
      { title: "Szerepkörök és verziók",
        body: "Szolgáltatóra, alkalmazóra, importőrre más kötelezettségek vonatkoznak; minden módosítás új verziót képez." },
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
    introLead:
      "EnergiaAI Kontroll produces the policy that the AI Act requires.",
    introQ:
      "Once the operation of the system is recorded, it determines which statutory obligations apply and assembles them into a document ready for issue — each requirement citing the provision it derives from. The AI Act applies from 2 August 2026.",
    introCta: "See how it works",
    prev: "Back",
    next: "Next",
    dragHint: "Drag the cards",
    closingLine: "Come on in! You can try it without signing up.",
    closeCta: "Come on in!",
    closeTour: "Close the tour",
    cards: [
      { title: "AI system", body: "Register the AI system your company uses." },
      { title: "Legal library", body: "Current legislation in one place." },
      { title: "Legal updates", body: "You are notified when the legal background changes." },
      { title: "Policy", body: "The matching policy is assembled automatically." },
      { title: "My AI systems", body: "The system and its policy are saved together." },
      { title: "Bulk upload", body: "Register several AI systems with a downloadable, fillable smart spreadsheet." },
      { title: "Version history", body: "Every change creates a new policy version; the previous one is kept." },
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

const GAP = 16;

function cardWidth(winW) {
  const belso = Math.min(1020, winW || 1020) - 90;
  return Math.max(166, Math.min(240, belso / 3.4));
}

function TourModal({ lang, onLang, onClose }) {
  const t = COPY[lang];
  const n = t.cards.length;

  const [phase, setPhase] = useState("intro");
  const [index, setIndex] = useState(0);
  const [dx, setDx] = useState(0);
  const [dragging, setDragging] = useState(false);
  const [winW, setWinW] = useState(typeof window === "undefined" ? 1020 : window.innerWidth);

  const startX = useRef(0);
  const moved = useRef(false);
  const pendingDx = useRef(0);
  const raf = useRef(null);

  const kw = cardWidth(winW);
  const lep = kw + GAP;

  const step = useCallback(
    (dir) => {
      setDx(0);
      setDragging(false);
      setIndex((i) => {
        const nextIndex = i + dir;
        if (nextIndex > n - 1) {
          onClose();
          return i;
        }
        return Math.max(0, nextIndex);
      });
    },
    [n, onClose]
  );

  useEffect(() => {
    const onResize = () => setWinW(window.innerWidth);
    window.addEventListener("resize", onResize);
    return () => window.removeEventListener("resize", onResize);
  }, []);

  useEffect(() => {
    const onKey = (e) => {
      if (e.key === "Escape") onClose();
      if (phase !== "cards") return;
      if (e.key === "ArrowRight") { e.preventDefault(); step(1); }
      if (e.key === "ArrowLeft") { e.preventDefault(); step(-1); }
    };
    document.addEventListener("keydown", onKey);
    return () => document.removeEventListener("keydown", onKey);
  }, [phase, step, onClose]);

  function onDown(e) {
    startX.current = e.clientX;
    moved.current = false;
    if (e.currentTarget.setPointerCapture) e.currentTarget.setPointerCapture(e.pointerId);
    setDragging(true);
    setDx(0);
  }

  function onMove(e) {
    if (!dragging) return;
    const d = e.clientX - startX.current;
    if (Math.abs(d) > 6) moved.current = true;
    pendingDx.current = d;
    if (raf.current) return;
    raf.current = requestAnimationFrame(() => {
      raf.current = null;
      setDx(pendingDx.current);
    });
  }

  function onUp() {
    if (raf.current) { cancelAnimationFrame(raf.current); raf.current = null; }
    if (!dragging) return;
    const kuszob = Math.max(40, lep * 0.26);
    if (dx < -kuszob) step(1);
    else if (dx > kuszob) step(-1);
    else { setDragging(false); setDx(0); }
  }

  const off = -(index * lep + kw / 2) + dx;

  return (
    <div className="tour-overlay" role="presentation">
      <div className="tour-panel" role="dialog" aria-modal="true" aria-label="AI Act Kontroll">
        <div className="tour-head">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img src="/logo-ai-act-kontroll.png" alt="AI Act Kontroll" />
          <div className="tour-head-actions">
            <LangSwitch lang={lang} onChange={onLang} />
            <button type="button" className="tour-close" onClick={onClose} aria-label={t.closeTour}>
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6" aria-hidden="true">
                <path d="m6 6 12 12M18 6 6 18" />
              </svg>
            </button>
          </div>
        </div>

        {phase === "intro" && (
          <div className="tour-intro">
            <h2>{t.introLead}</h2>
            <p className="tour-intro-leiras">{t.introQ}</p>
            <span className="tour-intro-vonal" aria-hidden="true" />
            <button type="button" className="tour-cta" onClick={() => { setPhase("cards"); setIndex(0); setDx(0); }}>
              {t.introCta} <span aria-hidden="true">→</span>
            </button>
          </div>
        )}

        {phase === "cards" && (
          <div className="tour-cards">
            <div
              className="tour-viewport"
              role="group"
              aria-label="AI Act Kontroll"
              tabIndex={0}
              onPointerDown={onDown}
              onPointerMove={onMove}
              onPointerUp={onUp}
              onPointerCancel={onUp}
            >
              <div
                className="tour-track"
                style={{
                  gap: GAP + "px",
                  transform: `translate3d(${off.toFixed(1)}px,0,0)`,
                  transition: dragging ? "none" : "transform 460ms cubic-bezier(0.22,1,0.36,1)",
                }}
              >
                {t.cards.map((card, i) => {
                  const rel = i - index - (lep ? dx / lep : 0);
                  const at = Math.abs(rel);
                  const kiemelt = at < 0.5;
                  const ry = Math.max(-38, Math.min(38, -rel * 26));
                  const tz = -Math.min(210, at * 100);
                  const sc = Math.max(0.87, 1.04 - at * 0.1);
                  const op = Math.max(0.42, 1 - at * 0.3);
                  return (
                    <article
                      key={card.title}
                      className={"tour-card" + (kiemelt ? " is-active" : "")}
                      onClick={() => { if (!moved.current && i !== index) { setIndex(i); setDx(0); setDragging(false); } }}
                      style={{
                        width: kw.toFixed(1) + "px",
                        transform: `translateZ(${tz.toFixed(0)}px) rotateY(${ry.toFixed(1)}deg) scale(${sc.toFixed(3)})`,
                        opacity: op.toFixed(2),
                        transition: dragging
                          ? "border-color 240ms ease"
                          : "transform 460ms cubic-bezier(0.22,1,0.36,1), opacity 460ms ease, border-color 240ms ease",
                      }}
                    >
                      <span className="tour-badge">{"0" + (i + 1)}</span>
                      <HexIcon kind={KINDS[i]} className="tour-icon" />
                      <h3>{card.title}</h3>
                      <p>{card.body}</p>
                    </article>
                  );
                })}
              </div>
            </div>

            <div className="tour-nav">
              <button type="button" className="tour-nav-prev" onClick={() => step(-1)}>
                <span aria-hidden="true">←</span> {t.prev}
              </button>
              <div className="tour-dots">
                {t.cards.map((card, i) => (
                  <button
                    key={card.title}
                    type="button"
                    className={"tour-dot" + (i === index ? " is-active" : "")}
                    onClick={() => { setIndex(i); setDx(0); setDragging(false); }}
                    aria-label={String(i + 1)}
                  />
                ))}
              </div>
              <button type="button" className="tour-nav-next" onClick={() => step(1)}>
                {index >= n - 1 ? t.closeCta : t.next} <span aria-hidden="true">→</span>
              </button>
            </div>

            {index >= n - 1 ? (
              <p className="tour-hint tour-hint-closing">{t.closingLine}</p>
            ) : (
              <p className="tour-hint">
                <span aria-hidden="true">
                  <svg viewBox="0 0 24 10" fill="none" stroke="currentColor" strokeWidth="1.4">
                    <path d="M2 5h20M2 5l3.4-3M2 5l3.4 3M22 5l-3.4-3M22 5l-3.4 3" />
                  </svg>
                </span>
                {t.dragHint}
              </p>
            )}
          </div>
        )}

      </div>
    </div>
  );
}

/* ───────────────────────── belépés ───────────────────────── */

export default function LoginPage() {
  const router = useRouter();
  const [lang, setLang] = useState("hu");
  const [tourOpen, setTourOpen] = useState(true);
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

              <label className="belepes-privacy">
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

              <button className="belepes-demo-gomb" type="button" onClick={handleDemo} disabled={loading}>
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

      {tourOpen && <TourModal lang={lang} onLang={valtNyelv} onClose={() => setTourOpen(false)} />}
    </main>
  );
}
