-- EnergiaAI Kontroll – tanítóadatok jogszerűsége (Szjt. 35/A. §).
--
-- MIÉRT
-- A katalógus eddig egyáltalán nem foglalkozott azzal, hogy a modell tanítására
-- használt tartalom jogszerű-e. Ez minden generatív eszközt érint, és nem
-- iparági kérdés.
--
-- A HÁROM FELTÉTEL
-- A Szjt. 35/A. § (1) bekezdése szerint a szöveg- és adatbányászat akkor
-- szabad felhasználás, ha a műhöz jogszerűen fértek hozzá, a jogosult nem
-- tiltakozott, és a másolatokat csak a szükséges ideig őrzik meg.
--
-- AMI A GYAKORLATBAN KIMARAD
-- A tiltakozás elektronikus tartalomnál géppel olvasható formában is
-- megtehető. Egy robots.txt vagy a felhasználási feltételekben tett kikötés
-- elég hozzá. Ha ezt nem nézik meg, a gyűjtés nem esik a szabad felhasználás
-- alá – akkor sem, ha a tartalom nyilvánosan elérhető volt.
--
-- A KUTATÁSI KIVÉTELRŐL
-- A (2) bekezdés csak kutatóhelyekre és kulturális örökségvédelmi
-- intézményekre vonatkozik, és jövedelemszerzést közvetve sem szolgálhat.
-- Vállalati modellfejlesztésre nem alkalmazható. Ezt a szabály kimondja, mert
-- gyakori félreértés.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. Az új kapcsoló: tanítja-e a szervezet a modellt.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   question_hu, always_ask, display_order, detection_patterns, detection_note)
select 'TRAINS_OR_FINETUNES_MODEL',
       'Modell tanítása vagy finomhangolása',
       'A szervezet maga tanítja, finomhangolja vagy adattal bővíti a modellt – ideértve a saját dokumentumokból épített tudásbázist is.',
       'funkcio', s.id, '35/A',
       'Tanítja, finomhangolja vagy építi a szervezet a modellt saját adatokból vagy gyűjtött tartalomból?',
       true, 740,
       '[{"minta":"finomhangol","tipus":"szoveg","suly":"eros"},
         {"minta":"fine-tun","tipus":"szoveg","suly":"eros"},
         {"minta":"tanítás","tipus":"szoveg","suly":"eros"},
         {"minta":"training","tipus":"szoveg","suly":"eros"},
         {"minta":"embedding","tipus":"szoveg","suly":"eros"},
         {"minta":"vektoradatbázis","tipus":"szoveg","suly":"eros"},
         {"minta":"rag","tipus":"szoveg","suly":"gyenge"},
         {"minta":"scraping","tipus":"szoveg","suly":"eros"},
         {"minta":"crawler","tipus":"szoveg","suly":"eros"}]'::jsonb,
       'A saját dokumentumokból épített kereshető tudásbázis is többszörözés, tehát ide tartozik. A külső modell puszta hívása nem.'
from public.aic_legal_sources s
where s.celex_number = 'NJT-1999-76-00-00'
  and not exists (select 1 from public.aic_trigger_catalogue where trigger_key = 'TRAINS_OR_FINETUNES_MODEL');

insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   derivation_note, display_order)
select 'RIGHTS_RESERVATION_RESPECTED',
       'Géppel olvasható jogfenntartás tiszteletben tartása',
       'A gyűjtés során figyelembe vették a jogosult géppel olvasható tiltakozását – robots.txt, felhasználási feltételek, metaadat.',
       'jogi_minosites', s.id, '35/A',
       'Nem kérdés, hanem eljárási követelmény: a gyűjtésnek kell ellenőriznie. A megfelelés bizonyítása a szervezetet terheli.',
       745
from public.aic_legal_sources s
where s.celex_number = 'NJT-1999-76-00-00'
  and not exists (select 1 from public.aic_trigger_catalogue where trigger_key = 'RIGHTS_RESERVATION_RESPECTED');

-- ---------------------------------------------------------------------------
-- 2. A jogszabályhely.
-- ---------------------------------------------------------------------------
insert into public.aic_legal_provisions
  (source_id, provision_key, article_number, heading, provision_text,
   text_fidelity, language_code, deep_link)
select s.id, 'SZJT_35A_TDM', '35/A',
       'Szöveg- és adatbányászat',
       'Szabad felhasználás a műveken végzett szöveg- és adatbányászathoz szükséges többszörözés, ha a felhasználással érintett műhöz jogszerűen fértek hozzá, a jogosult a szabad felhasználás ellen előzetesen, megfelelő módon – elektronikus úton nyilvánosan hozzáférhetővé tett tartalomnál géppel olvasható formában – nem tiltakozott, és a másolatok megőrzésére kizárólag a szükséges ideig kerül sor. A kutatóhelyek és kulturális örökségvédelmi intézmények tudományos kutatás céljából végzett bányászatára külön, szűkebb kivétel vonatkozik, amely jövedelemszerzést közvetve sem szolgálhat.',
       'expert_paraphrase', 'hu', 'https://njt.hu/jogszabaly/1999-76-00-00#SZ35A'
from public.aic_legal_sources s
where s.celex_number = 'NJT-1999-76-00-00'
  and not exists (select 1 from public.aic_legal_provisions p
                  where p.source_id = s.id and p.provision_key = 'SZJT_35A_TDM');

-- ---------------------------------------------------------------------------
-- 3. A szabály.
-- ---------------------------------------------------------------------------
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review,
   legal_interpretation_note)
select 'SZJT_TRAINING_DATA_LAWFULNESS',
       'Tanítóadatok jogszerűsége',
       'Modell tanításánál vagy tudásbázis építésénél igazolni kell a jogszerű hozzáférést, ellenőrizni kell a géppel olvasható jogfenntartást, és korlátozni kell a másolatok megőrzését.',
       'any', 'documentation', 'AND', 'under_review', true,
       'A törvény a szabad felhasználás feltételeit írja elő, nem nyilvántartási kötelezettséget. A forrásjegyzék vezetése értelmezés: a három feltétel teljesülését máshogy nem lehet bizonyítani, a bizonyítási teher pedig a felhasználón van. A saját dokumentumokból épített vektoros tudásbázis többszörözésnek minősítése szintén értelmezés, de a többszörözés fogalmából következik.'
where not exists (select 1 from public.aic_compliance_rules
                  where rule_code = 'SZJT_TRAINING_DATA_LAWFULNESS');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'COPYRIGHT_TRAINING_DATA',
       'Tanítóadatok jogszerűsége',
       'training_data',
       'legal_requirement',
       'A tanításhoz felhasznált tartalom forrását, jogalapját és a jogfenntartás ellenőrzését dokumentálni kell.',
       'Ha a {{organisation_name}} a {{system_name}} modelljét maga tanítja, finomhangolja, vagy ahhoz tartalmat gyűjt – ideértve a saját dokumentumokból épített kereshető tudásbázist is –, a felhasznált művek tekintetében biztosítja, hogy a művekhez jogszerűen fértek hozzá, hogy a jogosult géppel olvasható jogfenntartását – így különösen a robots.txt fájlban vagy a felhasználási feltételekben tett kikötést – a gyűjtés tiszteletben tartotta, és hogy a bányászathoz készült másolatokat kizárólag a szükséges ideig őrzik meg. A {{organisation_name}} nyilvántartja a tanításhoz felhasznált források körét, a hozzáférés jogalapját és a jogfenntartás ellenőrzésének módját. A {{organisation_name}} a szerzői jogi törvény 35/A. § (2) bekezdése szerinti kutatási kivételre nem hivatkozhat, ha a felhasználás közvetve is jövedelemszerzést vagy jövedelemfokozást szolgál. Ha a modellt külső szolgáltató tanította, a {{organisation_name}} a szerződésben nyilatkozatot kér a tanítóadatok jogszerűségéről, és a nyilatkozatot megőrzi.',
       r.id,
       '{"all":[{"fact":"TRAINS_OR_FINETUNES_MODEL","operator":"is_true"}]}'::jsonb,
       90, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code = 'SZJT_TRAINING_DATA_LAWFULNESS'
  and not exists (select 1 from public.aic_policy_modules where module_code = 'COPYRIGHT_TRAINING_DATA');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary'
from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code = 'SZJT_TRAINING_DATA_LAWFULNESS' and p.provision_key = 'SZJT_35A_TDM'
  and not exists (select 1 from public.aic_rule_legal_bases b
                  where b.rule_id = r.id and b.provision_id = p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio
from public.aic_compliance_rules r,
(values
 ('TDM_SOURCE_REGISTER','Tanítási források nyilvántartása',
  'Nyilvántartást kell vezetni arról, mely forrásokból származik a tanításhoz vagy tudásbázishoz felhasznált tartalom, és milyen jogalapon fértek hozzá.','critical'),
 ('TDM_RESERVATION_CHECK','Géppel olvasható jogfenntartás ellenőrzése',
  'A gyűjtésnek ellenőriznie kell a robots.txt fájlt és a felhasználási feltételeket. Az ellenőrzés tényét és időpontját rögzíteni kell. A nyilvános elérhetőség önmagában nem jelent engedélyt.','critical'),
 ('TDM_RETENTION_LIMIT','Másolatok megőrzési idejének korlátozása',
  'A bányászathoz készült másolatokat a cél elérése után törölni kell. A megőrzési időt írásban rögzíteni kell.','high'),
 ('TDM_VENDOR_STATEMENT','Nyilatkozat külső szolgáltatótól',
  'Ha a modellt más tanította, a szerződésben nyilatkozatot kell kérni a tanítóadatok jogszerűségéről, és azt meg kell őrizni.','high')
) as v(kod,cim,leiras,prio)
where r.rule_code = 'SZJT_TRAINING_DATA_LAWFULNESS'
  and not exists (select 1 from public.aic_required_actions a
                  where a.rule_id = r.id and a.action_code = v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id, v.kod, v.cim, v.leiras, v.formatum, v.kotelezo
from public.aic_compliance_rules r,
(values
 ('TDM_SOURCE_LIST','Tanítási forrásjegyzék',
  'A felhasznált források listája, a hozzáférés jogalapjával és a jogfenntartás-ellenőrzés időpontjával.',
  array['xlsx','csv','pdf'], true),
 ('TDM_VENDOR_DECLARATION','Szolgáltatói nyilatkozat',
  'A modellt tanító szolgáltató nyilatkozata a tanítóadatok jogszerűségéről.',
  array['pdf','docx'], false)
) as v(kod,cim,leiras,formatum,kotelezo)
where r.rule_code = 'SZJT_TRAINING_DATA_LAWFULNESS'
  and not exists (select 1 from public.aic_required_evidence e
                  where e.rule_id = r.id and e.evidence_code = v.kod);

update public.aic_provision_coverage c
set proposed_status = 'covered',
    proposed_reason = 'A SZJT_TRAINING_DATA_LAWFULNESS szabály lefedi.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = 'NJT-1999-76-00-00' and c.article_number = '35/A';

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select (select count(*) from public.aic_compliance_rules) as szabaly,
       (select count(*) from public.aic_trigger_catalogue) as kapcsolo,
       (select count(*) from public.aic_provision_coverage where proposed_status='gap') as hiany,
       (select count(*) from public.aic_provision_coverage where proposed_status is null) as javaslat_nelkul;

commit;
