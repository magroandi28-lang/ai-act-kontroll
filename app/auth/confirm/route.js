import { NextResponse } from "next/server";
import { createClient } from "../../../lib/supabase/server";
import { createInitialAccountData } from "../../../lib/auth/bootstrap";

export async function GET(request) {
  const requestUrl = new URL(request.url);
  const code = requestUrl.searchParams.get("code");
  const tokenHash =
    requestUrl.searchParams.get("token_hash");
  const type = requestUrl.searchParams.get("type");
  const origin = requestUrl.origin;

  const supabase = createClient();
  let confirmationError;

  if (tokenHash && type) {
    const result = await supabase.auth.verifyOtp({
      token_hash: tokenHash,
      type,
    });

    confirmationError = result.error;
  } else if (code) {
    const result =
      await supabase.auth.exchangeCodeForSession(code);

    confirmationError = result.error;
  } else {
    return NextResponse.redirect(
      `${origin}/auth/hiba`
    );
  }

  if (confirmationError) {
    return NextResponse.redirect(
      `${origin}/auth/hiba`
    );
  }

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return NextResponse.redirect(
      `${origin}/auth/hiba`
    );
  }

  try {
    await createInitialAccountData(supabase, user);
  } catch (error) {
    // Az e-mail megerősítése ettől még sikeres volt.
    // Az induló fiókadatok hibája nem teheti
    // hibássá a megerősítő linket.
    console.error(
      "Az induló fiókadatok létrehozása nem sikerült:",
      error
    );

    return NextResponse.redirect(
      `${origin}/vezerlopult?fiok_adatok=hiba`
    );
  }

  return NextResponse.redirect(
    `${origin}/vezerlopult`
  );
}
