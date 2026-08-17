"use client";

import { useState } from "react";
import Link from "next/link";
import { createClient } from "../../lib/supabase/client";

export default function ForgottenPasswordPage() {
  const [message, setMessage] = useState(null);
  const [loading, setLoading] = useState(false);

  async function handleSubmit(event) {
    event.preventDefault();
    setMessage(null);

    const form = event.currentTarget;
    const email = String(new FormData(form).get("email") || "").trim();
    if (!email) {
      setMessage({ type: "error", text: "Add meg az e-mail-címedet." });
      return;
    }

    setLoading(true);
    const supabase = createClient();

    // A célcímet innen adjuk meg, nem a Supabase Site URL mezőjéből vesszük.
    // Így a levél akkor is a helyes oldalra visz, ha az a beállítás fejlesztői
    // értéken maradt.
    const { error } = await supabase.auth.resetPasswordForEmail(email, {
      redirectTo: `${window.location.origin}/auth/confirm?tovabb=/jelszo/uj`,
    });
    setLoading(false);

    if (error) {
      const szoveg = /rate limit|security purposes|too many/i.test(error.message || "")
        ? "Rövid időn belül több levelet kértél. Várj néhány percet, és próbáld újra."
        : "A levél kiküldése most nem sikerült. Próbáld újra később.";
      setMessage({ type: "error", text: szoveg });
      return;
    }

    // Szándékosan ugyanaz a válasz akkor is, ha a cím nem létezik: különben az
    // űrlap elárulná, ki regisztrált az alkalmazásba.
    setMessage({
      type: "ok",
      text: "Ha ezzel a címmel van fiók, elküldtük rá a jelszóbeállító levelet. Nézd meg a levélszemét mappát is.",
    });
    form.reset();
  }

  return (
    <main className="auth-simple-page">
      <div className="auth-simple-card">
        <h1>Elfelejtett jelszó</h1>
        <p className="auth-simple-intro">
          Add meg az e-mail-címedet, és küldünk egy linket, amellyel új jelszót
          állíthatsz be.
        </p>

        <form onSubmit={handleSubmit} noValidate>
          <label htmlFor="email">E-mail-cím</label>
          <input id="email" name="email" type="email" placeholder="nev@cegnev.hu"
            autoComplete="email" disabled={loading} required />

          {message && (
            <p className={`auth-simple-message auth-simple-message-${message.type}`} role="alert">
              {message.text}
            </p>
          )}

          <button className="primary-button" type="submit" disabled={loading}>
            {loading ? "Küldés…" : "Link kérése"}
          </button>
        </form>

        <Link className="auth-simple-back" href="/">← Vissza a belépéshez</Link>
      </div>
    </main>
  );
}
