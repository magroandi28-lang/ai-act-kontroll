"use server";

import { revalidatePath } from "next/cache";
import { createClient } from "../../../../lib/supabase/server";

// A jóváhagyás a jogtárban történik, szabályonként. Itt egyetlen művelet
// maradt: új verzió készítése, ha a rendszer adatai megváltoztak.
export async function frissitsSzabalyzat(systemId) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return { error: "A művelethez bejelentkezés szükséges." };

  const { error } = await supabase.rpc("aic_generate_policy", {
    p_ai_system_id: systemId,
  });
  if (error) return { error: error.message || "A frissítés nem sikerült." };

  revalidatePath(`/rendszerek/${systemId}/szabalyzat`);
  revalidatePath(`/rendszerek/${systemId}`);
  return { success: true };
}
