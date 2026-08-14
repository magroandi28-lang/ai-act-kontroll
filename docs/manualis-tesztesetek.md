# Manuális tesztesetek

## AUTH-REG-001 – Sikeres regisztráció érvényes adatokkal

**Kapcsolódó követelmények:** AUTH-REQ-001, AUTH-REQ-002, AUTH-REQ-003  
**Prioritás:** Kritikus  
**Típus:** Pozitív, funkcionális  
**Automatizálható:** Részben – az e-mailes megerősítés külön megoldást igényel

### Előfeltétel

A teszteléshez használt e-mail-cím még nem szerepel a Supabase Auth felhasználói között.

### Tesztadatok

- érvényes teljes név;
- érvényes szervezetnév;
- egyedi, működő e-mail-cím;
- legalább 8 karakteres jelszó;
- a megerősítő jelszó megegyezik a jelszóval.

### Lépések és elvárt eredmények

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | A belépési oldal megnyitása. | A belépési oldal hiba nélkül betöltődik. |
| 2 | A **Regisztráció** hivatkozás kiválasztása. | Megnyílik a regisztrációs oldal. |
| 3 | Az összes kötelező mező kitöltése érvényes adatokkal. | A megadott értékek megjelennek a megfelelő mezőkben. |
| 4 | Az adatkezelési nyilatkozat elfogadása. | A jelölőnégyzet bejelölt állapotba kerül. |
| 5 | A **Fiók létrehozása** gomb kiválasztása. | Megjelenik a megerősítő e-mail elküldéséről szóló tájékoztatás. |
| 6 | A megerősítő e-mail megnyitása. | Az e-mail megérkezik a megadott címre. |
| 7 | A megerősítő link kiválasztása. | A fiók aktiválódik, az induló fiókadatok létrejönnek, és megnyílik a vezérlőpult. |

## AUTH-LOGIN-001 – Sikeres bejelentkezés érvényes adatokkal

**Kapcsolódó követelmény:** AUTH-REQ-004  
**Prioritás:** Kritikus  
**Típus:** Pozitív, funkcionális  
**Automatizálható:** Igen

### Előfeltétel

A felhasználó regisztrált, e-mail-címe megerősített, és nincs bejelentkezve.

### Lépések és elvárt eredmények

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | A belépési oldal megnyitása. | A belépési oldal hiba nélkül betöltődik. |
| 2 | A regisztrált e-mail-cím és a helyes jelszó megadása. | A mezők elfogadják a bevitt adatokat. |
| 3 | Az adatkezelési nyilatkozat elfogadása. | A jelölőnégyzet bejelölt állapotba kerül. |
| 4 | A **Belépés** gomb kiválasztása. | A bejelentkezés sikerül, és megnyílik a védett vezérlőpult. |

## AUTH-LOGOUT-001 – Sikeres kijelentkezés

**Kapcsolódó követelmény:** AUTH-REQ-005  
**Prioritás:** Kritikus  
**Típus:** Pozitív, funkcionális  
**Automatizálható:** Igen

### Előfeltétel

A felhasználó be van jelentkezve, és a vezérlőpult látható.

### Lépések és elvárt eredmények

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | A **Kijelentkezés** gomb kiválasztása. | A rendszer visszairányítja a felhasználót a belépési oldalra. |
| 2 | A `/vezerlopult` cím közvetlen megnyitása bejelentkezés nélkül. | A védett oldal nem nyílik meg; a rendszer visszairányítja a belépési oldalra. |

## DASH-001 – Irányítópult megjelenítése

**Kapcsolódó követelmény:** DASH-REQ-001  
**Előfeltétel:** A felhasználó kijelentkezett.  
**Prioritás:** Magas

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | Bejelentkezés érvényes adatokkal. | Megnyílik az irányítópult. |
| 2 | Az oldal tartalmának ellenőrzése. | Megjelenik a köszöntés, a két műveleti kártya, a kijelentkezés és a jogi figyelmeztetés. |

## DASH-NAV-001 – Új MI-rendszer oldalának megnyitása

**Kapcsolódó követelmények:** DASH-REQ-002, DASH-REQ-004  
**Előfeltétel:** A felhasználó bejelentkezett, és az irányítópulton van.

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | Az **Új MI-rendszer vizsgálata** kártya kiválasztása. | Megnyílik a `/rendszerek/uj` oldal hiba nélkül. |
| 2 | A visszalépési hivatkozás kiválasztása. | Ismét megnyílik az irányítópult. |

## DASH-NAV-002 – Mentett MI-rendszerek oldalának megnyitása

**Kapcsolódó követelmények:** DASH-REQ-003, DASH-REQ-004  
**Előfeltétel:** A felhasználó bejelentkezett, és az irányítópulton van.

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | A **Mentett MI-rendszerek** kártya kiválasztása. | Megnyílik a `/rendszerek` oldal hiba nélkül. |
| 2 | A visszalépési hivatkozás kiválasztása. | Ismét megnyílik az irányítópult. |

## POLICY-001 – Aktuális követelménydokumentum megnyitása

**Kapcsolódó vizsgakövetelmények:** adatok listázása, adatok lementése felületről  
**Előfeltétel:** A felhasználó bejelentkezett, és az ügyfélszolgálati chatbot szerepel a mentett rendszerek között.

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | A **Mentett MI-rendszerek** oldalon az ügyfélszolgálati chatbot hosszú kártyájának kiválasztása. | Köztes oldal nélkül megnyílik a chatbot követelménydokumentuma. |
| 2 | A dokumentum címének és tartalomjegyzékének ellenőrzése. | A cím „alkalmazandó szabályozási és megfelelőségi követelményei”; 26 fejezet jelenik meg. |
| 3 | Az oldal újbóli megnyitása változatlan forrásadatok mellett. | Ugyanaz a dokumentumverzió jelenik meg; nem készül felesleges új verzió. |
| 4 | Keresés a „képzés” kifejezésre. | Csak az egyező fejezetek maradnak kiemelten láthatók, és megjelenik a találatok száma. |
| 5 | A **Nyomtatás / Mentés PDF-ként** gomb kiválasztása. | Megnyílik a böngésző nyomtatási nézete; a dokumentum PDF-ként menthető. |

## POLICY-002 – Jogforrások és dokumentumtípusok megjelenítése

**Előfeltétel:** A POLICY-001 teszt dokumentuma meg van nyitva.

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | Több fejezet típusjelzésének ellenőrzése. | A jogi követelmény, belső kontroll és alkalmazási útmutató elkülönítve jelenik meg. |
| 2 | Egy AI Act-, egy GDPR- és egy magyar jogszabály-hivatkozás ellenőrzése. | A hivatkozások helyes forráscímmel és „cikk”, illetve „§” jelöléssel jelennek meg. |
| 3 | Egy hivatkozás kiválasztása. | A hivatalos jogforrás új böngészőlapon nyílik meg. |

## SYSTEM-EDIT-001 – Mentett MI-rendszer nevének módosítása

**Kapcsolódó vizsgakövetelmény:** meglévő adat módosítása  
**Prioritás:** Magas  
**Típus:** Pozitív, funkcionális és használhatósági  
**Automatizálható:** Igen

### Előfeltétel

A felhasználó bejelentkezett, és legalább egy aktív MI-rendszer szerepel a mentett rendszerek között.

### Lépések és elvárt eredmények

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | A **Mentett MI-rendszerek** oldalon egy rendszer megkeresése. | A keresett rendszer panelje megjelenik. |
| 2 | A rendszerhez tartozó **Szerkesztés** gomb kiválasztása. | Megnyílik a kiválasztott rendszer szerkesztőoldala. |
| 3 | A rendszer nevének kijavítása. | A mező elfogadja az új nevet. |
| 4 | A **Módosítások mentése** gomb kiválasztása. | A módosított név mentődik, sikeres visszajelzés jelenik meg, és ugyanaz a rendszer marad megnyitva. |
| 5 | Visszatérés a mentett rendszerekhez. | A panelen a javított név jelenik meg. |

## IMPORT-XLSX-001 – Több MI-rendszer importálása XLSX-adatforrásból

**Kapcsolódó vizsgakövetelmény:** ismételt és sorozatos adatbevitel adatforrásból  
**Prioritás:** Kritikus  
**Típus:** Pozitív, funkcionális  
**Automatizálható:** Igen

### Előfeltétel

A felhasználó bejelentkezett, és rendelkezik a rendszer által biztosított, helyesen kitöltött XLSX-sablonnal.

### Lépések és elvárt eredmények

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | A **Több rendszer feltöltése** oldal megnyitása. | Az importálófelület hiba nélkül megjelenik. |
| 2 | A 10 adatsort tartalmazó XLSX-fájl kiválasztása. | A fájl kiválasztható és ellenőrzésre előkészül. |
| 3 | A **Fájl ellenőrzése** gomb kiválasztása. | Mind a 10 sor megfelelőként jelenik meg, a rendszer minden sort használati profilba sorol. |
| 4 | A jóváhagyott sorok importálása. | A 10 MI-rendszer mentődik az adatbázisba. |
| 5 | A **Mentett MI-rendszerek** oldal megnyitása. | Az importált rendszerek külön panelként megjelennek és megnyithatók. |

## IMPORT-XLSX-002 – Kötelező oszlop nélküli XLSX-fájl elutasítása

**Kapcsolódó vizsgakövetelmény:** sorozatos adatbevitel adatforrásból  
**Prioritás:** Magas  
**Típus:** Negatív, adatvalidációs  
**Automatizálható:** Igen

### Lépések és elvárt eredmények

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | Egy kötelező oszlopot nem tartalmazó XLSX-fájl kiválasztása. | A fájl kiválasztható ellenőrzésre. |
| 2 | A **Fájl ellenőrzése** gomb kiválasztása. | A rendszer megnevezi a hiányzó oszlopot, hibásnak jelöli a fájlt, és nem engedélyezi az importálást. |

## SYSTEM-FIND-001 – Mentett MI-rendszer kiválasztása a keresőből

**Kapcsolódó vizsgakövetelmény:** adatok listázása és többoldalas lista bejárása  
**Prioritás:** Magas  
**Típus:** Funkcionális és használhatósági  
**Automatizálható:** Igen

### Lépések és elvárt eredmények

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | A mentett rendszerek keresőjében egy konkrét chatbot nevének megadása. | A kereső felajánlja az egyező rendszert. |
| 2 | A találat – például a **Számla Segéd** – kiválasztása. | Kizárólag a kiválasztott rendszer panelje jelenik meg; a többi panel és a lapozó elrejtőzik. |
| 3 | A kiválasztott rendszer szerkesztése, majd visszalépés. | Ugyanaz az egy kiválasztott panel marad látható. |
| 4 | A keresőmező `×` gombjának kiválasztása. | Ismét a teljes, lapozható rendszerlista jelenik meg. |

## POLICY-GATE-001 – Profil nélküli rendszer szabályzatgenerálásának blokkolása

**Kapcsolódó követelmény:** szabályzat kizárólag érvényes használati profilból készülhet  
**Prioritás:** Kritikus  
**Típus:** Negatív, funkcionális és adatbiztonsági  
**Automatizálható:** Igen

### Lépések és elvárt eredmények

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | Profil nélküli vagy a profilkatalógusban nem szereplő rendszer szabályzatának megnyitása. | Nem készül és nem jelenik meg szabályzat. |
| 2 | A hibaüzenet ellenőrzése. | Megjelenik: „A szabályzat nem készíthető el, mert a rendszerhez nincs érvényes használati profil rendelve.” |
| 3 | Az adatbázis ellenőrzése. | A próbálkozás nem hozott létre új sort az `aic_generated_policies` táblában. |

## POLICY-GATE-002 – Érvényes használati profil elfogadása

**Prioritás:** Kritikus  
**Típus:** Pozitív, funkcionális és regressziós  
**Automatizálható:** Igen

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | Létező, aktív és a rendszertényekkel összhangban álló profilú chatbot szabályzatának megnyitása. | A profilkapu elfogadja a rendszert, és a szabályzat megjelenik. |
| 2 | A dokumentum ismételt megnyitása változatlan adatokkal. | Nem készül felesleges új dokumentumverzió. |

## SYSTEM-RETURN-001 – Visszatérés a szabályzatból a kiválasztott rendszerhez

**Kapcsolódó vizsgakövetelmény:** adatok listázása és többoldalas lista bejárása  
**Prioritás:** Magas  
**Típus:** Funkcionális és használhatósági  
**Automatizálható:** Igen

| # | Lépés | Elvárt eredmény |
|---:|---|---|
| 1 | Egy rendszer kiválasztása a keresőből. | Kizárólag a kiválasztott rendszer panelje jelenik meg. |
| 2 | A rendszer szabályzatának megnyitása. | A szabályzat vagy a profilkapu hibaoldala megjelenik. |
| 3 | A **Vissza ehhez a rendszerhez** hivatkozás kiválasztása. | Ugyanannak az egy rendszernek a panelje jelenik meg; nem kell újra megkeresni a lapozható listában. |
