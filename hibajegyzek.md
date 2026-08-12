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
