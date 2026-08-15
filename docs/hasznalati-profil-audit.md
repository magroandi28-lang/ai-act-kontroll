# Használati profilok auditja

Állapot: első adatmodell- és konzisztencia-audit  
Dátum: 2026-08-15

## Javítások állapota

| Azonosító | Állapot | Ellenőrzés |
|---|---|---|
| P-01 | Javítva | A származtatott tények hiteles forrásokból újraépülnek; az örökölt biometriai, érzelemfelismerési és szintetikus tartalomra vonatkozó kulcsok eltűntek. |
| P-02 | Javítva | Kötelező, választható és tiltott funkciók kerültek minden profilhoz; mentéskor és szabályzatkészítéskor adatbázis-kapu ellenőriz. |
| P-03 | Javítva az adatmodellben | A kritikus feltételek külön gépi tényekké váltak; profilváltozáskor a korábbi igazolás érvényét veszti, és új kezelői megerősítés szükséges. |
| P-04 | Javítva | A komplex profil minden üzleti funkciót kötelezővé tesz; a kombinált profil legalább két, külön kiválasztott funkciót kapcsol össze. |
| P-05 | Javítva | A generatív válaszkészítés minden profilnál választható technikai funkció. |
| P-06 | Javítva | A személyes fiókadat a védendő fogyasztói profilnál választható; kiválasztásakor az ügyfél-azonosítás gépi ténye automatikusan aktiválódik. |

## Audit célja

Annak ellenőrzése, hogy minden használati profil egyértelműen meghatározza:

- mit tartalmaz;
- mit nem tartalmaz;
- mely funkciók kötelezők;
- mely funkciók választhatók;
- milyen kizáró feltételek mellett nem használható;
- mikor szükséges másik profil vagy emberi felülvizsgálat.

## Kritikus megállapítások

### P-01 – Régi kérdőívből maradt tények szennyezik a szabálymotor bemenetét

Súlyosság: kritikus

Az `Ügyfélszolgálati kombinált chatbot` aktuális funkciói között nincs biometria és érzelemfelismerés, a `aic_system_facts` rekordban mégis igaz értékkel szerepel:

- `annex_iii_biometrics_use_case = true`;
- `infers_natural_person_emotions = true`;
- `generates_synthetic_content = true`.

Ok: a funkciók módosítása csak a jelenlegi képességkatalógus által kezelt kulcsokat törli. A korábbi kérdőív örökölt kulcsai megmaradnak.

Következmény: a szabálymotor olyan szabályokat is kiválaszthat, amelyek a rendszer dokumentált működésére nem vonatkoznak.

Javítási elvárás:

1. legyen meghatározott, engedélyezett profil-ténykészlet;
2. újrabesoroláskor a származtatott tényeket ebből újra kell építeni;
3. a régi kérdőív származtatott kulcsait el kell távolítani;
4. kézzel igazolt, valódi rendszertény csak külön forrás- és időbélyeggel maradhat meg.

### P-02 – A profilkompatibilitás csak iparág és rendszertípus alapján működik

Súlyosság: kritikus

Jelenleg egy energetikai ügyfélszolgálati profilhoz bármely aktív, energetikával és `CUSTOMER_CHATBOT` típussal kompatibilis funkció hozzáadható. Nincs profilonkénti engedélyezett és tiltott funkciólista.

Következmény: például az `Általános energetikai tájékoztatás` profilhoz személyes ügyféladat-kezelés adható, miközben a profil kötelező állítása ennek ellenkezőjét mondja.

Javítási elvárás:

- profilonként `required_capability_codes`;
- profilonként `optional_capability_codes`;
- profilonként `forbidden_capability_codes`;
- adatbázisoldali ellenőrzés mentéskor és szabályzatkészítéskor.

### P-03 – A kötelező állítások többsége csak szöveg

Súlyosság: magas

A felhasználó egyetlen jelöléssel erősíti meg a teljes állításlistát, de az adatbázis nem ellenőrzi külön a feltételeket. A gépi kapu csak a profil `fact_patch` mezőjét és a funkciók meglétét vizsgálja.

Következmény: olyan profil is érvényesnek minősülhet, amelynek valamely lényeges feltétele nem bizonyított.

Javítási elvárás: minden valóban kötelező állításhoz géppel értelmezhető ténykulcs, elvárt érték és bizonyítási állapot tartozzon.

### P-04 – A `Komplex energetikai ügyfélszolgálat` leírása és kötelező funkciói eltérnek

Súlyosság: magas

A leírás szerint a rendszer több ügytípust támogat. A profil viszont mind a tíz funkciót kötelezővé teszi, köztük a generatív válaszadást is.

Javítási döntés szükséges:

- ha valóban teljes körű profil, minden felsorolt üzleti funkció legyen kötelező, de a generatív működés külön opcionális technikai tulajdonság legyen;
- ha csak több funkciót összekapcsoló profil, akkor a `Kombinált` profillal duplikál, ezért a kettőt össze kell vonni vagy világosan el kell választani.

### P-05 – A generatív működés több profilban indokolatlanul kötelező

Súlyosság: közepes

A `GENERATIVE_RESPONSES` kötelező az általános tájékoztató és a komplex profilban, miközben ugyanazt az üzleti funkciót előre megírt vagy visszakeresett válaszokkal működő chatbot is elláthatja.

Javítási elvárás: a generatív működés legyen külön technikai képesség, ne az üzleti használati profil automatikus része.

### P-06 – A védendő fogyasztói profil személyes fiókadatot kötelezővé tesz

Súlyosság: közepes

A profil leírása alapján általános tájékoztatás és emberi továbbítás is elegendő lehet, mégis kötelező a `PERSONAL_ACCOUNT_DATA`.

Javítási döntés szükséges: külön kell választani az általános védendő fogyasztói tájékoztatást és az azonosított ügyfél egyedi ügyintézését.

## Profilonkénti első minősítés

| Profil | Első minősítés | Fő teendő |
|---|---|---|
| Általános energetikai tájékoztatás | Feltételesen megfelelő | személyes adat tiltása gépi szabállyal; generatív funkció opcionálissá tétele |
| Számla- és fogyasztási ügyintézés | Tovább auditálandó | számlázási és fogyasztási funkciók határának, azonosításnak és döntési tilalomnak ellenőrzése |
| Mérőállás rögzítése | Tovább auditálandó | visszaigazolás, hibás adat és emberi átadás gépi tényeinek pótlása |
| Panasz és kérelem fogadása | Tovább auditálandó | panasz és általános kérelem különválasztása; azonosítás szükségességének vizsgálata |
| Tartozási és kikapcsolási tájékoztatás | Tovább auditálandó | egyedi ügyadat és általános tájékoztatás szétválasztása; döntési tilalom gépi ellenőrzése |
| Védendő fogyasztói ügyek támogatása | Módosítandó | általános tájékoztatás és azonosított ügyintézés szétválasztása |
| Kombinált energetikai ügyfélszolgálat | Módosítandó | profilonként engedélyezett funkciók; minimum két üzleti funkció; régi tények törlése |
| Komplex energetikai ügyfélszolgálat | Módosítandó | a kombinált profiltól való pontos eltérés meghatározása vagy összevonás |

## 1. profil tételes auditja – Általános energetikai tájékoztatás

Audit dátuma: 2026-08-15  
Profilkód: `ENERGY_CHAT_PUBLIC_INFO`  
Minősítés: **feltételesen megfelelő – a szabálymodulok javításáig nem hitelesített**

### Rendeltetés és megengedett működés

A profil olyan ügyfélkapcsolati chatbothoz használható, amely:

- nyilvános, általános energetikai és ügyintézési információt ad;
- ellenőrzött vállalati, hatósági vagy hivatalos tudásforrást használ;
- nem fér hozzá azonosított ügyfél fiók-, szerződés-, számla-, fogyasztási vagy mérési adataihoz;
- nem fogad mérőállást, nem indít panaszt, és nem kezel egyedi tartozási, kikapcsolási vagy védendő fogyasztói ügyet;
- nem hoz joghatással járó, pénzügyi vagy szerződéses döntést;
- bizonytalan vagy egyedi ügyet emberi ügyintézőhöz továbbít.

### Kötelező és választható funkciók

| Típus | Funkció |
|---|---|
| Kötelező | Általános ügyféltájékoztatás |
| Kötelező | Energetikai tájékoztatás |
| Választható | Generatív válaszok készítése |

A jelenlegi kötelező és választható funkciók megfelelnek a profil rendeltetésének. A generatív működés helyesen választható, mert ugyanaz a szolgáltatás előre rögzített vagy visszakeresett válaszokkal is működhet.

### Tiltott funkciók

A jelenlegi tiltás helyes: számlázási, fogyasztási és mérési adat, személyes fiókadat, mérőállásfogadás, panaszfelvétel, tartozási vagy kikapcsolási ügy és védendő fogyasztói ügy nem tartozhat ebbe a profilba. Ha ezek közül bármelyik ténylegesen megjelenik, másik vagy kombinált profil szükséges.

### Kötelező gépi tények

| Tény | Elvárt érték |
|---|---|
| `industry` | `energy` |
| `system_type_code` | `CUSTOMER_CHATBOT` |
| `provides_general_information` | `true` |
| `provides_energy_information` | `true` |
| `accesses_personal_account_data` | `false` |
| `makes_legally_effective_decisions` | `false` |
| `uses_controlled_knowledge_sources` | `true` |
| `requires_human_handoff` | `true` |

### A személyesadat-kezelés feltárt ellentmondása

A `processes_personal_data = false` állítás önmagában nem bizonyítható abból, hogy a chatbot nem fér hozzá ügyfélfiókhoz. Szabad szöveges kérdésben az ügyfél saját maga is megadhat személyes adatot, továbbá a beszélgetési napló, IP-cím, technikai azonosító vagy külső modellnek továbbított prompt is személyes adatot tartalmazhat.

Ezért külön tényként kell kezelni legalább:

- fogad-e szabad szöveget;
- tárol-e beszélgetési naplót;
- kezel-e technikai azonosítót;
- továbbít-e promptot külső szolgáltatónak;
- használják-e a beszélgetést modellfejlesztésre;
- mennyi a megőrzési idő.

Csak akkor állítható teljesen, hogy nincs személyesadat-kezelés, ha ezek egyike sem valósul meg. Egyébként a GDPR-modulokat a tényleges adatkezelés alapján kell kiválasztani.

### A jelenlegi szabályzatmotor hibája

Az `Energia Tudástár` szabályzatának 2. verziója a profil `processes_personal_data = false` ténye ellenére automatikusan beemel nyolc adatvédelmi modult. A modulok feltétele jelenleg több esetben pusztán az, hogy természetes személy kommunikál a chatbottal vagy a rendszer típusa `CUSTOMER_CHATBOT`.

Különösen nem lehet automatikusan minden ilyen rendszerre alkalmazni:

- az adatvédelmi hatásvizsgálatot;
- a nemzetközi adattovábbítást;
- a személyesadat-incidens kezelését;
- az érintetti jogok teljes modulját;
- a beszélgetési naplók megőrzési és törlési követelményeit.

Ezeket a tényleges adatkezelési tényekhez kell kötni. Az adatvédelmi hatásvizsgálat esetében először csak a szükségesség dokumentált vizsgálata írható elő; maga a DPIA csak magas kockázat esetén kötelező.

### Emberi felülvizsgálat vagy másik profil szükséges

- ha az ügyfél egyedi ügyállapotot, számlát, fogyasztási adatot vagy szerződéses információt kér;
- ha panaszt, mérőállást, tartozási vagy kikapcsolási ügyet indítana;
- ha a válasz forrása hiányzik, lejárt vagy ellentmondásos;
- ha a kérdés jogi, pénzügyi vagy szerződéses döntést igényel;
- ha személyes adat jelenik meg, de a rendszer erre nincs dokumentáltan felkészítve;
- ha a chatbot bizonytalan vagy az ügyfél emberi ügyintézőt kér.

### Jogi és szakmai alapok

- Az AI Act 50. cikk (1) és (5) alapján az ügyfelet világosan, megkülönböztethetően, hozzáférhetően és legkésőbb az első interakciókor tájékoztatni kell arról, hogy MI-rendszerrel kommunikál: [Regulation (EU) 2024/1689 – consolidated text](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:02024R1689-20260727).
- Az AI Act 4. cikke alapján a működtetésben részt vevő személyek feladatához és a használat körülményeihez igazodó MI-ismereti intézkedés szükséges: [Regulation (EU) 2024/1689 – consolidated text](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:02024R1689-20260727).
- Ha személyes adatot kezelnek, a célhoz kötöttség, adattakarékosság és beépített adatvédelem követelménye alkalmazandó: [GDPR 5. és 25. cikk](https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng).
- Az energetikai információnak a hatályos, egységes üzletszabályzattal és hivatalos forrásokkal összhangban kell állnia: [2007. évi LXXXVI. törvény 56/A. §](https://njt.hu/jogszabaly/2007-86-00-00).
- A megtévesztő vagy lényeges információt elhallgató kereskedelmi gyakorlat tilos: [2008. évi XLVII. törvény 3., 6–7. §](https://njt.hu/jogszabaly/2008-47-00-00).

### Auditdöntés

A profil funkcióhatára megfelelő. A profilt azonban csak az alábbi javítások után lehet hitelesítettnek jelölni:

1. a személyesadat-kezelést részletes, gépi tényekkel kell meghatározni;
2. a GDPR-modulokat ezekhez a tényekhez kell kötni;
3. a profilfeltételek egyetlen közös jelölése helyett a kritikus állításokat külön kell bizonyítani;
4. a javítás után új szabályzatverziót kell készíteni és összehasonlítani a jelenlegi 20 fejezetes változattal.

## A nyolc profil egységes validációjának eredménye

Dátum: 2026-08-15  
Validáció típusa: adatmodell-, konzisztencia-, szabálykapu- és forráskapcsolati ellenőrzés

| Profil | Kötelező funkciók | Profilspecifikus modul | Gépi eredmény |
|---|---:|---|---|
| Általános energetikai tájékoztatás | 2 | ellenőrzött energetikai tudásforrás | megfelelő, új kezelői megerősítés szükséges |
| Számla- és fogyasztási ügyintézés | 5 | számlázási és mérési követelmények | megfelelő, új kezelői megerősítés szükséges |
| Mérőállás rögzítése | 5 | számlázási/mérési követelmény és bevitel-visszaigazolás | megfelelő, új kezelői megerősítés szükséges |
| Panasz és kérelem fogadása | 4 | fogyasztói panaszkezelés | megfelelő, új kezelői megerősítés szükséges |
| Tartozási és kikapcsolási tájékoztatás | 4 | kikapcsolási és visszakapcsolási követelmények | megfelelő, új kezelői megerősítés szükséges |
| Védendő fogyasztói ügyek támogatása | 3 | védendő fogyasztói követelmények | megfelelő, új kezelői megerősítés szükséges |
| Kombinált energetikai ügyfélszolgálat | 2 alap + legalább 2 üzleti | a kiválasztott funkciók moduljainak uniója | megfelelő, funkciónként determinisztikus |
| Komplex energetikai ügyfélszolgálat | 9 | minden energetikai ügyfélszolgálati modul | megfelelő, új kezelői megerősítés szükséges |

### Egységes adatvédelmi döntés

A `CUSTOMER_CHATBOT` típus konzervatív alapértelmezése szerint felhasználói szabad szöveget dolgoz fel, ezért `processes_personal_data = true`. Ez nem jelenti automatikusan személyes ügyfélfiók elérését. A két fogalom külön gépi tényként szerepel:

- `processes_personal_data`: a felhasználói bemenet vagy technikai adat kezelése;
- `accesses_personal_account_data`: azonosított ügyfél fiók-, szerződés-, számla- vagy fogyasztási adatának elérése.

A GDPR-modulok az első tényhez, az ügyfél-azonosítás és az egyedi ügyintézés a másodikhoz kapcsolódik. A nemzetközi adattovábbítás modul csak `international_data_transfer = true` esetén választható ki; külső szolgáltató használatából ezt nem szabad bizonyíték nélkül feltételezni.

### Újraigazolási kapu

A profilok lényeges definíciója megváltozott, ezért minden aktív rendszer korábbi profilmegerősítése érvényét vesztette. A szabályzatkészítő kapu addig nem enged új szabályzatot, amíg a felhasználó a Szerkesztés oldalon át nem tekinti és meg nem erősíti az új feltételeket. A megerősítés után a rendszer a kiválasztott funkciókból tisztán újraépíti a tényeket.

### Automatikus ellenőrzések

- kötelező, választható és tiltott funkcióhalmazok átfedése: **0**;
- nem létező vagy inaktív funkciókód a profilokban: **0**;
- kötelező funkcióhiány a jelenlegi aktív rendszerekben: **0**;
- profilhoz nem engedélyezett funkció a jelenlegi aktív rendszerekben: **0**;
- jogi követelmény szabályrekord nélkül: **0**;
- jogi követelmény hivatalos forráskapcsolat nélkül: **0**.

### Minősítés értelmezése

A nyolc profil a belső adatmodell és a determinisztikus szabálymotor szintjén konzisztens és tesztelhető. A dokumentum nem helyettesíti a vállalati jogi vagy megfelelőségi szakértő jóváhagyását. Éles vállalati alkalmazás előtt a hivatalos jogforrások aktuális szövegét, a vállalat üzletszabályzatát és a tényleges technikai adatfolyamot is jóvá kell hagyatni.

## Javítási sorrend

1. Régi kérdőívből maradt származtatott tények biztonságos eltávolítása – **kész**.
2. Kötelező, választható és tiltott funkciók adatmodelljének kialakítása – **kész**.
3. Kombinált és komplex profil közötti átfedés megszüntetése – **kész**.
4. Generatív működés leválasztása az üzleti profilokról – **kész**.
5. Profilonkénti kötelező tények és kizáró feltételek gépi rögzítése – **kész**.
6. Jogi források és szabálymodulok tételes auditja – **következő auditfázis**.

## Auditkövetkeztetés

A profilkapu megakadályozza az ismeretlen, inaktív, más iparághoz vagy rendszertípushoz tartozó profil használatát, továbbá ellenőrzi a kötelező, választható és tiltott funkciókat. A korábbi kérdőívből maradt tények eltávolítása és a profilhatárok gépi rögzítése megtörtént.

A profilaudit technikai és determinisztikus szakasza lezárható. A következő fázis a szabálymodulok jogi tartalmának és pontos cikkhivatkozásainak tételes ellenőrzése, majd az automatizált szabálymotor tesztkészlete.
