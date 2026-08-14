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
