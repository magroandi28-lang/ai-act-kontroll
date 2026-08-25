"use client";

import { useState, useEffect, useRef } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "../lib/supabase/client";
import { createInitialAccountData } from "../lib/auth/bootstrap";
import BemutatoFilm from "./BemutatoFilm";
import "./bemutato.css";

/* ───────────────────────── szövegek ───────────────────────── */

const COPY = {
  hu: {
    kicsi: "Vállalati MI-megfelelőség",
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
    demoHelp: "Saját, elkülönített próbakörnyezet. Nem kell adat.",
    registerPre: "Még nincs fiókja?",
    register: "Regisztráció",
    showPw: "Jelszó megjelenítése",
    hidePw: "Jelszó elrejtése",
    errPrivacy: "A belépéshez fogadd el az adatkezelési nyilatkozatot.",
    errPrivacyDemo: "A demó indításához fogadd el az adatkezelési nyilatkozatot.",
    errLogin: "Hibás e-mail-cím vagy jelszó.",
    figyelmeztetesDatum: "2026. augusztus 2.",
    figyelmeztetes:
      " — a nagy kockázatú rendszerek követelményei és a tanítóadatra vonatkozó közzétételi kötelezettség alkalmazandók.",
    jogi:
      "A szolgáltatás döntéstámogató rendszer, nem minősül jogi tanácsadásnak. A szabályzatot kiadás előtt jogásznak kell jóváhagynia.",
  },
  en: {
    kicsi: "Enterprise AI compliance",
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
    demoHelp: "Your own isolated demo workspace. No data needed.",
    registerPre: "No account yet?",
    register: "Create account",
    showPw: "Show password",
    hidePw: "Hide password",
    errPrivacy: "Please accept the privacy notice to sign in.",
    errPrivacyDemo: "Please accept the privacy notice to start the demo.",
    errLogin: "Incorrect email address or password.",
    figyelmeztetesDatum: "2 August 2026",
    figyelmeztetes:
      " — the requirements for high-risk systems and the training-data disclosure obligation apply.",
    jogi:
      "This service is a decision-support system and does not constitute legal advice. The policy must be approved by a lawyer before it is issued.",
  },
};

/* ───────────────────────── ikonok ───────────────────────── */

function EyeIcon({ off }) {
  return (
    <svg viewBox="0 0 24 24" aria-hidden="true" fill="none" stroke="currentColor" strokeWidth="1.5">
      <path d="M2 12s4-6.5 10-6.5S22 12 22 12s-4 6.5-10 6.5S2 12 2 12Z" />
      <circle cx="12" cy="12" r="2.6" />
      {off && <path d="m4 4 16 16" />}
    </svg>
  );
}

function LangSwitch({ lang, onChange }) {
  return (
    <div className="bk-lang">
      <button type="button" className={lang === "hu" ? "is-active" : ""} onClick={() => onChange("hu")} aria-label="Magyar">HU</button>
      <button type="button" className={lang === "en" ? "is-active" : ""} onClick={() => onChange("en")} aria-label="English">EN</button>
    </div>
  );
}

/* ───────────────────────── belépés ───────────────────────── */

export default function LoginPage() {
  const router = useRouter();
  const [lang, setLang] = useState("hu");
  const [showPassword, setShowPassword] = useState(false);
  const [message, setMessage] = useState("");
  const [loadingMode, setLoadingMode] = useState(null);
  const demoGombRef = useRef(null);
  const belsoRef = useRef(null);
  const loading = Boolean(loadingMode);
  const t = COPY[lang];

  // az egész belépési felület arányosan a nézetablak magasságához igazítva,
  // hogy 100%-os böngészőnagyításnál se kelljen görgetni
  useEffect(() => {
    const igazit = () => {
      const el = belsoRef.current;
      if (!el) return;
      const host = el.parentElement;
      if (!host) return;
      const cs = getComputedStyle(host);
      const pad = parseFloat(cs.paddingTop) + parseFloat(cs.paddingBottom);
      if (window.innerWidth < 760) { el.style.zoom = ""; return; }
      const avail = window.innerHeight - pad - 3;
      el.style.zoom = "1";
      let z = Math.min(1, avail / Math.max(1, el.scrollHeight));
      for (let i = 0; i < 3; i += 1) {
        z = Math.max(0.66, Math.floor(z * 1000) / 1000);
        el.style.zoom = z === 1 ? "" : String(z);
        const shown = el.getBoundingClientRect().height;
        if (shown <= avail || z <= 0.66) break;
        z = z * (avail / shown);
      }
    };
    igazit();
    const idozito = setTimeout(igazit, 400);
    const ro = typeof ResizeObserver !== "undefined" && belsoRef.current ? new ResizeObserver(() => { clearTimeout(ro._t); ro._t = setTimeout(igazit, 60); }) : null;
    if (ro) ro.observe(belsoRef.current);
    window.addEventListener("resize", igazit);
    return () => { clearTimeout(idozito); if (ro) { clearTimeout(ro._t); ro.disconnect(); } window.removeEventListener("resize", igazit); };
  }, []);

  useEffect(() => {
    const mentett = localStorage.getItem("aiact_lang");
    if (mentett === "hu" || mentett === "en") setLang(mentett);
  }, []);

  function valtNyelv(next) {
    setLang(next);
    localStorage.setItem("aiact_lang", next);
  }

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

    // A demó látogató a meglévő, tartalommal rendelkező szervezet tagja lesz.
    // Ennek FUTNIA KELL a createInitialAccountData előtt.
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
    <main className="bk-keret">
      <div className="bk-belso" ref={belsoRef}>
        <div className="bk-fejlec">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img className="bk-logo" src="/logo-ai-act-kontroll.png" alt="AI Act Kontroll" />
          <div className="bk-fejlec-jobb">
            <span className="bk-kicsi">{t.kicsi}</span>
            <LangSwitch lang={lang} onChange={valtNyelv} />
          </div>
        </div>

        <div className="bk-sor">
          <div className="bk-bal">
            <BemutatoFilm lang={lang} />
          </div>

          <form className="bk-kartya" onSubmit={handleSubmit} noValidate>
            <p className="bk-bevezeto">{t.loginTitle}</p>

            <input
              id="email"
              name="email"
              type="email"
              className="bk-mezo"
              placeholder={t.email}
              autoComplete="email"
              required
              disabled={loading}
            />

            <div className="bk-jelszo-sor">
              <input
                id="password"
                name="password"
                type={showPassword ? "text" : "password"}
                className="bk-mezo"
                placeholder={t.password}
                autoComplete="current-password"
                required
                disabled={loading}
              />
              <button
                className="bk-szem"
                type="button"
                onClick={() => setShowPassword((v) => !v)}
                aria-label={showPassword ? t.hidePw : t.showPw}
              >
                <EyeIcon off={showPassword} />
              </button>
            </div>

            <button className="bk-fo-gomb" type="submit" disabled={loading}>
              {loadingMode === "login" ? t.loginBusy : t.loginBtn}<span aria-hidden="true">→</span>
            </button>

            <label className="bk-privacy">
              <input name="privacy" type="checkbox" disabled={loading} />
              <span>
                {t.privacyPre} <a href="/adatkezeles">{t.privacyLink}</a>
              </span>
            </label>

            <div className="bk-linkek">
              <button
                ref={demoGombRef}
                className="bk-demo-gomb"
                type="button"
                onClick={handleDemo}
                disabled={loading}
              >
                {loadingMode === "demo" ? t.demoBusy : t.demoBtn}<span aria-hidden="true">→</span>
              </button>
              <a href="/regisztracio" onClick={rememberPrivacyChoice}>{t.register}</a>
              <a href="/jelszo">{t.forgot}</a>
            </div>

            {message && <p className="bk-uzenet" role="alert">{message}</p>}
          </form>

          <div className="jogszabaly-sav">
            <span className="jogszabaly-cimke">{t.figyelmeztetesDatum}</span>
            <span className="jogszabaly-szoveg">{t.figyelmeztetes}</span>
          </div>

          <p className="jogi-lablec">{t.jogi}</p>
        </div>
      </div>
    </main>
  );
}
