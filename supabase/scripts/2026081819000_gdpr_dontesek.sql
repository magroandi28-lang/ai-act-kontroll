-- EnergiaAI Kontroll – javaslat a GDPR 34 nyitott cikkéről.
--
-- MIÉRT
-- A lefedettségi tábla szerint a GDPR 99 cikkéből 34 maradt javaslat nélkül.
-- Mindegyiknél ugyanaz a kérdés: keletkezik-e ebből kötelezettség egy cégre,
-- amely MI-eszközt használ vagy gyárt.
--
-- EREDMÉNY
-- 17 cikk lezárható, 17 cikkhez szabály kell.
--
-- AMIT EZ MEGMUTAT
-- A GDPR-oldal a törzs leggyengébb része: 99 cikkre ma 10 szabály jut. Az
-- energetikai katalógust ez nem dönti meg, de a hiányok között olyan
-- alapkötelezettségek vannak, mint az adatkezelési tevékenységek nyilvántartása
-- és az adatvédelmi tisztviselő.
--
-- Ez a fájl csak javaslatot ír. A coverage_status marad undecided; a végleges
-- döntés emberé, az aic_lefedettseg_dontes függvényen keresztül.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. Tárgy, hatály, fogalmak: 1-4. cikk.
--    Meghatározzák, mire terjed ki a rendelet, de önálló kötelezettséget nem
--    írnak elő. A hatály kérdését a szabálymotor kezeli, nem szabályzati szöveg.
-- ---------------------------------------------------------------------------
update public.aic_provision_coverage c
set proposed_status = 'not_required',
    proposed_reason = 'Tárgyat, hatályt és fogalmakat határoz meg; önálló kötelezettséget nem ír elő.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '32016R0679'
  and c.proposed_status is null and c.article_number in ('1','2','3','4');

-- ---------------------------------------------------------------------------
-- 2. Nem a cégnek szól: 41., 43., 50., 83., 84. cikk.
-- ---------------------------------------------------------------------------
update public.aic_provision_coverage c
set proposed_status = 'not_required',
    proposed_reason = 'Akkreditált ellenőrző és tanúsító szervezetekre, felügyeleti hatóságokra, illetve a tagállami jogalkotóra vonatkozik.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '32016R0679'
  and c.proposed_status is null and c.article_number in ('41','43','50','83','84');

-- ---------------------------------------------------------------------------
-- 3. Önkéntes: 40., 42. cikk.
-- ---------------------------------------------------------------------------
update public.aic_provision_coverage c
set proposed_status = 'not_required',
    proposed_reason = 'Magatartási kódexhez való csatlakozás és tanúsítás megszerzése önkéntes; kötelezettség nem keletkezik belőle.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '32016R0679'
  and c.proposed_status is null and c.article_number in ('40','42');

-- ---------------------------------------------------------------------------
-- 4. Tagállami jogra utal: 23., 85., 86., 87., 90., 91. cikk.
--    A kötelezettség nem a GDPR-ból, hanem a nemzeti jogból keletkezik. Ha egy
--    ügyfélnél ilyen helyzet áll elő – például sajtótevékenység vagy egyházi
--    adatkezelés –, ide vissza kell térni.
-- ---------------------------------------------------------------------------
update public.aic_provision_coverage c
set proposed_status = 'not_required',
    proposed_reason = 'A tagállami jogra utal: a konkrét kötelezettség a nemzeti jogszabályban keletkezik, nem itt. Külön ügyféli helyzetben újra kell értékelni.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '32016R0679'
  and c.proposed_status is null and c.article_number in ('23','85','86','87','90','91');

-- ---------------------------------------------------------------------------
-- 5. Hiányok: 17 cikk, amihez szabály kell.
--    Indoklás cikkenként, mert nem egyforma súlyúak.
-- ---------------------------------------------------------------------------
update public.aic_provision_coverage c
set proposed_status = 'gap',
    proposed_reason = case c.article_number
      when '7'  then 'A hozzájárulás érvényességi feltételei: elkülöníthetőség, bizonyíthatóság, visszavonhatóság. Chatbotnál és profilalkotásnál alapkérdés.'
      when '8'  then 'A gyermek hozzájárulása információs társadalommal összefüggő szolgáltatásnál. Nyilvános chatbotnál éles kérdés, mert a kiskorú felhasználót nem lehet kizárni.'
      when '10' then 'Büntetőjogi felelősségre és bűncselekményekre vonatkozó adatok kezelése; csak hatósági felhatalmazás alapján lehetséges.'
      when '11' then 'Azonosítást nem igénylő adatkezelés: ha az adatkezelő nem tudja azonosítani az érintettet, az érintetti jogok gyakorlása külön szabály szerint alakul.'
      when '14' then 'Tájékoztatás, ha a személyes adatot nem az érintettől szerezték meg. Ez a tanítóadatok és a külső adatforrások kulcskérdése.'
      when '26' then 'Közös adatkezelők. MI-eszköznél tipikus: a szállító és az alkalmazó cég viszonyát írásban kell rendezni.'
      when '27' then 'Az Unióban tevékenységi hellyel nem rendelkező adatkezelő képviselője. Unión kívüli MI-szolgáltatónál merül fel.'
      when '29' then 'Az adatkezelő utasítása szerint végzett adatkezelés. MI-szolgáltató bevonásánál közvetlenül alkalmazandó.'
      when '30' then 'Az adatkezelési tevékenységek nyilvántartása. Alapkötelezettség, gyakorlatilag minden cégre.'
      when '31' then 'Együttműködés a felügyeleti hatósággal.'
      when '36' then 'Előzetes konzultáció a hatósággal, ha a hatásvizsgálat magas kockázatot állapít meg. A 35. cikkre épül, ami már lefedett.'
      when '37' then 'Az adatvédelmi tisztviselő kijelölése. Alapkötelezettség.'
      when '38' then 'Az adatvédelmi tisztviselő jogállása: függetlenség, erőforrás, utasításmentesség.'
      when '39' then 'Az adatvédelmi tisztviselő feladatai.'
      when '82' then 'Kártérítéshez való jog és felelősség. Az adatkezelő és az adatfeldolgozó felelősségének megosztása MI-lánc esetén.'
      when '88' then 'Adatkezelés a foglalkoztatással összefüggően. Ez lesz a HR-iparág alapja: munkavállalói megfigyelés, toborzás, értékelés.'
      when '89' then 'Garanciák tudományos, statisztikai és archiválási célú adatkezeléshez. Modelltanításnál merül fel.'
    end,
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '32016R0679'
  and c.proposed_status is null
  and c.article_number in ('7','8','10','11','14','26','27','29','30','31','36','37','38','39','82','88','89');

-- ---------------------------------------------------------------------------
-- Ellenőrzés: hol tart a teljes katalógus.
-- ---------------------------------------------------------------------------
select coalesce(c.proposed_status,'javaslat nélkül') as javaslat,
       count(*) as jogszabalyhely
from public.aic_provision_coverage c
group by 1 order by 2 desc;

commit;
