"use server";

import { revalidatePath } from "next/cache";
import { createClient } from "../../../../lib/supabase/server";

export async function updateSystem(systemId, values) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return { error: "A módosításhoz bejelentkezés szükséges." };

  const { error } = await supabase.rpc("aic_update_ai_system_basics", {
    p_system_id: systemId,
    p_name: values?.name,
    p_lifecycle_stage: values?.lifecycleStage,
  });

  if (error) return { error: error.message || "A módosítás nem sikerült." };
  revalidatePath("/rendszerek");
  revalidatePath(`/rendszerek/${systemId}/szerkesztes`);
  revalidatePath(`/rendszerek/${systemId}/szabalyzat`);
  return { success: true };
}

export async function archiveSystem(systemId) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return { error: "A törléshez bejelentkezés szükséges." };

  const { error } = await supabase.rpc("aic_archive_ai_system", {
    p_system_id: systemId,
  });

  if (error) return { error: error.message || "A rendszer törlése nem sikerült." };
  revalidatePath("/rendszerek");
  return { success: true };
}
