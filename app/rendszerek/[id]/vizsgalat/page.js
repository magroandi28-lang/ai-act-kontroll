import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "../../../../lib/supabase/server";

export default async function AssessmentPlaceholderPage({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  return (
    <main className="simple-page">
      <section className="auth-panel">
        <Link className="back-link" href={`/rendszerek/${params.id}`}>← Vissza a rendszer adatlapjára</Link>
        <h1>Szabályozási vizsgálat</h1>
        <p>A chatbotra szabott kérdőívet a következő fejlesztési lépésben kapcsoljuk ide.</p>
      </section>
    </main>
  );
}
