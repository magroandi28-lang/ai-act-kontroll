#!/usr/bin/env python3
"""
EnergiaAI Kontroll - jogszabalyszoveg betolto.

Egy EUR-Lexrol letoltott jogszabaly HTML- vagy szovegfajljabol kikeresi a
cikkeket, es SQL-t general, amely betolti oket az adatbazisba.

Determinisztikus: ugyanabbol a bemenetbol mindig ugyanaz a kimenet.
Nyelvi modellt nem hasznal.

Hasznalat:
    python3 jogszabaly_betolto.py bemenet.html --celex 32024R1689 -o betoltes.sql

Kapcsolok:
    --celex     A jogforras CELEX-azonositoja (kotelezo)
    --url       A forras cime, ami bekerul a nyilvantartasba
    --lang      hu vagy en (alapertelmezes: automatikus felismeres)
    -o          A kimeneti SQL fajl neve
    --report    Reszletes lista a megtalalt cikkekrol
"""

import argparse
import hashlib
import html
import re
import sys
import unicodedata
from html.parser import HTMLParser
from pathlib import Path

# A blokkszintu elemek utan sortorest teszunk, hogy a bekezdesek ne folyjanak ossze.
BLOCK_TAGS = {
    "p", "div", "br", "tr", "li", "h1", "h2", "h3", "h4", "h5", "h6",
    "table", "td", "th", "section", "article", "blockquote",
}
SKIP_TAGS = {"script", "style", "head", "meta", "link", "noscript"}


class SzovegKinyero(HTMLParser):
    """HTML-bol egyszeru szoveget keszit, a bekezdeshatarok megtartasaval."""

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.reszek = []
        self.kihagyas_melyseg = 0

    def handle_starttag(self, tag, attrs):
        if tag in SKIP_TAGS:
            self.kihagyas_melyseg += 1
        elif tag in BLOCK_TAGS:
            self.reszek.append("\n")

    def handle_endtag(self, tag):
        if tag in SKIP_TAGS and self.kihagyas_melyseg > 0:
            self.kihagyas_melyseg -= 1
        elif tag in BLOCK_TAGS:
            self.reszek.append("\n")

    def handle_data(self, data):
        if self.kihagyas_melyseg == 0:
            self.reszek.append(data)

    def szoveg(self):
        return "".join(self.reszek)


def normalizal(szoveg: str) -> str:
    """Egyseges szokozok es sortoresek, hogy a feldolgozas kiszamithato legyen."""
    szoveg = unicodedata.normalize("NFC", szoveg)
    szoveg = szoveg.replace(" ", " ").replace(" ", " ").replace(" ", " ")
    szoveg = szoveg.replace("\r\n", "\n").replace("\r", "\n")
    szoveg = re.sub(r"[ \t]+", " ", szoveg)
    szoveg = re.sub(r" *\n *", "\n", szoveg)
    szoveg = re.sub(r"\n{3,}", "\n\n", szoveg)
    return szoveg.strip()


def html_to_text(tartalom: str) -> str:
    kinyero = SzovegKinyero()
    kinyero.feed(tartalom)
    return normalizal(html.unescape(kinyero.szoveg()))


# A cikkfejlecek felismerese. A magyar szoveg "26. cikk", az angol "Article 26".
MINTA = {
    "hu": re.compile(r"^\s*(\d+)\.\s*cikk\s*$", re.MULTILINE | re.IGNORECASE),
    "en": re.compile(r"^\s*Article\s+(\d+)\s*$", re.MULTILINE | re.IGNORECASE),
}


def nyelv_felismerese(szoveg: str) -> str:
    hu = len(MINTA["hu"].findall(szoveg))
    en = len(MINTA["en"].findall(szoveg))
    if hu == 0 and en == 0:
        raise SystemExit(
            "Nem talaltam cikkfejlecet a fajlban.\n"
            "Ellenorizd, hogy a teljes jogszabalyt mentetted-e le, "
            "es hogy HTML vagy szoveg formatumban van-e."
        )
    return "hu" if hu >= en else "en"


def cikkek_kinyerese(szoveg: str, nyelv: str):
    """
    Visszaadja a cikkeket (szam, cim, torzsszoveg) sorrendben.
    A torzs a kovetkezo cikkfejlecig vagy a mellekletek kezdeteig tart.
    """
    minta = MINTA[nyelv]
    talalatok = list(minta.finditer(szoveg))
    if not talalatok:
        return []

    # A mellekletek kezdete lezarja az utolso cikket.
    melleklet = re.search(
        r"^\s*(I{1,3}|IV|V|VI{0,3}|IX|XI{0,3})\.\s*MELL[EÉ]KLET\s*$|^\s*ANNEX\s+[IVX]+\s*$",
        szoveg,
        re.MULTILINE | re.IGNORECASE,
    )
    veg = melleklet.start() if melleklet else len(szoveg)

    eredmeny = []
    for i, talalat in enumerate(talalatok):
        szam = talalat.group(1)
        kezdet = talalat.end()
        kovetkezo = talalatok[i + 1].start() if i + 1 < len(talalatok) else veg
        if kezdet >= veg:
            break

        torzs = szoveg[kezdet:min(kovetkezo, veg)].strip()
        if not torzs:
            continue

        # Az elso sor jellemzoen a cikk cime.
        sorok = torzs.split("\n", 1)
        cim = sorok[0].strip()
        # Ha az elso sor tul hosszu vagy mondatvegi irasjellel zarul, akkor nem cim.
        if len(cim) > 120 or cim.endswith((".", ":", ";")):
            cim = ""
            tartalom = torzs
        else:
            tartalom = sorok[1].strip() if len(sorok) > 1 else ""

        teljes = (cim + "\n" + tartalom).strip() if cim else tartalom
        if len(teljes) < 40:
            continue

        eredmeny.append({"szam": szam, "cim": cim, "szoveg": teljes})

    # Duplikatum eseten a hosszabb valtozatot tartjuk meg (a rovid gyakran tartalomjegyzek).
    legjobb = {}
    for cikk in eredmeny:
        meglevo = legjobb.get(cikk["szam"])
        if meglevo is None or len(cikk["szoveg"]) > len(meglevo["szoveg"]):
            legjobb[cikk["szam"]] = cikk
    return [legjobb[k] for k in sorted(legjobb, key=lambda x: int(x))]


def sql_szoveg(ertek: str) -> str:
    return "'" + ertek.replace("'", "''") + "'"


def melylink(alap_url: str, szam: str, nyelv: str) -> str:
    """
    Szovegtoredek-hivatkozas, amely a bongeszot egyenesen a cikkhez gorgeti.
    Chromium alapu bongeszokben mukodik (Chrome, Edge).
    """
    if not alap_url:
        return ""
    horgony = f"{szam}. cikk" if nyelv == "hu" else f"Article {szam}"
    return f"{alap_url}#:~:text={horgony.replace(' ', '%20')}"


def main():
    parser = argparse.ArgumentParser(description="Jogszabalyszoveg betolto SQL-generalo")
    parser.add_argument("bemenet", help="A letoltott HTML vagy szoveg fajl")
    parser.add_argument("--celex", required=True, help="A jogforras CELEX-azonositoja")
    parser.add_argument("--url", default="", help="A forras cime")
    parser.add_argument("--lang", choices=["hu", "en"], help="Nyelv (alapertelmezes: felismeres)")
    parser.add_argument("-o", "--output", default="jogszabaly_betoltes.sql")
    parser.add_argument("--report", action="store_true", help="Reszletes lista")
    args = parser.parse_args()

    utvonal = Path(args.bemenet)
    if not utvonal.exists():
        raise SystemExit(f"A fajl nem talalhato: {utvonal}")

    nyers = utvonal.read_text(encoding="utf-8", errors="replace")
    szoveg = html_to_text(nyers) if "<" in nyers[:2000] else normalizal(nyers)

    nyelv = args.lang or nyelv_felismerese(szoveg)
    cikkek = cikkek_kinyerese(szoveg, nyelv)

    if not cikkek:
        raise SystemExit("Nem sikerult cikket kinyerni. Futtasd a --report kapcsoloval.")

    sorok = [
        "-- EnergiaAI Kontroll - jogszabalyszoveg betoltese.",
        f"-- Forras: {args.url or utvonal.name}",
        f"-- CELEX: {args.celex}",
        f"-- Nyelv: {nyelv}",
        f"-- Cikkek szama: {len(cikkek)}",
        "-- Ezt a fajlt a scripts/jogszabaly_betolto.py allitotta elo.",
        "-- Futtatas: Supabase Dashboard -> SQL Editor.",
        "",
        "begin;",
        "",
    ]

    for cikk in cikkek:
        link = melylink(args.url, cikk["szam"], nyelv)
        sorok.append(
            "select public.aic_upsert_legal_text(\n"
            f"  {sql_szoveg(args.celex)},\n"
            f"  {sql_szoveg(cikk['szam'])},\n"
            f"  {sql_szoveg(cikk['szoveg'])},\n"
            f"  {sql_szoveg(args.url) if args.url else 'null'},\n"
            f"  {sql_szoveg(link) if link else 'null'}\n"
            ");"
        )

    sorok.extend(["", "commit;", ""])
    Path(args.output).write_text("\n".join(sorok), encoding="utf-8")

    print(f"Nyelv:            {nyelv}")
    print(f"Megtalalt cikkek: {len(cikkek)}")
    print(f"Elso cikk:        {cikkek[0]['szam']}. - {cikkek[0]['cim'][:60]}")
    print(f"Utolso cikk:      {cikkek[-1]['szam']}. - {cikkek[-1]['cim'][:60]}")
    atlag = sum(len(c["szoveg"]) for c in cikkek) // len(cikkek)
    print(f"Atlagos hossz:    {atlag} karakter")
    print(f"Kimenet:          {args.output}")

    rovid = [c for c in cikkek if len(c["szoveg"]) < 200]
    if rovid:
        print(f"\nFigyelem: {len(rovid)} cikk 200 karakternel rovidebb. "
              "Ellenorizd, hogy nem a tartalomjegyzekbol szarmaznak-e:")
        for c in rovid[:5]:
            print(f"  {c['szam']}. cikk ({len(c['szoveg'])} karakter)")

    if args.report:
        print("\nTeljes lista:")
        for c in cikkek:
            print(f"  {c['szam']:>4}. cikk  {len(c['szoveg']):>6} kar.  {c['cim'][:70]}")


if __name__ == "__main__":
    main()
