# AI Act Kontroll

**Determinisztikus MI-megfelelőségi és szabályzatgeneráló rendszer vállalati MI-rendszerekhez**

Az **AI Act Kontroll** egy vállalati megfelelőségi alkalmazás, amely támogatja az MI-rendszerek nyilvántartását, a rájuk vonatkozó jogi kötelezettségek meghatározását, valamint verziózott megfelelőségi szabályzatok összeállítását.

A rendszer központi tervezési elve a **determinisztikus működés**: a szabályzatot nem nyelvi modell írja. A felhasználói válaszokból strukturált rendszerprofil készül, amelyet PostgreSQL-ben futó szabálymotor értékel ki. Az alkalmazandó szabályok előre definiált szabályzatmodulokhoz és konkrét jogalapokhoz kapcsolódnak.

> **Jogi nyilatkozat:** Az AI Act Kontroll nem nyújt jogi tanácsadást. A jogi katalógus és a generált szabályzatok éles használat előtt szakmai jogi felülvizsgálatot igényelnek.

**Élő alkalmazás:** https://energia-ai-kontroll.vercel.app

---

## Projektcél

A vállalatok egyre több MI-rendszert használnak. Emiatt egyre nehezebb következetesen nyomon követni:

- milyen MI-rendszerek vannak használatban;
- mit csinálnak ténylegesen;
- mely jogi kötelezettségek vonatkoznak rájuk;
- mely követelmények iparág- vagy szerepkörfüggők;
- melyik szabályzatverzió tartozott egy adott rendszerállapothoz;
- mely dokumentumokat érintheti egy jogszabályváltozás.

Az AI Act Kontroll ezt egy auditálható folyamatba rendezi:

1. MI-rendszer rögzítése;
2. jogilag releváns rendszerjellemzők felvétele;
3. levezetett tények kiszámítása;
4. alkalmazandó megfelelőségi szabályok kiértékelése;
5. szabályzat összeállítása jóváhagyott modulokból;
6. kapcsolódó jogszabályhelyek csatolása;
7. verziózott dokumentum mentése;
8. jogforrásváltozások figyelése és az érintett elemek felülvizsgálatra jelölése.

A jelenlegi jogi katalógus az **(EU) 2024/1689 rendeletre (AI Act)**, a **GDPR-ra**, valamint kapcsolódó magyar jogforrásokra épül.

---

## Fő funkciók

### Vezetett MI-rendszer felvitel

A rendszer a megfelelőségi döntésekhez releváns tényeket gyűjti. A kérdéssor a rendszer tényleges működésére és használati környezetére épül.

### Determinisztikus szabálykiértékelés

Azonos rendszerprofil azonos alkalmazandó szabályhalmazt eredményez. A döntési logika PostgreSQL-függvényekben fut.

### Visszakövethető szabályzatgenerálás

Minden megfelelőségi szabályhoz kötelező jogalap tartozik. A generált szabályzat elemei konkrét jogszabályhelyekhez vezethetők vissza.

### Jogszabálykövetés

Ütemezett háttérfolyamat ellenőrzi a támogatott jogforrásokat, tartalmi ujjlenyomat alapján érzékeli a változásokat, naplózza az eltéréseket, és felülvizsgálatra jelöli az érintett szabályokat.

### Szabályzatverziózás

MI-rendszer módosításakor új szabályzatverzió készíthető úgy, hogy a korábbi dokumentum megmarad.

### Tömeges MI-rendszer import

Több MI-rendszer rögzíthető generált Excel-sablonból. A sablon a kapcsolókatalógus aktuális állapotából készül.

### Szerepköralapú hozzáférés

A rendszer külön kezeli az adminisztratív, compliance, szerkesztői és csak olvasási jogosultságokat.

---

## Miért determinisztikus?

Nyelvi modellel könnyű folyékony szabályzatszöveget generálni, de megfelelőségi automatizálásnál a fő mérnöki követelmény a **megismételhetőség, visszakövethetőség és tesztelhetőség**.

### Megismételhető

Ugyanaz a bemenet ugyanazt az eredményt adja. Ez lehetővé teszi a regressziós tesztelést és az auditálható döntési láncot.

### Visszakövethető

Minden szabály konkrét jogalaphoz kapcsolódik. A dokumentumban szereplő előírás visszavezethető a forrásul szolgáló jogszabályhelyhez.

### Felülvizsgálható

A jogi tartalom strukturált adatként jelenik meg, nem promptokban. A szakmai ellenőrzés ezért a jogszabályhelyekre, értelmezésekre, feltételekre és szabályzatmodulokra koncentrálhat.

### Tudatos kompromisszum

A jogi katalógus maga is jogszabályi tartalomból levezetett modell. Hibás értelmezés több szabályzatba is továbbterjedhet, ezért az éles használat feltétele a szakmai jogi validáció.

---

## Architektúra

```text
┌──────────────────────────────┐
│          Next.js 14          │
│          App Router          │
│                              │
│  Server oldalak              │
│  Server actionök             │
│  Kliens komponensek          │
└──────────────┬───────────────┘
               │ RPC
               ▼
┌──────────────────────────────┐
│      Supabase / Postgres     │
│                              │
│  PL/pgSQL szabálymotor       │
│  SECURITY DEFINER RPC-k      │
│  Row Level Security          │
│  Verziózott compliance adat  │
└──────────────────────────────┘
```

A felület az interakcióért és a megjelenítésért felel. A megfelelőségi döntések központilag, PostgreSQL-függvényekben futnak.

Ez szándékos architekturális döntés: a vezetett felvitel, a tömeges import és a jogszabályfrissítő háttérfolyamat ugyanazt az adatbázislogikát használja, így ugyanarra a rendszerprofilra nem adhatnak eltérő eredményt.

**Jelenlegi dokumentált adatbázis-méret:** 35 tábla, 114 függvény, RLS minden `aic_*` táblán.

---

## Adatmodell

A domainmodell négy fő rétegre épül.

### 1. Jogi réteg

| Tábla | Felelősség |
|---|---|
| `aic_legal_sources` | Jogforrások, hivatalos URL-ek, tartalmi ujjlenyomatok, frissítési konfiguráció |
| `aic_legal_provisions` | Cikk-, bekezdés- és pontszintű jogszabályhelyek |
| `aic_legal_text` | Jogszabályszöveg bekezdésenként, mélylinkekkel |
| `aic_provision_coverage` | Döntés arról, hogy egy jogszabályhely releváns-e MI-rendszerekre |

### 2. Megfelelőségi szabályréteg

| Tábla | Felelősség |
|---|---|
| `aic_compliance_rules` | Aktív megfelelőségi szabályok, szerepkör- és életciklus-kontextus |
| `aic_rule_legal_bases` | Kötelező kapcsolat szabály és jogalap között |
| `aic_policy_modules` | Szabályzatszövegek és alkalmazhatósági feltételek |
| `aic_required_actions` | Kötelező teendők |
| `aic_required_evidence` | Elvárt bizonyítékok és dokumentáció |

**Megfelelőségi szabály jogalap nélkül nem létezhet.**

### 3. Rendszertény-réteg

| Tábla | Felelősség |
|---|---|
| `aic_trigger_catalogue` | A szabályfeltételekben használható kanonikus rendszertények |

A jelenlegi katalógus **93 tényt** tartalmaz:

- **72 felhasználó által megadható**
- **21 automatikusan levezetett**

A tények a rendszer viselkedését írják le, nem az eszköztípust.

### 4. MI-rendszer és dokumentumréteg

| Tábla | Felelősség |
|---|---|
| `aic_ai_systems` | A szervezet rögzített MI-rendszerei |
| `aic_system_facts` | Strukturált rendszerprofil `jsonb` formátumban |
| `aic_generated_policies` | Verziózott, tartalmi ujjlenyomattal tárolt szabályzatok |

---

## Szabálymotor

A központi alkalmazhatósági függvény:

```sql
aic_applicability_matches(applicability jsonb, profile jsonb)
```

Támogatott feltételcsoportok:

```jsonc
{
  "all": [
    { "fact": "PROCESSES_PERSONAL_DATA", "is_true": true }
  ],
  "any": [
    { "fact": "USE_EMPLOYMENT" },
    { "fact": "USE_EDUCATION" }
  ],
  "industry_codes": ["energy"]
}
```

Az üres `industry_codes` tömb iparágfüggetlen szabályt jelent.

A kiértékelt profil forrása:

```sql
aic_system_profile(system_id)
```

A profil tartalmazza a mentett ténylapot és a levezetett tényeket is, például a `system_is_high_risk` értéket.

### Kanonikus ténykulcsok

A katalógus korábbi verzióiban egyes tények több azonosítóval szerepeltek. A történeti kulcsokat a `legacy_fact_keys` őrzi, az új szabályok kizárólag kanonikus kulcsokat használhatnak.

A kompatibilitási réteg a régi és az új kulcsokat ugyanabba a kiértékelési profilba oldja fel.

---

## Szabályzatgenerálás

```text
Felhasználói válaszok
    │
    ▼
aic_eszkoz_mentese_v2
    │
    ├── aic_felviteli_profil_v2
    │      └── rendszerprofil összeállítása
    │
    ├── aic_felviteli_hianyok_v2
    │      └── hiányzó döntési bemenetek meghatározása
    │
    └── aic_refresh_system_policy_links
           └── alkalmazandó modulok kapcsolása
                    │
                    ▼
              aic_generate_policy
                    │
                    ├── aic_jogforras_hivatkozasok
                    │      └── jogforrás-hivatkozások
                    │
                    └── aic_vezetoi_osszefoglalo
                           └── vezetői összefoglaló
```

A jogforrás-hivatkozások előállítása központilag történik:

```sql
aic_jogforras_hivatkozasok(rule_id)
```

Ez megakadályozza, hogy külön kódutak eltérő jogi hivatkozásokat állítsanak elő.

---

## Jogszabályváltozások követése

Az ütemezett frissítés hetente, **hétfőn 04:00 UTC-kor** fut.

A Vercel Cron az alábbi végpontot hívja:

```text
/api/jogszabaly-frissites
```

A végpont `CRON_SECRET` fejlécet vár.

```text
letöltés
   ↓
feldolgozás
   ↓
SHA-256 ujjlenyomat
   ↓
eltérés?
   ├── nincs → nincs további compliance-változás
   └── van
        ├── naplózás: aic_legal_text_changes
        ├── érintett szabályok felülvizsgálatra jelölése
        └── érintett szabályzatok elavultként jelölése
```

Két feldolgozó támogatott:

- `eurlex` — EUR-Lex HTML uniós jogforrásokhoz;
- `njt` — `njt.hu` HTML magyar jogszabályokhoz.

Az NJT-feldolgozó szakasz-, bekezdés- és pontszintű horgonyokat is kinyer:

```text
SZ47
SZ47@BE1
SZ47@BE1@POA
```

---

## Biztonság és jogosultságkezelés

Minden `aic_*` táblán aktív a **Row Level Security**.

A kliens nem ír közvetlenül a megfelelőségi táblákba. A módosítások `SECURITY DEFINER` RPC-függvényeken keresztül futnak, amelyek az alábbi szervezeti szerepkör-ellenőrzést használják:

```sql
aic_szervezeti_szerep(organisation_id)
```

### Szerepkörök

| Szerepkör | Jogosultság |
|---|---|
| `owner`, `admin` | Teljes szervezeti adminisztráció |
| `compliance` | MI-rendszerek és szabályzatok kezelése, jogtári jóváhagyás |
| `editor` | MI-rendszerek felvitele és szerkesztése |
| `viewer` | Csak olvasási hozzáférés |

A jogtári jóváhagyás `compliance` és `owner` szerepkörhöz kötött.

### Service role izoláció

A `SUPABASE_SERVICE_ROLE_KEY` megkerüli az RLS-t, ezért kizárólag szerveroldalon használható.

A jelenlegi projektstruktúra alapján ezt csak az alábbi végpont használja:

```text
app/api/jogszabaly-frissites/route.js
```

---

## Tömeges MI-rendszer import

Az alkalmazás támogatja több MI-rendszer egyidejű felvitelét generált Excel-sablonból.

A sablon a kapcsolókatalógusból készül:

```bash
node scripts/build-import-template.js
```

Jelenlegi helye:

```text
public/energiaai-rendszerimport-sablon.xlsx
```

A kapcsolókatalógus módosítása után a sablont újra kell generálni, hogy az importált funkciókódok összhangban maradjanak a szabálymotorral.

---

## Szabályzatverziózás

A generált szabályzatok verziózott dokumentumként kerülnek mentésre.

Ha egy MI-rendszer működése vagy funkciói megváltoznak, új szabályzatverzió készíthető úgy, hogy a korábbi verzió változatlanul megmarad.

Ez biztosítja a történeti állapot visszakereshetőségét és támogatja a későbbi auditot.

---

## Technológiai stack

| Réteg | Technológia |
|---|---|
| Webalkalmazás | Next.js 14, App Router |
| Adatbázis | Supabase PostgreSQL 17 |
| Üzleti és szabálylogika | PL/pgSQL |
| Auth és jogosultság | Supabase Auth + RLS + RPC |
| Deployment | Vercel |
| Ütemezett háttérfolyamat | Vercel Cron |
| EU jogforrás-feldolgozás | EUR-Lex HTML |
| Magyar jogforrás-feldolgozás | NJT HTML |
| Tömeges import | Generált `.xlsx` sablon |

---

## Projektstruktúra

```text
app/
├── page.js                         # belépés és bemutató
├── jogtar/                         # jogi katalógus és jóváhagyási felület
├── rendszerek/
│   ├── uj/                         # vezetett MI-rendszer felvitel
│   ├── importalas/                 # tömeges import
│   ├── [id]/                       # rendszeradatlap
│   ├── [id]/szerkesztes/           # szerkesztés
│   └── [id]/szabalyzat/            # generált szabályzat
├── szabalyzatok/                   # mentett szabályzatok és verziók
├── vezerlopult/                    # szervezeti áttekintés
└── api/
    └── jogszabaly-frissites/       # ütemezett frissítési végpont

lib/
├── supabase/                       # kliens-, szerver- és middleware-kapcsolat
├── njt-feldolgozo.js               # magyar jogforrás-feldolgozó
└── jogszabaly-feldolgozo.js        # EUR-Lex feldolgozó

scripts/                             # betöltők és sablongenerálás
supabase/migrations/                 # adatbázisséma története
docs/                                # követelmények, tesztek és auditanyagok
```

---

## Lokális futtatás

### Követelmények

- Node.js 18+
- npm
- konfigurált Supabase projekt

### Telepítés és indítás

```bash
npm install
npm run dev
```

Lokális cím:

```text
http://localhost:3000
```

### Minőségellenőrzés

```bash
npm run build
npm run lint
```

---

## Környezeti változók

Lokális fejlesztéshez `.env.local` szükséges.

| Változó | Hatókör | Funkció |
|---|---|---|
| `NEXT_PUBLIC_SUPABASE_URL` | kliens + szerver | Supabase projekt URL |
| `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY` | kliens + szerver | Nyilvános kulcs, RLS mögött |
| `SUPABASE_SERVICE_ROLE_KEY` | csak szerver | Jogszabályfrissítő folyamat |
| `CRON_SECRET` | csak szerver | Ütemezett végpont hitelesítése |

> A `SUPABASE_SERVICE_ROLE_KEY` megkerüli a Row Level Security-t. Kliensoldali kódba nem kerülhet.

---

## Migrációk és adatforrások

A migrációk helye:

```text
supabase/migrations/
```

Elnevezési konvenció:

```text
YYYYMMDDHHMMSS_leiras.sql
```

A jelenlegi dokumentáció **72 migrációs fájlt** rögzít.

A migrációs könyvtár az adatbázisséma forrása. Kézi adatbázis-módosítás esetén a változást migrációban is rögzíteni kell, különben környezeti eltérés alakulhat ki.

### Jogforrások betöltése

```bash
python scripts/njt_betolto.py
python scripts/jogszabaly_betolto.py
node scripts/build-import-template.js
```

| Parancs | Funkció |
|---|---|
| `njt_betolto.py` | Magyar jogszabályok betöltése az `njt.hu` oldalról |
| `jogszabaly_betolto.py` | Uniós jogforrások betöltése EUR-Lexről |
| `build-import-template.js` | Tömeges import sablon újragenerálása |

---

## Tesztelés

A jelenlegi dokumentált tesztbázis manuális tesztartefaktumokból áll:

- követelmények;
- manuális tesztesetek;
- tesztfuttatási jegyzőkönyvek;
- hibajegyzék.

Ezek a `docs/` könyvtárban találhatók.

### Tervezett automatizálási rétegek

Az architektúra alapján a tesztautomatizálást több rétegben érdemes felépíteni.

1. **Szabálymotor regressziós tesztek**  
   Rögzített rendszerprofilokhoz rögzített szabályhalmaz tartozzon.

2. **Adatbázis- és RPC-integrációs tesztek**  
   Jogosultságok, szabályzatgenerálás, verziózás és jogforrás-konzisztencia ellenőrzése.

3. **API-tesztek**  
   Jogszabályfrissítő végpont és hitelesítés ellenőrzése.

4. **UI end-to-end tesztek**  
   Auth, MI-rendszer felvitel, szerkesztés, tömeges import és szabályzat-hozzáférés.

A dokumentált fejlesztési irány a szabálymotor regressziós teszteléséhez **pgTAP** használatát javasolja, mivel a központi megfelelőségi logika PostgreSQL-ben fut.

---

## Ismert korlátok és fejlesztési irányok

### Szabálymotor automatizált regressziós tesztelése

A szabálymotor determinisztikus, de a jelenlegi dokumentált tesztbázis elsősorban manuális tesztekkel védi.

**Tervezett irány:** fix rendszerprofilok és elvárt szabályhalmazok pgTAP-pal.

### Jogszabály-diff granularitás

A jogforrás-összehasonlítás jelenleg cikk szinten történik.

Tervezett kulcs:

```text
(source_id, article_number, paragraph_number)
```

Ez csökkentheti az eltérő dokumentumtagolásból eredő álpozitív változásjelzéseket.

### Jogi validáció

A jogi katalógus gépi levezetésű, ezért éles használat előtt szakmai jogi felülvizsgálat szükséges.

### További iparágak

A jelenlegi dokumentáció szerint:

- 142 aktív szabály;
- 134 iparágfüggetlen szabály;
- 21 energetikai szabály.

Az architektúra célja, hogy új iparág hozzáadásához elsősorban új ágazati jogforrásokat kelljen betölteni és felülvizsgálni, a szabálymotort ne kelljen újratervezni.

### Több szervezeti szerepkör

Az `aic_ai_systems` már több szervezeti szerepkört képes tárolni, és a felvitel is támogat több választást.

A jelenlegi dokumentált korlát szerint az `aic_generate_policy` még az egyes számú `organisation_role` mezőt olvassa, ezért a generált dokumentum csak az elsődleges szerepkör kötelezettségeit tartalmazza.

### Később hatályba lépő kötelezettségek

Az `upcoming_obligations` mező már tárolja a később alkalmazandó előírásokat.

Tervezett fejlesztés, hogy a szabályzat külön szakaszban jelenítse meg azokat a követelményeket, amelyek még nem alkalmazandók, de előzetes felkészülést igényelnek.

---

## Mérnöki alapelvek

1. **Egyetlen forrás a megfelelőségi döntésekhez**  
   Az üzleti és szabálylogika központilag, az adatbázisban fut.

2. **Nincs szabály jogalap nélkül**  
   A visszakövethetőség strukturálisan kikényszerített.

3. **Azonos bemenet → azonos eredmény**  
   A szabálykiértékelés determinisztikus.

4. **Verziózott kimenet**  
   A szabályzattörténet rendszerjellemző-változás esetén is megmarad.

5. **A jogszabályváltozás megfigyelhető esemény**  
   A jogforrás-frissítések felülvizsgálati állapotot válthatnak ki a kapcsolódó szabályokon és szabályzatokon.

---

## Jogi nyilatkozat

Az AI Act Kontroll szoftverfejlesztési és megfelelőségi automatizálási projekt.

Nem helyettesíti a minősített jogi tanácsadást. Éles használat előtt a jogi katalógust, a szabályértelmezéseket és a generált szabályzatokat szakmai jogi felülvizsgálatnak kell alávetni.
