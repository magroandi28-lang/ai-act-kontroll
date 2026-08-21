"use server";

import { revalidatePath } from "next/cache";
import { headers } from "next/headers";
import { createClient as createAdminClient } from "@supabase/supabase-js";
import { createClient } from "../../lib/supabase/server";

const ROLES = new Set(["owner", "admin", "compliance", "editor"]);

// A meghívólevél kiküldéséhez szolgálati kulcs kell: egy sima felhasználó
// nem hozhat létre másik felhasználót. A jogosultság ellenőrzése viszont
// NEM itt történik, hanem az adatbázisban – lásd aic_tag_felvetele.
function adminClient() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!url || !key) {
    throw new Error(
      "Hiányzik a NEXT_PUBLIC_SUPABASE_URL vagy a SUPABASE_SERVICE_ROLE_KEY környezeti változó."
    );
  }
  return createAdminClient(url, key, { auth: { persistSession: false } });
}

// A Supabase hibaüzenetei angolul érkeznek. A gyakoriakat lefordítjuk,
// mert a felhasználónak tudnia kell, mit tegyen.
function forditottHiba(message) {
  const szoveg = String(message || "");
  if (/rate limit|too many requests|for security purposes/i.test(szoveg)) {
    return (
      "A Supabase óránként korlátozott számú levelet küld ki saját levelezőszerver nélkül. " +
      "Várj egy órát, vagy állíts be saját SMTP-t a Supabase Authentication beállításainál."
    );
  }
  if (/already registered|already been registered|user already exists/i.test(szoveg)) {
    return "Ez az e-mail cím már regisztrált. A meghívás helyett hozzáadtuk a szervezethez.";
  }
  if (/invalid email|unable to validate email/i.test(szoveg)) {
    return "Az e-mail cím formátuma nem megfelelő.";
  }
  return szoveg || "A művelet nem sikerült.";
}

// A régebbi Supabase-kiadásokban nincs e-mail szerinti keresés, ezért
// lapozva keressük meg a meglévő felhasználót.
async function meglevoFelhasznalo(admin, email) {
  const keresett = email.trim().toLowerCase();
  for (let page = 1; page <= 20; page += 1) {
    const { data, error } = await admin.auth.admin.listUsers({ page, perPage: 200 });
    if (error) return null;
    const users = data?.users || [];
    const talalat = users.find(
      (user) => String(user.email || "").toLowerCase() === keresett
    );
    if (talalat) return talalat;
    if (users.length < 200) return null;
  }
  return null;
}

async function bejelentkezettFelhasznalo() {
  const supabase = createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) throw new Error("A művelethez bejelentkezés szükséges.");
  if (user.is_anonymous) {
    throw new Error("Demó módban a szervezeti tagok nem módosíthatók.");
  }
  return supabase;
}

export async function inviteMember(organisationId, formData) {
  const nev = String(formData.get("full_name") || "").trim().replace(/\s+/g, " ");
  const email = String(formData.get("email") || "").trim();
  const role = String(formData.get("member_role") || "").trim();

  if (!email) return { error: "Add meg a meghívandó személy e-mail címét." };
  if (!ROLES.has(role)) return { error: "Válassz szerepkört." };

  let supabase;
  try {
    supabase = await bejelentkezettFelhasznalo();
  } catch (error) {
    return { error: error.message };
  }

  let admin;
  try {
    admin = adminClient();
  } catch (error) {
    return { error: error.message };
  }

  let userId = null;
  let uzenet = "A meghívólevél elment.";

  // A célcímet mi adjuk meg, nem a Supabase Site URL mezőjéből vesszük: az
  // fejlesztői értéken maradhat, és akkor a meghívó levél a localhostra vinne.
  const fejlecek = headers();
  const gazda = fejlecek.get("x-forwarded-host") || fejlecek.get("host") || "";
  const protokoll = fejlecek.get("x-forwarded-proto") || (gazda.startsWith("localhost") ? "http" : "https");
  const cel = gazda ? `${protokoll}://${gazda}/auth/confirm?tovabb=/jelszo/uj` : undefined;

  const { data: invited, error: inviteError } = await admin.auth.admin.inviteUserByEmail(
    email,
    { data: nev ? { full_name: nev } : {}, redirectTo: cel }
  );

  if (inviteError) {
    // Ha a felhasználó már létezik, nem hiba: csak nem kell új levél.
    const meglevo = await meglevoFelhasznalo(admin, email);
    if (!meglevo) {
      return { error: forditottHiba(inviteError.message) };
    }
    userId = meglevo.id;
    uzenet = "Ez a felhasználó már regisztrált, ezért levél nélkül hozzáadtuk a szervezethez.";
  } else {
    userId = invited?.user?.id || null;
  }

  if (!userId) {
    return { error: "A felhasználó azonosítója nem állapítható meg." };
  }

  // A jogosultság ellenőrzése az adatbázisban történik, a bejelentkezett
  // felhasználó nevében – nem a szolgálati kulccsal.
  const { error: memberError } = await supabase.rpc("aic_tag_felvetele", {
    p_organisation_id: organisationId,
    p_user_id: userId,
    p_member_role: role,
  });

  if (memberError) {
    return { error: memberError.message || "A tag felvétele nem sikerült." };
  }

  revalidatePath("/szervezet");
  return { success: true, message: uzenet };
}

export async function changeRole(organisationId, userId, role) {
  if (!ROLES.has(role)) return { error: "Ismeretlen szerepkör." };

  let supabase;
  try {
    supabase = await bejelentkezettFelhasznalo();
  } catch (error) {
    return { error: error.message };
  }

  const { error } = await supabase.rpc("aic_tag_szerepkore", {
    p_organisation_id: organisationId,
    p_user_id: userId,
    p_member_role: role,
  });

  if (error) return { error: error.message || "A szerepkör módosítása nem sikerült." };

  revalidatePath("/szervezet");
  return { success: true, message: "A szerepkör módosult." };
}

export async function removeMember(organisationId, userId) {
  let supabase;
  try {
    supabase = await bejelentkezettFelhasznalo();
  } catch (error) {
    return { error: error.message };
  }

  const { error } = await supabase.rpc("aic_tag_torlese", {
    p_organisation_id: organisationId,
    p_user_id: userId,
  });

  if (error) return { error: error.message || "A tag eltávolítása nem sikerült." };

  revalidatePath("/szervezet");
  return { success: true, message: "A tagot eltávolítottuk a szervezetből." };
}
