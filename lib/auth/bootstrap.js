export const PRIVACY_POLICY_VERSION = "2026-08-11";

export async function createInitialAccountData(supabase, user) {
  const isDemo = Boolean(user.is_anonymous || user.user_metadata?.demo_mode);

  const fullName = String(
    user.user_metadata?.full_name || (isDemo ? "Demó látogató" : "")
  ).trim();

  let organisationName = String(
    user.user_metadata?.organisation_name || (isDemo ? "Demó szervezet" : "")
  ).trim();

  // A profil és az adatkezelési nyilatkozat rögzítése
  const { error: profileError } = await supabase
    .from("aic_user_profiles")
    .upsert(
      {
        user_id: user.id,
        full_name: fullName || null,
      },
      { onConflict: "user_id" }
    );

  if (profileError) throw profileError;

  const { error: privacyError } = await supabase
    .from("aic_privacy_acceptances")
    .upsert(
      {
        user_id: user.id,
        policy_version: PRIVACY_POLICY_VERSION,
        withdrawn_at: null,
      },
      { onConflict: "user_id,policy_version" }
    );

  if (privacyError) throw privacyError;

  const { data: existingMembership, error: membershipLookupError } = await supabase
    .from("aic_organisation_members")
    .select("organisation_id")
    .eq("user_id", user.id)
    .limit(1)
    .maybeSingle();

  if (membershipLookupError) throw membershipLookupError;

  if (existingMembership) return;

  if (!organisationName) {
    if (isDemo) {
      organisationName = "Demó szervezet";
    } else {
      throw new Error("A szervezet neve hiányzik a regisztrációból.");
    }
  }

  const { data: organisation, error: organisationError } = await supabase
    .from("aic_organisations")
    .insert({
      name: organisationName,
      created_by: user.id,
    })
    .select("id")
    .single();

  if (organisationError) throw organisationError;

  const { error: memberError } = await supabase
    .from("aic_organisation_members")
    .insert({
      organisation_id: organisation.id,
      user_id: user.id,
      member_role: "owner",
    });

  if (memberError) throw memberError;
}
