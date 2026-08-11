import { redirect } from "next/navigation";
import { createClient } from "../../lib/supabase/server";

export default async function TemporaryDashboardPage() {
  const supabase = createClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect("/");
  }

  return (
    <main className="simple-page">
      <section className="auth-panel">
        <p className="eyebrow">Sikeres belépés</p>

        <h1>Üdvözlünk!</h1>

        <p>
          Bejelentkeztél az EnergiaAI Kontroll rendszerébe.
        </p>

        <p className="signed-in-email">
          {user.email}
        </p>

        <p>
          Ez egy ideiglenes ellenőrző oldal. A valódi
          alkalmazásfelületet később készítjük el.
        </p>

        <form action="/auth/signout" method="post">
          <button className="primary-button" type="submit">
            Kijelentkezés
          </button>
        </form>
      </section>
    </main>
  );
}
