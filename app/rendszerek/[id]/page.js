import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../lib/supabase/server";

export default async function SystemRoute({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: system } = await supabase
    .from("aic_ai_systems")
    .select("id, assessment_status")
    .eq("id", params.id)
    .maybeSingle();

  if (!system) notFound();

  if (["completed", "needs_review"].includes(system.assessment_status)) {
    redirect(`/rendszerek/${system.id}/eredmeny`);
  }

  redirect(`/rendszerek/${system.id}/vizsgalat`);
}
