-- EnergiaAI Kontroll – a hiányzó MI-rendeleti mellékletek betöltése.
--
-- MIÉRT
-- A katalógusban 35 gyártói, 2 importőri, 2 forgalmazói és 2 meghatalmazott
-- képviselői szabály van. Ezek a 43., 47., 48., 49., 51., 53. és 55. cikkre
-- hivatkoznak, azok szövege pedig továbbmutat a VI., VII., IX. és XIII.
-- mellékletre. Ezek eddig nem voltak betöltve, így a jogász a cikk olvasása
-- közben zsákutcába futott.
--
-- MI KERÜL BE
-- II.   bűncselekmények jegyzéke az 5. cikkhez (felsorolás, nem számozott)
-- VI.   belső ellenőrzésen alapuló megfelelőségértékelés
-- VII.  minőségirányítási rendszeren alapuló megfelelőségértékelés
-- IX.   nyilvántartásba vétel a III. melléklet 1. pontjához
-- X.    nagyméretű uniós IT-rendszerek
-- XIII. rendszerszintű kockázat kritériumai
-- XIV.  az (EU) 2026/1744 rendelettel bevezetett új melléklet
--
-- 1/3. rész – sorrendben futtatandó. Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

delete from aic_legal_text t using aic_legal_sources s
where s.id = t.source_id and s.celex_number = '02024R1689-20260727'
  and t.article_number in ('Annex II','Annex VI','Annex VII','Annex IX','Annex X','Annex XIII','Annex XIV');

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex II',null,'article','II. MELLÉKLET

Az 5. cikk (1) bekezdése első albekezdése h) pontjának iii. alpontjában említett bűncselekmények jegyzéke

Az 5. cikk (1) bekezdése első albekezdése h) pontjának iii. alpontjában említett bűncselekmények:

— 
terrorizmus,
— 
emberkereskedelem,
— 
gyermekek szexuális kizsákmányolása és gyermekpornográfia,
— 
kábítószerek vagy pszichotrop anyagok tiltott kereskedelme,
— 
fegyverek, lőszerek és robbanóanyagok tiltott kereskedelme,
— 
szándékos emberölés, súlyos testi sértés,
— 
emberi szervek vagy szövetek tiltott kereskedelme,
— 
nukleáris és radioaktív anyagok tiltott kereskedelme,
— 
emberrablás, személyi szabadságtól való jogellenes megfosztás és túszejtés,
— 
a Nemzetközi Büntetőbíróság joghatósága alá tartozó bűncselekmények,
— 
repülőgép vagy hajó hatalomba kerítése,
— 
szexuális kényszerítés,
— 
környezettel kapcsolatos bűncselekmények,
— 
szervezett vagy fegyveres rablás,
— 
szabotázs,
— 
a fent felsoroltak közül egy vagy több bűncselekményben érintett bűnszervezetben való részvétel.','bd7e481710b573cd3973e8e14cc64a82f1269c9fa2cb124b984c00221f733bf8','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_II','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VI',null,'article','VI. MELLÉKLET

Belső ellenőrzésen alapuló megfelelőségértékelési eljárás

1. A belső ellenőrzésen alapuló megfelelőségértékelési eljárás a 2., a 3. és a 4. ponton alapuló megfelelőségértékelési eljárás.

2. A szolgáltató ellenőrzi, hogy a létrehozott minőségirányítási rendszer megfelel-e a 17. cikkben foglalt követelményeknek.

3. A szolgáltató megvizsgálja a műszaki dokumentációban szereplő információkat annak értékelése érdekében, hogy az MI-rendszer megfelel-e a releváns, a III. fejezet 2. szakaszában foglalt alapvető követelményeknek.

4. A szolgáltató azt is ellenőrzi, hogy az MI-rendszer tervezésének és fejlesztésének folyamata, valamint a 72. cikkben említett, forgalomba hozatal utáni nyomon követése összhangban van-e a műszaki dokumentációval.','d6c15f58f1278b434edccaea1683c274594890e6e78bfdfd83252ffc0339901a','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VI','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VI','1','paragraph','A belső ellenőrzésen alapuló megfelelőségértékelési eljárás a 2., a 3. és a 4. ponton alapuló megfelelőségértékelési eljárás.','3fbb129b5f42d19bf0ed35a2d5901655d0061a222f13ee55c65c500b9621077e','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VI','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VI','2','paragraph','A szolgáltató ellenőrzi, hogy a létrehozott minőségirányítási rendszer megfelel-e a 17. cikkben foglalt követelményeknek.','419cbc62a3ff76d2332bbcfe824f534fb32c87a1fb74e5245ffb45981624f52e','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VI','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VI','3','paragraph','A szolgáltató megvizsgálja a műszaki dokumentációban szereplő információkat annak értékelése érdekében, hogy az MI-rendszer megfelel-e a releváns, a III. fejezet 2. szakaszában foglalt alapvető követelményeknek.','2695541b8af4705ecf995d065f3b64f657cd91b8163723232585fef8b0fa8456','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VI','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VI','4','paragraph','A szolgáltató azt is ellenőrzi, hogy az MI-rendszer tervezésének és fejlesztésének folyamata, valamint a 72. cikkben említett, forgalomba hozatal utáni nyomon követése összhangban van-e a műszaki dokumentációval.','f77d4723176988a2070adcb4f315ce3b6a5936bc899ead02e06153ff60b6f134','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VI','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII',null,'article','VII. MELLÉKLET

A minőségirányítási rendszer értékelésén és a műszaki dokumentáció értékelésén alapuló megfelelőség

1.   Bevezetés

A minőségirányítási rendszer értékelésén és a műszaki dokumentáció értékelésén alapuló megfelelőség a 2–5. ponton alapuló megfelelőségértékelési eljárás.

2.   Áttekintés

Az MI-rendszerek megtervezésére, fejlesztésére és tesztelésére szolgáló, a 17. cikk szerinti jóváhagyott minőségirányítási rendszert a 3. ponttal összhangban meg kell vizsgálni, és annak az 5. pontban meghatározott felügyelet tárgyát kell képeznie. Az MI-rendszer műszaki dokumentációját a 4. ponttal összhangban meg kell vizsgálni.

3.   Minőségirányítási rendszer

3.1. A szolgáltató kérelmének a következőket kell tartalmaznia:

a) 

a szolgáltató neve és címe, és amennyiben a kérelmet a meghatalmazott képviselő nyújtja be, a meghatalmazott képviselő neve és címe;

b) 

az ugyanazon minőségirányítási rendszer hatálya alá tartozó MI-rendszerek jegyzéke;

c) 

az ugyanazon minőségirányítási rendszer hatálya alá tartozó minden egyes MI-rendszer műszaki dokumentációja;

d) 

a minőségirányítási rendszerre vonatkozó dokumentáció, amelynek a 17. cikkben felsorolt valamennyi szempontra ki kell terjednie;

e) 

az olyan eljárások leírása, amelyek biztosítják, hogy a minőségirányítási rendszer megfelelő és hatékony maradjon;

f) 

írásos nyilatkozat arról, hogy a szolgáltató ugyanazt a kérelmet más bejelentett szervezethez nem nyújtotta be.

3.2. A bejelentett szervezetnek értékelnie kell a minőségirányítási rendszert, és meg kell állapítania, hogy az megfelel-e a 17. cikkben meghatározott követelményeknek.

A határozatról értesíteni kell a szolgáltatót vagy annak meghatalmazott képviselőjét.

Az értesítésnek tartalmaznia kell a minőségirányítási rendszer értékelése alapján levont következtetéseket és az indokolással ellátott értékelési határozatot.

3.3. A jóváhagyott minőségirányítási rendszert a szolgáltatónak továbbra is alkalmaznia kell és karban kell tartania annak érdekében, hogy az megfelelő és hatékony maradjon.

3.4. A szolgáltatónak fel kell hívnia a bejelentett szervezet figyelmét a jóváhagyott minőségirányítási rendszer vagy az ilyen rendszer hatálya alá tartozó MI-rendszerek jegyzékének bármely tervezett módosítására.

A bejelentett szervezetnek meg kell vizsgálnia a javasolt módosításokat, majd el kell döntenie, hogy a módosított minőségirányítási rendszer a továbbiakban is megfelel-e a 3.2. pontban említett követelményeknek vagy újabb értékelésre van szükség.

A bejelentett szervezetnek értesítenie kell a szolgáltatót a határozatáról. Az értesítésnek tartalmaznia kell a változtatások értékelése alapján levont következtetéseket és az indokolással ellátott értékelési határozatot.

4.   A műszaki dokumentáció ellenőrzése.

4.1. A 3. pontban említett kérelem mellett a szolgáltatónak kérelmet kell benyújtania az általa választott bejelentett szervezethez a szolgáltató által forgalomba hozni vagy üzembe helyezni kívánt, a 3. pontban említett minőségirányítási rendszer hatálya alá tartozó MI-rendszerrel kapcsolatos műszaki dokumentáció értékelése céljából.

4.2. A kérelemnek a következőket kell tartalmaznia:

a) 

a szolgáltató neve és címe;

b) 

írásos nyilatkozat arról, hogy a szolgáltató ugyanazt a kérelmet más bejelentett szervezethez nem nyújtotta be;

c) 

a IV. mellékletben említett műszaki dokumentáció.

4.3. A bejelentett szervezetnek meg kell vizsgálnia a műszaki dokumentációt. Adott esetben és a feladatainak ellátásához szükséges mértékre korlátozva, a bejelentett szervezet számára többek között – adott esetben és biztonsági garanciák mellett – API-kon vagy távoli hozzáférést lehetővé tevő egyéb releváns műszaki megoldásokon és eszközökön keresztül teljes körű hozzáférést kell biztosítani az alkalmazott tanító-, validálási és tesztelő adatkészletekhez.

4.4. A műszaki dokumentáció vizsgálata során a bejelentett szervezet előírhatja, hogy a szolgáltató nyújtson be további bizonyítékokat, vagy végezzen további vizsgálatokat annak érdekében, hogy lehetővé tegye annak megfelelő értékelését, hogy az MI-rendszer megfelel-e a III. fejezet 2. szakaszában meghatározott követelményeknek. Amennyiben a bejelentett szervezet nem elégedett a szolgáltató által elvégzett vizsgálatokkal, a bejelentett szervezetnek adott esetben közvetlenül saját magának kell elvégeznie a megfelelő vizsgálatokat.

4.5. Amennyiben ez szükséges annak értékeléséhez, hogy a nagy kockázatú MI-rendszer megfelel-e a III. fejezet 2. szakaszában meghatározott követelményeknek, miután a megfelelőség ellenőrzésére szolgáló minden egyéb észszerű megoldást kimerítettek, és azok elégtelennek bizonyultak, továbbá indokolással ellátott kérésre a bejelentett szervezet számára hozzáférést kell biztosítani az MI-rendszer tanító- és tanított modelljeihez, ideértve annak releváns paramétereit is. Az ilyen hozzáférésre a szellemi tulajdon és az üzleti titkok védelmére vonatkozó meglévő uniós jog alkalmazandó.

4.6. A bejelentett szervezet határozatáról értesíteni kell a szolgáltatót vagy annak meghatalmazott képviselőjét. Az értesítésnek tartalmaznia kell a műszaki dokumentáció értékelése alapján levont következtetéseket és az indokolással ellátott értékelési határozatot.

Amennyiben az MI-rendszer megfelel a III. fejezet 2. szakaszában foglalt követelményeknek, a bejelentett szervezetnek ki kell állítania a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítványt. A tanúsítványnak tartalmaznia kell a szolgáltató nevét és címét, a vizsgálat következtetéseit, a tanúsítvány érvényességének (esetleges) feltételeit és az MI-rendszer azonosításához szükséges adatokat.

A tanúsítványnak és mellékleteinek tartalmazniuk kell minden olyan lényeges információt, amely lehetővé teszi az MI-rendszer megfelelőségének értékelését, és adott esetben lehetővé teszi az MI-rendszer használat közbeni ellenőrzését.

Amennyiben az MI-rendszer nem felel meg a III. fejezet 2. szakaszában foglalt követelményeknek, a bejelentett szervezetnek meg kell tagadnia a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány kiállítását, és az elutasítás részletes indokolásával együtt tájékoztatnia kell erről a kérelmezőt.

Amennyiben az MI-rendszer nem felel meg a tanításhoz használt adatokra vonatkozó követelménynek, az új megfelelőségértékelés iránti kérelem benyújtása előtt újra kell tanítani az MI-rendszert. Ebben az esetben a bejelentett szervezet által hozott, a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány kiállítását elutasító, indokolással ellátott értékelési határozatnak konkrét megfontolásokat kell tartalmaznia az MI-rendszer tanításához használt minőségi adatokra, különösen a meg nem felelés okaira vonatkozóan.

4.7. A műszaki dokumentáció értékelésére vonatkozó uniós tanúsítványt kiállító bejelentett szervezet értékelése szükséges az MI-rendszer minden olyan módosításához, amely érintheti az MI-rendszer követelményeknek való megfelelését vagy rendeltetését. A szolgáltatónak tájékoztatnia kell a bejelentett szervezetet azon szándékáról, hogy be kívánja vezetni a fent említett változtatások bármelyikét, vagy arról, ha egyébként tudomást szerez ilyen változtatások bekövetkezéséről. A bejelentett szervezetnek értékelnie kell a tervezett változtatásokat, és döntenie kell arról, hogy a 43. cikk (4) bekezdésének megfelelően szükség van-e új megfelelőségértékelésre, vagy elegendő a jóváhagyást a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány kiegészítésével megadni. Utóbbi esetben a bejelentett szervezetnek értékelnie kell a változtatásokat, határozatáról értesítenie kell a szolgáltatót, és amennyiben a változtatásokat jóváhagyja, ki kell állítania a szolgáltató számára a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány kiegészítését.

5.   A jóváhagyott minőségirányítási rendszer felügyelete.

5.1. A 3. pontban említett bejelentett szervezet által gyakorolt felügyelet célja annak biztosítása, hogy a szolgáltató megfelelően megfeleljen a jóváhagyott minőségirányítási rendszer feltételeinek.

5.2. Értékelés céljából a szolgáltatónak hozzáférést kell biztosítania a bejelentett szervezet számára az MI-rendszerek tervezésének, fejlesztésének és tesztelésének helyszínéhez. A szolgáltatónak továbbá minden szükséges információt meg kell osztania a bejelentett szervezettel.

5.3. A bejelentett szervezetnek időszakos ellenőrzéseket kell végeznie, hogy megbizonyosodjon arról, hogy a szolgáltató fenntartja és alkalmazza-e a minőségirányítási rendszert, továbbá erről ellenőrzési jelentést kell készítenie a szolgáltatónak. Az ilyen ellenőrzések keretében a bejelentett szervezet további vizsgálatokat végezhet azokkal az MI-rendszerekkel kapcsolatban, amelyek tekintetében a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány kiállítására került sor.','6bac19da83ecb90b285b39771ac693b1551544d857ae3be467fb014aeb4c2c82','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','1','paragraph','Bevezetés A minőségirányítási rendszer értékelésén és a műszaki dokumentáció értékelésén alapuló megfelelőség a 2–5. ponton alapuló megfelelőségértékelési eljárás.','f0dd1a9fb59b0c252c0425c26d2f46b1f1aa91233aa570a02d45ce95c1e32e77','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','2','paragraph','Áttekintés Az MI-rendszerek megtervezésére, fejlesztésére és tesztelésére szolgáló, a 17. cikk szerinti jóváhagyott minőségirányítási rendszert a 3. ponttal összhangban meg kell vizsgálni, és annak az 5. pontban meghatározott felügyelet tárgyát kell képeznie. Az MI-rendszer műszaki dokumentációját a 4. ponttal összhangban meg kell vizsgálni.','89f130b3ed878d169a2e320e98132e4a660ead0022e919157b523762fa35c208','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','3','paragraph','Minőségirányítási rendszer','f9300255412a53f5209cbb8660be0277a9e565ff69805a2841dcfcec872fc91d','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','3.1','paragraph','A szolgáltató kérelmének a következőket kell tartalmaznia:','b228c76b425eaf38fd60663a23badddaebe865f368fc3eff43d2f282549daa1b','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','a','paragraph','a szolgáltató neve és címe, és amennyiben a kérelmet a meghatalmazott képviselő nyújtja be, a meghatalmazott képviselő neve és címe;','d2d59b9a4db26e030507b316a446ad1794c67eee9ccd044d3faf359b44ef1bd7','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','b','paragraph','az ugyanazon minőségirányítási rendszer hatálya alá tartozó MI-rendszerek jegyzéke;','2304597a1d8de5dc4debb87a42b0ddfe59893337b04bb860b7ed4acfb8f26eb0','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','c','paragraph','az ugyanazon minőségirányítási rendszer hatálya alá tartozó minden egyes MI-rendszer műszaki dokumentációja;','00eb43db698806572d45f78d9ea003c69e4ac948fd8a2e7905b30b07f8709af3','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','d','paragraph','a minőségirányítási rendszerre vonatkozó dokumentáció, amelynek a 17. cikkben felsorolt valamennyi szempontra ki kell terjednie;','569cd20e6520ad4c6e5cb08c1bafb2fe3b3cc5e1703b0bca3584fd7ff9c73ea7','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','e','paragraph','az olyan eljárások leírása, amelyek biztosítják, hogy a minőségirányítási rendszer megfelelő és hatékony maradjon;','fe7e13459bf47282f3105cb841fb87c40175982934e2393f633c38890289cae7','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','f','paragraph','írásos nyilatkozat arról, hogy a szolgáltató ugyanazt a kérelmet más bejelentett szervezethez nem nyújtotta be.','289da70c28678c8351cf93e0e79e26b0fc61e54bb8276c435e3a244c43f7247b','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','3.2','paragraph','A bejelentett szervezetnek értékelnie kell a minőségirányítási rendszert, és meg kell állapítania, hogy az megfelel-e a 17. cikkben meghatározott követelményeknek. A határozatról értesíteni kell a szolgáltatót vagy annak meghatalmazott képviselőjét. Az értesítésnek tartalmaznia kell a minőségirányítási rendszer értékelése alapján levont következtetéseket és az indokolással ellátott értékelési határozatot.','b97fd501943bb9c85d40f34e383d4019fb2d00a566aa83cfbc1f7da608686e0d','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','3.3','paragraph','A jóváhagyott minőségirányítási rendszert a szolgáltatónak továbbra is alkalmaznia kell és karban kell tartania annak érdekében, hogy az megfelelő és hatékony maradjon.','c39fc6af276c6d7cb543d9c5dfe2edd1c3e6998372d902e5f29804f0d7e7f511','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','3.4','paragraph','A szolgáltatónak fel kell hívnia a bejelentett szervezet figyelmét a jóváhagyott minőségirányítási rendszer vagy az ilyen rendszer hatálya alá tartozó MI-rendszerek jegyzékének bármely tervezett módosítására. A bejelentett szervezetnek meg kell vizsgálnia a javasolt módosításokat, majd el kell döntenie, hogy a módosított minőségirányítási rendszer a továbbiakban is megfelel-e a 3.2. pontban említett követelményeknek vagy újabb értékelésre van szükség. A bejelentett szervezetnek értesítenie kell a szolgáltatót a határozatáról. Az értesítésnek tartalmaznia kell a változtatások értékelése alapján levont következtetéseket és az indokolással ellátott értékelési határozatot.','aea7379e280201605ae827b4f766b9af80e1755616889aa81d229193d37c4597','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','4','paragraph','A műszaki dokumentáció ellenőrzése.','797158236e08c381ea00aacdb5750c5c91f0e401964042e30aa79f7d87bd3eed','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','4.1','paragraph','A 3. pontban említett kérelem mellett a szolgáltatónak kérelmet kell benyújtania az általa választott bejelentett szervezethez a szolgáltató által forgalomba hozni vagy üzembe helyezni kívánt, a 3. pontban említett minőségirányítási rendszer hatálya alá tartozó MI-rendszerrel kapcsolatos műszaki dokumentáció értékelése céljából.','b1d021bad5b10e5775c18bcb2a2cbd1884f27ff646d811adc4e290064bf3ad59','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','4.2','paragraph','A kérelemnek a következőket kell tartalmaznia:','f0ab2f80a2d98d651c197174176814468304449d1fa7268f1de7e74745d7e9a4','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','4.3','paragraph','A bejelentett szervezetnek meg kell vizsgálnia a műszaki dokumentációt. Adott esetben és a feladatainak ellátásához szükséges mértékre korlátozva, a bejelentett szervezet számára többek között – adott esetben és biztonsági garanciák mellett – API-kon vagy távoli hozzáférést lehetővé tevő egyéb releváns műszaki megoldásokon és eszközökön keresztül teljes körű hozzáférést kell biztosítani az alkalmazott tanító-, validálási és tesztelő adatkészletekhez.','92e97f99e68b5aa9580d7060bcd0b5edac4716be3e580df0b0708fd5896cd74c','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','4.4','paragraph','A műszaki dokumentáció vizsgálata során a bejelentett szervezet előírhatja, hogy a szolgáltató nyújtson be további bizonyítékokat, vagy végezzen további vizsgálatokat annak érdekében, hogy lehetővé tegye annak megfelelő értékelését, hogy az MI-rendszer megfelel-e a III. fejezet 2. szakaszában meghatározott követelményeknek. Amennyiben a bejelentett szervezet nem elégedett a szolgáltató által elvégzett vizsgálatokkal, a bejelentett szervezetnek adott esetben közvetlenül saját magának kell elvégeznie a megfelelő vizsgálatokat.','f9d27b6c58bf9d11535bc9f73a83c2b02cfe8156b301711da1d90d73ee4664a5','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','4.5','paragraph','Amennyiben ez szükséges annak értékeléséhez, hogy a nagy kockázatú MI-rendszer megfelel-e a III. fejezet 2. szakaszában meghatározott követelményeknek, miután a megfelelőség ellenőrzésére szolgáló minden egyéb észszerű megoldást kimerítettek, és azok elégtelennek bizonyultak, továbbá indokolással ellátott kérésre a bejelentett szervezet számára hozzáférést kell biztosítani az MI-rendszer tanító- és tanított modelljeihez, ideértve annak releváns paramétereit is. Az ilyen hozzáférésre a szellemi tulajdon és az üzleti titkok védelmére vonatkozó meglévő uniós jog alkalmazandó.','562fca5604588a3e54a471ccde578fa67c210407b60011c0b50690b47a744f25','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','4.6','paragraph','A bejelentett szervezet határozatáról értesíteni kell a szolgáltatót vagy annak meghatalmazott képviselőjét. Az értesítésnek tartalmaznia kell a műszaki dokumentáció értékelése alapján levont következtetéseket és az indokolással ellátott értékelési határozatot. Amennyiben az MI-rendszer megfelel a III. fejezet 2. szakaszában foglalt követelményeknek, a bejelentett szervezetnek ki kell állítania a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítványt. A tanúsítványnak tartalmaznia kell a szolgáltató nevét és címét, a vizsgálat következtetéseit, a tanúsítvány érvényességének (esetleges) feltételeit és az MI-rendszer azonosításához szükséges adatokat. A tanúsítványnak és mellékleteinek tartalmazniuk kell minden olyan lényeges információt, amely lehetővé teszi az MI-rendszer megfelelőségének értékelését, és adott esetben lehetővé teszi az MI-rendszer használat közbeni ellenőrzését. Amennyiben az MI-rendszer nem felel meg a III. fejezet 2. szakaszában foglalt követelményeknek, a bejelentett szervezetnek meg kell tagadnia a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány kiállítását, és az elutasítás részletes indokolásával együtt tájékoztatnia kell erről a kérelmezőt. Amennyiben az MI-rendszer nem felel meg a tanításhoz használt adatokra vonatkozó követelménynek, az új megfelelőségértékelés iránti kérelem benyújtása előtt újra kell tanítani az MI-rendszert. Ebben az esetben a bejelentett szervezet által hozott, a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány kiállítását elutasító, indokolással ellátott értékelési határozatnak konkrét megfontolásokat kell tartalmaznia az MI-rendszer tanításához használt minőségi adatokra, különösen a meg nem felelés okaira vonatkozóan.','a4a1cd5203cb247ba2532751bdc36a5e6028ecaaa49e403f0ab2f7579d1e4f7c','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','4.7','paragraph','A műszaki dokumentáció értékelésére vonatkozó uniós tanúsítványt kiállító bejelentett szervezet értékelése szükséges az MI-rendszer minden olyan módosításához, amely érintheti az MI-rendszer követelményeknek való megfelelését vagy rendeltetését. A szolgáltatónak tájékoztatnia kell a bejelentett szervezetet azon szándékáról, hogy be kívánja vezetni a fent említett változtatások bármelyikét, vagy arról, ha egyébként tudomást szerez ilyen változtatások bekövetkezéséről. A bejelentett szervezetnek értékelnie kell a tervezett változtatásokat, és döntenie kell arról, hogy a 43. cikk (4) bekezdésének megfelelően szükség van-e új megfelelőségértékelésre, vagy elegendő a jóváhagyást a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány kiegészítésével megadni. Utóbbi esetben a bejelentett szervezetnek értékelnie kell a változtatásokat, határozatáról értesítenie kell a szolgáltatót, és amennyiben a változtatásokat jóváhagyja, ki kell állítania a szolgáltató számára a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány kiegészítését.','047f66e37bfa0a121e49fdf81556e5868b22f01f7bc4061227f1dc9c778dc86c','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','5','paragraph','A jóváhagyott minőségirányítási rendszer felügyelete.','5588491bda3fd93fb514353570ed6252deb552611e8cb5062caa47ccfd4c9077','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','5.1','paragraph','A 3. pontban említett bejelentett szervezet által gyakorolt felügyelet célja annak biztosítása, hogy a szolgáltató megfelelően megfeleljen a jóváhagyott minőségirányítási rendszer feltételeinek.','d3929764c0bab7505988eae54e55f0b97cb49633d615a4e5399df4b06e00ad67','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','5.2','paragraph','Értékelés céljából a szolgáltatónak hozzáférést kell biztosítania a bejelentett szervezet számára az MI-rendszerek tervezésének, fejlesztésének és tesztelésének helyszínéhez. A szolgáltatónak továbbá minden szükséges információt meg kell osztania a bejelentett szervezettel.','ab35d2291d9308e07d7b79abd8380cd8279cece3b187adcd8df2a963f0d673c6','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex VII','5.3','paragraph','A bejelentett szervezetnek időszakos ellenőrzéseket kell végeznie, hogy megbizonyosodjon arról, hogy a szolgáltató fenntartja és alkalmazza-e a minőségirányítási rendszert, továbbá erről ellenőrzési jelentést kell készítenie a szolgáltatónak. Az ilyen ellenőrzések keretében a bejelentett szervezet további vizsgálatokat végezhet azokkal az MI-rendszerekkel kapcsolatban, amelyek tekintetében a műszaki dokumentáció értékelésére vonatkozó uniós tanúsítvány kiállítására került sor.','20b87a4c156c6bce930fe5f41ca3e9b49a67e76c0eb7acebc3664ef262a751cb','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_VII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex IX',null,'article','IX. MELLÉKLET

A III. mellékletben felsorolt nagy kockázatú MI-rendszerek nyilvántartásba vételekor benyújtandó, a 60. cikk szerinti, valós körülmények közötti teszteléssel kapcsolatos információk

A 60. cikkel összhangban nyilvántartásba veendő, valós körülmények közötti tesztelés tekintetében a következő információkat kell megadni, és ezt követően naprakészen tartani:

1. 

A valós körülmények közötti tesztelés Unió-szerte egységes, egyedi azonosító száma;

2. 

A valós körülmények közötti tesztelésben részt vevő szolgáltató vagy leendő szolgáltató és alkalmazók neve és elérhetőségei;

3. 

Az MI-rendszer rövid leírása, rendeltetése és a rendszer azonosításához szükséges egyéb információk;

4. 

A valós körülmények közötti tesztelésre vonatkozó terv főbb jellemzőinek összefoglalása;

5. 

A valós körülmények közötti tesztelés felfüggesztésére vagy megszüntetésére vonatkozó információk.','a433de434f8364bbd6608ef2f33400b458efccaefbb4caca7d71ed4c07e8a73b','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_IX','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex IX','1','paragraph','A valós körülmények közötti tesztelés Unió-szerte egységes, egyedi azonosító száma;','8f6d17adc23c66d7607d5456eef1d9a49ba6b701a920cb893d08df505306b739','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_IX','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex IX','2','paragraph','A valós körülmények közötti tesztelésben részt vevő szolgáltató vagy leendő szolgáltató és alkalmazók neve és elérhetőségei;','0e2dc84dd935bd5f076c4e1186bfd70f9020597e70a6682bbf672b45c1fd8e67','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_IX','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex IX','3','paragraph','Az MI-rendszer rövid leírása, rendeltetése és a rendszer azonosításához szükséges egyéb információk;','d4848c33c3900ddf2f3ff3cf9644f868e38a4c5ab872fd25c59278c7b0fc5ffc','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_IX','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex IX','4','paragraph','A valós körülmények közötti tesztelésre vonatkozó terv főbb jellemzőinek összefoglalása;','3631f959fa391a97f562061036e028ff2174596d82b21ca00a1e62d57cd23cce','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_IX','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex IX','5','paragraph','A valós körülmények közötti tesztelés felfüggesztésére vagy megszüntetésére vonatkozó információk.','2429077e8387154ca0633ccaada5ecf32f584c633c0f3582accc43c5085f6bd4','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_IX','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex X',null,'article','X. MELLÉKLET

A szabadságon, a biztonságon és a jog érvényesülésén alapuló térségben a nagy méretű IT-rendszerekre vonatkozó uniós jogalkotási aktusok

commit;
