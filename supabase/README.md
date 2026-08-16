# Adatbázis – EnergiaAI Kontroll

Az alkalmazás üzleti logikájának jelentős része az adatbázisban él: a
szabálymotor, a szabályzatgenerálás, a jóváhagyási lánc és a jogosultságok
mind tárolt függvények. Ez tudatos döntés – így ugyanaz a szabály érvényes
akkor is, ha az adat nem a webes felületről érkezik.

Ez a mappa írja le, hogyan épül fel az adatbázis.

## `migrations/`

Sorszámozott SQL fájlok. Mindegyik egyszer fut le, a fájlnév eleji szám
szerinti sorrendben. A sorrend nem díszítés: a 13. fájl táblát hoz létre,
amelyre a 15. fájl függvénye hivatkozik.

| Fájl | Mit csinál |
|---|---|
| `…00100_jovahagyasi_lanc` | Jóváhagyási állapotgép: piszkozat → felülvizsgálat alatt → jóváhagyva / elutasítva. Tartalom-ujjlenyomat (SHA-256), jóváhagyási napló, jóváhagyott dokumentum zárolása. |
| `…00200_szabalymotor_hianyzo_teny_javitas` | **A legfontosabb javítás.** A feltételkiértékelés hiányzó tény esetén NULL-t adott, amit a motor „teljesült"-ként kezelt. Emiatt üres profilra 35 szabálymodul illeszkedett a helyes 3 helyett. |
| `…00300_hianytalan_szabalyzat_csomag` | Hiányzó szabályok pótlása: GDPR 22. cikk, AI Act III. melléklet szerinti további felhasználási esetek, munkafolyamat-automatizálás és GPAI mint rendszertípus. |
| `…00400_felulvizsgalati_allapot` | A felülvizsgálati állapot megjelenítése a dokumentumon. |
| `…00500_jogaszi_szerkesztes_es_teendok` | Fejezetszerkesztés, fejezet eltávolítása és visszaállítása – kizárólag felülvizsgálói jogosultsággal. |
| `…00600_katalogus_beemeles_es_visszacsatolas` | A felülvizsgáló katalógusból emelhet be további fejezetet. |
| `…00700_jovobeli_kotelezettsegek_es_frissites` | A később hatályba lépő kötelezettségek külön kezelése (AI Act átmeneti határidők). |
| `…00800_jogosultsag_es_rangsor` | Ki mit tehet: jóváhagyás `compliance` és `owner` szerepkörrel. |
| `…00900_elteres_elemzo` | Összeveti a szabályzat szövegét a jogszabály szó szerinti szövegével. |
| `…01000_jogszabalyszoveg_szerkezet` | Bekezdésszintű tárolás, hogy az összevetés pontos legyen. |
| `…01100_elteres_elemzo_pontositas` | Téves jelzések megszüntetése. |
| `…01200_alpontok_es_pontossag` | Alpontszintű tárolás (`1(a)`, `1(b)`), és a pontosság a tárolt szöveg részletességéből következik, nem a hivatkozás formájából. |
| `…01300_jogszabalyszoveg_kulon_tabla` | A jogszabályszöveg külön táblába kerül, függetlenül a szabálykatalógustól. A „15–22" és „28, 32" alakú hivatkozások feloldása. |
| `…01400_cikkszam_feloldo_javitas` | A cikkszám-feloldó javítása. |
| `…01500_automatikus_frissites` | Heti automatikus jogszabályfrissítés: kötegelt betöltés, futásnapló, változásdetektálás. |
| `…01600_nyilatkozat_a_felvitelben` | A 17 kérdéses kérdőív helyett négy nyilatkozat a felviteli űrlapon. |
| `…01700_nyilatkozat_javitas` | Hibajavítás: a nyilatkozat hiánya nem jelenti azt, hogy a szervezet tiltott gyakorlatot folytat. |
| `…01800_import_nyilatkozattal` | A táblázatos import is átadja a négy nyilatkozatot. |
| `…01900_vezetoi_osszefoglalo` | Valódi vezetői összefoglaló a fejezetcímek összefűzése helyett. Generátorverzió bevezetése, hogy a régi dokumentumok újraépüljenek. |

## `adatbetoltes/`

Jogszabályszövegek betöltése. Ezek nem sémaváltozások, hanem adat: az
EUR-Lex hivatalos magyar szövegéből a `scripts/jogszabaly_betolto.py`
állítja elő őket, cikk-, bekezdés- és alpontszinten.

A betöltés determinisztikus: ugyanabból a HTML-ből mindig ugyanaz az SQL
keletkezik. Nyelvi modell nincs benne.

## Ismert hiány

A projekt korai szakaszában az alaptáblák (`aic_organisations`,
`aic_ai_systems`, `aic_compliance_rules`, `aic_legal_sources` és társaik)
közvetlenül a Supabase felületén jöttek létre, fájlba mentés nélkül. Emiatt
**ez a mappa önmagában még nem elegendő az adatbázis nulláról való
felépítéséhez** – a fenti migrációk egy már létező alapszerkezetre épülnek.

A hiányzó alapszerkezet visszanyerhető: a Supabase megőrizte a korábbi
migrációk teljes szövegét, és a jelenlegi séma is kiexportálható. Ez a
következő rendezési lépés.
