import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../../lib/supabase/server";
import EditSystemForm from "@/components/rendszerek/EditSystemForm";

export default async function EditSystemPage({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: system } = await supabase
    .from("aic_ai_systems")
    .select("id,name,intended_purpose,lifecycle_stage,inventory_status,industry_code,system_type_id,organisation_role,aic_organisations(industry),aic_system_type_templates(type_code,name_hu),aic_ai_system_capabilities(capability_code),aic_system_facts(facts)")
    .eq("id", params.id)
    .eq("inventory_status", "active")
    .maybeSingle();

  if (!system) notFound();

  const industryCode = system.industry_code || system.aic_organisations?.industry;
  const typeCode = system.aic_system_type_templates?.type_code;
  const { data: allCapabilities } = await supabase
    .from("aic_capabilities")
    .select("code,name_hu,description_hu,selection_hint_hu,system_type_codes,industry_codes,sort_order")
    .eq("active", true)
    .order("sort_order");
  const configurableCapabilities = (allCapabilities || []).filter((capability) => {
    const typeMatches = !capability.system_type_codes?.length || capability.system_type_codes.includes(typeCode);
    const industryMatches = !capability.industry_codes?.length || capability.industry_codes.includes(industryCode);
    return typeMatches && industryMatches;
  });

  // A tarolt tenyekbol olvassuk vissza a nyilatkozatok allasat.
  const facts = system.aic_system_facts?.facts || {};
  const declarations = {
    euHasznalat: facts.eu_scope_connection_exists !== false,
    miEgyertelmu: facts.ai_interaction_obvious !== false,
    nincsTiltottGyakorlat: facts.article_5_prohibition_relevant !== true,
    szabalyozottTermek: facts.annex_i_product_or_safety_component === true,
  };

  return (
    <main className="system-form-page">
      <section className="system-form-shell edit-system-shell">
        <Link className="back-link" href={`/rendszerek?rendszer=${system.id}`}>← Vissza ehhez a rendszerhez</Link>
        <p className="system-form-eyebrow">RENDSZERADATOK JAVÍTÁSA</p>
        <h1>{system.name}</h1>
        <p className="system-form-intro">A szabályzatot a rendszer tényleges aktív funkciói és az ellenőrzött alkalmazási adatai vezérlik.</p>
        <EditSystemForm
          system={system}
          configurableCapabilities={configurableCapabilities}
          declarations={declarations}
        />
      </section>
    </main>
  );
}
