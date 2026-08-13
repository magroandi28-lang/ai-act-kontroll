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
| RUN-CATALOG-BUILD-001 | Projekt build | Helyi Next.js 14.2.35 | **Sikeres** | – | Nem szükséges |
| RUN-CATALOG-001 | SYSTEM-CATALOG-001 | Vercel, Chrome, Windows | **Tesztelésre vár** | – | Szükséges |
| RUN-CATALOG-002 | SYSTEM-CATALOG-002 | Vercel, Chrome, Windows | **Tesztelésre vár** | – | Szükséges |

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

## RUN-CATALOG-BUILD-001 részletei

Az iparág- és képességkatalógussal bővített alkalmazás sikeresen lefordult. Az adatbázis-ellenőrzés 1 aktív iparágat, 10 aktív képességet, a meglévő chatbotnál 6 visszakövethető képességkapcsolatot és működő atomi mentési függvényt igazolt. Az új adatbáziselemekhez kapcsolódó Supabase biztonsági és teljesítménytanácsadó nem jelzett új problémát.
