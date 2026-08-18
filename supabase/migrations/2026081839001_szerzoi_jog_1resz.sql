-- EnergiaAI Kontroll – szerzői jogi törvény és a tanítóadatok.
--
-- MIÉRT
-- A katalógusból eddig teljesen hiányzott a tanítóadatok jogszerűsége. Ez
-- minden generatív MI-eszközt érint, és nem iparági kérdés, hanem törzsi.
--
-- A KULCS: Szjt. 35/A. §
-- Ez ülteti át a 2019/790/EU irányelv 3-4. cikkét. Három feltételhez köti a
-- szöveg- és adatbányászatot:
--   a) a műhöz jogszerűen fértek hozzá
--   b) a jogosult nem tiltakozott – elektronikus tartalomnál GÉPPEL OLVASHATÓ
--      formában, tehát robots.txt vagy hasonló jogfenntartás elég
--   c) a másolatokat csak a szükséges ideig őrzik meg
--
-- A b) pont a legfontosabb: ha egy weboldal géppel olvashatóan fenntartotta a
-- jogait, az onnan gyűjtött tartalom nem használható tanításra. Ezt a
-- gyakorlatban szinte soha nem ellenőrzik.
--
-- A (2) bekezdés szerinti kutatási kivétel szűkebb: csak kutatóhelyekre és
-- kulturális örökségvédelmi intézményekre vonatkozik, és jövedelemszerzést
-- közvetve sem szolgálhat. Vállalati modellfejlesztésre nem alkalmazható.
--
-- MI KERÜL BE
-- 1. § védelem tárgya · 16-17. § kizárólagos jogok · 33-34. § szabad
-- felhasználás általános szabályai és idézés · 35. § magáncélú másolás ·
-- 35/A. § szöveg- és adatbányászat · 94/B. § szerzőségi vélelem
--
-- 1/2. rész – sorrendben futtatandó. Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

insert into public.aic_legal_sources
  (title, source_kind, issuing_body, celex_number, official_url, language_code, is_official, notes)
select '1999. évi LXXVI. törvény – szerzői jog', 'regulation', 'Országgyűlés',
       'NJT-1999-76-00-00', 'https://njt.hu/jogszabaly/1999-76-00-00', 'hu', true,
       'A 2019/790/EU irányelv szöveg- és adatbányászati kivételét a 35/A. § ülteti át. Tanítóadatok jogszerűségéhez ez az irányadó magyar szabály.'
where not exists (select 1 from public.aic_legal_sources where celex_number = 'NJT-1999-76-00-00');

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'1','1','paragraph','(1) Ez a törvény védi az irodalmi, tudományos és művészeti alkotásokat.','2fbcefae29b8116489054f2ea70192ce73db6bc2923b01e1d7d86586b9584a2d','https://njt.hu/jogszabaly/1999-76-00-00#SZ1','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'1','2','paragraph','(2) Szerzői jogi védelem alá tartozik – függetlenül attól, hogy e törvény megnevezi-e – az irodalom, a tudomány és a művészet minden alkotása. Ilyen alkotásnak minősül különösen: a) az irodalmi (pl. szépirodalmi, szakirodalmi, tudományos, publicisztikai) mű, b) a nyilvánosan tartott beszéd, c) a számítógépi programalkotás és a hozzá tartozó dokumentáció (a továbbiakban: szoftver) akár forráskódban, akár tárgykódban vagy bármilyen más formában rögzített minden fajtája, ideértve a felhasználói programot és az operációs rendszert is, d) a színmű, a zenés színmű, a táncjáték és a némajáték, e) a zenemű, szöveggel vagy anélkül, f) a rádió- és a televíziójáték, g) a filmalkotás és más audiovizuális mű (a továbbiakban együtt: filmalkotás), h) a rajzolás, festés, szobrászat, metszés, kőnyomás útján vagy más hasonló módon létrehozott alkotás és annak terve, i) a fotóművészeti alkotás, j) a térképmű és más térképészeti alkotás, k) az építészeti alkotás és annak terve, valamint az épületegyüttes, illetve a városépítészeti együttes terve, l) a műszaki létesítmény terve, m) az iparművészeti alkotás és annak terve, n) a jelmez, a díszlet és azok terve, o) az ipari tervezőművészeti alkotás, p) a gyűjteményes műnek minősülő adatbázis.','c0f136f98799fb4880e8b7c4195a86c60aba20bd00fc3d6df7e741f49d13eafa','https://njt.hu/jogszabaly/1999-76-00-00#SZ1','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'1','3','paragraph','(3) A szerzői jogi védelem az alkotást a szerző szellemi tevékenységéből fakadó egyéni, eredeti jellege alapján illeti meg. A védelem nem függ mennyiségi, minőségi, esztétikai jellemzőktől vagy az alkotás színvonalára vonatkozó értékítélettől.','6fea2f1900a0dee50d888272640f8dc51a688c0313fd55c0cadbc6289f5bb0d1','https://njt.hu/jogszabaly/1999-76-00-00#SZ1','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'1','4','paragraph','(4) Nem tartoznak e törvény védelme alá a jogszabályok, közjogi szervezetszabályozó eszközök, a bírósági vagy hatósági határozatok, a hatósági vagy más hivatalos közlemények és ügyiratok, valamint más hasonló rendelkezések.','a31c1ce2a92d2b675225ede73247332b21d1a996bf662f894891cd55cf1b71b1','https://njt.hu/jogszabaly/1999-76-00-00#SZ1','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'1','5','paragraph','(5) A szerzői jogi védelem nem terjed ki a sajtótermékek közleményeinek alapjául szolgáló tényekre vagy napi hírekre.','b59c8ac2dc41ffac3dbeb7ae46884b9f021364bde173fd03f7f25536418bcfd5','https://njt.hu/jogszabaly/1999-76-00-00#SZ1','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'1','6','paragraph','(6) Valamely ötlet, elv, elgondolás, eljárás, működési módszer vagy matematikai művelet nem lehet tárgya a szerzői jogi védelemnek.','5bbaed13e09ad8dd880d3e6413c0a31280b08e99d5b0db6c88c86b29e7096093','https://njt.hu/jogszabaly/1999-76-00-00#SZ1','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'1','7','paragraph','(7) A folklór kifejeződései nem részesülnek szerzői jogi védelemben. E rendelkezés nem érinti a népművészeti ihletésű, egyéni, eredeti jellegű mű szerzőjét megillető szerzői jogi védelmet.','a671233bee0b236b8b690710f7a0e31470774caac589b5e0f4bb67bd83721841','https://njt.hu/jogszabaly/1999-76-00-00#SZ1','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'1','8','paragraph','(8) Az előadóművészek, a hangfelvétel-előállítók, a rádió- és a televízió-szervezetek, a filmelőállítók, a sajtókiadványok kiadói, valamint az adatbázis-előállítók teljesítményei az e törvényben meghatározott védelemben részesülnek.','a21da7c08ffc399a2955fae5a0aa1a4e173a32453a295fc5e449b1688ad31b17','https://njt.hu/jogszabaly/1999-76-00-00#SZ1','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'1',null,'article','(1) (1) Ez a törvény védi az irodalmi, tudományos és művészeti alkotásokat.
(2) (2) Szerzői jogi védelem alá tartozik – függetlenül attól, hogy e törvény megnevezi-e – az irodalom, a tudomány és a művészet minden alkotása. Ilyen alkotásnak minősül különösen: a) az irodalmi (pl. szépirodalmi, szakirodalmi, tudományos, publicisztikai) mű, b) a nyilvánosan tartott beszéd, c) a számítógépi programalkotás és a hozzá tartozó dokumentáció (a továbbiakban: szoftver) akár forráskódban, akár tárgykódban vagy bármilyen más formában rögzített minden fajtája, ideértve a felhasználói programot és az operációs rendszert is, d) a színmű, a zenés színmű, a táncjáték és a némajáték, e) a zenemű, szöveggel vagy anélkül, f) a rádió- és a televíziójáték, g) a filmalkotás és más audiovizuális mű (a továbbiakban együtt: filmalkotás), h) a rajzolás, festés, szobrászat, metszés, kőnyomás útján vagy más hasonló módon létrehozott alkotás és annak terve, i) a fotóművészeti alkotás, j) a térképmű és más térképészeti alkotás, k) az építészeti alkotás és annak terve, valamint az épületegyüttes, illetve a városépítészeti együttes terve, l) a műszaki létesítmény terve, m) az iparművészeti alkotás és annak terve, n) a jelmez, a díszlet és azok terve, o) az ipari tervezőművészeti alkotás, p) a gyűjteményes műnek minősülő adatbázis.
(3) (3) A szerzői jogi védelem az alkotást a szerző szellemi tevékenységéből fakadó egyéni, eredeti jellege alapján illeti meg. A védelem nem függ mennyiségi, minőségi, esztétikai jellemzőktől vagy az alkotás színvonalára vonatkozó értékítélettől.
(4) (4) Nem tartoznak e törvény védelme alá a jogszabályok, közjogi szervezetszabályozó eszközök, a bírósági vagy hatósági határozatok, a hatósági vagy más hivatalos közlemények és ügyiratok, valamint más hasonló rendelkezések.
(5) (5) A szerzői jogi védelem nem terjed ki a sajtótermékek közleményeinek alapjául szolgáló tényekre vagy napi hírekre.
(6) (6) Valamely ötlet, elv, elgondolás, eljárás, működési módszer vagy matematikai művelet nem lehet tárgya a szerzői jogi védelemnek.
(7) (7) A folklór kifejeződései nem részesülnek szerzői jogi védelemben. E rendelkezés nem érinti a népművészeti ihletésű, egyéni, eredeti jellegű mű szerzőjét megillető szerzői jogi védelmet.
(8) (8) Az előadóművészek, a hangfelvétel-előállítók, a rádió- és a televízió-szervezetek, a filmelőállítók, a sajtókiadványok kiadói, valamint az adatbázis-előállítók teljesítményei az e törvényben meghatározott védelemben részesülnek.','082798cf34231d292aad3f51102cf5cbd084d1ee5cb565000f51584603e25dc8','https://njt.hu/jogszabaly/1999-76-00-00#SZ1','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'16','1','paragraph','(1) A szerzői jogi védelem alapján a szerzőnek kizárólagos joga van a mű egészének vagy valamely azonosítható részének anyagi formában és nem anyagi formában történő bármilyen felhasználására és minden egyes felhasználás engedélyezésére. E törvény eltérő rendelkezése hiányában a felhasználásra engedély felhasználási szerződéssel szerezhető.','65b15901c19559c6c15f750c61c439d81596c3260c1a8ab8596b9c9f59f38fae','https://njt.hu/jogszabaly/1999-76-00-00#SZ16','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'16','2','paragraph','(2) A szerző engedélye szükséges a mű sajátos címének felhasználásához is.','69864e63b9f15a718800d7cbe0e5e8280d5d633e07facb69ba396f4fdbda0830','https://njt.hu/jogszabaly/1999-76-00-00#SZ16','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'16','3','paragraph','(3) A szerzőt megilleti a műben szereplő jellegzetes és eredeti alak kereskedelmi hasznosításának és az ilyen hasznosítás engedélyezésének kizárólagos joga is.','85131f5939b0325aad17ca7d7d9780fa7307574e9cee728d304abad9496043c6','https://njt.hu/jogszabaly/1999-76-00-00#SZ16','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'16','4','paragraph','(4) Ha e törvény másképp nem rendelkezik, a szerzőt a mű felhasználására adott engedély fejében díjazás illeti meg, amelynek – eltérő megállapodás hiányában – a felhasználáshoz kapcsolódó bevétellel kell arányban állnia. A díjazásról a jogosult csak kifejezett nyilatkozattal mondhat le. Ha a törvény a felhasználási szerződés érvényességét megszabott alakhoz köti, a díjazásról való lemondás is csak a megszabott alakban érvényes.','64a1b5dcebdf488472648ebd33ba29ba463c1963376187cad98ce77f751ba484','https://njt.hu/jogszabaly/1999-76-00-00#SZ16','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'16','5','paragraph','(5) A törvényben meghatározott esetekben a szerzőt a mű felhasználásáért megfelelő díjazás illeti meg anélkül, hogy a felhasználás engedélyezésére kizárólagos joga volna. A törvény kizárhatja az ilyen díjazásról való lemondás jogát; a szerző ilyen rendelkezés hiányában is csak kifejezett nyilatkozattal mondhat le a díjazásról.','ceb12f94fb7dd3fd52411b50566c4c56afa1db003f87059678979753972ecc07','https://njt.hu/jogszabaly/1999-76-00-00#SZ16','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'16','6','paragraph','(6) Jogosulatlan a felhasználás különösen akkor, ha arra törvény vagy az arra jogosult szerződéssel engedélyt nem ad, vagy ha a felhasználó jogosultságának határait túllépve használja fel a művet.','a0c2c1789469886653adb2a26d162f7abf6dc48fc2ad99f783bc044d7dc94810','https://njt.hu/jogszabaly/1999-76-00-00#SZ16','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'16','7','paragraph','(7) Ha e törvény vagy a Kjkt. eltérően nem rendelkezik, a felhasználó köteles a szerzőt vagy jogutódját, illetve a közös jogkezelő szervezetet a felhasználás módjáról és mértékéről tájékoztatni.','1e7ce01ba2b433c682a9f1db56a01b72aec856ba179344463037878daefdc8aa','https://njt.hu/jogszabaly/1999-76-00-00#SZ16','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'16','8','paragraph','(8) Ahol e törvény irodalmi és zenei művekkel kapcsolatos szerzői jogok közös kezelését végző szervezetet említ, azon azt a szervezetet kell érteni, amely az írók, a zeneszerzők és a szövegírók képviseletében az adott – irodalmi és zenei művekkel kapcsolatos – engedélyezési jog vagy díjigény gyakorlását a Kjkt. 33. § (2) bekezdése szerinti engedély alapján reprezentatív közös jogkezelő szervezetként végzi, és amely e körben a kiterjesztett hatályú közös jogkezelésre, valamint a jogdíjak megállapítására és beszedésére jogosult. Ezt a szabályt megfelelően kell alkalmazni akkor is, ha e törvény képzőművészeti és iparművészeti alkotásokra vonatkozó szerzői jogok kezelését végző közös jogkezelő szervezetet említ.','7dda285f178dc095b9874341e2d47cf13c58d469d50c407d6f67411ccbc33077','https://njt.hu/jogszabaly/1999-76-00-00#SZ16','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'16',null,'article','(1) (1) A szerzői jogi védelem alapján a szerzőnek kizárólagos joga van a mű egészének vagy valamely azonosítható részének anyagi formában és nem anyagi formában történő bármilyen felhasználására és minden egyes felhasználás engedélyezésére. E törvény eltérő rendelkezése hiányában a felhasználásra engedély felhasználási szerződéssel szerezhető.
(2) (2) A szerző engedélye szükséges a mű sajátos címének felhasználásához is.
(3) (3) A szerzőt megilleti a műben szereplő jellegzetes és eredeti alak kereskedelmi hasznosításának és az ilyen hasznosítás engedélyezésének kizárólagos joga is.
(4) (4) Ha e törvény másképp nem rendelkezik, a szerzőt a mű felhasználására adott engedély fejében díjazás illeti meg, amelynek – eltérő megállapodás hiányában – a felhasználáshoz kapcsolódó bevétellel kell arányban állnia. A díjazásról a jogosult csak kifejezett nyilatkozattal mondhat le. Ha a törvény a felhasználási szerződés érvényességét megszabott alakhoz köti, a díjazásról való lemondás is csak a megszabott alakban érvényes.
(5) (5) A törvényben meghatározott esetekben a szerzőt a mű felhasználásáért megfelelő díjazás illeti meg anélkül, hogy a felhasználás engedélyezésére kizárólagos joga volna. A törvény kizárhatja az ilyen díjazásról való lemondás jogát; a szerző ilyen rendelkezés hiányában is csak kifejezett nyilatkozattal mondhat le a díjazásról.
(6) (6) Jogosulatlan a felhasználás különösen akkor, ha arra törvény vagy az arra jogosult szerződéssel engedélyt nem ad, vagy ha a felhasználó jogosultságának határait túllépve használja fel a művet.
(7) (7) Ha e törvény vagy a Kjkt. eltérően nem rendelkezik, a felhasználó köteles a szerzőt vagy jogutódját, illetve a közös jogkezelő szervezetet a felhasználás módjáról és mértékéről tájékoztatni.
(8) (8) Ahol e törvény irodalmi és zenei művekkel kapcsolatos szerzői jogok közös kezelését végző szervezetet említ, azon azt a szervezetet kell érteni, amely az írók, a zeneszerzők és a szövegírók képviseletében az adott – irodalmi és zenei művekkel kapcsolatos – engedélyezési jog vagy díjigény gyakorlását a Kjkt. 33. § (2) bekezdése szerinti engedély alapján reprezentatív közös jogkezelő szervezetként végzi, és amely e körben a kiterjesztett hatályú közös jogkezelésre, valamint a jogdíjak megállapítására és beszedésére jogosult. Ezt a szabályt megfelelően kell alkalmazni akkor is, ha e törvény képzőművészeti és iparművészeti alkotásokra vonatkozó szerzői jogok kezelését végző közös jogkezelő szervezetet említ.','aced4befdd44b8158e5f24d136b0805d419db90b106dd900290adfe106306253','https://njt.hu/jogszabaly/1999-76-00-00#SZ16','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'17',null,'article','a) a többszörözés ( 18. § és 19. § ), b) a terjesztés ( 23. § ), c) a nyilvános előadás ( 24. § és 25. § ), d) a nyilvánossághoz közvetítés sugárzással vagy másként ( 26. § és 27. § ), e) a sugárzott műnek az eredetihez képest más szervezet közbeiktatásával a nyilvánossághoz történő továbbközvetítése ( 28. § ), f) az átdolgozás ( 29. § ), g) a kiállítás ( 69. § ).','9c8e151247ee224e4bf655488a8f7f1c34bb767144ef5122c1fa6100ba122824','https://njt.hu/jogszabaly/1999-76-00-00#SZ17','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'33','1','paragraph','(1) A szabad felhasználás körében a felhasználás díjtalan, és ahhoz a szerző engedélye nem szükséges. Csak a nyilvánosságra hozott művek használhatók fel szabadon e törvény rendelkezéseinek megfelelően.','3d4a6fe26af1775d65aede8e31443130b8b0c9ca1f72cc24fb8af0afe73fc0f1','https://njt.hu/jogszabaly/1999-76-00-00#SZ33','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'33','2','paragraph','(2) A felhasználás a szabad felhasználásra vonatkozó rendelkezések alapján is csak annyiban megengedett, illetve díjtalan, amennyiben nem sérelmes a mű rendes felhasználására és indokolatlanul nem károsítja a szerző jogos érdekeit, továbbá amennyiben megfelel a tisztesség követelményeinek és nem irányul a szabad felhasználás rendeltetésével össze nem férő célra.','28c5885dd298b8d389b1afbcabb6b6d71b3c968ff226559d2fea76cdcea40a88','https://njt.hu/jogszabaly/1999-76-00-00#SZ33','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'33','3','paragraph','(3) A szabad felhasználásra vonatkozó rendelkezéseket nem lehet kiterjesztően értelmezni.','e3a8174cac2d6de58bdc4b0efdd9a322eecdb3307bcd575eca1ea128de3fbc46','https://njt.hu/jogszabaly/1999-76-00-00#SZ33','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'33','4','paragraph','(4) Ha törvény eltérően nem rendelkezik, a szabad felhasználás szerződéssel vagy egyoldalú jognyilatkozattal való kizárása vagy korlátozása semmis, ideértve azt az esetet is, ha a szerző a felhasználás vonatkozásában megfelelő díjazásban részesül.','629c220299d1eb7c133be163695457b19be6d6f086e118ae6f242df72cf3239f','https://njt.hu/jogszabaly/1999-76-00-00#SZ33','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'33',null,'article','(1) (1) A szabad felhasználás körében a felhasználás díjtalan, és ahhoz a szerző engedélye nem szükséges. Csak a nyilvánosságra hozott művek használhatók fel szabadon e törvény rendelkezéseinek megfelelően.
(2) (2) A felhasználás a szabad felhasználásra vonatkozó rendelkezések alapján is csak annyiban megengedett, illetve díjtalan, amennyiben nem sérelmes a mű rendes felhasználására és indokolatlanul nem károsítja a szerző jogos érdekeit, továbbá amennyiben megfelel a tisztesség követelményeinek és nem irányul a szabad felhasználás rendeltetésével össze nem férő célra.
(3) (3) A szabad felhasználásra vonatkozó rendelkezéseket nem lehet kiterjesztően értelmezni.
(4) (4) Ha törvény eltérően nem rendelkezik, a szabad felhasználás szerződéssel vagy egyoldalú jognyilatkozattal való kizárása vagy korlátozása semmis, ideértve azt az esetet is, ha a szerző a felhasználás vonatkozásában megfelelő díjazásban részesül.','b1a76739440d7beb6e965d4014beabe8c2dbbdee81bdd1afd514dec0d4113d8e','https://njt.hu/jogszabaly/1999-76-00-00#SZ33','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'34','1','paragraph','(1) A mű részletét – az átvevő mű jellege és célja által indokolt terjedelemben és az eredetihez híven – a forrás, valamint az ott megjelölt szerző megnevezésével bárki idézheti.','74e5131a7fece9b8167419701921bbc130c7006984a12a27c69a4993bb3d579e','https://njt.hu/jogszabaly/1999-76-00-00#SZ34','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'34','2','paragraph','(2) Nyilvánosságra hozott irodalmi vagy zenei mű, film részlete, vagy kisebb terjedelmű ilyen önálló mű, továbbá képzőművészeti, építészeti, iparművészeti és ipari tervezőművészeti alkotás képe, valamint fotóművészeti alkotás szemléltetés érdekében iskolai oktatási célra, valamint tudományos kutatás céljára a forrás és az ott megjelölt szerző megnevezésével a cél által indokolt terjedelemben átvehető, feltéve, hogy az átvevő művet nem használják fel üzletszerűen. Átvételnek minősül a mű olyan mértékű felhasználása más műben, amely az idézést meghaladja.','9f6bb0c9d5a5891d42336456f731e6ce622d6eb96373b43b13aafd9e3ece95d1','https://njt.hu/jogszabaly/1999-76-00-00#SZ34','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'34','3','paragraph','(3) Nem szükséges a szerző engedélye a (2) bekezdés szerinti átvevő mű a) többszörözéséhez és terjesztéséhez, ha azt az irányadó jogszabályoknak megfelelően tankönyvvé vagy pedagógus-kézikönyvvé nyilvánítják, és a címoldalon az iskolai célt feltüntetik, illetve b) iskolai oktatás céljából [ 33/A. § (1) bek. 1. pont ] az iskolai oktatás helyszínén történő digitális formában, elektronikus eszközön történő felhasználásához, illetve biztonságos elektronikus hálózaton keresztül történő nyilvánossághoz közvetítéséhez, feltéve, hogy e felhasználásokra nem üzletszerűen kerül sor.','1ccace60fa4923dd38e2fecd51ad6934231d1cfb20c2022600adfe69abdff87d','https://njt.hu/jogszabaly/1999-76-00-00#SZ34','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'34','3a','paragraph','(3a) A (3) bekezdés b) pontja szerinti felhasználást úgy kell tekinteni, hogy az átvevő művet felhasználó oktatási intézmény [ 33/A. § (1) bek. 3. pont ] székhelye szerinti tagállamban valósul meg.','beadfea74afefb8a972f9fccac7719b58e467b4e5985253f106b972d991ca879','https://njt.hu/jogszabaly/1999-76-00-00#SZ34','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'34','3b','paragraph','(3b) A (3) bekezdés b) pontja nem alkalmazható a kották felhasználására.','580ae9a5c226872c0b425a5790e058d099637ed6f602410d272c94d0e019aa30','https://njt.hu/jogszabaly/1999-76-00-00#SZ34','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'34','4','paragraph','(4) A mű iskolai oktatási célra iskolai foglalkozás keretében – beleértve a biztonságos elektronikus hálózaton keresztül tartott foglalkozást – átdolgozható. Az átdolgozott mű felhasználásához – az iskolai foglalkozás keretében történő előadást és a (3) bekezdés b) pontja szerinti felhasználást kivéve – az eredeti mű szerzőjének engedélye is szükséges.','6cd2e841785c9d4a914092e34e8dc0be1a9582b50521a47b70df96ea36e1486c','https://njt.hu/jogszabaly/1999-76-00-00#SZ34','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'34',null,'article','(1) (1) A mű részletét – az átvevő mű jellege és célja által indokolt terjedelemben és az eredetihez híven – a forrás, valamint az ott megjelölt szerző megnevezésével bárki idézheti.
(2) (2) Nyilvánosságra hozott irodalmi vagy zenei mű, film részlete, vagy kisebb terjedelmű ilyen önálló mű, továbbá képzőművészeti, építészeti, iparművészeti és ipari tervezőművészeti alkotás képe, valamint fotóművészeti alkotás szemléltetés érdekében iskolai oktatási célra, valamint tudományos kutatás céljára a forrás és az ott megjelölt szerző megnevezésével a cél által indokolt terjedelemben átvehető, feltéve, hogy az átvevő művet nem használják fel üzletszerűen. Átvételnek minősül a mű olyan mértékű felhasználása más műben, amely az idézést meghaladja.
(3) (3) Nem szükséges a szerző engedélye a (2) bekezdés szerinti átvevő mű a) többszörözéséhez és terjesztéséhez, ha azt az irányadó jogszabályoknak megfelelően tankönyvvé vagy pedagógus-kézikönyvvé nyilvánítják, és a címoldalon az iskolai célt feltüntetik, illetve b) iskolai oktatás céljából [ 33/A. § (1) bek. 1. pont ] az iskolai oktatás helyszínén történő digitális formában, elektronikus eszközön történő felhasználásához, illetve biztonságos elektronikus hálózaton keresztül történő nyilvánossághoz közvetítéséhez, feltéve, hogy e felhasználásokra nem üzletszerűen kerül sor.
(3a) (3a) A (3) bekezdés b) pontja szerinti felhasználást úgy kell tekinteni, hogy az átvevő művet felhasználó oktatási intézmény [ 33/A. § (1) bek. 3. pont ] székhelye szerinti tagállamban valósul meg.
(3b) (3b) A (3) bekezdés b) pontja nem alkalmazható a kották felhasználására.
(4) (4) A mű iskolai oktatási célra iskolai foglalkozás keretében – beleértve a biztonságos elektronikus hálózaton keresztül tartott foglalkozást – átdolgozható. Az átdolgozott mű felhasználásához – az iskolai foglalkozás keretében történő előadást és a (3) bekezdés b) pontja szerinti felhasználást kivéve – az eredeti mű szerzőjének engedélye is szükséges.','7bc630ae0bcf291bcc0348152eb0a0c7c7fa5ec929e7036ef334a734b65c9d3e','https://njt.hu/jogszabaly/1999-76-00-00#SZ34','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35','1','paragraph','(1) Természetes személy magáncélra a műről másolatot készíthet, ha az jövedelemszerzés vagy jövedelemfokozás célját közvetve sem szolgálja, feltéve, hogy a felhasználással érintett műhöz jogszerűen fért hozzá. E rendelkezés nem vonatkozik az építészeti műre, a műszaki létesítményre, a szoftverre és a számítástechnikai eszközzel működtetett adatbázisra, valamint a mű nyilvános előadásának kép- vagy hanghordozóra való rögzítésére. Kotta reprográfiával [ 21. § (1) bek. ] magáncélra és a (4) bekezdés b)–d) pontjában szabályozott esetekben sem többszörözhető.','f6c10af6d4fbbdd2262696ce364cf4afcc643fe600e3b4a756ab5a5a8d00f518','https://njt.hu/jogszabaly/1999-76-00-00#SZ35','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35','2','paragraph','(2)','0e77e68ba5473d98840c3212f4a8cb801226494f1162c8001a9f4ed7b00cbaa8','https://njt.hu/jogszabaly/1999-76-00-00#SZ35','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35','3','paragraph','(3)','46f789d1efeefad080846917a6a4a761d0e1804bb0a4f27fa4634a887ec26265','https://njt.hu/jogszabaly/1999-76-00-00#SZ35','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35','4','paragraph','(4) Kulturális örökségvédelmi intézmény [ 33/A. § (1) bek. 2. pont ] valamint oktatási intézmény [ 33/A. § (1) bek. 3. pont ] a műről másolatot készíthet, ha az jövedelemszerzés vagy jövedelemfokozás célját közvetve sem szolgálja, és a) tudományos kutatáshoz vagy archiváláshoz szükséges, b) nyilvános könyvtári ellátás vagy a 38. § (5) bekezdésében meghatározott felhasználás céljára készül, c) megjelent mű kisebb részéről, továbbá újság- vagy folyóiratcikkről belső intézményi célra készül, vagy d) iskolai oktatás célját szolgáló felhasználáshoz szükséges.','8c1ba7978175efb2d0280c10e8e52c1ade3b29d0fd9c5335eb945ed0af5b7f24','https://njt.hu/jogszabaly/1999-76-00-00#SZ35','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35','4a','paragraph','(4a) A kulturális örökségvédelmi intézmény az általa a) a (4) bekezdés a) pontja szerinti felhasználás céljára előállított másolatot kutatóhely és más kulturális örökségvédelmi intézmény részére, b) a (4) bekezdés d) pontja szerinti felhasználás céljára előállított másolatot oktatási intézmény [ 33/A. § (1) bek. 3. pont ] részére jövedelemszerzés vagy jövedelemfokozás célját közvetve sem szolgáló módon szabadon terjesztheti.','d16f492ed54e5ae3aa463ebd90f03bbdcef46e20f41f8fcdadf5f4bc582928c4','https://njt.hu/jogszabaly/1999-76-00-00#SZ35','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35','5','paragraph','(5) Könyvként kiadott mű egyes részei, valamint újság- és folyóiratcikkek az iskolai oktatás céljára egy-egy csoport vagy iskolai osztály létszámának megfelelő, valamint a köznevelés, a szakképzés, illetve a felsőoktatás keretében szervezett vizsgákhoz szükséges példányszámban többszörözhetők, az érintett tanulók, hallgatók részére terjeszthetők és az oktatási intézmény biztonságos elektronikus hálózatán keresztül szemléltetés érdekében számukra lehívásra hozzáférhetővé tehetők.','8225d8e35274955c06d2c71e9083b711f94f61040fc410de92da8965cec7118d','https://njt.hu/jogszabaly/1999-76-00-00#SZ35','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35','6','paragraph','(6) Szabad felhasználás a mű járulékos vagy közbenső – a felhasználásra irányuló műszaki folyamat elválaszthatatlan és lényeges részét képező, önálló gazdasági jelentőség nélküli – időleges többszörözése, ha kizárólag az a célja, hogy lehetővé tegye a) az átvitelt harmadik személyek között hálózaton, köztes szolgáltató által, vagy b) a műnek a szerző által engedélyezett, illetve e törvény rendelkezései alapján megengedett felhasználását.','5842c30bdc7d33ed9aa35ae8e8b9ec498d9c3a5c7fa678fb8b3b02ee2921add3','https://njt.hu/jogszabaly/1999-76-00-00#SZ35','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35','7','paragraph','(7) Szabad felhasználás a saját műsorának sugárzásához jogszerűen felhasználható műről a rádió- vagy televízió-szervezet által saját eszközeivel készített ideiglenes rögzítés. Ha a sugárzás engedélyezésére kötött szerződés másként nem rendelkezik, e rögzítést a rögzítés elkészítésének időpontjától számított három hónapon belül meg kell semmisíteni, illetve törölni kell. E rögzítések közül azonban azok a – külön törvényben meghatározott – rögzítések, amelyeknek rendkívüli dokumentációs értéke van, közgyűjteménynek minősülő kép-, illetve hangarchívumban korlátlan ideig megőrizhetők.','d6861858ddd53f19aaf665e4eec269ddf1d36523e08b6a33ef6de0c4db9bb43c','https://njt.hu/jogszabaly/1999-76-00-00#SZ35','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35','8','paragraph','(8) Az (1), a (4) és az (5), valamint a (7) bekezdésben szabályozott szabad felhasználási esetek nem érintik a 20–22. §-okban foglaltak alkalmazását.','4ddc734cfcf6256597686034c6f90212a7f5ce3b68ef841763359464b92b725a','https://njt.hu/jogszabaly/1999-76-00-00#SZ35','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

commit;
