-- EnergiaAI Kontroll – a 27 legrégebbi modul szövegének újraírása.
--
-- MIÉRT
-- Ezek a modulok akkor készültek, amikor még ügyfélszolgálati chatbot volt az
-- egyetlen tervezett eszköz. A szövegük ezért nem csak a „chatbot” szót
-- használta, hanem beszélgetést, választ és ügyfélszolgálati folyamatot is
-- feltételezett. Az elv viszont az, hogy a szabály funkcióhoz kötődik, nem
-- eszköztípushoz – a szövegnek ezt kell tükröznie.
--
-- HOGYAN
-- Minden szöveg újra lett fogalmazva a jogalapból kiindulva, nem a régi
-- mondat foltozásával. Az általános (törzs) modulok eszközfüggetlenek:
-- „kimenet”, „érintett”, „emberi felülvizsgálat”. Az energetikai modulokban a
-- „felhasználó” és az „ügyintéző” megmarad, mert a VET és a Vhr. tényleg a
-- felhasználói kapcsolattartást szabályozza – de ott sem feltételezünk
-- beszélgető rendszert.
--
-- MI NEM VÁLTOZIK
-- Jogalap, feltételek, szerepkör, hatály, verzió, modulkód. Csak a szöveg.
-- A törvényszöveghez semmi nem nyúl.
--
-- ELLENŐRZÉS UTÁNA (mindkettőnek nullát kell adnia):
--   select count(*) from aic_policy_modules where full_text_template ilike '%chatbot%';
--   select count(*) from aic_policy_modules where summary_text ilike '%chatbot%';
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ===========================================================================
-- TÖRZS – MI-rendelet
-- ===========================================================================

update aic_policy_modules set
 summary_text = 'A szabályzat meghatározza a rendszer jogszerű, átlátható és ellenőrzött működésének kereteit.',
 full_text_template = 'Jelen szabályzat a(z) {{organisation_name}} által alkalmazott {{system_name}} tervezésére, üzemeltetésére, felügyeletére és változáskezelésére terjed ki. A rendszer kizárólag a nyilvántartott, dokumentált rendeltetése szerinti feladatra használható. A rendszer nem jogosult önállóan szerződést kötni vagy módosítani, fizetést jóváhagyni, tartozást megállapítani, szolgáltatás megszüntetéséről vagy visszaállításáról dönteni, illetve hatósági vagy jogi állásfoglalást adni.',
 updated_at = now()
where module_code = 'CHATBOT_PURPOSE_SCOPE';

update aic_policy_modules set
 summary_text = 'A rendszer besorolása a tényleges rendeltetésből és funkciókból vezethető le, és minden lényeges változáskor újraértékelendő.',
 full_text_template = 'A {{system_name}} dokumentált rendeltetése a nyilvántartásban rögzített feladat. A rendszer nem hoz joghatással járó döntést, nem végez biometrikus kategorizálást vagy érzelemfelismerést, és nem használható az MI-rendelet III. melléklete szerinti nagy kockázatú célra külön besorolás és megfelelőségi vizsgálat nélkül. Új funkció vagy rendeltetésváltozás előtt a besorolást ismételten el kell végezni, és annak eredményét dokumentálni kell.',
 updated_at = now()
where module_code = 'CHATBOT_AI_ACT_CLASSIFICATION';

update aic_policy_modules set
 summary_text = 'A rendszer gazdáját, tartalomgazdáját, adatvédelmi és információbiztonsági felelősét, valamint az emberi felügyelet felelősét ki kell jelölni.',
 full_text_template = 'A(z) {{organisation_name}} írásban kijelöli a(z) {{system_name}} gazdáját, a rendszer által használt adat- és tudásforrások tartalomgazdáját, az adatvédelmi és információbiztonsági kapcsolattartót, valamint az emberi felügyeletet ellátó felelőst. A szerepköröknek ki kell terjedniük a jóváhagyásra, a hozzáférés-kezelésre, a tesztelésre, az incidenskezelésre és a felülvizsgálatra. A kijelölt személyeknek rendelkezniük kell a feladatuk ellátásához szükséges hatáskörrel és erőforrással. A rendszer kimenete nem írhatja felül a kijelölt emberi felelős döntését.',
 updated_at = now()
where module_code = 'CHATBOT_ROLES_RESPONSIBILITIES';

update aic_policy_modules set
 summary_text = 'A rendszer működtetésében részt vevő munkatársaknak a feladatukhoz és a rendszer kockázataihoz igazított MI-ismeretekkel kell rendelkezniük.',
 full_text_template = 'A(z) {{organisation_name}} biztosítja, hogy a(z) {{system_name}} működtetésében, felügyeletében, a kimenetek ellenőrzésében és az érintettekkel való kapcsolattartásban részt vevő munkatársak megfelelő MI-ismeretekkel rendelkezzenek. A felkészítésnek ki kell térnie a rendszer rendeltetésére és korlátaira, a hibás vagy megalapozatlan kimenet felismerésére, a személyes adatok biztonságos kezelésére, az emberi felülvizsgálat rendjére és az incidensek jelentésére. A felkészítés megtörténtét és lényeges tartalmát dokumentálni kell, a rendszer vagy a szabályozás jelentős változásakor pedig meg kell ismételni.',
 updated_at = now()
where module_code = 'CHATBOT_AI_LITERACY';

update aic_policy_modules set
 summary_text = 'A rendszer nem alkalmazhat tiltott manipulatív technikát, és nem használhatja ki az érintett sérülékenységét.',
 full_text_template = 'A {{system_name}} nem alkalmazhat tudatküszöb alatti, célzottan manipulatív vagy megtévesztő technikát, és nem használhatja ki az életkorból, fogyatékosságból vagy szociális-gazdasági helyzetből eredő sérülékenységet az MI-rendelet 5. cikkében tiltott módon. A rendszer kimeneteit, ajánlásait és a hozzájuk kapcsolódó folyamatokat ennek kizárására tesztelni és rendszeresen felül kell vizsgálni. A vizsgálat módszerét és eredményét dokumentálni kell.',
 updated_at = now()
where module_code = 'CHATBOT_PROHIBITED_PRACTICES';

update aic_policy_modules set
 summary_text = 'Az érintettet tájékoztatni kell arról, hogy MI-rendszerrel áll kapcsolatban.',
 full_text_template = 'A(z) {{system_name}} igénybevételekor, még az érdemi interakció előtt világosan és közérthetően jelezni kell az érintett számára, hogy mesterséges intelligencián alapuló rendszerrel áll kapcsolatban. Ha a(z) {{organisation_name}} a rendszer szolgáltatója, ez az MI-rendelet 50. cikk (1) bekezdése szerinti közvetlen kötelezettség. Ha kizárólag alkalmazó, a szolgáltató megoldását szerződésben és működés közben ellenőriznie kell, a megjelenítést pedig bizonyíthatóan tesztelnie. A tájékoztatásnak érzékelhetőnek és akadálymentesen hozzáférhetőnek kell lennie.',
 updated_at = now()
where module_code = 'CHATBOT_INTERACTION_NOTICE';

update aic_policy_modules set
 summary_text = 'Az érintett számára biztosítani kell az emberi közreműködés kérésének lehetőségét.',
 full_text_template = 'A(z) {{system_name}} nem akadályozhatja meg, hogy az érintett emberi közreműködést kérjen. Az emberi eljárásra való áttérést biztosítani kell, ha az érintett ezt kéri, ha a rendszer nem képes megalapozott kimenetet adni, továbbá ha az ügy panaszt, vitatott követelést, szerződéses vagy fizetési döntést, sérülékeny érintettet, biztonsági eseményt vagy más kiemelt kockázatú helyzetet érint. Az áttéréskor az érintettet tájékoztatni kell arról, mi történik, és kizárólag az ügy elintézéséhez szükséges adat adható át.',
 updated_at = now()
where module_code = 'CHATBOT_HUMAN_HANDOFF';

update aic_policy_modules set
 summary_text = 'A rendszer csak ellenőrzött információt közölhet, a bizonytalanságot nem rejtheti el.',
 full_text_template = 'A {{system_name}} kimenete nem tartalmazhat megalapozatlan árat, határidőt, jogosultságot, adatot, szerződéses feltételt vagy ügyállapotot. A kimenethez lehetőség szerint fel kell tüntetni a forrást és az érvényesség idejét. Bizonytalan, ellentmondó vagy hiányzó adat esetén a rendszer ezt egyértelműen jelzi, nem tesz kategorikus állítást, és emberi felülvizsgálatra irányít.',
 updated_at = now()
where module_code = 'CHATBOT_RESPONSE_ACCURACY';

update aic_policy_modules set
 summary_text = 'Csak azonosított, hatályos és jóváhagyott forrás kerülhet a rendszer adat- és tudásbázisába.',
 full_text_template = 'A {{system_name}} kimenetének forrási sorrendje: hatályos jogszabály; hatósági követelmény; jóváhagyott és hatályos belső szabályzat; ellenőrzött szervezeti eljárás és tájékoztató. Minden forrásnál nyilván kell tartani a tulajdonost, a verziót, a hatálybalépést, a felülvizsgálat idejét és a visszavonást. Ellentmondás, hiányzó vagy lejárt forrás esetén a rendszer nem pótolhatja becsléssel, hanem emberi felülvizsgálatra irányít.',
 updated_at = now()
where module_code = 'CHATBOT_SOURCE_GOVERNANCE';

update aic_policy_modules set
 summary_text = 'A rendszer hibáit, incidenseit és lényeges változásait dokumentált folyamatban kell kezelni és rendszeresen felülvizsgálni.',
 full_text_template = 'A(z) {{organisation_name}} dokumentált eljárást működtet a(z) {{system_name}} hibás, félrevezető, jogsértő vagy nem megfelelő kimeneteinek bejelentésére, kivizsgálására és javítására. A naplózásnak arányosnak kell lennie, és nem vezethet szükségtelen személyesadat-kezeléshez. Súlyos vagy ismétlődő hiba esetén az érintett funkciót korlátozni vagy fel kell függeszteni. A rendszer működését, adat- és tudásforrásait, tájékoztatóit, emberi felülvizsgálati folyamatát és szabályzati megfelelését rendszeresen, valamint minden lényeges változás után felül kell vizsgálni. A vizsgálatok eredményét, a javító intézkedéseket és azok lezárását meg kell őrizni.',
 updated_at = now()
where module_code = 'CHATBOT_MONITORING_REVIEW';

update aic_policy_modules set
 summary_text = 'A rendszer felülete és tájékoztatásai akadálymentesen használhatók.',
 full_text_template = 'Ha a(z) {{organisation_name}} és a(z) {{system_name}} a 2022. évi XVII. törvény tárgyi és személyi hatálya alá tartozik, a rendszer felületének érzékelhetőnek, kezelhetőnek, érthetőnek és stabilnak, valamint a támogató technológiákkal együttműködőnek kell lennie. A billentyűzetes használatot, a képernyőolvasós értelmezhetőséget, a kontrasztot, a hibaüzeneteket, az MI-jelzést, az adatkezelési tájékoztatást és az emberi eljárásra való áttérést dokumentált vizsgálatokkal kell ellenőrizni.',
 updated_at = now()
where module_code = 'CHATBOT_ACCESSIBILITY';

-- ===========================================================================
-- TÖRZS – GDPR és fogyasztóvédelem
-- ===========================================================================

update aic_policy_modules set
 summary_text = 'A rendszer csak meghatározott célból és a szükséges mértékben kezelhet személyes adatot; az érintettet tájékoztatni kell.',
 full_text_template = 'A(z) {{organisation_name}} a(z) {{system_name}} útján kizárólag előre meghatározott, jogszerű célból és a szükséges mértékben kezel személyes adatot. Az érintettet a rendszer használatának megkezdése előtt vagy az adatfelvételkor tájékoztatni kell az adatkezelő személyéről, az adatkezelés céljáról és jogalapjáról, a megőrzési időről, az adatfeldolgozókról, az esetleges adattovábbításról és az érintetti jogokról. A rendszer nem kérhet olyan különleges vagy a feladat ellátásához szükségtelen adatot, amelynek kezelésére nincs megfelelő jogalap és védelem. A működés során keletkező naplókhoz való hozzáférést korlátozni, a megőrzési időt meghatározni, a törlést pedig ellenőrizhetően végrehajtani kell.',
 updated_at = now()
where module_code = 'CHATBOT_DATA_PROTECTION';

update aic_policy_modules set
 summary_text = 'Minden adatkezelési célhoz dokumentált jogalap és minimális adatkör szükséges.',
 full_text_template = 'A(z) {{organisation_name}} a {{system_name}} minden adatkezelési célját, jogalapját, adatkörét, címzettjét és megőrzési idejét előzetesen rögzíti. A rendszer kizárólag az adott feladat ellátásához szükséges adatot kezelheti. Különleges személyes adat, belépési jelszó, teljes bankkártyaadat vagy szükségtelen azonosító bekérése tilos. Az érintettektől származó adat modellfejlesztési vagy másodlagos célú felhasználása csak külön dokumentált jogalappal és feltételekkel történhet.',
 updated_at = now()
where module_code = 'CHATBOT_LAWFUL_DATA_PROCESSING';

update aic_policy_modules set
 title = 'Adatkezelési tájékoztatás',
 summary_text = 'Az érintett a személyes adat megadása előtt érthető adatkezelési tájékoztatást kap.',
 full_text_template = 'A {{system_name}} felületéről közvetlenül elérhető adatkezelési tájékoztató ismerteti az adatkezelőt, a célokat és jogalapokat, az adatok körét, a megőrzési időt, az adatfeldolgozókat és adattovábbításokat, az érintetti jogokat, a panasz lehetőségét, valamint az automatizált döntéshozatal meglétét vagy hiányát. A rövid első réteg közérthető, a részletes tájékoztató pedig tartósan hozzáférhető legyen.',
 updated_at = now()
where module_code = 'CHATBOT_PRIVACY_NOTICE';

update aic_policy_modules set
 summary_text = 'A rendszer naplóihoz a hozzáférés korlátozott, a megőrzés indokolt, a törlés ellenőrizhető.',
 full_text_template = 'A {{system_name}} működése során keletkező naplókhoz csak feladathoz kötött jogosultsággal lehet hozzáférni. A szervezet dokumentált megőrzési és törlési szabályt, naplóellenőrzést, titkosítást, mentést és incidenseljárást alkalmaz. A külső modell- vagy felhőszolgáltató adatfeldolgozói szerepét, adattárolási helyét, alvállalkozóit és felhasználási feltételeit szerződésben és rendszeres felülvizsgálatban kell kezelni.',
 updated_at = now()
where module_code = 'CHATBOT_DATA_SECURITY_RETENTION';

update aic_policy_modules set
 summary_text = 'A rendszer adatkezelésének kockázata alapján dokumentáltan el kell dönteni, szükséges-e adatvédelmi hatásvizsgálat.',
 updated_at = now()
where module_code = 'CHATBOT_DPIA_SCREENING';

update aic_policy_modules set
 summary_text = 'A rendszerhez kapcsolódó személyesadat-incidens dokumentált értékelési és jelentési folyamatba kerül.',
 full_text_template = 'A {{system_name}} adatait, naplóit, integrációit vagy hozzáféréseit érintő jogosulatlan hozzáférést, adatvesztést, adatszivárgást vagy téves címzettnek történő közlést haladéktalanul incidensfolyamatba kell adni. A szervezet dokumentálja az eseményt, értékeli az érintetti kockázatot, és a GDPR feltételei szerint teljesíti a hatósági vagy érintetti értesítést.',
 updated_at = now()
where module_code = 'CHATBOT_PRIVACY_INCIDENT';

update aic_policy_modules set
 summary_text = 'A GDPR 9. cikke szerinti különleges adat csak külön jogalappal és fokozott garanciákkal kezelhető.',
 full_text_template = 'Ha a {{system_name}} egészségi állapotra, fogyatékosságra vagy más, a GDPR 9. cikke szerinti különleges adatra utaló információt kezel, a {{organisation_name}} előzetesen dokumentálja a 6. és 9. cikk szerinti jogalapot, a pontos célt, a minimális adatmezőket, a hozzáférési szerepköröket, a címzetteket, az adattípusonkénti megőrzést és az ellenőrzött törlést. A rendszer nem kérhet be diagnózist vagy teljes igazolást, ha a cél szűkebb adattal is elérhető, és jogosultságot nem állapíthat meg.',
 updated_at = now()
where module_code = 'CHATBOT_SPECIAL_CATEGORY_DATA';

update aic_policy_modules set
 summary_text = 'Az érintett adatvédelmi kérelme ellenőrzött csatornára kerül, a rendszer nem dönt róla.',
 full_text_template = 'A {{system_name}} felismeri az adatvédelmi joggyakorlásra irányuló kérelmet, de nem hoz önálló döntést annak teljesítéséről vagy elutasításáról. A kérelmet azonosítható és biztonságos folyamatba továbbítja; az érintett tájékoztatást kap a kapcsolattartási csatornáról és a válaszadás határidejéről. Az azonosítás nem járhat szükségtelen új adat bekérésével.',
 updated_at = now()
where module_code = 'CHATBOT_DATA_SUBJECT_RIGHTS';

update aic_policy_modules set
 summary_text = 'A rendszer felismeri a panaszszándékot, de az érdemi panaszkezelést ellenőrzött folyamatba adja át.',
 full_text_template = 'Ha az érintett fogyasztói panaszt, vitatást vagy jogorvoslati igényt jelez, a {{system_name}} azt nem kezelheti egyszerű tájékoztatási kérdésként, és általános kérelmet nem minősíthet automatikusan panasznak. A panasz befogadásához csak a szükséges adatot kérheti. Elektronikus fogadáskor haladéktalan visszaigazolást és egyedi ügyazonosítót ad, majd emberi panaszkezelésbe továbbít. Az írásbeli panaszt főszabály szerint harminc napon belül érdemben és igazolható módon meg kell válaszolni, az elutasítást indokolni és a jogorvoslati fórumokról tájékoztatni kell; a panaszt és a választ három évig meg kell őrizni. Ágazati rövidebb határidő esetén a szigorúbb szabály alkalmazandó.',
 updated_at = now()
where module_code = 'CHATBOT_COMPLAINT_PROCESS';

update aic_policy_modules set
 full_text_template = replace(full_text_template, 'a beszélgetési és interakciós naplókat', 'az interakciós és használati naplókat'),
 updated_at = now()
where module_code = 'GDPR_CONTROLLER_ROLES';

update aic_policy_modules set
 full_text_template = replace(full_text_template, 'a beszélgetési vagy interakciós naplókat', 'az interakciós és használati naplókat'),
 updated_at = now()
where module_code = 'GDPR_PROCESSING_RECORDS';

-- ===========================================================================
-- ENERGETIKA
-- A felhasználó és az ügyintéző megmarad: a VET és a Vhr. tényleg a
-- felhasználói kapcsolattartást szabályozza. Beszélgető rendszert viszont
-- ezek sem feltételeznek.
-- ===========================================================================

update aic_policy_modules set
 summary_text = 'Belső kontroll biztosítja, hogy a rendszer energetikai kimenetei hatályos és jóváhagyott forrásokon alapuljanak.',
 full_text_template = 'A {{system_name}} energetikai tárgyú kimenetei kizárólag a hatályos villamosenergia-jogszabályokból, a MEKH által jóváhagyott és közzétett üzletszabályzatból, valamint ellenőrzött vállalati tájékoztatókból készülhetnek. A rendszer nem módosíthatja és nem egyszerűsítheti félrevezetően a jogosultsági, elszámolási vagy határidőszabályokat. A felhasználó számára jelezni kell, hol érhető el az irányadó üzletszabályzat és a hivatalos tájékoztatás.',
 updated_at = now()
where module_code = 'ENERGY_CONTROLLED_INFORMATION';

update aic_policy_modules set
 summary_text = 'Egyedi számla- és mérési ügyben csak hiteles adatkapcsolat vagy emberi ügyintéző adhat érdemi tájékoztatást.',
 full_text_template = 'Általános számlamagyarázat kizárólag ellenőrzött tudásforrásból adható. Konkrét számla, fogyasztási vagy mérési adat csak megfelelő azonosítás, mezőszintű jogosultság-ellenőrzés, hiteles rendszerkapcsolat és időbélyeges lekérdezés alapján jeleníthető meg. A VET 56/A. §, a Vhr. 21/A. §, okosmérő esetén a 14/C. §, valamint harmadik félnek történő adatátadásnál a 27/B. § alkalmazási feltételeit külön kell vizsgálni. Egyetemes szolgáltatási jogviszonyban a Vhr. 1. számú melléklet 4.1–4.11. és 5.1–5.5. pontja is irányadó. A rendszer számlát vagy mérési adatot nem módosíthat, ellenőrzött adat hiányában nem becsülhet, és a vitás ügyet emberi ügyintézőhöz továbbítja.',
 updated_at = now()
where module_code = 'ENERGY_BILLING_METERING';

update aic_policy_modules set
 summary_text = 'A rendszer nem hozhat vagy közölhet önálló joghatású döntést kikapcsolási és visszakapcsolási ügyben.',
 full_text_template = 'Kikapcsolással, visszakapcsolással vagy tartozási státusszal kapcsolatos egyedi tájékoztatást a {{system_name}} csak azonosítás, jogosultság-ellenőrzés és időbélyeges, hiteles háttérrendszeri lekérdezés után adhat. A kikapcsolás fő eljárási szabályait a VET 47. § és a Vhr. 24–25. §, a tartozás rendezése utáni visszakapcsolást a Vhr. 22/C. § alapján kell kezelni. A Vhr. 26. § csak kereskedőváltási ügyben alkalmazható. A rendszer tartozást nem állapíthat meg, kikapcsolást vagy visszakapcsolást nem rendelhet el, fizetési könnyítésről nem dönthet, és vitás vagy elavult státusz esetén emberi ügyintézőhöz továbbít.',
 updated_at = now()
where module_code = 'ENERGY_DISCONNECTION_RECONNECTION';

update aic_policy_modules set
 summary_text = 'A rendszer kereskedőváltásnál csak azonosítás után adhat egyedi tájékoztatást, és a váltást nem igazolhatja vissza.',
 full_text_template = 'A {{organisation_name}} biztosítja, hogy a {{system_name}} kereskedőváltással kapcsolatos egyedi tájékoztatást – így különösen a felmondás szerződéses feltételeiről, a lejárt tartozásról, a záró mérőállásról, a pénzügyi biztosíték összegéről és a váltás határidőiről – kizárólag azonosítás és jogosultság-ellenőrzés után, hiteles háttérrendszeri adat alapján ad. A rendszer nem tántoríthatja el a felhasználót a váltástól és nem késleltetheti azt. A váltás visszaigazolása és a hálózati engedélyes felé tett bejelentés kizárólag emberi ügyintéző hatásköre; ezekről a rendszer nem tehet a {{organisation_name}}-t kötelező nyilatkozatot. Ha a felhasználó a váltás akadályát jelzi, az ügyet emberi ügyintézőhöz kell továbbítani.',
 updated_at = now()
where module_code = 'ENERGY_SUPPLIER_SWITCH';

update aic_policy_modules set
 summary_text = 'A védendő fogyasztói státuszt érintő ügyet a rendszer nem dönti el, hanem biztonságos emberi folyamatba továbbítja.',
 full_text_template = 'Ha a felhasználó szociális rászorultságra, fogyatékosságra, védendő fogyasztói státuszra vagy kapcsolódó kedvezményre hivatkozik, a {{system_name}} kizárólag a VET 64–65. § és a Vhr. 30–36. § szerinti hivatalos eljárásról adhat tájékoztatást. Külön kell kezelni az általános tájékoztatást, az igazolás befogadását, a nyilvántartásba vételt, a fizetési könnyítést és a különleges szolgáltatás igénylését. A rendszer jogosultságot nem állapíthat meg, szükségtelen különleges adatot nem kérhet, és az egyedi ügyet megfelelően azonosított, hozzáférésre jogosult emberi ügyintézőhöz továbbítja.',
 updated_at = now()
where module_code = 'ENERGY_VULNERABLE_CUSTOMER';

update aic_policy_modules set
 summary_text = 'A hatály alá tartozó energetikai szervezet a rendszert a kiberbiztonsági irányításába integrálja.',
 full_text_template = 'Amennyiben a {{organisation_name}} a 2024. évi LXIX. törvény hatálya alá tartozó szervezet, és a {{system_name}} az érintett elektronikus információs rendszer része, a rendszert, a kapcsolódó API-kat, adat- és tudásbázisokat, adminisztrációs felületeket és külső szolgáltatókat be kell vonni a kockázatkezelésbe és a biztonsági osztályba sorolásba. A hozzáférés-, sebezhetőség-, változás-, napló-, folytonossági, beszállítói és incidenskezelési kontrollokat kockázatarányosan kell kialakítani.',
 updated_at = now()
where module_code = 'ENERGY_CYBERSECURITY';

update aic_policy_modules set
 full_text_template = 'A {{system_name}} a mérőállás továbbítása előtt ellenőrzi a felhasználó és a mérési pont összerendelését, a mérőazonosítót, a formátumot, a mértékegységet, a korábbi értékhez viszonyított ésszerűséget és a duplikációt. A felhasználó a továbbítás előtt összefoglalót kap és megerősíti az adatot. A rendszer a sikeres vagy sikertelen továbbításról időbélyeges bizonylatot és ügyazonosítót ad. Csökkenő, kirívó, ellentmondásos vagy vitatott értéket nem fogadhat el elszámolási döntésként, hanem emberi ügyintézőhöz továbbít.',
 updated_at = now()
where module_code = 'ENERGY_METER_READING_INTAKE';

update aic_policy_modules set
 full_text_template = 'A {{system_name}} a védendő fogyasztói ügyet egyszerű, érthető nyelven kezeli, támogatja a billentyűzetes és segítő technológiás használatot, nem kényszeríti a felhasználót szükségtelen különleges adat megadására, és működő csatornán megfelelően képzett emberi ügyintézőhöz továbbít. A hozzáférhető működést és az átadás időigényét rendszeresen tesztelni kell.',
 updated_at = now()
where module_code = 'ENERGY_VULNERABLE_ACCESSIBLE_HANDOFF';

commit;
