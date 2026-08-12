# Tesztfuttatások

| Futtatás | Teszteset | Környezet | Eredmény | Hibajegy | Újratesztelés |
|---|---|---|---|---|---|
| RUN-AUTH-001 | AUTH-REG-001 | Vercel, Chrome, Windows | **Sikertelen** | BUG-AUTH-001 | Szükséges |
| RUN-AUTH-002 | AUTH-REG-001 | Vercel, Chrome, Windows | **Sikeres** | BUG-AUTH-001 | Sikeres |
| RUN-AUTH-003 | AUTH-LOGIN-001 | Vercel, Chrome, Windows | **Sikeres** | – | Nem szükséges |
| RUN-AUTH-004 | AUTH-LOGOUT-001 | Vercel, Chrome, Windows | **Sikeres** | – | Nem szükséges |

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
