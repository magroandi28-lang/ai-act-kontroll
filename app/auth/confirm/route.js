import { NextResponse } from "next/server";
import { createClient } from "../../../lib/supabase/server";
import { createInitialAccountData } from "../../../lib/auth/bootstrap";

export async function GET(request) {
  const requestUrl = new URL(request.url);
  const code = requestUrl.searchParams.get("code");
  const origin = requestUrl.origin;

  if (!code) {
    return NextResponse.redirect(
      `${origin}/?hiba=ervenytelen-megerosites`
    );
  }

  const supabase = createClient();

  const { error: exchangeError } =
    await supabase.auth.exchangeCodeForSession(code);

  if (exchangeError) {
    return NextResponse.redirect(
      `${origin}/?hiba=ervenytelen-megerosites`
    );
  }

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return NextResponse.redirect(
      `${origin}/?hiba=ervenytelen-megerosites`
    );
  }

  try {
    await createInitialAccountData(supabase, user);
  } catch {
    return NextResponse.redirect(
      `${origin}/?hiba=fiok-adatok`
    );
  }

  return NextResponse.redirect(
    `${origin}/vezerlopult`
  );
}
