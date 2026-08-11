"use client";

import { useState } from "react";
import { createClient } from "../../lib/supabase/client";
import { createInitialAccountData } from "../../lib/auth/bootstrap";

export default function RegistrationPage() {
  const [message, setMessage] = useState("");
  const [success, setSuccess] = useState(false);
  const [loading, setLoading] = useState(false);

  async function handleSubmit(event) {
    event.preventDefault();
    setMessage("");
    setSuccess(false);

    const data = new FormData(event.currentTarget);
    const email = String(data.get("email") || "").trim();
    const password = String(data.get("password") || "");
    const passwordAgain = String(
      data.get("passwordAgain") || ""
    );
    const fullName = String(
      data.get("fullName") || ""
    ).trim();
    const organisationName = String(
      data.get("organisationName") || ""
    ).trim();

    if (
      !fullName ||
      !organisationName ||
      !email ||
      !password
    ) {
      setMessage("Minden mező kitöltése kötelező.");
      return;
    }

    if (password.length < 8) {
      setMessage(
        "A jelszó legalább 8 karakter hosszú legyen."
      );
      return;
    }

    if (password !== passwordAgain) {
      setMessage("A két jelszó nem egyezik.");
      return;
    }

    if (!data.get("privacy")) {
      setMessage(
        "A regisztrációhoz fogadd el az adatkezelési nyilatkozatot."
      );
      return;
    }

    setLoading(true);

    const supabase = createClient();
    const emailRedirectTo =
      `${window.location.origin}/auth/confirm`;

    const { data: authData, error } =
      await supabase.auth.signUp({
        email,
        password,
        options: {
          emailRedirectTo,
          data: {
            full_name: fullName,
            organisation_name: organisationName,
          },
        },
      });

    if (error) {
      setLoading(false);

      setMessage(
        error.message === "User already registered"
          ? "Ehhez az e-mail-címhez már tartozik fiók."
          : "A regisztráció nem sikerült. Ellenőrizd az adatokat, majd próbáld újra."
      );

      return;
    }

    if (authData.session && authData.user) {
      try {
        await createInitialAccountData(
          supabase,
          authData.user
        );

        window.location.assign("/vezerlopult");
        return;
      } catch {
        setLoading(false);
        setMessage(
          "A fiók létrejött, de az induló adatok mentése nem sikerült. Lépj be újra."
        );
        return;
      }
    }

    setLoading(false);
    setSuccess(true);
    setMessage(
      "A regisztráció elkészült. Nyisd meg az e-mailben kapott megerősítő linket."
    );

    event.currentTarget.reset();
  }

  return (
    <main className="simple-page">
      <section className="auth-panel">
        <a className="back-link" href="/">
          ← Vissza a belépéshez
        </a>

        <h1>Regisztráció</h1>
        <p>Hozd létre a vállalati fiókodat.</p>

        <form onSubmit={handleSubmit} noValidate>
          <label htmlFor="fullName">Teljes név</label>

          <input
            id="fullName"
            name="fullName"
            autoComplete="name"
            disabled={loading}
          />

          <label htmlFor="organisationName">
            Szervezet neve
          </label>

          <input
            id="organisationName"
            name="organisationName"
            autoComplete="organization"
            disabled={loading}
          />

          <label htmlFor="registerEmail">
            E-mail-cím
          </label>

          <input
            id="registerEmail"
            name="email"
            type="email"
            autoComplete="email"
            disabled={loading}
          />

          <label htmlFor="registerPassword">
            Jelszó
          </label>

          <input
            id="registerPassword"
            name="password"
            type="password"
            autoComplete="new-password"
            disabled={loading}
          />

          <label htmlFor="passwordAgain">
            Jelszó újra
          </label>

          <input
            id="passwordAgain"
            name="passwordAgain"
            type="password"
            autoComplete="new-password"
            disabled={loading}
          />

          <label className="privacy-row">
            <input
              name="privacy"
              type="checkbox"
              disabled={loading}
            />

            <span>
              Elfogadom az{" "}
              <a href="/adatkezeles" target="_blank">
                adatkezelési nyilatkozatot
              </a>
            </span>
          </label>

          {message && (
            <p
              className={
                success ? "form-success" : "form-message"
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
              ? "Regisztráció…"
              : "Fiók létrehozása"}
          </button>
        </form>
      </section>
    </main>
  );
}
