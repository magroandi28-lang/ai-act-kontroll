import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "../../lib/supabase/server";
import JogtarView from "./JogtarView";

// A jogtár a katalógusból dolgozik: aic_provision_coverage, aic_trigger_catalogue,
// aic_rule_legal_bases. A régi, használati profilokra és capability-listára épülő
// modellből semmi nem kerül ide.
export const dynamic = "force-dynamic";

export default async function JogtarPage() {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: organisations } = await supabase.rpc("aic_szervezeteim");
  const organisation = organisations?.[0] || null;

  // Az iparágak a szűrő harmadik oszlopához kellenek. Ma csak az energetika
  // szerepel a szabályokon, de a lista magától bővül.
  const { data: industries } = await supabase
    .from("aic_industries")
    .select("code, name_hu")
    .eq("active", true)
    .order("sort_order");

  const { data: lista, error } = await supabase.rpc("aic_jogtar_lista", {
    p_reteg: "mind",
    p_szerepkor: null,
    p_allapot: "mind",
  });

  return (
    <main className="jogtar-page">
      <div className="jogtar-topbar">
        <Link className="jogtar-back" href="/vezerlopult">← Vissza az irányítópultra</Link>
      </div>

      {error ? (
        <section className="jogtar-empty">
          <h1>A jogtár nem tölthető be</h1>
          <p>{error.message}</p>
        </section>
      ) : (
        <JogtarView
          kezdoLista={lista || { osszesites: {}, forrasok: [] }}
          iparagak={industries || []}
          dontheto={["compliance", "owner"].includes(organisation?.szerepem)}
        />
      )}
    </main>
  );
}
