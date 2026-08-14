# Hibajegyzék

## BUG-AUTH-001 – A megerősítő link hibás oldalra vezet

| Mező | Érték |
|---|---|
| Modul | Regisztráció / e-mailes megerősítés |
| Kapcsolódó teszteset | AUTH-REG-001 |
| Környezet | Vercel, Chrome, Windows |
| Súlyosság | Magas |
| Prioritás | Magas |
| Állapot | Lezárt |

### Előfeltétel

A regisztráció elkészült, és a megerősítő e-mail megérkezett.

### Reprodukció

1. A megerősítő e-mail megnyitása.
2. A megerősítő link kiválasztása.

### Elvárt eredmény

A fiók aktiválódik, majd a felhasználó a vezérlőpultra jut.

### Tényleges eredmény

„A megerősítő link nem használható” hibaoldal jelent meg.

### Bizonyíték

![A megerősítő link nem használható](bizonyitekok/BUG-AUTH-001.png)

### Javítás ellenőrzése

A teljes regisztrációs folyamatot új tesztadattal megismételtük. A megerősítő link megfelelően működött, a felhasználó elérte a vezérlőpultot. A hiba nem jelentkezett újra, ezért a hibajegy lezárható.

## BUG-SYSTEM-001 – Mentés után elvész a szerkesztett rendszer kontextusa

| Mező | Érték |
|---|---|
| Modul | Mentett MI-rendszerek / szerkesztés |
| Kapcsolódó teszteset | SYSTEM-EDIT-001 |
| Környezet | Vercel, Chrome, Windows |
| Súlyosság | Közepes |
| Prioritás | Közepes |
| Állapot | Nyitott |

### Előfeltétel

A felhasználó bejelentkezett, megkeresett egy mentett MI-rendszert, és megnyitotta annak szerkesztőoldalát.

### Reprodukció

1. A rendszer nevének módosítása.
2. A **Módosítások mentése** gomb kiválasztása.

### Elvárt eredmény

A módosítás sikeres mentése után ugyanannak a rendszernek a szerkesztőoldala marad megnyitva, és megjelenik a sikeres mentés visszajelzése.

### Tényleges eredmény

A névmódosítás sikeresen mentődött, de az alkalmazás visszairányított a teljes rendszerlistához. A szerkesztett chatbot visszakerült a lista szerinti helyére, ezért újra meg kellett keresni.

### Javítási javaslat

Sikeres módosítás után az alkalmazás maradjon a `/rendszerek/[id]/szerkesztes` oldalon. A listára csak külön visszalépéssel vagy sikeres archiválás után irányítson.

## BUG-IMPORT-001 – Hiányzó kötelező oszlopot hibátlannak jelez az XLSX-ellenőrzés

| Mező | Érték |
|---|---|
| Modul | Több MI-rendszer feltöltése / XLSX-ellenőrzés |
| Kapcsolódó teszteset | IMPORT-XLSX-002 |
| Környezet | Vercel, Chrome, Windows, Excel |
| Súlyosság | Magas |
| Prioritás | Magas |
| Állapot | Nyitott |

### Reprodukció

1. Egy, a besoroláshoz szükséges teljes oszlopot nem tartalmazó XLSX-fájl kiválasztása.
2. A **Fájl ellenőrzése** gomb kiválasztása.

### Elvárt eredmény

A rendszer megnevezi a hiányzó kötelező oszlopot, hibásnak jelöli a fájlt, és letiltja az importálást.

### Tényleges eredmény

Az ellenőrzés **10 megfelelő, 0 hibás sor** eredményt jelzett. Az automatikus besorolás értéke „–” maradt, de a rendszer nem jelezte, hogy a fájl szerkezete hiányos.

### Javítási javaslat

A sorok feldolgozása előtt kötelező fejléc- és oszlopvalidáció fusson. Hiányzó kötelező oszlop esetén a teljes fájl importálását meg kell akadályozni, és egyértelmű hibaüzenetet kell megjeleníteni.

## BUG-SYSTEM-002 – A keresés nem különíti el a kiválasztott rendszer paneljét

| Mező | Érték |
|---|---|
| Modul | Mentett MI-rendszerek / keresés és lapozás |
| Kapcsolódó teszteset | SYSTEM-FIND-001 |
| Környezet | Vercel, Chrome, Windows |
| Súlyosság | Közepes |
| Prioritás | Magas |
| Állapot | Lezárt |

### Reprodukció

1. Egy konkrét chatbot – például a **Számla Segéd** – megkeresése.
2. A felajánlott találat kiválasztása.

### Elvárt eredmény

Kizárólag a kiválasztott chatbot panelje jelenik meg. A szerkesztésből visszatérve ugyanez a kiválasztás marad meg.

### Tényleges eredmény

A rendszer a megfelelő listaoldalra navigált, de a keresett chatbot mellett az adott oldal többi paneljét is megjelenítette. Emiatt a találatot ismét meg kellett keresni a panelek között.

### Elvégzett javítás

A kiválasztott rendszer azonosítója bekerül az oldal címébe. A lista ilyenkor csak ezt az egy rekordot tölti be, a lapozó eltűnik, a szerkesztőoldal visszalépési hivatkozása pedig megőrzi a kiválasztást. Az `×` gomb állítja vissza a teljes listát.

### Javítás ellenőrzése

Az újratesztelés során kizárólag a kiválasztott chatbot panelje jelent meg. A szerkesztésből történő visszatérés megőrizte a kiválasztást, az `×` gomb pedig visszaállította a teljes listát. A hiba nem jelentkezett újra, ezért a hibajegy lezárható.

## BUG-POLICY-001 – Érvényes használati profil nélkül is készülhetett szabályzat

| Mező | Érték |
|---|---|
| Modul | Determinisztikus szabálymotor / szabályzatgenerálás |
| Kapcsolódó teszteset | POLICY-GATE-001, POLICY-GATE-002 |
| Környezet | Supabase PostgreSQL, Vercel |
| Súlyosság | Kritikus |
| Prioritás | Kritikus |
| Állapot | Javítva, részben újratesztelve |

### Hiba

A generátor az aktív rendszert és a rendszertípust ellenőrizte, de nem követelte meg a katalógusban szereplő aktív használati profilt. Emiatt hiányos vagy nem igazolt rendszeradatokból is létrejöhetett szabályzat.

### Elvárt eredmény

Szabályzat csak akkor készülhet, ha a rendszerhez rendelt profil létezik és aktív, az iparág és a rendszertípus egyezik, valamint a tárolt rendszertények teljesítik a profil kötelező tény- és képességfeltételeit.

### Elvégzett javítás

Központi adatbázis-függvény ellenőrzi a használati profil érvényességét. A generátor már a modulok kiválasztása előtt meghívja ezt a kaput. Az `aic_generated_policies` táblán működő trigger megakadályozza, hogy másik kódútvonal érvénytelen profilhoz szabályzatot mentsen. A korábbi, változatlan szabályzatok összehasonlítása nem hoz létre indokolatlan új verziót.

### Adatellenőrzési megállapítás

A profil nélküli régi **Ügyfélszolgálati chatbot** szabályzatkészítése blokkolódik. Az **EnergiaChat** profilja és rendszertényei nem egyeznek teljesen, ezért annak adatait külön felül kell vizsgálni. A további tíz profilozott aktív rendszer átment az adatbázis-ellenőrzésen.

### Felületi újratesztelés

A profil nélküli rendszerrel végzett feketedobozos negatív teszt sikeres volt: a szabályzat nem jelent meg, és a megfelelő hibaüzenet volt látható. A hibajegy teljes lezárása előtt az érvényes profilú rendszer pozitív felületi tesztjét is végre kell hajtani.

## BUG-SYSTEM-003 – A szabályzatból visszatérve elvész a kiválasztott rendszer

| Mező | Érték |
|---|---|
| Modul | Mentett MI-rendszerek / szabályzatnavigáció |
| Kapcsolódó teszteset | SYSTEM-RETURN-001 |
| Környezet | Vercel, Chrome, Windows |
| Súlyosság | Közepes |
| Prioritás | Magas |
| Állapot | Javítva, újratesztelésre vár |

### Tényleges eredmény

A szabályzat megnyitása után a visszalépési hivatkozás a teljes rendszerlistára vitt. A korábban kiválasztott chatbotot ismét meg kellett keresni a lapozható panelek között.

### Elvárt eredmény

A szabályzatból és a profilkapu hibaoldaláról történő visszalépés ugyanannak az egy kiválasztott rendszernek a paneljére vezessen.

### Elvégzett javítás

A rendes szabályzatoldal és a generálási hibaoldal visszalépési hivatkozása is továbbadja a rendszer azonosítóját a mentett rendszerek oldalának.
