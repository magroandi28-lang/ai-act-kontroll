import { NextResponse } from "next/server";
import { createClient } from "../../../lib/supabase/server";
import { createInitialAccountData } from "../../../lib/auth/bootstrap";

// Csak alkalmazáson belüli útvonalra irányítunk tovább. Külső cím megadása
// nyílt átirányítás lenne: a levélben lévő link idegen oldalra vihetné a
// felhasználót úgy, hogy az a mi címünkről indul.
function biztonsagosCel(ertek) {
  const cel = String(ertek || "");
  if (!cel.startsWith("/") || cel.startsWith("//")) return null;
  return cel;
}

export async function GET(request) {
  const requestUrl = new URL(request.url);
  const code = requestUrl.searchParams.get("code");
  const tokenHash = requestUrl.searchParams.get("token_hash");
  const type = requestUrl.searchParams.get("type");
  const tovabb = biztonsagosCel(requestUrl.searchParams.get("tovabb"));
  const origin = requestUrl.origin;

  const supabase = createClient();
  let confirmationError;

  if (tokenHash && type) {
    const result = await supabase.auth.verifyOtp({ token_hash: tokenHash, type });
    confirmationError = result.error;
  } else if (code) {
    const result = await supabase.auth.exchangeCodeForSession(code);
    confirmationError = result.error;
  } else {
    return NextResponse.redirect(`${origin}/auth/hiba`);
  }

  if (confirmationError) {
    return NextResponse.redirect(`${origin}/auth/hiba`);
  }

  const { data: { user } } = await supabase.auth.getUser();

  if (!user) {
    return NextResponse.redirect(`${origin}/auth/hiba`);
  }

  // Meghívott és jelszót visszaállító felhasználónak előbb jelszót kell
  // adnia, különben munkamenete lenne, de belépni később nem tudna.
  // A "tovabb" paraméter a saját oldalainkról érkezik; a type a Supabase
  // levélsablonjából, ha a paraméter hiányzik.
  const jelszoBeallitas = tovabb || (type === "recovery" || type === "invite" ? "/jelszo/uj" : null);

  try {
    await createInitialAccountData(supabase, user);
  } catch (error) {
    // Az e-mail megerősítése ettől még sikeres volt. Az induló fiókadatok
    // hibája nem teheti hibássá a megerősítő linket.
    console.error("Az induló fiókadatok létrehozása nem sikerült:", error);

    if (jelszoBeallitas) {
      return NextResponse.redirect(`${origin}${jelszoBeallitas}`);
    }
    return NextResponse.redirect(`${origin}/vezerlopult?fiok_adatok=hiba`);
  }

  if (jelszoBeallitas) {
    return NextResponse.redirect(`${origin}${jelszoBeallitas}`);
  }

  return NextResponse.redirect(`${origin}/vezerlopult`);
}
