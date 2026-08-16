-- EnergiaAI Kontroll - jogszabalyszoveg betoltese.
-- Forras: https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun
-- CELEX: 32016R0679
-- Cikkek: 99
-- Bekezdesek: 372
-- Alpontok: 341
-- Ezt a fajlt a scripts/jogszabaly_betolto.py allitotta elo.
-- Futtatas: Supabase Dashboard -> SQL Editor.

begin;

select public.aic_upsert_legal_text(
  '32016R0679',
  '1',
  null,
  'Tárgy
(1) Ez a rendelet a természetes személyeknek a személyes adatok kezelése tekintetében történő védelmére és a személyes adatok szabad áramlására vonatkozó szabályokat állapít meg.

(2) Ez a rendelet a természetes személyek alapvető jogait és szabadságait és különösen a személyes adatok védelméhez való jogukat védi.

(3) A személyes adatok Unión belüli szabad áramlása nem korlátozható vagy tiltható meg a természetes személyeknek a személyes adatok kezelése tekintetében történő védelmével összefüggő okokból.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '1',
  '1',
  '(1) Ez a rendelet a természetes személyeknek a személyes adatok kezelése tekintetében történő védelmére és a személyes adatok szabad áramlására vonatkozó szabályokat állapít meg.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '1',
  '2',
  '(2) Ez a rendelet a természetes személyek alapvető jogait és szabadságait és különösen a személyes adatok védelméhez való jogukat védi.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '1',
  '3',
  '(3) A személyes adatok Unión belüli szabad áramlása nem korlátozható vagy tiltható meg a természetes személyeknek a személyes adatok kezelése tekintetében történő védelmével összefüggő okokból.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '2',
  null,
  'Tárgyi hatály
(1) E rendeletet kell alkalmazni a személyes adatok részben vagy egészben automatizált módon történő kezelésére, valamint azoknak a személyes adatoknak a nem automatizált módon történő kezelésére, amelyek valamely nyilvántartási rendszer részét képezik, vagy amelyeket egy nyilvántartási rendszer részévé kívánnak tenni.

(2) E rendelet nem alkalmazandó a személyes adatok kezelésére, ha azt:

a)

az uniós jog hatályán kívül eső tevékenységek során végzik;

b)

a tagállamok az EUSZ V. címe 2. fejezetének hatálya alá tartozó tevékenységek során végzik;

c)

természetes személyek kizárólag személyes vagy otthoni tevékenységük keretében végzik;

d)

az illetékes hatóságok bűncselekmények megelőzése, nyomozása, felderítése, vádeljárás lefolytatása vagy büntetőjogi szankciók végrehajtása céljából végzik, ideértve a közbiztonságot fenyegető veszélyekkel szembeni védelmet és e veszélyek megelőzését.

(3) A személyes adatok uniós intézmények, szervek, hivatalok és ügynökségek általi kezelésére a 45/2001/EK rendeletet kell alkalmazni. A 45/2001/EK rendeletet, valamint a személyes adatok ilyen kezelésére vonatkozó egyéb uniós jogi aktusokat a 98. cikkel összhangban hozzá kell igazítani az e rendeletben foglalt elvekhez és szabályokhoz.

(4) E rendelet nem érinti a 2000/31/EK irányelv alkalmazását, különösen az irányelv 12–15. cikkében foglalt, a közvetítő szolgáltatók felelősségére vonatkozó szabályokat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '2',
  '1',
  '(1) E rendeletet kell alkalmazni a személyes adatok részben vagy egészben automatizált módon történő kezelésére, valamint azoknak a személyes adatoknak a nem automatizált módon történő kezelésére, amelyek valamely nyilvántartási rendszer részét képezik, vagy amelyeket egy nyilvántartási rendszer részévé kívánnak tenni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '2',
  '2',
  '(2) E rendelet nem alkalmazandó a személyes adatok kezelésére, ha azt:

a)

az uniós jog hatályán kívül eső tevékenységek során végzik;

b)

a tagállamok az EUSZ V. címe 2. fejezetének hatálya alá tartozó tevékenységek során végzik;

c)

természetes személyek kizárólag személyes vagy otthoni tevékenységük keretében végzik;

d)

az illetékes hatóságok bűncselekmények megelőzése, nyomozása, felderítése, vádeljárás lefolytatása vagy büntetőjogi szankciók végrehajtása céljából végzik, ideértve a közbiztonságot fenyegető veszélyekkel szembeni védelmet és e veszélyek megelőzését.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '2',
  '2(a)',
  'a) az uniós jog hatályán kívül eső tevékenységek során végzik;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '2',
  '2(b)',
  'b) a tagállamok az EUSZ V. címe 2. fejezetének hatálya alá tartozó tevékenységek során végzik;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '2',
  '2(c)',
  'c) természetes személyek kizárólag személyes vagy otthoni tevékenységük keretében végzik;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '2',
  '2(d)',
  'd) az illetékes hatóságok bűncselekmények megelőzése, nyomozása, felderítése, vádeljárás lefolytatása vagy büntetőjogi szankciók végrehajtása céljából végzik, ideértve a közbiztonságot fenyegető veszélyekkel szembeni védelmet és e veszélyek megelőzését.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '2',
  '3',
  '(3) A személyes adatok uniós intézmények, szervek, hivatalok és ügynökségek általi kezelésére a 45/2001/EK rendeletet kell alkalmazni. A 45/2001/EK rendeletet, valamint a személyes adatok ilyen kezelésére vonatkozó egyéb uniós jogi aktusokat a 98. cikkel összhangban hozzá kell igazítani az e rendeletben foglalt elvekhez és szabályokhoz.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '2',
  '4',
  '(4) E rendelet nem érinti a 2000/31/EK irányelv alkalmazását, különösen az irányelv 12–15. cikkében foglalt, a közvetítő szolgáltatók felelősségére vonatkozó szabályokat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '3',
  null,
  'Területi hatály
(1) E rendeletet kell alkalmazni a személyes adatoknak az Unióban tevékenységi hellyel rendelkező adatkezelők vagy adatfeldolgozók tevékenységeivel összefüggésben végzett kezelésére, függetlenül attól, hogy az adatkezelés az Unió területén történik vagy nem.

(2) E rendeletet kell alkalmazni az Unióban tartózkodó érintettek személyes adatainak az Unióban tevékenységi hellyel nem rendelkező adatkezelő vagy adatfeldolgozó által végzett kezelésére, ha az adatkezelési tevékenységek:

a)

áruknak vagy szolgáltatásoknak az Unióban tartózkodó érintettek számára történő nyújtásához kapcsolódnak, függetlenül attól, hogy az érintettnek fizetnie kell-e azokért; vagy

b)

az érintettek viselkedésének megfigyeléséhez kapcsolódnak, feltéve hogy az Unió területén belül tanúsított viselkedésükről van szó.

(3) E rendeletet kell alkalmazni a személyes adatoknak a nem az Unióban, hanem olyan helyen tevékenységi hellyel rendelkező adatkezelő által végzett kezelésére, ahol a nemzetközi közjog értelmében valamely tagállam joga alkalmazandó.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_3'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '3',
  '1',
  '(1) E rendeletet kell alkalmazni a személyes adatoknak az Unióban tevékenységi hellyel rendelkező adatkezelők vagy adatfeldolgozók tevékenységeivel összefüggésben végzett kezelésére, függetlenül attól, hogy az adatkezelés az Unió területén történik vagy nem.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_3'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '3',
  '2',
  '(2) E rendeletet kell alkalmazni az Unióban tartózkodó érintettek személyes adatainak az Unióban tevékenységi hellyel nem rendelkező adatkezelő vagy adatfeldolgozó által végzett kezelésére, ha az adatkezelési tevékenységek:

a)

áruknak vagy szolgáltatásoknak az Unióban tartózkodó érintettek számára történő nyújtásához kapcsolódnak, függetlenül attól, hogy az érintettnek fizetnie kell-e azokért; vagy

b)

az érintettek viselkedésének megfigyeléséhez kapcsolódnak, feltéve hogy az Unió területén belül tanúsított viselkedésükről van szó.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_3'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '3',
  '2(a)',
  'a) áruknak vagy szolgáltatásoknak az Unióban tartózkodó érintettek számára történő nyújtásához kapcsolódnak, függetlenül attól, hogy az érintettnek fizetnie kell-e azokért; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_3'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '3',
  '2(b)',
  'b) az érintettek viselkedésének megfigyeléséhez kapcsolódnak, feltéve hogy az Unió területén belül tanúsított viselkedésükről van szó.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_3'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '3',
  '3',
  '(3) E rendeletet kell alkalmazni a személyes adatoknak a nem az Unióban, hanem olyan helyen tevékenységi hellyel rendelkező adatkezelő által végzett kezelésére, ahol a nemzetközi közjog értelmében valamely tagállam joga alkalmazandó.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_3'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '4',
  null,
  'Fogalommeghatározások
E rendelet alkalmazásában:

1. „személyes adat” : azonosított vagy azonosítható természetes személyre („érintett”) vonatkozó bármely információ; azonosítható az a természetes személy, aki közvetlen vagy közvetett módon, különösen valamely azonosító, például név, szám, helymeghatározó adat, online azonosító vagy a természetes személy testi, fiziológiai, genetikai, szellemi, gazdasági, kulturális vagy szociális azonosságára vonatkozó egy vagy több tényező alapján azonosítható;

2. „adatkezelés” : a személyes adatokon vagy adatállományokon automatizált vagy nem automatizált módon végzett bármely művelet vagy műveletek összessége, így a gyűjtés, rögzítés, rendszerezés, tagolás, tárolás, átalakítás vagy megváltoztatás, lekérdezés, betekintés, felhasználás, közlés továbbítás, terjesztés vagy egyéb módon történő hozzáférhetővé tétel útján, összehangolás vagy összekapcsolás, korlátozás, törlés, illetve megsemmisítés;

3. „az adatkezelés korlátozása” : a tárolt személyes adatok megjelölése jövőbeli kezelésük korlátozása céljából;

4. „profilalkotás” : személyes adatok automatizált kezelésének bármely olyan formája, amelynek során a személyes adatokat valamely természetes személyhez fűződő bizonyos személyes jellemzők értékelésére, különösen a munkahelyi teljesítményhez, gazdasági helyzethez, egészségi állapothoz, személyes preferenciákhoz, érdeklődéshez, megbízhatósághoz, viselkedéshez, tartózkodási helyhez vagy mozgáshoz kapcsolódó jellemzők elemzésére vagy előrejelzésére használják;

5. „álnevesítés” : a személyes adatok olyan módon történő kezelése, amelynek következtében további információk felhasználása nélkül többé már nem állapítható meg, hogy a személyes adat mely konkrét természetes személyre vonatkozik, feltéve hogy az ilyen további információt külön tárolják, és technikai és szervezési intézkedések megtételével biztosított, hogy azonosított vagy azonosítható természetes személyekhez ezt a személyes adatot nem lehet kapcsolni;

6. „nyilvántartási rendszer” : a személyes adatok bármely módon – centralizált, decentralizált vagy funkcionális vagy földrajzi szempontok szerint – tagolt állománya, amely meghatározott ismérvek alapján hozzáférhető;

7. „adatkezelő” : az a természetes vagy jogi személy, közhatalmi szerv, ügynökség vagy bármely egyéb szerv, amely a személyes adatok kezelésének céljait és eszközeit önállóan vagy másokkal együtt meghatározza; ha az adatkezelés céljait és eszközeit az uniós vagy a tagállami jog határozza meg, az adatkezelőt vagy az adatkezelő kijelölésére vonatkozó különös szempontokat az uniós vagy a tagállami jog is meghatározhatja;

8. „adatfeldolgozó” : az a természetes vagy jogi személy, közhatalmi szerv, ügynökség vagy bármely egyéb szerv, amely az adatkezelő nevében személyes adatokat kezel;

9. „címzett” : az a természetes vagy jogi személy, közhatalmi szerv, ügynökség vagy bármely egyéb szerv, akivel vagy amellyel a személyes adatot közlik, függetlenül attól, hogy harmadik fél-e. Azon közhatalmi szervek, amelyek egy egyedi vizsgálat keretében az uniós vagy a tagállami joggal összhangban férhetnek hozzá személyes adatokhoz, nem minősülnek címzettnek; az említett adatok e közhatalmi szervek általi kezelése meg kell, hogy feleljen az adatkezelés céljainak megfelelően az alkalmazandó adatvédelmi szabályoknak;

10. „harmadik fél” : az a természetes vagy jogi személy, közhatalmi szerv, ügynökség vagy bármely egyéb szerv, amely nem azonos az érintettel, az adatkezelővel, az adatfeldolgozóval vagy azokkal a személyekkel, akik az adatkezelő vagy adatfeldolgozó közvetlen irányítása alatt a személyes adatok kezelésére felhatalmazást kaptak;

11. „az érintett hozzájárulása” : az érintett akaratának önkéntes, konkrét és megfelelő tájékoztatáson alapuló és egyértelmű kinyilvánítása, amellyel az érintett nyilatkozat vagy a megerősítést félreérthetetlenül kifejező cselekedet útján jelzi, hogy beleegyezését adja az őt érintő személyes adatok kezeléséhez;

12. „adatvédelmi incidens” : a biztonság olyan sérülése, amely a továbbított, tárolt vagy más módon kezelt személyes adatok véletlen vagy jogellenes megsemmisítését, elvesztését, megváltoztatását, jogosulatlan közlését vagy az azokhoz való jogosulatlan hozzáférést eredményezi;

13. „genetikai adat” : egy természetes személy örökölt vagy szerzett genetikai jellemzőire vonatkozó minden olyan személyes adat, amely az adott személy fiziológiájára vagy egészségi állapotára vonatkozó egyedi információt hordoz, és amely elsősorban az említett természetes személyből vett biológiai minta elemzéséből ered;

14. „biometrikus adat” : egy természetes személy testi, fiziológiai vagy viselkedési jellemzőire vonatkozó minden olyan sajátos technikai eljárásokkal nyert személyes adat, amely lehetővé teszi vagy megerősíti a természetes személy egyedi azonosítását, ilyen például az arckép vagy a daktiloszkópiai adat;

15. „egészségügyi adat” : egy természetes személy testi vagy pszichikai egészségi állapotára vonatkozó személyes adat, ideértve a természetes személy számára nyújtott egészségügyi szolgáltatásokra vonatkozó olyan adatot is, amely információt hordoz a természetes személy egészségi állapotáról;

16. „tevékenységi központ” :

a)

az egynél több tagállamban tevékenységi hellyel rendelkező adatkezelő esetében az Unión belüli központi ügyvitelének helye, ha azonban a személyes adatok kezelésének céljaira és eszközeire vonatkozó döntéseket az adatkezelő egy Unión belüli másik tevékenységi helyén hozzák, és az utóbbi tevékenységi hely rendelkezik hatáskörrel az említett döntések végrehajtatására, az említett döntéseket meghozó tevékenységi helyet kell tevékenységi központnak tekinteni;

b)

az egynél több tagállamban tevékenységi hellyel rendelkező adatfeldolgozó esetében az Unión belüli központi ügyvitelének helye, vagy ha az adatfeldolgozó az Unióban nem rendelkezik központi ügyviteli hellyel, akkor az adatfeldolgozónak az az Unión belüli tevékenységi helye, ahol az adatfeldolgozó tevékenységi helyén folytatott tevékenységekkel összefüggésben végzett fő adatkezelési tevékenységek zajlanak, amennyiben az adatfeldolgozóra e rendelet szerint meghatározott kötelezettségek vonatkoznak;

17. „képviselő” : az az Unióban tevékenységi hellyel, illetve lakóhellyel rendelkező és az adatkezelő vagy adatfeldolgozó által a 27. cikk alapján írásban megjelölt természetes vagy jogi személy, aki, illetve amely az adatkezelőt vagy adatfeldolgozót képviseli az adatkezelőre vagy adatfeldolgozóra az e rendelet értelmében háruló kötelezettségek vonatkozásában;

18. „vállalkozás” : gazdasági tevékenységet folytató természetes vagy jogi személy, függetlenül a jogi formájától, ideértve a rendszeres gazdasági tevékenységet folytató személyegyesítő társaságokat és egyesületeket is;

19. „vállalkozáscsoport” : az ellenőrző vállalkozás és az általa ellenőrzött vállalkozások;

20. „kötelező erejű vállalati szabályok” : a személyes adatok védelmére vonatkozó szabályzat, amelyet az Unió valamely tagállamának területén tevékenységi hellyel rendelkező adatkezelő vagy adatfeldolgozó egy vagy több harmadik országban a személyes adatoknak az ugyanazon vállalkozáscsoporton vagy közös gazdasági tevékenységet folytató vállalkozások ugyanazon csoportján belüli adatkezelő vagy adatfeldolgozó részéről történő továbbítása vagy ilyen továbbítások sorozata tekintetében követ;

21. „felügyeleti hatóság” : egy tagállam által az 51. cikknek megfelelően létrehozott független közhatalmi szerv;

22. „érintett felügyeleti hatóság” : az a felügyeleti hatóság, amelyet a személyes adatok kezelése a következő okok valamelyike alapján érint:

a)

az adatkezelő vagy az adatfeldolgozó az említett felügyeleti hatóság tagállamának területén rendelkezik tevékenységi hellyel;

b)

az adatkezelés jelentős mértékben érinti vagy valószínűsíthetően jelentős mértékben érinti a felügyeleti hatóság tagállamában lakóhellyel rendelkező érintetteket; vagy

c)

panaszt nyújtottak be az említett felügyeleti hatósághoz;

23. „személyes adatok határokon átnyúló adatkezelése” :

a)

személyes adatoknak az Unióban megvalósuló olyan kezelése, amelyre az egynél több tagállamban tevékenységi hellyel rendelkező adatkezelő vagy adatfeldolgozó több tagállamban található tevékenységi helyein folytatott tevékenységekkel összefüggésben kerül sor; vagy

b)

személyes adatoknak az Unióban megvalósuló olyan kezelése, amelyre az adatkezelő vagy az adatfeldolgozó egyetlen tevékenységi helyén folytatott tevékenységekkel összefüggésben kerül sor úgy, hogy egynél több tagállamban jelentős mértékben érint vagy valószínűsíthetően jelentős mértékben érint érintetteket;

24. „releváns és megalapozott kifogás” : a döntéstervezettel szemben benyújtott, azzal kapcsolatos kifogás, hogy ezt a rendeletet megsértették-e, illetve hogy az adatkezelőre vagy az adatfeldolgozóra vonatkozó tervezett intézkedés összhangban van-e a rendelettel; a kifogásban egyértelműen be kell mutatni a döntéstervezet által az érintettek alapvető jogaira és szabadságaira, valamint adott esetben a személyes adatok Unión belüli szabad áramlására jelentett kockázatok jelentőségét;

25. „az információs társadalommal összefüggő szolgáltatás” : az (EU) 2015/1535 európai parlamenti és tanácsi irányelv ( 19 ) 1. cikke (1) bekezdésének b) pontja értelmében vett szolgáltatás;

26. „nemzetközi szervezet” : a nemzetközi közjog hatálya alá tartozó szervezet vagy annak alárendelt szervei, vagy olyan egyéb szerv, amelyet két vagy több ország közötti megállapodás hozott létre vagy amely ilyen megállapodás alapján jött létre.

II. FEJEZET

Elvek',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_4'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '5',
  null,
  'A személyes adatok kezelésére vonatkozó elvek
(1) A személyes adatok:

a)

kezelését jogszerűen és tisztességesen, valamint az érintett számára átlátható módon kell végezni („jogszerűség, tisztességes eljárás és átláthatóság”);

b)

gyűjtése csak meghatározott, egyértelmű és jogszerű célból történjen, és azokat ne kezeljék ezekkel a célokkal össze nem egyeztethető módon; a 89. cikk (1) bekezdésének megfelelően nem minősül az eredeti céllal össze nem egyeztethetőnek a közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból történő további adatkezelés („célhoz kötöttség”);

c)

az adatkezelés céljai szempontjából megfelelőek és relevánsak kell, hogy legyenek, és a szükségesre kell korlátozódniuk („adattakarékosság”);

d)

pontosnak és szükség esetén naprakésznek kell lenniük; minden észszerű intézkedést meg kell tenni annak érdekében, hogy az adatkezelés céljai szempontjából pontatlan személyes adatokat haladéktalanul töröljék vagy helyesbítsék („pontosság”);

e)

tárolásának olyan formában kell történnie, amely az érintettek azonosítását csak a személyes adatok kezelése céljainak eléréséhez szükséges ideig teszi lehetővé; a személyes adatok ennél hosszabb ideig történő tárolására csak akkor kerülhet sor, amennyiben a személyes adatok kezelésére a 89. cikk (1) bekezdésének megfelelően közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból kerül majd sor, az e rendeletben az érintettek jogainak és szabadságainak védelme érdekében előírt megfelelő technikai és szervezési intézkedések végrehajtására is figyelemmel („korlátozott tárolhatóság”);

f)

kezelését oly módon kell végezni, hogy megfelelő technikai vagy szervezési intézkedések alkalmazásával biztosítva legyen a személyes adatok megfelelő biztonsága, az adatok jogosulatlan vagy jogellenes kezelésével, véletlen elvesztésével, megsemmisítésével vagy károsodásával szembeni védelmet is ideértve („integritás és bizalmas jelleg”).

(2) Az adatkezelő felelős az (1) bekezdésnek való megfelelésért, továbbá képesnek kell lennie e megfelelés igazolására („elszámoltathatóság”).',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '5',
  '1',
  '(1) A személyes adatok:

a)

kezelését jogszerűen és tisztességesen, valamint az érintett számára átlátható módon kell végezni („jogszerűség, tisztességes eljárás és átláthatóság”);

b)

gyűjtése csak meghatározott, egyértelmű és jogszerű célból történjen, és azokat ne kezeljék ezekkel a célokkal össze nem egyeztethető módon; a 89. cikk (1) bekezdésének megfelelően nem minősül az eredeti céllal össze nem egyeztethetőnek a közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból történő további adatkezelés („célhoz kötöttség”);

c)

az adatkezelés céljai szempontjából megfelelőek és relevánsak kell, hogy legyenek, és a szükségesre kell korlátozódniuk („adattakarékosság”);

d)

pontosnak és szükség esetén naprakésznek kell lenniük; minden észszerű intézkedést meg kell tenni annak érdekében, hogy az adatkezelés céljai szempontjából pontatlan személyes adatokat haladéktalanul töröljék vagy helyesbítsék („pontosság”);

e)

tárolásának olyan formában kell történnie, amely az érintettek azonosítását csak a személyes adatok kezelése céljainak eléréséhez szükséges ideig teszi lehetővé; a személyes adatok ennél hosszabb ideig történő tárolására csak akkor kerülhet sor, amennyiben a személyes adatok kezelésére a 89. cikk (1) bekezdésének megfelelően közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból kerül majd sor, az e rendeletben az érintettek jogainak és szabadságainak védelme érdekében előírt megfelelő technikai és szervezési intézkedések végrehajtására is figyelemmel („korlátozott tárolhatóság”);

f)

kezelését oly módon kell végezni, hogy megfelelő technikai vagy szervezési intézkedések alkalmazásával biztosítva legyen a személyes adatok megfelelő biztonsága, az adatok jogosulatlan vagy jogellenes kezelésével, véletlen elvesztésével, megsemmisítésével vagy károsodásával szembeni védelmet is ideértve („integritás és bizalmas jelleg”).',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '5',
  '1(a)',
  'a) kezelését jogszerűen és tisztességesen, valamint az érintett számára átlátható módon kell végezni („jogszerűség, tisztességes eljárás és átláthatóság”);',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '5',
  '1(b)',
  'b) gyűjtése csak meghatározott, egyértelmű és jogszerű célból történjen, és azokat ne kezeljék ezekkel a célokkal össze nem egyeztethető módon; a 89. cikk (1) bekezdésének megfelelően nem minősül az eredeti céllal össze nem egyeztethetőnek a közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból történő további adatkezelés („célhoz kötöttség”);',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '5',
  '1(c)',
  'c) az adatkezelés céljai szempontjából megfelelőek és relevánsak kell, hogy legyenek, és a szükségesre kell korlátozódniuk („adattakarékosság”);',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '5',
  '1(d)',
  'd) pontosnak és szükség esetén naprakésznek kell lenniük; minden észszerű intézkedést meg kell tenni annak érdekében, hogy az adatkezelés céljai szempontjából pontatlan személyes adatokat haladéktalanul töröljék vagy helyesbítsék („pontosság”);',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '5',
  '1(e)',
  'e) tárolásának olyan formában kell történnie, amely az érintettek azonosítását csak a személyes adatok kezelése céljainak eléréséhez szükséges ideig teszi lehetővé; a személyes adatok ennél hosszabb ideig történő tárolására csak akkor kerülhet sor, amennyiben a személyes adatok kezelésére a 89. cikk (1) bekezdésének megfelelően közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból kerül majd sor, az e rendeletben az érintettek jogainak és szabadságainak védelme érdekében előírt megfelelő technikai és szervezési intézkedések végrehajtására is figyelemmel („korlátozott tárolhatóság”);',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '5',
  '1(f)',
  'f) kezelését oly módon kell végezni, hogy megfelelő technikai vagy szervezési intézkedések alkalmazásával biztosítva legyen a személyes adatok megfelelő biztonsága, az adatok jogosulatlan vagy jogellenes kezelésével, véletlen elvesztésével, megsemmisítésével vagy károsodásával szembeni védelmet is ideértve („integritás és bizalmas jelleg”).',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '5',
  '2',
  '(2) Az adatkezelő felelős az (1) bekezdésnek való megfelelésért, továbbá képesnek kell lennie e megfelelés igazolására („elszámoltathatóság”).',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  null,
  'Az adatkezelés jogszerűsége
(1) A személyes adatok kezelése kizárólag akkor és annyiban jogszerű, amennyiben legalább az alábbiak egyike teljesül:

a)

az érintett hozzájárulását adta személyes adatainak egy vagy több konkrét célból történő kezeléséhez;

b)

az adatkezelés olyan szerződés teljesítéséhez szükséges, amelyben az érintett az egyik fél, vagy az a szerződés megkötését megelőzően az érintett kérésére történő lépések megtételéhez szükséges;

c)

az adatkezelés az adatkezelőre vonatkozó jogi kötelezettség teljesítéséhez szükséges;

d)

az adatkezelés az érintett vagy egy másik természetes személy létfontosságú érdekeinek védelme miatt szükséges;

e)

az adatkezelés közérdekű vagy az adatkezelőre ruházott közhatalmi jogosítvány gyakorlásának keretében végzett feladat végrehajtásához szükséges;

f)

az adatkezelés az adatkezelő vagy egy harmadik fél jogos érdekeinek érvényesítéséhez szükséges, kivéve, ha ezen érdekekkel szemben elsőbbséget élveznek az érintett olyan érdekei vagy alapvető jogai és szabadságai, amelyek személyes adatok védelmét teszik szükségessé, különösen, ha az érintett gyermek.

Az első albekezdés f) pontja nem alkalmazható a közhatalmi szervek által feladataik ellátása során végzett adatkezelésre.

(2) Az e rendeletben foglalt, adatkezelésre vonatkozó szabályok alkalmazásának kiigazítása érdekében, a tagállamok az (1) bekezdés c) és e) pontjának való megfelelés céljából fenntarthatnak vagy bevezethetnek konkrétabb rendelkezéseket, amelyekben pontosabban meghatározzák az adatkezelésre vonatkozó konkrét követelményeket, és amelyekben további intézkedéseket tesznek az adatkezelés jogszerűségének és tisztességességének biztosítására, ideértve a IX. fejezetben meghatározott egyéb konkrét adatkezelési helyzeteket is.

(3) Az (1) bekezdés c) és e) pontja szerinti adatkezelés jogalapját a következőknek kell megállapítania:

a)

az uniós jog, vagy

b)

azon tagállami jog, amelynek hatálya alá az adatkezelő tartozik.

Az adatkezelés célját e jogalapra hivatkozással kell meghatározni, illetve az (1) bekezdés e) pontjában említett adatkezelés tekintetében annak szükségesnek kell lennie valamely közérdekű vagy az adatkezelőre ruházott közhatalmi jogosítvány gyakorlásának keretében végzett feladat végrehajtásához. Ez a jogalap tartalmazhat az e rendeletben foglalt szabályok alkalmazását kiigazító rendelkezéseket, ideértve az adatkezelő általi adatkezelés jogszerűségére irányadó általános feltételeket, az adatkezelés tárgyát képező adatok típusát, az érintetteket, azokat a jogalanyokat, amelyekkel a személyes adatok közölhetők, illetve az ilyen adatközlés céljait, az adatkezelés céljára vonatkozó korlátozásokat, az adattárolás időtartamát és az adatkezelési műveleteket, valamint egyéb adatkezelési eljárásokat, így a törvényes és tisztességes adatkezelés biztosításához szükséges intézkedéseket is, ideértve a IX. fejezetben meghatározott egyéb konkrét adatkezelési helyzetekre vonatkozóan. Az uniós vagy tagállami jognak közérdekű célt kell szolgálnia, és arányosnak kell lennie az elérni kívánt jogszerű céllal.

(4) Ha az adatgyűjtés céljától eltérő célból történő adatkezelés nem az érintett hozzájárulásán vagy valamely olyan uniós vagy tagállami jogon alapul, amely szükséges és arányos intézkedésnek minősül egy demokratikus társadalomban a 23. cikk (1) bekezdésében rögzített célok eléréséhez, annak megállapításához, hogy az eltérő célú adatkezelés összeegyeztethető-e azzal a céllal, amelyből a személyes adatokat eredetileg gyűjtötték, az adatkezelő többek között figyelembe veszi:

a)

a személyes adatok gyűjtésének céljait és a tervezett további adatkezelés céljai közötti esetleges kapcsolatokat;

b)

a személyes adatok gyűjtésének körülményeit, különös tekintettel az érintettek és az adatkezelő közötti kapcsolatokra;

c)

a személyes adatok jellegét, különösen pedig azt, hogy a 9. cikk szerinti személyes adatok különleges kategóriáinak kezeléséről van-e szó, illetve, hogy büntetőjogi felelősség megállapítására és bűncselekményekre vonatkozó adatoknak a 10. cikk szerinti kezeléséről van-e szó;

d)

azt, hogy az érintettekre nézve milyen esetleges következményekkel járna az adatok tervezett további kezelése;

e)

megfelelő garanciák meglétét, ami jelenthet titkosítást vagy álnevesítést is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '1',
  '(1) A személyes adatok kezelése kizárólag akkor és annyiban jogszerű, amennyiben legalább az alábbiak egyike teljesül:

a)

az érintett hozzájárulását adta személyes adatainak egy vagy több konkrét célból történő kezeléséhez;

b)

az adatkezelés olyan szerződés teljesítéséhez szükséges, amelyben az érintett az egyik fél, vagy az a szerződés megkötését megelőzően az érintett kérésére történő lépések megtételéhez szükséges;

c)

az adatkezelés az adatkezelőre vonatkozó jogi kötelezettség teljesítéséhez szükséges;

d)

az adatkezelés az érintett vagy egy másik természetes személy létfontosságú érdekeinek védelme miatt szükséges;

e)

az adatkezelés közérdekű vagy az adatkezelőre ruházott közhatalmi jogosítvány gyakorlásának keretében végzett feladat végrehajtásához szükséges;

f)

az adatkezelés az adatkezelő vagy egy harmadik fél jogos érdekeinek érvényesítéséhez szükséges, kivéve, ha ezen érdekekkel szemben elsőbbséget élveznek az érintett olyan érdekei vagy alapvető jogai és szabadságai, amelyek személyes adatok védelmét teszik szükségessé, különösen, ha az érintett gyermek.

Az első albekezdés f) pontja nem alkalmazható a közhatalmi szervek által feladataik ellátása során végzett adatkezelésre.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '1(a)',
  'a) az érintett hozzájárulását adta személyes adatainak egy vagy több konkrét célból történő kezeléséhez;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '1(b)',
  'b) az adatkezelés olyan szerződés teljesítéséhez szükséges, amelyben az érintett az egyik fél, vagy az a szerződés megkötését megelőzően az érintett kérésére történő lépések megtételéhez szükséges;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '1(c)',
  'c) az adatkezelés az adatkezelőre vonatkozó jogi kötelezettség teljesítéséhez szükséges;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '1(d)',
  'd) az adatkezelés az érintett vagy egy másik természetes személy létfontosságú érdekeinek védelme miatt szükséges;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '1(e)',
  'e) az adatkezelés közérdekű vagy az adatkezelőre ruházott közhatalmi jogosítvány gyakorlásának keretében végzett feladat végrehajtásához szükséges;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '1(f)',
  'f) az adatkezelés az adatkezelő vagy egy harmadik fél jogos érdekeinek érvényesítéséhez szükséges, kivéve, ha ezen érdekekkel szemben elsőbbséget élveznek az érintett olyan érdekei vagy alapvető jogai és szabadságai, amelyek személyes adatok védelmét teszik szükségessé, különösen, ha az érintett gyermek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '2',
  '(2) Az e rendeletben foglalt, adatkezelésre vonatkozó szabályok alkalmazásának kiigazítása érdekében, a tagállamok az (1) bekezdés c) és e) pontjának való megfelelés céljából fenntarthatnak vagy bevezethetnek konkrétabb rendelkezéseket, amelyekben pontosabban meghatározzák az adatkezelésre vonatkozó konkrét követelményeket, és amelyekben további intézkedéseket tesznek az adatkezelés jogszerűségének és tisztességességének biztosítására, ideértve a IX. fejezetben meghatározott egyéb konkrét adatkezelési helyzeteket is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '3',
  '(3) Az (1) bekezdés c) és e) pontja szerinti adatkezelés jogalapját a következőknek kell megállapítania:

a)

az uniós jog, vagy

b)

azon tagállami jog, amelynek hatálya alá az adatkezelő tartozik.

Az adatkezelés célját e jogalapra hivatkozással kell meghatározni, illetve az (1) bekezdés e) pontjában említett adatkezelés tekintetében annak szükségesnek kell lennie valamely közérdekű vagy az adatkezelőre ruházott közhatalmi jogosítvány gyakorlásának keretében végzett feladat végrehajtásához. Ez a jogalap tartalmazhat az e rendeletben foglalt szabályok alkalmazását kiigazító rendelkezéseket, ideértve az adatkezelő általi adatkezelés jogszerűségére irányadó általános feltételeket, az adatkezelés tárgyát képező adatok típusát, az érintetteket, azokat a jogalanyokat, amelyekkel a személyes adatok közölhetők, illetve az ilyen adatközlés céljait, az adatkezelés céljára vonatkozó korlátozásokat, az adattárolás időtartamát és az adatkezelési műveleteket, valamint egyéb adatkezelési eljárásokat, így a törvényes és tisztességes adatkezelés biztosításához szükséges intézkedéseket is, ideértve a IX. fejezetben meghatározott egyéb konkrét adatkezelési helyzetekre vonatkozóan. Az uniós vagy tagállami jognak közérdekű célt kell szolgálnia, és arányosnak kell lennie az elérni kívánt jogszerű céllal.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '3(b)',
  'b) azon tagállami jog, amelynek hatálya alá az adatkezelő tartozik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '4',
  '(4) Ha az adatgyűjtés céljától eltérő célból történő adatkezelés nem az érintett hozzájárulásán vagy valamely olyan uniós vagy tagállami jogon alapul, amely szükséges és arányos intézkedésnek minősül egy demokratikus társadalomban a 23. cikk (1) bekezdésében rögzített célok eléréséhez, annak megállapításához, hogy az eltérő célú adatkezelés összeegyeztethető-e azzal a céllal, amelyből a személyes adatokat eredetileg gyűjtötték, az adatkezelő többek között figyelembe veszi:

a)

a személyes adatok gyűjtésének céljait és a tervezett további adatkezelés céljai közötti esetleges kapcsolatokat;

b)

a személyes adatok gyűjtésének körülményeit, különös tekintettel az érintettek és az adatkezelő közötti kapcsolatokra;

c)

a személyes adatok jellegét, különösen pedig azt, hogy a 9. cikk szerinti személyes adatok különleges kategóriáinak kezeléséről van-e szó, illetve, hogy büntetőjogi felelősség megállapítására és bűncselekményekre vonatkozó adatoknak a 10. cikk szerinti kezeléséről van-e szó;

d)

azt, hogy az érintettekre nézve milyen esetleges következményekkel járna az adatok tervezett további kezelése;

e)

megfelelő garanciák meglétét, ami jelenthet titkosítást vagy álnevesítést is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '4(a)',
  'a) a személyes adatok gyűjtésének céljait és a tervezett további adatkezelés céljai közötti esetleges kapcsolatokat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '4(b)',
  'b) a személyes adatok gyűjtésének körülményeit, különös tekintettel az érintettek és az adatkezelő közötti kapcsolatokra;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '4(c)',
  'c) a személyes adatok jellegét, különösen pedig azt, hogy a 9. cikk szerinti személyes adatok különleges kategóriáinak kezeléséről van-e szó, illetve, hogy büntetőjogi felelősség megállapítására és bűncselekményekre vonatkozó adatoknak a 10. cikk szerinti kezeléséről van-e szó;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '4(d)',
  'd) azt, hogy az érintettekre nézve milyen esetleges következményekkel járna az adatok tervezett további kezelése;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '6',
  '4(e)',
  'e) megfelelő garanciák meglétét, ami jelenthet titkosítást vagy álnevesítést is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '7',
  null,
  'A hozzájárulás feltételei
(1) Ha az adatkezelés hozzájáruláson alapul, az adatkezelőnek képesnek kell lennie annak igazolására, hogy az érintett személyes adatainak kezeléséhez hozzájárult.

(2) Ha az érintett hozzájárulását olyan írásbeli nyilatkozat keretében adja meg, amely más ügyekre is vonatkozik, a hozzájárulás iránti kérelmet ezektől a más ügyektől egyértelműen megkülönböztethető módon kell előadni, érthető és könnyen hozzáférhető formában, világos és egyszerű nyelvezettel. Az érintett hozzájárulását tartalmazó ilyen nyilatkozat bármely olyan része, amely sérti e rendeletet, kötelező erővel nem bír.

(3) Az érintett jogosult arra, hogy hozzájárulását bármikor visszavonja. A hozzájárulás visszavonása nem érinti a hozzájáruláson alapuló, a visszavonás előtti adatkezelés jogszerűségét. A hozzájárulás megadása előtt az érintettet erről tájékoztatni kell. A hozzájárulás visszavonását ugyanolyan egyszerű módon kell lehetővé tenni, mint annak megadását.

(4) Annak megállapítása során, hogy a hozzájárulás önkéntes-e, a lehető legnagyobb mértékben figyelembe kell venni azt a tényt, egyebek mellett, hogy a szerződés teljesítésének – beleértve a szolgáltatások nyújtását is – feltételéül szabták-e az olyan személyes adatok kezeléséhez való hozzájárulást, amelyek nem szükségesek a szerződés teljesítéséhez.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '7',
  '1',
  '(1) Ha az adatkezelés hozzájáruláson alapul, az adatkezelőnek képesnek kell lennie annak igazolására, hogy az érintett személyes adatainak kezeléséhez hozzájárult.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '7',
  '2',
  '(2) Ha az érintett hozzájárulását olyan írásbeli nyilatkozat keretében adja meg, amely más ügyekre is vonatkozik, a hozzájárulás iránti kérelmet ezektől a más ügyektől egyértelműen megkülönböztethető módon kell előadni, érthető és könnyen hozzáférhető formában, világos és egyszerű nyelvezettel. Az érintett hozzájárulását tartalmazó ilyen nyilatkozat bármely olyan része, amely sérti e rendeletet, kötelező erővel nem bír.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '7',
  '3',
  '(3) Az érintett jogosult arra, hogy hozzájárulását bármikor visszavonja. A hozzájárulás visszavonása nem érinti a hozzájáruláson alapuló, a visszavonás előtti adatkezelés jogszerűségét. A hozzájárulás megadása előtt az érintettet erről tájékoztatni kell. A hozzájárulás visszavonását ugyanolyan egyszerű módon kell lehetővé tenni, mint annak megadását.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '7',
  '4',
  '(4) Annak megállapítása során, hogy a hozzájárulás önkéntes-e, a lehető legnagyobb mértékben figyelembe kell venni azt a tényt, egyebek mellett, hogy a szerződés teljesítésének – beleértve a szolgáltatások nyújtását is – feltételéül szabták-e az olyan személyes adatok kezeléséhez való hozzájárulást, amelyek nem szükségesek a szerződés teljesítéséhez.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '8',
  null,
  'A gyermek hozzájárulására vonatkozó feltételek az információs társadalommal összefüggő szolgáltatások vonatkozásában
(1) Ha a 6. cikk (1) bekezdésének a) pontja alkalmazandó, a közvetlenül gyermekeknek kínált, információs társadalommal összefüggő szolgáltatások vonatkozásában végzett személyes adatok kezelése akkor jogszerű, ha a gyermek a 16. életévét betöltötte. A 16. életévét be nem töltött gyermek esetén, a gyermekek személyes adatainak kezelése csak akkor és olyan mértékben jogszerű, ha a hozzájárulást a gyermek feletti szülői felügyeletet gyakorló adta meg, illetve engedélyezte.

A tagállamok e célokból jogszabályban ennél alacsonyabb, de a 13. életévnél nem alacsonyabb életkort is megállapíthatnak.

(2) Az adatkezelő – figyelembe véve az elérhető technológiát – észszerű erőfeszítéseket tesz, hogy ilyen esetekben ellenőrizze, hogy a hozzájárulást a gyermek feletti szülői felügyeleti jog gyakorlója adta meg, illetve engedélyezte.

(3) Az (1) bekezdés nem érinti a tagállamok általános szerződési jogát, például a gyermek által kötött szerződések érvényességére, formájára vagy hatályára vonatkozó szabályokat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_8'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '8',
  '1',
  '(1) Ha a 6. cikk (1) bekezdésének a) pontja alkalmazandó, a közvetlenül gyermekeknek kínált, információs társadalommal összefüggő szolgáltatások vonatkozásában végzett személyes adatok kezelése akkor jogszerű, ha a gyermek a 16. életévét betöltötte. A 16. életévét be nem töltött gyermek esetén, a gyermekek személyes adatainak kezelése csak akkor és olyan mértékben jogszerű, ha a hozzájárulást a gyermek feletti szülői felügyeletet gyakorló adta meg, illetve engedélyezte.

A tagállamok e célokból jogszabályban ennél alacsonyabb, de a 13. életévnél nem alacsonyabb életkort is megállapíthatnak.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_8'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '8',
  '2',
  '(2) Az adatkezelő – figyelembe véve az elérhető technológiát – észszerű erőfeszítéseket tesz, hogy ilyen esetekben ellenőrizze, hogy a hozzájárulást a gyermek feletti szülői felügyeleti jog gyakorlója adta meg, illetve engedélyezte.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_8'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '8',
  '3',
  '(3) Az (1) bekezdés nem érinti a tagállamok általános szerződési jogát, például a gyermek által kötött szerződések érvényességére, formájára vagy hatályára vonatkozó szabályokat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_8'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  null,
  'A személyes adatok különleges kategóriáinak kezelése
(1) A faji vagy etnikai származásra, politikai véleményre, vallási vagy világnézeti meggyőződésre vagy szakszervezeti tagságra utaló személyes adatok, valamint a természetes személyek egyedi azonosítását célzó genetikai és biometrikus adatok, az egészségügyi adatok és a természetes személyek szexuális életére vagy szexuális irányultságára vonatkozó személyes adatok kezelése tilos.

(2) Az (1) bekezdés nem alkalmazandó abban az esetben, ha:

a)

az érintett kifejezett hozzájárulását adta az említett személyes adatok egy vagy több konkrét célból történő kezeléséhez, kivéve, ha az uniós vagy tagállami jog úgy rendelkezik, hogy az (1) bekezdésben említett tilalom nem oldható fel az érintett hozzájárulásával;

b)

az adatkezelés az adatkezelőnek vagy az érintettnek a foglalkoztatást, valamint a szociális biztonságot és szociális védelmet szabályozó jogi előírásokból fakadó kötelezettségei teljesítése és konkrét jogai gyakorlása érdekében szükséges, ha az érintett alapvető jogait és érdekeit védő megfelelő garanciákról is rendelkező uniós vagy tagállami jog, illetve a tagállami jog szerinti kollektív szerződés ezt lehetővé teszi;

c)

az adatkezelés az érintett vagy más természetes személy létfontosságú érdekeinek védelméhez szükséges, ha az érintett fizikai vagy jogi cselekvőképtelensége folytán nem képes a hozzájárulását megadni;

d)

az adatkezelés valamely politikai, világnézeti, vallási vagy szakszervezeti célú alapítvány, egyesület vagy bármely más nonprofit szervezet megfelelő garanciák mellett végzett jogszerű tevékenysége keretében történik, azzal a feltétellel, hogy az adatkezelés kizárólag az ilyen szerv jelenlegi vagy volt tagjaira, vagy olyan személyekre vonatkozik, akik a szervezettel rendszeres kapcsolatban állnak a szervezet céljaihoz kapcsolódóan, és hogy a személyes adatokat az érintettek hozzájárulása nélkül nem teszik hozzáférhetővé a szervezeten kívüli személyek számára;

e)

az adatkezelés olyan személyes adatokra vonatkozik, amelyeket az érintett kifejezetten nyilvánosságra hozott;

f)

az adatkezelés jogi igények előterjesztéséhez, érvényesítéséhez, illetve védelméhez szükséges, vagy amikor a bíróságok igazságszolgáltatási feladatkörükben járnak el;

g)

az adatkezelés jelentős közérdek miatt szükséges, uniós jog vagy tagállami jog alapján, amely arányos az elérni kívánt céllal, tiszteletben tartja a személyes adatok védelméhez való jog lényeges tartalmát, és az érintett alapvető jogainak és érdekeinek biztosítására megfelelő és konkrét intézkedéseket ír elő;

h)

az adatkezelés megelőző egészségügyi vagy munkahelyi egészségügyi célokból, a munkavállaló munkavégzési képességének felmérése, orvosi diagnózis felállítása, egészségügyi vagy szociális ellátás vagy kezelés nyújtása, illetve egészségügyi vagy szociális rendszerek és szolgáltatások irányítása érdekében szükséges, uniós vagy tagállami jog alapján vagy egészségügyi szakemberrel kötött szerződés értelmében, továbbá a (3) bekezdésben említett feltételekre és garanciákra figyelemmel;

i)

az adatkezelés a népegészségügy területét érintő olyan közérdekből szükséges, mint a határokon át terjedő súlyos egészségügyi veszélyekkel szembeni védelem vagy az egészségügyi ellátás, a gyógyszerek és az orvostechnikai eszközök magas színvonalának és biztonságának a biztosítása, és olyan uniós vagy tagállami jog alapján történik, amely megfelelő és konkrét intézkedésekről rendelkezik az érintett jogait és szabadságait védő garanciákra, és különösen a szakmai titoktartásra vonatkozóan;

j)

az adatkezelés a 89. cikk (1) bekezdésével összhangban a közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból szükséges olyan uniós vagy tagállami jog alapján, amely arányos az elérni kívánt céllal, tiszteletben tartja a személyes adatok védelméhez való jog lényeges tartalmát, és az érintett alapvető jogainak és érdekeinek biztosítására megfelelő és konkrét intézkedéseket ír elő;

(3) Az (1) bekezdésben említett személyes adatokat abban az esetben lehet a (2) bekezdés h) pontjában említett célokból kezelni, ha ezen adatok kezelése olyan szakember által vagy olyan szakember felelőssége mellett történik, aki uniós vagy tagállami jogban, illetve az arra hatáskörrel rendelkező tagállami szervek által megállapított szabályokban meghatározott szakmai titoktartási kötelezettség hatálya alatt áll, illetve olyan más személy által, aki szintén uniós vagy tagállami jogban, illetve az arra hatáskörrel rendelkező tagállami szervek által megállapított szabályokban meghatározott titoktartási kötelezettség hatálya alatt áll.

(4) A tagállamok további feltételeket – köztük korlátozásokat – tarthatnak hatályban, illetve vezethetnek be a genetikai adatok, a biometrikus adatok és az egészségügyi adatok kezelésére vonatkozóan.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '1',
  '(1) A faji vagy etnikai származásra, politikai véleményre, vallási vagy világnézeti meggyőződésre vagy szakszervezeti tagságra utaló személyes adatok, valamint a természetes személyek egyedi azonosítását célzó genetikai és biometrikus adatok, az egészségügyi adatok és a természetes személyek szexuális életére vagy szexuális irányultságára vonatkozó személyes adatok kezelése tilos.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '2',
  '(2) Az (1) bekezdés nem alkalmazandó abban az esetben, ha:

a)

az érintett kifejezett hozzájárulását adta az említett személyes adatok egy vagy több konkrét célból történő kezeléséhez, kivéve, ha az uniós vagy tagállami jog úgy rendelkezik, hogy az (1) bekezdésben említett tilalom nem oldható fel az érintett hozzájárulásával;

b)

az adatkezelés az adatkezelőnek vagy az érintettnek a foglalkoztatást, valamint a szociális biztonságot és szociális védelmet szabályozó jogi előírásokból fakadó kötelezettségei teljesítése és konkrét jogai gyakorlása érdekében szükséges, ha az érintett alapvető jogait és érdekeit védő megfelelő garanciákról is rendelkező uniós vagy tagállami jog, illetve a tagállami jog szerinti kollektív szerződés ezt lehetővé teszi;

c)

az adatkezelés az érintett vagy más természetes személy létfontosságú érdekeinek védelméhez szükséges, ha az érintett fizikai vagy jogi cselekvőképtelensége folytán nem képes a hozzájárulását megadni;

d)

az adatkezelés valamely politikai, világnézeti, vallási vagy szakszervezeti célú alapítvány, egyesület vagy bármely más nonprofit szervezet megfelelő garanciák mellett végzett jogszerű tevékenysége keretében történik, azzal a feltétellel, hogy az adatkezelés kizárólag az ilyen szerv jelenlegi vagy volt tagjaira, vagy olyan személyekre vonatkozik, akik a szervezettel rendszeres kapcsolatban állnak a szervezet céljaihoz kapcsolódóan, és hogy a személyes adatokat az érintettek hozzájárulása nélkül nem teszik hozzáférhetővé a szervezeten kívüli személyek számára;

e)

az adatkezelés olyan személyes adatokra vonatkozik, amelyeket az érintett kifejezetten nyilvánosságra hozott;

f)

az adatkezelés jogi igények előterjesztéséhez, érvényesítéséhez, illetve védelméhez szükséges, vagy amikor a bíróságok igazságszolgáltatási feladatkörükben járnak el;

g)

az adatkezelés jelentős közérdek miatt szükséges, uniós jog vagy tagállami jog alapján, amely arányos az elérni kívánt céllal, tiszteletben tartja a személyes adatok védelméhez való jog lényeges tartalmát, és az érintett alapvető jogainak és érdekeinek biztosítására megfelelő és konkrét intézkedéseket ír elő;

h)

az adatkezelés megelőző egészségügyi vagy munkahelyi egészségügyi célokból, a munkavállaló munkavégzési képességének felmérése, orvosi diagnózis felállítása, egészségügyi vagy szociális ellátás vagy kezelés nyújtása, illetve egészségügyi vagy szociális rendszerek és szolgáltatások irányítása érdekében szükséges, uniós vagy tagállami jog alapján vagy egészségügyi szakemberrel kötött szerződés értelmében, továbbá a (3) bekezdésben említett feltételekre és garanciákra figyelemmel;

i)

az adatkezelés a népegészségügy területét érintő olyan közérdekből szükséges, mint a határokon át terjedő súlyos egészségügyi veszélyekkel szembeni védelem vagy az egészségügyi ellátás, a gyógyszerek és az orvostechnikai eszközök magas színvonalának és biztonságának a biztosítása, és olyan uniós vagy tagállami jog alapján történik, amely megfelelő és konkrét intézkedésekről rendelkezik az érintett jogait és szabadságait védő garanciákra, és különösen a szakmai titoktartásra vonatkozóan;

j)

az adatkezelés a 89. cikk (1) bekezdésével összhangban a közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból szükséges olyan uniós vagy tagállami jog alapján, amely arányos az elérni kívánt céllal, tiszteletben tartja a személyes adatok védelméhez való jog lényeges tartalmát, és az érintett alapvető jogainak és érdekeinek biztosítására megfelelő és konkrét intézkedéseket ír elő;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '2(a)',
  'a) az érintett kifejezett hozzájárulását adta az említett személyes adatok egy vagy több konkrét célból történő kezeléséhez, kivéve, ha az uniós vagy tagállami jog úgy rendelkezik, hogy az (1) bekezdésben említett tilalom nem oldható fel az érintett hozzájárulásával;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '2(b)',
  'b) az adatkezelés az adatkezelőnek vagy az érintettnek a foglalkoztatást, valamint a szociális biztonságot és szociális védelmet szabályozó jogi előírásokból fakadó kötelezettségei teljesítése és konkrét jogai gyakorlása érdekében szükséges, ha az érintett alapvető jogait és érdekeit védő megfelelő garanciákról is rendelkező uniós vagy tagállami jog, illetve a tagállami jog szerinti kollektív szerződés ezt lehetővé teszi;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '2(c)',
  'c) az adatkezelés az érintett vagy más természetes személy létfontosságú érdekeinek védelméhez szükséges, ha az érintett fizikai vagy jogi cselekvőképtelensége folytán nem képes a hozzájárulását megadni;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '2(d)',
  'd) az adatkezelés valamely politikai, világnézeti, vallási vagy szakszervezeti célú alapítvány, egyesület vagy bármely más nonprofit szervezet megfelelő garanciák mellett végzett jogszerű tevékenysége keretében történik, azzal a feltétellel, hogy az adatkezelés kizárólag az ilyen szerv jelenlegi vagy volt tagjaira, vagy olyan személyekre vonatkozik, akik a szervezettel rendszeres kapcsolatban állnak a szervezet céljaihoz kapcsolódóan, és hogy a személyes adatokat az érintettek hozzájárulása nélkül nem teszik hozzáférhetővé a szervezeten kívüli személyek számára;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '2(e)',
  'e) az adatkezelés olyan személyes adatokra vonatkozik, amelyeket az érintett kifejezetten nyilvánosságra hozott;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '2(f)',
  'f) az adatkezelés jogi igények előterjesztéséhez, érvényesítéséhez, illetve védelméhez szükséges, vagy amikor a bíróságok igazságszolgáltatási feladatkörükben járnak el;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '2(g)',
  'g) az adatkezelés jelentős közérdek miatt szükséges, uniós jog vagy tagállami jog alapján, amely arányos az elérni kívánt céllal, tiszteletben tartja a személyes adatok védelméhez való jog lényeges tartalmát, és az érintett alapvető jogainak és érdekeinek biztosítására megfelelő és konkrét intézkedéseket ír elő;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '2(h)',
  'h) az adatkezelés megelőző egészségügyi vagy munkahelyi egészségügyi célokból, a munkavállaló munkavégzési képességének felmérése, orvosi diagnózis felállítása, egészségügyi vagy szociális ellátás vagy kezelés nyújtása, illetve egészségügyi vagy szociális rendszerek és szolgáltatások irányítása érdekében szükséges, uniós vagy tagállami jog alapján vagy egészségügyi szakemberrel kötött szerződés értelmében, továbbá a (3) bekezdésben említett feltételekre és garanciákra figyelemmel;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '2(i)',
  'i) az adatkezelés a népegészségügy területét érintő olyan közérdekből szükséges, mint a határokon át terjedő súlyos egészségügyi veszélyekkel szembeni védelem vagy az egészségügyi ellátás, a gyógyszerek és az orvostechnikai eszközök magas színvonalának és biztonságának a biztosítása, és olyan uniós vagy tagállami jog alapján történik, amely megfelelő és konkrét intézkedésekről rendelkezik az érintett jogait és szabadságait védő garanciákra, és különösen a szakmai titoktartásra vonatkozóan;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '2(j)',
  'j) az adatkezelés a 89. cikk (1) bekezdésével összhangban a közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból szükséges olyan uniós vagy tagállami jog alapján, amely arányos az elérni kívánt céllal, tiszteletben tartja a személyes adatok védelméhez való jog lényeges tartalmát, és az érintett alapvető jogainak és érdekeinek biztosítására megfelelő és konkrét intézkedéseket ír elő;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '3',
  '(3) Az (1) bekezdésben említett személyes adatokat abban az esetben lehet a (2) bekezdés h) pontjában említett célokból kezelni, ha ezen adatok kezelése olyan szakember által vagy olyan szakember felelőssége mellett történik, aki uniós vagy tagállami jogban, illetve az arra hatáskörrel rendelkező tagállami szervek által megállapított szabályokban meghatározott szakmai titoktartási kötelezettség hatálya alatt áll, illetve olyan más személy által, aki szintén uniós vagy tagállami jogban, illetve az arra hatáskörrel rendelkező tagállami szervek által megállapított szabályokban meghatározott titoktartási kötelezettség hatálya alatt áll.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '9',
  '4',
  '(4) A tagállamok további feltételeket – köztük korlátozásokat – tarthatnak hatályban, illetve vezethetnek be a genetikai adatok, a biometrikus adatok és az egészségügyi adatok kezelésére vonatkozóan.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '10',
  null,
  'A büntetőjogi felelősség megállapítására vonatkozó határozatokra és a bűncselekményekre vonatkozó személyes adatok kezelése
A büntetőjogi felelősség megállapítására vonatkozó határozatokra és a bűncselekményekre, illetve a kapcsolódó biztonsági intézkedésekre vonatkozó személyes adatoknak a 6. cikk (1) bekezdése alapján történő kezelésére kizárólag abban az esetben kerülhet sor, ha az közhatalmi szerv adatkezelésében történik, vagy ha az adatkezelést az érintett jogai és szabadságai tekintetében megfelelő garanciákat nyújtó uniós vagy tagállami jog lehetővé teszi. A büntetőjogi felelősség megállapítására vonatkozó határozatok teljes körű nyilvántartása csak közhatalmi szerv által végzett adatkezelés keretében történhet.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '11',
  null,
  'Azonosítást nem igénylő adatkezelés
(1) Ha azok a célok, amelyekből az adatkezelő a személyes adatokat kezeli, nem vagy már nem teszik szükségessé az érintettnek az adatkezelő általi azonosítását, az adatkezelő nem köteles kiegészítő információkat megőrizni, beszerezni vagy kezelni annak érdekében, hogy pusztán azért azonosítsa az érintettet, hogy megfeleljen e rendeletnek.

(2) Ha az e cikk (1) bekezdésében említett esetekben az adatkezelő bizonyítani tudja, hogy nincs abban a helyzetben, hogy azonosítsa az érintettet, erről lehetőség szerint őt megfelelő módon tájékoztatja. Ilyen esetekben a 15–20. cikk nem alkalmazandó, kivéve, ha az érintett abból a célból, hogy az említett cikkek szerinti jogait gyakorolja, az azonosítását lehetővé tevő kiegészítő információkat nyújt.

III. FEJEZET

Az érintett jogai

1. szakasz

Átláthatóság és intézkedések',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_11'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '11',
  '1',
  '(1) Ha azok a célok, amelyekből az adatkezelő a személyes adatokat kezeli, nem vagy már nem teszik szükségessé az érintettnek az adatkezelő általi azonosítását, az adatkezelő nem köteles kiegészítő információkat megőrizni, beszerezni vagy kezelni annak érdekében, hogy pusztán azért azonosítsa az érintettet, hogy megfeleljen e rendeletnek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_11'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '11',
  '2',
  '(2) Ha az e cikk (1) bekezdésében említett esetekben az adatkezelő bizonyítani tudja, hogy nincs abban a helyzetben, hogy azonosítsa az érintettet, erről lehetőség szerint őt megfelelő módon tájékoztatja. Ilyen esetekben a 15–20. cikk nem alkalmazandó, kivéve, ha az érintett abból a célból, hogy az említett cikkek szerinti jogait gyakorolja, az azonosítását lehetővé tevő kiegészítő információkat nyújt.

III. FEJEZET

Az érintett jogai

1. szakasz

Átláthatóság és intézkedések',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_11'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '12',
  null,
  'Átlátható tájékoztatás, kommunikáció és az érintett jogainak gyakorlására vonatkozó intézkedések
(1) Az adatkezelő megfelelő intézkedéseket hoz annak érdekében, hogy az érintett részére a személyes adatok kezelésére vonatkozó, a 13. és a 14. cikkben említett valamennyi információt és a 15–22. és 34. cikk szerinti minden egyes tájékoztatást tömör, átlátható, érthető és könnyen hozzáférhető formában, világosan és közérthetően megfogalmazva nyújtsa, különösen a gyermekeknek címzett bármely információ esetében. Az információkat írásban vagy más módon – ideértve adott esetben az elektronikus utat is – kell megadni. Az érintett kérésére szóbeli tájékoztatás is adható, feltéve, hogy más módon igazolták az érintett személyazonosságát.

(2) Az adatkezelő elősegíti az érintett 15–22. cikk szerinti jogainak a gyakorlását. A 11. cikk (2) bekezdésében említett esetekben az adatkezelő az érintett 15–22. cikk szerinti jogai gyakorlására irányuló kérelmének a teljesítését nem tagadhatja meg, kivéve, ha bizonyítja, hogy az érintettet nem áll módjában azonosítani.

(3) Az adatkezelő indokolatlan késedelem nélkül, de mindenféleképpen a kérelem beérkezésétől számított egy hónapon belül tájékoztatja az érintettet a 15–22. cikk szerinti kérelem nyomán hozott intézkedésekről. Szükség esetén, figyelembe véve a kérelem összetettségét és a kérelmek számát, ez a határidő további két hónappal meghosszabbítható. A határidő meghosszabbításáról az adatkezelő a késedelem okainak megjelölésével a kérelem kézhezvételétől számított egy hónapon belül tájékoztatja az érintettet. Ha az érintett elektronikus úton nyújtotta be a kérelmet, a tájékoztatást lehetőség szerint elektronikus úton kell megadni, kivéve, ha az érintett azt másként kéri.

(4) Ha az adatkezelő nem tesz intézkedéseket az érintett kérelme nyomán, késedelem nélkül, de legkésőbb a kérelem beérkezésétől számított egy hónapon belül tájékoztatja az érintettet az intézkedés elmaradásának okairól, valamint arról, hogy az érintett panaszt nyújthat be valamely felügyeleti hatóságnál, és élhet bírósági jogorvoslati jogával.

(5) A 13. és 14. cikk szerinti információkat és a 15–22. és 34. cikk szerinti tájékoztatást és intézkedést díjmentesen kell biztosítani. Ha az érintett kérelme egyértelműen megalapozatlan vagy – különösen ismétlődő jellege miatt – túlzó, az adatkezelő, figyelemmel a kért információ vagy tájékoztatás nyújtásával vagy a kért intézkedés meghozatalával járó adminisztratív költségekre:

a)

észszerű összegű díjat számíthat fel, vagy

b)

megtagadhatja a kérelem alapján történő intézkedést.

A kérelem egyértelműen megalapozatlan vagy túlzó jellegének bizonyítása az adatkezelőt terheli.

(6) A 11. cikk sérelme nélkül, ha az adatkezelőnek megalapozott kétségei vannak a 15–21. cikk szerinti kérelmet benyújtó természetes személy kilétével kapcsolatban, további, az érintett személyazonosságának megerősítéséhez szükséges információk nyújtását kérheti.

(7) Az érintett részére a 13. és 14. cikk alapján nyújtandó információkat szabványosított ikonokkal is ki lehet egészíteni annak érdekében, hogy a tervezett adatkezelésről az érintett jól látható, könnyen érthető és jól olvasható formában kapjon általános tájékoztatást. Az elektronikusan megjelenített ikonoknak géppel olvashatónak kell lenniük.

(8) A Bizottság felhatalmazást kap arra, hogy a 92. cikkel összhangban felhatalmazáson alapuló jogi aktusokat fogadjon el az ikonok által megjelenítendő információk és a szabványosított ikonok biztosítására vonatkozó eljárások meghatározása céljából.

2. szakasz

Tájékoztatás és a személyes adatokhoz való hozzáférés',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '12',
  '1',
  '(1) Az adatkezelő megfelelő intézkedéseket hoz annak érdekében, hogy az érintett részére a személyes adatok kezelésére vonatkozó, a 13. és a 14. cikkben említett valamennyi információt és a 15–22. és 34. cikk szerinti minden egyes tájékoztatást tömör, átlátható, érthető és könnyen hozzáférhető formában, világosan és közérthetően megfogalmazva nyújtsa, különösen a gyermekeknek címzett bármely információ esetében. Az információkat írásban vagy más módon – ideértve adott esetben az elektronikus utat is – kell megadni. Az érintett kérésére szóbeli tájékoztatás is adható, feltéve, hogy más módon igazolták az érintett személyazonosságát.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '12',
  '2',
  '(2) Az adatkezelő elősegíti az érintett 15–22. cikk szerinti jogainak a gyakorlását. A 11. cikk (2) bekezdésében említett esetekben az adatkezelő az érintett 15–22. cikk szerinti jogai gyakorlására irányuló kérelmének a teljesítését nem tagadhatja meg, kivéve, ha bizonyítja, hogy az érintettet nem áll módjában azonosítani.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '12',
  '3',
  '(3) Az adatkezelő indokolatlan késedelem nélkül, de mindenféleképpen a kérelem beérkezésétől számított egy hónapon belül tájékoztatja az érintettet a 15–22. cikk szerinti kérelem nyomán hozott intézkedésekről. Szükség esetén, figyelembe véve a kérelem összetettségét és a kérelmek számát, ez a határidő további két hónappal meghosszabbítható. A határidő meghosszabbításáról az adatkezelő a késedelem okainak megjelölésével a kérelem kézhezvételétől számított egy hónapon belül tájékoztatja az érintettet. Ha az érintett elektronikus úton nyújtotta be a kérelmet, a tájékoztatást lehetőség szerint elektronikus úton kell megadni, kivéve, ha az érintett azt másként kéri.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '12',
  '4',
  '(4) Ha az adatkezelő nem tesz intézkedéseket az érintett kérelme nyomán, késedelem nélkül, de legkésőbb a kérelem beérkezésétől számított egy hónapon belül tájékoztatja az érintettet az intézkedés elmaradásának okairól, valamint arról, hogy az érintett panaszt nyújthat be valamely felügyeleti hatóságnál, és élhet bírósági jogorvoslati jogával.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '12',
  '5',
  '(5) A 13. és 14. cikk szerinti információkat és a 15–22. és 34. cikk szerinti tájékoztatást és intézkedést díjmentesen kell biztosítani. Ha az érintett kérelme egyértelműen megalapozatlan vagy – különösen ismétlődő jellege miatt – túlzó, az adatkezelő, figyelemmel a kért információ vagy tájékoztatás nyújtásával vagy a kért intézkedés meghozatalával járó adminisztratív költségekre:

a)

észszerű összegű díjat számíthat fel, vagy

b)

megtagadhatja a kérelem alapján történő intézkedést.

A kérelem egyértelműen megalapozatlan vagy túlzó jellegének bizonyítása az adatkezelőt terheli.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '12',
  '5(a)',
  'a) észszerű összegű díjat számíthat fel, vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '12',
  '5(b)',
  'b) megtagadhatja a kérelem alapján történő intézkedést.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '12',
  '6',
  '(6) A 11. cikk sérelme nélkül, ha az adatkezelőnek megalapozott kétségei vannak a 15–21. cikk szerinti kérelmet benyújtó természetes személy kilétével kapcsolatban, további, az érintett személyazonosságának megerősítéséhez szükséges információk nyújtását kérheti.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '12',
  '7',
  '(7) Az érintett részére a 13. és 14. cikk alapján nyújtandó információkat szabványosított ikonokkal is ki lehet egészíteni annak érdekében, hogy a tervezett adatkezelésről az érintett jól látható, könnyen érthető és jól olvasható formában kapjon általános tájékoztatást. Az elektronikusan megjelenített ikonoknak géppel olvashatónak kell lenniük.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '12',
  '8',
  '(8) A Bizottság felhatalmazást kap arra, hogy a 92. cikkel összhangban felhatalmazáson alapuló jogi aktusokat fogadjon el az ikonok által megjelenítendő információk és a szabványosított ikonok biztosítására vonatkozó eljárások meghatározása céljából.

2. szakasz

Tájékoztatás és a személyes adatokhoz való hozzáférés',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  null,
  'Rendelkezésre bocsátandó információk, ha a személyes adatokat az érintettől gyűjtik
(1) Ha az érintettre vonatkozó személyes adatokat az érintettől gyűjtik, az adatkezelő a személyes adatok megszerzésének időpontjában az érintett rendelkezésére bocsátja a következő információk mindegyikét:

a)

az adatkezelőnek és – ha van ilyen – az adatkezelő képviselőjének a kiléte és elérhetőségei;

b)

az adatvédelmi tisztviselő elérhetőségei, ha van ilyen;

c)

a személyes adatok tervezett kezelésének célja, valamint az adatkezelés jogalapja;

d)

a 6. cikk (1) bekezdésének f) pontján alapuló adatkezelés esetén, az adatkezelő vagy harmadik fél jogos érdekei;

e)

adott esetben a személyes adatok címzettjei, illetve a címzettek kategóriái, ha van ilyen;

f)

adott esetben annak ténye, hogy az adatkezelő harmadik országba vagy nemzetközi szervezet részére kívánja továbbítani a személyes adatokat, továbbá a Bizottság megfelelőségi határozatának léte vagy annak hiánya, vagy a 46. cikkben, a 47. cikkben vagy a 49. cikk (1) bekezdésének második albekezdésében említett adattovábbítás esetén a megfelelő és alkalmas garanciák megjelölése, valamint az azok másolatának megszerzésére szolgáló módokra vagy az azok elérhetőségére való hivatkozás.

(2) Az (1) bekezdésben említett információk mellett az adatkezelő a személyes adatok megszerzésének időpontjában, annak érdekében, hogy a tisztességes és átlátható adatkezelést biztosítsa, az érintettet a következő kiegészítő információkról tájékoztatja:

a)

a személyes adatok tárolásának időtartamáról, vagy ha ez nem lehetséges, ezen időtartam meghatározásának szempontjairól;

b)

az érintett azon jogáról, hogy kérelmezheti az adatkezelőtől a rá vonatkozó személyes adatokhoz való hozzáférést, azok helyesbítését, törlését vagy kezelésének korlátozását, és tiltakozhat az ilyen személyes adatok kezelése ellen, valamint az érintett adathordozhatósághoz való jogáról;

c)

a 6. cikk (1) bekezdésének a) pontján vagy a 9. cikk (2) bekezdésének a) pontján alapuló adatkezelés esetén a hozzájárulás bármely időpontban történő visszavonásához való jog, amely nem érinti a visszavonás előtt a hozzájárulás alapján végrehajtott adatkezelés jogszerűségét;

d)

a felügyeleti hatósághoz címzett panasz benyújtásának jogáról;

e)

arról, hogy a személyes adat szolgáltatása jogszabályon vagy szerződéses kötelezettségen alapul vagy szerződés kötésének előfeltétele-e, valamint hogy az érintett köteles-e a személyes adatokat megadni, továbbá hogy milyen lehetséges következményeikkel járhat az adatszolgáltatás elmaradása;

f)

a 22. cikk (1) és (4) bekezdésében említett automatizált döntéshozatal ténye, ideértve a profilalkotást is, valamint legalább ezekben az esetekben az alkalmazott logikára és arra vonatkozóan érthető információk, hogy az ilyen adatkezelés milyen jelentőséggel, és az érintettre nézve milyen várható következményekkel bír.

(3) Ha az adatkezelő a személyes adatokon a gyűjtésük céljától eltérő célból további adatkezelést kíván végezni, a további adatkezelést megelőzően tájékoztatnia kell az érintettet erről az eltérő célról és a (2) bekezdésben említett minden releváns kiegészítő információról.

(4) Az (1), (2) és (3) bekezdés nem alkalmazandó, ha és amilyen mértékben az érintett már rendelkezik az információkkal.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '1',
  '(1) Ha az érintettre vonatkozó személyes adatokat az érintettől gyűjtik, az adatkezelő a személyes adatok megszerzésének időpontjában az érintett rendelkezésére bocsátja a következő információk mindegyikét:

a)

az adatkezelőnek és – ha van ilyen – az adatkezelő képviselőjének a kiléte és elérhetőségei;

b)

az adatvédelmi tisztviselő elérhetőségei, ha van ilyen;

c)

a személyes adatok tervezett kezelésének célja, valamint az adatkezelés jogalapja;

d)

a 6. cikk (1) bekezdésének f) pontján alapuló adatkezelés esetén, az adatkezelő vagy harmadik fél jogos érdekei;

e)

adott esetben a személyes adatok címzettjei, illetve a címzettek kategóriái, ha van ilyen;

f)

adott esetben annak ténye, hogy az adatkezelő harmadik országba vagy nemzetközi szervezet részére kívánja továbbítani a személyes adatokat, továbbá a Bizottság megfelelőségi határozatának léte vagy annak hiánya, vagy a 46. cikkben, a 47. cikkben vagy a 49. cikk (1) bekezdésének második albekezdésében említett adattovábbítás esetén a megfelelő és alkalmas garanciák megjelölése, valamint az azok másolatának megszerzésére szolgáló módokra vagy az azok elérhetőségére való hivatkozás.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '1(a)',
  'a) az adatkezelőnek és – ha van ilyen – az adatkezelő képviselőjének a kiléte és elérhetőségei;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '1(b)',
  'b) az adatvédelmi tisztviselő elérhetőségei, ha van ilyen;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '1(c)',
  'c) a személyes adatok tervezett kezelésének célja, valamint az adatkezelés jogalapja;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '1(d)',
  'd) a 6. cikk (1) bekezdésének f) pontján alapuló adatkezelés esetén, az adatkezelő vagy harmadik fél jogos érdekei;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '1(e)',
  'e) adott esetben a személyes adatok címzettjei, illetve a címzettek kategóriái, ha van ilyen;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '1(f)',
  'f) adott esetben annak ténye, hogy az adatkezelő harmadik országba vagy nemzetközi szervezet részére kívánja továbbítani a személyes adatokat, továbbá a Bizottság megfelelőségi határozatának léte vagy annak hiánya, vagy a 46. cikkben, a 47. cikkben vagy a 49. cikk (1) bekezdésének második albekezdésében említett adattovábbítás esetén a megfelelő és alkalmas garanciák megjelölése, valamint az azok másolatának megszerzésére szolgáló módokra vagy az azok elérhetőségére való hivatkozás.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '2',
  '(2) Az (1) bekezdésben említett információk mellett az adatkezelő a személyes adatok megszerzésének időpontjában, annak érdekében, hogy a tisztességes és átlátható adatkezelést biztosítsa, az érintettet a következő kiegészítő információkról tájékoztatja:

a)

a személyes adatok tárolásának időtartamáról, vagy ha ez nem lehetséges, ezen időtartam meghatározásának szempontjairól;

b)

az érintett azon jogáról, hogy kérelmezheti az adatkezelőtől a rá vonatkozó személyes adatokhoz való hozzáférést, azok helyesbítését, törlését vagy kezelésének korlátozását, és tiltakozhat az ilyen személyes adatok kezelése ellen, valamint az érintett adathordozhatósághoz való jogáról;

c)

a 6. cikk (1) bekezdésének a) pontján vagy a 9. cikk (2) bekezdésének a) pontján alapuló adatkezelés esetén a hozzájárulás bármely időpontban történő visszavonásához való jog, amely nem érinti a visszavonás előtt a hozzájárulás alapján végrehajtott adatkezelés jogszerűségét;

d)

a felügyeleti hatósághoz címzett panasz benyújtásának jogáról;

e)

arról, hogy a személyes adat szolgáltatása jogszabályon vagy szerződéses kötelezettségen alapul vagy szerződés kötésének előfeltétele-e, valamint hogy az érintett köteles-e a személyes adatokat megadni, továbbá hogy milyen lehetséges következményeikkel járhat az adatszolgáltatás elmaradása;

f)

a 22. cikk (1) és (4) bekezdésében említett automatizált döntéshozatal ténye, ideértve a profilalkotást is, valamint legalább ezekben az esetekben az alkalmazott logikára és arra vonatkozóan érthető információk, hogy az ilyen adatkezelés milyen jelentőséggel, és az érintettre nézve milyen várható következményekkel bír.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '2(a)',
  'a) a személyes adatok tárolásának időtartamáról, vagy ha ez nem lehetséges, ezen időtartam meghatározásának szempontjairól;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '2(b)',
  'b) az érintett azon jogáról, hogy kérelmezheti az adatkezelőtől a rá vonatkozó személyes adatokhoz való hozzáférést, azok helyesbítését, törlését vagy kezelésének korlátozását, és tiltakozhat az ilyen személyes adatok kezelése ellen, valamint az érintett adathordozhatósághoz való jogáról;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '2(c)',
  'c) a 6. cikk (1) bekezdésének a) pontján vagy a 9. cikk (2) bekezdésének a) pontján alapuló adatkezelés esetén a hozzájárulás bármely időpontban történő visszavonásához való jog, amely nem érinti a visszavonás előtt a hozzájárulás alapján végrehajtott adatkezelés jogszerűségét;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '2(d)',
  'd) a felügyeleti hatósághoz címzett panasz benyújtásának jogáról;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '2(e)',
  'e) arról, hogy a személyes adat szolgáltatása jogszabályon vagy szerződéses kötelezettségen alapul vagy szerződés kötésének előfeltétele-e, valamint hogy az érintett köteles-e a személyes adatokat megadni, továbbá hogy milyen lehetséges következményeikkel járhat az adatszolgáltatás elmaradása;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '2(f)',
  'f) a 22. cikk (1) és (4) bekezdésében említett automatizált döntéshozatal ténye, ideértve a profilalkotást is, valamint legalább ezekben az esetekben az alkalmazott logikára és arra vonatkozóan érthető információk, hogy az ilyen adatkezelés milyen jelentőséggel, és az érintettre nézve milyen várható következményekkel bír.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '3',
  '(3) Ha az adatkezelő a személyes adatokon a gyűjtésük céljától eltérő célból további adatkezelést kíván végezni, a további adatkezelést megelőzően tájékoztatnia kell az érintettet erről az eltérő célról és a (2) bekezdésben említett minden releváns kiegészítő információról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '13',
  '4',
  '(4) Az (1), (2) és (3) bekezdés nem alkalmazandó, ha és amilyen mértékben az érintett már rendelkezik az információkkal.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  null,
  'Rendelkezésre bocsátandó információk, ha a személyes adatokat nem az érintettől szerezték meg
(1) Ha a személyes adatokat nem az érintettől szerezték meg, az adatkezelő az érintett rendelkezésére bocsátja a következő információkat:

a)

az adatkezelőnek és – ha van ilyen – az adatkezelő képviselőjének a kiléte és elérhetőségei;

b)

az adatvédelmi tisztviselő elérhetőségei, ha van ilyen;

c)

a személyes adatok tervezett kezelésének célja, valamint az adatkezelés jogalapja;

d)

az érintett személyes adatok kategóriái;

e)

a személyes adatok címzettjei, illetve a címzettek kategóriái, ha van ilyen;

f)

adott esetben annak ténye, hogy az adatkezelő valamely harmadik országbeli címzett vagy valamely nemzetközi szervezet részére kívánja továbbítani a személyes adatokat, továbbá a Bizottság megfelelőségi határozatának léte vagy annak hiánya, vagy a 46. cikkben, a 47. cikkben vagy a 49. cikk (1) bekezdésének második albekezdésében említett adattovábbítás esetén a megfelelő és alkalmas garanciák megjelölése, valamint az ezek másolatának megszerzésére szolgáló módokra vagy az elérhetőségükre való hivatkozás.

(2) Az (1) bekezdésben említett információk mellett az adatkezelő az érintett rendelkezésére bocsátja az érintettre nézve tisztességes és átlátható adatkezelés biztosításához szükséges következő kiegészítő információkat:

a)

a személyes adatok tárolásának időtartama, vagy ha ez nem lehetséges, ezen időtartam meghatározásának szempontjai;

b)

ha az adatkezelés a 6. cikk (1) bekezdésének f) pontján alapul, az adatkezelő vagy harmadik fél jogos érdekeiről;

c)

az érintett azon joga, hogy kérelmezheti az adatkezelőtől a rá vonatkozó személyes adatokhoz való hozzáférést, azok helyesbítését, törlését vagy kezelésének korlátozását, és tiltakozhat a személyes adatok kezelése ellen, valamint az érintett adathordozhatósághoz való joga;

d)

a 6. cikk (1) bekezdésének a) pontján vagy a 9. cikk (2) bekezdésének a) pontján alapuló adatkezelés esetén a hozzájárulás bármely időpontban való visszavonásához való jog, amely nem érinti a visszavonás előtt a hozzájárulás alapján végrehajtott adatkezelés jogszerűségét;

e)

a valamely felügyeleti hatósághoz címzett panasz benyújtásának joga;

f)

a személyes adatok forrása és adott esetben az, hogy az adatok nyilvánosan hozzáférhető forrásokból származnak-e; és

g)

a 22. cikk (1) és (4) bekezdésében említett automatizált döntéshozatal ténye, ideértve a profilalkotást is, valamint legalább ezekben az esetekben az alkalmazott logikára és arra vonatkozó érthető információk, hogy az ilyen adatkezelés milyen jelentőséggel, és az érintettre nézve milyen várható következményekkel bír.

(3) Az adatkezelő az (1) és (2) bekezdés szerinti tájékoztatást az alábbiak szerint adja meg:

a)

a személyes adatok kezelésének konkrét körülményeit tekintetbe véve, a személyes adatok megszerzésétől számított észszerű határidőn, de legkésőbb egy hónapon belül;

b)

ha a személyes adatokat az érintettel való kapcsolattartás céljára használják, legalább az érintettel való első kapcsolatfelvétel alkalmával; vagy

c)

ha várhatóan más címzettel is közlik az adatokat, legkésőbb a személyes adatok első alkalommal való közlésekor.

(4) Ha az adatkezelő a személyes adatokon a megszerzésük céljától eltérő célból további adatkezelést kíván végezni, a további adatkezelést megelőzően tájékoztatnia kell az érintettet erről az eltérő célról és a (2) bekezdésben említett minden releváns kiegészítő információról.

(5) Az (1)–(4) bekezdést nem kell alkalmazni, ha és amilyen mértékben:

a)

az érintett már rendelkezik az információkkal;

b)

a szóban forgó információk rendelkezésre bocsátása lehetetlennek bizonyul, vagy aránytalanul nagy erőfeszítést igényelne, különösen a közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból, a 89. cikk (1) bekezdésében foglalt feltételek és garanciák figyelembevételével végzett adatkezelés esetében, vagy amennyiben az e cikk (1) bekezdésében említett kötelezettség valószínűsíthetően lehetetlenné tenné vagy komolyan veszélyeztetné ezen adatkezelés céljainak elérését. Ilyen esetekben az adatkezelőnek megfelelő intézkedéseket kell hoznia – az információk nyilvánosan elérhetővé tételét is ideértve – az érintett jogainak, szabadságainak és jogos érdekeinek védelme érdekében;

c)

az adat megszerzését vagy közlését kifejezetten előírja az adatkezelőre alkalmazandó uniós vagy tagállami jog, amely az érintett jogos érdekeinek védelmét szolgáló megfelelő intézkedésekről rendelkezik; vagy

d)

a személyes adatoknak valamely uniós vagy tagállami jogban előírt szakmai titoktartási kötelezettség alapján, ideértve a jogszabályon alapuló titoktartási kötelezettséget is, bizalmasnak kell maradnia.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '1',
  '(1) Ha a személyes adatokat nem az érintettől szerezték meg, az adatkezelő az érintett rendelkezésére bocsátja a következő információkat:

a)

az adatkezelőnek és – ha van ilyen – az adatkezelő képviselőjének a kiléte és elérhetőségei;

b)

az adatvédelmi tisztviselő elérhetőségei, ha van ilyen;

c)

a személyes adatok tervezett kezelésének célja, valamint az adatkezelés jogalapja;

d)

az érintett személyes adatok kategóriái;

e)

a személyes adatok címzettjei, illetve a címzettek kategóriái, ha van ilyen;

f)

adott esetben annak ténye, hogy az adatkezelő valamely harmadik országbeli címzett vagy valamely nemzetközi szervezet részére kívánja továbbítani a személyes adatokat, továbbá a Bizottság megfelelőségi határozatának léte vagy annak hiánya, vagy a 46. cikkben, a 47. cikkben vagy a 49. cikk (1) bekezdésének második albekezdésében említett adattovábbítás esetén a megfelelő és alkalmas garanciák megjelölése, valamint az ezek másolatának megszerzésére szolgáló módokra vagy az elérhetőségükre való hivatkozás.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '1(a)',
  'a) az adatkezelőnek és – ha van ilyen – az adatkezelő képviselőjének a kiléte és elérhetőségei;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '1(b)',
  'b) az adatvédelmi tisztviselő elérhetőségei, ha van ilyen;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '1(c)',
  'c) a személyes adatok tervezett kezelésének célja, valamint az adatkezelés jogalapja;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '1(d)',
  'd) az érintett személyes adatok kategóriái;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '1(e)',
  'e) a személyes adatok címzettjei, illetve a címzettek kategóriái, ha van ilyen;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '1(f)',
  'f) adott esetben annak ténye, hogy az adatkezelő valamely harmadik országbeli címzett vagy valamely nemzetközi szervezet részére kívánja továbbítani a személyes adatokat, továbbá a Bizottság megfelelőségi határozatának léte vagy annak hiánya, vagy a 46. cikkben, a 47. cikkben vagy a 49. cikk (1) bekezdésének második albekezdésében említett adattovábbítás esetén a megfelelő és alkalmas garanciák megjelölése, valamint az ezek másolatának megszerzésére szolgáló módokra vagy az elérhetőségükre való hivatkozás.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '2',
  '(2) Az (1) bekezdésben említett információk mellett az adatkezelő az érintett rendelkezésére bocsátja az érintettre nézve tisztességes és átlátható adatkezelés biztosításához szükséges következő kiegészítő információkat:

a)

a személyes adatok tárolásának időtartama, vagy ha ez nem lehetséges, ezen időtartam meghatározásának szempontjai;

b)

ha az adatkezelés a 6. cikk (1) bekezdésének f) pontján alapul, az adatkezelő vagy harmadik fél jogos érdekeiről;

c)

az érintett azon joga, hogy kérelmezheti az adatkezelőtől a rá vonatkozó személyes adatokhoz való hozzáférést, azok helyesbítését, törlését vagy kezelésének korlátozását, és tiltakozhat a személyes adatok kezelése ellen, valamint az érintett adathordozhatósághoz való joga;

d)

a 6. cikk (1) bekezdésének a) pontján vagy a 9. cikk (2) bekezdésének a) pontján alapuló adatkezelés esetén a hozzájárulás bármely időpontban való visszavonásához való jog, amely nem érinti a visszavonás előtt a hozzájárulás alapján végrehajtott adatkezelés jogszerűségét;

e)

a valamely felügyeleti hatósághoz címzett panasz benyújtásának joga;

f)

a személyes adatok forrása és adott esetben az, hogy az adatok nyilvánosan hozzáférhető forrásokból származnak-e; és

g)

a 22. cikk (1) és (4) bekezdésében említett automatizált döntéshozatal ténye, ideértve a profilalkotást is, valamint legalább ezekben az esetekben az alkalmazott logikára és arra vonatkozó érthető információk, hogy az ilyen adatkezelés milyen jelentőséggel, és az érintettre nézve milyen várható következményekkel bír.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '2(a)',
  'a) a személyes adatok tárolásának időtartama, vagy ha ez nem lehetséges, ezen időtartam meghatározásának szempontjai;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '2(b)',
  'b) ha az adatkezelés a 6. cikk (1) bekezdésének f) pontján alapul, az adatkezelő vagy harmadik fél jogos érdekeiről;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '2(c)',
  'c) az érintett azon joga, hogy kérelmezheti az adatkezelőtől a rá vonatkozó személyes adatokhoz való hozzáférést, azok helyesbítését, törlését vagy kezelésének korlátozását, és tiltakozhat a személyes adatok kezelése ellen, valamint az érintett adathordozhatósághoz való joga;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '2(d)',
  'd) a 6. cikk (1) bekezdésének a) pontján vagy a 9. cikk (2) bekezdésének a) pontján alapuló adatkezelés esetén a hozzájárulás bármely időpontban való visszavonásához való jog, amely nem érinti a visszavonás előtt a hozzájárulás alapján végrehajtott adatkezelés jogszerűségét;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '2(e)',
  'e) a valamely felügyeleti hatósághoz címzett panasz benyújtásának joga;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '2(f)',
  'f) a személyes adatok forrása és adott esetben az, hogy az adatok nyilvánosan hozzáférhető forrásokból származnak-e; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '2(g)',
  'g) a 22. cikk (1) és (4) bekezdésében említett automatizált döntéshozatal ténye, ideértve a profilalkotást is, valamint legalább ezekben az esetekben az alkalmazott logikára és arra vonatkozó érthető információk, hogy az ilyen adatkezelés milyen jelentőséggel, és az érintettre nézve milyen várható következményekkel bír.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '3',
  '(3) Az adatkezelő az (1) és (2) bekezdés szerinti tájékoztatást az alábbiak szerint adja meg:

a)

a személyes adatok kezelésének konkrét körülményeit tekintetbe véve, a személyes adatok megszerzésétől számított észszerű határidőn, de legkésőbb egy hónapon belül;

b)

ha a személyes adatokat az érintettel való kapcsolattartás céljára használják, legalább az érintettel való első kapcsolatfelvétel alkalmával; vagy

c)

ha várhatóan más címzettel is közlik az adatokat, legkésőbb a személyes adatok első alkalommal való közlésekor.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '3(a)',
  'a) a személyes adatok kezelésének konkrét körülményeit tekintetbe véve, a személyes adatok megszerzésétől számított észszerű határidőn, de legkésőbb egy hónapon belül;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '3(b)',
  'b) ha a személyes adatokat az érintettel való kapcsolattartás céljára használják, legalább az érintettel való első kapcsolatfelvétel alkalmával; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '3(c)',
  'c) ha várhatóan más címzettel is közlik az adatokat, legkésőbb a személyes adatok első alkalommal való közlésekor.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '4',
  '(4) Ha az adatkezelő a személyes adatokon a megszerzésük céljától eltérő célból további adatkezelést kíván végezni, a további adatkezelést megelőzően tájékoztatnia kell az érintettet erről az eltérő célról és a (2) bekezdésben említett minden releváns kiegészítő információról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '5',
  '(5) Az (1)–(4) bekezdést nem kell alkalmazni, ha és amilyen mértékben:

a)

az érintett már rendelkezik az információkkal;

b)

a szóban forgó információk rendelkezésre bocsátása lehetetlennek bizonyul, vagy aránytalanul nagy erőfeszítést igényelne, különösen a közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból, a 89. cikk (1) bekezdésében foglalt feltételek és garanciák figyelembevételével végzett adatkezelés esetében, vagy amennyiben az e cikk (1) bekezdésében említett kötelezettség valószínűsíthetően lehetetlenné tenné vagy komolyan veszélyeztetné ezen adatkezelés céljainak elérését. Ilyen esetekben az adatkezelőnek megfelelő intézkedéseket kell hoznia – az információk nyilvánosan elérhetővé tételét is ideértve – az érintett jogainak, szabadságainak és jogos érdekeinek védelme érdekében;

c)

az adat megszerzését vagy közlését kifejezetten előírja az adatkezelőre alkalmazandó uniós vagy tagállami jog, amely az érintett jogos érdekeinek védelmét szolgáló megfelelő intézkedésekről rendelkezik; vagy

d)

a személyes adatoknak valamely uniós vagy tagállami jogban előírt szakmai titoktartási kötelezettség alapján, ideértve a jogszabályon alapuló titoktartási kötelezettséget is, bizalmasnak kell maradnia.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '5(a)',
  'a) az érintett már rendelkezik az információkkal;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '5(b)',
  'b) a szóban forgó információk rendelkezésre bocsátása lehetetlennek bizonyul, vagy aránytalanul nagy erőfeszítést igényelne, különösen a közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból, a 89. cikk (1) bekezdésében foglalt feltételek és garanciák figyelembevételével végzett adatkezelés esetében, vagy amennyiben az e cikk (1) bekezdésében említett kötelezettség valószínűsíthetően lehetetlenné tenné vagy komolyan veszélyeztetné ezen adatkezelés céljainak elérését. Ilyen esetekben az adatkezelőnek megfelelő intézkedéseket kell hoznia – az információk nyilvánosan elérhetővé tételét is ideértve – az érintett jogainak, szabadságainak és jogos érdekeinek védelme érdekében;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '5(c)',
  'c) az adat megszerzését vagy közlését kifejezetten előírja az adatkezelőre alkalmazandó uniós vagy tagállami jog, amely az érintett jogos érdekeinek védelmét szolgáló megfelelő intézkedésekről rendelkezik; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '14',
  '5(d)',
  'd) a személyes adatoknak valamely uniós vagy tagállami jogban előírt szakmai titoktartási kötelezettség alapján, ideértve a jogszabályon alapuló titoktartási kötelezettséget is, bizalmasnak kell maradnia.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '15',
  null,
  'Az érintett hozzáférési joga
(1) Az érintett jogosult arra, hogy az adatkezelőtől visszajelzést kapjon arra vonatkozóan, hogy személyes adatainak kezelése folyamatban van-e, és ha ilyen adatkezelés folyamatban van, jogosult arra, hogy a személyes adatokhoz és a következő információkhoz hozzáférést kapjon:

a)

az adatkezelés céljai;

b)

az érintett személyes adatok kategóriái;

c)

azon címzettek vagy címzettek kategóriái, akikkel, illetve amelyekkel a személyes adatokat közölték vagy közölni fogják, ideértve különösen a harmadik országbeli címzetteket, illetve a nemzetközi szervezeteket;

d)

adott esetben a személyes adatok tárolásának tervezett időtartama, vagy ha ez nem lehetséges, ezen időtartam meghatározásának szempontjai;

e)

az érintett azon joga, hogy kérelmezheti az adatkezelőtől a rá vonatkozó személyes adatok helyesbítését, törlését vagy kezelésének korlátozását, és tiltakozhat az ilyen személyes adatok kezelése ellen;

f)

a valamely felügyeleti hatósághoz címzett panasz benyújtásának joga;

g)

ha az adatokat nem az érintettől gyűjtötték, a forrásukra vonatkozó minden elérhető információ;

h)

a 22. cikk (1) és (4) bekezdésében említett automatizált döntéshozatal ténye, ideértve a profilalkotást is, valamint legalább ezekben az esetekben az alkalmazott logikára és arra vonatkozó érthető információk, hogy az ilyen adatkezelés milyen jelentőséggel bír, és az érintettre nézve milyen várható következményekkel jár.

(2) Ha személyes adatoknak harmadik országba vagy nemzetközi szervezet részére történő továbbítására kerül sor, az érintett jogosult arra, hogy tájékoztatást kapjon a továbbításra vonatkozóan a 46. cikk szerinti megfelelő garanciákról.

(3) Az adatkezelő az adatkezelés tárgyát képező személyes adatok másolatát az érintett rendelkezésére bocsátja. Az érintett által kért további másolatokért az adatkezelő az adminisztratív költségeken alapuló, észszerű mértékű díjat számíthat fel. Ha az érintett elektronikus úton nyújtotta be a kérelmet, az információkat széles körben használt elektronikus formátumban kell rendelkezésre bocsátani, kivéve, ha az érintett másként kéri.

(4) A (3) bekezdésben említett, másolat igénylésére vonatkozó jog nem érintheti hátrányosan mások jogait és szabadságait.

3. szakasz

Helyesbítés és törlés',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '15',
  '1',
  '(1) Az érintett jogosult arra, hogy az adatkezelőtől visszajelzést kapjon arra vonatkozóan, hogy személyes adatainak kezelése folyamatban van-e, és ha ilyen adatkezelés folyamatban van, jogosult arra, hogy a személyes adatokhoz és a következő információkhoz hozzáférést kapjon:

a)

az adatkezelés céljai;

b)

az érintett személyes adatok kategóriái;

c)

azon címzettek vagy címzettek kategóriái, akikkel, illetve amelyekkel a személyes adatokat közölték vagy közölni fogják, ideértve különösen a harmadik országbeli címzetteket, illetve a nemzetközi szervezeteket;

d)

adott esetben a személyes adatok tárolásának tervezett időtartama, vagy ha ez nem lehetséges, ezen időtartam meghatározásának szempontjai;

e)

az érintett azon joga, hogy kérelmezheti az adatkezelőtől a rá vonatkozó személyes adatok helyesbítését, törlését vagy kezelésének korlátozását, és tiltakozhat az ilyen személyes adatok kezelése ellen;

f)

a valamely felügyeleti hatósághoz címzett panasz benyújtásának joga;

g)

ha az adatokat nem az érintettől gyűjtötték, a forrásukra vonatkozó minden elérhető információ;

h)

a 22. cikk (1) és (4) bekezdésében említett automatizált döntéshozatal ténye, ideértve a profilalkotást is, valamint legalább ezekben az esetekben az alkalmazott logikára és arra vonatkozó érthető információk, hogy az ilyen adatkezelés milyen jelentőséggel bír, és az érintettre nézve milyen várható következményekkel jár.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '15',
  '1(b)',
  'b) az érintett személyes adatok kategóriái;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '15',
  '1(c)',
  'c) azon címzettek vagy címzettek kategóriái, akikkel, illetve amelyekkel a személyes adatokat közölték vagy közölni fogják, ideértve különösen a harmadik országbeli címzetteket, illetve a nemzetközi szervezeteket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '15',
  '1(d)',
  'd) adott esetben a személyes adatok tárolásának tervezett időtartama, vagy ha ez nem lehetséges, ezen időtartam meghatározásának szempontjai;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '15',
  '1(e)',
  'e) az érintett azon joga, hogy kérelmezheti az adatkezelőtől a rá vonatkozó személyes adatok helyesbítését, törlését vagy kezelésének korlátozását, és tiltakozhat az ilyen személyes adatok kezelése ellen;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '15',
  '1(f)',
  'f) a valamely felügyeleti hatósághoz címzett panasz benyújtásának joga;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '15',
  '1(g)',
  'g) ha az adatokat nem az érintettől gyűjtötték, a forrásukra vonatkozó minden elérhető információ;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '15',
  '1(h)',
  'h) a 22. cikk (1) és (4) bekezdésében említett automatizált döntéshozatal ténye, ideértve a profilalkotást is, valamint legalább ezekben az esetekben az alkalmazott logikára és arra vonatkozó érthető információk, hogy az ilyen adatkezelés milyen jelentőséggel bír, és az érintettre nézve milyen várható következményekkel jár.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '15',
  '2',
  '(2) Ha személyes adatoknak harmadik országba vagy nemzetközi szervezet részére történő továbbítására kerül sor, az érintett jogosult arra, hogy tájékoztatást kapjon a továbbításra vonatkozóan a 46. cikk szerinti megfelelő garanciákról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '15',
  '3',
  '(3) Az adatkezelő az adatkezelés tárgyát képező személyes adatok másolatát az érintett rendelkezésére bocsátja. Az érintett által kért további másolatokért az adatkezelő az adminisztratív költségeken alapuló, észszerű mértékű díjat számíthat fel. Ha az érintett elektronikus úton nyújtotta be a kérelmet, az információkat széles körben használt elektronikus formátumban kell rendelkezésre bocsátani, kivéve, ha az érintett másként kéri.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '15',
  '4',
  '(4) A (3) bekezdésben említett, másolat igénylésére vonatkozó jog nem érintheti hátrányosan mások jogait és szabadságait.

3. szakasz

Helyesbítés és törlés',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '16',
  null,
  'A helyesbítéshez való jog
Az érintett jogosult arra, hogy kérésére az adatkezelő indokolatlan késedelem nélkül helyesbítse a rá vonatkozó pontatlan személyes adatokat. Figyelembe véve az adatkezelés célját, az érintett jogosult arra, hogy kérje a hiányos személyes adatok – egyebek mellett kiegészítő nyilatkozat útján történő – kiegészítését.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_16'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  null,
  'A törléshez való jog („az elfeledtetéshez való jog”)
(1) Az érintett jogosult arra, hogy kérésére az adatkezelő indokolatlan késedelem nélkül törölje a rá vonatkozó személyes adatokat, az adatkezelő pedig köteles arra, hogy az érintettre vonatkozó személyes adatokat indokolatlan késedelem nélkül törölje, ha az alábbi indokok valamelyike fennáll:

a)

a személyes adatokra már nincs szükség abból a célból, amelyből azokat gyűjtötték vagy más módon kezelték;

b)

az érintett visszavonja a 6. cikk (1) bekezdésének a) pontja vagy a 9. cikk (2) bekezdésének a) pontja értelmében az adatkezelés alapját képező hozzájárulását, és az adatkezelésnek nincs más jogalapja;

c)

az érintett a 21. cikk (1) bekezdése alapján tiltakozik az adatkezeléseó ellen, és nincs elsőbbséget élvező jogszerű ok az adatkezelésre, vagy az érintett a 21. cikk (2) bekezdése alapján tiltakozik az adatkezelés ellen;

d)

a személyes adatokat jogellenesen kezelték;

e)

a személyes adatokat az adatkezelőre alkalmazandó uniós vagy tagállami jogban előírt jogi kötelezettség teljesítéséhez törölni kell;

f)

a személyes adatok gyűjtésére a 8. cikk (1) bekezdésében említett, információs társadalommal összefüggő szolgáltatások kínálásával kapcsolatosan került sor.

(2) Ha az adatkezelő nyilvánosságra hozta a személyes adatot, és az (1) bekezdés értelmében azt törölni köteles, az elérhető technológia és a megvalósítás költségeinek figyelembevételével megteszi az észszerűen elvárható lépéseket – ideértve technikai intézkedéseket – annak érdekében, hogy tájékoztassa az adatokat kezelő adatkezelőket, hogy az érintett kérelmezte tőlük a szóban forgó személyes adatokra mutató linkek vagy e személyes adatok másolatának, illetve másodpéldányának törlését.

(3) Az (1) és (2) bekezdés nem alkalmazandó, amennyiben az adatkezelés szükséges:

a)

a véleménynyilvánítás szabadságához és a tájékozódáshoz való jog gyakorlása céljából;

b)

a személyes adatok kezelését előíró, az adatkezelőre alkalmazandó uniós vagy tagállami jog szerinti kötelezettség teljesítése, illetve közérdekből vagy az adatkezelőre ruházott közhatalmi jogosítvány gyakorlása keretében végzett feladat végrehajtása céljából;

c)

a 9. cikk (2) bekezdése h) és i) pontjának, valamint a 9. cikk (3) bekezdésének megfelelően a népegészségügy területét érintő közérdek alapján;

d)

a 89. cikk (1) bekezdésével összhangban a közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból, amennyiben az (1) bekezdésben említett jog valószínűsíthetően lehetetlenné tenné vagy komolyan veszélyeztetné ezt az adatkezelést; vagy

e)

jogi igények előterjesztéséhez, érvényesítéséhez, illetve védelméhez.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '1',
  '(1) Az érintett jogosult arra, hogy kérésére az adatkezelő indokolatlan késedelem nélkül törölje a rá vonatkozó személyes adatokat, az adatkezelő pedig köteles arra, hogy az érintettre vonatkozó személyes adatokat indokolatlan késedelem nélkül törölje, ha az alábbi indokok valamelyike fennáll:

a)

a személyes adatokra már nincs szükség abból a célból, amelyből azokat gyűjtötték vagy más módon kezelték;

b)

az érintett visszavonja a 6. cikk (1) bekezdésének a) pontja vagy a 9. cikk (2) bekezdésének a) pontja értelmében az adatkezelés alapját képező hozzájárulását, és az adatkezelésnek nincs más jogalapja;

c)

az érintett a 21. cikk (1) bekezdése alapján tiltakozik az adatkezeléseó ellen, és nincs elsőbbséget élvező jogszerű ok az adatkezelésre, vagy az érintett a 21. cikk (2) bekezdése alapján tiltakozik az adatkezelés ellen;

d)

a személyes adatokat jogellenesen kezelték;

e)

a személyes adatokat az adatkezelőre alkalmazandó uniós vagy tagállami jogban előírt jogi kötelezettség teljesítéséhez törölni kell;

f)

a személyes adatok gyűjtésére a 8. cikk (1) bekezdésében említett, információs társadalommal összefüggő szolgáltatások kínálásával kapcsolatosan került sor.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '1(a)',
  'a) a személyes adatokra már nincs szükség abból a célból, amelyből azokat gyűjtötték vagy más módon kezelték;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '1(b)',
  'b) az érintett visszavonja a 6. cikk (1) bekezdésének a) pontja vagy a 9. cikk (2) bekezdésének a) pontja értelmében az adatkezelés alapját képező hozzájárulását, és az adatkezelésnek nincs más jogalapja;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '1(c)',
  'c) az érintett a 21. cikk (1) bekezdése alapján tiltakozik az adatkezeléseó ellen, és nincs elsőbbséget élvező jogszerű ok az adatkezelésre, vagy az érintett a 21. cikk (2) bekezdése alapján tiltakozik az adatkezelés ellen;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '1(d)',
  'd) a személyes adatokat jogellenesen kezelték;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '1(e)',
  'e) a személyes adatokat az adatkezelőre alkalmazandó uniós vagy tagállami jogban előírt jogi kötelezettség teljesítéséhez törölni kell;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '1(f)',
  'f) a személyes adatok gyűjtésére a 8. cikk (1) bekezdésében említett, információs társadalommal összefüggő szolgáltatások kínálásával kapcsolatosan került sor.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '2',
  '(2) Ha az adatkezelő nyilvánosságra hozta a személyes adatot, és az (1) bekezdés értelmében azt törölni köteles, az elérhető technológia és a megvalósítás költségeinek figyelembevételével megteszi az észszerűen elvárható lépéseket – ideértve technikai intézkedéseket – annak érdekében, hogy tájékoztassa az adatokat kezelő adatkezelőket, hogy az érintett kérelmezte tőlük a szóban forgó személyes adatokra mutató linkek vagy e személyes adatok másolatának, illetve másodpéldányának törlését.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '3',
  '(3) Az (1) és (2) bekezdés nem alkalmazandó, amennyiben az adatkezelés szükséges:

a)

a véleménynyilvánítás szabadságához és a tájékozódáshoz való jog gyakorlása céljából;

b)

a személyes adatok kezelését előíró, az adatkezelőre alkalmazandó uniós vagy tagállami jog szerinti kötelezettség teljesítése, illetve közérdekből vagy az adatkezelőre ruházott közhatalmi jogosítvány gyakorlása keretében végzett feladat végrehajtása céljából;

c)

a 9. cikk (2) bekezdése h) és i) pontjának, valamint a 9. cikk (3) bekezdésének megfelelően a népegészségügy területét érintő közérdek alapján;

d)

a 89. cikk (1) bekezdésével összhangban a közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból, amennyiben az (1) bekezdésben említett jog valószínűsíthetően lehetetlenné tenné vagy komolyan veszélyeztetné ezt az adatkezelést; vagy

e)

jogi igények előterjesztéséhez, érvényesítéséhez, illetve védelméhez.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '3(a)',
  'a) a véleménynyilvánítás szabadságához és a tájékozódáshoz való jog gyakorlása céljából;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '3(b)',
  'b) a személyes adatok kezelését előíró, az adatkezelőre alkalmazandó uniós vagy tagállami jog szerinti kötelezettség teljesítése, illetve közérdekből vagy az adatkezelőre ruházott közhatalmi jogosítvány gyakorlása keretében végzett feladat végrehajtása céljából;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '3(c)',
  'c) a 9. cikk (2) bekezdése h) és i) pontjának, valamint a 9. cikk (3) bekezdésének megfelelően a népegészségügy területét érintő közérdek alapján;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '3(d)',
  'd) a 89. cikk (1) bekezdésével összhangban a közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból, amennyiben az (1) bekezdésben említett jog valószínűsíthetően lehetetlenné tenné vagy komolyan veszélyeztetné ezt az adatkezelést; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '17',
  '3(e)',
  'e) jogi igények előterjesztéséhez, érvényesítéséhez, illetve védelméhez.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '18',
  null,
  'Az adatkezelés korlátozásához való jog
(1) Az érintett jogosult arra, hogy kérésére az adatkezelő korlátozza az adatkezelést, ha az alábbiak valamelyike teljesül:

a)

az érintett vitatja a személyes adatok pontosságát, ez esetben a korlátozás arra az időtartamra vonatkozik, amely lehetővé teszi, hogy az adatkezelő ellenőrizze a személyes adatok pontosságát;

b)

az adatkezelés jogellenes, és az érintett ellenzi az adatok törlését, és ehelyett kéri azok felhasználásának korlátozását;

c)

az adatkezelőnek már nincs szüksége a személyes adatokra adatkezelés céljából, de az érintett igényli azokat jogi igények előterjesztéséhez, érvényesítéséhez vagy védelméhez; vagy

d)

az érintett a 21. cikk (1) bekezdése szerint tiltakozott az adatkezelés ellen; ez esetben a korlátozás arra az időtartamra vonatkozik, amíg megállapításra nem kerül, hogy az adatkezelő jogos indokai elsőbbséget élveznek-e az érintett jogos indokaival szemben.

(2) Ha az adatkezelés az (1) bekezdés alapján korlátozás alá esik, az ilyen személyes adatokat a tárolás kivételével csak az érintett hozzájárulásával, vagy jogi igények előterjesztéséhez, érvényesítéséhez vagy védelméhez, vagy más természetes vagy jogi személy jogainak védelme érdekében, vagy az Unió, illetve valamely tagállam fontos közérdekéből lehet kezelni.

(3) Az adatkezelő az érintettet, akinek a kérésére az (1) bekezdés alapján korlátozták az adatkezelést, az adatkezelés korlátozásának feloldásáról előzetesen tájékoztatja.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '18',
  '1',
  '(1) Az érintett jogosult arra, hogy kérésére az adatkezelő korlátozza az adatkezelést, ha az alábbiak valamelyike teljesül:

a)

az érintett vitatja a személyes adatok pontosságát, ez esetben a korlátozás arra az időtartamra vonatkozik, amely lehetővé teszi, hogy az adatkezelő ellenőrizze a személyes adatok pontosságát;

b)

az adatkezelés jogellenes, és az érintett ellenzi az adatok törlését, és ehelyett kéri azok felhasználásának korlátozását;

c)

az adatkezelőnek már nincs szüksége a személyes adatokra adatkezelés céljából, de az érintett igényli azokat jogi igények előterjesztéséhez, érvényesítéséhez vagy védelméhez; vagy

d)

az érintett a 21. cikk (1) bekezdése szerint tiltakozott az adatkezelés ellen; ez esetben a korlátozás arra az időtartamra vonatkozik, amíg megállapításra nem kerül, hogy az adatkezelő jogos indokai elsőbbséget élveznek-e az érintett jogos indokaival szemben.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '18',
  '1(a)',
  'a) az érintett vitatja a személyes adatok pontosságát, ez esetben a korlátozás arra az időtartamra vonatkozik, amely lehetővé teszi, hogy az adatkezelő ellenőrizze a személyes adatok pontosságát;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '18',
  '1(b)',
  'b) az adatkezelés jogellenes, és az érintett ellenzi az adatok törlését, és ehelyett kéri azok felhasználásának korlátozását;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '18',
  '1(c)',
  'c) az adatkezelőnek már nincs szüksége a személyes adatokra adatkezelés céljából, de az érintett igényli azokat jogi igények előterjesztéséhez, érvényesítéséhez vagy védelméhez; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '18',
  '1(d)',
  'd) az érintett a 21. cikk (1) bekezdése szerint tiltakozott az adatkezelés ellen; ez esetben a korlátozás arra az időtartamra vonatkozik, amíg megállapításra nem kerül, hogy az adatkezelő jogos indokai elsőbbséget élveznek-e az érintett jogos indokaival szemben.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '18',
  '2',
  '(2) Ha az adatkezelés az (1) bekezdés alapján korlátozás alá esik, az ilyen személyes adatokat a tárolás kivételével csak az érintett hozzájárulásával, vagy jogi igények előterjesztéséhez, érvényesítéséhez vagy védelméhez, vagy más természetes vagy jogi személy jogainak védelme érdekében, vagy az Unió, illetve valamely tagállam fontos közérdekéből lehet kezelni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '18',
  '3',
  '(3) Az adatkezelő az érintettet, akinek a kérésére az (1) bekezdés alapján korlátozták az adatkezelést, az adatkezelés korlátozásának feloldásáról előzetesen tájékoztatja.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '19',
  null,
  'A személyes adatok helyesbítéséhez vagy törléséhez, illetve az adatkezelés korlátozásához kapcsolódó értesítési kötelezettség
Az adatkezelő minden olyan címzettet tájékoztat a 16. cikk, a 17. cikk (1) bekezdése, illetve a 18. cikk szerinti valamennyi helyesbítésről, törlésről vagy adatkezelés-korlátozásról, akivel, illetve amellyel a személyes adatot közölték, kivéve, ha ez lehetetlennek bizonyul, vagy aránytalanul nagy erőfeszítést igényel. Az érintettet kérésére az adatkezelő tájékoztatja e címzettekről.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_19'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '20',
  null,
  'Az adathordozhatósághoz való jog
(1) Az érintett jogosult arra, hogy a rá vonatkozó, általa egy adatkezelő rendelkezésére bocsátott személyes adatokat tagolt, széles körben használt, géppel olvasható formátumban megkapja, továbbá jogosult arra, hogy ezeket az adatokat egy másik adatkezelőnek továbbítsa anélkül, hogy ezt akadályozná az az adatkezelő, amelynek a személyes adatokat a rendelkezésére bocsátotta, ha:

a)

az adatkezelés a 6. cikk (1) bekezdésének a) pontja vagy a 9. cikk (2) bekezdésének a) pontja szerinti hozzájáruláson, vagy a 6. cikk (1) bekezdésének b) pontja szerinti szerződésen alapul; és

b)

az adatkezelés automatizált módon történik.

(2) Az adatok hordozhatóságához való jog (1) bekezdés szerinti gyakorlása során az érintett jogosult arra, hogy – ha ez technikailag megvalósítható – kérje a személyes adatok adatkezelők közötti közvetlen továbbítását.

(3) Az e cikk (1) bekezdésében említett jog gyakorlása nem sértheti a 17. cikket. Az említett jog nem alkalmazandó abban az esetben, ha az adatkezelés közérdekű vagy az adatkezelőre ruházott közhatalmi jogosítványai gyakorlásának keretében végzett feladat végrehajtásához szükséges.

(4) Az (1) bekezdésben említett jog nem érintheti hátrányosan mások jogait és szabadságait.

4. szakasz

A tiltakozáshoz való jog és automatizált döntéshozatal egyedi ügyekben',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_20'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '20',
  '1',
  '(1) Az érintett jogosult arra, hogy a rá vonatkozó, általa egy adatkezelő rendelkezésére bocsátott személyes adatokat tagolt, széles körben használt, géppel olvasható formátumban megkapja, továbbá jogosult arra, hogy ezeket az adatokat egy másik adatkezelőnek továbbítsa anélkül, hogy ezt akadályozná az az adatkezelő, amelynek a személyes adatokat a rendelkezésére bocsátotta, ha:

a)

az adatkezelés a 6. cikk (1) bekezdésének a) pontja vagy a 9. cikk (2) bekezdésének a) pontja szerinti hozzájáruláson, vagy a 6. cikk (1) bekezdésének b) pontja szerinti szerződésen alapul; és

b)

az adatkezelés automatizált módon történik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_20'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '20',
  '1(a)',
  'a) az adatkezelés a 6. cikk (1) bekezdésének a) pontja vagy a 9. cikk (2) bekezdésének a) pontja szerinti hozzájáruláson, vagy a 6. cikk (1) bekezdésének b) pontja szerinti szerződésen alapul; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_20'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '20',
  '1(b)',
  'b) az adatkezelés automatizált módon történik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_20'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '20',
  '2',
  '(2) Az adatok hordozhatóságához való jog (1) bekezdés szerinti gyakorlása során az érintett jogosult arra, hogy – ha ez technikailag megvalósítható – kérje a személyes adatok adatkezelők közötti közvetlen továbbítását.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_20'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '20',
  '3',
  '(3) Az e cikk (1) bekezdésében említett jog gyakorlása nem sértheti a 17. cikket. Az említett jog nem alkalmazandó abban az esetben, ha az adatkezelés közérdekű vagy az adatkezelőre ruházott közhatalmi jogosítványai gyakorlásának keretében végzett feladat végrehajtásához szükséges.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_20'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '20',
  '4',
  '(4) Az (1) bekezdésben említett jog nem érintheti hátrányosan mások jogait és szabadságait.

4. szakasz

A tiltakozáshoz való jog és automatizált döntéshozatal egyedi ügyekben',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_20'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '21',
  null,
  'A tiltakozáshoz való jog
(1) Az érintett jogosult arra, hogy a saját helyzetével kapcsolatos okokból bármikor tiltakozzon személyes adatainak a 6. cikk (1) bekezdésének e) vagy f) pontján alapuló kezelése ellen, ideértve az említett rendelkezéseken alapuló profilalkotást is. Ebben az esetben az adatkezelő a személyes adatokat nem kezelheti tovább, kivéve, ha az adatkezelő bizonyítja, hogy az adatkezelést olyan kényszerítő erejű jogos okok indokolják, amelyek elsőbbséget élveznek az érintett érdekeivel, jogaival és szabadságaival szemben, vagy amelyek jogi igények előterjesztéséhez, érvényesítéséhez vagy védelméhez kapcsolódnak.

(2) Ha a személyes adatok kezelése közvetlen üzletszerzés érdekében történik, az érintett jogosult arra, hogy bármikor tiltakozzon a rá vonatkozó személyes adatok e célból történő kezelése ellen, ideértve a profilalkotást is, amennyiben az a közvetlen üzletszerzéshez kapcsolódik.

(3) Ha az érintett tiltakozik a személyes adatok közvetlen üzletszerzés érdekében történő kezelése ellen, akkor a személyes adatok a továbbiakban e célból nem kezelhetők.

(4) Az (1) és (2) bekezdésben említett jogra legkésőbb az érintettel való első kapcsolatfelvétel során kifejezetten fel kell hívni annak figyelmét, és az erre vonatkozó tájékoztatást egyértelműen és minden más információtól elkülönítve kell megjeleníteni.

(5) Az információs társadalommal összefüggő szolgáltatások igénybevételéhez kapcsolódóan és a 2002/58/EK irányelvtől eltérve az érintett a tiltakozáshoz való jogot műszaki előírásokon alapuló automatizált eszközökkel is gyakorolhatja.

(6) Ha a személyes adatok kezelésére a 89. cikk (1) bekezdésének megfelelően tudományos és történelmi kutatási célból vagy statisztikai célból kerül sor, az érintett jogosult arra, hogy a saját helyzetével kapcsolatos okokból tiltakozhasson a rá vonatkozó személyes adatok kezelése ellen, kivéve, ha az adatkezelésre közérdekű okból végzett feladat végrehajtása érdekében van szükség.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_21'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '21',
  '1',
  '(1) Az érintett jogosult arra, hogy a saját helyzetével kapcsolatos okokból bármikor tiltakozzon személyes adatainak a 6. cikk (1) bekezdésének e) vagy f) pontján alapuló kezelése ellen, ideértve az említett rendelkezéseken alapuló profilalkotást is. Ebben az esetben az adatkezelő a személyes adatokat nem kezelheti tovább, kivéve, ha az adatkezelő bizonyítja, hogy az adatkezelést olyan kényszerítő erejű jogos okok indokolják, amelyek elsőbbséget élveznek az érintett érdekeivel, jogaival és szabadságaival szemben, vagy amelyek jogi igények előterjesztéséhez, érvényesítéséhez vagy védelméhez kapcsolódnak.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_21'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '21',
  '2',
  '(2) Ha a személyes adatok kezelése közvetlen üzletszerzés érdekében történik, az érintett jogosult arra, hogy bármikor tiltakozzon a rá vonatkozó személyes adatok e célból történő kezelése ellen, ideértve a profilalkotást is, amennyiben az a közvetlen üzletszerzéshez kapcsolódik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_21'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '21',
  '3',
  '(3) Ha az érintett tiltakozik a személyes adatok közvetlen üzletszerzés érdekében történő kezelése ellen, akkor a személyes adatok a továbbiakban e célból nem kezelhetők.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_21'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '21',
  '4',
  '(4) Az (1) és (2) bekezdésben említett jogra legkésőbb az érintettel való első kapcsolatfelvétel során kifejezetten fel kell hívni annak figyelmét, és az erre vonatkozó tájékoztatást egyértelműen és minden más információtól elkülönítve kell megjeleníteni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_21'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '21',
  '5',
  '(5) Az információs társadalommal összefüggő szolgáltatások igénybevételéhez kapcsolódóan és a 2002/58/EK irányelvtől eltérve az érintett a tiltakozáshoz való jogot műszaki előírásokon alapuló automatizált eszközökkel is gyakorolhatja.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_21'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '21',
  '6',
  '(6) Ha a személyes adatok kezelésére a 89. cikk (1) bekezdésének megfelelően tudományos és történelmi kutatási célból vagy statisztikai célból kerül sor, az érintett jogosult arra, hogy a saját helyzetével kapcsolatos okokból tiltakozhasson a rá vonatkozó személyes adatok kezelése ellen, kivéve, ha az adatkezelésre közérdekű okból végzett feladat végrehajtása érdekében van szükség.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_21'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '22',
  null,
  'Automatizált döntéshozatal egyedi ügyekben, beleértve a profilalkotást
(1) Az érintett jogosult arra, hogy ne terjedjen ki rá az olyan, kizárólag automatizált adatkezelésen – ideértve a profilalkotást is – alapuló döntés hatálya, amely rá nézve joghatással járna vagy őt hasonlóképpen jelentős mértékben érintené.

(2) Az (1) bekezdés nem alkalmazandó abban az esetben, ha a döntés:

a)

az érintett és az adatkezelő közötti szerződés megkötése vagy teljesítése érdekében szükséges;

b)

meghozatalát az adatkezelőre alkalmazandó olyan uniós vagy tagállami jog teszi lehetővé, amely az érintett jogainak és szabadságainak, valamint jogos érdekeinek védelmét szolgáló megfelelő intézkedéseket is megállapít; vagy

c)

az érintett kifejezett hozzájárulásán alapul.

(3) A (2) bekezdés a) és c) pontjában említett esetekben az adatkezelő köteles megfelelő intézkedéseket tenni az érintett jogainak, szabadságainak és jogos érdekeinek védelme érdekében, ideértve az érintettnek legalább azt a jogát, hogy az adatkezelő részéről emberi beavatkozást kérjen, álláspontját kifejezze, és a döntéssel szemben kifogást nyújtson be.

(4) A (2) bekezdésben említett döntések nem alapulhatnak a személyes adatoknak a 9. cikk (1) bekezdésében említett különleges kategóriáin, kivéve, ha a 9. cikk (2) bekezdésének a) vagy g) pontja alkalmazandó, és az érintett jogainak, szabadságainak és jogos érdekeinek védelme érdekében megfelelő intézkedések megtételére került sor.

5. szakasz

Korlátozások',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '22',
  '1',
  '(1) Az érintett jogosult arra, hogy ne terjedjen ki rá az olyan, kizárólag automatizált adatkezelésen – ideértve a profilalkotást is – alapuló döntés hatálya, amely rá nézve joghatással járna vagy őt hasonlóképpen jelentős mértékben érintené.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '22',
  '2',
  '(2) Az (1) bekezdés nem alkalmazandó abban az esetben, ha a döntés:

a)

az érintett és az adatkezelő közötti szerződés megkötése vagy teljesítése érdekében szükséges;

b)

meghozatalát az adatkezelőre alkalmazandó olyan uniós vagy tagállami jog teszi lehetővé, amely az érintett jogainak és szabadságainak, valamint jogos érdekeinek védelmét szolgáló megfelelő intézkedéseket is megállapít; vagy

c)

az érintett kifejezett hozzájárulásán alapul.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '22',
  '2(a)',
  'a) az érintett és az adatkezelő közötti szerződés megkötése vagy teljesítése érdekében szükséges;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '22',
  '2(b)',
  'b) meghozatalát az adatkezelőre alkalmazandó olyan uniós vagy tagállami jog teszi lehetővé, amely az érintett jogainak és szabadságainak, valamint jogos érdekeinek védelmét szolgáló megfelelő intézkedéseket is megállapít; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '22',
  '2(c)',
  'c) az érintett kifejezett hozzájárulásán alapul.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '22',
  '3',
  '(3) A (2) bekezdés a) és c) pontjában említett esetekben az adatkezelő köteles megfelelő intézkedéseket tenni az érintett jogainak, szabadságainak és jogos érdekeinek védelme érdekében, ideértve az érintettnek legalább azt a jogát, hogy az adatkezelő részéről emberi beavatkozást kérjen, álláspontját kifejezze, és a döntéssel szemben kifogást nyújtson be.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '22',
  '4',
  '(4) A (2) bekezdésben említett döntések nem alapulhatnak a személyes adatoknak a 9. cikk (1) bekezdésében említett különleges kategóriáin, kivéve, ha a 9. cikk (2) bekezdésének a) vagy g) pontja alkalmazandó, és az érintett jogainak, szabadságainak és jogos érdekeinek védelme érdekében megfelelő intézkedések megtételére került sor.

5. szakasz

Korlátozások',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  null,
  'Korlátozások
(1) Az adatkezelőre vagy adatfeldolgozóra alkalmazandó uniós vagy tagállami jog jogalkotási intézkedésekkel korlátozhatja a 12–22. cikkben és a 34. cikkben foglalt, valamint a 12–22. cikkben meghatározott jogokkal és kötelezettségekkel összhangban lévő rendelkezései tekintetében az 5. cikkben foglalt jogok és kötelezettségek hatályát, ha a korlátozás tiszteletben tartja az alapvető jogok és szabadságok lényeges tartalmát, valamint az alábbiak védelméhez szükséges és arányos intézkedés egy demokratikus társadalomban:

a)

nemzetbiztonság;

b)

honvédelem;

c)

közbiztonság;

d)

bűncselekmények megelőzése, nyomozása, felderítése vagy a vádeljárás lefolytatása, illetve büntetőjogi szankciók végrehajtása, beleértve a közbiztonságot fenyegető veszélyekkel szembeni védelmet és e veszélyek megelőzését;

e)

az Unió vagy valamely tagállam egyéb fontos, általános közérdekű célkitűzései, különösen az Unió vagy valamely tagállam fontos gazdasági vagy pénzügyi érdeke, beleértve a monetáris, a költségvetési és az adózási kérdéseket, a népegészségügyet és a szociális biztonságot;

f)

a bírói függetlenség és a bírósági eljárások védelme;

g)

a szabályozott foglalkozások esetében az etikai vétségek megelőzése, kivizsgálása, felderítése és az ezekkel kapcsolatos eljárások lefolytatása;

h)

az a)–e) és a g) pontban említett esetekben – akár alkalmanként – a közhatalmi feladatok ellátásához kapcsolódó ellenőrzési, vizsgálati vagy szabályozási tevékenység;

i)

az érintett védelme vagy mások jogainak és szabadságainak védelme;

j)

polgári jogi követelések érvényesítése.

(2) Az (1) bekezdésben említett jogalkotási intézkedések adott esetben részletes rendelkezéseket tartalmaznak legalább:

a)

az adatkezelés céljaira vagy az adatkezelés kategóriáira,

b)

a személyes adatok kategóriáira,

c)

a bevezetett korlátozások hatályára,

d)

a visszaélésre, illetve a jogosulatlan hozzáférésre vagy továbbítás megakadályozását célzó garanciákra,

e)

az adatkezelő meghatározására vagy az adatkezelők kategóriáinak meghatározására,

f)

az adattárolás időtartamára, valamint az alkalmazandó garanciákra, figyelembe véve az adatkezelés vagy az adatkezelési kategóriák jellegét, hatályát és céljait,

g)

az érintettek jogait és szabadságait érintő kockázatokra, és

h)

az érintettek arra vonatkozó jogára, hogy tájékoztatást kapjanak a korlátozásról, kivéve, ha ez hátrányosan befolyásolhatja a korlátozás célját.

IV. FEJEZET

Az adatkezelő és az adatfeldolgozó

1. szakasz

Általános kötelezettségek',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '1',
  '(1) Az adatkezelőre vagy adatfeldolgozóra alkalmazandó uniós vagy tagállami jog jogalkotási intézkedésekkel korlátozhatja a 12–22. cikkben és a 34. cikkben foglalt, valamint a 12–22. cikkben meghatározott jogokkal és kötelezettségekkel összhangban lévő rendelkezései tekintetében az 5. cikkben foglalt jogok és kötelezettségek hatályát, ha a korlátozás tiszteletben tartja az alapvető jogok és szabadságok lényeges tartalmát, valamint az alábbiak védelméhez szükséges és arányos intézkedés egy demokratikus társadalomban:

a)

nemzetbiztonság;

b)

honvédelem;

c)

közbiztonság;

d)

bűncselekmények megelőzése, nyomozása, felderítése vagy a vádeljárás lefolytatása, illetve büntetőjogi szankciók végrehajtása, beleértve a közbiztonságot fenyegető veszélyekkel szembeni védelmet és e veszélyek megelőzését;

e)

az Unió vagy valamely tagállam egyéb fontos, általános közérdekű célkitűzései, különösen az Unió vagy valamely tagállam fontos gazdasági vagy pénzügyi érdeke, beleértve a monetáris, a költségvetési és az adózási kérdéseket, a népegészségügyet és a szociális biztonságot;

f)

a bírói függetlenség és a bírósági eljárások védelme;

g)

a szabályozott foglalkozások esetében az etikai vétségek megelőzése, kivizsgálása, felderítése és az ezekkel kapcsolatos eljárások lefolytatása;

h)

az a)–e) és a g) pontban említett esetekben – akár alkalmanként – a közhatalmi feladatok ellátásához kapcsolódó ellenőrzési, vizsgálati vagy szabályozási tevékenység;

i)

az érintett védelme vagy mások jogainak és szabadságainak védelme;

j)

polgári jogi követelések érvényesítése.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '1(d)',
  'd) bűncselekmények megelőzése, nyomozása, felderítése vagy a vádeljárás lefolytatása, illetve büntetőjogi szankciók végrehajtása, beleértve a közbiztonságot fenyegető veszélyekkel szembeni védelmet és e veszélyek megelőzését;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '1(e)',
  'e) az Unió vagy valamely tagállam egyéb fontos, általános közérdekű célkitűzései, különösen az Unió vagy valamely tagállam fontos gazdasági vagy pénzügyi érdeke, beleértve a monetáris, a költségvetési és az adózási kérdéseket, a népegészségügyet és a szociális biztonságot;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '1(f)',
  'f) a bírói függetlenség és a bírósági eljárások védelme;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '1(g)',
  'g) a szabályozott foglalkozások esetében az etikai vétségek megelőzése, kivizsgálása, felderítése és az ezekkel kapcsolatos eljárások lefolytatása;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '1(h)',
  'h) az a)–e) és a g) pontban említett esetekben – akár alkalmanként – a közhatalmi feladatok ellátásához kapcsolódó ellenőrzési, vizsgálati vagy szabályozási tevékenység;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '1(i)',
  'i) az érintett védelme vagy mások jogainak és szabadságainak védelme;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '1(j)',
  'j) polgári jogi követelések érvényesítése.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '2',
  '(2) Az (1) bekezdésben említett jogalkotási intézkedések adott esetben részletes rendelkezéseket tartalmaznak legalább:

a)

az adatkezelés céljaira vagy az adatkezelés kategóriáira,

b)

a személyes adatok kategóriáira,

c)

a bevezetett korlátozások hatályára,

d)

a visszaélésre, illetve a jogosulatlan hozzáférésre vagy továbbítás megakadályozását célzó garanciákra,

e)

az adatkezelő meghatározására vagy az adatkezelők kategóriáinak meghatározására,

f)

az adattárolás időtartamára, valamint az alkalmazandó garanciákra, figyelembe véve az adatkezelés vagy az adatkezelési kategóriák jellegét, hatályát és céljait,

g)

az érintettek jogait és szabadságait érintő kockázatokra, és

h)

az érintettek arra vonatkozó jogára, hogy tájékoztatást kapjanak a korlátozásról, kivéve, ha ez hátrányosan befolyásolhatja a korlátozás célját.

IV. FEJEZET

Az adatkezelő és az adatfeldolgozó

1. szakasz

Általános kötelezettségek',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '2(a)',
  'a) az adatkezelés céljaira vagy az adatkezelés kategóriáira,',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '2(b)',
  'b) a személyes adatok kategóriáira,',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '2(c)',
  'c) a bevezetett korlátozások hatályára,',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '2(d)',
  'd) a visszaélésre, illetve a jogosulatlan hozzáférésre vagy továbbítás megakadályozását célzó garanciákra,',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '2(e)',
  'e) az adatkezelő meghatározására vagy az adatkezelők kategóriáinak meghatározására,',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '2(f)',
  'f) az adattárolás időtartamára, valamint az alkalmazandó garanciákra, figyelembe véve az adatkezelés vagy az adatkezelési kategóriák jellegét, hatályát és céljait,',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '2(g)',
  'g) az érintettek jogait és szabadságait érintő kockázatokra, és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '23',
  '2(h)',
  'h) az érintettek arra vonatkozó jogára, hogy tájékoztatást kapjanak a korlátozásról, kivéve, ha ez hátrányosan befolyásolhatja a korlátozás célját.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '24',
  null,
  'Az adatkezelő feladatai
(1) Az adatkezelő az adatkezelés jellege, hatóköre, körülményei és céljai, valamint a természetes személyek jogaira és szabadságaira jelentett, változó valószínűségű és súlyosságú kockázat figyelembevételével megfelelő technikai és szervezési intézkedéseket hajt végre annak biztosítása és bizonyítása céljából, hogy a személyes adatok kezelése e rendelettel összhangban történik. Ezeket az intézkedéseket az adatkezelő felülvizsgálja és szükség esetén naprakésszé teszi.

(2) Ha az az adatkezelési tevékenység vonatkozásában arányos, az (1) bekezdésben említett intézkedések részeként az adatkezelő megfelelő belső adatvédelmi szabályokat is alkalmaz.

(3) A 40. cikk szerinti jóváhagyott magatartási kódexekhez vagy a 42. cikk szerinti jóváhagyott tanúsítási mechanizmushoz való csatlakozás felhasználható annak bizonyítása részeként, hogy az adatkezelő teljesíti kötelezettségeit.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_24'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '24',
  '1',
  '(1) Az adatkezelő az adatkezelés jellege, hatóköre, körülményei és céljai, valamint a természetes személyek jogaira és szabadságaira jelentett, változó valószínűségű és súlyosságú kockázat figyelembevételével megfelelő technikai és szervezési intézkedéseket hajt végre annak biztosítása és bizonyítása céljából, hogy a személyes adatok kezelése e rendelettel összhangban történik. Ezeket az intézkedéseket az adatkezelő felülvizsgálja és szükség esetén naprakésszé teszi.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_24'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '24',
  '2',
  '(2) Ha az az adatkezelési tevékenység vonatkozásában arányos, az (1) bekezdésben említett intézkedések részeként az adatkezelő megfelelő belső adatvédelmi szabályokat is alkalmaz.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_24'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '24',
  '3',
  '(3) A 40. cikk szerinti jóváhagyott magatartási kódexekhez vagy a 42. cikk szerinti jóváhagyott tanúsítási mechanizmushoz való csatlakozás felhasználható annak bizonyítása részeként, hogy az adatkezelő teljesíti kötelezettségeit.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_24'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '25',
  null,
  'Beépített és alapértelmezett adatvédelem
(1) Az adatkezelő a tudomány és technológia állása és a megvalósítás költségei, továbbá az adatkezelés jellege, hatóköre, körülményei és céljai, valamint a természetes személyek jogaira és szabadságaira jelentett, változó valószínűségű és súlyosságú kockázat figyelembevételével mind az adatkezelés módjának meghatározásakor, mind pedig az adatkezelés során olyan megfelelő technikai és szervezési intézkedéseket – például álnevesítést – hajt végre, amelyek célja egyrészt az adatvédelmi elvek, például az adattakarékosság hatékony megvalósítása, másrészt az e rendeletben foglalt követelmények teljesítéséhez és az érintettek jogainak védelméhez szükséges garanciák beépítése az adatkezelés folyamatába.

(2) Az adatkezelő megfelelő technikai és szervezési intézkedéseket hajt végre annak biztosítására, hogy alapértelmezés szerint kizárólag olyan személyes adatok kezelésére kerüljön sor, amelyek az adott konkrét adatkezelési cél szempontjából szükségesek. Ez a kötelezettség vonatkozik a gyűjtött személyes adatok mennyiségére, kezelésük mértékére, tárolásuk időtartamára és hozzáférhetőségükre. Ezek az intézkedések különösen azt kell, hogy biztosítsák, hogy a személyes adatok alapértelmezés szerint a természetes személy beavatkozása nélkül ne válhassanak hozzáférhetővé meghatározatlan számú személy számára.

(3) A 42. cikk szerinti jóváhagyott tanúsítási mechanizmus felhasználható annak bizonyítása részeként, hogy az adatkezelő teljesíti az e cikk (1) és (2) bekezdésében előírt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '25',
  '1',
  '(1) Az adatkezelő a tudomány és technológia állása és a megvalósítás költségei, továbbá az adatkezelés jellege, hatóköre, körülményei és céljai, valamint a természetes személyek jogaira és szabadságaira jelentett, változó valószínűségű és súlyosságú kockázat figyelembevételével mind az adatkezelés módjának meghatározásakor, mind pedig az adatkezelés során olyan megfelelő technikai és szervezési intézkedéseket – például álnevesítést – hajt végre, amelyek célja egyrészt az adatvédelmi elvek, például az adattakarékosság hatékony megvalósítása, másrészt az e rendeletben foglalt követelmények teljesítéséhez és az érintettek jogainak védelméhez szükséges garanciák beépítése az adatkezelés folyamatába.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '25',
  '2',
  '(2) Az adatkezelő megfelelő technikai és szervezési intézkedéseket hajt végre annak biztosítására, hogy alapértelmezés szerint kizárólag olyan személyes adatok kezelésére kerüljön sor, amelyek az adott konkrét adatkezelési cél szempontjából szükségesek. Ez a kötelezettség vonatkozik a gyűjtött személyes adatok mennyiségére, kezelésük mértékére, tárolásuk időtartamára és hozzáférhetőségükre. Ezek az intézkedések különösen azt kell, hogy biztosítsák, hogy a személyes adatok alapértelmezés szerint a természetes személy beavatkozása nélkül ne válhassanak hozzáférhetővé meghatározatlan számú személy számára.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '25',
  '3',
  '(3) A 42. cikk szerinti jóváhagyott tanúsítási mechanizmus felhasználható annak bizonyítása részeként, hogy az adatkezelő teljesíti az e cikk (1) és (2) bekezdésében előírt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '26',
  null,
  'Közös adatkezelők
(1) Ha az adatkezelés céljait és eszközeit két vagy több adatkezelő közösen határozza meg, azok közös adatkezelőknek minősülnek. A közös adatkezelők átlátható módon, a közöttük létrejött megállapodásban határozzák meg az e rendelet szerinti kötelezettségek teljesítéséért fennálló, különösen az érintett jogainak gyakorlásával és a 13. és a 14. cikkben említett információk rendelkezésre bocsátásával kapcsolatos feladataikkal összefüggő felelősségük megoszlását, kivéve azt az esetet és annyiban, ha és amennyiben az adatkezelőkre vonatkozó felelősség megoszlását a rájuk alkalmazandó uniós vagy tagállami jog határozza meg. A megállapodásban az érintettek számára kapcsolattartót lehet kijelölni.

(2) Az (1) bekezdésben említett megállapodásnak megfelelően tükröznie kell a közös adatkezelők érintettekkel szembeni szerepét és a velük való kapcsolatukat. A megállapodás lényegét az érintett rendelkezésére kell bocsátani.

(3) Az érintett az (1) bekezdésben említett megállapodás feltételeitől függetlenül mindegyik adatkezelő vonatkozásában és mindegyik adatkezelővel szemben gyakorolhatja az e rendelet szerinti jogait.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '26',
  '1',
  '(1) Ha az adatkezelés céljait és eszközeit két vagy több adatkezelő közösen határozza meg, azok közös adatkezelőknek minősülnek. A közös adatkezelők átlátható módon, a közöttük létrejött megállapodásban határozzák meg az e rendelet szerinti kötelezettségek teljesítéséért fennálló, különösen az érintett jogainak gyakorlásával és a 13. és a 14. cikkben említett információk rendelkezésre bocsátásával kapcsolatos feladataikkal összefüggő felelősségük megoszlását, kivéve azt az esetet és annyiban, ha és amennyiben az adatkezelőkre vonatkozó felelősség megoszlását a rájuk alkalmazandó uniós vagy tagállami jog határozza meg. A megállapodásban az érintettek számára kapcsolattartót lehet kijelölni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '26',
  '2',
  '(2) Az (1) bekezdésben említett megállapodásnak megfelelően tükröznie kell a közös adatkezelők érintettekkel szembeni szerepét és a velük való kapcsolatukat. A megállapodás lényegét az érintett rendelkezésére kell bocsátani.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '26',
  '3',
  '(3) Az érintett az (1) bekezdésben említett megállapodás feltételeitől függetlenül mindegyik adatkezelő vonatkozásában és mindegyik adatkezelővel szemben gyakorolhatja az e rendelet szerinti jogait.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '27',
  null,
  'Az Unióban tevékenységi hellyel nem rendelkező adatkezelők vagy adatfeldolgozók képviselői
(1) A 3. cikk (2) bekezdésében meghatározott esetben az adatkezelő vagy az adatfeldolgozó írásban uniós képviselőt jelöl ki.

(2) Az e cikk (1) bekezdésében foglalt kötelezettséget nem kell alkalmazni:

a)

az alkalmi jellegű adatkezelésre, amely nem terjed ki sem a személyes adatoknak a 9. cikk (1) bekezdésében említett különleges kategóriáira, sem a 10. cikkben említett, büntetőjogi felelősség megállapítására vonatkozó határozatokra és bűncselekményekre vonatkozó személyes adatok nagy számban történő kezelésére, és amely – figyelembe véve az adatkezelés jellegét, körülményeit, hatókörét és céljait – valószínűsíthetően nem jelent kockázatot a természetes személyek jogaira és szabadságaira nézve; vagy

b)

közhatalmi vagy egyéb, közfeladatot ellátó szervekre.

(3) A képviselőnek tevékenységi hellyel kell rendelkeznie az egyik olyan tagállamban, ahol azon érintettek tartózkodnak, akiknek személyes adatait áruknak vagy szolgáltatásoknak a részükre történő nyújtása során kezelik vagy akiknek a magatartását megfigyelik.

(4) Az adatkezelő vagy az adatfeldolgozó által a képviselő számára adott megbízásnak ki kell terjednie arra, hogy az adatkezeléssel összefüggő minden ügyben, az e rendeletnek való megfelelés biztosítása érdekében – különösen a felügyeleti hatóságok és az érintettek megkeresésére – az adatkezelő vagy az adatfeldolgozó helyett vagy mellett a képviselő járjon el.

(5) Az a tény, hogy az adatkezelő vagy az adatfeldolgozó képviselőt jelöl ki, nem érinti az adatkezelővel vagy az adatfeldolgozóval szembeni keresetindításhoz való jogot.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '27',
  '1',
  '(1) A 3. cikk (2) bekezdésében meghatározott esetben az adatkezelő vagy az adatfeldolgozó írásban uniós képviselőt jelöl ki.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '27',
  '2',
  '(2) Az e cikk (1) bekezdésében foglalt kötelezettséget nem kell alkalmazni:

a)

az alkalmi jellegű adatkezelésre, amely nem terjed ki sem a személyes adatoknak a 9. cikk (1) bekezdésében említett különleges kategóriáira, sem a 10. cikkben említett, büntetőjogi felelősség megállapítására vonatkozó határozatokra és bűncselekményekre vonatkozó személyes adatok nagy számban történő kezelésére, és amely – figyelembe véve az adatkezelés jellegét, körülményeit, hatókörét és céljait – valószínűsíthetően nem jelent kockázatot a természetes személyek jogaira és szabadságaira nézve; vagy

b)

közhatalmi vagy egyéb, közfeladatot ellátó szervekre.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '27',
  '2(a)',
  'a) az alkalmi jellegű adatkezelésre, amely nem terjed ki sem a személyes adatoknak a 9. cikk (1) bekezdésében említett különleges kategóriáira, sem a 10. cikkben említett, büntetőjogi felelősség megállapítására vonatkozó határozatokra és bűncselekményekre vonatkozó személyes adatok nagy számban történő kezelésére, és amely – figyelembe véve az adatkezelés jellegét, körülményeit, hatókörét és céljait – valószínűsíthetően nem jelent kockázatot a természetes személyek jogaira és szabadságaira nézve; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '27',
  '2(b)',
  'b) közhatalmi vagy egyéb, közfeladatot ellátó szervekre.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '27',
  '3',
  '(3) A képviselőnek tevékenységi hellyel kell rendelkeznie az egyik olyan tagállamban, ahol azon érintettek tartózkodnak, akiknek személyes adatait áruknak vagy szolgáltatásoknak a részükre történő nyújtása során kezelik vagy akiknek a magatartását megfigyelik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '27',
  '4',
  '(4) Az adatkezelő vagy az adatfeldolgozó által a képviselő számára adott megbízásnak ki kell terjednie arra, hogy az adatkezeléssel összefüggő minden ügyben, az e rendeletnek való megfelelés biztosítása érdekében – különösen a felügyeleti hatóságok és az érintettek megkeresésére – az adatkezelő vagy az adatfeldolgozó helyett vagy mellett a képviselő járjon el.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '27',
  '5',
  '(5) Az a tény, hogy az adatkezelő vagy az adatfeldolgozó képviselőt jelöl ki, nem érinti az adatkezelővel vagy az adatfeldolgozóval szembeni keresetindításhoz való jogot.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  null,
  'Az adatfeldolgozó
(1) Ha az adatkezelést az adatkezelő nevében más végzi, az adatkezelő kizárólag olyan adatfeldolgozókat vehet igénybe, akik vagy amelyek megfelelő garanciákat nyújtanak az adatkezelés e rendelet követelményeinek való megfelelését és az érintettek jogainak védelmét biztosító, megfelelő technikai és szervezési intézkedések végrehajtására.

(2) Az adatfeldolgozó az adatkezelő előzetesen írásban tett eseti vagy általános felhatalmazása nélkül további adatfeldolgozót nem vehet igénybe. Az általános írásbeli felhatalmazás esetén az adatfeldolgozó tájékoztatja az adatkezelőt minden olyan tervezett változásról, amely további adatfeldolgozók igénybevételét vagy azok cseréjét érinti, ezzel biztosítva lehetőséget az adatkezelőnek arra, hogy ezekkel a változtatásokkal szemben kifogást emeljen.

(3) Az adatfeldolgozó által végzett adatkezelést az uniós jog vagy tagállami jog alapján létrejött olyan – az adatkezelés tárgyát, időtartamát, jellegét és célját, a személyes adatok típusát, az érintettek kategóriáit, valamint az adatkezelő kötelezettségeit és jogait meghatározó –szerződésnek vagy más jogi aktusnak kell szabályoznia, amely köti az adatfeldolgozót az adatkezelővel szemben. A szerződés vagy más jogi aktus különösen előírja, hogy az adatfeldolgozó:

a)

a személyes adatokat kizárólag az adatkezelő írásbeli utasításai alapján kezeli – beleértve a személyes adatoknak valamely harmadik ország vagy nemzetközi szervezet számára való továbbítását is –, kivéve akkor, ha az adatkezelést az adatfeldolgozóra alkalmazandó uniós vagy tagállami jog írja elő; ebben az esetben erről a jogi előírásról az adatfeldolgozó az adatkezelőt az adatkezelést megelőzően értesíti, kivéve, ha az adatkezelő értesítését az adott jogszabály fontos közérdekből tiltja;

b)

biztosítja azt, hogy a személyes adatok kezelésére feljogosított személyek titoktartási kötelezettséget vállalnak vagy jogszabályon alapuló megfelelő titoktartási kötelezettség alatt állnak;

c)

meghozza a 32. cikkben előírt intézkedéseket;

d)

tiszteletben tartja a további adatfeldolgozó igénybevételére vonatkozóan a (2) és (4) bekezdésben említett feltételeket;

e)

az adatkezelés jellegének figyelembevételével megfelelő technikai és szervezési intézkedésekkel a lehetséges mértékben segíti az adatkezelőt abban, hogy teljesíteni tudja kötelezettségét az érintett III. fejezetben foglalt jogainak gyakorlásához kapcsolódó kérelmek megválaszolása tekintetében;

f)

segíti az adatkezelőt a 32–36. cikk szerinti kötelezettségek teljesítésében, figyelembe véve az adatkezelés jellegét és az adatfeldolgozó rendelkezésére álló információkat;

g)

az adatkezelési szolgáltatás nyújtásának befejezését követően az adatkezelő döntése alapján minden személyes adatot töröl vagy visszajuttat az adatkezelőnek, és törli a meglévő másolatokat, kivéve, ha az uniós vagy a tagállami jog az személyes adatok tárolását írja elő;

h)

az adatkezelő rendelkezésére bocsát minden olyan információt, amely az e cikkben meghatározott kötelezettségek teljesítésének igazolásához szükséges, továbbá amely lehetővé teszi és elősegíti az adatkezelő által vagy az általa megbízott más ellenőr által végzett auditokat, beleértve a helyszíni vizsgálatokat is.

Az első albekezdés h) pontjával kapcsolatban az adatfeldolgozó haladéktalanul tájékoztatja az adatkezelőt, ha úgy véli, hogy annak valamely utasítása sérti ezt a rendeletet vagy a tagállami vagy uniós adatvédelmi rendelkezéseket.

(4) Ha az adatfeldolgozó bizonyos, az adatkezelő nevében végzett konkrét adatkezelési tevékenységekhez további adatfeldolgozó szolgáltatásait is igénybe veszi, uniós vagy tagállami jog alapján létrejött szerződés vagy más jogi aktus útján erre a további adatfeldolgozóra is ugyanazok az adatvédelmi kötelezettségeket kell telepíteni, mint amelyek az adatkezelő és az adatfeldolgozó között létrejött, a (3) bekezdésben említett szerződésben vagy egyéb jogi aktusban szerepelnek, különösen úgy, hogy a további adatfeldolgozónak megfelelő garanciákat kell nyújtania a megfelelő technikai és szervezési intézkedések végrehajtására, és ezáltal biztosítania kell, hogy az adatkezelés megfeleljen e rendelet követelményeinek. Ha a további adatfeldolgozó nem teljesíti adatvédelmi kötelezettségeit, az őt megbízó adatfeldolgozó teljes felelősséggel tartozik az adatkezelő felé a további adatfeldolgozó kötelezettségeinek a teljesítéséért.

(5) A 40. cikk szerinti jóváhagyott magatartási kódexekhez vagy a 42. cikk szerinti jóváhagyott tanúsítási mechanizmushoz való csatlakozás felhasználható annak bizonyítása részeként, hogy az adatfeldolgozó biztosítja az (1) és (4) bekezdésben említett megfelelő garanciákat.

(6) Az adatkezelő és az adatfeldolgozó közötti egyedi szerződés sérelme nélkül az e cikk (3) és (4) bekezdésében említett szerződés vagy más jogi aktus teljes egészében vagy részben az e cikk (7) és (8) bekezdésében említett általános szerződési feltételeken alapulhat, beleértve azt is, amikor ezek a 42. és a 43. cikk alapján az adatkezelőnek vagy az adatfeldolgozónak megadott tanúsítvány részét képezik.

(7) A Bizottság – a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően – általános szerződési feltételeket határozhat meg az e cikk (3) és (4) bekezdésében foglaltakra vonatkozóan.

(8) A felügyeleti hatóságok a 63. cikkben említett egységességi mechanizmusnak megfelelően általános szerződési feltételeket fogadhatnak el az e cikk (3) és (4) bekezdésében foglaltakra vonatkozóan.

(9) A (3) és (4) bekezdésben említett szerződést vagy más jogi aktust írásba kell foglalni, ideértve az elektronikus formátumot is.

(10) A 82., 83. és 84. cikk sérelme nélkül, ha egy adatfeldolgozó e rendeletet sértve maga határozza meg az adatkezelés céljait és eszközeit, akkor őt az adott adatkezelés tekintetében adatkezelőnek kell tekinteni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '1',
  '(1) Ha az adatkezelést az adatkezelő nevében más végzi, az adatkezelő kizárólag olyan adatfeldolgozókat vehet igénybe, akik vagy amelyek megfelelő garanciákat nyújtanak az adatkezelés e rendelet követelményeinek való megfelelését és az érintettek jogainak védelmét biztosító, megfelelő technikai és szervezési intézkedések végrehajtására.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '2',
  '(2) Az adatfeldolgozó az adatkezelő előzetesen írásban tett eseti vagy általános felhatalmazása nélkül további adatfeldolgozót nem vehet igénybe. Az általános írásbeli felhatalmazás esetén az adatfeldolgozó tájékoztatja az adatkezelőt minden olyan tervezett változásról, amely további adatfeldolgozók igénybevételét vagy azok cseréjét érinti, ezzel biztosítva lehetőséget az adatkezelőnek arra, hogy ezekkel a változtatásokkal szemben kifogást emeljen.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '3',
  '(3) Az adatfeldolgozó által végzett adatkezelést az uniós jog vagy tagállami jog alapján létrejött olyan – az adatkezelés tárgyát, időtartamát, jellegét és célját, a személyes adatok típusát, az érintettek kategóriáit, valamint az adatkezelő kötelezettségeit és jogait meghatározó –szerződésnek vagy más jogi aktusnak kell szabályoznia, amely köti az adatfeldolgozót az adatkezelővel szemben. A szerződés vagy más jogi aktus különösen előírja, hogy az adatfeldolgozó:

a)

a személyes adatokat kizárólag az adatkezelő írásbeli utasításai alapján kezeli – beleértve a személyes adatoknak valamely harmadik ország vagy nemzetközi szervezet számára való továbbítását is –, kivéve akkor, ha az adatkezelést az adatfeldolgozóra alkalmazandó uniós vagy tagállami jog írja elő; ebben az esetben erről a jogi előírásról az adatfeldolgozó az adatkezelőt az adatkezelést megelőzően értesíti, kivéve, ha az adatkezelő értesítését az adott jogszabály fontos közérdekből tiltja;

b)

biztosítja azt, hogy a személyes adatok kezelésére feljogosított személyek titoktartási kötelezettséget vállalnak vagy jogszabályon alapuló megfelelő titoktartási kötelezettség alatt állnak;

c)

meghozza a 32. cikkben előírt intézkedéseket;

d)

tiszteletben tartja a további adatfeldolgozó igénybevételére vonatkozóan a (2) és (4) bekezdésben említett feltételeket;

e)

az adatkezelés jellegének figyelembevételével megfelelő technikai és szervezési intézkedésekkel a lehetséges mértékben segíti az adatkezelőt abban, hogy teljesíteni tudja kötelezettségét az érintett III. fejezetben foglalt jogainak gyakorlásához kapcsolódó kérelmek megválaszolása tekintetében;

f)

segíti az adatkezelőt a 32–36. cikk szerinti kötelezettségek teljesítésében, figyelembe véve az adatkezelés jellegét és az adatfeldolgozó rendelkezésére álló információkat;

g)

az adatkezelési szolgáltatás nyújtásának befejezését követően az adatkezelő döntése alapján minden személyes adatot töröl vagy visszajuttat az adatkezelőnek, és törli a meglévő másolatokat, kivéve, ha az uniós vagy a tagállami jog az személyes adatok tárolását írja elő;

h)

az adatkezelő rendelkezésére bocsát minden olyan információt, amely az e cikkben meghatározott kötelezettségek teljesítésének igazolásához szükséges, továbbá amely lehetővé teszi és elősegíti az adatkezelő által vagy az általa megbízott más ellenőr által végzett auditokat, beleértve a helyszíni vizsgálatokat is.

Az első albekezdés h) pontjával kapcsolatban az adatfeldolgozó haladéktalanul tájékoztatja az adatkezelőt, ha úgy véli, hogy annak valamely utasítása sérti ezt a rendeletet vagy a tagállami vagy uniós adatvédelmi rendelkezéseket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '3(a)',
  'a) a személyes adatokat kizárólag az adatkezelő írásbeli utasításai alapján kezeli – beleértve a személyes adatoknak valamely harmadik ország vagy nemzetközi szervezet számára való továbbítását is –, kivéve akkor, ha az adatkezelést az adatfeldolgozóra alkalmazandó uniós vagy tagállami jog írja elő; ebben az esetben erről a jogi előírásról az adatfeldolgozó az adatkezelőt az adatkezelést megelőzően értesíti, kivéve, ha az adatkezelő értesítését az adott jogszabály fontos közérdekből tiltja;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '3(b)',
  'b) biztosítja azt, hogy a személyes adatok kezelésére feljogosított személyek titoktartási kötelezettséget vállalnak vagy jogszabályon alapuló megfelelő titoktartási kötelezettség alatt állnak;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '3(c)',
  'c) meghozza a 32. cikkben előírt intézkedéseket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '3(d)',
  'd) tiszteletben tartja a további adatfeldolgozó igénybevételére vonatkozóan a (2) és (4) bekezdésben említett feltételeket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '3(e)',
  'e) az adatkezelés jellegének figyelembevételével megfelelő technikai és szervezési intézkedésekkel a lehetséges mértékben segíti az adatkezelőt abban, hogy teljesíteni tudja kötelezettségét az érintett III. fejezetben foglalt jogainak gyakorlásához kapcsolódó kérelmek megválaszolása tekintetében;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '3(f)',
  'f) segíti az adatkezelőt a 32–36. cikk szerinti kötelezettségek teljesítésében, figyelembe véve az adatkezelés jellegét és az adatfeldolgozó rendelkezésére álló információkat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '3(g)',
  'g) az adatkezelési szolgáltatás nyújtásának befejezését követően az adatkezelő döntése alapján minden személyes adatot töröl vagy visszajuttat az adatkezelőnek, és törli a meglévő másolatokat, kivéve, ha az uniós vagy a tagállami jog az személyes adatok tárolását írja elő;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '3(h)',
  'h) az adatkezelő rendelkezésére bocsát minden olyan információt, amely az e cikkben meghatározott kötelezettségek teljesítésének igazolásához szükséges, továbbá amely lehetővé teszi és elősegíti az adatkezelő által vagy az általa megbízott más ellenőr által végzett auditokat, beleértve a helyszíni vizsgálatokat is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '4',
  '(4) Ha az adatfeldolgozó bizonyos, az adatkezelő nevében végzett konkrét adatkezelési tevékenységekhez további adatfeldolgozó szolgáltatásait is igénybe veszi, uniós vagy tagállami jog alapján létrejött szerződés vagy más jogi aktus útján erre a további adatfeldolgozóra is ugyanazok az adatvédelmi kötelezettségeket kell telepíteni, mint amelyek az adatkezelő és az adatfeldolgozó között létrejött, a (3) bekezdésben említett szerződésben vagy egyéb jogi aktusban szerepelnek, különösen úgy, hogy a további adatfeldolgozónak megfelelő garanciákat kell nyújtania a megfelelő technikai és szervezési intézkedések végrehajtására, és ezáltal biztosítania kell, hogy az adatkezelés megfeleljen e rendelet követelményeinek. Ha a további adatfeldolgozó nem teljesíti adatvédelmi kötelezettségeit, az őt megbízó adatfeldolgozó teljes felelősséggel tartozik az adatkezelő felé a további adatfeldolgozó kötelezettségeinek a teljesítéséért.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '5',
  '(5) A 40. cikk szerinti jóváhagyott magatartási kódexekhez vagy a 42. cikk szerinti jóváhagyott tanúsítási mechanizmushoz való csatlakozás felhasználható annak bizonyítása részeként, hogy az adatfeldolgozó biztosítja az (1) és (4) bekezdésben említett megfelelő garanciákat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '6',
  '(6) Az adatkezelő és az adatfeldolgozó közötti egyedi szerződés sérelme nélkül az e cikk (3) és (4) bekezdésében említett szerződés vagy más jogi aktus teljes egészében vagy részben az e cikk (7) és (8) bekezdésében említett általános szerződési feltételeken alapulhat, beleértve azt is, amikor ezek a 42. és a 43. cikk alapján az adatkezelőnek vagy az adatfeldolgozónak megadott tanúsítvány részét képezik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '7',
  '(7) A Bizottság – a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően – általános szerződési feltételeket határozhat meg az e cikk (3) és (4) bekezdésében foglaltakra vonatkozóan.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '8',
  '(8) A felügyeleti hatóságok a 63. cikkben említett egységességi mechanizmusnak megfelelően általános szerződési feltételeket fogadhatnak el az e cikk (3) és (4) bekezdésében foglaltakra vonatkozóan.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '9',
  '(9) A (3) és (4) bekezdésben említett szerződést vagy más jogi aktust írásba kell foglalni, ideértve az elektronikus formátumot is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '28',
  '10',
  '(10) A 82., 83. és 84. cikk sérelme nélkül, ha egy adatfeldolgozó e rendeletet sértve maga határozza meg az adatkezelés céljait és eszközeit, akkor őt az adott adatkezelés tekintetében adatkezelőnek kell tekinteni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '29',
  null,
  'Az adatkezelő vagy az adatfeldolgozó irányítása alatt végzett adatkezelés
Az adatfeldolgozó és bármely, az adatkezelő vagy az adatfeldolgozó irányítása alatt eljáró, a személyes adatokhoz hozzáféréssel rendelkező személy ezeket az adatokat kizárólag az adatkezelő utasításának megfelelően kezelheti, kivéve, ha az ettől való eltérésre őt uniós vagy tagállami jog kötelezi.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_29'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  null,
  'Az adatkezelési tevékenységek nyilvántartása
(1) Minden adatkezelő és – ha van ilyen – az adatkezelő képviselője a felelősségébe tartozóan végzett adatkezelési tevékenységekről nyilvántartást vezet. E nyilvántartás a következő információkat tartalmazza:

a)

az adatkezelő neve és elérhetősége, valamint – ha van ilyen – a közös adatkezelőnek, az adatkezelő képviselőjének és az adatvédelmi tisztviselőnek a neve és elérhetősége;

b)

az adatkezelés céljai;

c)

az érintettek kategóriáinak, valamint a személyes adatok kategóriáinak ismertetése;

d)

olyan címzettek kategóriái, akikkel a személyes adatokat közlik vagy közölni fogják, ideértve a harmadik országbeli címzetteket vagy nemzetközi szervezeteket;

e)

adott esetben a személyes adatok harmadik országba vagy nemzetközi szervezet részére történő továbbítására vonatkozó információk, beleértve a harmadik ország vagy a nemzetközi szervezet azonosítását, valamint a 49. cikk (1) bekezdésének második albekezdés szerinti továbbítás esetében a megfelelő garanciák leírása;

f)

ha lehetséges, a különböző adatkategóriák törlésére előirányzott határidők;

g)

ha lehetséges, a 32. cikk (1) bekezdésében említett technikai és szervezési intézkedések általános leírása.

(2) Minden adatfeldolgozó és – ha van ilyen – az adatfeldolgozó képviselője nyilvántartást vezet az adatkezelő nevében végzett adatkezelési tevékenységek minden kategóriájáról; a nyilvántartás a következő információkat tartalmazza:

a)

az adatfeldolgozó vagy adatfeldolgozók neve és elérhetőségei, és minden olyan adatkezelő neve és elérhetőségei, amelynek vagy akinek a nevében az adatfeldolgozó eljár, továbbá – ha van ilyen – az adatkezelő vagy az adatfeldolgozó képviselőjének, valamint az adatvédelmi tisztviselőnek a neve és elérhetőségei;

b)

az egyes adatkezelők nevében végzett adatkezelési tevékenységek kategóriái;

c)

adott esetben a személyes adatok harmadik országba vagy nemzetközi szervezet részére történő továbbítása, beleértve a harmadik ország vagy a nemzetközi szervezet azonosítását, valamint a 49. cikk (1) bekezdésének második albekezdése szerinti továbbítás esetében a megfelelő garanciák leírása;

d)

ha lehetséges, a 32. cikk (1) bekezdésében említett technikai és szervezési intézkedések általános leírása.

(3) Az (1) és (2) bekezdésben említett nyilvántartást írásban kell vezetni, ideértve az elektronikus formátumot is.

(4) Az adatkezelő vagy az adatfeldolgozó, valamint – ha van ilyen – az adatkezelő vagy az adatfeldolgozó képviselője megkeresés alapján a felügyeleti hatóság részére rendelkezésére bocsátja a nyilvántartást.

(5) Az (1) és (2) bekezdésben foglalt kötelezettségek nem vonatkoznak a 250 főnél kevesebb személyt foglalkoztató vállalkozásra vagy szervezetre, kivéve, ha az általa végzett adatkezelés az érintettek jogaira és szabadságaira nézve valószínűsíthetően kockázattal jár, ha az adatkezelés nem alkalmi jellegű, vagy ha az adatkezelés kiterjed a személyes adatok 9. cikk (1) bekezdésében említett különleges kategóriáinak vagy a 10. cikkben említett, büntetőjogi felelősség megállapítására vonatkozó határozatokra és bűncselekményekre vonatkozó személyes adatoknak a kezelésére.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '1',
  '(1) Minden adatkezelő és – ha van ilyen – az adatkezelő képviselője a felelősségébe tartozóan végzett adatkezelési tevékenységekről nyilvántartást vezet. E nyilvántartás a következő információkat tartalmazza:

a)

az adatkezelő neve és elérhetősége, valamint – ha van ilyen – a közös adatkezelőnek, az adatkezelő képviselőjének és az adatvédelmi tisztviselőnek a neve és elérhetősége;

b)

az adatkezelés céljai;

c)

az érintettek kategóriáinak, valamint a személyes adatok kategóriáinak ismertetése;

d)

olyan címzettek kategóriái, akikkel a személyes adatokat közlik vagy közölni fogják, ideértve a harmadik országbeli címzetteket vagy nemzetközi szervezeteket;

e)

adott esetben a személyes adatok harmadik országba vagy nemzetközi szervezet részére történő továbbítására vonatkozó információk, beleértve a harmadik ország vagy a nemzetközi szervezet azonosítását, valamint a 49. cikk (1) bekezdésének második albekezdés szerinti továbbítás esetében a megfelelő garanciák leírása;

f)

ha lehetséges, a különböző adatkategóriák törlésére előirányzott határidők;

g)

ha lehetséges, a 32. cikk (1) bekezdésében említett technikai és szervezési intézkedések általános leírása.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '1(a)',
  'a) az adatkezelő neve és elérhetősége, valamint – ha van ilyen – a közös adatkezelőnek, az adatkezelő képviselőjének és az adatvédelmi tisztviselőnek a neve és elérhetősége;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '1(c)',
  'c) az érintettek kategóriáinak, valamint a személyes adatok kategóriáinak ismertetése;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '1(d)',
  'd) olyan címzettek kategóriái, akikkel a személyes adatokat közlik vagy közölni fogják, ideértve a harmadik országbeli címzetteket vagy nemzetközi szervezeteket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '1(e)',
  'e) adott esetben a személyes adatok harmadik országba vagy nemzetközi szervezet részére történő továbbítására vonatkozó információk, beleértve a harmadik ország vagy a nemzetközi szervezet azonosítását, valamint a 49. cikk (1) bekezdésének második albekezdés szerinti továbbítás esetében a megfelelő garanciák leírása;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '1(f)',
  'f) ha lehetséges, a különböző adatkategóriák törlésére előirányzott határidők;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '1(g)',
  'g) ha lehetséges, a 32. cikk (1) bekezdésében említett technikai és szervezési intézkedések általános leírása.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '2',
  '(2) Minden adatfeldolgozó és – ha van ilyen – az adatfeldolgozó képviselője nyilvántartást vezet az adatkezelő nevében végzett adatkezelési tevékenységek minden kategóriájáról; a nyilvántartás a következő információkat tartalmazza:

a)

az adatfeldolgozó vagy adatfeldolgozók neve és elérhetőségei, és minden olyan adatkezelő neve és elérhetőségei, amelynek vagy akinek a nevében az adatfeldolgozó eljár, továbbá – ha van ilyen – az adatkezelő vagy az adatfeldolgozó képviselőjének, valamint az adatvédelmi tisztviselőnek a neve és elérhetőségei;

b)

az egyes adatkezelők nevében végzett adatkezelési tevékenységek kategóriái;

c)

adott esetben a személyes adatok harmadik országba vagy nemzetközi szervezet részére történő továbbítása, beleértve a harmadik ország vagy a nemzetközi szervezet azonosítását, valamint a 49. cikk (1) bekezdésének második albekezdése szerinti továbbítás esetében a megfelelő garanciák leírása;

d)

ha lehetséges, a 32. cikk (1) bekezdésében említett technikai és szervezési intézkedések általános leírása.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '2(a)',
  'a) az adatfeldolgozó vagy adatfeldolgozók neve és elérhetőségei, és minden olyan adatkezelő neve és elérhetőségei, amelynek vagy akinek a nevében az adatfeldolgozó eljár, továbbá – ha van ilyen – az adatkezelő vagy az adatfeldolgozó képviselőjének, valamint az adatvédelmi tisztviselőnek a neve és elérhetőségei;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '2(b)',
  'b) az egyes adatkezelők nevében végzett adatkezelési tevékenységek kategóriái;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '2(c)',
  'c) adott esetben a személyes adatok harmadik országba vagy nemzetközi szervezet részére történő továbbítása, beleértve a harmadik ország vagy a nemzetközi szervezet azonosítását, valamint a 49. cikk (1) bekezdésének második albekezdése szerinti továbbítás esetében a megfelelő garanciák leírása;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '2(d)',
  'd) ha lehetséges, a 32. cikk (1) bekezdésében említett technikai és szervezési intézkedések általános leírása.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '3',
  '(3) Az (1) és (2) bekezdésben említett nyilvántartást írásban kell vezetni, ideértve az elektronikus formátumot is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '4',
  '(4) Az adatkezelő vagy az adatfeldolgozó, valamint – ha van ilyen – az adatkezelő vagy az adatfeldolgozó képviselője megkeresés alapján a felügyeleti hatóság részére rendelkezésére bocsátja a nyilvántartást.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '30',
  '5',
  '(5) Az (1) és (2) bekezdésben foglalt kötelezettségek nem vonatkoznak a 250 főnél kevesebb személyt foglalkoztató vállalkozásra vagy szervezetre, kivéve, ha az általa végzett adatkezelés az érintettek jogaira és szabadságaira nézve valószínűsíthetően kockázattal jár, ha az adatkezelés nem alkalmi jellegű, vagy ha az adatkezelés kiterjed a személyes adatok 9. cikk (1) bekezdésében említett különleges kategóriáinak vagy a 10. cikkben említett, büntetőjogi felelősség megállapítására vonatkozó határozatokra és bűncselekményekre vonatkozó személyes adatoknak a kezelésére.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '31',
  null,
  'Együttműködés a felügyeleti hatósággal
Az adatkezelő és az adatfeldolgozó, valamint – ha van ilyen – az adatkezelő vagy az adatfeldolgozó képviselője feladatai végrehajtása során a felügyeleti hatósággal – annak megkeresése alapján – együttműködik.

2. szakasz

Adatbiztonság',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '32',
  null,
  'Az adatkezelés biztonsága
(1) Az adatkezelő és az adatfeldolgozó a tudomány és technológia állása és a megvalósítás költségei, továbbá az adatkezelés jellege, hatóköre, körülményei és céljai, valamint a természetes személyek jogaira és szabadságaira jelentett, változó valószínűségű és súlyosságú kockázat figyelembevételével megfelelő technikai és szervezési intézkedéseket hajt végre annak érdekében, hogy a kockázat mértékének megfelelő szintű adatbiztonságot garantálja, ideértve, többek között, adott esetben:

a)

a személyes adatok álnevesítését és titkosítását;

b)

a személyes adatok kezelésére használt rendszerek és szolgáltatások folyamatos bizalmas jellegének biztosítását, integritását, rendelkezésre állását és ellenálló képességét;

c)

fizikai vagy műszaki incidens esetén az arra való képességet, hogy a személyes adatokhoz való hozzáférést és az adatok rendelkezésre állását kellő időben vissza lehet állítani;

d)

az adatkezelés biztonságának garantálására hozott technikai és szervezési intézkedések hatékonyságának rendszeres tesztelésére, felmérésére és értékelésére szolgáló eljárást.

(2) A biztonság megfelelő szintjének meghatározásakor kifejezetten figyelembe kell venni az adatkezelésből eredő olyan kockázatokat, amelyek különösen a továbbított, tárolt vagy más módon kezelt személyes adatok véletlen vagy jogellenes megsemmisítéséből, elvesztéséből, megváltoztatásából, jogosulatlan nyilvánosságra hozatalából vagy az azokhoz való jogosulatlan hozzáférésből erednek.

(3) Az adatkezelő, illetve az adatfeldolgozó 40. cikk szerinti jóváhagyott magatartási kódexekhez vagy a 42. cikk szerinti jóváhagyott tanúsítási mechanizmushoz való csatlakozását felhasználhatja annak bizonyítása részeként, hogy az e cikk (1) bekezdésében meghatározott követelményeket teljesíti.

(4) Az adatkezelő és az adatfeldolgozó intézkedéseket hoz annak biztosítására, hogy az adatkezelő vagy az adatfeldolgozó irányítása alatt eljáró, a személyes adatokhoz hozzáféréssel rendelkező természetes személyek kizárólag az adatkezelő utasításának megfelelően kezelhessék az említett adatokat, kivéve, ha az ettől való eltérésre uniós vagy tagállami jog kötelezi őket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_32'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '32',
  '1',
  '(1) Az adatkezelő és az adatfeldolgozó a tudomány és technológia állása és a megvalósítás költségei, továbbá az adatkezelés jellege, hatóköre, körülményei és céljai, valamint a természetes személyek jogaira és szabadságaira jelentett, változó valószínűségű és súlyosságú kockázat figyelembevételével megfelelő technikai és szervezési intézkedéseket hajt végre annak érdekében, hogy a kockázat mértékének megfelelő szintű adatbiztonságot garantálja, ideértve, többek között, adott esetben:

a)

a személyes adatok álnevesítését és titkosítását;

b)

a személyes adatok kezelésére használt rendszerek és szolgáltatások folyamatos bizalmas jellegének biztosítását, integritását, rendelkezésre állását és ellenálló képességét;

c)

fizikai vagy műszaki incidens esetén az arra való képességet, hogy a személyes adatokhoz való hozzáférést és az adatok rendelkezésre állását kellő időben vissza lehet állítani;

d)

az adatkezelés biztonságának garantálására hozott technikai és szervezési intézkedések hatékonyságának rendszeres tesztelésére, felmérésére és értékelésére szolgáló eljárást.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_32'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '32',
  '1(a)',
  'a) a személyes adatok álnevesítését és titkosítását;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_32'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '32',
  '1(b)',
  'b) a személyes adatok kezelésére használt rendszerek és szolgáltatások folyamatos bizalmas jellegének biztosítását, integritását, rendelkezésre állását és ellenálló képességét;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_32'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '32',
  '1(c)',
  'c) fizikai vagy műszaki incidens esetén az arra való képességet, hogy a személyes adatokhoz való hozzáférést és az adatok rendelkezésre állását kellő időben vissza lehet állítani;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_32'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '32',
  '1(d)',
  'd) az adatkezelés biztonságának garantálására hozott technikai és szervezési intézkedések hatékonyságának rendszeres tesztelésére, felmérésére és értékelésére szolgáló eljárást.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_32'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '32',
  '2',
  '(2) A biztonság megfelelő szintjének meghatározásakor kifejezetten figyelembe kell venni az adatkezelésből eredő olyan kockázatokat, amelyek különösen a továbbított, tárolt vagy más módon kezelt személyes adatok véletlen vagy jogellenes megsemmisítéséből, elvesztéséből, megváltoztatásából, jogosulatlan nyilvánosságra hozatalából vagy az azokhoz való jogosulatlan hozzáférésből erednek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_32'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '32',
  '3',
  '(3) Az adatkezelő, illetve az adatfeldolgozó 40. cikk szerinti jóváhagyott magatartási kódexekhez vagy a 42. cikk szerinti jóváhagyott tanúsítási mechanizmushoz való csatlakozását felhasználhatja annak bizonyítása részeként, hogy az e cikk (1) bekezdésében meghatározott követelményeket teljesíti.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_32'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '32',
  '4',
  '(4) Az adatkezelő és az adatfeldolgozó intézkedéseket hoz annak biztosítására, hogy az adatkezelő vagy az adatfeldolgozó irányítása alatt eljáró, a személyes adatokhoz hozzáféréssel rendelkező természetes személyek kizárólag az adatkezelő utasításának megfelelően kezelhessék az említett adatokat, kivéve, ha az ettől való eltérésre uniós vagy tagállami jog kötelezi őket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_32'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '33',
  null,
  'Az adatvédelmi incidens bejelentése a felügyeleti hatóságnak
(1) Az adatvédelmi incidenst az adatkezelő indokolatlan késedelem nélkül, és ha lehetséges, legkésőbb 72 órával azután, hogy az adatvédelmi incidens a tudomására jutott, bejelenti az 55. cikk alapján illetékes felügyeleti hatóságnak, kivéve, ha az adatvédelmi incidens valószínűsíthetően nem jár kockázattal a természetes személyek jogaira és szabadságaira nézve. Ha a bejelentés nem történik meg 72 órán belül, mellékelni kell hozzá a késedelem igazolására szolgáló indokokat is.

(2) Az adatfeldolgozó az adatvédelmi incidenst, az arról való tudomásszerzését követően indokolatlan késedelem nélkül bejelenti az adatkezelőnek.

(3) Az (1) bekezdésben említett bejelentésben legalább:

a)

ismertetni kell az adatvédelmi incidens jellegét, beleértve – ha lehetséges – az érintettek kategóriáit és hozzávetőleges számát, valamint az incidenssel érintett adatok kategóriáit és hozzávetőleges számát;

b)

közölni kell az adatvédelmi tisztviselő vagy a további tájékoztatást nyújtó egyéb kapcsolattartó nevét és elérhetőségeit;

c)

ismertetni kell az adatvédelmi incidensből eredő, valószínűsíthető következményeket;

d)

ismertetni kell az adatkezelő által az adatvédelmi incidens orvoslására tett vagy tervezett intézkedéseket, beleértve adott esetben az adatvédelmi incidensből eredő esetleges hátrányos következmények enyhítését célzó intézkedéseket.

(4) Ha és amennyiben nem lehetséges az információkat egyidejűleg közölni, azok további indokolatlan késedelem nélkül később részletekben is közölhetők.

(5) Az adatkezelő nyilvántartja az adatvédelmi incidenseket, feltüntetve az adatvédelmi incidenshez kapcsolódó tényeket, annak hatásait és az orvoslására tett intézkedéseket. E nyilvántartás lehetővé teszi, hogy a felügyeleti hatóság ellenőrizze az e cikk követelményeinek való megfelelést.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '33',
  '1',
  '(1) Az adatvédelmi incidenst az adatkezelő indokolatlan késedelem nélkül, és ha lehetséges, legkésőbb 72 órával azután, hogy az adatvédelmi incidens a tudomására jutott, bejelenti az 55. cikk alapján illetékes felügyeleti hatóságnak, kivéve, ha az adatvédelmi incidens valószínűsíthetően nem jár kockázattal a természetes személyek jogaira és szabadságaira nézve. Ha a bejelentés nem történik meg 72 órán belül, mellékelni kell hozzá a késedelem igazolására szolgáló indokokat is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '33',
  '2',
  '(2) Az adatfeldolgozó az adatvédelmi incidenst, az arról való tudomásszerzését követően indokolatlan késedelem nélkül bejelenti az adatkezelőnek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '33',
  '3',
  '(3) Az (1) bekezdésben említett bejelentésben legalább:

a)

ismertetni kell az adatvédelmi incidens jellegét, beleértve – ha lehetséges – az érintettek kategóriáit és hozzávetőleges számát, valamint az incidenssel érintett adatok kategóriáit és hozzávetőleges számát;

b)

közölni kell az adatvédelmi tisztviselő vagy a további tájékoztatást nyújtó egyéb kapcsolattartó nevét és elérhetőségeit;

c)

ismertetni kell az adatvédelmi incidensből eredő, valószínűsíthető következményeket;

d)

ismertetni kell az adatkezelő által az adatvédelmi incidens orvoslására tett vagy tervezett intézkedéseket, beleértve adott esetben az adatvédelmi incidensből eredő esetleges hátrányos következmények enyhítését célzó intézkedéseket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '33',
  '3(a)',
  'a) ismertetni kell az adatvédelmi incidens jellegét, beleértve – ha lehetséges – az érintettek kategóriáit és hozzávetőleges számát, valamint az incidenssel érintett adatok kategóriáit és hozzávetőleges számát;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '33',
  '3(b)',
  'b) közölni kell az adatvédelmi tisztviselő vagy a további tájékoztatást nyújtó egyéb kapcsolattartó nevét és elérhetőségeit;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '33',
  '3(c)',
  'c) ismertetni kell az adatvédelmi incidensből eredő, valószínűsíthető következményeket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '33',
  '3(d)',
  'd) ismertetni kell az adatkezelő által az adatvédelmi incidens orvoslására tett vagy tervezett intézkedéseket, beleértve adott esetben az adatvédelmi incidensből eredő esetleges hátrányos következmények enyhítését célzó intézkedéseket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '33',
  '4',
  '(4) Ha és amennyiben nem lehetséges az információkat egyidejűleg közölni, azok további indokolatlan késedelem nélkül később részletekben is közölhetők.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '33',
  '5',
  '(5) Az adatkezelő nyilvántartja az adatvédelmi incidenseket, feltüntetve az adatvédelmi incidenshez kapcsolódó tényeket, annak hatásait és az orvoslására tett intézkedéseket. E nyilvántartás lehetővé teszi, hogy a felügyeleti hatóság ellenőrizze az e cikk követelményeinek való megfelelést.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '34',
  null,
  'Az érintett tájékoztatása az adatvédelmi incidensről
(1) Ha az adatvédelmi incidens valószínűsíthetően magas kockázattal jár a természetes személyek jogaira és szabadságaira nézve, az adatkezelő indokolatlan késedelem nélkül tájékoztatja az érintettet az adatvédelmi incidensről.

(2) Az (1) bekezdésben említett, az érintett részére adott tájékoztatásban világosan és közérthetően ismertetni kell az adatvédelmi incidens jellegét, és közölni kell legalább a 33. cikk (3) bekezdésének b), c) és d) pontjában említett információkat és intézkedéseket.

(3) Az érintettet nem kell az (1) bekezdésben említettek szerint tájékoztatni, ha a következő feltételek bármelyike teljesül:

a)

az adatkezelő megfelelő technikai és szervezési védelmi intézkedéseket hajtott végre, és ezeket az intézkedéseket az adatvédelmi incidens által érintett adatok tekintetében alkalmazták, különösen azokat az intézkedéseket – mint például a titkosítás alkalmazása –, amelyek a személyes adatokhoz való hozzáférésre fel nem jogosított személyek számára értelmezhetetlenné teszik az adatokat;

b)

az adatkezelő az adatvédelmi incidenst követően olyan további intézkedéseket tett, amelyek biztosítják, hogy az érintett jogaira és szabadságaira jelentett, az (1) bekezdésben említett magas kockázat a továbbiakban valószínűsíthetően nem valósul meg;

c)

a tájékoztatás aránytalan erőfeszítést tenne szükségessé. Ilyen esetekben az érintetteket nyilvánosan közzétett információk útján kell tájékoztatni, vagy olyan hasonló intézkedést kell hozni, amely biztosítja az érintettek hasonlóan hatékony tájékoztatását.

(4) Ha az adatkezelő még nem értesítette az érintettet az adatvédelmi incidensről, a felügyeleti hatóság, miután mérlegelte, hogy az adatvédelmi incidens valószínűsíthetően magas kockázattal jár-e, elrendelheti az érintett tájékoztatását, vagy megállapíthatja a (3) bekezdésben említett feltételek valamelyikének teljesülését.

3. szakasz

Adatvédelmi hatásvizsgálat és előzetes konzultáció',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_34'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '34',
  '1',
  '(1) Ha az adatvédelmi incidens valószínűsíthetően magas kockázattal jár a természetes személyek jogaira és szabadságaira nézve, az adatkezelő indokolatlan késedelem nélkül tájékoztatja az érintettet az adatvédelmi incidensről.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_34'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '34',
  '2',
  '(2) Az (1) bekezdésben említett, az érintett részére adott tájékoztatásban világosan és közérthetően ismertetni kell az adatvédelmi incidens jellegét, és közölni kell legalább a 33. cikk (3) bekezdésének b), c) és d) pontjában említett információkat és intézkedéseket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_34'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '34',
  '3',
  '(3) Az érintettet nem kell az (1) bekezdésben említettek szerint tájékoztatni, ha a következő feltételek bármelyike teljesül:

a)

az adatkezelő megfelelő technikai és szervezési védelmi intézkedéseket hajtott végre, és ezeket az intézkedéseket az adatvédelmi incidens által érintett adatok tekintetében alkalmazták, különösen azokat az intézkedéseket – mint például a titkosítás alkalmazása –, amelyek a személyes adatokhoz való hozzáférésre fel nem jogosított személyek számára értelmezhetetlenné teszik az adatokat;

b)

az adatkezelő az adatvédelmi incidenst követően olyan további intézkedéseket tett, amelyek biztosítják, hogy az érintett jogaira és szabadságaira jelentett, az (1) bekezdésben említett magas kockázat a továbbiakban valószínűsíthetően nem valósul meg;

c)

a tájékoztatás aránytalan erőfeszítést tenne szükségessé. Ilyen esetekben az érintetteket nyilvánosan közzétett információk útján kell tájékoztatni, vagy olyan hasonló intézkedést kell hozni, amely biztosítja az érintettek hasonlóan hatékony tájékoztatását.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_34'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '34',
  '3(a)',
  'a) az adatkezelő megfelelő technikai és szervezési védelmi intézkedéseket hajtott végre, és ezeket az intézkedéseket az adatvédelmi incidens által érintett adatok tekintetében alkalmazták, különösen azokat az intézkedéseket – mint például a titkosítás alkalmazása –, amelyek a személyes adatokhoz való hozzáférésre fel nem jogosított személyek számára értelmezhetetlenné teszik az adatokat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_34'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '34',
  '3(b)',
  'b) az adatkezelő az adatvédelmi incidenst követően olyan további intézkedéseket tett, amelyek biztosítják, hogy az érintett jogaira és szabadságaira jelentett, az (1) bekezdésben említett magas kockázat a továbbiakban valószínűsíthetően nem valósul meg;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_34'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '34',
  '3(c)',
  'c) a tájékoztatás aránytalan erőfeszítést tenne szükségessé. Ilyen esetekben az érintetteket nyilvánosan közzétett információk útján kell tájékoztatni, vagy olyan hasonló intézkedést kell hozni, amely biztosítja az érintettek hasonlóan hatékony tájékoztatását.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_34'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '34',
  '4',
  '(4) Ha az adatkezelő még nem értesítette az érintettet az adatvédelmi incidensről, a felügyeleti hatóság, miután mérlegelte, hogy az adatvédelmi incidens valószínűsíthetően magas kockázattal jár-e, elrendelheti az érintett tájékoztatását, vagy megállapíthatja a (3) bekezdésben említett feltételek valamelyikének teljesülését.

3. szakasz

Adatvédelmi hatásvizsgálat és előzetes konzultáció',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_34'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  null,
  'Adatvédelmi hatásvizsgálat
(1) Ha az adatkezelés valamely – különösen új technológiákat alkalmazó – típusa –, figyelemmel annak jellegére, hatókörére, körülményére és céljaira, valószínűsíthetően magas kockázattal jár a természetes személyek jogaira és szabadságaira nézve, akkor az adatkezelő az adatkezelést megelőzően hatásvizsgálatot végez arra vonatkozóan, hogy a tervezett adatkezelési műveletek a személyes adatok védelmét hogyan érintik. Olyan egymáshoz hasonló típusú adatkezelési műveletek, amelyek egymáshoz hasonló magas kockázatokat jelentenek, egyetlen hatásvizsgálat keretei között is értékelhetőek.

(2) Ha van kijelölt adatvédelmi tisztviselő, az adatkezelő az adatvédelmi hatásvizsgálat elvégzésekor az adatvédelmi tisztviselő szakmai tanácsát köteles kikérni.

(3) Az (1) bekezdésben említett adatvédelmi hatásvizsgálatot különösen az alábbi esetekben kell elvégezni:

a)

természetes személyekre vonatkozó egyes személyes jellemzők olyan módszeres és kiterjedt értékelése, amely automatizált adatkezelésen – ideértve a profilalkotást is –alapul, és amelyre a természetes személy tekintetében joghatással bíró vagy a természetes személyt hasonlóképpen jelentős mértékben érintő döntések épülnek;

b)

a 9. cikk (1) bekezdésében említett személyes adatok különleges kategóriái, vagy a 10. cikkben említett, büntetőjogi felelősség megállapítására vonatkozó határozatokra és bűncselekményekre vonatkozó személyes adatok nagy számban történő kezelése; vagy

c)

nyilvános helyek nagymértékű, módszeres megfigyelése.

(4) A felügyeleti hatóságnak össze kell állítania és nyilvánosságra kell hoznia az olyan adatkezelési műveletek típusainak a jegyzékét, amelyekre vonatkozóan az (1) bekezdés értelmében adatvédelmi hatásvizsgálatot kell végezni. A felügyeleti hatóság továbbítja az említett jegyzékeket a Testület részére.

(5) A felügyeleti hatóság összeállíthatja és nyilvánosságra hozhatja az olyan adatkezelési műveletek típusainak a jegyzékét is, amelyekre vonatkozóan nem kell adatvédelmi hatásvizsgálatot végezni. A felügyeleti hatóság továbbítja ezeket a jegyzékeket a Testület részére.

(6) A (4) és (5) bekezdésben említett jegyzékek elfogadását megelőzően az illetékes felügyeleti hatóság igénybe veszi a 63. cikkben említett egységességi mechanizmust, ha ezek a jegyzékek olyan adatkezelési tevékenységeket tartalmaznak, amelyek az érintettek számára történő, több tagállamra kiterjedő áru- vagy szolgáltatás nyújtásához vagy az érintettek viselkedésének több tagállamra kiterjedő megfigyeléséhez kapcsolódnak, vagy érdemben érinthetik a személyes adatok Unión belüli szabad áramlását.

(7) A hatásvizsgálat kiterjed legalább:

a)

a tervezett adatkezelési műveletek módszeres leírására és az adatkezelés céljainak ismertetésére, beleértve adott esetben az adatkezelő által érvényesíteni kívánt jogos érdeket;

b)

az adatkezelés céljaira figyelemmel az adatkezelési műveletek szükségességi és arányossági vizsgálatára;

c)

az (1) bekezdésben említett, az érintett jogait és szabadságait érintő kockázatok vizsgálatára; és

d)

a kockázatok kezelését célzó intézkedések bemutatására, ideértve a személyes adatok védelmét és az e rendelettel való összhang igazolását szolgáló, az érintettek és más személyek jogait és jogos érdekeit figyelembe vevő garanciákat, biztonsági intézkedéseket és mechanizmusokat.

(8) Az adatkezelők, illetve adatfeldolgozók által végzett adatkezelési műveletek hatásainak értékelése – különösen az adatvédelmi hatásvizsgálatok – során megfelelően figyelembe kell venni, hogy a szóban forgó adatkezelők, illetve adatfeldolgozók teljesítik-e a 40. cikkben említett jóváhagyott magatartási kódexek előírásait.

(9) Az adatkezelő adott esetben – a kereskedelmi érdekek vagy a közérdek védelmének vagy az adatkezelési műveletek biztonságának sérelme nélkül – kikéri az érintettek vagy képviselőik véleményét a tervezett adatkezelésről.

(10) Ha a 6. cikk (1) bekezdésének c) vagy e) pontja szerinti adatkezelés jogalapját uniós vagy az adatkezelőre alkalmazandó tagállami jog írja elő, és e jog a szóban forgó konkrét adatkezelési műveletet vagy műveleteket is szabályozza, valamint e jogalap elfogadása során egy általános hatásvizsgálat részeként már végeztek adatvédelmi hatásvizsgálatot, akkor az (1)–(7) bekezdést nem kell alkalmazni, kivéve, ha a tagállamok az adatkezelési tevékenységet megelőzően ilyen hatásvizsgálat elvégzését szükségesnek tartják.

(11) Az adatkezelő szükség szerint, de legalább az adatkezelési műveletek által jelentett kockázat változása esetén ellenőrzést folytat le annak értékelése céljából, hogy a személyes adatok kezelése az adatvédelmi hatásvizsgálatnak megfelelően történik-e.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '1',
  '(1) Ha az adatkezelés valamely – különösen új technológiákat alkalmazó – típusa –, figyelemmel annak jellegére, hatókörére, körülményére és céljaira, valószínűsíthetően magas kockázattal jár a természetes személyek jogaira és szabadságaira nézve, akkor az adatkezelő az adatkezelést megelőzően hatásvizsgálatot végez arra vonatkozóan, hogy a tervezett adatkezelési műveletek a személyes adatok védelmét hogyan érintik. Olyan egymáshoz hasonló típusú adatkezelési műveletek, amelyek egymáshoz hasonló magas kockázatokat jelentenek, egyetlen hatásvizsgálat keretei között is értékelhetőek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '2',
  '(2) Ha van kijelölt adatvédelmi tisztviselő, az adatkezelő az adatvédelmi hatásvizsgálat elvégzésekor az adatvédelmi tisztviselő szakmai tanácsát köteles kikérni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '3',
  '(3) Az (1) bekezdésben említett adatvédelmi hatásvizsgálatot különösen az alábbi esetekben kell elvégezni:

a)

természetes személyekre vonatkozó egyes személyes jellemzők olyan módszeres és kiterjedt értékelése, amely automatizált adatkezelésen – ideértve a profilalkotást is –alapul, és amelyre a természetes személy tekintetében joghatással bíró vagy a természetes személyt hasonlóképpen jelentős mértékben érintő döntések épülnek;

b)

a 9. cikk (1) bekezdésében említett személyes adatok különleges kategóriái, vagy a 10. cikkben említett, büntetőjogi felelősség megállapítására vonatkozó határozatokra és bűncselekményekre vonatkozó személyes adatok nagy számban történő kezelése; vagy

c)

nyilvános helyek nagymértékű, módszeres megfigyelése.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '3(a)',
  'a) természetes személyekre vonatkozó egyes személyes jellemzők olyan módszeres és kiterjedt értékelése, amely automatizált adatkezelésen – ideértve a profilalkotást is –alapul, és amelyre a természetes személy tekintetében joghatással bíró vagy a természetes személyt hasonlóképpen jelentős mértékben érintő döntések épülnek;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '3(b)',
  'b) a 9. cikk (1) bekezdésében említett személyes adatok különleges kategóriái, vagy a 10. cikkben említett, büntetőjogi felelősség megállapítására vonatkozó határozatokra és bűncselekményekre vonatkozó személyes adatok nagy számban történő kezelése; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '3(c)',
  'c) nyilvános helyek nagymértékű, módszeres megfigyelése.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '4',
  '(4) A felügyeleti hatóságnak össze kell állítania és nyilvánosságra kell hoznia az olyan adatkezelési műveletek típusainak a jegyzékét, amelyekre vonatkozóan az (1) bekezdés értelmében adatvédelmi hatásvizsgálatot kell végezni. A felügyeleti hatóság továbbítja az említett jegyzékeket a Testület részére.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '5',
  '(5) A felügyeleti hatóság összeállíthatja és nyilvánosságra hozhatja az olyan adatkezelési műveletek típusainak a jegyzékét is, amelyekre vonatkozóan nem kell adatvédelmi hatásvizsgálatot végezni. A felügyeleti hatóság továbbítja ezeket a jegyzékeket a Testület részére.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '6',
  '(6) A (4) és (5) bekezdésben említett jegyzékek elfogadását megelőzően az illetékes felügyeleti hatóság igénybe veszi a 63. cikkben említett egységességi mechanizmust, ha ezek a jegyzékek olyan adatkezelési tevékenységeket tartalmaznak, amelyek az érintettek számára történő, több tagállamra kiterjedő áru- vagy szolgáltatás nyújtásához vagy az érintettek viselkedésének több tagállamra kiterjedő megfigyeléséhez kapcsolódnak, vagy érdemben érinthetik a személyes adatok Unión belüli szabad áramlását.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '7',
  '(7) A hatásvizsgálat kiterjed legalább:

a)

a tervezett adatkezelési műveletek módszeres leírására és az adatkezelés céljainak ismertetésére, beleértve adott esetben az adatkezelő által érvényesíteni kívánt jogos érdeket;

b)

az adatkezelés céljaira figyelemmel az adatkezelési műveletek szükségességi és arányossági vizsgálatára;

c)

az (1) bekezdésben említett, az érintett jogait és szabadságait érintő kockázatok vizsgálatára; és

d)

a kockázatok kezelését célzó intézkedések bemutatására, ideértve a személyes adatok védelmét és az e rendelettel való összhang igazolását szolgáló, az érintettek és más személyek jogait és jogos érdekeit figyelembe vevő garanciákat, biztonsági intézkedéseket és mechanizmusokat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '7(a)',
  'a) a tervezett adatkezelési műveletek módszeres leírására és az adatkezelés céljainak ismertetésére, beleértve adott esetben az adatkezelő által érvényesíteni kívánt jogos érdeket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '7(b)',
  'b) az adatkezelés céljaira figyelemmel az adatkezelési műveletek szükségességi és arányossági vizsgálatára;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '7(c)',
  'c) az (1) bekezdésben említett, az érintett jogait és szabadságait érintő kockázatok vizsgálatára; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '7(d)',
  'd) a kockázatok kezelését célzó intézkedések bemutatására, ideértve a személyes adatok védelmét és az e rendelettel való összhang igazolását szolgáló, az érintettek és más személyek jogait és jogos érdekeit figyelembe vevő garanciákat, biztonsági intézkedéseket és mechanizmusokat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '8',
  '(8) Az adatkezelők, illetve adatfeldolgozók által végzett adatkezelési műveletek hatásainak értékelése – különösen az adatvédelmi hatásvizsgálatok – során megfelelően figyelembe kell venni, hogy a szóban forgó adatkezelők, illetve adatfeldolgozók teljesítik-e a 40. cikkben említett jóváhagyott magatartási kódexek előírásait.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '9',
  '(9) Az adatkezelő adott esetben – a kereskedelmi érdekek vagy a közérdek védelmének vagy az adatkezelési műveletek biztonságának sérelme nélkül – kikéri az érintettek vagy képviselőik véleményét a tervezett adatkezelésről.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '10',
  '(10) Ha a 6. cikk (1) bekezdésének c) vagy e) pontja szerinti adatkezelés jogalapját uniós vagy az adatkezelőre alkalmazandó tagállami jog írja elő, és e jog a szóban forgó konkrét adatkezelési műveletet vagy műveleteket is szabályozza, valamint e jogalap elfogadása során egy általános hatásvizsgálat részeként már végeztek adatvédelmi hatásvizsgálatot, akkor az (1)–(7) bekezdést nem kell alkalmazni, kivéve, ha a tagállamok az adatkezelési tevékenységet megelőzően ilyen hatásvizsgálat elvégzését szükségesnek tartják.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '35',
  '11',
  '(11) Az adatkezelő szükség szerint, de legalább az adatkezelési műveletek által jelentett kockázat változása esetén ellenőrzést folytat le annak értékelése céljából, hogy a személyes adatok kezelése az adatvédelmi hatásvizsgálatnak megfelelően történik-e.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '36',
  null,
  'Előzetes konzultáció
(1) Ha a 35. cikkben előírt adatvédelmi hatásvizsgálat megállapítja, hogy az adatkezelés az adatkezelő által a kockázat mérséklése céljából tett intézkedések hiányában valószínűsíthetően magas kockázattal jár, a személyes adatok kezelését megelőzően az adatkezelő konzultál a felügyeleti hatósággal.

(2) Ha a felügyeleti hatóság véleménye szerint az (1) bekezdés szerint tervezett adatkezelés megsértené e rendeletet – különösen, ha az adatkezelő a kockázatot nem elégséges módon azonosította vagy csökkentette –, a felügyeleti hatóság az adatkezelőnek és adott esetben az adatfeldolgozónak legkésőbb a konzultáció iránti megkeresés kézhezvételétől számított nyolc héten belül írásban tanácsot ad, továbbá gyakorolhatja az 58. cikkben említett hatásköreit. Ez a határidő – a tervezett adatkezelés összetettségétől függően – hat héttel meghosszabbítható. A felügyeleti hatóság a megkeresés kézhezvételétől számított egy hónapon belül tájékoztatja az adatkezelőt vagy adott esetben az adatfeldolgozót a meghosszabbításról és a késedelem okairól. Az említett időtartamok felfüggeszthetők arra az időtartamra, amíg a felügyeleti hatóság nem jut hozzá azokhoz az információkhoz, amelyeket adott esetben a konzultáció céljából kért.

(3) Az adatkezelő a felügyeleti hatósággal folytatott, (1) bekezdés szerinti konzultáció során a felügyeleti hatóságot tájékoztatja:

a)

adott esetben az adatkezelésben részt vevő adatkezelő, közös adatkezelők és adatfeldolgozók feladatköreiről, különösen vállalkozáscsoporton belüli adatkezelés esetén;

b)

a tervezett adatkezelés céljairól és módjairól;

c)

az érintettek e rendelet értelmében fennálló jogainak és szabadságainak védelmében hozott intézkedésekről és garanciákról;

d)

adott esetben, az adatvédelmi tisztviselő elérhetőségeiről;

e)

a 35. cikk szerinti adatvédelmi hatásvizsgálatról; és

f)

a felügyeleti hatóság által kért minden egyéb információról.

(4) A tagállamok konzultálnak a felügyeleti hatósággal minden, a személyes adatok kezeléséhez kapcsolódó, a nemzeti parlament által elfogadandó jogalkotási intézkedésre – vagy ilyen jogalkotási intézkedésen alapuló szabályozási intézkedésre – irányuló javaslat előkészítése során.

(5) Az (1) bekezdéstől eltérve a tagállami jog előírhatja, hogy az adatkezelők konzultáljanak a felügyeleti hatósággal, és szerezzék be a felügyeleti hatóság előzetes engedélyét akkor is, ha valamely közérdek alapján ellátandó feladat végrehajtásához kapcsolódóan kezelnek személyes adatokat, ideértve a személyes adatoknak a szociális védelemhez és a népegészségügyhöz kapcsolódó kezelését is.

4. szakasz

Adatvédelmi tisztviselő',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '36',
  '1',
  '(1) Ha a 35. cikkben előírt adatvédelmi hatásvizsgálat megállapítja, hogy az adatkezelés az adatkezelő által a kockázat mérséklése céljából tett intézkedések hiányában valószínűsíthetően magas kockázattal jár, a személyes adatok kezelését megelőzően az adatkezelő konzultál a felügyeleti hatósággal.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '36',
  '2',
  '(2) Ha a felügyeleti hatóság véleménye szerint az (1) bekezdés szerint tervezett adatkezelés megsértené e rendeletet – különösen, ha az adatkezelő a kockázatot nem elégséges módon azonosította vagy csökkentette –, a felügyeleti hatóság az adatkezelőnek és adott esetben az adatfeldolgozónak legkésőbb a konzultáció iránti megkeresés kézhezvételétől számított nyolc héten belül írásban tanácsot ad, továbbá gyakorolhatja az 58. cikkben említett hatásköreit. Ez a határidő – a tervezett adatkezelés összetettségétől függően – hat héttel meghosszabbítható. A felügyeleti hatóság a megkeresés kézhezvételétől számított egy hónapon belül tájékoztatja az adatkezelőt vagy adott esetben az adatfeldolgozót a meghosszabbításról és a késedelem okairól. Az említett időtartamok felfüggeszthetők arra az időtartamra, amíg a felügyeleti hatóság nem jut hozzá azokhoz az információkhoz, amelyeket adott esetben a konzultáció céljából kért.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '36',
  '3',
  '(3) Az adatkezelő a felügyeleti hatósággal folytatott, (1) bekezdés szerinti konzultáció során a felügyeleti hatóságot tájékoztatja:

a)

adott esetben az adatkezelésben részt vevő adatkezelő, közös adatkezelők és adatfeldolgozók feladatköreiről, különösen vállalkozáscsoporton belüli adatkezelés esetén;

b)

a tervezett adatkezelés céljairól és módjairól;

c)

az érintettek e rendelet értelmében fennálló jogainak és szabadságainak védelmében hozott intézkedésekről és garanciákról;

d)

adott esetben, az adatvédelmi tisztviselő elérhetőségeiről;

e)

a 35. cikk szerinti adatvédelmi hatásvizsgálatról; és

f)

a felügyeleti hatóság által kért minden egyéb információról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '36',
  '3(a)',
  'a) adott esetben az adatkezelésben részt vevő adatkezelő, közös adatkezelők és adatfeldolgozók feladatköreiről, különösen vállalkozáscsoporton belüli adatkezelés esetén;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '36',
  '3(b)',
  'b) a tervezett adatkezelés céljairól és módjairól;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '36',
  '3(c)',
  'c) az érintettek e rendelet értelmében fennálló jogainak és szabadságainak védelmében hozott intézkedésekről és garanciákról;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '36',
  '3(d)',
  'd) adott esetben, az adatvédelmi tisztviselő elérhetőségeiről;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '36',
  '3(e)',
  'e) a 35. cikk szerinti adatvédelmi hatásvizsgálatról; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '36',
  '3(f)',
  'f) a felügyeleti hatóság által kért minden egyéb információról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '36',
  '4',
  '(4) A tagállamok konzultálnak a felügyeleti hatósággal minden, a személyes adatok kezeléséhez kapcsolódó, a nemzeti parlament által elfogadandó jogalkotási intézkedésre – vagy ilyen jogalkotási intézkedésen alapuló szabályozási intézkedésre – irányuló javaslat előkészítése során.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '36',
  '5',
  '(5) Az (1) bekezdéstől eltérve a tagállami jog előírhatja, hogy az adatkezelők konzultáljanak a felügyeleti hatósággal, és szerezzék be a felügyeleti hatóság előzetes engedélyét akkor is, ha valamely közérdek alapján ellátandó feladat végrehajtásához kapcsolódóan kezelnek személyes adatokat, ideértve a személyes adatoknak a szociális védelemhez és a népegészségügyhöz kapcsolódó kezelését is.

4. szakasz

Adatvédelmi tisztviselő',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '37',
  null,
  'Az adatvédelmi tisztviselő kijelölése
(1) Az adatkezelő és az adatfeldolgozó adatvédelmi tisztviselőt jelöl ki minden olyan esetben, amikor:

a)

az adatkezelést közhatalmi szervek vagy egyéb, közfeladatot ellátó szervek végzik, kivéve az igazságszolgáltatási feladatkörükben eljáró bíróságokat;

b)

az adatkezelő vagy az adatfeldolgozó fő tevékenységei olyan adatkezelési műveleteket foglalnak magukban, amelyek jellegüknél, hatókörüknél és/vagy céljaiknál fogva az érintettek rendszeres és szisztematikus, nagymértékű megfigyelését teszik szükségessé;

c)

az adatkezelő vagy az adatfeldolgozó fő tevékenységei a személyes adatok 9. cikk szerinti különleges kategóriáinak és a 10. cikkben említett, büntetőjogi felelősség megállapítására vonatkozó határozatokra és bűncselekményekre vonatkozó adatok nagy számban történő kezelését foglalják magukban.

(2) A vállalkozáscsoport közös adatvédelmi tisztviselőt is kijelölhet, ha az adatvédelmi tisztviselő valamennyi tevékenységi helyről könnyen elérhető.

(3) Ha az adatkezelő vagy az adatfeldolgozó közhatalmi szerv vagy egyéb, közfeladatot ellátó szerv, közös adatvédelmi tisztviselő jelölhető ki több ilyen szerv számára, az adott szervek szervezeti felépítésének és méretének figyelembevételével.

(4) Az (1) bekezdésben foglaltaktól eltérő esetekben az adatkezelő vagy az adatfeldolgozó, illetve az adatkezelők vagy adatfeldolgozók kategóriáit képviselő egyesületek és egyéb szervezetek adatvédelmi tisztviselőt jelölhetnek ki, vagy ha ezt uniós vagy tagállami jog írja elő, kötelesek kijelölni. Az adatkezelőket vagy adatfeldolgozókat képviselő ilyen egyesületek és egyéb szervezetek nevében az adatvédelmi tisztviselő eljárhat.

(5) Az adatvédelmi tisztviselőt szakmai rátermettség és különösen az adatvédelmi jog és gyakorlat szakértői szintű ismerete, valamint a 39. cikkben említett feladatok ellátására való alkalmasság alapján kell kijelölni.

(6) Az adatvédelmi tisztviselő az adatkezelő vagy az adatfeldolgozó alkalmazottja lehet, vagy szolgáltatási szerződés keretében láthatja el a feladatait.

(7) Az adatkezelő vagy az adatfeldolgozó közzéteszi az adatvédelmi tisztviselő nevét és elérhetőségét, és azokat a felügyeleti hatósággal közli.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '37',
  '1',
  '(1) Az adatkezelő és az adatfeldolgozó adatvédelmi tisztviselőt jelöl ki minden olyan esetben, amikor:

a)

az adatkezelést közhatalmi szervek vagy egyéb, közfeladatot ellátó szervek végzik, kivéve az igazságszolgáltatási feladatkörükben eljáró bíróságokat;

b)

az adatkezelő vagy az adatfeldolgozó fő tevékenységei olyan adatkezelési műveleteket foglalnak magukban, amelyek jellegüknél, hatókörüknél és/vagy céljaiknál fogva az érintettek rendszeres és szisztematikus, nagymértékű megfigyelését teszik szükségessé;

c)

az adatkezelő vagy az adatfeldolgozó fő tevékenységei a személyes adatok 9. cikk szerinti különleges kategóriáinak és a 10. cikkben említett, büntetőjogi felelősség megállapítására vonatkozó határozatokra és bűncselekményekre vonatkozó adatok nagy számban történő kezelését foglalják magukban.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '37',
  '1(a)',
  'a) az adatkezelést közhatalmi szervek vagy egyéb, közfeladatot ellátó szervek végzik, kivéve az igazságszolgáltatási feladatkörükben eljáró bíróságokat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '37',
  '1(b)',
  'b) az adatkezelő vagy az adatfeldolgozó fő tevékenységei olyan adatkezelési műveleteket foglalnak magukban, amelyek jellegüknél, hatókörüknél és/vagy céljaiknál fogva az érintettek rendszeres és szisztematikus, nagymértékű megfigyelését teszik szükségessé;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '37',
  '1(c)',
  'c) az adatkezelő vagy az adatfeldolgozó fő tevékenységei a személyes adatok 9. cikk szerinti különleges kategóriáinak és a 10. cikkben említett, büntetőjogi felelősség megállapítására vonatkozó határozatokra és bűncselekményekre vonatkozó adatok nagy számban történő kezelését foglalják magukban.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '37',
  '2',
  '(2) A vállalkozáscsoport közös adatvédelmi tisztviselőt is kijelölhet, ha az adatvédelmi tisztviselő valamennyi tevékenységi helyről könnyen elérhető.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '37',
  '3',
  '(3) Ha az adatkezelő vagy az adatfeldolgozó közhatalmi szerv vagy egyéb, közfeladatot ellátó szerv, közös adatvédelmi tisztviselő jelölhető ki több ilyen szerv számára, az adott szervek szervezeti felépítésének és méretének figyelembevételével.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '37',
  '4',
  '(4) Az (1) bekezdésben foglaltaktól eltérő esetekben az adatkezelő vagy az adatfeldolgozó, illetve az adatkezelők vagy adatfeldolgozók kategóriáit képviselő egyesületek és egyéb szervezetek adatvédelmi tisztviselőt jelölhetnek ki, vagy ha ezt uniós vagy tagállami jog írja elő, kötelesek kijelölni. Az adatkezelőket vagy adatfeldolgozókat képviselő ilyen egyesületek és egyéb szervezetek nevében az adatvédelmi tisztviselő eljárhat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '37',
  '5',
  '(5) Az adatvédelmi tisztviselőt szakmai rátermettség és különösen az adatvédelmi jog és gyakorlat szakértői szintű ismerete, valamint a 39. cikkben említett feladatok ellátására való alkalmasság alapján kell kijelölni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '37',
  '6',
  '(6) Az adatvédelmi tisztviselő az adatkezelő vagy az adatfeldolgozó alkalmazottja lehet, vagy szolgáltatási szerződés keretében láthatja el a feladatait.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '37',
  '7',
  '(7) Az adatkezelő vagy az adatfeldolgozó közzéteszi az adatvédelmi tisztviselő nevét és elérhetőségét, és azokat a felügyeleti hatósággal közli.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '38',
  null,
  'Az adatvédelmi tisztviselő jogállása
(1) Az adatkezelő és az adatfeldolgozó biztosítja, hogy az adatvédelmi tisztviselő a személyes adatok védelmével kapcsolatos összes ügybe megfelelő módon és időben bekapcsolódjon.

(2) Az adatkezelő és az adatfeldolgozó támogatja az adatvédelmi tisztviselőt a 39. cikkben említett feladatai ellátásában azáltal, hogy biztosítja számára azokat az forrásokat, amelyek e feladatok végrehajtásához, a személyes adatokhoz és az adatkezelési műveletekhez való hozzáféréshez, valamint az adatvédelmi tisztviselő szakértői szintű ismereteinek fenntartásához szükségesek.

(3) Az adatkezelő és az adatfeldolgozó biztosítja, hogy az adatvédelmi tisztviselő a feladatai ellátásával kapcsolatban utasításokat senkitől ne fogadjon el. Az adatkezelő vagy az adatfeldolgozó az adatvédelmi tisztviselőt feladatai ellátásával összefüggésben nem bocsáthatja el és szankcióval nem sújthatja. Az adatvédelmi tisztviselő közvetlenül az adatkezelő vagy az adatfeldolgozó legfelső vezetésének tartozik felelősséggel.

(4) Az érintettek a személyes adataik kezeléséhez és az e rendelet szerinti jogaik gyakorlásához kapcsolódó valamennyi kérdésben az adatvédelmi tisztviselőhöz fordulhatnak.

(5) Az adatvédelmi tisztviselőt feladatai teljesítésével kapcsolatban uniós vagy tagállami jogban meghatározott titoktartási kötelezettség vagy az adatok bizalmas kezelésére vonatkozó kötelezettség köti.

(6) Az adatvédelmi tisztviselő más feladatokat is elláthat. Az adatkezelő vagy az adatfeldolgozó biztosítja, hogy e feladatokból ne fakadjon összeférhetetlenség.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_38'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '38',
  '1',
  '(1) Az adatkezelő és az adatfeldolgozó biztosítja, hogy az adatvédelmi tisztviselő a személyes adatok védelmével kapcsolatos összes ügybe megfelelő módon és időben bekapcsolódjon.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_38'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '38',
  '2',
  '(2) Az adatkezelő és az adatfeldolgozó támogatja az adatvédelmi tisztviselőt a 39. cikkben említett feladatai ellátásában azáltal, hogy biztosítja számára azokat az forrásokat, amelyek e feladatok végrehajtásához, a személyes adatokhoz és az adatkezelési műveletekhez való hozzáféréshez, valamint az adatvédelmi tisztviselő szakértői szintű ismereteinek fenntartásához szükségesek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_38'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '38',
  '3',
  '(3) Az adatkezelő és az adatfeldolgozó biztosítja, hogy az adatvédelmi tisztviselő a feladatai ellátásával kapcsolatban utasításokat senkitől ne fogadjon el. Az adatkezelő vagy az adatfeldolgozó az adatvédelmi tisztviselőt feladatai ellátásával összefüggésben nem bocsáthatja el és szankcióval nem sújthatja. Az adatvédelmi tisztviselő közvetlenül az adatkezelő vagy az adatfeldolgozó legfelső vezetésének tartozik felelősséggel.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_38'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '38',
  '4',
  '(4) Az érintettek a személyes adataik kezeléséhez és az e rendelet szerinti jogaik gyakorlásához kapcsolódó valamennyi kérdésben az adatvédelmi tisztviselőhöz fordulhatnak.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_38'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '38',
  '5',
  '(5) Az adatvédelmi tisztviselőt feladatai teljesítésével kapcsolatban uniós vagy tagállami jogban meghatározott titoktartási kötelezettség vagy az adatok bizalmas kezelésére vonatkozó kötelezettség köti.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_38'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '38',
  '6',
  '(6) Az adatvédelmi tisztviselő más feladatokat is elláthat. Az adatkezelő vagy az adatfeldolgozó biztosítja, hogy e feladatokból ne fakadjon összeférhetetlenség.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_38'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '39',
  null,
  'Az adatvédelmi tisztviselő feladatai
(1) Az adatvédelmi tisztviselő legalább a következő feladatokat ellátja:

a)

tájékoztat és szakmai tanácsot ad az adatkezelő vagy az adatfeldolgozó, továbbá az adatkezelést végző alkalmazottak részére az e rendelet, valamint az egyéb uniós vagy tagállami adatvédelmi rendelkezések szerinti kötelezettségeikkel kapcsolatban;

b)

ellenőrzi az e rendeletnek, valamint az egyéb uniós vagy tagállami adatvédelmi rendelkezéseknek, továbbá az adatkezelő vagy az adatfeldolgozó személyes adatok védelmével kapcsolatos belső szabályainak való megfelelést, ideértve a feladatkörök kijelölését, az adatkezelési műveletekben vevő személyzet tudatosság-növelését és képzését, valamint a kapcsolódó auditokat is;

c)

kérésre szakmai tanácsot ad az adatvédelmi hatásvizsgálatra vonatkozóan, valamint nyomon követi a hatásvizsgálat 35. cikk szerinti elvégzését;

d)

együttműködik a felügyeleti hatósággal; és

e)

az adatkezeléssel összefüggő ügyekben – ideértve a 36. cikkben említett előzetes konzultációt is – kapcsolattartó pontként szolgál a felügyeleti hatóság felé, valamint adott esetben bármely egyéb kérdésben konzultációt folytat vele.

(2) Az adatvédelmi tisztviselő feladatait az adatkezelési műveletekhez fűződő kockázat megfelelő figyelembevételével, az adatkezelés jellegére, hatókörére, körülményére és céljára is tekintettel végzi.

5. szakasz

Magatartási kódexek és tanúsítás',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_39'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '39',
  '1',
  '(1) Az adatvédelmi tisztviselő legalább a következő feladatokat ellátja:

a)

tájékoztat és szakmai tanácsot ad az adatkezelő vagy az adatfeldolgozó, továbbá az adatkezelést végző alkalmazottak részére az e rendelet, valamint az egyéb uniós vagy tagállami adatvédelmi rendelkezések szerinti kötelezettségeikkel kapcsolatban;

b)

ellenőrzi az e rendeletnek, valamint az egyéb uniós vagy tagállami adatvédelmi rendelkezéseknek, továbbá az adatkezelő vagy az adatfeldolgozó személyes adatok védelmével kapcsolatos belső szabályainak való megfelelést, ideértve a feladatkörök kijelölését, az adatkezelési műveletekben vevő személyzet tudatosság-növelését és képzését, valamint a kapcsolódó auditokat is;

c)

kérésre szakmai tanácsot ad az adatvédelmi hatásvizsgálatra vonatkozóan, valamint nyomon követi a hatásvizsgálat 35. cikk szerinti elvégzését;

d)

együttműködik a felügyeleti hatósággal; és

e)

az adatkezeléssel összefüggő ügyekben – ideértve a 36. cikkben említett előzetes konzultációt is – kapcsolattartó pontként szolgál a felügyeleti hatóság felé, valamint adott esetben bármely egyéb kérdésben konzultációt folytat vele.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_39'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '39',
  '1(a)',
  'a) tájékoztat és szakmai tanácsot ad az adatkezelő vagy az adatfeldolgozó, továbbá az adatkezelést végző alkalmazottak részére az e rendelet, valamint az egyéb uniós vagy tagállami adatvédelmi rendelkezések szerinti kötelezettségeikkel kapcsolatban;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_39'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '39',
  '1(b)',
  'b) ellenőrzi az e rendeletnek, valamint az egyéb uniós vagy tagállami adatvédelmi rendelkezéseknek, továbbá az adatkezelő vagy az adatfeldolgozó személyes adatok védelmével kapcsolatos belső szabályainak való megfelelést, ideértve a feladatkörök kijelölését, az adatkezelési műveletekben vevő személyzet tudatosság-növelését és képzését, valamint a kapcsolódó auditokat is;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_39'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '39',
  '1(c)',
  'c) kérésre szakmai tanácsot ad az adatvédelmi hatásvizsgálatra vonatkozóan, valamint nyomon követi a hatásvizsgálat 35. cikk szerinti elvégzését;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_39'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '39',
  '1(d)',
  'd) együttműködik a felügyeleti hatósággal; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_39'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '39',
  '1(e)',
  'e) az adatkezeléssel összefüggő ügyekben – ideértve a 36. cikkben említett előzetes konzultációt is – kapcsolattartó pontként szolgál a felügyeleti hatóság felé, valamint adott esetben bármely egyéb kérdésben konzultációt folytat vele.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_39'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '39',
  '2',
  '(2) Az adatvédelmi tisztviselő feladatait az adatkezelési műveletekhez fűződő kockázat megfelelő figyelembevételével, az adatkezelés jellegére, hatókörére, körülményére és céljára is tekintettel végzi.

5. szakasz

Magatartási kódexek és tanúsítás',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_39'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  null,
  'Magatartási kódexek
(1) A tagállamok, a felügyeleti hatóságok, a Testület és a Bizottság ösztönzik olyan magatartási kódexek kidolgozását, amelyek – a különböző adatkezelő ágazatok egyedi jellemzőinek, valamint a mikro-, kis- és középvállalkozások sajátos igényeinek figyelembevételével – segítik e rendelet helyes alkalmazását.

(2) Az adatkezelők vagy az adatfeldolgozók kategóriáit képviselő egyesületek és egyéb szervezetek magatartási kódexeket dolgozhatnak ki, illetve a már meglévő magatartási kódexeket módosíthatják vagy bővíthetik abból a célból, hogy pontosítsák e rendelet alkalmazását, így például az alábbiakkal kapcsolatban:

a)

tisztességes és átlátható adatkezelés;

b)

az adatkezelők jogos érdekei meghatározott körülmények között;

c)

az adatgyűjtés;

d)

személyes adatok álnevesítése;

e)

a nyilvánosság és az érintettek tájékoztatása;

f)

az érintettek jogainak gyakorlása;

g)

a gyermekek tájékoztatása és védelme, valamint a szülői felügyelet gyakorlójától származó hozzájárulás kikérésének módja;

h)

a 24. és a 25. cikkben említett intézkedések és eljárások, valamint a 32. cikkben említett, az adatkezelés biztonságát szolgáló intézkedések;

i)

a felügyeleti hatóságok értesítése, valamint az érintettek tájékoztatása az adatvédelmi incidensekről;

j)

a személyes adatok harmadik országok vagy nemzetközi szervezetek részére történő továbbítása; vagy

k)

az adatkezelő és az érintettek között az adatkezeléssel kapcsolatban felmerülő vitás ügyek megoldására irányuló, nem bírósági útra tartozó eljárások és egyéb vitarendezési eljárások, az érintettek 77. és 79. cikk szerinti jogainak sérelme nélkül.

(3) Az e rendelet hatálya alá tartozó adatkezelők vagy adatfeldolgozók általi betartása mellett a 3. cikk értelmében e rendelet hatálya alá nem tartozó adatkezelők vagy adatfeldolgozók is betarthatják az e cikk (5) bekezdése szerint jóváhagyott és e cikk (9) bekezdése alapján általános érvénnyel rendelkező magatartási kódexeket annak érdekében, hogy a 46. cikk (2) bekezdésének e) pontjában foglalt feltételekkel összhangban megfelelő garanciákat nyújtsanak a személyes adatok harmadik országokba vagy nemzetközi szervezetek részére történő továbbítása keretében. Az ilyen adatkezelők vagy adatfeldolgozók szerződéses vagy egyéb, jogilag kötelező erejű eszközök révén kötelező erejű és kikényszeríthető kötelezettségvállalást tesznek arra, hogy alkalmazzák a megfelelő garanciákat, ideértve az érintettek jogaira vonatkozókat is.

(4) Az 55. vagy az 56. cikk alapján illetékes felügyeleti hatóság feladat- és hatáskörének sérelme nélkül az e cikk (2) bekezdése szerinti magatartási kódexek olyan mechanizmusokat határoznak meg, amelyek lehetővé teszik a 41. cikk (1) bekezdésében említett szervezet számára, hogy elvégezze annak kötelező ellenőrzését, hogy a kódex alkalmazását vállaló adatkezelők vagy adatfeldolgozók megfelelnek-e a kódex rendelkezéseinek.

(5) Ha az e cikk (2) bekezdésében említett egyesületek és egyéb szervezetek magatartási kódexet kívánnak kidolgozni vagy meglévő kódexet kívánnak módosítani vagy kibővíteni, a kódextervezetet, a módosítást vagy a kiegészítést benyújtják az 55. cikk alapján illetékes felügyeleti hatóságnak. A felügyeleti hatóság véleményt bocsát ki arról, hogy a kódextervezet, a módosítás vagy a kiegészítés összhangban van-e ezzel a rendelettel, és jóváhagyja a kódextervezetet, a módosítást vagy a kiegészítést, amennyiben megállapítja, hogy az elegendő és megfelelő garanciát nyújt.

(6) Ha a kódextervezetet, a módosítást vagy a kiegészítést jóváhagyják az (5) bekezdésben foglaltak szerint és ha az érintett magatartási kódex nem vonatkozik több tagállamot érintő adatkezelési tevékenységekre, a felügyeleti hatóság a kódexet nyilvántartásba veszi és közzéteszi.

(7) Ha a magatartási kódex tervezete több tagállamot is érintő adatkezelési tevékenységekre vonatkozik, az 55. cikk alapján illetékes felügyeleti hatóság a kódextervezet, a módosítás vagy a kiegészítés jóváhagyását megelőzően a 63. cikkben említett eljárás keretében benyújtja azt a Testületnek, amely véleményt bocsát ki arról, hogy a kódextervezet, a módosítás vagy a kiegészítés összhangban van-e ezen rendelettel, illetve az e cikk (3) bekezdésében említett esetben arról, hogy megfelelő garanciákat nyújt-e.

(8) Ha a (7) bekezdésben említett vélemény megerősíti, hogy a magatartási kódex tervezete, a módosítás vagy a kiegészítés összhangban van e rendelettel, illetve a (3) bekezdésben említett esetben azt, hogy megfelelő garanciákat nyújt, a Testület benyújtja véleményét a Bizottságnak.

(9) A Bizottság végrehajtási jogi aktusok útján határozhat arról, hogy a hozzá az e cikk (8) bekezdése szerint benyújtott, jóváhagyott magatartási kódex, módosítás vagy kiegészítés az Unió területén általános érvénnyel rendelkezik. Ezeket a végrehajtási jogi aktusokat a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően kell elfogadni.

(10) A Bizottság biztosítja azon jóváhagyott kódexek megfelelő nyilvánosságát, amelyek esetében a (9) bekezdéssel összhangban úgy határozott, hogy általánosan érvényesek.

(11) A Testület valamennyi jóváhagyott magatartási kódexet, módosítást és kiegészítést egy nyilvántartásban állítja össze, és megfelelő módon nyilvánosan elérhetővé teszi őket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '1',
  '(1) A tagállamok, a felügyeleti hatóságok, a Testület és a Bizottság ösztönzik olyan magatartási kódexek kidolgozását, amelyek – a különböző adatkezelő ágazatok egyedi jellemzőinek, valamint a mikro-, kis- és középvállalkozások sajátos igényeinek figyelembevételével – segítik e rendelet helyes alkalmazását.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '2',
  '(2) Az adatkezelők vagy az adatfeldolgozók kategóriáit képviselő egyesületek és egyéb szervezetek magatartási kódexeket dolgozhatnak ki, illetve a már meglévő magatartási kódexeket módosíthatják vagy bővíthetik abból a célból, hogy pontosítsák e rendelet alkalmazását, így például az alábbiakkal kapcsolatban:

a)

tisztességes és átlátható adatkezelés;

b)

az adatkezelők jogos érdekei meghatározott körülmények között;

c)

az adatgyűjtés;

d)

személyes adatok álnevesítése;

e)

a nyilvánosság és az érintettek tájékoztatása;

f)

az érintettek jogainak gyakorlása;

g)

a gyermekek tájékoztatása és védelme, valamint a szülői felügyelet gyakorlójától származó hozzájárulás kikérésének módja;

h)

a 24. és a 25. cikkben említett intézkedések és eljárások, valamint a 32. cikkben említett, az adatkezelés biztonságát szolgáló intézkedések;

i)

a felügyeleti hatóságok értesítése, valamint az érintettek tájékoztatása az adatvédelmi incidensekről;

j)

a személyes adatok harmadik országok vagy nemzetközi szervezetek részére történő továbbítása; vagy

k)

az adatkezelő és az érintettek között az adatkezeléssel kapcsolatban felmerülő vitás ügyek megoldására irányuló, nem bírósági útra tartozó eljárások és egyéb vitarendezési eljárások, az érintettek 77. és 79. cikk szerinti jogainak sérelme nélkül.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '2(a)',
  'a) tisztességes és átlátható adatkezelés;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '2(b)',
  'b) az adatkezelők jogos érdekei meghatározott körülmények között;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '2(d)',
  'd) személyes adatok álnevesítése;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '2(e)',
  'e) a nyilvánosság és az érintettek tájékoztatása;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '2(f)',
  'f) az érintettek jogainak gyakorlása;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '2(g)',
  'g) a gyermekek tájékoztatása és védelme, valamint a szülői felügyelet gyakorlójától származó hozzájárulás kikérésének módja;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '2(h)',
  'h) a 24. és a 25. cikkben említett intézkedések és eljárások, valamint a 32. cikkben említett, az adatkezelés biztonságát szolgáló intézkedések;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '2(i)',
  'i) a felügyeleti hatóságok értesítése, valamint az érintettek tájékoztatása az adatvédelmi incidensekről;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '2(j)',
  'j) a személyes adatok harmadik országok vagy nemzetközi szervezetek részére történő továbbítása; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '2(k)',
  'k) az adatkezelő és az érintettek között az adatkezeléssel kapcsolatban felmerülő vitás ügyek megoldására irányuló, nem bírósági útra tartozó eljárások és egyéb vitarendezési eljárások, az érintettek 77. és 79. cikk szerinti jogainak sérelme nélkül.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '3',
  '(3) Az e rendelet hatálya alá tartozó adatkezelők vagy adatfeldolgozók általi betartása mellett a 3. cikk értelmében e rendelet hatálya alá nem tartozó adatkezelők vagy adatfeldolgozók is betarthatják az e cikk (5) bekezdése szerint jóváhagyott és e cikk (9) bekezdése alapján általános érvénnyel rendelkező magatartási kódexeket annak érdekében, hogy a 46. cikk (2) bekezdésének e) pontjában foglalt feltételekkel összhangban megfelelő garanciákat nyújtsanak a személyes adatok harmadik országokba vagy nemzetközi szervezetek részére történő továbbítása keretében. Az ilyen adatkezelők vagy adatfeldolgozók szerződéses vagy egyéb, jogilag kötelező erejű eszközök révén kötelező erejű és kikényszeríthető kötelezettségvállalást tesznek arra, hogy alkalmazzák a megfelelő garanciákat, ideértve az érintettek jogaira vonatkozókat is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '4',
  '(4) Az 55. vagy az 56. cikk alapján illetékes felügyeleti hatóság feladat- és hatáskörének sérelme nélkül az e cikk (2) bekezdése szerinti magatartási kódexek olyan mechanizmusokat határoznak meg, amelyek lehetővé teszik a 41. cikk (1) bekezdésében említett szervezet számára, hogy elvégezze annak kötelező ellenőrzését, hogy a kódex alkalmazását vállaló adatkezelők vagy adatfeldolgozók megfelelnek-e a kódex rendelkezéseinek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '5',
  '(5) Ha az e cikk (2) bekezdésében említett egyesületek és egyéb szervezetek magatartási kódexet kívánnak kidolgozni vagy meglévő kódexet kívánnak módosítani vagy kibővíteni, a kódextervezetet, a módosítást vagy a kiegészítést benyújtják az 55. cikk alapján illetékes felügyeleti hatóságnak. A felügyeleti hatóság véleményt bocsát ki arról, hogy a kódextervezet, a módosítás vagy a kiegészítés összhangban van-e ezzel a rendelettel, és jóváhagyja a kódextervezetet, a módosítást vagy a kiegészítést, amennyiben megállapítja, hogy az elegendő és megfelelő garanciát nyújt.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '6',
  '(6) Ha a kódextervezetet, a módosítást vagy a kiegészítést jóváhagyják az (5) bekezdésben foglaltak szerint és ha az érintett magatartási kódex nem vonatkozik több tagállamot érintő adatkezelési tevékenységekre, a felügyeleti hatóság a kódexet nyilvántartásba veszi és közzéteszi.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '7',
  '(7) Ha a magatartási kódex tervezete több tagállamot is érintő adatkezelési tevékenységekre vonatkozik, az 55. cikk alapján illetékes felügyeleti hatóság a kódextervezet, a módosítás vagy a kiegészítés jóváhagyását megelőzően a 63. cikkben említett eljárás keretében benyújtja azt a Testületnek, amely véleményt bocsát ki arról, hogy a kódextervezet, a módosítás vagy a kiegészítés összhangban van-e ezen rendelettel, illetve az e cikk (3) bekezdésében említett esetben arról, hogy megfelelő garanciákat nyújt-e.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '8',
  '(8) Ha a (7) bekezdésben említett vélemény megerősíti, hogy a magatartási kódex tervezete, a módosítás vagy a kiegészítés összhangban van e rendelettel, illetve a (3) bekezdésben említett esetben azt, hogy megfelelő garanciákat nyújt, a Testület benyújtja véleményét a Bizottságnak.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '9',
  '(9) A Bizottság végrehajtási jogi aktusok útján határozhat arról, hogy a hozzá az e cikk (8) bekezdése szerint benyújtott, jóváhagyott magatartási kódex, módosítás vagy kiegészítés az Unió területén általános érvénnyel rendelkezik. Ezeket a végrehajtási jogi aktusokat a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '10',
  '(10) A Bizottság biztosítja azon jóváhagyott kódexek megfelelő nyilvánosságát, amelyek esetében a (9) bekezdéssel összhangban úgy határozott, hogy általánosan érvényesek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '40',
  '11',
  '(11) A Testület valamennyi jóváhagyott magatartási kódexet, módosítást és kiegészítést egy nyilvántartásban állítja össze, és megfelelő módon nyilvánosan elérhetővé teszi őket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '41',
  null,
  'A jóváhagyott magatartási kódexeknek való megfelelés ellenőrzése
(1) Az 57. vagy az 58. cikk alapján illetékes felügyeleti hatóság feladat- és hatásköreinek sérelme nélkül a 40. cikk szerinti magatartási kódexnek való megfelelés ellenőrzését olyan szervezet végezheti, amely a kódex tárgya tekintetében megfelelő szakértelemmel rendelkezik, és amelyet az illetékes felügyeleti hatóság erre akkreditál.

(2) Az (1) bekezdésben említett szervezetet a magatartási kódexnek való megfelelés ellenőrzésére abban az esetben lehet akkreditálni, ha a szervezet:

a)

az illetékes felügyeleti hatóság számára kielégítő bizonyítékot szolgáltatott arra nézve, hogy független, és a kódex tárgyában szakértelemmel bír;

b)

létrehozott olyan eljárásokat, amelyek révén meg tudja állapítani, hogy az érintett adatkezelők és adatfeldolgozók alkalmasak-e a kódex alkalmazására, ellenőrizni tudja, hogy az érintett adatkezelők és adatfeldolgozók betartják-e a kódex rendelkezéseit, és rendszeres időközönként felül tudja vizsgálni a kódex működését;

c)

létrehozott olyan eljárásokat és struktúrákat, amelyek révén kezelni tudja a kódex megsértésével vagy a kódex adatkezelő vagy adatfeldolgozó általi alkalmazásával kapcsolatos panaszokat, és ezeket az eljárásokat és struktúrákat az érintettek és a nyilvánosság számára átláthatóvá teszi; és

d)

az illetékes felügyeleti hatóság számára kielégítő bizonyítékot szolgáltat arra nézve, hogy feladataival kapcsolatban nem áll fenn összeférhetetlenség.

(3) A 63. cikkben említett, egységességi mechanizmusnak megfelelően az illetékes felügyeleti hatóság az e cikk (1) bekezdésében említett szervezet akkreditációjával kapcsolatos szempontok tervezetét a Testületnek benyújtja.

(4) Az illetékes felügyeleti hatóság feladat- és hatásköreinek, valamint a VIII. fejezet rendelkezéseinek sérelme nélkül az e cikk (1) bekezdésében említett szervezet a kódex valamely adatkezelő vagy adatfeldolgozó általi megsértése esetén – megfelelő garanciák mellett – megfelelő intézkedéseket tesz, beleértve az érintett adatkezelő vagy adatfeldolgozó felfüggesztését vagy kizárását a kódex alkalmazásából. Ezekről az intézkedésekről és azok indokairól az illetékes felügyeleti hatóságot tájékoztatja.

(5) Az illetékes felügyeleti hatóság visszavonja az (1) bekezdésben említett szervezet akkreditációját, ha az az akkreditációs feltételeknek nem vagy már nem felel meg, vagy ha a szerv intézkedései megsértik e rendeletet.

(6) Ez a cikk nem alkalmazandó a közhatalmi szervek és közfeladatot ellátó egyéb szervek által végzett adatkezelésre.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '41',
  '1',
  '(1) Az 57. vagy az 58. cikk alapján illetékes felügyeleti hatóság feladat- és hatásköreinek sérelme nélkül a 40. cikk szerinti magatartási kódexnek való megfelelés ellenőrzését olyan szervezet végezheti, amely a kódex tárgya tekintetében megfelelő szakértelemmel rendelkezik, és amelyet az illetékes felügyeleti hatóság erre akkreditál.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '41',
  '2',
  '(2) Az (1) bekezdésben említett szervezetet a magatartási kódexnek való megfelelés ellenőrzésére abban az esetben lehet akkreditálni, ha a szervezet:

a)

az illetékes felügyeleti hatóság számára kielégítő bizonyítékot szolgáltatott arra nézve, hogy független, és a kódex tárgyában szakértelemmel bír;

b)

létrehozott olyan eljárásokat, amelyek révén meg tudja állapítani, hogy az érintett adatkezelők és adatfeldolgozók alkalmasak-e a kódex alkalmazására, ellenőrizni tudja, hogy az érintett adatkezelők és adatfeldolgozók betartják-e a kódex rendelkezéseit, és rendszeres időközönként felül tudja vizsgálni a kódex működését;

c)

létrehozott olyan eljárásokat és struktúrákat, amelyek révén kezelni tudja a kódex megsértésével vagy a kódex adatkezelő vagy adatfeldolgozó általi alkalmazásával kapcsolatos panaszokat, és ezeket az eljárásokat és struktúrákat az érintettek és a nyilvánosság számára átláthatóvá teszi; és

d)

az illetékes felügyeleti hatóság számára kielégítő bizonyítékot szolgáltat arra nézve, hogy feladataival kapcsolatban nem áll fenn összeférhetetlenség.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '41',
  '2(a)',
  'a) az illetékes felügyeleti hatóság számára kielégítő bizonyítékot szolgáltatott arra nézve, hogy független, és a kódex tárgyában szakértelemmel bír;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '41',
  '2(b)',
  'b) létrehozott olyan eljárásokat, amelyek révén meg tudja állapítani, hogy az érintett adatkezelők és adatfeldolgozók alkalmasak-e a kódex alkalmazására, ellenőrizni tudja, hogy az érintett adatkezelők és adatfeldolgozók betartják-e a kódex rendelkezéseit, és rendszeres időközönként felül tudja vizsgálni a kódex működését;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '41',
  '2(c)',
  'c) létrehozott olyan eljárásokat és struktúrákat, amelyek révén kezelni tudja a kódex megsértésével vagy a kódex adatkezelő vagy adatfeldolgozó általi alkalmazásával kapcsolatos panaszokat, és ezeket az eljárásokat és struktúrákat az érintettek és a nyilvánosság számára átláthatóvá teszi; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '41',
  '2(d)',
  'd) az illetékes felügyeleti hatóság számára kielégítő bizonyítékot szolgáltat arra nézve, hogy feladataival kapcsolatban nem áll fenn összeférhetetlenség.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '41',
  '3',
  '(3) A 63. cikkben említett, egységességi mechanizmusnak megfelelően az illetékes felügyeleti hatóság az e cikk (1) bekezdésében említett szervezet akkreditációjával kapcsolatos szempontok tervezetét a Testületnek benyújtja.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '41',
  '4',
  '(4) Az illetékes felügyeleti hatóság feladat- és hatásköreinek, valamint a VIII. fejezet rendelkezéseinek sérelme nélkül az e cikk (1) bekezdésében említett szervezet a kódex valamely adatkezelő vagy adatfeldolgozó általi megsértése esetén – megfelelő garanciák mellett – megfelelő intézkedéseket tesz, beleértve az érintett adatkezelő vagy adatfeldolgozó felfüggesztését vagy kizárását a kódex alkalmazásából. Ezekről az intézkedésekről és azok indokairól az illetékes felügyeleti hatóságot tájékoztatja.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '41',
  '5',
  '(5) Az illetékes felügyeleti hatóság visszavonja az (1) bekezdésben említett szervezet akkreditációját, ha az az akkreditációs feltételeknek nem vagy már nem felel meg, vagy ha a szerv intézkedései megsértik e rendeletet.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '41',
  '6',
  '(6) Ez a cikk nem alkalmazandó a közhatalmi szervek és közfeladatot ellátó egyéb szervek által végzett adatkezelésre.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '42',
  null,
  'Tanúsítás
(1) A tagállamok, a felügyeleti hatóságok, a Testület, valamint a Bizottság – különösen uniós szinten – ösztönzik olyan adatvédelmi tanúsítási mechanizmusok, valamint adatvédelmi bélyegzők, illetve jelölések létrehozását, amelyek bizonyítják, hogy az adatkezelő vagy adatfeldolgozó által végrehajtott adatkezelési műveletek megfelelnek e rendelet előírásainak. Figyelembe kell venni a mikro-, kis- és középvállalkozások sajátos igényeit.

(2) Az e rendelet hatálya alá tartozó adatkezelők vagy adatfeldolgozók általi betartása mellett az (5) bekezdésnek megfelelően jóváhagyott adatvédelmi tanúsítási mechanizmusokat, bélyegzőket vagy jelöléseket annak bizonyítására is létre lehet hozni, hogy a 3. cikk értelmében e rendelet hatálya alá nem tartozó adatkezelők vagy adatfeldolgozók a 46. cikk (2) bekezdésének f) pontjában foglalt feltételekkel összhangban megfelelő garanciákat nyújtsanak a személyes adatok harmadik országokba vagy nemzetközi szervezetek részére történő továbbítása keretében. Az ilyen adatkezelők vagy adatfeldolgozók szerződéses vagy egyéb, jogilag kötelező erejű eszközök révén kötelező erejű és kikényszeríthető kötelezettségvállalást tesznek arra, hogy alkalmazzák a megfelelő garanciákat, ideértve az érintettek jogaira vonatkozókat is.

(3) A tanúsításnak önkéntesnek kell lennie, és átlátható eljáráson keresztül kell elérhetővé tenni.

(4) Az e cikk szerinti tanúsítás nem csökkenti az adatkezelő vagy adatfeldolgozó e rendelet betartásáért való felelősségét, és nem sérti az 55. vagy az 56. cikk alapján illetékes felügyeleti hatóságok feladat- és hatáskörét.

(5) Az e cikk szerinti tanúsítványt a 43. cikkben említett tanúsító szervezetek vagy az illetékes felügyeleti hatóságok állítják ki, az illetékes felügyeleti hatóság által az 58. cikk (3) bekezdésének, vagy a Testület által a 63. cikknek megfelelően jóváhagyott szempontok alapján. Ha a szempontokat a Testület hagyja jóvá, ennek eredményeként közös tanúsítvány, az európai adatvédelmi bélyegző állítható ki.

(6) Az adatkezelő vagy adatfeldolgozó, amely az adatkezelési tevékenységét aláveti a tanúsítási mechanizmusnak, a 43. cikkben említett tanúsító szervezet vagy adott esetben az illetékes felügyeleti hatóság részére minden olyan információt megad és minden olyan adatkezelési tevékenységéhez hozzáférést biztosít, amely a tanúsítási eljárás lefolytatásához szükséges.

(7) Az adatkezelő vagy adatfeldolgozó részére a tanúsítványt legfeljebb hároméves időtartamra lehet kiállítani, amely azonos feltételek mellett a tanúsítvány megújítható, feltéve, hogy a vonatkozó követelmények továbbra is teljesülnek. Adott esetben, ha a tanúsításra vonatkozó követelmények nem vagy már nem teljesülnek, a 43. cikkben említett tanúsító szervezet vagy az illetékes felügyeleti hatóság a tanúsítványt visszavonja.

(8) A Testület valamennyi tanúsítási mechanizmust és adatvédelmi bélyegzőt, illetve jelölést egy nyilvántartásban állítja össze, és megfelelő módon nyilvánosan elérhetővé teszi őket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_42'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '42',
  '1',
  '(1) A tagállamok, a felügyeleti hatóságok, a Testület, valamint a Bizottság – különösen uniós szinten – ösztönzik olyan adatvédelmi tanúsítási mechanizmusok, valamint adatvédelmi bélyegzők, illetve jelölések létrehozását, amelyek bizonyítják, hogy az adatkezelő vagy adatfeldolgozó által végrehajtott adatkezelési műveletek megfelelnek e rendelet előírásainak. Figyelembe kell venni a mikro-, kis- és középvállalkozások sajátos igényeit.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_42'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '42',
  '2',
  '(2) Az e rendelet hatálya alá tartozó adatkezelők vagy adatfeldolgozók általi betartása mellett az (5) bekezdésnek megfelelően jóváhagyott adatvédelmi tanúsítási mechanizmusokat, bélyegzőket vagy jelöléseket annak bizonyítására is létre lehet hozni, hogy a 3. cikk értelmében e rendelet hatálya alá nem tartozó adatkezelők vagy adatfeldolgozók a 46. cikk (2) bekezdésének f) pontjában foglalt feltételekkel összhangban megfelelő garanciákat nyújtsanak a személyes adatok harmadik országokba vagy nemzetközi szervezetek részére történő továbbítása keretében. Az ilyen adatkezelők vagy adatfeldolgozók szerződéses vagy egyéb, jogilag kötelező erejű eszközök révén kötelező erejű és kikényszeríthető kötelezettségvállalást tesznek arra, hogy alkalmazzák a megfelelő garanciákat, ideértve az érintettek jogaira vonatkozókat is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_42'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '42',
  '3',
  '(3) A tanúsításnak önkéntesnek kell lennie, és átlátható eljáráson keresztül kell elérhetővé tenni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_42'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '42',
  '4',
  '(4) Az e cikk szerinti tanúsítás nem csökkenti az adatkezelő vagy adatfeldolgozó e rendelet betartásáért való felelősségét, és nem sérti az 55. vagy az 56. cikk alapján illetékes felügyeleti hatóságok feladat- és hatáskörét.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_42'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '42',
  '5',
  '(5) Az e cikk szerinti tanúsítványt a 43. cikkben említett tanúsító szervezetek vagy az illetékes felügyeleti hatóságok állítják ki, az illetékes felügyeleti hatóság által az 58. cikk (3) bekezdésének, vagy a Testület által a 63. cikknek megfelelően jóváhagyott szempontok alapján. Ha a szempontokat a Testület hagyja jóvá, ennek eredményeként közös tanúsítvány, az európai adatvédelmi bélyegző állítható ki.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_42'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '42',
  '6',
  '(6) Az adatkezelő vagy adatfeldolgozó, amely az adatkezelési tevékenységét aláveti a tanúsítási mechanizmusnak, a 43. cikkben említett tanúsító szervezet vagy adott esetben az illetékes felügyeleti hatóság részére minden olyan információt megad és minden olyan adatkezelési tevékenységéhez hozzáférést biztosít, amely a tanúsítási eljárás lefolytatásához szükséges.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_42'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '42',
  '7',
  '(7) Az adatkezelő vagy adatfeldolgozó részére a tanúsítványt legfeljebb hároméves időtartamra lehet kiállítani, amely azonos feltételek mellett a tanúsítvány megújítható, feltéve, hogy a vonatkozó követelmények továbbra is teljesülnek. Adott esetben, ha a tanúsításra vonatkozó követelmények nem vagy már nem teljesülnek, a 43. cikkben említett tanúsító szervezet vagy az illetékes felügyeleti hatóság a tanúsítványt visszavonja.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_42'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '42',
  '8',
  '(8) A Testület valamennyi tanúsítási mechanizmust és adatvédelmi bélyegzőt, illetve jelölést egy nyilvántartásban állítja össze, és megfelelő módon nyilvánosan elérhetővé teszi őket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_42'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  null,
  'Tanúsító szervezetek
(1) Az illetékes felügyeleti hatóság 57. és 58. cikk alapján fennálló feladat- és hatásköreinek sérelme nélkül a tanúsítvány kiállítását és megújítását – a felügyeleti hatóság a célból való tájékoztatását követően, hogy az szükség esetén gyakorolhassa az 58. cikk (2) bekezdésének h) pontja szerinti hatáskörét – olyan tanúsító szervezet végzi, amely az adatvédelem terén megfelelő szakértelemmel rendelkezik. A tagállamok biztosítják, hogy e tanúsító szervezetek akkreditációját az alábbiak közül egy vagy mindkettő elvégezte:

a)

az a felügyeleti hatóság, amelyik az 55. vagy az 56. cikk alapján illetékes;

b)

az EN-ISO/IEC 17065/2012 szabványnak megfelelően, a 765/2008/EK európai parlamenti és tanácsi rendelettel ( 20 ) , valamint az 55. vagy az 56. cikk alapján illetékes a felügyeleti hatóság által megállapított kiegészítő követelményekkel összhangban megnevezett nemzeti akkreditáló testület.

(2) Az (1) bekezdésben említett tanúsító szervezetet kizárólag abban az esetben lehet az említett bekezdéssel összhangban akkreditálni, ha:

a)

az illetékes felügyeleti hatóság számára kielégítő bizonyítékot szolgáltatott arra nézve, hogy független, és a tanúsítás tárgyában szakértelemmel bír;

b)

vállalja, hogy tiszteletben tartja a 42. cikk (5) bekezdésében említett, az 55. vagy az 56. cikk alapján illetékes felügyeleti hatóság, illetve a 63. cikknek megfelelően a Testület által jóváhagyott szempontokat;

c)

eljárásokat hozott létre az adatvédelmi tanúsítványok, bélyegzők, illetve jelölések kibocsátására, rendszeres időközönkénti felülvizsgálatára és visszavonására;

d)

olyan eljárásokat és struktúrákat hozott létre, amelyek révén kezelni tudja a tanúsítvánnyal kapcsolatos jogsértésekkel vagy annak az adatkezelő vagy adatfeldolgozó általi alkalmazásával kapcsolatos panaszokat, és ezeket az eljárásokat és struktúrákat az érintettek és a nyilvánosság számára átláthatóvá tudja tenni; és

e)

az illetékes felügyeleti hatóság számára kielégítő bizonyítékot szolgáltat arra nézve, hogy feladataival kapcsolatban nem áll fenn összeférhetetlenség.

(3) Az e cikk (1) és (2) bekezdésében említett tanúsító szervezet akkreditálását az 55. vagy az 56. cikk alapján illetékes felügyeleti hatóság által, illetve az 57. cikknek megfelelően a Testület által jóváhagyott szempontok alapján kell elvégezni. Ha az akkreditálásra az e cikk (1) bekezdése b) pontja alapján kerül sor, ezek a követelmények kiegészítik a 765/2008/EK rendeletben előirányzott követelményeket és a tanúsító szervek módszereire és eljárásaira vonatkozó technikai szabályokat.

(4) Az adatkezelő vagy adatfeldolgozó e rendelet betartására vonatkozó felelősségének sérelme nélkül a tanúsítás vagy annak visszavonása alapjául szolgáló megfelelő vizsgálat lefolytatásáért az (1) bekezdésben említett tanúsító szervezet felelős. Az akkreditációt legfeljebb ötéves időtartamra lehet megadni, és az azonos feltételek mellett mindaddig megújítható, feltéve hogy az adott tanúsító szervezet teljesíti az e cikkben meghatározott követelményeket.

(5) Az (1) bekezdésben említett tanúsító szervezet közli az illetékes felügyeleti hatósággal a kért tanúsítvány megadásának vagy visszavonásának okait.

(6) Az e cikk (3) bekezdésében említett követelményeket és a 42. cikk (5) bekezdésében említett szempontokat a felügyeleti hatóság könnyen hozzáférhető formában közzéteszi. A felügyeleti hatóságok ezeket a követelményeket és szempontokat a Testület részére is továbbítják. A Testület valamennyi tanúsítási mechanizmust és adatvédelmi bélyegzőt egy nyilvántartásban állítja össze, és azokat megfelelő módon nyilvánosan elérhetővé teszi.

(7) A VIII. fejezet sérelme nélkül az illetékes felügyeleti hatóság vagy a nemzeti akkreditáló testület visszavonja az e cikk (1) bekezdésében említett tanúsító szervezet akkreditációját, ha az az akkreditációs feltételeknek nem vagy már nem felel meg, vagy ha a tanúsító szervezet intézkedései megsértik e rendeletet.

(8) A Bizottság felhatalmazást kap arra, hogy a 42. cikk (1) bekezdésében említett adatvédelmi tanúsítási mechanizmusok tekintetében figyelembe veendő követelmények meghatározása érdekében a 92. cikkel összhangban felhatalmazáson alapuló jogi aktusokat fogadjon el.

(9) A Bizottság végrehajtási jogi aktusok elfogadása révén a tanúsítási mechanizmusokra és az adatvédelmi bélyegzőkre, illetve jelölésekre vonatkozó technikai szabványokat, valamint a tanúsítási mechanizmusok és a bélyegzők, illetve jelölések népszerűsítésére és elismerésére szolgáló mechanizmusokat határozhat meg. Ezeket a végrehajtási jogi aktusokat a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően kell elfogadni.

V. FEJEZET

A személyes adatok harmadik országokba vagy nemzetközi szervezetek részére történő továbbítása',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '1',
  '(1) Az illetékes felügyeleti hatóság 57. és 58. cikk alapján fennálló feladat- és hatásköreinek sérelme nélkül a tanúsítvány kiállítását és megújítását – a felügyeleti hatóság a célból való tájékoztatását követően, hogy az szükség esetén gyakorolhassa az 58. cikk (2) bekezdésének h) pontja szerinti hatáskörét – olyan tanúsító szervezet végzi, amely az adatvédelem terén megfelelő szakértelemmel rendelkezik. A tagállamok biztosítják, hogy e tanúsító szervezetek akkreditációját az alábbiak közül egy vagy mindkettő elvégezte:

a)

az a felügyeleti hatóság, amelyik az 55. vagy az 56. cikk alapján illetékes;

b)

az EN-ISO/IEC 17065/2012 szabványnak megfelelően, a 765/2008/EK európai parlamenti és tanácsi rendelettel ( 20 ) , valamint az 55. vagy az 56. cikk alapján illetékes a felügyeleti hatóság által megállapított kiegészítő követelményekkel összhangban megnevezett nemzeti akkreditáló testület.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '1(a)',
  'a) az a felügyeleti hatóság, amelyik az 55. vagy az 56. cikk alapján illetékes;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '1(b)',
  'b) az EN-ISO/IEC 17065/2012 szabványnak megfelelően, a 765/2008/EK európai parlamenti és tanácsi rendelettel ( 20 ) , valamint az 55. vagy az 56. cikk alapján illetékes a felügyeleti hatóság által megállapított kiegészítő követelményekkel összhangban megnevezett nemzeti akkreditáló testület.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '2',
  '(2) Az (1) bekezdésben említett tanúsító szervezetet kizárólag abban az esetben lehet az említett bekezdéssel összhangban akkreditálni, ha:

a)

az illetékes felügyeleti hatóság számára kielégítő bizonyítékot szolgáltatott arra nézve, hogy független, és a tanúsítás tárgyában szakértelemmel bír;

b)

vállalja, hogy tiszteletben tartja a 42. cikk (5) bekezdésében említett, az 55. vagy az 56. cikk alapján illetékes felügyeleti hatóság, illetve a 63. cikknek megfelelően a Testület által jóváhagyott szempontokat;

c)

eljárásokat hozott létre az adatvédelmi tanúsítványok, bélyegzők, illetve jelölések kibocsátására, rendszeres időközönkénti felülvizsgálatára és visszavonására;

d)

olyan eljárásokat és struktúrákat hozott létre, amelyek révén kezelni tudja a tanúsítvánnyal kapcsolatos jogsértésekkel vagy annak az adatkezelő vagy adatfeldolgozó általi alkalmazásával kapcsolatos panaszokat, és ezeket az eljárásokat és struktúrákat az érintettek és a nyilvánosság számára átláthatóvá tudja tenni; és

e)

az illetékes felügyeleti hatóság számára kielégítő bizonyítékot szolgáltat arra nézve, hogy feladataival kapcsolatban nem áll fenn összeférhetetlenség.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '2(a)',
  'a) az illetékes felügyeleti hatóság számára kielégítő bizonyítékot szolgáltatott arra nézve, hogy független, és a tanúsítás tárgyában szakértelemmel bír;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '2(b)',
  'b) vállalja, hogy tiszteletben tartja a 42. cikk (5) bekezdésében említett, az 55. vagy az 56. cikk alapján illetékes felügyeleti hatóság, illetve a 63. cikknek megfelelően a Testület által jóváhagyott szempontokat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '2(c)',
  'c) eljárásokat hozott létre az adatvédelmi tanúsítványok, bélyegzők, illetve jelölések kibocsátására, rendszeres időközönkénti felülvizsgálatára és visszavonására;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '2(d)',
  'd) olyan eljárásokat és struktúrákat hozott létre, amelyek révén kezelni tudja a tanúsítvánnyal kapcsolatos jogsértésekkel vagy annak az adatkezelő vagy adatfeldolgozó általi alkalmazásával kapcsolatos panaszokat, és ezeket az eljárásokat és struktúrákat az érintettek és a nyilvánosság számára átláthatóvá tudja tenni; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '2(e)',
  'e) az illetékes felügyeleti hatóság számára kielégítő bizonyítékot szolgáltat arra nézve, hogy feladataival kapcsolatban nem áll fenn összeférhetetlenség.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '3',
  '(3) Az e cikk (1) és (2) bekezdésében említett tanúsító szervezet akkreditálását az 55. vagy az 56. cikk alapján illetékes felügyeleti hatóság által, illetve az 57. cikknek megfelelően a Testület által jóváhagyott szempontok alapján kell elvégezni. Ha az akkreditálásra az e cikk (1) bekezdése b) pontja alapján kerül sor, ezek a követelmények kiegészítik a 765/2008/EK rendeletben előirányzott követelményeket és a tanúsító szervek módszereire és eljárásaira vonatkozó technikai szabályokat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '4',
  '(4) Az adatkezelő vagy adatfeldolgozó e rendelet betartására vonatkozó felelősségének sérelme nélkül a tanúsítás vagy annak visszavonása alapjául szolgáló megfelelő vizsgálat lefolytatásáért az (1) bekezdésben említett tanúsító szervezet felelős. Az akkreditációt legfeljebb ötéves időtartamra lehet megadni, és az azonos feltételek mellett mindaddig megújítható, feltéve hogy az adott tanúsító szervezet teljesíti az e cikkben meghatározott követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '5',
  '(5) Az (1) bekezdésben említett tanúsító szervezet közli az illetékes felügyeleti hatósággal a kért tanúsítvány megadásának vagy visszavonásának okait.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '6',
  '(6) Az e cikk (3) bekezdésében említett követelményeket és a 42. cikk (5) bekezdésében említett szempontokat a felügyeleti hatóság könnyen hozzáférhető formában közzéteszi. A felügyeleti hatóságok ezeket a követelményeket és szempontokat a Testület részére is továbbítják. A Testület valamennyi tanúsítási mechanizmust és adatvédelmi bélyegzőt egy nyilvántartásban állítja össze, és azokat megfelelő módon nyilvánosan elérhetővé teszi.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '7',
  '(7) A VIII. fejezet sérelme nélkül az illetékes felügyeleti hatóság vagy a nemzeti akkreditáló testület visszavonja az e cikk (1) bekezdésében említett tanúsító szervezet akkreditációját, ha az az akkreditációs feltételeknek nem vagy már nem felel meg, vagy ha a tanúsító szervezet intézkedései megsértik e rendeletet.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '8',
  '(8) A Bizottság felhatalmazást kap arra, hogy a 42. cikk (1) bekezdésében említett adatvédelmi tanúsítási mechanizmusok tekintetében figyelembe veendő követelmények meghatározása érdekében a 92. cikkel összhangban felhatalmazáson alapuló jogi aktusokat fogadjon el.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '43',
  '9',
  '(9) A Bizottság végrehajtási jogi aktusok elfogadása révén a tanúsítási mechanizmusokra és az adatvédelmi bélyegzőkre, illetve jelölésekre vonatkozó technikai szabványokat, valamint a tanúsítási mechanizmusok és a bélyegzők, illetve jelölések népszerűsítésére és elismerésére szolgáló mechanizmusokat határozhat meg. Ezeket a végrehajtási jogi aktusokat a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően kell elfogadni.

V. FEJEZET

A személyes adatok harmadik országokba vagy nemzetközi szervezetek részére történő továbbítása',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '44',
  null,
  'Az adattovábbításra vonatkozó általános elv
Olyan személyes adatok továbbítására – ideértve a személyes adatok harmadik országból vagy nemzetközi szervezettől egy további harmadik országba vagy további nemzetközi szervezet részére történő újbóli továbbítását is –, amelyeket harmadik országba vagy nemzetközi szervezet részére történő továbbításukat követően adatkezelésnek vetnek alá vagy szándékoznak alávetni, csak abban az esetben kerülhet sor, e rendelet egyéb rendelkezéseinek betartása mellett, ha az adatkezelő és az adatfeldolgozó teljesíti az e fejezetben rögzített feltételeket. E fejezet valamennyi rendelkezését alkalmazni kell annak biztosítása érdekében, hogy a természetes személyek számára e rendeletben garantált védelem szintje ne sérüljön.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_44'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  null,
  'Adattovábbítás megfelelőségi határozat alapján
(1) Személyes adatok harmadik országba vagy nemzetközi szervezet részére történő továbbítására akkor kerülhet sor, ha a Bizottság megállapította, hogy a harmadik ország, a harmadik ország valamely területe, vagy egy vagy több meghatározott ágazata, vagy a szóban forgó nemzetközi szervezet megfelelő védelmi szintet biztosít. Az ilyen adattovábbításhoz nem szükséges külön engedély.

(2) A védelmi szint megfelelőségének mérlegelése során a Bizottság különösen a következő tényezőket veszi figyelembe:

a)

a jogállamiság, az emberi jogok és alapvető szabadságok tiszteletben tartása, a vonatkozó általános és ágazati jogszabályok, köztük a közbiztonságra, a védelemre, valamint a nemzetbiztonságra vonatkozó és a büntetőjogi rendelkezések, a közhatalmi szerveknek a személyes adatokhoz való hozzáférését szabályozó rendelkezések, valamint e jogszabályok végrehajtása, adatvédelmi szabályok, szakmai szabályok és biztonsági intézkedések, ideértve a személyes adatok másik harmadik ország vagy nemzetközi szervezet részére történő újbóli továbbítására vonatkozó azon szabályokat, amelyeknek az adott országban vagy nemzetközi szervezeten belül meg kell felelni; ítélkezési gyakorlat, továbbá az, hogy az érintettek, akiknek a személyes adatait továbbítják, rendelkeznek-e hatékonyan érvényesíthető – a hatékony közigazgatási és bírósági jogorvoslatot is magukban foglaló – jogokkal;

b)

a szóban forgó harmadik országban létezik-e egy vagy több olyan független és hatékonyan működő felügyeleti hatóság – a szóban forgó nemzetközi szervezet pedig ilyen hatóság ellenőrzése alatt áll-e –, amely felelős az adatvédelmi szabályok betartásának biztosításáért és végrehajtásáért, rendelkezik többek között megfelelő kikényszerítési hatáskörrel, és felelős az érintettek részére történő, a jogaik gyakorlásával kapcsolatos segítségnyújtásért és tanácsadásért, valamint a tagállami felügyeleti hatóságokkal való együttműködésért; továbbá

c)

a szóban forgó harmadik ország vagy nemzetközi szervezet nemzetközi kötelezettségei vagy egyéb, jogilag kötelező erejű egyezményekből vagy jogi eszközökből, valamint többoldalú vagy regionális rendszerekben való részvételéből eredő – különösen a személyes adatok védelmével kapcsolatos – kötelezettségei.

(3) A védelmi szint megfelelőségének értékelését követően a Bizottság végrehajtási jogi aktusok útján határozhat arról, hogy a harmadik ország, a harmadik ország valamely területe, illetve egy vagy több meghatározott ágazata, illetve valamely nemzetközi szervezet a (2) bekezdés értelmében biztosítja a megfelelő védelmi szintet. A végrehajtási jogi aktusban rendelkezni kell egy rendszeres, legalább négyévente elvégzendő felülvizsgálatra irányuló mechanizmusról, amely az adott harmadik országban vagy nemzetközi szervezetnél végbement valamennyi releváns fejleményt figyelembe vesz. A végrehajtási jogi aktusban pontosan rögzíteni kell annak területi és ágazati alkalmazási körét, és – adott esetben – meg kell határozni a (2) bekezdés b) pontjában említett felügyeleti hatóságot, illetve hatóságokat. A végrehajtási jogi aktust a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően kell elfogadni.

(4) A Bizottság folyamatosan figyelemmel kíséri a harmadik országokban és a nemzetközi szervezeteknél végbement azon fejleményeket, amelyek érinthetik az e cikk (3) bekezdése, valamint a 95/46/EK irányelv 25. cikkének (6) bekezdése alapján elfogadott határozatok végrehajtását.

(5) A Bizottság – a rendelkezésekre álló információk, különösen az e cikk (3) bekezdésében említett felülvizsgálat alapján – határoz arról, hogy a harmadik ország, a harmadik ország valamely területe vagy meghatározott ágazata, vagy valamely nemzetközi szervezet már nem biztosítja az e cikk (2) bekezdése értelmében vett megfelelő védelmi szintet, és a szükséges mértékben, az e cikk (3) bekezdésében említett korábbi határozatot végrehajtási jogi aktus útján, visszaható hatály nélkül hatályon kívül helyezi, módosítja vagy felfüggeszti. A végrehajtási jogi aktust a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak, rendkívüli sürgősséget igénylő esetekben pedig a 93. cikk (3) bekezdésében említett eljárásnak megfelelően kell elfogadni.

A Bizottság kellően indokolt, rendkívül sürgős esetben a 93. cikk (3) bekezdésében említett eljárásnak megfelelően azonnal alkalmazandó végrehajtási jogi aktusokat fogad el.

(6) A Bizottság konzultációt kezdeményez a harmadik országgal vagy nemzetközi szervezettel az (5) bekezdés szerinti határozat meghozatalához vezető helyzet orvoslását illetően.

(7) Az (5) bekezdés szerinti határozat nem érinti a személyes adatoknak a szóban forgó harmadik ország, a harmadik ország valamely területe vagy egy vagy több meghatározott ágazata, illetve a szóban forgó nemzetközi szervezet részére a 46–49. cikk alapján történő továbbítását.

(8) A Bizottság az Európai Unió Hivatalos Lapjában és annak honlapján közzéteszi az olyan harmadik országok, harmadik országon belüli területek és meghatározott ágazatok, valamint nemzetközi szervezetek jegyzékét, amelyek esetében úgy ítélte meg, hogy biztosítják, vagy többé nem biztosítják a megfelelő védelmi szintet.

(9) A Bizottság által a 95/46/EK irányelv 25. cikkének (6) bekezdése alapján elfogadott határozatok mindaddig hatályban maradnak, amíg azokat az e cikk (3) vagy az (5) bekezdésével összhangban elfogadott bizottsági határozat nem módosítja, nem váltja fel vagy nem helyezi hatályon kívül.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  '1',
  '(1) Személyes adatok harmadik országba vagy nemzetközi szervezet részére történő továbbítására akkor kerülhet sor, ha a Bizottság megállapította, hogy a harmadik ország, a harmadik ország valamely területe, vagy egy vagy több meghatározott ágazata, vagy a szóban forgó nemzetközi szervezet megfelelő védelmi szintet biztosít. Az ilyen adattovábbításhoz nem szükséges külön engedély.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  '2',
  '(2) A védelmi szint megfelelőségének mérlegelése során a Bizottság különösen a következő tényezőket veszi figyelembe:

a)

a jogállamiság, az emberi jogok és alapvető szabadságok tiszteletben tartása, a vonatkozó általános és ágazati jogszabályok, köztük a közbiztonságra, a védelemre, valamint a nemzetbiztonságra vonatkozó és a büntetőjogi rendelkezések, a közhatalmi szerveknek a személyes adatokhoz való hozzáférését szabályozó rendelkezések, valamint e jogszabályok végrehajtása, adatvédelmi szabályok, szakmai szabályok és biztonsági intézkedések, ideértve a személyes adatok másik harmadik ország vagy nemzetközi szervezet részére történő újbóli továbbítására vonatkozó azon szabályokat, amelyeknek az adott országban vagy nemzetközi szervezeten belül meg kell felelni; ítélkezési gyakorlat, továbbá az, hogy az érintettek, akiknek a személyes adatait továbbítják, rendelkeznek-e hatékonyan érvényesíthető – a hatékony közigazgatási és bírósági jogorvoslatot is magukban foglaló – jogokkal;

b)

a szóban forgó harmadik országban létezik-e egy vagy több olyan független és hatékonyan működő felügyeleti hatóság – a szóban forgó nemzetközi szervezet pedig ilyen hatóság ellenőrzése alatt áll-e –, amely felelős az adatvédelmi szabályok betartásának biztosításáért és végrehajtásáért, rendelkezik többek között megfelelő kikényszerítési hatáskörrel, és felelős az érintettek részére történő, a jogaik gyakorlásával kapcsolatos segítségnyújtásért és tanácsadásért, valamint a tagállami felügyeleti hatóságokkal való együttműködésért; továbbá

c)

a szóban forgó harmadik ország vagy nemzetközi szervezet nemzetközi kötelezettségei vagy egyéb, jogilag kötelező erejű egyezményekből vagy jogi eszközökből, valamint többoldalú vagy regionális rendszerekben való részvételéből eredő – különösen a személyes adatok védelmével kapcsolatos – kötelezettségei.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  '2(a)',
  'a) a jogállamiság, az emberi jogok és alapvető szabadságok tiszteletben tartása, a vonatkozó általános és ágazati jogszabályok, köztük a közbiztonságra, a védelemre, valamint a nemzetbiztonságra vonatkozó és a büntetőjogi rendelkezések, a közhatalmi szerveknek a személyes adatokhoz való hozzáférését szabályozó rendelkezések, valamint e jogszabályok végrehajtása, adatvédelmi szabályok, szakmai szabályok és biztonsági intézkedések, ideértve a személyes adatok másik harmadik ország vagy nemzetközi szervezet részére történő újbóli továbbítására vonatkozó azon szabályokat, amelyeknek az adott országban vagy nemzetközi szervezeten belül meg kell felelni; ítélkezési gyakorlat, továbbá az, hogy az érintettek, akiknek a személyes adatait továbbítják, rendelkeznek-e hatékonyan érvényesíthető – a hatékony közigazgatási és bírósági jogorvoslatot is magukban foglaló – jogokkal;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  '2(b)',
  'b) a szóban forgó harmadik országban létezik-e egy vagy több olyan független és hatékonyan működő felügyeleti hatóság – a szóban forgó nemzetközi szervezet pedig ilyen hatóság ellenőrzése alatt áll-e –, amely felelős az adatvédelmi szabályok betartásának biztosításáért és végrehajtásáért, rendelkezik többek között megfelelő kikényszerítési hatáskörrel, és felelős az érintettek részére történő, a jogaik gyakorlásával kapcsolatos segítségnyújtásért és tanácsadásért, valamint a tagállami felügyeleti hatóságokkal való együttműködésért; továbbá',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  '2(c)',
  'c) a szóban forgó harmadik ország vagy nemzetközi szervezet nemzetközi kötelezettségei vagy egyéb, jogilag kötelező erejű egyezményekből vagy jogi eszközökből, valamint többoldalú vagy regionális rendszerekben való részvételéből eredő – különösen a személyes adatok védelmével kapcsolatos – kötelezettségei.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  '3',
  '(3) A védelmi szint megfelelőségének értékelését követően a Bizottság végrehajtási jogi aktusok útján határozhat arról, hogy a harmadik ország, a harmadik ország valamely területe, illetve egy vagy több meghatározott ágazata, illetve valamely nemzetközi szervezet a (2) bekezdés értelmében biztosítja a megfelelő védelmi szintet. A végrehajtási jogi aktusban rendelkezni kell egy rendszeres, legalább négyévente elvégzendő felülvizsgálatra irányuló mechanizmusról, amely az adott harmadik országban vagy nemzetközi szervezetnél végbement valamennyi releváns fejleményt figyelembe vesz. A végrehajtási jogi aktusban pontosan rögzíteni kell annak területi és ágazati alkalmazási körét, és – adott esetben – meg kell határozni a (2) bekezdés b) pontjában említett felügyeleti hatóságot, illetve hatóságokat. A végrehajtási jogi aktust a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  '4',
  '(4) A Bizottság folyamatosan figyelemmel kíséri a harmadik országokban és a nemzetközi szervezeteknél végbement azon fejleményeket, amelyek érinthetik az e cikk (3) bekezdése, valamint a 95/46/EK irányelv 25. cikkének (6) bekezdése alapján elfogadott határozatok végrehajtását.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  '5',
  '(5) A Bizottság – a rendelkezésekre álló információk, különösen az e cikk (3) bekezdésében említett felülvizsgálat alapján – határoz arról, hogy a harmadik ország, a harmadik ország valamely területe vagy meghatározott ágazata, vagy valamely nemzetközi szervezet már nem biztosítja az e cikk (2) bekezdése értelmében vett megfelelő védelmi szintet, és a szükséges mértékben, az e cikk (3) bekezdésében említett korábbi határozatot végrehajtási jogi aktus útján, visszaható hatály nélkül hatályon kívül helyezi, módosítja vagy felfüggeszti. A végrehajtási jogi aktust a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak, rendkívüli sürgősséget igénylő esetekben pedig a 93. cikk (3) bekezdésében említett eljárásnak megfelelően kell elfogadni.

A Bizottság kellően indokolt, rendkívül sürgős esetben a 93. cikk (3) bekezdésében említett eljárásnak megfelelően azonnal alkalmazandó végrehajtási jogi aktusokat fogad el.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  '6',
  '(6) A Bizottság konzultációt kezdeményez a harmadik országgal vagy nemzetközi szervezettel az (5) bekezdés szerinti határozat meghozatalához vezető helyzet orvoslását illetően.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  '7',
  '(7) Az (5) bekezdés szerinti határozat nem érinti a személyes adatoknak a szóban forgó harmadik ország, a harmadik ország valamely területe vagy egy vagy több meghatározott ágazata, illetve a szóban forgó nemzetközi szervezet részére a 46–49. cikk alapján történő továbbítását.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  '8',
  '(8) A Bizottság az Európai Unió Hivatalos Lapjában és annak honlapján közzéteszi az olyan harmadik országok, harmadik országon belüli területek és meghatározott ágazatok, valamint nemzetközi szervezetek jegyzékét, amelyek esetében úgy ítélte meg, hogy biztosítják, vagy többé nem biztosítják a megfelelő védelmi szintet.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '45',
  '9',
  '(9) A Bizottság által a 95/46/EK irányelv 25. cikkének (6) bekezdése alapján elfogadott határozatok mindaddig hatályban maradnak, amíg azokat az e cikk (3) vagy az (5) bekezdésével összhangban elfogadott bizottsági határozat nem módosítja, nem váltja fel vagy nem helyezi hatályon kívül.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  null,
  'Megfelelő garanciák alapján történő adattovábbítások
(1) A 45. cikk (3) bekezdése szerinti határozat hiányában az adatkezelő vagy adatfeldolgozó csak abban az esetben továbbíthat személyes adatokat harmadik országba vagy nemzetközi szervezet részére, ha az adatkezelő vagy adatfeldolgozó megfelelő garanciákat nyújtott, és csak azzal a feltétellel, hogy az érintettek számára érvényesíthető jogok és hatékony jogorvoslati lehetőségek állnak rendelkezésre.

(2) A felügyeleti hatóság külön engedélye nélkül az (1) bekezdés szerinti megfelelő garanciákat az alábbiak jelenthetik:

a)

közhatalmi vagy egyéb, közfeladatot ellátó szervek közötti, jogilag kötelező erejű, kikényszeríthető jogi eszköz;

b)

a 47. cikk szerinti kötelező erejű vállalati szabályok;

c)

a Bizottság által a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárással összhangban elfogadott általános adatvédelmi kikötések;

d)

a felügyeleti hatóság által elfogadott és a Bizottság által a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően jóváhagyott általános adatvédelmi kikötések;

e)

a 40. cikk szerinti, jóváhagyott magatartási kódex a harmadik országbeli adatkezelő vagy adatfeldolgozó arra vonatkozó, kötelező erejű és kikényszeríthető kötelezettségvállalásával együtt, hogy alkalmazza a megfelelő – ideértve az érintettek jogaira vonatkozó – garanciákat; vagy

f)

a 42. cikk szerinti, jóváhagyott tanúsítási mechanizmus a harmadik országbeli adatkezelő vagy adatfeldolgozó arra vonatkozó, kötelező erejű és kikényszeríthető kötelezettségvállalásával együtt, hogy alkalmazza a megfelelő garanciákat, ideértve az érintettek jogait illetően is.

(3) Az illetékes felügyeleti hatóság engedélyével az (1) bekezdésben említett megfelelő garanciákként különösen az alábbiak is szolgálhatnak:

a)

az adatkezelő vagy adatfeldolgozó és a harmadik országbeli vagy a nemzetközi szervezeten belüli adatkezelő, adatfeldolgozó vagy a személyes adatok címzettje között létrejött szerződéses rendelkezések; vagy

b)

közhatalmi vagy egyéb, közfeladatot ellátó szervek között létrejött, közigazgatási megállapodásba beillesztendő rendelkezések, köztük az érintettek érvényesíthető és tényleges jogaira vonatkozó rendelkezések.

(4) A felügyeleti hatóság az e cikk (3) bekezdésében említett esetekben a 63. cikkben említett egységességi mechanizmust alkalmazza.

(5) A valamely tagállam vagy felügyeleti hatóság által a 95/46/EK irányelv 26. cikkének (2) bekezdése alapján kiadott engedélyek hatályban maradnak mindaddig, amíg azokat szükség esetén a felügyeleti hatóság nem módosítja, nem váltja fel vagy nem helyezi hatályon kívül. A Bizottság által a 95/46/EK irányelv 26. cikkének (4) bekezdése alapján elfogadott határozatok mindaddig hatályban maradnak, amíg azokat szükség esetén az e cikk (2) bekezdésével összhangban elfogadott bizottsági határozat nem módosítja, nem váltja fel vagy nem helyezi hatályon kívül.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '1',
  '(1) A 45. cikk (3) bekezdése szerinti határozat hiányában az adatkezelő vagy adatfeldolgozó csak abban az esetben továbbíthat személyes adatokat harmadik országba vagy nemzetközi szervezet részére, ha az adatkezelő vagy adatfeldolgozó megfelelő garanciákat nyújtott, és csak azzal a feltétellel, hogy az érintettek számára érvényesíthető jogok és hatékony jogorvoslati lehetőségek állnak rendelkezésre.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '2',
  '(2) A felügyeleti hatóság külön engedélye nélkül az (1) bekezdés szerinti megfelelő garanciákat az alábbiak jelenthetik:

a)

közhatalmi vagy egyéb, közfeladatot ellátó szervek közötti, jogilag kötelező erejű, kikényszeríthető jogi eszköz;

b)

a 47. cikk szerinti kötelező erejű vállalati szabályok;

c)

a Bizottság által a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárással összhangban elfogadott általános adatvédelmi kikötések;

d)

a felügyeleti hatóság által elfogadott és a Bizottság által a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően jóváhagyott általános adatvédelmi kikötések;

e)

a 40. cikk szerinti, jóváhagyott magatartási kódex a harmadik országbeli adatkezelő vagy adatfeldolgozó arra vonatkozó, kötelező erejű és kikényszeríthető kötelezettségvállalásával együtt, hogy alkalmazza a megfelelő – ideértve az érintettek jogaira vonatkozó – garanciákat; vagy

f)

a 42. cikk szerinti, jóváhagyott tanúsítási mechanizmus a harmadik országbeli adatkezelő vagy adatfeldolgozó arra vonatkozó, kötelező erejű és kikényszeríthető kötelezettségvállalásával együtt, hogy alkalmazza a megfelelő garanciákat, ideértve az érintettek jogait illetően is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '2(a)',
  'a) közhatalmi vagy egyéb, közfeladatot ellátó szervek közötti, jogilag kötelező erejű, kikényszeríthető jogi eszköz;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '2(b)',
  'b) a 47. cikk szerinti kötelező erejű vállalati szabályok;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '2(c)',
  'c) a Bizottság által a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárással összhangban elfogadott általános adatvédelmi kikötések;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '2(d)',
  'd) a felügyeleti hatóság által elfogadott és a Bizottság által a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően jóváhagyott általános adatvédelmi kikötések;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '2(e)',
  'e) a 40. cikk szerinti, jóváhagyott magatartási kódex a harmadik országbeli adatkezelő vagy adatfeldolgozó arra vonatkozó, kötelező erejű és kikényszeríthető kötelezettségvállalásával együtt, hogy alkalmazza a megfelelő – ideértve az érintettek jogaira vonatkozó – garanciákat; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '2(f)',
  'f) a 42. cikk szerinti, jóváhagyott tanúsítási mechanizmus a harmadik országbeli adatkezelő vagy adatfeldolgozó arra vonatkozó, kötelező erejű és kikényszeríthető kötelezettségvállalásával együtt, hogy alkalmazza a megfelelő garanciákat, ideértve az érintettek jogait illetően is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '3',
  '(3) Az illetékes felügyeleti hatóság engedélyével az (1) bekezdésben említett megfelelő garanciákként különösen az alábbiak is szolgálhatnak:

a)

az adatkezelő vagy adatfeldolgozó és a harmadik országbeli vagy a nemzetközi szervezeten belüli adatkezelő, adatfeldolgozó vagy a személyes adatok címzettje között létrejött szerződéses rendelkezések; vagy

b)

közhatalmi vagy egyéb, közfeladatot ellátó szervek között létrejött, közigazgatási megállapodásba beillesztendő rendelkezések, köztük az érintettek érvényesíthető és tényleges jogaira vonatkozó rendelkezések.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '3(a)',
  'a) az adatkezelő vagy adatfeldolgozó és a harmadik országbeli vagy a nemzetközi szervezeten belüli adatkezelő, adatfeldolgozó vagy a személyes adatok címzettje között létrejött szerződéses rendelkezések; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '3(b)',
  'b) közhatalmi vagy egyéb, közfeladatot ellátó szervek között létrejött, közigazgatási megállapodásba beillesztendő rendelkezések, köztük az érintettek érvényesíthető és tényleges jogaira vonatkozó rendelkezések.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '4',
  '(4) A felügyeleti hatóság az e cikk (3) bekezdésében említett esetekben a 63. cikkben említett egységességi mechanizmust alkalmazza.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '46',
  '5',
  '(5) A valamely tagállam vagy felügyeleti hatóság által a 95/46/EK irányelv 26. cikkének (2) bekezdése alapján kiadott engedélyek hatályban maradnak mindaddig, amíg azokat szükség esetén a felügyeleti hatóság nem módosítja, nem váltja fel vagy nem helyezi hatályon kívül. A Bizottság által a 95/46/EK irányelv 26. cikkének (4) bekezdése alapján elfogadott határozatok mindaddig hatályban maradnak, amíg azokat szükség esetén az e cikk (2) bekezdésével összhangban elfogadott bizottsági határozat nem módosítja, nem váltja fel vagy nem helyezi hatályon kívül.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  null,
  'Kötelező erejű vállalati szabályok
(1) Az illetékes felügyeleti hatóság a 63. cikkben meghatározott, egységességi mechanizmusnak megfelelően jóváhagyja a kötelező erejű vállalati szabályokat, ha az:

a)

a vállalkozáscsoport vagy a közös gazdasági tevékenységet folytató vállalkozások csoportja minden érintett tagjára, beleértve az alkalmazottakat is, jogilag kötelező erejű, alkalmazandó és általuk érvényesített;

b)

kifejezetten rendelkezik az érintetteknek a személyes adataik kezelése tekintetében kikényszeríthető jogairól; és

c)

megfelel a (2) bekezdés szerinti követelményeknek.

(2) Az (1) bekezdésben említett kötelező erejű vállalati szabályok tartalmazzák legalább:

a)

a vállalkozáscsoport vagy közös gazdasági tevékenységet folytató vállalkozások csoportja minden egyes tagjának szervezeti felépítését és az elérhetőségét;

b)

az adattovábbításokat vagy a továbbítások sorozatát, beleértve a személyes adatok kategóriáit, az adatkezelés fajtáját és céljait, az érintettek fajtáit és a szóban forgó harmadik ország vagy országok azonosítását;

c)

a vállalkozások adatvédelmi szabályzatának belső és külső tekintetben jogilag kötelező jellegét;

d)

az általános adatvédelmi elvek alkalmazását, különösen a célhoz kötöttség, az adattakarékosság, a korlátozott tárolási időtartamok, az adatminőség, a beépített és alapértelmezett adatvédelem, az adatkezelés jogalapja, a személyes adatok különleges kategóriáinak kezelése, az adatbiztonságot garantáló intézkedések, valamint az olyan szervezeteknek történő újbóli továbbítás feltételeit, amelyekre nézve nem kötelezőek a kötelező erejű vállalati szabályok;

e)

az érintettek személyes adataik kezelése tekintetében fennálló jogait és e jogok gyakorlásának módjait, beleértve a 22. cikk szerinti, kizárólag automatizált adatkezelésen – ideértve a profilalkotást is – alapuló döntések alóli mentesülés jogát, az érintett 79. cikkben meghatározott jogát, hogy az illetékes felügyeleti hatóságnál és a tagállamok illetékes bíróságainál panaszt nyújthat be, továbbá a jogorvoslathoz való jogát, valamint adott esetben a kötelező erejű vállalati szabályok megsértése esetén a kártérítéshez való jogát;

f)

a valamely tagállamban tevékenységi hellyel rendelkező adatkezelő vagy adatfeldolgozó felelősségének elismerését abban az esetben, ha a kötelező erejű vállalati szabályokat a csoportnak az Unióban tevékenységi hellyel nem rendelkező bármely érintett tagja megsérti; az adatkezelő vagy adatfeldolgozó részben vagy egészben csak akkor mentesül e felelőség alól, ha bizonyítja, hogy tagja nem felelős a kár előidézésében;

g)

azt, hogy a 13. és a 14. cikkben említetten kívül miként biztosítják az érintetteknek a kötelező erejű vállalati szabályokra, különösen az e bekezdés d), e) és f) pontja szerinti rendelkezésekre vonatkozó információkat;

h)

a 37. cikk értelmében kijelölt adatvédelmi tisztviselők vagy a vállalkozáscsoporton vagy közös gazdasági tevékenységet folytató vállalkozások csoportján belül a kötelező erejű vállalati szabályoknak való megfelelés, valamint a képzés és a panaszkezelés nyomon követéséért felelős személyek vagy szervezetek feladatait;

i)

a panasztételi eljárásokat;

j)

a kötelező erejű vállalati szabályoknak való megfelelés ellenőrzésének biztosítására szolgáló, a vállalkozáscsoporton vagy közös gazdasági tevékenységet folytató vállalkozások csoportján belüli mechanizmusokat. E mechanizmusok tartalmazzák az adatvédelmi auditokat és az érintettek jogainak védelmét szolgáló korrekciós intézkedéseket biztosító mechanizmusokat. Az ilyen ellenőrzések eredményeit közölni kell a h) pontban említett személlyel vagy szervezettel, valamint a vállalkozáscsoportot vagy a közös gazdasági tevékenységet folytató vállalkozások csoportját ellenőrző vállalkozás felügyelőbizottságával, és kérésre az illetékes felügyeleti hatóság rendelkezésére kell bocsátani őket;

k)

a kötelező erejű vállalati szabályok változásainak bejelentésére és rögzítésére, valamint e változásoknak a felügyeleti hatóság számára történő bejelentésére szolgáló mechanizmusokat;

l)

a kötelező erejű vállalati szabályoknak a vállalkozáscsoport vagy közös gazdasági tevékenységet folytató vállalkozások csoportjának tagjai általi betartásának biztosítása érdekében a felügyeleti hatósággal folytatott együttműködési mechanizmust, beleértve különösen azt, hogy a felügyeleti hatóság számára elérhetővé teszik az intézkedések e bekezdés j) pontja szerinti ellenőrzésének eredményeit;

m)

arra vonatkozó mechanizmusokat, hogy hogyan kell jelenteni az illetékes felügyeleti hatóság számára a vállalkozáscsoport vagy közös gazdasági tevékenységet folytató vállalkozások csoportjának tagjára valamely harmadik országban vonatkozó azon jogi előírásokat, amelyek valószínűsíthetően jelentős mértékben hátrányosan érintenék a kötelező erejű vállalati szabályokban előírt garanciákat; valamint

n)

a személyes adatokba állandó jelleggel vagy rendszeresen betekintő személyzetnek nyújtandó megfelelő adatvédelmi képzést.

(3) A Bizottság meghatározhatja az e cikk szerinti, a kötelező erejű vállalati szabályokra vonatkozóan az adatkezelők, az adatfeldolgozók és a felügyeleti hatóságok között folytatott információcsere formátumát és eljárásait. Ezeket a végrehajtási jogi aktusokat a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '1',
  '(1) Az illetékes felügyeleti hatóság a 63. cikkben meghatározott, egységességi mechanizmusnak megfelelően jóváhagyja a kötelező erejű vállalati szabályokat, ha az:

a)

a vállalkozáscsoport vagy a közös gazdasági tevékenységet folytató vállalkozások csoportja minden érintett tagjára, beleértve az alkalmazottakat is, jogilag kötelező erejű, alkalmazandó és általuk érvényesített;

b)

kifejezetten rendelkezik az érintetteknek a személyes adataik kezelése tekintetében kikényszeríthető jogairól; és

c)

megfelel a (2) bekezdés szerinti követelményeknek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '1(a)',
  'a) a vállalkozáscsoport vagy a közös gazdasági tevékenységet folytató vállalkozások csoportja minden érintett tagjára, beleértve az alkalmazottakat is, jogilag kötelező erejű, alkalmazandó és általuk érvényesített;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '1(b)',
  'b) kifejezetten rendelkezik az érintetteknek a személyes adataik kezelése tekintetében kikényszeríthető jogairól; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '1(c)',
  'c) megfelel a (2) bekezdés szerinti követelményeknek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2',
  '(2) Az (1) bekezdésben említett kötelező erejű vállalati szabályok tartalmazzák legalább:

a)

a vállalkozáscsoport vagy közös gazdasági tevékenységet folytató vállalkozások csoportja minden egyes tagjának szervezeti felépítését és az elérhetőségét;

b)

az adattovábbításokat vagy a továbbítások sorozatát, beleértve a személyes adatok kategóriáit, az adatkezelés fajtáját és céljait, az érintettek fajtáit és a szóban forgó harmadik ország vagy országok azonosítását;

c)

a vállalkozások adatvédelmi szabályzatának belső és külső tekintetben jogilag kötelező jellegét;

d)

az általános adatvédelmi elvek alkalmazását, különösen a célhoz kötöttség, az adattakarékosság, a korlátozott tárolási időtartamok, az adatminőség, a beépített és alapértelmezett adatvédelem, az adatkezelés jogalapja, a személyes adatok különleges kategóriáinak kezelése, az adatbiztonságot garantáló intézkedések, valamint az olyan szervezeteknek történő újbóli továbbítás feltételeit, amelyekre nézve nem kötelezőek a kötelező erejű vállalati szabályok;

e)

az érintettek személyes adataik kezelése tekintetében fennálló jogait és e jogok gyakorlásának módjait, beleértve a 22. cikk szerinti, kizárólag automatizált adatkezelésen – ideértve a profilalkotást is – alapuló döntések alóli mentesülés jogát, az érintett 79. cikkben meghatározott jogát, hogy az illetékes felügyeleti hatóságnál és a tagállamok illetékes bíróságainál panaszt nyújthat be, továbbá a jogorvoslathoz való jogát, valamint adott esetben a kötelező erejű vállalati szabályok megsértése esetén a kártérítéshez való jogát;

f)

a valamely tagállamban tevékenységi hellyel rendelkező adatkezelő vagy adatfeldolgozó felelősségének elismerését abban az esetben, ha a kötelező erejű vállalati szabályokat a csoportnak az Unióban tevékenységi hellyel nem rendelkező bármely érintett tagja megsérti; az adatkezelő vagy adatfeldolgozó részben vagy egészben csak akkor mentesül e felelőség alól, ha bizonyítja, hogy tagja nem felelős a kár előidézésében;

g)

azt, hogy a 13. és a 14. cikkben említetten kívül miként biztosítják az érintetteknek a kötelező erejű vállalati szabályokra, különösen az e bekezdés d), e) és f) pontja szerinti rendelkezésekre vonatkozó információkat;

h)

a 37. cikk értelmében kijelölt adatvédelmi tisztviselők vagy a vállalkozáscsoporton vagy közös gazdasági tevékenységet folytató vállalkozások csoportján belül a kötelező erejű vállalati szabályoknak való megfelelés, valamint a képzés és a panaszkezelés nyomon követéséért felelős személyek vagy szervezetek feladatait;

i)

a panasztételi eljárásokat;

j)

a kötelező erejű vállalati szabályoknak való megfelelés ellenőrzésének biztosítására szolgáló, a vállalkozáscsoporton vagy közös gazdasági tevékenységet folytató vállalkozások csoportján belüli mechanizmusokat. E mechanizmusok tartalmazzák az adatvédelmi auditokat és az érintettek jogainak védelmét szolgáló korrekciós intézkedéseket biztosító mechanizmusokat. Az ilyen ellenőrzések eredményeit közölni kell a h) pontban említett személlyel vagy szervezettel, valamint a vállalkozáscsoportot vagy a közös gazdasági tevékenységet folytató vállalkozások csoportját ellenőrző vállalkozás felügyelőbizottságával, és kérésre az illetékes felügyeleti hatóság rendelkezésére kell bocsátani őket;

k)

a kötelező erejű vállalati szabályok változásainak bejelentésére és rögzítésére, valamint e változásoknak a felügyeleti hatóság számára történő bejelentésére szolgáló mechanizmusokat;

l)

a kötelező erejű vállalati szabályoknak a vállalkozáscsoport vagy közös gazdasági tevékenységet folytató vállalkozások csoportjának tagjai általi betartásának biztosítása érdekében a felügyeleti hatósággal folytatott együttműködési mechanizmust, beleértve különösen azt, hogy a felügyeleti hatóság számára elérhetővé teszik az intézkedések e bekezdés j) pontja szerinti ellenőrzésének eredményeit;

m)

arra vonatkozó mechanizmusokat, hogy hogyan kell jelenteni az illetékes felügyeleti hatóság számára a vállalkozáscsoport vagy közös gazdasági tevékenységet folytató vállalkozások csoportjának tagjára valamely harmadik országban vonatkozó azon jogi előírásokat, amelyek valószínűsíthetően jelentős mértékben hátrányosan érintenék a kötelező erejű vállalati szabályokban előírt garanciákat; valamint

n)

a személyes adatokba állandó jelleggel vagy rendszeresen betekintő személyzetnek nyújtandó megfelelő adatvédelmi képzést.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(a)',
  'a) a vállalkozáscsoport vagy közös gazdasági tevékenységet folytató vállalkozások csoportja minden egyes tagjának szervezeti felépítését és az elérhetőségét;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(b)',
  'b) az adattovábbításokat vagy a továbbítások sorozatát, beleértve a személyes adatok kategóriáit, az adatkezelés fajtáját és céljait, az érintettek fajtáit és a szóban forgó harmadik ország vagy országok azonosítását;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(c)',
  'c) a vállalkozások adatvédelmi szabályzatának belső és külső tekintetben jogilag kötelező jellegét;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(d)',
  'd) az általános adatvédelmi elvek alkalmazását, különösen a célhoz kötöttség, az adattakarékosság, a korlátozott tárolási időtartamok, az adatminőség, a beépített és alapértelmezett adatvédelem, az adatkezelés jogalapja, a személyes adatok különleges kategóriáinak kezelése, az adatbiztonságot garantáló intézkedések, valamint az olyan szervezeteknek történő újbóli továbbítás feltételeit, amelyekre nézve nem kötelezőek a kötelező erejű vállalati szabályok;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(e)',
  'e) az érintettek személyes adataik kezelése tekintetében fennálló jogait és e jogok gyakorlásának módjait, beleértve a 22. cikk szerinti, kizárólag automatizált adatkezelésen – ideértve a profilalkotást is – alapuló döntések alóli mentesülés jogát, az érintett 79. cikkben meghatározott jogát, hogy az illetékes felügyeleti hatóságnál és a tagállamok illetékes bíróságainál panaszt nyújthat be, továbbá a jogorvoslathoz való jogát, valamint adott esetben a kötelező erejű vállalati szabályok megsértése esetén a kártérítéshez való jogát;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(f)',
  'f) a valamely tagállamban tevékenységi hellyel rendelkező adatkezelő vagy adatfeldolgozó felelősségének elismerését abban az esetben, ha a kötelező erejű vállalati szabályokat a csoportnak az Unióban tevékenységi hellyel nem rendelkező bármely érintett tagja megsérti; az adatkezelő vagy adatfeldolgozó részben vagy egészben csak akkor mentesül e felelőség alól, ha bizonyítja, hogy tagja nem felelős a kár előidézésében;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(g)',
  'g) azt, hogy a 13. és a 14. cikkben említetten kívül miként biztosítják az érintetteknek a kötelező erejű vállalati szabályokra, különösen az e bekezdés d), e) és f) pontja szerinti rendelkezésekre vonatkozó információkat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(h)',
  'h) a 37. cikk értelmében kijelölt adatvédelmi tisztviselők vagy a vállalkozáscsoporton vagy közös gazdasági tevékenységet folytató vállalkozások csoportján belül a kötelező erejű vállalati szabályoknak való megfelelés, valamint a képzés és a panaszkezelés nyomon követéséért felelős személyek vagy szervezetek feladatait;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(i)',
  'i) a panasztételi eljárásokat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(j)',
  'j) a kötelező erejű vállalati szabályoknak való megfelelés ellenőrzésének biztosítására szolgáló, a vállalkozáscsoporton vagy közös gazdasági tevékenységet folytató vállalkozások csoportján belüli mechanizmusokat. E mechanizmusok tartalmazzák az adatvédelmi auditokat és az érintettek jogainak védelmét szolgáló korrekciós intézkedéseket biztosító mechanizmusokat. Az ilyen ellenőrzések eredményeit közölni kell a h) pontban említett személlyel vagy szervezettel, valamint a vállalkozáscsoportot vagy a közös gazdasági tevékenységet folytató vállalkozások csoportját ellenőrző vállalkozás felügyelőbizottságával, és kérésre az illetékes felügyeleti hatóság rendelkezésére kell bocsátani őket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(k)',
  'k) a kötelező erejű vállalati szabályok változásainak bejelentésére és rögzítésére, valamint e változásoknak a felügyeleti hatóság számára történő bejelentésére szolgáló mechanizmusokat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(l)',
  'l) a kötelező erejű vállalati szabályoknak a vállalkozáscsoport vagy közös gazdasági tevékenységet folytató vállalkozások csoportjának tagjai általi betartásának biztosítása érdekében a felügyeleti hatósággal folytatott együttműködési mechanizmust, beleértve különösen azt, hogy a felügyeleti hatóság számára elérhetővé teszik az intézkedések e bekezdés j) pontja szerinti ellenőrzésének eredményeit;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(m)',
  'm) arra vonatkozó mechanizmusokat, hogy hogyan kell jelenteni az illetékes felügyeleti hatóság számára a vállalkozáscsoport vagy közös gazdasági tevékenységet folytató vállalkozások csoportjának tagjára valamely harmadik országban vonatkozó azon jogi előírásokat, amelyek valószínűsíthetően jelentős mértékben hátrányosan érintenék a kötelező erejű vállalati szabályokban előírt garanciákat; valamint',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '2(n)',
  'n) a személyes adatokba állandó jelleggel vagy rendszeresen betekintő személyzetnek nyújtandó megfelelő adatvédelmi képzést.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '47',
  '3',
  '(3) A Bizottság meghatározhatja az e cikk szerinti, a kötelező erejű vállalati szabályokra vonatkozóan az adatkezelők, az adatfeldolgozók és a felügyeleti hatóságok között folytatott információcsere formátumát és eljárásait. Ezeket a végrehajtási jogi aktusokat a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '48',
  null,
  'Az uniós jog által nem engedélyezett továbbítás és közlés
Valamely harmadik ország bíróságának bármely olyan ítélete, illetve közigazgatási hatóságának bármely olyan döntése, amely valamely adatkezelő vagy adatfeldolgozó számára személyes adatok továbbítását vagy közlését írja elő, kizárólag akkor ismerhető el vagy hajtható bármely módon végre, ha az az adatok megismerését igénylő harmadik ország és az Unió vagy egy tagállama között létrejött, hatályos nemzetközi megállapodáson, például kölcsönös jogsegélyszerződésen alapul, az adattovábbítás e fejezet szerinti egyéb módozatainak sérelme nélkül.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_48'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  null,
  'Különös helyzetekben biztosított eltérések
(1) A 45. cikk (3) bekezdése szerinti megfelelőségi határozat, illetve a 46. cikk szerinti megfelelő garanciák hiányában – beleértve a kötelező erejű vállalati szabályokat is –, a személyes adatok harmadik ország vagy nemzetközi szervezet részére történő továbbítására vagy többszöri továbbítására csak az alábbi feltételek legalább egyikének teljesülése esetén kerülhet sor:

a)

az érintett kifejezetten hozzájárulását adta a tervezett továbbításhoz azt követően, hogy tájékoztatták az adattovábbításból eredő – a megfelelőségi határozat és a megfelelő garanciák hiányából fakadó – esetleges kockázatokról;

b)

az adattovábbítás az érintett és az adatkezelő közötti szerződés teljesítéséhez, vagy az érintett kérésére hozott, szerződést megelőző intézkedések végrehajtásához szükséges;

c)

az adattovábbítás az adatkezelő és valamely más természetes vagy jogi személy közötti, az érintett érdekét szolgáló szerződés megkötéséhez vagy teljesítéséhez szükséges;

d)

az adattovábbítás fontos közérdekből szükséges;

e)

az adattovábbítás jogi igények előterjesztése, érvényesítése és védelme miatt szükséges;

f)

az adattovábbítás az érintett vagy valamely más személy létfontosságú érdekeinek védelme miatt szükséges, és az érintett fizikailag vagy jogilag képtelen a hozzájárulás megadására;

g)

a továbbított adatok olyan nyilvántartásból származnak, amely az uniós vagy a tagállami jog értelmében a nyilvánosság tájékoztatását szolgálja, és amely vagy általában a nyilvánosság, vagy az ezzel kapcsolatos jogos érdekét igazoló bármely személy számára betekintés céljából hozzáférhető, de csak ha az uniós vagy tagállami jog által a betekintésre megállapított feltételek az adott különleges esetben teljesülnek.

Ha az adattovábbítás nem alapulhat a 45. vagy a 46. cikk rendelkezésein, beleértve a kötelező erejű vállalati szabályok rendelkezéseit is, és az első albekezdésben említett egyedi helyzetekre vonatkozó eltérések egyike sem alkalmazandó, harmadik országok és nemzetközi szervezetek részére történő adattovábbítás csak akkor történhet, ha az adattovábbítás nem ismétlődő, csak korlátozott számú érintettre vonatkozik, az adatkezelő olyan kényszerítő erejű jogos érdekében szükséges, amely érdekhez képest nem élveznek elsőbbséget az érintett érdekei, jogai és szabadságai, és az adatkezelő az adattovábbítás minden körülményét megvizsgálta, és e vizsgálat alapján megfelelő garanciákat nyújtott a személyes adatok védelme tekintetében. Az adatkezelőnek tájékoztatnia kell a felügyeleti hatóságot az adattovábbításról. Az adatkezelő a 13. és a 14. cikkben említett információk nyújtásán kívül az érintettet tájékoztatja az adattovábbításról, valamint az adatkezelő kényszerítő erejű jogos érdekéről.

(2) Az (1) bekezdés első albekezdésének g) pontja szerinti adattovábbítás nem érintheti a nyilvántartásban szereplő személyes adatok vagy személyes adatok kategóriáinak összességét. Ha a nyilvántartásba kizárólag olyan személyek tekinthetnek be, akiknek ehhez jogos érdeke fűződik, az adattovábbításra kizárólag e személyek kérelmére kerülhet sor, illetve abban az esetben, ha ők a címzettek.

(3) Az (1) bekezdés első albekezdésének a), b) és c) pontja, valamint második albekezdése nem alkalmazandó a közhatalmi szervek által közhatalmi jogosítványaik gyakorlása során végzett tevékenységekre.

(4) Az (1) bekezdés első albekezdésének d) pontjában említett közérdeket akkor kell figyelembe venni, ha azt az uniós jog vagy az adatkezelőre vonatkozó tagállami jog elismeri.

(5) Megfelelőségi határozat hiányában az uniós jog vagy a tagállami jog fontos közérdekből kifejezetten korlátozhatja bizonyos kategóriákba tartozó személyes adatok valamely harmadik országba vagy nemzetközi szervezethez történő továbbítását. A tagállamok az ilyen rendelkezéseket bejelentik a Bizottságnak.

(6) Az adatkezelő vagy az adatfeldolgozó az e cikk (1) bekezdésének második albekezdésében említett vizsgálatot és megfelelő garanciákat a 30. cikkben említett nyilvántartásban dokumentálja.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '1',
  '(1) A 45. cikk (3) bekezdése szerinti megfelelőségi határozat, illetve a 46. cikk szerinti megfelelő garanciák hiányában – beleértve a kötelező erejű vállalati szabályokat is –, a személyes adatok harmadik ország vagy nemzetközi szervezet részére történő továbbítására vagy többszöri továbbítására csak az alábbi feltételek legalább egyikének teljesülése esetén kerülhet sor:

a)

az érintett kifejezetten hozzájárulását adta a tervezett továbbításhoz azt követően, hogy tájékoztatták az adattovábbításból eredő – a megfelelőségi határozat és a megfelelő garanciák hiányából fakadó – esetleges kockázatokról;

b)

az adattovábbítás az érintett és az adatkezelő közötti szerződés teljesítéséhez, vagy az érintett kérésére hozott, szerződést megelőző intézkedések végrehajtásához szükséges;

c)

az adattovábbítás az adatkezelő és valamely más természetes vagy jogi személy közötti, az érintett érdekét szolgáló szerződés megkötéséhez vagy teljesítéséhez szükséges;

d)

az adattovábbítás fontos közérdekből szükséges;

e)

az adattovábbítás jogi igények előterjesztése, érvényesítése és védelme miatt szükséges;

f)

az adattovábbítás az érintett vagy valamely más személy létfontosságú érdekeinek védelme miatt szükséges, és az érintett fizikailag vagy jogilag képtelen a hozzájárulás megadására;

g)

a továbbított adatok olyan nyilvántartásból származnak, amely az uniós vagy a tagállami jog értelmében a nyilvánosság tájékoztatását szolgálja, és amely vagy általában a nyilvánosság, vagy az ezzel kapcsolatos jogos érdekét igazoló bármely személy számára betekintés céljából hozzáférhető, de csak ha az uniós vagy tagállami jog által a betekintésre megállapított feltételek az adott különleges esetben teljesülnek.

Ha az adattovábbítás nem alapulhat a 45. vagy a 46. cikk rendelkezésein, beleértve a kötelező erejű vállalati szabályok rendelkezéseit is, és az első albekezdésben említett egyedi helyzetekre vonatkozó eltérések egyike sem alkalmazandó, harmadik országok és nemzetközi szervezetek részére történő adattovábbítás csak akkor történhet, ha az adattovábbítás nem ismétlődő, csak korlátozott számú érintettre vonatkozik, az adatkezelő olyan kényszerítő erejű jogos érdekében szükséges, amely érdekhez képest nem élveznek elsőbbséget az érintett érdekei, jogai és szabadságai, és az adatkezelő az adattovábbítás minden körülményét megvizsgálta, és e vizsgálat alapján megfelelő garanciákat nyújtott a személyes adatok védelme tekintetében. Az adatkezelőnek tájékoztatnia kell a felügyeleti hatóságot az adattovábbításról. Az adatkezelő a 13. és a 14. cikkben említett információk nyújtásán kívül az érintettet tájékoztatja az adattovábbításról, valamint az adatkezelő kényszerítő erejű jogos érdekéről.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '1(a)',
  'a) az érintett kifejezetten hozzájárulását adta a tervezett továbbításhoz azt követően, hogy tájékoztatták az adattovábbításból eredő – a megfelelőségi határozat és a megfelelő garanciák hiányából fakadó – esetleges kockázatokról;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '1(b)',
  'b) az adattovábbítás az érintett és az adatkezelő közötti szerződés teljesítéséhez, vagy az érintett kérésére hozott, szerződést megelőző intézkedések végrehajtásához szükséges;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '1(c)',
  'c) az adattovábbítás az adatkezelő és valamely más természetes vagy jogi személy közötti, az érintett érdekét szolgáló szerződés megkötéséhez vagy teljesítéséhez szükséges;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '1(d)',
  'd) az adattovábbítás fontos közérdekből szükséges;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '1(e)',
  'e) az adattovábbítás jogi igények előterjesztése, érvényesítése és védelme miatt szükséges;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '1(f)',
  'f) az adattovábbítás az érintett vagy valamely más személy létfontosságú érdekeinek védelme miatt szükséges, és az érintett fizikailag vagy jogilag képtelen a hozzájárulás megadására;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '1(g)',
  'g) a továbbított adatok olyan nyilvántartásból származnak, amely az uniós vagy a tagállami jog értelmében a nyilvánosság tájékoztatását szolgálja, és amely vagy általában a nyilvánosság, vagy az ezzel kapcsolatos jogos érdekét igazoló bármely személy számára betekintés céljából hozzáférhető, de csak ha az uniós vagy tagállami jog által a betekintésre megállapított feltételek az adott különleges esetben teljesülnek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '2',
  '(2) Az (1) bekezdés első albekezdésének g) pontja szerinti adattovábbítás nem érintheti a nyilvántartásban szereplő személyes adatok vagy személyes adatok kategóriáinak összességét. Ha a nyilvántartásba kizárólag olyan személyek tekinthetnek be, akiknek ehhez jogos érdeke fűződik, az adattovábbításra kizárólag e személyek kérelmére kerülhet sor, illetve abban az esetben, ha ők a címzettek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '3',
  '(3) Az (1) bekezdés első albekezdésének a), b) és c) pontja, valamint második albekezdése nem alkalmazandó a közhatalmi szervek által közhatalmi jogosítványaik gyakorlása során végzett tevékenységekre.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '4',
  '(4) Az (1) bekezdés első albekezdésének d) pontjában említett közérdeket akkor kell figyelembe venni, ha azt az uniós jog vagy az adatkezelőre vonatkozó tagállami jog elismeri.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '5',
  '(5) Megfelelőségi határozat hiányában az uniós jog vagy a tagállami jog fontos közérdekből kifejezetten korlátozhatja bizonyos kategóriákba tartozó személyes adatok valamely harmadik országba vagy nemzetközi szervezethez történő továbbítását. A tagállamok az ilyen rendelkezéseket bejelentik a Bizottságnak.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '49',
  '6',
  '(6) Az adatkezelő vagy az adatfeldolgozó az e cikk (1) bekezdésének második albekezdésében említett vizsgálatot és megfelelő garanciákat a 30. cikkben említett nyilvántartásban dokumentálja.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '50',
  null,
  'A személyes adatok védelmével kapcsolatos nemzetközi együttműködés
A harmadik országok és nemzetközi szervezetek viszonylatában a Bizottság és a felügyeleti hatóságok megfelelő lépéseket tesznek annak érdekében, hogy:

a)

a személyes adatok védelméről szóló jogszabályok hatékony érvényesítésének elősegítését célzó nemzetközi együttműködési mechanizmusokat alakítsanak ki;

b)

a személyes adatok védelméről szóló jogszabályok érvényesítése terén kölcsönös nemzetközi segítségnyújtást biztosítsanak, egyebek mellett értesítés, a panaszok illetékes hatósághoz történő továbbítása, a vizsgálatokban történő segítségnyújtás és információcsere útján, a személyes adatok védelmére és a többi alapvető jogra és szabadságra vonatkozó megfelelő garanciákra is figyelemmel;

c)

az érdekelt feleket bevonják a személyes adatok védelméről szóló jogszabályok érvényesítése érdekében folytatott nemzetközi együttműködés előmozdítását célzó párbeszédbe és tevékenységekbe;

d)

előmozdítsák a személyes adatok védelméről szóló jogszabályok és gyakorlat átadását és dokumentálását, beleértve a harmadik országok viszonylatában felmerülő joghatósági összeütközéseket is.

VI. FEJEZET

Független felügyeleti hatóságok

1. szakasz

Független jogállás',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_50'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '51',
  null,
  'Felügyeleti hatóság
(1) A természetes személyek alapvető jogainak és szabadságainak a személyes adataik kezelése tekintetében történő védelme, valamint a személyes adatok Unión belüli szabad áramlásának megkönnyítése érdekében minden tagállam előírja, hogy e rendelet alkalmazásának ellenőrzéséért egy vagy több független közhatalmi szerv (felügyeleti hatóság) felel.

(2) Minden felügyeleti hatóság elősegíti e rendeletnek az Unió egész területén történő egységes alkalmazását. A felügyeleti hatóságok e célból együttműködnek egymással és a Bizottsággal, a VII. fejezettel összhangban.

(3) Ha valamely tagállamban egynél több felügyeleti hatóságot hoznak létre, az adott tagállam kijelöli azt a felügyeleti hatóságot, amelyik a Testületben ellátja a szóban forgó hatóságok képviseletét, és létrehozza az arra szolgáló mechanizmust, hogy a többi hatóság a 63. cikkben említett egységességi mechanizmusra vonatkozó szabályokat betartsa.

(4) Minden tagállam 2018. május 25-ig értesíti a Bizottságot jogának azon rendelkezéseiről, amelyeket e fejezet alapján elfogad, továbbá haladéktalanul értesíti a Bizottságot az említett rendelkezéseket érintő későbbi módosításokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_51'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '51',
  '1',
  '(1) A természetes személyek alapvető jogainak és szabadságainak a személyes adataik kezelése tekintetében történő védelme, valamint a személyes adatok Unión belüli szabad áramlásának megkönnyítése érdekében minden tagállam előírja, hogy e rendelet alkalmazásának ellenőrzéséért egy vagy több független közhatalmi szerv (felügyeleti hatóság) felel.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_51'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '51',
  '2',
  '(2) Minden felügyeleti hatóság elősegíti e rendeletnek az Unió egész területén történő egységes alkalmazását. A felügyeleti hatóságok e célból együttműködnek egymással és a Bizottsággal, a VII. fejezettel összhangban.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_51'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '51',
  '3',
  '(3) Ha valamely tagállamban egynél több felügyeleti hatóságot hoznak létre, az adott tagállam kijelöli azt a felügyeleti hatóságot, amelyik a Testületben ellátja a szóban forgó hatóságok képviseletét, és létrehozza az arra szolgáló mechanizmust, hogy a többi hatóság a 63. cikkben említett egységességi mechanizmusra vonatkozó szabályokat betartsa.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_51'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '51',
  '4',
  '(4) Minden tagállam 2018. május 25-ig értesíti a Bizottságot jogának azon rendelkezéseiről, amelyeket e fejezet alapján elfogad, továbbá haladéktalanul értesíti a Bizottságot az említett rendelkezéseket érintő későbbi módosításokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_51'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '52',
  null,
  'Függetlenség
(1) A felügyeleti hatóságok az e rendelet alapján rájuk ruházott feladatok elvégzése és hatáskörök gyakorlása során teljesen függetlenül járnak el.

(2) Az egyes felügyeleti hatóságok tagja vagy tagjai az e rendelettel összhangban rájuk ruházott feladatok végzése és hatáskörök gyakorlása során bármilyen – közvetlen vagy közvetett – külső befolyástól mentesen járnak el, és utasítást senkitől sem kérhetnek vagy fogadhatnak el.

(3) A felügyeleti hatóságok tagjai tartózkodnak a feladatkörükkel összeférhetetlen cselekményektől, valamint hivatali idejük alatt sem javadalmazás ellenében, sem anélkül nem vállalhatnak azzal összeférhetetlen szakmai tevékenységet.

(4) A tagállamok biztosítják, hogy mindegyik felügyeleti hatóság rendelkezésére áll a feladataik és hatásköreik – ideértve a kölcsönös segítségnyújtást, az együttműködést és a Testületben való részvételt – eredményes ellátásához, illetve gyakorlásához szükséges emberi, műszaki és pénzügyi források, helyiségek és infrastruktúra.

(5) A tagállamok biztosítják, hogy mindegyik felügyeleti hatóság saját személyzettel rendelkezik és maga választja ki azt, amely a felügyeleti hatóság tagjának vagy tagjainak kizárólagos irányítása alá tartozik.

(6) A tagállamok biztosítják, hogy mindegyik felügyeleti hatóság a függetlenségét nem befolyásoló pénzügyi ellenőrzés alá tartozik. A tagállamok biztosítják, hogy mindegyik felügyeleti hatóság saját, nyilvános, éves költségvetéssel rendelkezik, amely az állami vagy nemzeti költségvetés részét képezheti.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '52',
  '1',
  '(1) A felügyeleti hatóságok az e rendelet alapján rájuk ruházott feladatok elvégzése és hatáskörök gyakorlása során teljesen függetlenül járnak el.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '52',
  '2',
  '(2) Az egyes felügyeleti hatóságok tagja vagy tagjai az e rendelettel összhangban rájuk ruházott feladatok végzése és hatáskörök gyakorlása során bármilyen – közvetlen vagy közvetett – külső befolyástól mentesen járnak el, és utasítást senkitől sem kérhetnek vagy fogadhatnak el.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '52',
  '3',
  '(3) A felügyeleti hatóságok tagjai tartózkodnak a feladatkörükkel összeférhetetlen cselekményektől, valamint hivatali idejük alatt sem javadalmazás ellenében, sem anélkül nem vállalhatnak azzal összeférhetetlen szakmai tevékenységet.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '52',
  '4',
  '(4) A tagállamok biztosítják, hogy mindegyik felügyeleti hatóság rendelkezésére áll a feladataik és hatásköreik – ideértve a kölcsönös segítségnyújtást, az együttműködést és a Testületben való részvételt – eredményes ellátásához, illetve gyakorlásához szükséges emberi, műszaki és pénzügyi források, helyiségek és infrastruktúra.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '52',
  '5',
  '(5) A tagállamok biztosítják, hogy mindegyik felügyeleti hatóság saját személyzettel rendelkezik és maga választja ki azt, amely a felügyeleti hatóság tagjának vagy tagjainak kizárólagos irányítása alá tartozik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '52',
  '6',
  '(6) A tagállamok biztosítják, hogy mindegyik felügyeleti hatóság a függetlenségét nem befolyásoló pénzügyi ellenőrzés alá tartozik. A tagállamok biztosítják, hogy mindegyik felügyeleti hatóság saját, nyilvános, éves költségvetéssel rendelkezik, amely az állami vagy nemzeti költségvetés részét képezheti.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '53',
  null,
  'A felügyeleti hatóság tagjaira vonatkozó általános feltételek
(1) A tagállamok előírják, hogy a felügyeleti hatóságaik minden tagját átlátható eljárás keretében nevezze ki az alábbiak egyike:

—

a parlamentjük;

—

a kormányuk;

—

az államfőjük vagy

—

a tagállami jog alapján a kinevezéssel megbízott független szerv.

(2) A felügyeleti hatóságok tagja rendelkezik feladatai ellátásához és hatásköre gyakorlásához szükséges képesítéssel, tapasztalattal és készségekkel, különösen a személyes adatok védelme területén.

(3) A tagok feladatköre a hivatali idő lejártával, lemondással vagy kötelező nyugdíjazással szűnik meg, az érintett tagállam jogában előírtaknak megfelelően.

(4) Tag felmentésére kizárólag súlyos kötelességszegés esetén vagy abban az esetben kerülhet sor, ha a tag már nem felel meg a feladatai ellátásához szükséges feltételeknek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '53',
  '1',
  '(1) A tagállamok előírják, hogy a felügyeleti hatóságaik minden tagját átlátható eljárás keretében nevezze ki az alábbiak egyike:

—

a parlamentjük;

—

a kormányuk;

—

az államfőjük vagy

—

a tagállami jog alapján a kinevezéssel megbízott független szerv.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '53',
  '2',
  '(2) A felügyeleti hatóságok tagja rendelkezik feladatai ellátásához és hatásköre gyakorlásához szükséges képesítéssel, tapasztalattal és készségekkel, különösen a személyes adatok védelme területén.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '53',
  '3',
  '(3) A tagok feladatköre a hivatali idő lejártával, lemondással vagy kötelező nyugdíjazással szűnik meg, az érintett tagállam jogában előírtaknak megfelelően.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '53',
  '4',
  '(4) Tag felmentésére kizárólag súlyos kötelességszegés esetén vagy abban az esetben kerülhet sor, ha a tag már nem felel meg a feladatai ellátásához szükséges feltételeknek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '54',
  null,
  'A felügyeleti hatóság létrehozására vonatkozó szabályok
(1) A tagállamok jogszabályban rendelkeznek:

a)

minden egyes felügyeleti hatóság létrehozásáról;

b)

az egyes felügyeleti hatóságok tagjává való kinevezéshez szükséges képesítésekről és pályázati feltételekről;

c)

az egyes felügyeleti hatóságok tagjának vagy tagjainak kinevezésére vonatkozó szabályokról és eljárásokról;

d)

az egyes felügyeleti hatóságok tagja vagy tagjai megbízatásának időtartamáról, amelynek legalább négy évre kell szólnia, kivéve a 2016. május 24-ét követő első kinevezést, amely rövidebb időtartamra is szólhat, ha a felügyeleti hatóság függetlenségének megőrzése érdekében a kinevezéseket több lépcsőben kell végrehajtani;

e)

arról, hogy az egyes felügyeleti hatóságok tagja vagy tagjai újra kinevezhetők-e, és ha igen, hány ciklusra; és

f)

az egyes felügyeleti hatóságok tagjának vagy tagjainak, valamint személyzetének kötelezettségeire vonatkozó feltételekről, a hivatali idő alatt és azt követően az alkalmazással összeférhetetlen cselekményekről, szakmai tevékenységre és juttatásokra vonatkozó tiltó rendelkezésekről, valamint az alkalmazás megszűnésére vonatkozó szabályokról.

(2) Az uniós vagy tagállami jognak megfelelően mindegyik felügyeleti hatóság tagját vagy tagjait és személyzetét a feladataik ellátása és hatáskörük gyakorlása során tudomásukra jutott bármely bizalmas információ tekintetében hivatali idejük alatt és annak lejártát követően is szakmai titoktartási kötelezettség terheli. Hivatali idejük alatt ez a szakmai titoktartási kötelezettség különösen vonatkozik a természetes személyek által e rendelet megsértését illetően tett bejelentésekre.

2. szakasz

Illetékesség, feladatok és hatáskörök',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '54',
  '1',
  '(1) A tagállamok jogszabályban rendelkeznek:

a)

minden egyes felügyeleti hatóság létrehozásáról;

b)

az egyes felügyeleti hatóságok tagjává való kinevezéshez szükséges képesítésekről és pályázati feltételekről;

c)

az egyes felügyeleti hatóságok tagjának vagy tagjainak kinevezésére vonatkozó szabályokról és eljárásokról;

d)

az egyes felügyeleti hatóságok tagja vagy tagjai megbízatásának időtartamáról, amelynek legalább négy évre kell szólnia, kivéve a 2016. május 24-ét követő első kinevezést, amely rövidebb időtartamra is szólhat, ha a felügyeleti hatóság függetlenségének megőrzése érdekében a kinevezéseket több lépcsőben kell végrehajtani;

e)

arról, hogy az egyes felügyeleti hatóságok tagja vagy tagjai újra kinevezhetők-e, és ha igen, hány ciklusra; és

f)

az egyes felügyeleti hatóságok tagjának vagy tagjainak, valamint személyzetének kötelezettségeire vonatkozó feltételekről, a hivatali idő alatt és azt követően az alkalmazással összeférhetetlen cselekményekről, szakmai tevékenységre és juttatásokra vonatkozó tiltó rendelkezésekről, valamint az alkalmazás megszűnésére vonatkozó szabályokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '54',
  '1(a)',
  'a) minden egyes felügyeleti hatóság létrehozásáról;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '54',
  '1(b)',
  'b) az egyes felügyeleti hatóságok tagjává való kinevezéshez szükséges képesítésekről és pályázati feltételekről;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '54',
  '1(c)',
  'c) az egyes felügyeleti hatóságok tagjának vagy tagjainak kinevezésére vonatkozó szabályokról és eljárásokról;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '54',
  '1(d)',
  'd) az egyes felügyeleti hatóságok tagja vagy tagjai megbízatásának időtartamáról, amelynek legalább négy évre kell szólnia, kivéve a 2016. május 24-ét követő első kinevezést, amely rövidebb időtartamra is szólhat, ha a felügyeleti hatóság függetlenségének megőrzése érdekében a kinevezéseket több lépcsőben kell végrehajtani;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '54',
  '1(e)',
  'e) arról, hogy az egyes felügyeleti hatóságok tagja vagy tagjai újra kinevezhetők-e, és ha igen, hány ciklusra; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '54',
  '1(f)',
  'f) az egyes felügyeleti hatóságok tagjának vagy tagjainak, valamint személyzetének kötelezettségeire vonatkozó feltételekről, a hivatali idő alatt és azt követően az alkalmazással összeférhetetlen cselekményekről, szakmai tevékenységre és juttatásokra vonatkozó tiltó rendelkezésekről, valamint az alkalmazás megszűnésére vonatkozó szabályokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '54',
  '2',
  '(2) Az uniós vagy tagállami jognak megfelelően mindegyik felügyeleti hatóság tagját vagy tagjait és személyzetét a feladataik ellátása és hatáskörük gyakorlása során tudomásukra jutott bármely bizalmas információ tekintetében hivatali idejük alatt és annak lejártát követően is szakmai titoktartási kötelezettség terheli. Hivatali idejük alatt ez a szakmai titoktartási kötelezettség különösen vonatkozik a természetes személyek által e rendelet megsértését illetően tett bejelentésekre.

2. szakasz

Illetékesség, feladatok és hatáskörök',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '55',
  null,
  'Illetékesség
(1) A felügyeleti hatóság a saját tagállamának területén illetékes az e rendelet alapján ráruházott feladatok végzésére és hatáskörök gyakorlására.

(2) Ha az adatkezelést a 6. cikk (1) bekezdésének c) vagy e) pontja alapján eljáró közhatalmi szervek vagy magánfél szervezetek végzik, az érintett tagállam felügyeleti hatósága az illetékes. Ezekben az esetekben az 56. cikk nem alkalmazandó.

(3) A felügyeleti hatóságok hatásköre nem terjed ki a bíróságok által igazságügyi feladataik ellátása során végzett adatkezelési műveletek felügyeletére.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_55'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '55',
  '1',
  '(1) A felügyeleti hatóság a saját tagállamának területén illetékes az e rendelet alapján ráruházott feladatok végzésére és hatáskörök gyakorlására.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_55'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '55',
  '2',
  '(2) Ha az adatkezelést a 6. cikk (1) bekezdésének c) vagy e) pontja alapján eljáró közhatalmi szervek vagy magánfél szervezetek végzik, az érintett tagállam felügyeleti hatósága az illetékes. Ezekben az esetekben az 56. cikk nem alkalmazandó.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_55'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '55',
  '3',
  '(3) A felügyeleti hatóságok hatásköre nem terjed ki a bíróságok által igazságügyi feladataik ellátása során végzett adatkezelési műveletek felügyeletére.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_55'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '56',
  null,
  'A fő felügyeleti hatóság illetékessége
(1) Az 55. cikk sérelme nélkül, az adatkezelő vagy az adatfeldolgozó tevékenységi központja vagy egyetlen tevékenységi helye szerinti felügyeleti hatóság jogosult fő felügyeleti hatóságként eljárni az említett adatkezelő vagy az adatfeldolgozó által végzett határokon átnyúló adatkezelés tekintetében, a 60. cikk szerinti eljárással összhangban.

(2) Az (1) bekezdéstől eltérve, minden felügyeleti hatóság jogosult a hozzá benyújtott panaszok kezelésére, illetve jogosult e rendelet esetleges megsértése esetén eljárni, ha az ügy tárgya kizárólag egy, a tagállamában található tevékenységi helyet érint, vagy ha kizárólag a tagállamában érint jelentős mértékben érintetteket.

(3) Az e cikk (2) bekezdésében említett esetekben a felügyeleti hatóság haladéktalanul tájékoztatja az ügyről a fő felügyeleti hatóságot. A fő felügyeleti hatóság a tájékoztatását követő három héten belül dönt arról, hogy a 60. cikkben foglalt eljárással összhangban eljár-e az ügyben, figyelembe véve azt, hogy az adatkezelő vagy az adatfeldolgozó rendelkezik-e tevékenységi hellyel abban a tagállamban, amelynek a felügyeleti hatósága a fő felügyeleti hatóságot tájékoztatta.

(4) Ha a fő felügyeleti hatóság úgy határoz, hogy eljár az ügyben, a 60. cikkben meghatározott eljárást kell alkalmazni. A fő felügyeleti hatóságot tájékoztató felügyeleti hatóság döntéstervezetet nyújthat be a fő felügyeleti hatóságnak. A fő felügyeleti hatóság a 60. cikk (3) bekezdésében említett döntéstervezet elkészítése során a lehető legnagyobb mértékben figyelembe veszi az említett tervezetet.

(5) Abban az esetben, ha a fő felügyeleti hatóság úgy határoz, hogy nem jár el az ügyben, a fő felügyeleti hatóságot tájékoztató felügyeleti hatóság jár el a 61. és a 62. cikknek megfelelően.

(6) A fő felügyeleti hatóság az adatkezelő vagy adatfeldolgozó egyetlen kapcsolattartója az általuk végzett, határokon átnyúló adatkezeléssel kapcsolatban.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '56',
  '1',
  '(1) Az 55. cikk sérelme nélkül, az adatkezelő vagy az adatfeldolgozó tevékenységi központja vagy egyetlen tevékenységi helye szerinti felügyeleti hatóság jogosult fő felügyeleti hatóságként eljárni az említett adatkezelő vagy az adatfeldolgozó által végzett határokon átnyúló adatkezelés tekintetében, a 60. cikk szerinti eljárással összhangban.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '56',
  '2',
  '(2) Az (1) bekezdéstől eltérve, minden felügyeleti hatóság jogosult a hozzá benyújtott panaszok kezelésére, illetve jogosult e rendelet esetleges megsértése esetén eljárni, ha az ügy tárgya kizárólag egy, a tagállamában található tevékenységi helyet érint, vagy ha kizárólag a tagállamában érint jelentős mértékben érintetteket.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '56',
  '3',
  '(3) Az e cikk (2) bekezdésében említett esetekben a felügyeleti hatóság haladéktalanul tájékoztatja az ügyről a fő felügyeleti hatóságot. A fő felügyeleti hatóság a tájékoztatását követő három héten belül dönt arról, hogy a 60. cikkben foglalt eljárással összhangban eljár-e az ügyben, figyelembe véve azt, hogy az adatkezelő vagy az adatfeldolgozó rendelkezik-e tevékenységi hellyel abban a tagállamban, amelynek a felügyeleti hatósága a fő felügyeleti hatóságot tájékoztatta.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '56',
  '4',
  '(4) Ha a fő felügyeleti hatóság úgy határoz, hogy eljár az ügyben, a 60. cikkben meghatározott eljárást kell alkalmazni. A fő felügyeleti hatóságot tájékoztató felügyeleti hatóság döntéstervezetet nyújthat be a fő felügyeleti hatóságnak. A fő felügyeleti hatóság a 60. cikk (3) bekezdésében említett döntéstervezet elkészítése során a lehető legnagyobb mértékben figyelembe veszi az említett tervezetet.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '56',
  '5',
  '(5) Abban az esetben, ha a fő felügyeleti hatóság úgy határoz, hogy nem jár el az ügyben, a fő felügyeleti hatóságot tájékoztató felügyeleti hatóság jár el a 61. és a 62. cikknek megfelelően.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '56',
  '6',
  '(6) A fő felügyeleti hatóság az adatkezelő vagy adatfeldolgozó egyetlen kapcsolattartója az általuk végzett, határokon átnyúló adatkezeléssel kapcsolatban.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  null,
  'Feladatok
(1) Az e rendeletben meghatározott egyéb feladatok sérelme nélkül, a felügyeleti hatóság a saját területén ellátja a következő feladatokat:

a)

nyomon követi és kikényszeríti e rendelet alkalmazását;

b)

elősegíti a nyilvánosság figyelmének felkeltését és az ismeretek terjesztését a személyes adatok kezelésével összefüggő kockázatok, szabályok, garanciák és jogok vonatkozásában. Különös figyelmet fordít a kifejezetten gyermekekre irányuló tevékenységekre;

c)

a tagállami joggal összhangban tanácsot ad a nemzeti parlamentnek, a kormánynak és más intézményeknek és szerveknek a természetes személyek jogainak és szabadságainak a személyes adataik kezelése tekintetében történő védelmével kapcsolatos jogalkotási és közigazgatási intézkedésekről;

d)

felhívja az adatkezelők és az adatfeldolgozók figyelmét az e rendelet szerinti kötelezettségeikre;

e)

kérésre tájékoztatást ad bármely érintettnek az e rendelet alapján őt megillető jogok gyakorlásával kapcsolatban, és e célból adott esetben együttműködik más tagállamok felügyeleti hatóságaival;

f)

kezeli az érintett vagy valamely szerv, szervezet vagy egyesület által a 80. cikkel összhangban benyújtott panaszokat, a panasz tárgyát a szükséges mértékben kivizsgálja, továbbá észszerű határidőn belül tájékoztatja a panaszost a vizsgálattal kapcsolatos fejleményekről és eredményekről, különösen, ha további vizsgálat vagy egy másik felügyeleti hatósággal való együttműködés válik szükségessé;

g)

együttműködik más felügyeleti hatóságokkal, ideértve az információcserét és a kölcsönös segítségnyújtást is, e rendelet egységes alkalmazásának és érvényesítésének biztosítása érdekében;

h)

vizsgálatot folytat e rendelet alkalmazásával kapcsolatban, akár más felügyeleti hatóságtól vagy más közhatalmi szervtől kapott információ alapján;

i)

figyelemmel kíséri a személyes adatok védelmére kiható jelentősebb fejleményeket, különösen az információs és kommunikációs technológiák, valamint a kereskedelmi gyakorlatok fejlődését;

j)

megállapítja a 28. cikk (8) bekezdésében és a 46. cikk (2) bekezdésének d) pontjában említett általános szerződési feltételeket;

k)

a 35. cikk (4) bekezdésének megfelelően jegyzéket állít össze és az adatvédelmi hatásvizsgálatra vonatkozó kötelezettséggel kapcsolatban vezeti azt;

l)

tanácsot ad a 36. cikk (2) bekezdésében említett adatkezelési műveletekkel kapcsolatban;

m)

ösztönzi a 40. cikk (1) bekezdése szerinti magatartási kódex kidolgozását, valamint a 40. cikk (5) bekezdésével összhangban véleményezi, illetve jóváhagyja a megfelelő garanciákat kínáló ilyen magatartási kódexeket;

n)

ösztönzi a 42. cikk (1) bekezdése szerinti az adatvédelmi tanúsítási mechanizmusok, valamint adatvédelmi bélyegzők, illetve jelölések létrehozását, és a 42. cikk (5) bekezdésének megfelelően jóváhagyja a tanúsítási szempontokat;

o)

adott esetben rendszeres időközönként felülvizsgálja a 42. cikk (7) bekezdésének megfelelően kiadott tanúsítványokat;

p)

meghatározza és közzéteszi a magatartási kódexnek való megfelelést ellenőrző 41. cikk szerinti szervezet és a 43. cikk szerinti tanúsító szervezet akkreditációjára vonatkozó szempontokat;

q)

elvégzi a magatartási kódexnek való megfelelést ellenőrző, a 41. cikk szerinti szervezet és a 43. cikk szerinti tanúsító szervezet akkreditációját;

r)

engedélyezi a 46. cikk (3) bekezdésében említett szerződéses feltételeket és rendelkezéseket;

s)

jóváhagyja a 47. cikk szerinti kötelező erejű vállalati szabályokat;

t)

hozzájárul a Testület tevékenységeihez;

u)

belső nyilvántartást vezet e rendelet megsértéséről és az 58. cikk (2) bekezdése szerint meghozott intézkedésekről; és

v)

a személyes adatok védelméhez kapcsolódó minden más feladatot ellát.

(2) A felügyeleti hatóság megkönnyíti az (1) bekezdés f) pontjában említett panasz benyújtását például olyan intézkedésekkel, hogy elektronikus úton is kitölthető panasz benyújtására szolgáló formanyomtatványt hoz létre, nem zárva ki azonban más kommunikációs eszközök alkalmazását sem.

(3) A felügyeleti hatóság úgy látja el feladatait, hogy az az érintett és adott esetben az adatvédelmi tisztviselő számára térítésmentes legyen.

(4) Ha a kérelmek egyértelműen megalapozatlanok vagy – különösen ismétlődő jellegük miatt – túlzók, a felügyeleti hatóság észszerű, az adminisztratív költségeken alapuló díjat számíthat fel, vagy megtagadhatja, hogy eljárjon a kérelemmel kapcsolatban. Annak bizonyítása, hogy a kérelem egyértelműen megalapozatlan vagy túlzó, a felügyeleti hatóságot terheli.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1',
  '(1) Az e rendeletben meghatározott egyéb feladatok sérelme nélkül, a felügyeleti hatóság a saját területén ellátja a következő feladatokat:

a)

nyomon követi és kikényszeríti e rendelet alkalmazását;

b)

elősegíti a nyilvánosság figyelmének felkeltését és az ismeretek terjesztését a személyes adatok kezelésével összefüggő kockázatok, szabályok, garanciák és jogok vonatkozásában. Különös figyelmet fordít a kifejezetten gyermekekre irányuló tevékenységekre;

c)

a tagállami joggal összhangban tanácsot ad a nemzeti parlamentnek, a kormánynak és más intézményeknek és szerveknek a természetes személyek jogainak és szabadságainak a személyes adataik kezelése tekintetében történő védelmével kapcsolatos jogalkotási és közigazgatási intézkedésekről;

d)

felhívja az adatkezelők és az adatfeldolgozók figyelmét az e rendelet szerinti kötelezettségeikre;

e)

kérésre tájékoztatást ad bármely érintettnek az e rendelet alapján őt megillető jogok gyakorlásával kapcsolatban, és e célból adott esetben együttműködik más tagállamok felügyeleti hatóságaival;

f)

kezeli az érintett vagy valamely szerv, szervezet vagy egyesület által a 80. cikkel összhangban benyújtott panaszokat, a panasz tárgyát a szükséges mértékben kivizsgálja, továbbá észszerű határidőn belül tájékoztatja a panaszost a vizsgálattal kapcsolatos fejleményekről és eredményekről, különösen, ha további vizsgálat vagy egy másik felügyeleti hatósággal való együttműködés válik szükségessé;

g)

együttműködik más felügyeleti hatóságokkal, ideértve az információcserét és a kölcsönös segítségnyújtást is, e rendelet egységes alkalmazásának és érvényesítésének biztosítása érdekében;

h)

vizsgálatot folytat e rendelet alkalmazásával kapcsolatban, akár más felügyeleti hatóságtól vagy más közhatalmi szervtől kapott információ alapján;

i)

figyelemmel kíséri a személyes adatok védelmére kiható jelentősebb fejleményeket, különösen az információs és kommunikációs technológiák, valamint a kereskedelmi gyakorlatok fejlődését;

j)

megállapítja a 28. cikk (8) bekezdésében és a 46. cikk (2) bekezdésének d) pontjában említett általános szerződési feltételeket;

k)

a 35. cikk (4) bekezdésének megfelelően jegyzéket állít össze és az adatvédelmi hatásvizsgálatra vonatkozó kötelezettséggel kapcsolatban vezeti azt;

l)

tanácsot ad a 36. cikk (2) bekezdésében említett adatkezelési műveletekkel kapcsolatban;

m)

ösztönzi a 40. cikk (1) bekezdése szerinti magatartási kódex kidolgozását, valamint a 40. cikk (5) bekezdésével összhangban véleményezi, illetve jóváhagyja a megfelelő garanciákat kínáló ilyen magatartási kódexeket;

n)

ösztönzi a 42. cikk (1) bekezdése szerinti az adatvédelmi tanúsítási mechanizmusok, valamint adatvédelmi bélyegzők, illetve jelölések létrehozását, és a 42. cikk (5) bekezdésének megfelelően jóváhagyja a tanúsítási szempontokat;

o)

adott esetben rendszeres időközönként felülvizsgálja a 42. cikk (7) bekezdésének megfelelően kiadott tanúsítványokat;

p)

meghatározza és közzéteszi a magatartási kódexnek való megfelelést ellenőrző 41. cikk szerinti szervezet és a 43. cikk szerinti tanúsító szervezet akkreditációjára vonatkozó szempontokat;

q)

elvégzi a magatartási kódexnek való megfelelést ellenőrző, a 41. cikk szerinti szervezet és a 43. cikk szerinti tanúsító szervezet akkreditációját;

r)

engedélyezi a 46. cikk (3) bekezdésében említett szerződéses feltételeket és rendelkezéseket;

s)

jóváhagyja a 47. cikk szerinti kötelező erejű vállalati szabályokat;

t)

hozzájárul a Testület tevékenységeihez;

u)

belső nyilvántartást vezet e rendelet megsértéséről és az 58. cikk (2) bekezdése szerint meghozott intézkedésekről; és

v)

a személyes adatok védelméhez kapcsolódó minden más feladatot ellát.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(a)',
  'a) nyomon követi és kikényszeríti e rendelet alkalmazását;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(b)',
  'b) elősegíti a nyilvánosság figyelmének felkeltését és az ismeretek terjesztését a személyes adatok kezelésével összefüggő kockázatok, szabályok, garanciák és jogok vonatkozásában. Különös figyelmet fordít a kifejezetten gyermekekre irányuló tevékenységekre;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(c)',
  'c) a tagállami joggal összhangban tanácsot ad a nemzeti parlamentnek, a kormánynak és más intézményeknek és szerveknek a természetes személyek jogainak és szabadságainak a személyes adataik kezelése tekintetében történő védelmével kapcsolatos jogalkotási és közigazgatási intézkedésekről;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(d)',
  'd) felhívja az adatkezelők és az adatfeldolgozók figyelmét az e rendelet szerinti kötelezettségeikre;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(e)',
  'e) kérésre tájékoztatást ad bármely érintettnek az e rendelet alapján őt megillető jogok gyakorlásával kapcsolatban, és e célból adott esetben együttműködik más tagállamok felügyeleti hatóságaival;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(f)',
  'f) kezeli az érintett vagy valamely szerv, szervezet vagy egyesület által a 80. cikkel összhangban benyújtott panaszokat, a panasz tárgyát a szükséges mértékben kivizsgálja, továbbá észszerű határidőn belül tájékoztatja a panaszost a vizsgálattal kapcsolatos fejleményekről és eredményekről, különösen, ha további vizsgálat vagy egy másik felügyeleti hatósággal való együttműködés válik szükségessé;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(g)',
  'g) együttműködik más felügyeleti hatóságokkal, ideértve az információcserét és a kölcsönös segítségnyújtást is, e rendelet egységes alkalmazásának és érvényesítésének biztosítása érdekében;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(h)',
  'h) vizsgálatot folytat e rendelet alkalmazásával kapcsolatban, akár más felügyeleti hatóságtól vagy más közhatalmi szervtől kapott információ alapján;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(i)',
  'i) figyelemmel kíséri a személyes adatok védelmére kiható jelentősebb fejleményeket, különösen az információs és kommunikációs technológiák, valamint a kereskedelmi gyakorlatok fejlődését;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(j)',
  'j) megállapítja a 28. cikk (8) bekezdésében és a 46. cikk (2) bekezdésének d) pontjában említett általános szerződési feltételeket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(k)',
  'k) a 35. cikk (4) bekezdésének megfelelően jegyzéket állít össze és az adatvédelmi hatásvizsgálatra vonatkozó kötelezettséggel kapcsolatban vezeti azt;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(l)',
  'l) tanácsot ad a 36. cikk (2) bekezdésében említett adatkezelési műveletekkel kapcsolatban;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(m)',
  'm) ösztönzi a 40. cikk (1) bekezdése szerinti magatartási kódex kidolgozását, valamint a 40. cikk (5) bekezdésével összhangban véleményezi, illetve jóváhagyja a megfelelő garanciákat kínáló ilyen magatartási kódexeket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(n)',
  'n) ösztönzi a 42. cikk (1) bekezdése szerinti az adatvédelmi tanúsítási mechanizmusok, valamint adatvédelmi bélyegzők, illetve jelölések létrehozását, és a 42. cikk (5) bekezdésének megfelelően jóváhagyja a tanúsítási szempontokat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(o)',
  'o) adott esetben rendszeres időközönként felülvizsgálja a 42. cikk (7) bekezdésének megfelelően kiadott tanúsítványokat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(p)',
  'p) meghatározza és közzéteszi a magatartási kódexnek való megfelelést ellenőrző 41. cikk szerinti szervezet és a 43. cikk szerinti tanúsító szervezet akkreditációjára vonatkozó szempontokat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(q)',
  'q) elvégzi a magatartási kódexnek való megfelelést ellenőrző, a 41. cikk szerinti szervezet és a 43. cikk szerinti tanúsító szervezet akkreditációját;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(r)',
  'r) engedélyezi a 46. cikk (3) bekezdésében említett szerződéses feltételeket és rendelkezéseket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(s)',
  's) jóváhagyja a 47. cikk szerinti kötelező erejű vállalati szabályokat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(t)',
  't) hozzájárul a Testület tevékenységeihez;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(u)',
  'u) belső nyilvántartást vezet e rendelet megsértéséről és az 58. cikk (2) bekezdése szerint meghozott intézkedésekről; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '1(v)',
  'v) a személyes adatok védelméhez kapcsolódó minden más feladatot ellát.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '2',
  '(2) A felügyeleti hatóság megkönnyíti az (1) bekezdés f) pontjában említett panasz benyújtását például olyan intézkedésekkel, hogy elektronikus úton is kitölthető panasz benyújtására szolgáló formanyomtatványt hoz létre, nem zárva ki azonban más kommunikációs eszközök alkalmazását sem.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '3',
  '(3) A felügyeleti hatóság úgy látja el feladatait, hogy az az érintett és adott esetben az adatvédelmi tisztviselő számára térítésmentes legyen.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '57',
  '4',
  '(4) Ha a kérelmek egyértelműen megalapozatlanok vagy – különösen ismétlődő jellegük miatt – túlzók, a felügyeleti hatóság észszerű, az adminisztratív költségeken alapuló díjat számíthat fel, vagy megtagadhatja, hogy eljárjon a kérelemmel kapcsolatban. Annak bizonyítása, hogy a kérelem egyértelműen megalapozatlan vagy túlzó, a felügyeleti hatóságot terheli.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  null,
  'Hatáskörök
(1) A felügyeleti hatóság vizsgálati hatáskörében eljárva:

a)

utasítja az adatkezelőt és az adatfeldolgozót, illetve adott esetben az adatkezelő vagy az adatfeldolgozó képviselőjét, hogy számára a feladatai elvégzéséhez szükséges tájékoztatást megadja;

b)

vizsgálatot folytat adatvédelmi auditok formájában;

c)

elvégzi a 42. cikk (7) bekezdésének megfelelően kiadott tanúsítványok felülvizsgálatát;

d)

értesíti az adatkezelőt vagy az adatfeldolgozót e rendelet feltételezett megsértéséről;

e)

hozzáférést kap az adatkezelőtől vagy az adatfeldolgozótól a feladatainak teljesítéséhez szükséges minden személyes adathoz és minden információhoz; és

f)

az uniós vagy tagállami eljárásjoggal összhangban hozzáférést kap az adatkezelő vagy az adatfeldolgozó bármely helyiségéhez, ideértve minden adatkezeléshez használt felszerelést és eszközt.

(2) A felügyeleti hatóság korrekciós hatáskörében eljárva:

a)

figyelmezteti az adatkezelőt vagy az adatfeldolgozót, hogy egyes tervezett adatkezelési tevékenységei valószínűsíthetően sértik e rendelet rendelkezéseit;

b)

elmarasztalja az adatkezelőt vagy az adatfeldolgozót, ha adatkezelési tevékenysége megsértette e rendelet rendelkezéseit;

c)

utasítja az adatkezelőt vagy az adatfeldolgozót, hogy teljesítse az érintettnek az e rendelet szerinti jogai gyakorlására vonatkozó kérelmét;

d)

utasítja az adatkezelőt vagy az adatfeldolgozót, hogy adatkezelési műveleteit – adott esetben meghatározott módon és meghatározott időn belül – hozza összhangba e rendelet rendelkezéseivel;

e)

utasítja az adatkezelőt, hogy tájékoztassa az érintettet az adatvédelmi incidensről;

f)

átmenetileg vagy véglegesen korlátozza az adatkezelést, ideértve az adatkezelés megtiltását is;

g)

a 16., 17., illetve a 18. cikkben foglaltaknak megfelelően elrendeli a személyes adatok helyesbítését, vagy törlését, illetve az adatkezelés korlátozását, valamint a 17. cikk (2) bekezdésének és a 19. cikknek megfelelően elrendeli azon címzettek erről való értesítését, akikkel vagy amelyekkel a személyes adatokat közölték;

h)

visszavonja a tanúsítványt vagy utasítja a tanúsító szervezetet a 42. és a 43. cikknek megfelelően kiadott tanúsítvány visszavonására, vagy utasítja a tanúsító szervezetet, hogy ne adja ki a tanúsítványt, ha a tanúsítás feltételei nem vagy már nem teljesülnek;

i)

a 83. cikknek megfelelően közigazgatási bírságot szab ki, az adott eset körülményeitől függően az e bekezdésben említett intézkedéseken túlmenően vagy azok helyett; és

j)

elrendeli a harmadik országbeli címzett vagy nemzetközi szervezet felé irányuló adatáramlás felfüggesztését.

(3) A felügyeleti hatóság engedélyezési és tanácsadási hatáskörében eljárva:

a)

tanácsot ad az adatkezelőnek a 36. cikkben említett előzetes konzultációs eljárás keretében;

b)

saját kezdeményezésére vagy kérésre a személyes adatok védelmével kapcsolatos bármilyen kérdésben véleményt bocsát ki a nemzeti parlament, a tagállami kormány vagy a tagállami joggal összhangban más intézmények és szervek, valamint a nyilvánosság részére;

c)

engedélyezi a 36. cikk (5) bekezdése szerinti adatkezelést, ha a tagállam joga azt előzetes engedélyhez köti;

d)

a 40. cikk (5) bekezdésével összhangban véleményezi és jóváhagyja a magatartási kódexek tervezetét;

e)

akkreditálja a 43. cikk szerinti tanúsító szervezeteket;

f)

a 42. cikk (5) bekezdésével összhangban tanúsítványokat állít ki és a jóváhagyja a tanúsítási szempontokat;

g)

elfogadja a 28. cikk (8) bekezdésben és a 46. cikk (2) bekezdésének d) pontjában említett általános adatvédelmi kikötéseket

h)

engedélyezi a 46. cikk (3) bekezdésének a) pontjában említett szerződéses rendelkezéseket;

i)

engedélyezi a 46. cikk (3) bekezdésének b) pontjában említett közigazgatási megállapodásokat; és

j)

jóváhagyja a 47. cikk szerinti kötelező erejű vállalati szabályokat.

(4) Az e cikk alapján a felügyeleti hatóságra ruházott hatáskörök gyakorlására megfelelő garanciák mellett kerülhet sor, ideértve az uniós és a tagállami jogban a Chartával összhangban meghatározott hatékony bírósági jogorvoslatot és tisztességes eljárást is.

(5) A tagállamok jogszabályban előírják, hogy a felügyeleti hatóságuk hatáskörrel rendelkezik arra, hogy e rendelet megsértéséről tájékoztassa az igazságügyi hatóságokat, és adott esetben bírósági eljárást kezdeményezzen vagy abban más módon részt vegyen e rendelet rendelkezéseinek érvényre juttatása érdekében.

(6) A tagállamok jogszabályban előírhatják, hogy felügyeleti hatóságuk az (1), (2) és (3) bekezdésben említetteken kívüli hatáskörökkel is rendelkezzen. E hatáskörök gyakorlása nem hátráltathatja a VII. fejezet hatékony végrehajtását.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '1',
  '(1) A felügyeleti hatóság vizsgálati hatáskörében eljárva:

a)

utasítja az adatkezelőt és az adatfeldolgozót, illetve adott esetben az adatkezelő vagy az adatfeldolgozó képviselőjét, hogy számára a feladatai elvégzéséhez szükséges tájékoztatást megadja;

b)

vizsgálatot folytat adatvédelmi auditok formájában;

c)

elvégzi a 42. cikk (7) bekezdésének megfelelően kiadott tanúsítványok felülvizsgálatát;

d)

értesíti az adatkezelőt vagy az adatfeldolgozót e rendelet feltételezett megsértéséről;

e)

hozzáférést kap az adatkezelőtől vagy az adatfeldolgozótól a feladatainak teljesítéséhez szükséges minden személyes adathoz és minden információhoz; és

f)

az uniós vagy tagállami eljárásjoggal összhangban hozzáférést kap az adatkezelő vagy az adatfeldolgozó bármely helyiségéhez, ideértve minden adatkezeléshez használt felszerelést és eszközt.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '1(a)',
  'a) utasítja az adatkezelőt és az adatfeldolgozót, illetve adott esetben az adatkezelő vagy az adatfeldolgozó képviselőjét, hogy számára a feladatai elvégzéséhez szükséges tájékoztatást megadja;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '1(b)',
  'b) vizsgálatot folytat adatvédelmi auditok formájában;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '1(c)',
  'c) elvégzi a 42. cikk (7) bekezdésének megfelelően kiadott tanúsítványok felülvizsgálatát;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '1(d)',
  'd) értesíti az adatkezelőt vagy az adatfeldolgozót e rendelet feltételezett megsértéséről;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '1(e)',
  'e) hozzáférést kap az adatkezelőtől vagy az adatfeldolgozótól a feladatainak teljesítéséhez szükséges minden személyes adathoz és minden információhoz; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '1(f)',
  'f) az uniós vagy tagállami eljárásjoggal összhangban hozzáférést kap az adatkezelő vagy az adatfeldolgozó bármely helyiségéhez, ideértve minden adatkezeléshez használt felszerelést és eszközt.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '2',
  '(2) A felügyeleti hatóság korrekciós hatáskörében eljárva:

a)

figyelmezteti az adatkezelőt vagy az adatfeldolgozót, hogy egyes tervezett adatkezelési tevékenységei valószínűsíthetően sértik e rendelet rendelkezéseit;

b)

elmarasztalja az adatkezelőt vagy az adatfeldolgozót, ha adatkezelési tevékenysége megsértette e rendelet rendelkezéseit;

c)

utasítja az adatkezelőt vagy az adatfeldolgozót, hogy teljesítse az érintettnek az e rendelet szerinti jogai gyakorlására vonatkozó kérelmét;

d)

utasítja az adatkezelőt vagy az adatfeldolgozót, hogy adatkezelési műveleteit – adott esetben meghatározott módon és meghatározott időn belül – hozza összhangba e rendelet rendelkezéseivel;

e)

utasítja az adatkezelőt, hogy tájékoztassa az érintettet az adatvédelmi incidensről;

f)

átmenetileg vagy véglegesen korlátozza az adatkezelést, ideértve az adatkezelés megtiltását is;

g)

a 16., 17., illetve a 18. cikkben foglaltaknak megfelelően elrendeli a személyes adatok helyesbítését, vagy törlését, illetve az adatkezelés korlátozását, valamint a 17. cikk (2) bekezdésének és a 19. cikknek megfelelően elrendeli azon címzettek erről való értesítését, akikkel vagy amelyekkel a személyes adatokat közölték;

h)

visszavonja a tanúsítványt vagy utasítja a tanúsító szervezetet a 42. és a 43. cikknek megfelelően kiadott tanúsítvány visszavonására, vagy utasítja a tanúsító szervezetet, hogy ne adja ki a tanúsítványt, ha a tanúsítás feltételei nem vagy már nem teljesülnek;

i)

a 83. cikknek megfelelően közigazgatási bírságot szab ki, az adott eset körülményeitől függően az e bekezdésben említett intézkedéseken túlmenően vagy azok helyett; és

j)

elrendeli a harmadik országbeli címzett vagy nemzetközi szervezet felé irányuló adatáramlás felfüggesztését.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '2(a)',
  'a) figyelmezteti az adatkezelőt vagy az adatfeldolgozót, hogy egyes tervezett adatkezelési tevékenységei valószínűsíthetően sértik e rendelet rendelkezéseit;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '2(b)',
  'b) elmarasztalja az adatkezelőt vagy az adatfeldolgozót, ha adatkezelési tevékenysége megsértette e rendelet rendelkezéseit;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '2(c)',
  'c) utasítja az adatkezelőt vagy az adatfeldolgozót, hogy teljesítse az érintettnek az e rendelet szerinti jogai gyakorlására vonatkozó kérelmét;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '2(d)',
  'd) utasítja az adatkezelőt vagy az adatfeldolgozót, hogy adatkezelési műveleteit – adott esetben meghatározott módon és meghatározott időn belül – hozza összhangba e rendelet rendelkezéseivel;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '2(e)',
  'e) utasítja az adatkezelőt, hogy tájékoztassa az érintettet az adatvédelmi incidensről;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '2(f)',
  'f) átmenetileg vagy véglegesen korlátozza az adatkezelést, ideértve az adatkezelés megtiltását is;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '2(g)',
  'g) a 16., 17., illetve a 18. cikkben foglaltaknak megfelelően elrendeli a személyes adatok helyesbítését, vagy törlését, illetve az adatkezelés korlátozását, valamint a 17. cikk (2) bekezdésének és a 19. cikknek megfelelően elrendeli azon címzettek erről való értesítését, akikkel vagy amelyekkel a személyes adatokat közölték;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '2(h)',
  'h) visszavonja a tanúsítványt vagy utasítja a tanúsító szervezetet a 42. és a 43. cikknek megfelelően kiadott tanúsítvány visszavonására, vagy utasítja a tanúsító szervezetet, hogy ne adja ki a tanúsítványt, ha a tanúsítás feltételei nem vagy már nem teljesülnek;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '2(i)',
  'i) a 83. cikknek megfelelően közigazgatási bírságot szab ki, az adott eset körülményeitől függően az e bekezdésben említett intézkedéseken túlmenően vagy azok helyett; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '2(j)',
  'j) elrendeli a harmadik országbeli címzett vagy nemzetközi szervezet felé irányuló adatáramlás felfüggesztését.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '3',
  '(3) A felügyeleti hatóság engedélyezési és tanácsadási hatáskörében eljárva:

a)

tanácsot ad az adatkezelőnek a 36. cikkben említett előzetes konzultációs eljárás keretében;

b)

saját kezdeményezésére vagy kérésre a személyes adatok védelmével kapcsolatos bármilyen kérdésben véleményt bocsát ki a nemzeti parlament, a tagállami kormány vagy a tagállami joggal összhangban más intézmények és szervek, valamint a nyilvánosság részére;

c)

engedélyezi a 36. cikk (5) bekezdése szerinti adatkezelést, ha a tagállam joga azt előzetes engedélyhez köti;

d)

a 40. cikk (5) bekezdésével összhangban véleményezi és jóváhagyja a magatartási kódexek tervezetét;

e)

akkreditálja a 43. cikk szerinti tanúsító szervezeteket;

f)

a 42. cikk (5) bekezdésével összhangban tanúsítványokat állít ki és a jóváhagyja a tanúsítási szempontokat;

g)

elfogadja a 28. cikk (8) bekezdésben és a 46. cikk (2) bekezdésének d) pontjában említett általános adatvédelmi kikötéseket

h)

engedélyezi a 46. cikk (3) bekezdésének a) pontjában említett szerződéses rendelkezéseket;

i)

engedélyezi a 46. cikk (3) bekezdésének b) pontjában említett közigazgatási megállapodásokat; és

j)

jóváhagyja a 47. cikk szerinti kötelező erejű vállalati szabályokat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '3(a)',
  'a) tanácsot ad az adatkezelőnek a 36. cikkben említett előzetes konzultációs eljárás keretében;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '3(b)',
  'b) saját kezdeményezésére vagy kérésre a személyes adatok védelmével kapcsolatos bármilyen kérdésben véleményt bocsát ki a nemzeti parlament, a tagállami kormány vagy a tagállami joggal összhangban más intézmények és szervek, valamint a nyilvánosság részére;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '3(c)',
  'c) engedélyezi a 36. cikk (5) bekezdése szerinti adatkezelést, ha a tagállam joga azt előzetes engedélyhez köti;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '3(d)',
  'd) a 40. cikk (5) bekezdésével összhangban véleményezi és jóváhagyja a magatartási kódexek tervezetét;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '3(e)',
  'e) akkreditálja a 43. cikk szerinti tanúsító szervezeteket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '3(f)',
  'f) a 42. cikk (5) bekezdésével összhangban tanúsítványokat állít ki és a jóváhagyja a tanúsítási szempontokat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '3(g)',
  'g) elfogadja a 28. cikk (8) bekezdésben és a 46. cikk (2) bekezdésének d) pontjában említett általános adatvédelmi kikötéseket',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '3(h)',
  'h) engedélyezi a 46. cikk (3) bekezdésének a) pontjában említett szerződéses rendelkezéseket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '3(i)',
  'i) engedélyezi a 46. cikk (3) bekezdésének b) pontjában említett közigazgatási megállapodásokat; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '3(j)',
  'j) jóváhagyja a 47. cikk szerinti kötelező erejű vállalati szabályokat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '4',
  '(4) Az e cikk alapján a felügyeleti hatóságra ruházott hatáskörök gyakorlására megfelelő garanciák mellett kerülhet sor, ideértve az uniós és a tagállami jogban a Chartával összhangban meghatározott hatékony bírósági jogorvoslatot és tisztességes eljárást is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '5',
  '(5) A tagállamok jogszabályban előírják, hogy a felügyeleti hatóságuk hatáskörrel rendelkezik arra, hogy e rendelet megsértéséről tájékoztassa az igazságügyi hatóságokat, és adott esetben bírósági eljárást kezdeményezzen vagy abban más módon részt vegyen e rendelet rendelkezéseinek érvényre juttatása érdekében.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '58',
  '6',
  '(6) A tagállamok jogszabályban előírhatják, hogy felügyeleti hatóságuk az (1), (2) és (3) bekezdésben említetteken kívüli hatáskörökkel is rendelkezzen. E hatáskörök gyakorlása nem hátráltathatja a VII. fejezet hatékony végrehajtását.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '59',
  null,
  'Tevékenységi jelentés
A felügyeleti hatóság éves jelentést készít a tevékenységeiről, amely tartalmazhatja a bejelentett jogsértések típusainak és az 58. cikk (2) bekezdésével összhangban tett intézkedések fajtáit is. A jelentést a nemzeti parlamentnek, a kormánynak és a tagállami jogban megjelölt más hatóságoknak kell benyújtani. A jelentéseket elérhetővé kell tenni a nyilvánosság, a Bizottság és a Testület számára.

VII. FEJEZET

Együttműködés és egységesség

1. szakasz

Együttműködés',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  null,
  'Együttműködés a fő felügyeleti hatóság és a többi érintett felügyeleti hatóság között
(1) A fő felügyeleti hatóság e cikknek megfelelően, konszenzusra törekedve együttműködik a többi érintett felügyeleti hatósággal. A fő felügyeleti hatóság és az érintett felügyeleti hatóságok minden releváns információt kicserélnek egymással.

(2) A fő felügyeleti hatóság bármikor kérheti más érintett felügyeleti hatóságoktól a 61. cikk szerinti kölcsönös segítségnyújtást és végezhet a 62. cikk szerinti közös műveleteket, különösen olyan vizsgálatok lefolytatása vagy olyan intézkedések végrehajtásának nyomon követése céljából, amelyek valamely másik tagállamban tevékenységi hellyel rendelkező adatkezelővel, illetve adatfeldolgozóval kapcsolatosak.

(3) A fő felügyeleti hatóság késedelem nélkül közli a többi érintett felügyeleti hatósággal az üggyel kapcsolatos releváns információkat. A döntés tervezetét haladéktalanul benyújtja a többi érintett felügyeleti hatóságnak, hogy azok véleményezhessék, és véleményüket kellően figyelembe veszi.

(4) Ha a többi érintett felügyeleti hatóság valamelyike az e cikk (3) bekezdése szerinti konzultációt követő négy héten belül releváns és megalapozott kifogást emel a döntéstervezettel szemben, a fő felügyeleti hatóság, ha nem ért egyet a releváns és megalapozott kifogással, vagy azt nem találja relevánsnak vagy megalapozottnak, az ügyet a 63. cikkben említett, egységességi mechanizmus keretében kezeli.

(5) Ha a fő felügyeleti hatóság helyt kíván adni a releváns és megalapozott kifogásnak, módosított döntéstervezetet nyújt be a többi érintett felügyeleti hatóságnak, hogy azok véleményezhessék. A módosított döntéstervezet tekintetében két héten belül kell lefolytatni a (4) bekezdésben említett eljárást.

(6) Ha a (4), illetve az (5) bekezdésben említett határidőn belül a többi érintett felügyeleti hatóság egyike sem emel kifogást a fő felügyeleti hatóság által benyújtott döntéstervezettel szemben, úgy kell tekinteni, hogy a fő felügyeleti hatóság és az érintett felügyeleti hatóságok egyetértenek a döntéstervezettel és az rájuk nézve kötelező.

(7) A fő felügyeleti hatóság elfogadja a döntését és közli azt az adatkezelő, vagy adott esetben az adatfeldolgozó tevékenységi központjával vagy egyetlen tevékenységi helyével, továbbá a releváns tények és indokok összefoglalásával tájékoztatja a szóban forgó döntésről a többi érintett felügyeleti hatóságot és a Testületet. Az a felügyeleti hatóság, amelyhez a panaszt benyújtották, tájékoztatja a panaszost a döntésről.

(8) Amennyiben a panaszt visszautasították vagy elutasították, a (7) bekezdéstől eltérve az a felügyeleti hatóság fogadja el a döntést, közli a panaszosal, és tájékoztatja az adatkezelőt, amelyhez a panaszt benyújtották.

(9) Ha a fő felügyeleti hatóság és az érintett felügyeleti hatóságok egyetértenek abban, hogy a panasz egyes részeit visszautasítják vagy elutasítják, más részeivel kapcsolatban viszont eljárnak, külön döntést fogadnak el az ügy minden ilyen részére vonatkozóan. Az adatkezelővel kapcsolatos intézkedéseket érintő részre vonatkozó döntést a fő felügyeleti hatóság fogadja el, és közli az adatkezelőnek, illetve az adatfeldolgozónak a hatóság tagállama területén lévő tevékenységi központjával vagy egyetlen tevékenységi helyével, valamint tájékoztatja a panaszost; a panasz visszautasított vagy elutasított részére vonatkozó döntést a panaszos felügyeleti hatósága fogadja el, és közli a panaszossal, valamint tájékoztatja az adatkezelőt vagy az adatfeldolgozót.

(10) Az adatkezelő, illetve az adatfeldolgozó, miután a (7) vagy a (9) bekezdésnek megfelelően közölték vele a fő felügyeleti hatóság döntését, megteszi a szükséges intézkedéseket annak érdekében, hogy az adatkezelési tevékenységek az Unióban lévő minden tevékenységi helyén megfeleljenek a döntésben foglaltaknak. Az adatkezelő, illetve az adatfeldolgozó közli a fő felügyeleti hatósággal a döntésnek való megfelelés érdekében tett intézkedéseket, ezt követően a fő felügyeleti hatóság tájékoztatja a többi érintett felügyeleti hatóságot.

(11) Ha egy érintett felügyeleti hatóság rendkívüli körülmények fennállása esetén megalapozottan úgy véli, hogy az érintettek érdekeinek védelme érdekében sürgős fellépésre van szükség, a 66. cikkben említett sürgősségi eljárást kell alkalmazni.

(12) A fő felügyeleti hatóság és a többi érintett felügyeleti hatóság elektronikus úton, egységes formátum alkalmazásával továbbítja egymásnak az e cikkben előírt információkat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  '1',
  '(1) A fő felügyeleti hatóság e cikknek megfelelően, konszenzusra törekedve együttműködik a többi érintett felügyeleti hatósággal. A fő felügyeleti hatóság és az érintett felügyeleti hatóságok minden releváns információt kicserélnek egymással.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  '2',
  '(2) A fő felügyeleti hatóság bármikor kérheti más érintett felügyeleti hatóságoktól a 61. cikk szerinti kölcsönös segítségnyújtást és végezhet a 62. cikk szerinti közös műveleteket, különösen olyan vizsgálatok lefolytatása vagy olyan intézkedések végrehajtásának nyomon követése céljából, amelyek valamely másik tagállamban tevékenységi hellyel rendelkező adatkezelővel, illetve adatfeldolgozóval kapcsolatosak.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  '3',
  '(3) A fő felügyeleti hatóság késedelem nélkül közli a többi érintett felügyeleti hatósággal az üggyel kapcsolatos releváns információkat. A döntés tervezetét haladéktalanul benyújtja a többi érintett felügyeleti hatóságnak, hogy azok véleményezhessék, és véleményüket kellően figyelembe veszi.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  '4',
  '(4) Ha a többi érintett felügyeleti hatóság valamelyike az e cikk (3) bekezdése szerinti konzultációt követő négy héten belül releváns és megalapozott kifogást emel a döntéstervezettel szemben, a fő felügyeleti hatóság, ha nem ért egyet a releváns és megalapozott kifogással, vagy azt nem találja relevánsnak vagy megalapozottnak, az ügyet a 63. cikkben említett, egységességi mechanizmus keretében kezeli.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  '5',
  '(5) Ha a fő felügyeleti hatóság helyt kíván adni a releváns és megalapozott kifogásnak, módosított döntéstervezetet nyújt be a többi érintett felügyeleti hatóságnak, hogy azok véleményezhessék. A módosított döntéstervezet tekintetében két héten belül kell lefolytatni a (4) bekezdésben említett eljárást.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  '6',
  '(6) Ha a (4), illetve az (5) bekezdésben említett határidőn belül a többi érintett felügyeleti hatóság egyike sem emel kifogást a fő felügyeleti hatóság által benyújtott döntéstervezettel szemben, úgy kell tekinteni, hogy a fő felügyeleti hatóság és az érintett felügyeleti hatóságok egyetértenek a döntéstervezettel és az rájuk nézve kötelező.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  '7',
  '(7) A fő felügyeleti hatóság elfogadja a döntését és közli azt az adatkezelő, vagy adott esetben az adatfeldolgozó tevékenységi központjával vagy egyetlen tevékenységi helyével, továbbá a releváns tények és indokok összefoglalásával tájékoztatja a szóban forgó döntésről a többi érintett felügyeleti hatóságot és a Testületet. Az a felügyeleti hatóság, amelyhez a panaszt benyújtották, tájékoztatja a panaszost a döntésről.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  '8',
  '(8) Amennyiben a panaszt visszautasították vagy elutasították, a (7) bekezdéstől eltérve az a felügyeleti hatóság fogadja el a döntést, közli a panaszosal, és tájékoztatja az adatkezelőt, amelyhez a panaszt benyújtották.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  '9',
  '(9) Ha a fő felügyeleti hatóság és az érintett felügyeleti hatóságok egyetértenek abban, hogy a panasz egyes részeit visszautasítják vagy elutasítják, más részeivel kapcsolatban viszont eljárnak, külön döntést fogadnak el az ügy minden ilyen részére vonatkozóan. Az adatkezelővel kapcsolatos intézkedéseket érintő részre vonatkozó döntést a fő felügyeleti hatóság fogadja el, és közli az adatkezelőnek, illetve az adatfeldolgozónak a hatóság tagállama területén lévő tevékenységi központjával vagy egyetlen tevékenységi helyével, valamint tájékoztatja a panaszost; a panasz visszautasított vagy elutasított részére vonatkozó döntést a panaszos felügyeleti hatósága fogadja el, és közli a panaszossal, valamint tájékoztatja az adatkezelőt vagy az adatfeldolgozót.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  '10',
  '(10) Az adatkezelő, illetve az adatfeldolgozó, miután a (7) vagy a (9) bekezdésnek megfelelően közölték vele a fő felügyeleti hatóság döntését, megteszi a szükséges intézkedéseket annak érdekében, hogy az adatkezelési tevékenységek az Unióban lévő minden tevékenységi helyén megfeleljenek a döntésben foglaltaknak. Az adatkezelő, illetve az adatfeldolgozó közli a fő felügyeleti hatósággal a döntésnek való megfelelés érdekében tett intézkedéseket, ezt követően a fő felügyeleti hatóság tájékoztatja a többi érintett felügyeleti hatóságot.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  '11',
  '(11) Ha egy érintett felügyeleti hatóság rendkívüli körülmények fennállása esetén megalapozottan úgy véli, hogy az érintettek érdekeinek védelme érdekében sürgős fellépésre van szükség, a 66. cikkben említett sürgősségi eljárást kell alkalmazni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '60',
  '12',
  '(12) A fő felügyeleti hatóság és a többi érintett felügyeleti hatóság elektronikus úton, egységes formátum alkalmazásával továbbítja egymásnak az e cikkben előírt információkat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '61',
  null,
  'Kölcsönös segítségnyújtás
(1) A felügyeleti hatóságok e rendelet egységes végrehajtása és alkalmazása érdekében megosztják egymással a releváns információkat, és kölcsönösen segítséget nyújtanak egymásnak, valamint a hatékony együttműködést célzó intézkedéseket tesznek. A kölcsönös segítségnyújtás különösen információkérésekre és felügyeleti intézkedésekre, például az előzetes engedélyezés és egyeztetés, az ellenőrzés és a vizsgálat lefolytatása iránti megkeresésekre terjed ki.

(2) Minden felügyeleti hatóság megteszi a megfelelő intézkedéseket annak érdekében, hogy a más felügyeleti hatóságtól érkező megkereséseket indokolatlan késedelem nélkül, de legkésőbb a megkeresés kézhezvételétől számított egy hónapon belül megválaszolja. Ezen intézkedések közé tartozhat különösen a vizsgálatok lefolytatásával kapcsolatos releváns információk továbbítása.

(3) A segítségnyújtás iránti megkeresésnek minden szükséges információt tartalmaznia kell, beleértve a megkeresés célját és okait. A kicserélt információk kizárólag a megkeresésben meghatározott célra használhatók fel.

(4) A megkeresett felügyeleti hatóság csak abban az esetben tagadhatja meg a megkeresés teljesítését, ha:

a)

a megkeresés tárgyát vagy a kért intézkedés végrehajtását illetően nem jogosult eljárni; vagy

b)

a megkeresés teljesítése sértené e rendeletet, az uniós vagy azon tagállami jogot, amelynek hatálya alá a megkeresett felügyeleti hatóság tartozik.

(5) A megkeresett felügyeleti hatóság tájékoztatja a megkereső felügyeleti hatóságot az ügyben elért eredményekről vagy adott esetben a megkeresés teljesítése érdekében hozott intézkedésekkel kapcsolatos fejleményekről. Ha a felügyeleti hatóság megtagadja a megkeresés teljesítését, ezt köteles a (4) bekezdésnek megfelelően indokolni.

(6) A megkeresett felügyeleti hatóságok főszabályként elektronikus úton, egységes formátum alkalmazásával továbbítják a másik felügyeleti hatóság által kért információt.

(7) A megkeresett felügyeleti hatóság által a kölcsönös segítségnyújtás iránti megkeresés nyomán tett intézkedések térítésmentesek. A felügyeleti hatóságok megállapodhatnak más felügyeleti hatóságokkal a rendkívüli körülmények közötti kölcsönös segítségnyújtásból eredő különleges költségek kölcsönös megtérítésére vonatkozó szabályokról.

(8) Ha egy felügyeleti hatóság a másik felügyeleti hatóság megkeresésének kézhezvételétől számított egy hónapon belül nem adja meg az e cikk (5) bekezdésében említett információkat, a megkereső felügyeleti hatóság az 55. cikk (1) bekezdésével összhangban a saját tagállama területén ideiglenes intézkedést fogadhat el. Ebben az esetben vélelmezni kell, hogy a 66. cikk (1) bekezdése szerinti sürgős fellépésre van szükség, és a Testület sürgősségi eljárás keretében kötelező erejű döntést fogad el a 66. cikk (2) bekezdésével összhangban.

(9) A Bizottság végrehajtási jogi aktusok révén meghatározhatja az e cikk szerinti kölcsönös segítségnyújtás formáját és eljárásait, valamint a felügyeleti hatóságok közötti, illetve a felügyeleti hatóságok és a Testület közötti elektronikus információcserére vonatkozó szabályokat, különösen az e cikk (6) bekezdésében említett egységes formátumot. Ezeket a végrehajtási jogi aktusokat a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '61',
  '1',
  '(1) A felügyeleti hatóságok e rendelet egységes végrehajtása és alkalmazása érdekében megosztják egymással a releváns információkat, és kölcsönösen segítséget nyújtanak egymásnak, valamint a hatékony együttműködést célzó intézkedéseket tesznek. A kölcsönös segítségnyújtás különösen információkérésekre és felügyeleti intézkedésekre, például az előzetes engedélyezés és egyeztetés, az ellenőrzés és a vizsgálat lefolytatása iránti megkeresésekre terjed ki.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '61',
  '2',
  '(2) Minden felügyeleti hatóság megteszi a megfelelő intézkedéseket annak érdekében, hogy a más felügyeleti hatóságtól érkező megkereséseket indokolatlan késedelem nélkül, de legkésőbb a megkeresés kézhezvételétől számított egy hónapon belül megválaszolja. Ezen intézkedések közé tartozhat különösen a vizsgálatok lefolytatásával kapcsolatos releváns információk továbbítása.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '61',
  '3',
  '(3) A segítségnyújtás iránti megkeresésnek minden szükséges információt tartalmaznia kell, beleértve a megkeresés célját és okait. A kicserélt információk kizárólag a megkeresésben meghatározott célra használhatók fel.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '61',
  '4',
  '(4) A megkeresett felügyeleti hatóság csak abban az esetben tagadhatja meg a megkeresés teljesítését, ha:

a)

a megkeresés tárgyát vagy a kért intézkedés végrehajtását illetően nem jogosult eljárni; vagy

b)

a megkeresés teljesítése sértené e rendeletet, az uniós vagy azon tagállami jogot, amelynek hatálya alá a megkeresett felügyeleti hatóság tartozik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '61',
  '4(a)',
  'a) a megkeresés tárgyát vagy a kért intézkedés végrehajtását illetően nem jogosult eljárni; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '61',
  '4(b)',
  'b) a megkeresés teljesítése sértené e rendeletet, az uniós vagy azon tagállami jogot, amelynek hatálya alá a megkeresett felügyeleti hatóság tartozik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '61',
  '5',
  '(5) A megkeresett felügyeleti hatóság tájékoztatja a megkereső felügyeleti hatóságot az ügyben elért eredményekről vagy adott esetben a megkeresés teljesítése érdekében hozott intézkedésekkel kapcsolatos fejleményekről. Ha a felügyeleti hatóság megtagadja a megkeresés teljesítését, ezt köteles a (4) bekezdésnek megfelelően indokolni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '61',
  '6',
  '(6) A megkeresett felügyeleti hatóságok főszabályként elektronikus úton, egységes formátum alkalmazásával továbbítják a másik felügyeleti hatóság által kért információt.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '61',
  '7',
  '(7) A megkeresett felügyeleti hatóság által a kölcsönös segítségnyújtás iránti megkeresés nyomán tett intézkedések térítésmentesek. A felügyeleti hatóságok megállapodhatnak más felügyeleti hatóságokkal a rendkívüli körülmények közötti kölcsönös segítségnyújtásból eredő különleges költségek kölcsönös megtérítésére vonatkozó szabályokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '61',
  '8',
  '(8) Ha egy felügyeleti hatóság a másik felügyeleti hatóság megkeresésének kézhezvételétől számított egy hónapon belül nem adja meg az e cikk (5) bekezdésében említett információkat, a megkereső felügyeleti hatóság az 55. cikk (1) bekezdésével összhangban a saját tagállama területén ideiglenes intézkedést fogadhat el. Ebben az esetben vélelmezni kell, hogy a 66. cikk (1) bekezdése szerinti sürgős fellépésre van szükség, és a Testület sürgősségi eljárás keretében kötelező erejű döntést fogad el a 66. cikk (2) bekezdésével összhangban.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '61',
  '9',
  '(9) A Bizottság végrehajtási jogi aktusok révén meghatározhatja az e cikk szerinti kölcsönös segítségnyújtás formáját és eljárásait, valamint a felügyeleti hatóságok közötti, illetve a felügyeleti hatóságok és a Testület közötti elektronikus információcserére vonatkozó szabályokat, különösen az e cikk (6) bekezdésében említett egységes formátumot. Ezeket a végrehajtási jogi aktusokat a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '62',
  null,
  'A felügyeleti hatóságok közös műveletei
(1) A felügyeleti hatóságok adott esetben közös műveleteket hajtanak végre, ideértve a közös vizsgálatokat és a közös végrehajtási intézkedéseket is, amelyekben más tagállamok felügyeleti hatóságainak tagjai vagy alkalmazottai is részt vesznek.

(2) Ha az adatkezelő vagy az adatfeldolgozó több tagállamban is rendelkezik tevékenységi hellyel, vagy ha az adatkezelési műveletek több tagállamban is valószínűsíthetően jelentős mértékben érintenek nagyszámú érintettet, az összes szóban forgó tagállam felügyeleti hatósága jogosult részt venni a közös műveletekben. Az 56. cikk (1) vagy (4) bekezdése alapján illetékes felügyeleti hatóság felkéri az összes szóban forgó tagállam felügyeleti hatóságát, hogy vegyenek részt a közös műveletekben, és haladéktalanul válaszol a felügyeleti hatóság részvételre irányuló megkeresésére.

(3) A felügyeleti hatóság a tagállami joggal összhangban, valamint a kirendelő felügyeleti hatóság engedélyével, hatáskört – ideértve a vizsgálati hatáskört is – ruházhat át a kirendelő felügyeleti hatóság közös műveletben részt vevő tagjaira vagy alkalmazottaira, vagy – amennyiben a fogadó felügyeleti hatóság tagállamának joga lehetővé teszi –, engedélyezheti a kirendelő felügyeleti hatóság tagjai vagy alkalmazottai számára, hogy vizsgálati hatáskörüket a kirendelő felügyeleti hatóság tagállami jogának megfelelően gyakorolják. A vizsgálati hatáskört kizárólag a fogadó felügyeleti hatóság tagjainak vagy alkalmazottainak irányítása mellett és jelenlétében lehet gyakorolni. A kirendelő felügyeleti hatóság tagjai vagy alkalmazottai a fogadó felügyeleti hatóság tagállami jogának hatálya alá tartoznak.

(4) Ha egy kirendelő felügyeleti hatóság alkalmazottai az (1) bekezdésnek megfelelően egy másik tagállamban végeznek tevékenységet, cselekedeteikért, ideértve a tevékenységük során általuk okozott károkat is, a fogadó felügyeleti hatóság tagállama viseli a felelősséget a tevékenységvégzés helye szerinti tagállam jogának megfelelően.

(5) A károkozás helye szerinti tagállam a kárt ugyanolyan feltételek mellett téríti meg, mintha azt a saját alkalmazottai okozták volna. Azon kirendelő felügyeleti hatóság tagállama, amelynek alkalmazottai egy másik tagállam területén valamely személynek kárt okoztak, teljes mértékben megtéríti ennek a másik tagállamnak azt az összeget, amelyet az a kártérítésre jogosult személynek kifizetett.

(6) A harmadik felekkel szembeni jogai gyakorlásának sérelme nélkül és az (5) bekezdésben foglaltak kivételével, az (1) bekezdésben meghatározott esetben minden tagállam eltekint attól, hogy a (4) bekezdésben említett károk megtérítését követelje egy másik tagállamtól.

(7) Ha egy felügyeleti hatóság egy tervezett közös művelet esetében, egy hónapon belül nem tesz eleget az e cikk (2) bekezdése második mondatában foglalt kötelezettségnek, a többi felügyeleti hatóság az 55. cikkel összhangban a saját tagállama területén ideiglenes intézkedést fogadhat el. Ebben az esetben vélelmezni kell, hogy a 66. cikk (1) bekezdése szerinti sürgős fellépésre van szükség, és a Testület sürgősségi eljárás keretében véleményt bocsát ki vagy kötelező erejű döntést fogad el a 66. cikk (2) bekezdésével összhangban.

2. szakasz

Egységesség',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '62',
  '1',
  '(1) A felügyeleti hatóságok adott esetben közös műveleteket hajtanak végre, ideértve a közös vizsgálatokat és a közös végrehajtási intézkedéseket is, amelyekben más tagállamok felügyeleti hatóságainak tagjai vagy alkalmazottai is részt vesznek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '62',
  '2',
  '(2) Ha az adatkezelő vagy az adatfeldolgozó több tagállamban is rendelkezik tevékenységi hellyel, vagy ha az adatkezelési műveletek több tagállamban is valószínűsíthetően jelentős mértékben érintenek nagyszámú érintettet, az összes szóban forgó tagállam felügyeleti hatósága jogosult részt venni a közös műveletekben. Az 56. cikk (1) vagy (4) bekezdése alapján illetékes felügyeleti hatóság felkéri az összes szóban forgó tagállam felügyeleti hatóságát, hogy vegyenek részt a közös műveletekben, és haladéktalanul válaszol a felügyeleti hatóság részvételre irányuló megkeresésére.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '62',
  '3',
  '(3) A felügyeleti hatóság a tagállami joggal összhangban, valamint a kirendelő felügyeleti hatóság engedélyével, hatáskört – ideértve a vizsgálati hatáskört is – ruházhat át a kirendelő felügyeleti hatóság közös műveletben részt vevő tagjaira vagy alkalmazottaira, vagy – amennyiben a fogadó felügyeleti hatóság tagállamának joga lehetővé teszi –, engedélyezheti a kirendelő felügyeleti hatóság tagjai vagy alkalmazottai számára, hogy vizsgálati hatáskörüket a kirendelő felügyeleti hatóság tagállami jogának megfelelően gyakorolják. A vizsgálati hatáskört kizárólag a fogadó felügyeleti hatóság tagjainak vagy alkalmazottainak irányítása mellett és jelenlétében lehet gyakorolni. A kirendelő felügyeleti hatóság tagjai vagy alkalmazottai a fogadó felügyeleti hatóság tagállami jogának hatálya alá tartoznak.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '62',
  '4',
  '(4) Ha egy kirendelő felügyeleti hatóság alkalmazottai az (1) bekezdésnek megfelelően egy másik tagállamban végeznek tevékenységet, cselekedeteikért, ideértve a tevékenységük során általuk okozott károkat is, a fogadó felügyeleti hatóság tagállama viseli a felelősséget a tevékenységvégzés helye szerinti tagállam jogának megfelelően.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '62',
  '5',
  '(5) A károkozás helye szerinti tagállam a kárt ugyanolyan feltételek mellett téríti meg, mintha azt a saját alkalmazottai okozták volna. Azon kirendelő felügyeleti hatóság tagállama, amelynek alkalmazottai egy másik tagállam területén valamely személynek kárt okoztak, teljes mértékben megtéríti ennek a másik tagállamnak azt az összeget, amelyet az a kártérítésre jogosult személynek kifizetett.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '62',
  '6',
  '(6) A harmadik felekkel szembeni jogai gyakorlásának sérelme nélkül és az (5) bekezdésben foglaltak kivételével, az (1) bekezdésben meghatározott esetben minden tagállam eltekint attól, hogy a (4) bekezdésben említett károk megtérítését követelje egy másik tagállamtól.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '62',
  '7',
  '(7) Ha egy felügyeleti hatóság egy tervezett közös művelet esetében, egy hónapon belül nem tesz eleget az e cikk (2) bekezdése második mondatában foglalt kötelezettségnek, a többi felügyeleti hatóság az 55. cikkel összhangban a saját tagállama területén ideiglenes intézkedést fogadhat el. Ebben az esetben vélelmezni kell, hogy a 66. cikk (1) bekezdése szerinti sürgős fellépésre van szükség, és a Testület sürgősségi eljárás keretében véleményt bocsát ki vagy kötelező erejű döntést fogad el a 66. cikk (2) bekezdésével összhangban.

2. szakasz

Egységesség',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '63',
  null,
  'Az egységességi mechanizmus
Az e rendeletnek az Unió egész területén történő egységes alkalmazásához való hozzájárulás érdekében a felügyeleti hatóságok együttműködnek egymással és adott esetben a Bizottsággal az e szakaszban meghatározott egységességi mechanizmus útján.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_63'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  null,
  'Az Európai Adatvédelmi Testület véleménye
(1) A Testület véleményt bocsát ki, ha valamely illetékes felügyeleti hatóság az alábbiakban felsorolt intézkedések valamelyikének elfogadását tervezi. Ebből a célból az illetékes felügyeleti hatóságnak közölnie kell a döntéstervezetet a Testülettel, ha a döntés:

a)

olyan adatkezelési műveletek jegyzékének az elfogadására irányul, amelyekre a 35. cikk (4) bekezdése szerint vonatkozik az adatvédelmi hatásvizsgálat követelménye;

b)

a 40. cikk (7) bekezdése szerint azon kérdésre vonatkozik, hogy valamely magatartási kódex tervezete, illetve valamely magatartási kódex módosítása vagy bővítése összhangban van-e ezzel a rendelettel;

c)

a 41. cikk (3) bekezdése szerint valamely szervezet, illetve a 43 cikk (3) bekezdése szerint valamely tanúsító szervezet akkreditációjára vonatkozó szempontok jóváhagyására irányul;

d)

a 46. cikk (2) bekezdésének d) pontjában és a 28. cikk (8) bekezdésében említett általános adatvédelmi kikötések meghatározására irányul;

e)

a 46. cikk (3) bekezdésének a) pontjában említett szerződéses rendelkezések engedélyezésére irányul; vagy

f)

a 47. cikk szerinti kötelező erejű vállalati szabályok jóváhagyására irányul.

(2) Bármely felügyeleti hatóság, a Testület elnöke vagy a Bizottság kérheti, hogy a Testület vizsgáljon meg egy általános érvényű vagy egynél több tagállamban hatással bíró ügyet, és bocsásson ki róla véleményt, különösen, ha valamely illetékes felügyeleti hatóság nem teljesíti a 61. cikk szerinti kölcsönös segítségnyújtás vagy a 62. cikk szerinti közös műveletek tekintetében fennálló kötelezettségeit.

(3) Az (1) és (2) bekezdésben említett esetekben a Testület véleményt bocsát ki az elé terjesztett ügyről, kivéve, ha ugyanazon ügyről már bocsátott ki véleményt. A véleményt a Testület nyolc héten belül, tagjainak egyszerű többségével fogadja el. Az ügy összetettségére figyelemmel ez a határidő további hat héttel meghosszabbítható. Az (1) bekezdésben említett, a Testület tagjai részére a (5) bekezdésnek megfelelően eljuttatott döntéstervezetet illetően úgy kell tekinteni, hogy azok a tagok, akik az elnök által megszabott észszerű határidőn belül nem emeltek kifogást, egyetértenek a döntéstervezettel.

(4) A felügyeleti hatóságok és a Bizottság indokolatlan késedelem nélkül elektronikus úton, egységes formátum alkalmazásával közölnek a Testülettel minden releváns információt, ideértve az esettől függően a tények összefoglalóját, a döntéstervezetet, az intézkedés megtételét szükségessé tevő indokokat, és más érintett felügyeleti hatóságok véleményét.

(5) A Testület elnöke indokolatlan késedelem nélkül elektronikus úton tájékoztatja:

a)

egységes formátum alkalmazásával tájékoztatja a Testület tagjait és a Bizottságot a vele közölt releváns információkról. A Testület titkársága szükség esetén gondoskodik a releváns információk fordításáról; és

b)

tájékoztatja az esettől függően az (1) vagy a (2) bekezdésben említett felügyeleti hatóságot, valamint a Bizottságot a véleményről, amelyet nyilvánosságra hoz.

(6) Az illetékes felügyeleti hatóság a (3) bekezdésben említett határidőn belül nem fogadhatja el az (1) bekezdésben említett döntéstervezetét.

(7) Az (1) bekezdésben említett felügyeleti hatóság a lehető legnagyobb mértékben figyelembe veszi a Testület véleményét, és a vélemény kézhezvételét követő két héten belül, elektronikus úton, egységes formátum alkalmazásával közli a Testület elnökével, hogy a döntéstervezetet változatlan formában fenntartja-e, vagy pedig módosítani fogja, és adott esetben megküldi a módosított döntéstervezetet.

(8) Ha az érintett felügyeleti hatóság az e cikk (7) bekezdésében említett határidőn belül, a releváns indokok megadásával arról tájékoztatja a Testület elnökét, hogy egészében vagy részben nem kíván a Testület véleménye alapján eljárni, akkor a 65. cikk (1) bekezdését kell alkalmazni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '1',
  '(1) A Testület véleményt bocsát ki, ha valamely illetékes felügyeleti hatóság az alábbiakban felsorolt intézkedések valamelyikének elfogadását tervezi. Ebből a célból az illetékes felügyeleti hatóságnak közölnie kell a döntéstervezetet a Testülettel, ha a döntés:

a)

olyan adatkezelési műveletek jegyzékének az elfogadására irányul, amelyekre a 35. cikk (4) bekezdése szerint vonatkozik az adatvédelmi hatásvizsgálat követelménye;

b)

a 40. cikk (7) bekezdése szerint azon kérdésre vonatkozik, hogy valamely magatartási kódex tervezete, illetve valamely magatartási kódex módosítása vagy bővítése összhangban van-e ezzel a rendelettel;

c)

a 41. cikk (3) bekezdése szerint valamely szervezet, illetve a 43 cikk (3) bekezdése szerint valamely tanúsító szervezet akkreditációjára vonatkozó szempontok jóváhagyására irányul;

d)

a 46. cikk (2) bekezdésének d) pontjában és a 28. cikk (8) bekezdésében említett általános adatvédelmi kikötések meghatározására irányul;

e)

a 46. cikk (3) bekezdésének a) pontjában említett szerződéses rendelkezések engedélyezésére irányul; vagy

f)

a 47. cikk szerinti kötelező erejű vállalati szabályok jóváhagyására irányul.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '1(a)',
  'a) olyan adatkezelési műveletek jegyzékének az elfogadására irányul, amelyekre a 35. cikk (4) bekezdése szerint vonatkozik az adatvédelmi hatásvizsgálat követelménye;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '1(b)',
  'b) a 40. cikk (7) bekezdése szerint azon kérdésre vonatkozik, hogy valamely magatartási kódex tervezete, illetve valamely magatartási kódex módosítása vagy bővítése összhangban van-e ezzel a rendelettel;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '1(c)',
  'c) a 41. cikk (3) bekezdése szerint valamely szervezet, illetve a 43 cikk (3) bekezdése szerint valamely tanúsító szervezet akkreditációjára vonatkozó szempontok jóváhagyására irányul;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '1(d)',
  'd) a 46. cikk (2) bekezdésének d) pontjában és a 28. cikk (8) bekezdésében említett általános adatvédelmi kikötések meghatározására irányul;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '1(e)',
  'e) a 46. cikk (3) bekezdésének a) pontjában említett szerződéses rendelkezések engedélyezésére irányul; vagy',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '1(f)',
  'f) a 47. cikk szerinti kötelező erejű vállalati szabályok jóváhagyására irányul.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '2',
  '(2) Bármely felügyeleti hatóság, a Testület elnöke vagy a Bizottság kérheti, hogy a Testület vizsgáljon meg egy általános érvényű vagy egynél több tagállamban hatással bíró ügyet, és bocsásson ki róla véleményt, különösen, ha valamely illetékes felügyeleti hatóság nem teljesíti a 61. cikk szerinti kölcsönös segítségnyújtás vagy a 62. cikk szerinti közös műveletek tekintetében fennálló kötelezettségeit.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '3',
  '(3) Az (1) és (2) bekezdésben említett esetekben a Testület véleményt bocsát ki az elé terjesztett ügyről, kivéve, ha ugyanazon ügyről már bocsátott ki véleményt. A véleményt a Testület nyolc héten belül, tagjainak egyszerű többségével fogadja el. Az ügy összetettségére figyelemmel ez a határidő további hat héttel meghosszabbítható. Az (1) bekezdésben említett, a Testület tagjai részére a (5) bekezdésnek megfelelően eljuttatott döntéstervezetet illetően úgy kell tekinteni, hogy azok a tagok, akik az elnök által megszabott észszerű határidőn belül nem emeltek kifogást, egyetértenek a döntéstervezettel.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '4',
  '(4) A felügyeleti hatóságok és a Bizottság indokolatlan késedelem nélkül elektronikus úton, egységes formátum alkalmazásával közölnek a Testülettel minden releváns információt, ideértve az esettől függően a tények összefoglalóját, a döntéstervezetet, az intézkedés megtételét szükségessé tevő indokokat, és más érintett felügyeleti hatóságok véleményét.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '5',
  '(5) A Testület elnöke indokolatlan késedelem nélkül elektronikus úton tájékoztatja:

a)

egységes formátum alkalmazásával tájékoztatja a Testület tagjait és a Bizottságot a vele közölt releváns információkról. A Testület titkársága szükség esetén gondoskodik a releváns információk fordításáról; és

b)

tájékoztatja az esettől függően az (1) vagy a (2) bekezdésben említett felügyeleti hatóságot, valamint a Bizottságot a véleményről, amelyet nyilvánosságra hoz.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '5(a)',
  'a) egységes formátum alkalmazásával tájékoztatja a Testület tagjait és a Bizottságot a vele közölt releváns információkról. A Testület titkársága szükség esetén gondoskodik a releváns információk fordításáról; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '5(b)',
  'b) tájékoztatja az esettől függően az (1) vagy a (2) bekezdésben említett felügyeleti hatóságot, valamint a Bizottságot a véleményről, amelyet nyilvánosságra hoz.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '6',
  '(6) Az illetékes felügyeleti hatóság a (3) bekezdésben említett határidőn belül nem fogadhatja el az (1) bekezdésben említett döntéstervezetét.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '7',
  '(7) Az (1) bekezdésben említett felügyeleti hatóság a lehető legnagyobb mértékben figyelembe veszi a Testület véleményét, és a vélemény kézhezvételét követő két héten belül, elektronikus úton, egységes formátum alkalmazásával közli a Testület elnökével, hogy a döntéstervezetet változatlan formában fenntartja-e, vagy pedig módosítani fogja, és adott esetben megküldi a módosított döntéstervezetet.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '64',
  '8',
  '(8) Ha az érintett felügyeleti hatóság az e cikk (7) bekezdésében említett határidőn belül, a releváns indokok megadásával arról tájékoztatja a Testület elnökét, hogy egészében vagy részben nem kíván a Testület véleménye alapján eljárni, akkor a 65. cikk (1) bekezdését kell alkalmazni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '65',
  null,
  'A Testület vitarendezési eljárása
(1) Annak érdekében, hogy az egyes esetekben biztosított legyen e rendelet helyes és egységes alkalmazása, a Testület kötelező erejű döntést fogad el az alábbi esetekben:

a)

ha a 60. cikk (4) bekezdésében említett esetben valamely érintett felügyeleti hatóság releváns és megalapozott kifogást emelt a fő felügyeleti hatóság döntéstervezetével szemben, vagy ha a fő felügyeleti hatóság elutasított egy ilyen kifogást arra hivatkozva, hogy az nem releváns vagy nem megalapozott. A kötelező erejű döntésnek ki kell terjednie a releváns és megalapozott kifogásban szereplő összes kérdésre, különösen arra, hogy a rendelet sérült-e;

b)

ha eltérnek az álláspontok azt illetően, hogy az érintett felügyeleti hatóságok közül melyik illetékes a tevékenységi központ tekintetében;

c)

ha valamely illetékes felügyeleti hatóság nem kéri ki a Testület véleményét a 64. cikk (1) bekezdésében említett esetekben, vagy nem a Testület által a 64. cikk alapján kibocsátott vélemény alapján jár el. Ebben az esetben bármely érintett felügyeleti hatóság vagy a Bizottság a Testület tudomására hozhatja az ügyet.

(2) Az (1) bekezdésben említett döntést a Testület az ügy benyújtásától számított egy hónapon belül, tagjainak kétharmados többségével fogadja el. Az ügy összetettségére figyelemmel ez a határidő további egy hónappal meghosszabbítható. Az (1) bekezdésben említett döntést indokolni kell, és meg kell küldeni a fő felügyeleti hatóságnak és minden érintett felügyeleti hatóságnak, amelyekre nézve kötelező erővel rendelkezik.

(3) Ha a Testület döntését nem képes a (2) bekezdésben említett határidőkön belül elfogadni, a döntést a (2) bekezdésben említett második hónap leteltét követő két héten belül, tagjainak egyszerű többségével fogadja el. A Testület tagjainak szavazategyenlősége esetén a döntés elfogadásáról az elnök szavazata dönt.

(4) Az érintett felügyeleti hatóságok a (2) és (3) bekezdésben említett határidők lejártáig nem fogadhatnak el döntést az (1) bekezdés alapján a Testület elé terjesztett ügyről.

(5) A Testület elnöke indokolatlan késedelem nélkül értesíti az érintett felügyeleti hatóságokat az (1) bekezdésben említett döntésről. Erről tájékoztatnia kell a Bizottságot. A döntést haladéktalanul közzé kell tenni a Testület honlapján azt követően, hogy a felügyeleti hatóság bejelentette a (6) bekezdésben említett jogerős döntést.

(6) A fő felügyeleti hatóság vagy – az esettől függően – az a felügyeleti hatóság, amelyhez a panaszt benyújtották, az e cikk (1) bekezdésében említett döntés alapján indokolatlan késedelem nélkül, de legkésőbb egy hónappal azt követően, hogy a Testület bejelentette döntését elfogadja jogerős döntését. A fő felügyeleti hatóság vagy – az esettől függően – az a felügyeleti hatóság, amelyhez a panaszt benyújtották, tájékoztatja a Testületet arról a dátumról, amikor az adatkezelővel, az adatfeldolgozóval, illetve az érintettel közli jogerős döntését. Az érintett felügyeleti hatóságok jogerős döntését a 60. cikk (7), (8) és (9) bekezdésében foglaltaknak megfelelően kell elfogadni. A jogerős döntésben utalni kell az e cikk (1) bekezdésben említett döntésre, valamint közölni kell, hogy az (1) bekezdésében említett döntést a (5) bekezdéssel összhangban közzé fogják tenni a Testület honlapján. A jogerős döntéshez csatolni kell az e cikk (1) bekezdésében említett döntést.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '65',
  '1',
  '(1) Annak érdekében, hogy az egyes esetekben biztosított legyen e rendelet helyes és egységes alkalmazása, a Testület kötelező erejű döntést fogad el az alábbi esetekben:

a)

ha a 60. cikk (4) bekezdésében említett esetben valamely érintett felügyeleti hatóság releváns és megalapozott kifogást emelt a fő felügyeleti hatóság döntéstervezetével szemben, vagy ha a fő felügyeleti hatóság elutasított egy ilyen kifogást arra hivatkozva, hogy az nem releváns vagy nem megalapozott. A kötelező erejű döntésnek ki kell terjednie a releváns és megalapozott kifogásban szereplő összes kérdésre, különösen arra, hogy a rendelet sérült-e;

b)

ha eltérnek az álláspontok azt illetően, hogy az érintett felügyeleti hatóságok közül melyik illetékes a tevékenységi központ tekintetében;

c)

ha valamely illetékes felügyeleti hatóság nem kéri ki a Testület véleményét a 64. cikk (1) bekezdésében említett esetekben, vagy nem a Testület által a 64. cikk alapján kibocsátott vélemény alapján jár el. Ebben az esetben bármely érintett felügyeleti hatóság vagy a Bizottság a Testület tudomására hozhatja az ügyet.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '65',
  '1(a)',
  'a) ha a 60. cikk (4) bekezdésében említett esetben valamely érintett felügyeleti hatóság releváns és megalapozott kifogást emelt a fő felügyeleti hatóság döntéstervezetével szemben, vagy ha a fő felügyeleti hatóság elutasított egy ilyen kifogást arra hivatkozva, hogy az nem releváns vagy nem megalapozott. A kötelező erejű döntésnek ki kell terjednie a releváns és megalapozott kifogásban szereplő összes kérdésre, különösen arra, hogy a rendelet sérült-e;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '65',
  '1(b)',
  'b) ha eltérnek az álláspontok azt illetően, hogy az érintett felügyeleti hatóságok közül melyik illetékes a tevékenységi központ tekintetében;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '65',
  '1(c)',
  'c) ha valamely illetékes felügyeleti hatóság nem kéri ki a Testület véleményét a 64. cikk (1) bekezdésében említett esetekben, vagy nem a Testület által a 64. cikk alapján kibocsátott vélemény alapján jár el. Ebben az esetben bármely érintett felügyeleti hatóság vagy a Bizottság a Testület tudomására hozhatja az ügyet.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '65',
  '2',
  '(2) Az (1) bekezdésben említett döntést a Testület az ügy benyújtásától számított egy hónapon belül, tagjainak kétharmados többségével fogadja el. Az ügy összetettségére figyelemmel ez a határidő további egy hónappal meghosszabbítható. Az (1) bekezdésben említett döntést indokolni kell, és meg kell küldeni a fő felügyeleti hatóságnak és minden érintett felügyeleti hatóságnak, amelyekre nézve kötelező erővel rendelkezik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '65',
  '3',
  '(3) Ha a Testület döntését nem képes a (2) bekezdésben említett határidőkön belül elfogadni, a döntést a (2) bekezdésben említett második hónap leteltét követő két héten belül, tagjainak egyszerű többségével fogadja el. A Testület tagjainak szavazategyenlősége esetén a döntés elfogadásáról az elnök szavazata dönt.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '65',
  '4',
  '(4) Az érintett felügyeleti hatóságok a (2) és (3) bekezdésben említett határidők lejártáig nem fogadhatnak el döntést az (1) bekezdés alapján a Testület elé terjesztett ügyről.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '65',
  '5',
  '(5) A Testület elnöke indokolatlan késedelem nélkül értesíti az érintett felügyeleti hatóságokat az (1) bekezdésben említett döntésről. Erről tájékoztatnia kell a Bizottságot. A döntést haladéktalanul közzé kell tenni a Testület honlapján azt követően, hogy a felügyeleti hatóság bejelentette a (6) bekezdésben említett jogerős döntést.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '65',
  '6',
  '(6) A fő felügyeleti hatóság vagy – az esettől függően – az a felügyeleti hatóság, amelyhez a panaszt benyújtották, az e cikk (1) bekezdésében említett döntés alapján indokolatlan késedelem nélkül, de legkésőbb egy hónappal azt követően, hogy a Testület bejelentette döntését elfogadja jogerős döntését. A fő felügyeleti hatóság vagy – az esettől függően – az a felügyeleti hatóság, amelyhez a panaszt benyújtották, tájékoztatja a Testületet arról a dátumról, amikor az adatkezelővel, az adatfeldolgozóval, illetve az érintettel közli jogerős döntését. Az érintett felügyeleti hatóságok jogerős döntését a 60. cikk (7), (8) és (9) bekezdésében foglaltaknak megfelelően kell elfogadni. A jogerős döntésben utalni kell az e cikk (1) bekezdésben említett döntésre, valamint közölni kell, hogy az (1) bekezdésében említett döntést a (5) bekezdéssel összhangban közzé fogják tenni a Testület honlapján. A jogerős döntéshez csatolni kell az e cikk (1) bekezdésében említett döntést.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '66',
  null,
  'Sürgősségi eljárás
(1) Ha egy érintett felügyeleti hatóság rendkívüli körülmények fennállása esetén, úgy véli, hogy az érintettek jogainak és szabadságainak védelme érdekében sürgős fellépésre van szükség, akkor a 63., 64. és 65. cikkben említett egységességi mechanizmustól, illetve a 60. cikkben említett eljárástól eltérve haladéktalanul legfeljebb három hónapra szóló meghatározott érvényességi idejű ideiglenes intézkedéseket fogadhat el abból a célból, hogy saját tagállama területén joghatást váltson ki. A felügyeleti hatóság haladéktalanul közli az ilyen intézkedéseket és elfogadásuk indokait a többi érintett felügyeleti hatósággal, a Testülettel és a Bizottsággal.

(2) Ha egy felügyeleti hatóság az (1) bekezdés szerinti intézkedést hozott, és úgy véli, hogy végleges intézkedések sürgős elfogadására van szükség, kérését megindokolva kérheti a Testületet, hogy sürgősségi eljárás keretében bocsásson ki véleményt vagy fogadjon el kötelező erejű döntést.

(3) Kérését a sürgős fellépés szükségességére kiterjedően is megindokolva bármely felügyeleti hatóság kérheti a Testületet, hogy sürgősségi eljárás keretében az esettől függően bocsásson ki véleményt vagy fogadjon el kötelező erejű döntést, ha valamely illetékes felügyeleti hatóság nem tett megfelelő intézkedést olyan helyzetben, amikor az érintettek jogainak és szabadságainak védelme érdekében sürgős fellépésre van szükség.

(4) A 64. cikk (3) bekezdésétől és a 65. cikk (2) bekezdésétől eltérve az e cikk (2) és (3) bekezdésében említett, sürgősségi eljárás keretében elfogadandó véleményt, illetve kötelező erejű döntést a Testület két héten belül, tagjainak egyszerű többségével fogadja el.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_66'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '66',
  '1',
  '(1) Ha egy érintett felügyeleti hatóság rendkívüli körülmények fennállása esetén, úgy véli, hogy az érintettek jogainak és szabadságainak védelme érdekében sürgős fellépésre van szükség, akkor a 63., 64. és 65. cikkben említett egységességi mechanizmustól, illetve a 60. cikkben említett eljárástól eltérve haladéktalanul legfeljebb három hónapra szóló meghatározott érvényességi idejű ideiglenes intézkedéseket fogadhat el abból a célból, hogy saját tagállama területén joghatást váltson ki. A felügyeleti hatóság haladéktalanul közli az ilyen intézkedéseket és elfogadásuk indokait a többi érintett felügyeleti hatósággal, a Testülettel és a Bizottsággal.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_66'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '66',
  '2',
  '(2) Ha egy felügyeleti hatóság az (1) bekezdés szerinti intézkedést hozott, és úgy véli, hogy végleges intézkedések sürgős elfogadására van szükség, kérését megindokolva kérheti a Testületet, hogy sürgősségi eljárás keretében bocsásson ki véleményt vagy fogadjon el kötelező erejű döntést.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_66'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '66',
  '3',
  '(3) Kérését a sürgős fellépés szükségességére kiterjedően is megindokolva bármely felügyeleti hatóság kérheti a Testületet, hogy sürgősségi eljárás keretében az esettől függően bocsásson ki véleményt vagy fogadjon el kötelező erejű döntést, ha valamely illetékes felügyeleti hatóság nem tett megfelelő intézkedést olyan helyzetben, amikor az érintettek jogainak és szabadságainak védelme érdekében sürgős fellépésre van szükség.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_66'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '66',
  '4',
  '(4) A 64. cikk (3) bekezdésétől és a 65. cikk (2) bekezdésétől eltérve az e cikk (2) és (3) bekezdésében említett, sürgősségi eljárás keretében elfogadandó véleményt, illetve kötelező erejű döntést a Testület két héten belül, tagjainak egyszerű többségével fogadja el.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_66'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '67',
  null,
  'Információcsere
A Bizottság általános hatályú végrehajtási jogi aktusok elfogadása révén meghatározhatja a felügyeleti hatóságok közötti, illetve a felügyeleti hatóságok és a Testület közötti elektronikus információcserére vonatkozó szabályokat, különösen a 64. cikkben említett egységes formátumot.

Ezeket a végrehajtási jogi aktusokat a 93. cikk (2) bekezdésében említett vizsgálóbizottsági eljárásnak megfelelően kell elfogadni.

3. szakasz

Európai adatvédelmi testület',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_67'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '68',
  null,
  'Az Európai Adatvédelmi Testület
(1) Létrejön az Európai Adatvédelmi Testület („a Testület”) mint jogi személyiséggel rendelkező uniós szerv.

(2) A Testületet az elnöke képviseli.

(3) A Testület minden tagállam egy felügyeleti hatóságának vezetőjéből és az európai adatvédelmi biztosból vagy azok képviselőiből áll.

(4) Ha valamely tagállamban egynél több felügyeleti hatóság felelős az e rendelet szerinti rendelkezések alkalmazásának ellenőrzéséért, közös képviselőt kell kinevezni az érintett tagállam jogának megfelelően.

(5) A Bizottság szavazati jog nélkül részt vehet a Testület tevékenységében és ülésein. A Bizottság kijelöli képviselőjét. A Testület elnöke tájékoztatja a Bizottságot a Testület tevékenységeiről.

(6) A 65. cikkben említett esetekben az európai adatvédelmi biztos kizárólag az uniós intézményekre, szervekre, hivatalokra és ügynökségekre alkalmazandó azon elveket és szabályokat érintő döntések tekintetében rendelkezik szavazati joggal, amelyek tartalmilag megfelelnek az e rendeletben foglalt elveknek és szabályoknak.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '68',
  '1',
  '(1) Létrejön az Európai Adatvédelmi Testület („a Testület”) mint jogi személyiséggel rendelkező uniós szerv.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '68',
  '2',
  '(2) A Testületet az elnöke képviseli.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '68',
  '3',
  '(3) A Testület minden tagállam egy felügyeleti hatóságának vezetőjéből és az európai adatvédelmi biztosból vagy azok képviselőiből áll.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '68',
  '4',
  '(4) Ha valamely tagállamban egynél több felügyeleti hatóság felelős az e rendelet szerinti rendelkezések alkalmazásának ellenőrzéséért, közös képviselőt kell kinevezni az érintett tagállam jogának megfelelően.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '68',
  '5',
  '(5) A Bizottság szavazati jog nélkül részt vehet a Testület tevékenységében és ülésein. A Bizottság kijelöli képviselőjét. A Testület elnöke tájékoztatja a Bizottságot a Testület tevékenységeiről.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '68',
  '6',
  '(6) A 65. cikkben említett esetekben az európai adatvédelmi biztos kizárólag az uniós intézményekre, szervekre, hivatalokra és ügynökségekre alkalmazandó azon elveket és szabályokat érintő döntések tekintetében rendelkezik szavazati joggal, amelyek tartalmilag megfelelnek az e rendeletben foglalt elveknek és szabályoknak.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '69',
  null,
  'Függetlenség
(1) A Testület a 70. és 71. cikk szerinti feladatainak ellátása, illetve hatásköreinek gyakorlása során függetlenül jár el.

(2) A 70. cikk (1) bekezdésének b) pontjában és a 70. cikk (2) bekezdésében említett, a Bizottságtól érkező kérések sérelme nélkül, a Testület feladatainak ellátása, illetve hatásköreinek gyakorlása során nem kérhet, és nem fogadhat el utasítást.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_69'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '69',
  '1',
  '(1) A Testület a 70. és 71. cikk szerinti feladatainak ellátása, illetve hatásköreinek gyakorlása során függetlenül jár el.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_69'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '69',
  '2',
  '(2) A 70. cikk (1) bekezdésének b) pontjában és a 70. cikk (2) bekezdésében említett, a Bizottságtól érkező kérések sérelme nélkül, a Testület feladatainak ellátása, illetve hatásköreinek gyakorlása során nem kérhet, és nem fogadhat el utasítást.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_69'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  null,
  'Az Európai Adatvédelmi Testület feladatai
(1) A Testület biztosítja e rendelet egységes alkalmazását. Ennek érdekében a Testület saját kezdeményezésére vagy adott esetben a Bizottság kérésére ellátja különösen a következő feladatokat:

a)

ellenőrzi és biztosítja e rendelet helyes alkalmazását a 64. és 65. cikkben meghatározott esetekben, a nemzeti felügyeleti hatóságok feladatainak sérelme nélkül;

b)

tanácsot ad a Bizottságnak a személyes adatok Unión belüli védelmével kapcsolatos kérdésekben, ideértve az e rendelet módosítására irányuló javaslatokat is;

c)

tanácsot ad a Bizottságnak az adatkezelők, az adatfeldolgozók és a felügyeleti hatóságok között a kötelező erejű vállalati szabályokkal kapcsolatban folytatott információcsere formátumára és eljárásaira vonatkozóan;

d)

iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki a személyes adatokra mutató linkeknek, az ilyen adatok másolatainak vagy másodpéldányainak a nyilvánosság számára hozzáférhető kommunikációs szolgáltatásokból történő törlésére vonatkozóan, a 17. cikk (2) bekezdésben említettek szerint;

e)

saját kezdeményezésére, illetve valamely tagjának vagy a Bizottságnak a kérésére megvizsgálja az e rendelet alkalmazását érintő kérdéseket, valamint e rendelet egységes alkalmazásának elősegítése érdekében iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki;

f)

e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki a 22. cikk (2) bekezdése szerinti profilalkotáson alapuló döntéshozatalra vonatkozó szempontok és feltételek további pontosítása érdekében;

g)

e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki a 33. cikk (1) és (2) bekezdésében említett adatvédelmi incidens és indokolatlan késedelem tényének megállapítására, valamint azokra a konkrét körülményekre vonatkozóan, amelyek fennállása esetén az adatkezelőnek vagy az adatfeldolgozónak be kell jelentenie az adatvédelmi incidenst;

h)

e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki azokra a körülményekre vonatkozóan, amelyek fennállása esetén az adatvédelmi incidens valószínűsíthetően magas kockázattal jár a természetes személyek jogaira és szabadságaira nézve, a 34. cikk (1) bekezdésében említettek szerint;

i)

e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki az adatkezelők, illetve az adatfeldolgozók által követett, a kötelező erejű vállalati szabályokon alapuló, személyes adatok továbbítására vonatkozó, a 47. cikkben említett szempontok és követelmények, valamint az érintettek személyes adatainak védelmét biztosítani hivatott ugyanazon cikkben említett egyéb szükséges követelmények további pontosítása céljából;

j)

e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki a személyes adatoknak a 49. cikk (1) bekezdése alapján történő továbbítására vonatkozó szempontok és előírások további pontosítása céljából;

k)

iránymutatásokat dolgoz ki a felügyeleti hatóságok számára az 58. cikk (1), (2) és (3) bekezdésében említett intézkedések alkalmazására, valamint a 83. cikk szerinti közigazgatási bírságok megállapítására vonatkozóan;

l)

felülvizsgálja az e), illetve f) pontban említett iránymutatások, ajánlások és legjobb gyakorlatok gyakorlati alkalmazását;

m)

e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki az 54. cikk (2) bekezdésben említett, a természetes személyek által e rendelet megsértését illetően tett bejelentésekre vonatkozó közös eljárások megállapítása érdekében,;

n)

ösztönzi a magatartási kódexek kidolgozását, valamint az adatvédelmi tanúsítási mechanizmusok és az adatvédelmi bélyegzők, illetve jelölések létrehozását a 40. és 42. cikkben említettek szerint;

o)

a 43. cikknek megfelelően elvégzi a tanúsító szervezetek akkreditációját és annak rendszeres felülvizsgálatát, nyilvános nyilvántartást vezet egyrészt a 43. cikk (6) bekezdése szerint az akkreditált szervezetekről, másrészt a 42. cikk (7) bekezdése szerint a harmadik országban tevékenységi hellyel rendelkező akkreditált adatkezelőkről és adatfeldolgozókról;

p)

részletesen meghatározza a 43. cikk (3) bekezdésében említett követelményeket a tanúsító szervezetek 42. cikk szerinti akkreditációja céljából;

q)

véleményezi a Bizottság számára a 43. cikk (8) bekezdésében említett tanúsítási követelményeket;

r)

véleményezi a Bizottság számára a 12. cikk (7) bekezdésében említett ikonokat;

s)

véleményt bocsát ki a Bizottság számára a valamely harmadik országban vagy nemzetközi szervezetben biztosított védelmi szint megfelelőségének megítéléséhez, ideértve annak megállapítását is, ha a harmadik ország, a harmadik ország valamely területe vagy egy vagy több meghatározott ágazata, vagy a nemzetközi szervezet már nem biztosít megfelelő védelmi szintet. A Bizottság e célból biztosítja a Testület számára az összes szükséges dokumentációt, köztük a harmadik ország kormányával, a harmadik ország, annak valamely területe vagy meghatározott ágazata tekintetében, illetve a nemzetközi szervezettel folytatott levélváltást;

t)

az egységességi mechanizmus keretében véleményt bocsát ki a felügyeleti hatóságok 64 cikk (1) bekezdése szerinti döntéstervezeteiről, a 64. cikk (2) bekezdésének megfelelően elé terjesztett ügyekről,, valamint a 65. cikk értelmében – ideértve a 66. cikkben említett eseteket is – kötelező erejű döntéseket hoz;

u)

előmozdítja az együttműködést, valamint az információk és gyakorlatok hatékony két- vagy többoldalú cseréjét a felügyeleti hatóságok között;

v)

támogatja a közös képzési programokat, továbbá megkönnyíti a csereprogramokat a felügyeleti hatóságok között, valamint adott esetben harmadik országok felügyeleti hatóságaival vagy nemzetközi szervezetekkel;

w)

az adatvédelmi felügyeleti hatóságok körében világszerte előmozdítja az adatvédelmi jogszabályokra és gyakorlatokra vonatkozó ismeretek és dokumentáció cseréjét;

x)

véleményt bocsát ki a 40. cikk (9) bekezdése szerinti, uniós szinten kidolgozott magatartási kódexekről; és

y)

nyilvánosan hozzáférhető elektronikus nyilvántartást vezet az egységességi mechanizmus keretében kezelt ügyekkel kapcsolatban a felügyeleti hatóságok és a bíróságok által hozott határozatokról.

(2) A Bizottság, ha tanácsot kér a Testülettől, az ügy sürgősségét figyelembe véve határidőt jelölhet meg.

(3) A Testület továbbítja a véleményeit, iránymutatásait, ajánlásait és legjobb gyakorlatait a Bizottságnak és a 93. cikkben említett bizottságnak, és nyilvánosságra hozza azokat.

(4) A Testület adott esetben konzultál az érintett felekkel, és lehetőséget biztosít számukra, hogy észszerű határidőn belül közöljék észrevételeiket. A Testület, a 76. cikk sérelme nélkül,nyilvánosan elérhetővé teszi a konzultációs eljárás eredményeit.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1',
  '(1) A Testület biztosítja e rendelet egységes alkalmazását. Ennek érdekében a Testület saját kezdeményezésére vagy adott esetben a Bizottság kérésére ellátja különösen a következő feladatokat:

a)

ellenőrzi és biztosítja e rendelet helyes alkalmazását a 64. és 65. cikkben meghatározott esetekben, a nemzeti felügyeleti hatóságok feladatainak sérelme nélkül;

b)

tanácsot ad a Bizottságnak a személyes adatok Unión belüli védelmével kapcsolatos kérdésekben, ideértve az e rendelet módosítására irányuló javaslatokat is;

c)

tanácsot ad a Bizottságnak az adatkezelők, az adatfeldolgozók és a felügyeleti hatóságok között a kötelező erejű vállalati szabályokkal kapcsolatban folytatott információcsere formátumára és eljárásaira vonatkozóan;

d)

iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki a személyes adatokra mutató linkeknek, az ilyen adatok másolatainak vagy másodpéldányainak a nyilvánosság számára hozzáférhető kommunikációs szolgáltatásokból történő törlésére vonatkozóan, a 17. cikk (2) bekezdésben említettek szerint;

e)

saját kezdeményezésére, illetve valamely tagjának vagy a Bizottságnak a kérésére megvizsgálja az e rendelet alkalmazását érintő kérdéseket, valamint e rendelet egységes alkalmazásának elősegítése érdekében iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki;

f)

e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki a 22. cikk (2) bekezdése szerinti profilalkotáson alapuló döntéshozatalra vonatkozó szempontok és feltételek további pontosítása érdekében;

g)

e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki a 33. cikk (1) és (2) bekezdésében említett adatvédelmi incidens és indokolatlan késedelem tényének megállapítására, valamint azokra a konkrét körülményekre vonatkozóan, amelyek fennállása esetén az adatkezelőnek vagy az adatfeldolgozónak be kell jelentenie az adatvédelmi incidenst;

h)

e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki azokra a körülményekre vonatkozóan, amelyek fennállása esetén az adatvédelmi incidens valószínűsíthetően magas kockázattal jár a természetes személyek jogaira és szabadságaira nézve, a 34. cikk (1) bekezdésében említettek szerint;

i)

e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki az adatkezelők, illetve az adatfeldolgozók által követett, a kötelező erejű vállalati szabályokon alapuló, személyes adatok továbbítására vonatkozó, a 47. cikkben említett szempontok és követelmények, valamint az érintettek személyes adatainak védelmét biztosítani hivatott ugyanazon cikkben említett egyéb szükséges követelmények további pontosítása céljából;

j)

e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki a személyes adatoknak a 49. cikk (1) bekezdése alapján történő továbbítására vonatkozó szempontok és előírások további pontosítása céljából;

k)

iránymutatásokat dolgoz ki a felügyeleti hatóságok számára az 58. cikk (1), (2) és (3) bekezdésében említett intézkedések alkalmazására, valamint a 83. cikk szerinti közigazgatási bírságok megállapítására vonatkozóan;

l)

felülvizsgálja az e), illetve f) pontban említett iránymutatások, ajánlások és legjobb gyakorlatok gyakorlati alkalmazását;

m)

e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki az 54. cikk (2) bekezdésben említett, a természetes személyek által e rendelet megsértését illetően tett bejelentésekre vonatkozó közös eljárások megállapítása érdekében,;

n)

ösztönzi a magatartási kódexek kidolgozását, valamint az adatvédelmi tanúsítási mechanizmusok és az adatvédelmi bélyegzők, illetve jelölések létrehozását a 40. és 42. cikkben említettek szerint;

o)

a 43. cikknek megfelelően elvégzi a tanúsító szervezetek akkreditációját és annak rendszeres felülvizsgálatát, nyilvános nyilvántartást vezet egyrészt a 43. cikk (6) bekezdése szerint az akkreditált szervezetekről, másrészt a 42. cikk (7) bekezdése szerint a harmadik országban tevékenységi hellyel rendelkező akkreditált adatkezelőkről és adatfeldolgozókról;

p)

részletesen meghatározza a 43. cikk (3) bekezdésében említett követelményeket a tanúsító szervezetek 42. cikk szerinti akkreditációja céljából;

q)

véleményezi a Bizottság számára a 43. cikk (8) bekezdésében említett tanúsítási követelményeket;

r)

véleményezi a Bizottság számára a 12. cikk (7) bekezdésében említett ikonokat;

s)

véleményt bocsát ki a Bizottság számára a valamely harmadik országban vagy nemzetközi szervezetben biztosított védelmi szint megfelelőségének megítéléséhez, ideértve annak megállapítását is, ha a harmadik ország, a harmadik ország valamely területe vagy egy vagy több meghatározott ágazata, vagy a nemzetközi szervezet már nem biztosít megfelelő védelmi szintet. A Bizottság e célból biztosítja a Testület számára az összes szükséges dokumentációt, köztük a harmadik ország kormányával, a harmadik ország, annak valamely területe vagy meghatározott ágazata tekintetében, illetve a nemzetközi szervezettel folytatott levélváltást;

t)

az egységességi mechanizmus keretében véleményt bocsát ki a felügyeleti hatóságok 64 cikk (1) bekezdése szerinti döntéstervezeteiről, a 64. cikk (2) bekezdésének megfelelően elé terjesztett ügyekről,, valamint a 65. cikk értelmében – ideértve a 66. cikkben említett eseteket is – kötelező erejű döntéseket hoz;

u)

előmozdítja az együttműködést, valamint az információk és gyakorlatok hatékony két- vagy többoldalú cseréjét a felügyeleti hatóságok között;

v)

támogatja a közös képzési programokat, továbbá megkönnyíti a csereprogramokat a felügyeleti hatóságok között, valamint adott esetben harmadik országok felügyeleti hatóságaival vagy nemzetközi szervezetekkel;

w)

az adatvédelmi felügyeleti hatóságok körében világszerte előmozdítja az adatvédelmi jogszabályokra és gyakorlatokra vonatkozó ismeretek és dokumentáció cseréjét;

x)

véleményt bocsát ki a 40. cikk (9) bekezdése szerinti, uniós szinten kidolgozott magatartási kódexekről; és

y)

nyilvánosan hozzáférhető elektronikus nyilvántartást vezet az egységességi mechanizmus keretében kezelt ügyekkel kapcsolatban a felügyeleti hatóságok és a bíróságok által hozott határozatokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(a)',
  'a) ellenőrzi és biztosítja e rendelet helyes alkalmazását a 64. és 65. cikkben meghatározott esetekben, a nemzeti felügyeleti hatóságok feladatainak sérelme nélkül;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(b)',
  'b) tanácsot ad a Bizottságnak a személyes adatok Unión belüli védelmével kapcsolatos kérdésekben, ideértve az e rendelet módosítására irányuló javaslatokat is;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(c)',
  'c) tanácsot ad a Bizottságnak az adatkezelők, az adatfeldolgozók és a felügyeleti hatóságok között a kötelező erejű vállalati szabályokkal kapcsolatban folytatott információcsere formátumára és eljárásaira vonatkozóan;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(d)',
  'd) iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki a személyes adatokra mutató linkeknek, az ilyen adatok másolatainak vagy másodpéldányainak a nyilvánosság számára hozzáférhető kommunikációs szolgáltatásokból történő törlésére vonatkozóan, a 17. cikk (2) bekezdésben említettek szerint;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(e)',
  'e) saját kezdeményezésére, illetve valamely tagjának vagy a Bizottságnak a kérésére megvizsgálja az e rendelet alkalmazását érintő kérdéseket, valamint e rendelet egységes alkalmazásának elősegítése érdekében iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(f)',
  'f) e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki a 22. cikk (2) bekezdése szerinti profilalkotáson alapuló döntéshozatalra vonatkozó szempontok és feltételek további pontosítása érdekében;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(g)',
  'g) e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki a 33. cikk (1) és (2) bekezdésében említett adatvédelmi incidens és indokolatlan késedelem tényének megállapítására, valamint azokra a konkrét körülményekre vonatkozóan, amelyek fennállása esetén az adatkezelőnek vagy az adatfeldolgozónak be kell jelentenie az adatvédelmi incidenst;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(h)',
  'h) e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki azokra a körülményekre vonatkozóan, amelyek fennállása esetén az adatvédelmi incidens valószínűsíthetően magas kockázattal jár a természetes személyek jogaira és szabadságaira nézve, a 34. cikk (1) bekezdésében említettek szerint;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(i)',
  'i) e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki az adatkezelők, illetve az adatfeldolgozók által követett, a kötelező erejű vállalati szabályokon alapuló, személyes adatok továbbítására vonatkozó, a 47. cikkben említett szempontok és követelmények, valamint az érintettek személyes adatainak védelmét biztosítani hivatott ugyanazon cikkben említett egyéb szükséges követelmények további pontosítása céljából;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(j)',
  'j) e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki a személyes adatoknak a 49. cikk (1) bekezdése alapján történő továbbítására vonatkozó szempontok és előírások további pontosítása céljából;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(k)',
  'k) iránymutatásokat dolgoz ki a felügyeleti hatóságok számára az 58. cikk (1), (2) és (3) bekezdésében említett intézkedések alkalmazására, valamint a 83. cikk szerinti közigazgatási bírságok megállapítására vonatkozóan;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(l)',
  'l) felülvizsgálja az e), illetve f) pontban említett iránymutatások, ajánlások és legjobb gyakorlatok gyakorlati alkalmazását;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(m)',
  'm) e bekezdés e) pontjával összhangban iránymutatásokat, ajánlásokat és legjobb gyakorlatokat bocsát ki az 54. cikk (2) bekezdésben említett, a természetes személyek által e rendelet megsértését illetően tett bejelentésekre vonatkozó közös eljárások megállapítása érdekében,;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(n)',
  'n) ösztönzi a magatartási kódexek kidolgozását, valamint az adatvédelmi tanúsítási mechanizmusok és az adatvédelmi bélyegzők, illetve jelölések létrehozását a 40. és 42. cikkben említettek szerint;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(o)',
  'o) a 43. cikknek megfelelően elvégzi a tanúsító szervezetek akkreditációját és annak rendszeres felülvizsgálatát, nyilvános nyilvántartást vezet egyrészt a 43. cikk (6) bekezdése szerint az akkreditált szervezetekről, másrészt a 42. cikk (7) bekezdése szerint a harmadik országban tevékenységi hellyel rendelkező akkreditált adatkezelőkről és adatfeldolgozókról;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(p)',
  'p) részletesen meghatározza a 43. cikk (3) bekezdésében említett követelményeket a tanúsító szervezetek 42. cikk szerinti akkreditációja céljából;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(q)',
  'q) véleményezi a Bizottság számára a 43. cikk (8) bekezdésében említett tanúsítási követelményeket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(r)',
  'r) véleményezi a Bizottság számára a 12. cikk (7) bekezdésében említett ikonokat;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(s)',
  's) véleményt bocsát ki a Bizottság számára a valamely harmadik országban vagy nemzetközi szervezetben biztosított védelmi szint megfelelőségének megítéléséhez, ideértve annak megállapítását is, ha a harmadik ország, a harmadik ország valamely területe vagy egy vagy több meghatározott ágazata, vagy a nemzetközi szervezet már nem biztosít megfelelő védelmi szintet. A Bizottság e célból biztosítja a Testület számára az összes szükséges dokumentációt, köztük a harmadik ország kormányával, a harmadik ország, annak valamely területe vagy meghatározott ágazata tekintetében, illetve a nemzetközi szervezettel folytatott levélváltást;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(t)',
  't) az egységességi mechanizmus keretében véleményt bocsát ki a felügyeleti hatóságok 64 cikk (1) bekezdése szerinti döntéstervezeteiről, a 64. cikk (2) bekezdésének megfelelően elé terjesztett ügyekről,, valamint a 65. cikk értelmében – ideértve a 66. cikkben említett eseteket is – kötelező erejű döntéseket hoz;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(u)',
  'u) előmozdítja az együttműködést, valamint az információk és gyakorlatok hatékony két- vagy többoldalú cseréjét a felügyeleti hatóságok között;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(v)',
  'v) támogatja a közös képzési programokat, továbbá megkönnyíti a csereprogramokat a felügyeleti hatóságok között, valamint adott esetben harmadik országok felügyeleti hatóságaival vagy nemzetközi szervezetekkel;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(w)',
  'w) az adatvédelmi felügyeleti hatóságok körében világszerte előmozdítja az adatvédelmi jogszabályokra és gyakorlatokra vonatkozó ismeretek és dokumentáció cseréjét;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(x)',
  'x) véleményt bocsát ki a 40. cikk (9) bekezdése szerinti, uniós szinten kidolgozott magatartási kódexekről; és',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '1(y)',
  'y) nyilvánosan hozzáférhető elektronikus nyilvántartást vezet az egységességi mechanizmus keretében kezelt ügyekkel kapcsolatban a felügyeleti hatóságok és a bíróságok által hozott határozatokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '2',
  '(2) A Bizottság, ha tanácsot kér a Testülettől, az ügy sürgősségét figyelembe véve határidőt jelölhet meg.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '3',
  '(3) A Testület továbbítja a véleményeit, iránymutatásait, ajánlásait és legjobb gyakorlatait a Bizottságnak és a 93. cikkben említett bizottságnak, és nyilvánosságra hozza azokat.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '70',
  '4',
  '(4) A Testület adott esetben konzultál az érintett felekkel, és lehetőséget biztosít számukra, hogy észszerű határidőn belül közöljék észrevételeiket. A Testület, a 76. cikk sérelme nélkül,nyilvánosan elérhetővé teszi a konzultációs eljárás eredményeit.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '71',
  null,
  'Jelentések
(1) A Testület éves jelentést készít a természetes személyeknek az Unióban, valamint adott esetben harmadik országokban és nemzetközi szervezetekben folyó adatkezelés tekintetében történő védelméről. A jelentést közzé kell tenni, és továbbítani kell az Európai Parlamentnek, a Tanácsnak és a Bizottságnak.

(2) Az éves jelentés tartalmazza a 70. cikk (1) bekezdésének l) pontjában említett iránymutatások, ajánlások és legjobb gyakorlatok gyakorlati alkalmazásának, valamint a 65. cikkben említett kötelező erejű határozatoknak az áttekintését.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_71'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '71',
  '1',
  '(1) A Testület éves jelentést készít a természetes személyeknek az Unióban, valamint adott esetben harmadik országokban és nemzetközi szervezetekben folyó adatkezelés tekintetében történő védelméről. A jelentést közzé kell tenni, és továbbítani kell az Európai Parlamentnek, a Tanácsnak és a Bizottságnak.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_71'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '71',
  '2',
  '(2) Az éves jelentés tartalmazza a 70. cikk (1) bekezdésének l) pontjában említett iránymutatások, ajánlások és legjobb gyakorlatok gyakorlati alkalmazásának, valamint a 65. cikkben említett kötelező erejű határozatoknak az áttekintését.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_71'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '72',
  null,
  'Eljárás
(1) A Testület tagjainak egyszerű többségével hozza meg döntéseit, kivéve, ha ez a rendelet eltérően rendelkezik.

(2) A Testület tagjainak kétharmados többségével elfogadja saját eljárási szabályzatát, és megállapítja működési rendjét.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_72'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '72',
  '1',
  '(1) A Testület tagjainak egyszerű többségével hozza meg döntéseit, kivéve, ha ez a rendelet eltérően rendelkezik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_72'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '72',
  '2',
  '(2) A Testület tagjainak kétharmados többségével elfogadja saját eljárási szabályzatát, és megállapítja működési rendjét.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_72'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '73',
  null,
  'Az elnök
(1) A Testület a tagjai közül egyszerű többséggel elnököt és két elnökhelyettest választ.

(2) Az elnök és az elnökhelyettesek megbízatása öt évre szól, és egy alkalommal megújítható.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '73',
  '1',
  '(1) A Testület a tagjai közül egyszerű többséggel elnököt és két elnökhelyettest választ.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '73',
  '2',
  '(2) Az elnök és az elnökhelyettesek megbízatása öt évre szól, és egy alkalommal megújítható.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '74',
  null,
  'Az elnök feladatai
(1) Az elnök feladatai a következők:

a)

összehívja a Testület üléseit, és összeállítja azok napirendjét;

b)

a Testület által a 65. cikknek megfelelően elfogadott döntéseket közli a fő felügyeleti hatósággal és az érintett felügyeleti hatóságokkal;

c)

biztosítja a Testület feladatainak időben történő elvégzését, különösen az 63. cikkben említett egységességi mechanizmussal összefüggésben.

(2) A Testületnek az eljárási szabályzatában meghatározza az elnök és az elnökhelyettesek közötti feladatmegosztást.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '74',
  '1',
  '(1) Az elnök feladatai a következők:

a)

összehívja a Testület üléseit, és összeállítja azok napirendjét;

b)

a Testület által a 65. cikknek megfelelően elfogadott döntéseket közli a fő felügyeleti hatósággal és az érintett felügyeleti hatóságokkal;

c)

biztosítja a Testület feladatainak időben történő elvégzését, különösen az 63. cikkben említett egységességi mechanizmussal összefüggésben.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '74',
  '1(a)',
  'a) összehívja a Testület üléseit, és összeállítja azok napirendjét;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '74',
  '1(b)',
  'b) a Testület által a 65. cikknek megfelelően elfogadott döntéseket közli a fő felügyeleti hatósággal és az érintett felügyeleti hatóságokkal;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '74',
  '1(c)',
  'c) biztosítja a Testület feladatainak időben történő elvégzését, különösen az 63. cikkben említett egységességi mechanizmussal összefüggésben.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '74',
  '2',
  '(2) A Testületnek az eljárási szabályzatában meghatározza az elnök és az elnökhelyettesek közötti feladatmegosztást.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  null,
  'Titkárság
(1) A Testület titkársággal rendelkezik, amelyet az európai adatvédelmi biztos biztosít.

(2) A titkárság kizárólag a Testület elnökének utasításai alapján végzi a feladatait.

(3) Az európai adatvédelmi biztos azon alkalmazottait, akik az e rendelettel a Testületre ruházott feladatok ellátásában részt vesznek, az európai adatvédelmi biztosra ruházott feladatok ellátásában részt vevő alkalmazottaktól eltérő függelmi rendszerben kell alkalmazni.

(4) A Testület és az európai adatvédelmi biztos adott esetben e cikk végrehajtásáról egyetértési megállapodást kötnek, amelyet közzétesznek, és ebben rendelkeznek együttműködésük feltételeiről; e megállapodást kell alkalmazni az európai adatvédelmi biztos hivatalának azon alkalmazottaira, akik részt vesznek az e rendelettel a Testületre ruházott feladatok ellátásában.

(5) A titkárság elemzési, igazgatási és logisztikai támogatást nyújt a Testületnek.

(6) A titkárság különösen a következőkért felel:

a)

a Testület napi működése;

b)

a Testület tagjai, elnöke és a Bizottság közötti kommunikáció,

c)

a más intézményekkel és a nyilvánossággal folytatott kommunikáció;

d)

az elektronikus eszközök használata a belső és külső kommunikáció céljára;

e)

a releváns információk fordítása;

f)

a Testület üléseinek előkészítése és az azokat követő intézkedések;

g)

a Testület által elfogadott vélemények, a felügyeleti hatóságok közötti viták rendezéséről szóló döntések és egyéb szövegek előkészítése, szövegezése és közzététele.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '1',
  '(1) A Testület titkársággal rendelkezik, amelyet az európai adatvédelmi biztos biztosít.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '2',
  '(2) A titkárság kizárólag a Testület elnökének utasításai alapján végzi a feladatait.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '3',
  '(3) Az európai adatvédelmi biztos azon alkalmazottait, akik az e rendelettel a Testületre ruházott feladatok ellátásában részt vesznek, az európai adatvédelmi biztosra ruházott feladatok ellátásában részt vevő alkalmazottaktól eltérő függelmi rendszerben kell alkalmazni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '4',
  '(4) A Testület és az európai adatvédelmi biztos adott esetben e cikk végrehajtásáról egyetértési megállapodást kötnek, amelyet közzétesznek, és ebben rendelkeznek együttműködésük feltételeiről; e megállapodást kell alkalmazni az európai adatvédelmi biztos hivatalának azon alkalmazottaira, akik részt vesznek az e rendelettel a Testületre ruházott feladatok ellátásában.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '5',
  '(5) A titkárság elemzési, igazgatási és logisztikai támogatást nyújt a Testületnek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '6',
  '(6) A titkárság különösen a következőkért felel:

a)

a Testület napi működése;

b)

a Testület tagjai, elnöke és a Bizottság közötti kommunikáció,

c)

a más intézményekkel és a nyilvánossággal folytatott kommunikáció;

d)

az elektronikus eszközök használata a belső és külső kommunikáció céljára;

e)

a releváns információk fordítása;

f)

a Testület üléseinek előkészítése és az azokat követő intézkedések;

g)

a Testület által elfogadott vélemények, a felügyeleti hatóságok közötti viták rendezéséről szóló döntések és egyéb szövegek előkészítése, szövegezése és közzététele.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '6(a)',
  'a) a Testület napi működése;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '6(b)',
  'b) a Testület tagjai, elnöke és a Bizottság közötti kommunikáció,',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '6(c)',
  'c) a más intézményekkel és a nyilvánossággal folytatott kommunikáció;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '6(d)',
  'd) az elektronikus eszközök használata a belső és külső kommunikáció céljára;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '6(e)',
  'e) a releváns információk fordítása;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '6(f)',
  'f) a Testület üléseinek előkészítése és az azokat követő intézkedések;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '75',
  '6(g)',
  'g) a Testület által elfogadott vélemények, a felügyeleti hatóságok közötti viták rendezéséről szóló döntések és egyéb szövegek előkészítése, szövegezése és közzététele.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '76',
  null,
  'Titoktartás
(1) A Testület megbeszélései az eljárási szabályzat előírásai szerint titkosak, ha a Testület azt szükségesnek tartja.

(2) A Testület tagjainak, a szakértőknek és a harmadik felek képviselőinek benyújtott dokumentumokhoz való hozzáférésre az 1049/2001/EK európai parlamenti és tanácsi rendelet ( 21 ) az irányadó.

VIII. FEJEZET

Jogorvoslat, felelősség és szankciók',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_76'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '76',
  '1',
  '(1) A Testület megbeszélései az eljárási szabályzat előírásai szerint titkosak, ha a Testület azt szükségesnek tartja.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_76'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '76',
  '2',
  '(2) A Testület tagjainak, a szakértőknek és a harmadik felek képviselőinek benyújtott dokumentumokhoz való hozzáférésre az 1049/2001/EK európai parlamenti és tanácsi rendelet ( 21 ) az irányadó.

VIII. FEJEZET

Jogorvoslat, felelősség és szankciók',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_76'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '77',
  null,
  'A felügyeleti hatóságnál történő panasztételhez való jog
(1) Az egyéb közigazgatási vagy bírósági jogorvoslatok sérelme nélkül, minden érintett jogosult arra, hogy panaszt tegyen egy felügyeleti hatóságnál – különösen a szokásos tartózkodási helye, a munkahelye vagy a feltételezett jogsértés helye szerinti tagállamban –, ha az érintett megítélése szerint a rá vonatkozó személyes adatok kezelése megsérti e rendeletet.

(2) Az a felügyeleti hatóság, amelyhez a panaszt benyújtották, köteles tájékoztatni az ügyfelet a panasszal kapcsolatos eljárási fejleményekről és annak eredményéről, ideértve azt is, hogy a 78. cikk alapján az ügyfél jogosult bírósági jogorvoslattal élni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_77'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '77',
  '1',
  '(1) Az egyéb közigazgatási vagy bírósági jogorvoslatok sérelme nélkül, minden érintett jogosult arra, hogy panaszt tegyen egy felügyeleti hatóságnál – különösen a szokásos tartózkodási helye, a munkahelye vagy a feltételezett jogsértés helye szerinti tagállamban –, ha az érintett megítélése szerint a rá vonatkozó személyes adatok kezelése megsérti e rendeletet.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_77'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '77',
  '2',
  '(2) Az a felügyeleti hatóság, amelyhez a panaszt benyújtották, köteles tájékoztatni az ügyfelet a panasszal kapcsolatos eljárási fejleményekről és annak eredményéről, ideértve azt is, hogy a 78. cikk alapján az ügyfél jogosult bírósági jogorvoslattal élni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_77'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '78',
  null,
  'A felügyeleti hatósággal szembeni hatékony bírósági jogorvoslathoz való jog
(1) Az egyéb közigazgatási vagy nem bírósági útra tartozó jogorvoslatok sérelme nélkül, minden természetes és jogi személy jogosult a hatékony bírósági jogorvoslatra a felügyeleti hatóság rá vonatkozó, jogilag kötelező erejű döntésével szemben.

(2) Az egyéb közigazgatási vagy nem bírósági útra tartozó jogorvoslatok sérelme nélkül, minden érintett jogosult a hatékony bírósági jogorvoslatra, ha az 55. vagy 56. cikk alapján illetékes felügyeleti hatóság nem foglalkozik a panasszal, vagy három hónapon belül nem tájékoztatja az érintettet a 77. cikk alapján benyújtott panasszal kapcsolatos eljárási fejleményekről vagy annak eredményéről.

(3) A felügyeleti hatósággal szembeni eljárást a felügyeleti hatóság székhelye szerinti tagállam bírósága előtt kell megindítani.

(4) Ha a felügyeleti hatóság olyan döntése ellen indítanak eljárást, amellyel kapcsolatban az egységességi mechanizmus keretében a Testület előzőleg véleményt bocsátott ki vagy döntést hozott, a felügyeleti hatóság köteles ezt a véleményt vagy döntést a bíróságnak megküldeni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '78',
  '1',
  '(1) Az egyéb közigazgatási vagy nem bírósági útra tartozó jogorvoslatok sérelme nélkül, minden természetes és jogi személy jogosult a hatékony bírósági jogorvoslatra a felügyeleti hatóság rá vonatkozó, jogilag kötelező erejű döntésével szemben.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '78',
  '2',
  '(2) Az egyéb közigazgatási vagy nem bírósági útra tartozó jogorvoslatok sérelme nélkül, minden érintett jogosult a hatékony bírósági jogorvoslatra, ha az 55. vagy 56. cikk alapján illetékes felügyeleti hatóság nem foglalkozik a panasszal, vagy három hónapon belül nem tájékoztatja az érintettet a 77. cikk alapján benyújtott panasszal kapcsolatos eljárási fejleményekről vagy annak eredményéről.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '78',
  '3',
  '(3) A felügyeleti hatósággal szembeni eljárást a felügyeleti hatóság székhelye szerinti tagállam bírósága előtt kell megindítani.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '78',
  '4',
  '(4) Ha a felügyeleti hatóság olyan döntése ellen indítanak eljárást, amellyel kapcsolatban az egységességi mechanizmus keretében a Testület előzőleg véleményt bocsátott ki vagy döntést hozott, a felügyeleti hatóság köteles ezt a véleményt vagy döntést a bíróságnak megküldeni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '79',
  null,
  'Az adatkezelővel vagy az adatfeldolgozóval szembeni hatékony bírósági jogorvoslathoz való jog
(1) A rendelkezésre álló közigazgatási vagy nem bírósági útra tartozó jogorvoslatok – köztük a felügyeleti hatóságnál történő panasztételhez való, 77. cikk szerinti jog – sérelme nélkül, minden érintett hatékony bírósági jogorvoslatra jogosult, ha megítélése szerint a személyes adatainak e rendeletnek nem megfelelő kezelése következtében megsértették az e rendelet szerinti jogait.

(2) Az adatkezelővel vagy az adatfeldolgozóval szembeni eljárást az adatkezelő vagy az adatfeldolgozó tevékenységi helye szerinti tagállam bírósága előtt kell megindítani. Az ilyen eljárás megindítható az érintett szokásos tartózkodási helye szerinti tagállam bírósága előtt is, kivéve, ha az adatkezelő vagy az adatfeldolgozó valamely tagállamnak a közhatalmi jogkörében eljáró közhatalmi szerve.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '79',
  '1',
  '(1) A rendelkezésre álló közigazgatási vagy nem bírósági útra tartozó jogorvoslatok – köztük a felügyeleti hatóságnál történő panasztételhez való, 77. cikk szerinti jog – sérelme nélkül, minden érintett hatékony bírósági jogorvoslatra jogosult, ha megítélése szerint a személyes adatainak e rendeletnek nem megfelelő kezelése következtében megsértették az e rendelet szerinti jogait.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '79',
  '2',
  '(2) Az adatkezelővel vagy az adatfeldolgozóval szembeni eljárást az adatkezelő vagy az adatfeldolgozó tevékenységi helye szerinti tagállam bírósága előtt kell megindítani. Az ilyen eljárás megindítható az érintett szokásos tartózkodási helye szerinti tagállam bírósága előtt is, kivéve, ha az adatkezelő vagy az adatfeldolgozó valamely tagállamnak a közhatalmi jogkörében eljáró közhatalmi szerve.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '80',
  null,
  'Az érintettek képviselete
(1) Az érintett jogosult arra, hogy panaszának a nevében történő benyújtásával, a 77., 78. és 79. cikkben említett jogoknak a nevében való gyakorlásával, valamint – ha a tagállam joga ezt lehetővé teszi – a 82. cikkben említett kártérítési jognak a nevében történő érvényesítésével olyan nonprofit jellegű szervet, szervezetet vagy egyesületet bízzon meg, amelyet valamely tagállam jogának megfelelően hoztak létre, és amelynek az alapszabályában rögzített céljai a közérdeket szolgálják, és amely az érintettek jogainak és szabadságainak a személyes adataik vonatkozásában biztosított védelme területén tevékenykedik.

(2) A tagállamok rendelkezhetnek úgy, hogy az adott tagállamban az e cikk (1) bekezdésében említett bármely szerv, szervezet vagy egyesület – az érintettől kapott megbízástól függetlenül – jogosult legyen arra, hogy a 77. cikk alapján eljárni jogosult felügyeleti hatósághoz panaszt nyújtson be, valamint hogy gyakorolja a 78. és 79. cikkben említett jogokat, ha megítélése szerint az érintett személyes adatainak kezelése következtében megsértették az érintett e rendelet szerinti jogait.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_80'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '80',
  '1',
  '(1) Az érintett jogosult arra, hogy panaszának a nevében történő benyújtásával, a 77., 78. és 79. cikkben említett jogoknak a nevében való gyakorlásával, valamint – ha a tagállam joga ezt lehetővé teszi – a 82. cikkben említett kártérítési jognak a nevében történő érvényesítésével olyan nonprofit jellegű szervet, szervezetet vagy egyesületet bízzon meg, amelyet valamely tagállam jogának megfelelően hoztak létre, és amelynek az alapszabályában rögzített céljai a közérdeket szolgálják, és amely az érintettek jogainak és szabadságainak a személyes adataik vonatkozásában biztosított védelme területén tevékenykedik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_80'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '80',
  '2',
  '(2) A tagállamok rendelkezhetnek úgy, hogy az adott tagállamban az e cikk (1) bekezdésében említett bármely szerv, szervezet vagy egyesület – az érintettől kapott megbízástól függetlenül – jogosult legyen arra, hogy a 77. cikk alapján eljárni jogosult felügyeleti hatósághoz panaszt nyújtson be, valamint hogy gyakorolja a 78. és 79. cikkben említett jogokat, ha megítélése szerint az érintett személyes adatainak kezelése következtében megsértették az érintett e rendelet szerinti jogait.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_80'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '81',
  null,
  'Az eljárás felfüggesztése
(1) Ha valamely tagállam illetékes bírósága információval rendelkezik arról, hogy ugyanazon adatkezelő vagy adatfeldolgozó adatkezelése tekintetében, ugyanabban a tárgyban egy másik tagállam bírósága előtt eljárás van folyamatban, köteles megkeresni e másik tagállam bíróságát, hogy megbizonyosodjon arról, valóban folyamatban van-e ilyen eljárás.

(2) Ha ugyanazon adatkezelő vagy adatfeldolgozó adatkezelése tekintetében, ugyanabban a tárgyban egy másik tagállam bírósága előtt eljárás van folyamatban, valamennyi olyan illetékes bíróság, amely előtt az eljárás később indult meg, felfüggesztheti az előtte folyó eljárást.

(3) Ha ezen eljárások első fokon vannak folyamatban, valamennyi olyan bíróság, amely előtt az eljárás később indult meg, valamely fél kérelmére joghatóságának hiányát is megállapíthatja, ha az említett eljárásokra az a bíróság, amely előtt elsőként indult meg az eljárás, joghatósággal rendelkezik, és a rá vonatkozó jog az eljárások egyesítését lehetővé teszi.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_81'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '81',
  '1',
  '(1) Ha valamely tagállam illetékes bírósága információval rendelkezik arról, hogy ugyanazon adatkezelő vagy adatfeldolgozó adatkezelése tekintetében, ugyanabban a tárgyban egy másik tagállam bírósága előtt eljárás van folyamatban, köteles megkeresni e másik tagállam bíróságát, hogy megbizonyosodjon arról, valóban folyamatban van-e ilyen eljárás.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_81'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '81',
  '2',
  '(2) Ha ugyanazon adatkezelő vagy adatfeldolgozó adatkezelése tekintetében, ugyanabban a tárgyban egy másik tagállam bírósága előtt eljárás van folyamatban, valamennyi olyan illetékes bíróság, amely előtt az eljárás később indult meg, felfüggesztheti az előtte folyó eljárást.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_81'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '81',
  '3',
  '(3) Ha ezen eljárások első fokon vannak folyamatban, valamennyi olyan bíróság, amely előtt az eljárás később indult meg, valamely fél kérelmére joghatóságának hiányát is megállapíthatja, ha az említett eljárásokra az a bíróság, amely előtt elsőként indult meg az eljárás, joghatósággal rendelkezik, és a rá vonatkozó jog az eljárások egyesítését lehetővé teszi.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_81'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '82',
  null,
  'A kártérítéshez való jog és a felelősség
(1) Minden olyan személy, aki e rendelet megsértésének eredményeként vagyoni vagy nem vagyoni kárt szenvedett, az elszenvedett kárért az adatkezelőtől vagy az adatfeldolgozótól kártérítésre jogosult.

(2) Az adatkezelésben érintett valamennyi adatkezelő felelősséggel tartozik minden olyan kárért, amelyet az e rendeletet sértő adatkezelés okozott. Az adatfeldolgozó csak abban az esetben tartozik felelősséggel az adatkezelés által okozott károkért, ha nem tartotta be az e rendeletben meghatározott, kifejezetten az adatfeldolgozókat terhelő kötelezettségeket, vagy ha az adatkezelő jogszerű utasításait figyelmen kívül hagyta vagy azokkal ellentétesen járt el.

(3) Az adatkezelő, illetve az adatfeldolgozó mentesül az e cikk (2) bekezdése szerinti felelősség alól, ha bizonyítja, hogy a kárt előidéző eseményért őt semmilyen módon nem terheli felelősség.

(4) Ha több adatkezelő vagy több adatfeldolgozó vagy mind az adatkezelő mind az adatfeldolgozó érintett ugyanabban az adatkezelésben, és – a (2) és (3) bekezdés alapján – felelősséggel tartozik az adatkezelés által okozott károkért, minden egyes adatkezelő vagy adatfeldolgozó az érintett tényleges kártérítésének biztosítása érdekében egyetemleges felelősséggel tartozik a teljes kárért.

(5) Ha valamely adatkezelő vagy adatfeldolgozó a (4) bekezdéssel összhangban teljes kártérítést fizetett az elszenvedett kárért, jogosult arra, hogy az ugyanazon adatkezelésben érintett többi adatkezelőtől vagy adatfeldolgozótól visszaigényelje a kártérítésnek azt a részét, amely megfelel a (2) bekezdésben megállapított feltételek értelmében a károkozásért viselt felelősségük mértékének.

(6) A kártérítéshez való jog érvényesítését célzó bírósági eljárást az előtt a bíróság előtt kell megindítani, amely a 79. cikk (2) bekezdésében említett tagállam joga szerint illetékes.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '82',
  '1',
  '(1) Minden olyan személy, aki e rendelet megsértésének eredményeként vagyoni vagy nem vagyoni kárt szenvedett, az elszenvedett kárért az adatkezelőtől vagy az adatfeldolgozótól kártérítésre jogosult.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '82',
  '2',
  '(2) Az adatkezelésben érintett valamennyi adatkezelő felelősséggel tartozik minden olyan kárért, amelyet az e rendeletet sértő adatkezelés okozott. Az adatfeldolgozó csak abban az esetben tartozik felelősséggel az adatkezelés által okozott károkért, ha nem tartotta be az e rendeletben meghatározott, kifejezetten az adatfeldolgozókat terhelő kötelezettségeket, vagy ha az adatkezelő jogszerű utasításait figyelmen kívül hagyta vagy azokkal ellentétesen járt el.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '82',
  '3',
  '(3) Az adatkezelő, illetve az adatfeldolgozó mentesül az e cikk (2) bekezdése szerinti felelősség alól, ha bizonyítja, hogy a kárt előidéző eseményért őt semmilyen módon nem terheli felelősség.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '82',
  '4',
  '(4) Ha több adatkezelő vagy több adatfeldolgozó vagy mind az adatkezelő mind az adatfeldolgozó érintett ugyanabban az adatkezelésben, és – a (2) és (3) bekezdés alapján – felelősséggel tartozik az adatkezelés által okozott károkért, minden egyes adatkezelő vagy adatfeldolgozó az érintett tényleges kártérítésének biztosítása érdekében egyetemleges felelősséggel tartozik a teljes kárért.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '82',
  '5',
  '(5) Ha valamely adatkezelő vagy adatfeldolgozó a (4) bekezdéssel összhangban teljes kártérítést fizetett az elszenvedett kárért, jogosult arra, hogy az ugyanazon adatkezelésben érintett többi adatkezelőtől vagy adatfeldolgozótól visszaigényelje a kártérítésnek azt a részét, amely megfelel a (2) bekezdésben megállapított feltételek értelmében a károkozásért viselt felelősségük mértékének.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '82',
  '6',
  '(6) A kártérítéshez való jog érvényesítését célzó bírósági eljárást az előtt a bíróság előtt kell megindítani, amely a 79. cikk (2) bekezdésében említett tagállam joga szerint illetékes.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  null,
  'A közigazgatási bírságok kiszabására vonatkozó általános feltételek
(1) Valamennyi felügyeleti hatóság biztosítja, hogy e rendeletnek a (4), (5), (6) bekezdésben említett megsértése miatt az e cikk alapján kiszabott közigazgatási bírságok minden egyes esetben hatékonyak, arányosak és visszatartó erejűek legyenek.

(2) A közigazgatási bírságokat az adott eset körülményeitől függően az 58. cikk (2) bekezdésének a)–h) és j) pontjában említett intézkedések mellett vagy helyett kell kiszabni. Annak eldöntésekor, hogy szükség van-e közigazgatási bírság kiszabására, illetve a közigazgatási bírság összegének megállapításakor minden egyes esetben kellőképpen figyelembe kell venni a következőket:

a)

a jogsértés jellege, súlyossága és időtartama, figyelembe véve a szóban forgó adatkezelés jellegét, körét vagy célját, továbbá azon érintettek száma, akiket a jogsértés érint, valamint az általuk elszenvedett kár mértéke;

b)

a jogsértés szándékos vagy gondatlan jellege;

c)

az adatkezelő vagy az adatfeldolgozó részéről az érintettek által elszenvedett kár enyhítése érdekében tett bármely intézkedés;

d)

az adatkezelő vagy az adatfeldolgozó felelősségének mértéke, figyelembe véve az általa a 25. és 32. cikk alapján foganatosított technikai és szervezési intézkedéseket;

e)

az adatkezelő vagy az adatfeldolgozó által korábban elkövetett releváns jogsértések;

f)

a felügyeleti hatósággal a jogsértés orvoslása és a jogsértés esetlegesen negatív hatásainak enyhítése érdekében folytatott együttműködés mértéke;

g)

a jogsértés által érintett személyes adatok kategóriái;

h)

az, ahogyan a felügyeleti hatóság tudomást szerzett a jogsértésről, különös tekintettel arra, hogy az adatkezelő vagy az adatfeldolgozó jelentette-e be a jogsértést, és ha igen, milyen részletességgel;

i)

ha az érintett adatkezelővel vagy adatfeldolgozóval szemben korábban – ugyanabban a tárgyban – elrendelték az 58. cikk (2) bekezdésében említett intézkedések valamelyikét, a szóban forgó intézkedéseknek való megfelelés;

j)

az, hogy az adatkezelő vagy az adatfeldolgozó tartotta-e magát a 40. cikk szerinti jóváhagyott magatartási kódexekhez vagy a 42. cikk szerinti jóváhagyott tanúsítási mechanizmusokhoz; valamint

k)

az eset körülményei szempontjából releváns egyéb súlyosbító vagy enyhítő tényezők, például a jogsértés közvetlen vagy közvetett következményeként szerzett pénzügyi haszon vagy elkerült veszteség.

(3) Ha egy adatkezelő vagy adatfeldolgozó egyazon adatkezelési művelet vagy egymáshoz kapcsolódó adatkezelési műveletek tekintetében – szándékosan vagy gondatlanságból – e rendelet több rendelkezését is megsérti, a bírság teljes összege nem haladhatja meg a legsúlyosabb jogsértés esetén meghatározott összeget.

(4) Az alábbi rendelkezések megsértése – a (2) bekezdéssel összhangban – legfeljebb 10 000 000 EUR összegű közigazgatási bírsággal, illetve a vállalkozások esetében az előző pénzügyi év teljes éves világpiaci forgalmának legfeljebb 2 %-át kitevő összeggel sújtható; a kettő közül a magasabb összeget kell kiszabni:

a)

az adatkezelő és az adatfeldolgozó tekintetében a 8., a 11., a 25-39., a 42. és a 43. cikkben meghatározott kötelezettségek;

b)

a tanúsító szervezet tekintetében a 42. és 43. cikkben meghatározott kötelezettségek;

c)

az ellenőrző szervezet tekintetében a 41. cikk (4) bekezdésében meghatározott kötelezettségek;

(5) Az alábbi rendelkezések megsértését – a (2) bekezdéssel összhangban – legfeljebb 20 000 000 EUR összegű közigazgatási bírsággal, illetve a vállalkozások esetében az előző pénzügyi év teljes éves világpiaci forgalmának legfeljebb 4 %-át kitevő összeggel kell sújtani, azzal, hogy a kettő közül a magasabb összeget kell kiszabni:

a)

az adatkezelés elvei – ideértve a hozzájárulás feltételeit – az 5., 6., 7. és 9. cikknek megfelelően;

b)

az érintettek jogai a 12–22. cikknek megfelelően;

c)

személyes adatoknak harmadik országbeli címzett vagy nemzetközi szervezet részére történő továbbítása a 44–49. cikknek megfelelően;

d)

a IX. fejezet alapján elfogadott tagállami jog szerinti kötelezettségek;

e)

a felügyeleti hatóság 58. cikk (2) bekezdése szerinti utasításának, illetve az adatkezelés átmeneti vagy végleges korlátozására vagy az adatáramlás felfüggesztésére vonatkozó felszólításának be nem tartása vagy az 58. cikk (1) bekezdését megsértve a hozzáférés biztosításának elmulasztása.

(6) A felügyeleti hatóság 58. cikk (2) bekezdése szerinti utasításának be nem tartása – az e cikk (2) bekezdésével összhangban – legfeljebb 20 000 000 EUR összegű közigazgatási bírsággal, illetve a vállalkozások esetében az előző pénzügyi év teljes éves világpiaci forgalmának legfeljebb 4 %-át kitevő összeggel sújtható; a kettő közül a magasabb összeget kell kiszabni.

(7) A felügyeleti hatóságok 58. cikk (2) bekezdése szerinti korrekciós hatáskörének sérelme nélkül, minden egyes tagállam megállapíthatja az arra vonatkozó szabályokat, hogy az adott tagállami székhelyű közhatalmi vagy egyéb, közfeladatot ellátó szervvel szemben kiszabható-e közigazgatási bírság, és ha igen, milyen mértékű.

(8) A felügyeleti hatóság e cikk szerinti hatásköreit megfelelő, az uniós és a tagállami joggal összhangban álló eljárási garanciák – ideértve a hatékony jogorvoslat lehetőségét és a tisztességes eljárást – biztosításával gyakorolja.

(9) Ha a tagállam jogrendszere nem rendelkezik közigazgatási bírságokról, e cikk oly módon alkalmazható, hogy a bírságot az illetékes felügyeleti hatóság kezdeményezésére az illetékes nemzeti bíróság rója ki e jogorvoslatok hatékonyságának és a felügyeleti hatóságok által kiszabott közigazgatási bírságokéval megegyező hatásának biztosítása mellett. A kiszabott bírságoknak minden esetben hatékonynak, arányosnak és visszatartó erejűnek kell lenniük. E tagállamok az e bekezdésnek megfelelően elfogadott jogszabályokról 2018. május 25-ig, az ezt követően azokat módosító jogszabályokról, illetve az azokat érintő későbbi módosításokról pedig haladéktalanul értesítik a Bizottságot.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '1',
  '(1) Valamennyi felügyeleti hatóság biztosítja, hogy e rendeletnek a (4), (5), (6) bekezdésben említett megsértése miatt az e cikk alapján kiszabott közigazgatási bírságok minden egyes esetben hatékonyak, arányosak és visszatartó erejűek legyenek.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '2',
  '(2) A közigazgatási bírságokat az adott eset körülményeitől függően az 58. cikk (2) bekezdésének a)–h) és j) pontjában említett intézkedések mellett vagy helyett kell kiszabni. Annak eldöntésekor, hogy szükség van-e közigazgatási bírság kiszabására, illetve a közigazgatási bírság összegének megállapításakor minden egyes esetben kellőképpen figyelembe kell venni a következőket:

a)

a jogsértés jellege, súlyossága és időtartama, figyelembe véve a szóban forgó adatkezelés jellegét, körét vagy célját, továbbá azon érintettek száma, akiket a jogsértés érint, valamint az általuk elszenvedett kár mértéke;

b)

a jogsértés szándékos vagy gondatlan jellege;

c)

az adatkezelő vagy az adatfeldolgozó részéről az érintettek által elszenvedett kár enyhítése érdekében tett bármely intézkedés;

d)

az adatkezelő vagy az adatfeldolgozó felelősségének mértéke, figyelembe véve az általa a 25. és 32. cikk alapján foganatosított technikai és szervezési intézkedéseket;

e)

az adatkezelő vagy az adatfeldolgozó által korábban elkövetett releváns jogsértések;

f)

a felügyeleti hatósággal a jogsértés orvoslása és a jogsértés esetlegesen negatív hatásainak enyhítése érdekében folytatott együttműködés mértéke;

g)

a jogsértés által érintett személyes adatok kategóriái;

h)

az, ahogyan a felügyeleti hatóság tudomást szerzett a jogsértésről, különös tekintettel arra, hogy az adatkezelő vagy az adatfeldolgozó jelentette-e be a jogsértést, és ha igen, milyen részletességgel;

i)

ha az érintett adatkezelővel vagy adatfeldolgozóval szemben korábban – ugyanabban a tárgyban – elrendelték az 58. cikk (2) bekezdésében említett intézkedések valamelyikét, a szóban forgó intézkedéseknek való megfelelés;

j)

az, hogy az adatkezelő vagy az adatfeldolgozó tartotta-e magát a 40. cikk szerinti jóváhagyott magatartási kódexekhez vagy a 42. cikk szerinti jóváhagyott tanúsítási mechanizmusokhoz; valamint

k)

az eset körülményei szempontjából releváns egyéb súlyosbító vagy enyhítő tényezők, például a jogsértés közvetlen vagy közvetett következményeként szerzett pénzügyi haszon vagy elkerült veszteség.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '2(a)',
  'a) a jogsértés jellege, súlyossága és időtartama, figyelembe véve a szóban forgó adatkezelés jellegét, körét vagy célját, továbbá azon érintettek száma, akiket a jogsértés érint, valamint az általuk elszenvedett kár mértéke;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '2(b)',
  'b) a jogsértés szándékos vagy gondatlan jellege;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '2(c)',
  'c) az adatkezelő vagy az adatfeldolgozó részéről az érintettek által elszenvedett kár enyhítése érdekében tett bármely intézkedés;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '2(d)',
  'd) az adatkezelő vagy az adatfeldolgozó felelősségének mértéke, figyelembe véve az általa a 25. és 32. cikk alapján foganatosított technikai és szervezési intézkedéseket;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '2(e)',
  'e) az adatkezelő vagy az adatfeldolgozó által korábban elkövetett releváns jogsértések;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '2(f)',
  'f) a felügyeleti hatósággal a jogsértés orvoslása és a jogsértés esetlegesen negatív hatásainak enyhítése érdekében folytatott együttműködés mértéke;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '2(g)',
  'g) a jogsértés által érintett személyes adatok kategóriái;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '2(h)',
  'h) az, ahogyan a felügyeleti hatóság tudomást szerzett a jogsértésről, különös tekintettel arra, hogy az adatkezelő vagy az adatfeldolgozó jelentette-e be a jogsértést, és ha igen, milyen részletességgel;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '2(i)',
  'i) ha az érintett adatkezelővel vagy adatfeldolgozóval szemben korábban – ugyanabban a tárgyban – elrendelték az 58. cikk (2) bekezdésében említett intézkedések valamelyikét, a szóban forgó intézkedéseknek való megfelelés;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '2(j)',
  'j) az, hogy az adatkezelő vagy az adatfeldolgozó tartotta-e magát a 40. cikk szerinti jóváhagyott magatartási kódexekhez vagy a 42. cikk szerinti jóváhagyott tanúsítási mechanizmusokhoz; valamint',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '2(k)',
  'k) az eset körülményei szempontjából releváns egyéb súlyosbító vagy enyhítő tényezők, például a jogsértés közvetlen vagy közvetett következményeként szerzett pénzügyi haszon vagy elkerült veszteség.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '3',
  '(3) Ha egy adatkezelő vagy adatfeldolgozó egyazon adatkezelési művelet vagy egymáshoz kapcsolódó adatkezelési műveletek tekintetében – szándékosan vagy gondatlanságból – e rendelet több rendelkezését is megsérti, a bírság teljes összege nem haladhatja meg a legsúlyosabb jogsértés esetén meghatározott összeget.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '4',
  '(4) Az alábbi rendelkezések megsértése – a (2) bekezdéssel összhangban – legfeljebb 10 000 000 EUR összegű közigazgatási bírsággal, illetve a vállalkozások esetében az előző pénzügyi év teljes éves világpiaci forgalmának legfeljebb 2 %-át kitevő összeggel sújtható; a kettő közül a magasabb összeget kell kiszabni:

a)

az adatkezelő és az adatfeldolgozó tekintetében a 8., a 11., a 25-39., a 42. és a 43. cikkben meghatározott kötelezettségek;

b)

a tanúsító szervezet tekintetében a 42. és 43. cikkben meghatározott kötelezettségek;

c)

az ellenőrző szervezet tekintetében a 41. cikk (4) bekezdésében meghatározott kötelezettségek;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '4(a)',
  'a) az adatkezelő és az adatfeldolgozó tekintetében a 8., a 11., a 25-39., a 42. és a 43. cikkben meghatározott kötelezettségek;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '4(b)',
  'b) a tanúsító szervezet tekintetében a 42. és 43. cikkben meghatározott kötelezettségek;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '4(c)',
  'c) az ellenőrző szervezet tekintetében a 41. cikk (4) bekezdésében meghatározott kötelezettségek;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '5',
  '(5) Az alábbi rendelkezések megsértését – a (2) bekezdéssel összhangban – legfeljebb 20 000 000 EUR összegű közigazgatási bírsággal, illetve a vállalkozások esetében az előző pénzügyi év teljes éves világpiaci forgalmának legfeljebb 4 %-át kitevő összeggel kell sújtani, azzal, hogy a kettő közül a magasabb összeget kell kiszabni:

a)

az adatkezelés elvei – ideértve a hozzájárulás feltételeit – az 5., 6., 7. és 9. cikknek megfelelően;

b)

az érintettek jogai a 12–22. cikknek megfelelően;

c)

személyes adatoknak harmadik országbeli címzett vagy nemzetközi szervezet részére történő továbbítása a 44–49. cikknek megfelelően;

d)

a IX. fejezet alapján elfogadott tagállami jog szerinti kötelezettségek;

e)

a felügyeleti hatóság 58. cikk (2) bekezdése szerinti utasításának, illetve az adatkezelés átmeneti vagy végleges korlátozására vagy az adatáramlás felfüggesztésére vonatkozó felszólításának be nem tartása vagy az 58. cikk (1) bekezdését megsértve a hozzáférés biztosításának elmulasztása.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '5(a)',
  'a) az adatkezelés elvei – ideértve a hozzájárulás feltételeit – az 5., 6., 7. és 9. cikknek megfelelően;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '5(b)',
  'b) az érintettek jogai a 12–22. cikknek megfelelően;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '5(c)',
  'c) személyes adatoknak harmadik országbeli címzett vagy nemzetközi szervezet részére történő továbbítása a 44–49. cikknek megfelelően;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '5(d)',
  'd) a IX. fejezet alapján elfogadott tagállami jog szerinti kötelezettségek;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '5(e)',
  'e) a felügyeleti hatóság 58. cikk (2) bekezdése szerinti utasításának, illetve az adatkezelés átmeneti vagy végleges korlátozására vagy az adatáramlás felfüggesztésére vonatkozó felszólításának be nem tartása vagy az 58. cikk (1) bekezdését megsértve a hozzáférés biztosításának elmulasztása.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '6',
  '(6) A felügyeleti hatóság 58. cikk (2) bekezdése szerinti utasításának be nem tartása – az e cikk (2) bekezdésével összhangban – legfeljebb 20 000 000 EUR összegű közigazgatási bírsággal, illetve a vállalkozások esetében az előző pénzügyi év teljes éves világpiaci forgalmának legfeljebb 4 %-át kitevő összeggel sújtható; a kettő közül a magasabb összeget kell kiszabni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '7',
  '(7) A felügyeleti hatóságok 58. cikk (2) bekezdése szerinti korrekciós hatáskörének sérelme nélkül, minden egyes tagállam megállapíthatja az arra vonatkozó szabályokat, hogy az adott tagállami székhelyű közhatalmi vagy egyéb, közfeladatot ellátó szervvel szemben kiszabható-e közigazgatási bírság, és ha igen, milyen mértékű.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '8',
  '(8) A felügyeleti hatóság e cikk szerinti hatásköreit megfelelő, az uniós és a tagállami joggal összhangban álló eljárási garanciák – ideértve a hatékony jogorvoslat lehetőségét és a tisztességes eljárást – biztosításával gyakorolja.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '83',
  '9',
  '(9) Ha a tagállam jogrendszere nem rendelkezik közigazgatási bírságokról, e cikk oly módon alkalmazható, hogy a bírságot az illetékes felügyeleti hatóság kezdeményezésére az illetékes nemzeti bíróság rója ki e jogorvoslatok hatékonyságának és a felügyeleti hatóságok által kiszabott közigazgatási bírságokéval megegyező hatásának biztosítása mellett. A kiszabott bírságoknak minden esetben hatékonynak, arányosnak és visszatartó erejűnek kell lenniük. E tagállamok az e bekezdésnek megfelelően elfogadott jogszabályokról 2018. május 25-ig, az ezt követően azokat módosító jogszabályokról, illetve az azokat érintő későbbi módosításokról pedig haladéktalanul értesítik a Bizottságot.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '84',
  null,
  'Szankciók
(1) A tagállamok megállapítják az e rendelet megsértése esetén alkalmazandó további szankciókra vonatkozó szabályokat, különösen azon jogsértések tekintetében, amelyek nem tartoznak a 83. cikkben meghatározott, közigazgatási bírságokkal sújtható jogsértések közé, és meghoznak minden szükséges intézkedést ezek végrehajtására. E szankcióknak hatékonynak, arányosnak és visszatartó erejűnek kell lenniük.

(2) A tagállamok az (1) bekezdésnek megfelelően elfogadott jogszabályokról 2018. május 25-ig, az e szabályokat érintő minden későbbi módosításról pedig haladéktalanul tájékoztatják a Bizottságot.

IX. FEJEZET

Az adatkezelés különös eseteire vonatkozó rendelkezések',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_84'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '84',
  '1',
  '(1) A tagállamok megállapítják az e rendelet megsértése esetén alkalmazandó további szankciókra vonatkozó szabályokat, különösen azon jogsértések tekintetében, amelyek nem tartoznak a 83. cikkben meghatározott, közigazgatási bírságokkal sújtható jogsértések közé, és meghoznak minden szükséges intézkedést ezek végrehajtására. E szankcióknak hatékonynak, arányosnak és visszatartó erejűnek kell lenniük.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_84'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '84',
  '2',
  '(2) A tagállamok az (1) bekezdésnek megfelelően elfogadott jogszabályokról 2018. május 25-ig, az e szabályokat érintő minden későbbi módosításról pedig haladéktalanul tájékoztatják a Bizottságot.

IX. FEJEZET

Az adatkezelés különös eseteire vonatkozó rendelkezések',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_84'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '85',
  null,
  'A személyes adatok kezelése és a véleménynyilvánítás szabadságához és a tájékozódáshoz való jog
(1) A tagállamok jogszabályban összeegyeztetik a személyes adatok e rendelet szerinti védelméhez való jogot a véleménynyilvánítás szabadságához és a tájékozódáshoz való joggal, ideértve a személyes adatok újságírási célból, illetve tudományos, művészi vagy irodalmi kifejezés céljából végzett kezelését is.

(2) A személyes adatok újságírási célból, illetve tudományos, művészi vagy irodalmi kifejezés céljából végzett kezelésére vonatkozóan a tagállamok kivételeket vagy eltéréseket határoznak meg a II. fejezet (elvek), a III. fejezet (az érintett jogai), a IV. fejezet (az adatkezelő és az adatfeldolgozó), az V. fejezet (a személyes adatok harmadik országokba vagy nemzetközi szervezetek részére történő továbbítása), a VI. fejezet (független felügyeleti hatóságok), a VII. fejezet (együttműködés és egységesség) és a IX. fejezet (az adatkezelés különös esetei) alól, ha e kivételek vagy eltérések szükségesek ahhoz, hogy a személyes adatok védelméhez való jogot össze lehessen egyeztetni a véleménynyilvánítás szabadságához és a tájékozódáshoz való joggal.

(3) A tagállamok értesítik a Bizottságot azon jogi rendelkezésekről, amelyeket a (2) bekezdés alapján elfogadtak, továbbá haladéktalanul értesítik a Bizottságot az említett jogi rendelkezéseket érintő későbbi módosító jogszabályokról, illetve módosításokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_85'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '85',
  '1',
  '(1) A tagállamok jogszabályban összeegyeztetik a személyes adatok e rendelet szerinti védelméhez való jogot a véleménynyilvánítás szabadságához és a tájékozódáshoz való joggal, ideértve a személyes adatok újságírási célból, illetve tudományos, művészi vagy irodalmi kifejezés céljából végzett kezelését is.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_85'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '85',
  '2',
  '(2) A személyes adatok újságírási célból, illetve tudományos, művészi vagy irodalmi kifejezés céljából végzett kezelésére vonatkozóan a tagállamok kivételeket vagy eltéréseket határoznak meg a II. fejezet (elvek), a III. fejezet (az érintett jogai), a IV. fejezet (az adatkezelő és az adatfeldolgozó), az V. fejezet (a személyes adatok harmadik országokba vagy nemzetközi szervezetek részére történő továbbítása), a VI. fejezet (független felügyeleti hatóságok), a VII. fejezet (együttműködés és egységesség) és a IX. fejezet (az adatkezelés különös esetei) alól, ha e kivételek vagy eltérések szükségesek ahhoz, hogy a személyes adatok védelméhez való jogot össze lehessen egyeztetni a véleménynyilvánítás szabadságához és a tájékozódáshoz való joggal.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_85'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '85',
  '3',
  '(3) A tagállamok értesítik a Bizottságot azon jogi rendelkezésekről, amelyeket a (2) bekezdés alapján elfogadtak, továbbá haladéktalanul értesítik a Bizottságot az említett jogi rendelkezéseket érintő későbbi módosító jogszabályokról, illetve módosításokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_85'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '86',
  null,
  'A személyes adatok kezelése és a hivatalos dokumentumokhoz való nyilvános hozzáférés
A közérdekű feladat teljesítése céljából közhatalmi szervek, vagy egyéb, közfeladatot ellátó szervek, illetve magánfél szervezetek birtokában lévő hivatalos dokumentumokban szereplő személyes adatokat az adott szerv vagy szervezet az uniós joggal vagy a szervre vagy szervezetre alkalmazandó tagállami joggal összhangban nyilvánosságra hozhatja annak érdekében, hogy a hivatalos dokumentumokhoz való nyilvános hozzáférést összeegyeztesse a személyes adatok e rendelet szerinti védelméhez való joggal.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_86'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '87',
  null,
  'A nemzeti azonosító számok kezelése
A tagállamok részletesebben meghatározhatják a nemzeti azonosító számok vagy egyéb általános jellegű azonosító jelek kezelésének konkrét feltételeit. Ebben az esetben a nemzeti azonosító számok, illetve az egyéb általános jellegű azonosító jelek felhasználására kizárólag az érintett jogainak és szabadságainak e rendelet szerinti megfelelő garanciái mellett kerülhet sor.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_87'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '88',
  null,
  'Adatkezelés a foglalkoztatással összefüggően
(1) A tagállamok jogszabályban vagy kollektív szerződésekben pontosabban meghatározott szabályokat állapíthatnak meg annak érdekében, hogy biztosítsák a jogok és szabadságok védelmét a munkavállalók személyes adatainak a foglalkoztatással összefüggő kezelése tekintetében, különösen a munkaerő-felvétel, a munkaszerződés teljesítése céljából, ideértve a jogszabályban vagy kollektív szerződésben meghatározott kötelezettségek teljesítését, a munka irányítását, tervezését és szervezését, a munkahelyi egyenlőséget és sokféleséget, a munkahelyi egészségvédelmet és biztonságot, a munkáltató vagy a fogyasztó tulajdonának védelmét is, továbbá a foglalkoztatáshoz kapcsolódó jogok és juttatások egyéni vagy kollektív gyakorlása és élvezete céljából, valamint a munkaviszony megszüntetése céljából.

(2) E szabályok olyan megfelelő és egyedi intézkedéseket foglalnak magukban, amelyek alkalmasak az érintett emberi méltóságának, jogos érdekeinek és alapvető jogainak megóvására, különösen az adatkezelés átláthatósága, vállalkozáscsoporton vagy a közös gazdasági tevékenységet folytató vállalkozások ugyanazon csoportján belüli adattovábbítás, valamint a munkahelyi ellenőrzési rendszerek tekintetében.

(3) Minden tagállam legkésőbb 2018. május 25-ig értesíti a Bizottságot azon jogi rendelkezésekről, amelyeket az (1) bekezdés alapján elfogad, továbbá haladéktalanul értesíti a Bizottságot az említett jogi rendelkezéseket érintő későbbi módosításokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_88'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '88',
  '1',
  '(1) A tagállamok jogszabályban vagy kollektív szerződésekben pontosabban meghatározott szabályokat állapíthatnak meg annak érdekében, hogy biztosítsák a jogok és szabadságok védelmét a munkavállalók személyes adatainak a foglalkoztatással összefüggő kezelése tekintetében, különösen a munkaerő-felvétel, a munkaszerződés teljesítése céljából, ideértve a jogszabályban vagy kollektív szerződésben meghatározott kötelezettségek teljesítését, a munka irányítását, tervezését és szervezését, a munkahelyi egyenlőséget és sokféleséget, a munkahelyi egészségvédelmet és biztonságot, a munkáltató vagy a fogyasztó tulajdonának védelmét is, továbbá a foglalkoztatáshoz kapcsolódó jogok és juttatások egyéni vagy kollektív gyakorlása és élvezete céljából, valamint a munkaviszony megszüntetése céljából.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_88'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '88',
  '2',
  '(2) E szabályok olyan megfelelő és egyedi intézkedéseket foglalnak magukban, amelyek alkalmasak az érintett emberi méltóságának, jogos érdekeinek és alapvető jogainak megóvására, különösen az adatkezelés átláthatósága, vállalkozáscsoporton vagy a közös gazdasági tevékenységet folytató vállalkozások ugyanazon csoportján belüli adattovábbítás, valamint a munkahelyi ellenőrzési rendszerek tekintetében.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_88'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '88',
  '3',
  '(3) Minden tagállam legkésőbb 2018. május 25-ig értesíti a Bizottságot azon jogi rendelkezésekről, amelyeket az (1) bekezdés alapján elfogad, továbbá haladéktalanul értesíti a Bizottságot az említett jogi rendelkezéseket érintő későbbi módosításokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_88'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '89',
  null,
  'A közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból folytatott adatkezelésre vonatkozó garanciák és eltérések
(1) A személyes adatok közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból folytatott kezelését e rendelettel összhangban az érintett jogait és szabadságait védő megfelelő garanciák mellett kell végezni. E garanciáknak biztosítaniuk kell, hogy olyan technikai és szervezési intézkedések legyenek érvényben, melyek biztosítják különösen az adattakarékosság elvének betartását. Ezen intézkedések közé tartozhat az álnevesítés, amennyiben az említett célok ily módon megvalósíthatók. Amennyiben e célok megvalósíthatók az adatok oly módon történő további kezelése révén, amely nem vagy már nem teszi lehetővé az érintettek azonosítását, a célokat ilyen módon kell megvalósítani.

(2) A személyes adatok közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból folytatott kezelése vonatkozásában az uniós vagy a tagállami jog – az e cikk (1) bekezdésében említett feltételekre és garanciákra is figyelemmel – eltérést állapíthat meg a 15., 16., 18. és 21. cikkben említett jogokat illetően, ha e jogok valószínűsíthetően lehetetlenné teszik vagy súlyosan hátráltatják az adott célok elérését, és azok megvalósításához szükség van ilyen eltérésre.

(3) A személyes adatok közérdekű archiválás céljából való kezelése vonatkozásában az uniós vagy a tagállami jog – az e cikk (1) bekezdésében említett feltételekre és garanciákra is figyelemmel – eltérést állapíthat meg a 15., 16., 18., 19., 20. és 21. cikkben említett jogokat illetően, ha e jogok valószínűsíthetően lehetetlenné teszik vagy súlyosan hátráltatják az adott célok elérését, és azok megvalósításához szükség van ilyen eltérésre.

(4) Ha a (2), illetve (3) bekezdésben említett adatkezelés egyidejűleg más célokat is szolgál, az eltérést kizárólag az érintett bekezdésben említett adatkezelési célokra kell alkalmazni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_89'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '89',
  '1',
  '(1) A személyes adatok közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból folytatott kezelését e rendelettel összhangban az érintett jogait és szabadságait védő megfelelő garanciák mellett kell végezni. E garanciáknak biztosítaniuk kell, hogy olyan technikai és szervezési intézkedések legyenek érvényben, melyek biztosítják különösen az adattakarékosság elvének betartását. Ezen intézkedések közé tartozhat az álnevesítés, amennyiben az említett célok ily módon megvalósíthatók. Amennyiben e célok megvalósíthatók az adatok oly módon történő további kezelése révén, amely nem vagy már nem teszi lehetővé az érintettek azonosítását, a célokat ilyen módon kell megvalósítani.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_89'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '89',
  '2',
  '(2) A személyes adatok közérdekű archiválás céljából, tudományos és történelmi kutatási célból vagy statisztikai célból folytatott kezelése vonatkozásában az uniós vagy a tagállami jog – az e cikk (1) bekezdésében említett feltételekre és garanciákra is figyelemmel – eltérést állapíthat meg a 15., 16., 18. és 21. cikkben említett jogokat illetően, ha e jogok valószínűsíthetően lehetetlenné teszik vagy súlyosan hátráltatják az adott célok elérését, és azok megvalósításához szükség van ilyen eltérésre.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_89'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '89',
  '3',
  '(3) A személyes adatok közérdekű archiválás céljából való kezelése vonatkozásában az uniós vagy a tagállami jog – az e cikk (1) bekezdésében említett feltételekre és garanciákra is figyelemmel – eltérést állapíthat meg a 15., 16., 18., 19., 20. és 21. cikkben említett jogokat illetően, ha e jogok valószínűsíthetően lehetetlenné teszik vagy súlyosan hátráltatják az adott célok elérését, és azok megvalósításához szükség van ilyen eltérésre.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_89'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '89',
  '4',
  '(4) Ha a (2), illetve (3) bekezdésben említett adatkezelés egyidejűleg más célokat is szolgál, az eltérést kizárólag az érintett bekezdésben említett adatkezelési célokra kell alkalmazni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_89'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '90',
  null,
  'Titoktartási kötelezettségek
(1) A tagállamok egyedi szabályokat fogadhatnak el annak érdekében, hogy meghatározzák a felügyeleti hatóságoknak az 58. cikk (1) bekezdésének e) és f) pontjában foglalt hatáskörét olyan adatkezelőkre vagy adatfeldolgozókra vonatkozóan, amelyek az uniós vagy a tagállami jog alapján, vagy az illetékes nemzeti szervek által alkotott szabályok alapján szakmai titoktartási kötelezettség vagy azzal egyenértékű egyéb titoktartási kötelezettség hatálya alá tartoznak, ha ez szükséges és arányos a személyes adatok védelméhez való jog és a titoktartási kötelezettség összeegyeztetése érdekében. E szabályokat csak azokra a személyes adatokra kell alkalmazni, amelyeket az adatkezelő vagy az adatfeldolgozó e titoktartási kötelezettség hatálya alá tartozó tevékenység során kapott vagy szerzett.

(2) Minden tagállam legkésőbb 2018. május 25-ig értesíti a Bizottságot az (1) bekezdés alapján elfogadott szabályokról, továbbá haladéktalanul értesíti a Bizottságot az említett szabályokat érintő későbbi módosításokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_90'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '90',
  '1',
  '(1) A tagállamok egyedi szabályokat fogadhatnak el annak érdekében, hogy meghatározzák a felügyeleti hatóságoknak az 58. cikk (1) bekezdésének e) és f) pontjában foglalt hatáskörét olyan adatkezelőkre vagy adatfeldolgozókra vonatkozóan, amelyek az uniós vagy a tagállami jog alapján, vagy az illetékes nemzeti szervek által alkotott szabályok alapján szakmai titoktartási kötelezettség vagy azzal egyenértékű egyéb titoktartási kötelezettség hatálya alá tartoznak, ha ez szükséges és arányos a személyes adatok védelméhez való jog és a titoktartási kötelezettség összeegyeztetése érdekében. E szabályokat csak azokra a személyes adatokra kell alkalmazni, amelyeket az adatkezelő vagy az adatfeldolgozó e titoktartási kötelezettség hatálya alá tartozó tevékenység során kapott vagy szerzett.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_90'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '90',
  '2',
  '(2) Minden tagállam legkésőbb 2018. május 25-ig értesíti a Bizottságot az (1) bekezdés alapján elfogadott szabályokról, továbbá haladéktalanul értesíti a Bizottságot az említett szabályokat érintő későbbi módosításokról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_90'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '91',
  null,
  'Egyházak és vallási szervezetek létező adatvédelmi szabályai
(1) Ha egy tagállamban egyház, illetve vallási szervezet vagy közösség e rendelet hatálybalépésének időpontjában átfogó szabályokat alkalmaz a természetes személyek személyes adatok kezelése tekintetében történő védelme vonatkozásában, e szabályok tovább alkalmazhatók, ha összhangba hozzák őket e rendelettel.

(2) Az e cikk (1) bekezdésének megfelelően átfogó szabályokat alkalmazó egyház vagy vallási szervezet egy független felügyeleti hatóság ellenőrzése alá tartozik, amely lehet egy külön, e céljra egyedileg kijelölt hatóság is, feltéve hogy megfelel az e rendelet VI. fejezetében megállapított feltételeknek.

X. FEJEZET

Felhatalmazáson alapuló jogi aktusok és végrehajtási jogi aktusok',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_91'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '91',
  '1',
  '(1) Ha egy tagállamban egyház, illetve vallási szervezet vagy közösség e rendelet hatálybalépésének időpontjában átfogó szabályokat alkalmaz a természetes személyek személyes adatok kezelése tekintetében történő védelme vonatkozásában, e szabályok tovább alkalmazhatók, ha összhangba hozzák őket e rendelettel.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_91'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '91',
  '2',
  '(2) Az e cikk (1) bekezdésének megfelelően átfogó szabályokat alkalmazó egyház vagy vallási szervezet egy független felügyeleti hatóság ellenőrzése alá tartozik, amely lehet egy külön, e céljra egyedileg kijelölt hatóság is, feltéve hogy megfelel az e rendelet VI. fejezetében megállapított feltételeknek.

X. FEJEZET

Felhatalmazáson alapuló jogi aktusok és végrehajtási jogi aktusok',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_91'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '92',
  null,
  'A felhatalmazás gyakorlása
(1) A felhatalmazáson alapuló jogi aktusok elfogadására vonatkozóan a Bizottság részére adott felhatalmazás gyakorlásának feltételeit ez a cikk határozza meg.

(2) A Bizottságnak a 12. cikk (8) bekezdésében és a 43. cikk (8) bekezdésében említett, felhatalmazáson alapuló jogi aktus elfogadására vonatkozó felhatalmazása határozatlan időre 2016. május 24-től kezdődő hatállyal.

(3) Az Európai Parlament vagy a Tanács bármikor visszavonhatja a 12. cikk (8) bekezdésében és a 43. cikk (8) bekezdésében említett felhatalmazást. A visszavonásról szóló határozat megszünteti az abban meghatározott felhatalmazást. A határozat az Európai Unió Hivatalos Lapjában való kihirdetését követő napon, vagy a benne megjelölt későbbi időpontban lép hatályba. A határozat nem érinti a már hatályban lévő, felhatalmazáson alapuló jogi aktusok érvényességét.

(4) A Bizottság a felhatalmazáson alapuló jogi aktus elfogadását követően haladéktalanul és egyidejűleg értesíti arról az Európai Parlamentet és a Tanácsot.

(5) A 12. cikk (8) bekezdése és a 43. cikk (8) bekezdése értelmében elfogadott, felhatalmazáson alapuló jogi aktus csak akkor lép hatályba, ha az Európai Parlamentnek és a Tanácsnak a jogi aktusról való értesítését követő három hónapon belül sem az Európai Parlament, sem a Tanács nem emelt ellene kifogást, illetve ha az említett időtartam lejártát megelőzően mind az Európai Parlament, mind a Tanács arról tájékoztatta a Bizottságot, hogy nem fog kifogást emelni. Az Európai Parlament vagy a Tanács kezdeményezésére ez az időtartam három hónappal meghosszabbodik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '92',
  '1',
  '(1) A felhatalmazáson alapuló jogi aktusok elfogadására vonatkozóan a Bizottság részére adott felhatalmazás gyakorlásának feltételeit ez a cikk határozza meg.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '92',
  '2',
  '(2) A Bizottságnak a 12. cikk (8) bekezdésében és a 43. cikk (8) bekezdésében említett, felhatalmazáson alapuló jogi aktus elfogadására vonatkozó felhatalmazása határozatlan időre 2016. május 24-től kezdődő hatállyal.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '92',
  '3',
  '(3) Az Európai Parlament vagy a Tanács bármikor visszavonhatja a 12. cikk (8) bekezdésében és a 43. cikk (8) bekezdésében említett felhatalmazást. A visszavonásról szóló határozat megszünteti az abban meghatározott felhatalmazást. A határozat az Európai Unió Hivatalos Lapjában való kihirdetését követő napon, vagy a benne megjelölt későbbi időpontban lép hatályba. A határozat nem érinti a már hatályban lévő, felhatalmazáson alapuló jogi aktusok érvényességét.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '92',
  '4',
  '(4) A Bizottság a felhatalmazáson alapuló jogi aktus elfogadását követően haladéktalanul és egyidejűleg értesíti arról az Európai Parlamentet és a Tanácsot.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '92',
  '5',
  '(5) A 12. cikk (8) bekezdése és a 43. cikk (8) bekezdése értelmében elfogadott, felhatalmazáson alapuló jogi aktus csak akkor lép hatályba, ha az Európai Parlamentnek és a Tanácsnak a jogi aktusról való értesítését követő három hónapon belül sem az Európai Parlament, sem a Tanács nem emelt ellene kifogást, illetve ha az említett időtartam lejártát megelőzően mind az Európai Parlament, mind a Tanács arról tájékoztatta a Bizottságot, hogy nem fog kifogást emelni. Az Európai Parlament vagy a Tanács kezdeményezésére ez az időtartam három hónappal meghosszabbodik.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '93',
  null,
  'Bizottsági eljárásrend
(1) A Bizottság munkáját egy bizottság segíti. Ez a bizottság a 182/2011/EU rendelet szerinti bizottság.

(2) Az e bekezdésre történő hivatkozáskor a 182/2011/EU rendelet 5. cikkét kell alkalmazni.

(3) Az e bekezdésre történő hivatkozáskor a 182/2011/EU rendeletnek az 5. cikkével együtt értelmezett 8. cikkét kell alkalmazni.

XI. FEJEZET

Záró rendelkezések',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_93'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '93',
  '1',
  '(1) A Bizottság munkáját egy bizottság segíti. Ez a bizottság a 182/2011/EU rendelet szerinti bizottság.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_93'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '93',
  '2',
  '(2) Az e bekezdésre történő hivatkozáskor a 182/2011/EU rendelet 5. cikkét kell alkalmazni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_93'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '93',
  '3',
  '(3) Az e bekezdésre történő hivatkozáskor a 182/2011/EU rendeletnek az 5. cikkével együtt értelmezett 8. cikkét kell alkalmazni.

XI. FEJEZET

Záró rendelkezések',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_93'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '94',
  null,
  'A 95/46/EK irányelv hatályon kívül helyezése
(1) A 95/46/EK irányelv 2018. május 25-i hatállyal hatályát veszti.

(2) A hatályon kívül helyezett irányelvre történő hivatkozásokat az e rendeletre történő hivatkozásnak kell tekinteni. A 95/46/EK irányelv 29. cikke által létrehozott, a természetes személyeknek a személyes adatok feldolgozása tekintetében való védelmével foglalkozó munkacsoportra történő hivatkozást az e rendelet által létrehozott Európai Adatvédelmi Testületre történő hivatkozásnak kell tekinteni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_94'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '94',
  '1',
  '(1) A 95/46/EK irányelv 2018. május 25-i hatállyal hatályát veszti.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_94'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '94',
  '2',
  '(2) A hatályon kívül helyezett irányelvre történő hivatkozásokat az e rendeletre történő hivatkozásnak kell tekinteni. A 95/46/EK irányelv 29. cikke által létrehozott, a természetes személyeknek a személyes adatok feldolgozása tekintetében való védelmével foglalkozó munkacsoportra történő hivatkozást az e rendelet által létrehozott Európai Adatvédelmi Testületre történő hivatkozásnak kell tekinteni.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_94'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '95',
  null,
  'Kapcsolat a 2002/58/EK irányelvvel
E rendelet nem ró további kötelezettségeket a természetes vagy jogi személyekre az Unión belüli nyilvános hírközlési hálózatokon keresztül történő nyilvánosan elérhető hírközlési szolgáltatással összefüggésben kezelt adatok tekintetében azon kérdésekkel kapcsolatban, amelyek vonatkozásában ők a 2002/58/EK irányelvben megállapított, azonos célkitűzésekkel bíró különös kötelezettségek hatálya alá tartoznak.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_95'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '96',
  null,
  'Kapcsolat korábban kötött megállapodásokkal
A tagállamok által az 2016. május 24. előtt kötött azon nemzetközi megállapodások, melyek személyes adatok harmadik országok vagy nemzetközi szervezetek részére történő továbbításáról rendelkeznek, és amelyek megfelelnek az említett dátum előtt alkalmazandó uniós jognak, módosításukig, felváltásukig vagy visszavonásukig változatlanul hatályban maradnak.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_96'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '97',
  null,
  'A Bizottság jelentései
(1) A Bizottság 2020. május 25-ig és minden azt követő negyedik évben jelentést terjeszt az Európai Parlament és a Tanács elé e rendelet értékeléséről és felülvizsgálatáról.

(2) Az (1) bekezdésben említett értékelések és felülvizsgálat keretében a Bizottság különösen a következő rendelkezések alkalmazását és hatékonyságát vizsgálja:

a)

a személyes adatok harmadik országokba vagy nemzetközi szervezetek részére történő továbbításáról szóló V. fejezet, különös tekintettel az e rendelet 43. cikkének (3) bekezdése szerint, valamint a 95/46/EK irányelv 25. cikkének (6) bekezdése alapján elfogadott határozatokra;

b)

az együttműködésről és az egységességről szóló VII. fejezet.

(3) A Bizottság az (1) bekezdésben említett célokból információkat kérhet a tagállamoktól és a felügyeleti hatóságoktól.

(4) A Bizottság az (1) és (2) bekezdésben említett értékelések és felülvizsgálatok során figyelembe veszi az Európai Parlament, a Tanács és az egyéb érintett szervek vagy források álláspontját és megállapításait.

(5) A Bizottság szükség esetén megfelelő javaslatokat nyújt be e rendelet módosítására, figyelembe véve különösen az információs technológia fejlődését és az információs társadalom fejlődési szintjét.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '97',
  '1',
  '(1) A Bizottság 2020. május 25-ig és minden azt követő negyedik évben jelentést terjeszt az Európai Parlament és a Tanács elé e rendelet értékeléséről és felülvizsgálatáról.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '97',
  '2',
  '(2) Az (1) bekezdésben említett értékelések és felülvizsgálat keretében a Bizottság különösen a következő rendelkezések alkalmazását és hatékonyságát vizsgálja:

a)

a személyes adatok harmadik országokba vagy nemzetközi szervezetek részére történő továbbításáról szóló V. fejezet, különös tekintettel az e rendelet 43. cikkének (3) bekezdése szerint, valamint a 95/46/EK irányelv 25. cikkének (6) bekezdése alapján elfogadott határozatokra;

b)

az együttműködésről és az egységességről szóló VII. fejezet.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '97',
  '2(a)',
  'a) a személyes adatok harmadik országokba vagy nemzetközi szervezetek részére történő továbbításáról szóló V. fejezet, különös tekintettel az e rendelet 43. cikkének (3) bekezdése szerint, valamint a 95/46/EK irányelv 25. cikkének (6) bekezdése alapján elfogadott határozatokra;',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '97',
  '2(b)',
  'b) az együttműködésről és az egységességről szóló VII. fejezet.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '97',
  '3',
  '(3) A Bizottság az (1) bekezdésben említett célokból információkat kérhet a tagállamoktól és a felügyeleti hatóságoktól.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '97',
  '4',
  '(4) A Bizottság az (1) és (2) bekezdésben említett értékelések és felülvizsgálatok során figyelembe veszi az Európai Parlament, a Tanács és az egyéb érintett szervek vagy források álláspontját és megállapításait.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '97',
  '5',
  '(5) A Bizottság szükség esetén megfelelő javaslatokat nyújt be e rendelet módosítására, figyelembe véve különösen az információs technológia fejlődését és az információs társadalom fejlődési szintjét.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '98',
  null,
  'Az egyéb uniós adatvédelmi aktusok felülvizsgálata
A Bizottság adott esetben jogalkotási javaslatokat nyújt be a személyes adatok védelméről szóló egyéb uniós jogi aktusok módosítására, a természetes személyek személyes adataik kezelése tekintetében való védelmének egységessége és következetessége érdekében. Ez különösen a természetes személyeknek a személyes adataik uniós intézmények, szervek, hivatalok és ügynökségek általi kezelése tekintetében való védelmére és a személyes adatok szabad áramlására vonatkozó szabályokat érinti.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_98'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '99',
  null,
  'Hatálybalépés és alkalmazás
(1) Ez a rendelet az Európai Unió Hivatalos Lapjában való kihirdetését követő huszadik napon lép hatályba.

(2) Ezt a rendeletet 2018. május 25-től kell alkalmazni.

Ez a rendelet teljes egészében kötelező és közvetlenül alkalmazandó valamennyi tagállamban.

Kelt Brüsszelben, 2016. április 27-én.

az Európai Parlament részéről

az elnök

M. SCHULZ

a Tanács részéről

az elnök

J.A. HENNIS-PLASSCHAERT

( 1 )
HL C 229., 2012.7.31., 90. o.

( 2 )
HL C 391., 2012.12.18., 127. o.

( 3 ) Az Európai Parlament 2014. március 12-i álláspontja (a Hivatalos Lapban még nem tették közzé) és a Tanács 2016. április 8-i álláspontja első olvasatban. Az Európai Parlament 2016. április 14-i álláspontja.

( 4 ) Az Európai Parlament és a Tanács 95/46/EK irányelve (1995. október 24.) a személyes adatok feldolgozása vonatkozásában az egyének védelméről és az ilyen adatok szabad áramlásáról ( HL L 281., 1995.11.23., 31. o. ).

( 5 ) A Bizottság 2003/361/EK ajánlása (2003. május 6.) a mikro-, kis- és középvállalkozások fogalma kapcsán a kis- és közepes méretű vállalkozások meghatározásáról (C(2003) 1422) ( HL L 124., 2003.5.20., 36. o. ).

( 6 ) Az Európai Parlament és a Tanács 45/2001/EK rendelete (2000. december 18.) a személyes adatok közösségi intézmények és szervek által történő feldolgozása tekintetében az egyének védelméről, valamint az ilyen adatok szabad áramlásáról ( HL L 8., 2001.1.12., 1. o. ).

( 7 ) Az Európai Parlament és a Tanács (EU) 2016/680 irányelve (2016. április 27.) személyes adatoknak az illetékes hatóságok által a bűncselekmények megelőzése, nyomozása, felderítése, üldözése vagy büntetőjogi szankciók végrehajtása céljából végzett kezelése tekintetében a természetes személyek védelméről és az ilyen adatok szabad áramlásáról, valamint a 2008/977/IBtanácsi kerethatározat hatályon kívül helyezéséről (lásd e Hivatalos lap 89. oldalát).

( 8 ) Az Európai Parlament és a Tanács 2000/31/EK irányelve (2000. június 8.) a belső piacon az információs társadalommal összefüggő szolgáltatások, különösen az elektronikus kereskedelem, egyes jogi vonatkozásairól (Elektronikus kereskedelemről szóló irányelv) ( HL L 178., 2000.7.17., 1. o. ).

( 9 ) Az Európai Parlament és a Tanács 2011/24/EU irányelve (2011. március 9.) a határon átnyúló egészségügyi ellátásra vonatkozó betegjogok érvényesítéséről ( HL L 88., 2011.4.4., 45. o. ).

( 10 ) A Tanács 93/13/EGK irányelve (1993. április 5.) a fogyasztókkal kötött szerződésekben alkalmazott tisztességtelen feltételekről ( HL L 95., 1993.4.21., 29. o. ).

( 11 ) Az Európai Parlament és a Tanács 1338/2008/EK rendelete ( 2008. december 16.) a népegészségre és a munkahelyi egészségre és biztonságra vonatkozó közösségi statisztikáról ( HL L 354., 2008.12.31., 70. o. ).

( 12 ) Az Európai Parlament és a Tanács 182/2011/EU rendelete (2011. február 16.) a Bizottság végrehajtási hatásköreinek gyakorlására vonatkozó tagállami ellenőrzési mechanizmusok szabályainak és általános elveinek megállapításáról ( HL L 55., 2011.2.28., 13. o. ).

( 13 ) Az Európai Parlament és a Tanács 1215/2012/EU rendelete (2012. december 12.) a polgári és kereskedelmi ügyekben a joghatóságról, valamint a határozatok elismeréséről és végrehajtásáról ( HL L 351., 2012.12.20., 1. o. ).

( 14 ) Az Európai Parlament és a Tanács 2003/98/EK irányelve (2003. november 17.) a közszféra információinak további felhasználásáról ( HL L 345., 2003.12.31., 90. o. ).

( 15 ) Az Európai Parlament és a Tanács 536/2014/EU rendelete (2014. április 16.) az emberi felhasználásra szánt gyógyszerek klinikai vizsgálatairól és a 2001/20/EK irányelv hatályon kívül helyezéséről ( HL L 158., 2014.5.27., 1. o. ).

( 16 ) Az Európai Parlament és a Tanács 223/2009/EK rendelete (2009. március 11.) az európai statisztikákról és a titoktartási kötelezettség hatálya alá tartozó statisztikai adatoknak az Európai Közösségek Statisztikai Hivatala részére történő továbbításáról szóló 1101/2008/EK, Euratom európai parlamenti és tanácsi rendelet, a közösségi statisztikákról szóló 322/97/EK tanácsi rendelet és az Európai Közösségek statisztikai programbizottságának létrehozásáról szóló 89/382/EGK, Euratom tanácsi határozat hatályon kívül helyezéséről ( HL L 87., 2009.3.31., 164. o. ).

( 17 )
HL C 192., 2012.6.30., 7. o.

( 18 ) Az Európai Parlament és a Tanács 2002/58/EK irányelve (2002. július 12.) az elektronikus hírközlési ágazatban a személyes adatok kezeléséről, feldolgozásáról és a magánélet védelméről (Elektronikus hírközlési adatvédelmi irányelv) ( HL L 201., 2002.7.31., 37. o. ).

( 19 ) Az Európai Parlament és Tanács (EU) 2015/1535 irányelve (2015. szeptember 9.) a műszaki szabályokkal és az információs társadalom szolgáltatásaira vonatkozó szabályokkal kapcsolatos információszolgáltatási eljárás megállapításáról ( HL L 241., 2015.9.17., 1. o. )

( 20 ) Az Európai Parlament és a Tanács 765/2008/EK rendelete (2008. július 9.) a termékek forgalmazása tekintetében az akkreditálás és piacfelügyelet előírásainak megállapításáról és a 339/93/EGK rendelet hatályon kívül helyezéséről ( HL L 218., 2008.8.13., 30. o. ).

( 21 ) Az Európai Parlament és a Tanács 1049/2001/EK rendelete (2001. május 30.) az Európai Parlament, a Tanács és a Bizottság dokumentumaihoz való nyilvános hozzáférésről ( HL L 145., 2001.5.31., 43. o. ).

Top

Table of contents

Hide table of contents

This site is managed by the

Publications Office of the European Union

Need help?

Help pages

Contact

Sitemap

Follow us

X

Legal

Legal notice

Cookies policy

Accessibility

Privacy statement

Information

About EUR-Lex

Newsletter

Useful links

Other services

European Data

EU tenders

EU research results

EU Whoiswho

EU publications

N-Lex

EU Law Tracker

Discover more on europa.eu

Contact the EU

Call us 00 800 6 7 8 9 10 11

Use other telephone options

Write to us via our contact form

Meet us at one of the EU centres

Social media

Search for EU social media channels

Legal

Languages on our websites

Privacy policy

Legal notice

Cookies

EU institutions

European Parliament

European Council

Council of the European Union

European Commission

Court of Justice of the European Union (CJEU)

European Central Bank (ECB)

European Court of Auditors

European External Action Service (EEAS)

European Economic and Social Committee

European Committee of Regions (CoR)

European Investment Bank

European Ombudsman

European Data Protection Supervisor (EDPS)

European Data Protection Board

European Personnel Selection Office

Publications Office of the European Union

Agencies

Switch to mobile

Switch to desktop',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '99',
  '1',
  '(1) Ez a rendelet az Európai Unió Hivatalos Lapjában való kihirdetését követő huszadik napon lép hatályba.',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '32016R0679',
  '99',
  '2',
  '(2) Ezt a rendeletet 2018. május 25-től kell alkalmazni.

Ez a rendelet teljes egészében kötelező és közvetlenül alkalmazandó valamennyi tagállamban.

Kelt Brüsszelben, 2016. április 27-én.

az Európai Parlament részéről

az elnök

M. SCHULZ

a Tanács részéről

az elnök

J.A. HENNIS-PLASSCHAERT

( 1 )
HL C 229., 2012.7.31., 90. o.

( 2 )
HL C 391., 2012.12.18., 127. o.

( 3 ) Az Európai Parlament 2014. március 12-i álláspontja (a Hivatalos Lapban még nem tették közzé) és a Tanács 2016. április 8-i álláspontja első olvasatban. Az Európai Parlament 2016. április 14-i álláspontja.

( 4 ) Az Európai Parlament és a Tanács 95/46/EK irányelve (1995. október 24.) a személyes adatok feldolgozása vonatkozásában az egyének védelméről és az ilyen adatok szabad áramlásáról ( HL L 281., 1995.11.23., 31. o. ).

( 5 ) A Bizottság 2003/361/EK ajánlása (2003. május 6.) a mikro-, kis- és középvállalkozások fogalma kapcsán a kis- és közepes méretű vállalkozások meghatározásáról (C(2003) 1422) ( HL L 124., 2003.5.20., 36. o. ).

( 6 ) Az Európai Parlament és a Tanács 45/2001/EK rendelete (2000. december 18.) a személyes adatok közösségi intézmények és szervek által történő feldolgozása tekintetében az egyének védelméről, valamint az ilyen adatok szabad áramlásáról ( HL L 8., 2001.1.12., 1. o. ).

( 7 ) Az Európai Parlament és a Tanács (EU) 2016/680 irányelve (2016. április 27.) személyes adatoknak az illetékes hatóságok által a bűncselekmények megelőzése, nyomozása, felderítése, üldözése vagy büntetőjogi szankciók végrehajtása céljából végzett kezelése tekintetében a természetes személyek védelméről és az ilyen adatok szabad áramlásáról, valamint a 2008/977/IBtanácsi kerethatározat hatályon kívül helyezéséről (lásd e Hivatalos lap 89. oldalát).

( 8 ) Az Európai Parlament és a Tanács 2000/31/EK irányelve (2000. június 8.) a belső piacon az információs társadalommal összefüggő szolgáltatások, különösen az elektronikus kereskedelem, egyes jogi vonatkozásairól (Elektronikus kereskedelemről szóló irányelv) ( HL L 178., 2000.7.17., 1. o. ).

( 9 ) Az Európai Parlament és a Tanács 2011/24/EU irányelve (2011. március 9.) a határon átnyúló egészségügyi ellátásra vonatkozó betegjogok érvényesítéséről ( HL L 88., 2011.4.4., 45. o. ).

( 10 ) A Tanács 93/13/EGK irányelve (1993. április 5.) a fogyasztókkal kötött szerződésekben alkalmazott tisztességtelen feltételekről ( HL L 95., 1993.4.21., 29. o. ).

( 11 ) Az Európai Parlament és a Tanács 1338/2008/EK rendelete ( 2008. december 16.) a népegészségre és a munkahelyi egészségre és biztonságra vonatkozó közösségi statisztikáról ( HL L 354., 2008.12.31., 70. o. ).

( 12 ) Az Európai Parlament és a Tanács 182/2011/EU rendelete (2011. február 16.) a Bizottság végrehajtási hatásköreinek gyakorlására vonatkozó tagállami ellenőrzési mechanizmusok szabályainak és általános elveinek megállapításáról ( HL L 55., 2011.2.28., 13. o. ).

( 13 ) Az Európai Parlament és a Tanács 1215/2012/EU rendelete (2012. december 12.) a polgári és kereskedelmi ügyekben a joghatóságról, valamint a határozatok elismeréséről és végrehajtásáról ( HL L 351., 2012.12.20., 1. o. ).

( 14 ) Az Európai Parlament és a Tanács 2003/98/EK irányelve (2003. november 17.) a közszféra információinak további felhasználásáról ( HL L 345., 2003.12.31., 90. o. ).

( 15 ) Az Európai Parlament és a Tanács 536/2014/EU rendelete (2014. április 16.) az emberi felhasználásra szánt gyógyszerek klinikai vizsgálatairól és a 2001/20/EK irányelv hatályon kívül helyezéséről ( HL L 158., 2014.5.27., 1. o. ).

( 16 ) Az Európai Parlament és a Tanács 223/2009/EK rendelete (2009. március 11.) az európai statisztikákról és a titoktartási kötelezettség hatálya alá tartozó statisztikai adatoknak az Európai Közösségek Statisztikai Hivatala részére történő továbbításáról szóló 1101/2008/EK, Euratom európai parlamenti és tanácsi rendelet, a közösségi statisztikákról szóló 322/97/EK tanácsi rendelet és az Európai Közösségek statisztikai programbizottságának létrehozásáról szóló 89/382/EGK, Euratom tanácsi határozat hatályon kívül helyezéséről ( HL L 87., 2009.3.31., 164. o. ).

( 17 )
HL C 192., 2012.6.30., 7. o.

( 18 ) Az Európai Parlament és a Tanács 2002/58/EK irányelve (2002. július 12.) az elektronikus hírközlési ágazatban a személyes adatok kezeléséről, feldolgozásáról és a magánélet védelméről (Elektronikus hírközlési adatvédelmi irányelv) ( HL L 201., 2002.7.31., 37. o. ).

( 19 ) Az Európai Parlament és Tanács (EU) 2015/1535 irányelve (2015. szeptember 9.) a műszaki szabályokkal és az információs társadalom szolgáltatásaira vonatkozó szabályokkal kapcsolatos információszolgáltatási eljárás megállapításáról ( HL L 241., 2015.9.17., 1. o. )

( 20 ) Az Európai Parlament és a Tanács 765/2008/EK rendelete (2008. július 9.) a termékek forgalmazása tekintetében az akkreditálás és piacfelügyelet előírásainak megállapításáról és a 339/93/EGK rendelet hatályon kívül helyezéséről ( HL L 218., 2008.8.13., 30. o. ).

( 21 ) Az Európai Parlament és a Tanács 1049/2001/EK rendelete (2001. május 30.) az Európai Parlament, a Tanács és a Bizottság dokumentumaihoz való nyilvános hozzáférésről ( HL L 145., 2001.5.31., 43. o. ).

Top

Table of contents

Hide table of contents

This site is managed by the

Publications Office of the European Union

Need help?

Help pages

Contact

Sitemap

Follow us

X

Legal

Legal notice

Cookies policy

Accessibility

Privacy statement

Information

About EUR-Lex

Newsletter

Useful links

Other services

European Data

EU tenders

EU research results

EU Whoiswho

EU publications

N-Lex

EU Law Tracker

Discover more on europa.eu

Contact the EU

Call us 00 800 6 7 8 9 10 11

Use other telephone options

Write to us via our contact form

Meet us at one of the EU centres

Social media

Search for EU social media channels

Legal

Languages on our websites

Privacy policy

Legal notice

Cookies

EU institutions

European Parliament

European Council

Council of the European Union

European Commission

Court of Justice of the European Union (CJEU)

European Central Bank (ECB)

European Court of Auditors

European External Action Service (EEAS)

European Economic and Social Committee

European Committee of Regions (CoR)

European Investment Bank

European Ombudsman

European Data Protection Supervisor (EDPS)

European Data Protection Board

European Personnel Selection Office

Publications Office of the European Union

Agencies

Switch to mobile

Switch to desktop',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_99'
);

commit;
