/**
 * EnergiaAI Kontroll – jogszabályszöveg feldolgozó.
 *
 * Egy EUR-Lexről letöltött HTML-ből kiszedi a cikkeket, bekezdéseket és
 * alpontokat. Az EUR-Lex saját szerkezetére támaszkodik, nem szövegmintákra:
 *
 *     <div class="eli-subdivision" id="art_26">
 *       <p class="oj-ti-art">26. cikk</p>
 *       <div class="eli-title"><p class="oj-sti-art">A cikk címe</p></div>
 *       <div id="026.001"><p class="oj-normal">(1) …</p></div>
 *     </div>
 *
 * Determinisztikus: ugyanabból a bemenetből mindig ugyanaz a kimenet.
 * Ugyanaz a logika, mint a scripts/jogszabaly_betolto.py fájlban — az kézi
 * betöltésre való, ez az ütemezett frissítéshez.
 */

const CIKK_MINTA =
  /<div class="eli-subdivision"\s+id="(art_\d+[^"]*)"\s*>([\s\S]*?)(?=<div class="eli-subdivision"\s+id="art_|<div class="eli-container"|$)/gi;
const SZAM_MINTA = /art_(\d+)/;
const CIM_MINTA = /<p[^>]*class="oj-sti-art"[^>]*>([\s\S]*?)<\/p>/i;
const FEJLEC_MINTA = /<p[^>]*class="oj-ti-art"[^>]*>[\s\S]*?<\/p>/gi;
const BEKEZDES_MINTA = /<div id="(\d{3})\.(\d{3})"\s*>/gi;
const ALPONT_SOR = /<tr[^>]*>([\s\S]*?)<\/tr>/gi;
const ALPONT_CELLA = /<td[^>]*>([\s\S]*?)<\/td>/gi;
const ALPONT_JEL = /^([a-zA-Z])\)$/;

const ENTITASOK = {
  "&nbsp;": " ", "&amp;": "&", "&lt;": "<", "&gt;": ">",
  "&quot;": '"', "&#39;": "'", "&apos;": "'", "&mdash;": "—",
  "&ndash;": "–", "&hellip;": "…", "&laquo;": "«", "&raquo;": "»",
};

/** HTML-darabból olvasható szöveget készít, a bekezdéshatárok megtartásával. */
export function szoveg(darab) {
  if (!darab) return "";
  let s = darab
    .replace(/<(script|style)[^>]*>[\s\S]*?<\/\1>/gi, " ")
    .replace(/<br\s*\/?>/gi, "\n")
    .replace(/<\/(p|div|tr|li|h[1-6]|table)>/gi, "\n")
    .replace(/<[^>]+>/g, " ");

  s = s.replace(/&[a-zA-Z#0-9]+;/g, (e) => ENTITASOK[e] ?? e);
  s = s.normalize("NFC");

  // Törhetetlen és különleges szóközök egységesítése.
  s = s.replace(/[    ]/g, " ");
  s = s.replace(/\r\n?/g, "\n").replace(/[ \t]+/g, " ");
  s = s.replace(/ *\n */g, "\n").replace(/\n{3,}/g, "\n\n");
  return s.trim();
}

/** A bekezdésen belüli a) b) c) alpontokat szedi ki a táblázatból. */
function alpontokKinyerese(bekezdesHtml, bekezdes) {
  const eredmeny = [];
  for (const sor of bekezdesHtml.matchAll(ALPONT_SOR)) {
    const cellak = [...sor[1].matchAll(ALPONT_CELLA)].map((m) => m[1]);
    if (cellak.length < 2) continue;

    const jel = szoveg(cellak[0]).trim();
    const talalat = ALPONT_JEL.exec(jel);
    if (!talalat) continue;

    const tartalom = szoveg(cellak.slice(1).join(" "));
    if (tartalom.length < 25) continue;

    eredmeny.push({
      jel: `${bekezdes}(${talalat[1].toLowerCase()})`,
      szoveg: `${jel} ${tartalom}`,
    });
  }
  return eredmeny;
}

/** A cikk blokkjából kiszedi a számozott bekezdéseket és azok alpontjait. */
function bekezdesekKinyerese(blokk) {
  const talalatok = [...blokk.matchAll(BEKEZDES_MINTA)];
  const eredmeny = [];

  for (let i = 0; i < talalatok.length; i += 1) {
    const kezdet = talalatok[i].index + talalatok[i][0].length;
    const vege = i + 1 < talalatok.length ? talalatok[i + 1].index : blokk.length;
    const nyers = blokk.slice(kezdet, vege);
    const tartalom = szoveg(nyers);
    if (tartalom.length < 30) continue;

    // A "026.006" második fele a bekezdés sorszáma: 6.
    const bekezdes = String(Number.parseInt(talalatok[i][2], 10));
    eredmeny.push({
      bekezdes,
      szoveg: tartalom,
      alpontok: alpontokKinyerese(nyers, bekezdes),
    });
  }
  return eredmeny;
}

/** A teljes HTML-ből kiszedi a cikkeket. */
export function cikkekKinyerese(nyers) {
  const nyers_ = String(nyers || "");
  const osszes = [];

  for (const talalat of nyers_.matchAll(CIKK_MINTA)) {
    const horgony = talalat[1];
    const blokk = talalat[2];

    const szamTalalat = SZAM_MINTA.exec(horgony);
    if (!szamTalalat) continue;
    const szam = szamTalalat[1];

    const cimTalalat = CIM_MINTA.exec(blokk);
    const cim = cimTalalat ? szoveg(cimTalalat[1]) : "";

    const bekezdesek = bekezdesekKinyerese(blokk);

    let torzs = blokk.replace(FEJLEC_MINTA, " ");
    if (cimTalalat) torzs = torzs.replace(cimTalalat[0], " ");
    torzs = szoveg(torzs);
    if (torzs.length < 40) continue;

    osszes.push({
      szam,
      cim,
      horgony,
      szoveg: cim ? `${cim}\n${torzs}` : torzs,
      bekezdesek,
    });
  }

  // Ha egy cikk többször szerepel (például tartalomjegyzékben is),
  // a hosszabb változatot tartjuk meg.
  const legjobb = new Map();
  for (const cikk of osszes) {
    const meglevo = legjobb.get(cikk.szam);
    if (!meglevo || cikk.szoveg.length > meglevo.szoveg.length) {
      legjobb.set(cikk.szam, cikk);
    }
  }

  return [...legjobb.values()].sort((a, b) => Number(a.szam) - Number(b.szam));
}

/**
 * A cikkekből az adatbázis-betöltő által várt lapos listát készít:
 * cikkszint, bekezdésszint és alpontszint.
 */
export function betoltendoTetelek(cikkek, forrasUrl) {
  const tetelek = [];

  for (const cikk of cikkek) {
    const link = forrasUrl ? `${forrasUrl}#${cikk.horgony}` : null;

    tetelek.push({
      article: cikk.szam,
      paragraph: null,
      content: cikk.szoveg,
      deep_link: link,
      source_url: forrasUrl || null,
    });

    for (const bekezdes of cikk.bekezdesek) {
      tetelek.push({
        article: cikk.szam,
        paragraph: bekezdes.bekezdes,
        content: bekezdes.szoveg,
        deep_link: link,
        source_url: forrasUrl || null,
      });

      for (const alpont of bekezdes.alpontok) {
        tetelek.push({
          article: cikk.szam,
          paragraph: alpont.jel,
          content: alpont.szoveg,
          deep_link: link,
          source_url: forrasUrl || null,
        });
      }
    }
  }

  return tetelek;
}
