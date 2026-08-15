# EnergiaAI Kontroll – aktívfunkció-alapú helyreállítás

Dátum: **2026-08-15**  
Érintett környezet: Supabase projekt `enhrrhdvpqxbkefnfztl` és a Next.js alkalmazás forrása

## Helyes működési modell

1. A felhasználó rögzíti az MI-rendszer nevét, típusát, alkalmazási területét és tényleges rendeltetését.
2. A felhasználó kizárólag a rendszer valóban aktív funkcióit választja ki.
3. A felület csak azokat az alkalmazási adatokat kéri be, amelyek az aktív funkciókból nem vezethetők le, de a jogi alkalmazhatóság eldöntéséhez szükségesek.
4. A determinisztikus szabálymotor az aktív funkciók, a rendszertípus, a szervezeti szerep és az ellenőrzött alkalmazási adatok alapján választ szabálymodulokat.
5. A használati profil nem írhatja felül a tényadatokat, és nem tehet önkényesen kötelezővé funkciókat.
6. Változatlan bemenet és változatlan modulverziók esetén nem készül új szabályzatverzió.

## Azonnali éles helyreállítás

- Mind a 8 energetikai kompatibilitási profil ismét aktív, ezért a még telepített régi felület profilválasztója nem marad üres.
- Mind a 13 aktív rendszer profilkapcsolata visszaállt a korábbi szabályzat-pillanatképből vagy az aktív funkciók egyértelmű leképezéséből.
- Mind a 13 aktív rendszer `profile_revalidation_required = false` állapotban van.
- A központi generálási kapu rekordbetöltési hibája javítva: `select s into v_system` helyett `select s.* into v_system` fut.
- A központi generálási ellenőrzés mind a 13 aktív rendszeren sikeres.

## Általános rendszerlogika

- 12 választható MI-rendszertípus áll rendelkezésre az ügyfélszolgálati chatbottól a dokumentumfeldolgozó, toborzási, előrejelző, anomáliadetektáló, képfeldolgozó és egyéb MI-rendszerig.
- 23 aktív funkció áll rendelkezésre; ezek közül 13 általánosan használható több rendszertípusnál.
- A létrehozó és szerkesztő adatbázis-függvény ellenőrzi a funkció kompatibilitását és valódi függőségeit.
- Az általános importsablon rendszertípust, rendeltetést és aktív funkciókódokat fogad; használati profilt nem kér.
- A generikus szabályréteg 89 modult tartalmaz, amelyek közül 86 megfelelőségi szabályból származik és 3 általános belső kontroll.

## Elvégzett tesztek

| Teszt | Eredmény |
|---|---|
| Next.js produkciós build | sikeres |
| Lint- és típusellenőrzés | sikeres |
| Statikus oldalak előállítása | 13/13 sikeres |
| Általános felvitel mind a 12 rendszertípussal, tranzakció-visszagörgetéssel | 12/12 sikeres; 0 tesztrekord maradt |
| Központi generálási kapu az aktív rendszereken | 13/13 sikeres |
| Mintarendszer minden energetikai profilhoz | 8/8 profil lefedett |
| Mentett szabályzat minden energetikai profilhoz | 8/8 profil lefedett |
| Változatlan rendszer ismételt generálása | első futás `created=true`, második futás `created=false`; a verziószám nem nőtt tovább |
| Rendszertípusonkénti modulalkalmazhatósági próba | 12/12 típusnál volt alkalmazható általános szabálymodul |

## Auditállapot

Az aktívfunkció-alapú technikai motor és a felvitel helyreállítása elkészült. A korábban lezárt 2. profil technikai és hivatkozási ellenőrzése dokumentált, a 3–8. energetikai profil teljes tételes jogforrás-, hatály-, cikkhivatkozás- és alkalmazásifeltétel-auditja azonban még nincs lezárva. Az új generikus modulréteg miatt a teljes szabálykatalógus jogi tartalmi ellenőrzését is végig kell vezetni.

Ezért a teljes rendszerre még nem írható rá, hogy:

> „Technikailag validált, determinisztikusan előállított szabályzattervezet, szakmai és jogi felülvizsgálatra kész.”

Ez a minősítés jelenleg csak a korábban tételesen lezárt 2. profilra alkalmazható. A teljes rendszerre akkor alkalmazható, ha a 3–8. profil és a generikus szabálymodulok tételes auditja is lezárult. Szakértői jóváhagyás előtt továbbra sem állítható, hogy a rendszer „jogilag megfelelő” vagy „hitelesített”.

## Következő ellenőrzési sorrend

1. A generikus modulok jogforrásának, hatályának, cikkhivatkozásának és alkalmazási feltételének tételes auditja.
2. A 3. profil – Mérőállás rögzítése – tételes auditja.
3. A 4–8. profil azonos mélységű auditja.
4. Az elvárt és tényleges modullisták új összehasonlítása a végleges generikus motorral.
5. A teljes auditdokumentum ellentmondásmentes lezárása és szakértői átadás.
