"use client";

import { useState } from "react";
import { createClient } from "../../../lib/supabase/client";

export default function AuthErrorPage() {
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");
  const [success, setSuccess] = useState(false);
  const [loading, setLoading] = useState(false);

  async function handleResend(event) {
    event.preventDefault();
    setMessage("");
    setSuccess(false);

    const normalizedEmail = email.trim();

    if (!normalizedEmail) {
      setMessage("Add meg a regisztrációhoz használt e-mail-címedet.");
      return;
    }

    setLoading(true);

    const supabase = createClient();

    const { error } = await supabase.auth.resend({
      type: "signup",
      email: normalizedEmail,
      options: {
        emailRedirectTo:
          `${window.location.origin}/auth/confirm`,
      },
    });

    setLoading(false);

    if (error) {
      setMessage(
        error.status === 429
          ? "Túl sok kérés érkezett. Várj néhány percet, majd próbáld újra."
          : "A levél elküldése nem sikerült. Ellenőrizd az e-mail-címet, majd próbáld újra."
      );
      return;
    }

    setSuccess(true);
    setMessage(
      "Ha ehhez az e-mail-címhez megerősítésre váró fiók tartozik, új levelet küldtünk."
    );
  }

  return (
    <main className="simple-page">
      <section className="auth-panel auth-error-panel">
        <a className="back-link" href="/">
          ← Vissza a belépéshez
        </a>

        <div
          className="error-icon"
          aria-hidden="true"
        >
          !
        </div>

        <h1>A megerősítő link nem használható</h1>

        <p>
          A link lejárt, már felhasználták, vagy nem
          megfelelő. Kérj új megerősítő levelet.
        </p>

        <form onSubmit={handleResend} noValidate>
          <label htmlFor="resendEmail">
            A regisztrációhoz használt e-mail-cím
          </label>

          <input
            id="resendEmail"
            name="email"
            type="email"
            autoComplete="email"
            value={email}
            onChange={(event) =>
              setEmail(event.target.value)
            }
            disabled={loading}
          />

          {message && (
            <p
              className={
                success
                  ? "form-success"
                  : "form-message"
              }
              role={success ? "status" : "alert"}
            >
              {message}
            </p>
          )}

          <button
            className="primary-button"
            type="submit"
            disabled={loading}
          >
            {loading
              ? "Küldés…"
              : "Új megerősítő levél kérése"}
          </button>
        </form>

        <p className="auth-error-help">
          Ha az e-mail-címedet már megerősítetted,
          nincs szükséged új levélre.
        </p>

        <a
          className="secondary-button button-link"
          href="/"
        >
          Belépés a meglévő fiókba
        </a>
      </section>
    </main>
  );
}
