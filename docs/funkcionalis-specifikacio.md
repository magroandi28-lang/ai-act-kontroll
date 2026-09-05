# AI Act Kontroll – végleges rendszer- és funkcionális specifikáció

**Dokumentumazonosító:** AIC-SPEC-001
**Verzió:** 1.0
**Állapot:** Végleges tesztalap
**Dátum:** 2026-09-05
**Vizsgálati alap:** a `335d8eb` Git-állapot teljes alkalmazáskódja, SQL-migrációi, dokumentációja és konfigurációja, valamint a terméktulajdonosi döntések

## 1. A dokumentum célja

Ez a dokumentum rögzíti, hogyan **kell** működnie az AI Act Kontroll alkalmazásnak. A manuális teszteseteket, az automata felületi és API-teszteket, valamint a CI/CD pipeline elfogadási feltételeit ebből kell levezetni.

A forráskód a jelenlegi megvalósítást mutatja. Ha a kód eltér ettől a specifikációtól, az eltérés hibajelölt; a hibás működést nem szabad követelménnyé tenni.

## 2. Hatókör

Az AI Act Kontroll többfelhasználós, szervezeti webalkalmazás, amely:

1. felhasználói és szervezeti hozzáférést kezel;
2. MI-rendszereket rögzít, importál, módosít és archivál;
3. működési jellemzőket és kockázati tényeket gyűjt;
4. determinisztikusan kiválasztja az alkalmazandó szabályokat;
5. verziózott megfelelőségi szabályzatot állít össze;
6. támogatja a szabályzat felülvizsgálatát;
7. kezeli és frissíti a Jogtár tartalmát;
8. naplózza a lényeges adat- és állapotváltozásokat.

A rendszer döntéstámogató eszköz, nem jogi tanácsadás. A jogi tartalom szakmai helyességét meghívott jogásznak kell jóváhagynia.

## 3. Rendszerfelépítés

| Réteg | Elvárt feladat |
|---|---|
| Next.js webalkalmazás | Felület, útvonalak, szerveroldali műveletek és egyedi HTTP API. |
| Supabase Auth | Regisztráció, bejelentkezés, anonim demómunkamenet, e-mail-megerősítés és jelszó-helyreállítás. |
| Supabase PostgreSQL | Szervezetek, tagságok, MI-rendszerek, katalógusok, szabályzatok, Jogtár és auditadatok tárolása. |
| Supabase REST/RPC API | RLS-sel védett adatelérés és üzleti műveletek. |
| Vercel Cron | A jogforrások heti frissítésének indítása. |
| EUR-Lex és NJT | Külső hivatalos jogforrások. |

## 4. Szereplők és jogosultságok

| Szereplő | Általános jogosultság | Jogtár |
|---|---|---|
| Látogató | Belépési oldal, adatkezelési tájékoztató és interaktív bemutató. | Nincs hozzáférés. |
| Demófelhasználó | A kijelölt demókörnyezetben a fő folyamatok kipróbálása. | Csak olvasás. |
| Owner | Szervezet, tagok, MI-rendszerek és szabályzatok kezelése. | Csak olvasás. |
| Admin | Szervezet, tagok, MI-rendszerek és szabályzatok kezelése. | Csak olvasás. |
| Compliance / meghívott jogász | MI-rendszerek és szabályzatok megfelelőségi kezelése. | Olvasás, módosítás és jóváhagyás. |
| Editor | MI-rendszerek rögzítése és szerkesztése. | Csak olvasás. |
| Ütemezett rendszerfolyamat | Hitelesített jogforrás-frissítés. | Gépi frissítés és naplózás. |

**ROLE-REQ-001:** Jogtári módosításra és jóváhagyásra kizárólag a szervezetbe `compliance` szerepkörrel meghívott jogász jogosult. Az `owner`, `admin`, `editor` és demófelhasználó csak olvashatja a Jogtárat.
**ROLE-REQ-002:** Minden jogosultságot szerveroldalon és adatbázis-szinten is ellenőrizni kell; a felületi gomb elrejtése önmagában nem védelem.
**ROLE-REQ-003:** A rendszer nem alapozhat jogosultságot a felhasználó által módosítható `user_metadata` mezőre.

## 5. Általános működési követelmények

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| GEN-REQ-001 | A védett oldalak csak érvényes munkamenettel érhetők el. | Kritikus |
| GEN-REQ-002 | A felhasználó kizárólag a saját szervezete adatait érheti el. | Kritikus |
| GEN-REQ-003 | Azonos bemenetből a szabálymotor azonos eredményt állítson elő. | Kritikus |
| GEN-REQ-004 | Minden művelet egyértelmű siker- vagy hibaüzenetet adjon. | Magas |
| GEN-REQ-005 | Feldolgozás közben az ismételt elküldést meg kell akadályozni. | Magas |
| GEN-REQ-006 | A jogi korlátozásra vonatkozó figyelmeztetés jelenjen meg a releváns oldalakon. | Magas |
| GEN-REQ-007 | A felhasználói „törlés” minden üzleti adatnál archiválást jelent; történeti adat fizikailag nem törölhető a felületről. | Kritikus |
| GEN-REQ-008 | Az Okosmérő és az AI Act Kontroll közös Supabase-projektben is logikailag és jogosultságilag elkülönüljön. | Kritikus |

## 6. Belépési oldal és bemutató

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| LOGIN-REQ-001 | Jelenjen meg az e-mail, jelszó, Belépés, adatkezelési jelölőnégyzet, demóbelépés, Regisztráció és Elfelejtett jelszó vezérlő. | Kritikus |
| LOGIN-REQ-002 | Az e-mail- és jelszómező legyen látható, engedélyezett és írható. | Kritikus |
| LOGIN-REQ-003 | A HU/EN kapcsoló váltsa át a belépési oldal és a bemutató szövegét. | Közepes |
| LOGIN-REQ-004 | A kiválasztott nyelv oldalfrissítés után is maradjon meg. | Közepes |
| LOGIN-REQ-005 | A jelszó láthatósági gomb váltson rejtett és látható állapot között. | Magas |
| LOGIN-REQ-006 | Az adatkezelési hivatkozás nyissa meg a tájékoztatót. | Kritikus |
| LOGIN-REQ-007 | Nyilatkozat elfogadása nélkül a belépés álljon meg, és külön figyelmeztetés jelenjen meg. | Kritikus |
| LOGIN-REQ-008 | Üres e-mail és üres jelszó esetén külön, mezőhöz kapcsolt hibaüzenet jelenjen meg. | Kritikus |
| LOGIN-REQ-009 | Hibás hitelesítő adatokkal ne jöjjön létre munkamenet. | Kritikus |
| LOGIN-REQ-010 | Sikeres belépés után a `/vezerlopult` nyíljon meg. | Kritikus |
| LOGIN-REQ-011 | Feldolgozás alatt az érintett mezők és gombok legyenek letiltva. | Magas |
| TOUR-REQ-001 | A 30 másodperces bemutató indítható, szüneteltethető és újraindítható legyen. | Magas |
| TOUR-REQ-002 | A folyamatjelzővel lehessen a bemutató időpontját módosítani. | Közepes |
| TOUR-REQ-003 | Az időjelző mutassa az eltelt és teljes időt. | Közepes |

## 7. Demómód és adatizoláció

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| DEMO-REQ-001 | A demóbelépéshez kötelező legyen az adatkezelési nyilatkozat elfogadása. | Kritikus |
| DEMO-REQ-002 | Sikeres indításkor anonim munkamenet jöjjön létre és a vezérlőpult nyíljon meg. | Kritikus |
| DEMO-REQ-003 | Jól láthatóan jelenjen meg: „DEMÓ MÓD – Minden rögzítés próbaadat.” | Kritikus |
| DEMO-REQ-004 | A demó közös, kizárólag erre kijelölt demószervezetet és közös alapadatokat használjon. | Kritikus |
| DEMO-REQ-005 | A demófelhasználó soha ne kaphasson hozzáférést regisztrált ügyfél szervezetéhez vagy az Okosmérő adataihoz. | Kritikus |
| DEMO-REQ-006 | A demóban létrehozott és módosított rekordok kizárólag a demókörnyezetbe kerüljenek, legyenek azonosíthatók és biztonságosan visszaállíthatók. | Kritikus |
| DEMO-REQ-007 | A demóban az éles fő folyamatok kipróbálhatók, de a Jogtár módosítása/jóváhagyása és a szervezeti jogosultságkezelés tiltott. | Kritikus |
| DEMO-REQ-008 | A demó alapadatait ütemezetten vissza kell állítani; a visszaállítás más adatot nem érinthet. | Magas |
| DEMO-REQ-009 | A „Kilépés a demóból” szüntesse meg a munkamenetet és irányítson a belépési oldalra. | Kritikus |

## 8. Regisztráció, megerősítés és jelszókezelés

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| AUTH-REQ-001 | Teljes névvel, szervezetnévvel, e-maillel, két egyező jelszóval és adatkezelési elfogadással lehessen regisztrálni. | Kritikus |
| AUTH-REQ-002 | A jelszó legalább 8 karakteres legyen. | Kritikus |
| AUTH-REQ-003 | Sikeres regisztráció után megerősítő e-mail érkezzen. | Kritikus |
| AUTH-REQ-004 | Az érvényes megerősítő link aktiválja a fiókot és hozza létre az induló profil-, szervezet- és tagsági adatokat. | Kritikus |
| AUTH-REQ-005 | Hibás, lejárt vagy felhasznált link biztonságos hibaoldalra vezessen, ahonnan új levél kérhető. | Kritikus |
| AUTH-REQ-006 | A megerősítő levél újraküldése legyen korlátozott, és a várakozási idő legyen jelezve. | Magas |
| PWD-REQ-001 | A jelszó-helyreállítás válasza ne árulja el, hogy létezik-e az e-mail-cím. | Kritikus |
| PWD-REQ-002 | Lejárt vagy felhasznált helyreállító linkkel ne lehessen jelszót módosítani. | Kritikus |
| PWD-REQ-003 | Az új jelszó legalább 8 karakteres és a megerősítéssel azonos legyen. | Kritikus |
| PWD-REQ-004 | Az új jelszó ne egyezhessen meg a régivel. | Magas |
| SESSION-REQ-001 | Kijelentkezés után közvetlen URL-lel se legyen elérhető védett oldal. | Kritikus |
| SESSION-REQ-002 | Érvénytelen munkamenet a belépési oldalra irányítson. | Kritikus |
| PRIVACY-REQ-001 | Az `/adatkezeles` oldal bejelentkezés nélkül is megnyitható és olvasható legyen. | Kritikus |
| PRIVACY-REQ-002 | Az adatkezelési oldalról biztonságosan vissza lehessen térni a belépési folyamathoz. | Magas |

## 9. Vezérlőpult és navigáció

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| DASH-REQ-001 | Jelenjen meg a köszöntés és a négy fő modul: új vizsgálat, mentett rendszerek, Jogtár, tagok és szerepkörök. | Kritikus |
| DASH-REQ-002 | Minden kártya a hozzá tartozó oldalra navigáljon. | Kritikus |
| DASH-REQ-003 | A Jogtár kártya mutassa a várakozó tételeket. | Magas |
| DASH-REQ-004 | Demómódban általános, regisztrált módban névre szóló köszöntés jelenjen meg. | Közepes |

## 10. MI-rendszerek rögzítése és kezelése

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| CREATE-REQ-001 | Új rendszer csak érvényes szervezeti tagsággal rögzíthető. | Kritikus |
| CREATE-REQ-002 | Kötelező a rendszernév, iparág és legalább egy szervezeti szerepkör. | Kritikus |
| CREATE-REQ-003 | A funkciók az aktuális katalógusból töltődjenek, és mindegyikről Igen/Nem döntés legyen adható. | Kritikus |
| CREATE-REQ-004 | Csak a korábbi válaszok alapján szükséges pontosító kérdések jelenjenek meg. | Kritikus |
| CREATE-REQ-005 | Hiányzó kötelező válasszal ne lehessen menteni. | Kritikus |
| CREATE-REQ-006 | Mentés előtt összegzés és kapcsolódó Jogtár-hivatkozás jelenjen meg. | Magas |
| CREATE-REQ-007 | A mentés tranzakciós legyen: hiba esetén ne maradjon hiányos rendszer. | Kritikus |
| SYSTEM-REQ-001 | A lista kizárólag az aktuális szervezet aktív rendszereit mutassa. | Kritikus |
| SYSTEM-REQ-002 | A keresés név, rendeltetés és rendszertípus alapján, ékezet- és kisbetűfüggetlenül működjön. | Magas |
| SYSTEM-REQ-003 | Oldalanként legfeljebb 5 rendszer jelenjen meg, lapozással. | Magas |
| SYSTEM-REQ-004 | A kiválasztott rendszerről a szerkesztés és a szabályzat legyen elérhető. | Kritikus |
| SYSTEM-REQ-005 | Nem létező vagy nem engedélyezett rendszerazonosító ne fedjen fel adatot. | Kritikus |
| SYSTEM-REQ-006 | A korábbi `/rendszerek/{id}/eredmeny` útvonal irányítson ugyanannak a rendszernek az adatlapjára. | Közepes |
| EDIT-REQ-001 | A név, életciklus, funkciók és nyilatkozatok együtt, szerveroldali validációval legyenek módosíthatók. | Kritikus |
| EDIT-REQ-002 | A rendszernév 1–160 karakter legyen, normalizált szóközökkel. | Magas |
| EDIT-REQ-003 | Tiltott gyakorlat lehetőségénél jól látható jogi figyelmeztetés jelenjen meg. | Kritikus |
| EDIT-REQ-004 | A „törlés” megerősítés után archiváljon; az előzményeket őrizze meg. | Kritikus |

## 11. Tömeges import

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| IMPORT-REQ-001 | Letölthető, aktuális importsablon álljon rendelkezésre. | Kritikus |
| IMPORT-REQ-002 | CSV és XLSX fájl legyen támogatott. | Kritikus |
| IMPORT-REQ-003 | A fájl legfeljebb 2 MB és 100 adatsor lehet. | Magas |
| IMPORT-REQ-004 | Ellenőrizni kell a fejlécet, kötelező adatokat, törzsadatokat, duplikációkat, funkciófüggőségeket és nyilatkozatokat. | Kritikus |
| IMPORT-REQ-005 | Az előnézet soronként mutassa az érvényességet és a pontos hibákat. | Kritikus |
| IMPORT-REQ-006 | Egyetlen hibás sor esetén se indulhasson el az adatbázisba írás. | Kritikus |
| IMPORT-REQ-007 | A sikeres import tranzakciós legyen és ugyanazt a szabálymotort használja, mint az egyedi felvitel. | Kritikus |

## 12. Szabálymotor és szabályzat

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| RULE-REQ-001 | A szabálymotor kizárólag verziózott katalógus-, rendszer- és használatiprofil-adatokból dolgozzon. | Kritikus |
| RULE-REQ-002 | A kiválasztott szabályokhoz visszakövethető legyen a kiváltó tény és jogalap. | Kritikus |
| POLICY-REQ-001 | Szabályzat csak aktív, teljes és érvényes rendszeradatból készülhessen. | Kritikus |
| POLICY-REQ-002 | Változatlan forrásadat ne hozzon létre új verziót. | Kritikus |
| POLICY-REQ-003 | Releváns változás új verziót hozzon létre a korábbi megőrzésével. | Kritikus |
| POLICY-REQ-004 | A dokumentum tartalmazza a rendszeradatokat, verziót, állapotot, összefoglalót, tartalomjegyzéket, fejezeteket és jogalapokat. | Kritikus |
| POLICY-REQ-005 | A dokumentumban lehessen keresni, nyomtatni és böngészőből PDF-be menteni. | Magas |
| POLICY-REQ-006 | Frissítési hiba esetén a legutóbbi mentett verzió jelenjen meg figyelmeztetéssel. | Magas |

## 13. Szabályzat-felülvizsgálat

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| REVIEW-REQ-001 | A lista felülvizsgálati állapot szerint szűrhető legyen. | Magas |
| REVIEW-REQ-002 | A verzió, fejezetek, állapotok és megjegyzések legyenek láthatók. | Magas |
| REVIEW-REQ-003 | A fejezet címe és szövege szerkeszthető és visszaállítható legyen. | Magas |
| REVIEW-REQ-004 | A szabályok egyenként legyenek jóváhagyhatók, jogalapjuk megtekintésével. | Kritikus |
| REVIEW-REQ-005 | Hiányzó katalógusmodul beilleszthető legyen. | Magas |
| REVIEW-REQ-006 | A teljes dokumentum csak minden szükséges fejezet jóváhagyása után legyen lezárható. | Kritikus |
| REVIEW-REQ-007 | A dokumentum jóváhagyható vagy indoklással javításra visszaküldhető legyen. | Kritikus |

## 14. Jogtár

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| LEGAL-REQ-001 | A Jogtár csak bejelentkezett felhasználónak legyen elérhető. | Kritikus |
| LEGAL-REQ-002 | A szabályok cím, jogszabályhely és szöveg szerint kereshetők legyenek. | Magas |
| LEGAL-REQ-003 | A lista legyen szűrhető réteg, szerepkör és állapot szerint. | Magas |
| LEGAL-REQ-004 | A kiválasztott szabály szövege, jogalapjai és kapcsolódó moduljai legyenek láthatók. | Kritikus |
| LEGAL-REQ-005 | Csak a meghívott jogász módosíthasson, menthessen és hagyhasson jóvá szabályt. | Kritikus |
| LEGAL-REQ-006 | Jóváhagyás után az állapot, időpont, jóváhagyó és számlálók frissüljenek. | Kritikus |
| LEGAL-REQ-007 | Minden tartalmi változás legyen verziózott és auditálható. | Kritikus |

## 15. Szervezet és tagok

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| ORG-REQ-001 | A felhasználó csak saját szervezeteit és tagságait lássa. | Kritikus |
| ORG-REQ-002 | Owner vagy admin névvel, e-maillel és engedélyezett szerepkörrel hívhasson meg tagot. | Kritikus |
| ORG-REQ-003 | A szerepkör módosítása és tagság archiválása jogosultság-ellenőrzött legyen. | Kritikus |
| ORG-REQ-004 | Demófelhasználó ne kezelhessen tagokat vagy szerepköröket. | Kritikus |
| ORG-REQ-005 | Az utolsó aktív owner eltávolítása vagy lefokozása legyen tiltott. | Kritikus |

## 16. Adatmodell és adatmegőrzés

A logikai adatmodell legalább az alábbi területeket tartalmazza:

| Terület | Fő adatok |
|---|---|
| Felhasználó és adatvédelem | profilok, adatkezelési elfogadások |
| Szervezet | szervezetek, tagságok, szerepkörök |
| MI-rendszer | rendszerek, funkciók, használati profilok, életciklus, változásnapló |
| Katalógus | iparágak, rendszer-típus sablonok, funkciók, függőségek, kérdéscsoportok, triggerek |
| Szabályzat | generált szabályzatok, modulok, jóváhagyások, kézi beillesztések |
| Jogtár | jogi szövegek, források, változások és frissítési futások |

**DATA-REQ-001:** Minden szervezeti rekord egyértelműen kapcsolódjon szervezethez.
**DATA-REQ-002:** Az archivált rekord megőrizze az azonosítót, előzményeket, létrehozási és módosítási adatokat.
**DATA-REQ-003:** Idegen kulcsokkal, egyedi kulcsokkal és ellenőrző feltételekkel kell megakadályozni az érvénytelen állapotot.
**DATA-REQ-004:** A teljes séma, függvények, RLS-szabályok, jogosultságok és seedek verziózott migrációként kerüljenek a repóba.
**DATA-REQ-005:** Egy üres Supabase-projekt a repóból reprodukálható legyen kézi SQL-módosítás nélkül.

## 17. API- és RPC-követelmények

Az alkalmazás API-ja három részből áll: Supabase Auth, RLS-sel védett közvetlen táblaelérés, valamint PostgreSQL RPC-k. Ezen kívül egy saját HTTP-végpont végzi a jogforrás-frissítést.

| Terület | Elvárt szerződés |
|---|---|
| Auth API | Regisztráció, belépés, anonim belépés, megerősítés, kijelentkezés és jelszó-helyreállítás. |
| Szervezeti RPC | Szervezetek/tagok lekérdezése, meghívás, szerepkörváltás és archiválás. |
| MI-rendszer RPC | Katalógus, előnézet, mentés, módosítás, archiválás és tömeges import. |
| Szabályzat RPC | Generálás, újragenerálás, fejezetszerkesztés, modulbeillesztés, jóváhagyás és visszaküldés. |
| Jogtár RPC | Lista, részlet, mentés és jóváhagyás. |
| Frissítési API | `GET /api/jogszabaly-frissites`, kizárólag érvényes Bearer `CRON_SECRET` mellett. |

**API-REQ-001:** Minden RPC paraméterezése és visszatérési típusa legyen verziózott és egyezzen a frontend hívásával.
**API-REQ-002:** Hibás, hiányzó vagy jogosulatlan kérés ne módosítson adatot, és stabil hibakódot/hibaüzenetet adjon.
**API-REQ-003:** A több rekordot módosító RPC tranzakcióban fusson.
**API-REQ-004:** Az API ne bízzon meg a kliens által küldött szervezet- vagy szerepköradatban ellenőrzés nélkül.
**API-REQ-005:** A service role kulcs kizárólag szerveroldali folyamatban használható és nem kerülhet klienskódba, naplóba vagy tesztartefaktumba.
**API-REQ-006:** A jogforrás-frissítés változatlan tartalomnál ne készítsen változásbejegyzést; eltérésnél naplózza a futást és jelölje az érintett tételeket felülvizsgálandónak.

## 18. Supabase RLS és biztonság

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| SEC-REQ-001 | Minden kliensből elérhető `aic_*` táblán legyen bekapcsolt és tesztelt RLS. | Kritikus |
| SEC-REQ-002 | A SELECT/INSERT/UPDATE/DELETE policy a felhasználó tényleges szervezeti tagságát és szerepkörét vizsgálja. | Kritikus |
| SEC-REQ-003 | UPDATE policy tartalmazzon megfelelő `USING` és `WITH CHECK` feltételt is. | Kritikus |
| SEC-REQ-004 | A demó anon felhasználó csak a kijelölt demóadatokat érhesse el. | Kritikus |
| SEC-REQ-005 | A két, közös Supabase-projektben futó alkalmazás táblái, RPC-i és Storage-objektumai ne legyenek keresztben elérhetők. | Kritikus |
| SEC-REQ-006 | Minden `SECURITY DEFINER` függvény ellenőrizze az `auth.uid()` értéket, használjon rögzített `search_path`-ot, és kapjon minimális explicit EXECUTE jogosultságot. | Kritikus |
| SEC-REQ-007 | A veszélyes függvények alapértelmezett PUBLIC/anon végrehajtási joga legyen visszavonva. | Kritikus |
| SEC-REQ-008 | A service role kulcs ne legyen `NEXT_PUBLIC_*` változó és ne kerüljön a böngészőbe. | Kritikus |
| SEC-REQ-009 | Közvetlen azonosítóval se legyen olvasható vagy módosítható más szervezet vagy archivált rendszer adata. | Kritikus |
| SEC-REQ-010 | Külső címre irányuló, felhasználó által befolyásolható nyílt átirányítás legyen tiltott. | Kritikus |

## 19. Jogszabályváltozás-figyelés

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| UPDATE-REQ-001 | A frissítési végpont csak érvényes `CRON_SECRET` mellett fusson. | Kritikus |
| UPDATE-REQ-002 | A támogatott EUR-Lex és NJT forrásokat hetente, hétfőn 04:00 UTC-kor ellenőrizze. | Magas |
| UPDATE-REQ-003 | A feldolgozás determinisztikus és újrafuttatható legyen. | Kritikus |
| UPDATE-REQ-004 | Minden futás forrásonként rögzítse az állapotot, darabszámokat és hibát. | Kritikus |
| UPDATE-REQ-005 | A forrásfeldolgozás részleges hibája ne maradjon észrevétlen és ne jelentsen hamis sikert. | Kritikus |

## 20. Nem funkcionális követelmények

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| NFR-001 | A felület a támogatott modern Chrome és Firefox böngészőben működjön. | Magas |
| NFR-002 | A lényeges vezérlők billentyűzettel elérhetők és látható fókuszállapotúak legyenek. | Magas |
| NFR-003 | Az űrlapmezőknek programozott címkéjük, a státuszüzeneteknek megfelelő akadálymentes jelzésük legyen. | Magas |
| NFR-004 | Titok, jelszó vagy személyes adat ne kerüljön kliensnaplóba és pipeline-artefaktumba. | Kritikus |
| NFR-005 | A produkciós függőségek között ne legyen ismert kritikus vagy magas sebezhetőség. | Kritikus |
| NFR-006 | A build reprodukálható legyen rögzített lock fájlból. | Magas |

## 21. Tesztelhetőség és CI/CD pipeline

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| TEST-REQ-001 | Minden teszt kapcsolódjon követelményazonosítóhoz. | Kritikus |
| TEST-REQ-002 | A kritikus vezérlők kapjanak stabil `id` vagy `data-testid` azonosítót. | Magas |
| TEST-REQ-003 | A tesztek egymástól függetlenül és tetszőleges sorrendben fussanak. | Kritikus |
| TEST-REQ-004 | Az automata teszt csak saját, egyedileg jelölt tesztadatot módosíthat. | Kritikus |
| TEST-REQ-005 | Takarítás nem törölhet felhasználói, más teszthez vagy az Okosmérőhöz tartozó adatot. | Kritikus |
| TEST-REQ-006 | Az alap URL és a Supabase tesztprojekt konfigurációból legyen megadható. | Magas |
| TEST-REQ-007 | A pipeline futtasson formázás/lint, build, egység-, API/RPC/RLS- és Selenium végponttól végpontig teszteket. | Kritikus |
| TEST-REQ-008 | Sikertelen futás őrizze meg a JUnit XML-riportot, böngészőnaplót és képernyőképet. | Magas |
| TEST-REQ-009 | A pipeline ne használjon éles service role kulcsot és ne fusson éles ügyféladaton. | Kritikus |
| TEST-REQ-010 | Merge/deploy csak a kötelező tesztek sikeres futása után legyen engedélyezett. | Kritikus |

## 22. Elfogadási feltételek

Az alkalmazás kiadásra és stabil automata pipeline-ra akkor alkalmas, ha:

1. minden kritikus követelményhez van legalább egy pozitív és szükség szerint negatív teszt;
2. nincs nyitott kritikus vagy magas súlyosságú funkcionális/biztonsági hiba;
3. a teljes Supabase-séma és RLS reprodukálható a repóból;
4. az API/RPC szerződések egyeznek a klienshívásokkal;
5. a demó- és szervezeti adatizoláció RLS-teszttel bizonyított;
6. a Jogtár módosítását kizárólag meghívott jogász tudja végrehajtani;
7. a build és az összes kötelező automata teszt zöld;
8. a sikertelen tesztekhez visszakereshető riport és hibajegy készül.

## 23. Repóvizsgálat során feltárt megvalósítási eltérések

Ezek nem elvárt működések, hanem javítandó vagy élő környezetben igazolandó tételek.

| Azonosító | Megállapítás | Súlyosság |
|---|---|---|
| AUDIT-001 | A repó nem tartalmazza a teljes élő Supabase-alapsémát, minden RLS policyt és minden aktuális RPC-definíciót; üres projekt nem építhető fel belőle bizonyíthatóan. | Kritikus blokkoló |
| AUDIT-002 | A frontend több Jogtár-RPC-t más paraméterekkel hív, mint amit a repóban található SQL definiál; az élő adatbázis valószínűleg nem verziózott újabb változatot használ. | Kritikus blokkoló |
| AUDIT-003 | A jelenlegi demócsatlakozás meglévő szervezetet választhat és `owner` tagságot adhat; ez nem felel meg a kötelező demóizolációnak. | Kritikus |
| AUDIT-004 | A jelenlegi Jogtár-felület és SQL az `owner` számára is engedhet döntést, miközben az elvárt szabály szerint csak a meghívott jogász módosíthat/jóváhagyhat. | Kritikus |
| AUDIT-005 | A jogszabály-frissítő útvonal a `cikkek` változót annak hatókörén kívül használja, ezért a feldolgozás után hibás forrásállapotot rögzíthet. | Magas |
| AUDIT-006 | A repóban nincs alkalmazáskódhoz tartozó automata teszt és nincs `.github/workflows` pipeline. | Magas |
| AUDIT-007 | A produkciós függőségek auditja 2 magas és 2 közepes sebezhetőséget jelez a jelenlegi függőségi fában. | Magas |
| AUDIT-008 | A Next.js alkalmazás dummy környezeti változókkal sikeresen buildel; ez a fordíthatóságot igazolja, az élő Supabase/RLS működést nem. | Információ |

## 24. Jóváhagyott termékdöntések

1. A demómód kijelölt közös demóadatokat használ, de semmilyen más szervezet adatát nem érheti el.
2. A demóban a fő üzleti funkciók kipróbálhatók; a Jogtár módosítása/jóváhagyása kizárólag meghívott jogászé.
3. A tömeges import CSV- és XLSX-fájlt támogat.
4. Az üres e-mail- és jelszómező külön hibaüzenetet kap.
5. A felületi törlés minden esetben archiválást jelent.
6. A Jogtárban a meghívott jogászon kívül minden szereplő csak olvasási jogosultságú.

## 25. Kapcsolódó tesztdokumentumok

- `docs/manualis-tesztesetek.md` – a követelményekből levezetett manuális tesztesetek;
- `docs/hibajegyzek.md` – feltárt eltérések és újratesztelésük;
- `docs/tesztfuttatasok.md` – végrehajtott tesztfuttatások;
- tervezett `docs/automatizalasi-matrix.md` – követelmény, manuális és automata teszt összerendelése.

## 26. Auditkorlát

A repó teljes tartalma átvizsgálható volt. Az élő Supabase-adatbázis tényleges táblái, aktuális RPC-függvényei, RLS policyjai, Auth-beállításai és adatai azonban nem mind szerepelnek a repóban, ezért azok teljes igazolásához biztonságos sémaexport vagy közvetlen, csak olvasási Supabase-vizsgálat szükséges. Ez nem a specifikáció hiánya, hanem a megvalósítás ellenőrzésének jelenlegi korlátja.
