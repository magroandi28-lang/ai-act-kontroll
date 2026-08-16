#!/usr/bin/env python3
"""
EnergiaAI Kontroll - jogszabalyszoveg betolto.

Egy EUR-Lexrol letoltott jogszabaly HTML-fajljabol kikeresi a cikkeket es a
bekezdeseket, es SQL-t general, amely betolti oket az adatbazisba.

Az EUR-Lex sajat szerkezetere tamaszkodik, nem szovegmintakra:
    <div class="eli-subdivision" id="art_26">
        <p class="oj-ti-art">26. cikk</p>
        <div class="eli-title"><p class="oj-sti-art">A cikk cime</p></div>
        <div id="026.001"><p class="oj-normal">(1) ...</p></div>
        <div id="026.006"><p class="oj-normal">(6) ...</p></div>
    </div>

Ket szinten tolt be:
  - cikkszinten, a bekezdesszam nelkuli hivatkozasokhoz,
  - bekezdesszinten, hogy az elteresek pontosan osszevethetok legyenek.

Determinisztikus: ugyanabbol a bemenetbol mindig ugyanaz a kimenet.
Nyelvi modellt nem hasznal.

Hasznalat:
    python jogszabaly_betolto.py aiact.html --celex 02024R1689-20260727 \
        --url "https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun" \
        -o betoltes.sql --report
"""

import argparse
import html
import re
import unicodedata
from pathlib import Path

CIKK_MINTA = re.compile(
    r'<div class="eli-subdivision"\s+id="(art_\d+[^"]*)"\s*>(.*?)'
    r'(?=<div class="eli-subdivision"\s+id="art_|<div class="eli-container"|\Z)',
    re.S | re.I,
)
SZAM_MINTA = re.compile(r'art_(\d+)')
CIM_MINTA = re.compile(r'<p[^>]*class="oj-sti-art"[^>]*>(.*?)</p>', re.S | re.I)
FEJLEC_MINTA = re.compile(r'<p[^>]*class="oj-ti-art"[^>]*>(.*?)</p>', re.S | re.I)
# Bekezdesblokk: <div id="026.006"> ... a kovetkezo azonos szintu divig.
BEKEZDES_MINTA = re.compile(r'<div id="(\d{3})\.(\d{3})"\s*>', re.I)


def szoveg(darab: str) -> str:
    """HTML-darabbol olvashato szoveget keszit, bekezdeshatarok megtartasaval."""
    darab = re.sub(r'<(script|style)[^>]*>.*?</\1>', ' ', darab, flags=re.S | re.I)
    darab = re.sub(r'<br\s*/?>', '\n', darab, flags=re.I)
    darab = re.sub(r'</(p|div|tr|li|h[1-6]|table)>', '\n', darab, flags=re.I)
    darab = re.sub(r'<[^>]+>', ' ', darab)
    darab = html.unescape(darab)
    darab = unicodedata.normalize("NFC", darab)
    for szokoz in (" ", " ", " ", " "):
        darab = darab.replace(szokoz, " ")
    darab = darab.replace("\r\n", "\n").replace("\r", "\n")
    darab = re.sub(r"[ \t]+", " ", darab)
    darab = re.sub(r" *\n *", "\n", darab)
    darab = re.sub(r"\n{3,}", "\n\n", darab)
    return darab.strip()


def bekezdesek_kinyerese(blokk: str, cikkszam: str):
    """A cikk blokkjabol kiszedi a szamozott bekezdeseket."""
    talalatok = list(BEKEZDES_MINTA.finditer(blokk))
    eredmeny = []
    for i, t in enumerate(talalatok):
        vege = talalatok[i + 1].start() if i + 1 < len(talalatok) else len(blokk)
        nyers = blokk[t.end():vege]
        tartalom = szoveg(nyers)
        if len(tartalom) < 30:
            continue
        # A "026.006" masodik fele a bekezdes sorszama: 6.
        bekezdes = str(int(t.group(2)))
        eredmeny.append({"bekezdes": bekezdes, "szoveg": tartalom})
    return eredmeny


def cikkek_kinyerese(nyers: str):
    eredmeny = []
    for horgony, blokk in CIKK_MINTA.findall(nyers):
        szam_talalat = SZAM_MINTA.search(horgony)
        if not szam_talalat:
            continue
        szam = szam_talalat.group(1)

        cim_talalat = CIM_MINTA.search(blokk)
        cim = szoveg(cim_talalat.group(1)) if cim_talalat else ""

        bekezdesek = bekezdesek_kinyerese(blokk, szam)

        torzs = FEJLEC_MINTA.sub(" ", blokk)
        torzs = CIM_MINTA.sub(" ", torzs)
        torzs = szoveg(torzs)
        if len(torzs) < 40:
            continue

        teljes = f"{cim}\n{torzs}".strip() if cim else torzs
        eredmeny.append({
            "szam": szam, "cim": cim, "horgony": horgony,
            "szoveg": teljes, "bekezdesek": bekezdesek,
        })

    legjobb = {}
    for cikk in eredmeny:
        meglevo = legjobb.get(cikk["szam"])
        if meglevo is None or len(cikk["szoveg"]) > len(meglevo["szoveg"]):
            legjobb[cikk["szam"]] = cikk
    return [legjobb[k] for k in sorted(legjobb, key=int)]


def sql_szoveg(ertek: str) -> str:
    return "'" + ertek.replace("'", "''") + "'"


def hivas(celex, cikk, bekezdes, tartalom, url, link):
    return (
        "select public.aic_upsert_legal_text(\n"
        f"  {sql_szoveg(celex)},\n"
        f"  {sql_szoveg(cikk)},\n"
        f"  {sql_szoveg(bekezdes) if bekezdes else 'null'},\n"
        f"  {sql_szoveg(tartalom)},\n"
        f"  {sql_szoveg(url) if url else 'null'},\n"
        f"  {sql_szoveg(link) if link else 'null'}\n"
        ");"
    )


def main():
    parser = argparse.ArgumentParser(description="Jogszabalyszoveg betolto SQL-generalo")
    parser.add_argument("bemenet", help="A letoltott EUR-Lex HTML fajl")
    parser.add_argument("--celex", required=True, help="A jogforras CELEX-azonositoja")
    parser.add_argument("--url", default="", help="A forras cime")
    parser.add_argument("-o", "--output", default="jogszabaly_betoltes.sql")
    parser.add_argument("--report", action="store_true", help="Reszletes lista")
    args = parser.parse_args()

    utvonal = Path(args.bemenet)
    if not utvonal.exists():
        raise SystemExit(f"A fajl nem talalhato: {utvonal}")

    nyers = utvonal.read_text(encoding="utf-8", errors="replace")
    cikkek = cikkek_kinyerese(nyers)

    if not cikkek:
        raise SystemExit(
            "Nem talaltam cikket a fajlban.\n"
            "Ellenorizd, hogy az EUR-Lex teljes jogszabalyoldalat mentetted-e le "
            "(a HTML-ben szerepelnie kell az 'eli-subdivision' es 'oj-ti-art' jelolesnek)."
        )

    sorok = [
        "-- EnergiaAI Kontroll - jogszabalyszoveg betoltese.",
        f"-- Forras: {args.url or utvonal.name}",
        f"-- CELEX: {args.celex}",
        f"-- Cikkek: {len(cikkek)}",
        f"-- Bekezdesek: {sum(len(c['bekezdesek']) for c in cikkek)}",
        "-- Ezt a fajlt a scripts/jogszabaly_betolto.py allitotta elo.",
        "-- Futtatas: Supabase Dashboard -> SQL Editor.",
        "",
        "begin;",
        "",
    ]

    for cikk in cikkek:
        link = f"{args.url}#{cikk['horgony']}" if args.url else ""
        # Cikkszint: a bekezdesszam nelkuli hivatkozasoknak.
        sorok.append(hivas(args.celex, cikk["szam"], None, cikk["szoveg"], args.url, link))
        # Bekezdesszint: a pontos osszevetesnek.
        for b in cikk["bekezdesek"]:
            sorok.append(hivas(args.celex, cikk["szam"], b["bekezdes"], b["szoveg"], args.url, link))

    sorok.extend(["", "commit;", ""])
    Path(args.output).write_text("\n".join(sorok), encoding="utf-8")

    osszes_bekezdes = sum(len(c["bekezdesek"]) for c in cikkek)
    hosszak = [len(c["szoveg"]) for c in cikkek]
    print(f"Megtalalt cikkek:   {len(cikkek)}")
    print(f"Ebbol bekezdes:     {osszes_bekezdes}")
    print(f"Elso cikk:          {cikkek[0]['szam']}. - {cikkek[0]['cim'][:55]}")
    print(f"Utolso cikk:        {cikkek[-1]['szam']}. - {cikkek[-1]['cim'][:55]}")
    print(f"Atlagos cikkhossz:  {sum(hosszak)//len(hosszak)} karakter")
    print(f"Kimenet:            {args.output}")

    bekezdes_nelkul = [c for c in cikkek if not c["bekezdesek"]]
    if bekezdes_nelkul:
        print(f"\n{len(bekezdes_nelkul)} cikknek nincs szamozott bekezdese "
              "(ezek csak cikkszinten hasonlithatok ossze):")
        for c in bekezdes_nelkul[:8]:
            print(f"  {c['szam']}. cikk - {c['cim'][:55]}")

    if args.report:
        print("\nTeljes lista:")
        for c in cikkek:
            print(f"  {c['szam']:>4}. cikk  {len(c['bekezdesek']):>3} bek.  "
                  f"{len(c['szoveg']):>6} kar.  {c['cim'][:60]}")


if __name__ == "__main__":
    main()
