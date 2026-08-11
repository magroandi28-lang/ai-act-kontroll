export default function PrivacyPage() {
  return (
    <main className="simple-page">
      <section className="auth-panel privacy-panel">
        <a className="back-link" href="/">
          ← Vissza a belépéshez
        </a>

        <p className="eyebrow">EnergiaAI Kontroll</p>

        <h1>Adatkezelési nyilatkozat</h1>

        <p>
          Ez az oldal jelenleg a belépési és regisztrációs
          folyamat fejlesztői tesztelését szolgálja.
        </p>

        <h2>Kezelt adatok</h2>

        <p>
          A regisztráció során a rendszer a felhasználó nevét,
          e-mail-címét, szervezetének nevét, valamint az
          adatkezelési nyilatkozat elfogadásának tényét kezeli.
        </p>

        <h2>Az adatkezelés célja</h2>

        <p>
          Az adatok kezelésének célja a felhasználói fiók
          létrehozása, a biztonságos bejelentkezés és az
          EnergiaAI Kontroll szolgáltatásainak biztosítása.
        </p>

        <h2>Hitelesítés és adattárolás</h2>

        <p>
          A felhasználói hitelesítést és a kapcsolódó adatok
          tárolását a Supabase infrastruktúrája biztosítja.
          A jelszó nem kerül olvasható formában tárolásra az
          alkalmazás saját adatbázisában.
        </p>

        <h2>Az adatok törlése</h2>

        <p>
          A felhasználó kérheti a fiókjához kapcsolódó személyes
          adatok helyesbítését vagy törlését.
        </p>

        <div className="privacy-warning">
          <strong>Fejlesztői változat</strong>

          <p>
            Ez még nem a végleges, jogilag ellenőrzött
            adatkezelési tájékoztató. Az alkalmazás nyilvános
            használata előtt ki kell egészíteni az adatkezelő
            adataival, az adatkezelés jogalapjával, időtartamával,
            az érintetti jogokkal és a szolgáltatók pontos
            megnevezésével.
          </p>
        </div>
      </section>
    </main>
  );
}
