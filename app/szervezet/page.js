import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "../../lib/supabase/server";
import MembersPanel from "./MembersPanel";

export const dynamic = "force-dynamic";

export default async function OrganisationPage() {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/");
  const isDemo = Boolean(user.is_anonymous);

  const { data: organisations, error: orgError } = await supabase.rpc("aic_szervezeteim");

  const organisation = organisations?.[0] || null;

  let members = [];
  let membersError = null;

  if (organisation) {
    const result = await supabase.rpc("aic_szervezeti_tagok", {
      p_organisation_id: organisation.organisation_id,
    });
    members = result.data || [];
    membersError = result.error?.message || null;
  }

  return (
    <main className="dashboard-page">
      <header className="dashboard-header">
        <Link className="dashboard-brand" href="/vezerlopult">EnergiaAI Kontroll</Link>
        <form action="/auth/signout" method="post">
          <button className="dashboard-signout" type="submit">Kijelentkezés</button>
        </form>
      </header>

      <section className="org-shell">
        <Link className="org-back" href="/vezerlopult">← Vissza a vezérlőpultra</Link>
        <p className="dashboard-eyebrow">Tagok és szerepkörök</p>
        <h1>{organisation?.organisation_name || "Szervezet"}</h1>
        <p className="org-intro">
          A szerepkör dönti el, ki rögzíthet MI-rendszert, és ki hagyhatja jóvá a
          szabályzatokat. Szabályzatot szerkeszteni kizárólag jogász tud.
        </p>

        {isDemo && (
          <p className="org-demo-note">
            Demó módban a szerepkörök megtekinthetők, de tag nem hívható meg és nem módosítható.
          </p>
        )}

        {orgError && (
          <p className="org-error" role="alert">
            A szervezeti adatok nem tölthetők be: {orgError.message}
          </p>
        )}

        {!orgError && !organisation && (
          <p className="org-error" role="alert">
            Nincs olyan szervezet, amelynek tagja lennél.
          </p>
        )}

        {membersError && (
          <p className="org-error" role="alert">A tagok nem tölthetők be: {membersError}</p>
        )}

        {organisation && (
          <MembersPanel
            organisationId={organisation.organisation_id}
            myRole={organisation.member_role}
            members={members}
            readOnly={isDemo}
          />
        )}
      </section>
    </main>
  );
}
