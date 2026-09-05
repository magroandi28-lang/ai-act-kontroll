# AI Act Kontroll – Funkcionális specifikáció

**Dokumentumazonosító:** AIC-FS-001  
**Verzió:** 0.1  
**Állapot:** Tervezet – tesztelési alap  
**Dátum:** 2026-09-05  
**Források:** alkalmazáskód, README_HU.md, meglévő követelmények, manuális tesztesetek és hibajegyzék

## 1. A dokumentum célja

Ez a dokumentum meghatározza az AI Act Kontroll elvárt működését. A manuális és automata tesztek elvárt eredményeit ebből kell levezetni.

A forráskód azt mutatja meg, hogyan működik jelenleg az alkalmazás. Ez a specifikáció azt rögzíti, hogyan kell működnie. Ahol a kívánt működés nem dönthető el egyértelműen, a dokumentum **Tisztázandó** jelölést használ.

## 2. A rendszer célja

Az AI Act Kontroll vállalati MI-rendszerek nyilvántartását, szabályozási vizsgálatát és megfelelőségi dokumentálását támogatja.

A rendszer fő feladatai:

1. felhasználói és szervezeti hozzáférés kezelése;
2. MI-rendszerek egyedi vagy tömeges rögzítése;
3. a rendszerek működési jellemzőinek strukturált felvétele;
4. az alkalmazandó megfelelőségi szabályok determinisztikus meghatározása;
5. verziózott szabályzatok összeállítása;
6. jogalapok és jogszabályváltozások követése;
7. szabályzatok felülvizsgálata és jóváhagyása.

A rendszer döntéstámogató alkalmazás, nem minősül jogi tanácsadásnak.

## 3. Szereplők és jogosultságok

| Szereplő | Leírás |
|---|---|
| Látogató | Nincs bejelentkezve; megtekintheti a belépési oldalt és a bemutatót. |
| Demófelhasználó | Regisztráció nélkül, anonim munkamenetben próbálja ki az alkalmazást. |
| Regisztrált felhasználó | Megerősített fiókkal jelentkezik be. |
| Owner / Admin | Teljes szervezeti adminisztrációt végezhet. |
| Compliance | MI-rendszereket és szabályzatokat kezelhet, jogtári jóváhagyást végezhet. |
| Editor | MI-rendszereket rögzíthet és szerkeszthet. |
| Viewer | Csak olvasási jogosultsággal rendelkezik. |
| Ütemezett rendszerfolyamat | Hitelesített háttérfolyamatként jogforrás-frissítést végez. |

## 4. Általános követelmények

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| GEN-REQ-001 | A védett oldalak kizárólag érvényes munkamenettel legyenek elérhetők. | Kritikus |
| GEN-REQ-002 | A felhasználó csak a saját szervezetéhez tartozó adatokat érhesse el. | Kritikus |
| GEN-REQ-003 | Azonos bemenetből a szabálymotor azonos eredményt állítson elő. | Kritikus |
| GEN-REQ-004 | A felhasználói műveletek eredményéről egyértelmű siker- vagy hibaüzenet jelenjen meg. | Magas |
| GEN-REQ-005 | Feldolgozás alatt az ismételt elküldésre alkalmas vezérlők legyenek letiltva. | Magas |
| GEN-REQ-006 | A szolgáltatás jogi korlátját jelző figyelmeztetés a releváns felületeken jelenjen meg. | Magas |
| GEN-REQ-007 | A törlés archiválással történjen, ha történeti visszakereshetőség szükséges. | Kritikus |

## 5. Belépési oldal és bemutató

### 5.1 Megjelenés és nyelvválasztás

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| LOGIN-REQ-001 | A belépési oldal jelenítse meg az e-mail-mezőt, a jelszómezőt, a Belépés gombot, az adatkezelési jelölőnégyzetet, a demóbelépést, a regisztrációt és az elfelejtett jelszó hivatkozását. | Kritikus |
| LOGIN-REQ-002 | Az e-mail- és jelszómező fogadja a felhasználó által megadott értéket. | Kritikus |
| LOGIN-REQ-003 | A HU/EN kapcsoló váltsa át a belépési oldal szövegeit magyar és angol nyelv között. | Közepes |
| LOGIN-REQ-004 | A kiválasztott nyelv maradjon meg az oldal újratöltése után. | Közepes |
| LOGIN-REQ-005 | A jelszó láthatósági gomb váltson a rejtett és a látható jelszó között. | Magas |
| LOGIN-REQ-006 | Az adatkezelési hivatkozás nyissa meg az adatkezelési tájékoztatót. | Kritikus |

### 5.2 Regisztrált felhasználó belépése

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| AUTH-REQ-004 | A megerősített felhasználó helyes e-mail-címmel, helyes jelszóval és az adatkezelési nyilatkozat elfogadásával be tudjon jelentkezni. | Kritikus |
| LOGIN-REQ-007 | Elfogadott adatkezelési nyilatkozat nélkül ne induljon el a bejelentkezés; jelenjen meg: „A belépéshez fogadd el az adatkezelési nyilatkozatot.” | Kritikus |
| LOGIN-REQ-008 | Hibás e-mail-cím vagy jelszó esetén ne nyíljon védett munkamenet; jelenjen meg: „Hibás e-mail-cím vagy jelszó.” | Kritikus |
| LOGIN-REQ-009 | Sikeres bejelentkezés után a rendszer irányítson a /vezerlopult oldalra. | Kritikus |
| LOGIN-REQ-010 | A bejelentkezés feldolgozása alatt a mezők és műveleti gombok legyenek letiltva. | Magas |

### 5.3 Demómód

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| DEMO-REQ-001 | A „Kipróbálom regisztráció nélkül” gomb legyen látható és használható. | Kritikus |
| DEMO-REQ-002 | Elfogadott adatkezelési nyilatkozat nélkül ne induljon el a demómód; jelenjen meg: „A demó indításához fogadd el az adatkezelési nyilatkozatot.” | Kritikus |
| DEMO-REQ-003 | Elfogadott nyilatkozat után jöjjön létre anonim demómunkamenet, majd nyíljon meg a /vezerlopult oldal. | Kritikus |
| DEMO-REQ-004 | Demómódban jelenjen meg a „DEMÓ MÓD – Minden rögzítés próbaadat.” jelzés. | Kritikus |
| DEMO-REQ-005 | A „Kilépés a demóból” művelet szüntesse meg a munkamenetet és irányítson vissza a belépési oldalra. | Kritikus |
| DEMO-REQ-006 | A demóadatok ne sérthessék a regisztrált felhasználók és más projektek adatait. | Kritikus |

### 5.4 Interaktív bemutató

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| TOUR-REQ-001 | A belépési oldalon jelenjen meg a 30 másodperces interaktív bemutató. | Magas |
| TOUR-REQ-002 | A bemutató indítható, szüneteltethető és újraindítható legyen. | Magas |
| TOUR-REQ-003 | A folyamatjelzőn választva a bemutató időpontja módosítható legyen. | Közepes |
| TOUR-REQ-004 | A bemutató órája mutassa az eltelt és a teljes időt. | Közepes |
| TOUR-REQ-005 | Nyelvváltáskor a bemutató a kiválasztott nyelven, az elejéről induljon újra. | Közepes |

## 6. Regisztráció és e-mail-megerősítés

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| AUTH-REQ-001 | A még nem regisztrált felhasználó érvényes adatokkal és az adatkezelési nyilatkozat elfogadásával fiókot hozhasson létre. | Kritikus |
| REG-REQ-001 | Kötelező adat a teljes név, a szervezet neve, az e-mail-cím, a jelszó és a jelszó megerősítése. | Kritikus |
| REG-REQ-002 | Hiányzó kötelező adat esetén jelenjen meg: „Minden mező kitöltése kötelező.” | Kritikus |
| REG-REQ-003 | A jelszó legalább 8 karakter hosszú legyen. | Kritikus |
| REG-REQ-004 | A két megadott jelszónak egyeznie kell. | Kritikus |
| REG-REQ-005 | A regisztrációhoz kötelező legyen az adatkezelési nyilatkozat elfogadása. | Kritikus |
| REG-REQ-006 | Ha a nyilatkozatot a belépési oldalon már elfogadták, a regisztrációs oldal ugyanabban a munkamenetben ne kérje újra. | Magas |
| AUTH-REQ-002 | Sikeres regisztráció után a rendszer küldjön megerősítő e-mailt. | Kritikus |
| REG-REQ-007 | A felület mutassa, melyik e-mail-címre küldte a megerősítő levelet. | Magas |
| REG-REQ-008 | A felhasználó kérhesse a megerősítő levél újraküldését. | Magas |
| REG-REQ-009 | Túl gyakori újraküldés esetén jelenjen meg várakozásra felszólító üzenet. | Magas |
| REG-REQ-010 | Már regisztrált e-mail-cím esetén a felület ajánlja fel a belépést vagy másik e-mail-cím használatát. | Magas |
| AUTH-REQ-003 | Az érvényes megerősítő link aktiválja a fiókot, hozza létre az induló fiókadatokat, majd irányítson a vezérlőpultra. | Kritikus |
| REG-REQ-011 | Hibás, lejárt vagy már felhasznált megerősítő link a /auth/hiba oldalra vezessen. | Kritikus |
| REG-REQ-012 | A megerősítési hibaoldalon új megerősítő levél legyen kérhető. | Magas |
| REG-REQ-013 | A továbbirányítás csak alkalmazáson belüli, biztonságos útvonalra történhessen. | Kritikus |

## 7. Elfelejtett és új jelszó

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| PWD-REQ-001 | Az „Elfelejtett jelszó?” hivatkozás nyissa meg a /jelszo oldalt. | Kritikus |
| PWD-REQ-002 | E-mail-cím nélkül a rendszer ne küldjön levelet, hanem kérje az e-mail-cím megadását. | Kritikus |
| PWD-REQ-003 | Beküldés után a válasz ne árulja el, hogy az e-mail-címhez tartozik-e fiók. | Kritikus |
| PWD-REQ-004 | Túl gyakori levélkérés esetén a rendszer kérjen várakozást. | Magas |
| PWD-REQ-005 | Érvényes helyreállító link nyissa meg az új jelszó oldalát. | Kritikus |
| PWD-REQ-006 | Lejárt vagy felhasznált linknél ne legyen módosítható a jelszó, és legyen kérhető új link. | Kritikus |
| PWD-REQ-007 | Az új jelszó legalább 8 karakteres legyen, és a két beírt érték egyezzen. | Kritikus |
| PWD-REQ-008 | Az új jelszó ne egyezhessen meg a régivel. | Magas |
| PWD-REQ-009 | Sikeres jelszómódosítás után nyíljon meg a vezérlőpult. | Kritikus |

## 8. Kijelentkezés és munkamenetvédelem

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| AUTH-REQ-005 | A bejelentkezett felhasználó ki tudjon jelentkezni. | Kritikus |
| SESSION-REQ-001 | Kijelentkezés után a védett oldalak közvetlen URL-lel se legyenek elérhetők. | Kritikus |
| SESSION-REQ-002 | Érvénytelen munkamenet esetén a rendszer irányítson a belépési oldalra. | Kritikus |

## 9. Vezérlőpult

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| DASH-REQ-001 | Érvényes munkamenettel jelenjen meg a vezérlőpult és a felhasználói köszöntés. | Kritikus |
| DASH-REQ-002 | Az „Új MI-rendszer vizsgálata” kártya nyissa meg a /rendszerek/uj oldalt. | Kritikus |
| DASH-REQ-003 | A „Mentett MI-rendszerek” kártya nyissa meg a /rendszerek oldalt. | Kritikus |
| DASH-REQ-004 | A „Jogtár” kártya nyissa meg a /jogtar oldalt, és jelezze a várakozó tételeket. | Magas |
| DASH-REQ-005 | A „Tagok és szerepkörök” kártya nyissa meg a /szervezet oldalt. | Magas |
| DASH-REQ-006 | Demófelhasználónál általános, regisztrált felhasználónál névre szóló köszöntés jelenjen meg. | Közepes |

## 10. Új MI-rendszer vezetett felvitele

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| CREATE-REQ-001 | A felvitel csak bejelentkezett, szervezethez kapcsolt felhasználónak legyen elérhető. | Kritikus |
| CREATE-REQ-002 | A folyamat kérje be a rendszer nevét, iparágát és a szervezet egy vagy több szerepkörét. | Kritikus |
| CREATE-REQ-003 | Üres rendszernévvel, iparág vagy szerepkör nélkül ne lehessen továbblépni. | Kritikus |
| CREATE-REQ-004 | A rendszer az aktuális katalógusból töltse be a vizsgálandó funkciókat. | Kritikus |
| CREATE-REQ-005 | Minden funkcióról Igen/Nem döntés legyen adható egérrel, érintéssel vagy billentyűzettel. | Magas |
| CREATE-REQ-006 | Összetett funkciónál a szükséges részletek ugyanabban a folyamatban legyenek megadhatók. | Kritikus |
| CREATE-REQ-007 | Csak a korábbi válaszok alapján szükséges pontosító kérdések jelenjenek meg. | Kritikus |
| CREATE-REQ-008 | Hiányzó kötelező pontosítás esetén a mentés ne legyen elérhető. | Kritikus |
| CREATE-REQ-009 | A felhasználó visszaléphessen és javíthassa az utolsó válaszát. | Magas |
| CREATE-REQ-010 | Mentés előtt jelenjen meg az összegzés és a kapcsolódó Jogtár-szövegek listája. | Magas |
| CREATE-REQ-011 | Sikeres mentés után nyíljon meg az új rendszer szabályzati oldala. | Kritikus |
| CREATE-REQ-012 | Hiba esetén ne jöjjön létre hiányos rendszer, és jelenjen meg hibaüzenet. | Kritikus |

## 11. Mentett MI-rendszerek

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| SYSTEM-REQ-001 | A lista csak az aktuális szervezet aktív MI-rendszereit jelenítse meg. | Kritikus |
| SYSTEM-REQ-002 | A lista mutassa a rendszerek számát, nevét, típusát és rendeltetését. | Magas |
| SYSTEM-REQ-003 | Oldalanként legfeljebb 5 rendszer jelenjen meg; a további rekordok legyenek lapozhatók. | Magas |
| SYSTEM-REQ-004 | A kereső név, rendeltetés és rendszertípus alapján, kis- és nagybetűtől és ékezetektől függetlenül keressen. | Magas |
| SYSTEM-REQ-005 | Találat kiválasztásakor csak a kiválasztott rendszer panelje jelenjen meg. | Magas |
| SYSTEM-REQ-006 | A kereső törlése állítsa vissza a teljes listát és lapozást. | Magas |
| SYSTEM-REQ-007 | A panelről elérhető legyen a szerkesztés és a szabályzat elkészítése vagy megnyitása. | Kritikus |
| SYSTEM-REQ-008 | Üres lista esetén jelenjen meg tájékoztatás és új rendszer rögzítésére szolgáló hivatkozás. | Közepes |
| SYSTEM-REQ-009 | Létrehozás, importálás, módosítás és archiválás után jelenjen meg megfelelő sikerüzenet. | Magas |

## 12. MI-rendszer szerkesztése és archiválása

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| EDIT-REQ-001 | A szerkesztőoldal töltse be a rendszer aktuális nevét, életciklusát, funkcióit és nyilatkozatait. | Kritikus |
| EDIT-REQ-002 | A rendszernév nem lehet üres, legfeljebb 160 karakter lehet, és a felesleges szóközök normalizálódjanak. | Magas |
| EDIT-REQ-003 | Az életciklus a támogatott állapotok egyikére legyen módosítható. | Magas |
| EDIT-REQ-004 | A funkciók és kapcsolódó nyilatkozatok együtt legyenek menthetők. | Kritikus |
| EDIT-REQ-005 | Tiltott gyakorlat lehetősége esetén jól látható jogi figyelmeztetés jelenjen meg. | Kritikus |
| EDIT-REQ-006 | Szabályozott termékbe épülés csak szolgáltatói szerepkörnél legyen megadható. | Magas |
| EDIT-REQ-007 | Sikeres mentés után ugyanannak a rendszernek a kiválasztott panelje jelenjen meg. | Magas |
| EDIT-REQ-008 | A „Rendszer törlése” művelet kérjen külön megerősítést. | Kritikus |
| EDIT-REQ-009 | Megerősített törléskor a rendszer kerüljön ki az aktív listából, előzményei maradjanak meg. | Kritikus |
| EDIT-REQ-010 | A „Mégsem” művelet szakítsa meg a törlést adatváltozás nélkül. | Kritikus |

## 13. Tömeges import

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| IMPORT-REQ-001 | A felhasználó letölthesse az aktuális katalógushoz tartozó importsablont. | Kritikus |
| IMPORT-REQ-002 | A fájl ellenőrzése előtt ne kerüljön rendszeradat az adatbázisba. | Kritikus |
| IMPORT-REQ-003 | A rendszer legfeljebb 2 MB-os és legfeljebb 100 adatsort tartalmazó fájlt fogadjon. | Magas |
| IMPORT-REQ-004 | A rendszer ellenőrizze a kötelező oszlopokat, törzsadatokat, duplikált neveket, funkciófüggőségeket és nyilatkozatokat. | Kritikus |
| IMPORT-REQ-005 | Az előnézet soronként mutassa az érvényességet és a pontos hibaüzeneteket. | Kritikus |
| IMPORT-REQ-006 | Hibás sor jelenlétekor az importálás ne legyen végrehajtható. | Kritikus |
| IMPORT-REQ-007 | Hibátlan előnézet után a felhasználó erősítse meg az adatok valódiságát. | Kritikus |
| IMPORT-REQ-008 | Sikeres import után minden megfelelő rendszer kerüljön az adatbázisba, és jelenjen meg a darabszám. | Kritikus |
| IMPORT-REQ-009 | A tömeges import ugyanazt a központi szabály- és profilkezelést használja, mint az egyedi felvitel. | Kritikus |

## 14. Szabályzat létrehozása és megjelenítése

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| POLICY-REQ-001 | Szabályzat csak aktív, érvényes profillal és megfelelő rendszertényekkel rendelkező rendszerhez készülhessen. | Kritikus |
| POLICY-REQ-002 | Érvénytelen vagy hiányzó profilnál ne készüljön dokumentum, és jelenjen meg egyértelmű hibaüzenet. | Kritikus |
| POLICY-REQ-003 | A szabályzat az aktív funkciókhoz és alkalmazási adatokhoz tartozó jóváhagyott modulokból épüljön fel. | Kritikus |
| POLICY-REQ-004 | Változatlan forrásadatok ismételt megnyitása ne hozzon létre felesleges új verziót. | Kritikus |
| POLICY-REQ-005 | Releváns változás esetén új verzió készülhessen, a korábbi verzió megőrzésével. | Kritikus |
| POLICY-REQ-006 | A dokumentum mutassa a rendszer adatait, verziót, állapotot, összefoglalót, tartalomjegyzéket és fejezeteket. | Magas |
| POLICY-REQ-007 | Minden követelményhez jelenjen meg a modul típusa és a kapcsolódó jogalap. | Kritikus |
| POLICY-REQ-008 | A hivatalos jogforrás hivatkozása új böngészőlapon nyíljon meg. | Magas |
| POLICY-REQ-009 | A dokumentumban lehessen keresni, és jelenjen meg a találatok száma. | Magas |
| POLICY-REQ-010 | A dokumentum nyomtatható és PDF-ként menthető legyen. | Magas |
| POLICY-REQ-011 | Frissítési hiba esetén a legutóbbi mentett verzió jelenjen meg figyelmeztetéssel, ha elérhető. | Magas |
| POLICY-REQ-012 | A szabályzatból ugyanannak a kiválasztott rendszernek a paneljére lehessen visszatérni. | Magas |

## 15. Szabályzat-felülvizsgálat

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| REVIEW-REQ-001 | A szabályzatlista legyen szűrhető felülvizsgálati állapot szerint. | Magas |
| REVIEW-REQ-002 | A felülvizsgáló lássa a verziót, fejezetszámot, állapotot és megjegyzéseket. | Magas |
| REVIEW-REQ-003 | A fejezet címe és szövege szerkeszthető, majd visszaállítható legyen. | Magas |
| REVIEW-REQ-004 | A felülvizsgáló egyenként jóváhagyhassa a szabályokat és megtekinthesse jogalapjukat. | Kritikus |
| REVIEW-REQ-005 | Hiányzó, katalógusban elérhető modul beilleszthető legyen. | Magas |
| REVIEW-REQ-006 | A teljes dokumentum csak minden szükséges fejezet jóváhagyása után legyen lezárható. | Kritikus |
| REVIEW-REQ-007 | A dokumentum jóváhagyható vagy megjegyzéssel javításra visszaküldhető legyen. | Kritikus |

## 16. Jogtár

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| LEGAL-REQ-001 | A Jogtár csak bejelentkezett, megfelelő jogosultságú felhasználónak legyen elérhető. | Kritikus |
| LEGAL-REQ-002 | A szabályok legyenek kereshetők cím, jogszabályhely és szöveg alapján. | Magas |
| LEGAL-REQ-003 | A lista legyen szűrhető szabályréteg, szerepkör és állapot szerint. | Magas |
| LEGAL-REQ-004 | Külön jelenjen meg a jóváhagyásra váró, felülvizsgálandó és jóváhagyott állapot. | Magas |
| LEGAL-REQ-005 | A kiválasztott szabály szövege, jogalapjai és kapcsolódó moduljai legyenek megtekinthetők. | Kritikus |
| LEGAL-REQ-006 | A jogosult felhasználó módosíthassa és jóváhagyhassa a szabályt, vagy menthesse jóváhagyás nélkül. | Kritikus |
| LEGAL-REQ-007 | Jóváhagyás után frissüljön az állapot és a számlálók. | Magas |

## 17. Szervezet, tagok és szerepkörök

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| ORG-REQ-001 | A szervezeti oldal jelenítse meg a felhasználó szervezetét és tagságát. | Kritikus |
| ORG-REQ-002 | A jogosult felhasználó új tagot hívhasson meg névvel, e-mail-címmel és szerepkörrel. | Kritikus |
| ORG-REQ-003 | A tag szerepköre a támogatott szerepkörök egyikére módosítható legyen. | Kritikus |
| ORG-REQ-004 | Jogosultság nélküli felhasználó ne módosíthassa a tagságot vagy szerepköröket. | Kritikus |
| ORG-REQ-005 | Sikertelen adatbetöltés vagy művelet esetén egyértelmű hibaüzenet jelenjen meg. | Magas |

## 18. Jogszabályváltozás-figyelés

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| UPDATE-REQ-001 | Az ütemezett végpont csak érvényes CRON_SECRET használatával legyen meghívható. | Kritikus |
| UPDATE-REQ-002 | A rendszer hetente ellenőrizze a támogatott EUR-Lex és NJT jogforrásokat. | Magas |
| UPDATE-REQ-003 | A változatlan tartalom ne hozzon létre felesleges változásbejegyzést. | Magas |
| UPDATE-REQ-004 | Eltéréskor a rendszer naplózza a változást, és jelölje felülvizsgálandónak az érintett elemeket. | Kritikus |
| UPDATE-REQ-005 | A frissítési eredmény és hiba legyen auditálható. | Kritikus |

## 19. Biztonsági és adatvédelmi követelmények

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| SEC-REQ-001 | Minden aic_* táblán legyen aktív Row Level Security. | Kritikus |
| SEC-REQ-002 | A kliens ne tartalmazza és ne érhesse el a SUPABASE_SERVICE_ROLE_KEY értékét. | Kritikus |
| SEC-REQ-003 | Jogosultságot módosító művelet előtt szerveroldali felhasználó- és szerepkör-ellenőrzés történjen. | Kritikus |
| SEC-REQ-004 | A jelszó-helyreállítás válasza ne tegye lehetővé regisztrált e-mail-címek felderítését. | Kritikus |
| SEC-REQ-005 | Külső címre mutató, felhasználó által befolyásolható nyílt átirányítás ne legyen lehetséges. | Kritikus |
| SEC-REQ-006 | Archivált vagy más szervezethez tartozó rendszer közvetlen azonosítóval se legyen jogosulatlanul elérhető. | Kritikus |

## 20. Automatizálhatósági követelmények

| Azonosító | Követelmény | Prioritás |
|---|---|---|
| TEST-REQ-001 | Minden automata teszt dokumentált követelményhez és manuális tesztesethez kapcsolódjon. | Kritikus |
| TEST-REQ-002 | A kritikus vezérlők rendelkezzenek stabil, egyedi azonosítóval vagy data-testid attribútummal. | Magas |
| TEST-REQ-003 | A tesztek egymástól függetlenül, tetszőleges sorrendben legyenek futtathatók. | Kritikus |
| TEST-REQ-004 | Az automata teszt csak saját, egyedileg azonosítható tesztadatot hozhasson létre és módosíthasson. | Kritikus |
| TEST-REQ-005 | A takarítás nem törölhet más felhasználóhoz, az Okosmérőhöz vagy éles működéshez tartozó adatot. | Kritikus |
| TEST-REQ-006 | Az alap URL legyen konfigurálható helyi, előnézeti és kijelölt tesztkörnyezethez. | Magas |
| TEST-REQ-007 | Sikertelen pipeline őrizze meg a JUnit-riportot, a hibaüzenetet és lehetőség szerint képernyőképet. | Magas |
| TEST-REQ-008 | Automatikus újrapróbálás nem fedhet el ismert instabilitást; a hibás teszt okát ki kell vizsgálni. | Magas |

## 21. Tisztázandó kérdések

| Azonosító | Kérdés | Miért szükséges? |
|---|---|---|
| OPEN-001 | A demófelhasználók közös próbaszervezetet használnak, vagy minden munkamenet külön adatállományt kap? | Meghatározza az adatizolációs és takarítási teszteket. |
| OPEN-002 | A tömeges import kizárólag XLSX-et támogat, vagy CSV-t is? | A felület XLSX és CSV fájlt jelez, a feldolgozó jelenleg csak XLSX-kiterjesztést fogad el. |
| OPEN-003 | Üres e-mail- vagy jelszómezővel történő belépéskor külön mezőhiba vagy az általános hibaüzenet az elvárt? | A negatív bejelentkezési teszthez kell. |
| OPEN-004 | A „törlés” kifejezést minden felületen archiválásként kell értelmezni? | A megnevezés és adatmegőrzés egységesítéséhez kell. |
| OPEN-005 | Demómódban engedélyezett-e minden módosító művelet, vagy bizonyos műveleteket tiltani kell? | A produkciós adatok védelme és a tesztek hatóköre miatt kell. |

## 22. Kapcsolódó tesztdokumentumok

- `docs/kovetelmenyek.md` – tömör követelményjegyzék;
- `docs/manualis-tesztesetek.md` – manuális tesztesetek;
- `docs/tesztfuttatasok.md` – végrehajtott tesztfuttatások;
- `docs/hibajegyzek.md` – feltárt hibák és újratesztelésük;
- tervezett: `docs/automatizalasi-matrix.md` – követelmény, manuális és automata teszt összerendelése.

## 23. Jóváhagyás

A specifikáció a **Tisztázandó kérdések** megválaszolása és a modulonkénti tulajdonosi ellenőrzés után tekinthető végleges tesztalapnak. Addig a dokumentum 0.1-es tervezet.
