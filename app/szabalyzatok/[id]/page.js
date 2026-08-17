import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../lib/supabase/server";
import ReviewDocument from "./ReviewDocument";

export const dynamic = "force-dynamic";

export default async function ReviewPage({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data, error } = await supabase.rpc("aic_felulvizsgalati_dokumentum", {
    p_policy_id: params.id,
  });

  if (error) {
    return (
      <main className="queue-page">
        <div className="queue-shell">
          <Link className="org-back" href="/szabalyzatok">← Vissza a listához</Link>
          <p className="org-error" role="alert">{error.message}</p>
        </div>
      </main>
    );
  }

  if (!data?.policy) notFound();

  const { data: katalogus } = await supabase.rpc("aic_available_catalogue_modules", {
    p_policy_id: params.id,
  });

  return <ReviewDocument doc={data} catalogue={katalogus || []} />;
}
