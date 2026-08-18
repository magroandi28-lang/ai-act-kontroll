-- EnergiaAI Kontroll – Ekertv. 13/A. §: adatkezelés online szolgáltatásnál.
--
-- MIÉRT
-- Az ePrivacy magyar megfelelőjét kerestük. A klasszikus sütiszabály az Eht.
-- 155. §-ában van, de a njt.hu oldala a 145. §-nál elvágódik, ezért az még
-- betöltendő. Az Ekertv. 13/A. §-a viszont elérhető, és a chatbotra vonatkozó
-- lényeget lefedi: milyen adatot kezelhet egy online szolgáltatás, mihez kell
-- hozzájárulás, és mit nem lehet a szolgáltatás feltételévé tenni.
--
-- A LEGFONTOSABB: (8) BEKEZDÉS
-- A szolgáltatás nyújtása nem tehető függővé attól, hogy az igénybe vevő
-- hozzájárul-e olyan adatkezeléshez, amely a szolgáltatáshoz nem szükséges.
-- Ez a magyar sütifal-tilalom, és online chatbotnál közvetlenül alkalmazandó.
--
-- A TÖBBI LÉNYEG
--   (3) csak a technikailag elengedhetetlen adat kezelhető a szolgáltatáshoz
--   (4) minden más cél – hatékonyságnövelés, célzott tartalom, piackutatás –
--       előzetes célmeghatározást és hozzájárulást igényel
--   (5) a tiltás lehetőségét folyamatosan biztosítani kell
--   (6) az így kezelt adat nem kapcsolható az azonosító adatokhoz
--   (7) törlés a szerződés megszűnése és a számlázás után
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'13/A','1','paragraph','(1) A szolgáltató az információs társadalommal összefüggő szolgáltatás nyújtására irányuló szerződés létrehozása, tartalmának meghatározása, módosítása, teljesítésének figyelemmel kísérése, az abból származó díjak számlázása, valamint az azzal kapcsolatos követelések érvényesítése céljából kezelheti az igénybe vevő azonosításához szükséges természetes személyazonosító adatokat és lakcímet.','ab2337e9b4b556dea4f700b2c6d8732f51e8adbe33aa1c44959ec983f778e880','https://njt.hu/jogszabaly/2001-108-00-00#SZ13A','https://njt.hu/jogszabaly/2001-108-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-2001-108-00-00'
and not exists (select 1 from aic_legal_text t where t.source_id=s.id and t.article_number='13/A' and t.paragraph_number='1');

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'13/A','2','paragraph','(2) A szolgáltató az információs társadalommal összefüggő szolgáltatás nyújtására irányuló szerződésből származó díjak számlázása céljából kezelheti az információs társadalommal összefüggő szolgáltatás igénybevételével kapcsolatos természetes személyazonosító adatokat, lakcímet, valamint a szolgáltatás igénybevételének időpontjára, időtartamára és helyére vonatkozó adatokat.','ccbac7e3d3497cdc63e0e4e45216c2e8d76dd51e093ff03ad06e2897e23e550e','https://njt.hu/jogszabaly/2001-108-00-00#SZ13A','https://njt.hu/jogszabaly/2001-108-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-2001-108-00-00'
and not exists (select 1 from aic_legal_text t where t.source_id=s.id and t.article_number='13/A' and t.paragraph_number='2');

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'13/A','3','paragraph','(3) A szolgáltató – a (2) bekezdésben foglaltakon túlmenően – a szolgáltatás nyújtása céljából kezelheti azon személyes adatokat, amelyek a szolgáltatás nyújtásához technikailag elengedhetetlenül szükségesek. A szolgáltatónak az egyéb feltételek azonossága esetén úgy kell megválasztania és minden esetben oly módon kell üzemeltetnie az információs társadalommal összefüggő szolgáltatás nyújtása során alkalmazott eszközöket, hogy személyes adatok kezelésére csak akkor kerüljön sor, ha ez a szolgáltatás nyújtásához és az e törvényben meghatározott egyéb célok teljesüléséhez feltétlenül szükséges, azonban ebben az esetben is csak a szükséges mértékben és ideig.','8afdeb3bd91bffd293d3dd0c637f0e9c6b30c60a65b7ec5a62935fb4f1d0996a','https://njt.hu/jogszabaly/2001-108-00-00#SZ13A','https://njt.hu/jogszabaly/2001-108-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-2001-108-00-00'
and not exists (select 1 from aic_legal_text t where t.source_id=s.id and t.article_number='13/A' and t.paragraph_number='3');

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'13/A','4','paragraph','(4) A szolgáltató a szolgáltatás igénybevételével kapcsolatos adatokat bármely, a (3) bekezdésben meghatározottaktól eltérő célból – így különösen szolgáltatása hatékonyságának növelése, az igénybe vevőnek címzett elektronikus hirdetés vagy egyéb címzett tartalom eljuttatása, piackutatás céljából – csak az adatkezelési cél előzetes meghatározása mellett és az igénybe vevő hozzájárulása alapján kezelhet.','4cf33d1d279f2a51050e859dfe9447da61f7fb18398c5cf2fb360a1af52f151c','https://njt.hu/jogszabaly/2001-108-00-00#SZ13A','https://njt.hu/jogszabaly/2001-108-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-2001-108-00-00'
and not exists (select 1 from aic_legal_text t where t.source_id=s.id and t.article_number='13/A' and t.paragraph_number='4');

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'13/A','5','paragraph','(5) A igénybe vevőnek az információs társadalommal összefüggő szolgáltatás igénybevételét megelőzően és a szolgáltatás igénybevétele során is folyamatosan biztosítani kell, hogy a (4) bekezdés szerinti adatkezelést megtilthassa.','ccf3545ea8ceb4e17c4fbb21e3f57fbd1d294fb2fed5a8de6ce88b385bd75391','https://njt.hu/jogszabaly/2001-108-00-00#SZ13A','https://njt.hu/jogszabaly/2001-108-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-2001-108-00-00'
and not exists (select 1 from aic_legal_text t where t.source_id=s.id and t.article_number='13/A' and t.paragraph_number='5');

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'13/A','6','paragraph','(6) A (4) bekezdésben meghatározott adatok nem kapcsolhatók össze az igénybe vevő azonosító adataival és az igénybe vevő hozzájárulása nélkül nem adhatók át harmadik személy számára.','425f47427fee12f080edf46d03d0ed54b34c586275385a7782a991335a41d09e','https://njt.hu/jogszabaly/2001-108-00-00#SZ13A','https://njt.hu/jogszabaly/2001-108-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-2001-108-00-00'
and not exists (select 1 from aic_legal_text t where t.source_id=s.id and t.article_number='13/A' and t.paragraph_number='6');

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'13/A','7','paragraph','(7) Az (1)–(3) bekezdésben meghatározott célokból kezelt adatokat törölni kell a szerződés létrejöttének elmaradását, a szerződés megszűnését, valamint a számlázást követően. A (4) bekezdésben meghatározott célból kezelt adatokat törölni kell, ha az adatkezelési cél megszűnt, vagy az igénybe vevő így rendelkezik. Törvény eltérő rendelkezése hiányában az adattörlést haladéktalanul el kell végezni.','3d9942482a5109936c17b43493f779c8523bed7978cb9d4add6b7ffe0629793e','https://njt.hu/jogszabaly/2001-108-00-00#SZ13A','https://njt.hu/jogszabaly/2001-108-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-2001-108-00-00'
and not exists (select 1 from aic_legal_text t where t.source_id=s.id and t.article_number='13/A' and t.paragraph_number='7');

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'13/A','8','paragraph','(8) Az információs társadalommal összefüggő szolgáltatás nyújtása nem tehető függővé az igénybe vevőnek valamely (1)–(3) bekezdésében nem említett célból történő adatkezeléshez való hozzájárulásától, amennyiben az adott szolgáltatás más szolgáltatótól nem vehető igénybe.','9711470a46713a64447a16e2821e1fbedfb9f556450b7974c681dbbd4244f2c9','https://njt.hu/jogszabaly/2001-108-00-00#SZ13A','https://njt.hu/jogszabaly/2001-108-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-2001-108-00-00'
and not exists (select 1 from aic_legal_text t where t.source_id=s.id and t.article_number='13/A' and t.paragraph_number='8');

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'13/A','9','paragraph','(9) A külön törvényben meghatározott tájékoztatáson kívül a szolgáltatónak biztosítania kell, hogy az igénybe vevő az információs társadalommal összefüggő szolgáltatás igénybevétele előtt és az igénybevétel során bármikor megismerhesse, hogy a szolgáltató mely adatkezelési célokból mely adatfajtákat kezel, ideértve az igénybe vevővel közvetlenül kapcsolatba nem hozható adatok kezelését is.','ccc0515354344ab863273e4f329bf764f4878bbfd665318ccdf2b8ab11d138ee','https://njt.hu/jogszabaly/2001-108-00-00#SZ13A','https://njt.hu/jogszabaly/2001-108-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-2001-108-00-00'
and not exists (select 1 from aic_legal_text t where t.source_id=s.id and t.article_number='13/A' and t.paragraph_number='9');

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select s.id,'13/A',null,'article','(1) A szolgáltató az információs társadalommal összefüggő szolgáltatás nyújtására irányuló szerződés létrehozása, tartalmának meghatározása, módosítása, teljesítésének figyelemmel kísérése, az abból származó díjak számlázása, valamint az azzal kapcsolatos követelések érvényesítése céljából kezelheti az igénybe vevő azonosításához szükséges természetes személyazonosító adatokat és lakcímet.
(2) A szolgáltató az információs társadalommal összefüggő szolgáltatás nyújtására irányuló szerződésből származó díjak számlázása céljából kezelheti az információs társadalommal összefüggő szolgáltatás igénybevételével kapcsolatos természetes személyazonosító adatokat, lakcímet, valamint a szolgáltatás igénybevételének időpontjára, időtartamára és helyére vonatkozó adatokat.
(3) A szolgáltató – a (2) bekezdésben foglaltakon túlmenően – a szolgáltatás nyújtása céljából kezelheti azon személyes adatokat, amelyek a szolgáltatás nyújtásához technikailag elengedhetetlenül szükségesek. A szolgáltatónak az egyéb feltételek azonossága esetén úgy kell megválasztania és minden esetben oly módon kell üzemeltetnie az információs társadalommal összefüggő szolgáltatás nyújtása során alkalmazott eszközöket, hogy személyes adatok kezelésére csak akkor kerüljön sor, ha ez a szolgáltatás nyújtásához és az e törvényben meghatározott egyéb célok teljesüléséhez feltétlenül szükséges, azonban ebben az esetben is csak a szükséges mértékben és ideig.
(4) A szolgáltató a szolgáltatás igénybevételével kapcsolatos adatokat bármely, a (3) bekezdésben meghatározottaktól eltérő célból – így különösen szolgáltatása hatékonyságának növelése, az igénybe vevőnek címzett elektronikus hirdetés vagy egyéb címzett tartalom eljuttatása, piackutatás céljából – csak az adatkezelési cél előzetes meghatározása mellett és az igénybe vevő hozzájárulása alapján kezelhet.
(5) A igénybe vevőnek az információs társadalommal összefüggő szolgáltatás igénybevételét megelőzően és a szolgáltatás igénybevétele során is folyamatosan biztosítani kell, hogy a (4) bekezdés szerinti adatkezelést megtilthassa.
(6) A (4) bekezdésben meghatározott adatok nem kapcsolhatók össze az igénybe vevő azonosító adataival és az igénybe vevő hozzájárulása nélkül nem adhatók át harmadik személy számára.
(7) Az (1)–(3) bekezdésben meghatározott célokból kezelt adatokat törölni kell a szerződés létrejöttének elmaradását, a szerződés megszűnését, valamint a számlázást követően. A (4) bekezdésben meghatározott célból kezelt adatokat törölni kell, ha az adatkezelési cél megszűnt, vagy az igénybe vevő így rendelkezik. Törvény eltérő rendelkezése hiányában az adattörlést haladéktalanul el kell végezni.
(8) Az információs társadalommal összefüggő szolgáltatás nyújtása nem tehető függővé az igénybe vevőnek valamely (1)–(3) bekezdésében nem említett célból történő adatkezeléshez való hozzájárulásától, amennyiben az adott szolgáltatás más szolgáltatótól nem vehető igénybe.
(9) A külön törvényben meghatározott tájékoztatáson kívül a szolgáltatónak biztosítania kell, hogy az igénybe vevő az információs társadalommal összefüggő szolgáltatás igénybevétele előtt és az igénybevétel során bármikor megismerhesse, hogy a szolgáltató mely adatkezelési célokból mely adatfajtákat kezel, ideértve az igénybe vevővel közvetlenül kapcsolatba nem hozható adatok kezelését is.','aa9f8496add1325518169d91db4bb0a277751f4f8dbeedebea5bfb6397db1708','https://njt.hu/jogszabaly/2001-108-00-00#SZ13A','https://njt.hu/jogszabaly/2001-108-00-00',now()
from aic_legal_sources s where s.celex_number='NJT-2001-108-00-00'
and not exists (select 1 from aic_legal_text t where t.source_id=s.id and t.article_number='13/A' and t.paragraph_number is null);

-- ---------------------------------------------------------------------------
-- Lefedettségi sor.
-- ---------------------------------------------------------------------------
insert into public.aic_provision_coverage (source_id, article_number)
select s.id, '13/A' from public.aic_legal_sources s
where s.celex_number = 'NJT-2001-108-00-00'
  and not exists (select 1 from public.aic_provision_coverage c
                  where c.source_id = s.id and c.article_number = '13/A');

update public.aic_provision_coverage c
set proposed_status = 'gap',
    proposed_reason = 'Online szolgáltatásnál csak a technikailag szükséges adat kezelhető; minden más célhoz hozzájárulás kell, a szolgáltatás pedig nem tehető függővé ettől. Egyetlen szabály sem fedi le.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = 'NJT-2001-108-00-00' and c.article_number = '13/A';

-- ---------------------------------------------------------------------------
-- Kapcsoló: használja-e a rendszer az interakciós adatot a szolgáltatáson túl.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   question_hu, always_ask, display_order, detection_patterns, detection_note)
select 'ANALYTICS_OR_TARGETING',
       'Interakciós adat felhasználása a szolgáltatáson túl',
       'A rendszer a használat során keletkező adatot a szolgáltatás nyújtásán túli célra is felhasználja: hatékonyságmérés, célzott tartalom, piackutatás, statisztika.',
       'funkcio', s.id, '13/A',
       'Használják a rendszer használati adatait a szolgáltatáson túli célra – mérésre, célzott tartalomra vagy piackutatásra?',
       true, 750,
       '[{"minta":"analitika","tipus":"szoveg","suly":"eros"},
         {"minta":"analytics","tipus":"szoveg","suly":"eros"},
         {"minta":"google tag","tipus":"szoveg","suly":"eros"},
         {"minta":"tracking","tipus":"szoveg","suly":"eros"},
         {"minta":"piackutat","tipus":"szoveg","suly":"eros"},
         {"minta":"telemetria","tipus":"szoveg","suly":"gyenge"}]'::jsonb,
       'A hibakereséshez szükséges naplózás nem tartozik ide. A használati statisztika és a viselkedésmérés igen.'
from public.aic_legal_sources s
where s.celex_number = 'NJT-2001-108-00-00'
  and not exists (select 1 from public.aic_trigger_catalogue where trigger_key = 'ANALYTICS_OR_TARGETING');

-- ---------------------------------------------------------------------------
-- Jogszabályhely és szabály.
-- ---------------------------------------------------------------------------
insert into public.aic_legal_provisions
  (source_id, provision_key, article_number, heading, provision_text,
   text_fidelity, language_code, deep_link)
select s.id, 'EKERTV_13A_ONLINE_DATA', '13/A',
       'Adatkezelés információs társadalommal összefüggő szolgáltatásnál',
       'A szolgáltató a szolgáltatás nyújtásához technikailag elengedhetetlenül szükséges személyes adatot kezelheti. Minden más célra – így a hatékonyság növelésére, célzott tartalom eljuttatására vagy piackutatásra – csak előzetes célmeghatározás mellett és az igénybe vevő hozzájárulása alapján. A tiltás lehetőségét folyamatosan biztosítani kell, az így kezelt adat nem kapcsolható össze az azonosító adatokkal, és hozzájárulás nélkül nem adható át harmadik személynek. A szolgáltatás nyújtása nem tehető függővé az ilyen adatkezeléshez való hozzájárulástól, ha az adott szolgáltatás máshonnan nem érhető el észszerűen.',
       'expert_paraphrase', 'hu', 'https://njt.hu/jogszabaly/2001-108-00-00#SZ13A'
from public.aic_legal_sources s
where s.celex_number = 'NJT-2001-108-00-00'
  and not exists (select 1 from public.aic_legal_provisions p
                  where p.source_id = s.id and p.provision_key = 'EKERTV_13A_ONLINE_DATA');

insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review, legal_interpretation_note)
select 'EKERTV_ONLINE_DATA_MINIMISATION',
       'Használati adatok online szolgáltatásnál',
       'Csak a technikailag szükséges adat kezelhető alapból; minden más célhoz hozzájárulás kell, és a szolgáltatás nem köthető ehhez.',
       'any', 'requirement', 'AND', 'under_review', true,
       'A törvény az információs társadalommal összefüggő szolgáltatásra vonatkozik. Egy weben elérhető chatbot ilyen szolgáltatás; a belső, hálózaton futó eszköz nem feltétlenül. Ennek megítélése a telepítési módtól függ.'
where not exists (select 1 from public.aic_compliance_rules where rule_code = 'EKERTV_ONLINE_DATA_MINIMISATION');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'EKERTV_ONLINE_USAGE_DATA', 'Használati adatok kezelése', 'usage_data', 'legal_requirement',
       'Alapból csak a szükséges adat; méréshez és célzott tartalomhoz hozzájárulás, és a szolgáltatás nem köthető ehhez.',
       'A {{organisation_name}} a {{system_name}} működése során keletkező használati adatokat alapértelmezés szerint kizárólag a szolgáltatás nyújtásához technikailag szükséges mértékben kezeli. Ha a {{organisation_name}} ezen túlmenő célra – így a szolgáltatás hatékonyságának mérésére, célzott tartalom eljuttatására vagy piackutatásra – kívánja felhasználni ezeket az adatokat, a célt előzetesen meghatározza, és ahhoz az igénybe vevő hozzájárulását kéri. A {{organisation_name}} biztosítja, hogy az igénybe vevő az ilyen adatkezelést a szolgáltatás igénybevétele előtt és annak során bármikor megtilthassa. Az így kezelt adatok nem kapcsolhatók össze az igénybe vevő azonosító adataival, és hozzájárulása nélkül harmadik személynek nem adhatók át. A {{system_name}} használatát a {{organisation_name}} nem teszi függővé attól, hogy az igénybe vevő hozzájárul-e a szolgáltatáshoz nem szükséges adatkezeléshez. A szolgáltatás nyújtásához kezelt adatokat a szerződés megszűnését és a számlázást követően törölni kell.',
       r.id, '{"all":[{"fact":"ANALYTICS_OR_TARGETING","operator":"is_true"}]}'::jsonb, 95, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code = 'EKERTV_ONLINE_DATA_MINIMISATION'
  and not exists (select 1 from public.aic_policy_modules where module_code = 'EKERTV_ONLINE_USAGE_DATA');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary'
from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code = 'EKERTV_ONLINE_DATA_MINIMISATION' and p.provision_key = 'EKERTV_13A_ONLINE_DATA'
  and not exists (select 1 from public.aic_rule_legal_bases b where b.rule_id = r.id and b.provision_id = p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio from public.aic_compliance_rules r,
(values
 ('USAGE_PURPOSE_SPLIT','A célok szétválasztása',
  'El kell különíteni, mely adat szükséges a működéshez, és mely adatot használnak mérésre vagy célzásra. Utóbbihoz hozzájárulás kell.','critical'),
 ('USAGE_OPT_OUT','Folyamatos tiltási lehetőség',
  'Biztosítani kell, hogy a felhasználó a mérést és a célzást bármikor megtilthassa, ne csak az első használatkor.','high'),
 ('USAGE_NO_CONDITIONING','A szolgáltatás nem köthető hozzájáruláshoz',
  'A rendszer használatát nem szabad attól függővé tenni, hogy a felhasználó elfogadja-e a nem szükséges adatkezelést.','critical'),
 ('USAGE_DELETION','Törlés a cél megszűnésekor',
  'A működéshez kezelt adatokat a szerződés megszűnése és a számlázás után törölni kell.','medium')
) as v(kod,cim,leiras,prio)
where r.rule_code = 'EKERTV_ONLINE_DATA_MINIMISATION'
  and not exists (select 1 from public.aic_required_actions a where a.rule_id = r.id and a.action_code = v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id, 'USAGE_CONSENT_UI', 'A hozzájárulási és tiltási felület',
       'A mérésre és célzásra vonatkozó hozzájárulás kérésének és visszavonásának felülete, képernyőképpel.',
       array['pdf','png','docx'], true
from public.aic_compliance_rules r
where r.rule_code = 'EKERTV_ONLINE_DATA_MINIMISATION'
  and not exists (select 1 from public.aic_required_evidence e where e.rule_id = r.id and e.evidence_code = 'USAGE_CONSENT_UI');

update public.aic_provision_coverage c
set proposed_status = 'covered',
    proposed_reason = 'Az EKERTV_ONLINE_DATA_MINIMISATION szabály lefedi.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = 'NJT-2001-108-00-00' and c.article_number = '13/A';

select (select count(*) from public.aic_compliance_rules) as szabaly,
       (select count(*) from public.aic_trigger_catalogue) as kapcsolo,
       (select count(*) from public.aic_legal_text t join public.aic_legal_sources s on s.id=t.source_id
         where s.celex_number='NJT-2001-108-00-00') as ekertv_reszlet;

commit;
