# Használati profilok teljes auditja

> **Javítás utáni állapot – 2026-08-15:** az auditban feltárt F-01–F-09 hiányosságok adatbázisoldali javítása és regressziós ellenőrzése megtörtént. A részletes, elsődleges záróeredmény a `docs/profilok-2-8-javitasi-jelentes.md` dokumentumban található. A jelen dokumentum további része a javítás előtti megállapításokat auditnyomként őrzi; a korábbi „még nem kész” minősítéseket a javítási jelentés záró minősítése felülírja.

Auditált kör: **2–8. használati profil**  
Kapcsolódó előzmény: az 1. profil korábbi auditja  
Audit dátuma: **2026-08-15**  
Audit jellege: adatmodell-, szabálymotor-, jogforrás-, működési kontroll- és szakértői átadhatósági audit  
Adatbázis: Supabase projekt `enhrrhdvpqxbkefnfztl`

## Vezetői döntés

**A 2–8. profil teljes auditja elkészült. A profilválasztási és szabálymodul-kiválasztási motor technikailag determinisztikus, de a szabályzatok jelen állapotukban még nem jelenthetők ki szakemberi vizsgálatra késznek.**

Az átadás előtt hét javítási csomag szükséges. A legfontosabb blokkolók:

1. a mérőállás-rögzítéshez nincs önálló visszaigazolási, érvényességi és duplikációs kontrollmodul;
2. a panasz és az általános kérelem egy profilban szerepel, miközben jogi és adatkezelési követelményeik eltérnek;
3. a védendő fogyasztói profilból hiányzik a GDPR 9. cikk szerinti különleges adatok kezelési szabálya;
4. több energetikai jogforrás-hivatkozás pontatlan vagy hiányos;
5. a 26 szabálymodulból 24-hez nincs végrehajtási művelet és bizonyítéktípus rendelve;
6. a kombinált profil nem ellenőrzi a funkciók közötti függőségeket;
7. valamennyi modul életciklus-állapota `under_review`.

Az auditdokumentum maga szakértői egyeztetésre kész. A generált szabályzatok csak a jelen jelentésben szereplő blokkolók javítása, újratesztelése és verziózott újragenerálása után adhatók át végleges szakmai/jogi felülvizsgálatra.

## Auditmódszer és bizonyíték

Az audit az alábbiakat ellenőrizte:

- a profilok kötelező, választható és tiltott funkcióit;
- a profilból származtatott gépi tényeket;
- az adatbázisoldali profilérvényesítést;
- a szabálymodulok determinisztikus kiválasztását;
- a kombinált profil összes kételemű szolgáltatáskombinációját;
- a jogi szabályok, joghelyek és modulok kapcsolatát;
- a modulokhoz rendelt végrehajtási műveleteket és bizonyítékokat;
- az emberi átadás, azonosítás, döntési tilalom és forráskontroll meglétét;
- az AI Act, GDPR, VET, Vhr. és Fgytv. hivatalos, 2026-08-15-én elérhető szövegét.

Az audit olvasási műveletekkel készült. Az adatbázis tartalma nem változott.

## Összesített minősítés

| # | Profil | Technikai konzisztencia | Tartalmi minősítés | Szakértői átadás |
|---:|---|---|---|---|
| 1 | Általános energetikai tájékoztatás | determinisztikus | feltételesen megfelelő | javítás után |
| 2 | Számla- és fogyasztási ügyintézés | determinisztikus | feltételesen megfelelő | javítás után |
| 3 | Mérőállás rögzítése | determinisztikus | módosítandó | még nem |
| 4 | Panasz és kérelem fogadása | determinisztikus | módosítandó | még nem |
| 5 | Tartozási és kikapcsolási tájékoztatás | determinisztikus | feltételesen megfelelő | javítás után |
| 6 | Védendő fogyasztói ügyek támogatása | determinisztikus | módosítandó | még nem |
| 7 | Kombinált energetikai ügyfélszolgálat | determinisztikus | tartalmilag feltételes | még nem |
| 8 | Komplex energetikai ügyfélszolgálat | determinisztikus | tartalmilag feltételes | még nem |

## Közös, megfelelően működő kontrollok

Az alábbi szerkezeti elemek megfelelőek:

- mind a nyolc profil aktív és a `CUSTOMER_CHATBOT` rendszertípushoz, valamint az energetikai iparághoz kötött;
- a kötelező, választható és tiltott funkcióhalmazok között nincs átfedés;
- a generatív válaszkészítés technikai képességként választható, nem üzleti alapkövetelmény;
- a profilkapu ellenőrzi az aktív profilt, rendszertípust, iparágat, funkciókat és a profilhoz rögzített tényeket;
- a komplex profil minden üzleti funkciót kötelezővé tesz, ezért elkülönül a kombinált profiltól;
- a kombinált profil legalább két konkrét ügyfélszolgálati funkciót követel meg;
- a szabályzatgenerálás változatlan bemenet esetén nem készít új verziót;
- a kiválasztott profil és funkciók alapján a modulok sorrendje és halmaza ismételhető.

## Keresztmetszeti auditmegállapítások

### AUD-01 – A profil-tények egy része nincs szabályhoz kötve

Súlyosság: **kritikus**

Az adatbázisban egyetlen szabálymodul alkalmazhatósági feltétele sem hivatkozik az alábbi tényekre:

- `requires_input_confirmation`;
- `provides_case_acknowledgement`;
- `may_process_vulnerability_data`.

Következmény: a profil ugyan igaz értékre állítja ezeket, de ettől még nem kerül be olyan szabály, amely a visszaigazolás, ügyazonosító vagy különleges adat kezelési követelményeit ténylegesen előírja.

Elvárt javítás: mindhárom tényhez önálló vagy egyértelműen kapcsolt megfelelőségi szabály, modul, művelet és bizonyíték szükséges.

### AUD-02 – A modulok nem végrehajthatóak és nem bizonyíthatóak

Súlyosság: **kritikus**

A 26 aktív szabálymodulból csak kettőhöz tartozik érdemi művelet- és bizonyítékkapcsolat:

- `CHATBOT_INTERACTION_NOTICE`: 1 művelet, 1 bizonyíték;
- `CHATBOT_AI_LITERACY`: 2 művelet, 1 bizonyíték.

A többi 24 modul szöveges követelményt ad, de nem határozza meg, hogy:

- ki mit hajt végre;
- milyen határidővel;
- milyen rendszerállapot vagy napló bizonyítja a teljesítést;
- ki és mikor vizsgálja felül;
- mi történik eltérés esetén.

Ez különösen érinti a számlázási, mérési, panaszkezelési, kikapcsolási, védendő fogyasztói, GDPR- és AI Act-modulokat.

Elvárt javítás: minden szakértőnek átadandó modulhoz legalább egy felelős művelet, elfogadási feltétel és ellenőrizhető bizonyíték tartozzon.

### AUD-03 – Minden modul felülvizsgálat alatti

Súlyosság: **magas**

Mind a 26 modul életciklus-állapota `under_review`. Ez helyes előkészítési állapot, de nem egyeztethető össze azzal az állítással, hogy a generált szabályzat végleges vagy jóváhagyott.

Elvárt javítás: a szakmai és jogi felelősök jóváhagyása után verziózva kell `approved` vagy az alkalmazás által használt végleges státuszba emelni a modulokat.

### AUD-04 – Funkciófüggőségek nincsenek általánosan kikényszerítve

Súlyosság: **magas**

A profilkapu a kötelező, engedélyezett és tiltott funkciókat ellenőrzi, de nem kezel általános képességfüggőségeket. Például a kombinált profilban a mérőállás-fogadás önmagában kiválasztható anélkül, hogy gépi szabály írná elő az ügyfél és a mérési pont megbízható összerendelését.

Elvárt javítás: adatvezérelt függőségi szabályok szükségesek, legalább a következőkre:

- mérőállás-fogadás → azonosítás vagy más dokumentált mérési pont-összerendelés;
- egyedi számla/tartozás/kikapcsolás → ügyfél-azonosítás és jogosultság-ellenőrzés;
- védendőségi egyedi ügy → célhoz kötött adatfelvétel és megfelelő hozzáférési szint;
- panasz továbbítása → elérhetőség, visszaigazolás és ügyazonosító.

### AUD-05 – Jogi hivatkozások pontossága

Súlyosság: **magas**

Három forráskapcsolat javítandó:

1. A számlázási modul `VHR_ANNEX_BILLING` hivatkozása a „2. melléklet, 4–5. pontot” nevezi meg, miközben a jelenlegi szerkezetben a mérés, elszámolás és számlakifogás releváns részei a 2. melléklet 14–16. pontjai környezetében találhatók. A modul állításait pontos alpontokra kell bontani.
2. A kikapcsolási modul általános `24–26. §` hivatkozása túl tág. A kikapcsolás fő szabályai a Vhr. 24–25. §-ában, a visszakapcsolási kötelezettségek a 22/C. §-ban vannak. A 26. § kereskedőváltásra vonatkozik, ezért csak ilyen tényállásnál indokolt.
3. A védendő fogyasztói modul a VET 64–65. § mellett nem tartalmazza a Vhr. 30–36. § részletes nyilvántartási, igazolási, fizetési könnyítési, különleges bánásmódi és szolgáltatási szabályait.

### AUD-06 – A védendőségi adatok különleges adatnak minősülhetnek

Súlyosság: **kritikus**

A védendő fogyasztói profil megengedi a védendőségi adatok kezelését. Az igazolások fogyatékosságra vagy egészségi állapotra vonatkozó adatot is tartalmazhatnak. Ehhez a GDPR 9. cikke szerinti különlegesadat-kezelési feltételt, hozzáférés-korlátozást, megőrzést és törlést külön kell modellezni.

Az adatbázisban nincs azonosítható, kifejezetten GDPR 9. cikkre épülő jogi szabály és modul. A jelenlegi általános GDPR-modulok ezt nem pótolják.

### AUD-07 – Adatfrissesség és döntési határ bizonyítása

Súlyosság: **magas**

A profilok szövegesen tiltják a joghatással járó döntést és előírják az ellenőrzött forrást, de az egyedi számla-, tartozás-, kikapcsolás- és státuszadatoknál nincs egységes bizonyíték arra, hogy:

- mely forrásrendszerből származott az adat;
- mikori volt a lekérdezés;
- mely ügyfélhez és jogosultsághoz kapcsolódott;
- a chatbot csak tájékoztatott, nem döntött;
- szükség esetén megtörtént az emberi átadás.

Elvárt javítás: mezőszintű jogosultsági és adatfrissességi napló, forrásazonosító, válaszidőbélyeg és emberi átadási esemény.

## 2. profil – Számla- és fogyasztási ügyintézés

Profilkód: `ENERGY_CHAT_BILLING_CONSUMPTION`  
Minősítés: **feltételesen megfelelő – javítás után adható szakértőnek**

### Rendeltetés

A profil azonosított ügyfél számla-, elszámolási, fogyasztási és mérési adatainak megjelenítésére és magyarázatára használható. Nem módosíthat számlát, elszámolást, szerződést vagy mérési adatot, és nem hozhat joghatással járó döntést.

### Funkcióhatár

| Típus | Funkciók |
|---|---|
| Kötelező | általános tájékoztatás; energetikai tájékoztatás; számlázási információ; fogyasztási/mérési adat; személyes fiókadat |
| Választható | generatív válaszok |
| Tiltott | mérőállás fogadása; panaszfelvétel; tartozási/kikapcsolási ügy; védendő fogyasztói ügy |

### Megfelelő kontrollok

- az ügyfél-azonosítás és a személyes fiókadat elérése kötelező;
- számlamódosítás és joghatással járó döntés tiltott;
- ellenőrzött forrás és emberi átadás előírt;
- a profilhoz a számlázási/mérési szakmodul determinisztikusan kiválasztódik;
- az alapkonfiguráció 20 modult eredményez.

### Eltérések

1. A Vhr. 2. mellékletére mutató forráshely pontatlan; a szabályállításokat a mérés, elszámolás és számlakifogás megfelelő alpontjaihoz kell kötni.
2. A modulhoz nincs végrehajtási művelet és bizonyíték.
3. Az egyedi adat válaszban való használatához nincs előírt adatfrissességi időbélyeg és mezőszintű jogosultsági bizonyíték.
4. A profil neve a számla- és fogyasztási ügyintézést együtt kezeli. Ha egy rendszer csak számlát vagy csak fogyasztási adatot kezel, a kombinált profil vagy szűkebb profil pontosabb lehet.

### Kötelező javítás

- a joghely pontosítása;
- forrásrendszer-, jogosultság- és lekérdezési időbélyeg rögzítése;
- a „magyarázat” és „módosítás/döntés” technikai elkülönítése;
- művelet- és bizonyítéksorok létrehozása.

## 3. profil – Mérőállás rögzítése

Profilkód: `ENERGY_CHAT_METER_READING`  
Minősítés: **módosítandó – még nem adható szakértőnek kész szabályzatként**

### Rendeltetés

A profil mérőállás fogadására, formai ellenőrzésére, ügyfél általi megerősítésére és a háttérrendszer felé történő továbbítására használható. Nem számolhat el fogyasztást, nem módosíthat számlát és nem dönthet a mérőállás elfogadásáról vitás vagy rendellenes esetben.

### Funkcióhatár

| Típus | Funkciók |
|---|---|
| Kötelező | általános tájékoztatás; energetikai tájékoztatás; fogyasztási/mérési adat; személyes fiókadat; mérőállás fogadása |
| Választható | generatív válaszok |
| Tiltott | számlázási ügy; panaszfelvétel; tartozási/kikapcsolási ügy; védendő fogyasztói ügy |

### Megfelelő kontrollok

- azonosítás és személyes fiókadat kötelező;
- a profil előírja a bevitel megerősítését;
- joghatással járó döntés tiltott, emberi átadás előírt;
- az alapkonfiguráció 20 modult eredményez.

### Kritikus eltérés

A `requires_input_confirmation = true` tényt egyetlen szabálymodul sem használja. Emiatt nincs kikényszerítve:

- a mérési pont és az ügyfél összerendelése;
- a mérő gyári számának vagy más azonosítójának ellenőrzése;
- a mértékegység és formátum ellenőrzése;
- a kirívó vagy a korábbi állásnál kisebb érték kezelése;
- a duplikált beküldés felismerése;
- a beküldés előtti összefoglaló megerősítés;
- a sikeres vagy sikertelen továbbítás visszaigazolása és bizonylata;
- vitás esetben az emberi átadás.

### Kötelező javítás

Önálló `ENERGY_METER_READING_INTAKE` kontrollmodul szükséges, amely műveletet, hibautat, visszaigazolást, ügyazonosítót és naplóbizonyítékot ír elő. A kombinált profilban a mérőállás-funkcióhoz függőségként kell kapcsolni az azonosítást vagy a dokumentált mérési pont-összerendelést.

## 4. profil – Panasz és kérelem fogadása

Profilkód: `ENERGY_CHAT_COMPLAINT_INTAKE`  
Minősítés: **módosítandó – még nem adható szakértőnek kész szabályzatként**

### Rendeltetés

A profil elektronikus panasz befogadására, rögzítésére, visszaigazolására és emberi panaszkezelési folyamatba továbbítására használható. A chatbot nem bírálhatja el a panaszt, nem tehet végleges jogi nyilatkozatot és nem tagadhatja meg a panasz rögzítését pusztán azért, mert az ügyfél nem lépett be a fiókjába.

### Funkcióhatár

| Típus | Funkciók |
|---|---|
| Kötelező | általános tájékoztatás; energetikai tájékoztatás; személyes fiókadat; panaszfelvétel |
| Választható | generatív válaszok |
| Tiltott | számlázási ügy; fogyasztási/mérési adat; mérőállás; tartozási/kikapcsolási ügy; védendő fogyasztói ügy |

### Megfelelő kontrollok

- a profil ügyvisszaigazolást és emberi átadást vár el;
- joghatással járó döntést nem enged;
- a panaszkezelési modul determinisztikusan kiválasztódik;
- az alapkonfiguráció 20 modult eredményez.

### Kritikus eltérések

1. **Panasz és kérelem összemosása.** A kettő eltérő jogi kategória és eltérő folyamatot, határidőt, adatmezőt és választ igényel. A profilt panaszra kell szűkíteni, vagy két profilt/képességet kell létrehozni.
2. **Túl szigorú fiókkövetelmény.** A `PERSONAL_ACCOUNT_DATA` és a hitelesítés kötelező. Panasz benyújtásához azonban elég lehet a szükséges azonosító és elérhetőségi adat felvétele; a teljes fiókhozzáférés kötelezővé tétele adatminimalizálási és hozzáférési kockázatot okoz.
3. **A gépi tény nincs felhasználva.** A `provides_case_acknowledgement = true` tényre egyetlen modul sem hivatkozik.
4. **Hiányzó végrehajtási részletek.** A modul nem bizonyítja az elektronikus panasz azonnali visszaigazolását, az egyedi azonosítót, a főszabály szerinti 30 napos válaszadást, a hároméves megőrzést, valamint az indokolt elutasítást és a jogorvoslati tájékoztatást.

### Kötelező javítás

- a panasz és az általános kérelem szétválasztása;
- a személyes fiókadat opcionálissá tétele, külön `collects_complaint_contact_data` vagy azzal egyenértékű tény bevezetése;
- azonnali elektronikus visszaigazolás, egyedi ügyazonosító és naplóbizonyíték;
- a határidő, megőrzés, elutasítás és jogorvoslati tájékoztatás külön szabályozása;
- ágazati rövidebb határidő esetén a szigorúbb szabály elsőbbségének kezelése.

## 5. profil – Tartozási és kikapcsolási tájékoztatás

Profilkód: `ENERGY_CHAT_DEBT_DISCONNECTION`  
Minősítés: **feltételesen megfelelő – javítás után adható szakértőnek**

### Rendeltetés

A profil azonosított ügyfél aktuális tartozási, fizetési, kikapcsolási és visszakapcsolási státuszáról adhat tájékoztatást. Nem rendelhet el kikapcsolást, nem állapíthat meg tartozást önállóan, nem dönthet részletfizetésről vagy visszakapcsolásról.

### Funkcióhatár

| Típus | Funkciók |
|---|---|
| Kötelező | általános tájékoztatás; energetikai tájékoztatás; személyes fiókadat; tartozási/kikapcsolási támogatás |
| Választható | generatív válaszok |
| Tiltott | számlázási ügy; fogyasztási/mérési adat; mérőállás; panaszfelvétel; védendő fogyasztói ügy |

### Megfelelő kontrollok

- azonosítás és személyes fiókadat kötelező;
- a profil kifejezetten tiltja a chatbot általi kikapcsolást és joghatásos döntést;
- emberi átadás és ellenőrzött forrás előírt;
- az alapkonfiguráció 20 modult eredményez.

### Eltérések

1. A `Vhr. 24–26. §` hivatkozás pontatlanul széles. A kikapcsolásnál a 24–25. §, visszakapcsolásnál a 22/C. § a közvetlen forrás; a 26. § csak kereskedőváltási helyzetben releváns.
2. Nincs művelet és bizonyíték az ügyfél-azonosításra, az aktuális státusz lekérdezésére, az értesítések ellenőrzésére és az emberi átadásra.
3. A válaszban nincs kötelezően feltüntetett forrás- és lekérdezési időbélyeg, ezért elavult státusz kommunikálható.

### Kötelező javítás

- a joghely bontása VET 47. §, Vhr. 24–25. § és 22/C. § szerint;
- a kereskedőváltási szabály feltételes leválasztása;
- élő háttérrendszeri státusz, jogosultság és időbélyeg bizonyítása;
- automatikus döntés és ígéret technikai tiltása;
- művelet- és bizonyítéksorok létrehozása.

## 6. profil – Védendő fogyasztói ügyek támogatása

Profilkód: `ENERGY_CHAT_VULNERABLE_SUPPORT`  
Minősítés: **módosítandó – még nem adható szakértőnek kész szabályzatként**

### Rendeltetés

A profil általános tájékoztatást adhat a védendő fogyasztói jogosultságokról, iratokról és ügyintézési lépésekről, majd emberi ügyintézőhöz irányíthat. Egyedi ügyintézés csak megfelelő azonosítással, célhoz kötött adatfelvétellel és korlátozott hozzáféréssel végezhető. A chatbot nem állapíthatja meg a jogosultságot.

### Funkcióhatár

| Típus | Funkciók |
|---|---|
| Kötelező | általános tájékoztatás; energetikai tájékoztatás; védendő fogyasztói támogatás |
| Választható | személyes fiókadat; generatív válaszok |
| Tiltott | számlázási ügy; fogyasztási/mérési adat; mérőállás; panaszfelvétel; tartozási/kikapcsolási ügy |

### Megfelelő kontrollok

- a személyes fiókadat helyesen választható, nem kötelező;
- alaphelyzetben nem szükséges azonosított ügyfélfiók;
- joghatásos döntés tiltott és emberi átadás kötelező;
- az alapkonfiguráció 20 modult eredményez.

### Kritikus eltérések

1. A profil `may_process_vulnerability_data = true` tényét egyetlen modul sem használja.
2. Nincs kifejezett GDPR 9. cikk szerinti szabály a fogyatékosságra vagy egészségi állapotra utaló különleges adatokhoz.
3. A jogalap csak a VET 64–65. §-ra épül; hiányzik a Vhr. 30–36. § részletes szabályainak leképezése.
4. Nincs külön kezelve az általános tájékoztatás, a jogosultság igazolása, a nyilvántartásba vétel és a különleges szolgáltatás igénylése.
5. A különböző igazolások megőrzési ideje és hozzáférési szintje nincs dokumentumtípusonként meghatározva.
6. A hozzáférhető kommunikáció és speciális ügyfélkiszolgálás nem kötelező belső kontrollként jelenik meg. Ez független attól, hogy az általános akadálymentességi jogszabálymodul egy adott szolgáltatóra alkalmazandó-e.

### Kötelező javítás

- különlegesadat-kezelési jogalap és GDPR 9. cikk szerinti feltétel;
- adatmező-, szerepkör- és dokumentumtípus-szintű hozzáférés;
- Vhr. 30–36. § tételes leképezése;
- dokumentumtípusonkénti megőrzés és törlés;
- hozzáférhető kommunikáció, emberi segítség és sürgős átadás;
- a chatbot általi jogosultság-megállapítás technikai tiltása.

## 7. profil – Kombinált energetikai ügyfélszolgálat

Profilkód: `ENERGY_CHAT_COMBINED`  
Minősítés: **technikailag determinisztikus, tartalmilag feltételes – még nem adható szakértőnek kész szabályzatként**

### Rendeltetés

A profil legalább két, külön kiválasztott energetikai ügyfélszolgálati funkció egy rendszerben történő használatára szolgál. A kiválasztott funkciók szabálymoduljainak unióját kell létrehoznia, miközben a nem kiválasztott funkciók követelményeit nem emeli be.

### Funkcióhatár

| Típus | Funkciók |
|---|---|
| Kötelező alap | általános tájékoztatás; energetikai tájékoztatás |
| Választható üzleti | számlázás; fogyasztási/mérési adat; személyes fiókadat; mérőállás; panasz; tartozás/kikapcsolás; védendő fogyasztói támogatás |
| Választható technikai | generatív válaszok |
| Minimum | legalább két konkrét szolgáltatási funkció a számlázás, mérőállás, panasz, tartozás/kikapcsolás és védendő támogatás közül |

### Determinisztikus teszt

Az öt konkrét szolgáltatás összes kételemű kombinációját ellenőriztük, összesen 10 esetet. Minden esetben pontosan a kiválasztott szolgáltatások szakmoduljainak uniója jelent meg.

Példák:

- számlázás + panasz → számlázási/mérési és panaszkezelési modul;
- panasz + tartozás → panaszkezelési és kikapcsolási/visszakapcsolási modul;
- tartozás + védendő támogatás → kikapcsolási/visszakapcsolási és védendő fogyasztói modul.

A kötelező alap önmagában 19 modult eredményez, de a profilkapu ezt érvénytelennek minősíti, amíg nincs legalább két konkrét szolgáltatási funkció.

### Eltérések

1. A kombinációk kiválasztása helyes, de a funkciófüggőségek nincsenek kikényszerítve.
2. A profil örökli minden kiválasztott szakmodul jogi és bizonyítási hibáját.
3. A minimumszabály a szolgáltatásdarabszámot ellenőrzi, nem a szükséges azonosítást, adatforrást vagy jogosultságot.
4. A fogyasztási/mérési adat és a személyes fiókadat önmagában nem számít a két konkrét szolgáltatás egyikének; ezt a felhasználói felületen világosan jelezni kell.

### Kötelező javítás

- adatvezérelt funkciófüggőségi táblázat és adatbázisoldali ellenőrzés;
- a kiválasztott funkciókhoz tartozó hitelesítési és adatkezelési tények automatikus levezetése;
- hibás szakmodul kiválasztásakor a szabályzatgenerálás blokkolása;
- valamennyi kételemű és fontos háromelemű kombináció regressziós tesztje.

## 8. profil – Komplex energetikai ügyfélszolgálat

Profilkód: `ENERGY_CHAT_FULL_SERVICE`  
Minősítés: **technikailag determinisztikus, tartalmilag feltételes – még nem adható szakértőnek kész szabályzatként**

### Rendeltetés

A profil teljes körű energetikai ügyfélszolgálati rendszerhez használható, amely valamennyi üzleti funkciót támogatja. Ettől különül el a kombinált profiltól: itt mind a kilenc üzleti képesség kötelező, a generatív válaszadás pedig továbbra is választható technikai képesség.

### Funkcióhatár

| Típus | Funkciók |
|---|---|
| Kötelező | mind a 9 üzleti funkció: általános és energetikai tájékoztatás, számla, fogyasztási/mérési adat, személyes fiókadat, mérőállás, panasz, tartozás/kikapcsolás, védendő támogatás |
| Választható | generatív válaszok |
| Tiltott | nincs, a profil a teljes üzleti funkciókört fedi le |

### Megfelelő kontrollok

- a komplex és kombinált profil közötti különbség egyértelmű;
- minden lényeges biztonsági tény aktív: azonosítás, adatkezelés, visszaigazolás, döntési tilalom, ellenőrzött forrás és emberi átadás;
- a teljes konfiguráció 23 modult eredményez;
- a modulunió determinisztikus.

### Eltérések

1. A profil örökli a 2–6. profil minden blokkolóját.
2. A magas adatkockázat miatt nem elegendő egyetlen általános hozzáférési szint; ügytípus- és adatmező-szintű jogosultság szükséges.
3. Az emberi átadás okát, időpontját, célcsoportját és eredményét ügyfolyamatonként kell naplózni.
4. A panasz, mérőállás, tartozás/kikapcsolás és védendő ügyek eltérő bizonylati és megőrzési követelményei nincsenek szétválasztva.
5. A teljes szolgáltatási kör miatt különösen indokolt a DPIA-szükségesség dokumentált vizsgálata; ez nem azonos az automatikus DPIA-kötelezettség kijelentésével.

### Kötelező javítás

- a 2–6. profil valamennyi blokkolójának lezárása;
- ügyfolyamatonként elkülönített jogosultság, napló és megőrzés;
- emberi átadási mátrix;
- teljes körű művelet- és bizonyítékkatalógus;
- a javított modulunió teljes regressziós tesztje.

## Szabálymotor-ellenőrzés

### Profilkapu

Az `aic_require_valid_usage_profile` adatbázis-függvény ellenőrzi:

- az aktív rendszert és profilt;
- a rendszer típusát és iparágát;
- a kötelező és engedélyezett funkciókat;
- a tiltott funkciókat;
- a profilhoz rögzített elvárt tényeket;
- a kombinált profil minimum két konkrét szolgáltatását.

Nem ellenőrzi általánosan a funkciók közötti függőségeket. Ez az AUD-04 szerinti javítást igényli.

### Verzióképzés

Az `aic_generate_policy_if_changed` a kiértékelt profilt és a modulpillanatképet összehasonlítja a meglévő szabályzattal. Ha nincs tényleges változás, nem készít új verziót. Ez a működés megfelelő.

### Modulválasztási eredmények

| Profil | Alapkonfigurációban kiválasztott modulok |
|---|---:|
| 2. Számla- és fogyasztási ügyintézés | 20 |
| 3. Mérőállás rögzítése | 20 |
| 4. Panasz és kérelem fogadása | 20 |
| 5. Tartozási és kikapcsolási tájékoztatás | 20 |
| 6. Védendő fogyasztói támogatás | 20 |
| 7. Kombinált profil kötelező alapja | 19, de két szolgáltatás nélkül érvénytelen |
| 8. Komplex energetikai ügyfélszolgálat | 23 |

Az azonos modulszám nem jelenti a szakmodulok azonosságát; a négy 20 modulos profilnál a közös alapmodulok mellé eltérő szakmodul kerül.

## Javítási és visszaellenőrzési mátrix

| Azonosító | Javítás | Érintett profil | Elfogadási feltétel |
|---|---|---|---|
| F-01 | Mérőállás-beviteli kontrollmodul | 3, 7, 8 | megerősítés, validáció, duplikáció, bizonylat és hibautak tesztelve |
| F-02 | Panasz és kérelem szétválasztása | 4, 7, 8 | külön képesség/profil vagy egyértelmű panasz-szűkítés; fiókadat nem indokolatlanul kötelező |
| F-03 | GDPR 9. cikk és különlegesadat-kezelés | 6, 7, 8 | jogalap, cél, hozzáférés, megőrzés, törlés és bizonyíték rögzítve |
| F-04 | Energetikai joghelyek pontosítása | 2, 5, 6, 7, 8 | Vhr. pontos §/melléklet/alpont és állításonkénti kapcsolat |
| F-05 | Művelet- és bizonyítékkatalógus | 2–8 | minden alkalmazott modulhoz felelős művelet és ellenőrizhető bizonyíték |
| F-06 | Funkciófüggőségek | 3, 7, 8 | hiányos azonosítási/adatkezelési kombinációt a profilkapu elutasít |
| F-07 | Modul-életciklus és verzió | 2–8 | jóváhagyott modulok, verziózott új szabályzat és változásjegyzék |
| F-08 | Adatfrissességi/jogosultsági napló | 2, 3, 5, 7, 8 | minden egyedi adatválasz forrása, ideje és jogosultsága visszakereshető |
| F-09 | Hozzáférhető és emberi ügyintézés | 6, 7, 8 | ügyfélcsoporthoz igazított kommunikáció és sürgős átadás tesztelve |

## Kötelező újratesztelés a javítások után

1. mind a 2–8. profil minimális érvényes konfigurációja;
2. minden kötelező funkció egyenkénti hiánya;
3. minden tiltott funkció egyenkénti hozzáadása;
4. mérőállás hibás, csökkenő, kirívó és duplikált értéke;
5. panasz belépés nélkül, hiányos adattal és elektronikus visszaigazolással;
6. tartozási/kikapcsolási adat elavult és jogosulatlan lekérése;
7. védendőségi általános tájékoztatás személyes adat nélkül;
8. védendőségi egyedi ügy különleges adattal;
9. a kombinált profil összes kételemű és kockázatos háromelemű kombinációja;
10. a komplex profil teljes moduluniója;
11. változatlan szabályzat újragenerálása, amely nem hozhat létre új verziót;
12. egyetlen jogforrás-, modul- vagy tényváltozás, amelynek új verziót kell létrehoznia.

## Hivatalos jogforrások

- [Az Európai Parlament és a Tanács (EU) 2024/1689 rendelete – AI Act, egységes szerkezet 2026-07-27](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX%3A02024R1689-20260727)
- [Az Európai Parlament és a Tanács (EU) 2016/679 rendelete – GDPR](https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng)
- [2007. évi LXXXVI. törvény a villamos energiáról](https://njt.jog.gov.hu/jogszabaly/2007-86-00-00)
- [273/2007. (X. 19.) Korm. rendelet](https://njt.jog.gov.hu/jogszabaly/2007-273-20-22)
- [1997. évi CLV. törvény a fogyasztóvédelemről](https://njt.jog.gov.hu/jogszabaly/1997-155-00-00)

## Záró minősítés

**A 2–8. profil auditja lezárható, de a szabályzatok készültsége még nem zárható le.**

A technikai kiválasztás és a profilhatárok nagy része megfelelően működik. A szakemberi vizsgálat célja azonban nem az, hogy alapvető adatmodell- és forráshibákat találjon meg, hanem hogy egy technikailag és tartalmilag rendezett tervezetet hagyjon jóvá vagy pontosítson. Emiatt az F-01–F-09 javításokat, az újratesztelést és az új szabályzatverziók elkészítését a hivatalos szakmai/jogi átadás előtt el kell végezni.

Javasolt következő állapot a javítások után: **„technikailag validált szabályzattervezet – szakmai és jogi jóváhagyásra átadható”**.

Ez a jelentés megfelelőségi előaudit; nem helyettesíti a jogi, adatvédelmi, energetikai és információbiztonsági felelősök formális jóváhagyását.
