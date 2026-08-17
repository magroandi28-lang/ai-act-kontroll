"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { createClient } from "../../../lib/supabase/client";

const MIN_HOSSZ = 8;

export default function NewPasswordPage() {
  const router = useRouter();
  const [ready, setReady] = useState(false);
  const [allowed, setAllowed] = useState(false);
  const [message, setMessage] = useState(null);
  const [loading, setLoading] = useState(false);

  // Ide csak érvényes linkkel lehet eljutni: a /auth/confirm útvonal ekkorra
  // már munkamenetet nyitott. Ha nincs munkamenet, a link lejárt vagy elhasználódott.
  useEffect(() => {
    let elt = true;
    (async () => {
      const supabase = createClient();
      const { data } = await supabase.auth.getUser();
      if (!elt) return;
      setAllowed(Boolean(data?.user));
      setReady(true);
    })();
    return () => { elt = false; };
  }, []);

  async function handleSubmit(event) {
    event.preventDefault();
    setMessage(null);

    const data = new FormData(event.currentTarget);
    const jelszo = String(data.get("password") || "");
    const megegyszer = String(data.get("password2") || "");

    if (jelszo.length < MIN_HOSSZ) {
      setMessage({ type: "error", text: `A jelszó legyen legalább ${MIN_HOSSZ} karakter.` });
      return;
    }
    if (jelszo !== megegyszer) {
      setMessage({ type: "error", text: "A két jelszó nem egyezik." });
      return;
    }

    setLoading(true);
    const supabase = createClient();
    const { error } = await supabase.auth.updateUser({ password: jelszo });
    setLoading(false);

    if (error) {
      setMessage({
        type: "error",
        text: /should be different|same password/i.test(error.message || "")
          ? "Az új jelszó nem egyezhet meg a régivel."
          : "A jelszó beállítása nem sikerült. Kérj új linket a belépési oldalról.",
      });
      return;
    }

    setMessage({ type: "ok", text: "A jelszó beállítva. Átirányítunk…" });
    router.replace("/vezerlopult");
    router.refresh();
  }

  return (
    <main className="auth-simple-page">
      <div className="auth-simple-card">
        <h1>Új jelszó beállítása</h1>

        {!ready && <p className="auth-simple-intro">Betöltés…</p>}

        {ready && !allowed && (
          <>
            <p className="auth-simple-message auth-simple-message-error" role="alert">
              Ez a link lejárt, vagy már felhasználták. Kérj újat a belépési oldalon
              az „Elfelejtett jelszó" hivatkozással.
            </p>
            <Link className="auth-simple-back" href="/jelszo">Új link kérése</Link>
          </>
        )}

        {ready && allowed && (
          <>
            <p className="auth-simple-intro">
              Adj meg egy legalább {MIN_HOSSZ} karakteres jelszót. Ezzel fogsz belépni
              ezután.
            </p>

            <form onSubmit={handleSubmit} noValidate>
              <label htmlFor="password">Új jelszó</label>
              <input id="password" name="password" type="password"
                autoComplete="new-password" disabled={loading} required />

              <label htmlFor="password2">Új jelszó még egyszer</label>
              <input id="password2" name="password2" type="password"
                autoComplete="new-password" disabled={loading} required />

              {message && (
                <p className={`auth-simple-message auth-simple-message-${message.type}`} role="alert">
                  {message.text}
                </p>
              )}

              <button className="primary-button" type="submit" disabled={loading}>
                {loading ? "Mentés…" : "Jelszó mentése"}
              </button>
            </form>
          </>
        )}
      </div>
    </main>
  );
}
