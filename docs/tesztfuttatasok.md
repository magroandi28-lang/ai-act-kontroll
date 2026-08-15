# Tesztfuttatások

| Futtatás | Teszteset | Környezet | Eredmény | Hibajegy | Újratesztelés |
|---|---|---|---|---|---|
| RUN-AUTH-001 | AUTH-REG-001 | Vercel, Chrome, Windows | **Sikertelen** | BUG-AUTH-001 | Szükséges |
| RUN-AUTH-002 | AUTH-REG-001 | Vercel, Chrome, Windows | **Sikeres** | BUG-AUTH-001 | Sikeres |
| RUN-AUTH-003 | AUTH-LOGIN-001 | Vercel, Chrome, Windows | **Sikeres** | – | Nem szükséges |
| RUN-AUTH-004 | AUTH-LOGOUT-001 | Vercel, Chrome, Windows | **Sikeres** | – | Nem szükséges |
| RUN-AUTH-005 | AUTH-LOGIN-001 | Vercel, Chrome, Windows | **Sikeres** | – | Regressziós teszt |
| RUN-DASH-001 | DASH-001 | Vercel, Chrome, Windows | **Sikeres** | – | Nem szükséges |
| RUN-DASH-002 | DASH-NAV-001 | Vercel, Chrome, Windows | **Sikeres** | – | Nem szükséges |
| RUN-DASH-003 | DASH-NAV-002 | Vercel, Chrome, Windows | **Sikeres** | – | Nem szükséges |
| RUN-POLICY-BUILD-001 | Projekt build | Helyi Next.js 14.2.35 | **Sikeres** | – | Nem szükséges |
| RUN-POLICY-001 | POLICY-001 | Vercel, Chrome, Windows | **Sikeres** | – | Nem szükséges |
| RUN-POLICY-002 | POLICY-002 | Vercel, Chrome, Windows | **Sikeres** | – | Nem szükséges |
| RUN-SYSTEM-EDIT-001 | SYSTEM-EDIT-001 | Vercel, Chrome, Windows | **Sikertelen** | BUG-SYSTEM-001 | Szükséges |
| RUN-IMPORT-XLSX-001 | IMPORT-XLSX-002 | Vercel, Chrome, Windows, Excel | **Sikertelen** | BUG-IMPORT-001 | Szükséges |
| RUN-IMPORT-XLSX-002 | IMPORT-XLSX-001 | Vercel, Chrome, Windows, Excel | **Sikeres** | – | Regressziós teszt szükséges |
| RUN-SYSTEM-FIND-001 | SYSTEM-FIND-001 | Vercel, Chrome, Windows | **Sikertelen** | BUG-SYSTEM-002 | Szükséges |
| RUN-SYSTEM-FIND-002 | SYSTEM-FIND-001 | Vercel, Chrome, Windows | **Sikeres** | BUG-SYSTEM-002 | Sikeres |
| RUN-POLICY-GATE-DB-001 | POLICY-GATE-001, POLICY-GATE-002 | Supabase PostgreSQL | **Sikeres** | BUG-POLICY-001 | Felületi újratesztelés szükséges |
| RUN-POLICY-GATE-UI-001 | POLICY-GATE-001 | Vercel, Chrome, Windows | **Sikeres** | BUG-POLICY-001 | Negatív felületi teszt sikeres |
| RUN-SYSTEM-RETURN-001 | SYSTEM-RETURN-001 | Vercel, Chrome, Windows | **Sikertelen** | BUG-SYSTEM-003 | Szükséges |
| RUN-PROFILE-AUDIT-001 | Profilok 2–8 adatbázis-regresszió | Supabase PostgreSQL 17 | **Sikeres** | – | Szakértői felülvizsgálat után |
| RUN-PROFILE-BUILD-001 | Javítás utáni produkciós build | Helyi Next.js 14.2.35 | **Sikeres** | – | Nem szükséges |

## RUN-AUTH-001 részletei

Az adatok elküldése és a megerősítő e-mail kézbesítése sikerült. A levélben található link kiválasztása után azonban **„A megerősítő link nem használható”** oldal jelent meg, ezért a teljes regisztrációs folyamat nem felelt meg az elvárt működésnek.

**Bizonyíték:** [BUG-AUTH-001 képernyőkép](bizonyitekok/BUG-AUTH-001.png)

## RUN-AUTH-002 részletei

A javítás után a teljes regisztrációs folyamatot ismételten végrehajtottuk. A regisztráció létrejött, a megerősítő e-mail megérkezett, a megerősítő link működött, majd a felhasználó sikeresen elérte a vezérlőpultot. Az ellenőrző teszt sikeres volt.

**Eredmény:** a BUG-AUTH-001 hiba nem jelentkezett újra.

## RUN-AUTH-003 részletei

A megerősített felhasználó helyes e-mail-címmel és jelszóval, az adatkezelési nyilatkozat elfogadása után sikeresen bejelentkezett, és megnyílt a védett vezérlőpult.

## RUN-AUTH-004 részletei

A **Kijelentkezés** gomb kiválasztása után a rendszer sikeresen visszairányította a felhasználót a belépési oldalra. Ezután a `/vezerlopult` címet közvetlenül megnyitva a védett oldal nem jelent meg, a rendszer ismét a belépési oldalra irányított. A munkamenet megszűnt, a kijelentkezési teszt sikeres.

## Irányítópult futtatási eredményei

Az irányítópult fejlesztése után a bejelentkezés ismét sikeres volt, ezért a regressziós teszt megfelelt. Az új irányítópult hiba nélkül megjelent. Mindkét műveleti kártya kattintható volt, a megfelelő tájékoztató céloldal nyílt meg, és a visszalépési hivatkozások is működtek.

## RUN-POLICY-BUILD-001 részletei

Az audit utáni alkalmazáskód `npm run build` paranccsal sikeresen lefordult. A Next.js fordítás, lintelés és típusellenőrzés hibát nem jelzett. A Vercel-környezetben végzendő felületi teszteket csak a fájlok feltöltése után lehet lezárni.

## RUN-POLICY-001 és RUN-POLICY-002 részletei

A mentett ügyfélszolgálati chatbot kártyájáról köztes oldal nélkül megnyílt az alkalmazandó szabályozási és megfelelőségi követelménydokumentum. A 2. verzió 26 fejezetet tartalmazott, a teljes útvonal működött, a dokumentum listázható, kereshető és PDF-ként menthető volt. A PDF 11 A4-oldalon, olvashatóan jelent meg; levágott vagy egymásra csúszó tartalmat nem találtunk. A jogi követelmények és belső kontrollok elkülönítve, a jogforrásokkal együtt jelentek meg.

## RUN-SYSTEM-EDIT-001 részletei

A mentett MI-rendszert sikerült megkeresni, a szerkesztőoldal megnyílt, és a chatbot javított neve megfelelően mentődött. Mentés után azonban a rendszer visszairányított a teljes listához. A korábban kiválasztott chatbot nem maradt megnyitva, ezért ismét meg kellett keresni.

**Eredmény:** az adatmódosítás sikeres volt, de a 4. lépés navigációs elvárása nem teljesült. A teljes teszteset ezért sikertelen, és javítás utáni újratesztelés szükséges.

## RUN-IMPORT-XLSX-001 részletei

Az első ellenőrzés során az importálófelület **10 megfelelő, 0 hibás sor** eredményt jelzett annak ellenére, hogy a táblázatból hiányzott egy teljes, a besoroláshoz szükséges oszlop. Az automatikus besorolás helyén csak „–” jelent meg. A fájl tehát nem volt megfelelő, de az ellenőrzés nem jelezte a szerkezeti hibát.

**Eredmény:** sikertelen negatív teszt; a BUG-IMPORT-001 hibajegy megnyitva.

## RUN-IMPORT-XLSX-002 részletei

A javított XLSX-fájl ellenőrzése **10 megfelelő, 0 hibás sor** eredményt adott. Mind a 10 rendszer mellett megjelent az automatikus használatiprofil-besorolás. Az importálás után a rendszerek külön panelként megjelentek a **Mentett MI-rendszerek** oldalon, és megnyithatók voltak.

**Eredmény:** a helyesen kitöltött adatforrás ellenőrzése és sorozatos importálása sikeres.

## RUN-SYSTEM-FIND-001 részletei

A kereső megtalálta a **Számla Segéd** rendszert, és arra a listaoldalra navigált, amelyen a panel szerepelt. A kiválasztott rendszer mellett azonban az oldal többi három panelje is látható maradt. A szerkesztés utáni visszatéréskor ugyanez történt: a megfelelő oldal jelent meg, de a rendszert ismét meg kellett keresni a többi panel között.

**Eredmény:** a keresett rendszer elérhető volt, de a találati lista nem szűkült le a kiválasztott panelre. A teszteset sikertelen; BUG-SYSTEM-002 rögzítve.

## RUN-SYSTEM-FIND-002 részletei

A javítás után a keresőből kiválasztott chatbot önálló találatként jelent meg, a többi panel és a lapozó nem volt látható. A szerkesztésből visszatérve a kiválasztott rendszer maradt a felületen, az `×` gomb pedig megfelelően visszaállította a teljes rendszerlistát.

**Eredmény:** a javítás ellenőrzése sikeres; a BUG-SYSTEM-002 hiba nem jelentkezett újra.

## RUN-POLICY-GATE-DB-001 részletei

Az adatbázisban telepített profilkaput egy érvényes **Számla- és fogyasztási ügyintézés** profillal és a profil nélküli régi **Ügyfélszolgálati chatbot** rekorddal ellenőriztük. Az érvényes profil megfelelt. A profil nélküli rekordot a kapu a meghatározott hibaüzenettel elutasította. Az `aic_generated_policies` táblán aktív adatbázis-trigger akadályozza meg a kapu más útvonalon történő megkerülését.

A teljes aktív állomány ellenőrzésekor tíz profilozott rendszer megfelelt. Az **EnergiaChat** rekordhoz rendelt profil és a tárolt rendszertények között eltérés található, ezért ennél a rendszernél a generálás helyesen blokkolódik, amíg az adatokat felül nem vizsgáljuk.

**Eredmény:** az adatbázisszintű ellenőrzés sikeres; a felületi manuális újratesztelés még szükséges.

## RUN-POLICY-GATE-UI-001 részletei

A profil nélküli régi **Ügyfélszolgálati chatbot** paneljét a felhasználó a böngészőben megnyitotta. A rendszer a korábban létrehozott szabályzat megjelenítése helyett leállította a folyamatot, és az alábbi üzenetet jelenítette meg:

> A szabályzat nem készíthető el, mert a rendszerhez nincs érvényes használati profil rendelve.

**Eredmény:** a feketedobozos negatív manuális teszt sikeres. Profil nélküli rendszerhez a felület nem adott ki szabályzatot.

**Bizonyíték:** [A szabálykapu hibaüzenete](bizonyitekok/POLICY-GATE-001.png)

## RUN-SYSTEM-RETURN-001 részletei

A kiválasztott chatbot szabályzatának megnyitása után a visszalépés a teljes rendszerlistára vezetett. A korábban kiválasztott panel nem maradt elkülönítve, ezért azt ismét meg kellett keresni a többi rendszer között.

**Eredmény:** sikertelen használhatósági teszt; BUG-SYSTEM-003 rögzítve. A javítás felületi újratesztelése szükséges.

## RUN-PROFILE-AUDIT-001 részletei

A 2–8. használati profil teljes auditjában feltárt F-01–F-09 hiányosságok javítása után adatbázis-regresszió készült. A 30 chatbot- és energetikai modul mindegyikéhez tartozik szabály, végrehajtási művelet és kötelező bizonyíték. A mérőállás-, panasz-, különlegesadat-, védendő ügyfél- és egyediadat-nyomkövetési modulok a megfelelő profilokban kiválasztódtak.

A kombinált profil mind a 10 kételemű szolgáltatáspárja megfelelt: funkciófüggőségi hiba **0**, szakmodul-unió eltérés **0**. A hiányos számla-, mérési, mérőállás- és tartozási konfigurációkat a függőségi kapu elutasítja.

**Eredmény:** sikeres. A megváltozott profilok 11 aktív rendszerénél kötelező kezelői újramegerősítés maradt; ezt a szabályzatgeneráló kapu kikényszeríti.

## RUN-PROFILE-BUILD-001 részletei

Az auditjavítások után az `npm run build` sikeresen lefutott. A Next.js fordítás, lint- és típusellenőrzés, 13 statikus oldal generálása, a dinamikus útvonalak és a middleware összeállítása sikeres volt. A meglévő Webpack-gyorsítótár helyreállítási figyelmeztetései nem okoztak buildhibát.
