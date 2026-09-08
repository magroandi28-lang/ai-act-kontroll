# AI Act Kontroll – automatizálási mátrix (lefedettség)

**Dokumentumazonosító:** AIC-AM-001
**Verzió:** 0.1 (élő munkadokumentum)
**Állapot:** Feltöltés alatt
**Dátum:** 2026-09-08
**Tesztalap:** `docs/funkcionalis-specifikacio.md` (AIC-SPEC-001) · `docs/manualis-tesztesetek.md` (AIC-MT-001)

## 1. Cél

Ez a dokumentum összeköti a **követelményeket**, a **manuális teszteseteket** és az **automata
teszteket**. Megmutatja, hogy minden követelményhez tartozik-e automata teszt, és ha nem, mi hiányzik.
A `TEST-REQ-001` előírja: minden automata teszt kapcsolódjon követelményazonosítóhoz.

## 2. Jelmagyarázat

**Státusz:**
- `KÉSZ` – van automata teszt, a manuális esetnek megfelelő elvárt eredménnyel.
- `HIÁNYOS` – van teszt, de nem fedi le teljesen az esetet (pl. hiányzó assert vagy negatív ág).
- `ÁTNEVEZ` – a logika megvan, de a teszt/metódus neve nem hordozza a követelmény-kódot.
- `HIÁNYZIK` – nincs hozzá automata teszt.

**Teszttípus:**
- `UI` – Selenium (felületi végponttól végpontig).
- `API/RLS` – adatbázis/RPC/jogosultsági teszt (későbbi fázis, nem Selenium).
- `MANUÁLIS` – nem automatizálható teljesen (vizuális, szakértői).

**Elnevezési szabály:** a tesztosztály a funkció magyar neve; a metódus `@DisplayName`-je hordozza a
kódot, pl. `@DisplayName("MT-LOGIN-011 · LOGIN-REQ-010 – sikeres belépés a vezérlőpultra")`.

## 3. A 11 kötelező vizsgafunkció lefedettsége

### 3.1 Regisztráció — osztály: `RegisztracioTest`

| MT-kód | Követelmény | Elvárt eredmény (rövid) | Típus | Automata teszt | Státusz |
|---|---|---|---|---|---|
| MT-AUTH-001 | AUTH-REQ-001/002 | Érvényes adatokkal a kérés sikeres, megerősítő e-mailt ígér. | UI | happy-path megvan | ÁTNEVEZ |
| MT-AUTH-002 | AUTH-REQ-001 | Üres kötelező mező / el nem fogadott nyilatkozat → pontos mezőhiba, nincs indítás. | UI | negatívok megvannak | ÁTNEVEZ |
| MT-AUTH-003 | AUTH-REQ-002 | 7 karakteres, majd két eltérő jelszó → elutasítás megfelelő hibával. | UI | részben megvan | HIÁNYOS |

### 3.2 Bejelentkezés — osztály: `BelepesTest` (ma: `AiActLoginTest`)

| MT-kód | Követelmény | Elvárt eredmény (rövid) | Típus | Automata teszt | Státusz |
|---|---|---|---|---|---|
| MT-LOGIN-011 | LOGIN-REQ-010 | Helyes adat + elfogadott nyilatkozat → `/vezerlopult` nyílik. | UI | megvan (VezerlopultTest @BeforeEach) | ÁTNEVEZ |
| MT-LOGIN-009 | LOGIN-REQ-008 | Üres e-mail, majd üres jelszó → mezőhöz kötött hibaüzenet. | UI | — | HIÁNYZIK |
| MT-LOGIN-010 | LOGIN-REQ-009 | Hibás e-mail/jelszó + elfogadott nyilatkozat → nincs munkamenet, biztonságos hiba. | UI | — | HIÁNYZIK |
| MT-LOGIN-002 | LOGIN-REQ-002 | E-mail/jelszó mező látható, engedélyezett, megtartja az értéket. | UI | megvan | ÁTNEVEZ |
| MT-LOGIN-005 | LOGIN-REQ-005 | Szem ikon kétszer → jelszó látható, majd rejtett; érték nem változik. | UI | — | HIÁNYZIK |
| MT-LOGIN-012 | LOGIN-REQ-011 | Belépés közben a mezők/gombok letiltva; nincs kettős kérés. | UI | — | HIÁNYZIK |

### 3.3 Adatkezelési nyilatkozat — osztály: `BelepesTest` / `AdatkezelesTest`

| MT-kód | Követelmény | Elvárt eredmény (rövid) | Típus | Automata teszt | Státusz |
|---|---|---|---|---|---|
| MT-LOGIN-008 | LOGIN-REQ-007 | Helyes adat, jelölőnégyzet nélkül → nincs belépés, külön figyelmeztetés. | UI | — | HIÁNYZIK |
| MT-LOGIN-006 | LOGIN-REQ-006 · PRIVACY-REQ-001 | Az adatkezelési hivatkozás megnyitja az `/adatkezeles` oldalt. | UI | link-teszt megvan | HIÁNYOS |
| MT-LOGIN-007 | PRIVACY-REQ-002 | Az adatkezelési oldalról biztonságos visszatérés a belépéshez. | UI | — | HIÁNYZIK |

### 3.4 Adatok listázása — osztály: `RendszerListaTest`

| MT-kód | Követelmény | Elvárt eredmény (rövid) | Típus | Automata teszt | Státusz |
|---|---|---|---|---|---|
| MT-SYSTEM-001 | SYSTEM-REQ-001 | A lista csak az aktuális szervezet aktív rendszereit mutatja. | UI | — | HIÁNYZIK |

### 3.5 Több oldalas lista bejárása — osztály: `RendszerListaTest`

| MT-kód | Követelmény | Elvárt eredmény (rövid) | Típus | Automata teszt | Státusz |
|---|---|---|---|---|---|
| MT-SYSTEM-003 | SYSTEM-REQ-003 | ≥6 rekordnál oldalanként max 5 látszik; a lapozás nem duplikál/hagy ki. | UI | — | HIÁNYZIK |

### 3.6 Új adat bevitel — osztály: `RendszerLetrehozasTest`

| MT-kód | Követelmény | Elvárt eredmény (rövid) | Típus | Automata teszt | Státusz |
|---|---|---|---|---|---|
| MT-CREATE-002 | CREATE-REQ-002 | Üres név/iparág/szerepkör → nincs továbblépés. | UI | — | HIÁNYZIK |
| MT-CREATE-003 | CREATE-REQ-003 | A katalógus funkciói betöltődnek; mindegyikre Igen/Nem adható. | UI | — | HIÁNYZIK |
| MT-CREATE-004 | CREATE-REQ-004 | Eltérő funkciókombinációnál csak a releváns pontosítás jelenik meg. | UI | — | HIÁNYZIK |
| MT-CREATE-005 | CREATE-REQ-005 | Megválaszolatlan kötelező pontosítás → mentés tiltott. | UI | — | HIÁNYZIK |
| MT-CREATE-006 | CREATE-REQ-006 | Kitöltés után összegzés + kapcsolódó jogi hivatkozás megjelenik. | UI | — | HIÁNYZIK |
| MT-CREATE-007 | CREATE-REQ-007 · GEN-REQ-003 | Mentés után rendszer létrejön; azonos bemenet azonos besorolás; hibánál nincs félkész rekord. | UI | — | HIÁNYZIK |

### 3.7 Sorozatos adatbevitel adatforrásból (import) — osztály: `ImportTest`

| MT-kód | Követelmény | Elvárt eredmény (rövid) | Típus | Automata teszt | Státusz |
|---|---|---|---|---|---|
| MT-IMPORT-001 | IMPORT-REQ-001 | Az importsablon letölthető, kötelező oszlopokkal. | UI | — | HIÁNYZIK |
| MT-IMPORT-002 | IMPORT-REQ-002 | Ugyanaz az érvényes adat CSV- és XLSX-ben is feldolgozható. | UI | — | HIÁNYZIK |
| MT-IMPORT-005 | IMPORT-REQ-005 | Az előnézet soronként mutatja az érvényességet és a hibákat. | UI | — | HIÁNYZIK |
| MT-IMPORT-006 | IMPORT-REQ-006 | Vegyes fájlnál egyetlen rekord sem kerül adatbázisba. | UI | — | HIÁNYZIK |

### 3.8 Meglévő adat módosítás — osztály: `RendszerModositasTest`

| MT-kód | Követelmény | Elvárt eredmény (rövid) | Típus | Automata teszt | Státusz |
|---|---|---|---|---|---|
| MT-EDIT-001 | EDIT-REQ-001 | Név, életciklus, funkciók, nyilatkozatok együtt mentődnek. | UI | — | HIÁNYZIK |
| MT-EDIT-002 | EDIT-REQ-002 | Üres/csak szóköz/161 karakteres név elutasítva; szóközök normalizálva. | UI | — | HIÁNYZIK |

### 3.9 Adat törlése (archiválás) — osztály: `RendszerTorlesTest`

| MT-kód | Követelmény | Elvárt eredmény (rövid) | Típus | Automata teszt | Státusz |
|---|---|---|---|---|---|
| MT-EDIT-004 | EDIT-REQ-004 · GEN-REQ-007 | Mégsemnél nincs változás; megerősítésnél archiválás, az előzmény megmarad. | UI | — | HIÁNYZIK |

### 3.10 Adatok lementése felületről (szabályzat nyomtatás/PDF) — osztály: `SzabalyzatMentesTest`

| MT-kód | Követelmény | Elvárt eredmény (rövid) | Típus | Automata teszt | Státusz |
|---|---|---|---|---|---|
| MT-POLICY-005 | POLICY-REQ-005 | Keresés a dokumentumban; nyomtatás/PDF-mentés indítható. | UI (részben) | — | HIÁNYZIK |

### 3.11 Kijelentkezés — osztály: `KijelentkezesTest`

| MT-kód | Követelmény | Elvárt eredmény (rövid) | Típus | Automata teszt | Státusz |
|---|---|---|---|---|---|
| MT-SESSION-001 | SESSION-REQ-001 | Kijelentkezés után a `/vezerlopult` közvetlen URL nem nyílik meg. | UI | — | HIÁNYZIK |

## 4. Melléktermékként meglévő, de nem a 11 funkcióhoz tartozó tesztek

| Mai teszt | Mit fed le | Teendő |
|---|---|---|
| `VezerlopultTest` (4 kártya navigáció) | DASH-REQ-001/002 · MT-DASH-001/002 | ÁTNEVEZ + kódozás (`VezerlopultTest` maradhat) |
| `GmailKapcsolat` / `GmailKapcsolatTest` | Gmail API segéd (e-mail-megerősítéshez) | Megtartás; MT-AUTH-004/005-höz később |
| `BelepesOldal` (POM segéd) | — (félkész) | Parkolva |

## 5. Átnevezési térkép (mai → cél)

| Mai osztály | Cél osztály | Indok |
|---|---|---|
| `AiActLoginTest` | `BelepesTest` | Funkció szerinti, spec-hű név (6. fejezet, LOGIN-REQ). |
| `RegisztracioTest` | `RegisztracioTest` | Név jó; metódusokba követelmény-kód kell. |
| `VezerlopultTest` | `VezerlopultTest` | Név jó; metódusokba követelmény-kód kell. |

## 6. Következő lépések (prioritás: Kritikus előbb)

1. Meglévő 3 osztály átnevezése + `@DisplayName` követelmény-kódokkal (olcsó, gyors).
2. Bejelentkezés hiányzó kritikus esetei: MT-LOGIN-008, -009, -010.
3. Új adat bevitel gerinc: MT-CREATE-006 + MT-CREATE-007 (energetika boldog út).
4. Listázás + lapozás: MT-SYSTEM-001, MT-SYSTEM-003.
5. Módosítás, törlés, kijelentkezés, import, mentés — a táblázat szerint.
6. Pipeline-érettség és GitHub Actions (záró fázis).
