-- EnergiaAI Kontroll – adatvédelmi tisztviselő (GDPR 37-39. cikk).
--
-- MIÉRT
-- Három cikk, egy szabály: a kijelölés, a jogállás és a feladatok
-- elválaszthatatlanok. Egy MI-eszköznél a 37. cikk (1) bekezdés b) pontja a
-- kritikus: ha a rendszer az érintettek rendszeres és szisztematikus,
-- nagymértékű megfigyelését végzi, a kijelölés kötelező. Profilalkotásnál,
-- viselkedéskövetésnél és ügyfélbeszélgetések tömeges elemzésénél ez gyakran
-- teljesül, mégsem tartozott hozzá szabály.
--
-- MI TÖRVÉNYSZÖVEG ÉS MI ÉRTELMEZÉS
-- A 38. cikk (1) bekezdése annyit mond, hogy a tisztviselőt "a személyes adatok
-- védelmével kapcsolatos összes ügybe" be kell vonni, és a 39. cikk (1)
-- bekezdés c) pontja nevesíti a hatásvizsgálatot. A bevezetés, a modellcsere és
-- a szolgáltatócsere mint példa nem szerepel a rendeletben: ez értelmezés,
-- amely az "összes ügy" fordulatot bontja ki MI-eszközre. A szabály
-- legal_interpretation_note mezője ezt rögzíti, hogy a jogász a jóváhagyáskor
-- lássa, min dönt.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. A jogszabályhelyek.
-- ---------------------------------------------------------------------------
insert into public.aic_legal_provisions
  (source_id, provision_key, article_number, heading, provision_text,
   text_fidelity, language_code, deep_link)
select s.id, v.kulcs, v.cikk, v.cim, v.szoveg, 'expert_paraphrase', 'hu',
       'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_' || v.cikk
from public.aic_legal_sources s,
(values
 ('GDPR_ART37_DPO_DESIGNATION','37','Az adatvédelmi tisztviselő kijelölése',
  'Az adatkezelő és az adatfeldolgozó adatvédelmi tisztviselőt jelöl ki, ha az adatkezelést közhatalmi szerv végzi, ha a fő tevékenység az érintettek rendszeres és szisztematikus, nagymértékű megfigyelése, vagy ha a fő tevékenység különleges adatok, illetve büntetőjogi felelősségre vonatkozó adatok nagymértékű kezelése. A kijelölés szakmai rátermettség és az adatvédelmi jog szakértői ismerete alapján történik. A tisztviselő alkalmazott vagy szolgáltatási szerződéssel megbízott is lehet. Nevét és elérhetőségét közzé kell tenni és a felügyeleti hatósággal közölni kell.'),
 ('GDPR_ART38_DPO_POSITION','38','Az adatvédelmi tisztviselő jogállása',
  'A tisztviselőt a személyes adatok védelmével kapcsolatos összes ügybe megfelelő módon és időben be kell vonni, és biztosítani kell a feladatai ellátásához szükséges forrásokat. A feladatai ellátásával kapcsolatban utasítást nem fogadhat el, emiatt nem bocsátható el és nem érheti hátrány, és közvetlenül a legfelső vezetésnek tartozik felelősséggel. Az érintettek hozzá fordulhatnak. Titoktartás köti. Egyéb feladatai nem eredményezhetnek összeférhetetlenséget.'),
 ('GDPR_ART39_DPO_TASKS','39','Az adatvédelmi tisztviselő feladatai',
  'A tisztviselő tájékoztat és szakmai tanácsot ad, ellenőrzi a rendelet és a belső szabályok betartását, kérésre szakmai tanácsot ad az adatvédelmi hatásvizsgálathoz és figyelemmel kíséri annak elvégzését, együttműködik a felügyeleti hatósággal, és kapcsolattartó pontként szolgál. Feladatait a kockázat figyelembevételével látja el.')
) as v(kulcs,cikk,cim,szoveg)
where s.celex_number = '32016R0679'
  and not exists (select 1 from public.aic_legal_provisions p
                  where p.source_id = s.id and p.provision_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- 2. A szabály.
-- ---------------------------------------------------------------------------
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review,
   legal_interpretation_note)
select 'GDPR_ART37_39_DPO',
       'Adatvédelmi tisztviselő kijelölése és bevonása',
       'Meg kell vizsgálni, hogy a rendszer miatt kötelező-e adatvédelmi tisztviselőt kijelölni, és ha van tisztviselő, be kell vonni a rendszert érintő adatvédelmi ügyekbe.',
       'any', 'requirement', 'AND', 'under_review', true,
       'A 38. cikk (1) bekezdése a "személyes adatok védelmével kapcsolatos összes ügyre" utal, felsorolás nélkül. A hatásvizsgálat a 39. cikk (1) bekezdés c) pontjából következik. A bevezetés, a modellcsere és a szolgáltatócsere mint példa értelmezés: azt bontja ki, mit jelent az "összes ügy" egy MI-eszköz életciklusában. A "nagymértékű" és a "rendszeres és szisztematikus" fogalmak megítélése tényállásfüggő, azt a szabály nem dönti el.'
where not exists (select 1 from public.aic_compliance_rules
                  where rule_code = 'GDPR_ART37_39_DPO');

-- ---------------------------------------------------------------------------
-- 3. A szabályzatba kerülő szöveg.
-- ---------------------------------------------------------------------------
insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'GDPR_DATA_PROTECTION_OFFICER',
       'Adatvédelmi tisztviselő',
       'data_protection_officer',
       'legal_requirement',
       'Vizsgálni kell a kijelölési kötelezettséget, és a tisztviselőt be kell vonni a rendszert érintő adatvédelmi ügyekbe.',
       'A {{organisation_name}} megvizsgálja, hogy a {{system_name}} működése miatt köteles-e adatvédelmi tisztviselőt kijelölni, különös tekintettel arra, hogy a rendszer az érintettek rendszeres és szisztematikus, nagymértékű megfigyelését végzi-e, illetve különleges adatokat kezel-e nagy számban. A vizsgálat eredményét dokumentálni kell. Ha a kijelölés kötelező vagy arra önkéntesen kerül sor, a tisztviselőt a {{system_name}}-t érintő adatvédelmi ügyekbe megfelelő módon és időben be kell vonni – így különösen a bevezetés, a modell vagy a szolgáltató cseréje, az adatvédelmi hatásvizsgálat és az adatvédelmi incidens kezelése során. A tisztviselő a feladatai ellátásával kapcsolatban utasítást nem fogadhat el, emiatt nem bocsátható el és nem érheti hátrány, és közvetlenül a legfelső vezetésnek tartozik felelősséggel. Nevét és elérhetőségét a {{organisation_name}} közzéteszi és a felügyeleti hatósággal közli. A tisztviselő egyéb feladatai nem eredményezhetnek összeférhetetlenséget.',
       r.id,
       '{"required_facts":{"processes_personal_data":true}}'::jsonb,
       45, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code = 'GDPR_ART37_39_DPO'
  and not exists (select 1 from public.aic_policy_modules where module_code = 'GDPR_DATA_PROTECTION_OFFICER');

-- ---------------------------------------------------------------------------
-- 4. Jogalapok: a 37. cikk elsődleges, a 38. és 39. támogató.
-- ---------------------------------------------------------------------------
insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id,
       case when p.provision_key = 'GDPR_ART37_DPO_DESIGNATION' then 'primary' else 'supporting' end
from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code = 'GDPR_ART37_39_DPO'
  and p.provision_key in ('GDPR_ART37_DPO_DESIGNATION','GDPR_ART38_DPO_POSITION','GDPR_ART39_DPO_TASKS')
  and not exists (select 1 from public.aic_rule_legal_bases b
                  where b.rule_id = r.id and b.provision_id = p.id);

-- ---------------------------------------------------------------------------
-- 5. Teendők.
-- ---------------------------------------------------------------------------
insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio
from public.aic_compliance_rules r,
(values
 ('DPO_ASSESS_OBLIGATION',
  'A kijelölési kötelezettség vizsgálata',
  'Írásban rögzíteni kell, hogy a rendszer miatt fennáll-e a kijelölési kötelezettség: közfeladat, rendszeres és szisztematikus nagymértékű megfigyelés, vagy különleges adatok nagymértékű kezelése. A nemleges eredményt is dokumentálni kell.',
  'critical'),
 ('DPO_INVOLVEMENT',
  'A tisztviselő bevonása',
  'Rögzíteni kell, mely döntéseknél kell a tisztviselőt bevonni, és biztosítani kell, hogy időben értesüljön: bevezetés, modell- vagy szolgáltatóváltás, hatásvizsgálat, incidens.',
  'high'),
 ('DPO_PUBLISH_NOTIFY',
  'Közzététel és bejelentés',
  'A tisztviselő nevét és elérhetőségét közzé kell tenni, és be kell jelenteni a felügyeleti hatóságnak.',
  'high'),
 ('DPO_CONFLICT_CHECK',
  'Összeférhetetlenség vizsgálata',
  'Ha a tisztviselő más feladatot is ellát, meg kell vizsgálni, hogy azok nem eredményeznek-e összeférhetetlenséget – például ha ő dönt az adatkezelés céljáról és eszközeiről.',
  'medium')
) as v(kod,cim,leiras,prio)
where r.rule_code = 'GDPR_ART37_39_DPO'
  and not exists (select 1 from public.aic_required_actions a
                  where a.rule_id = r.id and a.action_code = v.kod);

-- ---------------------------------------------------------------------------
-- 6. Bizonyíték.
-- ---------------------------------------------------------------------------
insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id, v.kod, v.cim, v.leiras, v.formatum, v.kotelezo
from public.aic_compliance_rules r,
(values
 ('DPO_ASSESSMENT_NOTE',
  'A kijelölési vizsgálat feljegyzése',
  'Feljegyzés arról, hogy fennáll-e a kijelölési kötelezettség, és mi alapján. Ha van kijelölés, a kijelölő dokumentum.',
  array['pdf','docx'], true),
 ('DPO_PUBLICATION_PROOF',
  'A közzététel igazolása',
  'A tisztviselő elérhetőségének közzétételét igazoló képernyőkép vagy hivatkozás, és a hatósági bejelentés visszaigazolása.',
  array['pdf','png'], false)
) as v(kod,cim,leiras,formatum,kotelezo)
where r.rule_code = 'GDPR_ART37_39_DPO'
  and not exists (select 1 from public.aic_required_evidence e
                  where e.rule_id = r.id and e.evidence_code = v.kod);

-- ---------------------------------------------------------------------------
-- 7. A lefedettség átáll mindhárom cikknél.
-- ---------------------------------------------------------------------------
update public.aic_provision_coverage c
set proposed_status = 'covered',
    proposed_reason = 'A GDPR_ART37_39_DPO szabály lefedi.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '32016R0679'
  and c.article_number in ('37','38','39');

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select coalesce(proposed_status,'javaslat nélkül') as javaslat, count(*)
from public.aic_provision_coverage group by 1 order by 2 desc;

commit;
