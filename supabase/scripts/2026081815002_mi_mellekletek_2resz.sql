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
-- 2/3. rész – sorrendben futtatandó. Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

1.   Schengeni Információs Rendszer

a) 

Az Európai Parlament és a Tanács (EU) 2018/1860 rendelete (2018. november 28.) a Schengeni Információs Rendszernek a jogellenesen tartózkodó harmadik országbeli állampolgárok visszaküldése céljából történő használatáról (HL L 312., 2018.12.7., 1. o.).

b) 

Az Európai Parlament és a Tanács (EU) 2018/1861 rendelete (2018. november 28.) a határforgalom-ellenőrzés terén a Schengeni Információs Rendszer (SIS) létrehozásáról, működéséről és használatáról, a Schengeni Megállapodás végrehajtásáról szóló egyezmény módosításáról, valamint az 1987/2006/EK rendelet módosításáról és hatályon kívül helyezéséről (HL L 312., 2018.12.7., 14. o.).

c) 

Az Európai Parlament és a Tanács (EU) 2018/1862 rendelete (2018. november 28.) a rendőrségi együttműködés és a büntetőügyekben folytatott igazságügyi együttműködés terén a Schengeni Információs Rendszer (SIS) létrehozásáról, működéséről és használatáról, a 2007/533/IB tanácsi határozat módosításáról és hatályon kívül helyezéséről, valamint az 1986/2006/EK európai parlamenti és tanácsi rendelet és a 2010/261/EU bizottsági határozat hatályon kívül helyezéséről (HL L 312., 2018.12.7., 56. o.).

2.   Vízuminformációs Rendszer

a) 

Az Európai Parlament és a Tanács (EU) 2021/1133 rendelete (2021. július 7.) a 603/2013/EU, az (EU) 2016/794, az (EU) 2018/1862, az (EU) 2019/816 és az (EU) 2019/818 rendeletnek az egyéb uniós információs rendszerekhez a Vízuminformációs Rendszer céljából való hozzáférésre vonatkozó feltételek megállapítása tekintetében történő módosításáról (HL L 248., 2021.7.13., 1. o.).

b) 

Az Európai Parlament és a Tanács (EU) 2021/1134 rendelete (2021. július 7.) a Vízuminformációs Rendszer megreformálásának céljából a 767/2008/EK, a 810/2009/EK, az (EU) 2016/399, az (EU) 2017/2226, az (EU) 2018/1240, az (EU) 2018/1860, az (EU) 2018/1861, az (EU) 2019/817 és az (EU) 2019/1896 európai parlamenti és tanácsi rendelet módosításáról, valamint a 2004/512/EK és a 2008/633/IB tanácsi határozat hatályon kívül helyezéséről (HL L 248., 2021.7.13., 11. o.).

3.   Eurodac

Az Európai Parlament és a Tanács 2024. május 14-i (EU) 2024/1358 rendelete az (EU) 2024/1315 és az (EU) 2024/1350 európai parlamenti és tanácsi rendelet, valamint a 2001/55/EK tanácsi irányelv hatékony alkalmazása érdekében a biometrikus adatok összehasonlítását, és valamely jogellenesen tartózkodó harmadik országbeli állampolgár vagy hontalan személy azonosítását szolgáló Eurodac létrehozásáról, valamint a tagállamok bűnüldöző hatóságai és az Europol által az Eurodac-adatokkal való, bűnüldözési célú összehasonlítások kérelmezéséről, az (EU) 2018/1240 és az (EU) 2019/818 európai parlamenti és tanácsi rendelet módosításáról és az (EU) 603/2013 európai parlamenti és tanácsi rendelet hatályon kívül helyezéséről (HL L, 2024/1358, 2024.5.22., ELI: http://data.europa.eu/eli/reg/2024/1358/oj).

4.   Határregisztrációs rendszer

Az Európai Parlament és a Tanács (EU) 2017/2226 rendelete (2017. november 30.) a tagállamok külső határait átlépő harmadik országbeli állampolgárok belépésére és kilépésére, valamint beléptetésének megtagadására vonatkozó adatok rögzítésére szolgáló határregisztrációs rendszer (EES) létrehozásáról és az EES-hez való bűnüldözési célú hozzáférés feltételeinek meghatározásáról, valamint a Schengeni Megállapodás végrehajtásáról szóló egyezmény, a 767/2008/EK rendelet és az 1077/2011/EU rendelet módosításáról (HL L 327., 2017.12.9., 20. o.).

5.   Európai Utasinformációs és Engedélyezési Rendszer

a) 

Az Európai Parlament és a Tanács (EU) 2018/1240 rendelete (2018. szeptember 12.) az Európai Utasinformációs és Engedélyezési Rendszer (ETIAS) létrehozásáról, valamint az 1077/2011/EU rendelet, az 515/2014/EU rendelet, az (EU) 2016/399 rendelet, az (EU) 2016/1624 rendelet és az (EU) 2017/2226 rendelet módosításáról (HL L 236., 2018.9.19., 1. o.).

b) 

Az Európai Parlament és a Tanács (EU) 2018/1241 rendelete (2018. szeptember 12.) az (EU) 2016/794 rendeletnek az Európai Utasinformációs és Engedélyezési Rendszer (ETIAS) létrehozása céljából történő módosításáról (HL L 236., 2018.9.19., 72. o.).

6.   A harmadik országbeli állampolgárokra és hontalan személyekre vonatkozó Európai Bűnügyi Nyilvántartási Információs Rendszer

Az Európai Parlament és a Tanács (EU) 2019/816 rendelete (2019. április 17.) az Európai Bűnügyi Nyilvántartási Információs Rendszer kiegészítése érdekében a harmadik országbeli állampolgárokkal és a hontalan személyekkel szemben hozott ítéletekre vonatkozó információval rendelkező tagállamok azonosítására szolgáló központosított rendszer (ECRIS-TCN) létrehozásáról, valamint az (EU) 2018/1726 rendelet módosításáról (HL L 135., 2019.5.22., 1. o.).

7.   Interoperabilitás

a) 

Az Európai Parlament és a Tanács (EU) 2019/817 rendelete (2019. május 20.) az uniós információs rendszerek közötti interoperabilitás kereteinek megállapításáról a határok és a vízumügy területén, továbbá a 767/2008/EK, az (EU) 2016/399, az (EU) 2017/2226, az (EU) 2018/1240, az (EU) 2018/1726 és az (EU) 2018/1861 európai parlamenti és tanácsi rendelet, valamint a 2004/512/EK és a 2008/633/IB tanácsi határozat módosításáról (HL L 135., 2019.5.22., 27. o.).

b) 

Az Európai Parlament és a Tanács (EU) 2019/818 rendelete (2019. május 20.) az uniós információs rendszerek közötti interoperabilitás kereteinek megállapításáról a rendőrségi és igazságügyi együttműködés, a menekültügy és a migráció területén, valamint az (EU) 2018/1726, az (EU) 2018/1862 és az (EU) 2019/816 rendelet módosításáról (HL L 135., 2019.5.22., 85. o.).','a5cd72ed9fefcef9bfc59d8299d056e561fa7810c394ae40946870d9e0db974f','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_X','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex X','1','paragraph','Schengeni Információs Rendszer','e45538dc895a2f11018004d73ecbc0f58c94acd2e8cd3b46d40a27de2f633b02','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_X','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex X','a','paragraph','Az Európai Parlament és a Tanács (EU) 2018/1860 rendelete (2018. november 28.) a Schengeni Információs Rendszernek a jogellenesen tartózkodó harmadik országbeli állampolgárok visszaküldése céljából történő használatáról (HL L 312., 2018.12.7., 1. o.).','bc02ca0638dbfe3f989b8130de0cbadb76d0af1cca1ba50e472f32a782d65b8c','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_X','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex X','b','paragraph','Az Európai Parlament és a Tanács (EU) 2018/1861 rendelete (2018. november 28.) a határforgalom-ellenőrzés terén a Schengeni Információs Rendszer (SIS) létrehozásáról, működéséről és használatáról, a Schengeni Megállapodás végrehajtásáról szóló egyezmény módosításáról, valamint az 1987/2006/EK rendelet módosításáról és hatályon kívül helyezéséről (HL L 312., 2018.12.7., 14. o.).','b2006809c91d8291e8957f5a8e4cd389b283eb895491d5732d3d80e91cf39a36','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_X','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex X','c','paragraph','Az Európai Parlament és a Tanács (EU) 2018/1862 rendelete (2018. november 28.) a rendőrségi együttműködés és a büntetőügyekben folytatott igazságügyi együttműködés terén a Schengeni Információs Rendszer (SIS) létrehozásáról, működéséről és használatáról, a 2007/533/IB tanácsi határozat módosításáról és hatályon kívül helyezéséről, valamint az 1986/2006/EK európai parlamenti és tanácsi rendelet és a 2010/261/EU bizottsági határozat hatályon kívül helyezéséről (HL L 312., 2018.12.7., 56. o.).','15243c4b8c44712b3bf377f913f5be7d1f5b42b3af4ed3e1770fa1b35b3b35e6','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_X','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex X','2','paragraph','Vízuminformációs Rendszer','3349b3db6a8be19fca52ba3bb7c81ef0a0e41ac320914c8bf9fd11fd8ea3e381','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_X','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex X','3','paragraph','Eurodac Az Európai Parlament és a Tanács 2024. május 14-i (EU) 2024/1358 rendelete az (EU) 2024/1315 és az (EU) 2024/1350 európai parlamenti és tanácsi rendelet, valamint a 2001/55/EK tanácsi irányelv hatékony alkalmazása érdekében a biometrikus adatok összehasonlítását, és valamely jogellenesen tartózkodó harmadik országbeli állampolgár vagy hontalan személy azonosítását szolgáló Eurodac létrehozásáról, valamint a tagállamok bűnüldöző hatóságai és az Europol által az Eurodac-adatokkal való, bűnüldözési célú összehasonlítások kérelmezéséről, az (EU) 2018/1240 és az (EU) 2019/818 európai parlamenti és tanácsi rendelet módosításáról és az (EU) 603/2013 európai parlamenti és tanácsi rendelet hatályon kívül helyezéséről (HL L, 2024/1358, 2024.5.22., ELI: http://data.europa.eu/eli/reg/2024/1358/oj).','1335c5cde26609f4252ac4a5528a0d2fc97bd77c2fce1dd8c771c2a56b4446e3','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_X','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex X','4','paragraph','Határregisztrációs rendszer Az Európai Parlament és a Tanács (EU) 2017/2226 rendelete (2017. november 30.) a tagállamok külső határait átlépő harmadik országbeli állampolgárok belépésére és kilépésére, valamint beléptetésének megtagadására vonatkozó adatok rögzítésére szolgáló határregisztrációs rendszer (EES) létrehozásáról és az EES-hez való bűnüldözési célú hozzáférés feltételeinek meghatározásáról, valamint a Schengeni Megállapodás végrehajtásáról szóló egyezmény, a 767/2008/EK rendelet és az 1077/2011/EU rendelet módosításáról (HL L 327., 2017.12.9., 20. o.).','8fe7ab2bd6f1ada4f8f66303e99cac22dc718accb08fa1de9cbb3f912a08b64e','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_X','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex X','5','paragraph','Európai Utasinformációs és Engedélyezési Rendszer','32305c645ec5def01d66aadf86c90c5e6825318e6516eafadc7fd039b58d691c','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_X','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex X','6','paragraph','A harmadik országbeli állampolgárokra és hontalan személyekre vonatkozó Európai Bűnügyi Nyilvántartási Információs Rendszer Az Európai Parlament és a Tanács (EU) 2019/816 rendelete (2019. április 17.) az Európai Bűnügyi Nyilvántartási Információs Rendszer kiegészítése érdekében a harmadik országbeli állampolgárokkal és a hontalan személyekkel szemben hozott ítéletekre vonatkozó információval rendelkező tagállamok azonosítására szolgáló központosított rendszer (ECRIS-TCN) létrehozásáról, valamint az (EU) 2018/1726 rendelet módosításáról (HL L 135., 2019.5.22., 1. o.).','75ad3bf979747279d4f710e73a727d867e650f8a803f1290b7c487547f89f72a','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_X','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex X','7','paragraph','Interoperabilitás','cfac00c7df8075ecdcf726fa0de8d3f77630fccf66f5067ee599de0bf2c9e92c','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_X','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIII',null,'article','XIII. MELLÉKLET

Az 51. cikkben említett, rendszerszintű kockázatot jelentő általános célú MI-modellként való megjelölésre vonatkozó kritériumok

Annak megállapítása céljából, hogy egy általános célú MI-modell az 51. cikk (1) bekezdésének a) pontjában meghatározottakkal egyenértékű képességekkel vagy hatással rendelkezik-e, a Bizottságnak a következő kritériumokat kell figyelembe vennie:

a) 

a modell paramétereinek száma;

b) 

az adatkészlet minősége vagy mérete, például tokenekben mérve;

c) 

a modell tanításához használt számítások mennyisége lebegőpontos műveletekben mérve, vagy olyan egyéb változók kombinációja révén megadva, mint például a tanítás becsült költsége, a tanításhoz szükséges becsült idő vagy a tanításhoz szükséges energiafogyasztás;

d) 

a modell bemeneti és kimeneti modalitása, így például szövegből szöveg (nagy nyelvi modellek), szövegből kép, multimodalitás, és az egyes modalitások tekintetében a nagy hatású képességek meghatározására vonatkozó, a technika állásának megfelelő küszöbértékek, valamint a bemenetek és kimenetek konkrét típusa (pl. biológiai szekvenciák);

e) 

a modell képességeire vonatkozó referenciaértékek és értékelések, ideértve a további tanítás nélkül végzett feladatok számának mérlegelését, az új, eltérő feladatok tanulásához való alkalmazkodóképességet, a modell autonómiaszintjét és méretezhetőségét, a rendelkezésére álló eszközöket;

f) 

a modell az elterjedtsége miatt jelentős hatást gyakorol-e a belső piacra, ami akkor vélelmezhető, ha legalább 10 000 , az Unióban letelepedett regisztrált üzleti felhasználó rendelkezésére bocsátották;

g) 

a regisztrált végfelhasználók száma.

▼M1','acf2296b8680f7095a40362dece4090856b58701d1f7f6216049dbf1f6986787','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIII','a','paragraph','a modell paramétereinek száma;','140f5d529185cce670ae62200ab709ff727bf8c25d778493ff1f6632027ee5c0','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIII','b','paragraph','az adatkészlet minősége vagy mérete, például tokenekben mérve;','5ed1db50458b287291fae0cb0d405ede3bc6319f0b523bb5087ac6772caa7bdd','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIII','c','paragraph','a modell tanításához használt számítások mennyisége lebegőpontos műveletekben mérve, vagy olyan egyéb változók kombinációja révén megadva, mint például a tanítás becsült költsége, a tanításhoz szükséges becsült idő vagy a tanításhoz szükséges energiafogyasztás;','348a836d62665656960908fe07334d24bec70a8e7fd4c8d93b890b367422783d','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIII','d','paragraph','a modell bemeneti és kimeneti modalitása, így például szövegből szöveg (nagy nyelvi modellek), szövegből kép, multimodalitás, és az egyes modalitások tekintetében a nagy hatású képességek meghatározására vonatkozó, a technika állásának megfelelő küszöbértékek, valamint a bemenetek és kimenetek konkrét típusa (pl. biológiai szekvenciák);','930cad20bbd16e05e24ba2e13ca272fa5df26da4adb679f5e30510c2daecec41','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIII','e','paragraph','a modell képességeire vonatkozó referenciaértékek és értékelések, ideértve a további tanítás nélkül végzett feladatok számának mérlegelését, az új, eltérő feladatok tanulásához való alkalmazkodóképességet, a modell autonómiaszintjét és méretezhetőségét, a rendelkezésére álló eszközöket;','d4cfdb9126bb711b176ff4cb686562f47a29f77c104401c2d19d073ce0860ec7','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIII','f','paragraph','a modell az elterjedtsége miatt jelentős hatást gyakorol-e a belső piacra, ami akkor vélelmezhető, ha legalább 10 000 , az Unióban letelepedett regisztrált üzleti felhasználó rendelkezésére bocsátották;','ea8d1a24372e18f9f9dd55f7f12281e40fc72a9733382f13e703a9c53142fcb7','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIII','g','paragraph','a regisztrált végfelhasználók száma. ▼M1','e46053e47cd1c04440c72b38ded36690568a4fd85af1e91af8a3a328cb1ed4eb','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIII','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIV',null,'article','XIV. MELLÉKLET

Az MI-rendszerek kódjainak, kategóriáinak és vonatkozó típusainak jegyzéke a 30. cikkben említett bejelentési eljárás céljából, meghatározva a bejelentett szervezetként való kijelölés hatályát

1.    Bevezetés

A nagy kockázatú MI-rendszerek e rendelet szerinti megfelelőségértékeléséhez szükség lehet megfelelőségértékelő szervezetek bevonására. Csak az e rendelettel összhangban kijelölt megfelelőségértékelő szervezetek végezhetnek megfelelőségértékeléseket, és csak az érintett MI-rendszerek típusaival kapcsolatos tevékenységek tekintetében. Az MI-rendszerek kódjainak, kategóriáinak és megfelelő típusainak jegyzéke meghatározza a 30. cikk szerint bejelentett megfelelőségértékelő szervezetek kijelölésének hatályát.

2.    Kódok, kategóriák és a vonatkozó MI-rendszerek jegyzéke

a)    Az I. melléklet hatálya alá tartozó MI-rendszerek

MI-rendeleti kód

0102 AIP

Az I. melléklet A. szakasza 2. pontjának hatálya alá tartozó MI-rendszerek

0103 AIP

Az I. melléklet A. szakasza 3. pontjának hatálya alá tartozó MI-rendszerek

0104 AIP

Az I. melléklet A. szakasza 4. pontjának hatálya alá tartozó MI-rendszerek

0105 AIP

Az I. melléklet A. szakasza 5. pontjának hatálya alá tartozó MI-rendszerek

0106 AIP

Az I. melléklet A. szakasza 6. pontjának hatálya alá tartozó MI-rendszerek

0107 AIP

Az I. melléklet A. szakasza 7. pontjának hatálya alá tartozó MI-rendszerek

0108 AIP

Az I. melléklet A. szakasza 8. pontjának hatálya alá tartozó MI-rendszerek

0109 AIP

Az I. melléklet A. szakasza 9. pontjának hatálya alá tartozó MI-rendszerek

0110 AIP

Az I. melléklet A. szakasza 10. pontjának hatálya alá tartozó MI-rendszerek

0111 AIP

Az I. melléklet A. szakasza 11. pontjának hatálya alá tartozó MI-rendszerek

0112 AIP

Az I. melléklet A. szakasza 12. pontjának hatálya alá tartozó MI-rendszerek

b)    A III. melléklet 1. pontjának hatálya alá tartozó MI-rendszerek

MI-rendeleti kód

0201 AIB

Távoli biometrikus azonosító rendszerek

0202 AIB

Biometrikus kategorizálási MI-rendszerek

0203 AIB

Érzelemfelismerő MI-rendszerek

3.    MI-technológiaspecifikus kódok

a)    Szimbolikus MI- és szakértői rendszerek

MI-rendeleti kód

0101 AIH

Szimbolikus MI-n alapuló MI-rendszerek, szakértői és tudásalapú rendszerek, valamint keresésen és optimalizáláson alapuló MI-rendszerek

b)    Gépi tanulás, kivéve a generatív mesterséges intelligenciát és az általános célú MI-rendszereket

MI-rendeleti kód

0201 AIH

Strukturált adatokat feldolgozó MI-rendszerek

0202 AIH

Jeleket és hangadatokat feldolgozó MI-rendszerek

0203 AIH

Szöveges adatokat feldolgozó MI-rendszerek

0204 AIH

Képeket és videókat feldolgozó MI-rendszerek

0205 AIH

A környezetükből tanuló MI-rendszerek, kivéve a 0401 AIH hatálya alá tartozó MI-rendszereket

c)    Általános célú MI-modelleken vagy generatív mesterséges intelligencián alapuló MI-rendszerek

MI-rendeleti kód

0301 AIH

Generatív MI-rendszerek, beleértve az általános célú MI-modelleken alapuló MI-rendszereket is

d)    Kialakulóban lévő MI-technológiák

MI-rendeleti kód

0401 AIH

Más kódok által le nem fedett, egyéb kialakulóban lévő MI-technológiákon alapuló MI-rendszerek, beleértve az ügynökszerű mesterséges intelligenciát is

4.    A kijelölés iránti kérelem

A megfelelőségértékelő szervezetek az MI-rendszerek típusainak a 29. cikkben említett kijelölés iránti kérelemben történő meghatározásakor az MI-rendszerek kódjainak, kategóriáinak és megfelelő típusainak e mellékletben meghatározott listáit használják.

( 1 ) Az Európai Parlamenti és a Tanács 1025/2012/EU rendelete (2012. október 25.) az európai szabványosításról, a 89/686/EGK és a 93/15/EGK tanácsi irányelv, a 94/9/EK, a 94/25/EK, a 95/16/EK, a 97/23/EK, a 98/34/EK, a 2004/22/EK, a 2007/23/EK, a 2009/23/EK és a 2009/105/EK európai parlamenti és tanácsi irányelv módosításáról, valamint a 87/95/EGK tanácsi határozat és az 1673/2006/EK európai parlamenti és tanácsi határozat hatályon kívül helyezéséről (HL L 316., 2012.11.14., 12. o., ELI: http://data.europa.eu/eli/reg/2012/1025/oj).

( 1 ) Az Európai Parlament és a Tanács (EU) 2016/943 irányelve (2016. június 8.) a nem nyilvános know-how és üzleti információk (üzleti titkok) jogosulatlan megszerzésével, hasznosításával és felfedésével szembeni védelemről (HL L 157., 2016.6.15., 1. o.).

( *1 ) Az Európai Parlament és a Tanács (EU) 2024/1689 rendelete (2024. június 13.) a mesterséges intelligenciára vonatkozó harmonizált szabályok megállapításáról, valamint a 300/2008/EK, a 167/2013/EU, a 168/2013/EU, az (EU) 2018/858, az (EU) 2018/1139 és az (EU) 2019/2144 rendelet, továbbá a 2014/90/EU, az (EU) 2016/797 és az (EU) 2020/1828 irányelv módosításáról (a mesterséges intelligenciáról szóló rendelet) (HL L, 2024/1689, 2024.7.12., ELI: http://data.europa.eu/eli/reg/2024/1689/oj).”

( *2 ) Az Európai Parlament és a Tanács (EU) 2024/1689 rendelete (2024. június 13.) a mesterséges intelligenciára vonatkozó harmonizált szabályok megállapításáról, valamint a 300/2008/EK, a 167/2013/EU, a 168/2013/EU, az (EU) 2018/858, az (EU) 2018/1139 és az (EU) 2019/2144 rendelet, továbbá a 2014/90/EU, az (EU) 2016/797 és az (EU) 2020/1828 irányelv módosításáról (a mesterséges intelligenciáról szóló rendelet) (HL L, 2024/1689, 2024.7.12., ELI: http://data.europa.eu/eli/reg/2024/1689/oj).”

( *3 ) Az Európai Parlament és a Tanács (EU) 2024/1689 rendelete (2024. június 13.) a mesterséges intelligenciára vonatkozó harmonizált szabályok megállapításáról, valamint a 300/2008/EK, a 167/2013/EU, a 168/2013/EU, az (EU) 2018/858, az (EU) 2018/1139 és az (EU) 2019/2144 rendelet, továbbá a 2014/90/EU, az (EU) 2016/797 és az (EU) 2020/1828 irányelv módosításáról (a mesterséges intelligenciáról szóló rendelet) (HL L, 2024/1689, 2024.7.12., ELI: http://data.europa.eu/eli/reg/2024/1689/oj).”

( *4 ) Az Európai Parlament és a Tanács (EU) 2024/1689 rendelete (2024. június 13.) a mesterséges intelligenciára vonatkozó harmonizált szabályok megállapításáról, valamint a 300/2008/EK, a 167/2013/EU, a 168/2013/EU, az (EU) 2018/858, az (EU) 2018/1139 és az (EU) 2019/2144 rendelet, továbbá a 2014/90/EU, az (EU) 2016/797 és az (EU) 2020/1828 irányelv módosításáról (a mesterséges intelligenciáról szóló rendelet) (HL L, 2024/1689, 2024.7.12., ELI: http://data.europa.eu/eli/reg/2024/1689/oj).”

( *5 ) Az Európai Parlament és a Tanács (EU) 2024/1689 rendelete (2024. június 13.) a mesterséges intelligenciára vonatkozó harmonizált szabályok megállapításáról, valamint a 300/2008/EK, a 167/2013/EU, a 168/2013/EU, az (EU) 2018/858, az (EU) 2018/1139 és az (EU) 2019/2144 rendelet, továbbá a 2014/90/EU, az (EU) 2016/797 és az (EU) 2020/1828 irányelv módosításáról (a mesterséges intelligenciáról szóló rendelet) (HL L, 2024/1689, 2024.7.12., ELI: http://data.europa.eu/eli/reg/2024/1689/oj).”

( *6 ) Az Európai Parlament és a Tanács (EU) 2024/1689 rendelete (2024. június 13.) a mesterséges intelligenciára vonatkozó harmonizált szabályok megállapításáról, valamint a 300/2008/EK, a 167/2013/EU, a 168/2013/EU, az (EU) 2018/858, az (EU) 2018/1139 és az (EU) 2019/2144 rendelet, továbbá a 2014/90/EU, az (EU) 2016/797 és az (EU) 2020/1828 irányelv módosításáról (a mesterséges intelligenciáról szóló rendelet) (HL L, 2024/1689, 2024.7.12., ELI: http://data.europa.eu/eli/reg/2024/1689/oj).”

( *7 ) Az Európai Parlament és a Tanács (EU) 2024/1689 rendelete (2024. június 13.) a mesterséges intelligenciára vonatkozó harmonizált szabályok megállapításáról, valamint a 300/2008/EK, a 167/2013/EU, a 168/2013/EU, az (EU) 2018/858, az (EU) 2018/1139 és az (EU) 2019/2144 rendelet, továbbá a 2014/90/EU, az (EU) 2016/797 és az (EU) 2020/1828 irányelv módosításáról (a mesterséges intelligenciáról szóló rendelet) (HL L, 2024/1689, 2024.7.12., ELI: http://data.europa.eu/eli/reg/2024/1689/oj).”

( *8 ) Az Európai Parlament és a Tanács (EU) 2024/1689 rendelete (2024. június 13.) a mesterséges intelligenciára vonatkozó harmonizált szabályok megállapításáról, valamint a 300/2008/EK, a 167/2013/EU, a 168/2013/EU, az (EU) 2018/858, az (EU) 2018/1139 és az (EU) 2019/2144 rendelet, továbbá a 2014/90/EU, az (EU) 2016/797 és az (EU) 2020/1828 irányelv módosításáról (a mesterséges intelligenciáról szóló rendelet) (HL L, 2024/1689, 2024.7.12., ELI: http://data.europa.eu/eli/reg/2024/1689/oj).”

( 1 ) Az Európai Parlament és a Tanács (EU) 2020/1828 irányelve (2020. november 25.) a fogyasztók kollektív érdekeinek védelmére irányuló képviseleti keresetekről és a 2009/22/EK irányelv hatályon kívül helyezéséről (HL L 409., 2020.12.4., 1. o.).','d3ed0e4ed9e55b685998c65bf0593450abbf4eb92f34604c18897f2d834d6cfe','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIV','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIV','1','paragraph','Bevezetés A nagy kockázatú MI-rendszerek e rendelet szerinti megfelelőségértékeléséhez szükség lehet megfelelőségértékelő szervezetek bevonására. Csak az e rendelettel összhangban kijelölt megfelelőségértékelő szervezetek végezhetnek megfelelőségértékeléseket, és csak az érintett MI-rendszerek típusaival kapcsolatos tevékenységek tekintetében. Az MI-rendszerek kódjainak, kategóriáinak és megfelelő típusainak jegyzéke meghatározza a 30. cikk szerint bejelentett megfelelőségértékelő szervezetek kijelölésének hatályát.','b307db2a382d39f580bb7bff57c8f40ea860540177bf620a3f4a3372a167f964','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIV','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIV','2','paragraph','Kódok, kategóriák és a vonatkozó MI-rendszerek jegyzéke','b302786413f0ad360d5b16cad326117fb90bb390f0074029f128815adbe070e2','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIV','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIV','a','paragraph','Az I. melléklet hatálya alá tartozó MI-rendszerek MI-rendeleti kód 0102 AIP Az I. melléklet A. szakasza 2. pontjának hatálya alá tartozó MI-rendszerek 0103 AIP Az I. melléklet A. szakasza 3. pontjának hatálya alá tartozó MI-rendszerek 0104 AIP Az I. melléklet A. szakasza 4. pontjának hatálya alá tartozó MI-rendszerek 0105 AIP Az I. melléklet A. szakasza 5. pontjának hatálya alá tartozó MI-rendszerek 0106 AIP Az I. melléklet A. szakasza 6. pontjának hatálya alá tartozó MI-rendszerek 0107 AIP Az I. melléklet A. szakasza 7. pontjának hatálya alá tartozó MI-rendszerek 0108 AIP Az I. melléklet A. szakasza 8. pontjának hatálya alá tartozó MI-rendszerek 0109 AIP Az I. melléklet A. szakasza 9. pontjának hatálya alá tartozó MI-rendszerek 0110 AIP Az I. melléklet A. szakasza 10. pontjának hatálya alá tartozó MI-rendszerek 0111 AIP Az I. melléklet A. szakasza 11. pontjának hatálya alá tartozó MI-rendszerek 0112 AIP Az I. melléklet A. szakasza 12. pontjának hatálya alá tartozó MI-rendszerek','17b88ffe7bd4478169891eaaad00ea756095fd642970ac4782f7008a62ed946f','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIV','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIV','b','paragraph','A III. melléklet 1. pontjának hatálya alá tartozó MI-rendszerek MI-rendeleti kód 0201 AIB Távoli biometrikus azonosító rendszerek 0202 AIB Biometrikus kategorizálási MI-rendszerek 0203 AIB Érzelemfelismerő MI-rendszerek','abb99053e83b1a4e599470b50f8f4f827f90569f58a5567a8a8a9f65685ecd40','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIV','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIV','3','paragraph','MI-technológiaspecifikus kódok','3825dbe17482d6cd2004f8bd4b75f94ee62dce0ee3b6948345e6b9a73816af65','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIV','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIV','c','paragraph','Általános célú MI-modelleken vagy generatív mesterséges intelligencián alapuló MI-rendszerek MI-rendeleti kód 0301 AIH Generatív MI-rendszerek, beleértve az általános célú MI-modelleken alapuló MI-rendszereket is','9dbf47e9beb2dbb441d84e28c91f82909444bf9fcdcc8afcac1263a239e031a8','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIV','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'Annex XIV','d','paragraph','Kialakulóban lévő MI-technológiák MI-rendeleti kód 0401 AIH Más kódok által le nem fedett, egyéb kialakulóban lévő MI-technológiákon alapuló MI-rendszerek, beleértve az ügynökszerű mesterséges intelligenciát is','f44648ec0e1eff458881f5035a921de72bff8695b1534598527c50505a11b3b1','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#anx_XIV','https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',now()
from aic_legal_sources s where s.celex_number='02024R1689-20260727';

commit;
