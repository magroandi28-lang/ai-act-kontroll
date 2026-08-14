# Használati profilok auditja

## Cél

Annak igazolása, hogy minden használati profil egyértelműen azonosítható, szakmailag körülhatárolt, és kizárólag a hozzá tartozó szabályokat aktiválja.

## Auditállapot

| Kód | Profil | Állapot | Első megállapítás |
| --- | --- | --- | --- |
| `ENERGY_CHAT_PUBLIC_INFO` | Általános energetikai tájékoztatás | Ellenőrzendő | A személyes adat nélküli működés határát pontosítani kell. |
| `ENERGY_CHAT_BILLING_CONSUMPTION` | Számla- és fogyasztási ügyintézés | Ellenőrzendő | A számlázási és mérési funkciók egy profilban való összekapcsolása felülvizsgálandó. |
| `ENERGY_CHAT_METER_READING` | Mérőállás rögzítése | Ellenőrzendő | A formai ellenőrzés és az üzleti validáció határát rögzíteni kell. |
| `ENERGY_CHAT_COMPLAINT_INTAKE` | Panasz és kérelem fogadása | Ellenőrzendő | A panasz és az egyszerű kérelem eltérő folyamat lehet. |
| `ENERGY_CHAT_DEBT_DISCONNECTION` | Tartozási és kikapcsolási tájékoztatás | Ellenőrzendő | A tájékoztatást el kell választani a döntéstől, megállapodástól és kikapcsolási intézkedéstől. |
| `ENERGY_CHAT_VULNERABLE_SUPPORT` | Védendő fogyasztói ügyek támogatása | Ellenőrzendő | A különleges adatok és jogosultság-megállapítás kizárását pontosítani kell. |
| `ENERGY_CHAT_COMBINED` | Kombinált energetikai ügyfélszolgálat | Problémás | Nincs önálló, rögzített funkcióköre; átfed a többi profillal. |
| `ENERGY_CHAT_FULL_SERVICE` | Komplex energetikai ügyfélszolgálat | Problémás | Túl széles profil, és átfed a kombinált profillal. |

## Kötelező ellenőrzési szempontok

Minden profilnál rögzíteni kell:

1. Mit végezhet a rendszer?
2. Mit nem végezhet?
3. Milyen adatokhoz férhet hozzá?
4. Kötelező-e ügyfél-azonosítás?
5. Mikor kötelező emberi ügyintézőhöz továbbítani?
6. Hozhat-e pénzügyi, jogosultsági vagy más joghatású döntést?
7. Mely képességkódok és rendszertények tartoznak hozzá?
8. Mely jogi és belső szabálymodulokat kell aktiválnia?
9. Milyen kizáró feltételnél kell a profil kiválasztását megakadályozni?
10. Milyen teszteset igazolja a helyes és a hibás besorolást?

## Első szerkezeti megállapítás

A `Kombinált energetikai ügyfélszolgálat` és a `Komplex energetikai ügyfélszolgálat` jelenleg nem alkot egymást kizáró kategóriát. A determinisztikus működéshez a következő megoldások egyike szükséges:

- a kombinált profil megszüntetése; vagy
- a kombinált profil kizárólag pontosan felsorolt képességek alapján történő, automatikus összeállítása; a teljes körű profil pedig csak az összes kötelező képesség együttes fennállásakor legyen választható.

Az audit lezárásáig egyik profil sem tekinthető szakmailag jóváhagyottnak.

