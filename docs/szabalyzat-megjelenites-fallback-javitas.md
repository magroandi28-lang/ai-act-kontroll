# Szabályzat-megjelenítés – újramegerősítési állapot javítása

Dátum: 2026-08-15

## Hiba

A 12 aktív rendszerből 11 korábbi rendszer `profile_revalidation_required=true` állapotba került. Ez az új szabályzatverzió létrehozását helyesen blokkolta, de a szabályzatoldal minden megnyitáskor azonnal újragenerálást kért, ezért RPC-hiba esetén a már meglévő szabályzatot is elrejtette.

## Adatbázis-ellenőrzés

- aktív rendszer: 12;
- tételes audit-minta, megerősített profillal: 1;
- újramegerősítésre váró rendszer: 11;
- közülük korábbi szabályzattal rendelkezik: 9;
- közülük még nem rendelkezik szabályzattal: 2.

## Javított működés

1. Ha a szabályzat frissítése sikeres, a legújabb verzió jelenik meg.
2. Ha a frissítés az új profilmegerősítés hiánya miatt sikertelen, de van mentett szabályzat, a mentett verzió megjelenik.
3. A felület és a nyomtatott/PDF-változat is jelzi, hogy a dokumentum frissítésre vár.
4. A figyelmeztetés közvetlenül a Szerkesztés oldalra vezet.
5. Ha korábbi szabályzat sincs, a generálás blokkolva marad, és az oldal adatellenőrzést kér.
6. A rendszer nem állítja automatikusan igazra a felhasználói profilmegerősítést.

## Módosított fájlok

- `app/rendszerek/[id]/szabalyzat/page.js`
- `app/rendszerek/[id]/szabalyzat/SearchablePolicy.js`
- `app/globals.css`

## Ellenőrzés

Az `npm run build` sikeres: fordítás, lint, típusellenőrzés, 13 statikus oldal, build trace és oldaloptimalizálás rendben.
