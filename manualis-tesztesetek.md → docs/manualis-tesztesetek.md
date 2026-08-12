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
