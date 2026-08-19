import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "../../lib/supabase/server";
import JogtarView from "./JogtarView";
// A jogtár saját stíluslapja. Külön fájlban van, hogy a globals.css-t ne
// kelljen bővíteni: a világos olvasófelület nem keveredik a sötét alkalmazás
// stílusaival, és egy fájl cseréjével áttervezhető.
import "./jogtar.css";

// A jogtár szabályközpontú: egy képernyő, egy döntés. A törvényszöveg
// bizonyíték, ezért összecsukva áll a szabály alatt.
export const dynamic = "force-dynamic";

export default async function JogtarPage() {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: organisations } = await supabase.rpc("aic_szervezeteim");
  const organisation = organisations?.[0] || null;

  const { data: industries } = await supabase
    .from("aic_industries")
    .select("code, name_hu")
    .eq("active", true)
    .order("sort_order");

  const { data: lista, error } = await supabase.rpc("aic_jogtar_szabalyok", {
    p_reteg: "mind",
    p_szerepkor: null,
    p_allapot: "jovahagyasra_var",
    p_kereses: null,
  });

  return (
    <main className="jogtar-page">
      <div className="jogtar-topbar">
        <Link className="jogtar-back" href="/vezerlopult">← Vissza az irányítópultra</Link>
      </div>

      {error ? (
        <section className="jogtar-hibalap">
          <h1>A jogtár nem tölthető be</h1>
          <p>{error.message}</p>
        </section>
      ) : (
        <JogtarView
          kezdoLista={lista || { osszesites: {}, forrasok: [], sorrend: [] }}
          iparagak={industries || []}
          // A lekérdezés member_role néven adja vissza a szerepkört.
          dontheto={["compliance", "owner"].includes(organisation?.member_role)}
        />
      )}
    </main>
  );
}
