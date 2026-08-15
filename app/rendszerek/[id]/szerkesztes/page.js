import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../../lib/supabase/server";
import EditSystemForm from "./EditSystemForm";

export default async function EditSystemPage({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");

  const { data: system } = await supabase
    .from("aic_ai_systems")
    .select("id,name,lifecycle_stage,inventory_status,industry_code,system_type_id,usage_profile_code,aic_organisations(industry),aic_system_type_templates(type_code),aic_usage_profiles(code,name_hu,capability_codes,optional_capability_codes),aic_ai_system_capabilities(capability_code)")
    .eq("id", params.id)
    .eq("inventory_status", "active")
    .maybeSingle();

  if (!system) notFound();

  const industryCode = system.industry_code || system.aic_organisations?.industry;
  const typeCode = system.aic_system_type_templates?.type_code;
  const { data: compatibleProfiles } = !system.usage_profile_code
    ? await supabase
      .from("aic_usage_profiles")
      .select("code,name_hu,description_hu,required_assertions")
      .eq("active", true)
      .eq("industry_code", industryCode)
      .eq("system_type_code", typeCode)
      .order("sort_order")
    : { data: [] };

  const { data: allCapabilities } = system.usage_profile_code
    ? await supabase
      .from("aic_capabilities")
      .select("code,name_hu,description_hu,system_type_codes,industry_codes,sort_order")
      .eq("active", true)
      .order("sort_order")
    : { data: [] };
  const configurableCapabilities = (allCapabilities || []).filter((capability) => {
    const allowedCodes = [
      ...(system.aic_usage_profiles?.capability_codes || []),
      ...(system.aic_usage_profiles?.optional_capability_codes || []),
    ];
    const typeMatches = !capability.system_type_codes?.length || capability.system_type_codes.includes(typeCode);
    const industryMatches = !capability.industry_codes?.length || capability.industry_codes.includes(industryCode);
    return allowedCodes.includes(capability.code) && typeMatches && industryMatches;
  });

  return (
    <main className="system-form-page">
      <section className="system-form-shell edit-system-shell">
        <Link className="back-link" href={`/rendszerek?rendszer=${system.id}`}>← Vissza ehhez a rendszerhez</Link>
        <p className="system-form-eyebrow">RENDSZERADATOK JAVÍTÁSA</p>
        <h1>{system.name}</h1>
        <p className="system-form-intro">Itt javíthatod az elírt nevet és az életciklus-állapotot. A módosítás után a szabályzat a helyes rendszernevet használja.</p>
        <EditSystemForm system={system} compatibleProfiles={compatibleProfiles || []} configurableCapabilities={configurableCapabilities} />
      </section>
    </main>
  );
}
