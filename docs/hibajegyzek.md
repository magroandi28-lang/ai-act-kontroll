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
