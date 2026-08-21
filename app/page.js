"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "../lib/supabase/client";
import { createInitialAccountData } from "../lib/auth/bootstrap";

function Logo() {
  return (
    <div className="brand" aria-label="EnergiaAI Kontroll">
      <svg className="brand-mark" viewBox="0 0 64 64" aria-hidden="true">
        <path d="M32 3 56 17v30L32 61 8 47V17L32 3Z" fill="none" stroke="currentColor" strokeWidth="6" />
        <path d="M22 19h24M20 32h21M22 45h24" fill="none" stroke="currentColor" strokeWidth="6" strokeLinecap="round" />
      </svg>
      <span>EnergiaAI Kontroll</span>
    </div>
  );
}

function NeuralBackground() {
  return (
    <svg className="neural-network" viewBox="0 0 900 900" preserveAspectRatio="xMidYMid slice" aria-hidden="true">
      <g className="network-lines">
        <path d="M-50 790C130 660 215 805 355 610S570 415 770 250 930 55 980-40" />
        <path d="M-70 850C105 720 265 845 410 650S625 465 810 300 940 145 990 80" />
        <path d="M95 245 245 155 370 275 515 120 650 235 790 130" />
        <path d="M70 420 205 330 370 275 475 390 650 235 725 415 840 335" />
        <path d="M205 330 260 505 475 390 535 550 725 415 790 590" />
        <path d="M260 505 355 610 535 550 640 690 790 590" />
      </g>
      <g className="network-nodes">
        {["95,245,6","245,155,9","370,275,7","515,120,6","650,235,10","790,130,5","70,420,5","205,330,8","475,390,11","725,415,7","840,335,5","260,505,6","535,550,9","790,590,6","355,610,8","640,690,5"].map((node) => {
          const [cx, cy, r] = node.split(",");
          return <circle key={node} cx={cx} cy={cy} r={r} />;
        })}
      </g>
    </svg>
  );
}

function MailIcon() {
  return <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M3 6h18v12H3zM3 7l9 7 9-7" /></svg>;
}

function LockIcon() {
  return <svg viewBox="0 0 24 24" aria-hidden="true"><rect x="5" y="10" width="14" height="11" rx="2" /><path d="M8 10V7a4 4 0 0 1 8 0v3" /></svg>;
}

function EyeIcon({ hidden }) {
  return <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M2 12s4-6 10-6 10 6 10 6-4 6-10 6S2 12 2 12Z" /><circle cx="12" cy="12" r="2.5" />{hidden && <path d="m4 4 16 16" />}</svg>;
}

export default function LoginPage() {
  const router = useRouter();
  const [showPassword, setShowPassword] = useState(false);
  const [message, setMessage] = useState("");
  const [loadingMode, setLoadingMode] = useState(null);
  const loading = Boolean(loadingMode);

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
      setMessage("A belépéshez fogadd el az adatkezelési nyilatkozatot.");
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
      setMessage("Hibás e-mail-cím vagy jelszó.");
      return;
    }

    router.replace("/vezerlopult");
    router.refresh();
  }

  async function handleDemo(event) {
    const form = event.currentTarget.closest("form");
    setMessage("");

    if (!form?.elements?.privacy?.checked) {
      setMessage("A demó indításához fogadd el az adatkezelési nyilatkozatot.");
      return;
    }

    setLoadingMode("demo");
    const supabase = createClient();
    const { data, error } = await supabase.auth.signInAnonymously({
      options: {
        data: {
          full_name: "Demó látogató",
          organisation_name: "Demó szervezet",
          demo_mode: true,
        },
      },
    });

    if (error || !data.user) {
      setLoadingMode(null);
      setMessage(`Auth hiba: ${error?.message || "Nem sikerült azonosítani a felhasználót."}`);
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
    <main className="login-page">
      <NeuralBackground />
      <header><Logo /></header>

      <section className="hero" aria-labelledby="hero-title">
        <div className="hero-copy">
          <h1 id="hero-title">Vállalati<span>MI-megfelelőség</span>egyszerűen</h1>
          <p>Rögzítsd az MI-rendszert.<br />A szükséges szabályokat<br />mi kiválasztjuk.</p>
        </div>

        <form className="login-card" onSubmit={handleSubmit} noValidate>
          <h2>Belépés</h2>
          <label htmlFor="email">E-mail-cím</label>
          <div className="input-wrap">
            <MailIcon />
            <input id="email" name="email" type="email" placeholder="E-mail-cím" autoComplete="email" required disabled={loading} />
          </div>
          <label htmlFor="password">Jelszó</label>
          <div className="input-wrap">
            <LockIcon />
            <input id="password" name="password" type={showPassword ? "text" : "password"} placeholder="Jelszó" autoComplete="current-password" required disabled={loading} />
            <button className="eye-button" type="button" onClick={() => setShowPassword((value) => !value)} aria-label={showPassword ? "Jelszó elrejtése" : "Jelszó megjelenítése"}>
              <EyeIcon hidden={showPassword} />
            </button>
          </div>
          <label className="privacy-row">
            <input name="privacy" type="checkbox" disabled={loading} />
            <span>Elfogadom az <a href="/adatkezeles">adatkezelési nyilatkozatot</a></span>
          </label>
          {message && <p className="form-message" role="alert">{message}</p>}
          <button className="primary-button" type="submit" disabled={loading}>{loadingMode === "login" ? "Belépés…" : "Belépés"}</button>
          <a className="forgot-link" href="/jelszo">Elfelejtett jelszó?</a>
          <div className="divider" />
          <button className="demo-button" type="button" onClick={handleDemo} disabled={loading}>
            {loadingMode === "demo" ? "Demó indítása…" : "Kipróbálom regisztráció nélkül"}
          </button>
          <p className="demo-help">Saját, elkülönített próbakörnyezetet kapsz.</p>
          <a className="register-link" href="/regisztracio" onClick={rememberPrivacyChoice}>Regisztráció</a>
        </form>
      </section>
    </main>
  );
}
