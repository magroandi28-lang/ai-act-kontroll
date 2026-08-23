import { redirect } from "next/navigation";
import Link from "next/link";
import { createClient } from "../../lib/supabase/server";

export default async function DashboardPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  // A Jogtár kártyán látszania kell, hány teendő van – enélkül csak az látja,
  // aki magától benyit.
  const { data: jogtar } = await supabase.rpc("aic_jogtar_allapot");

  const { data: profile } = await supabase
    .from("aic_user_profiles")
    .select("full_name")
    .eq("user_id", user.id)
    .maybeSingle();

  return (
    <main className="dashboard-page">
      <header className="dashboard-header">
        <Link className="dashboard-brand" href="/vezerlopult">AI Act Kontroll</Link>
        <form action="/auth/signout" method="post">
          <button className="dashboard-signout" type="submit">Kijelentkezés</button>
        </form>
      </header>

      <section className="dashboard-content" aria-labelledby="dashboard-title">
        <p className="dashboard-eyebrow">MI-rendszerek szabályozási vizsgálata</p>
        <h1 id="dashboard-title">
  {user.is_anonymous
    ? "Üdv az AI Act Kontrollban!"
    : `Üdv, ${profile?.full_name || "felhasználó"}!`}
</h1>
        <p className="dashboard-intro">
          Rögzíts egy MI-rendszert, és az alkalmazás kiválasztja a rá vonatkozó szabályokat.
        </p>

        <div className="dashboard-actions">
          <Link className="dashboard-action dashboard-action-primary" href="/rendszerek/uj">
            <span className="dashboard-action-icon" aria-hidden="true">+</span>
            <span>
              <strong>Új MI-rendszer vizsgálata</strong>
              <small>Add meg a rendszer célját és működését.</small>
            </span>
          </Link>

          <Link className="dashboard-action" href="/rendszerek">
            <span className="dashboard-action-icon dashboard-action-icon-list" aria-hidden="true">≡</span>
            <span>
              <strong>Mentett MI-rendszerek</strong>
              <small>Korábbi vizsgálatok megnyitása és kezelése.</small>
            </span>
          </Link>

          <Link className="dashboard-action" href="/jogtar">
            <span className="dashboard-action-icon dashboard-action-icon-list" aria-hidden="true">✓</span>
            <span>
              <strong>Jogtár</strong>
              <small>Jogszabályok és szabályzatok jóváhagyása.</small>
              {jogtar && (
                <small className="dashboard-action-jelzes">
                  {jogtar.jovahagyasra_var > 0
                    ? `${jogtar.jovahagyasra_var} jóváhagyásra vár`
                    : "Minden szabály jóváhagyva"}
                  {jogtar.felulvizsgalando > 0 && (
                    <em className="dashboard-jelzes-valtozas">
                      {jogtar.felulvizsgalando} változás miatt felülvizsgálandó
                    </em>
                  )}
                </small>
              )}
            </span>
          </Link>

          <Link className="dashboard-action" href="/szervezet">
            <span className="dashboard-action-icon dashboard-action-icon-list" aria-hidden="true">◍</span>
            <span>
              <strong>Tagok és szerepkörök</strong>
              <small>Ki rögzíthet és ki hagyhat jóvá.</small>
            </span>
          </Link>
        </div>

        <p className="dashboard-disclaimer">
          A szolgáltatás döntéstámogató rendszer, nem minősül jogi tanácsadásnak.
        </p>
      </section>
    </main>
  );
}
