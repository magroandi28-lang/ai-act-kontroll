"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "../lib/supabase/client";
import { createInitialAccountData } from "../lib/auth/bootstrap";
import "./belepes.css";

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

function EyeIcon({ hidden }) {
  return (
    <svg viewBox="0 0 24 24" aria-hidden="true">
      <path d="M2 12s4-6.5 10-6.5S22 12 22 12s-4 6.5-10 6.5S2 12 2 12Z" />
      <circle cx="12" cy="12" r="2.6" />
      {hidden && <path d="m4 4 16 16" />}
    </svg>
  );
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
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img className="belepes-logo" src="/logo-ai-act-kontroll.png" alt="AI Act Kontroll" />

        <form className="belepes-kartya" onSubmit={handleSubmit} noValidate>
          <div className="belepes-oszlopok">
            <div className="belepes-bal">
              <h1>Belépés</h1>

              <label htmlFor="email">E-mail-cím</label>
              <div className="belepes-mezo-sor">
                <MailIcon />
                <input
                  id="email"
                  name="email"
                  type="email"
                  className="belepes-mezo"
                  placeholder="E-mail-cím"
                  autoComplete="email"
                  required
                  disabled={loading}
                />
              </div>

              <label htmlFor="password">Jelszó</label>
              <div className="belepes-mezo-sor belepes-mezo-sor-jelszo">
                <LockIcon />
                <input
                  id="password"
                  name="password"
                  type={showPassword ? "text" : "password"}
                  className="belepes-mezo belepes-mezo-jelszo"
                  placeholder="Jelszó"
                  autoComplete="current-password"
                  required
                  disabled={loading}
                />
                <button
                  className="belepes-szem"
                  type="button"
                  onClick={() => setShowPassword((value) => !value)}
                  aria-label={showPassword ? "Jelszó elrejtése" : "Jelszó megjelenítése"}
                >
                  <EyeIcon hidden={showPassword} />
                </button>
              </div>

              <label className="belepes-privacy">
                <input name="privacy" type="checkbox" disabled={loading} />
                <span>
                  Elfogadom az <a href="/adatkezeles">adatkezelési nyilatkozatot</a>
                </span>
              </label>
            </div>

            <div className="belepes-valaszto" aria-hidden="true" />

            <div className="belepes-jobb">
              <button className="belepes-fo-gomb" type="submit" disabled={loading}>
                {loadingMode === "login" ? "Belépés…" : "Belépés"}
              </button>

              <div className="belepes-elvalaszto" aria-hidden="true" />

              <a className="belepes-elfelejtett" href="/jelszo">Elfelejtett jelszó?</a>

              <button
                className="belepes-demo-gomb"
                type="button"
                onClick={handleDemo}
                disabled={loading}
              >
                {loadingMode === "demo" ? "Demó indítása…" : "Kipróbálom regisztráció nélkül"}
              </button>

              <p className="belepes-demo-sugo">Saját, elkülönített próbakörnyezetet kapsz.</p>

              <a className="belepes-regisztracio" href="/regisztracio" onClick={rememberPrivacyChoice}>
                Regisztráció
              </a>

              {message && (
                <p className="belepes-uzenet" role="alert">{message}</p>
              )}
            </div>
          </div>

          <span className="belepes-glow" aria-hidden="true" />
          <span className="belepes-fenycsik" aria-hidden="true" />
        </form>
      </div>
    </main>
  );
}
