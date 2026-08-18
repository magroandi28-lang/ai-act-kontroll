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
-- 2/2. rész – sorrendben futtatandó. Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

insert into public.aic_legal_sources
  (title, source_kind, issuing_body, celex_number, official_url, language_code, is_official, notes)
select '1999. évi LXXVI. törvény – szerzői jog', 'regulation', 'Országgyűlés',
       'NJT-1999-76-00-00', 'https://njt.hu/jogszabaly/1999-76-00-00', 'hu', true,
       'A 2019/790/EU irányelv szöveg- és adatbányászati kivételét a 35/A. § ülteti át. Tanítóadatok jogszerűségéhez ez az irányadó magyar szabály.'
where not exists (select 1 from public.aic_legal_sources where celex_number = 'NJT-1999-76-00-00');

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35',null,'article','(1) (1) Természetes személy magáncélra a műről másolatot készíthet, ha az jövedelemszerzés vagy jövedelemfokozás célját közvetve sem szolgálja, feltéve, hogy a felhasználással érintett műhöz jogszerűen fért hozzá. E rendelkezés nem vonatkozik az építészeti műre, a műszaki létesítményre, a szoftverre és a számítástechnikai eszközzel működtetett adatbázisra, valamint a mű nyilvános előadásának kép- vagy hanghordozóra való rögzítésére. Kotta reprográfiával [ 21. § (1) bek. ] magáncélra és a (4) bekezdés b)–d) pontjában szabályozott esetekben sem többszörözhető.
(2) (2)
(3) (3)
(4) (4) Kulturális örökségvédelmi intézmény [ 33/A. § (1) bek. 2. pont ] valamint oktatási intézmény [ 33/A. § (1) bek. 3. pont ] a műről másolatot készíthet, ha az jövedelemszerzés vagy jövedelemfokozás célját közvetve sem szolgálja, és a) tudományos kutatáshoz vagy archiváláshoz szükséges, b) nyilvános könyvtári ellátás vagy a 38. § (5) bekezdésében meghatározott felhasználás céljára készül, c) megjelent mű kisebb részéről, továbbá újság- vagy folyóiratcikkről belső intézményi célra készül, vagy d) iskolai oktatás célját szolgáló felhasználáshoz szükséges.
(4a) (4a) A kulturális örökségvédelmi intézmény az általa a) a (4) bekezdés a) pontja szerinti felhasználás céljára előállított másolatot kutatóhely és más kulturális örökségvédelmi intézmény részére, b) a (4) bekezdés d) pontja szerinti felhasználás céljára előállított másolatot oktatási intézmény [ 33/A. § (1) bek. 3. pont ] részére jövedelemszerzés vagy jövedelemfokozás célját közvetve sem szolgáló módon szabadon terjesztheti.
(5) (5) Könyvként kiadott mű egyes részei, valamint újság- és folyóiratcikkek az iskolai oktatás céljára egy-egy csoport vagy iskolai osztály létszámának megfelelő, valamint a köznevelés, a szakképzés, illetve a felsőoktatás keretében szervezett vizsgákhoz szükséges példányszámban többszörözhetők, az érintett tanulók, hallgatók részére terjeszthetők és az oktatási intézmény biztonságos elektronikus hálózatán keresztül szemléltetés érdekében számukra lehívásra hozzáférhetővé tehetők.
(6) (6) Szabad felhasználás a mű járulékos vagy közbenső – a felhasználásra irányuló műszaki folyamat elválaszthatatlan és lényeges részét képező, önálló gazdasági jelentőség nélküli – időleges többszörözése, ha kizárólag az a célja, hogy lehetővé tegye a) az átvitelt harmadik személyek között hálózaton, köztes szolgáltató által, vagy b) a műnek a szerző által engedélyezett, illetve e törvény rendelkezései alapján megengedett felhasználását.
(7) (7) Szabad felhasználás a saját műsorának sugárzásához jogszerűen felhasználható műről a rádió- vagy televízió-szervezet által saját eszközeivel készített ideiglenes rögzítés. Ha a sugárzás engedélyezésére kötött szerződés másként nem rendelkezik, e rögzítést a rögzítés elkészítésének időpontjától számított három hónapon belül meg kell semmisíteni, illetve törölni kell. E rögzítések közül azonban azok a – külön törvényben meghatározott – rögzítések, amelyeknek rendkívüli dokumentációs értéke van, közgyűjteménynek minősülő kép-, illetve hangarchívumban korlátlan ideig megőrizhetők.
(8) (8) Az (1), a (4) és az (5), valamint a (7) bekezdésben szabályozott szabad felhasználási esetek nem érintik a 20–22. §-okban foglaltak alkalmazását.','14bdd075ce17ad660167fe0fc5918bdf673da4d1fd6a03d75e1d56fa94bf73c6','https://njt.hu/jogszabaly/1999-76-00-00#SZ35','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35/A','1','paragraph','(1) Szabad felhasználás a műveken végzett szöveg- és adatbányászathoz szükséges többszörözés, ha a) a felhasználással érintett műhöz jogszerűen fértek hozzá, b) a jogosult a szabad felhasználás ellen előzetesen, megfelelő módon – az elektronikus úton nyilvánosan hozzáférhetővé tett tartalom esetében géppel olvasható formában – nem tiltakozott, és c) a szöveg- és adatbányászathoz szükséges másolatok megőrzésére kizárólag a szöveg- és adatbányászat céljából szükséges ideig kerül sor.','42aefcb8cb70151e66327a1757069905e2a0e2eeb1679884a07b9db928438887','https://njt.hu/jogszabaly/1999-76-00-00#SZ35A','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35/A','2','paragraph','(2) Szabad felhasználás a kutatóhelyek és kulturális örökségvédelmi intézmények [ 33/A. § (1) bek. 2. pont ] által műveken tudományos kutatás céljából végzett szöveg- és adatbányászathoz szükséges többszörözés, feltéve, hogy a) a felhasználást végző személy az érintett műhöz jogszerűen fért hozzá, b) a szabad felhasználás keretében létrejött másolatok megfelelő biztonsági szinten vannak tárolva, és c) megőrzésükre tudományos kutatás céljából kerül sor.','45990140dbcaa48d222aa74924692c00c432d6d7c08725a617b32ea3888aee84','https://njt.hu/jogszabaly/1999-76-00-00#SZ35A','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35/A','3','paragraph','(3) Az (1) és (2) bekezdés alapján létrejött többszörözött példányokat a felhasználásra jogosított személyek a) az érintett kutatási együttműködés keretei között, vagy b) a tudományos mű szakmai értékelése céljából személyek egy zárt csoportja számára lehívásra hozzáférhetővé tehetik, feltéve, hogy ez a felhasználás jövedelemszerzés vagy jövedelemfokozás célját közvetve sem szolgálja. A nyilvánossághoz közvetítés kizárólag az e §-ban meghatározott célhoz szükséges mértékben és ideig állhat fenn.','adee9545e16d4e9cadc12b3636f7f5c53ec8db3cbd6bf3d7e428ae573db4aa63','https://njt.hu/jogszabaly/1999-76-00-00#SZ35A','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'35/A',null,'article','(1) (1) Szabad felhasználás a műveken végzett szöveg- és adatbányászathoz szükséges többszörözés, ha a) a felhasználással érintett műhöz jogszerűen fértek hozzá, b) a jogosult a szabad felhasználás ellen előzetesen, megfelelő módon – az elektronikus úton nyilvánosan hozzáférhetővé tett tartalom esetében géppel olvasható formában – nem tiltakozott, és c) a szöveg- és adatbányászathoz szükséges másolatok megőrzésére kizárólag a szöveg- és adatbányászat céljából szükséges ideig kerül sor.
(2) (2) Szabad felhasználás a kutatóhelyek és kulturális örökségvédelmi intézmények [ 33/A. § (1) bek. 2. pont ] által műveken tudományos kutatás céljából végzett szöveg- és adatbányászathoz szükséges többszörözés, feltéve, hogy a) a felhasználást végző személy az érintett műhöz jogszerűen fért hozzá, b) a szabad felhasználás keretében létrejött másolatok megfelelő biztonsági szinten vannak tárolva, és c) megőrzésükre tudományos kutatás céljából kerül sor.
(3) (3) Az (1) és (2) bekezdés alapján létrejött többszörözött példányokat a felhasználásra jogosított személyek a) az érintett kutatási együttműködés keretei között, vagy b) a tudományos mű szakmai értékelése céljából személyek egy zárt csoportja számára lehívásra hozzáférhetővé tehetik, feltéve, hogy ez a felhasználás jövedelemszerzés vagy jövedelemfokozás célját közvetve sem szolgálja. A nyilvánossághoz közvetítés kizárólag az e §-ban meghatározott célhoz szükséges mértékben és ideig állhat fenn.','c7743602f1fad09f35bfeec2198aa19bb7bbf312997b1e31878a146adc5e77b5','https://njt.hu/jogszabaly/1999-76-00-00#SZ35A','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'94/B','1','paragraph','(1) Az ellenkező bizonyításáig azt kell szerzőnek tekinteni, akinek a nevét ilyenként a művön a szokásos módon feltüntették.','3302493041eb91aaa5e669e8357f6d74dc2934cfe9e331288729119fd66dcea2','https://njt.hu/jogszabaly/1999-76-00-00#SZ94B','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'94/B','2','paragraph','(2) Ha az (1) bekezdés nem alkalmazható, az ellenkező bizonyításáig azt kell szerzőnek tekinteni, aki a művet sajátjaként a Hivatalnál vezetett önkéntes műnyilvántartásba vetette és ezt közokirattal igazolja. A mű nyilvántartásba vételéért igazgatási szolgáltatási díjat kell fizetni.','5f0ee544bef14b029a3af2da20f8a393085200b63c36f4aef05646102242f48d','https://njt.hu/jogszabaly/1999-76-00-00#SZ94B','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'94/B','3','paragraph','(3) Ha a (2) bekezdés sem alkalmazható, az ellenkező bizonyításáig azt kell szerzőnek tekinteni, aki ezt közös jogkezelő szervezet által a közös jogkezelés alá tartozó művekről, szomszédos jogi teljesítményekről, illetve jogosultakról fenntartott adatbázis alapján kiállított teljes bizonyító erejű magánokirattal igazolja. Ilyen magánokiratot a közös jogkezelő szervezet önként vállalt szolgáltatásként – alapszabályával összhangban – saját tagja számára, a tag kérésére állíthat ki.','e553f91670a3675223e3864ff12369b669036ed081d4c864c4086cf0a300b0ad','https://njt.hu/jogszabaly/1999-76-00-00#SZ94B','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'94/B','4','paragraph','(4) Ha a (3) bekezdés sem alkalmazható, az ellenkező bizonyításáig azt kell szerzőnek tekinteni, aki a művet először hozta nyilvánosságra.','e7e56c2e68e3dbf3b54f2f30972dc3b41fc0ce4ebcd665a149b666c9e597afbd','https://njt.hu/jogszabaly/1999-76-00-00#SZ94B','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'94/B','5','paragraph','(5)','97ce6126f9bad63aac5ddf4679f0612cefe3e29045a0c685838526b952c8150d','https://njt.hu/jogszabaly/1999-76-00-00#SZ94B','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'94/B',null,'article','(1) (1) Az ellenkező bizonyításáig azt kell szerzőnek tekinteni, akinek a nevét ilyenként a művön a szokásos módon feltüntették.
(2) (2) Ha az (1) bekezdés nem alkalmazható, az ellenkező bizonyításáig azt kell szerzőnek tekinteni, aki a művet sajátjaként a Hivatalnál vezetett önkéntes műnyilvántartásba vetette és ezt közokirattal igazolja. A mű nyilvántartásba vételéért igazgatási szolgáltatási díjat kell fizetni.
(3) (3) Ha a (2) bekezdés sem alkalmazható, az ellenkező bizonyításáig azt kell szerzőnek tekinteni, aki ezt közös jogkezelő szervezet által a közös jogkezelés alá tartozó művekről, szomszédos jogi teljesítményekről, illetve jogosultakról fenntartott adatbázis alapján kiállított teljes bizonyító erejű magánokirattal igazolja. Ilyen magánokiratot a közös jogkezelő szervezet önként vállalt szolgáltatásként – alapszabályával összhangban – saját tagja számára, a tag kérésére állíthat ki.
(4) (4) Ha a (3) bekezdés sem alkalmazható, az ellenkező bizonyításáig azt kell szerzőnek tekinteni, aki a művet először hozta nyilvánosságra.
(5) (5)','1d0dde252d7bd886a03218f2cd5cbc9ea8b53100fb1594482fc26ee7da589969','https://njt.hu/jogszabaly/1999-76-00-00#SZ94B','https://njt.hu/jogszabaly/1999-76-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-1999-76-00-00';

-- ---------------------------------------------------------------------------
-- Lefedettségi sorok az új jogszabályhelyekhez.
-- ---------------------------------------------------------------------------
insert into public.aic_provision_coverage (source_id, article_number)
select distinct t.source_id, t.article_number
from public.aic_legal_text t
join public.aic_legal_sources s on s.id = t.source_id
where s.celex_number = 'NJT-1999-76-00-00'
  and not exists (select 1 from public.aic_provision_coverage c
                  where c.source_id = t.source_id and c.article_number = t.article_number);

update public.aic_provision_coverage c
set proposed_status = 'not_required',
    proposed_reason = 'A szerzői jogi védelem tárgyát és a kizárólagos jogokat határozza meg; önálló kötelezettséget MI-eszközre nem ír elő.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = 'NJT-1999-76-00-00'
  and c.article_number in ('1','16','17','94/B') and c.proposed_status is null;

update public.aic_provision_coverage c
set proposed_status = 'gap',
    proposed_reason = 'A szöveg- és adatbányászat feltételei: jogszerű hozzáférés, a jogosult géppel olvasható jogfenntartásának tiszteletben tartása, és a másolatok korlátozott megőrzése. Egyetlen szabály sem fedi le, pedig minden generatív eszközt érint.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = 'NJT-1999-76-00-00'
  and c.article_number = '35/A';

update public.aic_provision_coverage c
set proposed_status = 'not_required',
    proposed_reason = 'A szabad felhasználás általános szabályai és a magáncélú másolás. MI-eszköznél a 35/A. § az irányadó, ezek háttérszabályok.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = 'NJT-1999-76-00-00'
  and c.article_number in ('33','34','35') and c.proposed_status is null;

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select t.article_number,
       count(*) filter (where t.paragraph_number is not null) as bekezdes,
       max(length(t.content)) as leghosszabb
from public.aic_legal_text t join public.aic_legal_sources s on s.id = t.source_id
where s.celex_number = 'NJT-1999-76-00-00'
group by t.article_number order by t.article_number;

commit;
