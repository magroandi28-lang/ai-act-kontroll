/**
 * EnergiaAI Kontroll – ütemezett jogszabályfrissítés.
 *
 * Letölti a beállított jogforrások hatályos szövegét, szétbontja cikkekre,
 * bekezdésekre és alpontokra, majd betölti az adatbázisba. Ha egy szövegrész
 * megváltozott, a betöltő függvény naplózza, és az érintett szabályokat
 * felülvizsgálandóvá teszi.
 *
 * Ütemezés: vercel.json -> crons. Hetente egyszer fut.
 * Kézzel is indítható a CRON_SECRET birtokában.
 */

import { createClient } from "@supabase/supabase-js";
import { cikkekKinyerese, betoltendoTetelek } from "../../../lib/jogszabaly-feldolgozo";

// A feldolgozás percekig tarthat, ezért nem futhat élettartam-korlátos módban.
export const dynamic = "force-dynamic";
export const maxDuration = 300;

// Egy kötegben ennyi szövegrészletet küldünk az adatbázisnak.
const KOTEG_MERET = 150;

function szolgaltatasiKliens() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const kulcs = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!url || !kulcs) {
    throw new Error("Hiányzik a NEXT_PUBLIC_SUPABASE_URL vagy a SUPABASE_SERVICE_ROLE_KEY.");
  }
  return createClient(url, kulcs, { auth: { persistSession: false } });
}

function jogosult(request) {
  const titok = process.env.CRON_SECRET;
  if (!titok) return false;
  return request.headers.get("authorization") === `Bearer ${titok}`;
}

async function forrastFrissit(supabase, forras) {
  const { data: futas } = await supabase
    .from("aic_legal_update_runs")
    .insert({ source_id: forras.id, source_title: forras.title, status: "running" })
    .select("id")
    .single();

  const futasId = futas?.id;

  async function lezar(mezok) {
    if (!futasId) return;
    await supabase
      .from("aic_legal_update_runs")
      .update({ finished_at: new Date().toISOString(), ...mezok })
      .eq("id", futasId);
  }

  try {
    const valasz = await fetch(forras.auto_update_url, {
      headers: {
        // Az EUR-Lex a böngészőknek küldi a teljes szöveget.
        "user-agent": "Mozilla/5.0 (compatible; EnergiaAIKontroll/1.0)",
        accept: "text/html",
      },
      cache: "no-store",
    });

    if (!valasz.ok) {
      throw new Error(`A forrás nem érhető el: HTTP ${valasz.status}`);
    }

    const html = await valasz.text();
    const cikkek = cikkekKinyerese(html);

    if (cikkek.length === 0) {
      throw new Error(
        "A letöltött oldalon nem található cikk. Lehet, hogy megváltozott a forrás szerkezete."
      );
    }

    const tetelek = betoltendoTetelek(cikkek, forras.auto_update_url);

    let feldolgozott = 0;
    let valtozott = 0;
    let erintett = 0;

    for (let i = 0; i < tetelek.length; i += KOTEG_MERET) {
      const koteg = tetelek.slice(i, i + KOTEG_MERET);
      const { data, error } = await supabase.rpc("aic_upsert_legal_text_batch", {
        p_celex: forras.celex_number,
        p_items: koteg,
        p_source_url: forras.auto_update_url,
      });
      if (error) throw new Error(error.message);

      feldolgozott += data?.processed || 0;
      valtozott += data?.changed || 0;
      erintett += data?.affected_rules || 0;
    }

    await supabase
      .from("aic_legal_sources")
      .update({ last_auto_update_at: new Date().toISOString() })
      .eq("id", forras.id);

    await lezar({
      status: "success",
      fetched_bytes: html.length,
      parsed_items: feldolgozott,
      changed_items: valtozott,
      affected_rules: erintett,
    });

    return {
      forras: forras.title,
      cikkek: cikkek.length,
      betoltott: feldolgozott,
      valtozott,
      erintett_szabaly: erintett,
    };
  } catch (hiba) {
    await lezar({ status: "error", error_message: hiba.message });
    return { forras: forras.title, hiba: hiba.message };
  }
}

export async function GET(request) {
  if (!jogosult(request)) {
    return Response.json({ hiba: "Nincs jogosultság." }, { status: 401 });
  }

  let supabase;
  try {
    supabase = szolgaltatasiKliens();
  } catch (hiba) {
    return Response.json({ hiba: hiba.message }, { status: 500 });
  }

  const { data: forrasok, error } = await supabase
    .from("aic_legal_sources")
    .select("id, title, celex_number, auto_update_url, auto_update_parser")
    .eq("auto_update_enabled", true)
    .eq("auto_update_parser", "eurlex")
    .not("auto_update_url", "is", null)
    .not("celex_number", "is", null);

  if (error) {
    return Response.json({ hiba: error.message }, { status: 500 });
  }

  if (!forrasok?.length) {
    return Response.json({ uzenet: "Nincs automatikus frissítésre beállított jogforrás." });
  }

  const eredmenyek = [];
  for (const forras of forrasok) {
    eredmenyek.push(await forrastFrissit(supabase, forras));
  }

  const valtozott = eredmenyek.reduce((osszeg, e) => osszeg + (e.valtozott || 0), 0);

  return Response.json({
    futott: new Date().toISOString(),
    forrasok: eredmenyek.length,
    valtozott_szovegresz: valtozott,
    reszletek: eredmenyek,
  });
}
