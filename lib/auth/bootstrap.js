export const PRIVACY_POLICY_VERSION = "2026-08-11";

export async function createInitialAccountData(supabase, user) {
  const fullName = String(
    user.user_metadata?.full_name || ""
  ).trim();

  const organisationName = String(
    user.user_metadata?.organisation_name || ""
  ).trim();

  if (!organisationName) {
    throw new Error(
      "A szervezet neve hiányzik a regisztrációból."
    );
  }

  const { error: profileError } = await supabase
    .from("aic_user_profiles")
    .upsert(
      {
        user_id: user.id,
        full_name: fullName || null,
      },
      {
        onConflict: "user_id",
      }
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
      {
        onConflict: "user_id,policy_version",
      }
    );

  if (privacyError) throw privacyError;

  const {
    data: existingMembership,
    error: membershipLookupError,
  } = await supabase
    .from("aic_organisation_members")
    .select("organisation_id")
    .eq("user_id", user.id)
    .maybeSingle();

  if (membershipLookupError) {
    throw membershipLookupError;
  }

  if (existingMembership) return;

  const {
    data: organisation,
    error: organisationError,
  } = await supabase
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
