import { createClient } from "../lib/supabase/server";

export default async function DemoBanner() {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user?.is_anonymous) return null;

  return (
    <aside className="demo-banner" role="status">
      <span><strong>DEMÓ MÓD</strong> Minden rögzítés próbaadat.</span>
      <form action="/auth/signout" method="post">
        <button type="submit">Kilépés a demóból</button>
      </form>
    </aside>
  );
}
