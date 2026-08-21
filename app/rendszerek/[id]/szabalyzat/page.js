import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../../lib/supabase/server";
import SearchablePolicy from "@/components/szabalyzatok/SearchablePolicy";

export default async function PolicyPage({ params, searchParams }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: system } = await supabase
    .from("aic_ai_systems")
    .select("id,name,intended_purpose,provider_name,lifecycle_stage,aic_organisations(name)")
    .eq("id", params.id)
    .maybeSingle();

  if (!system) notFound();

  const POLICY_COLUMNS =
    "id,title,executive_summary,document_sections,version,status,created_at,updated_at," +
    "submitted_at,reviewed_at,review_note,content_sha256";

  const { data: existingPolicy } = await supabase
    .from("aic_generated_policies")
    .select(POLICY_COLUMNS)
    .eq("ai_system_id", system.id)
    .order("version", { ascending: false })
    .limit(1)
    .maybeSingle();

  if (!existingPolicy && searchParams?.inditas !== "1") {
    redirect(`/rendszerek/${system.id}`);
  }

  let generationError = null;
  let policy = null;
  let refreshWarning = null;

  // Minden megnyitáskor ellenőrzi a forrásmodulokat, de csak valódi
  // tartalmi változás esetén hoz létre új dokumentumverziót.
  const { data: generation, error: generationRequestError } = await supabase.rpc(
    "aic_generate_policy_if_changed",
    { p_ai_system_id: system.id }
  );

  if (generationRequestError) {
    generationError = generationRequestError.message;
    if (existingPolicy) {
      policy = existingPolicy;
      refreshWarning = `A mentett ${existingPolicy.version}. verzió jelenik meg. Új verzió most nem készíthető: ${generationError}`;
    }
  } else if (generation?.policy_id) {
    const result = await supabase
      .from("aic_generated_policies")
      .select(POLICY_COLUMNS)
      .eq("id", generation.policy_id)
      .maybeSingle();
    policy = result.data;
    generationError = result.error?.message || null;
    if (!policy && existingPolicy) {
      policy = existingPolicy;
      refreshWarning = `A mentett ${existingPolicy.version}. verzió jelenik meg, mert a frissített dokumentum betöltése nem sikerült.`;
    }
  }

  if (!policy) {
    return (
      <main className="policy-page">
        <div className="policy-toolbar">
          <Link href={`/rendszerek?rendszer=${system.id}`}>← Vissza ehhez a rendszerhez</Link>
        </div>
        <section className="policy-generation-error" role="alert">
          <h1>A szabályzat most nem készíthető el</h1>
          <p>{generationError || "Ismeretlen adatbázishiba történt."}</p>
          <Link className="primary-button" href={`/rendszerek/${system.id}/szerkesztes`}>
            Rendszer adatainak ellenőrzése
          </Link>
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
      refreshWarning={refreshWarning}
    />
  );
}
