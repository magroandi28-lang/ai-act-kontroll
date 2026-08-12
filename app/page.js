import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "../../../lib/supabase/server";

export default async function NewSystemPage() {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  return (
    <main className="simple-page">
      <section className="auth-panel">
        <Link className="back-link" href="/vezerlopult">← Vissza az irányítópultra</Link>
        <h1>Új MI-rendszer</h1>
        <p>A rendszer adatainak rögzítését a következő fejlesztési modulban készítjük el.</p>
      </section>
    </main>
  );
}
