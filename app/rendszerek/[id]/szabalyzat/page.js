import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../../lib/supabase/server";
import SearchablePolicy from "./SearchablePolicy";

export default async function PolicyPage({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: system } = await supabase
    .from("aic_ai_systems")
    .select("id,name,intended_purpose,provider_name,lifecycle_stage,aic_organisations(name)")
    .eq("id", params.id)
    .maybeSingle();

  if (!system) notFound();

  let { data: policy } = await supabase
    .from("aic_generated_policies")
    .select("id,title,executive_summary,document_sections,version,status,created_at,updated_at")
    .eq("ai_system_id", system.id)
    .order("version", { ascending: false })
    .limit(1)
    .maybeSingle();

  let generationError = null;

  if (!policy) {
    const { data: policyId, error } = await supabase.rpc("aic_generate_policy", {
      p_ai_system_id: system.id,
    });

    if (error) {
      generationError = error.message;
    } else {
      const result = await supabase
        .from("aic_generated_policies")
        .select("id,title,executive_summary,document_sections,version,status,created_at,updated_at")
        .eq("id", policyId)
        .maybeSingle();
      policy = result.data;
      generationError = result.error?.message || null;
    }
  }

  if (!policy) {
    return (
      <main className="policy-page">
        <div className="policy-toolbar">
          <Link href="/rendszerek">← Mentett szabályzatok</Link>
        </div>
        <section className="policy-generation-error" role="alert">
          <h1>A szabályzat most nem készíthető el</h1>
          <p>{generationError || "Ismeretlen adatbázishiba történt."}</p>
        </section>
      </main>
    );
  }

  const generatedDate = new Intl.DateTimeFormat("hu-HU", { dateStyle: "long" })
    .format(new Date(policy.updated_at || policy.created_at));

  return (
    <SearchablePolicy
      policy={policy}
      system={system}
      generatedDate={generatedDate}
    />
  );
}
