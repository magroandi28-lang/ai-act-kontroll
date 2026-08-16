-- EnergiaAI Kontroll - jogszabalyszoveg betoltese.
-- Forras: https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun
-- CELEX: 02024R1689-20260727
-- Cikkek: 113
-- Bekezdesek: 509
-- Alpontok: 315
-- Ezt a fajlt a scripts/jogszabaly_betolto.py allitotta elo.
-- Futtatas: Supabase Dashboard -> SQL Editor.

begin;

select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '1',
  null,
  'Tárgy
(1) E rendelet célja, hogy javítsa a belső piac működését, valamint, hogy előmozdítsa az emberközpontú és megbízható mesterséges intelligencia (MI) elterjedését, biztosítva ugyanakkor az Unióban az egészség, a biztonság és a Chartában rögzített alapvető jogok – többek között a demokrácia, a jogállamiság és a környezetvédelem – magas szintű védelmét az MI-rendszerek káros hatásaival szemben, továbbá, hogy támogassa az innovációt.

(2) E rendelet megállapítja a következőket:

a)

az MI-rendszerek Unión belüli forgalomba hozatalára, üzembe helyezésére és használatára vonatkozó harmonizált szabályok;

b)

bizonyos MI-gyakorlatokra vonatkozó tilalmak;

c)

a nagy kockázatú MI-rendszerekre vonatkozó különös követelmények és az ilyen rendszerek üzemeltetőire vonatkozó kötelezettségek;

d)

bizonyos MI-rendszerekre vonatkozó harmonizált átláthatósági szabályok;

e)

az általános célú MI-modellek forgalomba hozatalára vonatkozó harmonizált szabályok;

f)

a piaci nyomon követésre, a piacfelügyeletre, az irányításra és a végrehajtásra vonatkozó szabályok;

g)

az innovációt támogató intézkedések, különösen a kkv-kra összpontosítva, ideértve az induló innovatív vállalkozásokat is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '1',
  '1',
  '(1) E rendelet célja, hogy javítsa a belső piac működését, valamint, hogy előmozdítsa az emberközpontú és megbízható mesterséges intelligencia (MI) elterjedését, biztosítva ugyanakkor az Unióban az egészség, a biztonság és a Chartában rögzített alapvető jogok – többek között a demokrácia, a jogállamiság és a környezetvédelem – magas szintű védelmét az MI-rendszerek káros hatásaival szemben, továbbá, hogy támogassa az innovációt.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '1',
  '2',
  '(2) E rendelet megállapítja a következőket:

a)

az MI-rendszerek Unión belüli forgalomba hozatalára, üzembe helyezésére és használatára vonatkozó harmonizált szabályok;

b)

bizonyos MI-gyakorlatokra vonatkozó tilalmak;

c)

a nagy kockázatú MI-rendszerekre vonatkozó különös követelmények és az ilyen rendszerek üzemeltetőire vonatkozó kötelezettségek;

d)

bizonyos MI-rendszerekre vonatkozó harmonizált átláthatósági szabályok;

e)

az általános célú MI-modellek forgalomba hozatalára vonatkozó harmonizált szabályok;

f)

a piaci nyomon követésre, a piacfelügyeletre, az irányításra és a végrehajtásra vonatkozó szabályok;

g)

az innovációt támogató intézkedések, különösen a kkv-kra összpontosítva, ideértve az induló innovatív vállalkozásokat is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '1',
  '2(a)',
  'a) az MI-rendszerek Unión belüli forgalomba hozatalára, üzembe helyezésére és használatára vonatkozó harmonizált szabályok;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '1',
  '2(b)',
  'b) bizonyos MI-gyakorlatokra vonatkozó tilalmak;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '1',
  '2(c)',
  'c) a nagy kockázatú MI-rendszerekre vonatkozó különös követelmények és az ilyen rendszerek üzemeltetőire vonatkozó kötelezettségek;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '1',
  '2(d)',
  'd) bizonyos MI-rendszerekre vonatkozó harmonizált átláthatósági szabályok;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '1',
  '2(e)',
  'e) az általános célú MI-modellek forgalomba hozatalára vonatkozó harmonizált szabályok;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '1',
  '2(f)',
  'f) a piaci nyomon követésre, a piacfelügyeletre, az irányításra és a végrehajtásra vonatkozó szabályok;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '1',
  '2(g)',
  'g) az innovációt támogató intézkedések, különösen a kkv-kra összpontosítva, ideértve az induló innovatív vállalkozásokat is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_1'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  null,
  'Hatály
(1) E rendelet a következőkre alkalmazandó:

a)

az Unióban MI-rendszereket forgalomba hozó vagy üzembe helyező, vagy általános célú MI-modelleket forgalomba hozó szolgáltatók, függetlenül attól, hogy az említett szolgáltatók letelepedési vagy tartózkodási helye az Unióban vagy harmadik országban van-e;

b)

az MI-rendszerek azon alkalmazói, amelyek letelepedési vagy tartózkodási helye az Unión belül van;

c)

az MI-rendszerek azon szolgáltatói és alkalmazói, amelyek letelepedési vagy tartózkodási helye harmadik országban van, amennyiben az MI-rendszer által előállított kimenet használatára az Unióban kerül sor;

d)

az MI-rendszerek importőrei és forgalmazói;

e)

azon termékgyártók, amelyek a termékükkel együtt MI-rendszert hoznak forgalomba vagy helyeznek üzembe a saját nevük vagy védjegyük alatt;

f)

a szolgáltatóknak az Unión kívül letelepedett meghatalmazott képviselői;

g)

az Unión kívül tartózkodó érintett személyek.

(2) Azon MI-rendszerek esetében, amelyeket a 6. cikk (1) bekezdésével összhangban az I. melléklet B. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termékekhez kapcsolódó nagy kockázatú MI-rendszerként soroltak be, kizárólag a 6. cikk (1) bekezdését, a 102–109. cikket és a 112. cikket kell alkalmazni. Az 57. cikk csak annyiban alkalmazandó, amennyiben e rendeletnek a nagy kockázatú MI-rendszerekre vonatkozó követelményeit beépítették az említett uniós harmonizációs jogszabályokba.

(3) E rendelet nem alkalmazandó az uniós jog hatályán kívül eső területekre, és semmilyen esetben nem érinti a tagállamok nemzetbiztonságra vonatkozó hatásköreit, függetlenül attól, hogy a tagállamok milyen típusú szervezetet bíznak meg az említett hatáskörökkel kapcsolatos feladatok ellátásával.

E rendelet nem alkalmazandó az MI-rendszerekre, ha és amennyiben azok forgalomba hozatala, üzembe helyezése vagy használata – módosítással vagy módosítás nélkül – kizárólag katonai, védelmi vagy nemzetbiztonsági célra történik, függetlenül az e tevékenységeket végző szervezet típusától.

E rendelet nem alkalmazandó azon MI-rendszerekre, amelyeket nem az Unióban hoztak forgalomba vagy helyeztek üzembe, amennyiben a kimenetet az Unióban kizárólag katonai, védelmi vagy nemzetbiztonsági célra használják, függetlenül az e tevékenységeket végző szervezet típusától.

(4) E rendelet nem alkalmazandó az (1) bekezdés alapján e rendelet hatálya alá tartozó harmadik országbeli hatóságokra és nemzetközi szervezetekre, amennyiben ezek a hatóságok vagy szervezetek az Unióval, illetve egy vagy több tagállammal folytatott bűnüldözési és igazságügyi együttműködésre vonatkozó nemzetközi együttműködés vagy megállapodások keretében használnak MI-rendszereket, feltéve, hogy az ilyen harmadik ország vagy nemzetközi szervezet megfelelő biztosítékokat nyújt az egyének alapvető jogainak és szabadságainak védelme tekintetében.

(5) E rendelet nem érinti az (EU) 2022/2065 rendelet II. fejezetében foglalt, a közvetítő szolgáltatók felelősségére vonatkozó rendelkezések alkalmazását.

(6) E rendelet nem alkalmazandó a kifejezetten a tudományos kutatás-fejlesztés kizárólagos céljára kifejlesztett és üzembe helyezett MI-rendszerekre vagy MI-modellekre, és azok kimenetére sem.

(7) A személyes adatok, a magánélet és a közlés bizalmasságának védelmére vonatkozó uniós jog alkalmazandó az e rendeletben megállapított jogokkal és kötelezettségekkel összefüggésben feldolgozott személyes adatokra. E rendelet 10. cikke (5) bekezdésének és 59. cikkének sérelme nélkül, e rendelet nem érinti az (EU) 2016/679 vagy az (EU) 2018/1725 rendeletet, vagy a 2002/58/EK vagy az (EU) 2016/680 irányelvet.

(8) E rendelet nem alkalmazandó semmilyen, az MI-rendszerekkel vagy MI-modellekkel kapcsolatos kutatási, tesztelési és fejlesztési tevékenységre azt megelőzően, hogy azokat forgalomba hozzák vagy üzembe helyezik. Az ilyen tevékenységeket az alkalmazandó uniós joggal összhangban kell végezni. Az említett kizárás nem vonatkozik a valós körülmények közötti tesztelésre.

(9) E rendelet nem érinti a fogyasztóvédelemre és a termékbiztonságra vonatkozó egyéb uniós jogi aktusokban megállapított szabályokat.

(10) E rendelet nem alkalmazandó azon alkalmazók kötelezettségeire, akik az MI-rendszereket pusztán személyes, nem szakmai tevékenység során használó természetes személyek.

(11) E rendelet nem zárja ki az Uniót vagy a tagállamokat abból, hogy olyan törvényi, rendeleti vagy közigazgatási rendelkezéseket tartsanak fenn vagy vezessenek be, amelyek kedvezőbbek a munkavállalókra nézve az MI-rendszerek munkáltatók általi használatával kapcsolatos jogaik védelme tekintetében, vagy abból, hogy a munkavállalók számára kedvezőbb kollektív szerződések alkalmazását ösztönözzék vagy tegyék lehetővé.

(12) E rendelet nem alkalmazandó a szabad és nyílt forráskódú licencek alapján kibocsátott MI-rendszerekre, kivéve, ha azokat nagy kockázatú MI-rendszerként, vagy az 5. vagy 50. cikk hatálya alá tartozó MI-rendszerként hozzák forgalomba vagy helyezik üzembe.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '1',
  '(1) E rendelet a következőkre alkalmazandó:

a)

az Unióban MI-rendszereket forgalomba hozó vagy üzembe helyező, vagy általános célú MI-modelleket forgalomba hozó szolgáltatók, függetlenül attól, hogy az említett szolgáltatók letelepedési vagy tartózkodási helye az Unióban vagy harmadik országban van-e;

b)

az MI-rendszerek azon alkalmazói, amelyek letelepedési vagy tartózkodási helye az Unión belül van;

c)

az MI-rendszerek azon szolgáltatói és alkalmazói, amelyek letelepedési vagy tartózkodási helye harmadik országban van, amennyiben az MI-rendszer által előállított kimenet használatára az Unióban kerül sor;

d)

az MI-rendszerek importőrei és forgalmazói;

e)

azon termékgyártók, amelyek a termékükkel együtt MI-rendszert hoznak forgalomba vagy helyeznek üzembe a saját nevük vagy védjegyük alatt;

f)

a szolgáltatóknak az Unión kívül letelepedett meghatalmazott képviselői;

g)

az Unión kívül tartózkodó érintett személyek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '1(a)',
  'a) az Unióban MI-rendszereket forgalomba hozó vagy üzembe helyező, vagy általános célú MI-modelleket forgalomba hozó szolgáltatók, függetlenül attól, hogy az említett szolgáltatók letelepedési vagy tartózkodási helye az Unióban vagy harmadik országban van-e;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '1(b)',
  'b) az MI-rendszerek azon alkalmazói, amelyek letelepedési vagy tartózkodási helye az Unión belül van;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '1(c)',
  'c) az MI-rendszerek azon szolgáltatói és alkalmazói, amelyek letelepedési vagy tartózkodási helye harmadik országban van, amennyiben az MI-rendszer által előállított kimenet használatára az Unióban kerül sor;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '1(d)',
  'd) az MI-rendszerek importőrei és forgalmazói;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '1(e)',
  'e) azon termékgyártók, amelyek a termékükkel együtt MI-rendszert hoznak forgalomba vagy helyeznek üzembe a saját nevük vagy védjegyük alatt;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '1(f)',
  'f) a szolgáltatóknak az Unión kívül letelepedett meghatalmazott képviselői;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '1(g)',
  'g) az Unión kívül tartózkodó érintett személyek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '2',
  '(2) Azon MI-rendszerek esetében, amelyeket a 6. cikk (1) bekezdésével összhangban az I. melléklet B. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termékekhez kapcsolódó nagy kockázatú MI-rendszerként soroltak be, kizárólag a 6. cikk (1) bekezdését, a 102–109. cikket és a 112. cikket kell alkalmazni. Az 57. cikk csak annyiban alkalmazandó, amennyiben e rendeletnek a nagy kockázatú MI-rendszerekre vonatkozó követelményeit beépítették az említett uniós harmonizációs jogszabályokba.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '3',
  '(3) E rendelet nem alkalmazandó az uniós jog hatályán kívül eső területekre, és semmilyen esetben nem érinti a tagállamok nemzetbiztonságra vonatkozó hatásköreit, függetlenül attól, hogy a tagállamok milyen típusú szervezetet bíznak meg az említett hatáskörökkel kapcsolatos feladatok ellátásával.

E rendelet nem alkalmazandó az MI-rendszerekre, ha és amennyiben azok forgalomba hozatala, üzembe helyezése vagy használata – módosítással vagy módosítás nélkül – kizárólag katonai, védelmi vagy nemzetbiztonsági célra történik, függetlenül az e tevékenységeket végző szervezet típusától.

E rendelet nem alkalmazandó azon MI-rendszerekre, amelyeket nem az Unióban hoztak forgalomba vagy helyeztek üzembe, amennyiben a kimenetet az Unióban kizárólag katonai, védelmi vagy nemzetbiztonsági célra használják, függetlenül az e tevékenységeket végző szervezet típusától.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '4',
  '(4) E rendelet nem alkalmazandó az (1) bekezdés alapján e rendelet hatálya alá tartozó harmadik országbeli hatóságokra és nemzetközi szervezetekre, amennyiben ezek a hatóságok vagy szervezetek az Unióval, illetve egy vagy több tagállammal folytatott bűnüldözési és igazságügyi együttműködésre vonatkozó nemzetközi együttműködés vagy megállapodások keretében használnak MI-rendszereket, feltéve, hogy az ilyen harmadik ország vagy nemzetközi szervezet megfelelő biztosítékokat nyújt az egyének alapvető jogainak és szabadságainak védelme tekintetében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '5',
  '(5) E rendelet nem érinti az (EU) 2022/2065 rendelet II. fejezetében foglalt, a közvetítő szolgáltatók felelősségére vonatkozó rendelkezések alkalmazását.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '6',
  '(6) E rendelet nem alkalmazandó a kifejezetten a tudományos kutatás-fejlesztés kizárólagos céljára kifejlesztett és üzembe helyezett MI-rendszerekre vagy MI-modellekre, és azok kimenetére sem.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '7',
  '(7) A személyes adatok, a magánélet és a közlés bizalmasságának védelmére vonatkozó uniós jog alkalmazandó az e rendeletben megállapított jogokkal és kötelezettségekkel összefüggésben feldolgozott személyes adatokra. E rendelet 10. cikke (5) bekezdésének és 59. cikkének sérelme nélkül, e rendelet nem érinti az (EU) 2016/679 vagy az (EU) 2018/1725 rendeletet, vagy a 2002/58/EK vagy az (EU) 2016/680 irányelvet.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '8',
  '(8) E rendelet nem alkalmazandó semmilyen, az MI-rendszerekkel vagy MI-modellekkel kapcsolatos kutatási, tesztelési és fejlesztési tevékenységre azt megelőzően, hogy azokat forgalomba hozzák vagy üzembe helyezik. Az ilyen tevékenységeket az alkalmazandó uniós joggal összhangban kell végezni. Az említett kizárás nem vonatkozik a valós körülmények közötti tesztelésre.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '9',
  '(9) E rendelet nem érinti a fogyasztóvédelemre és a termékbiztonságra vonatkozó egyéb uniós jogi aktusokban megállapított szabályokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '10',
  '(10) E rendelet nem alkalmazandó azon alkalmazók kötelezettségeire, akik az MI-rendszereket pusztán személyes, nem szakmai tevékenység során használó természetes személyek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '11',
  '(11) E rendelet nem zárja ki az Uniót vagy a tagállamokat abból, hogy olyan törvényi, rendeleti vagy közigazgatási rendelkezéseket tartsanak fenn vagy vezessenek be, amelyek kedvezőbbek a munkavállalókra nézve az MI-rendszerek munkáltatók általi használatával kapcsolatos jogaik védelme tekintetében, vagy abból, hogy a munkavállalók számára kedvezőbb kollektív szerződések alkalmazását ösztönözzék vagy tegyék lehetővé.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '2',
  '12',
  '(12) E rendelet nem alkalmazandó a szabad és nyílt forráskódú licencek alapján kibocsátott MI-rendszerekre, kivéve, ha azokat nagy kockázatú MI-rendszerként, vagy az 5. vagy 50. cikk hatálya alá tartozó MI-rendszerként hozzák forgalomba vagy helyezik üzembe.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_2'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '3',
  null,
  'Fogalommeghatározások
E rendelet alkalmazásában:

1.

„MI-rendszer”: gépi alapú rendszer, amelyet különböző autonómiaszinteken történő működésre terveztek, és amely a bevezetését követően alkalmazkodóképességet tanúsíthat, és amely a kapott bemenetből – explicit vagy implicit célok érdekében – kikövetkezteti, miként generáljon olyan kimeneteket, mint például előrejelzéseket, tartalmakat, ajánlásokat vagy döntéseket, amelyek befolyásolhatják a fizikai vagy a virtuális környezetet;

2.

„kockázat”: a kár bekövetkezési valószínűségének és az említett kár súlyosságának kombinációja;

3.

„szolgáltató”: olyan természetes vagy jogi személy, hatóság, ügynökség vagy egyéb szerv, aki vagy amely MI-rendszert vagy általános célú MI-modellt fejleszt vagy fejleszttet, és a saját neve vagy védjegye alatt – akár fizetés ellenében, akár ingyenesen – az MI-rendszert vagy az általános célú MI-modellt forgalomba hozza, vagy az MI-rendszert üzembe helyezi;

4.

„alkalmazó”: olyan természetes vagy jogi személy, hatóság, ügynökség vagy egyéb szerv, aki vagy amely a felügyelete alá tartozó MI-rendszert használja, kivéve, ha az MI-rendszert személyes, nem szakmai jellegű tevékenység során használják;

5.

„meghatalmazott képviselő”: az Unióban tartózkodó vagy ott letelepedett természetes vagy jogi személy, aki vagy amely egy MI-rendszer vagy egy általános célú MI-modell szolgáltatójától írásbeli meghatalmazást kapott és fogadott el az e rendeletben meghatározott kötelezettségeknek, illetve eljárásoknak a szolgáltató nevében történő teljesítésére, illetve lefolytatására;

6.

„importőr”: az Unióban tartózkodó vagy ott letelepedett természetes vagy jogi személy, aki vagy amely egy harmadik országban letelepedett természetes vagy jogi személy nevével vagy védjegyével ellátott MI-rendszert hoz forgalomba;

7.

„forgalmazó”: az a szolgáltatótól vagy az importőrtől eltérő természetes vagy jogi személy az ellátási láncban, aki vagy amely az uniós piacon MI-rendszert forgalmaz;

8.

„gazdasági szereplő”: valamely szolgáltató, termékgyártó, alkalmazó, meghatalmazott képviselő, importőr vagy forgalmazó;

9.

„forgalomba hozatal”: valamely MI-rendszer vagy általános célú MI-modell első alkalommal történő forgalmazása az uniós piacon;

10.

„forgalmazás”: az uniós piacon egy MI-rendszer vagy egy általános célú MI-modell kereskedelmi tevékenység során történő rendelkezésre bocsátása terjesztés vagy használat céljából, akár fizetés ellenében, akár ingyenesen;

11.

„üzembe helyezés”: valamely MI-rendszer első használatra történő rendelkezésre bocsátása közvetlenül az alkalmazó számára vagy saját használatra az Unióban, a rendeltetésének megfelelően;

12.

„rendeltetés”: az MI-rendszer azon használata, amelyre a szolgáltató azt szánta, ideértve a sajátos használati kontextust és feltételeket, a szolgáltató által a használati utasításban, a promóciós vagy értékesítési anyagokban és nyilatkozatokban, valamint a műszaki dokumentációban megadott információk szerint;

13.

„észszerűen előrelátható rendellenes használat”: valamely MI-rendszer oly módon történő használata, amely nem felel meg a rendeltetésének, de amely előállhat észszerűen előrelátható emberi magatartás vagy más rendszerekkel – többek között más MI-rendszerekkel – való kölcsönhatás eredményeként;

14.

„biztonsági alkotórész”: egy termék vagy egy MI-rendszer olyan alkotórésze, amely az említett termék vagy MI-rendszer tekintetében biztonsági funkciót tölt be, vagy amelynek a meghibásodása vagy hibás működése veszélyezteti a személyek egészségét és biztonságát vagy a vagyontárgyakat;

15.

„használati utasítás”: a szolgáltató által a célból megadott információ, hogy tájékoztassa az alkalmazót különösen az MI-rendszer rendeltetéséről és megfelelő használatáról;

16.

„MI-rendszer visszahívása”: minden olyan intézkedés, amelynek célja elérni az alkalmazók rendelkezésére bocsátott MI-rendszernek a szolgáltatóhoz való visszajuttatását, vagy az üzemen kívül helyezését vagy a használatának letiltását;

17.

„MI-rendszer forgalomból történő kivonása”: minden olyan intézkedés, amelynek célja megakadályozni az ellátási láncba már bekerült MI-rendszer forgalmazását;

18.

„az MI-rendszer teljesítménye”: valamely MI-rendszer azon képessége, hogy betöltse rendeltetését;

19.

„bejelentő hatóság”: a megfelelőségértékelő szervezetek értékeléséhez, kijelöléséhez és bejelentéséhez, valamint a nyomon követésükhöz szükséges eljárások kialakításáért és lefolytatásáért felelős nemzeti hatóság;

20.

„megfelelőségértékelés”: azon eljárás, amely kimutatja, hogy teljesítették-e egy nagy kockázatú MI-rendszerrel kapcsolatos, a III. fejezet 2. szakaszában meghatározott követelményeket;

21.

„megfelelőségértékelő szervezet”: olyan szervezet, amely harmadik fél általi megfelelőségértékelési tevékenységeket végez, ideértve a tesztelést, a tanúsítást és az ellenőrzést is;

22.

„bejelentett szervezet”: az e rendelettel és az egyéb releváns uniós harmonizációs jogszabályokkal összhangban bejelentett megfelelőségértékelő szervezet;

23.

„jelentős módosítás”: az MI-rendszer olyan, a forgalomba hozatalát vagy üzembe helyezését követő módosítása, amelyet a szolgáltató által elvégzett első megfelelőségértékelésben nem irányoztak elő vagy terveztek, és amely érinti az MI-rendszer megfelelését a III. fejezet 2. szakaszában meghatározott követelményeknek, vagy az MI-rendszer értékelésének tárgyát képező rendeltetés módosulását eredményezi;

24.

„CE-jelölés”: olyan jelölés, amellyel a szolgáltató jelzi, hogy az MI-rendszer megfelel a III. fejezet 2. szakaszában és az egyéb alkalmazandó uniós harmonizációs jogszabályokban meghatározott követelményeknek, amelyek előírják e jelölés feltüntetését;

25.

„forgalomba hozatal utáni nyomonkövetési rendszer”: az MI-rendszerek szolgáltatói által végzett valamennyi olyan tevékenység, amelynek célja az általuk forgalomba hozott vagy üzembe helyezett MI-rendszerek használata során szerzett tapasztalatok összegyűjtése és áttekintése annak megállapítása céljából, hogy kell-e haladéktalanul valamilyen korrekciós vagy megelőző intézkedést alkalmazni;

26.

„piacfelügyeleti hatóság”: az (EU) 2019/1020 rendelet szerinti tevékenységeket végző és intézkedéseket hozó nemzeti hatóság;

27.

„harmonizált szabvány”: az 1025/2012/EU rendelet 2. cikke 1. pontjának c) alpontjában meghatározott harmonizált szabvány;

28.

„közös előírás”: az 1025/2012/EU rendelet 2. cikkének 4. pontjában meghatározott műszaki előírások készlete, amely eszközül szolgál az e rendelet szerinti bizonyos követelményeknek való megfeleléshez;

29.

„tanítóadatok”: olyan adatok, amelyeket egy MI-rendszernek a megtanulható paramétereinek illesztése révén történő tanítására használnak;

30.

„validálási adatok”: a betanított MI-rendszer értékelésének nyújtására, valamint a nem megtanulható paramétereinek és a tanulási folyamatának beállítására használt adatok, többek között az alulillesztés vagy a túlillesztés megelőzése érdekében;

31.

„validálási adatkészlet”: különálló adatkészlet vagy a tanítóadat-készlet része, akár rögzített, akár változó felosztás formájában;

32.

„tesztadatok”: az MI-rendszer független értékelésének nyújtásához használt adatok az említett rendszer elvárt teljesítményének a forgalomba hozatala vagy az üzembe helyezése előtti megerősítése érdekében;

33.

„bemeneti adatok”: valamely MI-rendszer számára szolgáltatott vagy általa közvetlenül megszerzett adatok, amelyek alapján a rendszer a kimenetet előállítja;

34.

„biometrikus adat”: egy természetes személy testi, fiziológiai vagy viselkedési jellemzőire vonatkozó, sajátos technikai eljárásokkal nyert személyes adat, ilyen például az arcképmás vagy a daktiloszkópiai adat;

35.

„biometrikus azonosítás”: az ember fizikai, fiziológiai, viselkedési vagy pszichológiai humán jellemzőinek automatikus felismerése a természetes személy személyazonosságának megállapítása céljából, az említett egyén biometrikus adatainak az adatbázisban tárolt egyének biometrikus adataival való összehasonlítása révén;

36.

„biometrikus ellenőrzés”: természetes személyek személyazonosságának automatizált, egy az egyhez ellenőrzése –ideértve a hitelesítést is – a biometrikus adataiknak a korábban megadott biometrikus adatokkal való összehasonlítása révén;

37.

„a személyes adatok különleges kategóriái”: az (EU) 2016/679 rendelet 9. cikkének (1) bekezdésében, az (EU) 2016/680 irányelv 10. cikkében és az (EU) 2018/1725 rendelet 10. cikkének (1) bekezdésében meghatározott személyesadat-kategóriák;

38.

„érzékeny operatív adatok”: a bűncselekmények megelőzését, felderítését, nyomozását vagy büntetőeljárás alá vonását célzó tevékenységekhez kapcsolódó operatív adatok, amelyek nyilvánosságra hozatala veszélyeztetheti a büntetőjogi eljárások integritását;

39.

„érzelemfelismerő rendszer”: a természetes személyek érzelmeinek vagy szándékainak a biometrikus adataik alapján történő azonosítására vagy kikövetkeztetésére szolgáló MI-rendszer;

40.

„biometrikus kategorizálási rendszer”: a természetes személyeknek a biometrikus adataik alapján meghatározott kategóriákba sorolására szolgáló MI-rendszer, kivéve, ha az egy másik kereskedelmi szolgáltatás mellett kiegészítő jellegű, és objektív technikai okokból feltétlenül szükséges;

41.

„távoli biometrikus azonosító rendszer”: a természetes személyek olyan azonosítására szolgáló MI-rendszer, amelyre az aktív közreműködésük nélkül, jellemzően távolról, egy személy biometrikus adatainak a referencia-adatbázisban szereplő biometrikus adatokkal való összehasonlítása révén kerül sor;

42.

„valós idejű távoli biometrikus azonosító rendszer”: olyan távoli biometrikus azonosító rendszer, amelyben a biometrikus adatok rögzítése, az összehasonlítás és az azonosítás egyaránt jelentős késleltetés nélkül történik, nemcsak azonnali azonosítást megvalósítva, hanem – a kijátszás elkerülése érdekében – korlátozott rövid késleltetéseket is;

43.

„nem valós idejű távoli biometrikus azonosító rendszer”: a valós idejű távoli biometrikus azonosító rendszertől eltérő távoli biometrikus azonosító rendszer;

44.

„a nyilvánosság számára hozzáférhető hely”: olyan köz- vagy magántulajdonban álló fizikai terület, amely meghatározatlan számú természetes személy számára hozzáférhető, függetlenül attól, hogy esetleg alkalmazandók-e bizonyos hozzáférési feltételek, valamint függetlenül a potenciális kapacitási korlátozásoktól;

45.

„bűnüldöző hatóság”:

a)

olyan közigazgatási szerv, amely hatáskörrel rendelkezik a bűncselekmények megelőzésére, nyomozására, felderítésére vagy büntetőeljárás alá vonására, vagy a büntetőjogi szankciók végrehajtására, ideértve a közbiztonságot fenyegető veszélyekkel szembeni védelmet és azok megelőzését is; vagy

b)

bármely egyéb olyan szerv vagy más jogalany, amely a tagállami jog alapján közfeladatokat lát el és közhatalmi jogosítványokat gyakorol a bűncselekmények megelőzése, nyomozása, felderítése vagy büntetőeljárás alá vonása, vagy büntetőjogi szankciók végrehajtása céljából, ideértve a közbiztonságot fenyegető veszélyekkel szembeni védelmet és azok megelőzését is;

46.

„bűnüldözés”: a bűnüldöző hatóságok által vagy a nevükben folytatott, a bűncselekmények megelőzését, nyomozását, felderítését, büntetőeljárás alá vonását, vagy a büntetőjogi szankciók végrehajtását célzó tevékenységek, ideértve a közbiztonságot fenyegető veszélyekkel szembeni védelmet és azok megelőzését is;

47.

„MI-hivatal”: a Bizottság azon funkciója, amellyel hozzájárul az MI-rendszerek és az általános célú MI-rendszerek, valamint az MI-irányítás végrehajtásához, nyomon követéséhez és felügyeletéhez, amiről a 2024. január 24-i bizottsági határozat rendelkezett; az MI-hivatalra e rendeletben történő hivatkozásokat a Bizottságra való hivatkozásként kell értelmezni;

48.

„illetékes nemzeti hatóság”: bejelentő hatóság vagy piacfelügyeleti hatóság; az uniós intézmények, ügynökségek, hivatalok és szervek által üzembe helyezett vagy használt MI-rendszerek tekintetében az illetékes nemzeti hatóságokra vagy piacfelügyeleti hatóságokra e rendeletben történő hivatkozásokat az európai adatvédelmi biztosra való hivatkozásként kell értelmezni;

49.

„súlyos váratlan esemény”: az MI-rendszernél fellépő olyan váratlan esemény vagy hibás működés, amely közvetlenül vagy közvetetten a következők bármelyikéhez vezet:

a)

valamely személy halála, vagy valamely személy egészségérnek súlyos károsodása;

b)

a kritikus infrastruktúra irányításának vagy üzemeltetésének súlyos és visszafordíthatatlan zavara;

c)

az alapvető jogok védelmére irányuló, uniós jog szerinti kötelezettségek megsértése;

d)

súlyos vagyoni vagy környezeti károsodás;

50.

„személyes adat”: az (EU) 2016/679 rendelet 4. cikkének 1. pontjában meghatározott személyes adat;

51.

„nem személyes adat”: az (EU) 2016/679 rendelet 4. cikkének 1. pontjában meghatározott személyes adatoktól eltérő adat;

52.

„profilalkotás”: az (EU) 2016/679 rendelet 4. cikkének 4. pontjában meghatározott profilalkotás;

53.

„valós körülmények közötti tesztelésre vonatkozó terv”: olyan dokumentum, amely ismerteti a valós körülmények közötti tesztelés célkitűzéseit, módszertanát, földrajzi, személyi és időbeli hatályát, nyomon követését, megszervezését és lefolytatását;

54.

„tesztkörnyezetre vonatkozó terv”: a részt vevő szolgáltató és az illetékes hatóság közötti megállapodáson alapuló dokumentum, amely ismerteti a tesztkörnyezetben végzett tevékenységek célkitűzéseit, feltételeit, időkeretét, módszertanát és követelményeit;

55.

„MI szabályozói tesztkörnyezet”: valamely illetékes hatóság által létrehozott ellenőrzött keretrendszer, amely lehetőséget kínál az MI-rendszerek szolgáltatói vagy leendő szolgáltatói számára, hogy – szabályozói felügyelet mellett, korlátozott ideig egy tesztkörnyezetre vonatkozó tervet követve – innovatív MI-rendszert fejlesszenek ki, tanítsanak be, validáljanak és teszteljenek, adott esetben valós körülmények között;

56.

„MI-jártasság”: olyan készségek, ismeretek és értelmezési képességek, amelyek lehetővé teszik a szolgáltatók, az alkalmazók és az érintett személyek számára, hogy – figyelembe véve az e rendelettel összefüggésben fennálló jogaikat és kötelezettségeiket – a megfelelő információk birtokában telepítsenek MI-rendszereket, valamint tudomást szerezzenek az MI lehetőségeiről és kockázatairól, és azon lehetséges károkról, amelyet az MI okozhat;

57.

„valós körülmények közötti tesztelés”: egy MI-rendszernek a rendeltetése tekintetében – valós körülmények között laboratóriumon vagy más szimulált környezeten kívül – végzett ideiglenes tesztelése, megbízható és stabil adatok gyűjtése, valamint annak értékelése és ellenőrzése céljából, hogy az MI-rendszer megfelel-e e rendelet követelményeinek, és ez nem minősül az MI-rendszer e rendelet értelmében vett forgalomba hozatalának vagy üzembe helyezésének, feltéve, hogy az 57. vagy a 60. cikkben megállapított valamennyi feltétel teljesül;

58.

„vizsgálati alany”: a valós körülmények közötti tesztelés céljára olyan természetes személy, aki részt vesz valós körülmények közötti tesztelésben;

59.

„tájékoztatáson alapuló hozzájárulás”: a vizsgálati alany által szabad akaratból adott, konkrét, egyértelmű és önkéntes kifejezése annak, hogy hajlandó részt venni egy adott, valós körülmények közötti tesztelésben, miután tájékoztatást kapott a tesztelés valamennyi olyan szempontjáról, amely a vizsgálati alanynak a részvételre vonatkozó döntése szempontjából releváns;

60.

„deepfake”: az MI által generált vagy manipulált kép, audio- vagy videotartalom, amely hasonlít létező személyekre, tárgyakra, helyekre, entitásokra vagy eseményekre, és amely egy személy számára megtévesztő módon autentikusnak vagy valóságosnak tűnne;

61.

„kiterjedt jogsértés”: bármely, az egyének érdekét védő uniós joggal ellentétes cselekmény vagy mulasztás, amely:

a)

sértette vagy valószínűleg sérti olyan egyének kollektív érdekeit, akik azon tagállamtól eltérő legalább két tagállamban rendelkeznek lakóhellyel, amelyben:

i.

a cselekmény vagy a mulasztás keletkezett vagy sorra került;

ii.

az érintett szolgáltató vagy adott esetben a meghatalmazott képviselője tartózkodik vagy letelepedett; vagy

iii.

az alkalmazó letelepedett, ha a jogsértést az alkalmazó követi el;

b)

kárt okozott, okoz vagy okozhat egyének kollektív érdekeire nézve, és közös jellemzőkkel bír – többek között ugyanazon jogellenes gyakorlatot valósítja meg, vagy ugyanazon érdeket sérti –, és amelyet egy időben követ el ugyanazon gazdasági szereplő legalább három tagállamban;

62.

„kritikus infrastruktúra”: az (EU) 2022/2557 irányelv 2. cikkének 4. pontjában meghatározott kritikus infrastruktúra;

63.

„általános célú MI-modell”: olyan MI-modell – ideértve azt is, amikor az ilyen MI-modell tanítása nagy adatmennyiséggel, nagy léptékű önfelügyelet mellett történik –, amely jelentős általánosságot mutat, és forgalomba hozatalának módjától függetlenül, különféle feladatok széles körének elvégzésére képes, valamint többféle downstream rendszerbe vagy alkalmazásba integrálható, azon MI-modellek kivételével, amelyeket a forgalomba hozatalukat megelőzően kutatási, fejlesztési vagy prototípus-alkotási tevékenységekre használnak;

64.

„nagy hatású képességek”: olyan képességek, amelyek megfelelnek a legfejlettebb általános célú MI-modellekben rögzített képességeknek, vagy meghaladják azokat;

65.

„rendszerszintű kockázat”: az általános célú MI-modellek nagy hatású képességeire jellemző kockázat, amely – a modellek jelentős elterjedtsége miatt, vagy a népegészségre, a biztonságra, a közbiztonságra, az alapvető jogokra vagy a társadalom egészére gyakorolt tényleges vagy észszerűen előrelátható negatív hatások révén – olyan jelentős hatást gyakorol az uniós piacra, amely nagy léptékben továbbterjedhet az értékláncban;

66.

„általános célú MI-rendszer”: általános célú MI-modellen alapuló MI-rendszer, amely – mind közvetlen felhasználás, mind más MI-rendszerekbe való integráció céljából – többféle célt képes szolgálni;

67.

„lebegőpontos művelet”: lebegőpontos számokkal végzett matematikai művelet vagy feladat, amely számok a valós számok azon alhalmaza, amelyeket – jellemzően számítógépen – egy rögzített pontosságú egész számnak és egy rögzített alap egész számú hatványának a szorzataként ábrázolnak;

68.

„downstream szolgáltató”: olyan MI-rendszer – ideértve az általános célú MI-rendszert is – szolgáltatója, amelybe MI-modellt integráltak, függetlenül attól, hogy a szolgáltató által biztosított, vertikálisan integrált MI-modellről vagy egy másik szervezet által szerződéses viszonyok alapján biztosított MI-modellről van-e szó.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_3'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '4',
  null,
  'MI-jártasság
Az MI-rendszerek szolgáltatói és alkalmazói intézkedéseket hoznak annak érdekében, hogy a tőlük telhető legnagyobb mértékben biztosítsák személyzetük, valamint a nevükben az MI-rendszerek működtetésével és használatával foglalkozó bármely más személy mesterséges intelligencia terén szerzett megfelelő szintű MI-jártasságát, figyelembe véve szakmai ismereteiket, tapasztalatukat, végzettségüket és képzettségüket, valamint azon körülményeket, amelyek között az MI-rendszereket használni fogják, és figyelembe véve azon személyeket vagy azon személyek csoportjait, akik tekintetében az MI-rendszereket használni fogják.

II. FEJEZET

TILTOTT MI-GYAKORLATOK',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_4'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  null,
  'Tiltott MI-gyakorlatok
(1) Tilosak a következő MI-gyakorlatok:

a)

olyan MI-rendszerek forgalomba hozatala, üzembe helyezése vagy használata, amelyek szubliminális technikákat alkalmaznak az adott személy tudatán kívül, vagy célzottan manipulatív vagy megtévesztő technikákat alkalmaznak azzal a céllal vagy olyan hatás érdekében, hogy lényegesen torzítsák egy személy vagy személyek egy csoportjának magatartását azáltal, hogy jelentősen gyengítik a megalapozott döntéshozatalra való képességüket, azt eredményezve, hogy olyan döntést hozzanak, amelyet egyébként nem hoztak volna meg, és oly módon, amely az említett személynek, egy másik személynek vagy személyek egy csoportjának jelentős károsodást okoz vagy ésszerű valószínűséggel okozhat;

b)

olyan MI-rendszerek forgalomba hozatala, üzembe helyezése vagy használata, amelyek egy természetes személynek vagy a személyek egy meghatározott csoportjának az életkor, fogyatékosság, illetve egyedi szociális vagy gazdasági helyzet miatt fennálló valamilyen sebezhetőségét kihasználják azzal a céllal vagy hatással, hogy lényegesen torzítsák az említett személy vagy az említett csoporthoz tartozó valamely személy magatartását oly módon, amely az említett személynek vagy egy másik személynek jelentős kárt okoz vagy észszerű valószínűséggel okozhat;

c)

MI-rendszerek forgalomba hozatala, üzembe helyezése vagy használata természetes személyek vagy személyek csoportjai értékelésének vagy osztályozásának céljából egy bizonyos időszakon keresztül, közösségi magatartásuk, illetve ismert, kikövetkeztetett vagy előre jelzett személyes tulajdonságaik vagy személyiségjegyeik alapján, oly módon, hogy a társadalmi pontszám a következő helyzetek egyikéhez vagy mindkettőhöz vezet:

i.

bizonyos természetes személyekkel vagy személyek csoportjaival szembeni hátrányos vagy kedvezőtlen bánásmód olyan szociális kontextusokban, amelyek nem függenek össze azokkal a kontextusokkal, amelyek között az adatokat eredetileg létrehozták vagy gyűjtötték;

ii.

bizonyos természetes személyekkel vagy személyek csoportjával szembeni olyan hátrányos vagy kedvezőtlen bánásmód, amely indokolatlan vagy aránytalan közösségi magatartásukhoz vagy annak súlyosságához képest;

d)

olyan MI-rendszer forgalomba hozatala, e konkrét célra történő üzembe helyezése vagy használata, amely természetes személyek kockázatértékelését végzi annak érdekében, hogy – kizárólag a természetes személyekre vonatkozó profilalkotás vagy személyiségjegyeik és tulajdonságaik értékelése alapján – felmérje vagy előre jelezze annak kockázatát, hogy egy adott természetes személy bűncselekményt követ el; ez a tilalom nem alkalmazandó azon MI-rendszerekre, amelyek a személyek bűncselekményben való részvételének emberi értékelését támogatják, amely értékelés alapjául már rendelkezésre állnak a bűnözői tevékenységhez közvetlenül kapcsolódó, objektív és ellenőrizhető tények;

e)

olyan MI-rendszerek forgalomba hozatala, e konkrét célra történő üzembe helyezése vagy használata, amelyek az arcképek internetről vagy zártláncú televízió-felvételekből való, nem célzott lekérdezésével arcfelismerő adatbázisokat hoznak létre vagy ilyeneket bővítenek;

f)

a természetes személyek érzelmeiből következtetést levonó MI-rendszerek forgalomba hozatala, e konkrét célra történő üzembe helyezése, illetve használata a munkahelyek és az oktatási intézmények területén, kivéve amennyiben az MI-rendszer használata, üzembe helyezése vagy forgalomba hozatala orvosi vagy biztonsági okokból történik;

g)

olyan biometrikus kategorizálási rendszerek forgalomba hozatala, e konkrét célra történő üzembe helyezése, illetve használata, amelyek természetes személyeket biometrikus adataik alapján egyénileg kategorizálnak, hogy ezáltal levezessék vagy kikövetkeztessék faji hovatartozásukat, politikai véleményüket, szakszervezeti tagságukat, vallási vagy világnézeti meggyőződésüket, szexuális életüket vagy szexuális irányultságukat; ez a tilalom nem terjed ki a jogszerűen megszerzett biometrikus adatkészletek – például képek – biometrikus adatok szerint történő jogszerű címkézésére vagy szűrésére, illetve a biometrikus adatoknak a bűnüldözés területén való kategorizálására;

h)

„valós idejű” távoli biometrikus azonosító rendszerek használata a nyilvánosság számára hozzáférhető helyeken bűnüldözési célokból, kivéve, ha és amennyiben az ilyen használat a következő célok egyikéhez feltétlenül szükséges:

i.

emberrablás, emberkereskedelem vagy szexuális kizsákmányolás konkrét áldozatainak célzott felkutatása, valamint az eltűnt személyek utáni kutatás;

ii.

természetes személyek életét vagy fizikai biztonságát fenyegető konkrét, jelentős és közvetlen veszély, illetve terrortámadás tényleges és valós vagy tényleges és előre látható veszélyének megelőzése;

iii.

bűncselekmények gyanúsítottjainak lokalizálása vagy azonosítása nyomozás vagy büntetőeljárás lefolytatása vagy büntetőjogi szankció végrehajtása céljából olyan, a II. mellékletben említett bűncselekmény miatt, amelynek esetében az érintett tagállamban a büntetési tétel felső határa legalább négyévi szabadságvesztés vagy szabadságelvonással járó intézkedés.

Az első albekezdés h) pontja nem érinti az (EU) 2016/679 rendelet 9. cikkét a biometrikus adatoknak a bűnüldözéstől eltérő célokból történő kezelése tekintetében.

(2) A „valós idejű” távoli biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken, bűnüldözés céljából, az (1) bekezdés első albekezdésének h) pontjában említett célok bármelyike tekintetében történő használata az említett pontban meghatározott célokból, csak a konkrét célszemély személyazonosságának megerősítése érdekében indítható el, és annak során figyelembe kell venni a következő elemeket:

a)

a lehetséges használatot eredményező helyzet jellege, különösen azon kár súlyossága, valószínűsége és mértéke, amely a rendszer használatának elmaradásakor keletkezne;

b)

a rendszer használatának valamennyi érintett személy jogaira és szabadságaira gyakorolt következményei, különösen e következmények súlyossága, valószínűsége és mértéke.

Emellett a „valós idejű” távoli biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken, bűnüldözés céljából, az e cikk (1) bekezdése első albekezdésének h) pontjában említett célok bármelyike tekintetében történő használatának meg kell felelnie – az annak használatát engedélyező nemzeti joggal összhangban – a használattal kapcsolatos szükséges és arányos biztosítékoknak és feltételeknek, különösen az időbeli, földrajzi és személyi korlátozások tekintetében. A valós idejű távoli biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken történő használata csak akkor engedélyezhető, ha a bűnüldöző hatóság – a 27. cikk rendelkezéseinek megfelelően – elvégezte az alapvetőjogi hatásvizsgálatot, és – a 49. cikkel összhangban – nyilvántartásba vette a rendszert az uniós adatbázisban. Kellően indokolt sürgős esetekben azonban az ilyen rendszerek használata az uniós adatbázisban történő regisztráció nélkül is elindítható, feltéve, hogy az ilyen regisztrációra indokolatlan késedelem nélkül sor kerül.

(3) Az (1) bekezdés első albekezdésének h) pontja és a (2) bekezdés alkalmazása céljából a „valós idejű” távoli biometrikus azonosító rendszer nyilvánosság számára hozzáférhető helyeken, bűnüldözési célokra történő minden használata a használat helye szerinti tagállam igazságügyi hatósága vagy független közigazgatási hatósága – amelynek határozata kötelező erejű – által kiadott előzetes engedélyhez kötött, amelyet indokolt megkeresésre, a (5) bekezdésben említett nemzeti jogszabályok részletes szabályaival összhangban bocsátanak ki. Kellően indokolt sürgős esetben azonban a rendszer használata engedély nélkül is megkezdhető, feltéve, hogy az ilyen engedély megkérésére indokolatlan késedelem nélkül, legkésőbb 24 órán belül sor kerül. Ha az ilyen engedélyt elutasítják, a használatot azonnali hatállyal le kell állítani, valamint az említett használat valamennyi eredményét és kimenetét azonnal meg kell semmisíteni, és törölni kell.

Az illetékes igazságügyi hatóság vagy olyan független közigazgatási hatóság, amelynek határozata kötelező erejű, csak akkor adhatja meg az engedélyt, ha az elé terjesztett objektív bizonyítékok vagy egyértelmű jelzések alapján meggyőződött arról, hogy az érintett „valós idejű” távoli biometrikus azonosító rendszer használata az (1) bekezdés első albekezdésének h) pontjában meghatározott, a megkeresésben azonosított célok valamelyikének eléréséhez szükséges és azzal arányos, továbbá különösen, hogy az időtartam, valamint a földrajzi és személyi hatály tekintetében a feltétlenül szükséges mértékre korlátozódik. A megkeresésről való döntés során az említett hatóságnak figyelembe kell vennie a (2) bekezdésben említett tényezőket. Kizárólag a „valós idejű” távoli biometrikus azonosító rendszer kimenete alapján nem hozható olyan döntés, amely egy személyre nézve kedvezőtlen joghatással jár.

(4) A (3) bekezdés sérelme nélkül, a „valós idejű” biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken, bűnüldözési célból történő használatáról minden esetben – az (5) bekezdésben említett nemzeti szabályokkal összhangban – értesíteni kell az érintett piacfelügyeleti hatóságot és a nemzeti adatvédelmi hatóságot. Az értesítésnek tartalmaznia kell legalább a (6) bekezdésben meghatározott információkat, és nem tartalmazhat érzékeny operatív adatokat.

(5) A tagállamok dönthetnek úgy, hogy az (1) bekezdés első albekezdésének h) pontjában, valamint a (2) és (3) bekezdésben felsorolt korlátokon belül és feltételek mellett lehetővé teszik a „valós idejű” távoli biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken, bűnüldözési célokból történő használatának teljes vagy részleges engedélyezését. Az érintett tagállamok a nemzeti jogukban meghatározzák a (3) bekezdésben említett engedélyek kérelmezésére, kiadására és felhasználására, valamint az azokkal kapcsolatos felügyeletre és jelentéstételre vonatkozó szükséges részletes szabályokat. Ezekben a szabályokban azt is meg kell határozni, hogy az (1) bekezdés első albekezdésének h) pontjában felsorolt célok közül melyek tekintetében, valamint az említett bekezdés h) pontjának iii. alpontjában említett bűncselekmények közül melyek tekintetében engedélyezhető az illetékes hatóságok számára az említett rendszerek bűnüldözési célú használata. A tagállamok az említett szabályokról legkésőbb azok elfogadása után 30 nappal értesítik a Bizottságot. A tagállamok az uniós joggal összhangban szigorúbb jogszabályokat is bevezethetnek a távoli biometrikus azonosító rendszerek használatára vonatkozóan.

(6) Azon tagállami nemzeti piacfelügyeleti hatóságok és nemzeti adatvédelmi hatóságok, amelyek a (4) bekezdésnek megfelelően értesítést kaptak a „valós idejű” távoli biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken, bűnüldözési célból történő használatáról, éves jelentéseket nyújtanak be a Bizottságnak az ilyen használatról. E célból a Bizottság sablont bocsát a tagállamok és a nemzeti piacfelügyeleti és adatvédelmi hatóságok rendelkezésére, amely tartalmazza az azon határozatok számára, valamint azok eredményére vonatkozó információkat, amelyeket – a (3) bekezdés szerinti, engedély iránti megkeresésre – az illetékes igazságügyi hatóságok vagy olyan független közigazgatási hatóság hozott, amelynek határozata kötelező erejű.

(7) A Bizottság a (6) bekezdésben említett éves jelentések nyomán a tagállamokban összesített adatok alapján éves jelentéseket tesz közzé a valós idejű távoli biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken történő, bűnüldözési célú használatáról. Az említett éves jelentések nem tartalmazhatják a kapcsolódó bűnüldözési tevékenységek érzékeny operatív adatait.

(8) Ez a cikk nem érinti az abban az esetben alkalmazandó tilalmakat, ha valamely MI-gyakorlat más uniós jogot sért.

III. FEJEZET

NAGY KOCKÁZATÚ MI-RENDSZEREK

1. SZAKASZ

MI-rendszerek nagy kockázatúként való besorolása',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '1',
  '(1) Tilosak a következő MI-gyakorlatok:

a)

olyan MI-rendszerek forgalomba hozatala, üzembe helyezése vagy használata, amelyek szubliminális technikákat alkalmaznak az adott személy tudatán kívül, vagy célzottan manipulatív vagy megtévesztő technikákat alkalmaznak azzal a céllal vagy olyan hatás érdekében, hogy lényegesen torzítsák egy személy vagy személyek egy csoportjának magatartását azáltal, hogy jelentősen gyengítik a megalapozott döntéshozatalra való képességüket, azt eredményezve, hogy olyan döntést hozzanak, amelyet egyébként nem hoztak volna meg, és oly módon, amely az említett személynek, egy másik személynek vagy személyek egy csoportjának jelentős károsodást okoz vagy ésszerű valószínűséggel okozhat;

b)

olyan MI-rendszerek forgalomba hozatala, üzembe helyezése vagy használata, amelyek egy természetes személynek vagy a személyek egy meghatározott csoportjának az életkor, fogyatékosság, illetve egyedi szociális vagy gazdasági helyzet miatt fennálló valamilyen sebezhetőségét kihasználják azzal a céllal vagy hatással, hogy lényegesen torzítsák az említett személy vagy az említett csoporthoz tartozó valamely személy magatartását oly módon, amely az említett személynek vagy egy másik személynek jelentős kárt okoz vagy észszerű valószínűséggel okozhat;

c)

MI-rendszerek forgalomba hozatala, üzembe helyezése vagy használata természetes személyek vagy személyek csoportjai értékelésének vagy osztályozásának céljából egy bizonyos időszakon keresztül, közösségi magatartásuk, illetve ismert, kikövetkeztetett vagy előre jelzett személyes tulajdonságaik vagy személyiségjegyeik alapján, oly módon, hogy a társadalmi pontszám a következő helyzetek egyikéhez vagy mindkettőhöz vezet:

i.

bizonyos természetes személyekkel vagy személyek csoportjaival szembeni hátrányos vagy kedvezőtlen bánásmód olyan szociális kontextusokban, amelyek nem függenek össze azokkal a kontextusokkal, amelyek között az adatokat eredetileg létrehozták vagy gyűjtötték;

ii.

bizonyos természetes személyekkel vagy személyek csoportjával szembeni olyan hátrányos vagy kedvezőtlen bánásmód, amely indokolatlan vagy aránytalan közösségi magatartásukhoz vagy annak súlyosságához képest;

d)

olyan MI-rendszer forgalomba hozatala, e konkrét célra történő üzembe helyezése vagy használata, amely természetes személyek kockázatértékelését végzi annak érdekében, hogy – kizárólag a természetes személyekre vonatkozó profilalkotás vagy személyiségjegyeik és tulajdonságaik értékelése alapján – felmérje vagy előre jelezze annak kockázatát, hogy egy adott természetes személy bűncselekményt követ el; ez a tilalom nem alkalmazandó azon MI-rendszerekre, amelyek a személyek bűncselekményben való részvételének emberi értékelését támogatják, amely értékelés alapjául már rendelkezésre állnak a bűnözői tevékenységhez közvetlenül kapcsolódó, objektív és ellenőrizhető tények;

e)

olyan MI-rendszerek forgalomba hozatala, e konkrét célra történő üzembe helyezése vagy használata, amelyek az arcképek internetről vagy zártláncú televízió-felvételekből való, nem célzott lekérdezésével arcfelismerő adatbázisokat hoznak létre vagy ilyeneket bővítenek;

f)

a természetes személyek érzelmeiből következtetést levonó MI-rendszerek forgalomba hozatala, e konkrét célra történő üzembe helyezése, illetve használata a munkahelyek és az oktatási intézmények területén, kivéve amennyiben az MI-rendszer használata, üzembe helyezése vagy forgalomba hozatala orvosi vagy biztonsági okokból történik;

g)

olyan biometrikus kategorizálási rendszerek forgalomba hozatala, e konkrét célra történő üzembe helyezése, illetve használata, amelyek természetes személyeket biometrikus adataik alapján egyénileg kategorizálnak, hogy ezáltal levezessék vagy kikövetkeztessék faji hovatartozásukat, politikai véleményüket, szakszervezeti tagságukat, vallási vagy világnézeti meggyőződésüket, szexuális életüket vagy szexuális irányultságukat; ez a tilalom nem terjed ki a jogszerűen megszerzett biometrikus adatkészletek – például képek – biometrikus adatok szerint történő jogszerű címkézésére vagy szűrésére, illetve a biometrikus adatoknak a bűnüldözés területén való kategorizálására;

h)

„valós idejű” távoli biometrikus azonosító rendszerek használata a nyilvánosság számára hozzáférhető helyeken bűnüldözési célokból, kivéve, ha és amennyiben az ilyen használat a következő célok egyikéhez feltétlenül szükséges:

i.

emberrablás, emberkereskedelem vagy szexuális kizsákmányolás konkrét áldozatainak célzott felkutatása, valamint az eltűnt személyek utáni kutatás;

ii.

természetes személyek életét vagy fizikai biztonságát fenyegető konkrét, jelentős és közvetlen veszély, illetve terrortámadás tényleges és valós vagy tényleges és előre látható veszélyének megelőzése;

iii.

bűncselekmények gyanúsítottjainak lokalizálása vagy azonosítása nyomozás vagy büntetőeljárás lefolytatása vagy büntetőjogi szankció végrehajtása céljából olyan, a II. mellékletben említett bűncselekmény miatt, amelynek esetében az érintett tagállamban a büntetési tétel felső határa legalább négyévi szabadságvesztés vagy szabadságelvonással járó intézkedés.

Az első albekezdés h) pontja nem érinti az (EU) 2016/679 rendelet 9. cikkét a biometrikus adatoknak a bűnüldözéstől eltérő célokból történő kezelése tekintetében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '1(a)',
  'a) olyan MI-rendszerek forgalomba hozatala, üzembe helyezése vagy használata, amelyek szubliminális technikákat alkalmaznak az adott személy tudatán kívül, vagy célzottan manipulatív vagy megtévesztő technikákat alkalmaznak azzal a céllal vagy olyan hatás érdekében, hogy lényegesen torzítsák egy személy vagy személyek egy csoportjának magatartását azáltal, hogy jelentősen gyengítik a megalapozott döntéshozatalra való képességüket, azt eredményezve, hogy olyan döntést hozzanak, amelyet egyébként nem hoztak volna meg, és oly módon, amely az említett személynek, egy másik személynek vagy személyek egy csoportjának jelentős károsodást okoz vagy ésszerű valószínűséggel okozhat;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '1(b)',
  'b) olyan MI-rendszerek forgalomba hozatala, üzembe helyezése vagy használata, amelyek egy természetes személynek vagy a személyek egy meghatározott csoportjának az életkor, fogyatékosság, illetve egyedi szociális vagy gazdasági helyzet miatt fennálló valamilyen sebezhetőségét kihasználják azzal a céllal vagy hatással, hogy lényegesen torzítsák az említett személy vagy az említett csoporthoz tartozó valamely személy magatartását oly módon, amely az említett személynek vagy egy másik személynek jelentős kárt okoz vagy észszerű valószínűséggel okozhat;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '1(c)',
  'c) MI-rendszerek forgalomba hozatala, üzembe helyezése vagy használata természetes személyek vagy személyek csoportjai értékelésének vagy osztályozásának céljából egy bizonyos időszakon keresztül, közösségi magatartásuk, illetve ismert, kikövetkeztetett vagy előre jelzett személyes tulajdonságaik vagy személyiségjegyeik alapján, oly módon, hogy a társadalmi pontszám a következő helyzetek egyikéhez vagy mindkettőhöz vezet:

i.

bizonyos természetes személyekkel vagy személyek csoportjaival szembeni hátrányos vagy kedvezőtlen bánásmód olyan szociális kontextusokban, amelyek nem függenek össze azokkal a kontextusokkal, amelyek között az adatokat eredetileg létrehozták vagy gyűjtötték;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '1(d)',
  'd) olyan MI-rendszer forgalomba hozatala, e konkrét célra történő üzembe helyezése vagy használata, amely természetes személyek kockázatértékelését végzi annak érdekében, hogy – kizárólag a természetes személyekre vonatkozó profilalkotás vagy személyiségjegyeik és tulajdonságaik értékelése alapján – felmérje vagy előre jelezze annak kockázatát, hogy egy adott természetes személy bűncselekményt követ el; ez a tilalom nem alkalmazandó azon MI-rendszerekre, amelyek a személyek bűncselekményben való részvételének emberi értékelését támogatják, amely értékelés alapjául már rendelkezésre állnak a bűnözői tevékenységhez közvetlenül kapcsolódó, objektív és ellenőrizhető tények;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '1(e)',
  'e) olyan MI-rendszerek forgalomba hozatala, e konkrét célra történő üzembe helyezése vagy használata, amelyek az arcképek internetről vagy zártláncú televízió-felvételekből való, nem célzott lekérdezésével arcfelismerő adatbázisokat hoznak létre vagy ilyeneket bővítenek;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '1(f)',
  'f) a természetes személyek érzelmeiből következtetést levonó MI-rendszerek forgalomba hozatala, e konkrét célra történő üzembe helyezése, illetve használata a munkahelyek és az oktatási intézmények területén, kivéve amennyiben az MI-rendszer használata, üzembe helyezése vagy forgalomba hozatala orvosi vagy biztonsági okokból történik;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '1(g)',
  'g) olyan biometrikus kategorizálási rendszerek forgalomba hozatala, e konkrét célra történő üzembe helyezése, illetve használata, amelyek természetes személyeket biometrikus adataik alapján egyénileg kategorizálnak, hogy ezáltal levezessék vagy kikövetkeztessék faji hovatartozásukat, politikai véleményüket, szakszervezeti tagságukat, vallási vagy világnézeti meggyőződésüket, szexuális életüket vagy szexuális irányultságukat; ez a tilalom nem terjed ki a jogszerűen megszerzett biometrikus adatkészletek – például képek – biometrikus adatok szerint történő jogszerű címkézésére vagy szűrésére, illetve a biometrikus adatoknak a bűnüldözés területén való kategorizálására;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '1(h)',
  'h) „valós idejű” távoli biometrikus azonosító rendszerek használata a nyilvánosság számára hozzáférhető helyeken bűnüldözési célokból, kivéve, ha és amennyiben az ilyen használat a következő célok egyikéhez feltétlenül szükséges:

i.

emberrablás, emberkereskedelem vagy szexuális kizsákmányolás konkrét áldozatainak célzott felkutatása, valamint az eltűnt személyek utáni kutatás;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '2',
  '(2) A „valós idejű” távoli biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken, bűnüldözés céljából, az (1) bekezdés első albekezdésének h) pontjában említett célok bármelyike tekintetében történő használata az említett pontban meghatározott célokból, csak a konkrét célszemély személyazonosságának megerősítése érdekében indítható el, és annak során figyelembe kell venni a következő elemeket:

a)

a lehetséges használatot eredményező helyzet jellege, különösen azon kár súlyossága, valószínűsége és mértéke, amely a rendszer használatának elmaradásakor keletkezne;

b)

a rendszer használatának valamennyi érintett személy jogaira és szabadságaira gyakorolt következményei, különösen e következmények súlyossága, valószínűsége és mértéke.

Emellett a „valós idejű” távoli biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken, bűnüldözés céljából, az e cikk (1) bekezdése első albekezdésének h) pontjában említett célok bármelyike tekintetében történő használatának meg kell felelnie – az annak használatát engedélyező nemzeti joggal összhangban – a használattal kapcsolatos szükséges és arányos biztosítékoknak és feltételeknek, különösen az időbeli, földrajzi és személyi korlátozások tekintetében. A valós idejű távoli biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken történő használata csak akkor engedélyezhető, ha a bűnüldöző hatóság – a 27. cikk rendelkezéseinek megfelelően – elvégezte az alapvetőjogi hatásvizsgálatot, és – a 49. cikkel összhangban – nyilvántartásba vette a rendszert az uniós adatbázisban. Kellően indokolt sürgős esetekben azonban az ilyen rendszerek használata az uniós adatbázisban történő regisztráció nélkül is elindítható, feltéve, hogy az ilyen regisztrációra indokolatlan késedelem nélkül sor kerül.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '2(a)',
  'a) a lehetséges használatot eredményező helyzet jellege, különösen azon kár súlyossága, valószínűsége és mértéke, amely a rendszer használatának elmaradásakor keletkezne;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '2(b)',
  'b) a rendszer használatának valamennyi érintett személy jogaira és szabadságaira gyakorolt következményei, különösen e következmények súlyossága, valószínűsége és mértéke.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '3',
  '(3) Az (1) bekezdés első albekezdésének h) pontja és a (2) bekezdés alkalmazása céljából a „valós idejű” távoli biometrikus azonosító rendszer nyilvánosság számára hozzáférhető helyeken, bűnüldözési célokra történő minden használata a használat helye szerinti tagállam igazságügyi hatósága vagy független közigazgatási hatósága – amelynek határozata kötelező erejű – által kiadott előzetes engedélyhez kötött, amelyet indokolt megkeresésre, a (5) bekezdésben említett nemzeti jogszabályok részletes szabályaival összhangban bocsátanak ki. Kellően indokolt sürgős esetben azonban a rendszer használata engedély nélkül is megkezdhető, feltéve, hogy az ilyen engedély megkérésére indokolatlan késedelem nélkül, legkésőbb 24 órán belül sor kerül. Ha az ilyen engedélyt elutasítják, a használatot azonnali hatállyal le kell állítani, valamint az említett használat valamennyi eredményét és kimenetét azonnal meg kell semmisíteni, és törölni kell.

Az illetékes igazságügyi hatóság vagy olyan független közigazgatási hatóság, amelynek határozata kötelező erejű, csak akkor adhatja meg az engedélyt, ha az elé terjesztett objektív bizonyítékok vagy egyértelmű jelzések alapján meggyőződött arról, hogy az érintett „valós idejű” távoli biometrikus azonosító rendszer használata az (1) bekezdés első albekezdésének h) pontjában meghatározott, a megkeresésben azonosított célok valamelyikének eléréséhez szükséges és azzal arányos, továbbá különösen, hogy az időtartam, valamint a földrajzi és személyi hatály tekintetében a feltétlenül szükséges mértékre korlátozódik. A megkeresésről való döntés során az említett hatóságnak figyelembe kell vennie a (2) bekezdésben említett tényezőket. Kizárólag a „valós idejű” távoli biometrikus azonosító rendszer kimenete alapján nem hozható olyan döntés, amely egy személyre nézve kedvezőtlen joghatással jár.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '4',
  '(4) A (3) bekezdés sérelme nélkül, a „valós idejű” biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken, bűnüldözési célból történő használatáról minden esetben – az (5) bekezdésben említett nemzeti szabályokkal összhangban – értesíteni kell az érintett piacfelügyeleti hatóságot és a nemzeti adatvédelmi hatóságot. Az értesítésnek tartalmaznia kell legalább a (6) bekezdésben meghatározott információkat, és nem tartalmazhat érzékeny operatív adatokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '5',
  '(5) A tagállamok dönthetnek úgy, hogy az (1) bekezdés első albekezdésének h) pontjában, valamint a (2) és (3) bekezdésben felsorolt korlátokon belül és feltételek mellett lehetővé teszik a „valós idejű” távoli biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken, bűnüldözési célokból történő használatának teljes vagy részleges engedélyezését. Az érintett tagállamok a nemzeti jogukban meghatározzák a (3) bekezdésben említett engedélyek kérelmezésére, kiadására és felhasználására, valamint az azokkal kapcsolatos felügyeletre és jelentéstételre vonatkozó szükséges részletes szabályokat. Ezekben a szabályokban azt is meg kell határozni, hogy az (1) bekezdés első albekezdésének h) pontjában felsorolt célok közül melyek tekintetében, valamint az említett bekezdés h) pontjának iii. alpontjában említett bűncselekmények közül melyek tekintetében engedélyezhető az illetékes hatóságok számára az említett rendszerek bűnüldözési célú használata. A tagállamok az említett szabályokról legkésőbb azok elfogadása után 30 nappal értesítik a Bizottságot. A tagállamok az uniós joggal összhangban szigorúbb jogszabályokat is bevezethetnek a távoli biometrikus azonosító rendszerek használatára vonatkozóan.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '6',
  '(6) Azon tagállami nemzeti piacfelügyeleti hatóságok és nemzeti adatvédelmi hatóságok, amelyek a (4) bekezdésnek megfelelően értesítést kaptak a „valós idejű” távoli biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken, bűnüldözési célból történő használatáról, éves jelentéseket nyújtanak be a Bizottságnak az ilyen használatról. E célból a Bizottság sablont bocsát a tagállamok és a nemzeti piacfelügyeleti és adatvédelmi hatóságok rendelkezésére, amely tartalmazza az azon határozatok számára, valamint azok eredményére vonatkozó információkat, amelyeket – a (3) bekezdés szerinti, engedély iránti megkeresésre – az illetékes igazságügyi hatóságok vagy olyan független közigazgatási hatóság hozott, amelynek határozata kötelező erejű.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '7',
  '(7) A Bizottság a (6) bekezdésben említett éves jelentések nyomán a tagállamokban összesített adatok alapján éves jelentéseket tesz közzé a valós idejű távoli biometrikus azonosító rendszerek nyilvánosság számára hozzáférhető helyeken történő, bűnüldözési célú használatáról. Az említett éves jelentések nem tartalmazhatják a kapcsolódó bűnüldözési tevékenységek érzékeny operatív adatait.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '5',
  '8',
  '(8) Ez a cikk nem érinti az abban az esetben alkalmazandó tilalmakat, ha valamely MI-gyakorlat más uniós jogot sért.

III. FEJEZET

NAGY KOCKÁZATÚ MI-RENDSZEREK

1. SZAKASZ

MI-rendszerek nagy kockázatúként való besorolása',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_5'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  null,
  'A nagy kockázatú MI-rendszerekre vonatkozó besorolási szabályok
(1) Tekintet nélkül arra, hogy egy MI-rendszert az a) és b) pontban említett termékektől függetlenül hozzák-e forgalomba vagy helyezik-e üzembe, az említett MI-rendszer nagy kockázatúnak minősül, ha mindkét következő feltétel teljesül:

a)

az MI-rendszert az I. mellékletben felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termék biztonsági alkotórészeként kívánják használni, vagy az MI-rendszer önmagában ilyen termék;

b)

azon terméket, amelynek biztonsági alkatórésze az a) pont alapján az MI-rendszer, vagy magát az MI-rendszert mint terméket harmadik fél által végzett megfelelőségértékelésnek kell alávetni a terméknek az I. mellékletben felsorolt uniós harmonizációs jogszabályok értelmében való forgalomba hozatala vagy üzembe helyezése érdekében.

(2) Az (1) bekezdésben említett nagy kockázatú MI-rendszerek mellett a III. mellékletben említett MI-rendszereket nagy kockázatúnak kell tekinteni.

(3) A (2) bekezdéstől eltérve, valamely, a III. mellékletben hivatkozott MI-rendszer nem tekinthető nagy kockázatúnak, amennyiben nem jelent jelentős károkozó kockázatot természetes személyek egészségére, biztonságára vagy alapvető jogaira nézve, többek között azáltal, hogy nem befolyásolja lényegesen a döntéshozatal kimenetelét.

Az első albekezdés alkalmazandó, amennyiben a következő feltételek bármelyike teljesül:

a)

az MI-rendszer rendeltetése jól körülhatárolt eljárási feladat ellátása;

b)

az MI-rendszer rendeltetése egy korábban elvégzett emberi tevékenység eredményének a javítása;

c)

az MI-rendszer rendeltetése döntéshozatali minták vagy korábbi döntéshozatali mintáktól való eltérések észlelése, és nem célja a korábban elvégzett emberi értékelés megfelelő emberi felülvizsgálat nélküli kiváltása vagy befolyásolása; vagy

d)

az MI-rendszer rendeltetése egy, a III. mellékletben felsorolt felhasználási esetek céljainak szempontjából releváns értékeléshez kapcsolódó előkészítő feladat elvégzése.

Az első albekezdés ellenére egy, a III. mellékletben említett MI-rendszert mindig nagy kockázatúnak kell tekinteni, ha az MI-rendszer természetes személyekre vonatkozó profilalkotást végez.

(4) Azon szolgáltatónak, amely úgy ítéli meg, hogy valamely, a III. mellékletben említett MI-rendszer nem nagy kockázatú, az adott rendszer forgalomba hozatala vagy üzembe helyezése előtt dokumentálnia kell értékelését. Az ilyen szolgáltatóra a 49. cikk (2) bekezdésében meghatározott regisztrációs kötelezettség vonatkozik. Az illetékes nemzeti hatóságok kérésére a szolgáltatónak be kell nyújtania az értékelés dokumentációját.

(5) A Bizottság a Mesterséges Intelligenciával Foglalkozó Európai Testülettel (a továbbiakban: a Testület) folytatott konzultációt követően legkésőbb 2026. február 2-ig iránymutatásokat nyújt, amelyekben meghatározza e cikknek a 96. cikkel összhangban történő gyakorlati végrehajtását, valamint a nagy kockázatú és a nem nagy kockázatú MI-rendszerek felhasználási eseteire vonatkozó gyakorlati példák átfogó listáját.

(6) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el e cikk (3) bekezdése második albekezdésének módosítása céljából, új feltételekkel egészítve ki az ott megállapított feltételeket, vagy módosítva azokat, amennyiben konkrét és megbízható bizonyíték áll rendelkezésre a III. melléklet hatálya alá tartozó, de a természetes személyek egészségére, biztonságára vagy alapvető jogaira nézve károkozó kockázatot nem jelentő MI-rendszerek meglétére vonatkozóan.

(7) A Bizottság a 97. cikkel összhangban felhatalmazáson alapuló jogi aktusokat fogad el e cikk (3) bekezdése második albekezdésének módosítása céljából az ott meghatározott feltételek bármelyikének törlésével, amennyiben konkrét és megbízható bizonyítékok állnak rendelkezésre arra vonatkozóan, hogy ez szükséges az egészség, a biztonság és az alapvető jogok védelme e rendeletben előírt szintjének fenntartásához.

(8) A (3) bekezdés második albekezdésében meghatározott feltételek – e cikk (6) vagy (7) bekezdésével összhangban elfogadott – bármely módosítása nem csökkentheti az egészség, a biztonság és az alapvető jogok védelmének e rendelet által előírt általános szintjét, továbbá biztosítania kell a 7. cikk (1) bekezdése alapján elfogadott, felhatalmazáson alapuló jogi aktusokkal való összhangot, és figyelembe kell vennie a piaci és technológiai fejleményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '1',
  '(1) Tekintet nélkül arra, hogy egy MI-rendszert az a) és b) pontban említett termékektől függetlenül hozzák-e forgalomba vagy helyezik-e üzembe, az említett MI-rendszer nagy kockázatúnak minősül, ha mindkét következő feltétel teljesül:

a)

az MI-rendszert az I. mellékletben felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termék biztonsági alkotórészeként kívánják használni, vagy az MI-rendszer önmagában ilyen termék;

b)

azon terméket, amelynek biztonsági alkatórésze az a) pont alapján az MI-rendszer, vagy magát az MI-rendszert mint terméket harmadik fél által végzett megfelelőségértékelésnek kell alávetni a terméknek az I. mellékletben felsorolt uniós harmonizációs jogszabályok értelmében való forgalomba hozatala vagy üzembe helyezése érdekében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '1(a)',
  'a) az MI-rendszert az I. mellékletben felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termék biztonsági alkotórészeként kívánják használni, vagy az MI-rendszer önmagában ilyen termék;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '1(b)',
  'b) azon terméket, amelynek biztonsági alkatórésze az a) pont alapján az MI-rendszer, vagy magát az MI-rendszert mint terméket harmadik fél által végzett megfelelőségértékelésnek kell alávetni a terméknek az I. mellékletben felsorolt uniós harmonizációs jogszabályok értelmében való forgalomba hozatala vagy üzembe helyezése érdekében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '2',
  '(2) Az (1) bekezdésben említett nagy kockázatú MI-rendszerek mellett a III. mellékletben említett MI-rendszereket nagy kockázatúnak kell tekinteni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '3',
  '(3) A (2) bekezdéstől eltérve, valamely, a III. mellékletben hivatkozott MI-rendszer nem tekinthető nagy kockázatúnak, amennyiben nem jelent jelentős károkozó kockázatot természetes személyek egészségére, biztonságára vagy alapvető jogaira nézve, többek között azáltal, hogy nem befolyásolja lényegesen a döntéshozatal kimenetelét.

Az első albekezdés alkalmazandó, amennyiben a következő feltételek bármelyike teljesül:

a)

az MI-rendszer rendeltetése jól körülhatárolt eljárási feladat ellátása;

b)

az MI-rendszer rendeltetése egy korábban elvégzett emberi tevékenység eredményének a javítása;

c)

az MI-rendszer rendeltetése döntéshozatali minták vagy korábbi döntéshozatali mintáktól való eltérések észlelése, és nem célja a korábban elvégzett emberi értékelés megfelelő emberi felülvizsgálat nélküli kiváltása vagy befolyásolása; vagy

d)

az MI-rendszer rendeltetése egy, a III. mellékletben felsorolt felhasználási esetek céljainak szempontjából releváns értékeléshez kapcsolódó előkészítő feladat elvégzése.

Az első albekezdés ellenére egy, a III. mellékletben említett MI-rendszert mindig nagy kockázatúnak kell tekinteni, ha az MI-rendszer természetes személyekre vonatkozó profilalkotást végez.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '3(a)',
  'a) az MI-rendszer rendeltetése jól körülhatárolt eljárási feladat ellátása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '3(b)',
  'b) az MI-rendszer rendeltetése egy korábban elvégzett emberi tevékenység eredményének a javítása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '3(c)',
  'c) az MI-rendszer rendeltetése döntéshozatali minták vagy korábbi döntéshozatali mintáktól való eltérések észlelése, és nem célja a korábban elvégzett emberi értékelés megfelelő emberi felülvizsgálat nélküli kiváltása vagy befolyásolása; vagy',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '3(d)',
  'd) az MI-rendszer rendeltetése egy, a III. mellékletben felsorolt felhasználási esetek céljainak szempontjából releváns értékeléshez kapcsolódó előkészítő feladat elvégzése.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '4',
  '(4) Azon szolgáltatónak, amely úgy ítéli meg, hogy valamely, a III. mellékletben említett MI-rendszer nem nagy kockázatú, az adott rendszer forgalomba hozatala vagy üzembe helyezése előtt dokumentálnia kell értékelését. Az ilyen szolgáltatóra a 49. cikk (2) bekezdésében meghatározott regisztrációs kötelezettség vonatkozik. Az illetékes nemzeti hatóságok kérésére a szolgáltatónak be kell nyújtania az értékelés dokumentációját.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '5',
  '(5) A Bizottság a Mesterséges Intelligenciával Foglalkozó Európai Testülettel (a továbbiakban: a Testület) folytatott konzultációt követően legkésőbb 2026. február 2-ig iránymutatásokat nyújt, amelyekben meghatározza e cikknek a 96. cikkel összhangban történő gyakorlati végrehajtását, valamint a nagy kockázatú és a nem nagy kockázatú MI-rendszerek felhasználási eseteire vonatkozó gyakorlati példák átfogó listáját.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '6',
  '(6) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el e cikk (3) bekezdése második albekezdésének módosítása céljából, új feltételekkel egészítve ki az ott megállapított feltételeket, vagy módosítva azokat, amennyiben konkrét és megbízható bizonyíték áll rendelkezésre a III. melléklet hatálya alá tartozó, de a természetes személyek egészségére, biztonságára vagy alapvető jogaira nézve károkozó kockázatot nem jelentő MI-rendszerek meglétére vonatkozóan.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '7',
  '(7) A Bizottság a 97. cikkel összhangban felhatalmazáson alapuló jogi aktusokat fogad el e cikk (3) bekezdése második albekezdésének módosítása céljából az ott meghatározott feltételek bármelyikének törlésével, amennyiben konkrét és megbízható bizonyítékok állnak rendelkezésre arra vonatkozóan, hogy ez szükséges az egészség, a biztonság és az alapvető jogok védelme e rendeletben előírt szintjének fenntartásához.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '6',
  '8',
  '(8) A (3) bekezdés második albekezdésében meghatározott feltételek – e cikk (6) vagy (7) bekezdésével összhangban elfogadott – bármely módosítása nem csökkentheti az egészség, a biztonság és az alapvető jogok védelmének e rendelet által előírt általános szintjét, továbbá biztosítania kell a 7. cikk (1) bekezdése alapján elfogadott, felhatalmazáson alapuló jogi aktusokkal való összhangot, és figyelembe kell vennie a piaci és technológiai fejleményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_6'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  null,
  'A III. melléklet módosításai
(1) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el abból a célból, hogy módosítsa a III. mellékletet a nagy kockázatú MI-rendszerek felhasználási eseteinek hozzáadásával vagy módosításával, amennyiben mindkét következő feltétel teljesül:

a)

az MI-rendszereket a III. mellékletben felsorolt területek valamelyikén kívánják használni;

b)

az MI-rendszerek az egészségre és a biztonságra nézve károsodás, vagy az alapvető jogokra nézve kedvezőtlen hatás kockázatát jelentik, és az említett kockázat megegyezik a károsodás vagy a kedvezőtlen hatás azon kockázatával, amelyet a III. mellékletben már említett nagy kockázatú MI-rendszerek jelentenek, vagy annál nagyobb.

(2) Az (1) bekezdés b) pontja szerinti feltétel értékelésekor a Bizottság a következő kritériumokat veszi figyelembe:

a)

az MI-rendszer rendeltetése;

b)

azon mérték, amelyben az MI-rendszert használták vagy valószínűleg használják;

c)

az MI-rendszer által kezelt és felhasznált adatok jellege és mennyisége, különös tekintettel arra, hogy a személyes adatok különleges kategóriáit kezeli-e;

d)

az MI-rendszer autonóm cselekvésének mértéke és az emberi beavatkozás lehetősége potenciálisan kárt okozó döntés vagy ajánlások felülírása érdekében;

e)

az, hogy egy MI-rendszer használata milyen mértékben okozott már kárt az egészségben és a biztonságban, gyakorolt kedvezőtlen hatást alapvető jogokra, vagy adott okot jelentős aggodalomra az ilyen kár vagy kedvezőtlen hatás valószínűségével kapcsolatban, amint azt például az illetékes nemzeti hatóságokhoz benyújtott jelentések vagy dokumentált állítások, vagy adott esetben egyéb jelentések bizonyítják;

f)

az ilyen kár vagy kedvezőtlen hatás lehetséges mértéke, különösen annak intenzitása tekintetében és azt illetően, hogy érinthet-e több személyt vagy aránytalanul érintheti-e személyek egy adott csoportját;

g)

az, hogy a potenciálisan kárt szenvedő vagy kedvezőtlen hatásnak kitett személyek milyen mértékben függnek az MI-rendszerrel előállított kimenettől, különösen amiatt, hogy gyakorlati vagy jogi okokból észszerűen nem lehetséges a kimeneten kívül maradni;

h)

az, hogy az erőviszonyok milyen mértékben kiegyensúlyozatlanok, vagy a potenciálisan károsult vagy kedvezőtlen hatásnak kitett személyek milyen mértékben vannak kiszolgáltatott helyzetben az MI-rendszer alkalmazójával szemben, különösen a státusz, a hatalom, a tudás, a gazdasági vagy társadalmi körülmények vagy az életkor miatt;

i)

az, hogy az MI-rendszer használatával előállított kimenet mennyire könnyen korrigálható vagy visszafordítható – figyelembe véve a kimenet korrigálása vagy a visszafordítása céljából rendelkezésre álló műszaki megoldásokat –, ahol is az egészségre, a biztonságra vagy az alapvető jogokra kedvezőtlen hatást gyakorló kimenetek nem tekinthetők könnyen korrigálhatónak vagy visszafordíthatónak;

j)

az MI-rendszer bevezetéséből származó előnyök nagyságrendje és valószínűsége az egyének, csoportok vagy a társadalom egésze számára, beleértve a termékbiztonság lehetséges javulását;

k)

az, hogy a meglévő uniós jog milyen mértékben rendelkezik a következőkről:

i.

hatékony jogorvoslati intézkedések az MI-rendszerek jelentette kockázatokkal kapcsolatban, a kártérítési keresetek kizárásával;

ii.

hatékony intézkedések az említett kockázatok megelőzésére vagy jelentős minimalizálására.

(3) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el abból a célból, hogy a III. mellékletben szereplő jegyzéket nagy kockázatú MI-rendszerek törlésével módosítsa, amennyiben mindkét következő feltétel teljesül:

a)

az érintett nagy kockázatú MI-rendszer már nem jelent jelentős kockázatot az alapvető jogokra, az egészségre vagy a biztonságra nézve, figyelembe véve a (2) bekezdésben felsorolt kritériumokat;

b)

a törlés nem csökkenti az egészség, a biztonság és az alapvető jogok uniós jog szerinti védelmének általános szintjét.

2. SZAKASZ

A nagy kockázatú MI-rendszerekre vonatkozó követelmények',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '1',
  '(1) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el abból a célból, hogy módosítsa a III. mellékletet a nagy kockázatú MI-rendszerek felhasználási eseteinek hozzáadásával vagy módosításával, amennyiben mindkét következő feltétel teljesül:

a)

az MI-rendszereket a III. mellékletben felsorolt területek valamelyikén kívánják használni;

b)

az MI-rendszerek az egészségre és a biztonságra nézve károsodás, vagy az alapvető jogokra nézve kedvezőtlen hatás kockázatát jelentik, és az említett kockázat megegyezik a károsodás vagy a kedvezőtlen hatás azon kockázatával, amelyet a III. mellékletben már említett nagy kockázatú MI-rendszerek jelentenek, vagy annál nagyobb.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '1(a)',
  'a) az MI-rendszereket a III. mellékletben felsorolt területek valamelyikén kívánják használni;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '1(b)',
  'b) az MI-rendszerek az egészségre és a biztonságra nézve károsodás, vagy az alapvető jogokra nézve kedvezőtlen hatás kockázatát jelentik, és az említett kockázat megegyezik a károsodás vagy a kedvezőtlen hatás azon kockázatával, amelyet a III. mellékletben már említett nagy kockázatú MI-rendszerek jelentenek, vagy annál nagyobb.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '2',
  '(2) Az (1) bekezdés b) pontja szerinti feltétel értékelésekor a Bizottság a következő kritériumokat veszi figyelembe:

a)

az MI-rendszer rendeltetése;

b)

azon mérték, amelyben az MI-rendszert használták vagy valószínűleg használják;

c)

az MI-rendszer által kezelt és felhasznált adatok jellege és mennyisége, különös tekintettel arra, hogy a személyes adatok különleges kategóriáit kezeli-e;

d)

az MI-rendszer autonóm cselekvésének mértéke és az emberi beavatkozás lehetősége potenciálisan kárt okozó döntés vagy ajánlások felülírása érdekében;

e)

az, hogy egy MI-rendszer használata milyen mértékben okozott már kárt az egészségben és a biztonságban, gyakorolt kedvezőtlen hatást alapvető jogokra, vagy adott okot jelentős aggodalomra az ilyen kár vagy kedvezőtlen hatás valószínűségével kapcsolatban, amint azt például az illetékes nemzeti hatóságokhoz benyújtott jelentések vagy dokumentált állítások, vagy adott esetben egyéb jelentések bizonyítják;

f)

az ilyen kár vagy kedvezőtlen hatás lehetséges mértéke, különösen annak intenzitása tekintetében és azt illetően, hogy érinthet-e több személyt vagy aránytalanul érintheti-e személyek egy adott csoportját;

g)

az, hogy a potenciálisan kárt szenvedő vagy kedvezőtlen hatásnak kitett személyek milyen mértékben függnek az MI-rendszerrel előállított kimenettől, különösen amiatt, hogy gyakorlati vagy jogi okokból észszerűen nem lehetséges a kimeneten kívül maradni;

h)

az, hogy az erőviszonyok milyen mértékben kiegyensúlyozatlanok, vagy a potenciálisan károsult vagy kedvezőtlen hatásnak kitett személyek milyen mértékben vannak kiszolgáltatott helyzetben az MI-rendszer alkalmazójával szemben, különösen a státusz, a hatalom, a tudás, a gazdasági vagy társadalmi körülmények vagy az életkor miatt;

i)

az, hogy az MI-rendszer használatával előállított kimenet mennyire könnyen korrigálható vagy visszafordítható – figyelembe véve a kimenet korrigálása vagy a visszafordítása céljából rendelkezésre álló műszaki megoldásokat –, ahol is az egészségre, a biztonságra vagy az alapvető jogokra kedvezőtlen hatást gyakorló kimenetek nem tekinthetők könnyen korrigálhatónak vagy visszafordíthatónak;

j)

az MI-rendszer bevezetéséből származó előnyök nagyságrendje és valószínűsége az egyének, csoportok vagy a társadalom egésze számára, beleértve a termékbiztonság lehetséges javulását;

k)

az, hogy a meglévő uniós jog milyen mértékben rendelkezik a következőkről:

i.

hatékony jogorvoslati intézkedések az MI-rendszerek jelentette kockázatokkal kapcsolatban, a kártérítési keresetek kizárásával;

ii.

hatékony intézkedések az említett kockázatok megelőzésére vagy jelentős minimalizálására.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '2(a)',
  'a) az MI-rendszer rendeltetése;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '2(b)',
  'b) azon mérték, amelyben az MI-rendszert használták vagy valószínűleg használják;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '2(c)',
  'c) az MI-rendszer által kezelt és felhasznált adatok jellege és mennyisége, különös tekintettel arra, hogy a személyes adatok különleges kategóriáit kezeli-e;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '2(d)',
  'd) az MI-rendszer autonóm cselekvésének mértéke és az emberi beavatkozás lehetősége potenciálisan kárt okozó döntés vagy ajánlások felülírása érdekében;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '2(e)',
  'e) az, hogy egy MI-rendszer használata milyen mértékben okozott már kárt az egészségben és a biztonságban, gyakorolt kedvezőtlen hatást alapvető jogokra, vagy adott okot jelentős aggodalomra az ilyen kár vagy kedvezőtlen hatás valószínűségével kapcsolatban, amint azt például az illetékes nemzeti hatóságokhoz benyújtott jelentések vagy dokumentált állítások, vagy adott esetben egyéb jelentések bizonyítják;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '2(f)',
  'f) az ilyen kár vagy kedvezőtlen hatás lehetséges mértéke, különösen annak intenzitása tekintetében és azt illetően, hogy érinthet-e több személyt vagy aránytalanul érintheti-e személyek egy adott csoportját;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '2(g)',
  'g) az, hogy a potenciálisan kárt szenvedő vagy kedvezőtlen hatásnak kitett személyek milyen mértékben függnek az MI-rendszerrel előállított kimenettől, különösen amiatt, hogy gyakorlati vagy jogi okokból észszerűen nem lehetséges a kimeneten kívül maradni;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '2(h)',
  'h) az, hogy az erőviszonyok milyen mértékben kiegyensúlyozatlanok, vagy a potenciálisan károsult vagy kedvezőtlen hatásnak kitett személyek milyen mértékben vannak kiszolgáltatott helyzetben az MI-rendszer alkalmazójával szemben, különösen a státusz, a hatalom, a tudás, a gazdasági vagy társadalmi körülmények vagy az életkor miatt;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '2(i)',
  'i) az, hogy az MI-rendszer használatával előállított kimenet mennyire könnyen korrigálható vagy visszafordítható – figyelembe véve a kimenet korrigálása vagy a visszafordítása céljából rendelkezésre álló műszaki megoldásokat –, ahol is az egészségre, a biztonságra vagy az alapvető jogokra kedvezőtlen hatást gyakorló kimenetek nem tekinthetők könnyen korrigálhatónak vagy visszafordíthatónak;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '2(j)',
  'j) az MI-rendszer bevezetéséből származó előnyök nagyságrendje és valószínűsége az egyének, csoportok vagy a társadalom egésze számára, beleértve a termékbiztonság lehetséges javulását;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '2(k)',
  'k) az, hogy a meglévő uniós jog milyen mértékben rendelkezik a következőkről:

i.

hatékony jogorvoslati intézkedések az MI-rendszerek jelentette kockázatokkal kapcsolatban, a kártérítési keresetek kizárásával;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '3',
  '(3) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el abból a célból, hogy a III. mellékletben szereplő jegyzéket nagy kockázatú MI-rendszerek törlésével módosítsa, amennyiben mindkét következő feltétel teljesül:

a)

az érintett nagy kockázatú MI-rendszer már nem jelent jelentős kockázatot az alapvető jogokra, az egészségre vagy a biztonságra nézve, figyelembe véve a (2) bekezdésben felsorolt kritériumokat;

b)

a törlés nem csökkenti az egészség, a biztonság és az alapvető jogok uniós jog szerinti védelmének általános szintjét.

2. SZAKASZ

A nagy kockázatú MI-rendszerekre vonatkozó követelmények',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '3(a)',
  'a) az érintett nagy kockázatú MI-rendszer már nem jelent jelentős kockázatot az alapvető jogokra, az egészségre vagy a biztonságra nézve, figyelembe véve a (2) bekezdésben felsorolt kritériumokat;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '7',
  '3(b)',
  'b) a törlés nem csökkenti az egészség, a biztonság és az alapvető jogok uniós jog szerinti védelmének általános szintjét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_7'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '8',
  null,
  'A követelményeknek való megfelelés
(1) A nagy kockázatú MI-rendszereknek meg kell felelniük az e szakaszban meghatározott követelményeknek, figyelembe véve a rendeltetésüket, valamint az MI-vel és az MI-vonatkozású technológiákkal kapcsolatos technika általánosan elfogadott, mindenkori állását. Az említett követelményeknek való megfelelés biztosítása során figyelembe kell venni a 9. cikkben említett kockázatkezelési rendszert.

(2) Amennyiben egy termék olyan MI-rendszert tartalmaz, amelyre e rendelet követelményei, valamint az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok követelményei alkalmazandók, a szolgáltatók felelősek annak biztosításáért, hogy termékük teljes mértékben megfeleljen az alkalmazandó uniós harmonizációs jogszabályok szerinti valamennyi alkalmazandó követelménynek. Annak biztosítása érdekében, hogy az (1) bekezdésben említett nagy kockázatú MI-rendszerek megfeleljenek az e szakaszban meghatározott követelményeknek, valamint a következetesség biztosítása, az átfedések elkerülése és a további terhek minimalizálása érdekében a szolgáltatók dönthetnek úgy, hogy adott esetben a termékükkel kapcsolatban általuk rendelkezésre bocsátott szükséges tesztelési és jelentéstételi folyamatokat, információkat és dokumentációt integrálják a már meglévő, az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok által előírt dokumentációba és eljárásokba.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_8'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '8',
  '1',
  '(1) A nagy kockázatú MI-rendszereknek meg kell felelniük az e szakaszban meghatározott követelményeknek, figyelembe véve a rendeltetésüket, valamint az MI-vel és az MI-vonatkozású technológiákkal kapcsolatos technika általánosan elfogadott, mindenkori állását. Az említett követelményeknek való megfelelés biztosítása során figyelembe kell venni a 9. cikkben említett kockázatkezelési rendszert.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_8'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '8',
  '2',
  '(2) Amennyiben egy termék olyan MI-rendszert tartalmaz, amelyre e rendelet követelményei, valamint az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok követelményei alkalmazandók, a szolgáltatók felelősek annak biztosításáért, hogy termékük teljes mértékben megfeleljen az alkalmazandó uniós harmonizációs jogszabályok szerinti valamennyi alkalmazandó követelménynek. Annak biztosítása érdekében, hogy az (1) bekezdésben említett nagy kockázatú MI-rendszerek megfeleljenek az e szakaszban meghatározott követelményeknek, valamint a következetesség biztosítása, az átfedések elkerülése és a további terhek minimalizálása érdekében a szolgáltatók dönthetnek úgy, hogy adott esetben a termékükkel kapcsolatban általuk rendelkezésre bocsátott szükséges tesztelési és jelentéstételi folyamatokat, információkat és dokumentációt integrálják a már meglévő, az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok által előírt dokumentációba és eljárásokba.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_8'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  null,
  'Kockázatkezelési rendszer
(1) A nagy kockázatú MI-rendszerek tekintetében kockázatkezelési rendszert kell létrehozni, bevezetni, dokumentálni és fenntartani.

(2) A kockázatkezelési rendszer alatt olyan megszakítás nélkül végzett iteratív folyamatot kell érteni, amelyet a nagy kockázatú MI-rendszer egész életciklusára terveztek és működtetnek, és amely rendszeres és szisztematikus felülvizsgálatot és aktualizálást igényel. A folyamatnak a következő lépéseket kell tartalmaznia:

a)

azon ismert, valamint észszerűen előre látható kockázatok azonosítása és elemzése, amelyeket a nagy kockázatú MI-rendszer rendeltetésszerű használata esetén az egészségre, a biztonságra és az alapvető jogokra jelenthet;

b)

a nagy kockázatú MI-rendszer rendeltetésszerű használata, valamint észszerűen előre látható rendellenes használata esetén felmerülő kockázatok becslése és értékelése;

c)

egyéb esetlegesen felmerülő kockázatok értékelése a 72. cikkben említett forgalomba hozatal utáni nyomonkövetési rendszerből gyűjtött adatok elemzése alapján;

d)

az a) pont alapján azonosított kockázatok kezelésére irányuló megfelelő és célzott kockázatkezelési intézkedések elfogadása.

(3) Az e cikkben említett kockázatok alatt csak azok értendők, amelyek a nagy kockázatú MI-rendszer fejlesztése vagy tervezése, vagy a megfelelő műszaki információk biztosítása révén észszerűen enyhíthetők vagy kiküszöbölhetők.

(4) A (2) bekezdés d) pontjában említett kockázatkezelési intézkedések tekintetében kellően figyelembe kell venni az e szakaszban meghatározott követelmények együttes alkalmazásából eredő hatásokat és lehetséges kölcsönhatást a kockázatok hatékonyabb minimalizálása érdekében, egyúttal megfelelő egyensúlyt elérve az említett követelmények teljesítését célzó intézkedések végrehajtása során.

(5) A (2) bekezdés d) pontjában említett kockázatkezelési intézkedéseket úgy kell kialakítani, hogy az egyes veszélyekhez kapcsolódó releváns fennmaradó kockázatot, valamint a nagy kockázatú MI-rendszerek teljes fennmaradó kockázatát elfogadhatónak ítéljék.

A legmegfelelőbb kockázatkezelési intézkedések meghatározásakor a következőket kell biztosítani:

a)

a (2) bekezdés alapján azonosított és értékelt kockázatok megszüntetése vagy csökkentése – amennyiben műszakilag megvalósítható – a nagy kockázatú MI-rendszer megfelelő tervezése és fejlesztése révén;

b)

adott esetben a nem megszüntethető kockázatok kezelésére szolgáló kockázatcsökkentő és ellenőrző intézkedések végrehajtása;

c)

a 13. cikk alapján előírt tájékoztatás, valamint adott esetben képzés nyújtása az alkalmazók számára.

A nagy kockázatú MI-rendszer használatával kapcsolatos kockázatok megszüntetése vagy csökkentése céljából kellő figyelmet kell fordítani az alkalmazó által elvárt műszaki ismeretekre, tapasztalatokra, oktatásra és képzésre, valamint azon körülményekre, amelyek között a rendszert feltételezhetően használni kívánják.

(6) A nagy kockázatú MI-rendszereket tesztelni kell a legmegfelelőbb és célzott kockázatkezelési intézkedések azonosítása céljából. A tesztelés biztosítja, hogy a nagy kockázatú MI-rendszerek következetesen működjenek a rendeltetésüknek megfelelően, és megfeleljenek az e szakaszban meghatározott követelményeknek.

(7) A tesztelési eljárások a 60. cikkel összhangban valós körülmények közötti tesztelést is magukban foglalhatnak.

(8) A nagy kockázatú MI-rendszerek tesztelését adott esetben a fejlesztési folyamat során bármikor, de mindenképpen a forgalomba hozatalt vagy az üzembe helyezést megelőzően kell elvégezni. A tesztelést a nagy kockázatú MI-rendszer rendeltetése szempontjából megfelelő, előzetesen meghatározott mérőszámok és valószínűségi küszöbértékek alapján kell elvégezni.

(9) Az (1)–(7) bekezdésben meghatározott kockázatkezelési rendszer végrehajtása során a szolgáltatóknak megfontolás tárgyává kell tenniük azt, hogy a nagy kockázatú MI-rendszer – a rendeltetése szempontjából – valószínűleg kedvezőtlen hatást gyakorol-e a 18 év alatti személyekre és adott esetben más kiszolgáltatott csoportokra.

(10) A nagy kockázatú MI-rendszerek azon szolgáltatói esetében, amelyek az uniós jog egyéb vonatkozó rendelkezéseinek értelmében belső kockázatkezelési folyamatokra vonatkozó követelmények hatálya alá tartoznak, az (1)–(9) bekezdésben leírt szempontok az említett jog alapján létrehozott kockázatkezelési eljárások részét képezhetik vagy azokhoz társulhatnak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '1',
  '(1) A nagy kockázatú MI-rendszerek tekintetében kockázatkezelési rendszert kell létrehozni, bevezetni, dokumentálni és fenntartani.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '2',
  '(2) A kockázatkezelési rendszer alatt olyan megszakítás nélkül végzett iteratív folyamatot kell érteni, amelyet a nagy kockázatú MI-rendszer egész életciklusára terveztek és működtetnek, és amely rendszeres és szisztematikus felülvizsgálatot és aktualizálást igényel. A folyamatnak a következő lépéseket kell tartalmaznia:

a)

azon ismert, valamint észszerűen előre látható kockázatok azonosítása és elemzése, amelyeket a nagy kockázatú MI-rendszer rendeltetésszerű használata esetén az egészségre, a biztonságra és az alapvető jogokra jelenthet;

b)

a nagy kockázatú MI-rendszer rendeltetésszerű használata, valamint észszerűen előre látható rendellenes használata esetén felmerülő kockázatok becslése és értékelése;

c)

egyéb esetlegesen felmerülő kockázatok értékelése a 72. cikkben említett forgalomba hozatal utáni nyomonkövetési rendszerből gyűjtött adatok elemzése alapján;

d)

az a) pont alapján azonosított kockázatok kezelésére irányuló megfelelő és célzott kockázatkezelési intézkedések elfogadása.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '2(a)',
  'a) azon ismert, valamint észszerűen előre látható kockázatok azonosítása és elemzése, amelyeket a nagy kockázatú MI-rendszer rendeltetésszerű használata esetén az egészségre, a biztonságra és az alapvető jogokra jelenthet;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '2(b)',
  'b) a nagy kockázatú MI-rendszer rendeltetésszerű használata, valamint észszerűen előre látható rendellenes használata esetén felmerülő kockázatok becslése és értékelése;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '2(c)',
  'c) egyéb esetlegesen felmerülő kockázatok értékelése a 72. cikkben említett forgalomba hozatal utáni nyomonkövetési rendszerből gyűjtött adatok elemzése alapján;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '2(d)',
  'd) az a) pont alapján azonosított kockázatok kezelésére irányuló megfelelő és célzott kockázatkezelési intézkedések elfogadása.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '3',
  '(3) Az e cikkben említett kockázatok alatt csak azok értendők, amelyek a nagy kockázatú MI-rendszer fejlesztése vagy tervezése, vagy a megfelelő műszaki információk biztosítása révén észszerűen enyhíthetők vagy kiküszöbölhetők.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '4',
  '(4) A (2) bekezdés d) pontjában említett kockázatkezelési intézkedések tekintetében kellően figyelembe kell venni az e szakaszban meghatározott követelmények együttes alkalmazásából eredő hatásokat és lehetséges kölcsönhatást a kockázatok hatékonyabb minimalizálása érdekében, egyúttal megfelelő egyensúlyt elérve az említett követelmények teljesítését célzó intézkedések végrehajtása során.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '5',
  '(5) A (2) bekezdés d) pontjában említett kockázatkezelési intézkedéseket úgy kell kialakítani, hogy az egyes veszélyekhez kapcsolódó releváns fennmaradó kockázatot, valamint a nagy kockázatú MI-rendszerek teljes fennmaradó kockázatát elfogadhatónak ítéljék.

A legmegfelelőbb kockázatkezelési intézkedések meghatározásakor a következőket kell biztosítani:

a)

a (2) bekezdés alapján azonosított és értékelt kockázatok megszüntetése vagy csökkentése – amennyiben műszakilag megvalósítható – a nagy kockázatú MI-rendszer megfelelő tervezése és fejlesztése révén;

b)

adott esetben a nem megszüntethető kockázatok kezelésére szolgáló kockázatcsökkentő és ellenőrző intézkedések végrehajtása;

c)

a 13. cikk alapján előírt tájékoztatás, valamint adott esetben képzés nyújtása az alkalmazók számára.

A nagy kockázatú MI-rendszer használatával kapcsolatos kockázatok megszüntetése vagy csökkentése céljából kellő figyelmet kell fordítani az alkalmazó által elvárt műszaki ismeretekre, tapasztalatokra, oktatásra és képzésre, valamint azon körülményekre, amelyek között a rendszert feltételezhetően használni kívánják.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '5(a)',
  'a) a (2) bekezdés alapján azonosított és értékelt kockázatok megszüntetése vagy csökkentése – amennyiben műszakilag megvalósítható – a nagy kockázatú MI-rendszer megfelelő tervezése és fejlesztése révén;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '5(b)',
  'b) adott esetben a nem megszüntethető kockázatok kezelésére szolgáló kockázatcsökkentő és ellenőrző intézkedések végrehajtása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '5(c)',
  'c) a 13. cikk alapján előírt tájékoztatás, valamint adott esetben képzés nyújtása az alkalmazók számára.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '6',
  '(6) A nagy kockázatú MI-rendszereket tesztelni kell a legmegfelelőbb és célzott kockázatkezelési intézkedések azonosítása céljából. A tesztelés biztosítja, hogy a nagy kockázatú MI-rendszerek következetesen működjenek a rendeltetésüknek megfelelően, és megfeleljenek az e szakaszban meghatározott követelményeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '7',
  '(7) A tesztelési eljárások a 60. cikkel összhangban valós körülmények közötti tesztelést is magukban foglalhatnak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '8',
  '(8) A nagy kockázatú MI-rendszerek tesztelését adott esetben a fejlesztési folyamat során bármikor, de mindenképpen a forgalomba hozatalt vagy az üzembe helyezést megelőzően kell elvégezni. A tesztelést a nagy kockázatú MI-rendszer rendeltetése szempontjából megfelelő, előzetesen meghatározott mérőszámok és valószínűségi küszöbértékek alapján kell elvégezni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '9',
  '(9) Az (1)–(7) bekezdésben meghatározott kockázatkezelési rendszer végrehajtása során a szolgáltatóknak megfontolás tárgyává kell tenniük azt, hogy a nagy kockázatú MI-rendszer – a rendeltetése szempontjából – valószínűleg kedvezőtlen hatást gyakorol-e a 18 év alatti személyekre és adott esetben más kiszolgáltatott csoportokra.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '9',
  '10',
  '(10) A nagy kockázatú MI-rendszerek azon szolgáltatói esetében, amelyek az uniós jog egyéb vonatkozó rendelkezéseinek értelmében belső kockázatkezelési folyamatokra vonatkozó követelmények hatálya alá tartoznak, az (1)–(9) bekezdésben leírt szempontok az említett jog alapján létrehozott kockázatkezelési eljárások részét képezhetik vagy azokhoz társulhatnak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_9'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  null,
  'Adatok és adatkormányzás
(1) A modellek adatokkal való tanítását magukban foglaló technikákat használó nagy kockázatú MI-rendszereket olyan tanító-, validálási és tesztadatkészletek alapján kell fejleszteni, amelyek – az ilyen adatkészletek használatakor – megfelelnek a (2)–(5) bekezdésben említett minőségi kritériumoknak.

(2) A tanító-, a validálási és a tesztadatkészleteket a nagy kockázatú MI-rendszer rendeltetésének megfelelő adatkormányzási és adatgazdálkodási gyakorlatoknak kell alávetni. Ezek a gyakorlatok különösen a következőket érintik:

a)

a vonatkozó tervezési döntések;

b)

az adatgyűjtési eljárások és az adatok eredete, valamint személyes adatok esetében az adatgyűjtés eredeti célja;

c)

a releváns adatelőkészítési műveletek, mint például annotálás, címkézés, tisztítás, frissítés, gazdagítás és összesítés;

d)

feltételezések megfogalmazása, különös tekintettel azon információkra, amelyeket az adatoknak az elvárás szerint mérniük kell és meg kell jeleníteniük;

e)

a szükséges adatkészletek rendelkezésre állásának, mennyiségének és alkalmasságának értékelése;

f)

az esetleges olyan torzítások vizsgálata, amelyek valószínűleg hatnak a személyek egészségére és biztonságára, negatív hatást gyakorolnak az alapvető jogokra, vagy az uniós jog által tiltott megkülönböztetéshez vezetnek, különösen akkor, ha az adatok kimenetei befolyásolják a jövőbeli műveletek bemeneteit;

g)

az f) ponttal összhangban azonosított esetleges torzítások felderítését, megelőzését és enyhítését célzó megfelelő intézkedések;

h)

az e rendeletnek való megfelelést akadályozó releváns adathiányok vagy hiányosságok azonosítása, valamint e hiányok és hiányosságok kezelésének módja.

(3) A tanító-, a validálási és a tesztadatkészleteknek relevánsnak, kellően reprezentatívnak, valamint – a rendeltetés szempontjából – a lehető legnagyobb mértékben hibáktól mentesnek és teljesnek kell lenniük. Rendelkezniük kell a megfelelő statisztikai tulajdonságokkal is, többek között adott esetben azon személyek vagy személyek csoportjai tekintetében, akikkel vagy amelyekkel kapcsolatosan a nagy kockázatú MI-rendszert használni kívánják. Az említett adatkészletek e jellemzői teljesíthetők az egyes adatkészletek szintjén vagy azok kombinációjának a szintjén.

(4) Az adatkészleteknek – a rendeltetéstől függően szükséges mértékben – figyelembe kell venniük azon jellemzőket vagy elemeket, amelyek azon sajátos földrajzi, kontextuális, magatartási vagy funkcionális környezethez kapcsolódnak, amelyben a nagy kockázatú MI-rendszert használni kívánják.

(5) A nagy kockázatú MI-rendszerekkel kapcsolatos torzítás észlelésének és korrekciójának biztosításához feltétlenül szükséges mértékben – e cikk (2) bekezdésének f) és g) pontjával összhangban – az ilyen rendszerek szolgáltatói kivételesen kezelhetik a személyes adatok különleges kategóriáit, figyelemmel a természetes személyek alapvető jogaira és szabadságaira vonatkozó megfelelő biztosítékokra. Ahhoz, hogy az ilyen feldolgozás megtörténhessen, az (EU) 2016/679 és az (EU) 2018/1725 rendeletben, valamint az (EU) 2016/680 irányelvben meghatározott rendelkezéseken túlmenően, a következő feltételek mindegyikének teljesülnie kell:

a)

a torzítás észlelése és korrekciója más adatok – köztük szintetikus vagy anonimizált adatok – feldolgozásával nem valósítható meg hatékonyan;

b)

a személyes adatok különleges kategóriái a személyes adatok további felhasználására vonatkozó technikai korlátozások, valamint a legkorszerűbb biztonsági és magánéletvédelmi intézkedések – köztük az álnevesítés – hatálya alá tartoznak;

c)

a személyes adatok különleges kategóriái olyan intézkedések hatálya alá tartoznak, amelyek célja annak biztosítása, hogy a feldolgozott személyes adatok biztonságosak és védettek legyenek, megfelelő biztosítékok hatálya alá tartozzanak – ideértve a szigorú ellenőrzést és a hozzáférés dokumentálását –, valamint a rendellenes használat elkerülése és annak garantálása, hogy az említett személyes adatokhoz csak felhatalmazott és megfelelő titoktartási kötelezettségek alá tartozó személyek férjenek hozzá;

d)

a különleges kategóriájú személyes adatok nem továbbíthatók, nem ruházhatók át, és nem tehetők harmadik felek által egyéb módon hozzáférhetővé;

e)

a különleges kategóriájú személyes adatok törlésre kerülnek, amint a torzítást korrigálták, vagy a személyes adatok megőrzési időszaka lejárt, attól függően, hogy melyik következik be előbb;

f)

az adatkezelési tevékenységeknek az (EU) 2016/679 és az (EU) 2018/1725 rendelet, valamint az (EU) 2016/680 irányelv szerinti nyilvántartásai tartalmazzák annak magyarázatát, hogy a személyes adatok különleges kategóriáinak kezelése miért volt feltétlenül szükséges a torzítások felderítéséhez és korrekciójához, és hogy ez a cél miért nem volt elérhető más adatok kezelésével.

(6) Az MI-modellek tanítását magukban foglaló technikákat nem alkalmazó nagy kockázatú MI-rendszerek fejlesztése esetében a (2)–(5) bekezdés csak a tesztadatkészletekre alkalmazandó.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '1',
  '(1) A modellek adatokkal való tanítását magukban foglaló technikákat használó nagy kockázatú MI-rendszereket olyan tanító-, validálási és tesztadatkészletek alapján kell fejleszteni, amelyek – az ilyen adatkészletek használatakor – megfelelnek a (2)–(5) bekezdésben említett minőségi kritériumoknak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '2',
  '(2) A tanító-, a validálási és a tesztadatkészleteket a nagy kockázatú MI-rendszer rendeltetésének megfelelő adatkormányzási és adatgazdálkodási gyakorlatoknak kell alávetni. Ezek a gyakorlatok különösen a következőket érintik:

a)

a vonatkozó tervezési döntések;

b)

az adatgyűjtési eljárások és az adatok eredete, valamint személyes adatok esetében az adatgyűjtés eredeti célja;

c)

a releváns adatelőkészítési műveletek, mint például annotálás, címkézés, tisztítás, frissítés, gazdagítás és összesítés;

d)

feltételezések megfogalmazása, különös tekintettel azon információkra, amelyeket az adatoknak az elvárás szerint mérniük kell és meg kell jeleníteniük;

e)

a szükséges adatkészletek rendelkezésre állásának, mennyiségének és alkalmasságának értékelése;

f)

az esetleges olyan torzítások vizsgálata, amelyek valószínűleg hatnak a személyek egészségére és biztonságára, negatív hatást gyakorolnak az alapvető jogokra, vagy az uniós jog által tiltott megkülönböztetéshez vezetnek, különösen akkor, ha az adatok kimenetei befolyásolják a jövőbeli műveletek bemeneteit;

g)

az f) ponttal összhangban azonosított esetleges torzítások felderítését, megelőzését és enyhítését célzó megfelelő intézkedések;

h)

az e rendeletnek való megfelelést akadályozó releváns adathiányok vagy hiányosságok azonosítása, valamint e hiányok és hiányosságok kezelésének módja.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '2(a)',
  'a) a vonatkozó tervezési döntések;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '2(b)',
  'b) az adatgyűjtési eljárások és az adatok eredete, valamint személyes adatok esetében az adatgyűjtés eredeti célja;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '2(c)',
  'c) a releváns adatelőkészítési műveletek, mint például annotálás, címkézés, tisztítás, frissítés, gazdagítás és összesítés;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '2(d)',
  'd) feltételezések megfogalmazása, különös tekintettel azon információkra, amelyeket az adatoknak az elvárás szerint mérniük kell és meg kell jeleníteniük;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '2(e)',
  'e) a szükséges adatkészletek rendelkezésre állásának, mennyiségének és alkalmasságának értékelése;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '2(f)',
  'f) az esetleges olyan torzítások vizsgálata, amelyek valószínűleg hatnak a személyek egészségére és biztonságára, negatív hatást gyakorolnak az alapvető jogokra, vagy az uniós jog által tiltott megkülönböztetéshez vezetnek, különösen akkor, ha az adatok kimenetei befolyásolják a jövőbeli műveletek bemeneteit;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '2(g)',
  'g) az f) ponttal összhangban azonosított esetleges torzítások felderítését, megelőzését és enyhítését célzó megfelelő intézkedések;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '2(h)',
  'h) az e rendeletnek való megfelelést akadályozó releváns adathiányok vagy hiányosságok azonosítása, valamint e hiányok és hiányosságok kezelésének módja.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '3',
  '(3) A tanító-, a validálási és a tesztadatkészleteknek relevánsnak, kellően reprezentatívnak, valamint – a rendeltetés szempontjából – a lehető legnagyobb mértékben hibáktól mentesnek és teljesnek kell lenniük. Rendelkezniük kell a megfelelő statisztikai tulajdonságokkal is, többek között adott esetben azon személyek vagy személyek csoportjai tekintetében, akikkel vagy amelyekkel kapcsolatosan a nagy kockázatú MI-rendszert használni kívánják. Az említett adatkészletek e jellemzői teljesíthetők az egyes adatkészletek szintjén vagy azok kombinációjának a szintjén.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '4',
  '(4) Az adatkészleteknek – a rendeltetéstől függően szükséges mértékben – figyelembe kell venniük azon jellemzőket vagy elemeket, amelyek azon sajátos földrajzi, kontextuális, magatartási vagy funkcionális környezethez kapcsolódnak, amelyben a nagy kockázatú MI-rendszert használni kívánják.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '5',
  '(5) A nagy kockázatú MI-rendszerekkel kapcsolatos torzítás észlelésének és korrekciójának biztosításához feltétlenül szükséges mértékben – e cikk (2) bekezdésének f) és g) pontjával összhangban – az ilyen rendszerek szolgáltatói kivételesen kezelhetik a személyes adatok különleges kategóriáit, figyelemmel a természetes személyek alapvető jogaira és szabadságaira vonatkozó megfelelő biztosítékokra. Ahhoz, hogy az ilyen feldolgozás megtörténhessen, az (EU) 2016/679 és az (EU) 2018/1725 rendeletben, valamint az (EU) 2016/680 irányelvben meghatározott rendelkezéseken túlmenően, a következő feltételek mindegyikének teljesülnie kell:

a)

a torzítás észlelése és korrekciója más adatok – köztük szintetikus vagy anonimizált adatok – feldolgozásával nem valósítható meg hatékonyan;

b)

a személyes adatok különleges kategóriái a személyes adatok további felhasználására vonatkozó technikai korlátozások, valamint a legkorszerűbb biztonsági és magánéletvédelmi intézkedések – köztük az álnevesítés – hatálya alá tartoznak;

c)

a személyes adatok különleges kategóriái olyan intézkedések hatálya alá tartoznak, amelyek célja annak biztosítása, hogy a feldolgozott személyes adatok biztonságosak és védettek legyenek, megfelelő biztosítékok hatálya alá tartozzanak – ideértve a szigorú ellenőrzést és a hozzáférés dokumentálását –, valamint a rendellenes használat elkerülése és annak garantálása, hogy az említett személyes adatokhoz csak felhatalmazott és megfelelő titoktartási kötelezettségek alá tartozó személyek férjenek hozzá;

d)

a különleges kategóriájú személyes adatok nem továbbíthatók, nem ruházhatók át, és nem tehetők harmadik felek által egyéb módon hozzáférhetővé;

e)

a különleges kategóriájú személyes adatok törlésre kerülnek, amint a torzítást korrigálták, vagy a személyes adatok megőrzési időszaka lejárt, attól függően, hogy melyik következik be előbb;

f)

az adatkezelési tevékenységeknek az (EU) 2016/679 és az (EU) 2018/1725 rendelet, valamint az (EU) 2016/680 irányelv szerinti nyilvántartásai tartalmazzák annak magyarázatát, hogy a személyes adatok különleges kategóriáinak kezelése miért volt feltétlenül szükséges a torzítások felderítéséhez és korrekciójához, és hogy ez a cél miért nem volt elérhető más adatok kezelésével.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '5(a)',
  'a) a torzítás észlelése és korrekciója más adatok – köztük szintetikus vagy anonimizált adatok – feldolgozásával nem valósítható meg hatékonyan;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '5(b)',
  'b) a személyes adatok különleges kategóriái a személyes adatok további felhasználására vonatkozó technikai korlátozások, valamint a legkorszerűbb biztonsági és magánéletvédelmi intézkedések – köztük az álnevesítés – hatálya alá tartoznak;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '5(c)',
  'c) a személyes adatok különleges kategóriái olyan intézkedések hatálya alá tartoznak, amelyek célja annak biztosítása, hogy a feldolgozott személyes adatok biztonságosak és védettek legyenek, megfelelő biztosítékok hatálya alá tartozzanak – ideértve a szigorú ellenőrzést és a hozzáférés dokumentálását –, valamint a rendellenes használat elkerülése és annak garantálása, hogy az említett személyes adatokhoz csak felhatalmazott és megfelelő titoktartási kötelezettségek alá tartozó személyek férjenek hozzá;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '5(d)',
  'd) a különleges kategóriájú személyes adatok nem továbbíthatók, nem ruházhatók át, és nem tehetők harmadik felek által egyéb módon hozzáférhetővé;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '5(e)',
  'e) a különleges kategóriájú személyes adatok törlésre kerülnek, amint a torzítást korrigálták, vagy a személyes adatok megőrzési időszaka lejárt, attól függően, hogy melyik következik be előbb;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '5(f)',
  'f) az adatkezelési tevékenységeknek az (EU) 2016/679 és az (EU) 2018/1725 rendelet, valamint az (EU) 2016/680 irányelv szerinti nyilvántartásai tartalmazzák annak magyarázatát, hogy a személyes adatok különleges kategóriáinak kezelése miért volt feltétlenül szükséges a torzítások felderítéséhez és korrekciójához, és hogy ez a cél miért nem volt elérhető más adatok kezelésével.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '10',
  '6',
  '(6) Az MI-modellek tanítását magukban foglaló technikákat nem alkalmazó nagy kockázatú MI-rendszerek fejlesztése esetében a (2)–(5) bekezdés csak a tesztadatkészletekre alkalmazandó.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_10'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '11',
  null,
  'Műszaki dokumentáció
(1) A nagy kockázatú MI-rendszerek műszaki dokumentációját a rendszer forgalomba hozatala vagy üzembe helyezése előtt kell elkészíteni, és naprakészen kell tartani.

A műszaki dokumentációt úgy kell összeállítani, hogy bizonyítsa, hogy a nagy kockázatú MI-rendszer megfelel az e szakaszban meghatározott követelményeknek, és hogy belőle az illetékes nemzeti hatóságok és a bejelentett szervezetek világos és érthető formában hozzájussanak az annak értékeléséhez szükséges információkhoz, hogy az MI-rendszer megfelel-e az említett követelményeknek. A műszaki dokumentációnak tartalmaznia kell legalább a IV. mellékletben meghatározott elemeket. A kkv-k – köztük az induló innovatív vállalkozások – egyszerűsített formában nyújthatják be a IV. mellékletben meghatározott technikai dokumentáció elemeit. E célból a Bizottság létrehozza a kis- és mikrovállalkozások igényeinek megfelelő, egyszerűsített műszaki dokumentációs formanyomtatványt. Amennyiben valamely kkv – például induló innovatív vállalkozás – úgy dönt, hogy a IV. mellékletben előírt információkat egyszerűsített formában nyújtja be, e célra az e bekezdésben említett formanyomtatványt kell használnia. A bejelentett szervezeteknek a megfelelőségértékelés céljára el kell fogadniuk a formanyomtatványt.

(2) Olyan termékhez kapcsolódó nagy kockázatú MI-rendszer forgalomba hozatala vagy üzembe helyezése esetén, amelyre az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok vonatkoznak, egyetlen műszaki dokumentációs csomagot kell készíteni, amely tartalmazza az (1) bekezdésben meghatározott valamennyi információt, valamint az említett jogi aktusokban előírt információkat.

(3) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el, hogy szükség esetén módosítsa a IV. mellékletet annak biztosítása érdekében, hogy a műszaki dokumentáció a műszaki fejlődés fényében minden szükséges információt megadjon annak értékeléséhez, hogy a rendszer megfelel-e az e szakaszban meghatározott követelményeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_11'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '11',
  '1',
  '(1) A nagy kockázatú MI-rendszerek műszaki dokumentációját a rendszer forgalomba hozatala vagy üzembe helyezése előtt kell elkészíteni, és naprakészen kell tartani.

A műszaki dokumentációt úgy kell összeállítani, hogy bizonyítsa, hogy a nagy kockázatú MI-rendszer megfelel az e szakaszban meghatározott követelményeknek, és hogy belőle az illetékes nemzeti hatóságok és a bejelentett szervezetek világos és érthető formában hozzájussanak az annak értékeléséhez szükséges információkhoz, hogy az MI-rendszer megfelel-e az említett követelményeknek. A műszaki dokumentációnak tartalmaznia kell legalább a IV. mellékletben meghatározott elemeket. A kkv-k – köztük az induló innovatív vállalkozások – egyszerűsített formában nyújthatják be a IV. mellékletben meghatározott technikai dokumentáció elemeit. E célból a Bizottság létrehozza a kis- és mikrovállalkozások igényeinek megfelelő, egyszerűsített műszaki dokumentációs formanyomtatványt. Amennyiben valamely kkv – például induló innovatív vállalkozás – úgy dönt, hogy a IV. mellékletben előírt információkat egyszerűsített formában nyújtja be, e célra az e bekezdésben említett formanyomtatványt kell használnia. A bejelentett szervezeteknek a megfelelőségértékelés céljára el kell fogadniuk a formanyomtatványt.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_11'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '11',
  '2',
  '(2) Olyan termékhez kapcsolódó nagy kockázatú MI-rendszer forgalomba hozatala vagy üzembe helyezése esetén, amelyre az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok vonatkoznak, egyetlen műszaki dokumentációs csomagot kell készíteni, amely tartalmazza az (1) bekezdésben meghatározott valamennyi információt, valamint az említett jogi aktusokban előírt információkat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_11'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '11',
  '3',
  '(3) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el, hogy szükség esetén módosítsa a IV. mellékletet annak biztosítása érdekében, hogy a műszaki dokumentáció a műszaki fejlődés fényében minden szükséges információt megadjon annak értékeléséhez, hogy a rendszer megfelel-e az e szakaszban meghatározott követelményeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_11'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '12',
  null,
  'Nyilvántartás
(1) A nagy kockázatú MI-rendszereknek a rendszer élettartama során technikailag lehetővé kell tenniük az események automatikus rögzítését (naplózás).

(2) Annak érdekében, hogy biztosítsák a nagy kockázatú MI-rendszer működésének olyan szinten történő nyomon követhetőségét, amely megfelelő a rendszer rendeltetéséhez, a naplózási képességeknek lehetővé kell tenniük a következők szempontjából releváns események rögzítését:

a)

azon helyzetek azonosítása, amelyek eredményeként a nagy kockázatú MI-rendszer a 79. cikk (1) bekezdése értelmében vett kockázatot jelenthet, vagy amelyek eredményeként jelentős módosítás következhet be;

b)

a 72. cikkben említett forgalomba hozatal utáni nyomon követés megkönnyítése; és

c)

a nagy kockázatú MI-rendszerek működésének a 26. cikk (5) bekezdésében említett nyomon követése.

(3) A III. melléklet 1. pontjának a) alpontjában említett nagy kockázatú MI-rendszerek esetében a naplózási képességnek legalább a következőket kell biztosítania:

a)

a rendszer minden egyes használati időszakának rögzítése (az egyes használatok kezdő dátuma és időpontja, valamint záró dátuma és időpontja);

b)

az a referencia-adatbázis, amelyhez viszonyítva a rendszer ellenőrizte a bemeneti adatokat;

c)

azok a bemeneti adatok, amelyek esetében a keresés egyezést eredményezett;

d)

a 14. cikk (5) bekezdésében említettek szerint az eredmények ellenőrzésében részt vevő természetes személyek azonosítása.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '12',
  '1',
  '(1) A nagy kockázatú MI-rendszereknek a rendszer élettartama során technikailag lehetővé kell tenniük az események automatikus rögzítését (naplózás).',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '12',
  '2',
  '(2) Annak érdekében, hogy biztosítsák a nagy kockázatú MI-rendszer működésének olyan szinten történő nyomon követhetőségét, amely megfelelő a rendszer rendeltetéséhez, a naplózási képességeknek lehetővé kell tenniük a következők szempontjából releváns események rögzítését:

a)

azon helyzetek azonosítása, amelyek eredményeként a nagy kockázatú MI-rendszer a 79. cikk (1) bekezdése értelmében vett kockázatot jelenthet, vagy amelyek eredményeként jelentős módosítás következhet be;

b)

a 72. cikkben említett forgalomba hozatal utáni nyomon követés megkönnyítése; és

c)

a nagy kockázatú MI-rendszerek működésének a 26. cikk (5) bekezdésében említett nyomon követése.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '12',
  '2(a)',
  'a) azon helyzetek azonosítása, amelyek eredményeként a nagy kockázatú MI-rendszer a 79. cikk (1) bekezdése értelmében vett kockázatot jelenthet, vagy amelyek eredményeként jelentős módosítás következhet be;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '12',
  '2(b)',
  'b) a 72. cikkben említett forgalomba hozatal utáni nyomon követés megkönnyítése; és',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '12',
  '2(c)',
  'c) a nagy kockázatú MI-rendszerek működésének a 26. cikk (5) bekezdésében említett nyomon követése.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '12',
  '3',
  '(3) A III. melléklet 1. pontjának a) alpontjában említett nagy kockázatú MI-rendszerek esetében a naplózási képességnek legalább a következőket kell biztosítania:

a)

a rendszer minden egyes használati időszakának rögzítése (az egyes használatok kezdő dátuma és időpontja, valamint záró dátuma és időpontja);

b)

az a referencia-adatbázis, amelyhez viszonyítva a rendszer ellenőrizte a bemeneti adatokat;

c)

azok a bemeneti adatok, amelyek esetében a keresés egyezést eredményezett;

d)

a 14. cikk (5) bekezdésében említettek szerint az eredmények ellenőrzésében részt vevő természetes személyek azonosítása.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '12',
  '3(a)',
  'a) a rendszer minden egyes használati időszakának rögzítése (az egyes használatok kezdő dátuma és időpontja, valamint záró dátuma és időpontja);',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '12',
  '3(b)',
  'b) az a referencia-adatbázis, amelyhez viszonyítva a rendszer ellenőrizte a bemeneti adatokat;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '12',
  '3(c)',
  'c) azok a bemeneti adatok, amelyek esetében a keresés egyezést eredményezett;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '12',
  '3(d)',
  'd) a 14. cikk (5) bekezdésében említettek szerint az eredmények ellenőrzésében részt vevő természetes személyek azonosítása.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_12'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '13',
  null,
  'Átláthatóság és az alkalmazóknak nyújtott tájékoztatás
(1) A nagy kockázatú MI-rendszereket úgy kell megtervezni és fejleszteni, hogy működésük kellően átlátható legyen ahhoz, hogy az alkalmazók értelmezhessék a rendszer kimenetét és megfelelően használhassák azt. A szolgáltatónak és az alkalmazónak a 3. szakaszban meghatározott vonatkozó kötelezettségeinek való megfelelés érdekében megfelelő típusú és mértékű átláthatóságot kell biztosítani.

(2) A nagy kockázatú MI-rendszerekhez megfelelő digitális formátumú vagy egyéb használati utasítást kell mellékelni, amely tömör, teljes körű, pontos és egyértelmű, az alkalmazók számára releváns, hozzáférhető és érthető információkat tartalmaz.

(3) A használati utasításnak tartalmaznia kell legalább a következő információkat:

a)

a szolgáltatónak és – adott esetben – a meghatalmazott képviselőjének a kiléte és elérhetőségei;

b)

a nagy kockázatú MI-rendszer jellemzői, képességei és teljesítményének korlátai, beleértve a következőket:

i.

a rendszer rendeltetése;

ii.

a 15. cikkben említett pontosság – ideértve a mérőszámait is –, stabilitás és kiberbiztonság azon várható szintje, amelyhez viszonyítva a nagy kockázatú MI-rendszert tesztelték és validálták, valamint minden olyan ismert és előre látható körülmény, amely befolyásolhatja a pontosság, a stabilitás és a kiberbiztonság említett várható szintjét;

iii.

bármely ismert vagy előre látható, a nagy kockázatú MI-rendszer rendeltetésszerű használatával vagy az észszerűen előrelátható rendellenes használatával összefüggő körülmény, amely a 9. cikk (2) bekezdésében említett, az egészségre és a biztonságra vagy az alapvető jogokra jelentett kockázatokhoz vezethet;

iv.

adott esetben a nagy kockázatú MI-rendszer műszaki képességei és tulajdonságai a kimenetének magyarázata szempontjából releváns tájékoztatás tekintetében;

v.

adott esetben a rendszer teljesítménye azon meghatározott személyek vagy személyek csoportjai tekintetében, akikre vagy amelyekre a rendszert használni kívánják;

vi.

adott esetben a bemeneti adatokra vonatkozó előírások vagy az alkalmazott tanító-, validálási és tesztadatkészletekre vonatkozó egyéb releváns információk, figyelembe véve a nagy kockázatú MI-rendszer rendeltetését;

vii.

adott esetben a nagy kockázatú MI-rendszer kimeneteinek az alkalmazók általi értelmezését és megfelelő használatát lehetővé tevő információk;

c)

a nagy kockázatú MI-rendszert és annak teljesítményét érintő, a szolgáltató által az első megfelelőségértékelés időpontjában előre meghatározott változások, ha vannak ilyenek;

d)

a 14. cikkben említett emberi felügyeleti intézkedések, beleértve a nagy kockázatú MI-rendszerek kimeneteinek alkalmazók általi értelmezését megkönnyítő technikai intézkedéseket;

e)

a szükséges számítási és hardveres erőforrások, a nagy kockázatú MI-rendszer várható élettartama, valamint az említett MI-rendszer megfelelő működésének biztosításához szükséges karbantartási és gondozási intézkedések, beleértve a gyakoriságukat is, többek között a szoftverfrissítések tekintetében;

f)

adott esetben a nagy kockázatú MI-rendszerben foglalt mechanizmusok leírása, amelyek lehetővé teszik az alkalmazók számára a naplók megfelelő gyűjtését, tárolását és értelmezését a 12. cikkel összhangban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '13',
  '1',
  '(1) A nagy kockázatú MI-rendszereket úgy kell megtervezni és fejleszteni, hogy működésük kellően átlátható legyen ahhoz, hogy az alkalmazók értelmezhessék a rendszer kimenetét és megfelelően használhassák azt. A szolgáltatónak és az alkalmazónak a 3. szakaszban meghatározott vonatkozó kötelezettségeinek való megfelelés érdekében megfelelő típusú és mértékű átláthatóságot kell biztosítani.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '13',
  '2',
  '(2) A nagy kockázatú MI-rendszerekhez megfelelő digitális formátumú vagy egyéb használati utasítást kell mellékelni, amely tömör, teljes körű, pontos és egyértelmű, az alkalmazók számára releváns, hozzáférhető és érthető információkat tartalmaz.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '13',
  '3',
  '(3) A használati utasításnak tartalmaznia kell legalább a következő információkat:

a)

a szolgáltatónak és – adott esetben – a meghatalmazott képviselőjének a kiléte és elérhetőségei;

b)

a nagy kockázatú MI-rendszer jellemzői, képességei és teljesítményének korlátai, beleértve a következőket:

i.

a rendszer rendeltetése;

ii.

a 15. cikkben említett pontosság – ideértve a mérőszámait is –, stabilitás és kiberbiztonság azon várható szintje, amelyhez viszonyítva a nagy kockázatú MI-rendszert tesztelték és validálták, valamint minden olyan ismert és előre látható körülmény, amely befolyásolhatja a pontosság, a stabilitás és a kiberbiztonság említett várható szintjét;

iii.

bármely ismert vagy előre látható, a nagy kockázatú MI-rendszer rendeltetésszerű használatával vagy az észszerűen előrelátható rendellenes használatával összefüggő körülmény, amely a 9. cikk (2) bekezdésében említett, az egészségre és a biztonságra vagy az alapvető jogokra jelentett kockázatokhoz vezethet;

iv.

adott esetben a nagy kockázatú MI-rendszer műszaki képességei és tulajdonságai a kimenetének magyarázata szempontjából releváns tájékoztatás tekintetében;

v.

adott esetben a rendszer teljesítménye azon meghatározott személyek vagy személyek csoportjai tekintetében, akikre vagy amelyekre a rendszert használni kívánják;

vi.

adott esetben a bemeneti adatokra vonatkozó előírások vagy az alkalmazott tanító-, validálási és tesztadatkészletekre vonatkozó egyéb releváns információk, figyelembe véve a nagy kockázatú MI-rendszer rendeltetését;

vii.

adott esetben a nagy kockázatú MI-rendszer kimeneteinek az alkalmazók általi értelmezését és megfelelő használatát lehetővé tevő információk;

c)

a nagy kockázatú MI-rendszert és annak teljesítményét érintő, a szolgáltató által az első megfelelőségértékelés időpontjában előre meghatározott változások, ha vannak ilyenek;

d)

a 14. cikkben említett emberi felügyeleti intézkedések, beleértve a nagy kockázatú MI-rendszerek kimeneteinek alkalmazók általi értelmezését megkönnyítő technikai intézkedéseket;

e)

a szükséges számítási és hardveres erőforrások, a nagy kockázatú MI-rendszer várható élettartama, valamint az említett MI-rendszer megfelelő működésének biztosításához szükséges karbantartási és gondozási intézkedések, beleértve a gyakoriságukat is, többek között a szoftverfrissítések tekintetében;

f)

adott esetben a nagy kockázatú MI-rendszerben foglalt mechanizmusok leírása, amelyek lehetővé teszik az alkalmazók számára a naplók megfelelő gyűjtését, tárolását és értelmezését a 12. cikkel összhangban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '13',
  '3(a)',
  'a) a szolgáltatónak és – adott esetben – a meghatalmazott képviselőjének a kiléte és elérhetőségei;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '13',
  '3(b)',
  'b) a nagy kockázatú MI-rendszer jellemzői, képességei és teljesítményének korlátai, beleértve a következőket:

i.

a rendszer rendeltetése;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '13',
  '3(c)',
  'c) a nagy kockázatú MI-rendszert és annak teljesítményét érintő, a szolgáltató által az első megfelelőségértékelés időpontjában előre meghatározott változások, ha vannak ilyenek;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '13',
  '3(d)',
  'd) a 14. cikkben említett emberi felügyeleti intézkedések, beleértve a nagy kockázatú MI-rendszerek kimeneteinek alkalmazók általi értelmezését megkönnyítő technikai intézkedéseket;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '13',
  '3(e)',
  'e) a szükséges számítási és hardveres erőforrások, a nagy kockázatú MI-rendszer várható élettartama, valamint az említett MI-rendszer megfelelő működésének biztosításához szükséges karbantartási és gondozási intézkedések, beleértve a gyakoriságukat is, többek között a szoftverfrissítések tekintetében;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '13',
  '3(f)',
  'f) adott esetben a nagy kockázatú MI-rendszerben foglalt mechanizmusok leírása, amelyek lehetővé teszik az alkalmazók számára a naplók megfelelő gyűjtését, tárolását és értelmezését a 12. cikkel összhangban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_13'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  null,
  'Emberi felügyelet
(1) A nagy kockázatú MI-rendszereket úgy kell megtervezni és fejleszteni – többek között megfelelő ember–gép interfész eszközökkel –, hogy azokat a használatuk időtartama alatt természetes személyek hatékonyan felügyelhessék.

(2) Az emberi felügyelet célja az egészséget, a biztonságot vagy az alapvető jogokat érintő azon kockázatok megelőzése vagy minimalizálása, amelyek a nagy kockázatú MI-rendszer rendeltetésszerű használata vagy észszerűen előrelátható rendellenes használata esetén merülhetnek fel, különösen, amennyiben az ilyen kockázatok az e szakaszban meghatározott egyéb követelmények alkalmazásának ellenére tartósan fennállnak.

(3) A felügyeleti intézkedéseknek arányban kell állniuk a nagy kockázatú MI-rendszer kockázataival, autonómia-szintjével és felhasználási kontextusával, és azokat a következő intézkedéstípusok közül az egyik vagy mindkettő révén kell biztosítani:

a)

a szolgáltató által a nagy kockázatú MI-rendszer forgalomba hozatala vagy üzembe helyezése előtt azonosított és – amennyiben műszakilag megvalósítható – a nagy kockázatú MI-rendszerbe beépített intézkedések;

b)

a szolgáltató által a nagy kockázatú MI-rendszer forgalomba hozatala vagy üzembe helyezése előtt azonosított, és az alkalmazó általi alkalmazásra megfelelő intézkedések.

(4) Az (1), a (2) és a (3) bekezdés végrehajtása céljából a nagy kockázatú MI-rendszert oly módon kell az alkalmazó rendelkezésére bocsátani, hogy az emberi felügyelettel megbízott természetes személyek – adott esetben és arányos módon – képessé váljanak a következőkre:

a)

megfelelően megérteni a nagy kockázatú MI-rendszer releváns képességeit és korlátait, valamint tudni kellően nyomon követni annak működését, többek között a rendellenességek, zavarok és a váratlan teljesítmény felderítése és kezelése érdekében;

b)

tudatában maradni a nagy kockázatú MI-rendszerek által előállított kimenetre való automatikus vagy túlzott mértékű támaszkodás tendenciájának („automatizálási torzítás”), különösen azon nagy kockázatú MI-rendszerek esetében, amelyeket információ vagy ajánlások nyújtására használnak a természetes személyek által hozandó döntésekhez;

c)

helyesen értelmezni a nagy kockázatú MI-rendszer kimenetét, figyelembe véve például a rendelkezésre álló értelmezési eszközöket és módszereket;

d)

bármely konkrét helyzetben dönteni arról, hogy nem használják a nagy kockázatú MI-rendszert, vagy más módon figyelmen kívül hagyják, felülírják vagy visszafordítják a nagy kockázatú MI-rendszer kimenetét;

e)

beavatkozni a nagy kockázatú MI-rendszer működésébe, vagy megszakítani a rendszert egy „stop” gomb vagy olyan, hasonló eljárás révén, amely lehetővé teszi a rendszer biztonságos állapotban történő leállását.

(5) A III. melléklet 1. pontjának a) alpontjában említett nagy kockázatú MI-rendszerek esetében az e cikk (3) bekezdésében említett intézkedéseknek olyanoknak kell lenniük, amelyek biztosítják, hogy emellett az alkalmazó a rendszerből származó azonosítás alapján ne hozzon intézkedést vagy döntést, kivéve, ha az említett azonosítást legalább két, a szükséges kompetenciával, képzettséggel és hatáskörrel rendelkező természetes személy – egymástól függetlenül – ellenőrizte és megerősítette.

A legalább két természetes személy által egymástól függetlenül végzett ellenőrzésre vonatkozó követelmény nem alkalmazandó a bűnüldözés, a migráció, a határellenőrzés vagy a menekültügy céljaira használt nagy kockázatú MI-rendszerekre, amennyiben az uniós vagy a nemzeti jog e követelmény alkalmazását aránytalannak tekinti.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  '1',
  '(1) A nagy kockázatú MI-rendszereket úgy kell megtervezni és fejleszteni – többek között megfelelő ember–gép interfész eszközökkel –, hogy azokat a használatuk időtartama alatt természetes személyek hatékonyan felügyelhessék.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  '2',
  '(2) Az emberi felügyelet célja az egészséget, a biztonságot vagy az alapvető jogokat érintő azon kockázatok megelőzése vagy minimalizálása, amelyek a nagy kockázatú MI-rendszer rendeltetésszerű használata vagy észszerűen előrelátható rendellenes használata esetén merülhetnek fel, különösen, amennyiben az ilyen kockázatok az e szakaszban meghatározott egyéb követelmények alkalmazásának ellenére tartósan fennállnak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  '3',
  '(3) A felügyeleti intézkedéseknek arányban kell állniuk a nagy kockázatú MI-rendszer kockázataival, autonómia-szintjével és felhasználási kontextusával, és azokat a következő intézkedéstípusok közül az egyik vagy mindkettő révén kell biztosítani:

a)

a szolgáltató által a nagy kockázatú MI-rendszer forgalomba hozatala vagy üzembe helyezése előtt azonosított és – amennyiben műszakilag megvalósítható – a nagy kockázatú MI-rendszerbe beépített intézkedések;

b)

a szolgáltató által a nagy kockázatú MI-rendszer forgalomba hozatala vagy üzembe helyezése előtt azonosított, és az alkalmazó általi alkalmazásra megfelelő intézkedések.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  '3(a)',
  'a) a szolgáltató által a nagy kockázatú MI-rendszer forgalomba hozatala vagy üzembe helyezése előtt azonosított és – amennyiben műszakilag megvalósítható – a nagy kockázatú MI-rendszerbe beépített intézkedések;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  '3(b)',
  'b) a szolgáltató által a nagy kockázatú MI-rendszer forgalomba hozatala vagy üzembe helyezése előtt azonosított, és az alkalmazó általi alkalmazásra megfelelő intézkedések.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  '4',
  '(4) Az (1), a (2) és a (3) bekezdés végrehajtása céljából a nagy kockázatú MI-rendszert oly módon kell az alkalmazó rendelkezésére bocsátani, hogy az emberi felügyelettel megbízott természetes személyek – adott esetben és arányos módon – képessé váljanak a következőkre:

a)

megfelelően megérteni a nagy kockázatú MI-rendszer releváns képességeit és korlátait, valamint tudni kellően nyomon követni annak működését, többek között a rendellenességek, zavarok és a váratlan teljesítmény felderítése és kezelése érdekében;

b)

tudatában maradni a nagy kockázatú MI-rendszerek által előállított kimenetre való automatikus vagy túlzott mértékű támaszkodás tendenciájának („automatizálási torzítás”), különösen azon nagy kockázatú MI-rendszerek esetében, amelyeket információ vagy ajánlások nyújtására használnak a természetes személyek által hozandó döntésekhez;

c)

helyesen értelmezni a nagy kockázatú MI-rendszer kimenetét, figyelembe véve például a rendelkezésre álló értelmezési eszközöket és módszereket;

d)

bármely konkrét helyzetben dönteni arról, hogy nem használják a nagy kockázatú MI-rendszert, vagy más módon figyelmen kívül hagyják, felülírják vagy visszafordítják a nagy kockázatú MI-rendszer kimenetét;

e)

beavatkozni a nagy kockázatú MI-rendszer működésébe, vagy megszakítani a rendszert egy „stop” gomb vagy olyan, hasonló eljárás révén, amely lehetővé teszi a rendszer biztonságos állapotban történő leállását.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  '4(a)',
  'a) megfelelően megérteni a nagy kockázatú MI-rendszer releváns képességeit és korlátait, valamint tudni kellően nyomon követni annak működését, többek között a rendellenességek, zavarok és a váratlan teljesítmény felderítése és kezelése érdekében;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  '4(b)',
  'b) tudatában maradni a nagy kockázatú MI-rendszerek által előállított kimenetre való automatikus vagy túlzott mértékű támaszkodás tendenciájának („automatizálási torzítás”), különösen azon nagy kockázatú MI-rendszerek esetében, amelyeket információ vagy ajánlások nyújtására használnak a természetes személyek által hozandó döntésekhez;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  '4(c)',
  'c) helyesen értelmezni a nagy kockázatú MI-rendszer kimenetét, figyelembe véve például a rendelkezésre álló értelmezési eszközöket és módszereket;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  '4(d)',
  'd) bármely konkrét helyzetben dönteni arról, hogy nem használják a nagy kockázatú MI-rendszert, vagy más módon figyelmen kívül hagyják, felülírják vagy visszafordítják a nagy kockázatú MI-rendszer kimenetét;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  '4(e)',
  'e) beavatkozni a nagy kockázatú MI-rendszer működésébe, vagy megszakítani a rendszert egy „stop” gomb vagy olyan, hasonló eljárás révén, amely lehetővé teszi a rendszer biztonságos állapotban történő leállását.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '14',
  '5',
  '(5) A III. melléklet 1. pontjának a) alpontjában említett nagy kockázatú MI-rendszerek esetében az e cikk (3) bekezdésében említett intézkedéseknek olyanoknak kell lenniük, amelyek biztosítják, hogy emellett az alkalmazó a rendszerből származó azonosítás alapján ne hozzon intézkedést vagy döntést, kivéve, ha az említett azonosítást legalább két, a szükséges kompetenciával, képzettséggel és hatáskörrel rendelkező természetes személy – egymástól függetlenül – ellenőrizte és megerősítette.

A legalább két természetes személy által egymástól függetlenül végzett ellenőrzésre vonatkozó követelmény nem alkalmazandó a bűnüldözés, a migráció, a határellenőrzés vagy a menekültügy céljaira használt nagy kockázatú MI-rendszerekre, amennyiben az uniós vagy a nemzeti jog e követelmény alkalmazását aránytalannak tekinti.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_14'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '15',
  null,
  'Pontosság, stabilitás és kiberbiztonság
(1) A nagy kockázatú MI-rendszereket úgy kell megtervezni és fejleszteni, hogy megfelelő szintű pontosságot, stabilitást és kiberbiztonságot érjenek el, továbbá, hogy e tekintetben a teljes életciklusuk során következetesen teljesítsenek.

(2) A pontosság és a stabilitás (1) bekezdésben meghatározott szintjeinek mérésével kapcsolatos technikai szempontok figyelembevétele érdekében a Bizottság – a releváns érdekelt felekkel és szervezetekkel, így például a metrológiai és teljesítményértékelési hatóságokkal együttműködve – adott esetben ösztönzi a referenciaértékek és mérési módszertanok kidolgozását.

(3) A nagy kockázatú MI-rendszerek pontossági szintjeit és vonatkozó pontossági mérőszámait a mellékelt használati utasításban kell feltüntetni.

(4) A nagy kockázatú MI-rendszereknek a lehető leginkább reziliensnek kell lenniük azon hibák, meghibásodások vagy következetlenségek tekintetében, amelyek a rendszeren vagy a rendszer működési környezetén belül előfordulhatnak, különösen a természetes személyekkel vagy más rendszerekkel való kölcsönhatásuk miatt. E tekintetben technikai és szervezeti intézkedéseket kell hozni.

A nagy kockázatú MI-rendszerek stabilitása elérhető műszaki redundanciamegoldásokkal, amelyek magukban foglalhatnak biztonsági vagy vészüzemi terveket is.

Azon nagy kockázatú MI-rendszereket, amelyek a forgalomba hozatalt vagy az üzembe helyezést követően is tanulnak, úgy kell fejleszteni, hogy kiküszöböljék vagy a lehető legnagyobb mértékben csökkentsék annak kockázatát, hogy az esetlegesen torzított kimenetek befolyásolják a jövőbeli műveletek bemenetét (visszacsatolási hurkok), valamint biztosítva azt, hogy az ilyen visszacsatolási hurkokat megfelelő kockázatcsökkentő intézkedésekkel kielégítően kezeljék.

(5) A nagy kockázatú MI-rendszereknek reziliensnek kell lenniük a jogosulatlan harmadik felek arra irányuló kísérleteivel szemben, hogy a rendszer sebezhetőségeinek kiaknázása révén megváltoztassák a rendszer használatát, kimeneteit vagy teljesítményét.

A nagy kockázatú MI-rendszerek kiberbiztonságának biztosítását célzó műszaki megoldásoknak megfelelőnek kell lenniük a releváns körülmények és a kockázatok szempontjából.

Az MI-specifikus sebezhetőségek kezelésére szolgáló műszaki megoldásoknak adott esetben magukban kell foglalniuk azon intézkedéseket, amelyek a tanítóadat-készlet manipulálását megkísérlő támadásoknak (adatmérgezés) vagy a tanítás során használt előtanított összetevők manipulálását megkísérlő támadásoknak („modellmérgezés”), a modell hibájának előidézésére szolgáló bemeneteknek (támadó szempontú példák vagy modellkijátszás), a bizalmasság elleni támadásoknak vagy a modellhibáknak a megelőzésére, felderítésére, az azokra való reagálásra, azok megoldására és ellenőrzésére irányulnak.

3. SZAKASZ

A nagy kockázatú MI-rendszerek szolgáltatóinak és alkalmazóinak, valamint más feleknek a kötelezettségei',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '15',
  '1',
  '(1) A nagy kockázatú MI-rendszereket úgy kell megtervezni és fejleszteni, hogy megfelelő szintű pontosságot, stabilitást és kiberbiztonságot érjenek el, továbbá, hogy e tekintetben a teljes életciklusuk során következetesen teljesítsenek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '15',
  '2',
  '(2) A pontosság és a stabilitás (1) bekezdésben meghatározott szintjeinek mérésével kapcsolatos technikai szempontok figyelembevétele érdekében a Bizottság – a releváns érdekelt felekkel és szervezetekkel, így például a metrológiai és teljesítményértékelési hatóságokkal együttműködve – adott esetben ösztönzi a referenciaértékek és mérési módszertanok kidolgozását.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '15',
  '3',
  '(3) A nagy kockázatú MI-rendszerek pontossági szintjeit és vonatkozó pontossági mérőszámait a mellékelt használati utasításban kell feltüntetni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '15',
  '4',
  '(4) A nagy kockázatú MI-rendszereknek a lehető leginkább reziliensnek kell lenniük azon hibák, meghibásodások vagy következetlenségek tekintetében, amelyek a rendszeren vagy a rendszer működési környezetén belül előfordulhatnak, különösen a természetes személyekkel vagy más rendszerekkel való kölcsönhatásuk miatt. E tekintetben technikai és szervezeti intézkedéseket kell hozni.

A nagy kockázatú MI-rendszerek stabilitása elérhető műszaki redundanciamegoldásokkal, amelyek magukban foglalhatnak biztonsági vagy vészüzemi terveket is.

Azon nagy kockázatú MI-rendszereket, amelyek a forgalomba hozatalt vagy az üzembe helyezést követően is tanulnak, úgy kell fejleszteni, hogy kiküszöböljék vagy a lehető legnagyobb mértékben csökkentsék annak kockázatát, hogy az esetlegesen torzított kimenetek befolyásolják a jövőbeli műveletek bemenetét (visszacsatolási hurkok), valamint biztosítva azt, hogy az ilyen visszacsatolási hurkokat megfelelő kockázatcsökkentő intézkedésekkel kielégítően kezeljék.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '15',
  '5',
  '(5) A nagy kockázatú MI-rendszereknek reziliensnek kell lenniük a jogosulatlan harmadik felek arra irányuló kísérleteivel szemben, hogy a rendszer sebezhetőségeinek kiaknázása révén megváltoztassák a rendszer használatát, kimeneteit vagy teljesítményét.

A nagy kockázatú MI-rendszerek kiberbiztonságának biztosítását célzó műszaki megoldásoknak megfelelőnek kell lenniük a releváns körülmények és a kockázatok szempontjából.

Az MI-specifikus sebezhetőségek kezelésére szolgáló műszaki megoldásoknak adott esetben magukban kell foglalniuk azon intézkedéseket, amelyek a tanítóadat-készlet manipulálását megkísérlő támadásoknak (adatmérgezés) vagy a tanítás során használt előtanított összetevők manipulálását megkísérlő támadásoknak („modellmérgezés”), a modell hibájának előidézésére szolgáló bemeneteknek (támadó szempontú példák vagy modellkijátszás), a bizalmasság elleni támadásoknak vagy a modellhibáknak a megelőzésére, felderítésére, az azokra való reagálásra, azok megoldására és ellenőrzésére irányulnak.

3. SZAKASZ

A nagy kockázatú MI-rendszerek szolgáltatóinak és alkalmazóinak, valamint más feleknek a kötelezettségei',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_15'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '16',
  null,
  'A nagy kockázatú MI-rendszerek szolgáltatóinak kötelezettségei
A nagy kockázatú MI-rendszerek szolgáltatóinak:

a)

biztosítaniuk kell, hogy nagy kockázatú MI-rendszereik megfeleljenek a 2. szakaszban meghatározott követelményeknek;

b)

fel kell tüntetniük a nagy kockázatú MI-rendszeren – vagy amennyiben ez nem lehetséges, annak csomagolásán vagy adott esetben a kísérő dokumentációján – a nevüket, bejegyzett kereskedelmi nevüket vagy bejegyzett védjegyüket és azt a címüket, amelyen velük kapcsolatba lehet lépni;

c)

a 17. cikknek megfelelő minőségirányítási rendszerrel kell rendelkezniük;

d)

vezetniük kell a 18. cikkben említett dokumentációt;

e)

a 19. cikkben említettek szerint meg kell őrizniük a nagy kockázatú MI-rendszereik által automatikusan generált naplókat, ha azok az ellenőrzésük alatt állnak;

f)

biztosítaniuk kell, hogy a nagy kockázatú MI-rendszert forgalomba hozatala vagy üzembe helyezése előtt alávessék a 43. cikkben említett vonatkozó megfelelőségértékelési eljárásnak;

g)

a 47. cikkel összhangban EU-megfelelőségi nyilatkozatot kell készíteniük;

h)

a 48. cikkel összhangban fel kell tüntetniük a CE-jelölést a nagy kockázatú MI-rendszeren – vagy amennyiben ez nem lehetséges, annak csomagolásán vagy kísérő dokumentációján –, hogy jelezzék az e rendeletnek való megfelelést;

i)

eleget kell tenniük a 49. cikk (1) bekezdésében említett regisztrációs kötelezettségeknek;

j)

a 20. cikkben előírtak szerint meg kell hozniuk a szükséges korrekciós intézkedéseket és tájékoztatást kell nyújtaniuk;

k)

az illetékes nemzeti hatóság indokolással ellátott kérésére igazolniuk kell, hogy a nagy kockázatú MI-rendszer megfelel a 2. szakaszban meghatározott követelményeknek;

l)

az (EU) 2016/2102 és az (EU) 2019/882 irányelvvel összhangban biztosítaniuk kell, hogy a nagy kockázatú MI-rendszer megfeleljen az akadálymentesítési követelményeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_16'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  null,
  'Minőségirányítási rendszer
(1) A nagy kockázatú MI-rendszerek szolgáltatóinak minőségirányítási rendszert kell bevezetniük, amely biztosítja az e rendeletnek való megfelelést. Ezt a rendszert írásbeli szabályzatok, eljárások és utasítások formájában szisztematikus és rendezett módon dokumentálni kell, és annak legalább a következő szempontokra kell kiterjednie:

a)

a jogszabályi rendelkezések tiszteletben tartását célzó stratégia, beleértve a megfelelőségértékelési eljárásoknak, valamint a nagy kockázatú MI-rendszer módosításának kezelését célzó eljárásoknak való megfelelést is;

b)

a nagy kockázatú MI-rendszer tervezéséhez, tervezés-ellenőrzéséhez és tervezés-igazolásához alkalmazandó technikák, eljárások és módszeres intézkedések;

c)

a nagy kockázatú MI-rendszer fejlesztésére, minőség-ellenőrzésére és minőségbiztosítására alkalmazandó technikák, eljárások és módszeres intézkedések;

d)

a nagy kockázatú MI-rendszer fejlesztése előtt, alatt és után végrehajtandó vizsgálati, tesztelési és validálási eljárások, valamint azok elvégzésének előírt gyakorisága;

e)

az alkalmazandó műszaki előírások, beleértve a szabványokat, valamint – amennyiben a vonatkozó harmonizált szabványokat nem alkalmazzák teljes mértékben, vagy azok nem terjednek ki a 2. szakaszban meghatározott valamennyi releváns követelményre – az annak biztosítására szolgáló eszközök, hogy a nagy kockázatú MI-rendszer megfeleljen az említett követelményeknek;

f)

adatgazdálkodási rendszerek és eljárások, beleértve az adatszerzést, az adatgyűjtést, az adatelemzést, az adatcímkézést, az adattárolást, az adatszűrést, az adatbányászatot, az adatösszesítést, az adatmegőrzést és a nagy kockázatú MI-rendszerek forgalomba hozatala vagy üzembe helyezése előtt és céljából végzett bármely más, az adatokkal kapcsolatos műveletet;

g)

a 9. cikkben említett kockázatkezelési rendszer;

h)

a 72. cikkel összhangban a forgalomba hozatal utáni nyomonkövetési rendszer kidolgozása, végrehajtása és fenntartása;

i)

a 73. cikkel összhangban a súlyos váratlan események bejelentésével kapcsolatos eljárások;

j)

az illetékes nemzeti hatóságokkal, egyéb releváns – többek között az adatokhoz való hozzáférést biztosító vagy támogató – hatóságokkal, a bejelentett szervezetekkel, más gazdasági szereplőkkel, ügyfelekkel vagy más érdekelt felekkel folytatott kommunikáció kezelése;

k)

valamennyi releváns dokumentáció és információ nyilvántartására szolgáló rendszerek és eljárások;

l)

erőforrás-gazdálkodás, beleértve az ellátás biztonságával kapcsolatos intézkedéseket;

m)

elszámoltathatósági keret, amely meghatározza a vezetőség és az egyéb személyzet felelősségi körét az e bekezdésben felsorolt valamennyi szempont tekintetében.

(2) Az (1) bekezdésben említett szempontok megvalósításának arányosnak kell lennie a szolgáltató szervezetének méretével. A szolgáltatóknak minden esetben tiszteletben kell tartaniuk a nagy kockázatú MI-rendszereik e rendeletnek való megfelelésének biztosításához szükséges szigorúsági mértéket és védelmi szintet.

(3) A nagy kockázatú MI-rendszerek azon szolgáltatói, amelyek a minőségirányítási rendszerekre vagy a releváns ágazati uniós jog szerinti valamely egyenértékű funkcióra vonatkozó kötelezettségek hatálya alá tartoznak, az (1) bekezdésben felsorolt szempontokat az említett jog alapján létrehozott minőségirányítási rendszerek részévé tehetik.

(4) Azon szolgáltatók esetében, amelyek a pénzügyi szolgáltatásokra vonatkozó uniós jog értelmében a belső irányításukra, rendszerükre vagy eljárásaikra vonatkozó követelmények hatálya alá tartozó pénzügyi intézmények, az e cikk (1) bekezdésének g), h) és i) pontja kivételével a minőségirányítási rendszer létrehozására vonatkozó kötelezettséget a pénzügyi szolgáltatásokra vonatkozó uniós jog szerinti, belső irányítási rendszerekre vagy eljárásokra vonatkozó szabályoknak való megfeleléssel teljesítettnek kell tekinteni. E célból figyelembe kell venni a 40. cikkben említett harmonizált szabványokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1',
  '(1) A nagy kockázatú MI-rendszerek szolgáltatóinak minőségirányítási rendszert kell bevezetniük, amely biztosítja az e rendeletnek való megfelelést. Ezt a rendszert írásbeli szabályzatok, eljárások és utasítások formájában szisztematikus és rendezett módon dokumentálni kell, és annak legalább a következő szempontokra kell kiterjednie:

a)

a jogszabályi rendelkezések tiszteletben tartását célzó stratégia, beleértve a megfelelőségértékelési eljárásoknak, valamint a nagy kockázatú MI-rendszer módosításának kezelését célzó eljárásoknak való megfelelést is;

b)

a nagy kockázatú MI-rendszer tervezéséhez, tervezés-ellenőrzéséhez és tervezés-igazolásához alkalmazandó technikák, eljárások és módszeres intézkedések;

c)

a nagy kockázatú MI-rendszer fejlesztésére, minőség-ellenőrzésére és minőségbiztosítására alkalmazandó technikák, eljárások és módszeres intézkedések;

d)

a nagy kockázatú MI-rendszer fejlesztése előtt, alatt és után végrehajtandó vizsgálati, tesztelési és validálási eljárások, valamint azok elvégzésének előírt gyakorisága;

e)

az alkalmazandó műszaki előírások, beleértve a szabványokat, valamint – amennyiben a vonatkozó harmonizált szabványokat nem alkalmazzák teljes mértékben, vagy azok nem terjednek ki a 2. szakaszban meghatározott valamennyi releváns követelményre – az annak biztosítására szolgáló eszközök, hogy a nagy kockázatú MI-rendszer megfeleljen az említett követelményeknek;

f)

adatgazdálkodási rendszerek és eljárások, beleértve az adatszerzést, az adatgyűjtést, az adatelemzést, az adatcímkézést, az adattárolást, az adatszűrést, az adatbányászatot, az adatösszesítést, az adatmegőrzést és a nagy kockázatú MI-rendszerek forgalomba hozatala vagy üzembe helyezése előtt és céljából végzett bármely más, az adatokkal kapcsolatos műveletet;

g)

a 9. cikkben említett kockázatkezelési rendszer;

h)

a 72. cikkel összhangban a forgalomba hozatal utáni nyomonkövetési rendszer kidolgozása, végrehajtása és fenntartása;

i)

a 73. cikkel összhangban a súlyos váratlan események bejelentésével kapcsolatos eljárások;

j)

az illetékes nemzeti hatóságokkal, egyéb releváns – többek között az adatokhoz való hozzáférést biztosító vagy támogató – hatóságokkal, a bejelentett szervezetekkel, más gazdasági szereplőkkel, ügyfelekkel vagy más érdekelt felekkel folytatott kommunikáció kezelése;

k)

valamennyi releváns dokumentáció és információ nyilvántartására szolgáló rendszerek és eljárások;

l)

erőforrás-gazdálkodás, beleértve az ellátás biztonságával kapcsolatos intézkedéseket;

m)

elszámoltathatósági keret, amely meghatározza a vezetőség és az egyéb személyzet felelősségi körét az e bekezdésben felsorolt valamennyi szempont tekintetében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(a)',
  'a) a jogszabályi rendelkezések tiszteletben tartását célzó stratégia, beleértve a megfelelőségértékelési eljárásoknak, valamint a nagy kockázatú MI-rendszer módosításának kezelését célzó eljárásoknak való megfelelést is;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(b)',
  'b) a nagy kockázatú MI-rendszer tervezéséhez, tervezés-ellenőrzéséhez és tervezés-igazolásához alkalmazandó technikák, eljárások és módszeres intézkedések;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(c)',
  'c) a nagy kockázatú MI-rendszer fejlesztésére, minőség-ellenőrzésére és minőségbiztosítására alkalmazandó technikák, eljárások és módszeres intézkedések;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(d)',
  'd) a nagy kockázatú MI-rendszer fejlesztése előtt, alatt és után végrehajtandó vizsgálati, tesztelési és validálási eljárások, valamint azok elvégzésének előírt gyakorisága;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(e)',
  'e) az alkalmazandó műszaki előírások, beleértve a szabványokat, valamint – amennyiben a vonatkozó harmonizált szabványokat nem alkalmazzák teljes mértékben, vagy azok nem terjednek ki a 2. szakaszban meghatározott valamennyi releváns követelményre – az annak biztosítására szolgáló eszközök, hogy a nagy kockázatú MI-rendszer megfeleljen az említett követelményeknek;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(f)',
  'f) adatgazdálkodási rendszerek és eljárások, beleértve az adatszerzést, az adatgyűjtést, az adatelemzést, az adatcímkézést, az adattárolást, az adatszűrést, az adatbányászatot, az adatösszesítést, az adatmegőrzést és a nagy kockázatú MI-rendszerek forgalomba hozatala vagy üzembe helyezése előtt és céljából végzett bármely más, az adatokkal kapcsolatos műveletet;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(g)',
  'g) a 9. cikkben említett kockázatkezelési rendszer;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(h)',
  'h) a 72. cikkel összhangban a forgalomba hozatal utáni nyomonkövetési rendszer kidolgozása, végrehajtása és fenntartása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(i)',
  'i) a 73. cikkel összhangban a súlyos váratlan események bejelentésével kapcsolatos eljárások;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(j)',
  'j) az illetékes nemzeti hatóságokkal, egyéb releváns – többek között az adatokhoz való hozzáférést biztosító vagy támogató – hatóságokkal, a bejelentett szervezetekkel, más gazdasági szereplőkkel, ügyfelekkel vagy más érdekelt felekkel folytatott kommunikáció kezelése;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(k)',
  'k) valamennyi releváns dokumentáció és információ nyilvántartására szolgáló rendszerek és eljárások;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(l)',
  'l) erőforrás-gazdálkodás, beleértve az ellátás biztonságával kapcsolatos intézkedéseket;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '1(m)',
  'm) elszámoltathatósági keret, amely meghatározza a vezetőség és az egyéb személyzet felelősségi körét az e bekezdésben felsorolt valamennyi szempont tekintetében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '2',
  '(2) Az (1) bekezdésben említett szempontok megvalósításának arányosnak kell lennie a szolgáltató szervezetének méretével. A szolgáltatóknak minden esetben tiszteletben kell tartaniuk a nagy kockázatú MI-rendszereik e rendeletnek való megfelelésének biztosításához szükséges szigorúsági mértéket és védelmi szintet.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '3',
  '(3) A nagy kockázatú MI-rendszerek azon szolgáltatói, amelyek a minőségirányítási rendszerekre vagy a releváns ágazati uniós jog szerinti valamely egyenértékű funkcióra vonatkozó kötelezettségek hatálya alá tartoznak, az (1) bekezdésben felsorolt szempontokat az említett jog alapján létrehozott minőségirányítási rendszerek részévé tehetik.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '17',
  '4',
  '(4) Azon szolgáltatók esetében, amelyek a pénzügyi szolgáltatásokra vonatkozó uniós jog értelmében a belső irányításukra, rendszerükre vagy eljárásaikra vonatkozó követelmények hatálya alá tartozó pénzügyi intézmények, az e cikk (1) bekezdésének g), h) és i) pontja kivételével a minőségirányítási rendszer létrehozására vonatkozó kötelezettséget a pénzügyi szolgáltatásokra vonatkozó uniós jog szerinti, belső irányítási rendszerekre vagy eljárásokra vonatkozó szabályoknak való megfeleléssel teljesítettnek kell tekinteni. E célból figyelembe kell venni a 40. cikkben említett harmonizált szabványokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_17'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '18',
  null,
  'A dokumentáció vezetése
(1) A szolgáltatónak a nagy kockázatú MI-rendszer forgalomba hozatala vagy üzembe helyezése után 10 évig az illetékes nemzeti hatóságok számára elérhetővé kell tennie a következőket:

a)

a 11. cikkben említett műszaki dokumentáció;

b)

a 17. cikkben említett minőségirányítási rendszerre vonatkozó dokumentáció;

c)

adott esetben a bejelentett szervezetek által jóváhagyott változtatások dokumentációja;

d)

adott esetben a bejelentett szervezetek által kiadott határozatok és egyéb dokumentumok;

e)

a 47. cikkben említett EU-megfelelőségi nyilatkozat.

(2) Minden tagállam meghatározza azon feltételeket, amelyek mellett az (1) bekezdésben említett dokumentáció az említett bekezdésben megjelölt ideig továbbra is az illetékes nemzeti hatóságok rendelkezésére áll azokban az esetekben, amikor a szolgáltató vagy a területén letelepedett meghatalmazott képviselője az említett időszak vége előtt csődbe megy vagy beszünteti tevékenységét.

(3) Azon szolgáltatóknak, amelyek a pénzügyi szolgáltatásokra vonatkozó uniós jog értelmében a belső irányításukra, rendszerükre vagy eljárásaikra vonatkozó követelmények hatálya alá tartozó pénzügyi intézmények, a technikai dokumentációt a pénzügyi szolgáltatásokra vonatkozó uniós jog alapján vezetett dokumentáció részeként kell megőrizniük.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '18',
  '1',
  '(1) A szolgáltatónak a nagy kockázatú MI-rendszer forgalomba hozatala vagy üzembe helyezése után 10 évig az illetékes nemzeti hatóságok számára elérhetővé kell tennie a következőket:

a)

a 11. cikkben említett műszaki dokumentáció;

b)

a 17. cikkben említett minőségirányítási rendszerre vonatkozó dokumentáció;

c)

adott esetben a bejelentett szervezetek által jóváhagyott változtatások dokumentációja;

d)

adott esetben a bejelentett szervezetek által kiadott határozatok és egyéb dokumentumok;

e)

a 47. cikkben említett EU-megfelelőségi nyilatkozat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '18',
  '1(a)',
  'a) a 11. cikkben említett műszaki dokumentáció;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '18',
  '1(b)',
  'b) a 17. cikkben említett minőségirányítási rendszerre vonatkozó dokumentáció;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '18',
  '1(c)',
  'c) adott esetben a bejelentett szervezetek által jóváhagyott változtatások dokumentációja;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '18',
  '1(d)',
  'd) adott esetben a bejelentett szervezetek által kiadott határozatok és egyéb dokumentumok;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '18',
  '1(e)',
  'e) a 47. cikkben említett EU-megfelelőségi nyilatkozat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '18',
  '2',
  '(2) Minden tagállam meghatározza azon feltételeket, amelyek mellett az (1) bekezdésben említett dokumentáció az említett bekezdésben megjelölt ideig továbbra is az illetékes nemzeti hatóságok rendelkezésére áll azokban az esetekben, amikor a szolgáltató vagy a területén letelepedett meghatalmazott képviselője az említett időszak vége előtt csődbe megy vagy beszünteti tevékenységét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '18',
  '3',
  '(3) Azon szolgáltatóknak, amelyek a pénzügyi szolgáltatásokra vonatkozó uniós jog értelmében a belső irányításukra, rendszerükre vagy eljárásaikra vonatkozó követelmények hatálya alá tartozó pénzügyi intézmények, a technikai dokumentációt a pénzügyi szolgáltatásokra vonatkozó uniós jog alapján vezetett dokumentáció részeként kell megőrizniük.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_18'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '19',
  null,
  'Automatikusan generált naplók
(1) A nagy kockázatú MI-rendszerek szolgáltatóinak meg kell őrizniük az adott nagy kockázatú MI-rendszereik által automatikusan generált, a 12. cikk (1) bekezdésében említett naplókat, amennyiben az ilyen naplók ellenőrzésük alatt állnak. A naplókat – az alkalmazandó uniós vagy nemzeti jog sérelme nélkül – a nagy kockázatú MI-rendszer rendeltetésének megfelelő – legalább hat hónapos – időtartamig kell megőrizni, kivéve, ha az alkalmazandó uniós vagy nemzeti jog, különösen a személyes adatok védelmére vonatkozó uniós jog másként rendelkezik.

(2) Azon szolgáltatóknak, amelyek a pénzügyi szolgáltatásokra vonatkozó uniós jog értelmében a belső irányításukra, rendszerükre vagy eljárásaikra vonatkozó követelmények hatálya alá tartozó pénzügyi intézmények, a pénzügyi szolgáltatásokra vonatkozó releváns jogszabályok alapján vezetett dokumentáció részeként meg kell őrizniük a nagy kockázatú MI-rendszereik által automatikusan generált naplókat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_19'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '19',
  '1',
  '(1) A nagy kockázatú MI-rendszerek szolgáltatóinak meg kell őrizniük az adott nagy kockázatú MI-rendszereik által automatikusan generált, a 12. cikk (1) bekezdésében említett naplókat, amennyiben az ilyen naplók ellenőrzésük alatt állnak. A naplókat – az alkalmazandó uniós vagy nemzeti jog sérelme nélkül – a nagy kockázatú MI-rendszer rendeltetésének megfelelő – legalább hat hónapos – időtartamig kell megőrizni, kivéve, ha az alkalmazandó uniós vagy nemzeti jog, különösen a személyes adatok védelmére vonatkozó uniós jog másként rendelkezik.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_19'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '19',
  '2',
  '(2) Azon szolgáltatóknak, amelyek a pénzügyi szolgáltatásokra vonatkozó uniós jog értelmében a belső irányításukra, rendszerükre vagy eljárásaikra vonatkozó követelmények hatálya alá tartozó pénzügyi intézmények, a pénzügyi szolgáltatásokra vonatkozó releváns jogszabályok alapján vezetett dokumentáció részeként meg kell őrizniük a nagy kockázatú MI-rendszereik által automatikusan generált naplókat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_19'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '20',
  null,
  'Korrekciós intézkedések és tájékoztatási kötelezettség
(1) A nagy kockázatú MI-rendszerek azon szolgáltatóinak, amelyek úgy ítélik meg, vagy okuk van úgy megítélni, hogy az általuk forgalomba hozott vagy üzembe helyezett nagy kockázatú MI-rendszer nem felel meg e rendeletnek, azonnal meg kell hozniuk a szükséges korrekciós intézkedéseket az említett rendszer – adott esetben – megfelelőségének biztosítására, forgalomból való kivonására, üzemen kívül helyezésére vagy visszahívására. Ennek megfelelően tájékoztatniuk kell az érintett nagy kockázatú MI-rendszer forgalmazóit, valamint adott esetben az alkalmazókat, a meghatalmazott képviselőt és az importőröket.

(2) Amennyiben a nagy kockázatú MI-rendszer a 79. cikk (1) bekezdése értelmében kockázatot jelent, és ez a kockázat a rendszer szolgáltatójának a tudomására jut, a szolgáltatónak haladéktalanul ki kell vizsgálnia az okokat, adott esetben a bejelentést tevő alkalmazóval együttműködve, valamint tájékoztatnia kell – különösen a meg nem felelés és a meghozott releváns korrekciós intézkedések jellegéről – az érintett nagy kockázatú MI-rendszerért felelős piacfelügyeleti hatóságokat és adott esetben azon bejelentett szervezetet, amely az adott nagy kockázatú MI-rendszerre a 44. cikknek megfelelően tanúsítványt adott ki.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_20'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '20',
  '1',
  '(1) A nagy kockázatú MI-rendszerek azon szolgáltatóinak, amelyek úgy ítélik meg, vagy okuk van úgy megítélni, hogy az általuk forgalomba hozott vagy üzembe helyezett nagy kockázatú MI-rendszer nem felel meg e rendeletnek, azonnal meg kell hozniuk a szükséges korrekciós intézkedéseket az említett rendszer – adott esetben – megfelelőségének biztosítására, forgalomból való kivonására, üzemen kívül helyezésére vagy visszahívására. Ennek megfelelően tájékoztatniuk kell az érintett nagy kockázatú MI-rendszer forgalmazóit, valamint adott esetben az alkalmazókat, a meghatalmazott képviselőt és az importőröket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_20'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '20',
  '2',
  '(2) Amennyiben a nagy kockázatú MI-rendszer a 79. cikk (1) bekezdése értelmében kockázatot jelent, és ez a kockázat a rendszer szolgáltatójának a tudomására jut, a szolgáltatónak haladéktalanul ki kell vizsgálnia az okokat, adott esetben a bejelentést tevő alkalmazóval együttműködve, valamint tájékoztatnia kell – különösen a meg nem felelés és a meghozott releváns korrekciós intézkedések jellegéről – az érintett nagy kockázatú MI-rendszerért felelős piacfelügyeleti hatóságokat és adott esetben azon bejelentett szervezetet, amely az adott nagy kockázatú MI-rendszerre a 44. cikknek megfelelően tanúsítványt adott ki.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_20'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '21',
  null,
  'Együttműködés az illetékes hatóságokkal
(1) A nagy kockázatú MI-rendszerek szolgáltatóinak valamely illetékes hatóság indokolt kérésére, az Unió intézményeinek egyik hivatalos, az érintett tagállam által megjelölt és az adott hatóság által könnyen érthető nyelvén át kell adniuk az említett hatóság részére minden olyan információt és dokumentációt, amely szükséges annak igazolásához, hogy a nagy kockázatú MI-rendszer megfelel a 2. szakaszban meghatározott követelményeknek.

(2) Valamely illetékes hatóság indokolt kérésére a szolgáltatóknak adott esetben hozzáférést kell biztosítaniuk a megkereső illetékes hatóság számára a 12. cikk (1) bekezdésében említett nagy kockázatú MI-rendszer automatikusan generált naplóihoz is, amennyiben ezek a naplók az ellenőrzésük alatt állnak.

(3) Az illetékes hatóságok által e cikk alapján megszerzett információkat a 78. cikkben meghatározott titoktartási kötelezettségeknek megfelelően kell kezelni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_21'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '21',
  '1',
  '(1) A nagy kockázatú MI-rendszerek szolgáltatóinak valamely illetékes hatóság indokolt kérésére, az Unió intézményeinek egyik hivatalos, az érintett tagállam által megjelölt és az adott hatóság által könnyen érthető nyelvén át kell adniuk az említett hatóság részére minden olyan információt és dokumentációt, amely szükséges annak igazolásához, hogy a nagy kockázatú MI-rendszer megfelel a 2. szakaszban meghatározott követelményeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_21'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '21',
  '2',
  '(2) Valamely illetékes hatóság indokolt kérésére a szolgáltatóknak adott esetben hozzáférést kell biztosítaniuk a megkereső illetékes hatóság számára a 12. cikk (1) bekezdésében említett nagy kockázatú MI-rendszer automatikusan generált naplóihoz is, amennyiben ezek a naplók az ellenőrzésük alatt állnak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_21'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '21',
  '3',
  '(3) Az illetékes hatóságok által e cikk alapján megszerzett információkat a 78. cikkben meghatározott titoktartási kötelezettségeknek megfelelően kell kezelni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_21'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '22',
  null,
  'A nagy kockázatú MI-rendszerek meghatalmazott képviselői
(1) A nagy kockázatú MI-rendszereiknek az Unió piacán való forgalmazását megelőzően a harmadik országokban letelepedett szolgáltatóknak írásbeli megbízással ki kell nevezniük egy, az Unióban letelepedett meghatalmazott képviselőt.

(2) A szolgáltatónak lehetővé kell tennie a meghatalmazott képviselője számára, hogy elvégezze a szolgáltatótól kapott megbízásban meghatározott feladatokat.

(3) A meghatalmazott képviselőknek el kell ellátniuk a szolgáltatótól kapott megbízásban meghatározott feladatokat. A megbízás egy példányát kérésre a piacfelügyeleti hatóságok rendelkezésére kell bocsátaniuk az Unió intézményeinek egyik hivatalos, az illetékes hatóság által megjelölt nyelvén. E rendelet alkalmazása céljából a megbízásban fel kell hatalmazni a meghatalmazott képviselőt a következő feladatok elvégzésére:

a)

annak ellenőrzése, hogy elkészült-e a 47. cikkben említett EU-megfelelőségi nyilatkozat és a 11. cikkben említett műszaki dokumentáció, valamint hogy a szolgáltató elvégzett-e egy megfelelő megfelelőségértékelési eljárást;

b)

a nagy kockázatú MI-rendszer forgalomba hozatalát vagy üzembe helyezését követő tízéves időtartamra az illetékes hatóságok és a 74. cikk (10) bekezdésében említett nemzeti hatóságok vagy szervek számára a következők elérhetővé tétele: azon szolgáltató elérhetőségei, aki vagy amely kinevezte a meghatalmazott képviselőt, a 47. cikkben említett EU-megfelelőségi nyilatkozat egy példánya, a műszaki dokumentáció és adott esetben a bejelentett szervezet által kiadott tanúsítvány;

c)

indokolt kérésre az annak igazolásához szükséges minden információnak és dokumentációnak – beleértve az ezen albekezdés b) pontjában említetteket is – az illetékes hatóság rendelkezésére bocsátása, hogy a nagy kockázatú MI-rendszer megfelel a 2. szakaszban foglalt követelményeknek, ideértve a nagy kockázatú MI-rendszer által automatikusan generált, a 12. cikk (1) bekezdésében említett naplókhoz való hozzáférést is, amennyiben az ilyen naplók a szolgáltató ellenőrzése alatt állnak;

d)

indokolt kérésre együttműködés az illetékes hatóságokkal a nagy kockázatú MI-rendszerrel kapcsolatban – különösen a nagy kockázatú MI-rendszer jelentette kockázatok csökkentését és enyhítését illetően – e hatóságok által tett bármely intézkedés tekintetében;

e)

adott esetben a 49. cikk (1) bekezdésében említett nyilvántartásba vételi kötelezettségek teljesítése, vagy – ha a nyilvántartásba vételt maga a szolgáltató végzi – a VIII. melléklet A. szakaszának 3. pontjában említett információk helyességének biztosítása.

A megbízásban fel kell hatalmazni a meghatalmazott képviselőt arra, hogy az illetékes hatóságok hozzá forduljanak – a szolgáltató mellett vagy helyett – az e rendeletnek való megfelelés biztosításával kapcsolatos minden kérdést illetően.

(4) A meghatalmazott képviselőnek meg kell szüntetnie a megbízást, ha úgy ítéli meg, vagy oka van úgy megítélni, hogy a szolgáltató az e rendelet szerinti kötelezettségeivel ellentétesen jár el. Ilyen esetben a megbízás megszüntetéséről és annak okairól haladéktalanul tájékoztatnia kell a releváns piacfelügyeleti hatóságot és adott esetben a releváns bejelentett szervezetet is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '22',
  '1',
  '(1) A nagy kockázatú MI-rendszereiknek az Unió piacán való forgalmazását megelőzően a harmadik országokban letelepedett szolgáltatóknak írásbeli megbízással ki kell nevezniük egy, az Unióban letelepedett meghatalmazott képviselőt.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '22',
  '2',
  '(2) A szolgáltatónak lehetővé kell tennie a meghatalmazott képviselője számára, hogy elvégezze a szolgáltatótól kapott megbízásban meghatározott feladatokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '22',
  '3',
  '(3) A meghatalmazott képviselőknek el kell ellátniuk a szolgáltatótól kapott megbízásban meghatározott feladatokat. A megbízás egy példányát kérésre a piacfelügyeleti hatóságok rendelkezésére kell bocsátaniuk az Unió intézményeinek egyik hivatalos, az illetékes hatóság által megjelölt nyelvén. E rendelet alkalmazása céljából a megbízásban fel kell hatalmazni a meghatalmazott képviselőt a következő feladatok elvégzésére:

a)

annak ellenőrzése, hogy elkészült-e a 47. cikkben említett EU-megfelelőségi nyilatkozat és a 11. cikkben említett műszaki dokumentáció, valamint hogy a szolgáltató elvégzett-e egy megfelelő megfelelőségértékelési eljárást;

b)

a nagy kockázatú MI-rendszer forgalomba hozatalát vagy üzembe helyezését követő tízéves időtartamra az illetékes hatóságok és a 74. cikk (10) bekezdésében említett nemzeti hatóságok vagy szervek számára a következők elérhetővé tétele: azon szolgáltató elérhetőségei, aki vagy amely kinevezte a meghatalmazott képviselőt, a 47. cikkben említett EU-megfelelőségi nyilatkozat egy példánya, a műszaki dokumentáció és adott esetben a bejelentett szervezet által kiadott tanúsítvány;

c)

indokolt kérésre az annak igazolásához szükséges minden információnak és dokumentációnak – beleértve az ezen albekezdés b) pontjában említetteket is – az illetékes hatóság rendelkezésére bocsátása, hogy a nagy kockázatú MI-rendszer megfelel a 2. szakaszban foglalt követelményeknek, ideértve a nagy kockázatú MI-rendszer által automatikusan generált, a 12. cikk (1) bekezdésében említett naplókhoz való hozzáférést is, amennyiben az ilyen naplók a szolgáltató ellenőrzése alatt állnak;

d)

indokolt kérésre együttműködés az illetékes hatóságokkal a nagy kockázatú MI-rendszerrel kapcsolatban – különösen a nagy kockázatú MI-rendszer jelentette kockázatok csökkentését és enyhítését illetően – e hatóságok által tett bármely intézkedés tekintetében;

e)

adott esetben a 49. cikk (1) bekezdésében említett nyilvántartásba vételi kötelezettségek teljesítése, vagy – ha a nyilvántartásba vételt maga a szolgáltató végzi – a VIII. melléklet A. szakaszának 3. pontjában említett információk helyességének biztosítása.

A megbízásban fel kell hatalmazni a meghatalmazott képviselőt arra, hogy az illetékes hatóságok hozzá forduljanak – a szolgáltató mellett vagy helyett – az e rendeletnek való megfelelés biztosításával kapcsolatos minden kérdést illetően.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '22',
  '3(a)',
  'a) annak ellenőrzése, hogy elkészült-e a 47. cikkben említett EU-megfelelőségi nyilatkozat és a 11. cikkben említett műszaki dokumentáció, valamint hogy a szolgáltató elvégzett-e egy megfelelő megfelelőségértékelési eljárást;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '22',
  '3(b)',
  'b) a nagy kockázatú MI-rendszer forgalomba hozatalát vagy üzembe helyezését követő tízéves időtartamra az illetékes hatóságok és a 74. cikk (10) bekezdésében említett nemzeti hatóságok vagy szervek számára a következők elérhetővé tétele: azon szolgáltató elérhetőségei, aki vagy amely kinevezte a meghatalmazott képviselőt, a 47. cikkben említett EU-megfelelőségi nyilatkozat egy példánya, a műszaki dokumentáció és adott esetben a bejelentett szervezet által kiadott tanúsítvány;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '22',
  '3(c)',
  'c) indokolt kérésre az annak igazolásához szükséges minden információnak és dokumentációnak – beleértve az ezen albekezdés b) pontjában említetteket is – az illetékes hatóság rendelkezésére bocsátása, hogy a nagy kockázatú MI-rendszer megfelel a 2. szakaszban foglalt követelményeknek, ideértve a nagy kockázatú MI-rendszer által automatikusan generált, a 12. cikk (1) bekezdésében említett naplókhoz való hozzáférést is, amennyiben az ilyen naplók a szolgáltató ellenőrzése alatt állnak;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '22',
  '3(d)',
  'd) indokolt kérésre együttműködés az illetékes hatóságokkal a nagy kockázatú MI-rendszerrel kapcsolatban – különösen a nagy kockázatú MI-rendszer jelentette kockázatok csökkentését és enyhítését illetően – e hatóságok által tett bármely intézkedés tekintetében;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '22',
  '3(e)',
  'e) adott esetben a 49. cikk (1) bekezdésében említett nyilvántartásba vételi kötelezettségek teljesítése, vagy – ha a nyilvántartásba vételt maga a szolgáltató végzi – a VIII. melléklet A. szakaszának 3. pontjában említett információk helyességének biztosítása.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '22',
  '4',
  '(4) A meghatalmazott képviselőnek meg kell szüntetnie a megbízást, ha úgy ítéli meg, vagy oka van úgy megítélni, hogy a szolgáltató az e rendelet szerinti kötelezettségeivel ellentétesen jár el. Ilyen esetben a megbízás megszüntetéséről és annak okairól haladéktalanul tájékoztatnia kell a releváns piacfelügyeleti hatóságot és adott esetben a releváns bejelentett szervezetet is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_22'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '23',
  null,
  'Az importőrök kötelezettségei
(1) Valamely nagy kockázatú MI-rendszer forgalomba hozatala előtt az importőröknek biztosítaniuk kell, hogy a rendszer megfeleljen e rendeletnek a következők ellenőrzésével:

a)

a nagy kockázatú MI-rendszer szolgáltatója elvégezte a 43. cikkben említett releváns megfelelőségértékelési eljárást;

b)

a szolgáltató elkészítette a műszaki dokumentációt a 11. cikknek és a IV. mellékletnek megfelelően;

c)

a rendszeren feltüntették az előírt CE-jelölést, valamint mellékelték ahhoz a 47. cikkben említett EU-megfelelőségi nyilatkozatot és a használati utasítást;

d)

a szolgáltató kinevezett egy meghatalmazott képviselőt a 22. cikk (1) bekezdésének megfelelően.

(2) Amennyiben az importőrnek elegendő oka van úgy megítélni, hogy valamely nagy kockázatú MI-rendszer nem felel meg e rendeletnek, vagy azt hamisították, vagy hamisított dokumentációval rendelkezik, addig nem hozhatja forgalomba a rendszert, amíg annak megfelelőségét nem biztosították. Amennyiben a nagy kockázatú MI-rendszer a 79. cikk (1) bekezdése értelmében kockázatot jelent, az importőrnek erről tájékoztatnia kell a rendszer szolgáltatóját, a meghatalmazott képviselőket és a piacfelügyeleti hatóságokat.

(3) Az importőröknek fel kell tüntetniük a nagy kockázatú MI-rendszeren és annak csomagolásán vagy adott esetben a kísérő dokumentációján a nevüket, bejegyzett kereskedelmi nevüket vagy bejegyzett védjegyüket, valamint azon címet, amelyen velük a nagy kockázatú MI-rendszert illetően kapcsolatba lehet lépni.

(4) Az importőröknek biztosítaniuk kell, hogy mindaddig, amíg ők felelnek egy nagy kockázatú MI-rendszerért, adott esetben a tárolási vagy szállítási feltételek ne veszélyeztessék a rendszer 2. szakaszban foglalt követelményeknek való megfelelőségét.

(5) Az importőröknek a nagy kockázatú MI-rendszer forgalomba hozatalát vagy üzembe helyezését követő tízéves időtartamig meg kell őrizniük a bejelentett szervezet által kiállított tanúsítvány, adott esetben a használati utasítás és a 47. cikkben említett EU-megfelelőségi nyilatkozat egy-egy példányát.

(6) Az importőröknek indokolt kérésre a releváns illetékes hatóságok rendelkezésére kell bocsátaniuk minden, annak igazolásához szükséges információt és dokumentációt – ideértve az (5) bekezdésben említetteket is –, hogy a nagy kockázatú MI-rendszer megfelel a 2. szakaszban foglalt követelményeknek, az adott illetékes nemzeti hatóság számára könnyen érthető nyelven. E célból az importőröknek biztosítaniuk kell azt is, hogy a műszaki dokumentációt az említett hatóságok rendelkezésére lehessen bocsátani.

(7) Az importőröknek együtt kell működniük a releváns illetékes nemzeti hatóságokkal minden olyan intézkedés tekintetében, amelyet az említett hatóságok hoznak egy olyan nagy kockázatú MI-rendszerrel kapcsolatban – különösen az általa jelentett kockázatok csökkentése és enyhítése érdekében –, amelyet az importőrök hoztak forgalomba.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '23',
  '1',
  '(1) Valamely nagy kockázatú MI-rendszer forgalomba hozatala előtt az importőröknek biztosítaniuk kell, hogy a rendszer megfeleljen e rendeletnek a következők ellenőrzésével:

a)

a nagy kockázatú MI-rendszer szolgáltatója elvégezte a 43. cikkben említett releváns megfelelőségértékelési eljárást;

b)

a szolgáltató elkészítette a műszaki dokumentációt a 11. cikknek és a IV. mellékletnek megfelelően;

c)

a rendszeren feltüntették az előírt CE-jelölést, valamint mellékelték ahhoz a 47. cikkben említett EU-megfelelőségi nyilatkozatot és a használati utasítást;

d)

a szolgáltató kinevezett egy meghatalmazott képviselőt a 22. cikk (1) bekezdésének megfelelően.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '23',
  '1(a)',
  'a) a nagy kockázatú MI-rendszer szolgáltatója elvégezte a 43. cikkben említett releváns megfelelőségértékelési eljárást;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '23',
  '1(b)',
  'b) a szolgáltató elkészítette a műszaki dokumentációt a 11. cikknek és a IV. mellékletnek megfelelően;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '23',
  '1(c)',
  'c) a rendszeren feltüntették az előírt CE-jelölést, valamint mellékelték ahhoz a 47. cikkben említett EU-megfelelőségi nyilatkozatot és a használati utasítást;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '23',
  '1(d)',
  'd) a szolgáltató kinevezett egy meghatalmazott képviselőt a 22. cikk (1) bekezdésének megfelelően.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '23',
  '2',
  '(2) Amennyiben az importőrnek elegendő oka van úgy megítélni, hogy valamely nagy kockázatú MI-rendszer nem felel meg e rendeletnek, vagy azt hamisították, vagy hamisított dokumentációval rendelkezik, addig nem hozhatja forgalomba a rendszert, amíg annak megfelelőségét nem biztosították. Amennyiben a nagy kockázatú MI-rendszer a 79. cikk (1) bekezdése értelmében kockázatot jelent, az importőrnek erről tájékoztatnia kell a rendszer szolgáltatóját, a meghatalmazott képviselőket és a piacfelügyeleti hatóságokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '23',
  '3',
  '(3) Az importőröknek fel kell tüntetniük a nagy kockázatú MI-rendszeren és annak csomagolásán vagy adott esetben a kísérő dokumentációján a nevüket, bejegyzett kereskedelmi nevüket vagy bejegyzett védjegyüket, valamint azon címet, amelyen velük a nagy kockázatú MI-rendszert illetően kapcsolatba lehet lépni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '23',
  '4',
  '(4) Az importőröknek biztosítaniuk kell, hogy mindaddig, amíg ők felelnek egy nagy kockázatú MI-rendszerért, adott esetben a tárolási vagy szállítási feltételek ne veszélyeztessék a rendszer 2. szakaszban foglalt követelményeknek való megfelelőségét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '23',
  '5',
  '(5) Az importőröknek a nagy kockázatú MI-rendszer forgalomba hozatalát vagy üzembe helyezését követő tízéves időtartamig meg kell őrizniük a bejelentett szervezet által kiállított tanúsítvány, adott esetben a használati utasítás és a 47. cikkben említett EU-megfelelőségi nyilatkozat egy-egy példányát.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '23',
  '6',
  '(6) Az importőröknek indokolt kérésre a releváns illetékes hatóságok rendelkezésére kell bocsátaniuk minden, annak igazolásához szükséges információt és dokumentációt – ideértve az (5) bekezdésben említetteket is –, hogy a nagy kockázatú MI-rendszer megfelel a 2. szakaszban foglalt követelményeknek, az adott illetékes nemzeti hatóság számára könnyen érthető nyelven. E célból az importőröknek biztosítaniuk kell azt is, hogy a műszaki dokumentációt az említett hatóságok rendelkezésére lehessen bocsátani.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '23',
  '7',
  '(7) Az importőröknek együtt kell működniük a releváns illetékes nemzeti hatóságokkal minden olyan intézkedés tekintetében, amelyet az említett hatóságok hoznak egy olyan nagy kockázatú MI-rendszerrel kapcsolatban – különösen az általa jelentett kockázatok csökkentése és enyhítése érdekében –, amelyet az importőrök hoztak forgalomba.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_23'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '24',
  null,
  'A forgalmazók kötelezettségei
(1) Valamely nagy kockázatú MI-rendszer forgalmazását megelőzően a forgalmazóknak ellenőrizniük kell, hogy a nagy kockázatú MI-rendszeren fel van-e tüntetve az előírt CE- jelölés, mellékelték-e ahhoz a 47. cikkben említett EU-megfelelőségi nyilatkozat egy példányát és a használati utasítást, valamint hogy az említett rendszer szolgáltatója, illetve – adott esetben – importőre teljesítette-e a 16. cikk b) és c) pontjában, illetve a 23. cikk (3) bekezdésében foglalt kötelezettségeit.

(2) Amennyiben a forgalmazó a birtokában lévő információk alapján úgy ítéli meg, vagy oka van úgy megítélni, hogy egy nagy kockázatú MI-rendszer nem felel meg a 2. szakaszban meghatározott követelményeknek, nem forgalmazhatja a nagy kockázatú MI-rendszert mindaddig, amíg a rendszert nem hozták összhangba az említett követelményekkel. Továbbá, amennyiben a nagy kockázatú MI-rendszer a 79. cikk (1) bekezdése értelmében kockázatot jelent, a forgalmazónak erről tájékoztatnia kell a rendszer szolgáltatóját vagy adott esetben importőrét.

(3) A forgalmazóknak biztosítaniuk kell, hogy mindaddig, amíg ők felelnek a nagy kockázatú MI-rendszerért, adott esetben a tárolási vagy szállítási feltételek ne veszélyeztessék a rendszer 2. szakaszban foglalt követelményeknek való megfelelőségét.

(4) Azon forgalmazónak, amely a birtokában lévő információk alapján úgy ítéli meg, vagy oka van úgy megítélni, hogy az általa forgalmazott nagy kockázatú MI-rendszer nem felel meg a 2. szakaszban foglalt követelményeknek, meg kell tennie a szükséges korrekciós intézkedéseket ahhoz, hogy a rendszert összhangba hozza az említett követelményekkel, kivonja a forgalomból vagy visszahívja, vagy biztosítania kell, hogy a szolgáltató, az importőr vagy adott esetben bármely érintett üzemeltető megtegye az említett korrekciós intézkedéseket. Amennyiben a nagy kockázatú MI-rendszer a 79. cikk (1) bekezdése értelmében kockázatot jelent, a forgalmazónak erről haladéktalanul tájékoztatnia kell a rendszer szolgáltatóját vagy importőrét, és az érintett nagy kockázatú MI-rendszerért felelős hatóságokat, részletezve különösen a meg nem felelést és a meghozott korrekciós intézkedéseket.

(5) Valamely releváns illetékes nemzeti hatóság indokolt kérésére a nagy kockázatú MI-rendszerek forgalmazóinak az említett hatóság rendelkezésére kell bocsátaniuk az (1)–(4) bekezdés szerinti tevékenységeikre vonatkozó valamennyi olyan információt és dokumentációt, amely szükséges annak igazolásához, hogy az említett rendszer megfelel a 2. szakaszban meghatározott követelményeknek.

(6) A forgalmazóknak együtt kell működniük a releváns illetékes hatóságokkal minden olyan intézkedés tekintetében, amelyet az említett hatóságok hoznak egy olyan nagy kockázatú MI-rendszerrel kapcsolatban – különösen az általa jelentett kockázat csökkentése vagy enyhítése érdekében –, amelyet a forgalmazók forgalmaznak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_24'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '24',
  '1',
  '(1) Valamely nagy kockázatú MI-rendszer forgalmazását megelőzően a forgalmazóknak ellenőrizniük kell, hogy a nagy kockázatú MI-rendszeren fel van-e tüntetve az előírt CE- jelölés, mellékelték-e ahhoz a 47. cikkben említett EU-megfelelőségi nyilatkozat egy példányát és a használati utasítást, valamint hogy az említett rendszer szolgáltatója, illetve – adott esetben – importőre teljesítette-e a 16. cikk b) és c) pontjában, illetve a 23. cikk (3) bekezdésében foglalt kötelezettségeit.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_24'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '24',
  '2',
  '(2) Amennyiben a forgalmazó a birtokában lévő információk alapján úgy ítéli meg, vagy oka van úgy megítélni, hogy egy nagy kockázatú MI-rendszer nem felel meg a 2. szakaszban meghatározott követelményeknek, nem forgalmazhatja a nagy kockázatú MI-rendszert mindaddig, amíg a rendszert nem hozták összhangba az említett követelményekkel. Továbbá, amennyiben a nagy kockázatú MI-rendszer a 79. cikk (1) bekezdése értelmében kockázatot jelent, a forgalmazónak erről tájékoztatnia kell a rendszer szolgáltatóját vagy adott esetben importőrét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_24'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '24',
  '3',
  '(3) A forgalmazóknak biztosítaniuk kell, hogy mindaddig, amíg ők felelnek a nagy kockázatú MI-rendszerért, adott esetben a tárolási vagy szállítási feltételek ne veszélyeztessék a rendszer 2. szakaszban foglalt követelményeknek való megfelelőségét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_24'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '24',
  '4',
  '(4) Azon forgalmazónak, amely a birtokában lévő információk alapján úgy ítéli meg, vagy oka van úgy megítélni, hogy az általa forgalmazott nagy kockázatú MI-rendszer nem felel meg a 2. szakaszban foglalt követelményeknek, meg kell tennie a szükséges korrekciós intézkedéseket ahhoz, hogy a rendszert összhangba hozza az említett követelményekkel, kivonja a forgalomból vagy visszahívja, vagy biztosítania kell, hogy a szolgáltató, az importőr vagy adott esetben bármely érintett üzemeltető megtegye az említett korrekciós intézkedéseket. Amennyiben a nagy kockázatú MI-rendszer a 79. cikk (1) bekezdése értelmében kockázatot jelent, a forgalmazónak erről haladéktalanul tájékoztatnia kell a rendszer szolgáltatóját vagy importőrét, és az érintett nagy kockázatú MI-rendszerért felelős hatóságokat, részletezve különösen a meg nem felelést és a meghozott korrekciós intézkedéseket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_24'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '24',
  '5',
  '(5) Valamely releváns illetékes nemzeti hatóság indokolt kérésére a nagy kockázatú MI-rendszerek forgalmazóinak az említett hatóság rendelkezésére kell bocsátaniuk az (1)–(4) bekezdés szerinti tevékenységeikre vonatkozó valamennyi olyan információt és dokumentációt, amely szükséges annak igazolásához, hogy az említett rendszer megfelel a 2. szakaszban meghatározott követelményeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_24'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '24',
  '6',
  '(6) A forgalmazóknak együtt kell működniük a releváns illetékes hatóságokkal minden olyan intézkedés tekintetében, amelyet az említett hatóságok hoznak egy olyan nagy kockázatú MI-rendszerrel kapcsolatban – különösen az általa jelentett kockázat csökkentése vagy enyhítése érdekében –, amelyet a forgalmazók forgalmaznak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_24'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '25',
  null,
  'Felelősségi körök az MI-értéklánc mentén
(1) E rendelet alkalmazásában minden forgalmazót, importőrt, alkalmazót vagy egyéb harmadik felet nagy kockázatú MI-rendszer szolgáltatójának kell tekinteni, és arra a szolgáltatónak a 16. cikk szerinti kötelezettségei vonatkoznak a következő körülmények bármelyikének esetében:

a)

nevüket vagy védjegyüket egy már forgalomba hozott vagy üzembe helyezett, nagy kockázatú MI-rendszeren helyezik el, olyan szerződéses megállapodások sérelme nélkül, amelyek a kötelezettségek másképp történő megosztását írják elő;

b)

jelentős módosítást hajtanak végre egy már forgalomba hozott vagy már üzembe helyezett nagy kockázatú MI-rendszeren oly módon, hogy az a 6. cikkel összhangban továbbra is nagy kockázatú MI-rendszer marad;

c)

jelentősen módosítják egy olyan MI-rendszer rendeltetését, beleértve az általános célú MI-rendszereket is, amelyet nem minősítettek nagy kockázatúnak, és amelyet már forgalomba hoztak vagy üzembe helyeztek, oly módon, hogy az érintett MI-rendszer a 6. cikkel összhangban nagy kockázatú MI-rendszerré válik;

(2) Amennyiben az (1) bekezdésben említett körülmények fennállnak, az MI-rendszert eredetileg forgalomba hozó vagy üzembe helyező szolgáltató e rendelet alkalmazása céljából többé nem tekinthető az adott konkrét MI-rendszer szolgáltatójának. Az említett eredeti szolgáltatónak szorosan együtt kell működnie az új szolgáltatókkal, és rendelkezésre kell bocsátania a szükséges információkat, valamint biztosítania kell az e rendeletben meghatározott kötelezettségek teljesítéséhez szükséges, észszerűen elvárható technikai hozzáférést és egyéb segítséget, különösen a nagy kockázatú MI-rendszerek megfelelőségértékelésének való megfelelés tekintetében. E bekezdés nem alkalmazandó azokban az esetekben, amikor az eredeti szolgáltató egyértelműen meghatározta, hogy MI-rendszerét nem szabad nagy kockázatú MI-rendszerré alakítani, és ezért az ilyen esetek nem tartoznak a dokumentáció átadására vonatkozó kötelezettség hatálya alá.

(3) Az olyan nagy kockázatú MI-rendszerek esetében, amelyek az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termékek biztonsági alkotórészei, a termék gyártóját kell a nagy kockázatú MI-rendszer szolgáltatójának tekinteni, és annak a 16. cikk szerinti kötelezettségek hatálya alá kell tartoznia a következő körülmények közül bármelyik esetében:

a)

a nagy kockázatú MI-rendszert a termékkel együtt, a termék gyártójának neve vagy védjegye alatt hozzák forgalomba;

b)

a nagy kockázatú MI-rendszert a termék gyártójának neve vagy védjegye alatt helyezik üzembe a termék forgalomba hozatalát követően.

(4) A nagy kockázatú MI-rendszer szolgáltatójának és a nagy kockázatú MI-rendszerben használt vagy abba integrált eszközöket, szolgáltatásokat, alkotóelemeket vagy folyamatokat szállító harmadik félnek írásbeli megállapodás révén, a technika általánosan elismert, mindenkori állása alapján meg kell határoznia a szükséges információkat, képességeket, technikai hozzáférést és egyéb segítséget, annak érdekében, hogy a nagy kockázatú MI-rendszer szolgáltatója teljes mértékben eleget tudjon tenni az e rendeletben foglalt kötelezettségeknek. Ez a bekezdés nem alkalmazandó azon harmadik felekre, akik az általános célú MI-modellektől eltérő eszközöket, szolgáltatásokat, folyamatokat vagy alkotóelemeket szabad és nyílt forráskódú licenc alapján tesznek nyilvánosan hozzáférhetővé.

Az MI-hivatal önkéntes mintafeltételeket dolgozhat ki és ajánlhat a nagy kockázatú MI-rendszerek szolgáltatói és a nagy kockázatú MI-rendszerekhez használt vagy azokba integrált eszközöket, szolgáltatásokat, alkotóelemeket vagy folyamatokat szolgáltató harmadik felek közötti szerződésekre vonatkozóan. Az említett önkéntes mintafeltételek kidolgozása során az MI-hivatalnak figyelembe kell vennie az egyes ágazatokban vagy konkrét üzleti esetekben alkalmazandó lehetséges szerződéses követelményeket. Az önkéntes mintafeltételeket könnyen használható elektronikus formátumban közzé kell tenni és díjmentesen elérhetővé kell tenni.

(5) A (2) és a (3) bekezdés nem sérti azt, hogy a szellemitulajdon-jogokat, a bizalmas üzleti információkat és az üzleti titkokat az uniós és a nemzeti joggal összhangban tiszteletben kell tartani és védeni kell.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '25',
  '1',
  '(1) E rendelet alkalmazásában minden forgalmazót, importőrt, alkalmazót vagy egyéb harmadik felet nagy kockázatú MI-rendszer szolgáltatójának kell tekinteni, és arra a szolgáltatónak a 16. cikk szerinti kötelezettségei vonatkoznak a következő körülmények bármelyikének esetében:

a)

nevüket vagy védjegyüket egy már forgalomba hozott vagy üzembe helyezett, nagy kockázatú MI-rendszeren helyezik el, olyan szerződéses megállapodások sérelme nélkül, amelyek a kötelezettségek másképp történő megosztását írják elő;

b)

jelentős módosítást hajtanak végre egy már forgalomba hozott vagy már üzembe helyezett nagy kockázatú MI-rendszeren oly módon, hogy az a 6. cikkel összhangban továbbra is nagy kockázatú MI-rendszer marad;

c)

jelentősen módosítják egy olyan MI-rendszer rendeltetését, beleértve az általános célú MI-rendszereket is, amelyet nem minősítettek nagy kockázatúnak, és amelyet már forgalomba hoztak vagy üzembe helyeztek, oly módon, hogy az érintett MI-rendszer a 6. cikkel összhangban nagy kockázatú MI-rendszerré válik;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '25',
  '1(a)',
  'a) nevüket vagy védjegyüket egy már forgalomba hozott vagy üzembe helyezett, nagy kockázatú MI-rendszeren helyezik el, olyan szerződéses megállapodások sérelme nélkül, amelyek a kötelezettségek másképp történő megosztását írják elő;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '25',
  '1(b)',
  'b) jelentős módosítást hajtanak végre egy már forgalomba hozott vagy már üzembe helyezett nagy kockázatú MI-rendszeren oly módon, hogy az a 6. cikkel összhangban továbbra is nagy kockázatú MI-rendszer marad;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '25',
  '1(c)',
  'c) jelentősen módosítják egy olyan MI-rendszer rendeltetését, beleértve az általános célú MI-rendszereket is, amelyet nem minősítettek nagy kockázatúnak, és amelyet már forgalomba hoztak vagy üzembe helyeztek, oly módon, hogy az érintett MI-rendszer a 6. cikkel összhangban nagy kockázatú MI-rendszerré válik;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '25',
  '2',
  '(2) Amennyiben az (1) bekezdésben említett körülmények fennállnak, az MI-rendszert eredetileg forgalomba hozó vagy üzembe helyező szolgáltató e rendelet alkalmazása céljából többé nem tekinthető az adott konkrét MI-rendszer szolgáltatójának. Az említett eredeti szolgáltatónak szorosan együtt kell működnie az új szolgáltatókkal, és rendelkezésre kell bocsátania a szükséges információkat, valamint biztosítania kell az e rendeletben meghatározott kötelezettségek teljesítéséhez szükséges, észszerűen elvárható technikai hozzáférést és egyéb segítséget, különösen a nagy kockázatú MI-rendszerek megfelelőségértékelésének való megfelelés tekintetében. E bekezdés nem alkalmazandó azokban az esetekben, amikor az eredeti szolgáltató egyértelműen meghatározta, hogy MI-rendszerét nem szabad nagy kockázatú MI-rendszerré alakítani, és ezért az ilyen esetek nem tartoznak a dokumentáció átadására vonatkozó kötelezettség hatálya alá.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '25',
  '3',
  '(3) Az olyan nagy kockázatú MI-rendszerek esetében, amelyek az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termékek biztonsági alkotórészei, a termék gyártóját kell a nagy kockázatú MI-rendszer szolgáltatójának tekinteni, és annak a 16. cikk szerinti kötelezettségek hatálya alá kell tartoznia a következő körülmények közül bármelyik esetében:

a)

a nagy kockázatú MI-rendszert a termékkel együtt, a termék gyártójának neve vagy védjegye alatt hozzák forgalomba;

b)

a nagy kockázatú MI-rendszert a termék gyártójának neve vagy védjegye alatt helyezik üzembe a termék forgalomba hozatalát követően.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '25',
  '3(a)',
  'a) a nagy kockázatú MI-rendszert a termékkel együtt, a termék gyártójának neve vagy védjegye alatt hozzák forgalomba;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '25',
  '3(b)',
  'b) a nagy kockázatú MI-rendszert a termék gyártójának neve vagy védjegye alatt helyezik üzembe a termék forgalomba hozatalát követően.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '25',
  '4',
  '(4) A nagy kockázatú MI-rendszer szolgáltatójának és a nagy kockázatú MI-rendszerben használt vagy abba integrált eszközöket, szolgáltatásokat, alkotóelemeket vagy folyamatokat szállító harmadik félnek írásbeli megállapodás révén, a technika általánosan elismert, mindenkori állása alapján meg kell határoznia a szükséges információkat, képességeket, technikai hozzáférést és egyéb segítséget, annak érdekében, hogy a nagy kockázatú MI-rendszer szolgáltatója teljes mértékben eleget tudjon tenni az e rendeletben foglalt kötelezettségeknek. Ez a bekezdés nem alkalmazandó azon harmadik felekre, akik az általános célú MI-modellektől eltérő eszközöket, szolgáltatásokat, folyamatokat vagy alkotóelemeket szabad és nyílt forráskódú licenc alapján tesznek nyilvánosan hozzáférhetővé.

Az MI-hivatal önkéntes mintafeltételeket dolgozhat ki és ajánlhat a nagy kockázatú MI-rendszerek szolgáltatói és a nagy kockázatú MI-rendszerekhez használt vagy azokba integrált eszközöket, szolgáltatásokat, alkotóelemeket vagy folyamatokat szolgáltató harmadik felek közötti szerződésekre vonatkozóan. Az említett önkéntes mintafeltételek kidolgozása során az MI-hivatalnak figyelembe kell vennie az egyes ágazatokban vagy konkrét üzleti esetekben alkalmazandó lehetséges szerződéses követelményeket. Az önkéntes mintafeltételeket könnyen használható elektronikus formátumban közzé kell tenni és díjmentesen elérhetővé kell tenni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '25',
  '5',
  '(5) A (2) és a (3) bekezdés nem sérti azt, hogy a szellemitulajdon-jogokat, a bizalmas üzleti információkat és az üzleti titkokat az uniós és a nemzeti joggal összhangban tiszteletben kell tartani és védeni kell.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_25'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  null,
  'A nagy kockázatú MI-rendszerek alkalmazóinak kötelezettségei
(1) A nagy kockázatú MI-rendszerek alkalmazóinak megfelelő technikai és szervezési intézkedéseket kell tenniük annak biztosítására, hogy ezeket a rendszereket a (3) és (6) bekezdés szerint, a rendszerekhez mellékelt használati utasításoknak megfelelően használják.

(2) Az alkalmazóknak az emberi felügyeletet olyan természetes személyekre kell bízniuk, akik rendelkeznek a szükséges szakértelemmel, képzéssel és hatáskörrel, valamint a szükséges támogatással.

(3) Az (1) és a (2) bekezdésben meghatározott kötelezettségek nem sértik az uniós vagy nemzeti jog szerinti egyéb alkalmazói kötelezettségeket, valamint az alkalmazó azon szabadságát, hogy a szolgáltató által megjelölt emberi felügyeleti intézkedések végrehajtása céljából megszervezze saját erőforrásait és tevékenységeit.

(4) Az (1) és a (2) bekezdés sérelme nélkül, amennyiben az alkalmazó ellenőrzést gyakorol a bemeneti adatok felett, ezen alkalmazónak biztosítania kell, hogy a bemeneti adatok relevánsak és kellően reprezentatívak legyenek a nagy kockázatú MI-rendszer rendeltetése szempontjából.

(5) Az alkalmazóknak a használati utasítások alapján nyomon kell követniük a nagy kockázatú MI-rendszer működését, és adott esetben a 72. cikknek megfelelően tájékoztatniuk kell a szolgáltatót. Amennyiben az alkalmazóknak okuk van úgy megítélni, hogy a nagy kockázatú MI-rendszer utasításoknak megfelelő használata azt eredményezheti, hogy az említett MI-rendszer a 79. cikk (1) bekezdésének értelmében vett kockázatot jelent, erről indokolatlan késedelem nélkül tájékoztatniuk kell a szolgáltatót vagy a forgalmazót, valamint a releváns piacfelügyeleti hatóságot, és fel kell függeszteniük az említett rendszer használatát. Amennyiben az alkalmazók súlyos váratlan eseményt azonosítottak, haladéktalanul tájékoztatniuk kell először a szolgáltatót, majd az importőrt vagy a forgalmazót és a releváns piacfelügyeleti hatóságokat is az említett eseményről. Ha az alkalmazó nem tudja elérni a szolgáltatót, a 73. cikket kell értelemszerűen alkalmazni. Ez a kötelezettség nem terjed ki az MI-rendszerek azon alkalmazóinak érzékeny operatív adataira, amelyek bűnüldöző hatóságok.

Azon alkalmazók esetében, amelyek a pénzügyi szolgáltatásokra vonatkozó uniós jog értelmében a belső irányításukra, szabályaikra vagy eljárásaikra vonatkozó követelmények hatálya alá tartozó pénzügyi intézmények, az első albekezdésben meghatározott nyomonkövetési kötelezettséget a pénzügyi szolgáltatásokra vonatkozó releváns jog szerinti, a belső irányítási rendszerekre, eljárásokra és mechanizmusokra vonatkozó szabályoknak való megfeleléssel teljesítettnek kell tekinteni.

(6) A nagy kockázatú MI-rendszerek alkalmazóinak meg kell őrizniük az adott nagy kockázatú MI-rendszer által automatikusan generált naplókat, amennyiben az ilyen naplók az ellenőrzésük alatt állnak a nagy kockázatú MI-rendszer rendeltetésének megfelelő – legalább hat hónapos – időtartamig, kivéve, ha az alkalmazandó uniós vagy nemzeti jog, különösen a személyes adatok védelmére vonatkozó uniós jog másként rendelkezik.

Azon alkalmazóknak, amelyek a pénzügyi szolgáltatásokra vonatkozó uniós jog értelmében a belső irányításukra, szabályaikra vagy eljárásaikra vonatkozó követelmények hatálya alá tartozó pénzügyi intézmények, a naplót a pénzügyi szolgáltatásokra vonatkozó megfelelő uniós jog alapján vezetett dokumentáció részeként kell megőrizniük.

(7) A nagy kockázatú MI-rendszer munkahelyi üzembe helyezése vagy használata előtt azon alkalmazóknak, akik munkáltatók, tájékoztatniuk kell a munkavállalók képviselőit és az érintett munkavállalókat arról, hogy esetükben nagy kockázatú MI-rendszer használatára fog sor kerülni. Ezt a tájékoztatást adott esetben a munkavállalók és képviselőik tájékoztatására vonatkozó uniós és nemzeti jogban és gyakorlatban megállapított szabályokkal és eljárásokkal összhangban kell megadni.

(8) A nagy kockázatú MI-rendszerek alkalmazói, amennyiben azok hatóságok vagy uniós intézmények, szervek, hivatalok vagy ügynökségek, eleget tesznek a 49. cikkben említett nyilvántartási kötelezettségeknek. Amennyiben az ilyen alkalmazók megállapítják, hogy az általuk használni kívánt nagy kockázatú MI-rendszer nincs nyilvántartva a 71. cikkben említett uniós adatbázisban, nem használhatják az adott rendszert, és erről tájékoztatják a szolgáltatót vagy a forgalmazót.

(9) A nagy kockázatú MI-rendszerek alkalmazóinak az e rendelet 13. cikke szerint megadott információkat – adott esetben – arra kell használniuk, hogy eleget tegyenek az (EU) 2016/679 rendelet 35. cikke vagy adott esetben az (EU) 2016/680 irányelv 27. cikke szerinti, adatvédelmi hatásvizsgálat elvégzésére vonatkozó kötelezettségüknek.

(10) Az (EU) 2016/680 irányelv sérelme nélkül, a bűncselekmény elkövetésével gyanúsított vagy a miatt elítélt személyek célzott felkutatására irányuló nyomozás keretében a nem valós idejű távoli biometrikus azonosításra szolgáló, nagy kockázatú MI-rendszert alkalmazó személynek előzetesen vagy indokolatlan késedelem nélkül, de legkésőbb 48 órán belül engedélyt kell kérnie az adott rendszer használatára valamely igazságügyi hatóságtól vagy közigazgatási hatóságtól, amelynek határozata kötelező erejű és bírósági felülvizsgálat tárgyát képezi, kivéve, ha azt egy potenciális gyanúsítottnak a bűncselekményhez közvetlenül kapcsolódó objektív és ellenőrizhető tényeken alapuló kezdeti azonosítására használják. Minden felhasználásnak az adott bűncselekmény nyomozásához feltétlenül szükséges mértékre kell korlátozódnia.

Ha az első albekezdés szerint kérelmezett engedélyt elutasítják, a kért engedélyhez kapcsolódó, nem valós idejű távoli biometrikus azonosító rendszer használatát azonnali hatállyal le kell állítani, és törölni kell az azon nagy kockázatú MI-rendszer használatához kapcsolódó személyes adatokat, amelyre az engedélyt kérték.

Az ilyen, nem valós idejű távoli biometrikus azonosításra szolgáló, nagy kockázatú MI-rendszert semmilyen esetben sem szabad nem célzott módon bűnüldözési célokra használni bűncselekményhez, büntetőeljáráshoz, bűncselekmény tényleges és valós vagy előre látható veszélyéhez vagy egy konkrét eltűnt személy felkutatásához való kapcsolódás nélkül. Biztosítani kell, hogy a bűnüldöző hatóságok ne hozhassanak kizárólag a nem valós idejű távoli biometrikus azonosító rendszer által adott eredmény alapján olyan döntést, amely egy személyre nézve kedvezőtlen joghatással jár.

Ez a bekezdés nem sérti az (EU) 2016/679 rendelet 9. cikkét és az (EU) 2016/680 irányelv 10. cikkét a biometrikus adatok feldolgozása tekintetében.

Az ilyen, nagy kockázatú MI-rendszerek minden egyes használatát a vonatkozó rendőrségi nyilvántartásban – a célra vagy az alkalmazóra való tekintet nélkül – dokumentálni kell, és kérésre az érintett piacfelügyeleti hatóság és a nemzeti adatvédelmi hatóság rendelkezésére kell bocsátani, kivéve a bűnüldözéssel kapcsolatos érzékeny operatív adatok közzétételét. Ez az albekezdés nem sérti az (EU) 2016/680 irányelv által a felügyeleti hatóságokra ruházott hatásköröket.

Az alkalmazóknak éves jelentéseket kell benyújtaniuk az érintett piacfelügyeleti és nemzeti adatvédelmi hatóságok számára a nem valós idejű távoli biometrikus azonosító rendszerek általuk történő használatáról, kivéve a bűnüldözéssel kapcsolatos érzékeny operatív adatok közzétételét. A jelentések összevonhatók úgy, hogy azok egynél többszöri alkalmazásra is kiterjedjenek.

A tagállamok az uniós joggal összhangban szigorúbb jogszabályokat is bevezethetnek a nem valós idejű távoli biometrikus azonosító rendszerek használatára vonatkozóan.

(11) E rendelet 50. cikkének sérelme nélkül, a III. mellékletben említett, természetes személyekkel kapcsolatos döntéseket hozó vagy az ilyen döntések meghozatalában segítséget nyújtó, nagy kockázatú MI-rendszerek alkalmazóinak tájékoztatniuk kell a természetes személyeket arról, hogy esetükben nagy kockázatú MI-rendszert használnak. A bűnüldözési célokra használt nagy kockázatú MI-rendszerek esetében alkalmazni kell az (EU) 2016/680 irányelv 13. cikkét.

(12) Az alkalmazóknak együtt kell működniük a releváns illetékes hatóságokkal a nagy kockázatú MI-rendszerrel kapcsolatos minden olyan intézkedés tekintetében, amelyeket a hatóságok e rendelet végrehajtása érdekében hoznak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  '1',
  '(1) A nagy kockázatú MI-rendszerek alkalmazóinak megfelelő technikai és szervezési intézkedéseket kell tenniük annak biztosítására, hogy ezeket a rendszereket a (3) és (6) bekezdés szerint, a rendszerekhez mellékelt használati utasításoknak megfelelően használják.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  '2',
  '(2) Az alkalmazóknak az emberi felügyeletet olyan természetes személyekre kell bízniuk, akik rendelkeznek a szükséges szakértelemmel, képzéssel és hatáskörrel, valamint a szükséges támogatással.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  '3',
  '(3) Az (1) és a (2) bekezdésben meghatározott kötelezettségek nem sértik az uniós vagy nemzeti jog szerinti egyéb alkalmazói kötelezettségeket, valamint az alkalmazó azon szabadságát, hogy a szolgáltató által megjelölt emberi felügyeleti intézkedések végrehajtása céljából megszervezze saját erőforrásait és tevékenységeit.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  '4',
  '(4) Az (1) és a (2) bekezdés sérelme nélkül, amennyiben az alkalmazó ellenőrzést gyakorol a bemeneti adatok felett, ezen alkalmazónak biztosítania kell, hogy a bemeneti adatok relevánsak és kellően reprezentatívak legyenek a nagy kockázatú MI-rendszer rendeltetése szempontjából.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  '5',
  '(5) Az alkalmazóknak a használati utasítások alapján nyomon kell követniük a nagy kockázatú MI-rendszer működését, és adott esetben a 72. cikknek megfelelően tájékoztatniuk kell a szolgáltatót. Amennyiben az alkalmazóknak okuk van úgy megítélni, hogy a nagy kockázatú MI-rendszer utasításoknak megfelelő használata azt eredményezheti, hogy az említett MI-rendszer a 79. cikk (1) bekezdésének értelmében vett kockázatot jelent, erről indokolatlan késedelem nélkül tájékoztatniuk kell a szolgáltatót vagy a forgalmazót, valamint a releváns piacfelügyeleti hatóságot, és fel kell függeszteniük az említett rendszer használatát. Amennyiben az alkalmazók súlyos váratlan eseményt azonosítottak, haladéktalanul tájékoztatniuk kell először a szolgáltatót, majd az importőrt vagy a forgalmazót és a releváns piacfelügyeleti hatóságokat is az említett eseményről. Ha az alkalmazó nem tudja elérni a szolgáltatót, a 73. cikket kell értelemszerűen alkalmazni. Ez a kötelezettség nem terjed ki az MI-rendszerek azon alkalmazóinak érzékeny operatív adataira, amelyek bűnüldöző hatóságok.

Azon alkalmazók esetében, amelyek a pénzügyi szolgáltatásokra vonatkozó uniós jog értelmében a belső irányításukra, szabályaikra vagy eljárásaikra vonatkozó követelmények hatálya alá tartozó pénzügyi intézmények, az első albekezdésben meghatározott nyomonkövetési kötelezettséget a pénzügyi szolgáltatásokra vonatkozó releváns jog szerinti, a belső irányítási rendszerekre, eljárásokra és mechanizmusokra vonatkozó szabályoknak való megfeleléssel teljesítettnek kell tekinteni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  '6',
  '(6) A nagy kockázatú MI-rendszerek alkalmazóinak meg kell őrizniük az adott nagy kockázatú MI-rendszer által automatikusan generált naplókat, amennyiben az ilyen naplók az ellenőrzésük alatt állnak a nagy kockázatú MI-rendszer rendeltetésének megfelelő – legalább hat hónapos – időtartamig, kivéve, ha az alkalmazandó uniós vagy nemzeti jog, különösen a személyes adatok védelmére vonatkozó uniós jog másként rendelkezik.

Azon alkalmazóknak, amelyek a pénzügyi szolgáltatásokra vonatkozó uniós jog értelmében a belső irányításukra, szabályaikra vagy eljárásaikra vonatkozó követelmények hatálya alá tartozó pénzügyi intézmények, a naplót a pénzügyi szolgáltatásokra vonatkozó megfelelő uniós jog alapján vezetett dokumentáció részeként kell megőrizniük.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  '7',
  '(7) A nagy kockázatú MI-rendszer munkahelyi üzembe helyezése vagy használata előtt azon alkalmazóknak, akik munkáltatók, tájékoztatniuk kell a munkavállalók képviselőit és az érintett munkavállalókat arról, hogy esetükben nagy kockázatú MI-rendszer használatára fog sor kerülni. Ezt a tájékoztatást adott esetben a munkavállalók és képviselőik tájékoztatására vonatkozó uniós és nemzeti jogban és gyakorlatban megállapított szabályokkal és eljárásokkal összhangban kell megadni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  '8',
  '(8) A nagy kockázatú MI-rendszerek alkalmazói, amennyiben azok hatóságok vagy uniós intézmények, szervek, hivatalok vagy ügynökségek, eleget tesznek a 49. cikkben említett nyilvántartási kötelezettségeknek. Amennyiben az ilyen alkalmazók megállapítják, hogy az általuk használni kívánt nagy kockázatú MI-rendszer nincs nyilvántartva a 71. cikkben említett uniós adatbázisban, nem használhatják az adott rendszert, és erről tájékoztatják a szolgáltatót vagy a forgalmazót.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  '9',
  '(9) A nagy kockázatú MI-rendszerek alkalmazóinak az e rendelet 13. cikke szerint megadott információkat – adott esetben – arra kell használniuk, hogy eleget tegyenek az (EU) 2016/679 rendelet 35. cikke vagy adott esetben az (EU) 2016/680 irányelv 27. cikke szerinti, adatvédelmi hatásvizsgálat elvégzésére vonatkozó kötelezettségüknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  '10',
  '(10) Az (EU) 2016/680 irányelv sérelme nélkül, a bűncselekmény elkövetésével gyanúsított vagy a miatt elítélt személyek célzott felkutatására irányuló nyomozás keretében a nem valós idejű távoli biometrikus azonosításra szolgáló, nagy kockázatú MI-rendszert alkalmazó személynek előzetesen vagy indokolatlan késedelem nélkül, de legkésőbb 48 órán belül engedélyt kell kérnie az adott rendszer használatára valamely igazságügyi hatóságtól vagy közigazgatási hatóságtól, amelynek határozata kötelező erejű és bírósági felülvizsgálat tárgyát képezi, kivéve, ha azt egy potenciális gyanúsítottnak a bűncselekményhez közvetlenül kapcsolódó objektív és ellenőrizhető tényeken alapuló kezdeti azonosítására használják. Minden felhasználásnak az adott bűncselekmény nyomozásához feltétlenül szükséges mértékre kell korlátozódnia.

Ha az első albekezdés szerint kérelmezett engedélyt elutasítják, a kért engedélyhez kapcsolódó, nem valós idejű távoli biometrikus azonosító rendszer használatát azonnali hatállyal le kell állítani, és törölni kell az azon nagy kockázatú MI-rendszer használatához kapcsolódó személyes adatokat, amelyre az engedélyt kérték.

Az ilyen, nem valós idejű távoli biometrikus azonosításra szolgáló, nagy kockázatú MI-rendszert semmilyen esetben sem szabad nem célzott módon bűnüldözési célokra használni bűncselekményhez, büntetőeljáráshoz, bűncselekmény tényleges és valós vagy előre látható veszélyéhez vagy egy konkrét eltűnt személy felkutatásához való kapcsolódás nélkül. Biztosítani kell, hogy a bűnüldöző hatóságok ne hozhassanak kizárólag a nem valós idejű távoli biometrikus azonosító rendszer által adott eredmény alapján olyan döntést, amely egy személyre nézve kedvezőtlen joghatással jár.

Ez a bekezdés nem sérti az (EU) 2016/679 rendelet 9. cikkét és az (EU) 2016/680 irányelv 10. cikkét a biometrikus adatok feldolgozása tekintetében.

Az ilyen, nagy kockázatú MI-rendszerek minden egyes használatát a vonatkozó rendőrségi nyilvántartásban – a célra vagy az alkalmazóra való tekintet nélkül – dokumentálni kell, és kérésre az érintett piacfelügyeleti hatóság és a nemzeti adatvédelmi hatóság rendelkezésére kell bocsátani, kivéve a bűnüldözéssel kapcsolatos érzékeny operatív adatok közzétételét. Ez az albekezdés nem sérti az (EU) 2016/680 irányelv által a felügyeleti hatóságokra ruházott hatásköröket.

Az alkalmazóknak éves jelentéseket kell benyújtaniuk az érintett piacfelügyeleti és nemzeti adatvédelmi hatóságok számára a nem valós idejű távoli biometrikus azonosító rendszerek általuk történő használatáról, kivéve a bűnüldözéssel kapcsolatos érzékeny operatív adatok közzétételét. A jelentések összevonhatók úgy, hogy azok egynél többszöri alkalmazásra is kiterjedjenek.

A tagállamok az uniós joggal összhangban szigorúbb jogszabályokat is bevezethetnek a nem valós idejű távoli biometrikus azonosító rendszerek használatára vonatkozóan.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  '11',
  '(11) E rendelet 50. cikkének sérelme nélkül, a III. mellékletben említett, természetes személyekkel kapcsolatos döntéseket hozó vagy az ilyen döntések meghozatalában segítséget nyújtó, nagy kockázatú MI-rendszerek alkalmazóinak tájékoztatniuk kell a természetes személyeket arról, hogy esetükben nagy kockázatú MI-rendszert használnak. A bűnüldözési célokra használt nagy kockázatú MI-rendszerek esetében alkalmazni kell az (EU) 2016/680 irányelv 13. cikkét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '26',
  '12',
  '(12) Az alkalmazóknak együtt kell működniük a releváns illetékes hatóságokkal a nagy kockázatú MI-rendszerrel kapcsolatos minden olyan intézkedés tekintetében, amelyeket a hatóságok e rendelet végrehajtása érdekében hoznak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_26'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '27',
  null,
  'A nagy kockázatú MI-rendszerekre vonatkozó alapvetőjogi hatásvizsgálat
(1) A 6. cikk (2) bekezdésében említett nagy kockázatú MI-rendszer bevezetését megelőzően – a III. melléklet 2. pontjában felsorolt területen való használatra szánt nagy kockázatú MI-rendszerek kivételével – azon alkalmazóknak, amelyek közjogi szervek vagy közszolgáltatásokat nyújtó magánszervezetek, valamint a III. melléklet 5. pontjának b) és c) alpontjában említett nagy kockázatú MI-rendszerek alkalmazóinak értékelniük kell azon hatást, amelyet az ilyen rendszerek használata az alapvető jogokra gyakorolhat. E célból az alkalmazóknak értékelést kell végezniük, amely a következőkből áll:

a)

az alkalmazó azon folyamatainak leírása, amelyekben a nagy kockázatú MI-rendszert a rendeltetésének megfelelően fogják használni;

b)

azon időszak és gyakoriság leírása, amelyen belül és amellyel az egyes nagy kockázatú MI-rendszereket használni szándékoznak;

c)

a természetes személyek és csoportok azon kategóriái, akiket a rendszer használata az adott kontextusban valószínűleg érint;

d)

az e bekezdés c) pontja alapján azonosított természetes személyek vagy személycsoportok kategóriáira valószínűleg hatást gyakorló konkrét kárkockázatok, figyelembe véve a szolgáltató által a 13. cikk szerint nyújtott információkat;

e)

az emberi felügyeleti intézkedések végrehajtásának leírása, a használati utasításnak megfelelően;

f)

az említett kockázatok bekövetkezése esetén meghozandó intézkedések, ideértve a belső irányítási és panasztételi mechanizmusokra vonatkozó szabályokat.

(2) Az (1) bekezdésben megállapított kötelezettség a nagy kockázatú MI-rendszer első használatára vonatkozik. Az alkalmazó hasonló esetekben támaszkodhat a korábban elvégzett alapjogi hatásvizsgálatokra vagy a szolgáltatók által már elvégzett, meglévő hatásvizsgálatokra. Amennyiben a nagy kockázatú MI-rendszer használata során az alkalmazó úgy ítéli meg, hogy az (1) bekezdésben felsorolt elemek bármelyike megváltozott vagy már nem naprakész, az alkalmazónak meg kell tennie a szükséges lépéseket az információk aktualizálására.

(3) Az e cikk (1) bekezdésében említett értékelés elvégzését követően az alkalmazónak értesítenie kell a piacfelügyeleti hatóságot annak eredményeiről, az értesítés részeként benyújtva az e cikk (5) bekezdésében említett kitöltött kérdőívmintát is. A 46. cikk (1) bekezdésében említett esetben az alkalmazók mentesíthetők ezen értesítési kötelezettség alól.

(4) Ha az (EU) 2016/679 rendelet 35. cikke vagy az (EU) 2016/680 irányelv 27. cikke alapján elvégzett adatvédelmi hatásvizsgálat révén már megfeleltek az e cikkben megállapított kötelezettségek bármelyikének, az e cikk (1) bekezdésében említett alapvetőjogi hatásvizsgálatnak ki kell egészítenie az említett adatvédelmi hatásvizsgálatot.

(5) Az MI-hivatal – többek között egy automatizált eszköz révén – kérdőívmintát dolgoz ki, hogy megkönnyítse az alkalmazók számára az e cikk szerinti kötelezettségeiknek egyszerűsített módon való megfelelést.

4. SZAKASZ

Bejelentő hatóságok és bejelentett szervezetek',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '27',
  '1',
  '(1) A 6. cikk (2) bekezdésében említett nagy kockázatú MI-rendszer bevezetését megelőzően – a III. melléklet 2. pontjában felsorolt területen való használatra szánt nagy kockázatú MI-rendszerek kivételével – azon alkalmazóknak, amelyek közjogi szervek vagy közszolgáltatásokat nyújtó magánszervezetek, valamint a III. melléklet 5. pontjának b) és c) alpontjában említett nagy kockázatú MI-rendszerek alkalmazóinak értékelniük kell azon hatást, amelyet az ilyen rendszerek használata az alapvető jogokra gyakorolhat. E célból az alkalmazóknak értékelést kell végezniük, amely a következőkből áll:

a)

az alkalmazó azon folyamatainak leírása, amelyekben a nagy kockázatú MI-rendszert a rendeltetésének megfelelően fogják használni;

b)

azon időszak és gyakoriság leírása, amelyen belül és amellyel az egyes nagy kockázatú MI-rendszereket használni szándékoznak;

c)

a természetes személyek és csoportok azon kategóriái, akiket a rendszer használata az adott kontextusban valószínűleg érint;

d)

az e bekezdés c) pontja alapján azonosított természetes személyek vagy személycsoportok kategóriáira valószínűleg hatást gyakorló konkrét kárkockázatok, figyelembe véve a szolgáltató által a 13. cikk szerint nyújtott információkat;

e)

az emberi felügyeleti intézkedések végrehajtásának leírása, a használati utasításnak megfelelően;

f)

az említett kockázatok bekövetkezése esetén meghozandó intézkedések, ideértve a belső irányítási és panasztételi mechanizmusokra vonatkozó szabályokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '27',
  '1(a)',
  'a) az alkalmazó azon folyamatainak leírása, amelyekben a nagy kockázatú MI-rendszert a rendeltetésének megfelelően fogják használni;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '27',
  '1(b)',
  'b) azon időszak és gyakoriság leírása, amelyen belül és amellyel az egyes nagy kockázatú MI-rendszereket használni szándékoznak;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '27',
  '1(c)',
  'c) a természetes személyek és csoportok azon kategóriái, akiket a rendszer használata az adott kontextusban valószínűleg érint;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '27',
  '1(d)',
  'd) az e bekezdés c) pontja alapján azonosított természetes személyek vagy személycsoportok kategóriáira valószínűleg hatást gyakorló konkrét kárkockázatok, figyelembe véve a szolgáltató által a 13. cikk szerint nyújtott információkat;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '27',
  '1(e)',
  'e) az emberi felügyeleti intézkedések végrehajtásának leírása, a használati utasításnak megfelelően;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '27',
  '1(f)',
  'f) az említett kockázatok bekövetkezése esetén meghozandó intézkedések, ideértve a belső irányítási és panasztételi mechanizmusokra vonatkozó szabályokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '27',
  '2',
  '(2) Az (1) bekezdésben megállapított kötelezettség a nagy kockázatú MI-rendszer első használatára vonatkozik. Az alkalmazó hasonló esetekben támaszkodhat a korábban elvégzett alapjogi hatásvizsgálatokra vagy a szolgáltatók által már elvégzett, meglévő hatásvizsgálatokra. Amennyiben a nagy kockázatú MI-rendszer használata során az alkalmazó úgy ítéli meg, hogy az (1) bekezdésben felsorolt elemek bármelyike megváltozott vagy már nem naprakész, az alkalmazónak meg kell tennie a szükséges lépéseket az információk aktualizálására.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '27',
  '3',
  '(3) Az e cikk (1) bekezdésében említett értékelés elvégzését követően az alkalmazónak értesítenie kell a piacfelügyeleti hatóságot annak eredményeiről, az értesítés részeként benyújtva az e cikk (5) bekezdésében említett kitöltött kérdőívmintát is. A 46. cikk (1) bekezdésében említett esetben az alkalmazók mentesíthetők ezen értesítési kötelezettség alól.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '27',
  '4',
  '(4) Ha az (EU) 2016/679 rendelet 35. cikke vagy az (EU) 2016/680 irányelv 27. cikke alapján elvégzett adatvédelmi hatásvizsgálat révén már megfeleltek az e cikkben megállapított kötelezettségek bármelyikének, az e cikk (1) bekezdésében említett alapvetőjogi hatásvizsgálatnak ki kell egészítenie az említett adatvédelmi hatásvizsgálatot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '27',
  '5',
  '(5) Az MI-hivatal – többek között egy automatizált eszköz révén – kérdőívmintát dolgoz ki, hogy megkönnyítse az alkalmazók számára az e cikk szerinti kötelezettségeiknek egyszerűsített módon való megfelelést.

4. SZAKASZ

Bejelentő hatóságok és bejelentett szervezetek',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_27'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '28',
  null,
  'Bejelentő hatóságok
(1) Minden tagállam kijelöl vagy létrehoz legalább egy bejelentő hatóságot, amely a megfelelőségértékelő szervezetek értékeléséhez, kijelöléséhez és bejelentéséhez, valamint nyomon követéséhez szükséges eljárások kialakításáért és végrehajtásáért felel. Az említett eljárásokat valamennyi tagállam bejelentő hatóságainak együttműködésével kell kidolgozni.

(2) A tagállamok dönthetnek úgy, hogy az (1) bekezdésben említett értékelést és nyomon követést egy, a 765/2008/EK rendelet szerinti nemzeti akkreditáló testület végzi el az említett rendelet rendelkezéseivel összhangban.

(3) A bejelentő hatóságokat úgy kell létrehozni, megszervezni és működtetni, hogy ne merülhessen fel összeférhetetlenség a megfelelőségértékelő szervezetekkel, továbbá hogy tevékenységük objektivitása és pártatlansága biztosított legyen.

(4) A bejelentő hatóságokat úgy kell megszervezni, hogy a megfelelőségértékelő szervezet bejelentésével kapcsolatos döntéseket az adott szervezet értékelését végzőktől eltérő illetékes személyek hozzák meg.

(5) A bejelentő hatóságok kereskedelmi vagy piaci alapon nem kínálhatnak vagy végezhetnek sem olyan tevékenységet, amelyet megfelelőségértékelő szervezetek végeznek, sem szaktanácsadási szolgáltatást.

(6) A bejelentő hatóságoknak a 78. cikkel összhangban meg kell őrizniük az általuk kapott információk bizalmas jellegét.

(7) A bejelentő hatóságoknak megfelelő létszámú hozzáértő személyzettel kell rendelkezniük ahhoz, hogy megfelelően elláthassák feladataikat. A hozzáértő személyzetnek adott esetben rendelkeznie kell a feladatai ellátásához szükséges szakértelemmel olyan területeken, mint az információtechnológiák, a mesterséges intelligencia és a jog, beleértve az alapvető jogok felügyeletét is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '28',
  '1',
  '(1) Minden tagállam kijelöl vagy létrehoz legalább egy bejelentő hatóságot, amely a megfelelőségértékelő szervezetek értékeléséhez, kijelöléséhez és bejelentéséhez, valamint nyomon követéséhez szükséges eljárások kialakításáért és végrehajtásáért felel. Az említett eljárásokat valamennyi tagállam bejelentő hatóságainak együttműködésével kell kidolgozni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '28',
  '2',
  '(2) A tagállamok dönthetnek úgy, hogy az (1) bekezdésben említett értékelést és nyomon követést egy, a 765/2008/EK rendelet szerinti nemzeti akkreditáló testület végzi el az említett rendelet rendelkezéseivel összhangban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '28',
  '3',
  '(3) A bejelentő hatóságokat úgy kell létrehozni, megszervezni és működtetni, hogy ne merülhessen fel összeférhetetlenség a megfelelőségértékelő szervezetekkel, továbbá hogy tevékenységük objektivitása és pártatlansága biztosított legyen.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '28',
  '4',
  '(4) A bejelentő hatóságokat úgy kell megszervezni, hogy a megfelelőségértékelő szervezet bejelentésével kapcsolatos döntéseket az adott szervezet értékelését végzőktől eltérő illetékes személyek hozzák meg.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '28',
  '5',
  '(5) A bejelentő hatóságok kereskedelmi vagy piaci alapon nem kínálhatnak vagy végezhetnek sem olyan tevékenységet, amelyet megfelelőségértékelő szervezetek végeznek, sem szaktanácsadási szolgáltatást.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '28',
  '6',
  '(6) A bejelentő hatóságoknak a 78. cikkel összhangban meg kell őrizniük az általuk kapott információk bizalmas jellegét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '28',
  '7',
  '(7) A bejelentő hatóságoknak megfelelő létszámú hozzáértő személyzettel kell rendelkezniük ahhoz, hogy megfelelően elláthassák feladataikat. A hozzáértő személyzetnek adott esetben rendelkeznie kell a feladatai ellátásához szükséges szakértelemmel olyan területeken, mint az információtechnológiák, a mesterséges intelligencia és a jog, beleértve az alapvető jogok felügyeletét is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_28'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '29',
  null,
  'A megfelelőségértékelő szervezet bejelentés iránti kérelme
(1) A megfelelőségértékelő szervezetnek bejelentés iránti kérelmet kell benyújtania a letelepedési helye szerinti tagállam bejelentő hatóságához.

(2) A bejelentés iránti kérelemhez csatolnia kell azon megfelelőségértékelési tevékenységek, megfelelőségértékelési modul vagy modulok és MI-rendszertípusok leírását, amelyek tekintetében a megfelelőségértékelő szervezet szakmailag alkalmasnak tekinti magát, továbbá – amennyiben van ilyen – a nemzeti akkreditáló testület által kiállított akkreditálási okiratot, amely tanúsítja, hogy a megfelelőségértékelő szervezet teljesíti a 31. cikkben megállapított követelményeket.

Csatolni kell minden érvényes, a kérelmező bejelentett szervezet bármely egyéb uniós harmonizációs jogszabály szerinti, meglévő kijelöléseivel kapcsolatos dokumentumot.

(3) Amennyiben az érintett megfelelőségértékelő szervezet nem tud akkreditálási okiratot benyújtani, be kell nyújtania a bejelentő hatóság számára a 31. cikkben megállapított követelményeknek való megfelelésének ellenőrzéséhez, elismeréséhez és rendszeres nyomon követéséhez szükséges valamennyi igazoló okmányt.

(4) A bármely egyéb uniós harmonizációs jogszabály alapján kijelölt bejelentett szervezetek esetében az említett kijelölésekhez kapcsolódó valamennyi dokumentum és tanúsítvány felhasználható adott esetben az e rendelet szerinti kijelölésükre irányuló eljárás alátámasztására. A bejelentett szervezet az e cikk (2) és (3) bekezdésében említett dokumentációt minden releváns változás esetén naprakésszé teszi annak érdekében, hogy lehetővé tegye a bejelentett szervezetekért felelős hatóság számára a 31. cikkben megállapított valamennyi követelménynek való folyamatos megfelelés nyomon követését és ellenőrzését.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_29'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '29',
  '1',
  '(1) A megfelelőségértékelő szervezetnek bejelentés iránti kérelmet kell benyújtania a letelepedési helye szerinti tagállam bejelentő hatóságához.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_29'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '29',
  '2',
  '(2) A bejelentés iránti kérelemhez csatolnia kell azon megfelelőségértékelési tevékenységek, megfelelőségértékelési modul vagy modulok és MI-rendszertípusok leírását, amelyek tekintetében a megfelelőségértékelő szervezet szakmailag alkalmasnak tekinti magát, továbbá – amennyiben van ilyen – a nemzeti akkreditáló testület által kiállított akkreditálási okiratot, amely tanúsítja, hogy a megfelelőségértékelő szervezet teljesíti a 31. cikkben megállapított követelményeket.

Csatolni kell minden érvényes, a kérelmező bejelentett szervezet bármely egyéb uniós harmonizációs jogszabály szerinti, meglévő kijelöléseivel kapcsolatos dokumentumot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_29'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '29',
  '3',
  '(3) Amennyiben az érintett megfelelőségértékelő szervezet nem tud akkreditálási okiratot benyújtani, be kell nyújtania a bejelentő hatóság számára a 31. cikkben megállapított követelményeknek való megfelelésének ellenőrzéséhez, elismeréséhez és rendszeres nyomon követéséhez szükséges valamennyi igazoló okmányt.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_29'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '29',
  '4',
  '(4) A bármely egyéb uniós harmonizációs jogszabály alapján kijelölt bejelentett szervezetek esetében az említett kijelölésekhez kapcsolódó valamennyi dokumentum és tanúsítvány felhasználható adott esetben az e rendelet szerinti kijelölésükre irányuló eljárás alátámasztására. A bejelentett szervezet az e cikk (2) és (3) bekezdésében említett dokumentációt minden releváns változás esetén naprakésszé teszi annak érdekében, hogy lehetővé tegye a bejelentett szervezetekért felelős hatóság számára a 31. cikkben megállapított valamennyi követelménynek való folyamatos megfelelés nyomon követését és ellenőrzését.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_29'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '30',
  null,
  'Bejelentési eljárás
(1) A bejelentő hatóságok csak olyan megfelelőségértékelő szervezeteket jelenthetnek be, amelyek megfelelnek a 31. cikkben megállapított követelményeknek.

(2) A bejelentő hatóságok a Bizottság által kifejlesztett és kezelt elektronikus bejelentési eszköz alkalmazásával értesítik a Bizottságot és a többi tagállamot az (1) bekezdésben említett minden egyes megfelelőségértékelő szervezetről.

(3) Az e cikk (2) bekezdésében említett bejelentésnek tartalmaznia kell részletes információkat a megfelelőségértékelési tevékenységekről, a megfelelőségértékelési modulról vagy modulokról, az érintett MI-rendszerek típusairól, valamint a szakmai alkalmasság releváns igazolását. Amennyiben a bejelentés nem a 29. cikk (2) bekezdésében említett akkreditálási okiraton alapul, a bejelentő hatóságnak rendelkezésre kell bocsátania a Bizottság és a többi tagállam számára a megfelelőségértékelő szervezet alkalmasságát és azon meglévő intézkedéseket igazoló dokumentumokat, amelyeknek biztosítják, hogy az említett szervezetet rendszeresen nyomon fogják követni, és azt, hogy az továbbra is meg fog felelni a 31. cikkben megállapított követelményeknek.

(4) Az érintett megfelelőségértékelő szervezet csak akkor végezheti egy bejelentett szervezet tevékenységeit, ha a Bizottság és a többi tagállam nem emel kifogást a bejelentő hatóság általi bejelentést követő két héten belül, amennyiben a bejelentés a 29. cikk (2) bekezdése szerinti akkreditálási okiratot tartalmaz, vagy a bejelentő hatóság általi bejelentést követő két hónapon belül, amennyiben a bejelentés a 29. cikk (3) bekezdése szerinti igazoló dokumentumot tartalmaz.

(5) Amennyiben kifogást emelnek, a Bizottság haladéktalanul konzultációkat kezdeményez a releváns tagállamokkal és a megfelelőségértékelő szervvel. Erre figyelemmel a Bizottság dönt arról, hogy az engedély indokolt-e. A Bizottság döntését az érintett tagállamnak és a releváns megfelelőségértékelő szervnek címezi.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '30',
  '1',
  '(1) A bejelentő hatóságok csak olyan megfelelőségértékelő szervezeteket jelenthetnek be, amelyek megfelelnek a 31. cikkben megállapított követelményeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '30',
  '2',
  '(2) A bejelentő hatóságok a Bizottság által kifejlesztett és kezelt elektronikus bejelentési eszköz alkalmazásával értesítik a Bizottságot és a többi tagállamot az (1) bekezdésben említett minden egyes megfelelőségértékelő szervezetről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '30',
  '3',
  '(3) Az e cikk (2) bekezdésében említett bejelentésnek tartalmaznia kell részletes információkat a megfelelőségértékelési tevékenységekről, a megfelelőségértékelési modulról vagy modulokról, az érintett MI-rendszerek típusairól, valamint a szakmai alkalmasság releváns igazolását. Amennyiben a bejelentés nem a 29. cikk (2) bekezdésében említett akkreditálási okiraton alapul, a bejelentő hatóságnak rendelkezésre kell bocsátania a Bizottság és a többi tagállam számára a megfelelőségértékelő szervezet alkalmasságát és azon meglévő intézkedéseket igazoló dokumentumokat, amelyeknek biztosítják, hogy az említett szervezetet rendszeresen nyomon fogják követni, és azt, hogy az továbbra is meg fog felelni a 31. cikkben megállapított követelményeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '30',
  '4',
  '(4) Az érintett megfelelőségértékelő szervezet csak akkor végezheti egy bejelentett szervezet tevékenységeit, ha a Bizottság és a többi tagállam nem emel kifogást a bejelentő hatóság általi bejelentést követő két héten belül, amennyiben a bejelentés a 29. cikk (2) bekezdése szerinti akkreditálási okiratot tartalmaz, vagy a bejelentő hatóság általi bejelentést követő két hónapon belül, amennyiben a bejelentés a 29. cikk (3) bekezdése szerinti igazoló dokumentumot tartalmaz.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '30',
  '5',
  '(5) Amennyiben kifogást emelnek, a Bizottság haladéktalanul konzultációkat kezdeményez a releváns tagállamokkal és a megfelelőségértékelő szervvel. Erre figyelemmel a Bizottság dönt arról, hogy az engedély indokolt-e. A Bizottság döntését az érintett tagállamnak és a releváns megfelelőségértékelő szervnek címezi.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_30'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  null,
  'A bejelentett szervezetekre vonatkozó követelmények
(1) A bejelentett szervezeteket a tagállamok nemzeti joga alapján kell létrehozni, és azoknak jogi személyiséggel kell rendelkezniük.

(2) A bejelentett szervezeteknek eleget kell tenniük azoknak a szervezeti, minőségirányítási, erőforrásokra vonatkozó és eljárási követelményeknek, amelyek a feladataik ellátásához szükségesek, valamint megfelelő kiberbiztonsági követelményeket kell teljesíteniük.

(3) A bejelentett szervezetek szervezeti felépítésének, a szervezeten belül a felelősségi körök kijelölésének, a jelentési útvonalaknak és a bejelentett szervezetek működésének biztosítania kell a bejelentett szervezet által végzett megfelelőségértékelési tevékenységek elvégzése és az e tevékenységek eredményei iránti bizalmat.

(4) A bejelentett szervezeteknek függetlennek kell lenniük azon nagy kockázatú MI-rendszer szolgáltatójától, amellyel kapcsolatban megfelelőségértékelési tevékenységeket végeznek. A bejelentett szervezeteknek továbbá függetlennek kell lenniük az értékelés tárgyát képező nagy kockázatú MI-rendszerben gazdasági érdekeltséggel rendelkező bármely egyéb üzemeltetőtől, valamint a szolgáltató versenytársaitól is. Ez nem zárhatja ki az olyan értékelt nagy kockázatú MI-rendszerek használatát, amelyek a megfelelőségértékelő szervezet működéséhez szükségesek, illetve az ilyen nagy kockázatú MI-rendszerek személyes célra történő használatát.

(5) Sem a megfelelőségértékelő szervezet, sem annak felső szintű vezetése, sem a megfelelőségértékelési feladatok elvégzéséért felelős személyzete nem vehet részt közvetlenül a nagy kockázatú MI-rendszerek tervezésében, fejlesztésében, forgalmazásában vagy használatában, és nem képviselhetik az ilyen tevékenységekben részt vevő feleket sem. Nem folytathatnak olyan tevékenységet, amely ellentétes lehet a bejelentett megfelelőségértékelési tevékenységekkel kapcsolatos döntéshozói függetlenségükkel vagy feddhetetlenségükkel. Ez különösen érvényes a szaktanácsadási szolgáltatásokra.

(6) A bejelentett szervezetet úgy kell megszervezni és működtetni, hogy tevékenységeinek függetlensége, objektivitása és pártatlansága biztosított legyen. A bejelentett szervezeteknek olyan struktúrát és eljárásokat kell dokumentálniuk és alkalmazniuk, amelyek a szervezetük, a személyzetük és az értékelési tevékenységeik egészében biztosítják a pártatlanság megőrzését, valamint a pártatlanság elveinek az előmozdítását és alkalmazását.

(7) A bejelentett szervezeteknek dokumentált eljárásokkal kell rendelkezniük, amelyek biztosítják, hogy a személyzetük, a bizottságaik, a leányvállalataik, az alvállalkozóik és bármely velük kapcsolatban álló szervezet vagy külső szervezetek munkavállalói – a 78. cikknek megfelelően – tiszteletben tartsák azon információk bizalmasságát, amelyek a megfelelőségértékelési tevékenységek végzése során a birtokukba kerülnek, kivéve, ha azok közzétételét jogszabály írja elő. A bejelentett szervezetek személyzetének be kell tartania a szakmai titoktartás követelményeit minden olyan információ tekintetében, amely az e rendeletben foglalt feladataik végrehajtása során jutott a birtokába, kivéve annak a tagállamnak a bejelentő hatóságaival szemben, ahol a bejelentett szervezetek tevékenységüket végzik.

(8) A bejelentett szervezeteknek a tevékenységek ellátásához olyan eljárásokkal kell rendelkezniük, amelyek kellően figyelembe veszik a szolgáltató méretét, azon ágazatot, amelyben az működik, annak szerkezetét és az érintett MI-rendszer összetettségi fokát.

(9) A bejelentett szervezeteknek megfelelőségértékelési tevékenységeikre megfelelő felelősségbiztosítást kell kötniük, kivéve, ha a felelősséget a nemzeti jognak megfelelően az a tagállam vállalja, amelyben a bejelentett szervezet letelepedett, vagy ha az említett tagállam közvetlenül maga felelős a megfelelőségértékelésért.

(10) A bejelentett szervezeteknek képesnek kell lenniük az e rendelet szerinti valamennyi feladatukat a legmagasabb fokú szakmai feddhetetlenséggel és a konkrét területen megkövetelt alkalmassággal végezni, függetlenül attól, hogy az említett feladatokat a bejelentett szervezetek maguk végzik-e, vagy az ő nevükben és felelősségi körükben eljárva mások végzik-e.

(11) A bejelentett szervezeteknek elegendő belső szakértelemmel kell rendelkezniük ahhoz, hogy hatékonyan értékelni tudják a külső felek által a nevükben elvégzett feladatokat. A bejelentett szervezetnek állandó jelleggel elegendő olyan adminisztratív, műszaki, jogi és tudományos munkatárssal kell rendelkeznie, akik tapasztalattal és ismeretekkel rendelkeznek a vonatkozó MI-rendszertípusokkal, adatokkal és adatszámítással, valamint a 2. szakaszban foglalt követelményekkel kapcsolatban.

(12) A bejelentett szervezeteknek részt kell venniük a 38. cikkben említett koordinációs tevékenységekben. Emellett közvetlenül részt kell venniük vagy képviseltetni kell magukat az európai szabványügyi szervezetekben, vagy gondoskodniuk kell arról, hogy tisztában legyenek a vonatkozó szabványokkal, és naprakész ismeretekkel rendelkezzenek ezekről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  '1',
  '(1) A bejelentett szervezeteket a tagállamok nemzeti joga alapján kell létrehozni, és azoknak jogi személyiséggel kell rendelkezniük.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  '2',
  '(2) A bejelentett szervezeteknek eleget kell tenniük azoknak a szervezeti, minőségirányítási, erőforrásokra vonatkozó és eljárási követelményeknek, amelyek a feladataik ellátásához szükségesek, valamint megfelelő kiberbiztonsági követelményeket kell teljesíteniük.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  '3',
  '(3) A bejelentett szervezetek szervezeti felépítésének, a szervezeten belül a felelősségi körök kijelölésének, a jelentési útvonalaknak és a bejelentett szervezetek működésének biztosítania kell a bejelentett szervezet által végzett megfelelőségértékelési tevékenységek elvégzése és az e tevékenységek eredményei iránti bizalmat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  '4',
  '(4) A bejelentett szervezeteknek függetlennek kell lenniük azon nagy kockázatú MI-rendszer szolgáltatójától, amellyel kapcsolatban megfelelőségértékelési tevékenységeket végeznek. A bejelentett szervezeteknek továbbá függetlennek kell lenniük az értékelés tárgyát képező nagy kockázatú MI-rendszerben gazdasági érdekeltséggel rendelkező bármely egyéb üzemeltetőtől, valamint a szolgáltató versenytársaitól is. Ez nem zárhatja ki az olyan értékelt nagy kockázatú MI-rendszerek használatát, amelyek a megfelelőségértékelő szervezet működéséhez szükségesek, illetve az ilyen nagy kockázatú MI-rendszerek személyes célra történő használatát.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  '5',
  '(5) Sem a megfelelőségértékelő szervezet, sem annak felső szintű vezetése, sem a megfelelőségértékelési feladatok elvégzéséért felelős személyzete nem vehet részt közvetlenül a nagy kockázatú MI-rendszerek tervezésében, fejlesztésében, forgalmazásában vagy használatában, és nem képviselhetik az ilyen tevékenységekben részt vevő feleket sem. Nem folytathatnak olyan tevékenységet, amely ellentétes lehet a bejelentett megfelelőségértékelési tevékenységekkel kapcsolatos döntéshozói függetlenségükkel vagy feddhetetlenségükkel. Ez különösen érvényes a szaktanácsadási szolgáltatásokra.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  '6',
  '(6) A bejelentett szervezetet úgy kell megszervezni és működtetni, hogy tevékenységeinek függetlensége, objektivitása és pártatlansága biztosított legyen. A bejelentett szervezeteknek olyan struktúrát és eljárásokat kell dokumentálniuk és alkalmazniuk, amelyek a szervezetük, a személyzetük és az értékelési tevékenységeik egészében biztosítják a pártatlanság megőrzését, valamint a pártatlanság elveinek az előmozdítását és alkalmazását.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  '7',
  '(7) A bejelentett szervezeteknek dokumentált eljárásokkal kell rendelkezniük, amelyek biztosítják, hogy a személyzetük, a bizottságaik, a leányvállalataik, az alvállalkozóik és bármely velük kapcsolatban álló szervezet vagy külső szervezetek munkavállalói – a 78. cikknek megfelelően – tiszteletben tartsák azon információk bizalmasságát, amelyek a megfelelőségértékelési tevékenységek végzése során a birtokukba kerülnek, kivéve, ha azok közzétételét jogszabály írja elő. A bejelentett szervezetek személyzetének be kell tartania a szakmai titoktartás követelményeit minden olyan információ tekintetében, amely az e rendeletben foglalt feladataik végrehajtása során jutott a birtokába, kivéve annak a tagállamnak a bejelentő hatóságaival szemben, ahol a bejelentett szervezetek tevékenységüket végzik.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  '8',
  '(8) A bejelentett szervezeteknek a tevékenységek ellátásához olyan eljárásokkal kell rendelkezniük, amelyek kellően figyelembe veszik a szolgáltató méretét, azon ágazatot, amelyben az működik, annak szerkezetét és az érintett MI-rendszer összetettségi fokát.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  '9',
  '(9) A bejelentett szervezeteknek megfelelőségértékelési tevékenységeikre megfelelő felelősségbiztosítást kell kötniük, kivéve, ha a felelősséget a nemzeti jognak megfelelően az a tagállam vállalja, amelyben a bejelentett szervezet letelepedett, vagy ha az említett tagállam közvetlenül maga felelős a megfelelőségértékelésért.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  '10',
  '(10) A bejelentett szervezeteknek képesnek kell lenniük az e rendelet szerinti valamennyi feladatukat a legmagasabb fokú szakmai feddhetetlenséggel és a konkrét területen megkövetelt alkalmassággal végezni, függetlenül attól, hogy az említett feladatokat a bejelentett szervezetek maguk végzik-e, vagy az ő nevükben és felelősségi körükben eljárva mások végzik-e.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  '11',
  '(11) A bejelentett szervezeteknek elegendő belső szakértelemmel kell rendelkezniük ahhoz, hogy hatékonyan értékelni tudják a külső felek által a nevükben elvégzett feladatokat. A bejelentett szervezetnek állandó jelleggel elegendő olyan adminisztratív, műszaki, jogi és tudományos munkatárssal kell rendelkeznie, akik tapasztalattal és ismeretekkel rendelkeznek a vonatkozó MI-rendszertípusokkal, adatokkal és adatszámítással, valamint a 2. szakaszban foglalt követelményekkel kapcsolatban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '31',
  '12',
  '(12) A bejelentett szervezeteknek részt kell venniük a 38. cikkben említett koordinációs tevékenységekben. Emellett közvetlenül részt kell venniük vagy képviseltetni kell magukat az európai szabványügyi szervezetekben, vagy gondoskodniuk kell arról, hogy tisztában legyenek a vonatkozó szabványokkal, és naprakész ismeretekkel rendelkezzenek ezekről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_31'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '32',
  null,
  'A bejelentett szervezetekre vonatkozó követelményeknek való megfelelés vélelme
Amennyiben valamely megfelelőségértékelő szervezet igazolja, hogy megfelel az olyan vonatkozó harmonizált szabványokban vagy azok részeiben rögzített kritériumoknak, amelyek hivatkozásait közzétették az Európai Unió Hivatalos Lapjában , vélelmezni kell, hogy megfelel a 31. cikkben foglalt követelményeknek, amennyiben az alkalmazandó harmonizált szabványok kiterjednek az említett követelményekre.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_32'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '33',
  null,
  'A bejelentett szervezetek leányvállalatai és tevékenységek alvállalkozásba adása
(1) Amennyiben valamely bejelentett szervezet megfelelőségértékeléssel kapcsolatos, konkrét feladatokat alvállalkozásba ad, vagy leányvállalatot bíz meg elvégzésükkel, biztosítania kell, hogy az alvállalkozó vagy a leányvállalat megfeleljen a 31. cikkben megállapított követelményeknek, és ennek megfelelően tájékoztatnia kell erről a bejelentő hatóságot.

(2) A bejelentett szervezeteknek teljes felelősséget kell vállalniuk a bármely alvállalkozó vagy leányvállalat által elvégzett feladatokért.

(3) A tevékenységeket csak a szolgáltató beleegyezésével lehet alvállalkozásba adni vagy leányvállalattal elvégeztetni. A bejelentett szervezeteknek nyilvánosan hozzáférhetővé kell tenniük leányvállalataik jegyzékét.

(4) Az alvállalkozó vagy a leányvállalat képesítésének értékelésére és az általuk e rendelet alapján elvégzett munkára vonatkozó releváns dokumentumokat az alvállalkozói tevékenység megszüntetésének időpontjától számított öt évig a bejelentő hatóság számára elérhetővé kell tenni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '33',
  '1',
  '(1) Amennyiben valamely bejelentett szervezet megfelelőségértékeléssel kapcsolatos, konkrét feladatokat alvállalkozásba ad, vagy leányvállalatot bíz meg elvégzésükkel, biztosítania kell, hogy az alvállalkozó vagy a leányvállalat megfeleljen a 31. cikkben megállapított követelményeknek, és ennek megfelelően tájékoztatnia kell erről a bejelentő hatóságot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '33',
  '2',
  '(2) A bejelentett szervezeteknek teljes felelősséget kell vállalniuk a bármely alvállalkozó vagy leányvállalat által elvégzett feladatokért.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '33',
  '3',
  '(3) A tevékenységeket csak a szolgáltató beleegyezésével lehet alvállalkozásba adni vagy leányvállalattal elvégeztetni. A bejelentett szervezeteknek nyilvánosan hozzáférhetővé kell tenniük leányvállalataik jegyzékét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '33',
  '4',
  '(4) Az alvállalkozó vagy a leányvállalat képesítésének értékelésére és az általuk e rendelet alapján elvégzett munkára vonatkozó releváns dokumentumokat az alvállalkozói tevékenység megszüntetésének időpontjától számított öt évig a bejelentő hatóság számára elérhetővé kell tenni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_33'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '34',
  null,
  'A bejelentett szervezetek működési kötelezettségei
(1) A bejelentett szervezeteknek a 43. cikkben meghatározott megfelelőségértékelési eljárásokkal összhangban ellenőrizniük kell a nagy kockázatú MI-rendszerek megfelelőségét.

(2) A bejelentett szervezeteknek tevékenységeik végzése során el kell kerülniük, hogy szükségtelen terheket rójanak a szolgáltatókra, és kellően figyelembe kell venniük a szolgáltató méretét, az ágazatot, amelyben működik, a szolgáltató szerkezetét és az érintett nagy kockázatú MI-rendszer összetettségi fokát, különösen a 2003/361/EK ajánlás értelmében vett mikro- és kisvállalkozások adminisztratív terheinek és megfelelési költségeinek minimalizálására tekintettel. A bejelentett szervezetnek mindazonáltal tiszteletben kell tartania az ahhoz szükséges szigorúság mértékét és védelem szintjét, hogy a nagy kockázatú MI-rendszer megfeleljen e rendelet követelményeinek.

(3) A bejelentett szervezetek – kérésre – a 28. cikkben említett bejelentő hatóság számára rendelkezésre bocsátanak és benyújtanak minden releváns dokumentációt, ideértve a szolgáltatók dokumentációját is, hogy lehetővé tegyék az említett hatóság számára az értékelési, kijelölési, bejelentési és nyomonkövetési tevékenységei elvégzését, továbbá, hogy elősegítsék az e szakaszban vázolt értékelést.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_34'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '34',
  '1',
  '(1) A bejelentett szervezeteknek a 43. cikkben meghatározott megfelelőségértékelési eljárásokkal összhangban ellenőrizniük kell a nagy kockázatú MI-rendszerek megfelelőségét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_34'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '34',
  '2',
  '(2) A bejelentett szervezeteknek tevékenységeik végzése során el kell kerülniük, hogy szükségtelen terheket rójanak a szolgáltatókra, és kellően figyelembe kell venniük a szolgáltató méretét, az ágazatot, amelyben működik, a szolgáltató szerkezetét és az érintett nagy kockázatú MI-rendszer összetettségi fokát, különösen a 2003/361/EK ajánlás értelmében vett mikro- és kisvállalkozások adminisztratív terheinek és megfelelési költségeinek minimalizálására tekintettel. A bejelentett szervezetnek mindazonáltal tiszteletben kell tartania az ahhoz szükséges szigorúság mértékét és védelem szintjét, hogy a nagy kockázatú MI-rendszer megfeleljen e rendelet követelményeinek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_34'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '34',
  '3',
  '(3) A bejelentett szervezetek – kérésre – a 28. cikkben említett bejelentő hatóság számára rendelkezésre bocsátanak és benyújtanak minden releváns dokumentációt, ideértve a szolgáltatók dokumentációját is, hogy lehetővé tegyék az említett hatóság számára az értékelési, kijelölési, bejelentési és nyomonkövetési tevékenységei elvégzését, továbbá, hogy elősegítsék az e szakaszban vázolt értékelést.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_34'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '35',
  null,
  'A bejelentett szervezetek azonosító száma és jegyzéke
(1) A Bizottság minden egyes bejelentett szervezethez egyetlen azonosító számot rendel, még akkor is, ha egy szervezetet egynél több uniós jogi aktus alapján jelentenek be.

(2) A Bizottság nyilvánosan közzéteszi az e rendelet szerint bejelentett szervezetek jegyzékét, ideértve az azonosító számukat és azon tevékenységeket, amelyek tekintetében azokat bejelentették. A Bizottság biztosítja, hogy a jegyzéket naprakészen tartsák.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '35',
  '1',
  '(1) A Bizottság minden egyes bejelentett szervezethez egyetlen azonosító számot rendel, még akkor is, ha egy szervezetet egynél több uniós jogi aktus alapján jelentenek be.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '35',
  '2',
  '(2) A Bizottság nyilvánosan közzéteszi az e rendelet szerint bejelentett szervezetek jegyzékét, ideértve az azonosító számukat és azon tevékenységeket, amelyek tekintetében azokat bejelentették. A Bizottság biztosítja, hogy a jegyzéket naprakészen tartsák.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_35'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  null,
  'A bejelentések változásai
(1) A bejelentő hatóságok – a 30. cikk (2) bekezdésében említett elektronikus bejelentési eszközön keresztül – értesítik a Bizottságot és a többi tagállamot a bejelentett szervezet bejelentésében bekövetkezett minden releváns változásról.

(2) A bejelentés hatályának kiterjesztésére a 29. és a 30. cikkben megállapított eljárásokat kell alkalmazni.

A bejelentést érintő, a hatályának kiterjesztésétől eltérő változásokra a (3)–(9) bekezdésben megállapított eljárásokat kell alkalmazni.

(3) Amennyiben egy bejelentett szervezet úgy dönt, hogy megszünteti a megfelelőségértékelési tevékenységeit, a lehető leghamarabb – és tervezett megszüntetés esetén a tevékenységeinek megszüntetését megelőzően legalább egy évvel – tájékoztatja a bejelentő hatóságot és az érintett szolgáltatókat. A bejelentett szervezet tanúsítványai a bejelentett szervezet tevékenységeinek megszüntetését követő kilenc hónapos időszakra érvényesek maradhatnak, feltéve, hogy egy másik bejelentett szervezet írásban megerősítette, hogy vállalni fogja a felelősséget az említett tanúsítványok hatálya alá tartozó nagy kockázatú MI-rendszerekért. Az utóbbi bejelentett szervezet az említett kilenc hónapos időszak végéig elvégzi az érintett nagy kockázatú MI-rendszerek teljes értékelését, mielőtt új tanúsítványokat adna ki az említett rendszerekre vonatkozóan. Amennyiben a bejelentett szervezet megszüntette tevékenységét, a bejelentő hatóság visszavonja a kijelölést.

(4) Amennyiben a bejelentő hatóságnak elegendő oka van úgy megítélni, hogy valamely bejelentett szervezet már nem felel meg a 31. cikkben megállapított követelményeknek, vagy elmulasztja teljesíteni a kötelezettségeit, a bejelentő hatóság a lehető legnagyobb gondossággal kivizsgálja az ügyet. Ezzel összefüggésben tájékoztatja az érintett bejelentett szervezetet a felmerült kifogásokról, és lehetőséget biztosít számára álláspontjának ismertetésére. Ha a bejelentő hatóság arra a következtetésre jut, hogy a bejelentett szervezet már nem felel meg a 31. cikkben megállapított követelményeknek, vagy elmulasztja teljesíteni a kötelezettségeit, adott esetben – az említett követelményeknek való megfelelés vagy az említett kötelezettségek teljesítése elmulasztásának súlyosságától függően – korlátozza, felfüggeszti vagy visszavonja a kijelölést. A bejelentő hatóság ennek megfelelően haladéktalanul tájékoztatja a Bizottságot és a többi tagállamot.

(5) Amennyiben a kijelölését felfüggesztették, korlátozták, vagy részben vagy egészben visszavonták, a bejelentett szervezet 10 napon belül tájékoztatja az érintett szolgáltatókat.

(6) A kijelölés korlátozása, felfüggesztése vagy visszavonása esetén a bejelentő hatóság megfelelő lépéseket tesz annak biztosítására, hogy az érintett bejelentett szervezet dokumentumait megőrizzék, valamint más tagállamok bejelentő hatóságai és a piacfelügyeleti hatóságok számára – azok kérésére – rendelkezésre bocsássák.

(7) A kijelölés korlátozása, felfüggesztése vagy visszavonása esetén a bejelentő hatóság:

a)

értékeli kell, hogy ez milyen hatással jár a bejelentett szervezet által kibocsátott tanúsítványokra nézve;

b)

a kijelölést érintő változások bejelentésétől számított három hónapon belül jelentést nyújt be megállapításairól a Bizottság és a többi tagállam számára;

c)

a piacon forgalmazott nagy kockázatú MI-rendszerek folyamatos megfelelőségének biztosítása érdekében előírja a bejelentett szervezet számára, hogy – a hatóság által meghatározott észszerű határidőn belül – függesszen fel vagy vonjon vissza minden jogtalanul kiadott tanúsítványt;

d)

tájékoztatja a Bizottságot és a tagállamokat azon tanúsítványokról, amelyek felfüggesztését vagy visszavonását előírta;

e)

megad a szolgáltató bejegyzett székhelye szerinti tagállam illetékes nemzeti hatóságainak minden releváns információt azon tanúsítványokról, amelyek felfüggesztését vagy visszavonását előírta; az említett hatóság szükség esetén meghozza a megfelelő intézkedéseket az egészséget, a biztonságot vagy az alapvető jogokat fenyegető potenciális kockázat elkerülése érdekében.

(8) A kijelölés felfüggesztése vagy korlátozása esetén a tanúsítványok – a jogtalanul kiállított tanúsítványok kivételével – érvényesek maradnak a következő körülmények egyikének esetén:

a)

a bejelentő hatóság – a felfüggesztést vagy korlátozást követő egy hónapon belül – megerősítette, hogy a felfüggesztés vagy a korlátozás által érintett tanúsítványokkal kapcsolatban nem áll fenn az egészséget, a biztonságot vagy az alapvető jogokat fenyegető kockázat, és a bejelentő hatóság felvázolta a felfüggesztés vagy a korlátozás feloldását célzó intézkedések ütemezését; vagy

b)

a bejelentő hatóság megerősítette, hogy a felfüggesztés vagy korlátozás folyamán nem fognak kiadni, módosítani vagy újra kiadni a felfüggesztés szempontjából releváns tanúsítványt, és kijelenti, hogy a bejelentett szervezet képes-e folytatni a felfüggesztés vagy a korlátozás időtartamára kiadott, meglévő tanúsítványok nyomon követését, és azokért továbbra is felelősséget vállalni; abban az esetben, ha a bejelentő hatóság megállapítja, hogy a bejelentett szervezet nem képes a kiadott, meglévő tanúsítványokat támogatni, a tanúsítvány hatálya alá tartozó rendszer szolgáltatójának a felfüggesztéstől vagy korlátozástól számított három hónapon belül írásban meg kell erősítenie a bejegyzett székhelye szerinti tagállam illetékes nemzeti hatóságai felé, hogy a felfüggesztés vagy a korlátozás időtartama alatt ideiglenesen egy másik minősített bejelentett szervezet vállalja a bejelentett szervezetnek a tanúsítványok nyomon követésére és az azokért való további felelősségvállalásra vonatkozó feladatait.

(9) A kijelölés visszavonása esetén a tanúsítványok – a jogtalanul kiállított tanúsítványok kivételével – a következő körülmények esetén kilenc hónapig érvényben maradnak:

a)

a tanúsítvány hatálya alá tartozó nagy kockázatú MI-rendszer szolgáltatójának bejegyzett székhelye szerinti tagállam illetékes nemzeti hatósága megerősítette, hogy nem áll fenn az egészséget, a biztonságot vagy az alapvető jogokat fenyegető, az érintett nagy kockázatú MI-rendszerekkel kapcsolatos kockázat; és

b)

egy másik bejelentett szervezet írásban megerősítette, hogy közvetlen felelősséget fog vállalni az említett MI-rendszerekért, és a kijelölés visszavonásától számított 12 hónapon belül elvégzi annak értékelését.

Az első albekezdésben említett körülmények esetén a tanúsítvány hatálya alá tartozó rendszer szolgáltatójának székhelye szerinti tagállam illetékes nemzeti hatósága további három hónapos időszakokkal – amelyek összességében nem haladhatják meg a 12 hónapot – meghosszabbíthatja a tanúsítványok ideiglenes érvényességét.

Az illetékes nemzeti hatóság vagy a kijelölés megváltozása által érintett bejelentett szervezet feladatait ellátó bejelentett szervezet erről haladéktalanul tájékoztatja a Bizottságot, a többi tagállamot és a többi bejelentett szervezetet.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '1',
  '(1) A bejelentő hatóságok – a 30. cikk (2) bekezdésében említett elektronikus bejelentési eszközön keresztül – értesítik a Bizottságot és a többi tagállamot a bejelentett szervezet bejelentésében bekövetkezett minden releváns változásról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '2',
  '(2) A bejelentés hatályának kiterjesztésére a 29. és a 30. cikkben megállapított eljárásokat kell alkalmazni.

A bejelentést érintő, a hatályának kiterjesztésétől eltérő változásokra a (3)–(9) bekezdésben megállapított eljárásokat kell alkalmazni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '3',
  '(3) Amennyiben egy bejelentett szervezet úgy dönt, hogy megszünteti a megfelelőségértékelési tevékenységeit, a lehető leghamarabb – és tervezett megszüntetés esetén a tevékenységeinek megszüntetését megelőzően legalább egy évvel – tájékoztatja a bejelentő hatóságot és az érintett szolgáltatókat. A bejelentett szervezet tanúsítványai a bejelentett szervezet tevékenységeinek megszüntetését követő kilenc hónapos időszakra érvényesek maradhatnak, feltéve, hogy egy másik bejelentett szervezet írásban megerősítette, hogy vállalni fogja a felelősséget az említett tanúsítványok hatálya alá tartozó nagy kockázatú MI-rendszerekért. Az utóbbi bejelentett szervezet az említett kilenc hónapos időszak végéig elvégzi az érintett nagy kockázatú MI-rendszerek teljes értékelését, mielőtt új tanúsítványokat adna ki az említett rendszerekre vonatkozóan. Amennyiben a bejelentett szervezet megszüntette tevékenységét, a bejelentő hatóság visszavonja a kijelölést.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '4',
  '(4) Amennyiben a bejelentő hatóságnak elegendő oka van úgy megítélni, hogy valamely bejelentett szervezet már nem felel meg a 31. cikkben megállapított követelményeknek, vagy elmulasztja teljesíteni a kötelezettségeit, a bejelentő hatóság a lehető legnagyobb gondossággal kivizsgálja az ügyet. Ezzel összefüggésben tájékoztatja az érintett bejelentett szervezetet a felmerült kifogásokról, és lehetőséget biztosít számára álláspontjának ismertetésére. Ha a bejelentő hatóság arra a következtetésre jut, hogy a bejelentett szervezet már nem felel meg a 31. cikkben megállapított követelményeknek, vagy elmulasztja teljesíteni a kötelezettségeit, adott esetben – az említett követelményeknek való megfelelés vagy az említett kötelezettségek teljesítése elmulasztásának súlyosságától függően – korlátozza, felfüggeszti vagy visszavonja a kijelölést. A bejelentő hatóság ennek megfelelően haladéktalanul tájékoztatja a Bizottságot és a többi tagállamot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '5',
  '(5) Amennyiben a kijelölését felfüggesztették, korlátozták, vagy részben vagy egészben visszavonták, a bejelentett szervezet 10 napon belül tájékoztatja az érintett szolgáltatókat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '6',
  '(6) A kijelölés korlátozása, felfüggesztése vagy visszavonása esetén a bejelentő hatóság megfelelő lépéseket tesz annak biztosítására, hogy az érintett bejelentett szervezet dokumentumait megőrizzék, valamint más tagállamok bejelentő hatóságai és a piacfelügyeleti hatóságok számára – azok kérésére – rendelkezésre bocsássák.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '7',
  '(7) A kijelölés korlátozása, felfüggesztése vagy visszavonása esetén a bejelentő hatóság:

a)

értékeli kell, hogy ez milyen hatással jár a bejelentett szervezet által kibocsátott tanúsítványokra nézve;

b)

a kijelölést érintő változások bejelentésétől számított három hónapon belül jelentést nyújt be megállapításairól a Bizottság és a többi tagállam számára;

c)

a piacon forgalmazott nagy kockázatú MI-rendszerek folyamatos megfelelőségének biztosítása érdekében előírja a bejelentett szervezet számára, hogy – a hatóság által meghatározott észszerű határidőn belül – függesszen fel vagy vonjon vissza minden jogtalanul kiadott tanúsítványt;

d)

tájékoztatja a Bizottságot és a tagállamokat azon tanúsítványokról, amelyek felfüggesztését vagy visszavonását előírta;

e)

megad a szolgáltató bejegyzett székhelye szerinti tagállam illetékes nemzeti hatóságainak minden releváns információt azon tanúsítványokról, amelyek felfüggesztését vagy visszavonását előírta; az említett hatóság szükség esetén meghozza a megfelelő intézkedéseket az egészséget, a biztonságot vagy az alapvető jogokat fenyegető potenciális kockázat elkerülése érdekében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '7(a)',
  'a) értékeli kell, hogy ez milyen hatással jár a bejelentett szervezet által kibocsátott tanúsítványokra nézve;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '7(b)',
  'b) a kijelölést érintő változások bejelentésétől számított három hónapon belül jelentést nyújt be megállapításairól a Bizottság és a többi tagállam számára;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '7(c)',
  'c) a piacon forgalmazott nagy kockázatú MI-rendszerek folyamatos megfelelőségének biztosítása érdekében előírja a bejelentett szervezet számára, hogy – a hatóság által meghatározott észszerű határidőn belül – függesszen fel vagy vonjon vissza minden jogtalanul kiadott tanúsítványt;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '7(d)',
  'd) tájékoztatja a Bizottságot és a tagállamokat azon tanúsítványokról, amelyek felfüggesztését vagy visszavonását előírta;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '7(e)',
  'e) megad a szolgáltató bejegyzett székhelye szerinti tagállam illetékes nemzeti hatóságainak minden releváns információt azon tanúsítványokról, amelyek felfüggesztését vagy visszavonását előírta; az említett hatóság szükség esetén meghozza a megfelelő intézkedéseket az egészséget, a biztonságot vagy az alapvető jogokat fenyegető potenciális kockázat elkerülése érdekében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '8',
  '(8) A kijelölés felfüggesztése vagy korlátozása esetén a tanúsítványok – a jogtalanul kiállított tanúsítványok kivételével – érvényesek maradnak a következő körülmények egyikének esetén:

a)

a bejelentő hatóság – a felfüggesztést vagy korlátozást követő egy hónapon belül – megerősítette, hogy a felfüggesztés vagy a korlátozás által érintett tanúsítványokkal kapcsolatban nem áll fenn az egészséget, a biztonságot vagy az alapvető jogokat fenyegető kockázat, és a bejelentő hatóság felvázolta a felfüggesztés vagy a korlátozás feloldását célzó intézkedések ütemezését; vagy

b)

a bejelentő hatóság megerősítette, hogy a felfüggesztés vagy korlátozás folyamán nem fognak kiadni, módosítani vagy újra kiadni a felfüggesztés szempontjából releváns tanúsítványt, és kijelenti, hogy a bejelentett szervezet képes-e folytatni a felfüggesztés vagy a korlátozás időtartamára kiadott, meglévő tanúsítványok nyomon követését, és azokért továbbra is felelősséget vállalni; abban az esetben, ha a bejelentő hatóság megállapítja, hogy a bejelentett szervezet nem képes a kiadott, meglévő tanúsítványokat támogatni, a tanúsítvány hatálya alá tartozó rendszer szolgáltatójának a felfüggesztéstől vagy korlátozástól számított három hónapon belül írásban meg kell erősítenie a bejegyzett székhelye szerinti tagállam illetékes nemzeti hatóságai felé, hogy a felfüggesztés vagy a korlátozás időtartama alatt ideiglenesen egy másik minősített bejelentett szervezet vállalja a bejelentett szervezetnek a tanúsítványok nyomon követésére és az azokért való további felelősségvállalásra vonatkozó feladatait.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '8(a)',
  'a) a bejelentő hatóság – a felfüggesztést vagy korlátozást követő egy hónapon belül – megerősítette, hogy a felfüggesztés vagy a korlátozás által érintett tanúsítványokkal kapcsolatban nem áll fenn az egészséget, a biztonságot vagy az alapvető jogokat fenyegető kockázat, és a bejelentő hatóság felvázolta a felfüggesztés vagy a korlátozás feloldását célzó intézkedések ütemezését; vagy',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '8(b)',
  'b) a bejelentő hatóság megerősítette, hogy a felfüggesztés vagy korlátozás folyamán nem fognak kiadni, módosítani vagy újra kiadni a felfüggesztés szempontjából releváns tanúsítványt, és kijelenti, hogy a bejelentett szervezet képes-e folytatni a felfüggesztés vagy a korlátozás időtartamára kiadott, meglévő tanúsítványok nyomon követését, és azokért továbbra is felelősséget vállalni; abban az esetben, ha a bejelentő hatóság megállapítja, hogy a bejelentett szervezet nem képes a kiadott, meglévő tanúsítványokat támogatni, a tanúsítvány hatálya alá tartozó rendszer szolgáltatójának a felfüggesztéstől vagy korlátozástól számított három hónapon belül írásban meg kell erősítenie a bejegyzett székhelye szerinti tagállam illetékes nemzeti hatóságai felé, hogy a felfüggesztés vagy a korlátozás időtartama alatt ideiglenesen egy másik minősített bejelentett szervezet vállalja a bejelentett szervezetnek a tanúsítványok nyomon követésére és az azokért való további felelősségvállalásra vonatkozó feladatait.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '9',
  '(9) A kijelölés visszavonása esetén a tanúsítványok – a jogtalanul kiállított tanúsítványok kivételével – a következő körülmények esetén kilenc hónapig érvényben maradnak:

a)

a tanúsítvány hatálya alá tartozó nagy kockázatú MI-rendszer szolgáltatójának bejegyzett székhelye szerinti tagállam illetékes nemzeti hatósága megerősítette, hogy nem áll fenn az egészséget, a biztonságot vagy az alapvető jogokat fenyegető, az érintett nagy kockázatú MI-rendszerekkel kapcsolatos kockázat; és

b)

egy másik bejelentett szervezet írásban megerősítette, hogy közvetlen felelősséget fog vállalni az említett MI-rendszerekért, és a kijelölés visszavonásától számított 12 hónapon belül elvégzi annak értékelését.

Az első albekezdésben említett körülmények esetén a tanúsítvány hatálya alá tartozó rendszer szolgáltatójának székhelye szerinti tagállam illetékes nemzeti hatósága további három hónapos időszakokkal – amelyek összességében nem haladhatják meg a 12 hónapot – meghosszabbíthatja a tanúsítványok ideiglenes érvényességét.

Az illetékes nemzeti hatóság vagy a kijelölés megváltozása által érintett bejelentett szervezet feladatait ellátó bejelentett szervezet erről haladéktalanul tájékoztatja a Bizottságot, a többi tagállamot és a többi bejelentett szervezetet.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '9(a)',
  'a) a tanúsítvány hatálya alá tartozó nagy kockázatú MI-rendszer szolgáltatójának bejegyzett székhelye szerinti tagállam illetékes nemzeti hatósága megerősítette, hogy nem áll fenn az egészséget, a biztonságot vagy az alapvető jogokat fenyegető, az érintett nagy kockázatú MI-rendszerekkel kapcsolatos kockázat; és',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '36',
  '9(b)',
  'b) egy másik bejelentett szervezet írásban megerősítette, hogy közvetlen felelősséget fog vállalni az említett MI-rendszerekért, és a kijelölés visszavonásától számított 12 hónapon belül elvégzi annak értékelését.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_36'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '37',
  null,
  'A bejelentett szervezetek alkalmasságának vitatása
(1) A Bizottság szükség esetén kivizsgál minden olyan esetet, amikor okkal vonható kétségbe a bejelentett szervezet alkalmassága, vagy az, hogy a bejelentett szervezet folyamatosan teljesíti-e a 31. cikkben megállapított követelményeket és az alkalmazandó felelősségi köreit.

(2) A bejelentő hatóság – kérésre – megad a Bizottságnak minden, az érintett bejelentett szervezet bejelentésével vagy alkalmasságának fenntartásával kapcsolatos információt.

(3) A Bizottság biztosítja, hogy az e cikk alapján lefolytatott vizsgálatai során a birtokába jutott valamennyi érzékeny információt a 78. cikkel összhangban bizalmasan kezeljék.

(4) Amennyiben a Bizottság megbizonyosodik arról, hogy egy bejelentett szervezet nem vagy már nem tesz eleget a rá vonatkozó bejelentés követelményeinek, ennek megfelelően tájékoztatja a bejelentő tagállamot, és felkéri a szükséges korrekciós intézkedések megtételére, ideértve szükség esetén a bejelentés felfüggesztését vagy visszavonását is. Amennyiben a tagállam elmulasztja meghozni a szükséges korrekciós intézkedéseket, a Bizottság végrehajtási jogi aktus útján felfüggesztheti, korlátozhatja vagy visszavonhatja a kijelölést. Az említett végrehajtási jogi aktust a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '37',
  '1',
  '(1) A Bizottság szükség esetén kivizsgál minden olyan esetet, amikor okkal vonható kétségbe a bejelentett szervezet alkalmassága, vagy az, hogy a bejelentett szervezet folyamatosan teljesíti-e a 31. cikkben megállapított követelményeket és az alkalmazandó felelősségi köreit.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '37',
  '2',
  '(2) A bejelentő hatóság – kérésre – megad a Bizottságnak minden, az érintett bejelentett szervezet bejelentésével vagy alkalmasságának fenntartásával kapcsolatos információt.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '37',
  '3',
  '(3) A Bizottság biztosítja, hogy az e cikk alapján lefolytatott vizsgálatai során a birtokába jutott valamennyi érzékeny információt a 78. cikkel összhangban bizalmasan kezeljék.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '37',
  '4',
  '(4) Amennyiben a Bizottság megbizonyosodik arról, hogy egy bejelentett szervezet nem vagy már nem tesz eleget a rá vonatkozó bejelentés követelményeinek, ennek megfelelően tájékoztatja a bejelentő tagállamot, és felkéri a szükséges korrekciós intézkedések megtételére, ideértve szükség esetén a bejelentés felfüggesztését vagy visszavonását is. Amennyiben a tagállam elmulasztja meghozni a szükséges korrekciós intézkedéseket, a Bizottság végrehajtási jogi aktus útján felfüggesztheti, korlátozhatja vagy visszavonhatja a kijelölést. Az említett végrehajtási jogi aktust a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_37'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '38',
  null,
  'A bejelentett szervezetek koordinálása
(1) A Bizottság biztosítja, hogy – a nagy kockázatú MI-rendszerek tekintetében – az e rendelet szerinti megfelelőségértékelési eljárásokban részt vevő bejelentett szervezetek között megfelelő koordinációt és együttműködést vezessenek be és megfelelően működtessenek a bejelentett szervezetek ágazati csoportja formájában.

(2) Minden egyes bejelentő hatóságnak biztosítania kell, hogy az általa bejelentett szervezetek közvetlenül vagy kijelölt képviselőkön keresztül részt vegyenek az (1) bekezdésben említett csoport munkájában.

(3) A Bizottság gondoskodik az ismereteknek és a legjobb gyakorlatoknak a bejelentő hatóságok közötti cseréjéről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_38'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '38',
  '1',
  '(1) A Bizottság biztosítja, hogy – a nagy kockázatú MI-rendszerek tekintetében – az e rendelet szerinti megfelelőségértékelési eljárásokban részt vevő bejelentett szervezetek között megfelelő koordinációt és együttműködést vezessenek be és megfelelően működtessenek a bejelentett szervezetek ágazati csoportja formájában.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_38'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '38',
  '2',
  '(2) Minden egyes bejelentő hatóságnak biztosítania kell, hogy az általa bejelentett szervezetek közvetlenül vagy kijelölt képviselőkön keresztül részt vegyenek az (1) bekezdésben említett csoport munkájában.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_38'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '38',
  '3',
  '(3) A Bizottság gondoskodik az ismereteknek és a legjobb gyakorlatoknak a bejelentő hatóságok közötti cseréjéről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_38'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '39',
  null,
  'Harmadik országok megfelelőségértékelő szervezetei
Az olyan harmadik ország joga szerint létrehozott megfelelőségértékelő szervezetek, amellyel az Unió megállapodást kötött, felhatalmazhatók a bejelentett szervezetek e rendelet szerinti tevékenységeinek elvégzésére, feltéve, hogy megfelelnek a 31. cikkben megállapított követelményeknek, vagy biztosítják az egyenértékű szintű megfelelőséget.

5. SZAKASZ

Szabványok, megfelelőségértékelés, tanúsítványok, regisztráció',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_39'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '40',
  null,
  'Harmonizált szabványok és szabványosítási szabvány jellegű dokumentumok
(1) Azon nagy kockázatú vagy általános célú MI-rendszerekről, amelyek megfelelnek az olyan harmonizált szabványoknak vagy azok részeinek, amelyek hivatkozásait az 1025/2012/EU rendeletnek megfelelően közzétették az Európai Unió Hivatalos Lapjában , vélelmezni kell, hogy megfelelnek az e fejezet 2. szakaszában meghatározott követelményeknek, vagy adott esetben az e rendelet V. fejezetének 2. és 3. szakaszában meghatározott kötelezettségeknek, amennyiben az említett szabványok e követelményekre vagy kötelezettségekre kiterjednek.

(2) A Bizottság – az 1025/2012/EU rendelet 10. cikkével összhangban – indokolatlan késedelem nélkül bocsátja ki az e fejezet 2. szakaszában meghatározott valamennyi követelményre kiterjedő szabványosítási kérelmeket és adott esetben az e rendelet V. fejezetének 2. és 3. szakaszában meghatározott kötelezettségekre kiterjedő szabványosítási kérelmeket. A szabványosítási kérelemben kérni kell az MI-rendszerek erőforrás-teljesítményének javítását célzó jelentéstételi és dokumentációs folyamatokra – így például életciklusa során a nagy kockázatú MI-rendszer energia- és egyéb erőforrás-fogyasztásának csökkentésére –, valamint az általános célú MI-modellek energiahatékony fejlesztésére vonatkozó szabvány jellegű dokumentumokat is. A szabványosítási kérelem elkészítésekor a Bizottság konzultál a Testülettel és a releváns érdekelt felekkel, ideértve a tanácsadó fórumot is.

Az európai szabványügyi szervezeteknek címzett szabványosítási kérelem kiadásakor a Bizottság meghatározza, hogy a szabványoknak világosnak és konzisztensnek kell lenniük – többek között az I. mellékletben felsorolt meglévő uniós harmonizációs jogszabályok hatálya alá tartozó termékekre vonatkozóan a különböző ágazatokban kidolgozott szabványokkal –, és annak biztosítására kell irányulniuk, hogy az Unióban forgalomba hozott vagy üzembe helyezett nagy kockázatú MI-rendszerek vagy általános célú MI-modellek megfeleljenek az e rendeletben megállapított releváns követelményeknek vagy kötelezettségeknek.

A Bizottság az 1025/2012/EU rendelet 24. cikkének megfelelően felkéri az európai szabványügyi szervezeteket, hogy igazolják az e bekezdés első és második albekezdésében említett célkitűzések elérésére tett erőfeszítéseiket.

(3) A szabványosítási folyamat résztvevőinek törekedniük kell arra, hogy előmozdítsák az MI-vel kapcsolatos beruházásokat és innovációt – többek között a jogbiztonság, valamint az uniós piac versenyképességének és növekedésének fokozása révén –, hozzájáruljanak a szabványosítás terén folytatott globális együttműködés megerősítéséhez, valamint az MI területén meglévő, az uniós értékekkel, alapvető jogokkal és érdekekkel összhangban álló nemzetközi szabványok figyelembevételéhez, továbbá hogy javítsák a többszereplős irányítást, biztosítva az érdekek kiegyensúlyozott képviseletét és valamennyi érdekelt fél tényleges részvételét az 1025/2012/EU rendelet 5., 6. és 7. cikkével összhangban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '40',
  '1',
  '(1) Azon nagy kockázatú vagy általános célú MI-rendszerekről, amelyek megfelelnek az olyan harmonizált szabványoknak vagy azok részeinek, amelyek hivatkozásait az 1025/2012/EU rendeletnek megfelelően közzétették az Európai Unió Hivatalos Lapjában , vélelmezni kell, hogy megfelelnek az e fejezet 2. szakaszában meghatározott követelményeknek, vagy adott esetben az e rendelet V. fejezetének 2. és 3. szakaszában meghatározott kötelezettségeknek, amennyiben az említett szabványok e követelményekre vagy kötelezettségekre kiterjednek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '40',
  '2',
  '(2) A Bizottság – az 1025/2012/EU rendelet 10. cikkével összhangban – indokolatlan késedelem nélkül bocsátja ki az e fejezet 2. szakaszában meghatározott valamennyi követelményre kiterjedő szabványosítási kérelmeket és adott esetben az e rendelet V. fejezetének 2. és 3. szakaszában meghatározott kötelezettségekre kiterjedő szabványosítási kérelmeket. A szabványosítási kérelemben kérni kell az MI-rendszerek erőforrás-teljesítményének javítását célzó jelentéstételi és dokumentációs folyamatokra – így például életciklusa során a nagy kockázatú MI-rendszer energia- és egyéb erőforrás-fogyasztásának csökkentésére –, valamint az általános célú MI-modellek energiahatékony fejlesztésére vonatkozó szabvány jellegű dokumentumokat is. A szabványosítási kérelem elkészítésekor a Bizottság konzultál a Testülettel és a releváns érdekelt felekkel, ideértve a tanácsadó fórumot is.

Az európai szabványügyi szervezeteknek címzett szabványosítási kérelem kiadásakor a Bizottság meghatározza, hogy a szabványoknak világosnak és konzisztensnek kell lenniük – többek között az I. mellékletben felsorolt meglévő uniós harmonizációs jogszabályok hatálya alá tartozó termékekre vonatkozóan a különböző ágazatokban kidolgozott szabványokkal –, és annak biztosítására kell irányulniuk, hogy az Unióban forgalomba hozott vagy üzembe helyezett nagy kockázatú MI-rendszerek vagy általános célú MI-modellek megfeleljenek az e rendeletben megállapított releváns követelményeknek vagy kötelezettségeknek.

A Bizottság az 1025/2012/EU rendelet 24. cikkének megfelelően felkéri az európai szabványügyi szervezeteket, hogy igazolják az e bekezdés első és második albekezdésében említett célkitűzések elérésére tett erőfeszítéseiket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '40',
  '3',
  '(3) A szabványosítási folyamat résztvevőinek törekedniük kell arra, hogy előmozdítsák az MI-vel kapcsolatos beruházásokat és innovációt – többek között a jogbiztonság, valamint az uniós piac versenyképességének és növekedésének fokozása révén –, hozzájáruljanak a szabványosítás terén folytatott globális együttműködés megerősítéséhez, valamint az MI területén meglévő, az uniós értékekkel, alapvető jogokkal és érdekekkel összhangban álló nemzetközi szabványok figyelembevételéhez, továbbá hogy javítsák a többszereplős irányítást, biztosítva az érdekek kiegyensúlyozott képviseletét és valamennyi érdekelt fél tényleges részvételét az 1025/2012/EU rendelet 5., 6. és 7. cikkével összhangban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_40'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '41',
  null,
  'Közös előírások
(1) A Bizottság elfogadhat az e fejezet 2. szakaszában foglalt követelményekre vagy adott esetben az V. fejezetben 2. és 3. szakaszában meghatározott kötelezettségekre vonatkozó közös előírásokat megállapító végrehajtási jogi aktusokat, amennyiben teljesültek a következő feltételek:

a)

a Bizottság az 1025/2012/EU rendelet 10. cikkének (1) bekezdése alapján felkért egy vagy több európai szabványügyi szervezetet az e fejezet 2. szakaszában foglalt követelményekre vagy – adott esetben – az V. fejezet 2. és 3. szakaszában foglalt kötelezettségekre vonatkozó harmonizált szabvány kidolgozására, és:

i.

a felkérést egyik európai szabványügyi szervezet sem fogadta be; vagy

ii.

a felkérés szerinti harmonizált szabványokat nem nyújtották be az 1025/2012/EU rendelet 10. cikkének (1) bekezdésének megfelelően meghatározott határidőn belül; vagy

iii.

a vonatkozó harmonizált szabványok nem kezelnek kielégítő mértékben alapjogi aggályokat; vagy

iv.

az említett szabványok nem felelnek meg a felkérésnek; és

b)

az Európai Unió Hivatalos Lapjában nem tettek közzé – az 1025/2012/EU rendeletnek megfelelően – hivatkozást az e fejezet 2. szakaszában említett követelményekre vagy adott esetben az V. fejezet 2. és 3. szakaszában említett kötelezettségekre kiterjedő harmonizált szabványokra, és észszerű időn belül várhatóan nem is tesznek közzé ilyen hivatkozást.

A közös előírások kidolgozása során a Bizottság konzultál a 67. cikkben említett tanácsadó fórummal.

Az e bekezdés első albekezdésében említett végrehajtási jogi aktusokat a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.

(2) A végrehajtási jogi aktus tervezetének kidolgozása előtt a Bizottság tájékoztatja az 1025/2012/EU rendelet 22. cikkében említett bizottságot arról, hogy megítélése szerint teljesülnek az e cikk (1) bekezdésében megállapított feltételek.

(3) Azon nagy kockázatú MI-rendszerekről vagy általános célú MI-modellekről, amelyek megfelelnek az (1) bekezdésben említett közös előírásoknak vagy ezen előírások egyes részeinek, azt kell vélelmezni, hogy megfelelnek az e fejezet 2. szakaszában meghatározott követelményeknek, vagy adott esetben megfelelnek az V. fejezet 2. és 3. szakaszában említett kötelezettségeknek, amennyiben az említett közös előírások az említett követelményekre vagy az említett kötelezettségekre is kiterjednek.

(4) Amennyiben valamely európai szabványügyi szervezet harmonizált szabványt fogad el, és javasolja a Bizottságnak, hogy arra vonatkozóan tegyen közzé hivatkozást az Európai Unió Hivatalos Lapjában , a Bizottság az 1025/2012/EU rendelettel összhangban értékeli a harmonizált szabványt. Amikor egy harmonizált szabvány hivatkozását közzéteszik az Európai Unió Hivatalos Lapjában , a Bizottság hatályon kívül helyezi az (1) bekezdésben említett végrehajtási jogi aktusokat vagy azok azon részeit, amelyek az e fejezet 2. szakaszában meghatározott ugyanazon követelményekre, vagy adott esetben az V. fejezet 2. és 3. szakaszában meghatározott ugyanazon kötelezettségekre vonatkoznak.

(5) Amennyiben a nagy kockázatú MI-rendszerek vagy az általános célú MI-modellek szolgáltatói nem felelnek meg az (1) bekezdésben említett közös előírásoknak, megfelelően igazolniuk kell, hogy olyan műszaki megoldásokat fogadtak el, amelyek – azokkal legalább egyenértékű szinten – megfelelnek az e fejezet 2. szakaszában említett követelményeknek, vagy adott esetben megfelelnek az V. fejezet 2. és 3. szakaszában meghatározott kötelezettségeknek.

(6) Amennyiben egy tagállam úgy ítéli meg, hogy valamely közös előírás nem felel meg teljes mértékben a 2. szakaszban meghatározott követelményeknek, vagy adott esetben nem felel meg teljes mértékben az V. fejezet 2. és 3. szakaszában meghatározott kötelezettségeknek, erről részletes magyarázatot mellékelve tájékoztatja a Bizottságot. A Bizottság értékeli az említett információkat, és adott esetben módosítja az érintett közös előírást megállapító végrehajtási jogi aktust.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '41',
  '1',
  '(1) A Bizottság elfogadhat az e fejezet 2. szakaszában foglalt követelményekre vagy adott esetben az V. fejezetben 2. és 3. szakaszában meghatározott kötelezettségekre vonatkozó közös előírásokat megállapító végrehajtási jogi aktusokat, amennyiben teljesültek a következő feltételek:

a)

a Bizottság az 1025/2012/EU rendelet 10. cikkének (1) bekezdése alapján felkért egy vagy több európai szabványügyi szervezetet az e fejezet 2. szakaszában foglalt követelményekre vagy – adott esetben – az V. fejezet 2. és 3. szakaszában foglalt kötelezettségekre vonatkozó harmonizált szabvány kidolgozására, és:

i.

a felkérést egyik európai szabványügyi szervezet sem fogadta be; vagy

ii.

a felkérés szerinti harmonizált szabványokat nem nyújtották be az 1025/2012/EU rendelet 10. cikkének (1) bekezdésének megfelelően meghatározott határidőn belül; vagy

iii.

a vonatkozó harmonizált szabványok nem kezelnek kielégítő mértékben alapjogi aggályokat; vagy

iv.

az említett szabványok nem felelnek meg a felkérésnek; és

b)

az Európai Unió Hivatalos Lapjában nem tettek közzé – az 1025/2012/EU rendeletnek megfelelően – hivatkozást az e fejezet 2. szakaszában említett követelményekre vagy adott esetben az V. fejezet 2. és 3. szakaszában említett kötelezettségekre kiterjedő harmonizált szabványokra, és észszerű időn belül várhatóan nem is tesznek közzé ilyen hivatkozást.

A közös előírások kidolgozása során a Bizottság konzultál a 67. cikkben említett tanácsadó fórummal.

Az e bekezdés első albekezdésében említett végrehajtási jogi aktusokat a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '41',
  '1(a)',
  'a) a Bizottság az 1025/2012/EU rendelet 10. cikkének (1) bekezdése alapján felkért egy vagy több európai szabványügyi szervezetet az e fejezet 2. szakaszában foglalt követelményekre vagy – adott esetben – az V. fejezet 2. és 3. szakaszában foglalt kötelezettségekre vonatkozó harmonizált szabvány kidolgozására, és:

i.

a felkérést egyik európai szabványügyi szervezet sem fogadta be; vagy',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '41',
  '1(b)',
  'b) az Európai Unió Hivatalos Lapjában nem tettek közzé – az 1025/2012/EU rendeletnek megfelelően – hivatkozást az e fejezet 2. szakaszában említett követelményekre vagy adott esetben az V. fejezet 2. és 3. szakaszában említett kötelezettségekre kiterjedő harmonizált szabványokra, és észszerű időn belül várhatóan nem is tesznek közzé ilyen hivatkozást.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '41',
  '2',
  '(2) A végrehajtási jogi aktus tervezetének kidolgozása előtt a Bizottság tájékoztatja az 1025/2012/EU rendelet 22. cikkében említett bizottságot arról, hogy megítélése szerint teljesülnek az e cikk (1) bekezdésében megállapított feltételek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '41',
  '3',
  '(3) Azon nagy kockázatú MI-rendszerekről vagy általános célú MI-modellekről, amelyek megfelelnek az (1) bekezdésben említett közös előírásoknak vagy ezen előírások egyes részeinek, azt kell vélelmezni, hogy megfelelnek az e fejezet 2. szakaszában meghatározott követelményeknek, vagy adott esetben megfelelnek az V. fejezet 2. és 3. szakaszában említett kötelezettségeknek, amennyiben az említett közös előírások az említett követelményekre vagy az említett kötelezettségekre is kiterjednek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '41',
  '4',
  '(4) Amennyiben valamely európai szabványügyi szervezet harmonizált szabványt fogad el, és javasolja a Bizottságnak, hogy arra vonatkozóan tegyen közzé hivatkozást az Európai Unió Hivatalos Lapjában , a Bizottság az 1025/2012/EU rendelettel összhangban értékeli a harmonizált szabványt. Amikor egy harmonizált szabvány hivatkozását közzéteszik az Európai Unió Hivatalos Lapjában , a Bizottság hatályon kívül helyezi az (1) bekezdésben említett végrehajtási jogi aktusokat vagy azok azon részeit, amelyek az e fejezet 2. szakaszában meghatározott ugyanazon követelményekre, vagy adott esetben az V. fejezet 2. és 3. szakaszában meghatározott ugyanazon kötelezettségekre vonatkoznak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '41',
  '5',
  '(5) Amennyiben a nagy kockázatú MI-rendszerek vagy az általános célú MI-modellek szolgáltatói nem felelnek meg az (1) bekezdésben említett közös előírásoknak, megfelelően igazolniuk kell, hogy olyan műszaki megoldásokat fogadtak el, amelyek – azokkal legalább egyenértékű szinten – megfelelnek az e fejezet 2. szakaszában említett követelményeknek, vagy adott esetben megfelelnek az V. fejezet 2. és 3. szakaszában meghatározott kötelezettségeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '41',
  '6',
  '(6) Amennyiben egy tagállam úgy ítéli meg, hogy valamely közös előírás nem felel meg teljes mértékben a 2. szakaszban meghatározott követelményeknek, vagy adott esetben nem felel meg teljes mértékben az V. fejezet 2. és 3. szakaszában meghatározott kötelezettségeknek, erről részletes magyarázatot mellékelve tájékoztatja a Bizottságot. A Bizottság értékeli az említett információkat, és adott esetben módosítja az érintett közös előírást megállapító végrehajtási jogi aktust.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_41'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '42',
  null,
  'A bizonyos követelményeknek való megfelelés vélelme
(1) Vélelmezni kell, hogy azok a nagy kockázatú MI-rendszerek, amelyeket azon konkrét földrajzi, viselkedési, kontextuális vagy funkcionális környezetet tükröző adatok alapján tanítottak be és teszteltek, amely környezeten belül használni kívánják őket, megfelelnek a 10. cikk (4) bekezdésében megállapított vonatkozó követelménynek.

(2) Azokról a nagy kockázatú MI-rendszerekről, amelyek tanúsítvánnyal rendelkeznek, vagy amelyekre az (EU) 2019/881 rendelet alapján valamely kiberbiztonsági rendszer keretében megfelelőségi nyilatkozatot adtak ki, és amelyek hivatkozásait közzétették az Európai Unió Hivatalos Lapjában , azt kell vélelmezni, hogy megfelelnek az e rendelet 15. cikkében foglalt kiberbiztonsági követelményeknek, amennyiben a kiberbiztonsági tanúsítvány vagy megfelelőségi nyilatkozat vagy annak részei e követelményekre is kiterjednek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_42'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '42',
  '1',
  '(1) Vélelmezni kell, hogy azok a nagy kockázatú MI-rendszerek, amelyeket azon konkrét földrajzi, viselkedési, kontextuális vagy funkcionális környezetet tükröző adatok alapján tanítottak be és teszteltek, amely környezeten belül használni kívánják őket, megfelelnek a 10. cikk (4) bekezdésében megállapított vonatkozó követelménynek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_42'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '42',
  '2',
  '(2) Azokról a nagy kockázatú MI-rendszerekről, amelyek tanúsítvánnyal rendelkeznek, vagy amelyekre az (EU) 2019/881 rendelet alapján valamely kiberbiztonsági rendszer keretében megfelelőségi nyilatkozatot adtak ki, és amelyek hivatkozásait közzétették az Európai Unió Hivatalos Lapjában , azt kell vélelmezni, hogy megfelelnek az e rendelet 15. cikkében foglalt kiberbiztonsági követelményeknek, amennyiben a kiberbiztonsági tanúsítvány vagy megfelelőségi nyilatkozat vagy annak részei e követelményekre is kiterjednek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_42'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  null,
  'Megfelelőségértékelés
(1) A III. melléklet 1. pontjában felsorolt nagy kockázatú MI-rendszerek esetében, amennyiben valamely nagy kockázatú MI-rendszer a 2. szakaszban meghatározott követelményeknek való megfelelése igazolása során a szolgáltató a 40. cikkben említett harmonizált szabványokat, vagy adott esetben a 41. cikkben említett közös előírásokat alkalmazta, a szolgáltatónak a következőkön alapuló megfelelőségértékelési eljárások egyikét kell választania:

a)

a VI. mellékletben említett belső ellenőrzés; vagy

b)

a minőségirányítási rendszer és a műszaki dokumentáció valamely bejelentett szervezet bevonásával történő értékelése, a VII. mellékletben említettek szerint.

Annak igazolása során, hogy valamely nagy kockázatú MI-rendszer megfelel a 2. szakaszban foglalt követelményeknek, a szolgáltatónak a VII. mellékletben meghatározott megfelelőségértékelési eljárást kell követnie a következő esetekben:

a)

a 40. cikkben említett harmonizált szabványok nem léteznek, és a 41. cikkben említett közös előírások nem állnak rendelkezésre;

b)

a szolgáltató nem alkalmazta a harmonizált szabványt, vagy annak csak egy részét alkalmazta;

c)

az a) pontban említett közös előírások léteznek, de a szolgáltató nem alkalmazta őket;

d)

az a) pontban említett egy vagy több harmonizált szabványt korlátozással és csak a szabvány korlátozott részére tettek közzé.

A VII. mellékletben említett megfelelőségértékelési eljárás céljából a szolgáltató a bejelentett szervezetek bármelyikét választhatja. Azonban amennyiben a nagy kockázatú MI-rendszert bűnüldöző, bevándorlási vagy menekültügyi hatóságok, valamint uniós intézmények, szervek, hivatalok vagy ügynökségek szándékoznak üzembe helyezni, a 74. cikk (8) vagy – adott esetben – (9) bekezdésében említett piacfelügyeleti hatóságnak kell eljárnia bejelentett szervezetként.

(2) A III. melléklet 2–8. pontjában említett nagy kockázatú MI-rendszerek esetében a szolgáltatóknak a VI. mellékletben említett, belső ellenőrzésen alapuló megfelelőségértékelési eljárást kell követniük, amely nem rendelkezik bejelentett szervezet bevonásáról.

(3) Az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó nagy kockázatú MI-rendszerek esetében a szolgáltatónak az említett jogi aktusokban előírt megfelelőségértékelést kell követnie. Az e fejezet 2. szakaszában foglalt követelményeket alkalmazni kell az említett nagy kockázatú MI-rendszerekre, és azoknak az említett értékelés részét kell képezniük. A VII. melléklet 4.3., 4.4., 4.5. pontja és 4.6. pontjának ötödik bekezdése szintén alkalmazandó.

Az értékelés céljából az említett jogi aktusok alapján bejelentett szervezeteket fel kell jogosítani annak ellenőrzésére, hogy a nagy kockázatú MI-rendszerek megfelelnek-e a 2. szakaszban foglalt követelményeknek, feltéve, hogy az említett bejelentett szervezeteknek a 31. cikk (4), (5), (10) és (11) bekezdésében megállapított követelményeknek való megfelelését az említett jogi aktusok szerinti bejelentési eljárás keretében értékelték.

Amennyiben az I. melléklet A. szakaszában felsorolt valamely jogi aktus lehetővé teszik a termék gyártója számára, hogy kimaradjon egy harmadik fél által végzett megfelelőségértékelésből, feltéve, hogy a gyártó a valamennyi releváns követelményre kiterjedő valamennyi harmonizált szabványt alkalmazta, az említett gyártó csak akkor élhet e lehetőséggel, ha harmonizált szabványokat vagy adott esetben a 41. cikkben említett, az e fejezet 2. szakaszában foglalt valamennyi követelményre kiterjedő közös előírásokat is alkalmazott.

(4) A megfelelőségértékelési eljárásnak korábban már alávetett nagy kockázatú MI-rendszereket új megfelelőségértékelési eljárásnak kell alávetni akkor, amikor lényeges módosításon mennek keresztül, függetlenül attól, hogy a módosított rendszert további forgalmazásra szánják-e, vagy azt a jelenlegi alkalmazó használja-e továbbra is;

Azon nagy kockázatú MI-rendszerek esetében, amelyek tanulása a forgalomba hozatalt vagy üzembe helyezést követően is folytatódik, a nagy kockázatú MI-rendszernek és teljesítményének – amelyeket a szolgáltató az első megfelelőségértékelés időpontjában előre meghatározott, és amelyek a IV. melléklet 2. pontjának f) alpontjában említett műszaki dokumentációban szereplő információk részét képezik – a megváltoztatása nem minősülhet jelentős módosításnak.

(5) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogad el abból a célból, hogy módosítsa a VI. és a VII. mellékletet, a műszaki fejlődés fényében naprakésszé.

(6) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el e cikk (1) és a (2) bekezdésének annak érdekében történő módosítása céljából, hogy a III. melléklet 2–8. pontjában említett nagy kockázatú MI-rendszereket a VII. mellékletben említett megfelelőségértékelési eljárás vagy az eljárás egyes részeinek hatálya alá vonja. A Bizottság ilyen, felhatalmazáson alapuló jogi aktusokat oly módon fogad el, hogy figyelembe veszi a VI. mellékletben említett belső ellenőrzésen alapuló megfelelőségértékelési eljárás hatékonyságát az ilyen rendszerek által az egészséget és a biztonságot érintő kockázatok megelőzése vagy minimálisra csökkentése, valamint az alapvető jogok védelme tekintetében, továbbá a megfelelő kapacitások és erőforrások rendelkezésre állását bejelentett szervezetek körében',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  '1',
  '(1) A III. melléklet 1. pontjában felsorolt nagy kockázatú MI-rendszerek esetében, amennyiben valamely nagy kockázatú MI-rendszer a 2. szakaszban meghatározott követelményeknek való megfelelése igazolása során a szolgáltató a 40. cikkben említett harmonizált szabványokat, vagy adott esetben a 41. cikkben említett közös előírásokat alkalmazta, a szolgáltatónak a következőkön alapuló megfelelőségértékelési eljárások egyikét kell választania:

a)

a VI. mellékletben említett belső ellenőrzés; vagy

b)

a minőségirányítási rendszer és a műszaki dokumentáció valamely bejelentett szervezet bevonásával történő értékelése, a VII. mellékletben említettek szerint.

Annak igazolása során, hogy valamely nagy kockázatú MI-rendszer megfelel a 2. szakaszban foglalt követelményeknek, a szolgáltatónak a VII. mellékletben meghatározott megfelelőségértékelési eljárást kell követnie a következő esetekben:

a)

a 40. cikkben említett harmonizált szabványok nem léteznek, és a 41. cikkben említett közös előírások nem állnak rendelkezésre;

b)

a szolgáltató nem alkalmazta a harmonizált szabványt, vagy annak csak egy részét alkalmazta;

c)

az a) pontban említett közös előírások léteznek, de a szolgáltató nem alkalmazta őket;

d)

az a) pontban említett egy vagy több harmonizált szabványt korlátozással és csak a szabvány korlátozott részére tettek közzé.

A VII. mellékletben említett megfelelőségértékelési eljárás céljából a szolgáltató a bejelentett szervezetek bármelyikét választhatja. Azonban amennyiben a nagy kockázatú MI-rendszert bűnüldöző, bevándorlási vagy menekültügyi hatóságok, valamint uniós intézmények, szervek, hivatalok vagy ügynökségek szándékoznak üzembe helyezni, a 74. cikk (8) vagy – adott esetben – (9) bekezdésében említett piacfelügyeleti hatóságnak kell eljárnia bejelentett szervezetként.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  '1(a)',
  'a) a VI. mellékletben említett belső ellenőrzés; vagy',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  '1(b)',
  'b) a minőségirányítási rendszer és a műszaki dokumentáció valamely bejelentett szervezet bevonásával történő értékelése, a VII. mellékletben említettek szerint.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  '1(a)',
  'a) a 40. cikkben említett harmonizált szabványok nem léteznek, és a 41. cikkben említett közös előírások nem állnak rendelkezésre;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  '1(b)',
  'b) a szolgáltató nem alkalmazta a harmonizált szabványt, vagy annak csak egy részét alkalmazta;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  '1(c)',
  'c) az a) pontban említett közös előírások léteznek, de a szolgáltató nem alkalmazta őket;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  '1(d)',
  'd) az a) pontban említett egy vagy több harmonizált szabványt korlátozással és csak a szabvány korlátozott részére tettek közzé.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  '2',
  '(2) A III. melléklet 2–8. pontjában említett nagy kockázatú MI-rendszerek esetében a szolgáltatóknak a VI. mellékletben említett, belső ellenőrzésen alapuló megfelelőségértékelési eljárást kell követniük, amely nem rendelkezik bejelentett szervezet bevonásáról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  '3',
  '(3) Az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó nagy kockázatú MI-rendszerek esetében a szolgáltatónak az említett jogi aktusokban előírt megfelelőségértékelést kell követnie. Az e fejezet 2. szakaszában foglalt követelményeket alkalmazni kell az említett nagy kockázatú MI-rendszerekre, és azoknak az említett értékelés részét kell képezniük. A VII. melléklet 4.3., 4.4., 4.5. pontja és 4.6. pontjának ötödik bekezdése szintén alkalmazandó.

Az értékelés céljából az említett jogi aktusok alapján bejelentett szervezeteket fel kell jogosítani annak ellenőrzésére, hogy a nagy kockázatú MI-rendszerek megfelelnek-e a 2. szakaszban foglalt követelményeknek, feltéve, hogy az említett bejelentett szervezeteknek a 31. cikk (4), (5), (10) és (11) bekezdésében megállapított követelményeknek való megfelelését az említett jogi aktusok szerinti bejelentési eljárás keretében értékelték.

Amennyiben az I. melléklet A. szakaszában felsorolt valamely jogi aktus lehetővé teszik a termék gyártója számára, hogy kimaradjon egy harmadik fél által végzett megfelelőségértékelésből, feltéve, hogy a gyártó a valamennyi releváns követelményre kiterjedő valamennyi harmonizált szabványt alkalmazta, az említett gyártó csak akkor élhet e lehetőséggel, ha harmonizált szabványokat vagy adott esetben a 41. cikkben említett, az e fejezet 2. szakaszában foglalt valamennyi követelményre kiterjedő közös előírásokat is alkalmazott.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  '4',
  '(4) A megfelelőségértékelési eljárásnak korábban már alávetett nagy kockázatú MI-rendszereket új megfelelőségértékelési eljárásnak kell alávetni akkor, amikor lényeges módosításon mennek keresztül, függetlenül attól, hogy a módosított rendszert további forgalmazásra szánják-e, vagy azt a jelenlegi alkalmazó használja-e továbbra is;

Azon nagy kockázatú MI-rendszerek esetében, amelyek tanulása a forgalomba hozatalt vagy üzembe helyezést követően is folytatódik, a nagy kockázatú MI-rendszernek és teljesítményének – amelyeket a szolgáltató az első megfelelőségértékelés időpontjában előre meghatározott, és amelyek a IV. melléklet 2. pontjának f) alpontjában említett műszaki dokumentációban szereplő információk részét képezik – a megváltoztatása nem minősülhet jelentős módosításnak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  '5',
  '(5) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogad el abból a célból, hogy módosítsa a VI. és a VII. mellékletet, a műszaki fejlődés fényében naprakésszé.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '43',
  '6',
  '(6) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el e cikk (1) és a (2) bekezdésének annak érdekében történő módosítása céljából, hogy a III. melléklet 2–8. pontjában említett nagy kockázatú MI-rendszereket a VII. mellékletben említett megfelelőségértékelési eljárás vagy az eljárás egyes részeinek hatálya alá vonja. A Bizottság ilyen, felhatalmazáson alapuló jogi aktusokat oly módon fogad el, hogy figyelembe veszi a VI. mellékletben említett belső ellenőrzésen alapuló megfelelőségértékelési eljárás hatékonyságát az ilyen rendszerek által az egészséget és a biztonságot érintő kockázatok megelőzése vagy minimálisra csökkentése, valamint az alapvető jogok védelme tekintetében, továbbá a megfelelő kapacitások és erőforrások rendelkezésre állását bejelentett szervezetek körében',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_43'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '44',
  null,
  'Tanúsítványok
(1) A bejelentett szervezetek által a VII. mellékletnek megfelelően kibocsátott tanúsítványokat azon a nyelven kell kiadni, amelyet a bejelentett szervezet letelepedési helye szerinti tagállam érintett hatóságai könnyen megértenek.

(2) A tanúsítványok érvényessége a bennük feltüntetett időtartamra szól, amely nem haladhatja meg az öt évet az I. melléklet hatálya alá tartozó MI-rendszerek esetében, és a négy évet a III. melléklet hatálya alá tartozó MI-rendszerek esetében. A szolgáltató kérelmére a tanúsítvány érvényessége – az alkalmazandó megfelelőségértékelési eljárásokkal összhangban elvégzett felülvizsgálat alapján – további, egyenként öt évet meg nem haladó időszakokra meghosszabbítható az I. melléklet hatálya alá tartozó MI-rendszerek esetében, és egyenként négy évet meg nem haladó időszakokra a III. melléklet hatálya alá tartozó MI-rendszerek esetében. A tanúsítvány bármely kiegészítése érvényben marad feltéve, hogy az általa kiegészített tanúsítvány is érvényes.

(3) Amennyiben egy bejelentett szervezet megállapítja, hogy az MI-rendszer már nem tesz eleget a 2. szakaszban foglalt követelményeknek, az arányosság elvét figyelembe véve köteles felfüggeszteni vagy visszavonni a kiadott tanúsítványt, vagy korlátozásokat bevezetni a tanúsítványra vonatkozóan, kivéve, ha a rendszer szolgáltatója a bejelentett szervezet által meghatározott megfelelő határidőn belül megfelelő korrekciós intézkedéssel biztosítja az említett követelményeknek való megfelelést. A bejelentett szervezetnek meg kell indokolnia a döntését.

Biztosítani kell, hogy a bejelentett szervezetek határozatai ellen – ideértve a kiadott megfelelőségi tanúsítványokra vonatkozó határozatokat is – fellebbezési eljárás álljon rendelkezésre.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_44'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '44',
  '1',
  '(1) A bejelentett szervezetek által a VII. mellékletnek megfelelően kibocsátott tanúsítványokat azon a nyelven kell kiadni, amelyet a bejelentett szervezet letelepedési helye szerinti tagállam érintett hatóságai könnyen megértenek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_44'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '44',
  '2',
  '(2) A tanúsítványok érvényessége a bennük feltüntetett időtartamra szól, amely nem haladhatja meg az öt évet az I. melléklet hatálya alá tartozó MI-rendszerek esetében, és a négy évet a III. melléklet hatálya alá tartozó MI-rendszerek esetében. A szolgáltató kérelmére a tanúsítvány érvényessége – az alkalmazandó megfelelőségértékelési eljárásokkal összhangban elvégzett felülvizsgálat alapján – további, egyenként öt évet meg nem haladó időszakokra meghosszabbítható az I. melléklet hatálya alá tartozó MI-rendszerek esetében, és egyenként négy évet meg nem haladó időszakokra a III. melléklet hatálya alá tartozó MI-rendszerek esetében. A tanúsítvány bármely kiegészítése érvényben marad feltéve, hogy az általa kiegészített tanúsítvány is érvényes.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_44'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '44',
  '3',
  '(3) Amennyiben egy bejelentett szervezet megállapítja, hogy az MI-rendszer már nem tesz eleget a 2. szakaszban foglalt követelményeknek, az arányosság elvét figyelembe véve köteles felfüggeszteni vagy visszavonni a kiadott tanúsítványt, vagy korlátozásokat bevezetni a tanúsítványra vonatkozóan, kivéve, ha a rendszer szolgáltatója a bejelentett szervezet által meghatározott megfelelő határidőn belül megfelelő korrekciós intézkedéssel biztosítja az említett követelményeknek való megfelelést. A bejelentett szervezetnek meg kell indokolnia a döntését.

Biztosítani kell, hogy a bejelentett szervezetek határozatai ellen – ideértve a kiadott megfelelőségi tanúsítványokra vonatkozó határozatokat is – fellebbezési eljárás álljon rendelkezésre.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_44'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '45',
  null,
  'A bejelentett szervezetek tájékoztatási kötelezettségei
(1) A bejelentett szervezeteknek tájékoztatniuk kell a bejelentő hatóságot a következőkről:

a)

a VII. melléklet követelményeivel összhangban kiállított, a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítványok, azok kiegészítései, és a minőségirányítási rendszerre vonatkozó minden jóváhagyás;

b)

a VII. melléklet követelményeivel összhangban kiállított, a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány vagy a minőségirányítási rendszerre vonatkozó jóváhagyás elutasítása, korlátozása, felfüggesztése vagy visszavonása;

c)

azok a körülmények, amelyek érinthetik a bejelentés hatályát vagy feltételeit;

d)

a piacfelügyeleti hatóságoktól a megfelelőségértékelési tevékenységek kapcsán hozzájuk beérkezett valamennyi tájékoztatási kérelem;

e)

kérésre a bejelentésük hatálya alá tartozó megfelelőségértékelési tevékenységek, valamint minden más elvégzett tevékenység, többek között a határon átnyúló tevékenységek és a tevékenységek alvállalkozásba adása.

(2) Minden bejelentett szervezetnek tájékoztatnia kell a többi bejelentett szervezetet a következőkről:

a)

minőségirányítási rendszereknek a bejelentett szervezet által elutasított, felfüggesztett vagy visszavont jóváhagyásai, valamint kérésre a minőségbiztosítási rendszerek bejelentett szervezet által kiadott jóváhagyásai;

b)

a bejelentett szervezet által elutasított, visszavont, felfüggesztett vagy más módon korlátozott, a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítványok vagy azok kiegészítései, valamint – kérésre – az általa kiadott tanúsítványok és/vagy kiegészítések.

(3) Minden egyes bejelentett szervezetnek megfelelően tájékoztatnia kell az ugyanazokra az MI-rendszertípusokra vonatkozó, hasonló megfelelőségértékelési tevékenységeket végző más bejelentett szervezeteket a negatív és – kérésre – a pozitív megfelelőségértékelési eredményekről.

(4) A bejelentett szervezeteknek a 78. cikkel összhangban meg kell őrizniük az álaluk kapott információk bizalmas jellegét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '45',
  '1',
  '(1) A bejelentett szervezeteknek tájékoztatniuk kell a bejelentő hatóságot a következőkről:

a)

a VII. melléklet követelményeivel összhangban kiállított, a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítványok, azok kiegészítései, és a minőségirányítási rendszerre vonatkozó minden jóváhagyás;

b)

a VII. melléklet követelményeivel összhangban kiállított, a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány vagy a minőségirányítási rendszerre vonatkozó jóváhagyás elutasítása, korlátozása, felfüggesztése vagy visszavonása;

c)

azok a körülmények, amelyek érinthetik a bejelentés hatályát vagy feltételeit;

d)

a piacfelügyeleti hatóságoktól a megfelelőségértékelési tevékenységek kapcsán hozzájuk beérkezett valamennyi tájékoztatási kérelem;

e)

kérésre a bejelentésük hatálya alá tartozó megfelelőségértékelési tevékenységek, valamint minden más elvégzett tevékenység, többek között a határon átnyúló tevékenységek és a tevékenységek alvállalkozásba adása.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '45',
  '1(a)',
  'a) a VII. melléklet követelményeivel összhangban kiállított, a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítványok, azok kiegészítései, és a minőségirányítási rendszerre vonatkozó minden jóváhagyás;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '45',
  '1(b)',
  'b) a VII. melléklet követelményeivel összhangban kiállított, a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány vagy a minőségirányítási rendszerre vonatkozó jóváhagyás elutasítása, korlátozása, felfüggesztése vagy visszavonása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '45',
  '1(c)',
  'c) azok a körülmények, amelyek érinthetik a bejelentés hatályát vagy feltételeit;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '45',
  '1(d)',
  'd) a piacfelügyeleti hatóságoktól a megfelelőségértékelési tevékenységek kapcsán hozzájuk beérkezett valamennyi tájékoztatási kérelem;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '45',
  '1(e)',
  'e) kérésre a bejelentésük hatálya alá tartozó megfelelőségértékelési tevékenységek, valamint minden más elvégzett tevékenység, többek között a határon átnyúló tevékenységek és a tevékenységek alvállalkozásba adása.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '45',
  '2',
  '(2) Minden bejelentett szervezetnek tájékoztatnia kell a többi bejelentett szervezetet a következőkről:

a)

minőségirányítási rendszereknek a bejelentett szervezet által elutasított, felfüggesztett vagy visszavont jóváhagyásai, valamint kérésre a minőségbiztosítási rendszerek bejelentett szervezet által kiadott jóváhagyásai;

b)

a bejelentett szervezet által elutasított, visszavont, felfüggesztett vagy más módon korlátozott, a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítványok vagy azok kiegészítései, valamint – kérésre – az általa kiadott tanúsítványok és/vagy kiegészítések.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '45',
  '2(a)',
  'a) minőségirányítási rendszereknek a bejelentett szervezet által elutasított, felfüggesztett vagy visszavont jóváhagyásai, valamint kérésre a minőségbiztosítási rendszerek bejelentett szervezet által kiadott jóváhagyásai;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '45',
  '2(b)',
  'b) a bejelentett szervezet által elutasított, visszavont, felfüggesztett vagy más módon korlátozott, a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítványok vagy azok kiegészítései, valamint – kérésre – az általa kiadott tanúsítványok és/vagy kiegészítések.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '45',
  '3',
  '(3) Minden egyes bejelentett szervezetnek megfelelően tájékoztatnia kell az ugyanazokra az MI-rendszertípusokra vonatkozó, hasonló megfelelőségértékelési tevékenységeket végző más bejelentett szervezeteket a negatív és – kérésre – a pozitív megfelelőségértékelési eredményekről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '45',
  '4',
  '(4) A bejelentett szervezeteknek a 78. cikkel összhangban meg kell őrizniük az álaluk kapott információk bizalmas jellegét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_45'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '46',
  null,
  'A megfelelőségértékelési eljárástól való eltérés
(1) A 43. cikktől eltérve és kellően indokolt kérésre bármely piacfelügyeleti hatóság engedélyezheti adott nagy kockázatú MI-rendszerek forgalomba hozatalát vagy üzembe helyezését az érintett tagállam területén, a közbiztonság vagy a személyek életének és egészségének védelmét, a környezetvédelmet, valamint a kulcsfontosságú ipari és infrastrukturális eszközök védelmét szolgáló rendkívüli okokból. Az engedély arra a korlátozott időtartamra szól, amíg elvégzik a szükséges megfelelőségértékelési eljárásokat, figyelembe véve az eltérést indokoló rendkívüli okokat. Ezen eljárások lefolytatását indokolatlan késedelem nélkül meg kell kezdeni.

(2) Rendkívüli közbiztonsági okokból felmerülő, kellően indokolt sürgős helyzetben vagy természetes személyek életét vagy fizikai biztonságát fenyegető konkrét, jelentős és közvetlen veszély esetén a bűnüldöző hatóságok vagy a polgári védelmi hatóságok az (1) bekezdésben említett engedély nélkül is üzembe helyezhetnek egy adott nagy kockázatú MI-rendszert, feltéve, hogy a használat során vagy azt követően – indokolatlan késedelem nélkül – kérnek ilyen engedélyt. Az (1) bekezdésben említett engedély elutasítása esetén a nagy kockázatú MI-rendszer használatát azonnali hatállyal le kell állítani, valamint e használat valamennyi eredményét és kimenetét azonnal meg kell semmisíteni.

(3) Az (1) bekezdésben említett engedély csak akkor adható ki, ha a piacfelügyeleti hatóság arra a következtetésre jut, hogy a nagy kockázatú MI-rendszer megfelel a 2. szakaszban foglalt követelményeknek. A piacfelügyeleti hatóságnak tájékoztatnia kell a Bizottságot és a többi tagállamot az (1) és a (2) bekezdés alapján kiadott bármely engedélyről. Ez a kötelezettség nem terjedhet ki a bűnüldöző hatóságok tevékenységeivel kapcsolatos érzékeny operatív adatokra.

(4) Amennyiben a (3) bekezdésben említett tájékoztatás kézhezvételétől számított 15 naptári napon belül egyik tagállam és a Bizottság sem emel kifogást a valamely tagállam piacfelügyeleti hatósága által az (1) bekezdéssel összhangban kiadott engedéllyel szemben, az engedély indokoltnak tekintendő.

(5) Amennyiben a (3) bekezdésben említett értesítés kézhezvételétől számított 15 naptári napon belül valamely tagállam kifogást emel egy másik tagállam piacfelügyeleti hatósága által kiadott engedéllyel szemben, vagy ha a Bizottság úgy ítéli meg, hogy az engedély ellentétes az uniós joggal, vagy hogy a tagállamoknak a (3) bekezdésben említett, a rendszer megfelelőségére vonatkozó következtetése megalapozatlan, a Bizottság haladéktalanul egyeztetést kezdeményez az érintett tagállammal. Az érintett üzemeltetőkkel egyeztetni kell, és lehetőséget kell biztosítani számukra, hogy kifejtsék álláspontjukat. Minderre tekintettel, a Bizottság dönt arról, hogy az engedély indokolt-e. A Bizottság közli határozatát az érintett tagállammal és a releváns üzemeltetőkkel.

(6) Amennyiben a Bizottság az engedélyt indokolatlannak ítéli, az engedélyt az érintett tagállam piacfelügyeleti hatóságának vissza kell vonnia.

(7) Az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termékekhez kapcsolódó, nagy kockázatú MI-rendszerek esetében kizárólag az említett uniós harmonizációs jogszabályokban megállapított megfelelőségértékelési eljárástól való eltéréseket kell alkalmazni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '46',
  '1',
  '(1) A 43. cikktől eltérve és kellően indokolt kérésre bármely piacfelügyeleti hatóság engedélyezheti adott nagy kockázatú MI-rendszerek forgalomba hozatalát vagy üzembe helyezését az érintett tagállam területén, a közbiztonság vagy a személyek életének és egészségének védelmét, a környezetvédelmet, valamint a kulcsfontosságú ipari és infrastrukturális eszközök védelmét szolgáló rendkívüli okokból. Az engedély arra a korlátozott időtartamra szól, amíg elvégzik a szükséges megfelelőségértékelési eljárásokat, figyelembe véve az eltérést indokoló rendkívüli okokat. Ezen eljárások lefolytatását indokolatlan késedelem nélkül meg kell kezdeni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '46',
  '2',
  '(2) Rendkívüli közbiztonsági okokból felmerülő, kellően indokolt sürgős helyzetben vagy természetes személyek életét vagy fizikai biztonságát fenyegető konkrét, jelentős és közvetlen veszély esetén a bűnüldöző hatóságok vagy a polgári védelmi hatóságok az (1) bekezdésben említett engedély nélkül is üzembe helyezhetnek egy adott nagy kockázatú MI-rendszert, feltéve, hogy a használat során vagy azt követően – indokolatlan késedelem nélkül – kérnek ilyen engedélyt. Az (1) bekezdésben említett engedély elutasítása esetén a nagy kockázatú MI-rendszer használatát azonnali hatállyal le kell állítani, valamint e használat valamennyi eredményét és kimenetét azonnal meg kell semmisíteni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '46',
  '3',
  '(3) Az (1) bekezdésben említett engedély csak akkor adható ki, ha a piacfelügyeleti hatóság arra a következtetésre jut, hogy a nagy kockázatú MI-rendszer megfelel a 2. szakaszban foglalt követelményeknek. A piacfelügyeleti hatóságnak tájékoztatnia kell a Bizottságot és a többi tagállamot az (1) és a (2) bekezdés alapján kiadott bármely engedélyről. Ez a kötelezettség nem terjedhet ki a bűnüldöző hatóságok tevékenységeivel kapcsolatos érzékeny operatív adatokra.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '46',
  '4',
  '(4) Amennyiben a (3) bekezdésben említett tájékoztatás kézhezvételétől számított 15 naptári napon belül egyik tagállam és a Bizottság sem emel kifogást a valamely tagállam piacfelügyeleti hatósága által az (1) bekezdéssel összhangban kiadott engedéllyel szemben, az engedély indokoltnak tekintendő.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '46',
  '5',
  '(5) Amennyiben a (3) bekezdésben említett értesítés kézhezvételétől számított 15 naptári napon belül valamely tagállam kifogást emel egy másik tagállam piacfelügyeleti hatósága által kiadott engedéllyel szemben, vagy ha a Bizottság úgy ítéli meg, hogy az engedély ellentétes az uniós joggal, vagy hogy a tagállamoknak a (3) bekezdésben említett, a rendszer megfelelőségére vonatkozó következtetése megalapozatlan, a Bizottság haladéktalanul egyeztetést kezdeményez az érintett tagállammal. Az érintett üzemeltetőkkel egyeztetni kell, és lehetőséget kell biztosítani számukra, hogy kifejtsék álláspontjukat. Minderre tekintettel, a Bizottság dönt arról, hogy az engedély indokolt-e. A Bizottság közli határozatát az érintett tagállammal és a releváns üzemeltetőkkel.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '46',
  '6',
  '(6) Amennyiben a Bizottság az engedélyt indokolatlannak ítéli, az engedélyt az érintett tagállam piacfelügyeleti hatóságának vissza kell vonnia.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '46',
  '7',
  '(7) Az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termékekhez kapcsolódó, nagy kockázatú MI-rendszerek esetében kizárólag az említett uniós harmonizációs jogszabályokban megállapított megfelelőségértékelési eljárástól való eltéréseket kell alkalmazni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_46'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '47',
  null,
  'EU-megfelelőségi nyilatkozat
(1) A szolgáltatónak minden egyes nagy kockázatú MI-rendszerre vonatkozóan írásos, géppel olvasható, fizikai vagy elektronikus aláírással ellátott EU-megfelelőségi nyilatkozatot kell készítenie, és azt a nagy kockázatú MI-rendszer forgalomba hozatala vagy üzembe helyezése után 10 évig az illetékes nemzeti hatóság számára elérhetővé kell tennie. Az EU-megfelelőségi nyilatkozatban azonosítani kell azon nagy kockázatú MI-rendszert, amelyre vonatkozóan a nyilatkozatot kiállították. Az EU-megfelelőségi nyilatkozat egy példányát kérésre be kell nyújtani a megfelelő illetékes nemzeti hatóságok részére.

(2) Az EU-megfelelőségi nyilatkozatban fel kell tüntetni, hogy az érintett nagy kockázatú MI-rendszer megfelel a 2. szakaszban foglalt követelményeknek. Az EU-megfelelőségi nyilatkozatnak tartalmaznia kell az V. mellékletben szereplő információkat, és a nyilatkozatot le kell fordítani az azon tagállamok illetékes nemzeti hatóságai által könnyen érthető nyelvre, amelyekben a nagy kockázatú MI-rendszert forgalomba hozták vagy forgalmazzák.

(3) Amennyiben a nagy kockázatú MI-rendszerek más olyan uniós harmonizációs jogszabályok hatálya alá tartoznak, amelyek szintén EU-megfelelőségi nyilatkozatot írnak elő, a nagy kockázatú MI-rendszerre alkalmazandó valamennyi uniós jogszabály tekintetében egyetlen EU-megfelelőségi nyilatkozatot kell kiállítani. A nyilatkozatnak tartalmaznia kell minden olyan információt, amelyre szükség van annak az uniós harmonizációs jogszabálynak az azonosításához, amelynek tekintetében a nyilatkozatot tették.

(4) Az EU-megfelelőségi nyilatkozat kiállítását követően a szolgáltatónak felelősséget kell vállalnia a 2. szakaszban foglalt követelmények teljesítéséért. A szolgáltatónak szükség szerint naprakészen kell tartania az EU-megfelelőségi nyilatkozatot.

(5) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el az V. mellékletnek az említett mellékletben meghatározott EU-megfelelőségi nyilatkozat tartalmának naprakésszé tételével történő módosítása céljából, annak érdekében hogy a műszaki fejlődés fényében szükségessé váló elemeket beillessze.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '47',
  '1',
  '(1) A szolgáltatónak minden egyes nagy kockázatú MI-rendszerre vonatkozóan írásos, géppel olvasható, fizikai vagy elektronikus aláírással ellátott EU-megfelelőségi nyilatkozatot kell készítenie, és azt a nagy kockázatú MI-rendszer forgalomba hozatala vagy üzembe helyezése után 10 évig az illetékes nemzeti hatóság számára elérhetővé kell tennie. Az EU-megfelelőségi nyilatkozatban azonosítani kell azon nagy kockázatú MI-rendszert, amelyre vonatkozóan a nyilatkozatot kiállították. Az EU-megfelelőségi nyilatkozat egy példányát kérésre be kell nyújtani a megfelelő illetékes nemzeti hatóságok részére.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '47',
  '2',
  '(2) Az EU-megfelelőségi nyilatkozatban fel kell tüntetni, hogy az érintett nagy kockázatú MI-rendszer megfelel a 2. szakaszban foglalt követelményeknek. Az EU-megfelelőségi nyilatkozatnak tartalmaznia kell az V. mellékletben szereplő információkat, és a nyilatkozatot le kell fordítani az azon tagállamok illetékes nemzeti hatóságai által könnyen érthető nyelvre, amelyekben a nagy kockázatú MI-rendszert forgalomba hozták vagy forgalmazzák.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '47',
  '3',
  '(3) Amennyiben a nagy kockázatú MI-rendszerek más olyan uniós harmonizációs jogszabályok hatálya alá tartoznak, amelyek szintén EU-megfelelőségi nyilatkozatot írnak elő, a nagy kockázatú MI-rendszerre alkalmazandó valamennyi uniós jogszabály tekintetében egyetlen EU-megfelelőségi nyilatkozatot kell kiállítani. A nyilatkozatnak tartalmaznia kell minden olyan információt, amelyre szükség van annak az uniós harmonizációs jogszabálynak az azonosításához, amelynek tekintetében a nyilatkozatot tették.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '47',
  '4',
  '(4) Az EU-megfelelőségi nyilatkozat kiállítását követően a szolgáltatónak felelősséget kell vállalnia a 2. szakaszban foglalt követelmények teljesítéséért. A szolgáltatónak szükség szerint naprakészen kell tartania az EU-megfelelőségi nyilatkozatot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '47',
  '5',
  '(5) A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el az V. mellékletnek az említett mellékletben meghatározott EU-megfelelőségi nyilatkozat tartalmának naprakésszé tételével történő módosítása céljából, annak érdekében hogy a műszaki fejlődés fényében szükségessé váló elemeket beillessze.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_47'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '48',
  null,
  'CE-jelölés
(1) A CE-jelölésre a 765/2008/EK rendelet 30. cikkében meghatározott általános elvek vonatkoznak.

(2) A kizárólag digitálisan szolgáltatott nagy kockázatú MI-rendszerek esetében digitális CE-jelölés csak akkor használható, ha az könnyen hozzáférhető azon interfészen keresztül, ahonnan az adott rendszer elérhető, vagy könnyen hozzáférhető, géppel olvasható kód vagy más elektronikus eszköz révén.

(3) A CE-jelölést a nagy kockázatú MI-rendszerek esetében jól láthatóan, olvashatóan és eltávolíthatatlan módon kell elhelyezni. Amennyiben a nagy kockázatú MI-rendszer jellege miatt ez nem lehetséges vagy nem indokolt, a jelölést a csomagoláson vagy adott esetben a kísérő dokumentáción kell feltüntetni.

(4) A CE-jelölés mellett adott esetben fel kell tüntetni a 43. cikkben foglalt megfelelőségértékelési eljárásokért felelős bejelentett szervezet azonosító számát. A bejelentett szervezet azonosító számát magának a szervezetnek vagy – annak utasításai alapján – a szolgáltatónak vagy a szolgáltató meghatalmazott képviselőjének kell feltüntetnie. Az azonosító számot fel kell tüntetni minden olyan promóciós anyagon is, amelyben megemlítésre kerül, hogy a nagy kockázatú MI-rendszer eleget tesz a CE-jelölésre vonatkozó követelményeknek.

(5) Ha a nagy kockázatú MI-rendszerek olyan más uniós jogszabály hatálya alá tartoznak, amely szintén előírja a CE-jelölés feltüntetését, a CE-jelölésben jelezni kell, hogy a nagy kockázatú MI-rendszer ezen más jogszabály követelményeinek is megfelel.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_48'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '48',
  '1',
  '(1) A CE-jelölésre a 765/2008/EK rendelet 30. cikkében meghatározott általános elvek vonatkoznak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_48'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '48',
  '2',
  '(2) A kizárólag digitálisan szolgáltatott nagy kockázatú MI-rendszerek esetében digitális CE-jelölés csak akkor használható, ha az könnyen hozzáférhető azon interfészen keresztül, ahonnan az adott rendszer elérhető, vagy könnyen hozzáférhető, géppel olvasható kód vagy más elektronikus eszköz révén.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_48'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '48',
  '3',
  '(3) A CE-jelölést a nagy kockázatú MI-rendszerek esetében jól láthatóan, olvashatóan és eltávolíthatatlan módon kell elhelyezni. Amennyiben a nagy kockázatú MI-rendszer jellege miatt ez nem lehetséges vagy nem indokolt, a jelölést a csomagoláson vagy adott esetben a kísérő dokumentáción kell feltüntetni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_48'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '48',
  '4',
  '(4) A CE-jelölés mellett adott esetben fel kell tüntetni a 43. cikkben foglalt megfelelőségértékelési eljárásokért felelős bejelentett szervezet azonosító számát. A bejelentett szervezet azonosító számát magának a szervezetnek vagy – annak utasításai alapján – a szolgáltatónak vagy a szolgáltató meghatalmazott képviselőjének kell feltüntetnie. Az azonosító számot fel kell tüntetni minden olyan promóciós anyagon is, amelyben megemlítésre kerül, hogy a nagy kockázatú MI-rendszer eleget tesz a CE-jelölésre vonatkozó követelményeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_48'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '48',
  '5',
  '(5) Ha a nagy kockázatú MI-rendszerek olyan más uniós jogszabály hatálya alá tartoznak, amely szintén előírja a CE-jelölés feltüntetését, a CE-jelölésben jelezni kell, hogy a nagy kockázatú MI-rendszer ezen más jogszabály követelményeinek is megfelel.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_48'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '49',
  null,
  'Regisztráció
(1) A III. mellékletben felsorolt valamely, nagy kockázatú MI-rendszer – a III. melléklet 2. pontjában említett nagy kockázatú MI-rendszerek kivételével – forgalomba hozatala vagy üzembe helyezése előtt a szolgáltatónak vagy adott esetben a meghatalmazott képviselőnek saját magát és a rendszerét regisztrálnia kell a 71. cikkben említett uniós adatbázisban.

(2) Az olyan MI-rendszer forgalomba hozatala vagy üzembe helyezése előtt, amelyről a szolgáltató megállapította, hogy a 6. cikk (3) bekezdése értelmében nem nagy kockázatú, az említett szolgáltatónak vagy adott esetben a meghatalmazott képviselőnek saját magát és az említett rendszert regisztrálnia kell a 71. cikkben említett uniós adatbázisban.

(3) Valamely, a III. mellékletben felsorolt nagy kockázatú MI-rendszer – a III. melléklet 2. pontjában felsorolt nagy kockázatú MI-rendszerek kivételével – üzembe helyezése vagy használata előtt azon alkalmazók, amelyek hatóságok, uniós intézmények, szervek, hivatalok vagy ügynökségek, vagy a nevükben eljáró személyek, regisztrálják magukat, kiválasztják a rendszert, és regisztrálják annak használatát a 71. cikkben említett uniós adatbázisban.

(4) A III. melléklet 1., 6. és 7. pontjában említett nagy kockázatú MI-rendszerek esetében a bűnüldözés, a migráció, a menekültügy és a határigazgatás területén az e cikk (1), (2) és (3) bekezdésében említett regisztrációt a 71. cikkben említett uniós adatbázis biztonságos, nem nyilvános részében kell megtenni, és annak adott esetben csak a következő, az alábbi helyeken említett információkra kell kiterjednie:

a)

a VIII. melléklet A. szakaszának 1–10. pontja, kivéve a 6., a 8. és a 9. pontot;

b)

a VIII. melléklet B. szakaszának 1–5. pontja, valamint 8. és 9. pontja;

c)

a VIII. melléklet C. szakaszának 1–3. pontja;

d)

a IX. melléklet 1., 2., 3. és 5. pontja.

Csak a Bizottság és a 74. cikk (8) bekezdésében említett nemzeti hatóságok férhetnek hozzá az uniós adatbázisnak az e bekezdés első albekezdésében felsorolt, vonatkozó korlátozott részeihez.

(5) A III. melléklet 2. pontjában említett nagy kockázatú MI-rendszereket nemzeti szinten kell nyilvántartásba venni.

IV. FEJEZET

BIZONYOS MI-RENDSZEREK SZOLGÁLTATÓIRA ÉS ALKALMAZÓIRA VONATKOZÓ ÁTLÁTHATÓSÁGI KÖTELEZETTSÉGEK',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '49',
  '1',
  '(1) A III. mellékletben felsorolt valamely, nagy kockázatú MI-rendszer – a III. melléklet 2. pontjában említett nagy kockázatú MI-rendszerek kivételével – forgalomba hozatala vagy üzembe helyezése előtt a szolgáltatónak vagy adott esetben a meghatalmazott képviselőnek saját magát és a rendszerét regisztrálnia kell a 71. cikkben említett uniós adatbázisban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '49',
  '2',
  '(2) Az olyan MI-rendszer forgalomba hozatala vagy üzembe helyezése előtt, amelyről a szolgáltató megállapította, hogy a 6. cikk (3) bekezdése értelmében nem nagy kockázatú, az említett szolgáltatónak vagy adott esetben a meghatalmazott képviselőnek saját magát és az említett rendszert regisztrálnia kell a 71. cikkben említett uniós adatbázisban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '49',
  '3',
  '(3) Valamely, a III. mellékletben felsorolt nagy kockázatú MI-rendszer – a III. melléklet 2. pontjában felsorolt nagy kockázatú MI-rendszerek kivételével – üzembe helyezése vagy használata előtt azon alkalmazók, amelyek hatóságok, uniós intézmények, szervek, hivatalok vagy ügynökségek, vagy a nevükben eljáró személyek, regisztrálják magukat, kiválasztják a rendszert, és regisztrálják annak használatát a 71. cikkben említett uniós adatbázisban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '49',
  '4',
  '(4) A III. melléklet 1., 6. és 7. pontjában említett nagy kockázatú MI-rendszerek esetében a bűnüldözés, a migráció, a menekültügy és a határigazgatás területén az e cikk (1), (2) és (3) bekezdésében említett regisztrációt a 71. cikkben említett uniós adatbázis biztonságos, nem nyilvános részében kell megtenni, és annak adott esetben csak a következő, az alábbi helyeken említett információkra kell kiterjednie:

a)

a VIII. melléklet A. szakaszának 1–10. pontja, kivéve a 6., a 8. és a 9. pontot;

b)

a VIII. melléklet B. szakaszának 1–5. pontja, valamint 8. és 9. pontja;

c)

a VIII. melléklet C. szakaszának 1–3. pontja;

d)

a IX. melléklet 1., 2., 3. és 5. pontja.

Csak a Bizottság és a 74. cikk (8) bekezdésében említett nemzeti hatóságok férhetnek hozzá az uniós adatbázisnak az e bekezdés első albekezdésében felsorolt, vonatkozó korlátozott részeihez.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '49',
  '4(a)',
  'a) a VIII. melléklet A. szakaszának 1–10. pontja, kivéve a 6., a 8. és a 9. pontot;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '49',
  '4(b)',
  'b) a VIII. melléklet B. szakaszának 1–5. pontja, valamint 8. és 9. pontja;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '49',
  '4(c)',
  'c) a VIII. melléklet C. szakaszának 1–3. pontja;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '49',
  '4(d)',
  'd) a IX. melléklet 1., 2., 3. és 5. pontja.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '49',
  '5',
  '(5) A III. melléklet 2. pontjában említett nagy kockázatú MI-rendszereket nemzeti szinten kell nyilvántartásba venni.

IV. FEJEZET

BIZONYOS MI-RENDSZEREK SZOLGÁLTATÓIRA ÉS ALKALMAZÓIRA VONATKOZÓ ÁTLÁTHATÓSÁGI KÖTELEZETTSÉGEK',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_49'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '50',
  null,
  'Bizonyos MI-rendszerek szolgáltatóira és alkalmazóira vonatkozó átláthatósági kötelezettségek
(1) A szolgáltatóknak biztosítaniuk kell, hogy a természetes személyekkel való közvetlen interakcióra szánt MI-rendszereket úgy tervezzék meg és fejlesszék ki, hogy az érintett természetes személyek tájékoztatást kapjanak arról, hogy egy MI-rendszerrel állnak interakcióban, kivéve, ha ez a körülményekre és a felhasználási kontextusra figyelemmel, egy észszerűen jól tájékozott, figyelmes és körültekintő természetes személy szempontjából nyilvánvaló tény. Ez a kötelezettség nem alkalmazandó bűncselekmények felderítése, megelőzése, nyomozása vagy büntetőeljárás alá vonása céljára – a harmadik felek jogaira és szabadságaira vonatkozó megfelelő biztosítékok mellett – a törvény által engedélyezett MI-rendszerekre, kivéve, ha az említett rendszerek bűncselekmények bejelentése céljából a nyilvánosság rendelkezésére állnak.

(2) A szintetikus hang-, kép-, video- vagy szöveges tartalmat létrehozó MI-rendszerek – köztük az általános célú MI-rendszerek – szolgáltatóinak biztosítaniuk kell, hogy az MI-rendszer kimeneteit géppel olvasható formátumban jelöljék meg, és azok mesterségesen létrehozottként vagy manipuláltként észlelhetők legyenek. A szolgáltatóknak biztosítaniuk kell, hogy műszaki megoldásaik hatékonyak, interoperábilisak, robusztusak és megbízhatóak legyenek, amennyiben ez műszakilag megvalósítható, figyelembe véve a különböző tartalomtípusok sajátosságait és korlátait, a megvalósítás költségeit és a technika általánosan elismert állását, amint azt a vonatkozó műszaki szabványok tükrözhetik. Ez a kötelezettség nem alkalmazandó, amennyiben az MI-rendszerek támogató funkciót töltenek be hagyományos szerkesztés céljára, vagy nem változtatják meg lényegesen az alkalmazó által szolgáltatott bemeneti adatokat vagy azok szemantikáját, vagy amennyiben azt törvény engedélyezi bűncselekmények felderítése, megelőzése, nyomozása vagy büntetőeljárás alá vonása céljából.

(3) Az érzelemfelismerő rendszer vagy a biometrikus kategorizálási rendszer alkalmazóinak tájékoztatniuk kell a rendszer működéséről azon természetes személyeket, akik a rendszer működésének ki vannak téve, és a személyes adatokat az (EU) 2016/679 és az (EU) 2018/1725 rendeletnek, valamint – adott esetben – az (EU) 2016/680 irányelvnek megfelelően kell kezelniük. Ez a kötelezettség nem alkalmazandó a biometrikus kategorizálásra és érzelemfelismerésre használt olyan MI-rendszerekre, amelyeket a törvény megenged bűncselekmények felderítése, megelőzése és nyomozása céljából, a harmadik felek jogaira és szabadságaira vonatkozó megfelelő biztosítékok mellett, és az uniós jognak megfelelően.

(4) Az olyan MI-rendszerek alkalmazóinak, amelyek eredetinek vagy valóságosnak tűnő („deepfake”) kép-, hang- vagy videotartalmat hoznak létre vagy manipulálnak, közölniük kell, hogy a tartalmat mesterségesen hozták létre vagy manipulálták. Ez a kötelezettség nem alkalmazandó, amennyiben a használatot törvény engedélyezi bűncselekmények felderítése, megelőzése, nyomozása vagy büntetőeljárás alá vonása céljából. Amennyiben a tartalom nyilvánvalóan művészeti, kreatív, szatirikus, fiktív vagy hasonló mű vagy program részét képezi, az e bekezdésben meghatározott átláthatósági kötelezettségek az ilyen létrehozott vagy manipulált tartalom meglétének megfelelő, a mű megjelenítését vagy élvezetét nem akadályozó közlésére korlátozódnak.

A nyilvánosság közérdekű ügyekről való tájékoztatása céljából közzétett szöveget generáló vagy manipuláló MI-rendszer alkalmazóinak közölniük kell, hogy a szöveget mesterségesen hozták létre vagy manipulálták. Ez a kötelezettség nem alkalmazandó abban az esetben, ha a felhasználást törvény engedélyezi bűncselekmények felderítése, megelőzése, nyomozása vagy büntetőeljárás alá vonása céljából, vagy ha a mesterséges intelligencia által létrehozott tartalmon emberi felülvizsgálatra vagy szerkesztési ellenőrzésre került sor, és amennyiben a tartalom közzétételéért természetes vagy jogi személy szerkesztői felelősséget visel.

(5) Az (1)–(4) bekezdésben említett tájékoztatást legkésőbb az első interakció vagy kitettség alkalmával, egyértelmű és jól megkülönböztethető módon kell az érintett természetes személyek számára nyújtani. A tájékoztatásnak meg kell felelnie az alkalmazandó akadálymentesítési követelményeknek.

(6) Az (1)–(4) bekezdés nem érintheti a III. fejezetben meghatározott követelményeket és kötelezettségeket, és nem sérthet az MI-rendszerek alkalmazóira vonatkozóan az uniós vagy a nemzeti jogban megállapított egyéb átláthatósági kötelezettségeket.

(7) Az MI-hivatalnak ösztönöznie és segítenie kell uniós szintű gyakorlati kódexek kidolgozását a mesterségesen előállított vagy manipulált tartalom észlelésére és címkézésére vonatkozó kötelezettségek hatékony végrehajtásának elősegítése érdekében. A Bizottság az 56. cikk (6) bekezdésében megállapított eljárásnak megfelelően végrehajtási jogi aktusokat fogadhat el az említett gyakorlati kódexek jóváhagyása céljából. A Bizottság – ha úgy ítéli meg, hogy a kódex nem megfelelő – a 98. cikk (2) bekezdésében megállapított vizsgálóbizottsági eljárásnak megfelelően végrehajtási jogi aktust fogadhat el, amelyben közös szabályokat határoz meg az említett kötelezettségek végrehajtására vonatkozóan.

V. FEJEZET

ÁLTALÁNOS CÉLÚ MI-MODELLEK

1. SZAKASZ

Besorolási szabályok',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_50'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '50',
  '1',
  '(1) A szolgáltatóknak biztosítaniuk kell, hogy a természetes személyekkel való közvetlen interakcióra szánt MI-rendszereket úgy tervezzék meg és fejlesszék ki, hogy az érintett természetes személyek tájékoztatást kapjanak arról, hogy egy MI-rendszerrel állnak interakcióban, kivéve, ha ez a körülményekre és a felhasználási kontextusra figyelemmel, egy észszerűen jól tájékozott, figyelmes és körültekintő természetes személy szempontjából nyilvánvaló tény. Ez a kötelezettség nem alkalmazandó bűncselekmények felderítése, megelőzése, nyomozása vagy büntetőeljárás alá vonása céljára – a harmadik felek jogaira és szabadságaira vonatkozó megfelelő biztosítékok mellett – a törvény által engedélyezett MI-rendszerekre, kivéve, ha az említett rendszerek bűncselekmények bejelentése céljából a nyilvánosság rendelkezésére állnak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_50'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '50',
  '2',
  '(2) A szintetikus hang-, kép-, video- vagy szöveges tartalmat létrehozó MI-rendszerek – köztük az általános célú MI-rendszerek – szolgáltatóinak biztosítaniuk kell, hogy az MI-rendszer kimeneteit géppel olvasható formátumban jelöljék meg, és azok mesterségesen létrehozottként vagy manipuláltként észlelhetők legyenek. A szolgáltatóknak biztosítaniuk kell, hogy műszaki megoldásaik hatékonyak, interoperábilisak, robusztusak és megbízhatóak legyenek, amennyiben ez műszakilag megvalósítható, figyelembe véve a különböző tartalomtípusok sajátosságait és korlátait, a megvalósítás költségeit és a technika általánosan elismert állását, amint azt a vonatkozó műszaki szabványok tükrözhetik. Ez a kötelezettség nem alkalmazandó, amennyiben az MI-rendszerek támogató funkciót töltenek be hagyományos szerkesztés céljára, vagy nem változtatják meg lényegesen az alkalmazó által szolgáltatott bemeneti adatokat vagy azok szemantikáját, vagy amennyiben azt törvény engedélyezi bűncselekmények felderítése, megelőzése, nyomozása vagy büntetőeljárás alá vonása céljából.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_50'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '50',
  '3',
  '(3) Az érzelemfelismerő rendszer vagy a biometrikus kategorizálási rendszer alkalmazóinak tájékoztatniuk kell a rendszer működéséről azon természetes személyeket, akik a rendszer működésének ki vannak téve, és a személyes adatokat az (EU) 2016/679 és az (EU) 2018/1725 rendeletnek, valamint – adott esetben – az (EU) 2016/680 irányelvnek megfelelően kell kezelniük. Ez a kötelezettség nem alkalmazandó a biometrikus kategorizálásra és érzelemfelismerésre használt olyan MI-rendszerekre, amelyeket a törvény megenged bűncselekmények felderítése, megelőzése és nyomozása céljából, a harmadik felek jogaira és szabadságaira vonatkozó megfelelő biztosítékok mellett, és az uniós jognak megfelelően.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_50'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '50',
  '4',
  '(4) Az olyan MI-rendszerek alkalmazóinak, amelyek eredetinek vagy valóságosnak tűnő („deepfake”) kép-, hang- vagy videotartalmat hoznak létre vagy manipulálnak, közölniük kell, hogy a tartalmat mesterségesen hozták létre vagy manipulálták. Ez a kötelezettség nem alkalmazandó, amennyiben a használatot törvény engedélyezi bűncselekmények felderítése, megelőzése, nyomozása vagy büntetőeljárás alá vonása céljából. Amennyiben a tartalom nyilvánvalóan művészeti, kreatív, szatirikus, fiktív vagy hasonló mű vagy program részét képezi, az e bekezdésben meghatározott átláthatósági kötelezettségek az ilyen létrehozott vagy manipulált tartalom meglétének megfelelő, a mű megjelenítését vagy élvezetét nem akadályozó közlésére korlátozódnak.

A nyilvánosság közérdekű ügyekről való tájékoztatása céljából közzétett szöveget generáló vagy manipuláló MI-rendszer alkalmazóinak közölniük kell, hogy a szöveget mesterségesen hozták létre vagy manipulálták. Ez a kötelezettség nem alkalmazandó abban az esetben, ha a felhasználást törvény engedélyezi bűncselekmények felderítése, megelőzése, nyomozása vagy büntetőeljárás alá vonása céljából, vagy ha a mesterséges intelligencia által létrehozott tartalmon emberi felülvizsgálatra vagy szerkesztési ellenőrzésre került sor, és amennyiben a tartalom közzétételéért természetes vagy jogi személy szerkesztői felelősséget visel.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_50'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '50',
  '5',
  '(5) Az (1)–(4) bekezdésben említett tájékoztatást legkésőbb az első interakció vagy kitettség alkalmával, egyértelmű és jól megkülönböztethető módon kell az érintett természetes személyek számára nyújtani. A tájékoztatásnak meg kell felelnie az alkalmazandó akadálymentesítési követelményeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_50'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '50',
  '6',
  '(6) Az (1)–(4) bekezdés nem érintheti a III. fejezetben meghatározott követelményeket és kötelezettségeket, és nem sérthet az MI-rendszerek alkalmazóira vonatkozóan az uniós vagy a nemzeti jogban megállapított egyéb átláthatósági kötelezettségeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_50'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '50',
  '7',
  '(7) Az MI-hivatalnak ösztönöznie és segítenie kell uniós szintű gyakorlati kódexek kidolgozását a mesterségesen előállított vagy manipulált tartalom észlelésére és címkézésére vonatkozó kötelezettségek hatékony végrehajtásának elősegítése érdekében. A Bizottság az 56. cikk (6) bekezdésében megállapított eljárásnak megfelelően végrehajtási jogi aktusokat fogadhat el az említett gyakorlati kódexek jóváhagyása céljából. A Bizottság – ha úgy ítéli meg, hogy a kódex nem megfelelő – a 98. cikk (2) bekezdésében megállapított vizsgálóbizottsági eljárásnak megfelelően végrehajtási jogi aktust fogadhat el, amelyben közös szabályokat határoz meg az említett kötelezettségek végrehajtására vonatkozóan.

V. FEJEZET

ÁLTALÁNOS CÉLÚ MI-MODELLEK

1. SZAKASZ

Besorolási szabályok',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_50'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '51',
  null,
  'Általános célú MI-modellek rendszerszintű kockázatot jelentő általános célú MI-modellként való besorolása
(1) Valamely általános célú MI-modellt rendszerszintű kockázatot jelentő általános célú MI-modellként kell besorolni, ha megfelel a következő feltételek bármelyikének:

a)

megfelelő technikai eszközök és módszertanok – többek között mutatók és referenciaértékek – alapján értékelt, nagy hatású képességekkel rendelkezik;

b)

a Bizottság – hivatalból vagy a tudományos testület által tett minősített riasztást követően hozott – határozata alapján az a) pontban meghatározottakkal egyenértékű képességekkel vagy hatással rendelkezik, tekintettel a XIII. mellékletben meghatározott kritériumokra.

(2) Valamely általános célú MI-modellről vélelmezni kell, hogy rendelkezik az (1) bekezdés a) pontja szerinti nagy hatású képességekkel, amikor a tanításához használt, lebegőpontos műveletekben mért, összesített számítási összege nagyobb, mint 10 25 .

(3) A Bizottság a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogad el annak érdekében, hogy a folyamatosan változó technológiai fejlemények – például az algoritmusok javulása vagy a hardverhatékonyság fokozódása – fényében módosítsa az e cikk (1) és (2) bekezdésében felsorolt küszöbértékeket, valamint kiegészítse a referenciamutatókat és a referenciaértékeket abból a célból, hogy ezen küszöbértékek a technika mindenkori állását tükrözzék.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_51'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '51',
  '1',
  '(1) Valamely általános célú MI-modellt rendszerszintű kockázatot jelentő általános célú MI-modellként kell besorolni, ha megfelel a következő feltételek bármelyikének:

a)

megfelelő technikai eszközök és módszertanok – többek között mutatók és referenciaértékek – alapján értékelt, nagy hatású képességekkel rendelkezik;

b)

a Bizottság – hivatalból vagy a tudományos testület által tett minősített riasztást követően hozott – határozata alapján az a) pontban meghatározottakkal egyenértékű képességekkel vagy hatással rendelkezik, tekintettel a XIII. mellékletben meghatározott kritériumokra.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_51'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '51',
  '1(a)',
  'a) megfelelő technikai eszközök és módszertanok – többek között mutatók és referenciaértékek – alapján értékelt, nagy hatású képességekkel rendelkezik;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_51'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '51',
  '1(b)',
  'b) a Bizottság – hivatalból vagy a tudományos testület által tett minősített riasztást követően hozott – határozata alapján az a) pontban meghatározottakkal egyenértékű képességekkel vagy hatással rendelkezik, tekintettel a XIII. mellékletben meghatározott kritériumokra.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_51'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '51',
  '2',
  '(2) Valamely általános célú MI-modellről vélelmezni kell, hogy rendelkezik az (1) bekezdés a) pontja szerinti nagy hatású képességekkel, amikor a tanításához használt, lebegőpontos műveletekben mért, összesített számítási összege nagyobb, mint 10 25 .',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_51'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '51',
  '3',
  '(3) A Bizottság a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogad el annak érdekében, hogy a folyamatosan változó technológiai fejlemények – például az algoritmusok javulása vagy a hardverhatékonyság fokozódása – fényében módosítsa az e cikk (1) és (2) bekezdésében felsorolt küszöbértékeket, valamint kiegészítse a referenciamutatókat és a referenciaértékeket abból a célból, hogy ezen küszöbértékek a technika mindenkori állását tükrözzék.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_51'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '52',
  null,
  'Eljárás
(1) Amennyiben egy általános célú MI-modell megfelel az 51. cikk (1) bekezdésének a) pontjában említett feltételnek, a releváns szolgáltató haladéktalanul, de legkésőbb két héttel azt követően értesíti a Bizottságot, hogy az említett követelmény teljesül, vagy ismertté válik, hogy a követelmény teljesülni fog. Az említett értesítésnek tartalmaznia kell az annak bizonyításához szükséges információkat, hogy a releváns követelmény teljesült. Ha a Bizottság tudomást szerez egy rendszerszintű kockázatot jelentő általános célú MI-modellről, amelyről nem értesítették, dönthet úgy, hogy azt rendszerszintű kockázatot jelentő modellként jelöli meg.

(2) Az 51. cikk (1) bekezdésének a) pontjában említett feltételnek megfelelő, általános célú MI-modell szolgáltatója az értesítésével együtt kellően megalapozott érveket terjeszthet elő annak bizonyítására, hogy az általános célú MI-modell – bár megfelel az említett követelménynek – a sajátos jellemzői miatt, kivételesen nem jelent rendszerszintű kockázatokat, és ezért nem kell rendszerszintű kockázatot jelentő általános célú MI-modellként besorolni.

(3) Amennyiben a Bizottság arra a következtetésre jut, hogy a (2) bekezdés alapján benyújtott érvek nem kellően megalapozottak, és az érintett szolgáltató nem tudta bizonyítani, hogy az általános célú MI-modell – a sajátos jellemzői miatt – nem jelent rendszerszintű kockázatot, elutasítja az említett érveket, és az általános célú MI-modellt rendszerszintű kockázatot jelentő általános célú MI-modellnek kell tekinteni.

(4) A Bizottság – hivatalból vagy a tudományos testület által a 90. cikk (1) bekezdésének a) pontja alapján tett minősített riasztást követően – a XIII. mellékletben meghatározott kritériumok alapján rendszerszintű kockázatot jelentő modellként jelölhet meg egy általános célú MI-modellt.

A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el a XIII. mellékletnek az említett mellékletben meghatározott kritériumok pontosítása és naprakésszé tétele révén történő módosítása céljából.

(5) Azon szolgáltató indokolással ellátott kérésére, amelynek modelljét a (4) bekezdés alapján rendszerszintű kockázatot jelentő általános MI-modellként jelölték meg, a Bizottság figyelembe veszi a kérelmet, és határozhat úgy, hogy újraértékeli, vajon az általános célú MI-modell a XIII. mellékletben meghatározott kritériumok alapján továbbra is rendszerszintű kockázatot jelentőnek tekinthető-e. Az ilyen kérelemnek tartalmaznia kell a megjelölésről szóló határozat óta felmerült objektív, részletes és új indokokat. A szolgáltatók legkorábban hat hónappal a megjelölésről szóló határozatot követően újraértékelést kérhetnek. Amennyiben a Bizottság az újraértékelését követően úgy határoz, hogy fenntartja a rendszerszintű kockázatot jelentő általános célú MI-modellként való megjelölést, a szolgáltatók legkorábban hat hónappal az említett határozatot követően kérhetnek újraértékelést.

(6) A Bizottság biztosítja a rendszerszintű kockázatot jelentő általános célú MI-modellek jegyzékének közzétételét, és naprakészen tartja az említett jegyzéket, a szellemitulajdon-jogok és a bizalmas üzleti információk vagy üzleti titkok uniós és nemzeti joggal összhangban történő tiszteletben tartása és védelme szükségességének sérelme nélkül.

2. SZAKASZ

Az általános célú MI-modellek szolgáltatóira vonatkozó kötelezettségek',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '52',
  '1',
  '(1) Amennyiben egy általános célú MI-modell megfelel az 51. cikk (1) bekezdésének a) pontjában említett feltételnek, a releváns szolgáltató haladéktalanul, de legkésőbb két héttel azt követően értesíti a Bizottságot, hogy az említett követelmény teljesül, vagy ismertté válik, hogy a követelmény teljesülni fog. Az említett értesítésnek tartalmaznia kell az annak bizonyításához szükséges információkat, hogy a releváns követelmény teljesült. Ha a Bizottság tudomást szerez egy rendszerszintű kockázatot jelentő általános célú MI-modellről, amelyről nem értesítették, dönthet úgy, hogy azt rendszerszintű kockázatot jelentő modellként jelöli meg.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '52',
  '2',
  '(2) Az 51. cikk (1) bekezdésének a) pontjában említett feltételnek megfelelő, általános célú MI-modell szolgáltatója az értesítésével együtt kellően megalapozott érveket terjeszthet elő annak bizonyítására, hogy az általános célú MI-modell – bár megfelel az említett követelménynek – a sajátos jellemzői miatt, kivételesen nem jelent rendszerszintű kockázatokat, és ezért nem kell rendszerszintű kockázatot jelentő általános célú MI-modellként besorolni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '52',
  '3',
  '(3) Amennyiben a Bizottság arra a következtetésre jut, hogy a (2) bekezdés alapján benyújtott érvek nem kellően megalapozottak, és az érintett szolgáltató nem tudta bizonyítani, hogy az általános célú MI-modell – a sajátos jellemzői miatt – nem jelent rendszerszintű kockázatot, elutasítja az említett érveket, és az általános célú MI-modellt rendszerszintű kockázatot jelentő általános célú MI-modellnek kell tekinteni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '52',
  '4',
  '(4) A Bizottság – hivatalból vagy a tudományos testület által a 90. cikk (1) bekezdésének a) pontja alapján tett minősített riasztást követően – a XIII. mellékletben meghatározott kritériumok alapján rendszerszintű kockázatot jelentő modellként jelölhet meg egy általános célú MI-modellt.

A Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el a XIII. mellékletnek az említett mellékletben meghatározott kritériumok pontosítása és naprakésszé tétele révén történő módosítása céljából.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '52',
  '5',
  '(5) Azon szolgáltató indokolással ellátott kérésére, amelynek modelljét a (4) bekezdés alapján rendszerszintű kockázatot jelentő általános MI-modellként jelölték meg, a Bizottság figyelembe veszi a kérelmet, és határozhat úgy, hogy újraértékeli, vajon az általános célú MI-modell a XIII. mellékletben meghatározott kritériumok alapján továbbra is rendszerszintű kockázatot jelentőnek tekinthető-e. Az ilyen kérelemnek tartalmaznia kell a megjelölésről szóló határozat óta felmerült objektív, részletes és új indokokat. A szolgáltatók legkorábban hat hónappal a megjelölésről szóló határozatot követően újraértékelést kérhetnek. Amennyiben a Bizottság az újraértékelését követően úgy határoz, hogy fenntartja a rendszerszintű kockázatot jelentő általános célú MI-modellként való megjelölést, a szolgáltatók legkorábban hat hónappal az említett határozatot követően kérhetnek újraértékelést.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '52',
  '6',
  '(6) A Bizottság biztosítja a rendszerszintű kockázatot jelentő általános célú MI-modellek jegyzékének közzétételét, és naprakészen tartja az említett jegyzéket, a szellemitulajdon-jogok és a bizalmas üzleti információk vagy üzleti titkok uniós és nemzeti joggal összhangban történő tiszteletben tartása és védelme szükségességének sérelme nélkül.

2. SZAKASZ

Az általános célú MI-modellek szolgáltatóira vonatkozó kötelezettségek',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_52'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '53',
  null,
  'Az általános célú MI-modellek szolgáltatóira vonatkozó kötelezettségek
(1) Az általános célú MI-modellek szolgáltatóinak:

a)

el kell készíteniük és naprakészen kell tartaniuk a modell műszaki dokumentációját, beleértve annak tanítási és tesztelési folyamatát, valamint értékelésének eredményeit, amelynek tartalmaznia kell legalább a XI. mellékletben meghatározott információkat abból a célból, hogy azt kérésre az MI-hivatal és az illetékes nemzeti hatóságok rendelkezésére bocsássák;

b)

információkat és dokumentációt kell kidolgozniuk, naprakészen tartaniuk és rendelkezésre bocsátaniuk az MI-rendszerek azon szolgáltatói részére, amelyek az általános célú MI-modellt be kívánják építeni MI-rendszereikbe. A szellemitulajdon-jogok és a bizalmas üzleti információk vagy üzleti titkok uniós és nemzeti joggal összhangban történő tiszteletben tartásának és védelmének sérelme nélkül, az információknak és a dokumentációnak:

i.

lehetővé kell tenniük az MI-rendszerek szolgáltatói számára, hogy jól megértsék az általános célú MI-modell képességeit és korlátait, és eleget tegyenek az e rendelet szerinti kötelezettségeiknek; és

ii.

tartalmazniuk kell legalább a XII. mellékletben meghatározott elemeket;

c)

a szerzői és kapcsolódó jogokra vonatkozó uniós jognak való megfelelésre irányuló politikát kell bevezetniük, és különösen azért, hogy azonosítsák és betartsák az (EU) 2019/790 irányelv 4. cikkének (3) bekezdése szerint kifejezett jogfenntartást, többek között a legkorszerűbb technológiák révén;

d)

kellően részletes összefoglalót kell készíteniük – az MI-hivatal által rendelkezésre bocsátott sablonnak megfelelően – és közzétenniük az általános célú MI-modell tanításához használt tartalomról.

(2) Az (1) bekezdés a) és b) pontjában meghatározott kötelezettségek nem alkalmazandók az olyan MI-modellek szolgáltatóira, amelyeket olyan szabad és nyílt forráskódú licenc alapján bocsátanak ki, amely lehetővé teszi a modellhez való hozzáférést, annak használatát, módosítását és terjesztését, és amelyek paramétereit – beleértve a súlyokat, a modell-architektúrára vonatkozó információkat és a modellhasználatra vonatkozó információkat – nyilvánosan hozzáférhetővé teszik. Ez a kivétel nem alkalmazandó a rendszerszintű kockázatot jelentő általános célú MI-modellekre.

(3) Az általános célú MI-modellek szolgáltatóinak szükség szerint együtt kell működniük a Bizottsággal és az illetékes nemzeti hatóságokkal az e rendelet szerinti hatásköreik és jogköreik gyakorlása során.

(4) Az általános célú MI-modellek szolgáltatói egy harmonizált szabvány közzétételéig támaszkodhatnak az 56. cikk szerinti gyakorlati kódexekre az e cikk (1) bekezdésében meghatározott kötelezettségeknek való megfelelés bizonyítása céljából. Az európai harmonizált szabványoknak való megfelelés a szolgáltatók számára a megfelelés vélelmét biztosítja annyiban, amennyiben az említett szabványok kiterjednek az említett kötelezettségekre. Az általános célú MI-modellek azon szolgáltatóinak, amelyek nem tartanak be valamely jóváhagyott gyakorlati kódexet, vagy nem felelnek meg valamely európai harmonizált szabványnak, a Bizottság általi értékelés céljából megfelelő alternatív megfelelőségi eszközöket kell bemutatniuk.

(5) A XI. mellékletnek és különösen annak 2. pontja d) és e) alpontjának való megfelelés elősegítése érdekében a Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el a mérési és számítási módszerek részletezése céljából, hogy lehetővé tegye összehasonlítható és ellenőrizhető dokumentáció készítését.

(6) A Bizottság felhatalmazást kap arra, hogy a 97. cikk (2) bekezdésének megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el abból a célból, hogy a technológiai fejlemények fényében módosítsa a XI. és a XII. mellékletet.

(7) Az e cikk alapján megszerzett információkat, illetve dokumentációt – az üzleti titkokat is beleértve – a 78. cikkben foglalt titoktartási kötelezettségeknek megfelelően kell kezelni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '53',
  '1',
  '(1) Az általános célú MI-modellek szolgáltatóinak:

a)

el kell készíteniük és naprakészen kell tartaniuk a modell műszaki dokumentációját, beleértve annak tanítási és tesztelési folyamatát, valamint értékelésének eredményeit, amelynek tartalmaznia kell legalább a XI. mellékletben meghatározott információkat abból a célból, hogy azt kérésre az MI-hivatal és az illetékes nemzeti hatóságok rendelkezésére bocsássák;

b)

információkat és dokumentációt kell kidolgozniuk, naprakészen tartaniuk és rendelkezésre bocsátaniuk az MI-rendszerek azon szolgáltatói részére, amelyek az általános célú MI-modellt be kívánják építeni MI-rendszereikbe. A szellemitulajdon-jogok és a bizalmas üzleti információk vagy üzleti titkok uniós és nemzeti joggal összhangban történő tiszteletben tartásának és védelmének sérelme nélkül, az információknak és a dokumentációnak:

i.

lehetővé kell tenniük az MI-rendszerek szolgáltatói számára, hogy jól megértsék az általános célú MI-modell képességeit és korlátait, és eleget tegyenek az e rendelet szerinti kötelezettségeiknek; és

ii.

tartalmazniuk kell legalább a XII. mellékletben meghatározott elemeket;

c)

a szerzői és kapcsolódó jogokra vonatkozó uniós jognak való megfelelésre irányuló politikát kell bevezetniük, és különösen azért, hogy azonosítsák és betartsák az (EU) 2019/790 irányelv 4. cikkének (3) bekezdése szerint kifejezett jogfenntartást, többek között a legkorszerűbb technológiák révén;

d)

kellően részletes összefoglalót kell készíteniük – az MI-hivatal által rendelkezésre bocsátott sablonnak megfelelően – és közzétenniük az általános célú MI-modell tanításához használt tartalomról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '53',
  '1(a)',
  'a) el kell készíteniük és naprakészen kell tartaniuk a modell műszaki dokumentációját, beleértve annak tanítási és tesztelési folyamatát, valamint értékelésének eredményeit, amelynek tartalmaznia kell legalább a XI. mellékletben meghatározott információkat abból a célból, hogy azt kérésre az MI-hivatal és az illetékes nemzeti hatóságok rendelkezésére bocsássák;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '53',
  '1(b)',
  'b) információkat és dokumentációt kell kidolgozniuk, naprakészen tartaniuk és rendelkezésre bocsátaniuk az MI-rendszerek azon szolgáltatói részére, amelyek az általános célú MI-modellt be kívánják építeni MI-rendszereikbe. A szellemitulajdon-jogok és a bizalmas üzleti információk vagy üzleti titkok uniós és nemzeti joggal összhangban történő tiszteletben tartásának és védelmének sérelme nélkül, az információknak és a dokumentációnak:

i.

lehetővé kell tenniük az MI-rendszerek szolgáltatói számára, hogy jól megértsék az általános célú MI-modell képességeit és korlátait, és eleget tegyenek az e rendelet szerinti kötelezettségeiknek; és',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '53',
  '1(c)',
  'c) a szerzői és kapcsolódó jogokra vonatkozó uniós jognak való megfelelésre irányuló politikát kell bevezetniük, és különösen azért, hogy azonosítsák és betartsák az (EU) 2019/790 irányelv 4. cikkének (3) bekezdése szerint kifejezett jogfenntartást, többek között a legkorszerűbb technológiák révén;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '53',
  '1(d)',
  'd) kellően részletes összefoglalót kell készíteniük – az MI-hivatal által rendelkezésre bocsátott sablonnak megfelelően – és közzétenniük az általános célú MI-modell tanításához használt tartalomról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '53',
  '2',
  '(2) Az (1) bekezdés a) és b) pontjában meghatározott kötelezettségek nem alkalmazandók az olyan MI-modellek szolgáltatóira, amelyeket olyan szabad és nyílt forráskódú licenc alapján bocsátanak ki, amely lehetővé teszi a modellhez való hozzáférést, annak használatát, módosítását és terjesztését, és amelyek paramétereit – beleértve a súlyokat, a modell-architektúrára vonatkozó információkat és a modellhasználatra vonatkozó információkat – nyilvánosan hozzáférhetővé teszik. Ez a kivétel nem alkalmazandó a rendszerszintű kockázatot jelentő általános célú MI-modellekre.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '53',
  '3',
  '(3) Az általános célú MI-modellek szolgáltatóinak szükség szerint együtt kell működniük a Bizottsággal és az illetékes nemzeti hatóságokkal az e rendelet szerinti hatásköreik és jogköreik gyakorlása során.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '53',
  '4',
  '(4) Az általános célú MI-modellek szolgáltatói egy harmonizált szabvány közzétételéig támaszkodhatnak az 56. cikk szerinti gyakorlati kódexekre az e cikk (1) bekezdésében meghatározott kötelezettségeknek való megfelelés bizonyítása céljából. Az európai harmonizált szabványoknak való megfelelés a szolgáltatók számára a megfelelés vélelmét biztosítja annyiban, amennyiben az említett szabványok kiterjednek az említett kötelezettségekre. Az általános célú MI-modellek azon szolgáltatóinak, amelyek nem tartanak be valamely jóváhagyott gyakorlati kódexet, vagy nem felelnek meg valamely európai harmonizált szabványnak, a Bizottság általi értékelés céljából megfelelő alternatív megfelelőségi eszközöket kell bemutatniuk.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '53',
  '5',
  '(5) A XI. mellékletnek és különösen annak 2. pontja d) és e) alpontjának való megfelelés elősegítése érdekében a Bizottság felhatalmazást kap arra, hogy a 97. cikknek megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el a mérési és számítási módszerek részletezése céljából, hogy lehetővé tegye összehasonlítható és ellenőrizhető dokumentáció készítését.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '53',
  '6',
  '(6) A Bizottság felhatalmazást kap arra, hogy a 97. cikk (2) bekezdésének megfelelően felhatalmazáson alapuló jogi aktusokat fogadjon el abból a célból, hogy a technológiai fejlemények fényében módosítsa a XI. és a XII. mellékletet.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '53',
  '7',
  '(7) Az e cikk alapján megszerzett információkat, illetve dokumentációt – az üzleti titkokat is beleértve – a 78. cikkben foglalt titoktartási kötelezettségeknek megfelelően kell kezelni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_53'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '54',
  null,
  'Az általános célú MI-modellek szolgáltatóinak meghatalmazott képviselői
(1) Valamely általános célú MI-rendszernek az Unió piacán való forgalomba hozatalát megelőzően a harmadik országokban letelepedett szolgáltatóknak írásbeli meghatalmazással ki kell nevezniük egy, az Unióban letelepedett meghatalmazott képviselőt.

(2) A szolgáltatónak lehetővé kell tennie a meghatalmazott képviselője számára, hogy elvégezze a szolgáltatótól kapott megbízásban meghatározott feladatokat.

(3) A meghatalmazott képviselőknek a szolgáltatótól kapott megbízásban meghatározott feladatokat kell ellátniuk. A megbízás egy példányát kérésre az MI-hivatal rendelkezésére kell bocsátaniuk az Unió intézményeinek egyik hivatalos nyelvén. E rendelet alkalmazása céljából a megbízásban fel kell hatalmazni a meghatalmazott képviselőt a következő feladatok elvégzésére:

a)

annak ellenőrzése, hogy a XI. mellékletben meghatározott műszaki dokumentációt a szolgáltató elkészítette-e, és teljesítette-e az 53. cikkben és – adott esetben – az 55. cikkben említett valamennyi kötelezettséget;

b)

az általános célú MI-modell forgalomba hozatalát követően 10 évig a XI. mellékletben meghatározott műszaki dokumentáció egy példányának megőrzése az MI-hivatal és az illetékes nemzeti hatóságok számára, valamint a meghatalmazott képviselőt kinevező szolgáltató elérhetőségének megőrzése;

c)

indokolt kérésre az e fejezetben foglalt kötelezettségeknek való megfelelés igazolásához szükséges valamennyi információnak és dokumentációnak – ideértve a b) pontban említetteket is – az MI-hivatal rendelkezésére bocsátása;

d)

indokolt kérésre együttműködés az MI-hivatallal és az illetékes hatóságokkal az általuk a rendszerszintű kockázatot jelentő általános célú MI-modellel kapcsolatban hozott minden intézkedés tekintetében, ideértve azt is, amikor a modellt az Unióban forgalomba hozott vagy üzembe helyezett MI-rendszerekbe integrálják.

(4) A megbízásban fel kell hatalmazni a meghatalmazott képviselőt arra, hogy az MI-hivatal vagy az illetékes hatóságok hozzá fordulhassanak – a szolgáltató mellett vagy helyett – az e rendeletnek való megfelelés biztosításával kapcsolatos minden kérdést illetően.

(5) A meghatalmazott képviselőnek meg kell szüntetnie a megbízást, ha úgy ítéli meg, vagy oka van úgy megítélni, hogy a szolgáltató az e rendelet szerinti kötelezettségeivel ellentétesen jár el. Ilyen esetben a megbízás megszüntetéséről és annak okairól haladéktalanul tájékoztatnia kell az MI-hivatalt is.

(6) Az e cikkben meghatározott kötelezettségek nem alkalmazandók az olyan, általános célú MI-modellek szolgáltatóira, amelyeket olyan szabad és nyílt forráskódú licenc alapján bocsátanak ki, amely lehetővé teszi a modellhez való hozzáférést, annak használatát, módosítását és terjesztését, és amelyek paramétereit – beleértve a súlyokat, a modell-architektúrára vonatkozó információkat és a modellhasználatra vonatkozó információkat – nyilvánosan hozzáférhetővé teszik, kivéve, ha az általános célú MI-modell rendszerszintű kockázatot jelent.

3. SZAKASZ

A rendszerszintű kockázatot jelentő általános célú MI-modellek szolgáltatóinak kötelezettségei',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '54',
  '1',
  '(1) Valamely általános célú MI-rendszernek az Unió piacán való forgalomba hozatalát megelőzően a harmadik országokban letelepedett szolgáltatóknak írásbeli meghatalmazással ki kell nevezniük egy, az Unióban letelepedett meghatalmazott képviselőt.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '54',
  '2',
  '(2) A szolgáltatónak lehetővé kell tennie a meghatalmazott képviselője számára, hogy elvégezze a szolgáltatótól kapott megbízásban meghatározott feladatokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '54',
  '3',
  '(3) A meghatalmazott képviselőknek a szolgáltatótól kapott megbízásban meghatározott feladatokat kell ellátniuk. A megbízás egy példányát kérésre az MI-hivatal rendelkezésére kell bocsátaniuk az Unió intézményeinek egyik hivatalos nyelvén. E rendelet alkalmazása céljából a megbízásban fel kell hatalmazni a meghatalmazott képviselőt a következő feladatok elvégzésére:

a)

annak ellenőrzése, hogy a XI. mellékletben meghatározott műszaki dokumentációt a szolgáltató elkészítette-e, és teljesítette-e az 53. cikkben és – adott esetben – az 55. cikkben említett valamennyi kötelezettséget;

b)

az általános célú MI-modell forgalomba hozatalát követően 10 évig a XI. mellékletben meghatározott műszaki dokumentáció egy példányának megőrzése az MI-hivatal és az illetékes nemzeti hatóságok számára, valamint a meghatalmazott képviselőt kinevező szolgáltató elérhetőségének megőrzése;

c)

indokolt kérésre az e fejezetben foglalt kötelezettségeknek való megfelelés igazolásához szükséges valamennyi információnak és dokumentációnak – ideértve a b) pontban említetteket is – az MI-hivatal rendelkezésére bocsátása;

d)

indokolt kérésre együttműködés az MI-hivatallal és az illetékes hatóságokkal az általuk a rendszerszintű kockázatot jelentő általános célú MI-modellel kapcsolatban hozott minden intézkedés tekintetében, ideértve azt is, amikor a modellt az Unióban forgalomba hozott vagy üzembe helyezett MI-rendszerekbe integrálják.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '54',
  '3(a)',
  'a) annak ellenőrzése, hogy a XI. mellékletben meghatározott műszaki dokumentációt a szolgáltató elkészítette-e, és teljesítette-e az 53. cikkben és – adott esetben – az 55. cikkben említett valamennyi kötelezettséget;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '54',
  '3(b)',
  'b) az általános célú MI-modell forgalomba hozatalát követően 10 évig a XI. mellékletben meghatározott műszaki dokumentáció egy példányának megőrzése az MI-hivatal és az illetékes nemzeti hatóságok számára, valamint a meghatalmazott képviselőt kinevező szolgáltató elérhetőségének megőrzése;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '54',
  '3(c)',
  'c) indokolt kérésre az e fejezetben foglalt kötelezettségeknek való megfelelés igazolásához szükséges valamennyi információnak és dokumentációnak – ideértve a b) pontban említetteket is – az MI-hivatal rendelkezésére bocsátása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '54',
  '3(d)',
  'd) indokolt kérésre együttműködés az MI-hivatallal és az illetékes hatóságokkal az általuk a rendszerszintű kockázatot jelentő általános célú MI-modellel kapcsolatban hozott minden intézkedés tekintetében, ideértve azt is, amikor a modellt az Unióban forgalomba hozott vagy üzembe helyezett MI-rendszerekbe integrálják.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '54',
  '4',
  '(4) A megbízásban fel kell hatalmazni a meghatalmazott képviselőt arra, hogy az MI-hivatal vagy az illetékes hatóságok hozzá fordulhassanak – a szolgáltató mellett vagy helyett – az e rendeletnek való megfelelés biztosításával kapcsolatos minden kérdést illetően.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '54',
  '5',
  '(5) A meghatalmazott képviselőnek meg kell szüntetnie a megbízást, ha úgy ítéli meg, vagy oka van úgy megítélni, hogy a szolgáltató az e rendelet szerinti kötelezettségeivel ellentétesen jár el. Ilyen esetben a megbízás megszüntetéséről és annak okairól haladéktalanul tájékoztatnia kell az MI-hivatalt is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '54',
  '6',
  '(6) Az e cikkben meghatározott kötelezettségek nem alkalmazandók az olyan, általános célú MI-modellek szolgáltatóira, amelyeket olyan szabad és nyílt forráskódú licenc alapján bocsátanak ki, amely lehetővé teszi a modellhez való hozzáférést, annak használatát, módosítását és terjesztését, és amelyek paramétereit – beleértve a súlyokat, a modell-architektúrára vonatkozó információkat és a modellhasználatra vonatkozó információkat – nyilvánosan hozzáférhetővé teszik, kivéve, ha az általános célú MI-modell rendszerszintű kockázatot jelent.

3. SZAKASZ

A rendszerszintű kockázatot jelentő általános célú MI-modellek szolgáltatóinak kötelezettségei',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_54'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '55',
  null,
  'A rendszerszintű kockázatot jelentő általános célú MI-modellek szolgáltatóinak kötelezettségei
(1) Az 53. és az 54. cikkben felsorolt kötelezettségeken túlmenően, a rendszerszintű kockázatot jelentő általános célú MI-modellek szolgáltatóinak:

a)

modellértékelést kell végezniük a technika állásának megfelelő, szabványosított protokollokkal és eszközökkel összhangban, ideértve a modell támadó szempontú tesztelésének elvégzését és dokumentálását a rendszerszintű kockázatok azonosítása és enyhítése céljából;

b)

értékelniük és enyhíteniük kell az esetlegesen a rendszerszintű kockázatot jelentő általános célú MI-modellek fejlesztéséből, forgalomba hozatalából vagy használatából eredő lehetséges, uniós szintű rendszerszintű kockázatokat, beleértve azok forrásait is;

c)

nyomon kell követniük, dokumentálniuk kell és indokolatlan késedelem nélkül jelenteniük kell az MI-hivatal és adott esetben az illetékes nemzeti hatóságok részére a súlyos váratlan eseményekre és az azok kezelésére szolgáló lehetséges korrekciós intézkedésekre vonatkozó releváns információkat;

d)

megfelelő szintű kiberbiztonsági védelmet kell biztosítaniuk a rendszerszintű kockázatot jelentő általános célú MI-modell és a modell fizikai infrastruktúrája számára.

(2) A rendszerszintű kockázatot jelentő általános célú MI-modellek szolgáltatói egy harmonizált szabvány közzétételéig támaszkodhatnak az 56. cikk szerinti gyakorlati kódexekre az e cikk (1) bekezdésében meghatározott kötelezettségeknek való megfelelés bizonyítása céljából. A európai harmonizált szabványoknak való megfelelés a szolgáltatók számára a megfelelés vélelmét biztosítja annyiban, amennyiben az említett szabványok kiterjednek az említett kötelezettségekre. A rendszerszintű kockázatot jelentő általános célú MI-modellek azon szolgáltatóinak, amelyek nem tartanak be valamely jóváhagyott gyakorlati kódexet, vagy nem felelnek meg egy európai harmonizált szabványnak, a Bizottság általi értékelés céljából megfelelő alternatív megfelelőségi eszközöket kell bemutatniuk.

(3) Az e cikk alapján megszerzett információkat, illetve dokumentációt – az üzletit titkokat is beleértve – a 78. cikkben foglalt titoktartási kötelezettségeknek megfelelően kell kezelni.

4. SZAKASZ

Gyakorlati kódexek',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_55'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '55',
  '1',
  '(1) Az 53. és az 54. cikkben felsorolt kötelezettségeken túlmenően, a rendszerszintű kockázatot jelentő általános célú MI-modellek szolgáltatóinak:

a)

modellértékelést kell végezniük a technika állásának megfelelő, szabványosított protokollokkal és eszközökkel összhangban, ideértve a modell támadó szempontú tesztelésének elvégzését és dokumentálását a rendszerszintű kockázatok azonosítása és enyhítése céljából;

b)

értékelniük és enyhíteniük kell az esetlegesen a rendszerszintű kockázatot jelentő általános célú MI-modellek fejlesztéséből, forgalomba hozatalából vagy használatából eredő lehetséges, uniós szintű rendszerszintű kockázatokat, beleértve azok forrásait is;

c)

nyomon kell követniük, dokumentálniuk kell és indokolatlan késedelem nélkül jelenteniük kell az MI-hivatal és adott esetben az illetékes nemzeti hatóságok részére a súlyos váratlan eseményekre és az azok kezelésére szolgáló lehetséges korrekciós intézkedésekre vonatkozó releváns információkat;

d)

megfelelő szintű kiberbiztonsági védelmet kell biztosítaniuk a rendszerszintű kockázatot jelentő általános célú MI-modell és a modell fizikai infrastruktúrája számára.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_55'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '55',
  '1(a)',
  'a) modellértékelést kell végezniük a technika állásának megfelelő, szabványosított protokollokkal és eszközökkel összhangban, ideértve a modell támadó szempontú tesztelésének elvégzését és dokumentálását a rendszerszintű kockázatok azonosítása és enyhítése céljából;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_55'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '55',
  '1(b)',
  'b) értékelniük és enyhíteniük kell az esetlegesen a rendszerszintű kockázatot jelentő általános célú MI-modellek fejlesztéséből, forgalomba hozatalából vagy használatából eredő lehetséges, uniós szintű rendszerszintű kockázatokat, beleértve azok forrásait is;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_55'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '55',
  '1(c)',
  'c) nyomon kell követniük, dokumentálniuk kell és indokolatlan késedelem nélkül jelenteniük kell az MI-hivatal és adott esetben az illetékes nemzeti hatóságok részére a súlyos váratlan eseményekre és az azok kezelésére szolgáló lehetséges korrekciós intézkedésekre vonatkozó releváns információkat;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_55'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '55',
  '1(d)',
  'd) megfelelő szintű kiberbiztonsági védelmet kell biztosítaniuk a rendszerszintű kockázatot jelentő általános célú MI-modell és a modell fizikai infrastruktúrája számára.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_55'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '55',
  '2',
  '(2) A rendszerszintű kockázatot jelentő általános célú MI-modellek szolgáltatói egy harmonizált szabvány közzétételéig támaszkodhatnak az 56. cikk szerinti gyakorlati kódexekre az e cikk (1) bekezdésében meghatározott kötelezettségeknek való megfelelés bizonyítása céljából. A európai harmonizált szabványoknak való megfelelés a szolgáltatók számára a megfelelés vélelmét biztosítja annyiban, amennyiben az említett szabványok kiterjednek az említett kötelezettségekre. A rendszerszintű kockázatot jelentő általános célú MI-modellek azon szolgáltatóinak, amelyek nem tartanak be valamely jóváhagyott gyakorlati kódexet, vagy nem felelnek meg egy európai harmonizált szabványnak, a Bizottság általi értékelés céljából megfelelő alternatív megfelelőségi eszközöket kell bemutatniuk.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_55'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '55',
  '3',
  '(3) Az e cikk alapján megszerzett információkat, illetve dokumentációt – az üzletit titkokat is beleértve – a 78. cikkben foglalt titoktartási kötelezettségeknek megfelelően kell kezelni.

4. SZAKASZ

Gyakorlati kódexek',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_55'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  null,
  'Gyakorlati kódexek
(1) Az MI-hivatalnak ösztönöznie kell és elő kell segítenie uniós szintű gyakorlati kódexek kidolgozását annak érdekében, hogy hozzájáruljon e rendelet megfelelő alkalmazásához, figyelembe véve a nemzetközi megközelítéseket.

(2) Az MI-hivatalnak és a Testületnek törekednie kell annak biztosítására, hogy a gyakorlati kódexek kiterjedjenek legalább az 53. és az 55. cikkben meghatározott kötelezettségekre, beleértve a következő kérdéseket:

a)

az annak biztosítására szolgáló eszközök, hogy az 53. cikk (1) bekezdésének a) és b) pontjában említett információkat a piaci és technológiai fejlemények fényében naprakészen tartsák;

b)

a tanításhoz használt tartalomról szóló összefoglaló megfelelő szintű részletessége;

c)

az uniós szintű rendszerszintű kockázatok típusának és jellegének azonosítása, beleértve adott esetben azok forrásait is;

d)

az uniós szintű rendszerszintű kockázatok értékelésére és kezelésére vonatkozó olyan intézkedések, eljárások és modalitások, ideértve azok dokumentációját is, amelyeknek arányosnak kell lenniük a kockázatokkal, figyelembe kell venniük azok súlyosságát és valószínűségét, és figyelembe kell venniük az e kockázatok kezelésével kapcsolatos sajátos kihívásokat, tekintetbe véve az ilyen kockázatok felmerülésének és megvalósulásának lehetséges módjait az MI-értéklánc mentén.

(3) Az MI-hivatal felkérheti az általános célú MI-modellek valamennyi szolgáltatóját, valamint az érintett illetékes nemzeti hatóságokat, hogy vegyenek részt gyakorlati kódexek kidolgozásában. A civil társadalmi szervezetek, az ipar, a tudományos élet és más érintett érdekelt felek, például a downstream szolgáltatók és a független szakértők támogathatják a folyamatot.

(4) Az MI-hivatalnak és a Testületnek törekednie kell annak biztosítására, hogy a gyakorlati kódexek egyértelműen meghatározzák egyedi célkitűzéseiket, és az e célkitűzések elérésének biztosítására irányuló kötelezettségvállalásokat vagy intézkedéseket tartalmazzanak, beleértve adott esetben fő teljesítménymutatókat is, valamint hogy uniós szinten kellően figyelembe vegyék valamennyi érdekelt fél – köztük az érintett személyek – szükségleteit és érdekeit.

(5) Az MI-hivatalnak törekednie kell annak biztosítására, hogy a gyakorlati kódexek résztvevői rendszeresen beszámoljanak az MI-hivatalnak a kötelezettségvállalások végrehajtásáról, valamint a meghozott intézkedésekről és azok eredményeiről, adott esetben a fő teljesítménymutatókkal összevetve is. A fő teljesítménymutatóknak és a jelentéstételi kötelezettségvállalásoknak tükrözniük kell a különböző résztvevők mérete és kapacitása közötti különbségeket.

(6) Az MI-hivatalnak és a Testületnek rendszeresen nyomon kell követnie és értékelnie kell a gyakorlati kódexek célkitűzéseinek a résztvevők általi teljesítését, valamint az e rendelet megfelelő alkalmazásához való hozzájárulásukat. Az MI-hivatalnak és a Testületnek értékelnie kell, hogy a gyakorlati kódexek kiterjednek-e az 53. és az 55. cikkben meghatározott kötelezettségekre, és rendszeresen nyomon kell követnie és értékelnie kell a kódexekben foglalt célkitűzések elérését. A gyakorlati kódexek megfelelőségéről szóló értékelésüket közzé kell tenniük.

A Bizottság végrehajtási jogi aktus útján jóváhagyhatja a gyakorlati kódexet, és azt az Unión belül általánosan érvényessé nyilváníthatja. Ezt a végrehajtási jogi aktust a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.

(7) Az MI-hivatal felkérheti az általános célú MI-modellek valamennyi szolgáltatóját, hogy tartsák be a gyakorlati kódexekben foglaltakat. A rendszerszintű kockázatot nem jelentő általános célú MI-modellek szolgáltatói esetében a kódexek ezen betartása az 53. cikkben meghatározott kötelezettségekre korlátozódhat, kivéve, ha kifejezetten kinyilvánítják a teljes kódexhez való csatlakozás iránti szándékukat.

(8) Az MI-hivatalnak adott esetben ösztönöznie kell és elő kell segítenie a gyakorlati kódexek felülvizsgálatát és kiigazítását, különösen az újonnan megjelenő szabványokra figyelemmel. Az MI-hivatalnak segítséget kell nyújtania a rendelkezésre álló szabványok értékeléséhez.

(9) A gyakorlati kódexeknek legkésőbb 2025. május 2-ig el kell készülniük. Az MI-hivatalnak meg kell tennie a szükséges lépéseket, beleértve a szolgáltatók (7) bekezdés szerinti felkérését is.

Ha 2025. augusztus 2-ig nem véglegesíthető valamely gyakorlati kódex, vagy ha az MI-hivatal annak e cikk (6) bekezdése szerinti értékelését követően úgy ítéli meg, hogy az nem megfelelő, a Bizottság végrehajtási jogi aktusok útján közös szabályokat állapíthat meg az 53. és az 55. cikkben meghatározott kötelezettségek végrehajtására vonatkozóan, beleértve az e cikk (2) bekezdésében meghatározott kérdéseket is. Ezeket a végrehajtási jogi aktusokat a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.

VI. FEJEZET

AZ INNOVÁCIÓT TÁMOGATÓ INTÉZKEDÉSEK',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '1',
  '(1) Az MI-hivatalnak ösztönöznie kell és elő kell segítenie uniós szintű gyakorlati kódexek kidolgozását annak érdekében, hogy hozzájáruljon e rendelet megfelelő alkalmazásához, figyelembe véve a nemzetközi megközelítéseket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '2',
  '(2) Az MI-hivatalnak és a Testületnek törekednie kell annak biztosítására, hogy a gyakorlati kódexek kiterjedjenek legalább az 53. és az 55. cikkben meghatározott kötelezettségekre, beleértve a következő kérdéseket:

a)

az annak biztosítására szolgáló eszközök, hogy az 53. cikk (1) bekezdésének a) és b) pontjában említett információkat a piaci és technológiai fejlemények fényében naprakészen tartsák;

b)

a tanításhoz használt tartalomról szóló összefoglaló megfelelő szintű részletessége;

c)

az uniós szintű rendszerszintű kockázatok típusának és jellegének azonosítása, beleértve adott esetben azok forrásait is;

d)

az uniós szintű rendszerszintű kockázatok értékelésére és kezelésére vonatkozó olyan intézkedések, eljárások és modalitások, ideértve azok dokumentációját is, amelyeknek arányosnak kell lenniük a kockázatokkal, figyelembe kell venniük azok súlyosságát és valószínűségét, és figyelembe kell venniük az e kockázatok kezelésével kapcsolatos sajátos kihívásokat, tekintetbe véve az ilyen kockázatok felmerülésének és megvalósulásának lehetséges módjait az MI-értéklánc mentén.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '2(a)',
  'a) az annak biztosítására szolgáló eszközök, hogy az 53. cikk (1) bekezdésének a) és b) pontjában említett információkat a piaci és technológiai fejlemények fényében naprakészen tartsák;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '2(b)',
  'b) a tanításhoz használt tartalomról szóló összefoglaló megfelelő szintű részletessége;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '2(c)',
  'c) az uniós szintű rendszerszintű kockázatok típusának és jellegének azonosítása, beleértve adott esetben azok forrásait is;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '2(d)',
  'd) az uniós szintű rendszerszintű kockázatok értékelésére és kezelésére vonatkozó olyan intézkedések, eljárások és modalitások, ideértve azok dokumentációját is, amelyeknek arányosnak kell lenniük a kockázatokkal, figyelembe kell venniük azok súlyosságát és valószínűségét, és figyelembe kell venniük az e kockázatok kezelésével kapcsolatos sajátos kihívásokat, tekintetbe véve az ilyen kockázatok felmerülésének és megvalósulásának lehetséges módjait az MI-értéklánc mentén.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '3',
  '(3) Az MI-hivatal felkérheti az általános célú MI-modellek valamennyi szolgáltatóját, valamint az érintett illetékes nemzeti hatóságokat, hogy vegyenek részt gyakorlati kódexek kidolgozásában. A civil társadalmi szervezetek, az ipar, a tudományos élet és más érintett érdekelt felek, például a downstream szolgáltatók és a független szakértők támogathatják a folyamatot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '4',
  '(4) Az MI-hivatalnak és a Testületnek törekednie kell annak biztosítására, hogy a gyakorlati kódexek egyértelműen meghatározzák egyedi célkitűzéseiket, és az e célkitűzések elérésének biztosítására irányuló kötelezettségvállalásokat vagy intézkedéseket tartalmazzanak, beleértve adott esetben fő teljesítménymutatókat is, valamint hogy uniós szinten kellően figyelembe vegyék valamennyi érdekelt fél – köztük az érintett személyek – szükségleteit és érdekeit.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '5',
  '(5) Az MI-hivatalnak törekednie kell annak biztosítására, hogy a gyakorlati kódexek résztvevői rendszeresen beszámoljanak az MI-hivatalnak a kötelezettségvállalások végrehajtásáról, valamint a meghozott intézkedésekről és azok eredményeiről, adott esetben a fő teljesítménymutatókkal összevetve is. A fő teljesítménymutatóknak és a jelentéstételi kötelezettségvállalásoknak tükrözniük kell a különböző résztvevők mérete és kapacitása közötti különbségeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '6',
  '(6) Az MI-hivatalnak és a Testületnek rendszeresen nyomon kell követnie és értékelnie kell a gyakorlati kódexek célkitűzéseinek a résztvevők általi teljesítését, valamint az e rendelet megfelelő alkalmazásához való hozzájárulásukat. Az MI-hivatalnak és a Testületnek értékelnie kell, hogy a gyakorlati kódexek kiterjednek-e az 53. és az 55. cikkben meghatározott kötelezettségekre, és rendszeresen nyomon kell követnie és értékelnie kell a kódexekben foglalt célkitűzések elérését. A gyakorlati kódexek megfelelőségéről szóló értékelésüket közzé kell tenniük.

A Bizottság végrehajtási jogi aktus útján jóváhagyhatja a gyakorlati kódexet, és azt az Unión belül általánosan érvényessé nyilváníthatja. Ezt a végrehajtási jogi aktust a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '7',
  '(7) Az MI-hivatal felkérheti az általános célú MI-modellek valamennyi szolgáltatóját, hogy tartsák be a gyakorlati kódexekben foglaltakat. A rendszerszintű kockázatot nem jelentő általános célú MI-modellek szolgáltatói esetében a kódexek ezen betartása az 53. cikkben meghatározott kötelezettségekre korlátozódhat, kivéve, ha kifejezetten kinyilvánítják a teljes kódexhez való csatlakozás iránti szándékukat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '8',
  '(8) Az MI-hivatalnak adott esetben ösztönöznie kell és elő kell segítenie a gyakorlati kódexek felülvizsgálatát és kiigazítását, különösen az újonnan megjelenő szabványokra figyelemmel. Az MI-hivatalnak segítséget kell nyújtania a rendelkezésre álló szabványok értékeléséhez.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '56',
  '9',
  '(9) A gyakorlati kódexeknek legkésőbb 2025. május 2-ig el kell készülniük. Az MI-hivatalnak meg kell tennie a szükséges lépéseket, beleértve a szolgáltatók (7) bekezdés szerinti felkérését is.

Ha 2025. augusztus 2-ig nem véglegesíthető valamely gyakorlati kódex, vagy ha az MI-hivatal annak e cikk (6) bekezdése szerinti értékelését követően úgy ítéli meg, hogy az nem megfelelő, a Bizottság végrehajtási jogi aktusok útján közös szabályokat állapíthat meg az 53. és az 55. cikkben meghatározott kötelezettségek végrehajtására vonatkozóan, beleértve az e cikk (2) bekezdésében meghatározott kérdéseket is. Ezeket a végrehajtási jogi aktusokat a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.

VI. FEJEZET

AZ INNOVÁCIÓT TÁMOGATÓ INTÉZKEDÉSEK',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_56'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  null,
  'MI szabályozói tesztkörnyezetek
(1) A tagállamok biztosítják, hogy illetékes hatóságaik nemzeti szinten legalább egy MI szabályozói tesztkörnyezetet hozzanak létre, amelynek 2026. augusztus 2-re működőképesnek kell lennie. Az említett tesztkörnyezetet egy vagy több másik tagállam illetékes hatóságaival közösen is létre lehet hozni. A Bizottság technikai támogatást, tanácsadást és eszközöket biztosíthat az MI szabályozói tesztkörnyezetek létrehozásához és működtetéséhez.

Az első albekezdés szerinti kötelezettség egy meglévő tesztkörnyezetben való részvétellel is teljesíthető, amennyiben ez a részvétel azonos szintű nemzeti lefedettséget biztosít a részt vevő tagállamok számára.

(2) További MI szabályozói tesztkörnyezeteket is létre lehet hozni regionális vagy helyi szinten, vagy más tagállamok illetékes hatóságaival közösen.

(3) Az európai adatvédelmi biztos szintén létrehozhat MI szabályozói tesztkörnyezetet az uniós intézmények, szervek, hivatalok és ügynökségek számára, és e fejezettel összhangban gyakorolhatja az illetékes nemzeti hatóságok szerepét és feladatait.

(4) A tagállamok biztosítják, hogy az (1) és a (2) bekezdésben említett illetékes hatóságok elegendő forrást különítsenek el az e cikknek való tényleges és kellő időben történő megfelelés érdekében. Az illetékes nemzeti hatóságoknak adott esetben együtt kell működniük más érintett hatóságokkal, és lehetővé tehetik az MI-ökoszisztémán belüli más szereplők bevonását. Ez a cikk nem érinthet a nemzeti vagy uniós jog alapján létrehozott egyéb szabályozói tesztkörnyezeteket. A tagállamok megfelelő szintű együttműködést biztosítanak az említett egyéb szabályozói tesztkörnyezeteket felügyelő hatóságok és az illetékes nemzeti hatóságok között.

(5) Az (1) bekezdés értelmében létrehozott MI szabályozói tesztkörnyezeteknek olyan ellenőrzött környezetet kell biztosítaniuk, amely előmozdítja az innovációt, és korlátozott ideig elősegíti az innovatív MI-rendszerek fejlesztését, tesztelését és validálását azok forgalomba hozatala vagy üzembe helyezése előtt, a szolgáltatók vagy a leendő szolgáltatók és az illetékes hatóság közötti megállapodás szerinti, a tesztkörnyezetre vonatkozó egyedi terv alapján. Az ilyen tesztkörnyezetek kiterjedhetnek az azokban felügyelt, valós körülmények közötti tesztelésre.

(6) Az illetékes hatóságoknak adott esetben iránymutatást, felügyeletet és támogatást kell biztosítaniuk az MI szabályozói tesztkörnyezeten belül a kockázatok azonosítása céljából, különösen az alapvető jogok, az egészség és a biztonság, a tesztelési és kockázatcsökkentő intézkedések, valamint azok hatékonysága tekintetében az e rendeletben és adott esetben a tesztkörnyezetben felügyelt egyéb uniós és nemzeti jogszabályokban foglalt kötelezettségekkel és követelményekkel kapcsolatban.

(7) Az illetékes hatóságoknak iránymutatást kell nyújtaniuk az MI szabályozói tesztkörnyezetben részt vevő szolgáltatók és leendő szolgáltatók számára a szabályozási elvárásokról és az e rendeletben meghatározott követelmények és kötelezettségek teljesítésének módjáról.

Az MI-rendszer szolgáltatójának vagy leendő szolgáltatójának kérésére az illetékes hatóságnak írásbeli bizonyítékot kell szolgáltatnia a tesztkörnyezetben sikeresen elvégzett tevékenységekről. Az illetékes hatóságnak kilépési jelentést is kell készítenie, amelyben részletezi a tesztkörnyezetben elvégzett tevékenységeket, valamint a kapcsolódó eredményeket és tanulási eredményeket. A szolgáltatók az ilyen dokumentációt felhasználhatják arra, hogy a megfelelőségértékelési eljárás vagy a vonatkozó piacfelügyeleti tevékenységek során igazolják az e rendeletnek való megfelelésüket. E tekintetben a piacfelügyeleti hatóságoknak és a bejelentett szervezeteknek pozitívan figyelembe kell venniük az illetékes nemzeti hatóság által benyújtott kilépési jelentéseket és írásbeli bizonyítékokat a megfelelőségértékelési eljárások észszerű mértékű felgyorsítása érdekében.

(8) A Bizottság és a Testület – a 78. cikkben foglalt titoktartási rendelkezésekre is figyelemmel, és a szolgáltató vagy a leendő szolgáltató egyetértésével – jogosult hozzáférni a kilépési jelentésekhez, és azokat adott esetben figyelembe veszi az e rendelet szerinti feladatai ellátása során. Ha mind a szolgáltató vagy a leendő szolgáltató, mind az illetékes nemzeti hatóság ehhez kifejezetten hozzájárul, a kilépési jelentés nyilvánosan hozzáférhetővé tehető az e cikkben említett egységes információs platformon keresztül.

(9) Az MI szabályozói tesztkörnyezetek létrehozásának azt kell céloznia, hogy hozzájáruljon a következő célkitűzésekhez:

a)

a jogbiztonság javítása az e rendeletnek vagy adott esetben más alkalmazandó uniós és nemzeti jognak való megfelelés elérése érdekében;

b)

az MI szabályozói tesztkörnyezetben részt vevő hatóságokkal való együttműködés révén hozzájárulás a legjobb gyakorlatok megosztásához;

c)

az innováció és a versenyképesség ösztönzése, valamint egy MI-ökoszisztéma kialakításának megkönnyítése;

d)

hozzájárulás a szabályozó hatóságok általi, tényeken alapuló tanuláshoz;

e)

az MI-rendszerek uniós piacra jutásának megkönnyítése és felgyorsítása, különösen akkor, ha azokat kkv-k, köztük induló innovatív vállalkozások biztosítják.

(10) Az illetékes nemzeti hatóságok biztosítják, hogy amennyiben az innovatív MI-rendszerek személyes adatok kezelésével járnak, vagy egyébként az adatokhoz való hozzáférést biztosító vagy támogató más nemzeti hatóságok vagy illetékes hatóságok felügyeleti hatáskörébe tartoznak, a nemzeti adatvédelmi hatóságok és az említett más nemzeti vagy illetékes hatóságok részt vegyenek az MI szabályozói tesztkörnyezet működtetésében, továbbá feladataiknak és hatásköreiknek megfelelően részt vegyenek e szempontok felügyeletében.

(11) Az MI szabályozói tesztkörnyezetek nem érinthetik a tesztkörnyezeteket – többek között regionális vagy helyi szinten – felügyelő illetékes hatóságok felügyeleti és korrekciós hatásköreit. Amennyiben az ilyen MI-rendszerek fejlesztése és tesztelése során az egészséget és a biztonságot, valamint az alapvető jogokat érintő jelentős kockázatok merülnek fel, azokat megfelelően csökkenteni kell. Az illetékes nemzeti hatóságoknak hatáskörrel kell rendelkezniük arra, hogy ideiglenesen vagy véglegesen felfüggesszék a tesztelési folyamatot vagy a tesztkörnyezetben való részvételt, ha nincs lehetőség hatékony kockázatcsökkentésre, és erről a döntésről tájékoztatniuk kell az MI-hivatalt. Az illetékes nemzeti hatóságoknak a vonatkozó jogszabályok keretein belül, mérlegelési jogkörükkel élve kell gyakorolniuk felügyeleti hatásköreiket, amikor jogi rendelkezéseket hajtanak végre egy konkrét MI szabályozóitesztkörnyezet-projekt vonatkozásában azzal a céllal, hogy támogassák az MI-vel kapcsolatos innovációt az Unióban.

(12) Az MI szabályozói tesztkörnyezetben részt vevő szolgáltatóknak és leendő szolgáltatóknak a felelősségvállalásra alkalmazandó uniós és nemzeti jogszabályok értelmében továbbra is felelősséggel kell tartozniuk a tesztkörnyezetben való kísérletezés következtében harmadik feleknek okozott minden kárért. Azonban feltéve, hogy a leendő szolgáltatók tiszteletben tartják az egyedi tervet és részvételük feltételeit, és jóhiszeműen követik az illetékes nemzeti hatóság által adott iránymutatást, a hatóságok nem szabhatnak ki közigazgatási bírságot e rendelet megsértése miatt. Amennyiben az egyéb uniós és nemzeti jogszabályokért felelős más illetékes hatóságok aktívan részt vettek az MI-rendszernek a tesztkörnyezetben történő felügyeletében, és iránymutatást nyújtottak a megfelelésre vonatkozóan, az említett jogszabály tekintetében nem szabható ki közigazgatási bírság.

(13) Az MI szabályozói tesztkörnyezeteket úgy kell megtervezni és kialakítani, hogy azok adott esetben megkönnyítsék az illetékes nemzeti hatóságok közötti, határokon átnyúló együttműködést.

(14) Az illetékes nemzeti hatóságoknak össze kell hangolniuk tevékenységeiket és együtt kell működniük a Testület keretében.

(15) Az illetékes nemzeti hatóságoknak tájékoztatniuk kell az MI-hivatalt és a Testületet a tesztkörnyezet létrehozásáról, és támogatást és iránymutatást kérhetnek azoktól. Az MI-hivatalnak nyilvánosan hozzáférhetővé kell tennie és naprakészen kell tartania a tervezett és meglévő tesztkörnyezetek jegyzékét annak érdekében, hogy ösztönözze az MI szabályozói tesztkörnyezetekben való nagyobb számú interakciót és a határokon átnyúló együttműködést.

(16) Az illetékes nemzeti hatóságoknak éves jelentéseket kell benyújtaniuk az MI-hivatal és a Testület részére az MI szabályozói tesztkörnyezet létrehozását követő egy év elteltétől kezdődően, majd azt követően annak megszüntetéséig évente, valamint zárójelentést kell benyújtaniuk. Az említett jelentésekben tájékoztatást kell nyújtani az említett tesztkörnyezetek megvalósításának előrehaladásáról és eredményeiről, beleértve a legjobb gyakorlatokat, a súlyos váratlan eseményeket, a levont tanulságokat és a kialakításukra vonatkozó ajánlásokat, valamint adott esetben e rendelet – ideértve a kapcsolódó felhatalmazáson alapuló és végrehajtási jogi aktusokat – alkalmazásáról és esetleges módosításáról, továbbá a tesztkörnyezetben az illetékes hatóságok által felügyelt egyéb uniós jogszabályok alkalmazásáról. Az illetékes nemzeti hatóságoknak ezeket az éves jelentéseket vagy azok kivonatait online elérhetővé kell tenniük a nyilvánosság számára. A Bizottság az e rendelet szerinti feladatai ellátása során adott esetben figyelembe veszi az éves jelentéseket.

(17) A Bizottság egységes és célzott interfészt dolgoz ki, amely tartalmazza az MI szabályozói tesztkörnyezetekkel kapcsolatos valamennyi releváns információt, hogy lehetővé tegye az érdekelt felek számára, hogy interakciót folytassanak az MI szabályozói tesztkörnyezetekkel, és kérdéseket intézzenek az illetékes hatóságokhoz, valamint hogy a 62. cikk (1) bekezdésének c) pontjával összhangban nem kötelező erejű iránymutatást kérjenek az MI-technológiákon alapuló innovatív termékek, szolgáltatások és üzleti modellek megfelelőségéről. A Bizottság adott esetben proaktív koordinációt folytat az illetékes nemzeti hatóságokkal is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '1',
  '(1) A tagállamok biztosítják, hogy illetékes hatóságaik nemzeti szinten legalább egy MI szabályozói tesztkörnyezetet hozzanak létre, amelynek 2026. augusztus 2-re működőképesnek kell lennie. Az említett tesztkörnyezetet egy vagy több másik tagállam illetékes hatóságaival közösen is létre lehet hozni. A Bizottság technikai támogatást, tanácsadást és eszközöket biztosíthat az MI szabályozói tesztkörnyezetek létrehozásához és működtetéséhez.

Az első albekezdés szerinti kötelezettség egy meglévő tesztkörnyezetben való részvétellel is teljesíthető, amennyiben ez a részvétel azonos szintű nemzeti lefedettséget biztosít a részt vevő tagállamok számára.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '2',
  '(2) További MI szabályozói tesztkörnyezeteket is létre lehet hozni regionális vagy helyi szinten, vagy más tagállamok illetékes hatóságaival közösen.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '3',
  '(3) Az európai adatvédelmi biztos szintén létrehozhat MI szabályozói tesztkörnyezetet az uniós intézmények, szervek, hivatalok és ügynökségek számára, és e fejezettel összhangban gyakorolhatja az illetékes nemzeti hatóságok szerepét és feladatait.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '4',
  '(4) A tagállamok biztosítják, hogy az (1) és a (2) bekezdésben említett illetékes hatóságok elegendő forrást különítsenek el az e cikknek való tényleges és kellő időben történő megfelelés érdekében. Az illetékes nemzeti hatóságoknak adott esetben együtt kell működniük más érintett hatóságokkal, és lehetővé tehetik az MI-ökoszisztémán belüli más szereplők bevonását. Ez a cikk nem érinthet a nemzeti vagy uniós jog alapján létrehozott egyéb szabályozói tesztkörnyezeteket. A tagállamok megfelelő szintű együttműködést biztosítanak az említett egyéb szabályozói tesztkörnyezeteket felügyelő hatóságok és az illetékes nemzeti hatóságok között.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '5',
  '(5) Az (1) bekezdés értelmében létrehozott MI szabályozói tesztkörnyezeteknek olyan ellenőrzött környezetet kell biztosítaniuk, amely előmozdítja az innovációt, és korlátozott ideig elősegíti az innovatív MI-rendszerek fejlesztését, tesztelését és validálását azok forgalomba hozatala vagy üzembe helyezése előtt, a szolgáltatók vagy a leendő szolgáltatók és az illetékes hatóság közötti megállapodás szerinti, a tesztkörnyezetre vonatkozó egyedi terv alapján. Az ilyen tesztkörnyezetek kiterjedhetnek az azokban felügyelt, valós körülmények közötti tesztelésre.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '6',
  '(6) Az illetékes hatóságoknak adott esetben iránymutatást, felügyeletet és támogatást kell biztosítaniuk az MI szabályozói tesztkörnyezeten belül a kockázatok azonosítása céljából, különösen az alapvető jogok, az egészség és a biztonság, a tesztelési és kockázatcsökkentő intézkedések, valamint azok hatékonysága tekintetében az e rendeletben és adott esetben a tesztkörnyezetben felügyelt egyéb uniós és nemzeti jogszabályokban foglalt kötelezettségekkel és követelményekkel kapcsolatban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '7',
  '(7) Az illetékes hatóságoknak iránymutatást kell nyújtaniuk az MI szabályozói tesztkörnyezetben részt vevő szolgáltatók és leendő szolgáltatók számára a szabályozási elvárásokról és az e rendeletben meghatározott követelmények és kötelezettségek teljesítésének módjáról.

Az MI-rendszer szolgáltatójának vagy leendő szolgáltatójának kérésére az illetékes hatóságnak írásbeli bizonyítékot kell szolgáltatnia a tesztkörnyezetben sikeresen elvégzett tevékenységekről. Az illetékes hatóságnak kilépési jelentést is kell készítenie, amelyben részletezi a tesztkörnyezetben elvégzett tevékenységeket, valamint a kapcsolódó eredményeket és tanulási eredményeket. A szolgáltatók az ilyen dokumentációt felhasználhatják arra, hogy a megfelelőségértékelési eljárás vagy a vonatkozó piacfelügyeleti tevékenységek során igazolják az e rendeletnek való megfelelésüket. E tekintetben a piacfelügyeleti hatóságoknak és a bejelentett szervezeteknek pozitívan figyelembe kell venniük az illetékes nemzeti hatóság által benyújtott kilépési jelentéseket és írásbeli bizonyítékokat a megfelelőségértékelési eljárások észszerű mértékű felgyorsítása érdekében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '8',
  '(8) A Bizottság és a Testület – a 78. cikkben foglalt titoktartási rendelkezésekre is figyelemmel, és a szolgáltató vagy a leendő szolgáltató egyetértésével – jogosult hozzáférni a kilépési jelentésekhez, és azokat adott esetben figyelembe veszi az e rendelet szerinti feladatai ellátása során. Ha mind a szolgáltató vagy a leendő szolgáltató, mind az illetékes nemzeti hatóság ehhez kifejezetten hozzájárul, a kilépési jelentés nyilvánosan hozzáférhetővé tehető az e cikkben említett egységes információs platformon keresztül.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '9',
  '(9) Az MI szabályozói tesztkörnyezetek létrehozásának azt kell céloznia, hogy hozzájáruljon a következő célkitűzésekhez:

a)

a jogbiztonság javítása az e rendeletnek vagy adott esetben más alkalmazandó uniós és nemzeti jognak való megfelelés elérése érdekében;

b)

az MI szabályozói tesztkörnyezetben részt vevő hatóságokkal való együttműködés révén hozzájárulás a legjobb gyakorlatok megosztásához;

c)

az innováció és a versenyképesség ösztönzése, valamint egy MI-ökoszisztéma kialakításának megkönnyítése;

d)

hozzájárulás a szabályozó hatóságok általi, tényeken alapuló tanuláshoz;

e)

az MI-rendszerek uniós piacra jutásának megkönnyítése és felgyorsítása, különösen akkor, ha azokat kkv-k, köztük induló innovatív vállalkozások biztosítják.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '9(a)',
  'a) a jogbiztonság javítása az e rendeletnek vagy adott esetben más alkalmazandó uniós és nemzeti jognak való megfelelés elérése érdekében;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '9(b)',
  'b) az MI szabályozói tesztkörnyezetben részt vevő hatóságokkal való együttműködés révén hozzájárulás a legjobb gyakorlatok megosztásához;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '9(c)',
  'c) az innováció és a versenyképesség ösztönzése, valamint egy MI-ökoszisztéma kialakításának megkönnyítése;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '9(d)',
  'd) hozzájárulás a szabályozó hatóságok általi, tényeken alapuló tanuláshoz;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '9(e)',
  'e) az MI-rendszerek uniós piacra jutásának megkönnyítése és felgyorsítása, különösen akkor, ha azokat kkv-k, köztük induló innovatív vállalkozások biztosítják.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '10',
  '(10) Az illetékes nemzeti hatóságok biztosítják, hogy amennyiben az innovatív MI-rendszerek személyes adatok kezelésével járnak, vagy egyébként az adatokhoz való hozzáférést biztosító vagy támogató más nemzeti hatóságok vagy illetékes hatóságok felügyeleti hatáskörébe tartoznak, a nemzeti adatvédelmi hatóságok és az említett más nemzeti vagy illetékes hatóságok részt vegyenek az MI szabályozói tesztkörnyezet működtetésében, továbbá feladataiknak és hatásköreiknek megfelelően részt vegyenek e szempontok felügyeletében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '11',
  '(11) Az MI szabályozói tesztkörnyezetek nem érinthetik a tesztkörnyezeteket – többek között regionális vagy helyi szinten – felügyelő illetékes hatóságok felügyeleti és korrekciós hatásköreit. Amennyiben az ilyen MI-rendszerek fejlesztése és tesztelése során az egészséget és a biztonságot, valamint az alapvető jogokat érintő jelentős kockázatok merülnek fel, azokat megfelelően csökkenteni kell. Az illetékes nemzeti hatóságoknak hatáskörrel kell rendelkezniük arra, hogy ideiglenesen vagy véglegesen felfüggesszék a tesztelési folyamatot vagy a tesztkörnyezetben való részvételt, ha nincs lehetőség hatékony kockázatcsökkentésre, és erről a döntésről tájékoztatniuk kell az MI-hivatalt. Az illetékes nemzeti hatóságoknak a vonatkozó jogszabályok keretein belül, mérlegelési jogkörükkel élve kell gyakorolniuk felügyeleti hatásköreiket, amikor jogi rendelkezéseket hajtanak végre egy konkrét MI szabályozóitesztkörnyezet-projekt vonatkozásában azzal a céllal, hogy támogassák az MI-vel kapcsolatos innovációt az Unióban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '12',
  '(12) Az MI szabályozói tesztkörnyezetben részt vevő szolgáltatóknak és leendő szolgáltatóknak a felelősségvállalásra alkalmazandó uniós és nemzeti jogszabályok értelmében továbbra is felelősséggel kell tartozniuk a tesztkörnyezetben való kísérletezés következtében harmadik feleknek okozott minden kárért. Azonban feltéve, hogy a leendő szolgáltatók tiszteletben tartják az egyedi tervet és részvételük feltételeit, és jóhiszeműen követik az illetékes nemzeti hatóság által adott iránymutatást, a hatóságok nem szabhatnak ki közigazgatási bírságot e rendelet megsértése miatt. Amennyiben az egyéb uniós és nemzeti jogszabályokért felelős más illetékes hatóságok aktívan részt vettek az MI-rendszernek a tesztkörnyezetben történő felügyeletében, és iránymutatást nyújtottak a megfelelésre vonatkozóan, az említett jogszabály tekintetében nem szabható ki közigazgatási bírság.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '13',
  '(13) Az MI szabályozói tesztkörnyezeteket úgy kell megtervezni és kialakítani, hogy azok adott esetben megkönnyítsék az illetékes nemzeti hatóságok közötti, határokon átnyúló együttműködést.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '14',
  '(14) Az illetékes nemzeti hatóságoknak össze kell hangolniuk tevékenységeiket és együtt kell működniük a Testület keretében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '15',
  '(15) Az illetékes nemzeti hatóságoknak tájékoztatniuk kell az MI-hivatalt és a Testületet a tesztkörnyezet létrehozásáról, és támogatást és iránymutatást kérhetnek azoktól. Az MI-hivatalnak nyilvánosan hozzáférhetővé kell tennie és naprakészen kell tartania a tervezett és meglévő tesztkörnyezetek jegyzékét annak érdekében, hogy ösztönözze az MI szabályozói tesztkörnyezetekben való nagyobb számú interakciót és a határokon átnyúló együttműködést.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '16',
  '(16) Az illetékes nemzeti hatóságoknak éves jelentéseket kell benyújtaniuk az MI-hivatal és a Testület részére az MI szabályozói tesztkörnyezet létrehozását követő egy év elteltétől kezdődően, majd azt követően annak megszüntetéséig évente, valamint zárójelentést kell benyújtaniuk. Az említett jelentésekben tájékoztatást kell nyújtani az említett tesztkörnyezetek megvalósításának előrehaladásáról és eredményeiről, beleértve a legjobb gyakorlatokat, a súlyos váratlan eseményeket, a levont tanulságokat és a kialakításukra vonatkozó ajánlásokat, valamint adott esetben e rendelet – ideértve a kapcsolódó felhatalmazáson alapuló és végrehajtási jogi aktusokat – alkalmazásáról és esetleges módosításáról, továbbá a tesztkörnyezetben az illetékes hatóságok által felügyelt egyéb uniós jogszabályok alkalmazásáról. Az illetékes nemzeti hatóságoknak ezeket az éves jelentéseket vagy azok kivonatait online elérhetővé kell tenniük a nyilvánosság számára. A Bizottság az e rendelet szerinti feladatai ellátása során adott esetben figyelembe veszi az éves jelentéseket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '57',
  '17',
  '(17) A Bizottság egységes és célzott interfészt dolgoz ki, amely tartalmazza az MI szabályozói tesztkörnyezetekkel kapcsolatos valamennyi releváns információt, hogy lehetővé tegye az érdekelt felek számára, hogy interakciót folytassanak az MI szabályozói tesztkörnyezetekkel, és kérdéseket intézzenek az illetékes hatóságokhoz, valamint hogy a 62. cikk (1) bekezdésének c) pontjával összhangban nem kötelező erejű iránymutatást kérjenek az MI-technológiákon alapuló innovatív termékek, szolgáltatások és üzleti modellek megfelelőségéről. A Bizottság adott esetben proaktív koordinációt folytat az illetékes nemzeti hatóságokkal is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_57'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  null,
  'Az MI szabályozói tesztkörnyezetekre vonatkozó részletes szabályok és e tesztkörnyezetek működése
(1) Az Unión belüli széttagoltság elkerülése érdekében a Bizottság végrehajtási jogi aktusokat fogad el, amelyekben meghatározza az MI szabályozói tesztkörnyezetek létrehozására, fejlesztésére, megvalósítására, működtetésére és felügyeletére vonatkozó részletes szabályokat. E végrehajtási jogi aktusoknak közös elveket kell tartalmazniuk a következő kérdésekre vonatkozóan:

a)

az MI szabályozói tesztkörnyezetben való részvételre való jogosultság és kiválasztás kritériumai;

b)

az MI szabályozói tesztkörnyezet alkalmazására, az abban való részvételre, annak nyomon követésére, az abból való kilépésre és a megszüntetésére vonatkozó eljárások, beleértve a tesztkörnyezetre vonatkozó tervet és a kilépési jelentést is;

c)

a résztvevőkre alkalmazandó feltételek.

E végrehajtási jogi aktusokat a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.

(2) Az (1) bekezdésben említett végrehajtási jogi aktusoknak biztosítaniuk kell, hogy:

a)

az MI szabályozói tesztkörnyezetek nyitva álljanak bármely olyan MI-rendszer-szolgáltató vagy leendő MI-rendszer-szolgáltató előtt, amely megfelel a támogathatósági és kiválasztási kritériumoknak, amelyeknek átláthatónak és méltányosnak kell lenniük, valamint hogy az illetékes nemzeti hatóságok a kérelem benyújtásától számított három hónapon belül tájékoztassák a kérelmezőket döntésükről;

b)

a szabályozói tesztkörnyezetek széles körű és egyenlő hozzáférést tegyenek lehetővé, és lépést tartsanak a részvételre irányuló kereslettel; a szolgáltatók és a leendő szolgáltatók az alkalmazókkal és más releváns harmadik felekkel partnerségben is benyújthatnak kérelmeket;

c)

az MI szabályozói tesztkörnyezetekre vonatkozó részletes szabályok és feltételek a lehető legnagyobb mértékben támogassák az illetékes nemzeti hatóságok számára az MI szabályozói tesztkörnyezeteik létrehozásához és működtetéséhez szükséges rugalmasságot;

d)

az MI szabályozói tesztkörnyezetekhez való hozzáférés ingyenes legyen a kkv-k – köztük az induló innovatív vállalkozások – számára, azon rendkívüli költségek sérelme nélkül, amelyeket az illetékes nemzeti hatóságok méltányos és arányos módon behajthatnak;

e)

az MI szabályozói tesztkörnyezetek tanulási eredményei révén könnyítsék meg a szolgáltatók és a leendő szolgáltatók számára az e rendelet szerinti megfelelőségértékelési kötelezettségeknek való megfelelést és a 95. cikkben említett magatartási kódexek önkéntes alkalmazását;

f)

az MI szabályozói tesztkörnyezetek megkönnyítsék más érintett szereplők – például a bejelentett szervezetek és a szabványügyi szervezetek, a kkv-k, ideértve az induló innovatív vállalkozásokat is, a vállalkozások, az innovátorok, a tesztelési és kísérleti létesítmények, a kutatási és kísérleti laboratóriumok és a digitális innovációs központok, a kiválósági központok, az egyéni kutatók – bevonását az MI-ökoszisztémán belül a köz- és a magánszektorral való együttműködés lehetővé tétele és megkönnyítése érdekében;

g)

a kérelmezésre, kiválasztásra, részvételre és az MI szabályozói tesztkörnyezetből való kilépésre vonatkozó eljárások, folyamatok és adminisztratív követelmények egyszerűek, könnyen érthetők és egyértelműen kommunikáltak legyenek a korlátozott jogi és adminisztratív kapacitásokkal rendelkező kkv-k – köztük az induló innovatív vállalkozások – részvételének megkönnyítése érdekében, és az egész Unióban észszerűsítettek legyenek, hogy elkerülhető legyen a széttagoltság, és hogy a valamely tagállam vagy az európai adatvédelmi biztos által létrehozott MI szabályozói tesztkörnyezetben való részvétel kölcsönösen és egységesen elismert legyen, és Unió-szerte azonos joghatással járjon;

h)

az MI szabályozói tesztkörnyezetben való részvétel olyan időtartamra korlátozódjon, amely megfelel a projekt összetettségének és nagyságrendjének, és amelyet az illetékes nemzeti hatóság meghosszabbíthat;

i)

az MI szabályozói tesztkörnyezetek megkönnyítsék az MI-rendszerek azon dimenziói – így például a pontosság, a megbízhatóság és a kiberbiztonság – tesztelésére, összehasonlító teljesítményértékelésére, értékelésére és magyarázatára szolgáló eszközök és infrastruktúra fejlesztését, amelyek a szabályozó hatóságok általi tanulás szempontjából relevánsak, valamint az alapvető jogokat és a társadalom egészét érintő kockázatok enyhítését célzó intézkedéseket.

(3) Az MI szabályozói tesztkörnyezetekben a leendő szolgáltatókat, különösen a kkv-kat és az induló innovatív vállalkozásokat, adott esetben a telepítést megelőző szolgáltatásokhoz – mint például az e rendelet végrehajtásával kapcsolatos iránymutatás –, más értéknövelő szolgáltatásokhoz – mint például a szabványosítási dokumentumokkal és a tanúsítással kapcsolatos segítségnyújtás –, tesztelési és kísérleti létesítményekhez, az európai digitális innovációs központokhoz és a kiválósági központokhoz kell irányítani.

(4) Amennyiben az illetékes nemzeti hatóságok az e cikk alapján létrehozandó MI szabályozói tesztkörnyezet keretrendszerében felügyelt, valós körülmények közötti tesztelés engedélyezését mérlegelik, kifejezetten meg kell állapodniuk a résztvevőkkel az ilyen tesztelés feltételeiről és különösen a megfelelő biztosítékokról, az alapvető jogok, az egészség és a biztonság védelme céljából. Adott esetben együtt kell működniük más illetékes nemzeti hatóságokkal annak érdekében, hogy Unió-szerte biztosítsák a következetes gyakorlatokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '1',
  '(1) Az Unión belüli széttagoltság elkerülése érdekében a Bizottság végrehajtási jogi aktusokat fogad el, amelyekben meghatározza az MI szabályozói tesztkörnyezetek létrehozására, fejlesztésére, megvalósítására, működtetésére és felügyeletére vonatkozó részletes szabályokat. E végrehajtási jogi aktusoknak közös elveket kell tartalmazniuk a következő kérdésekre vonatkozóan:

a)

az MI szabályozói tesztkörnyezetben való részvételre való jogosultság és kiválasztás kritériumai;

b)

az MI szabályozói tesztkörnyezet alkalmazására, az abban való részvételre, annak nyomon követésére, az abból való kilépésre és a megszüntetésére vonatkozó eljárások, beleértve a tesztkörnyezetre vonatkozó tervet és a kilépési jelentést is;

c)

a résztvevőkre alkalmazandó feltételek.

E végrehajtási jogi aktusokat a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '1(a)',
  'a) az MI szabályozói tesztkörnyezetben való részvételre való jogosultság és kiválasztás kritériumai;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '1(b)',
  'b) az MI szabályozói tesztkörnyezet alkalmazására, az abban való részvételre, annak nyomon követésére, az abból való kilépésre és a megszüntetésére vonatkozó eljárások, beleértve a tesztkörnyezetre vonatkozó tervet és a kilépési jelentést is;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '1(c)',
  'c) a résztvevőkre alkalmazandó feltételek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '2',
  '(2) Az (1) bekezdésben említett végrehajtási jogi aktusoknak biztosítaniuk kell, hogy:

a)

az MI szabályozói tesztkörnyezetek nyitva álljanak bármely olyan MI-rendszer-szolgáltató vagy leendő MI-rendszer-szolgáltató előtt, amely megfelel a támogathatósági és kiválasztási kritériumoknak, amelyeknek átláthatónak és méltányosnak kell lenniük, valamint hogy az illetékes nemzeti hatóságok a kérelem benyújtásától számított három hónapon belül tájékoztassák a kérelmezőket döntésükről;

b)

a szabályozói tesztkörnyezetek széles körű és egyenlő hozzáférést tegyenek lehetővé, és lépést tartsanak a részvételre irányuló kereslettel; a szolgáltatók és a leendő szolgáltatók az alkalmazókkal és más releváns harmadik felekkel partnerségben is benyújthatnak kérelmeket;

c)

az MI szabályozói tesztkörnyezetekre vonatkozó részletes szabályok és feltételek a lehető legnagyobb mértékben támogassák az illetékes nemzeti hatóságok számára az MI szabályozói tesztkörnyezeteik létrehozásához és működtetéséhez szükséges rugalmasságot;

d)

az MI szabályozói tesztkörnyezetekhez való hozzáférés ingyenes legyen a kkv-k – köztük az induló innovatív vállalkozások – számára, azon rendkívüli költségek sérelme nélkül, amelyeket az illetékes nemzeti hatóságok méltányos és arányos módon behajthatnak;

e)

az MI szabályozói tesztkörnyezetek tanulási eredményei révén könnyítsék meg a szolgáltatók és a leendő szolgáltatók számára az e rendelet szerinti megfelelőségértékelési kötelezettségeknek való megfelelést és a 95. cikkben említett magatartási kódexek önkéntes alkalmazását;

f)

az MI szabályozói tesztkörnyezetek megkönnyítsék más érintett szereplők – például a bejelentett szervezetek és a szabványügyi szervezetek, a kkv-k, ideértve az induló innovatív vállalkozásokat is, a vállalkozások, az innovátorok, a tesztelési és kísérleti létesítmények, a kutatási és kísérleti laboratóriumok és a digitális innovációs központok, a kiválósági központok, az egyéni kutatók – bevonását az MI-ökoszisztémán belül a köz- és a magánszektorral való együttműködés lehetővé tétele és megkönnyítése érdekében;

g)

a kérelmezésre, kiválasztásra, részvételre és az MI szabályozói tesztkörnyezetből való kilépésre vonatkozó eljárások, folyamatok és adminisztratív követelmények egyszerűek, könnyen érthetők és egyértelműen kommunikáltak legyenek a korlátozott jogi és adminisztratív kapacitásokkal rendelkező kkv-k – köztük az induló innovatív vállalkozások – részvételének megkönnyítése érdekében, és az egész Unióban észszerűsítettek legyenek, hogy elkerülhető legyen a széttagoltság, és hogy a valamely tagállam vagy az európai adatvédelmi biztos által létrehozott MI szabályozói tesztkörnyezetben való részvétel kölcsönösen és egységesen elismert legyen, és Unió-szerte azonos joghatással járjon;

h)

az MI szabályozói tesztkörnyezetben való részvétel olyan időtartamra korlátozódjon, amely megfelel a projekt összetettségének és nagyságrendjének, és amelyet az illetékes nemzeti hatóság meghosszabbíthat;

i)

az MI szabályozói tesztkörnyezetek megkönnyítsék az MI-rendszerek azon dimenziói – így például a pontosság, a megbízhatóság és a kiberbiztonság – tesztelésére, összehasonlító teljesítményértékelésére, értékelésére és magyarázatára szolgáló eszközök és infrastruktúra fejlesztését, amelyek a szabályozó hatóságok általi tanulás szempontjából relevánsak, valamint az alapvető jogokat és a társadalom egészét érintő kockázatok enyhítését célzó intézkedéseket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '2(a)',
  'a) az MI szabályozói tesztkörnyezetek nyitva álljanak bármely olyan MI-rendszer-szolgáltató vagy leendő MI-rendszer-szolgáltató előtt, amely megfelel a támogathatósági és kiválasztási kritériumoknak, amelyeknek átláthatónak és méltányosnak kell lenniük, valamint hogy az illetékes nemzeti hatóságok a kérelem benyújtásától számított három hónapon belül tájékoztassák a kérelmezőket döntésükről;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '2(b)',
  'b) a szabályozói tesztkörnyezetek széles körű és egyenlő hozzáférést tegyenek lehetővé, és lépést tartsanak a részvételre irányuló kereslettel; a szolgáltatók és a leendő szolgáltatók az alkalmazókkal és más releváns harmadik felekkel partnerségben is benyújthatnak kérelmeket;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '2(c)',
  'c) az MI szabályozói tesztkörnyezetekre vonatkozó részletes szabályok és feltételek a lehető legnagyobb mértékben támogassák az illetékes nemzeti hatóságok számára az MI szabályozói tesztkörnyezeteik létrehozásához és működtetéséhez szükséges rugalmasságot;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '2(d)',
  'd) az MI szabályozói tesztkörnyezetekhez való hozzáférés ingyenes legyen a kkv-k – köztük az induló innovatív vállalkozások – számára, azon rendkívüli költségek sérelme nélkül, amelyeket az illetékes nemzeti hatóságok méltányos és arányos módon behajthatnak;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '2(e)',
  'e) az MI szabályozói tesztkörnyezetek tanulási eredményei révén könnyítsék meg a szolgáltatók és a leendő szolgáltatók számára az e rendelet szerinti megfelelőségértékelési kötelezettségeknek való megfelelést és a 95. cikkben említett magatartási kódexek önkéntes alkalmazását;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '2(f)',
  'f) az MI szabályozói tesztkörnyezetek megkönnyítsék más érintett szereplők – például a bejelentett szervezetek és a szabványügyi szervezetek, a kkv-k, ideértve az induló innovatív vállalkozásokat is, a vállalkozások, az innovátorok, a tesztelési és kísérleti létesítmények, a kutatási és kísérleti laboratóriumok és a digitális innovációs központok, a kiválósági központok, az egyéni kutatók – bevonását az MI-ökoszisztémán belül a köz- és a magánszektorral való együttműködés lehetővé tétele és megkönnyítése érdekében;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '2(g)',
  'g) a kérelmezésre, kiválasztásra, részvételre és az MI szabályozói tesztkörnyezetből való kilépésre vonatkozó eljárások, folyamatok és adminisztratív követelmények egyszerűek, könnyen érthetők és egyértelműen kommunikáltak legyenek a korlátozott jogi és adminisztratív kapacitásokkal rendelkező kkv-k – köztük az induló innovatív vállalkozások – részvételének megkönnyítése érdekében, és az egész Unióban észszerűsítettek legyenek, hogy elkerülhető legyen a széttagoltság, és hogy a valamely tagállam vagy az európai adatvédelmi biztos által létrehozott MI szabályozói tesztkörnyezetben való részvétel kölcsönösen és egységesen elismert legyen, és Unió-szerte azonos joghatással járjon;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '2(h)',
  'h) az MI szabályozói tesztkörnyezetben való részvétel olyan időtartamra korlátozódjon, amely megfelel a projekt összetettségének és nagyságrendjének, és amelyet az illetékes nemzeti hatóság meghosszabbíthat;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '2(i)',
  'i) az MI szabályozói tesztkörnyezetek megkönnyítsék az MI-rendszerek azon dimenziói – így például a pontosság, a megbízhatóság és a kiberbiztonság – tesztelésére, összehasonlító teljesítményértékelésére, értékelésére és magyarázatára szolgáló eszközök és infrastruktúra fejlesztését, amelyek a szabályozó hatóságok általi tanulás szempontjából relevánsak, valamint az alapvető jogokat és a társadalom egészét érintő kockázatok enyhítését célzó intézkedéseket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '3',
  '(3) Az MI szabályozói tesztkörnyezetekben a leendő szolgáltatókat, különösen a kkv-kat és az induló innovatív vállalkozásokat, adott esetben a telepítést megelőző szolgáltatásokhoz – mint például az e rendelet végrehajtásával kapcsolatos iránymutatás –, más értéknövelő szolgáltatásokhoz – mint például a szabványosítási dokumentumokkal és a tanúsítással kapcsolatos segítségnyújtás –, tesztelési és kísérleti létesítményekhez, az európai digitális innovációs központokhoz és a kiválósági központokhoz kell irányítani.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '58',
  '4',
  '(4) Amennyiben az illetékes nemzeti hatóságok az e cikk alapján létrehozandó MI szabályozói tesztkörnyezet keretrendszerében felügyelt, valós körülmények közötti tesztelés engedélyezését mérlegelik, kifejezetten meg kell állapodniuk a résztvevőkkel az ilyen tesztelés feltételeiről és különösen a megfelelő biztosítékokról, az alapvető jogok, az egészség és a biztonság védelme céljából. Adott esetben együtt kell működniük más illetékes nemzeti hatóságokkal annak érdekében, hogy Unió-szerte biztosítsák a következetes gyakorlatokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_58'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  null,
  'Személyes adatok további kezelése bizonyos közérdekű MI-rendszerek fejlesztése céljából az MI szabályozói tesztkörnyezetben
(1) Az MI szabályozói tesztkörnyezetben a más célból jogszerűen gyűjtött személyes adatokat kizárólag bizonyos MI-rendszereknek a tesztkörnyezetben való kifejlesztése, betanítása és tesztelése céljából, a következő feltételek mindegyikének teljesülése esetén lehet kezelni:

a)

az MI-rendszereket valamely hatóságnak vagy más természetes vagy jogi személynek a jelentős közérdek védelme érdekében és a következők közül egy vagy több területen kell kifejlesztenie:

i.

közbiztonság és népegészségügy, beleértve a betegségek kimutatását, diagnózisát, megelőzését, felügyeletét és kezelését, valamint az egészségügyi rendszerek javítását;

ii.

a környezet minőségének magas szintű védelme és javítása, a biológiai sokféleség védelme, a szennyezés elleni védelem, a zöld átállásra irányuló intézkedések, valamint az éghajlatváltozás mérséklése és az ahhoz való alkalmazkodás;

iii.

fenntartható energia;

iv.

a közlekedési rendszerek és a mobilitás, a kritikus infrastruktúrák és a hálózatok biztonsága és rezilienciája;

v.

a közigazgatás és a közszolgáltatások hatékonysága és minősége;

b)

a kezelt adatok a III. fejezet 2. szakaszában említett egy vagy több követelménynek való megfeleléshez szükségesek, amennyiben e követelmények ténylegesen nem teljesíthetők anonimizált, szintetikus vagy egyéb nem személyes adatok kezelésével;

c)

hatékony nyomonkövetési mechanizmusok állnak rendelkezésre annak megállapítására, hogy a tesztkörnyezettel kapcsolatos kísérletek során felmerülhetnek-e az érintettek jogait és szabadságát fenyegető jelentős kockázatok, az (EU) 2016/679 rendelet 35. cikkében és az (EU) 2018/1725 rendelet 39. cikkében említettek szerint, valamint hogy rendelkezésre állnak-e olyan reagálási mechanizmusok, amelyek e kockázatok azonnali enyhítésére és szükség esetén az adatkezelés leállítására szolgálnak;

d)

a tesztkörnyezettel összefüggésben kezelendő személyes adatok funkcionálisan különálló, elszigetelt és védett, a leendő szolgáltató ellenőrzése alatt álló adatkezelési környezetben vannak, és csak az arra jogosult személyek férnek hozzá ezekhez az adatokhoz;

e)

a szolgáltatók kizárólag az uniós adatvédelmi joggal összhangban jogosultak az eredetileg gyűjtött adatok további megosztására; a tesztkörnyezetben létrehozott személyes adatok nem oszthatók meg a tesztkörnyezeten kívül;

f)

a személyes adatoknak a tesztkörnyezettel összefüggésben végzett kezelése nem vezet az érintettekre vonatkozó intézkedésekhez vagy határozatokhoz, és nem érinti a személyes adatok védelméről szóló uniós jogban meghatározott jogaik alkalmazását sem;

g)

a tesztkörnyezettel összefüggésben kezelt személyes adatok megfelelő technikai és szervezeti intézkedések útján védelem alatt állnak, illetve törlésre kerülnek, miután a tesztkörnyezetben való részvétel véget ért, vagy a személyes adatok megőrzési időszaka lejárt;

h)

a tesztkörnyezettel összefüggésben végzett személyesadat-kezelés naplóit a tesztkörnyezetben való részvétel időtartama alatt megőrzik, kivéve, ha az uniós vagy nemzeti jog másképp rendelkezik;

i)

a folyamat teljes körű és részletes leírását, valamint az MI-rendszer betanításának, tesztelésének és validálásának indokolását a IV. mellékletben említett műszaki dokumentáció részeként, a tesztelés eredményeivel együtt megőrzik;

j)

a tesztkörnyezetben fejlesztett MI-projekt rövid összefoglalását, célkitűzéseit és várt eredményeit közzéteszik az illetékes hatóságok honlapján; ez a kötelezettség nem terjedhet ki a bűnüldöző, a határellenőrzési, a bevándorlási vagy a menekültügyi hatóságok tevékenységeivel kapcsolatos érzékeny operatív adatokra.

(2) Bűncselekmények megelőzése, nyomozása, felderítése, büntetőeljárás alá vonása vagy büntetőjogi szankciók végrehajtása – többek között a közbiztonságot fenyegető veszélyekkel szembeni védelem és azok megelőzése – céljából az MI szabályozói tesztkörnyezetekben a személyes adatok kezelését az adott uniós vagy nemzeti jog alapján és az (1) bekezdésben említettekkel azonos feltételek együttes teljesülése függvényében kell végezni, a bűnüldöző hatóságok ellenőrzése és felelőssége mellett.

(3) Az (1) bekezdés nem érinti azt az uniós vagy nemzeti jogot, amely kizárja a személyes adatoknak az adott jogban kifejezetten említett céloktól eltérő célokból történő kezelését, valamint az innovatív MI-rendszerek fejlesztéséhez, teszteléséhez vagy betanításához szükséges személyesadat-kezelés alapját meghatározó uniós vagy nemzeti jogot vagy bármely más jogalapot, megfelelve a személyes adatok védelmére vonatkozó uniós jognak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '1',
  '(1) Az MI szabályozói tesztkörnyezetben a más célból jogszerűen gyűjtött személyes adatokat kizárólag bizonyos MI-rendszereknek a tesztkörnyezetben való kifejlesztése, betanítása és tesztelése céljából, a következő feltételek mindegyikének teljesülése esetén lehet kezelni:

a)

az MI-rendszereket valamely hatóságnak vagy más természetes vagy jogi személynek a jelentős közérdek védelme érdekében és a következők közül egy vagy több területen kell kifejlesztenie:

i.

közbiztonság és népegészségügy, beleértve a betegségek kimutatását, diagnózisát, megelőzését, felügyeletét és kezelését, valamint az egészségügyi rendszerek javítását;

ii.

a környezet minőségének magas szintű védelme és javítása, a biológiai sokféleség védelme, a szennyezés elleni védelem, a zöld átállásra irányuló intézkedések, valamint az éghajlatváltozás mérséklése és az ahhoz való alkalmazkodás;

iii.

fenntartható energia;

iv.

a közlekedési rendszerek és a mobilitás, a kritikus infrastruktúrák és a hálózatok biztonsága és rezilienciája;

v.

a közigazgatás és a közszolgáltatások hatékonysága és minősége;

b)

a kezelt adatok a III. fejezet 2. szakaszában említett egy vagy több követelménynek való megfeleléshez szükségesek, amennyiben e követelmények ténylegesen nem teljesíthetők anonimizált, szintetikus vagy egyéb nem személyes adatok kezelésével;

c)

hatékony nyomonkövetési mechanizmusok állnak rendelkezésre annak megállapítására, hogy a tesztkörnyezettel kapcsolatos kísérletek során felmerülhetnek-e az érintettek jogait és szabadságát fenyegető jelentős kockázatok, az (EU) 2016/679 rendelet 35. cikkében és az (EU) 2018/1725 rendelet 39. cikkében említettek szerint, valamint hogy rendelkezésre állnak-e olyan reagálási mechanizmusok, amelyek e kockázatok azonnali enyhítésére és szükség esetén az adatkezelés leállítására szolgálnak;

d)

a tesztkörnyezettel összefüggésben kezelendő személyes adatok funkcionálisan különálló, elszigetelt és védett, a leendő szolgáltató ellenőrzése alatt álló adatkezelési környezetben vannak, és csak az arra jogosult személyek férnek hozzá ezekhez az adatokhoz;

e)

a szolgáltatók kizárólag az uniós adatvédelmi joggal összhangban jogosultak az eredetileg gyűjtött adatok további megosztására; a tesztkörnyezetben létrehozott személyes adatok nem oszthatók meg a tesztkörnyezeten kívül;

f)

a személyes adatoknak a tesztkörnyezettel összefüggésben végzett kezelése nem vezet az érintettekre vonatkozó intézkedésekhez vagy határozatokhoz, és nem érinti a személyes adatok védelméről szóló uniós jogban meghatározott jogaik alkalmazását sem;

g)

a tesztkörnyezettel összefüggésben kezelt személyes adatok megfelelő technikai és szervezeti intézkedések útján védelem alatt állnak, illetve törlésre kerülnek, miután a tesztkörnyezetben való részvétel véget ért, vagy a személyes adatok megőrzési időszaka lejárt;

h)

a tesztkörnyezettel összefüggésben végzett személyesadat-kezelés naplóit a tesztkörnyezetben való részvétel időtartama alatt megőrzik, kivéve, ha az uniós vagy nemzeti jog másképp rendelkezik;

i)

a folyamat teljes körű és részletes leírását, valamint az MI-rendszer betanításának, tesztelésének és validálásának indokolását a IV. mellékletben említett műszaki dokumentáció részeként, a tesztelés eredményeivel együtt megőrzik;

j)

a tesztkörnyezetben fejlesztett MI-projekt rövid összefoglalását, célkitűzéseit és várt eredményeit közzéteszik az illetékes hatóságok honlapján; ez a kötelezettség nem terjedhet ki a bűnüldöző, a határellenőrzési, a bevándorlási vagy a menekültügyi hatóságok tevékenységeivel kapcsolatos érzékeny operatív adatokra.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '1(a)',
  'a) az MI-rendszereket valamely hatóságnak vagy más természetes vagy jogi személynek a jelentős közérdek védelme érdekében és a következők közül egy vagy több területen kell kifejlesztenie:

i.

közbiztonság és népegészségügy, beleértve a betegségek kimutatását, diagnózisát, megelőzését, felügyeletét és kezelését, valamint az egészségügyi rendszerek javítását;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '1(b)',
  'b) a kezelt adatok a III. fejezet 2. szakaszában említett egy vagy több követelménynek való megfeleléshez szükségesek, amennyiben e követelmények ténylegesen nem teljesíthetők anonimizált, szintetikus vagy egyéb nem személyes adatok kezelésével;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '1(c)',
  'c) hatékony nyomonkövetési mechanizmusok állnak rendelkezésre annak megállapítására, hogy a tesztkörnyezettel kapcsolatos kísérletek során felmerülhetnek-e az érintettek jogait és szabadságát fenyegető jelentős kockázatok, az (EU) 2016/679 rendelet 35. cikkében és az (EU) 2018/1725 rendelet 39. cikkében említettek szerint, valamint hogy rendelkezésre állnak-e olyan reagálási mechanizmusok, amelyek e kockázatok azonnali enyhítésére és szükség esetén az adatkezelés leállítására szolgálnak;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '1(d)',
  'd) a tesztkörnyezettel összefüggésben kezelendő személyes adatok funkcionálisan különálló, elszigetelt és védett, a leendő szolgáltató ellenőrzése alatt álló adatkezelési környezetben vannak, és csak az arra jogosult személyek férnek hozzá ezekhez az adatokhoz;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '1(e)',
  'e) a szolgáltatók kizárólag az uniós adatvédelmi joggal összhangban jogosultak az eredetileg gyűjtött adatok további megosztására; a tesztkörnyezetben létrehozott személyes adatok nem oszthatók meg a tesztkörnyezeten kívül;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '1(f)',
  'f) a személyes adatoknak a tesztkörnyezettel összefüggésben végzett kezelése nem vezet az érintettekre vonatkozó intézkedésekhez vagy határozatokhoz, és nem érinti a személyes adatok védelméről szóló uniós jogban meghatározott jogaik alkalmazását sem;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '1(g)',
  'g) a tesztkörnyezettel összefüggésben kezelt személyes adatok megfelelő technikai és szervezeti intézkedések útján védelem alatt állnak, illetve törlésre kerülnek, miután a tesztkörnyezetben való részvétel véget ért, vagy a személyes adatok megőrzési időszaka lejárt;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '1(h)',
  'h) a tesztkörnyezettel összefüggésben végzett személyesadat-kezelés naplóit a tesztkörnyezetben való részvétel időtartama alatt megőrzik, kivéve, ha az uniós vagy nemzeti jog másképp rendelkezik;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '1(i)',
  'i) a folyamat teljes körű és részletes leírását, valamint az MI-rendszer betanításának, tesztelésének és validálásának indokolását a IV. mellékletben említett műszaki dokumentáció részeként, a tesztelés eredményeivel együtt megőrzik;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '1(j)',
  'j) a tesztkörnyezetben fejlesztett MI-projekt rövid összefoglalását, célkitűzéseit és várt eredményeit közzéteszik az illetékes hatóságok honlapján; ez a kötelezettség nem terjedhet ki a bűnüldöző, a határellenőrzési, a bevándorlási vagy a menekültügyi hatóságok tevékenységeivel kapcsolatos érzékeny operatív adatokra.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '2',
  '(2) Bűncselekmények megelőzése, nyomozása, felderítése, büntetőeljárás alá vonása vagy büntetőjogi szankciók végrehajtása – többek között a közbiztonságot fenyegető veszélyekkel szembeni védelem és azok megelőzése – céljából az MI szabályozói tesztkörnyezetekben a személyes adatok kezelését az adott uniós vagy nemzeti jog alapján és az (1) bekezdésben említettekkel azonos feltételek együttes teljesülése függvényében kell végezni, a bűnüldöző hatóságok ellenőrzése és felelőssége mellett.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '59',
  '3',
  '(3) Az (1) bekezdés nem érinti azt az uniós vagy nemzeti jogot, amely kizárja a személyes adatoknak az adott jogban kifejezetten említett céloktól eltérő célokból történő kezelését, valamint az innovatív MI-rendszerek fejlesztéséhez, teszteléséhez vagy betanításához szükséges személyesadat-kezelés alapját meghatározó uniós vagy nemzeti jogot vagy bármely más jogalapot, megfelelve a személyes adatok védelmére vonatkozó uniós jognak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_59'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  null,
  'Nagy kockázatú MI-rendszereknek az MI szabályozói tesztkörnyezeteken kívüli, valós körülmények közötti tesztelése
(1) A nagy kockázatú MI-rendszerek valós körülmények közötti, az MI szabályozói tesztkörnyezeteken kívül történő tesztelését a III. mellékletben felsorolt nagy kockázatú MI-rendszerek szolgáltatói vagy leendő szolgáltatói végezhetik e cikkel és az e cikkben említett, valós körülmények közötti tesztelésre vonatkozó tervvel összhangban, az 5. cikk szerinti tilalmak sérelme nélkül.

A Bizottság végrehajtási jogi aktusok révén határozza meg a valós körülmények közötti tesztelésre vonatkozó terv részletes elemeit. E végrehajtási jogi aktusokat a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.

E bekezdés nem érinti az I. mellékletben felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termékekhez kapcsolódó nagy kockázatú MI-rendszerek valós körülmények közötti tesztelésére vonatkozó uniós vagy nemzeti jogot.

(2) A szolgáltatók vagy a leendő szolgáltatók a III. mellékletben említett nagy kockázatú MI-rendszerek forgalomba hozatala vagy üzembe helyezése előtt saját maguk, vagy egy vagy több alkalmazóval vagy leendő alkalmazóval partnerségben bármikor elvégezhetik az MI-rendszer valós körülmények közötti tesztelését.

(3) A nagy kockázatú MI-rendszerek e cikk szerinti, valós körülmények közötti tesztelése nem sértheti az uniós vagy nemzeti jog által előírt etikai felülvizsgálatot.

(4) A szolgáltatók vagy a leendő szolgáltatók csak akkor végezhetnek valós körülmények közötti tesztelést, ha a következő feltételek mindegyike teljesül:

a)

a szolgáltató vagy a leendő szolgáltató elkészítette a valós körülmények közötti tesztelésre vonatkozó tervet, és azt benyújtotta azon tagállam piacfelügyeleti hatóságához, amelyben a valós körülmények közötti tesztelésre sor kell, hogy kerüljön;

b)

azon tagállam piacfelügyeleti hatósága, amelyben a valós körülmények közötti tesztelésre sor kell, hogy kerüljön, jóváhagyta a valós körülmények közötti tesztelést és a valós körülmények közötti tesztelésre vonatkozó tervet; amennyiben a piacfelügyeleti hatóság 30 napon belül nem ad választ, a valós körülmények közötti tesztelést és a valós körülmények közötti tesztelésre vonatkozó tervet jóváhagyottnak kell tekinteni; amennyiben a nemzeti jog nem rendelkezik a hallgatólagos jóváhagyásról, a valós körülmények közötti tesztelést továbbra is engedélyhez kell kötni;

c)

a szolgáltató vagy a leendő szolgáltató – a bűnüldözés, a migráció, a menekültügy és a határellenőrzés területén használt, a III. melléklet 1., 6. és 7. pontjában említett nagy kockázatú MI-rendszerek, valamint a III. melléklet 2. pontjában említett nagy kockázatú MI-rendszerek szolgáltatói vagy leendő szolgáltatói kivételével – a valós körülmények közötti tesztelést a 71. cikk (4) bekezdésével összhangban – egy Unió-szerte egységes, egyedi azonosító számmal és a IX. mellékletben meghatározott információkkal együtt – rögzítette; a bűnüldözés, a migráció, a menekültügy és a határellenőrzés területén használt, a III. melléklet 1., 6. és 7. pontjában említett nagy kockázatú MI-rendszerek szolgáltatója vagy leendő szolgáltatója a valós körülmények közötti tesztelést – a 49. cikk (4) bekezdésének d) pontjával összhangban – az uniós adatbázis biztonságos nem nyilvános részében rögzítette egy Unió-szerte egységes, egyedi azonosító számmal és az ott meghatározott információkkal együtt; a III. melléket 2. pontjában említett nagy kockázatú MI-rendszerek szolgáltatója vagy leendő szolgáltatója a valós körülmények közötti tesztelést – a 49. cikk (5) bekezdésével összhangban – rögzítette;

d)

a tesztelést valós körülmények között végző szolgáltató vagy leendő szolgáltató letelepedett az Unióban, vagy az Unióban letelepedett jogi képviselőt nevezett ki;

e)

a valós körülmények közötti tesztelés céljából gyűjtött és kezelt adatok csak akkor továbbíthatók harmadik országokba, ha az uniós jog szerinti megfelelő és alkalmazandó biztosítékok végrehajtásra kerülnek;

f)

a valós körülmények közötti tesztelés nem tart annál tovább, mint ami szükséges a céljai eléréséhez, de semmi esetre sem hosszabb hat hónapnál; ez az időszak további hat hónappal meghosszabbítható, feltéve, hogy a szolgáltató vagy a leendő szolgáltató előzetesen értesíti a piacfelügyeleti hatóságot, mellékelve annak magyarázatát, hogy miért van szükség a hosszabbításra;

g)

a valós körülmények közötti tesztelés azon alanyai, akik életkoruk vagy fogyatékosságuk miatt kiszolgáltatott csoportokhoz tartozó személyek, megfelelő védelemben részesülnek;

h)

amennyiben egy szolgáltató vagy a leendő szolgáltató a valós körülmények közötti tesztelést egy vagy több alkalmazóval vagy leendő alkalmazóval együttműködve szervezi meg, ez utóbbiakat tájékoztatták a tesztelés minden olyan vonatkozásáról, amely releváns a részvételükre vonatkozó döntésük szempontjából, és megkapták az MI-rendszer használatára vonatkozó, a 13. cikkben említett releváns utasításokat; a szolgáltatónak vagy a leendő szolgáltatónak és az alkalmazónak vagy a leendő alkalmazónak megállapodást kell kötniük, amelyben meghatározzák szerepüket és felelősségüket annak érdekében, hogy biztosítsák az e rendeletben, valamint más alkalmazandó uniós és nemzeti jogban a valós körülmények közötti tesztelésre vonatkozóan előírt rendelkezéseknek való megfelelést;

i)

a valós körülmények közötti tesztelés vizsgálati alanyai a 61. cikkel összhangban tájékoztatáson alapuló hozzájárulásukat adták, vagy bűnüldözés esetében, amennyiben a tájékoztatáson alapuló hozzájárulás megkérése megakadályozná az MI-rendszer tesztelését, maga a tesztelés és a valós körülmények közötti tesztelés eredménye nem gyakorolhat negatív hatást a tesztelés vizsgálati alanyaira, és a személyes adataikat a teszt elvégzése után törölni kell;

j)

a valós körülmények közötti tesztelést a szolgáltató vagy a leendő szolgáltató, valamint az alkalmazók és a leendő alkalmazók hatékonyan felügyelik olyan személyek révén, akik az adott területen megfelelően képzettek, és rendelkeznek a feladataik ellátásához szükséges kapacitással, képzettséggel és felhatalmazással;

k)

az MI-rendszer előrejelzéseit, ajánlásait és döntéseit ténylegesen vissza lehet fordítani és figyelmen kívül lehet hagyni.

(5) A valós körülmények közötti tesztelés alanyai vagy adott esetben azok jogszerűen kijelölt képviselői a tájékoztatáson alapuló hozzájárulásuk visszavonásával – minden hátrányos következmény nélkül és indokolási kötelezettség nélkül – bármikor elállhatnak a teszteléstől, és kérhetik személyes adataik azonnali és végleges törlését. A tájékoztatáson alapuló hozzájárulás visszavonása nem érinti a már elvégzett tevékenységeket.

(6) A 75. cikkel összhangban a tagállamok felruházzák piacfelügyeleti hatóságaikat azzal a hatáskörrel, hogy a szolgáltatókat és a leendő szolgáltatókat információszolgáltatásra kötelezzék, előre be nem jelentett távoli vagy helyszíni ellenőrzéseket végezzenek, valamint hogy ellenőrzéseket végezzenek a valós körülmények közötti tesztelés lebonyolítására és a kapcsolódó nagy kockázatú MI-rendszerekre vonatkozóan. A piacfelügyeleti hatóságoknak az említett hatásköröket abból a célból kell gyakorolniuk, hogy biztosítsák a valós körülmények közötti tesztelés biztonságos fejlesztését.

(7) A valós körülmények közötti tesztelés során azonosított súlyos váratlan eseményeket a 73. cikkel összhangban jelenteni kell a nemzeti piacfelügyeleti hatóságnak. A szolgáltatónak vagy leendő szolgáltatónak azonnali kockázatcsökkentő intézkedéseket kell elfogadnia, vagy ennek hiányában fel kell függesztenie a valós körülmények közötti tesztelést mindaddig, amíg a kockázatcsökkentésre sor nem kerül, vagy egyébként meg kell szüntetnie azt. A valós körülmények közötti tesztelés említett megszüntetésének esetére a szolgáltatónak vagy a leendő szolgáltatónak ki kell alakítania egy eljárást az MI-rendszer azonnali visszahívására.

(8) A szolgáltatóknak vagy a leendő szolgáltatóknak értesíteniük kell a valós körülmények közötti tesztelés felfüggesztéséről vagy megszüntetéséről, továbbá a végeredményekről azon tagállam nemzeti piacfelügyeleti hatóságát, amelyben a valós körülmények közötti tesztelésre sor kerül.

(9) A szolgáltató vagy a leendő szolgáltató – a felelősségvállalásra alkalmazandó uniós és nemzeti jog alapján – felelősséggel tartozik a valós körülmények közötti tesztelés során okozott károkért.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '1',
  '(1) A nagy kockázatú MI-rendszerek valós körülmények közötti, az MI szabályozói tesztkörnyezeteken kívül történő tesztelését a III. mellékletben felsorolt nagy kockázatú MI-rendszerek szolgáltatói vagy leendő szolgáltatói végezhetik e cikkel és az e cikkben említett, valós körülmények közötti tesztelésre vonatkozó tervvel összhangban, az 5. cikk szerinti tilalmak sérelme nélkül.

A Bizottság végrehajtási jogi aktusok révén határozza meg a valós körülmények közötti tesztelésre vonatkozó terv részletes elemeit. E végrehajtási jogi aktusokat a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.

E bekezdés nem érinti az I. mellékletben felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termékekhez kapcsolódó nagy kockázatú MI-rendszerek valós körülmények közötti tesztelésére vonatkozó uniós vagy nemzeti jogot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '2',
  '(2) A szolgáltatók vagy a leendő szolgáltatók a III. mellékletben említett nagy kockázatú MI-rendszerek forgalomba hozatala vagy üzembe helyezése előtt saját maguk, vagy egy vagy több alkalmazóval vagy leendő alkalmazóval partnerségben bármikor elvégezhetik az MI-rendszer valós körülmények közötti tesztelését.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '3',
  '(3) A nagy kockázatú MI-rendszerek e cikk szerinti, valós körülmények közötti tesztelése nem sértheti az uniós vagy nemzeti jog által előírt etikai felülvizsgálatot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '4',
  '(4) A szolgáltatók vagy a leendő szolgáltatók csak akkor végezhetnek valós körülmények közötti tesztelést, ha a következő feltételek mindegyike teljesül:

a)

a szolgáltató vagy a leendő szolgáltató elkészítette a valós körülmények közötti tesztelésre vonatkozó tervet, és azt benyújtotta azon tagállam piacfelügyeleti hatóságához, amelyben a valós körülmények közötti tesztelésre sor kell, hogy kerüljön;

b)

azon tagállam piacfelügyeleti hatósága, amelyben a valós körülmények közötti tesztelésre sor kell, hogy kerüljön, jóváhagyta a valós körülmények közötti tesztelést és a valós körülmények közötti tesztelésre vonatkozó tervet; amennyiben a piacfelügyeleti hatóság 30 napon belül nem ad választ, a valós körülmények közötti tesztelést és a valós körülmények közötti tesztelésre vonatkozó tervet jóváhagyottnak kell tekinteni; amennyiben a nemzeti jog nem rendelkezik a hallgatólagos jóváhagyásról, a valós körülmények közötti tesztelést továbbra is engedélyhez kell kötni;

c)

a szolgáltató vagy a leendő szolgáltató – a bűnüldözés, a migráció, a menekültügy és a határellenőrzés területén használt, a III. melléklet 1., 6. és 7. pontjában említett nagy kockázatú MI-rendszerek, valamint a III. melléklet 2. pontjában említett nagy kockázatú MI-rendszerek szolgáltatói vagy leendő szolgáltatói kivételével – a valós körülmények közötti tesztelést a 71. cikk (4) bekezdésével összhangban – egy Unió-szerte egységes, egyedi azonosító számmal és a IX. mellékletben meghatározott információkkal együtt – rögzítette; a bűnüldözés, a migráció, a menekültügy és a határellenőrzés területén használt, a III. melléklet 1., 6. és 7. pontjában említett nagy kockázatú MI-rendszerek szolgáltatója vagy leendő szolgáltatója a valós körülmények közötti tesztelést – a 49. cikk (4) bekezdésének d) pontjával összhangban – az uniós adatbázis biztonságos nem nyilvános részében rögzítette egy Unió-szerte egységes, egyedi azonosító számmal és az ott meghatározott információkkal együtt; a III. melléket 2. pontjában említett nagy kockázatú MI-rendszerek szolgáltatója vagy leendő szolgáltatója a valós körülmények közötti tesztelést – a 49. cikk (5) bekezdésével összhangban – rögzítette;

d)

a tesztelést valós körülmények között végző szolgáltató vagy leendő szolgáltató letelepedett az Unióban, vagy az Unióban letelepedett jogi képviselőt nevezett ki;

e)

a valós körülmények közötti tesztelés céljából gyűjtött és kezelt adatok csak akkor továbbíthatók harmadik országokba, ha az uniós jog szerinti megfelelő és alkalmazandó biztosítékok végrehajtásra kerülnek;

f)

a valós körülmények közötti tesztelés nem tart annál tovább, mint ami szükséges a céljai eléréséhez, de semmi esetre sem hosszabb hat hónapnál; ez az időszak további hat hónappal meghosszabbítható, feltéve, hogy a szolgáltató vagy a leendő szolgáltató előzetesen értesíti a piacfelügyeleti hatóságot, mellékelve annak magyarázatát, hogy miért van szükség a hosszabbításra;

g)

a valós körülmények közötti tesztelés azon alanyai, akik életkoruk vagy fogyatékosságuk miatt kiszolgáltatott csoportokhoz tartozó személyek, megfelelő védelemben részesülnek;

h)

amennyiben egy szolgáltató vagy a leendő szolgáltató a valós körülmények közötti tesztelést egy vagy több alkalmazóval vagy leendő alkalmazóval együttműködve szervezi meg, ez utóbbiakat tájékoztatták a tesztelés minden olyan vonatkozásáról, amely releváns a részvételükre vonatkozó döntésük szempontjából, és megkapták az MI-rendszer használatára vonatkozó, a 13. cikkben említett releváns utasításokat; a szolgáltatónak vagy a leendő szolgáltatónak és az alkalmazónak vagy a leendő alkalmazónak megállapodást kell kötniük, amelyben meghatározzák szerepüket és felelősségüket annak érdekében, hogy biztosítsák az e rendeletben, valamint más alkalmazandó uniós és nemzeti jogban a valós körülmények közötti tesztelésre vonatkozóan előírt rendelkezéseknek való megfelelést;

i)

a valós körülmények közötti tesztelés vizsgálati alanyai a 61. cikkel összhangban tájékoztatáson alapuló hozzájárulásukat adták, vagy bűnüldözés esetében, amennyiben a tájékoztatáson alapuló hozzájárulás megkérése megakadályozná az MI-rendszer tesztelését, maga a tesztelés és a valós körülmények közötti tesztelés eredménye nem gyakorolhat negatív hatást a tesztelés vizsgálati alanyaira, és a személyes adataikat a teszt elvégzése után törölni kell;

j)

a valós körülmények közötti tesztelést a szolgáltató vagy a leendő szolgáltató, valamint az alkalmazók és a leendő alkalmazók hatékonyan felügyelik olyan személyek révén, akik az adott területen megfelelően képzettek, és rendelkeznek a feladataik ellátásához szükséges kapacitással, képzettséggel és felhatalmazással;

k)

az MI-rendszer előrejelzéseit, ajánlásait és döntéseit ténylegesen vissza lehet fordítani és figyelmen kívül lehet hagyni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '4(a)',
  'a) a szolgáltató vagy a leendő szolgáltató elkészítette a valós körülmények közötti tesztelésre vonatkozó tervet, és azt benyújtotta azon tagállam piacfelügyeleti hatóságához, amelyben a valós körülmények közötti tesztelésre sor kell, hogy kerüljön;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '4(b)',
  'b) azon tagállam piacfelügyeleti hatósága, amelyben a valós körülmények közötti tesztelésre sor kell, hogy kerüljön, jóváhagyta a valós körülmények közötti tesztelést és a valós körülmények közötti tesztelésre vonatkozó tervet; amennyiben a piacfelügyeleti hatóság 30 napon belül nem ad választ, a valós körülmények közötti tesztelést és a valós körülmények közötti tesztelésre vonatkozó tervet jóváhagyottnak kell tekinteni; amennyiben a nemzeti jog nem rendelkezik a hallgatólagos jóváhagyásról, a valós körülmények közötti tesztelést továbbra is engedélyhez kell kötni;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '4(c)',
  'c) a szolgáltató vagy a leendő szolgáltató – a bűnüldözés, a migráció, a menekültügy és a határellenőrzés területén használt, a III. melléklet 1., 6. és 7. pontjában említett nagy kockázatú MI-rendszerek, valamint a III. melléklet 2. pontjában említett nagy kockázatú MI-rendszerek szolgáltatói vagy leendő szolgáltatói kivételével – a valós körülmények közötti tesztelést a 71. cikk (4) bekezdésével összhangban – egy Unió-szerte egységes, egyedi azonosító számmal és a IX. mellékletben meghatározott információkkal együtt – rögzítette; a bűnüldözés, a migráció, a menekültügy és a határellenőrzés területén használt, a III. melléklet 1., 6. és 7. pontjában említett nagy kockázatú MI-rendszerek szolgáltatója vagy leendő szolgáltatója a valós körülmények közötti tesztelést – a 49. cikk (4) bekezdésének d) pontjával összhangban – az uniós adatbázis biztonságos nem nyilvános részében rögzítette egy Unió-szerte egységes, egyedi azonosító számmal és az ott meghatározott információkkal együtt; a III. melléket 2. pontjában említett nagy kockázatú MI-rendszerek szolgáltatója vagy leendő szolgáltatója a valós körülmények közötti tesztelést – a 49. cikk (5) bekezdésével összhangban – rögzítette;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '4(d)',
  'd) a tesztelést valós körülmények között végző szolgáltató vagy leendő szolgáltató letelepedett az Unióban, vagy az Unióban letelepedett jogi képviselőt nevezett ki;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '4(e)',
  'e) a valós körülmények közötti tesztelés céljából gyűjtött és kezelt adatok csak akkor továbbíthatók harmadik országokba, ha az uniós jog szerinti megfelelő és alkalmazandó biztosítékok végrehajtásra kerülnek;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '4(f)',
  'f) a valós körülmények közötti tesztelés nem tart annál tovább, mint ami szükséges a céljai eléréséhez, de semmi esetre sem hosszabb hat hónapnál; ez az időszak további hat hónappal meghosszabbítható, feltéve, hogy a szolgáltató vagy a leendő szolgáltató előzetesen értesíti a piacfelügyeleti hatóságot, mellékelve annak magyarázatát, hogy miért van szükség a hosszabbításra;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '4(g)',
  'g) a valós körülmények közötti tesztelés azon alanyai, akik életkoruk vagy fogyatékosságuk miatt kiszolgáltatott csoportokhoz tartozó személyek, megfelelő védelemben részesülnek;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '4(h)',
  'h) amennyiben egy szolgáltató vagy a leendő szolgáltató a valós körülmények közötti tesztelést egy vagy több alkalmazóval vagy leendő alkalmazóval együttműködve szervezi meg, ez utóbbiakat tájékoztatták a tesztelés minden olyan vonatkozásáról, amely releváns a részvételükre vonatkozó döntésük szempontjából, és megkapták az MI-rendszer használatára vonatkozó, a 13. cikkben említett releváns utasításokat; a szolgáltatónak vagy a leendő szolgáltatónak és az alkalmazónak vagy a leendő alkalmazónak megállapodást kell kötniük, amelyben meghatározzák szerepüket és felelősségüket annak érdekében, hogy biztosítsák az e rendeletben, valamint más alkalmazandó uniós és nemzeti jogban a valós körülmények közötti tesztelésre vonatkozóan előírt rendelkezéseknek való megfelelést;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '4(i)',
  'i) a valós körülmények közötti tesztelés vizsgálati alanyai a 61. cikkel összhangban tájékoztatáson alapuló hozzájárulásukat adták, vagy bűnüldözés esetében, amennyiben a tájékoztatáson alapuló hozzájárulás megkérése megakadályozná az MI-rendszer tesztelését, maga a tesztelés és a valós körülmények közötti tesztelés eredménye nem gyakorolhat negatív hatást a tesztelés vizsgálati alanyaira, és a személyes adataikat a teszt elvégzése után törölni kell;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '4(j)',
  'j) a valós körülmények közötti tesztelést a szolgáltató vagy a leendő szolgáltató, valamint az alkalmazók és a leendő alkalmazók hatékonyan felügyelik olyan személyek révén, akik az adott területen megfelelően képzettek, és rendelkeznek a feladataik ellátásához szükséges kapacitással, képzettséggel és felhatalmazással;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '4(k)',
  'k) az MI-rendszer előrejelzéseit, ajánlásait és döntéseit ténylegesen vissza lehet fordítani és figyelmen kívül lehet hagyni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '5',
  '(5) A valós körülmények közötti tesztelés alanyai vagy adott esetben azok jogszerűen kijelölt képviselői a tájékoztatáson alapuló hozzájárulásuk visszavonásával – minden hátrányos következmény nélkül és indokolási kötelezettség nélkül – bármikor elállhatnak a teszteléstől, és kérhetik személyes adataik azonnali és végleges törlését. A tájékoztatáson alapuló hozzájárulás visszavonása nem érinti a már elvégzett tevékenységeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '6',
  '(6) A 75. cikkel összhangban a tagállamok felruházzák piacfelügyeleti hatóságaikat azzal a hatáskörrel, hogy a szolgáltatókat és a leendő szolgáltatókat információszolgáltatásra kötelezzék, előre be nem jelentett távoli vagy helyszíni ellenőrzéseket végezzenek, valamint hogy ellenőrzéseket végezzenek a valós körülmények közötti tesztelés lebonyolítására és a kapcsolódó nagy kockázatú MI-rendszerekre vonatkozóan. A piacfelügyeleti hatóságoknak az említett hatásköröket abból a célból kell gyakorolniuk, hogy biztosítsák a valós körülmények közötti tesztelés biztonságos fejlesztését.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '7',
  '(7) A valós körülmények közötti tesztelés során azonosított súlyos váratlan eseményeket a 73. cikkel összhangban jelenteni kell a nemzeti piacfelügyeleti hatóságnak. A szolgáltatónak vagy leendő szolgáltatónak azonnali kockázatcsökkentő intézkedéseket kell elfogadnia, vagy ennek hiányában fel kell függesztenie a valós körülmények közötti tesztelést mindaddig, amíg a kockázatcsökkentésre sor nem kerül, vagy egyébként meg kell szüntetnie azt. A valós körülmények közötti tesztelés említett megszüntetésének esetére a szolgáltatónak vagy a leendő szolgáltatónak ki kell alakítania egy eljárást az MI-rendszer azonnali visszahívására.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '8',
  '(8) A szolgáltatóknak vagy a leendő szolgáltatóknak értesíteniük kell a valós körülmények közötti tesztelés felfüggesztéséről vagy megszüntetéséről, továbbá a végeredményekről azon tagállam nemzeti piacfelügyeleti hatóságát, amelyben a valós körülmények közötti tesztelésre sor kerül.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '60',
  '9',
  '(9) A szolgáltató vagy a leendő szolgáltató – a felelősségvállalásra alkalmazandó uniós és nemzeti jog alapján – felelősséggel tartozik a valós körülmények közötti tesztelés során okozott károkért.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_60'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '61',
  null,
  'Tájékoztatáson alapuló hozzájárulás az MI szabályozói tesztkörnyezeteken kívüli, valós körülmények közötti tesztelésben való részvételhez
(1) A 60. cikk szerinti, valós körülmények közötti tesztelés céljából – a tesztelésben való részvételüket megelőzően – be kell szerezni a vizsgálat alanyainak tájékoztatáson alapuló, önkéntes hozzájárulását azt követően, hogy tömör, egyértelmű, releváns és érthető tájékoztatást kaptak a következőket illetően:

a)

a valós körülmények közötti tesztelés jellege és célkitűzései, valamint a részvételükkel összefüggő esetleges kellemetlenségek;

b)

azon feltételek, amelyek mellett a valós körülmények közötti tesztelést el kell végezni, ideértve a vizsgálati alany vagy alanyok részvételének várható időtartamát;

c)

a jogaik és a garanciák a részvételüket illetően, különös tekintettel a részvétel megtagadására való jogukra, valamint a valós körülmények közötti teszteléstől való, indokolás nélkül bármikor bejelenthető, hátrányos következménnyel nem járó elálláshoz való jogra;

d)

az MI-rendszer előrejelzéseinek, ajánlásainak vagy döntéseinek visszafordítására vagy figyelmen kívül hagyására irányuló kérésre vonatkozó szabályok;

e)

a 60. cikk (4) bekezdésének c) pontjával összhangban a valós körülmények közötti tesztelés Unió-szerte egységes, egyedi azonosító száma, valamint azon szolgáltatónak vagy jogi képviselőjének az elérhetősége, akitől további információk szerezhetők be.

(2) A tájékoztatáson alapuló hozzájárulást dátummal kell ellátni és dokumentálni kell, és annak másolatát át kell adni a vizsgálati alanyoknak vagy jogi képviselőiknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '61',
  '1',
  '(1) A 60. cikk szerinti, valós körülmények közötti tesztelés céljából – a tesztelésben való részvételüket megelőzően – be kell szerezni a vizsgálat alanyainak tájékoztatáson alapuló, önkéntes hozzájárulását azt követően, hogy tömör, egyértelmű, releváns és érthető tájékoztatást kaptak a következőket illetően:

a)

a valós körülmények közötti tesztelés jellege és célkitűzései, valamint a részvételükkel összefüggő esetleges kellemetlenségek;

b)

azon feltételek, amelyek mellett a valós körülmények közötti tesztelést el kell végezni, ideértve a vizsgálati alany vagy alanyok részvételének várható időtartamát;

c)

a jogaik és a garanciák a részvételüket illetően, különös tekintettel a részvétel megtagadására való jogukra, valamint a valós körülmények közötti teszteléstől való, indokolás nélkül bármikor bejelenthető, hátrányos következménnyel nem járó elálláshoz való jogra;

d)

az MI-rendszer előrejelzéseinek, ajánlásainak vagy döntéseinek visszafordítására vagy figyelmen kívül hagyására irányuló kérésre vonatkozó szabályok;

e)

a 60. cikk (4) bekezdésének c) pontjával összhangban a valós körülmények közötti tesztelés Unió-szerte egységes, egyedi azonosító száma, valamint azon szolgáltatónak vagy jogi képviselőjének az elérhetősége, akitől további információk szerezhetők be.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '61',
  '1(a)',
  'a) a valós körülmények közötti tesztelés jellege és célkitűzései, valamint a részvételükkel összefüggő esetleges kellemetlenségek;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '61',
  '1(b)',
  'b) azon feltételek, amelyek mellett a valós körülmények közötti tesztelést el kell végezni, ideértve a vizsgálati alany vagy alanyok részvételének várható időtartamát;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '61',
  '1(c)',
  'c) a jogaik és a garanciák a részvételüket illetően, különös tekintettel a részvétel megtagadására való jogukra, valamint a valós körülmények közötti teszteléstől való, indokolás nélkül bármikor bejelenthető, hátrányos következménnyel nem járó elálláshoz való jogra;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '61',
  '1(d)',
  'd) az MI-rendszer előrejelzéseinek, ajánlásainak vagy döntéseinek visszafordítására vagy figyelmen kívül hagyására irányuló kérésre vonatkozó szabályok;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '61',
  '1(e)',
  'e) a 60. cikk (4) bekezdésének c) pontjával összhangban a valós körülmények közötti tesztelés Unió-szerte egységes, egyedi azonosító száma, valamint azon szolgáltatónak vagy jogi képviselőjének az elérhetősége, akitől további információk szerezhetők be.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '61',
  '2',
  '(2) A tájékoztatáson alapuló hozzájárulást dátummal kell ellátni és dokumentálni kell, és annak másolatát át kell adni a vizsgálati alanyoknak vagy jogi képviselőiknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_61'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '62',
  null,
  'Szolgáltatókra és alkalmazókra, különösen a kkv-kra, köztük az induló innovatív vállalkozásokra vonatkozó intézkedések
(1) A tagállamok a következő intézkedéseket hajtják végre:

a)

az Unióban bejegyzett székhellyel vagy fiókteleppel rendelkező kkv-k, köztük az induló innovatív vállalkozások számára elsőbbségi hozzáférést biztosítanak az MI szabályozói tesztkörnyezetekhez, amennyiben e vállalkozások teljesítik a jogosultsági feltételeket és a kiválasztási kritériumokat; az elsőbbségi hozzáférés nem zárhatja ki, hogy az e bekezdésben említettektől eltérő egyéb kkv-k – ideértve az induló innovatív vállalkozásokat is – hozzáféréssel rendelkezzenek az MI szabályozói tesztkörnyezethez, feltéve, hogy teljesítik a jogosultsági feltételeket és a kiválasztási szempontokat is;

b)

az e rendelet alkalmazásával kapcsolatos, a kkv-k, köztük az induló innovatív vállalkozások, az alkalmazók, valamint adott esetben a helyi közigazgatási szervek igényeihez igazított külön figyelemfelhívó és képzési tevékenységeket szerveznek;

c)

kihasználják a meglévő célzott csatornákat és adott esetben újakat hoznak létre a kkv-kkal, köztük az induló innovatív vállalkozásokkal, az alkalmazókkal, egyéb innovátorokkal, valamint adott esetben a helyi közigazgatási szervekkel folytatott kommunikáció céljára, hogy tanácsot és választ adjanak az e rendelet végrehajtásával kapcsolatos kérdéseket illetően, többek között az MI szabályozói tesztkörnyezetekben való részvétel tekintetében;

d)

elősegítik a kkv-k és egyéb érintett érdekelt felek részvételét a szabványalkotási folyamatban.

(2) A 43. cikk szerinti megfelelőségértékelési díjak megállapításakor figyelembe kell venni a kkv-szolgáltatók, köztük az induló innovatív vállalkozások sajátos érdekeit és igényeit, arányosan csökkentve e díjakat a vállalkozások méretének, a piac méretének és egyéb releváns tényezőknek megfelelően.

(3) Az MI-hivatalnak a következő intézkedéseket kell végrehajtania:

a)

a Testület által a kérelmében meghatározottak szerint szabványosított mintákat bocsát rendelkezésre az e rendelet hatálya alá tartozó területekre vonatkozóan;

b)

egységes információs platformot fejleszt ki és tart fenn, amely könnyen használható információkat nyújt e rendelettel kapcsolatban valamennyi uniós gazdasági szereplő számára;

c)

megfelelő kommunikációs kampányokat szervez annak érdekében, hogy felhívja a figyelmet az e rendeletből eredő kötelezettségekre;

d)

értékeli és előmozdítja az MI-rendszerekre vonatkozó közbeszerzési eljárások legjobb gyakorlatainak közelítését.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '62',
  '1',
  '(1) A tagállamok a következő intézkedéseket hajtják végre:

a)

az Unióban bejegyzett székhellyel vagy fiókteleppel rendelkező kkv-k, köztük az induló innovatív vállalkozások számára elsőbbségi hozzáférést biztosítanak az MI szabályozói tesztkörnyezetekhez, amennyiben e vállalkozások teljesítik a jogosultsági feltételeket és a kiválasztási kritériumokat; az elsőbbségi hozzáférés nem zárhatja ki, hogy az e bekezdésben említettektől eltérő egyéb kkv-k – ideértve az induló innovatív vállalkozásokat is – hozzáféréssel rendelkezzenek az MI szabályozói tesztkörnyezethez, feltéve, hogy teljesítik a jogosultsági feltételeket és a kiválasztási szempontokat is;

b)

az e rendelet alkalmazásával kapcsolatos, a kkv-k, köztük az induló innovatív vállalkozások, az alkalmazók, valamint adott esetben a helyi közigazgatási szervek igényeihez igazított külön figyelemfelhívó és képzési tevékenységeket szerveznek;

c)

kihasználják a meglévő célzott csatornákat és adott esetben újakat hoznak létre a kkv-kkal, köztük az induló innovatív vállalkozásokkal, az alkalmazókkal, egyéb innovátorokkal, valamint adott esetben a helyi közigazgatási szervekkel folytatott kommunikáció céljára, hogy tanácsot és választ adjanak az e rendelet végrehajtásával kapcsolatos kérdéseket illetően, többek között az MI szabályozói tesztkörnyezetekben való részvétel tekintetében;

d)

elősegítik a kkv-k és egyéb érintett érdekelt felek részvételét a szabványalkotási folyamatban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '62',
  '1(a)',
  'a) az Unióban bejegyzett székhellyel vagy fiókteleppel rendelkező kkv-k, köztük az induló innovatív vállalkozások számára elsőbbségi hozzáférést biztosítanak az MI szabályozói tesztkörnyezetekhez, amennyiben e vállalkozások teljesítik a jogosultsági feltételeket és a kiválasztási kritériumokat; az elsőbbségi hozzáférés nem zárhatja ki, hogy az e bekezdésben említettektől eltérő egyéb kkv-k – ideértve az induló innovatív vállalkozásokat is – hozzáféréssel rendelkezzenek az MI szabályozói tesztkörnyezethez, feltéve, hogy teljesítik a jogosultsági feltételeket és a kiválasztási szempontokat is;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '62',
  '1(b)',
  'b) az e rendelet alkalmazásával kapcsolatos, a kkv-k, köztük az induló innovatív vállalkozások, az alkalmazók, valamint adott esetben a helyi közigazgatási szervek igényeihez igazított külön figyelemfelhívó és képzési tevékenységeket szerveznek;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '62',
  '1(c)',
  'c) kihasználják a meglévő célzott csatornákat és adott esetben újakat hoznak létre a kkv-kkal, köztük az induló innovatív vállalkozásokkal, az alkalmazókkal, egyéb innovátorokkal, valamint adott esetben a helyi közigazgatási szervekkel folytatott kommunikáció céljára, hogy tanácsot és választ adjanak az e rendelet végrehajtásával kapcsolatos kérdéseket illetően, többek között az MI szabályozói tesztkörnyezetekben való részvétel tekintetében;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '62',
  '1(d)',
  'd) elősegítik a kkv-k és egyéb érintett érdekelt felek részvételét a szabványalkotási folyamatban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '62',
  '2',
  '(2) A 43. cikk szerinti megfelelőségértékelési díjak megállapításakor figyelembe kell venni a kkv-szolgáltatók, köztük az induló innovatív vállalkozások sajátos érdekeit és igényeit, arányosan csökkentve e díjakat a vállalkozások méretének, a piac méretének és egyéb releváns tényezőknek megfelelően.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '62',
  '3',
  '(3) Az MI-hivatalnak a következő intézkedéseket kell végrehajtania:

a)

a Testület által a kérelmében meghatározottak szerint szabványosított mintákat bocsát rendelkezésre az e rendelet hatálya alá tartozó területekre vonatkozóan;

b)

egységes információs platformot fejleszt ki és tart fenn, amely könnyen használható információkat nyújt e rendelettel kapcsolatban valamennyi uniós gazdasági szereplő számára;

c)

megfelelő kommunikációs kampányokat szervez annak érdekében, hogy felhívja a figyelmet az e rendeletből eredő kötelezettségekre;

d)

értékeli és előmozdítja az MI-rendszerekre vonatkozó közbeszerzési eljárások legjobb gyakorlatainak közelítését.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '62',
  '3(a)',
  'a) a Testület által a kérelmében meghatározottak szerint szabványosított mintákat bocsát rendelkezésre az e rendelet hatálya alá tartozó területekre vonatkozóan;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '62',
  '3(b)',
  'b) egységes információs platformot fejleszt ki és tart fenn, amely könnyen használható információkat nyújt e rendelettel kapcsolatban valamennyi uniós gazdasági szereplő számára;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '62',
  '3(c)',
  'c) megfelelő kommunikációs kampányokat szervez annak érdekében, hogy felhívja a figyelmet az e rendeletből eredő kötelezettségekre;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '62',
  '3(d)',
  'd) értékeli és előmozdítja az MI-rendszerekre vonatkozó közbeszerzési eljárások legjobb gyakorlatainak közelítését.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_62'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '63',
  null,
  'Egyes gazdasági szereplők számára biztosított eltérések
(1) A 2003/361/EK ajánlás értelmében vett mikrovállalkozások az e rendelet 17. cikke által előírt minőségirányítási rendszer bizonyos elemeinek egyszerűsített módon is megfelelhetnek, feltéve, hogy nem rendelkeznek az említett ajánlás értelmében vett partnervállalkozásokkal vagy kapcsolt vállalkozásokkal. E célból a Bizottság iránymutatásokat dolgoz ki a minőségirányítási rendszer azon elemeire vonatkozóan, amelyeknek – a mikrovállalkozások igényeit figyelembe véve – egyszerűsített módon is meg lehet felelni, méghozzá anélkül, hogy ez érintené a védelem szintjét vagy a nagy kockázatú MI-rendszerekre vonatkozó követelményeknek való megfelelés szükségességét.

(2) E cikk (1) bekezdése nem értelmezhető úgy, hogy mentesíti az említett gazdasági szereplőket az e rendeletben meghatározott egyéb követelmények vagy kötelezettségek teljesítése alól, ideértve a 9., a 10., a 11., a 12., a 13., a 14., a 15., a 72. és a 73. cikkben meghatározott követelményeket és kötelezettségeket is.

VII. FEJEZET

IRÁNYÍTÁS

1. SZAKASZ

Uniós szintű irányítás',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_63'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '63',
  '1',
  '(1) A 2003/361/EK ajánlás értelmében vett mikrovállalkozások az e rendelet 17. cikke által előírt minőségirányítási rendszer bizonyos elemeinek egyszerűsített módon is megfelelhetnek, feltéve, hogy nem rendelkeznek az említett ajánlás értelmében vett partnervállalkozásokkal vagy kapcsolt vállalkozásokkal. E célból a Bizottság iránymutatásokat dolgoz ki a minőségirányítási rendszer azon elemeire vonatkozóan, amelyeknek – a mikrovállalkozások igényeit figyelembe véve – egyszerűsített módon is meg lehet felelni, méghozzá anélkül, hogy ez érintené a védelem szintjét vagy a nagy kockázatú MI-rendszerekre vonatkozó követelményeknek való megfelelés szükségességét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_63'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '63',
  '2',
  '(2) E cikk (1) bekezdése nem értelmezhető úgy, hogy mentesíti az említett gazdasági szereplőket az e rendeletben meghatározott egyéb követelmények vagy kötelezettségek teljesítése alól, ideértve a 9., a 10., a 11., a 12., a 13., a 14., a 15., a 72. és a 73. cikkben meghatározott követelményeket és kötelezettségeket is.

VII. FEJEZET

IRÁNYÍTÁS

1. SZAKASZ

Uniós szintű irányítás',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_63'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '64',
  null,
  'MI-hivatal
(1) A Bizottság az MI-hivatalon keresztül fejleszti az uniós szakértelmet és képességeket a mesterséges intelligencia területén.

(2) A tagállamok elősegítik az e rendelet alapján az MI-hivatalra ruházott feladatok ellátását.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '64',
  '1',
  '(1) A Bizottság az MI-hivatalon keresztül fejleszti az uniós szakértelmet és képességeket a mesterséges intelligencia területén.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '64',
  '2',
  '(2) A tagállamok elősegítik az e rendelet alapján az MI-hivatalra ruházott feladatok ellátását.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_64'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '65',
  null,
  'A Mesterséges Intelligenciával Foglalkozó Európai Testület létrehozása és felépítése
(1) Létrejön a Mesterséges Intelligenciával Foglalkozó Európai Testület (a továbbiakban: a Testület).

(2) A Testületnek a tagállamok egy-egy képviselőjéből kell állnia. Az európai adatvédelmi biztosnak megfigyelőként kell részt vennie a Testületben. A Testület ülésein az MI-hivatalnak is részt kell vennie, a szavazásokon való részvétel nélkül. A Testület eseti alapon más nemzeti és uniós hatóságokat, szerveket vagy szakértőket is meghívhat az ülésekre, amennyiben a megvitatott kérdések számukra relevánsak.

(3) Az egyes képviselőket a tagállamaik jelölik ki hároméves, egyszer megújítható időtartamra.

(4) A tagállamok biztosítják, hogy a Testületben részt vevő képviselőik:

a)

a tagállamukban rendelkeznek a releváns kompetenciákkal és hatáskörökkel ahhoz, hogy aktívan hozzájáruljanak a Testületnek a 66. cikkben említett feladatai teljesítéséhez;

b)

a Testület felé egyedüli kapcsolattartó pontként vannak kijelölve, és adott esetben – figyelembe véve a tagállamok igényeit – egyedüli kapcsolattartó pontként az érdekelt felek számára;

c)

felhatalmazással rendelkeznek arra, hogy elősegítsék a tagállamuk illetékes nemzeti hatóságai közötti összhangot és koordinációt e rendelet végrehajtása tekintetében, többek között a Testületen belüli feladataik ellátása céljából releváns adatok és információk gyűjtése révén.

(5) A tagállamok kijelölt képviselői kétharmados többséggel fogadják el a Testület eljárási szabályzatát. Az eljárási szabályzatban meg kell állapítani különösen a kiválasztási folyamat eljárásait, az elnök megbízatásának időtartamát és feladatainak leírását, a szavazásra vonatkozó részletes szabályokat, valamint a Testület és alcsoportjai tevékenységeinek megszervezését.

(6) A Testületnek létre kell hoznia két állandó alcsoportot, hogy platformot biztosítsanak a piacfelügyeleti hatóságok, illetve a bejelentő hatóságok közötti együttműködéshez és véleménycseréhez a piacfelügyelettel, illetve a bejelentett szervezetekkel kapcsolatos ügyekről.

A piacfelügyelettel foglalkozó állandó alcsoportnak e rendelet tekintetében az (EU) 2019/1020 rendelet 30. cikke értelmében vett igazgatási együttműködési csoportként kell eljárnia.

A Testület adott esetben, konkrét kérdések megvizsgálása céljából újabb állandó vagy ideiglenes alcsoportokat hozhat létre. Adott esetben a 67. cikkben említett tanácsadó fórum képviselőit megfigyelői minőségben meg lehet hívni ilyen alcsoportokba vagy ezen alcsoportok egyes üléseire.

(7) A Testület felépítésének és működésének biztosítania kell a Testület tevékenységeinek objektivitását és pártatlanságát.

(8) A Testület elnöki tisztét az egyik tagállam képviselőjének kell betöltenie. Az MI-hivatal látja el a Testület titkári feladatait, az elnök kérésére összehívja az üléseket, valamint elkészíti a napirendet a Testület e rendelet és eljárási szabályzata szerinti feladatainak megfelelően.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '65',
  '1',
  '(1) Létrejön a Mesterséges Intelligenciával Foglalkozó Európai Testület (a továbbiakban: a Testület).',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '65',
  '2',
  '(2) A Testületnek a tagállamok egy-egy képviselőjéből kell állnia. Az európai adatvédelmi biztosnak megfigyelőként kell részt vennie a Testületben. A Testület ülésein az MI-hivatalnak is részt kell vennie, a szavazásokon való részvétel nélkül. A Testület eseti alapon más nemzeti és uniós hatóságokat, szerveket vagy szakértőket is meghívhat az ülésekre, amennyiben a megvitatott kérdések számukra relevánsak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '65',
  '3',
  '(3) Az egyes képviselőket a tagállamaik jelölik ki hároméves, egyszer megújítható időtartamra.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '65',
  '4',
  '(4) A tagállamok biztosítják, hogy a Testületben részt vevő képviselőik:

a)

a tagállamukban rendelkeznek a releváns kompetenciákkal és hatáskörökkel ahhoz, hogy aktívan hozzájáruljanak a Testületnek a 66. cikkben említett feladatai teljesítéséhez;

b)

a Testület felé egyedüli kapcsolattartó pontként vannak kijelölve, és adott esetben – figyelembe véve a tagállamok igényeit – egyedüli kapcsolattartó pontként az érdekelt felek számára;

c)

felhatalmazással rendelkeznek arra, hogy elősegítsék a tagállamuk illetékes nemzeti hatóságai közötti összhangot és koordinációt e rendelet végrehajtása tekintetében, többek között a Testületen belüli feladataik ellátása céljából releváns adatok és információk gyűjtése révén.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '65',
  '4(a)',
  'a) a tagállamukban rendelkeznek a releváns kompetenciákkal és hatáskörökkel ahhoz, hogy aktívan hozzájáruljanak a Testületnek a 66. cikkben említett feladatai teljesítéséhez;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '65',
  '4(b)',
  'b) a Testület felé egyedüli kapcsolattartó pontként vannak kijelölve, és adott esetben – figyelembe véve a tagállamok igényeit – egyedüli kapcsolattartó pontként az érdekelt felek számára;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '65',
  '4(c)',
  'c) felhatalmazással rendelkeznek arra, hogy elősegítsék a tagállamuk illetékes nemzeti hatóságai közötti összhangot és koordinációt e rendelet végrehajtása tekintetében, többek között a Testületen belüli feladataik ellátása céljából releváns adatok és információk gyűjtése révén.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '65',
  '5',
  '(5) A tagállamok kijelölt képviselői kétharmados többséggel fogadják el a Testület eljárási szabályzatát. Az eljárási szabályzatban meg kell állapítani különösen a kiválasztási folyamat eljárásait, az elnök megbízatásának időtartamát és feladatainak leírását, a szavazásra vonatkozó részletes szabályokat, valamint a Testület és alcsoportjai tevékenységeinek megszervezését.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '65',
  '6',
  '(6) A Testületnek létre kell hoznia két állandó alcsoportot, hogy platformot biztosítsanak a piacfelügyeleti hatóságok, illetve a bejelentő hatóságok közötti együttműködéshez és véleménycseréhez a piacfelügyelettel, illetve a bejelentett szervezetekkel kapcsolatos ügyekről.

A piacfelügyelettel foglalkozó állandó alcsoportnak e rendelet tekintetében az (EU) 2019/1020 rendelet 30. cikke értelmében vett igazgatási együttműködési csoportként kell eljárnia.

A Testület adott esetben, konkrét kérdések megvizsgálása céljából újabb állandó vagy ideiglenes alcsoportokat hozhat létre. Adott esetben a 67. cikkben említett tanácsadó fórum képviselőit megfigyelői minőségben meg lehet hívni ilyen alcsoportokba vagy ezen alcsoportok egyes üléseire.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '65',
  '7',
  '(7) A Testület felépítésének és működésének biztosítania kell a Testület tevékenységeinek objektivitását és pártatlanságát.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '65',
  '8',
  '(8) A Testület elnöki tisztét az egyik tagállam képviselőjének kell betöltenie. Az MI-hivatal látja el a Testület titkári feladatait, az elnök kérésére összehívja az üléseket, valamint elkészíti a napirendet a Testület e rendelet és eljárási szabályzata szerinti feladatainak megfelelően.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_65'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '66',
  null,
  'A Testület feladatai
A Testületnek tanácsadással és segítségnyújtással kell támogatnia Bizottságot és a tagállamokat e rendelet következetes és hatékony alkalmazásának elősegítése érdekében. E célból a Testület különösen:

a)

hozzájárulhat az e rendelet alkalmazásáért felelős illetékes nemzeti hatóságok közötti koordinációhoz, és az érintett piacfelügyeleti hatóságokkal együttműködve és azok beleegyezésével támogathatja a piacfelügyeleti hatóságoknak a 74. cikk (11) bekezdésében említett közös tevékenységeit;

b)

összegyűjtheti és megoszthatja a tagállamok között a műszaki és szabályozási szaktudást és a legjobb gyakorlatokat;

c)

tanácsadást nyújthat e rendelet végrehajtásával kapcsolatban, különösen az általános célú MI-modellekre vonatkozó szabályok végrehajtása tekintetében;

d)

hozzájárulhat a tagállamok közigazgatási gyakorlatainak harmonizálásához, többek között a 46. cikkben említett, a megfelelőségértékelési eljárásoktól való eltéréssel, az MI szabályozói tesztkörnyezetek működésével, valamint az 57., az 59. és a 60. cikkben említett, valós körülmények közötti teszteléssel kapcsolatban;

e)

a Bizottság kérésére vagy saját kezdeményezésére ajánlásokat és írásbeli véleményeket adhat ki az e rendelet végrehajtásával, valamint következetes és hatékony alkalmazásával kapcsolatos bármely releváns kérdésben, beleértve a következőket is:

i.

az e rendelet szerinti magatartási kódexek és gyakorlati kódexek, valamint a Bizottság iránymutatásainak kidolgozása és alkalmazása;

ii.

e rendeletnek a 112. cikk szerinti értékelése és felülvizsgálata, többek között a 73. cikkben említett súlyos váratlan eseményekről szóló jelentések, valamint a 71. cikkben említett uniós adatbázis működése és a felhatalmazáson alapuló jogi aktusok vagy végrehajtási jogi aktusok előkészítése tekintetében, továbbá e rendeletnek az I. mellékletben felsorolt uniós harmonizációs jogszabályokkal való esetleges összehangolása tekintetében;

iii.

a III. fejezet 2. szakaszában meghatározott követelményekre vonatkozó műszaki előírások vagy meglévő szabványok;

iv.

a 40. és a 41. cikkben említett harmonizált szabványok vagy közös előírások használata;

v.

olyan tendenciák, mint például az európai globális versenyképesség a mesterséges intelligencia terén, a mesterséges intelligencia elterjedése az Unióban, valamint a digitális készségek fejlesztése;

vi.

az MI-értékláncok folyamatosan változó tipológiájával, különösen az ebből eredően az elszámoltathatóság tekintetében jelentkező következményekkel kapcsolatos tendenciák;

vii.

a III. melléklet esetlegesen szükséges módosítása a 7. cikkel összhangban, valamint az 5. cikk 112. cikk szerinti esetlegesen szükséges átdolgozása, figyelembe véve a rendelkezésre álló releváns tudományos eredményeket és a legújabb technológiai fejleményeket;

f)

támogathatja a Bizottságot az MI-jártasságnak, valamint az MI-rendszerek használatával kapcsolatos, a nyilvánosságot célzó figyelemfelkeltő tevékenységeknek és az MI-rendszerek használatával kapcsolatos előnyök, kockázatok, biztosítékok, jogok és kötelezettségek megértésének az előmozdításában;

g)

elősegítheti a közös kritériumok kidolgozását, valamint az e rendeletben meghatározott releváns fogalmaknak a piaci szereplők és az illetékes hatóságok általi közös értelmezését, többek között a referenciaértékek kidolgozásához való hozzájárulás által;

h)

adott esetben együttműködhet egyéb uniós intézményekkel, szervekkel és hivatalokkal, valamint érintett uniós szakértői csoportokkal és hálózatokkal, különösen a termékbiztonság, a kiberbiztonság, a verseny, a digitális és médiaszolgáltatások, a pénzügyi szolgáltatások, a fogyasztóvédelem, az adatvédelem és az alapvető jogok védelme területén;

i)

hozzájárulhat a harmadik országok illetékes hatóságaival és a nemzetközi szervezetekkel való hatékony együttműködéshez;

j)

segítheti az illetékes nemzeti hatóságokat és a Bizottságot az e rendelet végrehajtásához szükséges szervezeti és műszaki szakértelem fejlesztésében, többek között azáltal, hogy hozzájárul az e rendelet végrehajtásában részt vevő tagállami személyzet képzési igényeinek felméréséhez;

k)

segítheti az MI-hivatalt abban, hogy támogassa az illetékes nemzeti hatóságokat az MI szabályozói tesztkörnyezetek kialakításában és fejlesztésében, valamint elősegítheti az MI szabályozói tesztkörnyezetek közötti együttműködést és információmegosztást;

l)

hozzájárulhat és megfelelő tanácsadással szolgálhat iránymutatások kidolgozásához;

m)

tanácsot adhat a Bizottságnak az MI-vel kapcsolatos nemzetközi kérdésekkel kapcsolatban;

n)

állásfoglalásokat nyújthat be a Bizottság számára az általános célú MI-modellekre vonatkozó minősített riasztásokról;

o)

állásfoglalásokat kaphat a tagállamoktól az általános célú MI-modellekre vonatkozó minősített riasztásokról, valamint az MI-rendszerek, különösen az általános célú MI-modelleket integráló rendszerek nyomon követésével és végrehajtásával kapcsolatos nemzeti tapasztalatokról és gyakorlatokról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_66'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '67',
  null,
  'Tanácsadó fórum
(1) Létre kell hozni egy tanácsadó fórumot, amelynek feladata, hogy műszaki szakértelmet biztosítson és tanácsadást nyújtson a Testület és a Bizottság számára, valamint hozzájáruljon az e rendelet szerinti feladataik ellátásához.

(2) A tanácsadó fórum tagságában az érdekelt felek kiegyensúlyozottan képviseltetik magukat, beleértve az ipart, az induló vállalkozásokat, a kkv-kat, a civil társadalmat és a tudományos köröket. A tanácsadó fórum tagságának kiegyensúlyozottnak kell lennie a kereskedelmi és nem kereskedelmi érdekek, valamint – a kereskedelmi érdekek kategóriáján belül – a kkv-k és más vállalkozások tekintetében.

(3) A Bizottság a tanácsadó fórum tagjait – a (2) bekezdésben meghatározott szempontokkal összhangban – a mesterséges intelligencia területén elismert szakértelemmel rendelkező érdekelt felek köréből nevezi ki.

(4) A tanácsadó fórum tagjainak megbízatása két évre szól, és legfeljebb négy évvel meghosszabbítható.

(5) Az Alapjogi Ügynökség, az ENISA, az Európai Szabványügyi Bizottság (CEN), az Európai Elektrotechnikai Szabványügyi Bizottság (CENELEC) és az Európai Távközlési Szabványügyi Intézet (ETSI) a tanácsadó fórum állandó tagjai.

(6) A tanácsadó bizottság megállapítja eljárási szabályzatát. Tagjai közül – a (2) bekezdésben meghatározott szempontokkal összhangban – két társelnököt kell választania. A társelnökök megbízatása két évre szól, és egyszer megújítható.

(7) A tanácsadó fórumnak évente legalább két ülést kell tartania. A tanácsadó fórum szakértőket és más érdekelt feleket hívhat meg üléseire.

(8) A tanácsadó fórum a Testület vagy a Bizottság kérésére véleményeket, ajánlásokat és írásbeli észrevételeket dolgozhat ki.

(9) A tanácsadói fórum adott esetben állandó vagy ideiglenes alcsoportokat hozhat létre az e rendelet célkitűzéseivel kapcsolatos konkrét kérdések vizsgálatára.

(10) A tanácsadó fórumnak tevékenységeiről éves jelentést kell készítenie. Ezt a jelentést nyilvánosan hozzáférhetővé kell tenni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_67'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '67',
  '1',
  '(1) Létre kell hozni egy tanácsadó fórumot, amelynek feladata, hogy műszaki szakértelmet biztosítson és tanácsadást nyújtson a Testület és a Bizottság számára, valamint hozzájáruljon az e rendelet szerinti feladataik ellátásához.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_67'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '67',
  '2',
  '(2) A tanácsadó fórum tagságában az érdekelt felek kiegyensúlyozottan képviseltetik magukat, beleértve az ipart, az induló vállalkozásokat, a kkv-kat, a civil társadalmat és a tudományos köröket. A tanácsadó fórum tagságának kiegyensúlyozottnak kell lennie a kereskedelmi és nem kereskedelmi érdekek, valamint – a kereskedelmi érdekek kategóriáján belül – a kkv-k és más vállalkozások tekintetében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_67'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '67',
  '3',
  '(3) A Bizottság a tanácsadó fórum tagjait – a (2) bekezdésben meghatározott szempontokkal összhangban – a mesterséges intelligencia területén elismert szakértelemmel rendelkező érdekelt felek köréből nevezi ki.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_67'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '67',
  '4',
  '(4) A tanácsadó fórum tagjainak megbízatása két évre szól, és legfeljebb négy évvel meghosszabbítható.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_67'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '67',
  '5',
  '(5) Az Alapjogi Ügynökség, az ENISA, az Európai Szabványügyi Bizottság (CEN), az Európai Elektrotechnikai Szabványügyi Bizottság (CENELEC) és az Európai Távközlési Szabványügyi Intézet (ETSI) a tanácsadó fórum állandó tagjai.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_67'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '67',
  '6',
  '(6) A tanácsadó bizottság megállapítja eljárási szabályzatát. Tagjai közül – a (2) bekezdésben meghatározott szempontokkal összhangban – két társelnököt kell választania. A társelnökök megbízatása két évre szól, és egyszer megújítható.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_67'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '67',
  '7',
  '(7) A tanácsadó fórumnak évente legalább két ülést kell tartania. A tanácsadó fórum szakértőket és más érdekelt feleket hívhat meg üléseire.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_67'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '67',
  '8',
  '(8) A tanácsadó fórum a Testület vagy a Bizottság kérésére véleményeket, ajánlásokat és írásbeli észrevételeket dolgozhat ki.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_67'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '67',
  '9',
  '(9) A tanácsadói fórum adott esetben állandó vagy ideiglenes alcsoportokat hozhat létre az e rendelet célkitűzéseivel kapcsolatos konkrét kérdések vizsgálatára.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_67'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '67',
  '10',
  '(10) A tanácsadó fórumnak tevékenységeiről éves jelentést kell készítenie. Ezt a jelentést nyilvánosan hozzáférhetővé kell tenni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_67'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  null,
  'Független szakértők tudományos testülete
(1) A Bizottság végrehajtási jogi aktus útján rendelkezik egy független szakértőkből álló tudományos testület (a továbbiakban: a tudományos testület) létrehozásáról, amely az e rendelet szerinti végrehajtási tevékenységek támogatására hivatott. Ezt a végrehajtási jogi aktust a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.

(2) A tudományos testület olyan szakértőkből áll, akiket a Bizottság választ ki az MI területén meglévő, a (3) bekezdésben meghatározott feladatok ellátásához szükséges naprakész tudományos vagy műszaki szakértelem alapján, és a testület képes bizonyítani, hogy a következő feltételek mindegyikének megfelel:

a)

különleges szakértelemmel és alkalmassággal, valamint tudományos vagy műszaki szakértelemmel rendelkezik az MI területén;

b)

független az MI-rendszerek vagy az általános célú MI-modellek bármely szolgáltatójától;

c)

képes gondosan, pontosan és objektíven végezni tevékenységeit.

A Bizottság – a Testülettel konzultálva – az igényeknek megfelelően állapítja meg a testületben részt vevő szakértők számát, és biztosítja a méltányos nemek szerinti és földrajzi képviseletet.

(3) A tudományos testület tanácsadást és támogatást kell nyújt az MI-hivatal számára, különösen a következő feladatok tekintetében:

a)

e rendelet végrehajtásának és érvényesítésének támogatása az általános célú MI-modellek és -rendszerek tekintetében, különösen a következők révén:

i.

az MI-hivatal figyelmeztetése az általános célú MI-modellek Uniós szinten lehetséges rendszerszintű kockázataira a 90. cikkel összhangban;

ii.

hozzájárulás az általános célú MI-modellek és -rendszerek képességeinek – többek között referenciaértékek révén történő – értékelésére szolgáló eszközök és módszerek kifejlesztéséhez;

iii.

tanácsadás nyújtása a rendszerszintű kockázatot jelentő általános célú MI-modellek besorolásával kapcsolatban;

iv.

tanácsadás nyújtása különböző általános célú MI-modellek és -rendszerek besorolásával kapcsolatban;

v.

hozzájárulás eszközök és minták kidolgozásához;

b)

a piacfelügyeleti hatóságok kérésére a munkájuk támogatása;

c)

a piacfelügyeleti hatóságok hatásköreinek sérelme nélkül a 74. cikk (11) bekezdésében említett, határokon átnyúló piacfelügyeleti tevékenységek támogatása;

d)

az MI-hivatal támogatása feladatainak ellátásában a 81. cikk szerinti uniós védintézkedési eljárással összefüggésben.

(4) A tudományos testületben részt vevő szakértőknek feladataikat pártatlanul és objektíven kell ellátniuk, továbbá biztosítaniuk kell a feladataik és tevékenységeik végzése során szerzett információk és adatok bizalmas jellegét. A (3) bekezdés szerinti feladataik ellátása során senkitől sem kérhetnek vagy fogadhatnak el utasításokat. Minden szakértőnek érdekeltségi nyilatkozatot kell tennie, amelyet nyilvánosan hozzáférhetővé kell tenni. Az MI-hivatal rendszereket és eljárásokat hoz létre a potenciális összeférhetetlenségek aktív kezelésére és megelőzésére.

(5) Az (1) bekezdésben említett végrehajtási jogi aktusnak rendelkezéseket kell tartalmaznia azon feltételekre, eljárásokra és részletes szabályokra vonatkozóan, amelyek alapján a tudományos testület és tagjai riasztásokat bocsáthatnak ki, és kérhetik az MI-hivatal segítségét a tudományos testület feladatainak ellátásához.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  '1',
  '(1) A Bizottság végrehajtási jogi aktus útján rendelkezik egy független szakértőkből álló tudományos testület (a továbbiakban: a tudományos testület) létrehozásáról, amely az e rendelet szerinti végrehajtási tevékenységek támogatására hivatott. Ezt a végrehajtási jogi aktust a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  '2',
  '(2) A tudományos testület olyan szakértőkből áll, akiket a Bizottság választ ki az MI területén meglévő, a (3) bekezdésben meghatározott feladatok ellátásához szükséges naprakész tudományos vagy műszaki szakértelem alapján, és a testület képes bizonyítani, hogy a következő feltételek mindegyikének megfelel:

a)

különleges szakértelemmel és alkalmassággal, valamint tudományos vagy műszaki szakértelemmel rendelkezik az MI területén;

b)

független az MI-rendszerek vagy az általános célú MI-modellek bármely szolgáltatójától;

c)

képes gondosan, pontosan és objektíven végezni tevékenységeit.

A Bizottság – a Testülettel konzultálva – az igényeknek megfelelően állapítja meg a testületben részt vevő szakértők számát, és biztosítja a méltányos nemek szerinti és földrajzi képviseletet.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  '2(a)',
  'a) különleges szakértelemmel és alkalmassággal, valamint tudományos vagy műszaki szakértelemmel rendelkezik az MI területén;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  '2(b)',
  'b) független az MI-rendszerek vagy az általános célú MI-modellek bármely szolgáltatójától;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  '2(c)',
  'c) képes gondosan, pontosan és objektíven végezni tevékenységeit.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  '3',
  '(3) A tudományos testület tanácsadást és támogatást kell nyújt az MI-hivatal számára, különösen a következő feladatok tekintetében:

a)

e rendelet végrehajtásának és érvényesítésének támogatása az általános célú MI-modellek és -rendszerek tekintetében, különösen a következők révén:

i.

az MI-hivatal figyelmeztetése az általános célú MI-modellek Uniós szinten lehetséges rendszerszintű kockázataira a 90. cikkel összhangban;

ii.

hozzájárulás az általános célú MI-modellek és -rendszerek képességeinek – többek között referenciaértékek révén történő – értékelésére szolgáló eszközök és módszerek kifejlesztéséhez;

iii.

tanácsadás nyújtása a rendszerszintű kockázatot jelentő általános célú MI-modellek besorolásával kapcsolatban;

iv.

tanácsadás nyújtása különböző általános célú MI-modellek és -rendszerek besorolásával kapcsolatban;

v.

hozzájárulás eszközök és minták kidolgozásához;

b)

a piacfelügyeleti hatóságok kérésére a munkájuk támogatása;

c)

a piacfelügyeleti hatóságok hatásköreinek sérelme nélkül a 74. cikk (11) bekezdésében említett, határokon átnyúló piacfelügyeleti tevékenységek támogatása;

d)

az MI-hivatal támogatása feladatainak ellátásában a 81. cikk szerinti uniós védintézkedési eljárással összefüggésben.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  '3(a)',
  'a) e rendelet végrehajtásának és érvényesítésének támogatása az általános célú MI-modellek és -rendszerek tekintetében, különösen a következők révén:

i.

az MI-hivatal figyelmeztetése az általános célú MI-modellek Uniós szinten lehetséges rendszerszintű kockázataira a 90. cikkel összhangban;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  '3(b)',
  'b) a piacfelügyeleti hatóságok kérésére a munkájuk támogatása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  '3(c)',
  'c) a piacfelügyeleti hatóságok hatásköreinek sérelme nélkül a 74. cikk (11) bekezdésében említett, határokon átnyúló piacfelügyeleti tevékenységek támogatása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  '3(d)',
  'd) az MI-hivatal támogatása feladatainak ellátásában a 81. cikk szerinti uniós védintézkedési eljárással összefüggésben.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  '4',
  '(4) A tudományos testületben részt vevő szakértőknek feladataikat pártatlanul és objektíven kell ellátniuk, továbbá biztosítaniuk kell a feladataik és tevékenységeik végzése során szerzett információk és adatok bizalmas jellegét. A (3) bekezdés szerinti feladataik ellátása során senkitől sem kérhetnek vagy fogadhatnak el utasításokat. Minden szakértőnek érdekeltségi nyilatkozatot kell tennie, amelyet nyilvánosan hozzáférhetővé kell tenni. Az MI-hivatal rendszereket és eljárásokat hoz létre a potenciális összeférhetetlenségek aktív kezelésére és megelőzésére.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '68',
  '5',
  '(5) Az (1) bekezdésben említett végrehajtási jogi aktusnak rendelkezéseket kell tartalmaznia azon feltételekre, eljárásokra és részletes szabályokra vonatkozóan, amelyek alapján a tudományos testület és tagjai riasztásokat bocsáthatnak ki, és kérhetik az MI-hivatal segítségét a tudományos testület feladatainak ellátásához.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_68'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '69',
  null,
  'Tagállami hozzáférés a szakértők állományához
(1) A tagállamok felkérhetik a tudományos testület szakértőit, hogy nyújtsanak támogatást az e rendelet szerinti végrehajtási tevékenységeikhez.

(2) A tagállamok kötelezhetők arra, hogy a szakértők által nyújtott tanácsadásért és támogatásért díjat fizessenek. A díjak szerkezetére és összegére, valamint a megtérítendő költségek mértékére és szerkezetére vonatkozó rendelkezéseket a 68. cikk (1) bekezdésben említett végrehajtási jogi aktusban kell meghatározni, szem előtt tartva e rendelet megfelelő végrehajtásának célkitűzéseit, a költséghatékonyságot és annak szükségességét, hogy valamennyi tagállam ténylegesen igénybe vehesse a szakértők segítségét.

(3) A Bizottság szükség esetén elősegíti, hogy a tagállamok megfelelő időben igénybe vehessék a szakértők segítségét, és biztosítja az uniós vizsgálóhelyek által a 84. cikk szerint, illetve a szakértők által e cikk szerint végzett támogató tevékenységek kombinációjának hatékony megszervezését, illetve hogy e kombináció a lehető legtöbb hozzáadott értéket nyújtsa.

2. SZAKASZ

Illetékes nemzeti hatóságok',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_69'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '69',
  '1',
  '(1) A tagállamok felkérhetik a tudományos testület szakértőit, hogy nyújtsanak támogatást az e rendelet szerinti végrehajtási tevékenységeikhez.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_69'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '69',
  '2',
  '(2) A tagállamok kötelezhetők arra, hogy a szakértők által nyújtott tanácsadásért és támogatásért díjat fizessenek. A díjak szerkezetére és összegére, valamint a megtérítendő költségek mértékére és szerkezetére vonatkozó rendelkezéseket a 68. cikk (1) bekezdésben említett végrehajtási jogi aktusban kell meghatározni, szem előtt tartva e rendelet megfelelő végrehajtásának célkitűzéseit, a költséghatékonyságot és annak szükségességét, hogy valamennyi tagállam ténylegesen igénybe vehesse a szakértők segítségét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_69'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '69',
  '3',
  '(3) A Bizottság szükség esetén elősegíti, hogy a tagállamok megfelelő időben igénybe vehessék a szakértők segítségét, és biztosítja az uniós vizsgálóhelyek által a 84. cikk szerint, illetve a szakértők által e cikk szerint végzett támogató tevékenységek kombinációjának hatékony megszervezését, illetve hogy e kombináció a lehető legtöbb hozzáadott értéket nyújtsa.

2. SZAKASZ

Illetékes nemzeti hatóságok',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_69'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '70',
  null,
  'Az illetékes nemzeti hatóságok és az egyedüli kapcsolattartó pontok kijelölése
(1) Minden tagállam legalább egy bejelentő hatóságot és legalább egy piacfelügyeleti hatóságot hoz létre vagy jelöl ki illetékes nemzeti hatóságként e rendelet végrehajtásának céljából. Az említett illetékes nemzeti hatóságoknak hatásköreiket függetlenül, pártatlanul és elfogulatlanul kell gyakorolniuk, hogy megőrizzék tevékenységeik és feladataik objektivitását, és biztosítsák e rendelet alkalmazását és végrehajtását. Az említett hatóságok tagjainak tartózkodniuk kell minden, a feladataikkal összeférhetetlen intézkedéstől. Feltéve, hogy az említett elveket tiszteletben tartják, az ilyen tevékenységeket és feladatokat – a tagállam szervezeti igényeinek megfelelően – egy vagy több kijelölt hatóság is elláthatja.

(2) A tagállamok közlik a Bizottsággal a bejelentő hatóságok és a piacfelügyeleti hatóságok nevét és e hatóságok feladatait, valamint az ezekkel kapcsolatos minden későbbi változást. A tagállamok 2025. augusztus 2-ig nyilvánosan hozzáférhetővé teszik az illetékes hatóságokkal és az egyedüli kapcsolattartó pontokkal való, elektronikus kommunikációs eszközök útján történő kapcsolatfelvétel módjára vonatkozó információkat. A tagállamok kijelölik a piacfelügyeleti hatóságot, hogy e rendelet tekintetében egyedüli kapcsolattartó pontként járjon el, és bejelentik a Bizottságnál az egyedüli kapcsolattartó pont nevét. A Bizottság létrehozza az egyedüli kapcsolattartó pontok nyilvánosan elérhető jegyzékét.

(3) A tagállamok biztosítják, hogy illetékes nemzeti hatóságaik megfelelő technikai, pénzügyi és emberi erőforrásokkal, valamint infrastruktúrával rendelkezzenek az e rendelet szerinti feladataik hatékony ellátásához. Így különösen, az illetékes nemzeti hatóságoknak elegendő számú, tartósan rendelkezésre álló munkatárssal kell rendelkezniük, akiknek a kompetenciái és szakértelme kitejed az MI-technológiák, az adatok és az adatszámítás, a személyes adatok védelme, a kiberbiztonság, az alapvető jogok, az egészségügyi és biztonsági kockázatok alapos megértésére, valamint a meglévő szabványok és jogi követelmények ismeretére. A tagállamok évente értékelik, és szükség esetén frissítik az e bekezdésben említett kompetencia- és erőforrás-követelményeket.

(4) Az illetékes nemzeti hatóságok megfelelő intézkedéseket hoznak, hogy megfelelő szintű kiberbiztonságot biztosítsanak.

(5) Feladataik ellátása során az illetékes nemzeti hatóságoknak a 78. cikkben meghatározott titoktartási kötelezettségeknek megfelelően kell eljárniuk.

(6) A tagállamok 2025. augusztus 2-ig, majd azt követően kétévente egyszer jelentést tesznek a Bizottságnak az illetékes nemzeti hatóságok pénzügyi erőforrásainak, műszaki felszereléseinek és emberi erőforrásainak helyzetéről, és értékelik azok megfelelőségét. A Bizottság ezeket az információkat megvitatás és esetleges ajánlások céljából továbbítja a Testületnek.

(7) A Bizottság elősegíti az illetékes nemzeti hatóságok közötti tapasztalatcserét.

(8) Az illetékes nemzeti hatóságok iránymutatást és tanácsot adhatnak e rendelet végrehajtásával kapcsolatban, különösen a kkv-knak, köztük az induló innovatív vállalkozásoknak, adott esetben figyelembe véve a Testület és a Bizottság iránymutatását és tanácsait. Amennyiben az illetékes nemzeti hatóságok egyéb uniós jog hatálya alá tartozó területeken kívánnak iránymutatást és tanácsot adni valamely MI-rendszerrel kapcsolatban, adott esetben konzultálniuk kell az említett uniós jogszabályok szerinti illetékes nemzeti hatóságokkal.

(9) Amennyiben az uniós intézmények, szervek, hivatalok vagy ügynökségek e rendelet hatálya alá tartoznak, a felügyeletük tekintetében az európai adatvédelmi biztos jár el illetékes hatóságként.

VIII. FEJEZET

A NAGY KOCKÁZATÚ MI-RENDSZEREK UNIÓS ADATBÁZISA',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '70',
  '1',
  '(1) Minden tagállam legalább egy bejelentő hatóságot és legalább egy piacfelügyeleti hatóságot hoz létre vagy jelöl ki illetékes nemzeti hatóságként e rendelet végrehajtásának céljából. Az említett illetékes nemzeti hatóságoknak hatásköreiket függetlenül, pártatlanul és elfogulatlanul kell gyakorolniuk, hogy megőrizzék tevékenységeik és feladataik objektivitását, és biztosítsák e rendelet alkalmazását és végrehajtását. Az említett hatóságok tagjainak tartózkodniuk kell minden, a feladataikkal összeférhetetlen intézkedéstől. Feltéve, hogy az említett elveket tiszteletben tartják, az ilyen tevékenységeket és feladatokat – a tagállam szervezeti igényeinek megfelelően – egy vagy több kijelölt hatóság is elláthatja.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '70',
  '2',
  '(2) A tagállamok közlik a Bizottsággal a bejelentő hatóságok és a piacfelügyeleti hatóságok nevét és e hatóságok feladatait, valamint az ezekkel kapcsolatos minden későbbi változást. A tagállamok 2025. augusztus 2-ig nyilvánosan hozzáférhetővé teszik az illetékes hatóságokkal és az egyedüli kapcsolattartó pontokkal való, elektronikus kommunikációs eszközök útján történő kapcsolatfelvétel módjára vonatkozó információkat. A tagállamok kijelölik a piacfelügyeleti hatóságot, hogy e rendelet tekintetében egyedüli kapcsolattartó pontként járjon el, és bejelentik a Bizottságnál az egyedüli kapcsolattartó pont nevét. A Bizottság létrehozza az egyedüli kapcsolattartó pontok nyilvánosan elérhető jegyzékét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '70',
  '3',
  '(3) A tagállamok biztosítják, hogy illetékes nemzeti hatóságaik megfelelő technikai, pénzügyi és emberi erőforrásokkal, valamint infrastruktúrával rendelkezzenek az e rendelet szerinti feladataik hatékony ellátásához. Így különösen, az illetékes nemzeti hatóságoknak elegendő számú, tartósan rendelkezésre álló munkatárssal kell rendelkezniük, akiknek a kompetenciái és szakértelme kitejed az MI-technológiák, az adatok és az adatszámítás, a személyes adatok védelme, a kiberbiztonság, az alapvető jogok, az egészségügyi és biztonsági kockázatok alapos megértésére, valamint a meglévő szabványok és jogi követelmények ismeretére. A tagállamok évente értékelik, és szükség esetén frissítik az e bekezdésben említett kompetencia- és erőforrás-követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '70',
  '4',
  '(4) Az illetékes nemzeti hatóságok megfelelő intézkedéseket hoznak, hogy megfelelő szintű kiberbiztonságot biztosítsanak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '70',
  '5',
  '(5) Feladataik ellátása során az illetékes nemzeti hatóságoknak a 78. cikkben meghatározott titoktartási kötelezettségeknek megfelelően kell eljárniuk.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '70',
  '6',
  '(6) A tagállamok 2025. augusztus 2-ig, majd azt követően kétévente egyszer jelentést tesznek a Bizottságnak az illetékes nemzeti hatóságok pénzügyi erőforrásainak, műszaki felszereléseinek és emberi erőforrásainak helyzetéről, és értékelik azok megfelelőségét. A Bizottság ezeket az információkat megvitatás és esetleges ajánlások céljából továbbítja a Testületnek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '70',
  '7',
  '(7) A Bizottság elősegíti az illetékes nemzeti hatóságok közötti tapasztalatcserét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '70',
  '8',
  '(8) Az illetékes nemzeti hatóságok iránymutatást és tanácsot adhatnak e rendelet végrehajtásával kapcsolatban, különösen a kkv-knak, köztük az induló innovatív vállalkozásoknak, adott esetben figyelembe véve a Testület és a Bizottság iránymutatását és tanácsait. Amennyiben az illetékes nemzeti hatóságok egyéb uniós jog hatálya alá tartozó területeken kívánnak iránymutatást és tanácsot adni valamely MI-rendszerrel kapcsolatban, adott esetben konzultálniuk kell az említett uniós jogszabályok szerinti illetékes nemzeti hatóságokkal.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '70',
  '9',
  '(9) Amennyiben az uniós intézmények, szervek, hivatalok vagy ügynökségek e rendelet hatálya alá tartoznak, a felügyeletük tekintetében az európai adatvédelmi biztos jár el illetékes hatóságként.

VIII. FEJEZET

A NAGY KOCKÁZATÚ MI-RENDSZEREK UNIÓS ADATBÁZISA',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_70'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '71',
  null,
  'A III. mellékletben felsorolt nagy kockázatú MI-rendszerek uniós adatbázisa
(1) A Bizottság a tagállamokkal együttműködve uniós adatbázist hoz létre és tart fenn, amely az e cikk (2) és (3) bekezdésben említett információkat tartalmazza a 49. és a 60. cikknek megfelelően regisztrált, a 6. cikk (2) bekezdésében említett nagy kockázatú MI-rendszerekre, valamint a 6. cikk (3) bekezdése alapján nagy kockázatúnak nem tekintett és a 6. cikk (4) bekezdésének és a 49. cikknek megfelelően regisztrált MI-rendszerekre vonatkozóan. Egy ilyen adatbázis funkcionális jellemzőinek meghatározásakor a Bizottság konzultál a releváns szakértőkkel, és az ilyen adatbázis funkcionális jellemzőinek frissítésekor a Bizottság a Testülettel konzultál.

(2) A VIII. melléklet A. és B. szakaszában felsorolt adatokat a szolgáltatóknak vagy adott esetben a meghatalmazott képviselőnek kell bevinnie az uniós adatbázisba.

(3) A VIII. melléklet C. szakaszában felsorolt adatokat azon alkalmazónak kell bevinnie az uniós adatbázisba a 49. cikk (3) és (4) bekezdésével összhangban, aki hatóság, ügynökség vagy szerv, illetve hatóság, ügynökség vagy szerv nevében jár el.

(4) A 49. cikk (4) bekezdésében és a 60. cikk (4) bekezdésének c) pontjában említett szakasz kivételével az uniós adatbázisban szereplő, a 49. cikkel összhangban rögzített információknak felhasználóbarát módon hozzáférhetőnek és nyilvánosan elérhetőnek kell lenniük. Az információknak könnyen navigálhatónak és géppel olvashatónak kell lenniük. A 60. cikkel összhangban rögzített információkhoz csak a piacfelügyeleti hatóságok és a Bizottság férhetnek hozzá, kivéve, ha a leendő szolgáltató vagy a szolgáltató hozzájárulását adta ahhoz, hogy az információkat a nyilvánosság számára is hozzáférhetővé tegyék.

(5) Az uniós adatbázis csak annyiban tartalmazhat személyes adatokat, amennyiben arra az e rendelettel összhangban történő információgyűjtéshez és -kezeléshez szükség van. Az említett információknak tartalmazniuk kell azon természetes személyek nevét és elérhetőségét, akik a rendszer regisztrálásáért felelnek, valamint jogosultak a szolgáltató vagy – adott esetben -- az alkalmazó képviseletére.

(6) Az uniós adatbázist a Bizottság felügyeli. Megfelelő műszaki és adminisztratív támogatást biztosít a szolgáltatók, a leendő szolgáltatók és az alkalmazók számára. Az uniós adatbázisnak meg kell felelnie az alkalmazandó akadálymentesítési követelményeknek.

IX. FEJEZET

FORGALOMBA HOZATAL UTÁNI NYOMON KÖVETÉS, INFORMÁCIÓMEGOSZTÁS ÉS PIACFELÜGYELET

1. SZAKASZ

Forgalomba hozatal utáni nyomon követés',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_71'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '71',
  '1',
  '(1) A Bizottság a tagállamokkal együttműködve uniós adatbázist hoz létre és tart fenn, amely az e cikk (2) és (3) bekezdésben említett információkat tartalmazza a 49. és a 60. cikknek megfelelően regisztrált, a 6. cikk (2) bekezdésében említett nagy kockázatú MI-rendszerekre, valamint a 6. cikk (3) bekezdése alapján nagy kockázatúnak nem tekintett és a 6. cikk (4) bekezdésének és a 49. cikknek megfelelően regisztrált MI-rendszerekre vonatkozóan. Egy ilyen adatbázis funkcionális jellemzőinek meghatározásakor a Bizottság konzultál a releváns szakértőkkel, és az ilyen adatbázis funkcionális jellemzőinek frissítésekor a Bizottság a Testülettel konzultál.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_71'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '71',
  '2',
  '(2) A VIII. melléklet A. és B. szakaszában felsorolt adatokat a szolgáltatóknak vagy adott esetben a meghatalmazott képviselőnek kell bevinnie az uniós adatbázisba.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_71'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '71',
  '3',
  '(3) A VIII. melléklet C. szakaszában felsorolt adatokat azon alkalmazónak kell bevinnie az uniós adatbázisba a 49. cikk (3) és (4) bekezdésével összhangban, aki hatóság, ügynökség vagy szerv, illetve hatóság, ügynökség vagy szerv nevében jár el.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_71'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '71',
  '4',
  '(4) A 49. cikk (4) bekezdésében és a 60. cikk (4) bekezdésének c) pontjában említett szakasz kivételével az uniós adatbázisban szereplő, a 49. cikkel összhangban rögzített információknak felhasználóbarát módon hozzáférhetőnek és nyilvánosan elérhetőnek kell lenniük. Az információknak könnyen navigálhatónak és géppel olvashatónak kell lenniük. A 60. cikkel összhangban rögzített információkhoz csak a piacfelügyeleti hatóságok és a Bizottság férhetnek hozzá, kivéve, ha a leendő szolgáltató vagy a szolgáltató hozzájárulását adta ahhoz, hogy az információkat a nyilvánosság számára is hozzáférhetővé tegyék.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_71'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '71',
  '5',
  '(5) Az uniós adatbázis csak annyiban tartalmazhat személyes adatokat, amennyiben arra az e rendelettel összhangban történő információgyűjtéshez és -kezeléshez szükség van. Az említett információknak tartalmazniuk kell azon természetes személyek nevét és elérhetőségét, akik a rendszer regisztrálásáért felelnek, valamint jogosultak a szolgáltató vagy – adott esetben -- az alkalmazó képviseletére.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_71'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '71',
  '6',
  '(6) Az uniós adatbázist a Bizottság felügyeli. Megfelelő műszaki és adminisztratív támogatást biztosít a szolgáltatók, a leendő szolgáltatók és az alkalmazók számára. Az uniós adatbázisnak meg kell felelnie az alkalmazandó akadálymentesítési követelményeknek.

IX. FEJEZET

FORGALOMBA HOZATAL UTÁNI NYOMON KÖVETÉS, INFORMÁCIÓMEGOSZTÁS ÉS PIACFELÜGYELET

1. SZAKASZ

Forgalomba hozatal utáni nyomon követés',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_71'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '72',
  null,
  'A szolgáltató által végzett, forgalomba hozatal utáni nyomon követés és a nagy kockázatú MI-rendszerekre vonatkozó, forgalomba hozatal utáni nyomonkövetési terv
(1) A szolgáltatóknak az MI-technológiák jellegével és a nagy kockázatú MI-rendszer kockázataival arányos módon forgalomba hozatal utáni nyomonkövetési rendszert kell létrehozniuk, és azt dokumentálniuk kell.

(2) A forgalomba hozatal utáni nyomonkövetési rendszernek aktívan és szisztematikusan gyűjtenie, dokumentálnia és elemeznie kell az adott esetben az alkalmazók által szolgáltatott, vagy más forrásokból származó, a nagy kockázatú MI-rendszerek teljes élettartamuk során mutatott teljesítményére vonatkozó releváns adatokat, amelyek lehetővé teszik a szolgáltató számára annak értékelését, hogy az MI-rendszerek folyamatosan megfelelnek-e a III. fejezet 2. szakaszában meghatározott követelményeknek. A forgalomba hozatal utáni nyomon követésnek adott esetben magában kell foglalnia az egyéb MI-rendszerekkel való kölcsönhatás elemzését. Ez a kötelezettség nem terjedhet ki azon alkalmazók érzékeny operatív adataira, amelyek bűnüldöző hatóságok.

(3) A forgalomba hozatal utáni nyomonkövetési rendszernek egy forgalomba hozatal utáni nyomonkövetési terven kell alapulnia. A forgalomba hozatal utáni nyomonkövetési tervnek a IV. mellékletben említett műszaki dokumentáció részét kell képeznie. A Bizottság 2026. február 2-ig végrehajtási jogi aktust fogad el, amelyben megállapítja a forgalomba hozatal utáni nyomonkövetési terv mintáját meghatározó részletes rendelkezéseket és a tervben feltüntetendő elemek jegyzékét. Ezt a végrehajtási jogi aktust a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.

(4) Az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó nagy kockázatú MI-rendszerek esetében, amennyiben az említett jogszabályok alapján már létrehoztak egy forgalomba hozatal utáni nyomonkövetési rendszert és tervet, a következetesség biztosítása, az átfedések elkerülése és a további terhek minimalizálása érdekében a szolgáltatók dönthetnek úgy, hogy adott esetben a (3) bekezdésben említett minta felhasználásával integrálják az (1), a (2) és a (3) bekezdésben ismertetett szükséges elemeket az említett jogszabályok alapján már meglévő rendszerekbe és tervekbe, feltéve, hogy az egyenértékű szintű védelmet ér el.

Az e bekezdés első albekezdése a III. melléklet 5. pontjában említett azon, nagy kockázatú MI-rendszerekre is alkalmazandó, amelyeket olyan pénzügyi intézmények hoznak forgalomba vagy helyeznek üzembe, amelyek a pénzügyi szolgáltatásokra vonatkozó uniós jog értelmében a belső irányításukra, szabályaikra vagy eljárásaikra vonatkozó követelmények hatálya alá tartoznak.

2. SZAKASZ

A súlyos váratlan eseményekre vonatkozó információk megosztása',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_72'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '72',
  '1',
  '(1) A szolgáltatóknak az MI-technológiák jellegével és a nagy kockázatú MI-rendszer kockázataival arányos módon forgalomba hozatal utáni nyomonkövetési rendszert kell létrehozniuk, és azt dokumentálniuk kell.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_72'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '72',
  '2',
  '(2) A forgalomba hozatal utáni nyomonkövetési rendszernek aktívan és szisztematikusan gyűjtenie, dokumentálnia és elemeznie kell az adott esetben az alkalmazók által szolgáltatott, vagy más forrásokból származó, a nagy kockázatú MI-rendszerek teljes élettartamuk során mutatott teljesítményére vonatkozó releváns adatokat, amelyek lehetővé teszik a szolgáltató számára annak értékelését, hogy az MI-rendszerek folyamatosan megfelelnek-e a III. fejezet 2. szakaszában meghatározott követelményeknek. A forgalomba hozatal utáni nyomon követésnek adott esetben magában kell foglalnia az egyéb MI-rendszerekkel való kölcsönhatás elemzését. Ez a kötelezettség nem terjedhet ki azon alkalmazók érzékeny operatív adataira, amelyek bűnüldöző hatóságok.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_72'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '72',
  '3',
  '(3) A forgalomba hozatal utáni nyomonkövetési rendszernek egy forgalomba hozatal utáni nyomonkövetési terven kell alapulnia. A forgalomba hozatal utáni nyomonkövetési tervnek a IV. mellékletben említett műszaki dokumentáció részét kell képeznie. A Bizottság 2026. február 2-ig végrehajtási jogi aktust fogad el, amelyben megállapítja a forgalomba hozatal utáni nyomonkövetési terv mintáját meghatározó részletes rendelkezéseket és a tervben feltüntetendő elemek jegyzékét. Ezt a végrehajtási jogi aktust a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_72'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '72',
  '4',
  '(4) Az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó nagy kockázatú MI-rendszerek esetében, amennyiben az említett jogszabályok alapján már létrehoztak egy forgalomba hozatal utáni nyomonkövetési rendszert és tervet, a következetesség biztosítása, az átfedések elkerülése és a további terhek minimalizálása érdekében a szolgáltatók dönthetnek úgy, hogy adott esetben a (3) bekezdésben említett minta felhasználásával integrálják az (1), a (2) és a (3) bekezdésben ismertetett szükséges elemeket az említett jogszabályok alapján már meglévő rendszerekbe és tervekbe, feltéve, hogy az egyenértékű szintű védelmet ér el.

Az e bekezdés első albekezdése a III. melléklet 5. pontjában említett azon, nagy kockázatú MI-rendszerekre is alkalmazandó, amelyeket olyan pénzügyi intézmények hoznak forgalomba vagy helyeznek üzembe, amelyek a pénzügyi szolgáltatásokra vonatkozó uniós jog értelmében a belső irányításukra, szabályaikra vagy eljárásaikra vonatkozó követelmények hatálya alá tartoznak.

2. SZAKASZ

A súlyos váratlan eseményekre vonatkozó információk megosztása',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_72'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '73',
  null,
  'A súlyos váratlan események bejelentése
(1) Az uniós piacon forgalomba hozott nagy kockázatú MI-rendszerek szolgáltatóinak minden súlyos váratlan eseményt be kell jelenteniük azon tagállamok piacfelügyeleti hatóságainak, ahol az esemény történt.

(2) Az (1) bekezdésben említett bejelentést haladéktalanul meg kell tenni azt követően, hogy a szolgáltató megállapította az MI-rendszer és a súlyos váratlan esemény közötti ok-okozati összefüggést vagy az ilyen összefüggés észszerű valószínűségét, de legkésőbb 15 nappal azt követően, hogy a szolgáltató, vagy adott esetben az alkalmazó tudomást szerzett a súlyos váratlan eseményről.

Az első albekezdésben említett bejelentésre nyitva álló időszak meghatározása során figyelembe kell venni a súlyos váratlan esemény súlyosságát.

(3) E cikk (2) bekezdésétől eltérve, a kiterjedt jogsértés vagy a 3. cikk 49. pontjának b) alpontjában meghatározott súlyos váratlan esemény esetén az e cikk (1) bekezdésében említett bejelentést haladéktalanul, de legkésőbb két nappal azt követően meg kell tenni, hogy a szolgáltató vagy adott esetben az alkalmazó tudomást szerzett az eseményről.

(4) A (2) bekezdéstől eltérve, valamely személy halála esetén a bejelentést haladéktalanul meg kell tenni azt követően, hogy a szolgáltató vagy az alkalmazó megállapította a nagy kockázatú MI-rendszer és a súlyos váratlan esemény közötti ok-okozati összefüggést, vagy amint feltételezi azt, de legkésőbb 10 nappal azt követően, hogy a szolgáltató vagy adott esetben az alkalmazó tudomást szerzett a súlyos váratlan eseményről.

(5) Amennyiben az időben történő bejelentés biztosításához szükséges, a szolgáltató vagy adott esetben az alkalmazó nem teljes körű, előzetes bejelentést, majd ezt követően teljes körű bejelentést tehet.

(6) A súlyos váratlan esemény (1) bekezdés szerinti bejelentését követően a szolgáltatónak haladéktalanul el kell végeznie a súlyos váratlan eseménnyel és az érintett MI-rendszerrel kapcsolatos szükséges vizsgálatokat. Ennek magában kell foglalnia az esemény kockázatértékelését és a korrekciós intézkedéseket.

A szolgáltatónak az első albekezdésben említett vizsgálatok során együtt kell működnie az illetékes hatóságokkal és adott esetben az érintett bejelentett szervezettel, továbbá a szolgáltató – az illetékes hatóságok ilyen intézkedésről való tájékoztatását megelőzően – nem végezhet olyan vizsgálatot, amely magában foglalja az érintett MI-rendszer oly módon történő megváltoztatását, amely hatással lehet az esemény okainak későbbi értékelésére.

(7) A 3. cikk 49. pontjának c) alpontjában említett súlyos váratlan eseménnyel kapcsolatos értesítés kézhezvételét követően a releváns piacfelügyeleti hatóságnak tájékoztatnia kell a 77. cikk (1) bekezdésében említett nemzeti hatóságokat vagy szerveket. A Bizottság célzott iránymutatást dolgoz ki az e cikk (1) bekezdésben meghatározott kötelezettségeknek való megfelelés elősegítése érdekében. Az említett iránymutatást 2025. augusztus 2-ig kell kiadni, és rendszeresen értékelni kell.

(8) A piacfelügyeleti hatóságnak az e cikk (1) bekezdésében említett értesítés kézhezvételétől számított hét napon belül meg kell hoznia az (EU) 2019/1020 rendelet 19. cikkében előírt megfelelő intézkedéseket, továbbá követnie kell az említett rendeletben előírt értesítési eljárásokat.

(9) A III. mellékletben említett azon nagy kockázatú MI-rendszerek esetében, amelyeket olyan szolgáltatók hoznak forgalomba vagy helyeznek üzembe, amelyek az e rendeletben meghatározottakkal egyenértékű jelentéstételi követelményeket megállapító uniós jogalkotási eszközök hatálya alá tartoznak, a súlyos váratlan esemény bejelentésére vonatkozó kötelezettségnek a 3. cikk 49. pontjának c) alpontjában említett eseményekre kell korlátozódnia.

(10) Az olyan nagy kockázatú MI-rendszerek esetében, amelyek az (EU) 2017/745 rendelet és az (EU) 2017/746 rendelet hatálya alá tartozó eszközök biztonsági alkotórészei vagy maguk is eszközök, a súlyos váratlan események bejelentésére vonatkozó kötelezettségnek az e rendelet 3. cikke 49. pontjának c) alpontjában említett eseményekre kell korlátozódnia, és az értesítést a váratlan esemény bekövetkeztének helye szerinti tagállam által az adott célra kiválasztott illetékes nemzeti hatóságnak kell megküldeni.

(11) Az illetékes nemzeti hatóságoknak az (EU) 2019/1020 rendelet 20. cikkével összhangban haladéktalanul értesíteniük kell a Bizottságot minden súlyos váratlan eseményről, függetlenül attól, hogy hoztak-e intézkedéseket az eseménnyel kapcsolatban.

3. SZAKASZ

Végrehajtás',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '73',
  '1',
  '(1) Az uniós piacon forgalomba hozott nagy kockázatú MI-rendszerek szolgáltatóinak minden súlyos váratlan eseményt be kell jelenteniük azon tagállamok piacfelügyeleti hatóságainak, ahol az esemény történt.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '73',
  '2',
  '(2) Az (1) bekezdésben említett bejelentést haladéktalanul meg kell tenni azt követően, hogy a szolgáltató megállapította az MI-rendszer és a súlyos váratlan esemény közötti ok-okozati összefüggést vagy az ilyen összefüggés észszerű valószínűségét, de legkésőbb 15 nappal azt követően, hogy a szolgáltató, vagy adott esetben az alkalmazó tudomást szerzett a súlyos váratlan eseményről.

Az első albekezdésben említett bejelentésre nyitva álló időszak meghatározása során figyelembe kell venni a súlyos váratlan esemény súlyosságát.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '73',
  '3',
  '(3) E cikk (2) bekezdésétől eltérve, a kiterjedt jogsértés vagy a 3. cikk 49. pontjának b) alpontjában meghatározott súlyos váratlan esemény esetén az e cikk (1) bekezdésében említett bejelentést haladéktalanul, de legkésőbb két nappal azt követően meg kell tenni, hogy a szolgáltató vagy adott esetben az alkalmazó tudomást szerzett az eseményről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '73',
  '4',
  '(4) A (2) bekezdéstől eltérve, valamely személy halála esetén a bejelentést haladéktalanul meg kell tenni azt követően, hogy a szolgáltató vagy az alkalmazó megállapította a nagy kockázatú MI-rendszer és a súlyos váratlan esemény közötti ok-okozati összefüggést, vagy amint feltételezi azt, de legkésőbb 10 nappal azt követően, hogy a szolgáltató vagy adott esetben az alkalmazó tudomást szerzett a súlyos váratlan eseményről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '73',
  '5',
  '(5) Amennyiben az időben történő bejelentés biztosításához szükséges, a szolgáltató vagy adott esetben az alkalmazó nem teljes körű, előzetes bejelentést, majd ezt követően teljes körű bejelentést tehet.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '73',
  '6',
  '(6) A súlyos váratlan esemény (1) bekezdés szerinti bejelentését követően a szolgáltatónak haladéktalanul el kell végeznie a súlyos váratlan eseménnyel és az érintett MI-rendszerrel kapcsolatos szükséges vizsgálatokat. Ennek magában kell foglalnia az esemény kockázatértékelését és a korrekciós intézkedéseket.

A szolgáltatónak az első albekezdésben említett vizsgálatok során együtt kell működnie az illetékes hatóságokkal és adott esetben az érintett bejelentett szervezettel, továbbá a szolgáltató – az illetékes hatóságok ilyen intézkedésről való tájékoztatását megelőzően – nem végezhet olyan vizsgálatot, amely magában foglalja az érintett MI-rendszer oly módon történő megváltoztatását, amely hatással lehet az esemény okainak későbbi értékelésére.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '73',
  '7',
  '(7) A 3. cikk 49. pontjának c) alpontjában említett súlyos váratlan eseménnyel kapcsolatos értesítés kézhezvételét követően a releváns piacfelügyeleti hatóságnak tájékoztatnia kell a 77. cikk (1) bekezdésében említett nemzeti hatóságokat vagy szerveket. A Bizottság célzott iránymutatást dolgoz ki az e cikk (1) bekezdésben meghatározott kötelezettségeknek való megfelelés elősegítése érdekében. Az említett iránymutatást 2025. augusztus 2-ig kell kiadni, és rendszeresen értékelni kell.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '73',
  '8',
  '(8) A piacfelügyeleti hatóságnak az e cikk (1) bekezdésében említett értesítés kézhezvételétől számított hét napon belül meg kell hoznia az (EU) 2019/1020 rendelet 19. cikkében előírt megfelelő intézkedéseket, továbbá követnie kell az említett rendeletben előírt értesítési eljárásokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '73',
  '9',
  '(9) A III. mellékletben említett azon nagy kockázatú MI-rendszerek esetében, amelyeket olyan szolgáltatók hoznak forgalomba vagy helyeznek üzembe, amelyek az e rendeletben meghatározottakkal egyenértékű jelentéstételi követelményeket megállapító uniós jogalkotási eszközök hatálya alá tartoznak, a súlyos váratlan esemény bejelentésére vonatkozó kötelezettségnek a 3. cikk 49. pontjának c) alpontjában említett eseményekre kell korlátozódnia.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '73',
  '10',
  '(10) Az olyan nagy kockázatú MI-rendszerek esetében, amelyek az (EU) 2017/745 rendelet és az (EU) 2017/746 rendelet hatálya alá tartozó eszközök biztonsági alkotórészei vagy maguk is eszközök, a súlyos váratlan események bejelentésére vonatkozó kötelezettségnek az e rendelet 3. cikke 49. pontjának c) alpontjában említett eseményekre kell korlátozódnia, és az értesítést a váratlan esemény bekövetkeztének helye szerinti tagállam által az adott célra kiválasztott illetékes nemzeti hatóságnak kell megküldeni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '73',
  '11',
  '(11) Az illetékes nemzeti hatóságoknak az (EU) 2019/1020 rendelet 20. cikkével összhangban haladéktalanul értesíteniük kell a Bizottságot minden súlyos váratlan eseményről, függetlenül attól, hogy hoztak-e intézkedéseket az eseménnyel kapcsolatban.

3. SZAKASZ

Végrehajtás',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_73'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  null,
  'Az MI-rendszerek piacfelügyelete és piaci ellenőrzése az uniós piacon
(1) Az (EU) 2019/1020 rendelet az e rendelet hatálya alá tartozó MI-rendszerekre alkalmazandó. E rendelet hatékony végrehajtása érdekében:

a)

az (EU) 2019/1020 rendelet szerinti gazdasági szereplőre történő bármely hivatkozást úgy kell értelmezni, hogy az magában foglalja az e rendelet 2. cikkének (1) bekezdésében meghatározott valamennyi gazdasági szereplőt;

b)

az (EU) 2019/1020 rendelet szerinti termékre történő bármely hivatkozást úgy kell értelmezni, hogy az magában foglalja az e rendelet hatálya alá tartozó valamennyi MI-rendszert.

(2) A piacfelügyeleti hatóságoknak az (EU) 2019/1020 rendelet 34. cikkének (4) bekezdése szerinti jelentéstételi kötelezettségeik részeként évente jelentést kell tenniük a Bizottságnak és az érintett nemzeti versenyhatóságoknak a piacfelügyeleti tevékenységek során azonosított minden olyan információról, amely a versenyszabályokra vonatkozó uniós jog alkalmazása szempontjából potenciálisan érdekes lehet. Ezenfelül évente jelentést kell tenniük a Bizottságnak arról, hogy az adott évben alkalmaztak-e tiltott gyakorlatokat, valamint a meghozott intézkedésekről.

(3) Az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termékekhez kapcsolódó nagy kockázatú MI-rendszerek esetében a piacfelügyeleti hatóság e rendelet alkalmazásában az említett jogi aktusok alapján kijelölt, a piacfelügyeleti tevékenységekért felelős hatóság.

Az első albekezdéstől eltérve, és megfelelő körülmények között a tagállamok egy másik releváns hatóságot is kijelölhetnek arra, hogy piacfelügyeleti hatóságként járjon el, feltéve, hogy biztosítják az I. mellékletben felsorolt uniós harmonizációs jogszabályok végrehajtásáért felelős, releváns ágazati piacfelügyeleti hatóságokkal való koordinációt.

(4) Az e rendelet 79–83. cikkében említett eljárások nem alkalmazandók az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termékekhez kapcsolódó MI-rendszerekre, amennyiben az ilyen jogi aktusok már rendelkeznek egyenértékű szintű védelmet biztosító, azonos célú eljárásokról. Ilyen esetekben helyettük a releváns ágazati eljárások alkalmazandók.

(5) A piacfelügyeleti hatóságok (EU) 2019/1020 rendelet 14. cikke szerinti hatásköreinek sérelme nélkül, a piacfelügyeleti hatóságok e rendelet hatékony végrehajtásának biztosítása céljából adott esetben távolról is gyakorolhatják az említett rendelet 14. cikke (4) bekezdésének d) és j) pontjában említett hatásköröket.

(6) A pénzügyi szolgáltatásokra vonatkozó uniós jog által szabályozott pénzügyi intézmények által forgalomba hozott, üzembe helyezett vagy használt nagy kockázatú MI-rendszerek esetében e rendelet alkalmazásában a piacfelügyeleti hatóság az említett intézmények e jogszabályok szerinti pénzügyi felügyeletéért felelős releváns nemzeti hatóság, amennyiben az MI-rendszer forgalomba hozatala, üzembe helyezése vagy használata közvetlenül az említett pénzügyi szolgáltatások nyújtásához kapcsolódik.

(7) A (6) bekezdéstől eltérve, megfelelő körülmények között és feltéve, hogy a koordináció biztosított, a tagállam e rendelet alkalmazásában egy másik megfelelő hatóságot is kijelölhet piacfelügyeleti hatóságként.

Az 1024/2013/EU rendelettel létrehozott egységes felügyeleti mechanizmusban részt vevő, a 2013/36/EU irányelv alapján szabályozott hitelintézeteket felügyelő nemzeti piacfelügyeleti hatóságoknak haladéktalanul be kell jelenteniük az Európai Központi Banknak a piacfelügyeleti tevékenységeik során azonosított minden olyan információt, amely az Európai Központi Banknak az említett rendeletben meghatározott prudenciális felügyeleti feladatai szempontjából esetlegesen jelentőséggel bírhat.

(8) Az e rendelet III. mellékletének 1. pontjában felsorolt nagy kockázatú MI-rendszerek esetében, amennyiben a rendszereket bűnüldözési célokra, határellenőrzésre, valamint az igazságosság és a demokrácia területén használják, továbbá az e rendelet III. mellékletének 6., 7. és 8. pontjában felsorolt nagy kockázatú MI-rendszerek esetében, a tagállamok e rendelet alkalmazásában vagy az (EU) 2016/679 rendelet vagy az (EU) 2016/680 irányelv szerinti illetékes adatvédelmi felügyeleti hatóságokat, vagy az (EU) 2016/680 irányelv 41–44. cikkében megállapítottakkal azonos feltételek alapján kijelölt bármely egyéb hatóságot jelölnek ki piacfelügyeleti hatóságokként. A piacfelügyeleti tevékenységek semmilyen módon nem érinthetik az igazságügyi hatóságok függetlenségét, vagy nem befolyásolhatják egyébként a tevékenységeiket, amikor igazságügyi minőségükben járnak el.

(9) Amennyiben az Unió intézményei, szervei, hivatalai vagy ügynökségei e rendelet hatálya alá tartoznak, az európai adatvédelmi biztos jár el piacfelügyeleti hatóságukként, kivéve az igazságszolgáltatási hatáskörében eljáró Európai Unió Bíróságával kapcsolatban.

(10) A tagállamok elősegítik az e rendelet alapján kijelölt piacfelügyeleti hatóságok és az I. mellékletben vagy más uniós jogszabályban felsorolt olyan uniós harmonizációs jogszabályok alkalmazását felügyelő egyéb releváns nemzeti hatóságok vagy szervek közötti koordinációt, amelyek a nagy kockázatú MI-rendszerek szempontjából relevánsak lehetnek.

(11) A piacfelügyeleti hatóságok és a Bizottság számára lehetővé kell tenni, hogy javaslatot tegyenek olyan, a piacfelügyeleti hatóságok által önállóan vagy a Bizottsággal közösen végzendő közös tevékenységekre, például közös vizsgálatokra, amelyek célja – e rendelet vonatkozásában – a megfelelés előmozdítása, a meg nem felelés feltárása, a figyelemfelhívás vagy az iránymutatás a nagy kockázatú MI-rendszerek azon konkrét kategóriáira tekintettel, amelyekről bebizonyosodik, hogy két vagy több tagállamban jelentenek súlyos kockázatot az (EU) 2019/1020 rendelet 9. cikkével összhangban. Az MI-hivatalnak a közös vizsgálatokhoz koordinációs támogatást kell nyújtania.

(12) Az (EU) 2019/1020 rendelet alapján biztosított hatáskörök sérelme nélkül, adott esetben és a piacfelügyeleti hatóság feladatainak ellátásához szükséges mértékre korlátozva, a szolgáltatónak teljes hozzáférést kell adnia a piacfelügyeleti hatóságok számára a dokumentációhoz, valamint a nagy kockázatú MI-rendszer kifejlesztéséhez alkalmazott tanító-, validálási és tesztadatkészletekhez, többek között – adott esetben és biztonsági garanciák mellett – alkalmazásprogramozási felületeken (API) vagy távoli hozzáférést lehetővé tevő egyéb releváns műszaki megoldásokon és eszközökön keresztül.

(13) Indokolással ellátott kérésre és kizárólag a következő két feltétel együttes teljesülése esetén a piacfelügyeleti hatóságok számára hozzáférést kell biztosítani a nagy kockázatú MI-rendszer forráskódjához:

a)

a forráskódhoz való hozzáférés annak értékeléséhez szükséges, hogy a nagy kockázatú MI-rendszer megfelel-e a III. fejezet 2. szakaszában meghatározott követelményeknek; és

b)

a szolgáltató által rendelkezésre bocsátott adatokon és dokumentáción alapuló tesztelési vagy auditeljárásokat és ellenőrzéseket kimerítették, illetve azok elégtelennek bizonyultak.

(14) A piacfelügyeleti hatóságok által megszerzett információkat, illetve dokumentációt a 78. cikkben meghatározott titoktartási kötelezettségeknek megfelelően kell kezelni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '1',
  '(1) Az (EU) 2019/1020 rendelet az e rendelet hatálya alá tartozó MI-rendszerekre alkalmazandó. E rendelet hatékony végrehajtása érdekében:

a)

az (EU) 2019/1020 rendelet szerinti gazdasági szereplőre történő bármely hivatkozást úgy kell értelmezni, hogy az magában foglalja az e rendelet 2. cikkének (1) bekezdésében meghatározott valamennyi gazdasági szereplőt;

b)

az (EU) 2019/1020 rendelet szerinti termékre történő bármely hivatkozást úgy kell értelmezni, hogy az magában foglalja az e rendelet hatálya alá tartozó valamennyi MI-rendszert.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '1(a)',
  'a) az (EU) 2019/1020 rendelet szerinti gazdasági szereplőre történő bármely hivatkozást úgy kell értelmezni, hogy az magában foglalja az e rendelet 2. cikkének (1) bekezdésében meghatározott valamennyi gazdasági szereplőt;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '1(b)',
  'b) az (EU) 2019/1020 rendelet szerinti termékre történő bármely hivatkozást úgy kell értelmezni, hogy az magában foglalja az e rendelet hatálya alá tartozó valamennyi MI-rendszert.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '2',
  '(2) A piacfelügyeleti hatóságoknak az (EU) 2019/1020 rendelet 34. cikkének (4) bekezdése szerinti jelentéstételi kötelezettségeik részeként évente jelentést kell tenniük a Bizottságnak és az érintett nemzeti versenyhatóságoknak a piacfelügyeleti tevékenységek során azonosított minden olyan információról, amely a versenyszabályokra vonatkozó uniós jog alkalmazása szempontjából potenciálisan érdekes lehet. Ezenfelül évente jelentést kell tenniük a Bizottságnak arról, hogy az adott évben alkalmaztak-e tiltott gyakorlatokat, valamint a meghozott intézkedésekről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '3',
  '(3) Az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termékekhez kapcsolódó nagy kockázatú MI-rendszerek esetében a piacfelügyeleti hatóság e rendelet alkalmazásában az említett jogi aktusok alapján kijelölt, a piacfelügyeleti tevékenységekért felelős hatóság.

Az első albekezdéstől eltérve, és megfelelő körülmények között a tagállamok egy másik releváns hatóságot is kijelölhetnek arra, hogy piacfelügyeleti hatóságként járjon el, feltéve, hogy biztosítják az I. mellékletben felsorolt uniós harmonizációs jogszabályok végrehajtásáért felelős, releváns ágazati piacfelügyeleti hatóságokkal való koordinációt.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '4',
  '(4) Az e rendelet 79–83. cikkében említett eljárások nem alkalmazandók az I. melléklet A. szakaszában felsorolt uniós harmonizációs jogszabályok hatálya alá tartozó termékekhez kapcsolódó MI-rendszerekre, amennyiben az ilyen jogi aktusok már rendelkeznek egyenértékű szintű védelmet biztosító, azonos célú eljárásokról. Ilyen esetekben helyettük a releváns ágazati eljárások alkalmazandók.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '5',
  '(5) A piacfelügyeleti hatóságok (EU) 2019/1020 rendelet 14. cikke szerinti hatásköreinek sérelme nélkül, a piacfelügyeleti hatóságok e rendelet hatékony végrehajtásának biztosítása céljából adott esetben távolról is gyakorolhatják az említett rendelet 14. cikke (4) bekezdésének d) és j) pontjában említett hatásköröket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '6',
  '(6) A pénzügyi szolgáltatásokra vonatkozó uniós jog által szabályozott pénzügyi intézmények által forgalomba hozott, üzembe helyezett vagy használt nagy kockázatú MI-rendszerek esetében e rendelet alkalmazásában a piacfelügyeleti hatóság az említett intézmények e jogszabályok szerinti pénzügyi felügyeletéért felelős releváns nemzeti hatóság, amennyiben az MI-rendszer forgalomba hozatala, üzembe helyezése vagy használata közvetlenül az említett pénzügyi szolgáltatások nyújtásához kapcsolódik.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '7',
  '(7) A (6) bekezdéstől eltérve, megfelelő körülmények között és feltéve, hogy a koordináció biztosított, a tagállam e rendelet alkalmazásában egy másik megfelelő hatóságot is kijelölhet piacfelügyeleti hatóságként.

Az 1024/2013/EU rendelettel létrehozott egységes felügyeleti mechanizmusban részt vevő, a 2013/36/EU irányelv alapján szabályozott hitelintézeteket felügyelő nemzeti piacfelügyeleti hatóságoknak haladéktalanul be kell jelenteniük az Európai Központi Banknak a piacfelügyeleti tevékenységeik során azonosított minden olyan információt, amely az Európai Központi Banknak az említett rendeletben meghatározott prudenciális felügyeleti feladatai szempontjából esetlegesen jelentőséggel bírhat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '8',
  '(8) Az e rendelet III. mellékletének 1. pontjában felsorolt nagy kockázatú MI-rendszerek esetében, amennyiben a rendszereket bűnüldözési célokra, határellenőrzésre, valamint az igazságosság és a demokrácia területén használják, továbbá az e rendelet III. mellékletének 6., 7. és 8. pontjában felsorolt nagy kockázatú MI-rendszerek esetében, a tagállamok e rendelet alkalmazásában vagy az (EU) 2016/679 rendelet vagy az (EU) 2016/680 irányelv szerinti illetékes adatvédelmi felügyeleti hatóságokat, vagy az (EU) 2016/680 irányelv 41–44. cikkében megállapítottakkal azonos feltételek alapján kijelölt bármely egyéb hatóságot jelölnek ki piacfelügyeleti hatóságokként. A piacfelügyeleti tevékenységek semmilyen módon nem érinthetik az igazságügyi hatóságok függetlenségét, vagy nem befolyásolhatják egyébként a tevékenységeiket, amikor igazságügyi minőségükben járnak el.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '9',
  '(9) Amennyiben az Unió intézményei, szervei, hivatalai vagy ügynökségei e rendelet hatálya alá tartoznak, az európai adatvédelmi biztos jár el piacfelügyeleti hatóságukként, kivéve az igazságszolgáltatási hatáskörében eljáró Európai Unió Bíróságával kapcsolatban.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '10',
  '(10) A tagállamok elősegítik az e rendelet alapján kijelölt piacfelügyeleti hatóságok és az I. mellékletben vagy más uniós jogszabályban felsorolt olyan uniós harmonizációs jogszabályok alkalmazását felügyelő egyéb releváns nemzeti hatóságok vagy szervek közötti koordinációt, amelyek a nagy kockázatú MI-rendszerek szempontjából relevánsak lehetnek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '11',
  '(11) A piacfelügyeleti hatóságok és a Bizottság számára lehetővé kell tenni, hogy javaslatot tegyenek olyan, a piacfelügyeleti hatóságok által önállóan vagy a Bizottsággal közösen végzendő közös tevékenységekre, például közös vizsgálatokra, amelyek célja – e rendelet vonatkozásában – a megfelelés előmozdítása, a meg nem felelés feltárása, a figyelemfelhívás vagy az iránymutatás a nagy kockázatú MI-rendszerek azon konkrét kategóriáira tekintettel, amelyekről bebizonyosodik, hogy két vagy több tagállamban jelentenek súlyos kockázatot az (EU) 2019/1020 rendelet 9. cikkével összhangban. Az MI-hivatalnak a közös vizsgálatokhoz koordinációs támogatást kell nyújtania.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '12',
  '(12) Az (EU) 2019/1020 rendelet alapján biztosított hatáskörök sérelme nélkül, adott esetben és a piacfelügyeleti hatóság feladatainak ellátásához szükséges mértékre korlátozva, a szolgáltatónak teljes hozzáférést kell adnia a piacfelügyeleti hatóságok számára a dokumentációhoz, valamint a nagy kockázatú MI-rendszer kifejlesztéséhez alkalmazott tanító-, validálási és tesztadatkészletekhez, többek között – adott esetben és biztonsági garanciák mellett – alkalmazásprogramozási felületeken (API) vagy távoli hozzáférést lehetővé tevő egyéb releváns műszaki megoldásokon és eszközökön keresztül.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '13',
  '(13) Indokolással ellátott kérésre és kizárólag a következő két feltétel együttes teljesülése esetén a piacfelügyeleti hatóságok számára hozzáférést kell biztosítani a nagy kockázatú MI-rendszer forráskódjához:

a)

a forráskódhoz való hozzáférés annak értékeléséhez szükséges, hogy a nagy kockázatú MI-rendszer megfelel-e a III. fejezet 2. szakaszában meghatározott követelményeknek; és

b)

a szolgáltató által rendelkezésre bocsátott adatokon és dokumentáción alapuló tesztelési vagy auditeljárásokat és ellenőrzéseket kimerítették, illetve azok elégtelennek bizonyultak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '13(a)',
  'a) a forráskódhoz való hozzáférés annak értékeléséhez szükséges, hogy a nagy kockázatú MI-rendszer megfelel-e a III. fejezet 2. szakaszában meghatározott követelményeknek; és',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '13(b)',
  'b) a szolgáltató által rendelkezésre bocsátott adatokon és dokumentáción alapuló tesztelési vagy auditeljárásokat és ellenőrzéseket kimerítették, illetve azok elégtelennek bizonyultak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '74',
  '14',
  '(14) A piacfelügyeleti hatóságok által megszerzett információkat, illetve dokumentációt a 78. cikkben meghatározott titoktartási kötelezettségeknek megfelelően kell kezelni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_74'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '75',
  null,
  'Kölcsönös segítségnyújtás, piacfelügyelet és az általános célú MI-rendszerek ellenőrzése
(1) Amennyiben valamely MI-rendszer általános célú MI-modellre épül, és a modell és a rendszer kifejlesztését ugyanazon szolgáltató végezte, az MI-hivatalnak hatáskörrel kell rendelkeznie annak nyomon követésére és felügyeletére, hogy az adott MI-rendszer megfelel-e az e rendelet szerinti követelményeknek. A nyomonkövetési és felügyeleti feladatainak ellátása érdekében az MI-hivatal rendelkezik egy piacfelügyeleti hatóság számára e szakaszban és az (EU) 2019/1020 rendeletben biztosított valamennyi hatáskörrel.

(2) Amennyiben a releváns piacfelügyeleti hatóságoknak elegendő okuk van úgy megítélni, hogy az olyan általános célú MI-rendszerek, amelyeket az alkalmazók közvetlenül használhatnak legalább egy, e rendelet értelmében nagy kockázatúnak minősített célra, nem felelnek meg az e rendeletben meghatározott követelményeknek, az említett hatóságoknak együtt kell működniük az MI-hivatallal a megfelelőségi értékelések elvégzése érdekében, és ennek megfelelően tájékoztatniuk kell a Testületet és a többi piacfelügyeleti hatóságot.

(3) Amennyiben a piacfelügyeleti hatóság azért nem tudja lezárni valamely nagy kockázatú MI-rendszer vizsgálatát, mert annak ellenére sem tud hozzáférni az általános célú MI-modellhez kapcsolódó bizonyos információkhoz, hogy minden megfelelő erőfeszítést megtett ezek megszerzése érdekében, indokolással ellátott kérelmet nyújthat be az MI-hivatalhoz, amelyen keresztül érvényre juttatható az említett információkhoz való hozzáférés. Ebben az esetben az MI-hivatalnak haladéktalanul, de legkésőbb 30 napon belül meg kell adnia a megkereső hatóságnak minden olyan információt, amelyet az MI-hivatal szükségesnek ítél valamely nagy kockázatú MI-rendszer meg nem felelésének megállapításához. A piacfelügyeleti hatóságoknak e rendelet 78. cikkével összhangban meg kell őrizniük az általuk kapott információk bizalmas jellegét. Az (EU) 2019/1020 rendelet VI. fejezetében előírt eljárás értelemszerűen alkalmazandó.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '75',
  '1',
  '(1) Amennyiben valamely MI-rendszer általános célú MI-modellre épül, és a modell és a rendszer kifejlesztését ugyanazon szolgáltató végezte, az MI-hivatalnak hatáskörrel kell rendelkeznie annak nyomon követésére és felügyeletére, hogy az adott MI-rendszer megfelel-e az e rendelet szerinti követelményeknek. A nyomonkövetési és felügyeleti feladatainak ellátása érdekében az MI-hivatal rendelkezik egy piacfelügyeleti hatóság számára e szakaszban és az (EU) 2019/1020 rendeletben biztosított valamennyi hatáskörrel.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '75',
  '2',
  '(2) Amennyiben a releváns piacfelügyeleti hatóságoknak elegendő okuk van úgy megítélni, hogy az olyan általános célú MI-rendszerek, amelyeket az alkalmazók közvetlenül használhatnak legalább egy, e rendelet értelmében nagy kockázatúnak minősített célra, nem felelnek meg az e rendeletben meghatározott követelményeknek, az említett hatóságoknak együtt kell működniük az MI-hivatallal a megfelelőségi értékelések elvégzése érdekében, és ennek megfelelően tájékoztatniuk kell a Testületet és a többi piacfelügyeleti hatóságot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '75',
  '3',
  '(3) Amennyiben a piacfelügyeleti hatóság azért nem tudja lezárni valamely nagy kockázatú MI-rendszer vizsgálatát, mert annak ellenére sem tud hozzáférni az általános célú MI-modellhez kapcsolódó bizonyos információkhoz, hogy minden megfelelő erőfeszítést megtett ezek megszerzése érdekében, indokolással ellátott kérelmet nyújthat be az MI-hivatalhoz, amelyen keresztül érvényre juttatható az említett információkhoz való hozzáférés. Ebben az esetben az MI-hivatalnak haladéktalanul, de legkésőbb 30 napon belül meg kell adnia a megkereső hatóságnak minden olyan információt, amelyet az MI-hivatal szükségesnek ítél valamely nagy kockázatú MI-rendszer meg nem felelésének megállapításához. A piacfelügyeleti hatóságoknak e rendelet 78. cikkével összhangban meg kell őrizniük az általuk kapott információk bizalmas jellegét. Az (EU) 2019/1020 rendelet VI. fejezetében előírt eljárás értelemszerűen alkalmazandó.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_75'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '76',
  null,
  'A valós körülmények közötti tesztelés piacfelügyeleti hatóságok általi felügyelete
(1) A piacfelügyeleti hatóságoknak illetékességgel és hatáskörrel kell rendelkezniük annak biztosítására, hogy a valós körülmények közötti tesztelés összhangban legyen e rendelettel.

(2) Amennyiben az 58. cikknek megfelelően MI szabályozói tesztkörnyezetben felügyelt MI-rendszerek esetében valós körülmények között végeznek tesztelést, a piacfelügyeleti hatóságoknak az MI szabályozói tesztkörnyezetet illetően betöltött felügyeleti szerepük részeként ellenőrizniük kell a 60. cikknek való megfelelést. Az említett hatóságok adott esetben engedélyezhetik, hogy a valós körülmények közötti tesztelést a 60. cikk (4) bekezdésének f) és g) pontjában meghatározott feltételektől eltérve, a szolgáltató vagy a leendő szolgáltató végezze el.

(3) Amennyiben a szolgáltató, a leendő szolgáltató vagy valamely harmadik fél tájékoztatta a piacfelügyeleti hatóságot egy súlyos váratlan eseményről, vagy ha a piacfelügyeleti hatóság más indokok alapján úgy véli, hogy a 60. és a 61. cikkben foglalt feltételek nem teljesültek, szükség szerint meghozhatja a következő határozatok valamelyikét a saját területén:

a)

felfüggesztheti vagy megszüntetheti a valós körülmények közötti tesztelést;

b)

kötelezheti a szolgáltatót vagy leendő szolgáltatót, valamint az alkalmazót és a leendő alkalmazót a valós körülmények közötti tesztelés bármely aspektusának módosítására.

(4) Amennyiben a piacfelügyeleti hatóság az e cikk (3) bekezdésében említett határozatot hozott, vagy a 60. cikk (4) bekezdésének b) pontja értelmében vett kifogást emelt, a határozatban vagy a kifogásban fel kell tüntetni annak indokait, és azt, hogy a szolgáltató vagy leendő szolgáltató miként támadhatja meg a határozatot vagy a kifogást.

(5) Adott esetben, amennyiben a piacfelügyeleti hatóság a (3) bekezdésben említett határozatot hozott, közölnie kell ennek indokait azon egyéb tagállamok piacfelügyeleti hatóságaival, amelyekben az MI-rendszert a tesztelési tervnek megfelelően tesztelték.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_76'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '76',
  '1',
  '(1) A piacfelügyeleti hatóságoknak illetékességgel és hatáskörrel kell rendelkezniük annak biztosítására, hogy a valós körülmények közötti tesztelés összhangban legyen e rendelettel.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_76'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '76',
  '2',
  '(2) Amennyiben az 58. cikknek megfelelően MI szabályozói tesztkörnyezetben felügyelt MI-rendszerek esetében valós körülmények között végeznek tesztelést, a piacfelügyeleti hatóságoknak az MI szabályozói tesztkörnyezetet illetően betöltött felügyeleti szerepük részeként ellenőrizniük kell a 60. cikknek való megfelelést. Az említett hatóságok adott esetben engedélyezhetik, hogy a valós körülmények közötti tesztelést a 60. cikk (4) bekezdésének f) és g) pontjában meghatározott feltételektől eltérve, a szolgáltató vagy a leendő szolgáltató végezze el.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_76'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '76',
  '3',
  '(3) Amennyiben a szolgáltató, a leendő szolgáltató vagy valamely harmadik fél tájékoztatta a piacfelügyeleti hatóságot egy súlyos váratlan eseményről, vagy ha a piacfelügyeleti hatóság más indokok alapján úgy véli, hogy a 60. és a 61. cikkben foglalt feltételek nem teljesültek, szükség szerint meghozhatja a következő határozatok valamelyikét a saját területén:

a)

felfüggesztheti vagy megszüntetheti a valós körülmények közötti tesztelést;

b)

kötelezheti a szolgáltatót vagy leendő szolgáltatót, valamint az alkalmazót és a leendő alkalmazót a valós körülmények közötti tesztelés bármely aspektusának módosítására.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_76'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '76',
  '3(a)',
  'a) felfüggesztheti vagy megszüntetheti a valós körülmények közötti tesztelést;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_76'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '76',
  '3(b)',
  'b) kötelezheti a szolgáltatót vagy leendő szolgáltatót, valamint az alkalmazót és a leendő alkalmazót a valós körülmények közötti tesztelés bármely aspektusának módosítására.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_76'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '76',
  '4',
  '(4) Amennyiben a piacfelügyeleti hatóság az e cikk (3) bekezdésében említett határozatot hozott, vagy a 60. cikk (4) bekezdésének b) pontja értelmében vett kifogást emelt, a határozatban vagy a kifogásban fel kell tüntetni annak indokait, és azt, hogy a szolgáltató vagy leendő szolgáltató miként támadhatja meg a határozatot vagy a kifogást.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_76'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '76',
  '5',
  '(5) Adott esetben, amennyiben a piacfelügyeleti hatóság a (3) bekezdésben említett határozatot hozott, közölnie kell ennek indokait azon egyéb tagállamok piacfelügyeleti hatóságaival, amelyekben az MI-rendszert a tesztelési tervnek megfelelően tesztelték.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_76'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '77',
  null,
  'Az alapvető jogokat védő hatóságok hatáskörei
(1) Azon nemzeti hatóságoknak vagy szerveknek, amelyek felügyelik vagy érvényesítik a III. mellékletben említett nagy kockázatú MI-rendszerek használatával kapcsolatos, az alapvető jogok – köztük a megkülönböztetésmentességhez való jog – védelmét célzó uniós jogi kötelezettségek betartását, hatáskörrel kell rendelkezniük arra, hogy kérelmezzék az e rendelet alapján létrehozott vagy vezetett dokumentációt, és közérthető nyelven, valamint hozzáférhető formátumban hozzáférjenek ahhoz, amennyiben az adott dokumentációhoz való hozzáférés a megbízatásuk joghatóságuk keretein belüli hatékony teljesítéséhez szükséges. Az érintett hatóságnak vagy szervnek minden ilyen kérelemről tájékoztatnia kell az érintett tagállam piacfelügyeleti hatóságát.

(2) 2024. november 2-ig minden tagállam kijelöli az (1) bekezdésben említett hatóságokat vagy szerveket, és nyilvánosan hozzáférhetővé teszi az ezekről összeállított jegyzéket . A tagállamok megküldik a Bizottságnak és a többi tagállamnak a jegyzéket, és azt naprakészen tartják.

(3) Amennyiben az (1) bekezdésben említett dokumentáció nem elegendő annak megállapításához, hogy sor került-e az alapvető jogok védelmét célzó uniós jog szerinti kötelezettségek megsértésére, az (1) bekezdésben említett hatóság vagy szerv indokolással ellátott kérelmet intézhet a piacfelügyeleti hatósághoz a nagy kockázatú MI-rendszer műszaki megoldások útján történő tesztelésének megszervezésére. A piacfelügyeleti hatóságnak a kérelem beérkezését követően észszerű időn belül meg kell szerveznie a tesztelést a kérelmező hatóság vagy szerv szoros bevonásával.

(4) Az e cikk (1) bekezdésében említett nemzeti hatóságok vagy szervek által e cikk alapján megszerzett információkat és dokumentációt a 78. cikkben foglalt titoktartási kötelezettségeknek megfelelően kell kezelni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_77'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '77',
  '1',
  '(1) Azon nemzeti hatóságoknak vagy szerveknek, amelyek felügyelik vagy érvényesítik a III. mellékletben említett nagy kockázatú MI-rendszerek használatával kapcsolatos, az alapvető jogok – köztük a megkülönböztetésmentességhez való jog – védelmét célzó uniós jogi kötelezettségek betartását, hatáskörrel kell rendelkezniük arra, hogy kérelmezzék az e rendelet alapján létrehozott vagy vezetett dokumentációt, és közérthető nyelven, valamint hozzáférhető formátumban hozzáférjenek ahhoz, amennyiben az adott dokumentációhoz való hozzáférés a megbízatásuk joghatóságuk keretein belüli hatékony teljesítéséhez szükséges. Az érintett hatóságnak vagy szervnek minden ilyen kérelemről tájékoztatnia kell az érintett tagállam piacfelügyeleti hatóságát.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_77'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '77',
  '2',
  '(2) 2024. november 2-ig minden tagállam kijelöli az (1) bekezdésben említett hatóságokat vagy szerveket, és nyilvánosan hozzáférhetővé teszi az ezekről összeállított jegyzéket . A tagállamok megküldik a Bizottságnak és a többi tagállamnak a jegyzéket, és azt naprakészen tartják.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_77'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '77',
  '3',
  '(3) Amennyiben az (1) bekezdésben említett dokumentáció nem elegendő annak megállapításához, hogy sor került-e az alapvető jogok védelmét célzó uniós jog szerinti kötelezettségek megsértésére, az (1) bekezdésben említett hatóság vagy szerv indokolással ellátott kérelmet intézhet a piacfelügyeleti hatósághoz a nagy kockázatú MI-rendszer műszaki megoldások útján történő tesztelésének megszervezésére. A piacfelügyeleti hatóságnak a kérelem beérkezését követően észszerű időn belül meg kell szerveznie a tesztelést a kérelmező hatóság vagy szerv szoros bevonásával.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_77'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '77',
  '4',
  '(4) Az e cikk (1) bekezdésében említett nemzeti hatóságok vagy szervek által e cikk alapján megszerzett információkat és dokumentációt a 78. cikkben foglalt titoktartási kötelezettségeknek megfelelően kell kezelni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_77'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '78',
  null,
  'Titoktartás
(1) A Bizottság, a piacfelügyeleti hatóságok és a bejelentett szervezetek, valamint az e rendelet alkalmazásában részt vevő egyéb természetes vagy jogi személyek az uniós vagy a nemzeti joggal összhangban tiszteletben tartják a feladataik ellátása során megszerzett információk és adatok titkosságát oly módon, hogy védjék különösen a következőket:

a)

az (EU) 2016/943 európai parlamenti és tanácsi irányelv ( 57 ) 5. cikkében említett esetek kivételével a szellemitulajdon-jogok, valamint valamely természetes vagy jogi személy bizalmas üzleti információi vagy üzleti titkai, így például forráskódja;

b)

e rendelet hatékony végrehajtása, különösen az ellenőrzések, a vizsgálatok és az auditok céljából;

c)

köz- és nemzetbiztonsági érdekek;

d)

a büntetőjogi vagy közigazgatási eljárások lefolytatása;

e)

az uniós vagy a nemzeti jog szerinti minősített adatok.

(2) Az e rendelet alkalmazásában részt vevő, (1) bekezdés szerinti hatóságok kizárólag olyan adatokat kérhetnek, amelyek az MI-rendszerek által jelentett kockázat értékeléséhez, valamint hatásköreik e rendeletnek és az (EU) 2019/1020 rendeletnek megfelelő gyakorlásához kifejezetten szükségesek. Megfelelő és hatékony kiberbiztonsági intézkedéseket kell bevezetniük a megszerzett információk és adatok biztonságának és titkosságának védelme érdekében, valamint az alkalmazandó uniós vagy nemzeti joggal összhangban törölniük kell az összegyűjtött adatokat, amint azokra már nincs szükség a megszerzésüket indokoló célból.

(3) Az (1) és a (2) bekezdés sérelme nélkül az illetékes nemzeti hatóságok között, illetve az illetékes nemzeti hatóságok és a Bizottság között bizalmas alapon megosztott információk nem hozhatók nyilvánosságra a kibocsátó illetékes nemzeti hatósággal és az alkalmazóval való előzetes egyeztetés nélkül, amennyiben a III. melléklet 1., 6. vagy 7. pontjában említett nagy kockázatú MI-rendszereket a bűnüldöző, határellenőrzési, bevándorlási vagy menekültügyi hatóságok használják, ha az ilyen nyilvánosságra hozatal közbiztonsági és nemzetbiztonsági érdekeket veszélyeztetne. Ez az információcsere nem terjedhet ki a bűnüldöző, a határellenőrzési, a bevándorlási vagy a menekültügyi hatóságok tevékenységeivel kapcsolatos érzékeny operatív adatokra.

Amennyiben a bűnüldöző, a bevándorlási vagy a menekültügyi hatóságok a III. melléklet 1., 6. vagy 7. pontjában említett nagy kockázatú MI-rendszerek szolgáltatói, a IV. mellékletben említett műszaki dokumentációnak e hatóságok telephelyén kell maradnia. E hatóságoknak biztosítaniuk kell, hogy a 74. cikk (8) és – adott esetben – (9) bekezdésében említett piacfelügyeleti hatóságok kérésre azonnal hozzá tudjanak férni a dokumentációhoz, vagy megkaphassák annak egy példányát. Csak a piacfelügyeleti hatóság megfelelő szintű biztonsági tanúsítvánnyal rendelkező munkatársai férhetnek hozzá az említett dokumentációhoz vagy annak bármely példányához.

(4) Az (1), a (2) és a (3) bekezdés nem érintheti a Bizottságnak, a tagállamoknak, a releváns hatóságaiknak és a bejelentett szervezeteknek az információcsere és a figyelmeztetések terjesztése tekintetében, többek között a határon átnyúló együttműködés kontextusában fennálló jogait és kötelezettségeit, és nem érintheti az érintett feleknek a tagállamok büntetőjoga alapján fennálló tájékoztatásnyújtási kötelezettségeit.

(5) A Bizottság és a tagállamok – amennyiben szükséges, valamint a nemzetközi és a kereskedelmi megállapodások releváns rendelkezéseivel összhangban megoszthatnak bizalmas információkat azon harmadik országok szabályozó hatóságaival, amelyekkel a bizalmas kezelésre vonatkozó, megfelelő szintű titoktartást biztosító, kétoldalú vagy többoldalú megállapodásokat kötöttek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '78',
  '1',
  '(1) A Bizottság, a piacfelügyeleti hatóságok és a bejelentett szervezetek, valamint az e rendelet alkalmazásában részt vevő egyéb természetes vagy jogi személyek az uniós vagy a nemzeti joggal összhangban tiszteletben tartják a feladataik ellátása során megszerzett információk és adatok titkosságát oly módon, hogy védjék különösen a következőket:

a)

az (EU) 2016/943 európai parlamenti és tanácsi irányelv ( 57 ) 5. cikkében említett esetek kivételével a szellemitulajdon-jogok, valamint valamely természetes vagy jogi személy bizalmas üzleti információi vagy üzleti titkai, így például forráskódja;

b)

e rendelet hatékony végrehajtása, különösen az ellenőrzések, a vizsgálatok és az auditok céljából;

c)

köz- és nemzetbiztonsági érdekek;

d)

a büntetőjogi vagy közigazgatási eljárások lefolytatása;

e)

az uniós vagy a nemzeti jog szerinti minősített adatok.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '78',
  '1(a)',
  'a) az (EU) 2016/943 európai parlamenti és tanácsi irányelv ( 57 ) 5. cikkében említett esetek kivételével a szellemitulajdon-jogok, valamint valamely természetes vagy jogi személy bizalmas üzleti információi vagy üzleti titkai, így például forráskódja;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '78',
  '1(b)',
  'b) e rendelet hatékony végrehajtása, különösen az ellenőrzések, a vizsgálatok és az auditok céljából;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '78',
  '1(c)',
  'c) köz- és nemzetbiztonsági érdekek;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '78',
  '1(d)',
  'd) a büntetőjogi vagy közigazgatási eljárások lefolytatása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '78',
  '1(e)',
  'e) az uniós vagy a nemzeti jog szerinti minősített adatok.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '78',
  '2',
  '(2) Az e rendelet alkalmazásában részt vevő, (1) bekezdés szerinti hatóságok kizárólag olyan adatokat kérhetnek, amelyek az MI-rendszerek által jelentett kockázat értékeléséhez, valamint hatásköreik e rendeletnek és az (EU) 2019/1020 rendeletnek megfelelő gyakorlásához kifejezetten szükségesek. Megfelelő és hatékony kiberbiztonsági intézkedéseket kell bevezetniük a megszerzett információk és adatok biztonságának és titkosságának védelme érdekében, valamint az alkalmazandó uniós vagy nemzeti joggal összhangban törölniük kell az összegyűjtött adatokat, amint azokra már nincs szükség a megszerzésüket indokoló célból.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '78',
  '3',
  '(3) Az (1) és a (2) bekezdés sérelme nélkül az illetékes nemzeti hatóságok között, illetve az illetékes nemzeti hatóságok és a Bizottság között bizalmas alapon megosztott információk nem hozhatók nyilvánosságra a kibocsátó illetékes nemzeti hatósággal és az alkalmazóval való előzetes egyeztetés nélkül, amennyiben a III. melléklet 1., 6. vagy 7. pontjában említett nagy kockázatú MI-rendszereket a bűnüldöző, határellenőrzési, bevándorlási vagy menekültügyi hatóságok használják, ha az ilyen nyilvánosságra hozatal közbiztonsági és nemzetbiztonsági érdekeket veszélyeztetne. Ez az információcsere nem terjedhet ki a bűnüldöző, a határellenőrzési, a bevándorlási vagy a menekültügyi hatóságok tevékenységeivel kapcsolatos érzékeny operatív adatokra.

Amennyiben a bűnüldöző, a bevándorlási vagy a menekültügyi hatóságok a III. melléklet 1., 6. vagy 7. pontjában említett nagy kockázatú MI-rendszerek szolgáltatói, a IV. mellékletben említett műszaki dokumentációnak e hatóságok telephelyén kell maradnia. E hatóságoknak biztosítaniuk kell, hogy a 74. cikk (8) és – adott esetben – (9) bekezdésében említett piacfelügyeleti hatóságok kérésre azonnal hozzá tudjanak férni a dokumentációhoz, vagy megkaphassák annak egy példányát. Csak a piacfelügyeleti hatóság megfelelő szintű biztonsági tanúsítvánnyal rendelkező munkatársai férhetnek hozzá az említett dokumentációhoz vagy annak bármely példányához.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '78',
  '4',
  '(4) Az (1), a (2) és a (3) bekezdés nem érintheti a Bizottságnak, a tagállamoknak, a releváns hatóságaiknak és a bejelentett szervezeteknek az információcsere és a figyelmeztetések terjesztése tekintetében, többek között a határon átnyúló együttműködés kontextusában fennálló jogait és kötelezettségeit, és nem érintheti az érintett feleknek a tagállamok büntetőjoga alapján fennálló tájékoztatásnyújtási kötelezettségeit.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '78',
  '5',
  '(5) A Bizottság és a tagállamok – amennyiben szükséges, valamint a nemzetközi és a kereskedelmi megállapodások releváns rendelkezéseivel összhangban megoszthatnak bizalmas információkat azon harmadik országok szabályozó hatóságaival, amelyekkel a bizalmas kezelésre vonatkozó, megfelelő szintű titoktartást biztosító, kétoldalú vagy többoldalú megállapodásokat kötöttek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_78'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  null,
  'A kockázatot jelentő MI-rendszerek kezelésére vonatkozó nemzeti szintű eljárások
(1) Kockázatot jelentő MI-rendszerek alatt az (EU) 2019/1020 rendelet 3. cikkének 19. pontjában meghatározott, „kockázatot jelentő termék” értendő, amennyiben e rendszerek kockázatot jelentenek személyek egészségére és biztonságára, illetve alapvető jogaira nézve.

(2) Amennyiben egy tagállam piacfelügyeleti hatóságának elegendő oka van úgy megítélni, hogy egy MI-rendszer az e cikk (1) bekezdésben említettek alapján kockázatot jelent, el kell végeznie az érintett MI-rendszer értékelését a tekintetben, hogy az megfelel-e az e rendeletben meghatározott valamennyi követelménynek és kötelezettségnek. Különös figyelmet kell fordítani azon MI-rendszerekre, amelyek kockázatot jelentenek a kiszolgáltatott csoportokra. Amennyiben az alapvető jogokat veszélyeztető kockázatokat azonosítanak, a piacfelügyeleti hatóságnak tájékoztatnia kell a 77. cikk (1) bekezdésében említett érintett nemzeti hatóságokat vagy szerveket is, és azokkal teljes mértékben együtt kell működnie. A releváns gazdasági szereplőknek szükség szerint együtt kell működniük a piacfelügyeleti hatósággal és a 77. cikk (1) bekezdésében említett egyéb nemzeti hatóságokkal vagy szervekkel.

Amennyiben az említett értékelés során a nemzeti felügyeleti hatóság vagy adott esetben a nemzeti felügyeleti hatóság a 77. cikk (1) bekezdésében említett nemzeti hatósággal együttműködésben megállapítja, hogy az MI-rendszer nem felel meg az e rendeletben megállapított követelményeknek és kötelezettségeknek, haladéktalanul elő kell írnia a releváns gazdasági szereplő számára, hogy – az adott esetben a piacfelügyeleti hatóság által előírt időszakon, de legkésőbb tizenöt munkanapon belül, vagy adott esetben a releváns uniós harmonizációs jogszabályokban előírtak szerint, attól függően, hogy melyik következik be hamarabb – tegyen meg minden ahhoz szükséges megfelelő korrekciós intézkedést, hogy az MI-rendszer megfeleljen az említett követelményeknek, vonja ki az MI-rendszert a forgalomból vagy hívja vissza azt.

A piacfelügyeleti hatóságnak ennek megfelelően tájékoztatnia kell az érintett bejelentett szervezetet. Az e bekezdés második albekezdésében említett intézkedésekre az (EU) 2019/1020 rendelet 18. cikke alkalmazandó.

(3) Amennyiben a piacfelügyeleti hatóság úgy ítéli meg, hogy a meg nem felelés nem korlátozódik az adott ország területére, indokolatlan késedelem nélkül tájékoztatnia kell a Bizottságot és a többi tagállamot az értékelés eredményeiről és azokról az intézkedésekről, amelyek meghozatalára a gazdasági szereplőt felszólította.

(4) A gazdasági szereplőnek biztosítania kell, hogy az uniós piacon általa forgalmazott valamennyi érintett MI-rendszer tekintetében minden megfelelő korrekciós intézkedést meghozzon.

(5) Amennyiben az MI-rendszer üzemeltetője nem teszi meg a megfelelő korrekciós intézkedéseket a (2) bekezdésben említett időszakon belül, a piacfelügyeleti hatóságnak meg kell hoznia minden megfelelő átmeneti intézkedést az MI-rendszer nemzeti piacon történő forgalmazásának vagy üzembe helyezésének megtiltása vagy korlátozása, illetve a termék vagy a különálló MI-rendszer forgalomból való kivonása vagy visszahívása érdekében. Ezekről az intézkedésekről a hatóságnak indokolatlan késedelem nélkül értesítenie kell a Bizottságot és a többi tagállamot.

(6) Az (5) bekezdésben említett értesítésnek tartalmaznia kell minden rendelkezésre álló információt, különösen az előírásoknak nem megfelelő MI-rendszer azonosításához szükséges információkat, az MI-rendszer származási helyét, és az ellátási láncot, a feltételezett meg nem felelésnek és a fennálló kockázatnak a jellegét, a meghozott nemzeti intézkedések jellegét és időtartamát, valamint a releváns gazdasági szereplő által felhozott érveket. Így különösen, a piacfelügyeleti hatóságoknak jelezniük kell, hogy a meg nem felelés a következő okok közül egy vagy több miatt következett-e be:

a)

az 5. cikkben említett MI-gyakorlatok tilalmának be nem tartása;

b)

valamely nagy kockázatú MI-rendszer nem felel meg a III. fejezet 2. szakaszában foglalt követelményeknek;

c)

a megfelelés vélelmét megalapozó, a 40. és a 41. cikkben említett harmonizált szabványok vagy közös előírások hiányosságai;

d)

az 50. cikknek való meg nem felelés.

(7) A piacfelügyeleti hatóságoknak – az eljárást kezdeményező tagállam piacfelügyeleti hatóságának kivételével – indokolatlan késedelem nélkül tájékoztatniuk kell a Bizottságot és a többi tagállamot az elfogadott intézkedésekről és azokról a birtokukban lévő további információkról, amelyek az érintett MI-rendszer meg nem feleléséről tanúskodnak, valamint – amennyiben nem értenek egyet a bejelentett tagállami intézkedéssel – a kifogásaikról.

(8) Amennyiben az e cikk (5) bekezdésében említett értesítés kézhezvételétől számított három hónapon belül sem valamely tagállam piacfelügyeleti hatósága, sem a Bizottság nem emel kifogást egy másik tagállam piacfelügyeleti hatósága által hozott ideiglenes intézkedéssel szemben, az intézkedést indokoltnak kell tekinteni. Ez nem érinti az érintett gazdasági szereplőnek az (EU) 2019/1020 rendelet 18. cikke szerinti eljárási jogait. Az e bekezdésben említett három hónapos határidőt 30 napra kell csökkenteni az e rendelet 5. cikkében említett MI-gyakorlatok tilalmának be nem tartása esetén.

(9) A piacfelügyeleti hatóságoknak biztosítaniuk kell, hogy az érintett termékkel vagy MI-rendszerrel kapcsolatban indokolatlan késedelem nélkül megfelelő korlátozó intézkedések meghozatalára kerüljön sor, ideértve a termék vagy az MI-rendszer forgalomból való kivonását is az adott tagállam piacáról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '1',
  '(1) Kockázatot jelentő MI-rendszerek alatt az (EU) 2019/1020 rendelet 3. cikkének 19. pontjában meghatározott, „kockázatot jelentő termék” értendő, amennyiben e rendszerek kockázatot jelentenek személyek egészségére és biztonságára, illetve alapvető jogaira nézve.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '2',
  '(2) Amennyiben egy tagállam piacfelügyeleti hatóságának elegendő oka van úgy megítélni, hogy egy MI-rendszer az e cikk (1) bekezdésben említettek alapján kockázatot jelent, el kell végeznie az érintett MI-rendszer értékelését a tekintetben, hogy az megfelel-e az e rendeletben meghatározott valamennyi követelménynek és kötelezettségnek. Különös figyelmet kell fordítani azon MI-rendszerekre, amelyek kockázatot jelentenek a kiszolgáltatott csoportokra. Amennyiben az alapvető jogokat veszélyeztető kockázatokat azonosítanak, a piacfelügyeleti hatóságnak tájékoztatnia kell a 77. cikk (1) bekezdésében említett érintett nemzeti hatóságokat vagy szerveket is, és azokkal teljes mértékben együtt kell működnie. A releváns gazdasági szereplőknek szükség szerint együtt kell működniük a piacfelügyeleti hatósággal és a 77. cikk (1) bekezdésében említett egyéb nemzeti hatóságokkal vagy szervekkel.

Amennyiben az említett értékelés során a nemzeti felügyeleti hatóság vagy adott esetben a nemzeti felügyeleti hatóság a 77. cikk (1) bekezdésében említett nemzeti hatósággal együttműködésben megállapítja, hogy az MI-rendszer nem felel meg az e rendeletben megállapított követelményeknek és kötelezettségeknek, haladéktalanul elő kell írnia a releváns gazdasági szereplő számára, hogy – az adott esetben a piacfelügyeleti hatóság által előírt időszakon, de legkésőbb tizenöt munkanapon belül, vagy adott esetben a releváns uniós harmonizációs jogszabályokban előírtak szerint, attól függően, hogy melyik következik be hamarabb – tegyen meg minden ahhoz szükséges megfelelő korrekciós intézkedést, hogy az MI-rendszer megfeleljen az említett követelményeknek, vonja ki az MI-rendszert a forgalomból vagy hívja vissza azt.

A piacfelügyeleti hatóságnak ennek megfelelően tájékoztatnia kell az érintett bejelentett szervezetet. Az e bekezdés második albekezdésében említett intézkedésekre az (EU) 2019/1020 rendelet 18. cikke alkalmazandó.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '3',
  '(3) Amennyiben a piacfelügyeleti hatóság úgy ítéli meg, hogy a meg nem felelés nem korlátozódik az adott ország területére, indokolatlan késedelem nélkül tájékoztatnia kell a Bizottságot és a többi tagállamot az értékelés eredményeiről és azokról az intézkedésekről, amelyek meghozatalára a gazdasági szereplőt felszólította.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '4',
  '(4) A gazdasági szereplőnek biztosítania kell, hogy az uniós piacon általa forgalmazott valamennyi érintett MI-rendszer tekintetében minden megfelelő korrekciós intézkedést meghozzon.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '5',
  '(5) Amennyiben az MI-rendszer üzemeltetője nem teszi meg a megfelelő korrekciós intézkedéseket a (2) bekezdésben említett időszakon belül, a piacfelügyeleti hatóságnak meg kell hoznia minden megfelelő átmeneti intézkedést az MI-rendszer nemzeti piacon történő forgalmazásának vagy üzembe helyezésének megtiltása vagy korlátozása, illetve a termék vagy a különálló MI-rendszer forgalomból való kivonása vagy visszahívása érdekében. Ezekről az intézkedésekről a hatóságnak indokolatlan késedelem nélkül értesítenie kell a Bizottságot és a többi tagállamot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '6',
  '(6) Az (5) bekezdésben említett értesítésnek tartalmaznia kell minden rendelkezésre álló információt, különösen az előírásoknak nem megfelelő MI-rendszer azonosításához szükséges információkat, az MI-rendszer származási helyét, és az ellátási láncot, a feltételezett meg nem felelésnek és a fennálló kockázatnak a jellegét, a meghozott nemzeti intézkedések jellegét és időtartamát, valamint a releváns gazdasági szereplő által felhozott érveket. Így különösen, a piacfelügyeleti hatóságoknak jelezniük kell, hogy a meg nem felelés a következő okok közül egy vagy több miatt következett-e be:

a)

az 5. cikkben említett MI-gyakorlatok tilalmának be nem tartása;

b)

valamely nagy kockázatú MI-rendszer nem felel meg a III. fejezet 2. szakaszában foglalt követelményeknek;

c)

a megfelelés vélelmét megalapozó, a 40. és a 41. cikkben említett harmonizált szabványok vagy közös előírások hiányosságai;

d)

az 50. cikknek való meg nem felelés.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '6(a)',
  'a) az 5. cikkben említett MI-gyakorlatok tilalmának be nem tartása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '6(b)',
  'b) valamely nagy kockázatú MI-rendszer nem felel meg a III. fejezet 2. szakaszában foglalt követelményeknek;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '6(c)',
  'c) a megfelelés vélelmét megalapozó, a 40. és a 41. cikkben említett harmonizált szabványok vagy közös előírások hiányosságai;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '6(d)',
  'd) az 50. cikknek való meg nem felelés.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '7',
  '(7) A piacfelügyeleti hatóságoknak – az eljárást kezdeményező tagállam piacfelügyeleti hatóságának kivételével – indokolatlan késedelem nélkül tájékoztatniuk kell a Bizottságot és a többi tagállamot az elfogadott intézkedésekről és azokról a birtokukban lévő további információkról, amelyek az érintett MI-rendszer meg nem feleléséről tanúskodnak, valamint – amennyiben nem értenek egyet a bejelentett tagállami intézkedéssel – a kifogásaikról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '8',
  '(8) Amennyiben az e cikk (5) bekezdésében említett értesítés kézhezvételétől számított három hónapon belül sem valamely tagállam piacfelügyeleti hatósága, sem a Bizottság nem emel kifogást egy másik tagállam piacfelügyeleti hatósága által hozott ideiglenes intézkedéssel szemben, az intézkedést indokoltnak kell tekinteni. Ez nem érinti az érintett gazdasági szereplőnek az (EU) 2019/1020 rendelet 18. cikke szerinti eljárási jogait. Az e bekezdésben említett három hónapos határidőt 30 napra kell csökkenteni az e rendelet 5. cikkében említett MI-gyakorlatok tilalmának be nem tartása esetén.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '79',
  '9',
  '(9) A piacfelügyeleti hatóságoknak biztosítaniuk kell, hogy az érintett termékkel vagy MI-rendszerrel kapcsolatban indokolatlan késedelem nélkül megfelelő korlátozó intézkedések meghozatalára kerüljön sor, ideértve a termék vagy az MI-rendszer forgalomból való kivonását is az adott tagállam piacáról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_79'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '80',
  null,
  'A szolgáltató által a III. melléklet alkalmazásában nem nagy kockázatúnak minősített MI-rendszerek kezelésére vonatkozó eljárás
(1) Amennyiben a piacfelügyeleti hatóságnak elegendő oka van úgy megítélni, hogy a szolgáltató által a 6. cikk (3) bekezdését alapul véve nem nagy kockázatúnak minősített MI-rendszer valójában nagy kockázatú, a piacfelügyeleti hatóságnak el kell végeznie az érintett MI-rendszer értékelését a tekintetben, hogy a 6. cikk (3) bekezdésében és a bizottsági iránymutatásokban meghatározott feltételek alapján nagy kockázatúnak minősül-e.

(2) Amennyiben az értékelés során a piacfelügyeleti hatóság megállapítja, hogy az érintett MI-rendszer nagy kockázatot rejt, indokolatlan késedelem nélkül fel kell szólítania az érintett szolgáltatót, hogy tegye meg az ahhoz szükséges valamennyi intézkedést, hogy az MI-rendszer megfeleljen az e rendeletben meghatározott követelményeknek és kötelezettségeknek, valamint hogy – adott esetben a piacfelügyeleti hatóság által előírt időszakon belül – tegyen megfelelő korrekciós intézkedéseket.

(3) Amennyiben a piacfelügyeleti hatóság úgy ítéli meg, hogy az MI-rendszer használata nem korlátozódik az adott ország területére, indokolatlan késedelem nélkül tájékoztatnia kell a Bizottságot és a többi tagállamot az értékelés eredményeiről és azokról az intézkedésekről, amelyek megtételére a szolgáltatót felszólította.

(4) A szolgáltatónak biztosítania kell, hogy minden szükséges intézkedést meghozzanak az MI-rendszer e rendeletben meghatározott követelményeknek és kötelezettségeknek való megfelelése érdekében. Amennyiben az érintett MI-rendszer szolgáltatója az e cikk (2) bekezdésében említett időszakon belül nem biztosítja az MI-rendszernek az említett követelményeknek és kötelezettségeknek való megfelelését, a szolgáltatóra a 99. cikknek megfelelő pénzbírságot kell kiszabni.

(5) A szolgáltató biztosítja, hogy az uniós piacon általa forgalmazott valamennyi érintett MI-rendszer tekintetében minden megfelelő korrekciós intézkedést meghozzanak.

(6) Amennyiben az érintett MI-rendszer szolgáltatója nem teszi meg a megfelelő korrekciós intézkedéseket az e cikk (2) bekezdésében említett időszakon belül, a 79. cikk (5)–(9) bekezdése alkalmazandó.

(7) Amennyiben az e cikk (1) bekezdése szerinti értékelés során a piacfelügyeleti hatóság megállapítja, hogy a szolgáltató annak érdekében minősítette tévesen nem nagy kockázatúnak az MI-rendszert, hogy megkerülje a III. fejezet 2. szakaszában foglalt követelmények alkalmazását, a szolgáltatóra a 99. cikknek megfelelő pénzbírságot kell kiszabni.

(8) A piacfelügyeleti hatóságok az e cikk alkalmazásának nyomon követésére vonatkozó hatáskörük gyakorlása során, az (EU) 2019/1020 rendelet 11. cikkével összhangban megfelelő ellenőrzéseket végezhetnek, figyelembe véve különösen az e rendelet 71. cikkében említett uniós adatbázisban tárolt információkat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_80'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '80',
  '1',
  '(1) Amennyiben a piacfelügyeleti hatóságnak elegendő oka van úgy megítélni, hogy a szolgáltató által a 6. cikk (3) bekezdését alapul véve nem nagy kockázatúnak minősített MI-rendszer valójában nagy kockázatú, a piacfelügyeleti hatóságnak el kell végeznie az érintett MI-rendszer értékelését a tekintetben, hogy a 6. cikk (3) bekezdésében és a bizottsági iránymutatásokban meghatározott feltételek alapján nagy kockázatúnak minősül-e.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_80'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '80',
  '2',
  '(2) Amennyiben az értékelés során a piacfelügyeleti hatóság megállapítja, hogy az érintett MI-rendszer nagy kockázatot rejt, indokolatlan késedelem nélkül fel kell szólítania az érintett szolgáltatót, hogy tegye meg az ahhoz szükséges valamennyi intézkedést, hogy az MI-rendszer megfeleljen az e rendeletben meghatározott követelményeknek és kötelezettségeknek, valamint hogy – adott esetben a piacfelügyeleti hatóság által előírt időszakon belül – tegyen megfelelő korrekciós intézkedéseket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_80'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '80',
  '3',
  '(3) Amennyiben a piacfelügyeleti hatóság úgy ítéli meg, hogy az MI-rendszer használata nem korlátozódik az adott ország területére, indokolatlan késedelem nélkül tájékoztatnia kell a Bizottságot és a többi tagállamot az értékelés eredményeiről és azokról az intézkedésekről, amelyek megtételére a szolgáltatót felszólította.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_80'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '80',
  '4',
  '(4) A szolgáltatónak biztosítania kell, hogy minden szükséges intézkedést meghozzanak az MI-rendszer e rendeletben meghatározott követelményeknek és kötelezettségeknek való megfelelése érdekében. Amennyiben az érintett MI-rendszer szolgáltatója az e cikk (2) bekezdésében említett időszakon belül nem biztosítja az MI-rendszernek az említett követelményeknek és kötelezettségeknek való megfelelését, a szolgáltatóra a 99. cikknek megfelelő pénzbírságot kell kiszabni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_80'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '80',
  '5',
  '(5) A szolgáltató biztosítja, hogy az uniós piacon általa forgalmazott valamennyi érintett MI-rendszer tekintetében minden megfelelő korrekciós intézkedést meghozzanak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_80'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '80',
  '6',
  '(6) Amennyiben az érintett MI-rendszer szolgáltatója nem teszi meg a megfelelő korrekciós intézkedéseket az e cikk (2) bekezdésében említett időszakon belül, a 79. cikk (5)–(9) bekezdése alkalmazandó.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_80'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '80',
  '7',
  '(7) Amennyiben az e cikk (1) bekezdése szerinti értékelés során a piacfelügyeleti hatóság megállapítja, hogy a szolgáltató annak érdekében minősítette tévesen nem nagy kockázatúnak az MI-rendszert, hogy megkerülje a III. fejezet 2. szakaszában foglalt követelmények alkalmazását, a szolgáltatóra a 99. cikknek megfelelő pénzbírságot kell kiszabni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_80'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '80',
  '8',
  '(8) A piacfelügyeleti hatóságok az e cikk alkalmazásának nyomon követésére vonatkozó hatáskörük gyakorlása során, az (EU) 2019/1020 rendelet 11. cikkével összhangban megfelelő ellenőrzéseket végezhetnek, figyelembe véve különösen az e rendelet 71. cikkében említett uniós adatbázisban tárolt információkat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_80'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '81',
  null,
  'Uniós védintézkedési eljárás
(1) Amennyiben valamely tagállam piacfelügyeleti hatósága a 79. cikk (5) bekezdésében említett értesítés kézhezvételét követő három hónapon – illetve az 5. cikkben említett MI-gyakorlatok tilalmának be nem tartása esetén 30 napon – belül kifogást emel valamely más piacfelügyeleti hatóság által elfogadott intézkedéssel szemben, illetve ha a Bizottság úgy ítéli meg, hogy az intézkedés ellentétes az uniós joggal, a Bizottság indokolatlan késedelem nélkül egyeztetést kezdeményez a releváns tagállam piacfelügyeleti hatóságával és a gazdasági szereplővel vagy gazdasági szereplőkkel, és értékeli a nemzeti intézkedést. Az említett értékelés eredményei alapján a Bizottság a 79. cikk (5) bekezdésében említett értesítéstől számított hat hónapon belül – vagy az 5. cikkben említett MI-gyakorlatok tilalmának be nem tartása esetén 60 napon belül – határoz arról, hogy a nemzeti intézkedés indokolt-e, és határozatáról értesíti az érintett tagállam piacfelügyeleti hatóságát. A Bizottság a határozatáról valamennyi más piacfelügyeleti hatóságot is tájékoztat.

(2) Amennyiben az érintett tagállam által tett intézkedést a Bizottság indokoltnak ítéli, minden tagállam biztosítja, hogy megfelelő korlátozó intézkedéseket hozzon az érintett MI-rendszer tekintetében – így például előírja, hogy az MI-rendszert indokolatlan késedelem nélkül vonják ki a forgalomból –, és erről tájékoztatja a Bizottságot. Amennyiben a nemzeti intézkedést a Bizottság indokolatlannak ítéli, az érintett tagállam visszavonja az intézkedést, és erről tájékoztatja a Bizottságot.

(3) Amennyiben a nemzeti intézkedést indokoltnak ítélik, és az MI-rendszer meg nem felelése az e rendelet 40. és 41. cikkében említett harmonizált szabványok vagy közös előírások hiányosságainak a következménye, a Bizottság az 1025/2012/EU rendelet 11. cikkében előírt eljárást alkalmazza.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_81'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '81',
  '1',
  '(1) Amennyiben valamely tagállam piacfelügyeleti hatósága a 79. cikk (5) bekezdésében említett értesítés kézhezvételét követő három hónapon – illetve az 5. cikkben említett MI-gyakorlatok tilalmának be nem tartása esetén 30 napon – belül kifogást emel valamely más piacfelügyeleti hatóság által elfogadott intézkedéssel szemben, illetve ha a Bizottság úgy ítéli meg, hogy az intézkedés ellentétes az uniós joggal, a Bizottság indokolatlan késedelem nélkül egyeztetést kezdeményez a releváns tagállam piacfelügyeleti hatóságával és a gazdasági szereplővel vagy gazdasági szereplőkkel, és értékeli a nemzeti intézkedést. Az említett értékelés eredményei alapján a Bizottság a 79. cikk (5) bekezdésében említett értesítéstől számított hat hónapon belül – vagy az 5. cikkben említett MI-gyakorlatok tilalmának be nem tartása esetén 60 napon belül – határoz arról, hogy a nemzeti intézkedés indokolt-e, és határozatáról értesíti az érintett tagállam piacfelügyeleti hatóságát. A Bizottság a határozatáról valamennyi más piacfelügyeleti hatóságot is tájékoztat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_81'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '81',
  '2',
  '(2) Amennyiben az érintett tagállam által tett intézkedést a Bizottság indokoltnak ítéli, minden tagállam biztosítja, hogy megfelelő korlátozó intézkedéseket hozzon az érintett MI-rendszer tekintetében – így például előírja, hogy az MI-rendszert indokolatlan késedelem nélkül vonják ki a forgalomból –, és erről tájékoztatja a Bizottságot. Amennyiben a nemzeti intézkedést a Bizottság indokolatlannak ítéli, az érintett tagállam visszavonja az intézkedést, és erről tájékoztatja a Bizottságot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_81'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '81',
  '3',
  '(3) Amennyiben a nemzeti intézkedést indokoltnak ítélik, és az MI-rendszer meg nem felelése az e rendelet 40. és 41. cikkében említett harmonizált szabványok vagy közös előírások hiányosságainak a következménye, a Bizottság az 1025/2012/EU rendelet 11. cikkében előírt eljárást alkalmazza.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_81'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '82',
  null,
  'Kockázatot jelentő megfelelő MI-rendszerek
(1) Amennyiben egy tagállam piacfelügyeleti hatósága a 79. cikk szerinti értékelés elvégzését, és a 77. cikk (1) bekezdésében említett érintett nemzeti hatósággal való konzultációt követően megállapítja, hogy bár a nagy kockázatú MI-rendszer megfelel e rendeletnek, mindazonáltal kockázatot jelent személyek egészségére vagy biztonságára, az alapvető jogokra, vagy a közérdek védelmének egyéb szempontjaira nézve, akkor – a kockázat jellegétől függően – fel kell szólítania az érintett gazdasági szereplőt, hogy – indokolatlan késedelem nélkül, adott esetben a piacfelügyeleti hatóság által előírt időszakon belül – tegyen meg minden megfelelő intézkedést annak biztosítására, hogy az érintett MI-rendszer a forgalomba hozatalkor vagy az üzembe helyezéskor már ne jelentsen kockázatot.

(2) A szolgáltatónak vagy valamely egyéb releváns gazdasági szereplőnek biztosítania kell, hogy az uniós piacon általa forgalmazott valamennyi MI-rendszer tekintetében korrekciós intézkedéseket hozzon az (1) bekezdésben említett tagállam piacfelügyeleti hatósága által előírt határidőn belül.

(3) A tagállamok haladéktalanul tájékoztatják a Bizottságot és a többi tagállamot az (1) bekezdés szerinti megállapításokról. A tájékoztatásnak tartalmaznia kell valamennyi rendelkezésre álló adatot, különösen az érintett MI-rendszer azonosításához szükséges adatokat, az MI-rendszer származását és ellátási láncát, a felmerülő kockázat jellegét, valamint a meghozott nemzeti intézkedések jellegét és időtartamát.

(4) A Bizottság indokolatlan késedelem nélkül konzultációt kezd az érintett tagálamokkal és a releváns gazdasági szereplőkkel, valamint értékeli a meghozott nemzeti intézkedéseket. Az értékelés eredményei alapján a Bizottság határozatot hoz arról, hogy az intézkedés indokolt-e, és szükség esetén javaslatot tesz más megfelelő intézkedésekre.

(5) A Bizottság haladéktalanul közli határozatát az érintett tagállamokkal és a releváns gazdasági szereplőkkel. Tájékoztatja a többi tagállamot is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '82',
  '1',
  '(1) Amennyiben egy tagállam piacfelügyeleti hatósága a 79. cikk szerinti értékelés elvégzését, és a 77. cikk (1) bekezdésében említett érintett nemzeti hatósággal való konzultációt követően megállapítja, hogy bár a nagy kockázatú MI-rendszer megfelel e rendeletnek, mindazonáltal kockázatot jelent személyek egészségére vagy biztonságára, az alapvető jogokra, vagy a közérdek védelmének egyéb szempontjaira nézve, akkor – a kockázat jellegétől függően – fel kell szólítania az érintett gazdasági szereplőt, hogy – indokolatlan késedelem nélkül, adott esetben a piacfelügyeleti hatóság által előírt időszakon belül – tegyen meg minden megfelelő intézkedést annak biztosítására, hogy az érintett MI-rendszer a forgalomba hozatalkor vagy az üzembe helyezéskor már ne jelentsen kockázatot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '82',
  '2',
  '(2) A szolgáltatónak vagy valamely egyéb releváns gazdasági szereplőnek biztosítania kell, hogy az uniós piacon általa forgalmazott valamennyi MI-rendszer tekintetében korrekciós intézkedéseket hozzon az (1) bekezdésben említett tagállam piacfelügyeleti hatósága által előírt határidőn belül.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '82',
  '3',
  '(3) A tagállamok haladéktalanul tájékoztatják a Bizottságot és a többi tagállamot az (1) bekezdés szerinti megállapításokról. A tájékoztatásnak tartalmaznia kell valamennyi rendelkezésre álló adatot, különösen az érintett MI-rendszer azonosításához szükséges adatokat, az MI-rendszer származását és ellátási láncát, a felmerülő kockázat jellegét, valamint a meghozott nemzeti intézkedések jellegét és időtartamát.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '82',
  '4',
  '(4) A Bizottság indokolatlan késedelem nélkül konzultációt kezd az érintett tagálamokkal és a releváns gazdasági szereplőkkel, valamint értékeli a meghozott nemzeti intézkedéseket. Az értékelés eredményei alapján a Bizottság határozatot hoz arról, hogy az intézkedés indokolt-e, és szükség esetén javaslatot tesz más megfelelő intézkedésekre.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '82',
  '5',
  '(5) A Bizottság haladéktalanul közli határozatát az érintett tagállamokkal és a releváns gazdasági szereplőkkel. Tájékoztatja a többi tagállamot is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_82'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '83',
  null,
  'Alaki meg nem felelés
(1) Amennyiben egy tagállam piacfelügyeleti hatósága megteszi a következő megállapítások egyikét, meg kell követelnie a releváns szolgáltatótól, hogy – az esetlegesen előírt időszakon belül – szüntesse meg az érintett meg nem felelést:

a)

a CE-jelölést a 48. cikket megsértő módon helyezték el;

b)

nem helyeztek el CE-jelölést;

c)

nem készült a 47. cikkben említett EU-megfelelőségi nyilatkozat;

d)

a 47. cikkben említett EU-megfelelőségi nyilatkozatot nem megfelelően készítették el;

e)

nem végezték el a 71. cikkben említett uniós adatbázisba történő regisztrációt;

f)

nem neveztek ki adott esetben meghatalmazott képviselőt;

g)

nem áll rendelkezésre műszaki dokumentáció.

(2) Amennyiben az (1) bekezdésben említett meg nem felelés továbbra is fennáll, az érintett tagállam piacfelügyeleti hatóságának megfelelő és arányos intézkedéseket kell hoznia a nagy kockázatú MI-rendszer forgalmazásának korlátozása vagy betiltása céljából, vagy gondoskodnia kell annak haladéktalan visszahívásáról vagy piaci forgalomból történő kivonásáról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '83',
  '1',
  '(1) Amennyiben egy tagállam piacfelügyeleti hatósága megteszi a következő megállapítások egyikét, meg kell követelnie a releváns szolgáltatótól, hogy – az esetlegesen előírt időszakon belül – szüntesse meg az érintett meg nem felelést:

a)

a CE-jelölést a 48. cikket megsértő módon helyezték el;

b)

nem helyeztek el CE-jelölést;

c)

nem készült a 47. cikkben említett EU-megfelelőségi nyilatkozat;

d)

a 47. cikkben említett EU-megfelelőségi nyilatkozatot nem megfelelően készítették el;

e)

nem végezték el a 71. cikkben említett uniós adatbázisba történő regisztrációt;

f)

nem neveztek ki adott esetben meghatalmazott képviselőt;

g)

nem áll rendelkezésre műszaki dokumentáció.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '83',
  '1(a)',
  'a) a CE-jelölést a 48. cikket megsértő módon helyezték el;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '83',
  '1(b)',
  'b) nem helyeztek el CE-jelölést;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '83',
  '1(c)',
  'c) nem készült a 47. cikkben említett EU-megfelelőségi nyilatkozat;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '83',
  '1(d)',
  'd) a 47. cikkben említett EU-megfelelőségi nyilatkozatot nem megfelelően készítették el;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '83',
  '1(e)',
  'e) nem végezték el a 71. cikkben említett uniós adatbázisba történő regisztrációt;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '83',
  '1(f)',
  'f) nem neveztek ki adott esetben meghatalmazott képviselőt;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '83',
  '1(g)',
  'g) nem áll rendelkezésre műszaki dokumentáció.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '83',
  '2',
  '(2) Amennyiben az (1) bekezdésben említett meg nem felelés továbbra is fennáll, az érintett tagállam piacfelügyeleti hatóságának megfelelő és arányos intézkedéseket kell hoznia a nagy kockázatú MI-rendszer forgalmazásának korlátozása vagy betiltása céljából, vagy gondoskodnia kell annak haladéktalan visszahívásáról vagy piaci forgalomból történő kivonásáról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_83'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '84',
  null,
  'Uniós MI-tesztelési támogató struktúrák
(1) A Bizottság kijelöl egy vagy több uniós MI-tesztelési támogató struktúrát az (EU) 2019/1020 rendelet 21. cikkének (6) bekezdésében felsorolt feladatoknak az MI területén való elvégzésére.

(2) Az (1) bekezdésben említett feladatok sérelme nélkül, az uniós MI-tesztelési támogató struktúrák – a Testület, a Bizottság vagy a piacfelügyeleti hatóságok kérésére – független műszaki vagy tudományos tanácsadást is nyújtanak.

4. SZAKASZ

Jogorvoslatok',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_84'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '84',
  '1',
  '(1) A Bizottság kijelöl egy vagy több uniós MI-tesztelési támogató struktúrát az (EU) 2019/1020 rendelet 21. cikkének (6) bekezdésében felsorolt feladatoknak az MI területén való elvégzésére.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_84'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '84',
  '2',
  '(2) Az (1) bekezdésben említett feladatok sérelme nélkül, az uniós MI-tesztelési támogató struktúrák – a Testület, a Bizottság vagy a piacfelügyeleti hatóságok kérésére – független műszaki vagy tudományos tanácsadást is nyújtanak.

4. SZAKASZ

Jogorvoslatok',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_84'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '85',
  null,
  'A piacfelügyeleti hatóságnál történő panasztételhez való jog
Az egyéb közigazgatási vagy bírósági jogorvoslatok sérelme nélkül, bármely olyan természetes vagy jogi személy, aki vagy amely okkal feltételezi, hogy e rendelet rendelkezéseit megsértették, panaszokat nyújthat be a releváns piacfelügyeleti hatósághoz.

Az ilyen panaszokat – az (EU) 2019/1020 rendelettel összhangban – figyelembe kell venni a piacfelügyeleti tevékenységek végzése céljából, és azokat a piacfelügyeleti hatóságok által erre meghatározott, célzott eljárásokkal összhangban kell kezelni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_85'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '86',
  null,
  'Az egyéni döntéshozatal magyarázatához való jog
(1) Minden olyan érintett személy számára, aki egy olyan döntés hatálya alá tartozik, amelyet az alkalmazó a III. mellékletben – az annak 2. pontjában felsorolt rendszerek kivételével – felsorolt valamely nagy kockázatú MI-rendszer kimenete alapján hozott, és amely joghatásokat vált ki, vagy az említett személyt hasonlóan jelentősen érinti oly módon, hogy annak megítélése szerint a döntés kedvezőtlen hatást gyakorol az egészségére, biztonságára vagy alapvető jogaira, biztosítani kell az ahhoz való jogot, hogy az alkalmazótól egyértelmű és érdemi magyarázatot kapjon az MI-rendszernek a döntéshozatali eljárásban betöltött szerepéről és a hozott döntés fő elemeiről.

(2) Az (1) bekezdés nem alkalmazandó az olyan MI-rendszerek használatára, amelyek esetében az említett bekezdés szerinti kötelezettség alóli kivételek vagy az arra vonatkozó korlátozások az uniós jogból vagy az uniós jognak megfelelő nemzeti jogból következnek.

(3) Ez a cikk csak annyiban alkalmazandó, amennyiben az (1) bekezdésben említett jogról az uniós jog másként nem rendelkezik.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_86'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '86',
  '1',
  '(1) Minden olyan érintett személy számára, aki egy olyan döntés hatálya alá tartozik, amelyet az alkalmazó a III. mellékletben – az annak 2. pontjában felsorolt rendszerek kivételével – felsorolt valamely nagy kockázatú MI-rendszer kimenete alapján hozott, és amely joghatásokat vált ki, vagy az említett személyt hasonlóan jelentősen érinti oly módon, hogy annak megítélése szerint a döntés kedvezőtlen hatást gyakorol az egészségére, biztonságára vagy alapvető jogaira, biztosítani kell az ahhoz való jogot, hogy az alkalmazótól egyértelmű és érdemi magyarázatot kapjon az MI-rendszernek a döntéshozatali eljárásban betöltött szerepéről és a hozott döntés fő elemeiről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_86'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '86',
  '2',
  '(2) Az (1) bekezdés nem alkalmazandó az olyan MI-rendszerek használatára, amelyek esetében az említett bekezdés szerinti kötelezettség alóli kivételek vagy az arra vonatkozó korlátozások az uniós jogból vagy az uniós jognak megfelelő nemzeti jogból következnek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_86'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '86',
  '3',
  '(3) Ez a cikk csak annyiban alkalmazandó, amennyiben az (1) bekezdésben említett jogról az uniós jog másként nem rendelkezik.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_86'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '87',
  null,
  'A jogsértések bejelentése és a bejelentő személyek védelme
Az e rendelet megsértéseinek bejelentésére és az ilyen jogsértéseket bejelentő személyek védelmére az (EU) 2019/1937 irányelv alkalmazandó.

5. SZAKASZ

Felügyelet, vizsgálat, végrehajtás és nyomon követés az általános célú MI-modellek szolgáltatói tekintetében',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_87'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '88',
  null,
  'Az általános célú MI-modellek szolgáltatói kötelezettségeinek végrehajtása
(1) A Bizottság – figyelembe véve a 94. cikk szerinti eljárási garanciákat – kizárólagos hatáskörrel rendelkezik az V. fejezetben foglaltak felügyeletére és végrehajtására. A Bizottság e feladatok végrehajtásával az MI-hivatalt bízza meg, ami nem érinti a Bizottság szervezési hatásköreit, valamint a hatásköröknek az Unió és a tagállamok közötti, a Szerződéseken alapuló megosztását.

(2) Anélkül, hogy ez sértené a 75. cikk (3) bekezdését, a piacfelügyeleti hatóságok, amennyiben ez szükséges az e rendelet szerinti feladataik ellátásához, és arányos azzal, felkérhetik a Bizottságot az e szakaszban megállapított hatáskörök gyakorlására.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_88'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '88',
  '1',
  '(1) A Bizottság – figyelembe véve a 94. cikk szerinti eljárási garanciákat – kizárólagos hatáskörrel rendelkezik az V. fejezetben foglaltak felügyeletére és végrehajtására. A Bizottság e feladatok végrehajtásával az MI-hivatalt bízza meg, ami nem érinti a Bizottság szervezési hatásköreit, valamint a hatásköröknek az Unió és a tagállamok közötti, a Szerződéseken alapuló megosztását.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_88'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '88',
  '2',
  '(2) Anélkül, hogy ez sértené a 75. cikk (3) bekezdését, a piacfelügyeleti hatóságok, amennyiben ez szükséges az e rendelet szerinti feladataik ellátásához, és arányos azzal, felkérhetik a Bizottságot az e szakaszban megállapított hatáskörök gyakorlására.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_88'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '89',
  null,
  'Nyomonkövetési intézkedések
(1) Az MI-hivatal – az e szakasz alapján ráruházott feladatok ellátása céljából – meghozhatja azon intézkedéseket, amelyek a hatékony végrehajtásnak, valamint annak nyomon követéséhez szükségesek, hogy az általános célú MI-modellek szolgáltatói megfelelnek-e ezen rendeletnek, ideértve a jóváhagyott gyakorlati kódexek betartását is.

(2) A downstream szolgáltatók számára jogot kell biztosítani ahhoz, hogy panaszt nyújtsanak be e rendelet feltételezett megsértése miatt. A panaszt megfelelően meg kell indokolni, és abban legalább a következőket fel kell tüntetni:

a)

az érintett általános célú MI-modell szolgáltatójának kapcsolattartó pontja;

b)

a releváns tények, e rendelet érintett rendelkezései, valamint annak megindokolása, hogy a downstream szolgáltató miért véli úgy, hogy az érintett általános célú MI-modell szolgáltatója megsértette e rendeletet;

c)

bármely egyéb olyan információ, amelyet a kérelmet benyújtó downstream szolgáltató relevánsnak tekint, beleértve adott esetben a saját kezdeményezésére gyűjtött információkat is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_89'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '89',
  '1',
  '(1) Az MI-hivatal – az e szakasz alapján ráruházott feladatok ellátása céljából – meghozhatja azon intézkedéseket, amelyek a hatékony végrehajtásnak, valamint annak nyomon követéséhez szükségesek, hogy az általános célú MI-modellek szolgáltatói megfelelnek-e ezen rendeletnek, ideértve a jóváhagyott gyakorlati kódexek betartását is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_89'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '89',
  '2',
  '(2) A downstream szolgáltatók számára jogot kell biztosítani ahhoz, hogy panaszt nyújtsanak be e rendelet feltételezett megsértése miatt. A panaszt megfelelően meg kell indokolni, és abban legalább a következőket fel kell tüntetni:

a)

az érintett általános célú MI-modell szolgáltatójának kapcsolattartó pontja;

b)

a releváns tények, e rendelet érintett rendelkezései, valamint annak megindokolása, hogy a downstream szolgáltató miért véli úgy, hogy az érintett általános célú MI-modell szolgáltatója megsértette e rendeletet;

c)

bármely egyéb olyan információ, amelyet a kérelmet benyújtó downstream szolgáltató relevánsnak tekint, beleértve adott esetben a saját kezdeményezésére gyűjtött információkat is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_89'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '89',
  '2(a)',
  'a) az érintett általános célú MI-modell szolgáltatójának kapcsolattartó pontja;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_89'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '89',
  '2(b)',
  'b) a releváns tények, e rendelet érintett rendelkezései, valamint annak megindokolása, hogy a downstream szolgáltató miért véli úgy, hogy az érintett általános célú MI-modell szolgáltatója megsértette e rendeletet;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_89'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '89',
  '2(c)',
  'c) bármely egyéb olyan információ, amelyet a kérelmet benyújtó downstream szolgáltató relevánsnak tekint, beleértve adott esetben a saját kezdeményezésére gyűjtött információkat is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_89'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '90',
  null,
  'A tudományos testület rendszerszintű kockázatokra vonatkozó riasztásai
(1) A tudományos testület minősített riasztást küldhet az MI-hivatal számára, ha oka van úgy megítélni, hogy:

a)

egy általános célú MI-modell konkrét és azonosítható kockázatot hordoz uniós szinten; vagy

b)

az általános célú MI-modell megfelel az 51. cikkben említett feltételeknek.

(2) Az említett minősített riasztás alapján a Bizottság az MI-hivatalon keresztül és a Testület tájékoztatását követően gyakorolhatja az e szakaszban az ügy értékelése céljából meghatározott hatásköröket. Az MI-hivatalnak tájékoztatnia kell a Testületet a 91–94. cikk szerinti intézkedésekről.

(3) A minősített riasztást megfelelően meg kell indokolni, és abban legalább a következőket fel kell tüntetni:

a)

az érintett, rendszerszintű kockázatot jelentő általános célú MI-modell szolgáltatójának kapcsolattartó pontja;

b)

a releváns tények leírása és a tudományos testület általi riasztás indokolása;

c)

bármely egyéb olyan információ, amelyet a tudományos testület relevánsnak tekint, ideértve adott esetben a saját kezdeményezésére gyűjtött információkat is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_90'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '90',
  '1',
  '(1) A tudományos testület minősített riasztást küldhet az MI-hivatal számára, ha oka van úgy megítélni, hogy:

a)

egy általános célú MI-modell konkrét és azonosítható kockázatot hordoz uniós szinten; vagy

b)

az általános célú MI-modell megfelel az 51. cikkben említett feltételeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_90'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '90',
  '1(a)',
  'a) egy általános célú MI-modell konkrét és azonosítható kockázatot hordoz uniós szinten; vagy',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_90'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '90',
  '1(b)',
  'b) az általános célú MI-modell megfelel az 51. cikkben említett feltételeknek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_90'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '90',
  '2',
  '(2) Az említett minősített riasztás alapján a Bizottság az MI-hivatalon keresztül és a Testület tájékoztatását követően gyakorolhatja az e szakaszban az ügy értékelése céljából meghatározott hatásköröket. Az MI-hivatalnak tájékoztatnia kell a Testületet a 91–94. cikk szerinti intézkedésekről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_90'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '90',
  '3',
  '(3) A minősített riasztást megfelelően meg kell indokolni, és abban legalább a következőket fel kell tüntetni:

a)

az érintett, rendszerszintű kockázatot jelentő általános célú MI-modell szolgáltatójának kapcsolattartó pontja;

b)

a releváns tények leírása és a tudományos testület általi riasztás indokolása;

c)

bármely egyéb olyan információ, amelyet a tudományos testület relevánsnak tekint, ideértve adott esetben a saját kezdeményezésére gyűjtött információkat is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_90'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '90',
  '3(a)',
  'a) az érintett, rendszerszintű kockázatot jelentő általános célú MI-modell szolgáltatójának kapcsolattartó pontja;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_90'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '90',
  '3(b)',
  'b) a releváns tények leírása és a tudományos testület általi riasztás indokolása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_90'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '90',
  '3(c)',
  'c) bármely egyéb olyan információ, amelyet a tudományos testület relevánsnak tekint, ideértve adott esetben a saját kezdeményezésére gyűjtött információkat is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_90'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '91',
  null,
  'A dokumentáció és információk bekérésére vonatkozó hatáskör
(1) A Bizottság felkérheti az érintett általános célú MI-modell szolgáltatóját, hogy nyújtsa be a szolgáltató által az 53. és 55. cikknek megfelelően elkészített dokumentációt, illetve bármely olyan további információt, amely szükséges annak értékeléséhez, hogy a szolgáltató megfelel-e ezen rendeletnek.

(2) Az információkérés elküldése előtt az MI-hivatal strukturált párbeszédet kezdeményezhet az általános célú MI-modell szolgáltatójával.

(3) A tudományos testület kellően indokolt kérésére a Bizottság információkérést intézhet az általános célú MI-modell szolgáltatójához, amennyiben az információkhoz való hozzáférés szükséges a tudományos testület 68. cikk (2) bekezdése szerinti feladatainak ellátásához, és arányos azzal.

(4) Az információkérésben fel kell tüntetni a kérés jogalapját és célját, meg kell jelölni, hogy mely információkra van szükség, meg kell határozni az információk rendelkezésre bocsátására vonatkozó határidőt, továbbá meg kell jelölni a 101. cikkben foglalt, a helytelen, hiányos vagy félrevezető információk szolgáltatása esetén kiszabandó bírságokat.

(5) Az érintett általános célú MI-modell szolgáltatójának vagy annak képviselőjének rendelkezésre kell bocsátania a kért információkat. Jogi személyek, társaságok vagy cégek esetében, illetve ha a szolgáltató nem rendelkezik jogi személyiséggel, a kért információkat az említettek képviseletére a jogszabály vagy az alapszabályuk által felhatalmazott személyek bocsátják rendelkezésre az érintett általános célú MI-modell szolgáltatója nevében. A megfelelő meghatalmazással rendelkező ügyvédek jogosultak arra, hogy ügyfeleik nevében információkat szolgáltassanak. Mindazonáltal továbbra is teljes mértékben az ügyfelek felelnek azért, ha a szolgáltatott információk hiányosak, helytelenek vagy félrevezetők.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_91'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '91',
  '1',
  '(1) A Bizottság felkérheti az érintett általános célú MI-modell szolgáltatóját, hogy nyújtsa be a szolgáltató által az 53. és 55. cikknek megfelelően elkészített dokumentációt, illetve bármely olyan további információt, amely szükséges annak értékeléséhez, hogy a szolgáltató megfelel-e ezen rendeletnek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_91'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '91',
  '2',
  '(2) Az információkérés elküldése előtt az MI-hivatal strukturált párbeszédet kezdeményezhet az általános célú MI-modell szolgáltatójával.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_91'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '91',
  '3',
  '(3) A tudományos testület kellően indokolt kérésére a Bizottság információkérést intézhet az általános célú MI-modell szolgáltatójához, amennyiben az információkhoz való hozzáférés szükséges a tudományos testület 68. cikk (2) bekezdése szerinti feladatainak ellátásához, és arányos azzal.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_91'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '91',
  '4',
  '(4) Az információkérésben fel kell tüntetni a kérés jogalapját és célját, meg kell jelölni, hogy mely információkra van szükség, meg kell határozni az információk rendelkezésre bocsátására vonatkozó határidőt, továbbá meg kell jelölni a 101. cikkben foglalt, a helytelen, hiányos vagy félrevezető információk szolgáltatása esetén kiszabandó bírságokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_91'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '91',
  '5',
  '(5) Az érintett általános célú MI-modell szolgáltatójának vagy annak képviselőjének rendelkezésre kell bocsátania a kért információkat. Jogi személyek, társaságok vagy cégek esetében, illetve ha a szolgáltató nem rendelkezik jogi személyiséggel, a kért információkat az említettek képviseletére a jogszabály vagy az alapszabályuk által felhatalmazott személyek bocsátják rendelkezésre az érintett általános célú MI-modell szolgáltatója nevében. A megfelelő meghatalmazással rendelkező ügyvédek jogosultak arra, hogy ügyfeleik nevében információkat szolgáltassanak. Mindazonáltal továbbra is teljes mértékben az ügyfelek felelnek azért, ha a szolgáltatott információk hiányosak, helytelenek vagy félrevezetők.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_91'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '92',
  null,
  'Értékelések végzésére vonatkozó hatáskör
(1) Az MI-hivatal a Testülettel folytatott konzultációt követően az érintett általános célú MI-modellre vonatkozó értékeléseket végezhet annak érdekében, hogy:

a)

értékelje, hogy a szolgáltató megfelel-e az e rendelet szerinti kötelezettségeknek, amennyiben a 91. cikk alapján gyűjtött információk nem elégségesek; vagy

b)

különösen a tudományos testület által a 90. cikk (1) bekezdésének a) pontjával összhangban adott minősített riasztást követően megvizsgálja a rendszerszintű kockázatot jelentő általános célú MI-modellek rendszerszintű kockázatait uniós szinten.

(2) A Bizottság dönthet úgy, hogy – többek között a 68. cikk alapján létrehozott tudományos testület soraiból – független szakértőket jelöl ki az értékeléseknek a Bizottság nevében történő elvégzésére. Az e feladatra kijelölt független szakértőknek meg kell felelniük a 68. cikk (2) bekezdésében meghatározott kritériumoknak.

(3) Az (1) bekezdés alkalmazásában a Bizottság API-kon vagy további megfelelő műszaki megoldásokon és eszközökön – többek között forráskódon – keresztül hozzáférést kérhet az érintett általános célú MI-modellhez.

(4) A hozzáférés iránti kérelemben fel kell tüntetni a kérelem jogalapját, célját és indokait, valamint meg kell határozni azon időszakot, amelyen belül a hozzáférés biztosítandó, és a 101. cikkben a hozzáférés biztosításának elmulasztása esetére előírt bírságokat.

(5) Az érintett általános célú MI-modell szolgáltatóinak vagy képviselőinek meg kell adniuk a kért információkat. Jogi személyek, társaságok vagy cégek esetében, vagy ha a szolgáltató nem rendelkezik jogi személyiséggel, az érintett általános célú MI-modell szolgáltatója nevében az említettek képviseletére jogszabály vagy a létesítő okiratuk által felhatalmazott személyek biztosítják a kért hozzáférést.

(6) A Bizottság végrehajtási jogi aktusokat fogad el, amelyekben meghatározza az értékelések részletes szabályait és feltételeit, ideértve a független szakértők bevonására vonatkozó részletes szabályokat és a kiválasztásukra irányuló eljárást. Ezeket a végrehajtási jogi aktusokat a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.

(7) Az érintett általános célú MI-modellhez való hozzáférés kérelmezése előtt az MI-hivatal strukturált párbeszédet kezdeményezhet az általános célú MI-modell szolgáltatójával annak érdekében, hogy több információt gyűjtsön a modell belső teszteléséről, a rendszerszintű kockázatok megelőzésére szolgáló belső biztosítékokról, valamint a szolgáltató által az ilyen kockázatok enyhítése érdekében hozott egyéb belső eljárásokról és intézkedésekről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '92',
  '1',
  '(1) Az MI-hivatal a Testülettel folytatott konzultációt követően az érintett általános célú MI-modellre vonatkozó értékeléseket végezhet annak érdekében, hogy:

a)

értékelje, hogy a szolgáltató megfelel-e az e rendelet szerinti kötelezettségeknek, amennyiben a 91. cikk alapján gyűjtött információk nem elégségesek; vagy

b)

különösen a tudományos testület által a 90. cikk (1) bekezdésének a) pontjával összhangban adott minősített riasztást követően megvizsgálja a rendszerszintű kockázatot jelentő általános célú MI-modellek rendszerszintű kockázatait uniós szinten.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '92',
  '1(a)',
  'a) értékelje, hogy a szolgáltató megfelel-e az e rendelet szerinti kötelezettségeknek, amennyiben a 91. cikk alapján gyűjtött információk nem elégségesek; vagy',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '92',
  '1(b)',
  'b) különösen a tudományos testület által a 90. cikk (1) bekezdésének a) pontjával összhangban adott minősített riasztást követően megvizsgálja a rendszerszintű kockázatot jelentő általános célú MI-modellek rendszerszintű kockázatait uniós szinten.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '92',
  '2',
  '(2) A Bizottság dönthet úgy, hogy – többek között a 68. cikk alapján létrehozott tudományos testület soraiból – független szakértőket jelöl ki az értékeléseknek a Bizottság nevében történő elvégzésére. Az e feladatra kijelölt független szakértőknek meg kell felelniük a 68. cikk (2) bekezdésében meghatározott kritériumoknak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '92',
  '3',
  '(3) Az (1) bekezdés alkalmazásában a Bizottság API-kon vagy további megfelelő műszaki megoldásokon és eszközökön – többek között forráskódon – keresztül hozzáférést kérhet az érintett általános célú MI-modellhez.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '92',
  '4',
  '(4) A hozzáférés iránti kérelemben fel kell tüntetni a kérelem jogalapját, célját és indokait, valamint meg kell határozni azon időszakot, amelyen belül a hozzáférés biztosítandó, és a 101. cikkben a hozzáférés biztosításának elmulasztása esetére előírt bírságokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '92',
  '5',
  '(5) Az érintett általános célú MI-modell szolgáltatóinak vagy képviselőinek meg kell adniuk a kért információkat. Jogi személyek, társaságok vagy cégek esetében, vagy ha a szolgáltató nem rendelkezik jogi személyiséggel, az érintett általános célú MI-modell szolgáltatója nevében az említettek képviseletére jogszabály vagy a létesítő okiratuk által felhatalmazott személyek biztosítják a kért hozzáférést.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '92',
  '6',
  '(6) A Bizottság végrehajtási jogi aktusokat fogad el, amelyekben meghatározza az értékelések részletes szabályait és feltételeit, ideértve a független szakértők bevonására vonatkozó részletes szabályokat és a kiválasztásukra irányuló eljárást. Ezeket a végrehajtási jogi aktusokat a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '92',
  '7',
  '(7) Az érintett általános célú MI-modellhez való hozzáférés kérelmezése előtt az MI-hivatal strukturált párbeszédet kezdeményezhet az általános célú MI-modell szolgáltatójával annak érdekében, hogy több információt gyűjtsön a modell belső teszteléséről, a rendszerszintű kockázatok megelőzésére szolgáló belső biztosítékokról, valamint a szolgáltató által az ilyen kockázatok enyhítése érdekében hozott egyéb belső eljárásokról és intézkedésekről.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_92'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '93',
  null,
  'Intézkedések előírására vonatkozó hatáskör
(1) Amennyiben szükséges és helyénvaló, a Bizottság előírhatja a szolgáltatók számára, hogy:

a)

hozzanak megfelelő intézkedéseket az 53. és az 54. cikkben meghatározott kötelezettségeknek való megfelelés érdekében;

b)

kockázatenyhítő intézkedéseket hajtanak végre, amennyiben a 92. cikkel összhangban elvégzett értékelés komoly és megalapozott aggályokat vetett fel valamely uniós szinten fennálló rendszerszintű kockázattal kapcsolatban;

c)

korlátozzák a modell forgalmazását, vonják ki a modellt a forgalomból vagy hívják vissza azt.

(2) Azt megelőzően, hogy sor kerül valamely intézkedés előírására, az MI-hivatal strukturált párbeszédet kezdeményezhet az általános célú MI-modell szolgáltatójával.

(3) Ha a (2) bekezdésben említett strukturált párbeszéd során a rendszerszintű kockázatot jelentő általános célú MI-modell szolgáltatója kötelezettséget vállal arra, hogy kockázatcsökkentő intézkedéseket hajt végre egy uniós szinten fennálló rendszerszintű kockázat kezelése érdekében, a Bizottság – határozat útján – kötelező erejűvé nyilváníthatja ezeket a kötelezettségvállalásokat, és megállapíthatja, hogy további intézkedések nem indokoltak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_93'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '93',
  '1',
  '(1) Amennyiben szükséges és helyénvaló, a Bizottság előírhatja a szolgáltatók számára, hogy:

a)

hozzanak megfelelő intézkedéseket az 53. és az 54. cikkben meghatározott kötelezettségeknek való megfelelés érdekében;

b)

kockázatenyhítő intézkedéseket hajtanak végre, amennyiben a 92. cikkel összhangban elvégzett értékelés komoly és megalapozott aggályokat vetett fel valamely uniós szinten fennálló rendszerszintű kockázattal kapcsolatban;

c)

korlátozzák a modell forgalmazását, vonják ki a modellt a forgalomból vagy hívják vissza azt.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_93'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '93',
  '1(a)',
  'a) hozzanak megfelelő intézkedéseket az 53. és az 54. cikkben meghatározott kötelezettségeknek való megfelelés érdekében;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_93'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '93',
  '1(b)',
  'b) kockázatenyhítő intézkedéseket hajtanak végre, amennyiben a 92. cikkel összhangban elvégzett értékelés komoly és megalapozott aggályokat vetett fel valamely uniós szinten fennálló rendszerszintű kockázattal kapcsolatban;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_93'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '93',
  '1(c)',
  'c) korlátozzák a modell forgalmazását, vonják ki a modellt a forgalomból vagy hívják vissza azt.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_93'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '93',
  '2',
  '(2) Azt megelőzően, hogy sor kerül valamely intézkedés előírására, az MI-hivatal strukturált párbeszédet kezdeményezhet az általános célú MI-modell szolgáltatójával.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_93'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '93',
  '3',
  '(3) Ha a (2) bekezdésben említett strukturált párbeszéd során a rendszerszintű kockázatot jelentő általános célú MI-modell szolgáltatója kötelezettséget vállal arra, hogy kockázatcsökkentő intézkedéseket hajt végre egy uniós szinten fennálló rendszerszintű kockázat kezelése érdekében, a Bizottság – határozat útján – kötelező erejűvé nyilváníthatja ezeket a kötelezettségvállalásokat, és megállapíthatja, hogy további intézkedések nem indokoltak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_93'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '94',
  null,
  'Az általános célú MI-modell gazdasági szereplőinek eljárási jogai
Az (EU) 2019/1020 rendelet 18. cikke – az e rendelet által előírt konkrétabb eljárási jogok sérelme nélkül – értelemszerűen alkalmazandó az általános célú MI-modell szolgáltatóira.

X. FEJEZET

MAGATARTÁSI KÓDEXEK ÉS IRÁNYMUTATÁSOK',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_94'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '95',
  null,
  'A konkrét követelmények önkéntes alkalmazására vonatkozó magatartási kódexek
(1) Az MI-hivatal és a tagállamok ösztönzik és elősegítik olyan – a vonatkozó irányítási mechanizmusokat is magukban foglaló – magatartási kódexek kidolgozását, amelyek célja előmozdítani az e rendelet III. fejezetének 2. szakaszában meghatározott követelmények közül néhánynak vagy valamennyinek a nagy kockázatú MI-rendszerektől eltérő MI-rendszerekre történő önkéntes alkalmazását, figyelembe véve az ilyen követelmények alkalmazását lehetővé tevő, rendelkezésre álló műszaki megoldásokat és iparági legjobb gyakorlatokat.

(2) Az MI-hivatal és a tagállamok elősegítik olyan magatartási kódexek kidolgozását, amelyek a konkrét követelmények valamennyi MI-rendszerre való – többek között az alkalmazók általi – önkéntes alkalmazására vonatkoznak, egyértelmű célkitűzések és e célkitűzések elérésének mérésére szolgáló fő teljesítménymutatók alapján, beleértve például, de nem kizárólagosan a következő elemeket:

a)

a megbízható mesterséges intelligenciára alkalmazandó uniós etikai iránymutatásokban előírt, alkalmazandó elemek;

b)

az MI-rendszerek környezeti fenntarthatóságra gyakorolt hatásának értékelése és minimalizálása, többek között az energiahatékony programozás és a mesterséges intelligencia hatékony tervezését, betanítását és használatát szolgáló technikák tekintetében;

c)

az MI-jártasság előmozdítása, különösen a mesterséges intelligencia fejlesztésével, üzemeltetésével és használatával foglalkozó személyek körében;

d)

az MI-rendszerek kialakítása során az inkluzivitás és a sokszínűség elősegítése, többek között inkluzív és sokszínű fejlesztői csapatok létrehozása és az érdekelt felek e folyamatban való részvételének előmozdítása révén;

e)

azon negatív hatások értékelése és megelőzése, amelyeket az MI-rendszerek a kiszolgáltatott személyekre vagy a kiszolgáltatott személyek csoportjaira – ideértve a fogyatékossággal élő személyeknek biztosítandó akadálymentességet is –, valamint a nemek közötti egyenlőségre gyakorolnak.

(3) Az MI-rendszerek egyes szolgáltatói vagy alkalmazói, vagy az azokat képviselő szervezetek vagy mindkettő magatartási kódexeket készíthetnek, többek között bármely érdekelt fél és képviseleti szervezetei – ideértve a civil szféra szervezeteit és a tudományos köröket is – bevonásával. A magatartási kódexek vonatkozhatnak egy vagy több MI-rendszerre, figyelembe véve az adott rendszerek rendeltetésének hasonlóságát.

(4) A magatartási kódexek kidolgozásának ösztönzése és elősegítése során az MI-hivatal és a tagállamok figyelembe veszik a kkv-k – köztük az induló innovatív vállalkozások – sajátos érdekeit és igényeit.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_95'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '95',
  '1',
  '(1) Az MI-hivatal és a tagállamok ösztönzik és elősegítik olyan – a vonatkozó irányítási mechanizmusokat is magukban foglaló – magatartási kódexek kidolgozását, amelyek célja előmozdítani az e rendelet III. fejezetének 2. szakaszában meghatározott követelmények közül néhánynak vagy valamennyinek a nagy kockázatú MI-rendszerektől eltérő MI-rendszerekre történő önkéntes alkalmazását, figyelembe véve az ilyen követelmények alkalmazását lehetővé tevő, rendelkezésre álló műszaki megoldásokat és iparági legjobb gyakorlatokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_95'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '95',
  '2',
  '(2) Az MI-hivatal és a tagállamok elősegítik olyan magatartási kódexek kidolgozását, amelyek a konkrét követelmények valamennyi MI-rendszerre való – többek között az alkalmazók általi – önkéntes alkalmazására vonatkoznak, egyértelmű célkitűzések és e célkitűzések elérésének mérésére szolgáló fő teljesítménymutatók alapján, beleértve például, de nem kizárólagosan a következő elemeket:

a)

a megbízható mesterséges intelligenciára alkalmazandó uniós etikai iránymutatásokban előírt, alkalmazandó elemek;

b)

az MI-rendszerek környezeti fenntarthatóságra gyakorolt hatásának értékelése és minimalizálása, többek között az energiahatékony programozás és a mesterséges intelligencia hatékony tervezését, betanítását és használatát szolgáló technikák tekintetében;

c)

az MI-jártasság előmozdítása, különösen a mesterséges intelligencia fejlesztésével, üzemeltetésével és használatával foglalkozó személyek körében;

d)

az MI-rendszerek kialakítása során az inkluzivitás és a sokszínűség elősegítése, többek között inkluzív és sokszínű fejlesztői csapatok létrehozása és az érdekelt felek e folyamatban való részvételének előmozdítása révén;

e)

azon negatív hatások értékelése és megelőzése, amelyeket az MI-rendszerek a kiszolgáltatott személyekre vagy a kiszolgáltatott személyek csoportjaira – ideértve a fogyatékossággal élő személyeknek biztosítandó akadálymentességet is –, valamint a nemek közötti egyenlőségre gyakorolnak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_95'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '95',
  '2(a)',
  'a) a megbízható mesterséges intelligenciára alkalmazandó uniós etikai iránymutatásokban előírt, alkalmazandó elemek;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_95'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '95',
  '2(b)',
  'b) az MI-rendszerek környezeti fenntarthatóságra gyakorolt hatásának értékelése és minimalizálása, többek között az energiahatékony programozás és a mesterséges intelligencia hatékony tervezését, betanítását és használatát szolgáló technikák tekintetében;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_95'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '95',
  '2(c)',
  'c) az MI-jártasság előmozdítása, különösen a mesterséges intelligencia fejlesztésével, üzemeltetésével és használatával foglalkozó személyek körében;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_95'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '95',
  '2(d)',
  'd) az MI-rendszerek kialakítása során az inkluzivitás és a sokszínűség elősegítése, többek között inkluzív és sokszínű fejlesztői csapatok létrehozása és az érdekelt felek e folyamatban való részvételének előmozdítása révén;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_95'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '95',
  '2(e)',
  'e) azon negatív hatások értékelése és megelőzése, amelyeket az MI-rendszerek a kiszolgáltatott személyekre vagy a kiszolgáltatott személyek csoportjaira – ideértve a fogyatékossággal élő személyeknek biztosítandó akadálymentességet is –, valamint a nemek közötti egyenlőségre gyakorolnak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_95'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '95',
  '3',
  '(3) Az MI-rendszerek egyes szolgáltatói vagy alkalmazói, vagy az azokat képviselő szervezetek vagy mindkettő magatartási kódexeket készíthetnek, többek között bármely érdekelt fél és képviseleti szervezetei – ideértve a civil szféra szervezeteit és a tudományos köröket is – bevonásával. A magatartási kódexek vonatkozhatnak egy vagy több MI-rendszerre, figyelembe véve az adott rendszerek rendeltetésének hasonlóságát.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_95'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '95',
  '4',
  '(4) A magatartási kódexek kidolgozásának ösztönzése és elősegítése során az MI-hivatal és a tagállamok figyelembe veszik a kkv-k – köztük az induló innovatív vállalkozások – sajátos érdekeit és igényeit.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_95'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '96',
  null,
  'A Bizottság iránymutatásai e rendelet végrehajtásáról
(1) A Bizottság iránymutatásokat dolgoz ki e rendelet gyakorlati végrehajtására vonatkozóan, különös tekintettel a következőkre:

a)

a 8–15. cikkben és a 25. cikkben említett követelmények és kötelezettségek alkalmazása;

b)

az 5. cikkben említett tiltott gyakorlatok;

c)

a jelentős módosításra vonatkozó rendelkezések gyakorlati végrehajtása;

d)

az 50. cikkben meghatározott átláthatósági kötelezettségek gyakorlati végrehajtása;

e)

részletes információk az e rendelet és az I. mellékletben felsorolt uniós harmonizációs jogszabályok, valamint más releváns uniós jog közötti kapcsolatról, többek között a végrehajtásuk következetessége tekintetében;

f)

az MI-rendszer 3. cikk 1. pontjában foglalt fogalommeghatározásának alkalmazása.

Az iránymutatások kiadásakor a Bizottság különös figyelmet fordít a kkv-k, köztük az induló innovatív vállalkozások, valamint a helyi közigazgatási szervek és az e rendelet által legvalószínűbben érintett ágazatok igényeire.

Az e bekezdés első albekezdésében említett iránymutatásokban kellően figyelembe kell venni az MI-vel kapcsolatos technika általánosan elfogadott, mindenkori állását, valamint a 40. és a 41. cikkben említett vonatkozó harmonizált szabványokat és közös előírásokat, vagy az uniós harmonizációs jog alapján meghatározott harmonizált szabványokat vagy műszaki előírásokat.

(2) A tagállamok vagy az MI-hivatal kérésére vagy saját kezdeményezésére a Bizottság szükség esetén aktualizálja a korábban elfogadott iránymutatásokat.

XI. FEJEZET

FELHATALMAZÁS ÉS BIZOTTSÁGI ELJÁRÁS',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_96'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '96',
  '1',
  '(1) A Bizottság iránymutatásokat dolgoz ki e rendelet gyakorlati végrehajtására vonatkozóan, különös tekintettel a következőkre:

a)

a 8–15. cikkben és a 25. cikkben említett követelmények és kötelezettségek alkalmazása;

b)

az 5. cikkben említett tiltott gyakorlatok;

c)

a jelentős módosításra vonatkozó rendelkezések gyakorlati végrehajtása;

d)

az 50. cikkben meghatározott átláthatósági kötelezettségek gyakorlati végrehajtása;

e)

részletes információk az e rendelet és az I. mellékletben felsorolt uniós harmonizációs jogszabályok, valamint más releváns uniós jog közötti kapcsolatról, többek között a végrehajtásuk következetessége tekintetében;

f)

az MI-rendszer 3. cikk 1. pontjában foglalt fogalommeghatározásának alkalmazása.

Az iránymutatások kiadásakor a Bizottság különös figyelmet fordít a kkv-k, köztük az induló innovatív vállalkozások, valamint a helyi közigazgatási szervek és az e rendelet által legvalószínűbben érintett ágazatok igényeire.

Az e bekezdés első albekezdésében említett iránymutatásokban kellően figyelembe kell venni az MI-vel kapcsolatos technika általánosan elfogadott, mindenkori állását, valamint a 40. és a 41. cikkben említett vonatkozó harmonizált szabványokat és közös előírásokat, vagy az uniós harmonizációs jog alapján meghatározott harmonizált szabványokat vagy műszaki előírásokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_96'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '96',
  '1(a)',
  'a) a 8–15. cikkben és a 25. cikkben említett követelmények és kötelezettségek alkalmazása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_96'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '96',
  '1(b)',
  'b) az 5. cikkben említett tiltott gyakorlatok;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_96'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '96',
  '1(c)',
  'c) a jelentős módosításra vonatkozó rendelkezések gyakorlati végrehajtása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_96'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '96',
  '1(d)',
  'd) az 50. cikkben meghatározott átláthatósági kötelezettségek gyakorlati végrehajtása;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_96'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '96',
  '1(e)',
  'e) részletes információk az e rendelet és az I. mellékletben felsorolt uniós harmonizációs jogszabályok, valamint más releváns uniós jog közötti kapcsolatról, többek között a végrehajtásuk következetessége tekintetében;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_96'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '96',
  '1(f)',
  'f) az MI-rendszer 3. cikk 1. pontjában foglalt fogalommeghatározásának alkalmazása.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_96'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '96',
  '2',
  '(2) A tagállamok vagy az MI-hivatal kérésére vagy saját kezdeményezésére a Bizottság szükség esetén aktualizálja a korábban elfogadott iránymutatásokat.

XI. FEJEZET

FELHATALMAZÁS ÉS BIZOTTSÁGI ELJÁRÁS',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_96'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '97',
  null,
  'A felhatalmazás gyakorlása
(1) A felhatalmazáson alapuló jogi aktusok elfogadására vonatkozóan a Bizottság részére adott felhatalmazás feltételeit ez a cikk határozza meg.

(2) A Bizottságnak a 6. cikk (6) és (7) bekezdésében, a 7. cikk (1) és (3) bekezdésében, a 11. cikk (3) bekezdésében, a 43. cikk (5) és (6) bekezdésében, a 47. cikk (5) bekezdésében, az 51. cikk (3) bekezdésében, az 52. cikk (4) bekezdésében, valamint az 53. cikk (5) és (6) bekezdésében említett, felhatalmazáson alapuló jogi aktusok elfogadására vonatkozó felhatalmazása ötéves időtartamra szól 2024. augusztus 1-től kezdődő hatállyal. A Bizottság legkésőbb kilenc hónappal az ötéves időtartam letelte előtt jelentést készít a felhatalmazásról. A felhatalmazás hallgatólagosan meghosszabbodik a korábbival megegyező időtartamra, amennyiben az Európai Parlament vagy a Tanács nem ellenzi a meghosszabbítást legkésőbb három hónappal minden egyes időtartam letelte előtt.

(3) Az Európai Parlament vagy a Tanács bármikor visszavonhatja a 6. cikk (6) és (7) bekezdésében, a 7. cikk (1) és (3) bekezdésében, a 11. cikk (3) bekezdésében, a 43. cikk (5) és (6) bekezdésében, a 47. cikk (5) bekezdésében, az 51. cikk (3) bekezdésében, az 52. cikk (4) bekezdésében, valamint az 53. cikk (5) és (6) bekezdésében említett felhatalmazást. A visszavonásról szóló határozat megszünteti az abban meghatározott felhatalmazást. A határozat az Európai Unió Hivatalos Lapjában való kihirdetését követő napon vagy a benne megjelölt későbbi időpontban lép hatályba. A határozat nem érinti a már hatályban lévő, felhatalmazáson alapuló jogi aktusok érvényességét.

(4) A felhatalmazáson alapuló jogi aktus elfogadása előtt a Bizottság a jogalkotás minőségének javításáról szóló, 2016. április 13-i intézményközi megállapodásban megállapított elvekkel összhangban konzultál az egyes tagállamok által kijelölt szakértőkkel.

(5) A Bizottság a felhatalmazáson alapuló jogi aktus elfogadását követően haladéktalanul és egyidejűleg értesíti arról az Európai Parlamentet és a Tanácsot.

(6) A 6. cikk (6) vagy (7) bekezdése, a 7. cikk (1) vagy (3) bekezdése, a 11. cikk (3) bekezdése, a 43. cikk (5) vagy (6) bekezdése, a 47. cikk (5) bekezdése, az 51. cikk (3) bekezdése, az 52. cikk (4) bekezdése vagy az 53. cikk (5) vagy (6) bekezdése értelmében elfogadott, felhatalmazáson alapuló jogi aktus csak akkor lép hatályba, ha az Európai Parlamentnek és a Tanácsnak a jogi aktusokról való értesítését követő három hónapon belül sem az Európai Parlament, sem a Tanács nem emelt ellene kifogást, illetve ha az említett időtartam lejártát megelőzően mind az Európai Parlament, mind a Tanács arról tájékoztatta a Bizottságot, hogy nem fog kifogást emelni. Az Európai Parlament vagy a Tanács kezdeményezésére ez az időtartam három hónappal meghosszabbodik.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '97',
  '1',
  '(1) A felhatalmazáson alapuló jogi aktusok elfogadására vonatkozóan a Bizottság részére adott felhatalmazás feltételeit ez a cikk határozza meg.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '97',
  '2',
  '(2) A Bizottságnak a 6. cikk (6) és (7) bekezdésében, a 7. cikk (1) és (3) bekezdésében, a 11. cikk (3) bekezdésében, a 43. cikk (5) és (6) bekezdésében, a 47. cikk (5) bekezdésében, az 51. cikk (3) bekezdésében, az 52. cikk (4) bekezdésében, valamint az 53. cikk (5) és (6) bekezdésében említett, felhatalmazáson alapuló jogi aktusok elfogadására vonatkozó felhatalmazása ötéves időtartamra szól 2024. augusztus 1-től kezdődő hatállyal. A Bizottság legkésőbb kilenc hónappal az ötéves időtartam letelte előtt jelentést készít a felhatalmazásról. A felhatalmazás hallgatólagosan meghosszabbodik a korábbival megegyező időtartamra, amennyiben az Európai Parlament vagy a Tanács nem ellenzi a meghosszabbítást legkésőbb három hónappal minden egyes időtartam letelte előtt.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '97',
  '3',
  '(3) Az Európai Parlament vagy a Tanács bármikor visszavonhatja a 6. cikk (6) és (7) bekezdésében, a 7. cikk (1) és (3) bekezdésében, a 11. cikk (3) bekezdésében, a 43. cikk (5) és (6) bekezdésében, a 47. cikk (5) bekezdésében, az 51. cikk (3) bekezdésében, az 52. cikk (4) bekezdésében, valamint az 53. cikk (5) és (6) bekezdésében említett felhatalmazást. A visszavonásról szóló határozat megszünteti az abban meghatározott felhatalmazást. A határozat az Európai Unió Hivatalos Lapjában való kihirdetését követő napon vagy a benne megjelölt későbbi időpontban lép hatályba. A határozat nem érinti a már hatályban lévő, felhatalmazáson alapuló jogi aktusok érvényességét.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '97',
  '4',
  '(4) A felhatalmazáson alapuló jogi aktus elfogadása előtt a Bizottság a jogalkotás minőségének javításáról szóló, 2016. április 13-i intézményközi megállapodásban megállapított elvekkel összhangban konzultál az egyes tagállamok által kijelölt szakértőkkel.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '97',
  '5',
  '(5) A Bizottság a felhatalmazáson alapuló jogi aktus elfogadását követően haladéktalanul és egyidejűleg értesíti arról az Európai Parlamentet és a Tanácsot.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '97',
  '6',
  '(6) A 6. cikk (6) vagy (7) bekezdése, a 7. cikk (1) vagy (3) bekezdése, a 11. cikk (3) bekezdése, a 43. cikk (5) vagy (6) bekezdése, a 47. cikk (5) bekezdése, az 51. cikk (3) bekezdése, az 52. cikk (4) bekezdése vagy az 53. cikk (5) vagy (6) bekezdése értelmében elfogadott, felhatalmazáson alapuló jogi aktus csak akkor lép hatályba, ha az Európai Parlamentnek és a Tanácsnak a jogi aktusokról való értesítését követő három hónapon belül sem az Európai Parlament, sem a Tanács nem emelt ellene kifogást, illetve ha az említett időtartam lejártát megelőzően mind az Európai Parlament, mind a Tanács arról tájékoztatta a Bizottságot, hogy nem fog kifogást emelni. Az Európai Parlament vagy a Tanács kezdeményezésére ez az időtartam három hónappal meghosszabbodik.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_97'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '98',
  null,
  'A bizottsági eljárás
(1) A Bizottságot egy bizottság segíti. Ez a bizottság a 182/2011/EU rendelet értelmében vett bizottságnak minősül.

(2) Az e bekezdésre történő hivatkozáskor a 182/2011/EU rendelet 5. cikkét kell alkalmazni.

XII. FEJEZET

SZANKCIÓK',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_98'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '98',
  '1',
  '(1) A Bizottságot egy bizottság segíti. Ez a bizottság a 182/2011/EU rendelet értelmében vett bizottságnak minősül.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_98'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '98',
  '2',
  '(2) Az e bekezdésre történő hivatkozáskor a 182/2011/EU rendelet 5. cikkét kell alkalmazni.

XII. FEJEZET

SZANKCIÓK',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_98'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  null,
  'Szankciók
(1) Az e rendeletben meghatározott feltételekkel összhangban a tagállamok megállapítják az e rendelet gazdasági szereplők általi megsértése esetén alkalmazandó – adott esetben figyelmeztetéseket és nem pénzbeli intézkedéseket is magukban foglaló – szankciókra és egyéb végrehajtási intézkedésekre vonatkozó szabályokat, és meghoznak minden szükséges intézkedést ezek megfelelő és hatékony végrehajtásának biztosítására, figyelembe véve ennek során a Bizottság által a 96. cikk szerint kiadott iránymutatásokat. Az előírt szankcióknak hatékonyaknak, arányosaknak és visszatartó erejűeknek kell lenniük. Figyelmet kell fordítaniuk a kkv-k – köztük az induló innovatív vállalkozások – érdekeire, valamint gazdasági életképességükre.

(2) A tagállamok az (1) bekezdésben említett szankciókra és egyéb végrehajtási intézkedésekre vonatkozó szabályokról haladéktalanul, de legkésőbb az alkalmazás kezdőnapjáig értesítik a Bizottságot, és haladéktalanul tájékoztatják a Bizottságot az e szabályokat érintő minden későbbi módosításról.

(3) Az 5. cikkben említett MI-gyakorlatok tilalmának be nem tartása legfeljebb 35 000 000 EUR összegű, vagy ha az elkövető vállalkozás, az előző pénzügyi év teljes globális éves árbevételének legfeljebb 7 %-át kitevő összegű közigazgatási bírsággal sújtandó, a kettő közül a magasabb összegűt figyelembe véve.

(4) Ha az MI-rendszer nem felel meg a gazdasági szereplőkkel vagy a bejelentett szervezetekkel kapcsolatos – az 5. cikkben meghatározottaktól eltérő –, következő rendelkezések bármelyikének, az legfeljebb 15 000 000 EUR összegű, vagy ha az elkövető vállalkozás, az előző pénzügyi év teljes globális éves árbevételének legfeljebb 3 %-át kitevő összegű közigazgatási bírsággal sújtandó, a kettő közül a magasabb összegűt figyelembe véve:

a)

a szolgáltatók 16. cikk szerinti kötelezettségei;

b)

a meghatalmazott képviselők 22. cikk szerinti kötelezettségei;

c)

az importőrök 23. cikk szerinti kötelezettségei;

d)

a forgalmazók 24. cikk szerinti kötelezettségei;

e)

az alkalmazók 26. cikk szerinti kötelezettségei;

f)

a bejelentett szervezeteknek a 31. cikk, a 33. cikk (1), (3) és (4) bekezdése vagy a 34. cikk szerinti követelményei és kötelezettségei;

g)

a szolgáltatókra és az alkalmazókra vonatkozó, 50. cikk szerinti átláthatósági kötelezettségek.

(5) Ha a bejelentett szervezetek vagy az illetékes nemzeti hatóságok kérésére válaszul helytelen, hiányos vagy félrevezető információ szolgáltatása történik, az legfeljebb 7 500 000 EUR összegű, vagy ha az elkövető vállalkozás, az előző pénzügyi év teljes globális éves árbevételének legfeljebb 1 %-át kitevő összegű közigazgatási bírsággal sújtandó, a kettő közül a magasabb összegűt figyelembe véve.

(6) A kkv-k, köztük az induló innovatív vállalkozások esetében az e cikkben említett egyes pénzbírságok nem haladhatják meg a (3), a (4) és az (5) bekezdésben említett százalékos arányokat, illetve összegeket, és a kettő közül mindig az alacsonyabbat kell figyelembe venni.

(7) A közigazgatási bírság kiszabására vonatkozó döntés meghozatalakor és a közigazgatási bírság összegéről hozott döntés során minden egyes esetben figyelembe kell venni az adott helyzetre vonatkozó valamennyi releváns körülményt, és – adott esetben – figyelmet kell fordítani a következőkre:

a)

a jogsértés és következményeinek jellege, súlyossága és időtartama, figyelembe véve az MI-rendszer célját, valamint adott esteben az érintett személyek számát és az általuk elszenvedett kár mértékét;

b)

ugyanazon jogsértés miatt más piacfelügyeleti hatóságok szabtak-e már ki közigazgatási bírságot ugyanazon gazdasági szereplővel szemben;

c)

más uniós vagy nemzeti jog megsértése miatt más hatóságok szabtak-e már ki közigazgatási bírságot ugyanazon gazdasági szereplővel szemben, amennyiben az említett jogsértések e rendelet tényleges megsértését jelentő ugyanazon tevékenységből vagy mulasztásból fakadnak;

d)

a jogsértést elkövető gazdasági szereplő mérete, éves árbevétele és piaci részesedése;

e)

az eset körülményei szerint alkalmazandó, bármely egyéb súlyosbító vagy enyhítő tényező, így például a jogsértésből fakadó, közvetlen vagy közvetett pénzügyi haszon szerzése vagy veszteség elkerülése;

f)

a nemzeti illetékes hatósággal a jogsértés orvoslása és a jogsértés esetleges kedvezőtlen hatásainak enyhítése érdekében folytatott együttműködés mértéke;

g)

a gazdasági szereplő felelősségének mértéke, figyelembe véve az általa végrehajtott technikai és szervezeti intézkedéseket;

h)

az, ahogyan az illetékes nemzeti hatóságok tudomást szereztek a jogsértésről, különös tekintettel arra, hogy a gazdasági szereplő jelentette-e be a jogsértést, és ha igen, milyen részletességgel;

i)

a jogsértés szándékos vagy gondatlan jellege;

j)

intézkedések, amelyeket a gazdasági szereplő az érintett személyek által elszenvedett károk enyhítése érdekében tett.

(8) Minden tagállam szabályokat állapít meg arra vonatkozóan, hogy milyen mértékben szabhatók ki közigazgatási bírságok az adott tagállamban létrehozott hatóságokra és szervekre.

(9) A tagállamok jogrendszerétől függően a közigazgatási bírságokra vonatkozó szabályok alkalmazhatók olyan módon, hogy a bírságokat – az adott tagállamban alkalmazandó szabályoknak megfelelően – az illetékes nemzeti bíróságok vagy adott esetben más szervek szabják ki. Az ilyen szabályok alkalmazásának ezekben a tagállamokban azonos hatással kell járniuk.

(10) Az e cikk szerinti hatásköröket az uniós és a nemzeti joggal összhangban lévő megfelelő eljárási garanciák – többek között a hatékony jogorvoslatok és a jogszerű eljárás – mellett kell gyakorolni.

(11) A tagállamok évente jelentést tesznek a Bizottságnak az adott évben e cikkel összhangban kiszabott közigazgatási bírságokról, valamint a kapcsolódó jogvitákról vagy bírósági eljárásokról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '1',
  '(1) Az e rendeletben meghatározott feltételekkel összhangban a tagállamok megállapítják az e rendelet gazdasági szereplők általi megsértése esetén alkalmazandó – adott esetben figyelmeztetéseket és nem pénzbeli intézkedéseket is magukban foglaló – szankciókra és egyéb végrehajtási intézkedésekre vonatkozó szabályokat, és meghoznak minden szükséges intézkedést ezek megfelelő és hatékony végrehajtásának biztosítására, figyelembe véve ennek során a Bizottság által a 96. cikk szerint kiadott iránymutatásokat. Az előírt szankcióknak hatékonyaknak, arányosaknak és visszatartó erejűeknek kell lenniük. Figyelmet kell fordítaniuk a kkv-k – köztük az induló innovatív vállalkozások – érdekeire, valamint gazdasági életképességükre.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '2',
  '(2) A tagállamok az (1) bekezdésben említett szankciókra és egyéb végrehajtási intézkedésekre vonatkozó szabályokról haladéktalanul, de legkésőbb az alkalmazás kezdőnapjáig értesítik a Bizottságot, és haladéktalanul tájékoztatják a Bizottságot az e szabályokat érintő minden későbbi módosításról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '3',
  '(3) Az 5. cikkben említett MI-gyakorlatok tilalmának be nem tartása legfeljebb 35 000 000 EUR összegű, vagy ha az elkövető vállalkozás, az előző pénzügyi év teljes globális éves árbevételének legfeljebb 7 %-át kitevő összegű közigazgatási bírsággal sújtandó, a kettő közül a magasabb összegűt figyelembe véve.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '4',
  '(4) Ha az MI-rendszer nem felel meg a gazdasági szereplőkkel vagy a bejelentett szervezetekkel kapcsolatos – az 5. cikkben meghatározottaktól eltérő –, következő rendelkezések bármelyikének, az legfeljebb 15 000 000 EUR összegű, vagy ha az elkövető vállalkozás, az előző pénzügyi év teljes globális éves árbevételének legfeljebb 3 %-át kitevő összegű közigazgatási bírsággal sújtandó, a kettő közül a magasabb összegűt figyelembe véve:

a)

a szolgáltatók 16. cikk szerinti kötelezettségei;

b)

a meghatalmazott képviselők 22. cikk szerinti kötelezettségei;

c)

az importőrök 23. cikk szerinti kötelezettségei;

d)

a forgalmazók 24. cikk szerinti kötelezettségei;

e)

az alkalmazók 26. cikk szerinti kötelezettségei;

f)

a bejelentett szervezeteknek a 31. cikk, a 33. cikk (1), (3) és (4) bekezdése vagy a 34. cikk szerinti követelményei és kötelezettségei;

g)

a szolgáltatókra és az alkalmazókra vonatkozó, 50. cikk szerinti átláthatósági kötelezettségek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '4(a)',
  'a) a szolgáltatók 16. cikk szerinti kötelezettségei;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '4(b)',
  'b) a meghatalmazott képviselők 22. cikk szerinti kötelezettségei;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '4(c)',
  'c) az importőrök 23. cikk szerinti kötelezettségei;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '4(d)',
  'd) a forgalmazók 24. cikk szerinti kötelezettségei;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '4(e)',
  'e) az alkalmazók 26. cikk szerinti kötelezettségei;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '4(f)',
  'f) a bejelentett szervezeteknek a 31. cikk, a 33. cikk (1), (3) és (4) bekezdése vagy a 34. cikk szerinti követelményei és kötelezettségei;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '4(g)',
  'g) a szolgáltatókra és az alkalmazókra vonatkozó, 50. cikk szerinti átláthatósági kötelezettségek.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '5',
  '(5) Ha a bejelentett szervezetek vagy az illetékes nemzeti hatóságok kérésére válaszul helytelen, hiányos vagy félrevezető információ szolgáltatása történik, az legfeljebb 7 500 000 EUR összegű, vagy ha az elkövető vállalkozás, az előző pénzügyi év teljes globális éves árbevételének legfeljebb 1 %-át kitevő összegű közigazgatási bírsággal sújtandó, a kettő közül a magasabb összegűt figyelembe véve.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '6',
  '(6) A kkv-k, köztük az induló innovatív vállalkozások esetében az e cikkben említett egyes pénzbírságok nem haladhatják meg a (3), a (4) és az (5) bekezdésben említett százalékos arányokat, illetve összegeket, és a kettő közül mindig az alacsonyabbat kell figyelembe venni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '7',
  '(7) A közigazgatási bírság kiszabására vonatkozó döntés meghozatalakor és a közigazgatási bírság összegéről hozott döntés során minden egyes esetben figyelembe kell venni az adott helyzetre vonatkozó valamennyi releváns körülményt, és – adott esetben – figyelmet kell fordítani a következőkre:

a)

a jogsértés és következményeinek jellege, súlyossága és időtartama, figyelembe véve az MI-rendszer célját, valamint adott esteben az érintett személyek számát és az általuk elszenvedett kár mértékét;

b)

ugyanazon jogsértés miatt más piacfelügyeleti hatóságok szabtak-e már ki közigazgatási bírságot ugyanazon gazdasági szereplővel szemben;

c)

más uniós vagy nemzeti jog megsértése miatt más hatóságok szabtak-e már ki közigazgatási bírságot ugyanazon gazdasági szereplővel szemben, amennyiben az említett jogsértések e rendelet tényleges megsértését jelentő ugyanazon tevékenységből vagy mulasztásból fakadnak;

d)

a jogsértést elkövető gazdasági szereplő mérete, éves árbevétele és piaci részesedése;

e)

az eset körülményei szerint alkalmazandó, bármely egyéb súlyosbító vagy enyhítő tényező, így például a jogsértésből fakadó, közvetlen vagy közvetett pénzügyi haszon szerzése vagy veszteség elkerülése;

f)

a nemzeti illetékes hatósággal a jogsértés orvoslása és a jogsértés esetleges kedvezőtlen hatásainak enyhítése érdekében folytatott együttműködés mértéke;

g)

a gazdasági szereplő felelősségének mértéke, figyelembe véve az általa végrehajtott technikai és szervezeti intézkedéseket;

h)

az, ahogyan az illetékes nemzeti hatóságok tudomást szereztek a jogsértésről, különös tekintettel arra, hogy a gazdasági szereplő jelentette-e be a jogsértést, és ha igen, milyen részletességgel;

i)

a jogsértés szándékos vagy gondatlan jellege;

j)

intézkedések, amelyeket a gazdasági szereplő az érintett személyek által elszenvedett károk enyhítése érdekében tett.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '7(a)',
  'a) a jogsértés és következményeinek jellege, súlyossága és időtartama, figyelembe véve az MI-rendszer célját, valamint adott esteben az érintett személyek számát és az általuk elszenvedett kár mértékét;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '7(b)',
  'b) ugyanazon jogsértés miatt más piacfelügyeleti hatóságok szabtak-e már ki közigazgatási bírságot ugyanazon gazdasági szereplővel szemben;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '7(c)',
  'c) más uniós vagy nemzeti jog megsértése miatt más hatóságok szabtak-e már ki közigazgatási bírságot ugyanazon gazdasági szereplővel szemben, amennyiben az említett jogsértések e rendelet tényleges megsértését jelentő ugyanazon tevékenységből vagy mulasztásból fakadnak;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '7(d)',
  'd) a jogsértést elkövető gazdasági szereplő mérete, éves árbevétele és piaci részesedése;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '7(e)',
  'e) az eset körülményei szerint alkalmazandó, bármely egyéb súlyosbító vagy enyhítő tényező, így például a jogsértésből fakadó, közvetlen vagy közvetett pénzügyi haszon szerzése vagy veszteség elkerülése;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '7(f)',
  'f) a nemzeti illetékes hatósággal a jogsértés orvoslása és a jogsértés esetleges kedvezőtlen hatásainak enyhítése érdekében folytatott együttműködés mértéke;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '7(g)',
  'g) a gazdasági szereplő felelősségének mértéke, figyelembe véve az általa végrehajtott technikai és szervezeti intézkedéseket;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '7(h)',
  'h) az, ahogyan az illetékes nemzeti hatóságok tudomást szereztek a jogsértésről, különös tekintettel arra, hogy a gazdasági szereplő jelentette-e be a jogsértést, és ha igen, milyen részletességgel;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '7(i)',
  'i) a jogsértés szándékos vagy gondatlan jellege;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '7(j)',
  'j) intézkedések, amelyeket a gazdasági szereplő az érintett személyek által elszenvedett károk enyhítése érdekében tett.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '8',
  '(8) Minden tagállam szabályokat állapít meg arra vonatkozóan, hogy milyen mértékben szabhatók ki közigazgatási bírságok az adott tagállamban létrehozott hatóságokra és szervekre.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '9',
  '(9) A tagállamok jogrendszerétől függően a közigazgatási bírságokra vonatkozó szabályok alkalmazhatók olyan módon, hogy a bírságokat – az adott tagállamban alkalmazandó szabályoknak megfelelően – az illetékes nemzeti bíróságok vagy adott esetben más szervek szabják ki. Az ilyen szabályok alkalmazásának ezekben a tagállamokban azonos hatással kell járniuk.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '10',
  '(10) Az e cikk szerinti hatásköröket az uniós és a nemzeti joggal összhangban lévő megfelelő eljárási garanciák – többek között a hatékony jogorvoslatok és a jogszerű eljárás – mellett kell gyakorolni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '99',
  '11',
  '(11) A tagállamok évente jelentést tesznek a Bizottságnak az adott évben e cikkel összhangban kiszabott közigazgatási bírságokról, valamint a kapcsolódó jogvitákról vagy bírósági eljárásokról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_99'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  null,
  'Az uniós intézményekre, szervekre és hivatalokra kiszabott közigazgatási bírságok
(1) Az európai adatvédelmi biztos közigazgatási bírságot szabhat ki az e rendelet hatálya alá tartozó uniós intézményekre, szervekre és hivatalokra. A közigazgatási bírság kiszabására vonatkozó döntés meghozatalakor és a bírság összegének meghatározásakor minden egyes esetben figyelembe kell venni az adott helyzetre vonatkozó valamennyi releváns körülményt, és kellő figyelmet kell fordítani a következőkre:

a)

a jogsértés és következményeinek jellege, súlyossága és időtartama, figyelembe véve az érintett MI-rendszer célját, valamint adott esetben az érintett személyek számát és az általuk elszenvedett kár mértékét;

b)

az uniós intézmény, szerv vagy hivatal felelősségének mértéke, figyelembe véve a jogsértés megelőzése érdekében végrehajtott technikai és szervezeti intézkedéseket;

c)

az uniós intézmény, szerv vagy hivatal intézkedései az érintettek által elszenvedett kár enyhítésére;

d)

az európai adatvédelmi biztossal a jogsértés orvoslása és a jogsértés esetleges kedvezőtlen hatásainak enyhítése érdekében folytatott együttműködés mértéke, így például az európai adatvédelmi biztos által az érintett uniós intézménnyel, szervvel vagy hivatallal szemben ugyanazon tárgyban korábban elrendelt bármely intézkedésnek való megfelelés;

e)

az uniós intézmény, szerv vagy hivatal által korábban elkövetett hasonló jogsértések;

f)

annak módja, ahogyan az európai adatvédelmi biztos tudomást szerzett a jogsértésről, különös tekintettel arra, hogy az uniós intézmény, szerv vagy hivatal jelentette-e be a jogsértést, és ha igen, milyen részletességgel;

g)

az uniós intézmény, szerv vagy hivatal éves költségvetése.

(2) Az 5. cikkben említett MI-gyakorlatok tilalmának be nem tartása legfeljebb 1 500 000 EUR összegű közigazgatási bírsággal sújtandó.

(3) Ha az MI-rendszer nem felel meg az e rendelet szerinti – az 5. cikkben meghatározottaktól eltérő – követelményeknek vagy kötelezettségeknek, az legfeljebb 750 000 EUR összegű közigazgatási bírsággal sújtandó.

(4) Az e cikk szerinti határozatok meghozatala előtt az európai adatvédelmi biztos biztosítja az európai adatvédelmi biztos által lefolytatott eljárás tárgyát képező uniós intézmény, szerv vagy hivatal számára annak lehetőségét, hogy kifejtse álláspontját az esetleges jogsértéssel összefüggésben. Az európai adatvédelmi biztos a döntéseit csak olyan elemekre és körülményekre alapozhatja, amelyekkel kapcsolatban az érintett felek megtehették észrevételeiket. Az esetleges panaszosokat szorosan be kell vonni az eljárásba.

(5) Az érintett felek védelemhez való jogát az eljárás során teljes mértékben tiszteletben kell tartani. Az érintett felek jogosultak arra, hogy hozzáférjenek az európai adatvédelmi biztos aktájához, figyelemmel az egyéneknek vagy vállalkozásoknak a személyes adataik vagy üzleti titkaik védeleméhez fűződő jogos érdekére.

(6) Az e cikk szerint kiszabott bírságok révén beszedett összegek hozzájárulnak az Unió általános költségvetéséhez. A pénzbírságok nem befolyásolhatják a megbírságolt uniós intézmény, szerv vagy hivatal hatékony működését.

(7) Az európai adatvédelmi biztos évente tájékoztatja az MI-hivatalt az e cikk alapján kiszabott közigazgatási bírságokról, valamint az általa kezdeményezett jogvitákról vagy bírósági eljárásokról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '1',
  '(1) Az európai adatvédelmi biztos közigazgatási bírságot szabhat ki az e rendelet hatálya alá tartozó uniós intézményekre, szervekre és hivatalokra. A közigazgatási bírság kiszabására vonatkozó döntés meghozatalakor és a bírság összegének meghatározásakor minden egyes esetben figyelembe kell venni az adott helyzetre vonatkozó valamennyi releváns körülményt, és kellő figyelmet kell fordítani a következőkre:

a)

a jogsértés és következményeinek jellege, súlyossága és időtartama, figyelembe véve az érintett MI-rendszer célját, valamint adott esetben az érintett személyek számát és az általuk elszenvedett kár mértékét;

b)

az uniós intézmény, szerv vagy hivatal felelősségének mértéke, figyelembe véve a jogsértés megelőzése érdekében végrehajtott technikai és szervezeti intézkedéseket;

c)

az uniós intézmény, szerv vagy hivatal intézkedései az érintettek által elszenvedett kár enyhítésére;

d)

az európai adatvédelmi biztossal a jogsértés orvoslása és a jogsértés esetleges kedvezőtlen hatásainak enyhítése érdekében folytatott együttműködés mértéke, így például az európai adatvédelmi biztos által az érintett uniós intézménnyel, szervvel vagy hivatallal szemben ugyanazon tárgyban korábban elrendelt bármely intézkedésnek való megfelelés;

e)

az uniós intézmény, szerv vagy hivatal által korábban elkövetett hasonló jogsértések;

f)

annak módja, ahogyan az európai adatvédelmi biztos tudomást szerzett a jogsértésről, különös tekintettel arra, hogy az uniós intézmény, szerv vagy hivatal jelentette-e be a jogsértést, és ha igen, milyen részletességgel;

g)

az uniós intézmény, szerv vagy hivatal éves költségvetése.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '1(a)',
  'a) a jogsértés és következményeinek jellege, súlyossága és időtartama, figyelembe véve az érintett MI-rendszer célját, valamint adott esetben az érintett személyek számát és az általuk elszenvedett kár mértékét;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '1(b)',
  'b) az uniós intézmény, szerv vagy hivatal felelősségének mértéke, figyelembe véve a jogsértés megelőzése érdekében végrehajtott technikai és szervezeti intézkedéseket;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '1(c)',
  'c) az uniós intézmény, szerv vagy hivatal intézkedései az érintettek által elszenvedett kár enyhítésére;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '1(d)',
  'd) az európai adatvédelmi biztossal a jogsértés orvoslása és a jogsértés esetleges kedvezőtlen hatásainak enyhítése érdekében folytatott együttműködés mértéke, így például az európai adatvédelmi biztos által az érintett uniós intézménnyel, szervvel vagy hivatallal szemben ugyanazon tárgyban korábban elrendelt bármely intézkedésnek való megfelelés;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '1(e)',
  'e) az uniós intézmény, szerv vagy hivatal által korábban elkövetett hasonló jogsértések;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '1(f)',
  'f) annak módja, ahogyan az európai adatvédelmi biztos tudomást szerzett a jogsértésről, különös tekintettel arra, hogy az uniós intézmény, szerv vagy hivatal jelentette-e be a jogsértést, és ha igen, milyen részletességgel;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '1(g)',
  'g) az uniós intézmény, szerv vagy hivatal éves költségvetése.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '2',
  '(2) Az 5. cikkben említett MI-gyakorlatok tilalmának be nem tartása legfeljebb 1 500 000 EUR összegű közigazgatási bírsággal sújtandó.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '3',
  '(3) Ha az MI-rendszer nem felel meg az e rendelet szerinti – az 5. cikkben meghatározottaktól eltérő – követelményeknek vagy kötelezettségeknek, az legfeljebb 750 000 EUR összegű közigazgatási bírsággal sújtandó.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '4',
  '(4) Az e cikk szerinti határozatok meghozatala előtt az európai adatvédelmi biztos biztosítja az európai adatvédelmi biztos által lefolytatott eljárás tárgyát képező uniós intézmény, szerv vagy hivatal számára annak lehetőségét, hogy kifejtse álláspontját az esetleges jogsértéssel összefüggésben. Az európai adatvédelmi biztos a döntéseit csak olyan elemekre és körülményekre alapozhatja, amelyekkel kapcsolatban az érintett felek megtehették észrevételeiket. Az esetleges panaszosokat szorosan be kell vonni az eljárásba.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '5',
  '(5) Az érintett felek védelemhez való jogát az eljárás során teljes mértékben tiszteletben kell tartani. Az érintett felek jogosultak arra, hogy hozzáférjenek az európai adatvédelmi biztos aktájához, figyelemmel az egyéneknek vagy vállalkozásoknak a személyes adataik vagy üzleti titkaik védeleméhez fűződő jogos érdekére.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '6',
  '(6) Az e cikk szerint kiszabott bírságok révén beszedett összegek hozzájárulnak az Unió általános költségvetéséhez. A pénzbírságok nem befolyásolhatják a megbírságolt uniós intézmény, szerv vagy hivatal hatékony működését.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '100',
  '7',
  '(7) Az európai adatvédelmi biztos évente tájékoztatja az MI-hivatalt az e cikk alapján kiszabott közigazgatási bírságokról, valamint az általa kezdeményezett jogvitákról vagy bírósági eljárásokról.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_100'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '101',
  null,
  'Az általános célú MI-modellek szolgáltatóira kiszabott pénzbírságok
(1) A Bizottság az általános célú MI-modellek szolgáltatóira az előző pénzügyi évben az éves teljes globális árbevételük legfeljebb 3 %-át kitevő összegű vagy legfeljebb 15 000 000 EUR összegű pénzbírságot szabhat ki, a kettő közül a magasabb összegűt figyelembe véve, amennyiben a Bizottság megállapítja, hogy a szolgáltató szándékosan vagy gondatlanságból:

a)

megsértette e rendelet releváns rendelkezéseit;

b)

nem tett eleget a 91. cikk szerinti, dokumentum iránti kérelemnek vagy információkérésnek, illetve helytelen, hiányos vagy félrevezető információt szolgáltatott;

c)

nem tett eleget a 93. cikk alapján előírt intézkedésnek;

d)

nem biztosított hozzáférést a Bizottság számára az általános célú MI-modellhez vagy a rendszerszintű kockázatot jelentő általános célú MI-modellhez a 92. cikk szerinti értékelés elvégzése céljából.

A Bizottság a pénzbírság vagy a kényszerítő bírság összegét – az arányosság és a megfelelőség elvét kellően figyelembe véve – a jogsértés jellegére, súlyosságára és időtartamára tekintettel állapítja meg. A Bizottság figyelembe veszi a 93. cikk (3) bekezdésével összhangban tett vagy az 56. cikkel összhangban a vonatkozó gyakorlati kódexekben vállalt kötelezettségeket is.

(2) Az (1) bekezdés szerinti határozat elfogadása előtt a Bizottság közli előzetes megállapításait az általános célú MI-modell szolgáltatójával, és lehetőséget biztosít számára, hogy kifejtse álláspontját.

(3) Az e cikkel összhangban kiszabott pénzbírságoknak hatékonyaknak, arányosaknak és visszatartó erejűeknek kell lenniük.

(4) Az e cikk alapján kiszabott pénzbírságokra vonatkozó információkat adott esetben a Testülettel is közölni kell.

(5) Az Európai Unió Bírósága korlátlan felülvizsgálati jogkörrel rendelkezik a Bizottságnak a pénzbírság összegét e cikk alapján megállapító határozatai tekintetében. A Bíróság a kiszabott pénzbírságot törölheti, csökkentheti vagy növelheti.

(6) A Bizottság végrehajtási jogi aktusokat fogad el, amelyek részletes szabályokat és eljárási biztosítékokat tartalmaznak az e cikk (1) bekezdése szerinti határozatok esetleges elfogadására irányuló eljárásokra vonatkozóan. Ezeket a végrehajtási jogi aktusokat a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.

XIII. FEJEZET

ZÁRÓ RENDELKEZÉSEK',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_101'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '101',
  '1',
  '(1) A Bizottság az általános célú MI-modellek szolgáltatóira az előző pénzügyi évben az éves teljes globális árbevételük legfeljebb 3 %-át kitevő összegű vagy legfeljebb 15 000 000 EUR összegű pénzbírságot szabhat ki, a kettő közül a magasabb összegűt figyelembe véve, amennyiben a Bizottság megállapítja, hogy a szolgáltató szándékosan vagy gondatlanságból:

a)

megsértette e rendelet releváns rendelkezéseit;

b)

nem tett eleget a 91. cikk szerinti, dokumentum iránti kérelemnek vagy információkérésnek, illetve helytelen, hiányos vagy félrevezető információt szolgáltatott;

c)

nem tett eleget a 93. cikk alapján előírt intézkedésnek;

d)

nem biztosított hozzáférést a Bizottság számára az általános célú MI-modellhez vagy a rendszerszintű kockázatot jelentő általános célú MI-modellhez a 92. cikk szerinti értékelés elvégzése céljából.

A Bizottság a pénzbírság vagy a kényszerítő bírság összegét – az arányosság és a megfelelőség elvét kellően figyelembe véve – a jogsértés jellegére, súlyosságára és időtartamára tekintettel állapítja meg. A Bizottság figyelembe veszi a 93. cikk (3) bekezdésével összhangban tett vagy az 56. cikkel összhangban a vonatkozó gyakorlati kódexekben vállalt kötelezettségeket is.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_101'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '101',
  '1(a)',
  'a) megsértette e rendelet releváns rendelkezéseit;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_101'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '101',
  '1(b)',
  'b) nem tett eleget a 91. cikk szerinti, dokumentum iránti kérelemnek vagy információkérésnek, illetve helytelen, hiányos vagy félrevezető információt szolgáltatott;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_101'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '101',
  '1(c)',
  'c) nem tett eleget a 93. cikk alapján előírt intézkedésnek;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_101'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '101',
  '1(d)',
  'd) nem biztosított hozzáférést a Bizottság számára az általános célú MI-modellhez vagy a rendszerszintű kockázatot jelentő általános célú MI-modellhez a 92. cikk szerinti értékelés elvégzése céljából.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_101'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '101',
  '2',
  '(2) Az (1) bekezdés szerinti határozat elfogadása előtt a Bizottság közli előzetes megállapításait az általános célú MI-modell szolgáltatójával, és lehetőséget biztosít számára, hogy kifejtse álláspontját.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_101'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '101',
  '3',
  '(3) Az e cikkel összhangban kiszabott pénzbírságoknak hatékonyaknak, arányosaknak és visszatartó erejűeknek kell lenniük.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_101'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '101',
  '4',
  '(4) Az e cikk alapján kiszabott pénzbírságokra vonatkozó információkat adott esetben a Testülettel is közölni kell.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_101'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '101',
  '5',
  '(5) Az Európai Unió Bírósága korlátlan felülvizsgálati jogkörrel rendelkezik a Bizottságnak a pénzbírság összegét e cikk alapján megállapító határozatai tekintetében. A Bíróság a kiszabott pénzbírságot törölheti, csökkentheti vagy növelheti.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_101'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '101',
  '6',
  '(6) A Bizottság végrehajtási jogi aktusokat fogad el, amelyek részletes szabályokat és eljárási biztosítékokat tartalmaznak az e cikk (1) bekezdése szerinti határozatok esetleges elfogadására irányuló eljárásokra vonatkozóan. Ezeket a végrehajtási jogi aktusokat a 98. cikk (2) bekezdésében említett vizsgálóbizottsági eljárás keretében kell elfogadni.

XIII. FEJEZET

ZÁRÓ RENDELKEZÉSEK',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_101'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '102',
  null,
  'A 300/2008/EK rendelet módosítása
A 300/2008/EK rendelet 4. cikkének (3) bekezdése a következő albekezdéssel egészül ki:

„Az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében vett mesterségesintelligencia-rendszerekkel kapcsolatos védelmi berendezések jóváhagyására és használatára vonatkozó műszaki előírásokkal és eljárásokkal kapcsolatos részletes intézkedések elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_102'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '103',
  null,
  'A 167/2013/EU rendelet módosítása
A 167/2013/EU rendelet 17. cikkének (5) bekezdése a következő albekezdéssel egészül ki:

„Az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az első albekezdés szerinti, felhatalmazáson alapuló jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_103'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '104',
  null,
  'A 168/2013/EU rendelet módosítása
A 168/2013/EU rendelet 22. cikkének (5) bekezdése a következő albekezdéssel egészül ki:

„Az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az első albekezdés szerinti, felhatalmazáson alapuló jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_104'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '105',
  null,
  'A 2014/90/EU irányelv módosítása
A 2014/90/EU irányelv 8. cikke a következő bekezdéssel egészül ki:

„(5) Azon mesterségesintelligencia-rendszerek esetében, amelyek az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében biztonsági alkotórészeknek minősülnek, a Bizottság az (1) bekezdés szerinti tevékenysége végzésekor, valamint a (2) és a (3) bekezdés szerinti műszaki és vizsgálati előírások elfogadásakor figyelembe veszi az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_105'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '105',
  '5',
  '„(5) Azon mesterségesintelligencia-rendszerek esetében, amelyek az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében biztonsági alkotórészeknek minősülnek, a Bizottság az (1) bekezdés szerinti tevékenysége végzésekor, valamint a (2) és a (3) bekezdés szerinti műszaki és vizsgálati előírások elfogadásakor figyelembe veszi az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_105'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '106',
  null,
  'Az (EU) 2016/797 irányelv módosítása
Az (EU) 2016/797 irányelv 5. cikke a következő bekezdéssel egészül ki:

„(12) Az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az (1) bekezdés szerinti, felhatalmazáson alapuló jogi aktusok és a (11) bekezdés szerinti végrehajtási jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_106'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '106',
  '12',
  '„(12) Az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az (1) bekezdés szerinti, felhatalmazáson alapuló jogi aktusok és a (11) bekezdés szerinti végrehajtási jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_106'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '107',
  null,
  'Az (EU) 2018/858 rendelet módosításai
Az (EU) 2018/858 rendelet 5. cikke a következő bekezdéssel egészül ki:

„(4) Az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, a (3) bekezdés szerinti, felhatalmazáson alapuló jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_107'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '107',
  '4',
  '„(4) Az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, a (3) bekezdés szerinti, felhatalmazáson alapuló jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_107'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '108',
  null,
  'Az (EU) 2018/1139 rendelet módosítása
Az (EU) 2018/1139 rendelet a következőképpen módosul:

1.

A 17. cikk a következő bekezdéssel egészül ki:

„(3) A (2) bekezdés sérelme nélkül, az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az (1) bekezdés szerinti végrehajtási jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.

( * ) Az Európai Parlament és a Tanács (EU) 2024/1689 rendelete (2024. június 13.) a mesterséges intelligenciára vonatkozó harmonizált szabályok megállapításáról, valamint a 300/2008/EK, a 167/2013/EU, a 168/2013/EU, az (EU) 2018/858, az (EU) 2018/1139 és az (EU) 2019/2144 rendelet, továbbá a 2014/90/EU, az (EU) 2016/797 és az (EU) 2020/1828 irányelv módosításáról (a mesterséges intelligenciáról szóló rendelet) ( HL L, 2024/1689, 2024.7.12., ELI: http://data.europa.eu/eli/reg/2024/1689/oj ).”
"

2.

A 19. cikk a következő bekezdéssel egészül ki:

„(4) Az (EU) 2024/1689 rendelet értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az (1) és a (2) bekezdés szerinti, felhatalmazáson alapuló jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.”

3.

A 43. cikk a következő bekezdéssel egészül ki:

„(4) Az (EU) 2024/1689 rendelet értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az (1) bekezdés szerinti végrehajtási jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.”

4.

A 47. cikk a következő bekezdéssel egészül ki:

„(3) Az (EU) 2024/1689 rendelet értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az (1) és a (2) bekezdés szerinti, felhatalmazáson alapuló jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.”

5.

Az 57. cikk a következő albekezdéssel egészül ki:

„Az (EU) 2024/1689 rendelet értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, említett végrehajtási jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.”

6.

Az 58. cikk a következő bekezdéssel egészül ki:

„(3) Az (EU) 2024/1689 rendelet értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az (1) és a (2) bekezdés szerinti, felhatalmazáson alapuló jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III fejezetének 2. szakaszában foglalt követelményeket.”',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_108'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '108',
  '3',
  '„(3) A (2) bekezdés sérelme nélkül, az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az (1) bekezdés szerinti végrehajtási jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.

( * ) Az Európai Parlament és a Tanács (EU) 2024/1689 rendelete (2024. június 13.) a mesterséges intelligenciára vonatkozó harmonizált szabályok megállapításáról, valamint a 300/2008/EK, a 167/2013/EU, a 168/2013/EU, az (EU) 2018/858, az (EU) 2018/1139 és az (EU) 2019/2144 rendelet, továbbá a 2014/90/EU, az (EU) 2016/797 és az (EU) 2020/1828 irányelv módosításáról (a mesterséges intelligenciáról szóló rendelet) ( HL L, 2024/1689, 2024.7.12., ELI: http://data.europa.eu/eli/reg/2024/1689/oj ).”
"

2.

A 19. cikk a következő bekezdéssel egészül ki:',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_108'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '108',
  '4',
  '„(4) Az (EU) 2024/1689 rendelet értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az (1) és a (2) bekezdés szerinti, felhatalmazáson alapuló jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.”

3.

A 43. cikk a következő bekezdéssel egészül ki:',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_108'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '108',
  '4',
  '„(4) Az (EU) 2024/1689 rendelet értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az (1) bekezdés szerinti végrehajtási jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.”

4.

A 47. cikk a következő bekezdéssel egészül ki:',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_108'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '108',
  '3',
  '„(3) Az (EU) 2024/1689 rendelet értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az (1) és a (2) bekezdés szerinti, felhatalmazáson alapuló jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.”

5.

Az 57. cikk a következő albekezdéssel egészül ki:

„Az (EU) 2024/1689 rendelet értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, említett végrehajtási jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.”

6.

Az 58. cikk a következő bekezdéssel egészül ki:',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_108'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '108',
  '3',
  '„(3) Az (EU) 2024/1689 rendelet értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, az (1) és a (2) bekezdés szerinti, felhatalmazáson alapuló jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III fejezetének 2. szakaszában foglalt követelményeket.”',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_108'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '109',
  null,
  'Az (EU) 2019/2144 rendelet módosítása
Az (EU) 2019/2144 rendelet 11. cikke a következő bekezdéssel egészül ki:

„(3) Az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, a (2) bekezdés szerinti végrehajtási jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_109'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '109',
  '3',
  '„(3) Az (EU) 2024/1689 európai parlamenti és tanácsi rendelet ( * ) értelmében biztonsági alkotórészeknek minősülő mesterségesintelligencia-rendszerekre vonatkozó, a (2) bekezdés szerinti végrehajtási jogi aktusok elfogadásakor figyelembe kell venni az említett rendelet III. fejezetének 2. szakaszában foglalt követelményeket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_109'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '110',
  null,
  'Az (EU) 2020/1828 irányelv módosítása
Az (EU) 2020/1828 európai parlamenti és tanácsi irányelv ( 58 ) I. melléklete a következő ponttal egészül ki:

„68.

Az Európai Parlament és a Tanács (EU) 2024/1689 rendelete (2024. június 13.) a mesterséges intelligenciára vonatkozó harmonizált szabályok megállapításáról, valamint a 300/2008/EK, a 167/2013/EU, a 168/2013/EU, az (EU) 2018/858, az (EU) 2018/1139 és az (EU) 2019/2144 rendelet, továbbá a 2014/90/EU, az (EU) 2016/797 és az (EU) 2020/1828 irányelv módosításáról (a mesterséges intelligenciáról szóló rendelet) ( HL L, 2024/1689, 2024.7.12., ELI: http://data.europa.eu/eli/reg/2024/1689/oj )”.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_110'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '111',
  null,
  'Már forgalomba hozott vagy üzembe helyezett MI-rendszerek és már forgalomba hozott általános célú MI-rendszerek
(1) Anélkül, hogy ez sértené az 5. cikknek a 113. cikk harmadik bekezdésének a) pontjában említett alkalmazását, a X. mellékletben felsorolt jogi aktusokkal létrehozott nagy méretű informatikai rendszerek alkotóelemeit képező azon MI-rendszereknek, amelyeket 2027. augusztus 2. előtt hoztak forgalomba vagy helyeztek üzembe, 2030. december 31-ig meg kell felelniük e rendeletnek.

Az e rendeletben meghatározott követelményeket figyelembe kell venni minden egyes, a X. mellékletben felsorolt jogi aktusokkal létrehozott nagy méretű informatikai rendszer értékelése során, amelyet az említett jogi aktusokban előírtak szerint kell elvégezni, továbbá abban az esetben, ha az említett jogi aktusokat más jogi aktussal váltják fel vagy módosítják.

(2) E rendelet 5. cikkének a 113. cikke harmadik bekezdésének a) pontjában említett alkalmazásának sérelme nélkül, e rendelet csak akkor alkalmazandó az e cikk (1) bekezdésében említettektől eltérő, nagy kockázatú azon MI-rendszerek üzemeltetőire, amelyeket 2026. augusztus 2. előtt hoztak forgalomba vagy helyeztek üzembe, ha az említett időponttól kezdve az említett rendszerek tervezésében jelentős változások történnek. Mindenesetre a hatóságok általi használatra szánt, nagy kockázatú MI-rendszerek szolgáltatóinak és alkalmazóinak 2030. augusztus 2-ig meg kell tenniük az e rendelet követelményeinek és kötelezettségeinek való megfeleléshez szükséges lépéseket.

(3) Azon általános célú MI-modellek szolgáltatóinak, amelyeket 2025. augusztus 2. előtt hoztak forgalomba, 2027. augusztus 2-ig meg kell tenniük az e rendeletben meghatározott kötelezettségeknek való megfeleléshez szükséges lépéseket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_111'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '111',
  '1',
  '(1) Anélkül, hogy ez sértené az 5. cikknek a 113. cikk harmadik bekezdésének a) pontjában említett alkalmazását, a X. mellékletben felsorolt jogi aktusokkal létrehozott nagy méretű informatikai rendszerek alkotóelemeit képező azon MI-rendszereknek, amelyeket 2027. augusztus 2. előtt hoztak forgalomba vagy helyeztek üzembe, 2030. december 31-ig meg kell felelniük e rendeletnek.

Az e rendeletben meghatározott követelményeket figyelembe kell venni minden egyes, a X. mellékletben felsorolt jogi aktusokkal létrehozott nagy méretű informatikai rendszer értékelése során, amelyet az említett jogi aktusokban előírtak szerint kell elvégezni, továbbá abban az esetben, ha az említett jogi aktusokat más jogi aktussal váltják fel vagy módosítják.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_111'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '111',
  '2',
  '(2) E rendelet 5. cikkének a 113. cikke harmadik bekezdésének a) pontjában említett alkalmazásának sérelme nélkül, e rendelet csak akkor alkalmazandó az e cikk (1) bekezdésében említettektől eltérő, nagy kockázatú azon MI-rendszerek üzemeltetőire, amelyeket 2026. augusztus 2. előtt hoztak forgalomba vagy helyeztek üzembe, ha az említett időponttól kezdve az említett rendszerek tervezésében jelentős változások történnek. Mindenesetre a hatóságok általi használatra szánt, nagy kockázatú MI-rendszerek szolgáltatóinak és alkalmazóinak 2030. augusztus 2-ig meg kell tenniük az e rendelet követelményeinek és kötelezettségeinek való megfeleléshez szükséges lépéseket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_111'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '111',
  '3',
  '(3) Azon általános célú MI-modellek szolgáltatóinak, amelyeket 2025. augusztus 2. előtt hoztak forgalomba, 2027. augusztus 2-ig meg kell tenniük az e rendeletben meghatározott kötelezettségeknek való megfeleléshez szükséges lépéseket.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_111'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  null,
  'Értékelés és felülvizsgálat
(1) A Bizottság e rendelet hatálybalépését követően, a 97. cikkben meghatározott felhatalmazási időszak végéig évente egyszer értékeli a III. mellékletben szereplő jegyzék és a tiltott MI-gyakorlatok 5. cikkben meghatározott jegyzéke módosításának szükségességét. A Bizottság az említett értékelés megállapításait továbbítja az Európai Parlamentnek és a Tanácsnak.

(2) A Bizottság 2028. augusztus 2-ig, és azt követően négyévente értékeli a következőket, és azokról jelentést nyújt be az Európai Parlamentnek és a Tanácsnak:

a)

a III. mellékletben szereplő meglévő területkategóriák bővítésére vagy új területkategóriák felvételére irányuló módosítások szükségessége;

b)

a további átláthatósági intézkedéseket igénylő MI-rendszerek 50. cikkben szereplő jegyzékének módosításai;

c)

a felügyeleti és irányítási rendszer hatékonyságának megerősítésére irányuló módosítások.

(3) A Bizottság 2029. augusztus 2-ig, majd azt követően négyévente jelentést nyújt be az Európai Parlamentnek és a Tanácsnak e rendelet értékeléséről és felülvizsgálatáról. A jelentésnek értékelést kell magában foglalnia a végrehajtás struktúrájára és arra vonatkozóan, hogy esetlegesen szükség van-e valamely uniós ügynökségre a feltárt hiányosságok orvoslásához. A megállapítások alapján az említett jelentést adott esetben az e rendelet módosítására irányuló javaslatnak kell kísérnie. A jelentéseket közzé kell tenni.

(4) A (2) bekezdésben említett jelentésekben különös figyelmet kell fordítani a következőkre:

a)

az illetékes nemzeti hatóságok pénzügyi, műszaki és emberi erőforrásainak helyzete az e rendelet alapján számukra kijelölt feladatok hatékony elvégzése érdekében;

b)

a tagállamok által az e rendelet megsértése esetén alkalmazott szankciók és különösen a 99. cikk (1) bekezdésében említett közigazgatási bírságok helyzete;

c)

az e rendelet támogatására kidolgozott, elfogadott harmonizált szabványok és közös előírások;

d)

az e rendelet alkalmazásának megkezdése után piacra lépő vállalkozások száma, és ezek közül mennyi a kkv.

(5) A Bizottság 2028. augusztus 2-ig értékeli az MI-hivatal működését, azt, hogy az MI-hivatal elegendő hatáskörrel és illetékességgel rendelkezik-e feladatainak ellátásához, valamint azt, hogy e rendelet megfelelő végrehajtása és érvényesítése szempontjából releváns és szükséges lenne-e továbbfejleszteni az MI-hivatalt és annak végrehajtási hatásköreit, és növelni annak erőforrásait. A Bizottság értékeléséről jelentést nyújt be az Európai Parlamentnek és a Tanácsnak.

(6) A Bizottság 2028. augusztus 2-ig, majd azt követően négyévente jelentést nyújt be az általános célú MI-modellek energiahatékony fejlesztésével kapcsolatos szabvány jellegű dokumentumok kidolgozása terén elért előrehaladás áttekintéséről, és értékeli, hogy szükség van-e további intézkedésekre vagy fellépésekre, beleértve a kötelező erejű intézkedéseket vagy fellépéseket is. A jelentést be kell nyújtani az Európai Parlamentnek és a Tanácsnak, és azt nyilvánosságra kell hozni.

(7) A Bizottság 2028. augusztus 2-ig, majd azt követően háromévente értékeli az önkéntes magatartási kódexek hatását és hatékonyságát a III. fejezet 2. szakaszában foglalt, a nagy kockázatú MI-rendszerektől eltérő MI-rendszerekre vonatkozó követelmények és esetleg a nagy kockázatú MI-rendszerektől eltérő MI-rendszerekre vonatkozó egyéb további, így például a környezeti fenntarthatóságra vonatkozó követelmények alkalmazásának előmozdítása érdekében.

(8) Az (1)–(7) bekezdés alkalmazásában a Testület, a tagállamok és az illetékes nemzeti hatóságok kérésre és indokolatlan késedelem nélkül tájékoztatást nyújtanak a Bizottságnak.

(9) A Bizottság az (1)–(7) bekezdésben említett értékelések és felülvizsgálatok során figyelembe veszi a Testület, az Európai Parlament, a Tanács és az egyéb megfelelő szervek vagy források álláspontját és megállapításait.

(10) A Bizottság szükség esetén megfelelő javaslatokat nyújt be e rendelet módosítására, figyelembe véve különösen a technológiai fejlődést, az MI-rendszereknek az egészségre és a biztonságra, valamint az alapvető jogokra gyakorolt hatását, továbbá tekintettel az információs társadalom fejlődési szintjére.

(11) Annak érdekében, hogy iránymutatást nyújtson az e cikk (1)–(7) bekezdésében említett értékelésekhez és felülvizsgálatokhoz, az MI-hivatalnak objektív és részvételen alapuló módszertant kell kidolgoznia a kockázati szinteknek a releváns cikkekben meghatározott kritériumok alapján való értékelésére és az új rendszereknek a következő jegyzékekbe való felvételére vonatkozóan:

a)

a III. mellékletben meghatározott jegyzék, beleértve a meglévő területkategóriák bővítését vagy új területkategóriák felvételét az említett mellékletbe;

b)

az 5. cikkben meghatározott tiltott gyakorlatok jegyzéke; és

c)

az 50. cikk szerinti, további átláthatósági intézkedéseket igénylő MI-rendszerek jegyzéke.

(12) E rendelet (10) bekezdés szerinti bármely módosításának, illetve az I. melléklet B. szakaszában felsorolt uniós ágazati harmonizációs jogszabályokat érintő, felhatalmazáson alapuló jogi aktusoknak vagy végrehajtási aktusoknak figyelembe kell venniük az egyes ágazatok szabályozási sajátosságait, valamint a meglévő irányítási, megfelelőségértékelési és végrehajtási mechanizmusokat, és az azok keretében létrehozott hatóságokat.

(13) A Bizottság 2031. augusztus 2-ig értékeli e rendelet végrehajtását, és erről jelentést készít az Európai Parlamentnek, a Tanácsnak, valamint az Európai Gazdasági és Szociális Bizottságnak, figyelembe véve e rendelet alkalmazásának első éveit. A megállapítások alapján a jelentést adott esetben az e rendelet módosítására irányuló javaslatnak kell kísérnie a végrehajtás struktúrájára és arra vonatkozóan, hogy szükség van-e valamely uniós ügynökségre a feltárt hiányosságok orvoslásához.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '1',
  '(1) A Bizottság e rendelet hatálybalépését követően, a 97. cikkben meghatározott felhatalmazási időszak végéig évente egyszer értékeli a III. mellékletben szereplő jegyzék és a tiltott MI-gyakorlatok 5. cikkben meghatározott jegyzéke módosításának szükségességét. A Bizottság az említett értékelés megállapításait továbbítja az Európai Parlamentnek és a Tanácsnak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '2',
  '(2) A Bizottság 2028. augusztus 2-ig, és azt követően négyévente értékeli a következőket, és azokról jelentést nyújt be az Európai Parlamentnek és a Tanácsnak:

a)

a III. mellékletben szereplő meglévő területkategóriák bővítésére vagy új területkategóriák felvételére irányuló módosítások szükségessége;

b)

a további átláthatósági intézkedéseket igénylő MI-rendszerek 50. cikkben szereplő jegyzékének módosításai;

c)

a felügyeleti és irányítási rendszer hatékonyságának megerősítésére irányuló módosítások.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '2(a)',
  'a) a III. mellékletben szereplő meglévő területkategóriák bővítésére vagy új területkategóriák felvételére irányuló módosítások szükségessége;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '2(b)',
  'b) a további átláthatósági intézkedéseket igénylő MI-rendszerek 50. cikkben szereplő jegyzékének módosításai;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '2(c)',
  'c) a felügyeleti és irányítási rendszer hatékonyságának megerősítésére irányuló módosítások.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '3',
  '(3) A Bizottság 2029. augusztus 2-ig, majd azt követően négyévente jelentést nyújt be az Európai Parlamentnek és a Tanácsnak e rendelet értékeléséről és felülvizsgálatáról. A jelentésnek értékelést kell magában foglalnia a végrehajtás struktúrájára és arra vonatkozóan, hogy esetlegesen szükség van-e valamely uniós ügynökségre a feltárt hiányosságok orvoslásához. A megállapítások alapján az említett jelentést adott esetben az e rendelet módosítására irányuló javaslatnak kell kísérnie. A jelentéseket közzé kell tenni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '4',
  '(4) A (2) bekezdésben említett jelentésekben különös figyelmet kell fordítani a következőkre:

a)

az illetékes nemzeti hatóságok pénzügyi, műszaki és emberi erőforrásainak helyzete az e rendelet alapján számukra kijelölt feladatok hatékony elvégzése érdekében;

b)

a tagállamok által az e rendelet megsértése esetén alkalmazott szankciók és különösen a 99. cikk (1) bekezdésében említett közigazgatási bírságok helyzete;

c)

az e rendelet támogatására kidolgozott, elfogadott harmonizált szabványok és közös előírások;

d)

az e rendelet alkalmazásának megkezdése után piacra lépő vállalkozások száma, és ezek közül mennyi a kkv.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '4(a)',
  'a) az illetékes nemzeti hatóságok pénzügyi, műszaki és emberi erőforrásainak helyzete az e rendelet alapján számukra kijelölt feladatok hatékony elvégzése érdekében;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '4(b)',
  'b) a tagállamok által az e rendelet megsértése esetén alkalmazott szankciók és különösen a 99. cikk (1) bekezdésében említett közigazgatási bírságok helyzete;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '4(c)',
  'c) az e rendelet támogatására kidolgozott, elfogadott harmonizált szabványok és közös előírások;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '4(d)',
  'd) az e rendelet alkalmazásának megkezdése után piacra lépő vállalkozások száma, és ezek közül mennyi a kkv.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '5',
  '(5) A Bizottság 2028. augusztus 2-ig értékeli az MI-hivatal működését, azt, hogy az MI-hivatal elegendő hatáskörrel és illetékességgel rendelkezik-e feladatainak ellátásához, valamint azt, hogy e rendelet megfelelő végrehajtása és érvényesítése szempontjából releváns és szükséges lenne-e továbbfejleszteni az MI-hivatalt és annak végrehajtási hatásköreit, és növelni annak erőforrásait. A Bizottság értékeléséről jelentést nyújt be az Európai Parlamentnek és a Tanácsnak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '6',
  '(6) A Bizottság 2028. augusztus 2-ig, majd azt követően négyévente jelentést nyújt be az általános célú MI-modellek energiahatékony fejlesztésével kapcsolatos szabvány jellegű dokumentumok kidolgozása terén elért előrehaladás áttekintéséről, és értékeli, hogy szükség van-e további intézkedésekre vagy fellépésekre, beleértve a kötelező erejű intézkedéseket vagy fellépéseket is. A jelentést be kell nyújtani az Európai Parlamentnek és a Tanácsnak, és azt nyilvánosságra kell hozni.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '7',
  '(7) A Bizottság 2028. augusztus 2-ig, majd azt követően háromévente értékeli az önkéntes magatartási kódexek hatását és hatékonyságát a III. fejezet 2. szakaszában foglalt, a nagy kockázatú MI-rendszerektől eltérő MI-rendszerekre vonatkozó követelmények és esetleg a nagy kockázatú MI-rendszerektől eltérő MI-rendszerekre vonatkozó egyéb további, így például a környezeti fenntarthatóságra vonatkozó követelmények alkalmazásának előmozdítása érdekében.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '8',
  '(8) Az (1)–(7) bekezdés alkalmazásában a Testület, a tagállamok és az illetékes nemzeti hatóságok kérésre és indokolatlan késedelem nélkül tájékoztatást nyújtanak a Bizottságnak.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '9',
  '(9) A Bizottság az (1)–(7) bekezdésben említett értékelések és felülvizsgálatok során figyelembe veszi a Testület, az Európai Parlament, a Tanács és az egyéb megfelelő szervek vagy források álláspontját és megállapításait.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '10',
  '(10) A Bizottság szükség esetén megfelelő javaslatokat nyújt be e rendelet módosítására, figyelembe véve különösen a technológiai fejlődést, az MI-rendszereknek az egészségre és a biztonságra, valamint az alapvető jogokra gyakorolt hatását, továbbá tekintettel az információs társadalom fejlődési szintjére.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '11',
  '(11) Annak érdekében, hogy iránymutatást nyújtson az e cikk (1)–(7) bekezdésében említett értékelésekhez és felülvizsgálatokhoz, az MI-hivatalnak objektív és részvételen alapuló módszertant kell kidolgoznia a kockázati szinteknek a releváns cikkekben meghatározott kritériumok alapján való értékelésére és az új rendszereknek a következő jegyzékekbe való felvételére vonatkozóan:

a)

a III. mellékletben meghatározott jegyzék, beleértve a meglévő területkategóriák bővítését vagy új területkategóriák felvételét az említett mellékletbe;

b)

az 5. cikkben meghatározott tiltott gyakorlatok jegyzéke; és

c)

az 50. cikk szerinti, további átláthatósági intézkedéseket igénylő MI-rendszerek jegyzéke.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '11(a)',
  'a) a III. mellékletben meghatározott jegyzék, beleértve a meglévő területkategóriák bővítését vagy új területkategóriák felvételét az említett mellékletbe;',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '11(b)',
  'b) az 5. cikkben meghatározott tiltott gyakorlatok jegyzéke; és',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '11(c)',
  'c) az 50. cikk szerinti, további átláthatósági intézkedéseket igénylő MI-rendszerek jegyzéke.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '12',
  '(12) E rendelet (10) bekezdés szerinti bármely módosításának, illetve az I. melléklet B. szakaszában felsorolt uniós ágazati harmonizációs jogszabályokat érintő, felhatalmazáson alapuló jogi aktusoknak vagy végrehajtási aktusoknak figyelembe kell venniük az egyes ágazatok szabályozási sajátosságait, valamint a meglévő irányítási, megfelelőségértékelési és végrehajtási mechanizmusokat, és az azok keretében létrehozott hatóságokat.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '112',
  '13',
  '(13) A Bizottság 2031. augusztus 2-ig értékeli e rendelet végrehajtását, és erről jelentést készít az Európai Parlamentnek, a Tanácsnak, valamint az Európai Gazdasági és Szociális Bizottságnak, figyelembe véve e rendelet alkalmazásának első éveit. A megállapítások alapján a jelentést adott esetben az e rendelet módosítására irányuló javaslatnak kell kísérnie a végrehajtás struktúrájára és arra vonatkozóan, hogy szükség van-e valamely uniós ügynökségre a feltárt hiányosságok orvoslásához.',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_112'
);
select public.aic_upsert_legal_text(
  '02024R1689-20260727',
  '113',
  null,
  'Hatálybalépés és alkalmazás
Ez a rendelet az Európai Unió Hivatalos Lapjában való kihirdetését követő huszadik napon lép hatályba.

Ezt a rendeletet 2026. augusztus 2-től kell alkalmazni.

Azonban:

a)

az I. és a II. fejezetet 2025. február 2-től kell alkalmazni;

b)

a III. fejezet 4. szakaszát, az V. fejezetet, a VII. fejezetet, és a XII. fejezetet – a 101. cikk kivételével –, valamint a 78. cikket 2025. augusztus 2-től kell alkalmazni;

c)

A 6. cikk (1) bekezdését és az e rendeletben foglalt vonatkozó kötelezettségeket 2027. augusztus 2-től kell alkalmazni.

Ez a rendelet teljes egészében kötelező és közvetlenül alkalmazandó valamennyi tagállamban.

Kelt Brüsszelben, 2024. június 13-án.

az Európai Parlament részéről

az elnök

R. METSOLA

a Tanács részéről

az elnök

M. MICHEL

( 1 )
HL C 517., 2021.12.22., 56. o.

( 2 )
HL C 115., 2022.3.11., 5. o.

( 3 )
HL C 97., 2022.2.28., 60. o.

( 4 ) Az Európai Parlament 2024. március 13-i álláspontja (a Hivatalos Lapban még nem tették közzé) és a Tanács 2024. május 21-i határozata.

( 5 ) Európai Tanács, Az Európai Tanács rendkívüli ülése (2020. október 1–2.) – Következtetések, EUCO 13/20, 2020, 6. o.

( 6 ) Az Európai Parlament 2020. október 20-i állásfoglalása a Bizottsághoz intézett ajánlásokkal a mesterséges intelligencia, a robotika és a kapcsolódó technológiák etikai szempontjainak keretéről, 2020/2012(INL).

( 7 ) Az Európai Parlament és a Tanács 765/2008/EK rendelete (2008. július 9.) az akkreditálás előírásainak megállapításáról és a 339/93/EGK rendelet hatályon kívül helyezéséről ( HL L 218., 2008.8.13., 30. o. ).

( 8 ) Az Európai Parlament és a Tanács 768/2008/EK határozata (2008. július 9.) a termékek forgalomba hozatalának közös keretrendszeréről, valamint a 93/465/EGK tanácsi határozat hatályon kívül helyezéséről ( HL L 218., 2008.8.13., 82. o. ).

( 9 ) Az Európai Parlament és a Tanács (EU) 2019/1020 rendelete (2019. június 20.) a piacfelügyeletről és a termékek megfelelőségéről, valamint a 2004/42/EK irányelv, továbbá a 765/2008/EK és a 305/2011/EU rendelet módosításáról ( HL L 169., 2019.6.25., 1. o. ).

( 10 ) A Tanács 85/374/EGK irányelve (1985. július 25.) a hibás termékekért való felelősségre vonatkozó tagállami törvényi, rendeleti és közigazgatási rendelkezések közelítéséről ( HL L 210., 1985.8.7., 29. o. ).

( 11 ) Az Európai Parlament és a Tanács (EU) 2016/679 rendelete (2016. április 27.) a természetes személyeknek a személyes adatok kezelése tekintetében történő védelméről és az ilyen adatok szabad áramlásáról, valamint a 95/46/EK irányelv hatályon kívül helyezéséről (általános adatvédelmi rendelet) ( HL L 119., 2016.5.4., 1. o. ).

( 12 ) Az Európai Parlament és a Tanács (EU) 2018/1725 rendelete (2018. október 23.) a természetes személyeknek a személyes adatok uniós intézmények, szervek, hivatalok és ügynökségek általi kezelése tekintetében való védelméről és az ilyen adatok szabad áramlásáról, valamint a 45/2001/EK rendelet és az 1247/2002/EK határozat hatályon kívül helyezéséről ( HL L 295., 2018.11.21., 39. o. ).

( 13 ) Az Európai Parlament és a Tanács (EU) 2016/680 irányelve (2016. április 27.) a személyes adatoknak az illetékes hatóságok által a bűncselekmények megelőzése, nyomozása, felderítése, a vádeljárás lefolytatása vagy büntetőjogi szankciók végrehajtása céljából végzett kezelése tekintetében a természetes személyek védelméről és az ilyen adatok szabad áramlásáról, valamint a 2008/977/IB tanácsi kerethatározat hatályon kívül helyezéséről ( HL L 119., 2016.5.4., 89. o. ).

( 14 ) Az Európai Parlament és a Tanács 2002/58/EK irányelve (2002. július 12.) az elektronikus hírközlési ágazatban a személyes adatok kezeléséről, feldolgozásáról és a magánélet védelméről (Elektronikus hírközlési adatvédelmi irányelv) ( HL L 201., 2002.7.31., 37. o. ).

( 15 ) Az Európai Parlament és a Tanács (EU) 2022/2065 rendelete (2022. október 19.) a digitális szolgáltatások egységes piacáról és a 2000/31/EK irányelv módosításáról (digitális szolgáltatásokról szóló rendelet) ( HL L 277., 2022.10.27., 1. o. ).

( 16 ) Az Európai Parlament és a Tanács (EU) 2019/882 irányelve (2019. április 17.) a termékekre és a szolgáltatásokra vonatkozó akadálymentességi követelményekről ( HL L 151., 2019.6.7., 70. o. ).

( 17 ) Az Európai Parlament és a Tanács 2005/29/EK irányelve (2005. május 11.) a belső piacon az üzleti vállalkozások fogyasztókkal szemben folytatott tisztességtelen kereskedelmi gyakorlatairól, valamint a 84/450/EGK tanácsi irányelv, a 97/7/EK, a 98/27/EK és a 2002/65/EK európai parlamenti és tanácsi irányelvek, valamint a 2006/2004/EK európai parlamenti és tanácsi rendelet módosításáról („Irányelv a tisztességtelen kereskedelmi gyakorlatokról”) ( HL L 149., 2005.6.11., 22. o. ).

( 18 ) A Tanács 2002/584/IB kerethatározata (2002. június 13.) az európai elfogatóparancsról és a tagállamok közötti átadási eljárásokról ( HL L 190., 2002.7.18., 1. o. ).

( 19 ) Az Európai Parlament és a Tanács (EU) 2022/2557 irányelve (2022. december 14.) a kritikus szervezetek rezilienciájáról és a 2008/114/EK tanácsi irányelv hatályon kívül helyezéséről ( HL L 333., 2022.12.27., 164. o. ).

( 20 )
HL C 247., 2022.6.29., 1. o.

( 21 ) Az Európai Parlament és a Tanács (EU) 2017/745 rendelete (2017. április 5.) az orvostechnikai eszközökről, a 2001/83/EK irányelv, a 178/2002/EK rendelet és az 1223/2009/EK rendelet módosításáról, valamint a 90/385/EGK és a 93/42/EGK tanácsi irányelv hatályon kívül helyezéséről ( HL L 117., 2017.5.5., 1. o. ).

( 22 ) Az Európai Parlament és a Tanács (EU) 2017/746 rendelete (2017. április 5.) az in vitro diagnosztikai orvostechnikai eszközökről, valamint a 98/79/EK irányelv és a 2010/227/EU bizottsági határozat hatályon kívül helyezéséről ( HL L 117., 2017.5.5., 176. o. ).

( 23 ) Az Európai Parlament és a Tanács 2006/42/EK irányelve (2006. május 17.) a gépekről és a 95/16/EK irányelv módosításáról ( HL L 157., 2006.6.9., 24. o. ).

( 24 ) Az Európai Parlament és a Tanács 300/2008/EK rendelete (2008. március 11.) a polgári légi közlekedés védelmének közös szabályairól és a 2320/2002/EK rendelet hatályon kívül helyezéséről ( HL L 97., 2008.4.9., 72. o. ).

( 25 ) Az Európai Parlament és a Tanács 167/2013/EU rendelete (2013. február 5.) a mezőgazdasági és erdészeti járművek jóváhagyásáról és piacfelügyeletéről ( HL L 60., 2013.3.2., 1. o. ).

( 26 ) Az Európai Parlament és a Tanács 168/2013/EU rendelete (2013. január 15.) a két- vagy háromkerekű járművek, valamint a négykerekű motorkerékpárok jóváhagyásáról és piacfelügyeletéről ( HL L 60., 2013.3.2., 52. o. ).

( 27 ) Az Európai Parlament és a Tanács 2014/90/EU irányelve (2014. július 23.) a tengerészeti felszerelésekről és a 96/98/EK tanácsi irányelv hatályon kívül helyezéséről ( HL L 257., 2014.8.28., 146. o. ).

( 28 ) Az Európai Parlament és a Tanács (EU) 2016/797 irányelve (2016. május 11.) a vasúti rendszer Európai Unión belüli kölcsönös átjárhatóságáról ( HL L 138., 2016.5.26., 44. o. ).

( 29 ) Az Európai Parlament és a Tanács (EU) 2018/858 rendelete (2018. május 30.) a gépjárművek és pótkocsijaik, valamint az ilyen járművek rendszereinek, alkotóelemeinek és önálló műszaki egységeinek jóváhagyásáról és piacfelügyeletéről, a 715/2007/EK és az 595/2009/EK rendelet módosításáról, valamint a 2007/46/EK irányelv hatályon kívül helyezéséről ( HL L 151., 2018.6.14., 1. o. ).

( 30 ) Az Európai Parlament és a Tanács (EU) 2018/1139 rendelete (2018. július 4.) a polgári légi közlekedés területén alkalmazandó közös szabályokról és az Európai Unió Repülésbiztonsági Ügynökségének létrehozásáról és a 2111/2005/EK, az 1008/2008/EK, a 996/2010/EU, a 376/2014/EU európai parlamenti és tanácsi rendelet és a 2014/30/EU és a 2014/53/EU európai parlamenti és tanácsi irányelv módosításáról, valamint az 552/2004/EK és a 216/2008/EK európai parlamenti és tanácsi rendelet és a 3922/91/EGK tanácsi rendelet hatályon kívül helyezéséről ( HL L 212., 2018.8.22., 1. o. ).

( 31 ) Az Európai Parlament és a Tanács (EU) 2019/2144 rendelete (2019. november 27.) a gépjárműveknek és pótkocsijaiknak, valamint az ilyen járművek rendszereinek, alkotóelemeinek és önálló műszaki egységeinek az általános biztonság, továbbá az utasok és a veszélyeztetett úthasználók védelme tekintetében történő típusjóváhagyásáról, az (EU) 2018/858 európai parlamenti és tanácsi rendelet módosításáról, valamint a 78/2009/EK, a 79/2009/EK és a 661/2009/EK európai parlamenti és tanácsi rendelet és a 631/2009/EK, a 406/2010/EU, a 672/2010/EU, az 1003/2010/EU, az 1005/2010/EU, az 1008/2010/EU, az 1009/2010/EU, a 19/2011/EU, a 109/2011/EU, a 458/2011/EU, a 65/2012/EU, a 130/2012/EU, a 347/2012/EU, a 351/2012/EU, az 1230/2012/EU és az (EU) 2015/166 bizottsági rendelet hatályon kívül helyezéséről ( HL L 325., 2019.12.16., 1. o. ).

( 32 ) Az Európai Parlament és a Tanács 810/2009/EK rendelete (2009. július 13.) a Közösségi Vízumkódex létrehozásáról (vízumkódex) ( HL L 243., 2009.9.15., 1. o. ).

( 33 ) Az Európai Parlament és a Tanács 2013/32/EU irányelve (2013. június 26.) a nemzetközi védelem megadására és visszavonására vonatkozó közös eljárásokról ( HL L 180., 2013.6.29., 60. o. ).

( 34 ) Az Európai Parlament és a Tanács (EU) 2024/900 rendelete 2024. március 13.) a politikai reklám átláthatóságáról és targetálásáról ( HL L, 2024/900, 2024.3.20., ELI: http://data.europa.eu/eli/reg/2024/900/oj ).

( 35 ) Az Európai Parlament és a Tanács 2014/31/EU irányelve (2014. február 26.) a nem automatikus működésű mérlegek forgalmazására vonatkozó tagállami jogszabályok harmonizációjáról ( HL L 96., 2014.3.29., 107. o. ).

( 36 ) Az Európai Parlament és a Tanács 2014/32/EU irányelve (2014. február 26.) a mérőműszerek forgalmazására vonatkozó tagállami jogszabályok harmonizálásáról ( HL L 96., 2014.3.29., 149. o. ).

( 37 ) Az Európai Parlament és a Tanács (EU) 2019/881 rendelete (2019. április 17.) az ENISA-ról (az Európai Uniós Kiberbiztonsági Ügynökségről) és az információs és kommunikációs technológiák kiberbiztonsági tanúsításáról, valamint az 526/2013/EU rendelet hatályon kívül helyezéséről (kiberbiztonsági jogszabály) ( HL L 151., 2019.6.7., 15. o. ).

( 38 ) Az Európai Parlament és a Tanács (EU) 2016/2102 irányelve (2016. október 26.) a közszférabeli szervezetek honlapjainak és mobilalkalmazásainak akadálymentesítéséről ( HL L 327., 2016.12.2., 1. o. ).

( 39 ) Az Európai Parlament és a Tanács 2002/14/EK irányelve (2002. március 11.) az Európai Közösség munkavállalóinak tájékoztatása és a velük folytatott konzultáció általános keretének létrehozásáról ( HL L 80., 2002.3.23., 29. o. ).

( 40 ) Az Európai Parlament és a Tanács (EU) 2019/790 irányelve (2019. április 17.) a digitális egységes piacon a szerzői és szomszédos jogokról, valamint a 96/9/EK és a 2001/29/EK irányelv módosításáról ( HL L 130., 2019.5.17., 92. o. ).

( 41 ) Az Európai Parlament és a Tanács 1025/2012/EU rendelete (2012. október 25.) az európai szabványosításról, a 89/686/EGK és a 93/15/EGK tanácsi irányelv, a 94/9/EK, a 94/25/EK, a 95/16/EK, a 97/23/EK, a 98/34/EK, a 2004/22/EK, a 2007/23/EK, a 2009/23/EK és a 2009/105/EK európai parlamenti és tanácsi irányelv módosításáról, valamint a 87/95/EGK tanácsi határozat és az 1673/2006/EK európai parlamenti és tanácsi határozat hatályon kívül helyezéséről ( HL L 316., 2012.11.14., 12. o. ).

( 42 ) Az Európai Parlament és a Tanács (EU) 2022/868 rendelete (2022. május 30.) az európai adatkormányzásról és az (EU) 2018/1724 rendelet módosításáról (adatkormányzási rendelet) ( HL L 152., 2022.6.3., 1. o. ).

( 43 ) Az Európai Parlament és a Tanács (EU) 2023/2854 rendelete (2023. december 13.) a méltányos adathozzáférésre és -felhasználásra vonatkozó harmonizált szabályokról, valamint az (EU) 2017/2394 rendelet és az (EU) 2020/1828 irányelv módosításáról (adatrendelet) ( HL L, 2023/2854, 22.12.2023, ELI: http://data.europa.eu/eli/reg/2023/2854/oj ).

( 44 ) A Bizottság ajánlása (2003. május 6.) a mikro-, kis- és középvállalkozások meghatározásáról ( HL L 124., 2003.5.20., 36. o. ).

( 45 ) A Bizottság határozata (2024. január 24.) a mesterséges intelligenciával foglalkozó európai hivatal létrehozásáról (C/2024/1459).

( 46 ) Az Európai Parlament és a Tanács 575/2013/EU rendelete (2013. június 26.) a hitelintézetekre és befektetési vállalkozásokra vonatkozó prudenciális követelményekről és a 648/2012/EU rendelet módosításáról ( HL L 176., 2013.6.27., 1. o. ).

( 47 ) Az Európai Parlament és a Tanács 2008/48/EK irányelve (2008. április 23.) a fogyasztói hitelmegállapodásokról és a 87/102/EGK tanácsi irányelv hatályon kívül helyezéséről ( HL L 133., 2008.5.22., 66. o. ).

( 48 ) Az Európai Parlament és a Tanács 2009/138/EK irányelve (2009. november 25.) a biztosítási és viszontbiztosítási üzleti tevékenység megkezdéséről és gyakorlásáról (Szolvencia II) ( HL L 335., 2009.12.17., 1. o. ).

( 49 ) Az Európai Parlament és a Tanács 2013/36/EU irányelve (2013. június 26.) a hitelintézetek tevékenységéhez való hozzáférésről és a hitelintézetek és befektetési vállalkozások prudenciális felügyeletéről, a 2002/87/EK irányelv módosításáról, a 2006/48/EK és a 2006/49/EK irányelv hatályon kívül helyezéséről ( HL L 176., 2013.6.27., 338. o. ).

( 50 ) Az Európai Parlament és a Tanács 2014/17/EU irányelve (2014. február 4.) a lakóingatlanokhoz kapcsolódó fogyasztói hitelmegállapodásokról, valamint a 2008/48/EK és a 2013/36/EU irányelv és az 1093/2010/EU rendelet módosításáról ( HL L 60., 2014.2.28., 34. o. ).

( 51 ) Az Európai Parlament és a Tanács (EU) 2016/97 irányelve (2016. január 20.) a biztosítási értékesítésről ( HL L 26., 2016.2.2., 19. o. ).

( 52 ) A Tanács 1024/2013/EU rendelete (2013. október 15.) az Európai Központi Banknak a hitelintézetek prudenciális felügyeletére vonatkozó politikákkal kapcsolatos külön feladatokkal történő megbízásáról ( HL L 287., 2013.10.29., 63. o. ).

( 53 ) Az Európai Parlament és a Tanács (EU) 2023/988 rendelete (2023. május 10.) az általános termékbiztonságról, az 1025/2012/EU európai parlamenti és tanácsi rendelet és az (EU) 2020/1828 európai parlamenti és tanácsi irányelv módosításáról, valamint a 2001/95/EK európai parlamenti és tanácsi irányelv és a 87/357/EGK tanácsi irányelv hatályon kívül helyezéséről ( HL L 135., 2023.5.23., 1. o. ).

( 54 ) Az Európai Parlament és a Tanács (EU) 2019/1937 irányelve (2019. október 23.) az uniós jog megsértését bejelentő személyek védelméről ( HL L 305., 2019.11.26., 17. o. ).

( 55 )
HL L 123., 2016.5.12., 1. o.

( 56 ) Az Európai Parlament és a Tanács 182/2011/EU rendelete (2011. február 16.) a Bizottság végrehajtási hatásköreinek gyakorlására vonatkozó tagállami ellenőrzési mechanizmusok szabályainak és általános elveinek megállapításáról ( HL L 55., 2011.2.28., 13. o ).

( 57 ) Az Európai Parlament és a Tanács (EU) 2016/943 irányelve (2016. június 8.) a nem nyilvános know-how és üzleti információk (üzleti titkok) jogosulatlan megszerzésével, hasznosításával és felfedésével szembeni védelemről ( HL L 157., 2016.6.15., 1. o. ).

( 58 ) Az Európai Parlament és a Tanács (EU) 2020/1828 irányelve (2020. november 25.) a fogyasztók kollektív érdekeinek védelmére irányuló képviseleti keresetekről és a 2009/22/EK irányelv hatályon kívül helyezéséről ( HL L 409., 2020.12.4., 1. o. ).',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
  'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#art_113'
);

commit;
