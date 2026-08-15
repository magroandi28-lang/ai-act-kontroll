"use server";

import { revalidatePath } from "next/cache";
import { createClient } from "../../../../lib/supabase/server";

async function callPolicyAction(systemId, rpcName, params) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return { error: "A művelethez bejelentkezés szükséges." };

  const { error } = await supabase.rpc(rpcName, params);
  if (error) return { error: error.message || "A művelet nem sikerült." };

  revalidatePath(`/rendszerek/${systemId}/szabalyzat`);
  revalidatePath(`/rendszerek/${systemId}`);
  return { success: true };
}

export async function submitPolicyForReview(systemId, policyId, note) {
  return callPolicyAction(systemId, "aic_submit_policy_for_review", {
    p_policy_id: policyId,
    p_note: note || null,
  });
}

export async function approvePolicy(systemId, policyId, note) {
  return callPolicyAction(systemId, "aic_approve_policy", {
    p_policy_id: policyId,
    p_note: note || null,
  });
}

export async function rejectPolicy(systemId, policyId, note) {
  if (!note || !note.trim()) {
    return { error: "Az elutasítás indoklása kötelező." };
  }
  return callPolicyAction(systemId, "aic_reject_policy", {
    p_policy_id: policyId,
    p_note: note.trim(),
  });
}
