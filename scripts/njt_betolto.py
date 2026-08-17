#!/usr/bin/env python3
"""
EnergiaAI Kontroll - njt.hu jogszabalybetolto.

A magyar jogszabalyok szerkezete mas, mint az EUR-Lexe: nincs "cikk", hanem
szakasz (§), azon belul bekezdes (1), (2), es pont a), b).

    1. § E torveny celja
    2. § (1) E torveny alkalmazasi kore kiterjed
    4/A. § A felhasznalok biztonsagos ellatasa kiemelt kozerdek.

A njt.hu a labjegyzetek sorszamat kozvetlenul a jelolo utan irja ki
(pl. "4/A. §106", "4. § (1)102"), ezt le kell valasztani, kulonben a
szoveg valtozasat jelezne minden labjegyzet-atszamozas.

Nem a HTML szerkezetere tamaszkodik, hanem a jogszabalyi szerkezetre:
eloszor szoveggé alakit, utana a § es a bekezdesjelolok menten bont.
Ez ellenallo a njt.hu oldalszerkezetenek valtozasaval szemben.

Determinisztikus: ugyanabbol a bemenetbol mindig ugyanaz a kimenet.
Nyelvi modellt nem hasznal.

Hasznalat:
    python njt_betolto.py --url https://njt.hu/jogszabaly/2007-86-00-00 \
        --azonosito NJT-2007-86-00-00 -o vet.sql --report

    python njt_betolto.py mentett_oldal.html --azonosito NJT-2007-86-00-00 -o vet.sql
"""

import argparse
import html
import re
import sys
import unicodedata
from pathlib import Path
from urllib.request import Request, urlopen

# A mellekletek jelolese jogszabalyonkent elter:
#   "1. melleklet a 2022. evi XVII. torvenyhez"
#   "1. szamu melleklet a 273/2007. (X. 19.) Korm. rendelethez"
#   "22/a. szamu melleklet ..."
# A "szamu" szo opcionalis, a sorszam kaphat betutoldatot.
# Cimkent csak akkor ismerjuk fel, ha sorkezdo, vagy ha utana a jogszabaly
# megjelolese all (szam kezdi) - igy a szovegkozi hivatkozasok
# ("az 1. melleklet szerinti") nem tevesztenek meg.
MELLEKLET = re.compile(
    r'(?m)(?:^\s*(\d+(?:/[a-zA-Z])?)\.\s*(?:sz(?:\.|ámú)\s*)?mell[ée]klet\b'
    r'|(\d+(?:/[a-zA-Z])?)\.\s*(?:sz(?:\.|ámú)\s*)?mell[ée]klet\s+a[z]?\s+\d)'
)

SZAKASZ = re.compile(r'(?m)^\s*(\d+(?:/[A-ZÁÉÍÓÖŐÚÜŰ])?)\.\s*§\s*(?:\d{1,4})?\s*')
# "(1)" a sor elejen, utana opcionalis labjegyzetszam.
BEKEZDES = re.compile(r'(?m)^\s*\((\d{1,3})\)\s*(?:\d{1,4})?\s*')


def szoveg(darab: str) -> str:
    """HTML-bol olvashato szoveg, a bekezdeshatarok megtartasaval."""
    darab = re.sub(r'<(script|style)[^>]*>.*?</\1>', ' ', darab, flags=re.S | re.I)
    darab = re.sub(r'<br\s*/?>', '\n', darab, flags=re.I)
    darab = re.sub(r'</(p|div|tr|li|h[1-6]|table)>', '\n', darab, flags=re.I)
    darab = re.sub(r'<[^>]+>', ' ', darab)
    darab = html.unescape(darab)
    darab = unicodedata.normalize("NFC", darab)
    for sz in (" ", " ", " ", " "):
        darab = darab.replace(sz, " ")
    darab = darab.replace("\r\n", "\n").replace("\r", "\n")
    darab = re.sub(r"[ \t]+", " ", darab)
    darab = re.sub(r" *\n *", "\n", darab)
    darab = re.sub(r"\n{3,}", "\n\n", darab)
    return darab.strip()


def bekezdesek(torzs: str):
    """Egy szakasz torzsebol kiszedi a szamozott bekezdeseket."""
    talalatok = list(BEKEZDES.finditer(torzs))
    if not talalatok:
        return []
    eredmeny = []
    for i, t in enumerate(talalatok):
        vege = talalatok[i + 1].start() if i + 1 < len(talalatok) else len(torzs)
        tartalom = torzs[t.end():vege].strip()
        if len(tartalom) < 15:
            continue
        eredmeny.append({"bekezdes": t.group(1), "szoveg": tartalom})
    return eredmeny


def mellekletek_kinyerese(tiszta: str):
    """A jogszabaly vegen allo mellekleteket szedi ki.

    A mellekletek nem szakaszokra tagolodnak, ezert egyben taroljuk oket,
    "1. melleklet" kulccsal – pontosan ugy, ahogy a szabalykatalogus hivatkozik
    rajuk. Igy a kereses megtalalja oket.
    """
    talalatok = list(MELLEKLET.finditer(tiszta))
    if not talalatok:
        return []
    eredmeny = {}
    for i, t in enumerate(talalatok):
        vege = talalatok[i + 1].start() if i + 1 < len(talalatok) else len(tiszta)
        tartalom = tiszta[t.start():vege].strip()
        if len(tartalom) < 60:
            continue
        kulcs = f"{t.group(1) or t.group(2)}. melléklet"
        # Tartalomjegyzekben is szerepelhet a cim; a hosszabb valtozat a valodi.
        if len(tartalom) > len(eredmeny.get(kulcs, "")):
            eredmeny[kulcs] = tartalom
    def rendez(tetel):
        # "23/b. melléklet" -> (23, "b"). A puszta int() elszallt a betutoldaton.
        kulcs = tetel[0].split(".")[0]
        m = re.match(r'(\d+)(?:/([a-zA-Z]))?$', kulcs)
        return (int(m.group(1)), (m.group(2) or "").lower()) if m else (9999, kulcs)

    return [{"szakasz": k, "szoveg": v, "bekezdesek": []}
            for k, v in sorted(eredmeny.items(), key=rendez)]


def szakaszok_kinyerese(nyers: str):
    tiszta = szoveg(nyers)
    talalatok = list(SZAKASZ.finditer(tiszta))
    if not talalatok:
        return []

    eredmeny = []
    for i, t in enumerate(talalatok):
        vege = talalatok[i + 1].start() if i + 1 < len(talalatok) else len(tiszta)
        torzs = tiszta[t.end():vege].strip()
        if len(torzs) < 20:
            continue
        eredmeny.append({
            "szakasz": t.group(1),
            "szoveg": torzs,
            "bekezdesek": bekezdesek(torzs),
        })

    # Ugyanaz a szakaszszam tobbszor is elofordulhat (tartalomjegyzek,
    # kereszthivatkozas). A leghosszabb valtozat a valodi torzsszoveg.
    legjobb = {}
    for sz in eredmeny:
        meglevo = legjobb.get(sz["szakasz"])
        if meglevo is None or len(sz["szoveg"]) > len(meglevo["szoveg"]):
            legjobb[sz["szakasz"]] = sz

    def rendez(kulcs):
        m = re.match(r'(\d+)(?:/([A-ZÁÉÍÓÖŐÚÜŰ]))?$', kulcs)
        return (int(m.group(1)), m.group(2) or "")

    return [legjobb[k] for k in sorted(legjobb, key=rendez)]


def sql_szoveg(ertek: str) -> str:
    return "'" + ertek.replace("'", "''") + "'"


def hivas(azonosito, szakasz, bekezdes, tartalom, url, link):
    return (
        "select public.aic_upsert_legal_text(\n"
        f"  {sql_szoveg(azonosito)},\n"
        f"  {sql_szoveg(szakasz)},\n"
        f"  {sql_szoveg(bekezdes) if bekezdes else 'null'},\n"
        f"  {sql_szoveg(tartalom)},\n"
        f"  {sql_szoveg(url) if url else 'null'},\n"
        f"  {sql_szoveg(link) if link else 'null'}\n"
        ");"
    )


def letolt(url: str) -> str:
    keres = Request(url, headers={
        "User-Agent": "EnergiaAI-Kontroll/1.0 (jogszabalybetolto)",
        "Accept-Language": "hu",
    })
    with urlopen(keres, timeout=60) as valasz:
        nyers = valasz.read()
    return nyers.decode("utf-8", errors="replace")


def main():
    p = argparse.ArgumentParser(description="njt.hu jogszabalyszoveg betolto")
    p.add_argument("bemenet", nargs="?", help="Mentett HTML fajl (ha nincs --url)")
    p.add_argument("--url", default="", help="njt.hu jogszabalyoldal cime")
    p.add_argument("--azonosito", required=True,
                   help="A jogforras azonositoja az adatbazisban, pl. NJT-2007-86-00-00")
    p.add_argument("-o", "--output", default="njt_betoltes.sql")
    p.add_argument("--szakaszok", default="",
                   help="Csak ezeket a szakaszokat tolti be, vesszovel elvalasztva, "
                        "pl. 47,56/A,57,64,65. Ures ertek eseten mindet.")
    p.add_argument("--report", action="store_true")
    p.add_argument("--diagnosztika", action="store_true",
                   help="Kiirja, mit talalt az oldalon: hossz, szakaszok, melleklet-emlitesek.")
    args = p.parse_args()

    if args.url:
        nyers = letolt(args.url)
        forras = args.url
    elif args.bemenet:
        ut = Path(args.bemenet)
        if not ut.exists():
            raise SystemExit(f"A fajl nem talalhato: {ut}")
        nyers = ut.read_text(encoding="utf-8", errors="replace")
        forras = args.bemenet
    else:
        raise SystemExit("Adj meg --url cimet vagy egy mentett HTML fajlt.")

    if args.diagnosztika:
        tiszta = szoveg(nyers)
        print(f"Letoltott nyers hossz: {len(nyers)} karakter")
        print(f"Szoveggé alakitva:     {len(tiszta)} karakter")
        print(f"§ elofordulas:         {tiszta.count('§')}")
        print(f"'mellékl' elofordulas: {tiszta.lower().count('mellékl')}")
        print("--- sorok, amelyek a 'mellékl' szot tartalmazzak (max 25) ---")
        n = 0
        for sor in tiszta.split("\n"):
            if "mellékl" in sor.lower():
                print("   |" + sor[:160])
                n += 1
                if n >= 25:
                    break
        if n == 0:
            print("   (egy sem)")
        raise SystemExit(0)

    szakaszok = szakaszok_kinyerese(nyers)
    szakaszok += mellekletek_kinyerese(szoveg(nyers))

    # A teljes torveny SQL-je tul nagy lehet a Supabase szerkesztojenek.
    # A szabalyaink amugy is csak nehany szakaszra hivatkoznak, ezert
    # alapertelmezes helyett szurhetunk.
    if args.szakaszok:
        kert = {k.strip() for k in args.szakaszok.split(",") if k.strip()}
        szakaszok = [sz for sz in szakaszok if sz["szakasz"] in kert]
        hianyzo = kert - {sz["szakasz"] for sz in szakaszok}
        if hianyzo:
            print("FIGYELEM - ezek a szakaszok nem talalhatok az oldalon: "
                  + ", ".join(sorted(hianyzo)), file=sys.stderr)

    if not szakaszok:
        raise SystemExit(
            "Nem talaltam szakaszt (§) a tartalomban.\n"
            "Ellenorizd, hogy a teljes jogszabalyoldal erkezett-e le."
        )

    sorok = [
        "-- EnergiaAI Kontroll - njt.hu jogszabalyszoveg betoltese.",
        f"-- Forras: {forras}",
        f"-- Azonosito: {args.azonosito}",
        f"-- Szakaszok: {len(szakaszok)}",
        f"-- Bekezdesek: {sum(len(s['bekezdesek']) for s in szakaszok)}",
        "-- Ezt a fajlt a scripts/njt_betolto.py allitotta elo.",
        "-- Futtatas: Supabase Dashboard -> SQL Editor.",
        "",
        "begin;",
        "",
    ]

    for sz in szakaszok:
        link = f"{args.url}#{sz['szakasz']}" if args.url else ""
        sorok.append(hivas(args.azonosito, sz["szakasz"], None, sz["szoveg"], args.url, link))
        for b in sz["bekezdesek"]:
            sorok.append(hivas(args.azonosito, sz["szakasz"], b["bekezdes"],
                               b["szoveg"], args.url, link))
        sorok.append("")

    sorok += ["commit;", ""]
    Path(args.output).write_text("\n".join(sorok), encoding="utf-8")

    print(f"Szakaszok: {len(szakaszok)}")
    print(f"Bekezdesek: {sum(len(s['bekezdesek']) for s in szakaszok)}")
    print(f"Kimenet: {args.output}")

    if args.report:
        for sz in szakaszok[:25]:
            print(f"  {sz['szakasz']}. § - {len(sz['bekezdesek'])} bekezdes, "
                  f"{len(sz['szoveg'])} karakter")


if __name__ == "__main__":
    main()
