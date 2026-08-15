# A 2–8. használati profil javítási és záróellenőrzési jelentése

Dátum: **2026-08-15**  
Kapcsolódó audit: `docs/hasznalati-profil-audit.md`  
Érintett rendszer: EnergiaAI Kontroll  
Adatbázis: Supabase projekt `enhrrhdvpqxbkefnfztl`

## Záró döntés

**Az auditban feltárt F-01–F-09 keresztmetszeti hiányosságok javítása megtörtént. A teljes, profilonkénti tételes auditból a 2. profil lezárt; a 3–8. profil külön jogforrás-, hatály-, cikkhivatkozás-, alkalmazásifeltétel-, mintarendszer- és verzióauditja még hátravan.**

A 2. profil aktuális minősítése:

> **Technikailag validált, determinisztikusan előállított szabályzattervezet, szakmai és jogi felülvizsgálatra kész.**

Ez nem jelent szakmai vagy jogi jóváhagyást. A modulok helyesen `under_review` állapotban maradtak; a szakértői jóváhagyás után emelhetők végleges státuszba.

**2026-08-15-i helyreállítás:** a 11 rendszer újramegerősítési kényszere megszűnt. A funkciók és a korábbi profilkapcsolatok helyreálltak; minden aktív rendszer központi generálási ellenőrzése sikeres. A továbbiakban a profil nem kényszerít funkciót, hanem az aktív funkciók és az ellenőrzött alkalmazási adatok vezérlik a modulválasztást.

## Alkalmazott migrációk

| Migráció | Eredmény |
|---|---|
| `profilok_2_8_teljes_audit_javitas` | sikeresen alkalmazva |
| `profilok_2_8_audit_utoteszt_javitas` | sikeresen alkalmazva |
| `profil_2_teteles_audit_javitas` | sikeresen alkalmazva |
| `profil_2_hivatkozasi_zaras` | sikeresen alkalmazva |

Helyi, reprodukálható SQL-fájlok:

- `supabase/profilok_2_8_teljes_audit_javitas.sql`
- `supabase/profilok_2_8_audit_utoteszt_javitas.sql`
- `supabase/profil_2_teteles_audit_javitas.sql`
- `supabase/profil_2_hivatkozasi_zaras.sql`

## F-01–F-09 javítási mátrix

| Azonosító | Auditban feltárt hiány | Végrehajtott javítás | Ellenőrzés | Állapot |
|---|---|---|---|---|
| F-01 | Nem volt mérőállás-beviteli kontroll | Új `ENERGY_METER_READING_INTAKE` modul: mérési pont-összerendelés, formátum- és ésszerűségi ellenőrzés, duplikációvédelem, ügyfél-megerősítés, bizonylat és emberi hibautak | A 3. és 8. profilban, valamint minden mérőállásos kombinációban kiválasztódik | kész |
| F-02 | A panasz és az általános kérelem össze volt mosva; a teljes ügyfélfiók kötelező volt | A profil neve `Panasz fogadása`; az általános kérelem kizárva; a `PERSONAL_ACCOUNT_DATA` választható; azonnali elektronikus visszaigazolás, egyedi azonosító, 30 napos főszabály, indokolás, jogorvoslat és hároméves megőrzés rögzítve | A minimális panaszprofil fiókadat nélkül érvényes és a panaszmodult kiválasztja | kész |
| F-03 | Hiányzott a GDPR 9. cikk szerinti különlegesadat-kezelés | Új `GDPR_ART9_SPECIAL_CATEGORIES` joghely, `GDPR_SPECIAL_CATEGORY_VULNERABILITY_DATA` szabály és `CHATBOT_SPECIAL_CATEGORY_DATA` modul | A 6., 7. és 8. profil megfelelő konfigurációjában kiválasztódik | kész |
| F-04 | Pontatlan energetikai joghelyek | Számlázás: Vhr. 21/A. §; okosmérőnél 14/C. §; meghatározott adatátadásnál 27/B. §; egyetemes szolgáltatásnál az 1. melléklet 4.1–4.11. és 5.1–5.5. pont. A többi profil keresztmetszeti joghelyjavítása változatlanul megmaradt. | A 2. profil joghelyei tételesen ellenőrizve; a téves „2. melléklet 14–16.” hivatkozás megszüntetve | kész a 2. profilban; 3–8 tételes auditja hátravan |
| F-05 | A modulok többségéhez nem tartozott művelet és bizonyíték | A szabály nélküli belső modulok szabályt kaptak; minden chatbot- és energetikai modulhoz művelet és kötelező bizonyíték került | 30 modul; hiányzó szabály: 0; hiányzó művelet: 0; hiányzó bizonyíték: 0 | kész |
| F-06 | A kombinált profil nem ellenőrizte a funkciófüggőségeket | Új `aic_capability_dependencies` katalógus és ellenőrző függvény; a mentési és generálási kapu is vizsgálja | Hiányos számla-, fogyasztási-, mérőállás- és tartozási konfiguráció elutasítva; 10 helyes kombináció elfogadva | kész |
| F-07 | Nem volt rendezett szakértői életciklus | Minden módosított és új modul verziózott, `under_review` állapotban maradt; a korábbi jóváhagyási mezők nem lettek meghamisítva | A modulok szakértői felülvizsgálatra várnak, nem jelennek meg jóváhagyottként | kész |
| F-08 | Hiányzott az egyedi adat forrás-, idő- és jogosultsági nyomkövetése | Új `ENERGY_ACCOUNT_DATA_TRACEABILITY` modul, naplózási művelet és bizonyíték | A 2., 3., 5. és 8. profilban, illetve személyes fiókadatot használó kombinációkban kiválasztódik | kész |
| F-09 | A védendő fogyasztói profilban nem volt kötelező hozzáférhető emberi támogatás | Új `ENERGY_VULNERABLE_ACCESSIBLE_HANDOFF` belső kontroll, tesztművelet és bizonyíték | A 6. és 8. profilban, valamint védendő funkciót tartalmazó kombinációkban kiválasztódik | kész |

## Profilonkénti végső állapot

| # | Profil | Javítás utáni modulok | Záró minősítés |
|---:|---|---:|---|
| 2 | Számla- és fogyasztási ügyintézés | 21 | tételes audit lezárt; szakmai és jogi felülvizsgálatra kész |
| 3 | Mérőállás rögzítése | 22 | keresztmetszeti javítás kész; tételes audit következik |
| 4 | Panasz fogadása | 20 | keresztmetszeti javítás kész; tételes audit hátravan |
| 5 | Tartozási és kikapcsolási tájékoztatás | 21 | keresztmetszeti javítás kész; tételes audit hátravan |
| 6 | Védendő fogyasztói ügyek támogatása | 22 | keresztmetszeti javítás kész; tételes audit hátravan |
| 7 | Kombinált energetikai ügyfélszolgálat | a kiválasztott funkcióktól függ; ellenőrzött példában 23 | keresztmetszeti javítás kész; tételes audit hátravan |
| 8 | Komplex energetikai ügyfélszolgálat | 27 | keresztmetszeti javítás kész; tételes audit hátravan |

## Funkciófüggőségi kapu

Az adatbázis a következő kötelező kapcsolatokat ellenőrzi:

| Funkció | Kötelező függőség | Indok |
|---|---|---|
| számlázási információ | személyes fiókadat | egyedi számlaadat csak azonosított ügyfélnek jeleníthető meg |
| fogyasztási/mérési adat | személyes fiókadat | az egyedi mérési adathoz jogosultság-ellenőrzés szükséges |
| mérőállás fogadása | személyes fiókadat | az ügyfél és a mérési pont összerendelése szükséges |
| mérőállás fogadása | fogyasztási/mérési adat | validációhoz és ésszerűségi vizsgálathoz szükséges |
| tartozási/kikapcsolási támogatás | személyes fiókadat | a státusz csak azonosított jogosultnak közölhető |

Ellenőrzési példák:

- csak mérőállás-funkció → két hiányzó függőség, helyesen elutasítva;
- mérőállás + mérési adat + személyes fiókadat → nincs hiány;
- csak számlázás → személyes fiókadat hiánya, helyesen elutasítva;
- minimális panaszprofil → nincs indokolatlan fiókfüggőség.

## Kombinált profil regressziós tesztje

Az öt konkrét szolgáltatás valamennyi kételemű kombinációja újratesztelve:

- tesztelt párok: **10**;
- funkciófüggőségi hiba: **0**;
- szakmodul-unió eltérés: **0**.

Minden párnál kizárólag a kiválasztott szolgáltatásokhoz és azok kötelező függőségeihez tartozó szakmodulok jelentek meg.

## Modulminőségi ellenőrzés

| Ellenőrzés | Eredmény |
|---|---:|
| Chatbot- és energetikai modulok száma | 30 |
| Szabály nélküli modul | 0 |
| Művelet nélküli modul | 0 |
| Bizonyíték nélküli modul | 0 |
| `requires_input_confirmation` tényt használó modul | 1 |
| `provides_case_acknowledgement` tényt használó modul | 1 |
| `may_process_vulnerability_data` tényt használó modul | 2 |

## Biztonsági ellenőrzés

- Az új függőségi katalóguson RLS aktív, olvasása csak bejelentkezett felhasználóknak engedélyezett.
- A funkciómentési eljárás `SECURITY INVOKER` működésre váltott.
- A változásnapló írása szervezeti tagsághoz és megfelelő szerepkörhöz kötött RLS-szabályt kapott.
- A függőségi idegen kulcs támogató indexet kapott.
- A módosítás után az érintett `SECURITY DEFINER` figyelmeztetés megszűnt.
- A teljes projektben maradt egyéb tanácsadói jelzések nem ehhez a profilaudithoz tartozó, korábban meglévő Flux-, előrejelzési, bővítmény- vagy Auth-beállítások.

## Alkalmazás-ellenőrzés

A Next.js produkciós build sikeresen lefutott:

- fordítás: sikeres;
- lint és típusellenőrzés: sikeres;
- 13 statikus oldal generálása: sikeres;
- route-ok és middleware buildje: sikeres.

A build során a meglévő Webpack-gyorsítótár helyreállítására vonatkozó figyelmeztetések jelentek meg, de fordítási vagy működési hibát nem okoztak.

## Kezelői állapot

Nincs tömeges újramegerősítési kötelezettség. Mind a 13 aktív mintarendszer `profile_revalidation_required = false` állapotban van, a funkciófüggőségi kapu pedig minden rendszeren sikeresen lefutott. Új ellenőrzés csak akkor szükséges, ha a rendszer rendeltetése, aktív funkciója vagy más alkalmazási adata ténylegesen megváltozik.

## Végső minősítés

**A keresztmetszeti F-01–F-09 javítás lezárt. A 2. profil teljes tételes auditja lezárt; a 3–8. profilé még nem.**

A 2. profil dokumentuma szakmai, jogi, adatvédelmi, energetikai és információbiztonsági felülvizsgálatra átadható. A következő technikai szakasz a 3. profil – Mérőállás rögzítése – tételes auditja. Végleges megfelelőséget vagy hitelesítést csak formális szakértői jóváhagyás után lehet kijelenteni.
