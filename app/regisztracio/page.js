"use client";

import { useEffect, useState } from "react";
import { createClient } from "../../lib/supabase/client";
import { createInitialAccountData } from "../../lib/auth/bootstrap";

export default function RegistrationPage() {
  const [message, setMessage] = useState("");
  const [success, setSuccess] = useState(false);
  const [loading, setLoading] = useState(false);
  const [privacyAccepted, setPrivacyAccepted] =
    useState(false);
  const [pendingEmail, setPendingEmail] = useState("");
  const [resending, setResending] = useState(false);
  const [accountExists, setAccountExists] =
    useState(false);

  useEffect(() => {
    setPrivacyAccepted(
      sessionStorage.getItem(
        "energiaai_privacy_accepted"
      ) === "true"
    );
  }, []);

  async function resendConfirmation() {
    if (!pendingEmail || resending) return;

    setResending(true);
    setMessage("");

    const supabase = createClient();

    const { error } = await supabase.auth.resend({
      type: "signup",
      email: pendingEmail,
      options: {
        emailRedirectTo:
          `${window.location.origin}/auth/confirm`,
      },
    });

    setResending(false);

    if (error) {
      setSuccess(false);
      setMessage(
        error.status === 429
          ? "Túl sok kérés érkezett. Várj néhány percet, majd próbáld újra."
          : "A levél újraküldése nem sikerült. Próbáld újra később."
      );
      return;
    }

    setSuccess(true);
    setMessage(
      "Új megerősítő levelet küldtünk. Ellenőrizd a levélszemét mappát is."
    );
  }

  async function handleSubmit(event) {
    event.preventDefault();
    setMessage("");
    setSuccess(false);
    setAccountExists(false);

    const data = new FormData(event.currentTarget);
    const email = String(
      data.get("email") || ""
    ).trim();
    const password = String(
      data.get("password") || ""
    );
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
      setMessage(
        "Minden mező kitöltése kötelező."
      );
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

    if (
      !privacyAccepted &&
      !data.get("privacy")
    ) {
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
            organisation_name:
              organisationName,
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

    if (
      authData.user &&
      Array.isArray(authData.user.identities) &&
      authData.user.identities.length === 0
    ) {
      setLoading(false);
      setAccountExists(true);
      setPendingEmail(email);
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
    setPendingEmail(email);

    sessionStorage.removeItem(
      "energiaai_privacy_accepted"
    );

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

        <p>
          Hozd létre a vállalati fiókodat.
        </p>

        {accountExists ? (
          <div className="confirmation-box existing-account-box">
            <div
              className="confirmation-icon"
              aria-hidden="true"
            >
              ✓
            </div>

            <h2>Már van fiókod</h2>

            <p>
              Ehhez az e-mail-címhez már
              tartozik fiók:
            </p>

            <strong>{pendingEmail}</strong>

            <a
              className="primary-button button-link"
              href="/"
            >
              Belépés a fiókba
            </a>

            <button
              className="text-button"
              type="button"
              onClick={() => {
                setAccountExists(false);
                setPendingEmail("");
              }}
            >
              Másik e-mail-címmel regisztrálok
            </button>
          </div>
        ) : pendingEmail ? (
          <div className="confirmation-box">
            <div
              className="confirmation-icon"
              aria-hidden="true"
            >
              ✓
            </div>

            <h2>Nézd meg az e-mailjeidet</h2>

            <p>
              A megerősítő levelet erre a
              címre küldtük:
            </p>

            <strong>{pendingEmail}</strong>

            {message && (
              <p
                className={
                  success
                    ? "form-success"
                    : "form-message"
                }
                role={
                  success ? "status" : "alert"
                }
              >
                {message}
              </p>
            )}

            <button
              className="secondary-button resend-button"
              type="button"
              onClick={resendConfirmation}
              disabled={resending}
            >
              {resending
                ? "Küldés…"
                : "Megerősítő levél újraküldése"}
            </button>

            <p className="email-help">
              Ha nem találod, ellenőrizd a
              levélszemét és a Promóciók mappát
              is.
            </p>
          </div>
        ) : (
          <form
            onSubmit={handleSubmit}
            noValidate
          >
            <label htmlFor="fullName">
              Teljes név
            </label>

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

            {privacyAccepted ? (
              <div className="privacy-confirmed">
                <span aria-hidden="true">✓</span>

                <p>
                  Az{" "}
                  <a
                    href="/adatkezeles"
                    target="_blank"
                    rel="noreferrer"
                  >
                    adatkezelési nyilatkozatot
                  </a>{" "}
                  már elfogadtad.
                </p>
              </div>
            ) : (
              <label className="privacy-row">
                <input
                  name="privacy"
                  type="checkbox"
                  disabled={loading}
                />

                <span>
                  Elfogadom az{" "}
                  <a
                    href="/adatkezeles"
                    target="_blank"
                    rel="noreferrer"
                  >
                    adatkezelési nyilatkozatot
                  </a>
                </span>
              </label>
            )}

            {message && (
              <p
                className={
                  success
                    ? "form-success"
                    : "form-message"
                }
                role={
                  success ? "status" : "alert"
                }
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
        )}
      </section>
    </main>
  );
}
