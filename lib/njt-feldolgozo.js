/**
 * EnergiaAI Kontroll – njt.hu értelmező.
 *
 * A Nemzeti Jogszabálytár minden szakaszt, bekezdést és pontot horgonnyal lát
 * el: `SZ47`, `SZ47@BE1`, `SZ47@BE1@POA`, `SZ25A@BE2@POB@APBA`. Ezekre
 * támaszkodunk, nem a szöveg formájára — a kereszthivatkozások ("a 36. §
 * szerint") így nem téveszthetik meg a feldolgozást.
 *
 * Determinisztikus: ugyanabból a bemenetből mindig ugyanaz a kimenet.
 * Nyelvi modellt nem használ.
 */

// Minden horgony érdekel, mert a szakaszcímek (TA...) zárják le a bekezdést.
const HORGONY = /<span class="jhId" id="([A-Z]{2}[0-9A-Z@]*)"><\/span>/g;

const ENTITASOK = {
  "&nbsp;": " ",
  "&ensp;": " ",
  "&emsp;": " ",
  "&thinsp;": " ",
  "&amp;": "&",
  "&lt;": "<",
  "&gt;": ">",
  "&quot;": '"',
  "&#39;": "'",
  "&aacute;": "á", "&eacute;": "é", "&iacute;": "í", "&oacute;": "ó",
  "&ouml;": "ö", "&otilde;": "ő", "&uacute;": "ú", "&uuml;": "ü",
  "&ucirc;": "û", "&udblac;": "ű", "&odblac;": "ő",
  "&Aacute;": "Á", "&Eacute;": "É", "&Iacute;": "Í", "&Oacute;": "Ó",
  "&Ouml;": "Ö", "&Otilde;": "Ő", "&Uacute;": "Ú", "&Uuml;": "Ü",
  "&ndash;": "–", "&mdash;": "—", "&hellip;": "…",
  "&bdquo;": "„", "&ldquo;": "”", "&rdquo;": "”",
};

/** HTML-részletből olvasható szöveg. A lábjegyzetszámokat elhagyjuk. */
export function szoveg(darab) {
  return (darab || "")
    // A lábjegyzet-hivatkozás szám, nem a törvény szövege.
    .replace(/<sup[^>]*class="fnSup"[^>]*>[\s\S]*?<\/sup>/gi, "")
    .replace(/<script[\s\S]*?<\/script>/gi, "")
    .replace(/<style[\s\S]*?<\/style>/gi, "")
    .replace(/<br\s*\/?>/gi, " ")
    .replace(/<\/(p|div|li|tr)>/gi, "\n")
    .replace(/<[^>]+>/g, "")
    .replace(/&#(\d+);/g, (_, k) => String.fromCharCode(Number(k)))
    .replace(/&[a-zA-Z#0-9]+;/g, (e) => ENTITASOK[e] ?? " ")
    .replace(/ | | | /g, " ")
    .replace(/[ \t]+/g, " ")
    .replace(/ *\n */g, "\n")
    .replace(/\n{2,}/g, "\n")
    .trim();
}

/**
 * A horgony azonosítójából emberi jelölés.
 *   SZ47            -> { cikk: "47",   bekezdes: null }
 *   SZ56A           -> { cikk: "56/A", bekezdes: null }
 *   SZ47@BE1        -> { cikk: "47",   bekezdes: "1" }
 *   SZ47@BE1A       -> { cikk: "47",   bekezdes: "1a" }
 *   SZ47@BE1@POA    -> { cikk: "47",   bekezdes: "1a)" -> pont
 *   SZ25A@BE2@POB@APBA -> negyedik szint
 */
export function horgonyErtelmezese(id) {
  const reszek = id.split("@");
  const szakasz = reszek[0].replace(/^SZ/, "");
  const cikk = szakasz.replace(/^(\d+)([A-Z])$/, "$1/$2");

  if (reszek.length === 1) return { cikk, bekezdes: null };

  const be = reszek[1].replace(/^BE/, "");
  // A BE0 azt jelenti, hogy a szakasznak nincs számozott bekezdése.
  const bekezdes = be === "0" ? null : be.replace(/^(\d+)([A-Z])$/, (_, sz, b) => sz + b.toLowerCase());

  if (reszek.length === 2) return { cikk, bekezdes };

  // A pontokat kötőjel választja el a bekezdéstől, különben a "(1a) bekezdés"
  // és az "(1) a) pont" ugyanazt a jelet kapná.
  const pontok = reszek
    .slice(2)
    .map((r) => r.replace(/^(PO|AP)/, "").toLowerCase());

  return { cikk, bekezdes: [bekezdes || "0", ...pontok].join("-") };
}

/**
 * Végigmegy a horgonyokon, és mindegyikhez hozzárendeli a következő horgonyig
 * tartó szöveget. Így minden szint önálló tételként kerül be.
 */
export function njtTetelek(nyers, forrasUrl) {
  const talalatok = [];
  let m;
  HORGONY.lastIndex = 0;
  while ((m = HORGONY.exec(nyers)) !== null) {
    talalatok.push({ id: m[1], kezdet: m.index + m[0].length });
  }
  if (talalatok.length === 0) return [];

  const tetelek = [];
  const cikkSzovegek = new Map();

  // A bekezdés szövege a hozzá tartozó pontokat is tartalmazza, ezért a
  // következő bekezdés- vagy szakaszhorgonyig tart, nem a következő pontig.
  // Így a bekezdés egyben olvasható, és a jogalap-hivatkozás is erre mutat.
  const bekezdesSzint = (id) => id.startsWith("SZ") && id.split("@").length <= 2;
  // A tagoló cím (TA...) nem a bekezdés része: lezárja azt. Enélkül a
  // következő szakasz címe hozzáragadna az utolsó bekezdéshez.
  const lezaro = (id) => bekezdesSzint(id) || !id.startsWith("SZ");

  for (let i = 0; i < talalatok.length; i += 1) {
    const { id, kezdet } = talalatok[i];
    if (!bekezdesSzint(id)) continue;

    let vegIndex = talalatok.length;
    for (let j = i + 1; j < talalatok.length; j += 1) {
      if (lezaro(talalatok[j].id)) { vegIndex = j; break; }
    }
    const veg = vegIndex < talalatok.length ? talalatok[vegIndex].kezdet : nyers.length;
    let tartalom = szoveg(nyers.slice(kezdet, veg));
    if (!tartalom) continue;

    // A njt.hu az első bekezdés elé kiírja a szakasz számát ("47. § (1) ...").
    // Az adatbázisban a bekezdés e nélkül szerepel, ezért levágjuk – enélkül
    // minden szakasz első bekezdése hamisan megváltozottnak látszana.
    tartalom = tartalom.replace(/^\d+(?:\/[A-Z])?\.\s*§\s*/, "");

    // A bekezdés egyetlen folyamatos szöveg: a pontok elé szóköz kerül, nem
    // sortörés. Így egyezik a korábbi betöltéssel, és a hash-összevetés csak
    // valódi jogszabály-változásra jelez.
    tartalom = tartalom.replace(/\s*\n\s*/g, " ").replace(/[ ]{2,}/g, " ").trim();

    const { cikk, bekezdes } = horgonyErtelmezese(id);
    if (!cikk) continue;

    // A szakasz teljes szövege a hozzá tartozó darabok összefűzése.
    const eddig = cikkSzovegek.get(cikk) || [];
    eddig.push(tartalom);
    cikkSzovegek.set(cikk, eddig);

    if (bekezdes) {
      tetelek.push({
        article: cikk,
        paragraph: bekezdes,
        content: tartalom,
        deep_link: forrasUrl ? `${forrasUrl}#${id}` : null,
        source_url: forrasUrl || null,
      });
    }
  }

  // Szakaszszintű tétel: a bekezdések összefűzve, hogy a jogtárban a teljes
  // szakasz is elérhető legyen.
  for (const [cikk, darabok] of cikkSzovegek) {
    const teljes = darabok.join("\n").trim();
    if (teljes.length < 20) continue;
    tetelek.push({
      article: cikk,
      paragraph: null,
      content: teljes,
      deep_link: forrasUrl ? `${forrasUrl}#SZ${cikk.replace("/", "")}` : null,
      source_url: forrasUrl || null,
    });
  }

  return tetelek;
}
