# AI Act Kontroll – manuális tesztesetek

**Dokumentumazonosító:** AIC-MT-001
**Verzió:** 1.0
**Állapot:** Végrehajtásra kész
**Dátum:** 2026-09-05
**Tesztalap:** `docs/funkcionalis-specifikacio.md`, AIC-SPEC-001, 1.0

## 1. Használati szabály

- Minden teszt induló állapota: **Nem futott**.
- Sikeres végrehajtás: **Sikeres**.
- Eltérés esetén: **Sikertelen**, majd a tényleges eredményt és a `BUG-*` azonosítót a futási naplóban kell rögzíteni.
- Automata teszt által feltárt eltérésnél ugyanennek a manuális tesztesetnek az állapota: **Sikertelen – automata futásban**. Ezután hibajegy és kézi újratesztelés következik.
- A manuális végrehajtás nem helyettesíti az automata tesztet; ugyanazt a követelményt mindkettő igazolhatja.

## 2. Tesztkörnyezet és tesztadatok

| Azonosító | Szükséges adat vagy környezet |
|---|---|
| ENV-01 | Kijelölt Vercel teszt- vagy előnézeti URL, Chrome és Firefox. |
| USER-OWNER-A | Megerősített owner felhasználó az A szervezetben. |
| USER-ADMIN-A | Admin felhasználó az A szervezetben. |
| USER-LAWYER-A | Meghívott jogász, technikai szerepkódja `compliance`, az A szervezetben. |
| USER-EDITOR-A | Editor felhasználó az A szervezetben. |
| USER-OWNER-B | Owner felhasználó egy külön B szervezetben. |
| USER-NEW | Még nem regisztrált, egyedi teszt e-mail-cím. |
| DEMO | Új inkognitó munkamenetben létrehozott anonim demófelhasználó. |
| SYS-A | Aktív, teljes és érvényes profilú teszt MI-rendszer az A szervezetben. |
| SYS-NOPROFILE | Aktív, de profil nélküli teszt MI-rendszer. |
| IMPORT-OK | Érvényes CSV- és XLSX-fájl, egyedi rendszernévvel. |
| IMPORT-BAD | Hibás fejlécű, hibás törzsadatú, duplikált és 100 sornál hosszabb tesztfájlok. |

Valódi ügyféladatot vagy az Okosmérő adatait tilos tesztadatként használni.

## 3. Belépési oldal, adatkezelés és bemutató

| Tesztazonosító | Követelmény | Végrehajtás | Elvárt eredmény | Automatizálás |
|---|---|---|---|---|
| MT-LOGIN-001 | LOGIN-REQ-001 | Nyisd meg kijelentkezve a kezdőoldalt; ellenőrizd az összes belépési vezérlőt. | Minden előírt mező, gomb és hivatkozás látható. | Igen |
| MT-LOGIN-002 | LOGIN-REQ-002 | Írj tesztértéket az e-mail- és jelszómezőbe. | Mindkét mező látható, engedélyezett és megtartja a beírt értéket. | Igen |
| MT-LOGIN-003 | LOGIN-REQ-003 | Válts HU-ról EN-re, majd vissza. | A belépési oldal és a bemutató szövege a kiválasztott nyelvre vált. | Igen |
| MT-LOGIN-004 | LOGIN-REQ-004 | Válassz EN nyelvet és frissítsd az oldalt. | Az EN beállítás megmarad. | Igen |
| MT-LOGIN-005 | LOGIN-REQ-005 | Írj jelszót, majd használd a szem ikont kétszer. | A jelszó láthatóvá, majd ismét rejtetté válik; értéke nem változik. | Igen |
| MT-LOGIN-006 | LOGIN-REQ-006, PRIVACY-REQ-001 | Nyisd meg az adatkezelési hivatkozást kijelentkezve. | Az `/adatkezeles` oldal megnyílik és olvasható. | Igen |
| MT-LOGIN-007 | PRIVACY-REQ-002 | Az adatkezelési oldalról lépj vissza. | Biztonságosan visszajutsz a belépési folyamathoz. | Igen |
| MT-LOGIN-008 | LOGIN-REQ-007 | Helyes adatokkal, jelölőnégyzet nélkül válaszd a Belépést. | Nincs belépés; külön adatkezelési figyelmeztetés jelenik meg. | Igen |
| MT-LOGIN-009 | LOGIN-REQ-008 | Próbálj belépni előbb üres e-maillel, majd üres jelszóval. | A megfelelő mezőhöz külön hibaüzenet jelenik meg. | Igen |
| MT-LOGIN-010 | LOGIN-REQ-009 | Adj meg hibás e-mail/jelszó párost és fogadd el a nyilatkozatot. | Nem jön létre munkamenet; biztonságos hibaüzenet jelenik meg. | Igen |
| MT-LOGIN-011 | LOGIN-REQ-010 | Lépj be helyes adatokkal és elfogadott nyilatkozattal. | A `/vezerlopult` nyílik meg. | Igen |
| MT-LOGIN-012 | LOGIN-REQ-011, GEN-REQ-005 | Indíts belépést és közben próbáld újra elküldeni. | A mezők/gombok ideiglenesen letiltódnak; nincs kettős kérés. | Igen |
| MT-TOUR-001 | TOUR-REQ-001 | Indítsd, szüneteltesd, majd indítsd újra a bemutatót. | Mindhárom művelet megfelelően működik. | Igen |
| MT-TOUR-002 | TOUR-REQ-002 | Mozgasd a bemutató folyamatjelzőjét. | A bemutató a kiválasztott időpontra ugrik. | Igen |
| MT-TOUR-003 | TOUR-REQ-003 | Futtasd a bemutatót és figyeld az órát. | Az eltelt és teljes idő helyesen frissül. | Igen |

## 4. Regisztráció, megerősítés, jelszó és munkamenet

| Tesztazonosító | Követelmény | Végrehajtás | Elvárt eredmény | Automatizálás |
|---|---|---|---|---|
| MT-AUTH-001 | AUTH-REQ-001, AUTH-REQ-002 | Regisztrálj USER-NEW adatokkal, egyező legalább 8 karakteres jelszóval és elfogadott nyilatkozattal. | A kérés sikeres és megerősítő e-mailt ígér. | Részben |
| MT-AUTH-002 | AUTH-REQ-001 | Hagyd üresen egyenként a kötelező mezőket, illetve ne fogadd el a nyilatkozatot. | A regisztráció nem indul; pontos mezőhiba jelenik meg. | Igen |
| MT-AUTH-003 | AUTH-REQ-002 | Próbálj 7 karakteres, majd két eltérő jelszóval regisztrálni. | Mindkét kérés elutasításra kerül, megfelelő hibával. | Igen |
| MT-AUTH-004 | AUTH-REQ-003 | Ellenőrizd USER-NEW postafiókját. | A megerősítő e-mail a megadott címre megérkezik. | Részben |
| MT-AUTH-005 | AUTH-REQ-004 | Nyisd meg az érvényes megerősítő linket. | A fiók aktiválódik, profil/szervezet/tagság létrejön, majd megnyílik a vezérlőpult. | Részben |
| MT-AUTH-006 | AUTH-REQ-005 | Nyiss meg hibás, lejárt és már használt megerősítő linket. | Nem történik aktiválás; biztonságos hibaoldal és újrakérési lehetőség jelenik meg. | Igen |
| MT-AUTH-007 | AUTH-REQ-006 | Kérd újra rövid időn belül többször a megerősítő levelet. | Érvényes újraküldés után a rendszer korlátoz és várakozást jelez. | Igen |
| MT-PWD-001 | PWD-REQ-001 | Kérj helyreállítást létező, majd nem létező e-mailre. | A két felületi válasz nem árulja el, hogy melyik cím regisztrált. | Igen |
| MT-PWD-002 | PWD-REQ-002 | Használj lejárt, hibás és már felhasznált helyreállító linket. | Jelszó nem módosítható; új link kérhető. | Igen |
| MT-PWD-003 | PWD-REQ-003 | Próbálj rövid, eltérő, majd érvényes egyező új jelszót megadni. | Csak az érvényes egyező jelszó menthető. | Igen |
| MT-PWD-004 | PWD-REQ-004 | Próbáld a régi jelszót új jelszóként menteni. | A rendszer elutasítja. | Igen |
| MT-SESSION-001 | SESSION-REQ-001 | Jelentkezz ki, majd nyisd meg közvetlenül a `/vezerlopult` URL-t. | A védett oldal nem nyílik meg; a kezdőoldalra kerülsz. | Igen |
| MT-SESSION-002 | SESSION-REQ-002, GEN-REQ-001 | Érvénytelen/lejárt munkamenettel nyiss meg minden védett fő útvonalat. | Egyik védett oldal sem jelenik meg. | Igen |

## 5. Demómód

| Tesztazonosító | Követelmény | Végrehajtás | Elvárt eredmény | Automatizálás |
|---|---|---|---|---|
| MT-DEMO-001 | DEMO-REQ-001 | Nyilatkozat nélkül válaszd a demóbelépést. | A demó nem indul; külön figyelmeztetés jelenik meg. | Igen |
| MT-DEMO-002 | DEMO-REQ-002 | Fogadd el a nyilatkozatot és indíts demót inkognitó ablakban. | Anonim munkamenet jön létre és megnyílik a vezérlőpult. | Igen |
| MT-DEMO-003 | DEMO-REQ-003 | Ellenőrizd a demó vezérlőpultját és további oldalait. | A demómód jelzése folyamatosan látható. | Igen |
| MT-DEMO-004 | DEMO-REQ-004 | Két külön inkognitó munkamenetből lépj demóba. | Mindkettő ugyanazt a kijelölt demószervezetet és alapadatot látja. | Igen |
| MT-DEMO-005 | DEMO-REQ-005, GEN-REQ-002, GEN-REQ-008 | Demóból próbáld közvetlen azonosítóval elérni az A/B szervezet és az Okosmérő rekordjait. | Egyik idegen rekord sem olvasható vagy módosítható. | Igen – API/RLS |
| MT-DEMO-006 | DEMO-REQ-006 | Demóban hozz létre, módosíts és archiválj saját tesztrekordot. | Csak a demókörnyezet változik; a rekord demóadatként azonosítható. | Igen |
| MT-DEMO-007 | DEMO-REQ-007 | Próbáld a Jogtár módosítását/jóváhagyását és a tagkezelést. | A műveletek felületen és API-n is tiltottak. | Igen |
| MT-DEMO-008 | DEMO-REQ-008 | Hajtsd végre a demó-visszaállítást kijelölt környezetben. | Az alapadatok visszaállnak, más szervezet és az Okosmérő változatlan marad. | Igen – API/RLS |
| MT-DEMO-009 | DEMO-REQ-009 | Válaszd a „Kilépés a demóból” műveletet. | A munkamenet megszűnik és a kezdőoldal nyílik meg. | Igen |

## 6. Vezérlőpult, szerepkörök és szervezet

| Tesztazonosító | Követelmény | Végrehajtás | Elvárt eredmény | Automatizálás |
|---|---|---|---|---|
| MT-DASH-001 | DASH-REQ-001 | Lépj be regisztrált felhasználóként. | A köszöntés és mind a négy fő modul megjelenik. | Igen |
| MT-DASH-002 | DASH-REQ-002 | Nyisd meg egymás után mind a négy kártyát. | Mindegyik a megfelelő modulra navigál. | Igen |
| MT-DASH-003 | DASH-REQ-003 | Hozz létre várakozó Jogtár-tételt, majd nyisd meg a vezérlőpultot. | A Jogtár kártya helyes várakozó darabszámot jelez. | Igen |
| MT-DASH-004 | DASH-REQ-004 | Hasonlítsd össze a regisztrált és demó köszöntést. | Regisztráltnál név, demónál általános köszöntés látható. | Igen |
| MT-ORG-001 | ORG-REQ-001 | OWNER-A és OWNER-B fiókkal nyisd meg a szervezeti oldalt. | Mindkettő kizárólag saját szervezetét és tagságát látja. | Igen |
| MT-ORG-002 | ORG-REQ-002 | Ownerként, majd adminként adj hozzá tagot érvényes névvel, e-maillel és szerepkörrel. | A tag a választott szerepkörrel megjelenik. | Igen |
| MT-ORG-003 | ORG-REQ-002 | Adj meg hiányos/hibás tagadatot vagy duplikált tagságot. | Nincs érvénytelen rekord; pontos hiba jelenik meg. | Igen |
| MT-ORG-004 | ORG-REQ-003 | Jogosultként módosíts szerepkört, majd archiválj tagságot. | Mindkét változás mentődik és auditálható. | Igen |
| MT-ORG-005 | ORG-REQ-004 | Editorral és demóval próbálj tagot/szerepkört módosítani. | A művelet felületen és API-n is tiltott. | Igen |
| MT-ORG-006 | ORG-REQ-005 | Próbáld az utolsó aktív ownert eltávolítani vagy lefokozni. | A rendszer megakadályozza. | Igen |
| MT-ROLE-001 | ROLE-REQ-001 | Owner, admin, editor, demó és jogász szereppel nyisd meg a Jogtár részletét. | Csak a meghívott jogász kap módosítási és jóváhagyási lehetőséget. | Igen |
| MT-ROLE-002 | ROLE-REQ-002 | Nem jogosult szereppel hívd közvetlenül a módosító RPC-t. | A szerver/adatbázis megtagadja a műveletet. | Igen – API/RLS |
| MT-ROLE-003 | ROLE-REQ-003 | Módosíts kliensoldali `user_metadata` szerepkört, majd próbálj védett műveletet. | Nem keletkezik új jogosultság. | Igen – API/RLS |

## 7. MI-rendszer létrehozása, listázása, szerkesztése és archiválása

| Tesztazonosító | Követelmény | Végrehajtás | Elvárt eredmény | Automatizálás |
|---|---|---|---|---|
| MT-CREATE-001 | CREATE-REQ-001 | Tagság nélküli felhasználóval nyisd meg az új rendszer oldalát és próbálj menteni. | Létrehozás nem lehetséges és idegen szervezet nem kerül kiválasztásra. | Igen |
| MT-CREATE-002 | CREATE-REQ-002 | Hagyd üresen egyenként a nevet, iparágat és szerepkört. | Kötelező adat hiányában nincs továbblépés. | Igen |
| MT-CREATE-003 | CREATE-REQ-003 | Indíts felvitelt és válaszolj a katalógus funkcióira. | Az aktuális funkciók betöltődnek; mindegyikre adható Igen/Nem válasz. | Igen |
| MT-CREATE-004 | CREATE-REQ-004 | Válassz eltérő funkciókombinációkat. | Csak a releváns pontosító kérdések jelennek meg. | Igen |
| MT-CREATE-005 | CREATE-REQ-005 | Hagyj kötelező pontosítást megválaszolatlanul. | A mentés tiltott és a hiány jelölve van. | Igen |
| MT-CREATE-006 | CREATE-REQ-006 | Tölts ki minden adatot és lépj az összegzéshez. | Az összegzés és a kapcsolódó jogi hivatkozások megjelennek. | Igen |
| MT-CREATE-007 | CREATE-REQ-007, GEN-REQ-003 | Ments azonos bemenetű rendszert kijelölt tesztkörnyezetben, majd hasonlítsd össze az eredményt; külön futásban idézz elő hibát. | Azonos bemenet azonos besorolást ad; hiba után nincs félkész rekord. | Igen – UI/API |
| MT-SYSTEM-001 | SYSTEM-REQ-001 | Nyisd meg az A, majd B szervezet rendszerlistáját. | Csak az aktuális szervezet aktív rendszerei láthatók. | Igen |
| MT-SYSTEM-002 | SYSTEM-REQ-002 | Keress név, rendeltetés és típus alapján, kis/nagybetűvel és ékezet nélkül. | A megfelelő találatok jelennek meg. | Igen |
| MT-SYSTEM-003 | SYSTEM-REQ-003 | Biztosíts legalább 6 aktív rekordot, majd lapozz. | Oldalanként legfeljebb 5 rekord látszik; a lapozás nem duplikál és nem hagy ki rekordot. | Igen |
| MT-SYSTEM-004 | SYSTEM-REQ-004 | Nyisd meg egy kiválasztott rendszer szerkesztését és szabályzatát. | Mindkét művelet ugyanahhoz a rendszerhez vezet. | Igen |
| MT-SYSTEM-005 | SYSTEM-REQ-005, SEC-REQ-009 | Próbálj nem létező, archivált és más szervezethez tartozó azonosítót közvetlen URL-lel. | Nem szivárog adat és nem történik módosítás. | Igen |
| MT-SYSTEM-006 | SYSTEM-REQ-006 | Nyisd meg a régi `/rendszerek/{id}/eredmeny` útvonalat. | Ugyanannak a rendszernek az adatlapjára irányít. | Igen |
| MT-EDIT-001 | EDIT-REQ-001 | Módosítsd együtt a nevet, életciklust, funkciókat és nyilatkozatokat. | Minden érvényes változás együtt mentődik. | Igen |
| MT-EDIT-002 | EDIT-REQ-002 | Próbálj üres, csak szóközös, 161 karakteres és felesleges szóközös nevet menteni. | Az érvénytelen értékek elutasításra, a szóközök normalizálásra kerülnek. | Igen |
| MT-EDIT-003 | EDIT-REQ-003, GEN-REQ-006 | Állíts be tiltott gyakorlat lehetőségét. | Jól látható jogi figyelmeztetés jelenik meg. | Igen |
| MT-EDIT-004 | EDIT-REQ-004, GEN-REQ-007, DATA-REQ-002 | Válaszd a törlést, előbb mégsemmel, majd megerősítéssel. | Mégsemnél nincs változás; megerősítésnél archiválás történik és az előzmény megmarad. | Igen |

## 8. CSV/XLSX tömeges import

| Tesztazonosító | Követelmény | Végrehajtás | Elvárt eredmény | Automatizálás |
|---|---|---|---|---|
| MT-IMPORT-001 | IMPORT-REQ-001 | Töltsd le az importsablont. | Megnyitható, az aktuális kötelező oszlopokat és katalógussegédletet tartalmazza. | Igen |
| MT-IMPORT-002 | IMPORT-REQ-002 | Tölts fel azonos érvényes adatot CSV-, majd XLSX-formátumban. | Mindkét formátum feldolgozható. | Igen |
| MT-IMPORT-003 | IMPORT-REQ-003 | Tölts fel 2 MB feletti, illetve 101 adatsoros fájlt. | Mindkét fájl elutasításra kerül adatbázis-módosítás nélkül. | Igen |
| MT-IMPORT-004 | IMPORT-REQ-004 | Tölts fel külön fájlokat hiányzó fejléccel, hibás törzsadattal, duplikált névvel, hibás függőséggel és nyilatkozattal. | Minden eltérés pontosan felismerhető. | Igen |
| MT-IMPORT-005 | IMPORT-REQ-005 | Ellenőrizd a vegyesen helyes és hibás fájl előnézetét. | Minden sor saját érvényességet és érthető hibalistát kap. | Igen |
| MT-IMPORT-006 | IMPORT-REQ-006 | Vegyes fájlnál próbáld indítani az importot. | Egyetlen rekord sem kerül adatbázisba. | Igen |
| MT-IMPORT-007 | IMPORT-REQ-007 | Importálj hibátlan fájlt, majd hasonlítsd össze az egyedi felvitellel létrehozott azonos bemenetű rendszerekkel. | Minden rekord együtt mentődik és azonos szabálymotor-eredményt kap. | Igen – UI/API |

## 9. Szabálymotor és szabályzat

| Tesztazonosító | Követelmény | Végrehajtás | Elvárt eredmény | Automatizálás |
|---|---|---|---|---|
| MT-RULE-001 | RULE-REQ-001 | Futtasd ugyanazt a szabályértékelést változatlan verziózott adatokkal többször. | Az eredmény azonos. | Igen – API |
| MT-RULE-002 | RULE-REQ-002 | Egy kiválasztott szabályhoz kövesd vissza a kiváltó rendszeradatot és jogalapot. | Mindkettő egyértelműen visszakereshető. | Részben |
| MT-POLICY-001 | POLICY-REQ-001 | Nyisd meg SYS-NOPROFILE, majd SYS-A szabályzatát. | Az első blokkolódik érthető hibával; a második elkészül/megjelenik. | Igen |
| MT-POLICY-002 | POLICY-REQ-002 | Nyisd meg SYS-A szabályzatát kétszer változtatás nélkül. | Nem jön létre új verzió. | Igen – UI/API |
| MT-POLICY-003 | POLICY-REQ-003 | Módosíts releváns forrásadatot és generálj újra. | Új verzió készül, a régi változat megmarad. | Igen – UI/API |
| MT-POLICY-004 | POLICY-REQ-004 | Ellenőrizd az elkészült dokumentum teljes szerkezetét. | Rendszeradat, verzió, állapot, összefoglaló, tartalomjegyzék, fejezetek és jogalapok láthatók. | Igen |
| MT-POLICY-005 | POLICY-REQ-005 | Keress kifejezésre, majd indíts nyomtatást/PDF-mentést. | A találatok száma helyes; a teljes dokumentum nyomtatható és PDF-be menthető. | Részben |
| MT-POLICY-006 | POLICY-REQ-006 | Kijelölt tesztkörnyezetben idézz elő frissítési hibát meglévő mentett verziónál. | A legutóbbi verzió figyelmeztetéssel megjelenik. | Igen |

## 10. Szabályzat-felülvizsgálat

| Tesztazonosító | Követelmény | Végrehajtás | Elvárt eredmény | Automatizálás |
|---|---|---|---|---|
| MT-REVIEW-001 | REVIEW-REQ-001 | Szűrd a listát minden támogatott felülvizsgálati állapotra. | Csak a választott állapotú dokumentumok jelennek meg. | Igen |
| MT-REVIEW-002 | REVIEW-REQ-002 | Nyiss meg egy dokumentumot. | Verzió, fejezetszám, állapot és megjegyzések helyesen látszanak. | Igen |
| MT-REVIEW-003 | REVIEW-REQ-003 | Módosíts címet és szöveget, mentsd, majd állítsd vissza. | A mentés és visszaállítás helyesen működik és auditálható. | Igen |
| MT-REVIEW-004 | REVIEW-REQ-004 | Hagyd jóvá egyenként a szabályokat és nyisd meg jogalapjukat. | Csak a kiválasztott szabály állapota változik; jogalapja elérhető. | Igen |
| MT-REVIEW-005 | REVIEW-REQ-005 | Illessz be egy hiányzó, elérhető katalógusmodult. | A modul egyszer, a megfelelő helyen jelenik meg. | Igen |
| MT-REVIEW-006 | REVIEW-REQ-006 | Próbáld lezárni a dokumentumot hiányzó, majd teljes jóváhagyással. | Hiányosan tiltott, teljes állapotban engedélyezett. | Igen |
| MT-REVIEW-007 | REVIEW-REQ-007 | Hagyd jóvá egy tesztdokumentumot; egy másikat küldj vissza indoklással. | Mindkét állapotváltás és az indoklás mentődik. | Igen |

## 11. Jogtár és jogszabályfrissítés

| Tesztazonosító | Követelmény | Végrehajtás | Elvárt eredmény | Automatizálás |
|---|---|---|---|---|
| MT-LEGAL-001 | LEGAL-REQ-001 | Kijelentkezve, majd bejelentkezve nyisd meg a `/jogtar` oldalt. | Kijelentkezve tiltott, bejelentkezve olvasható. | Igen |
| MT-LEGAL-002 | LEGAL-REQ-002 | Keress címre, jogszabályhelyre és szövegrészletre. | A megfelelő találatok jelennek meg. | Igen |
| MT-LEGAL-003 | LEGAL-REQ-003 | Szűrj réteg, szerepkör és állapot szerint, majd kombináld a szűrőket. | A lista minden esetben a feltételek metszetét mutatja. | Igen |
| MT-LEGAL-004 | LEGAL-REQ-004 | Nyiss meg egy szabályt. | A szöveg, jogalapok és kapcsolódó modulok megjelennek. | Igen |
| MT-LEGAL-005 | LEGAL-REQ-005, ROLE-REQ-001 | Próbálj menteni/jóváhagyni minden szerepkörrel. | Kizárólag USER-LAWYER-A hajthatja végre. | Igen – UI/API |
| MT-LEGAL-006 | LEGAL-REQ-006 | Jogászként hagyj jóvá egy várakozó szabályt. | Állapot, időpont, jóváhagyó és számlálók frissülnek. | Igen |
| MT-LEGAL-007 | LEGAL-REQ-007 | Módosíts jogászként egy szabályt, majd ellenőrizd az előzményt. | A régi és új tartalom, a felhasználó és időpont visszakereshető. | Igen – API |
| MT-UPDATE-001 | UPDATE-REQ-001 | Hívd a frissítési végpontot token nélkül, hibás, majd helyes CRON_SECRET-tel. | Csak a helyes tokennel indul feldolgozás. | Igen – API |
| MT-UPDATE-002 | UPDATE-REQ-002 | Ellenőrizd a cron konfigurációját és egy ütemezett futás naplóját. | A futás hétfőn 04:00 UTC-kor indul. | Igen – konfiguráció/API |
| MT-UPDATE-003 | UPDATE-REQ-003 | Futtasd kétszer változatlan forrástartalommal. | Az eredmény azonos; nincs felesleges változásrekord. | Igen – API |
| MT-UPDATE-004 | UPDATE-REQ-004 | Futtass sikeres, részben hibás és teljesen hibás forrásfeldolgozást tesztkörnyezetben. | Forrásonként helyes állapot, darabszám és hiba kerül a naplóba. | Igen – API |
| MT-UPDATE-005 | UPDATE-REQ-005, API-REQ-006 | Idézz elő változást és feldolgozási hibát. | A változás felülvizsgálandó lesz; a hiba nem jelenik meg sikeres futásként. | Igen – API |

## 12. API, adatmodell, RLS és biztonság

| Tesztazonosító | Követelmény | Végrehajtás | Elvárt eredmény | Automatizálás |
|---|---|---|---|---|
| MT-API-001 | API-REQ-001 | Hasonlítsd össze a frontend minden RPC-hívását a verziózott SQL függvénnyel. | A név, paraméterek és visszatérési típus mindenhol egyezik. | Igen – statikus/API |
| MT-API-002 | API-REQ-002, GEN-REQ-004 | Küldj hiányos, hibás és jogosulatlan kérést a fő módosító RPC-knek. | Nincs adatváltozás; stabil, érthető hiba érkezik. | Igen – API |
| MT-API-003 | API-REQ-003 | Idézz elő hibát több rekordot módosító RPC közepén. | A teljes tranzakció visszagördül. | Igen – API |
| MT-API-004 | API-REQ-004 | Küldj más szervezetazonosítót és hamis szerepkört jogosult munkamenetből. | Az API nem fogadja el a kliens állítását; idegen adat nem változik. | Igen – API/RLS |
| MT-API-005 | API-REQ-005, SEC-REQ-008 | Vizsgáld át a böngésző bundle-t, hálózati kéréseket, naplót és artefaktumokat. | Service role kulcs sehol nem jelenik meg kliensoldalon. | Igen – statikus |
| MT-DATA-001 | DATA-REQ-001 | Vizsgáld meg a létrehozott szervezeti rekordokat és idegen kulcsaikat. | Minden szervezeti adat egyértelműen szervezethez tartozik. | Igen – adatbázis |
| MT-DATA-002 | DATA-REQ-003 | Próbálj érvénytelen idegen kulcsot, duplikált egyedi értéket és tiltott állapotot menteni. | Az adatbázis minden érvénytelen adatot elutasít. | Igen – adatbázis |
| MT-DATA-003 | DATA-REQ-004, DATA-REQ-005 | Hozz létre üres teszt Supabase-projektet kizárólag a repó migrációiból. | A teljes séma, RPC, RLS és seed kézi SQL nélkül felépül. | Igen – pipeline |
| MT-SEC-001 | SEC-REQ-001 | Listázd az összes kliensből elérhető `aic_*` táblát és RLS-állapotát. | Minden táblán aktív RLS és releváns policy található. | Igen – adatbázis |
| MT-SEC-002 | SEC-REQ-002 | A/B szervezeti felhasználókkal próbálj minden CRUD műveletet saját és idegen rekordokon. | Saját engedélyezett, idegen tiltott. | Igen – RLS |
| MT-SEC-003 | SEC-REQ-003 | Jogosult UPDATE-tel próbáld a rekord szervezetét idegen szervezetre módosítani. | A `WITH CHECK` megakadályozza. | Igen – RLS |
| MT-SEC-004 | SEC-REQ-004 | Anon demó JWT-vel próbálj nem demó rekordot olvasni/módosítani. | Minden ilyen művelet tiltott. | Igen – RLS |
| MT-SEC-005 | SEC-REQ-005, GEN-REQ-008 | AI Act és Okosmérő felhasználóval próbálj keresztalkalmazásos táblát/RPC-t/Storage-objektumot elérni. | Kereszthozzáférés nincs. | Igen – RLS/API |
| MT-SEC-006 | SEC-REQ-006, SEC-REQ-007 | Ellenőrizd a SECURITY DEFINER függvények `auth.uid()`, `search_path`, REVOKE és GRANT beállításait. | Minden függvény minimális, explicit jogosultságú. | Igen – statikus/adatbázis |
| MT-SEC-007 | SEC-REQ-010 | Próbálj külső URL-t átadni minden redirect/next paraméternek. | Csak alkalmazáson belüli engedélyezett útvonal nyílik meg. | Igen |

## 13. Nem funkcionális és pipeline-ellenőrzések

| Tesztazonosító | Követelmény | Végrehajtás | Elvárt eredmény | Automatizálás |
|---|---|---|---|---|
| MT-NFR-001 | NFR-001 | Futtasd a kritikus végponttól végpontig folyamatokat Chrome-ban és Firefoxban. | Mindkét támogatott böngészőben működnek. | Igen |
| MT-NFR-002 | NFR-002 | Járd be a kritikus felületet csak Tab, Shift+Tab, Enter és Space használatával. | A fókusz látható, sorrendje logikus, minden fontos vezérlő működik. | Részben |
| MT-NFR-003 | NFR-003 | Ellenőrizd a mezők programozott címkéit és a státuszüzenetek képernyőolvasói jelölését. | A mezők és üzenetek akadálymentesen azonosíthatók. | Részben |
| MT-NFR-004 | NFR-004 | Vizsgáld meg a kliens-, szerver- és pipeline-naplókat hibás folyamat után. | Jelszó, titok és szükségtelen személyes adat nem kerül naplóba. | Igen |
| MT-NFR-005 | NFR-005 | Futtasd a produkciós függőségek biztonsági auditját. | Nincs kritikus vagy magas ismert sebezhetőség. | Igen – pipeline |
| MT-NFR-006 | NFR-006 | Tiszta környezetben telepíts a lock fájlból és buildelj. | A telepítés és build reprodukálható. | Igen – pipeline |
| MT-TEST-001 | TEST-REQ-001 | Ellenőrizd az automata tesztneveket/annotációkat a követelményazonosítókhoz. | Minden automata teszt visszakövethető követelményhez. | Igen |
| MT-TEST-002 | TEST-REQ-002 | Vizsgáld meg a kritikus vezérlők lokátorait. | Stabil, egyedi `id` vagy `data-testid` használható. | Igen – statikus |
| MT-TEST-003 | TEST-REQ-003 | Futtasd a teszteket külön, együtt és megváltoztatott sorrendben. | Az eredmény sorrendtől független. | Igen – pipeline |
| MT-TEST-004 | TEST-REQ-004, TEST-REQ-005 | Futtasd az adatot módosító teszteket, majd a takarítást. | Csak egyedileg jelölt tesztadat változik/tűnik el. | Igen – pipeline |
| MT-TEST-005 | TEST-REQ-006 | Futtasd a csomagot helyi, preview és kijelölt teszt URL-lel. | Az alap URL konfigurációból változtatható, kódmódosítás nélkül. | Igen – pipeline |
| MT-TEST-006 | TEST-REQ-007 | Indíts teljes pipeline-t. | Lint, build, unit, API/RPC/RLS és Selenium szakasz lefut. | Igen – pipeline |
| MT-TEST-007 | TEST-REQ-008 | Idézz elő ellenőrzött teszthibát. | JUnit XML, böngészőnapló és képernyőkép artefaktumként elérhető. | Igen – pipeline |
| MT-TEST-008 | TEST-REQ-009 | Vizsgáld meg a pipeline környezetét és a létrehozott rekordokat. | Nem használ éles service role kulcsot és nem érint éles adatot. | Igen – pipeline |
| MT-TEST-009 | TEST-REQ-010 | Nyiss PR-t sikeres, majd hibás teszttel. | Csak a sikeres kötelező ellenőrzések után engedhető merge/deploy. | Igen – pipeline |

## 14. Kézi szakértői ellenőrzések

Ezek nem helyettesíthetők teljesen Selenium- vagy API-teszttel:

| Tesztazonosító | Ellenőrzés | Elvárt eredmény |
|---|---|---|
| MT-MANUAL-001 | A fő oldalak vizuális összhatása, olvashatósága, reszponzivitása és érthetősége. | Nincs takarás, levágás, olvashatatlan vagy félrevezető felület. |
| MT-MANUAL-002 | A szabályzat nyomtatási/PDF elrendezésének kézi megtekintése. | A fejezetek, táblázatok és oldaltörések olvashatók. |
| MT-MANUAL-003 | A Jogtár jogszövegeinek szakmai ellenőrzése meghívott jogásszal. | A szöveg, jogalap, értelmezés és jóváhagyás szakmailag megfelelő. |

## 15. Tesztfuttatás rögzítése

Minden végrehajtási kör a `docs/tesztfuttatasok.md` fájlba kerüljön:

| Dátum | Build/commit | Környezet | Tesztazonosító | Eredmény | Tényleges eredmény | Hibajegy | Bizonyíték |
|---|---|---|---|---|---|---|---|
| kitöltendő | kitöltendő | kitöltendő | kitöltendő | Sikeres / Sikertelen | eltérés esetén kötelező | `BUG-*` | kép, napló vagy riport |

Sikertelen automata futás esetén először meg kell állapítani, hogy alkalmazáshiba, tesztkódhiba vagy környezeti hiba történt. Csak igazolt alkalmazáshiba kerül a `docs/hibajegyzek.md` fájlba.
