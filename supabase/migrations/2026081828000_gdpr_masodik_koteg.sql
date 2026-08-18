-- EnergiaAI Kontroll – második köteg: felelősség és kutatási célú adatkezelés.
--
-- MI VAN BENNE
-- 1. Felelősség és kártérítés az MI-láncban – GDPR 82. cikk
-- 2. Kutatási, statisztikai és archiválási cél – GDPR 89. cikk
--
-- MIÉRT EZ A KETTŐ EGYÜTT
-- Mindkettő a lánc végén dől el. A 82. cikk azt mondja meg, ki fizet, ha baj
-- van; a 89. cikk azt, milyen garanciák mellett lehet az adatot továbbhasználni
-- kutatásra vagy statisztikára – ami MI-nél tipikusan a modell fejlesztése.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

insert into public.aic_legal_provisions
  (source_id, provision_key, article_number, heading, provision_text,
   text_fidelity, language_code, deep_link)
select s.id, v.kulcs, v.cikk, v.cim, v.szoveg, 'expert_paraphrase', 'hu',
       'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_' || v.cikk
from public.aic_legal_sources s,
(values
 ('GDPR_ART82_LIABILITY','82','A kártérítéshez való jog és a felelősség',
  'Aki a rendelet megsértésének eredményeként vagyoni vagy nem vagyoni kárt szenvedett, kártérítésre jogosult az adatkezelőtől vagy az adatfeldolgozótól. Az adatkezelő minden olyan kárért felel, amelyet a rendeletet sértő adatkezelés okozott; az adatfeldolgozó akkor, ha nem tartotta be a kifejezetten rá vonatkozó kötelezettségeket, vagy ha az adatkezelő jogszerű utasítását figyelmen kívül hagyta, illetve azzal ellentétesen járt el. Mentesül, aki bizonyítja, hogy a kárt előidéző eseményért semmilyen módon nem felelős. Ha többen érintettek, egyetemlegesen felelnek, és a teljes kártérítést megfizető fél a többiektől megtérítést követelhet.'),
 ('GDPR_ART89_RESEARCH','89','Garanciák kutatási, statisztikai és archiválási célú adatkezeléshez',
  'A közérdekű archiválás, tudományos és történelmi kutatás, valamint statisztikai cél érdekében folytatott adatkezelést az érintett jogait és szabadságait védő megfelelő garanciák mellett kell végezni. A garanciáknak biztosítaniuk kell az adattakarékosság elvének érvényesülését, ideértve az álnevesítést, ha a cél így is elérhető. Ha a cél azonosítást nem igénylő adatkezeléssel is elérhető, azt így kell végezni.')
) as v(kulcs,cikk,cim,szoveg)
where s.celex_number='32016R0679'
  and not exists (select 1 from public.aic_legal_provisions p
                  where p.source_id=s.id and p.provision_key=v.kulcs);

-- ===========================================================================
-- 1. FELELŐSSÉG AZ MI-LÁNCBAN (82.)
--    A cikk nem cselekvési előírás, hanem felelősségi szabály. Szabályt mégis
--    érdemes belőle írni, mert a felelősség megoszlása MI-nél előre eldönthető
--    és dokumentálható: ki felel a modellért, a promptért, a tanítóadatért, az
--    integrációért. Ha ez nincs rendezve, a cég egyetemlegesen felel.
-- ===========================================================================
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review, legal_interpretation_note)
select 'GDPR_ART82_LIABILITY_CHAIN',
       'Felelősség megosztása az MI-láncban',
       'A szerződésben rendezni kell, ki felel a modellért, a tanítóadatért, az integrációért és az utasítások betartásáért, és biztosítani kell, hogy az utasítások bizonyíthatók legyenek.',
       'any', 'documentation', 'AND', 'under_review', true,
       'A 82. cikk felelősségi szabály, nem cselekvési előírás: közvetlenül nem ír elő teendőt a cégnek. A szabály abból indul ki, hogy a felelősség megoszlása előre dokumentálható, és hogy az adatfeldolgozó felelőssége az utasítás betartásához kötött – ezért az utasítások bizonyíthatósága a cég érdeke. Ez értelmezés, nem a cikk szövege.'
where not exists (select 1 from public.aic_compliance_rules where rule_code='GDPR_ART82_LIABILITY_CHAIN');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'GDPR_LIABILITY_CHAIN','Felelősség az MI-láncban','liability','legal_requirement',
       'Rendezni kell, ki miért felel a láncban, és bizonyíthatóvá kell tenni az utasításokat.',
       'A {{organisation_name}} a {{system_name}} üzemeltetésében részt vevő felekkel kötött szerződésben rendezi a felelősség megoszlását, így különösen azt, hogy ki felel a modell működéséért, a tanításhoz felhasznált adatokért, a rendszer integrációjáért, valamint a {{organisation_name}} utasításainak betartásáért. A {{organisation_name}} olyan formában adja ki az adatkezelésre vonatkozó utasításait, hogy azok utóbb bizonyíthatók legyenek. Ha a rendelet megsértéséből kár keletkezik, a {{organisation_name}} és a közreműködő felek egyetemlegesen felelnek az érintettel szemben; a belső megtérítés rendjét a szerződésnek kell rendeznie. A {{organisation_name}} nyilvántartja azokat az eseményeket, amelyek kárigényt alapozhatnak meg, így különösen az adatvédelmi incidenseket és a rendszer hibás vagy jogsértő kimeneteit.',
       r.id, '{"required_facts":{"processes_personal_data":true}}'::jsonb, 80, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code='GDPR_ART82_LIABILITY_CHAIN'
  and not exists (select 1 from public.aic_policy_modules where module_code='GDPR_LIABILITY_CHAIN');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary' from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code='GDPR_ART82_LIABILITY_CHAIN' and p.provision_key='GDPR_ART82_LIABILITY'
  and not exists (select 1 from public.aic_rule_legal_bases b where b.rule_id=r.id and b.provision_id=p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio from public.aic_compliance_rules r,
(values
 ('LIAB_CONTRACT_SPLIT','A felelősség megosztásának rendezése',
  'A szerződésben nevesíteni kell, ki felel a modellért, a tanítóadatért, az integrációért és az utasítások betartásáért, valamint a belső megtérítés rendjét.','high'),
 ('LIAB_INSTRUCTION_TRACE','Az utasítások bizonyíthatósága',
  'Az adatkezelésre vonatkozó utasításokat írásban, visszakereshető formában kell kiadni, mert az adatfeldolgozó felelőssége ezek betartásához kötött.','high'),
 ('LIAB_EVENT_LOG','Kárigényt megalapozó események nyilvántartása',
  'Nyilván kell tartani az adatvédelmi incidenseket és a rendszer hibás vagy jogsértő kimeneteit.','medium')
) as v(kod,cim,leiras,prio)
where r.rule_code='GDPR_ART82_LIABILITY_CHAIN'
  and not exists (select 1 from public.aic_required_actions a where a.rule_id=r.id and a.action_code=v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id,'LIAB_CONTRACT_CLAUSE','A felelősségi kikötés',
       'A szerződés felelősségi és megtérítési rendelkezéseit tartalmazó része.',array['pdf','docx'],true
from public.aic_compliance_rules r
where r.rule_code='GDPR_ART82_LIABILITY_CHAIN'
  and not exists (select 1 from public.aic_required_evidence e where e.rule_id=r.id and e.evidence_code='LIAB_CONTRACT_CLAUSE');

-- ===========================================================================
-- 2. KUTATÁSI ÉS STATISZTIKAI CÉL (89.)
--    MI-nél ez a modell fejlesztésének kérdése. A 89. cikk nem ad szabad
--    utat: garanciákat követel, és kimondja az álnevesítés elsőbbségét, ha a
--    cél így is elérhető. A cikk önmagában nem jogalap – a jogalapot a 6.
--    cikkből kell venni.
-- ===========================================================================
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review, legal_interpretation_note)
select 'GDPR_ART89_RESEARCH_SAFEGUARDS',
       'Garanciák kutatási és statisztikai célú adatkezeléshez',
       'Ha a rendszer adatait modellfejlesztésre, statisztikára vagy kutatásra használják, álnevesítést és adattakarékosságot kell alkalmazni, és a garanciákat dokumentálni kell.',
       'any', 'requirement', 'AND', 'under_review', true,
       'A 89. cikk garanciákat ír elő, de önmagában nem jogalap: az adatkezelés jogalapját a 6. cikkből kell levezetni. A modellfejlesztés tudományos kutatásként vagy statisztikai célként való minősítése tényállásfüggő, és nem automatikus – a szabály ezt nem dönti el, hanem azt írja elő, hogy a minősítést indokolni kell.'
where not exists (select 1 from public.aic_compliance_rules where rule_code='GDPR_ART89_RESEARCH_SAFEGUARDS');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'GDPR_RESEARCH_SAFEGUARDS','Kutatási és statisztikai célú felhasználás','research_safeguards','legal_requirement',
       'Modellfejlesztésnél álnevesítés és adattakarékosság; a minősítést és a garanciákat dokumentálni kell.',
       'Ha a {{organisation_name}} a {{system_name}} működése során keletkezett személyes adatot tudományos kutatás, statisztika vagy közérdekű archiválás céljából kívánja tovább kezelni – ideértve a modell fejlesztését és értékelését, ha az ilyen célnak minősül –, ezt az érintett jogait és szabadságait védő garanciák mellett teszi. A garanciáknak biztosítaniuk kell az adattakarékosság érvényesülését: az adatot álnevesíteni kell, ha a cél így is elérhető, és ha a cél azonosítást nem igénylő adatkezeléssel is elérhető, azt így kell végezni. A {{organisation_name}} írásban rögzíti, hogy az adott felhasználás miért minősül kutatási vagy statisztikai célnak, mi az adatkezelés jogalapja, milyen garanciákat alkalmaz, és ki fér hozzá az adathoz. Ha a felhasználás egyidejűleg más célt is szolgál, a kutatási célra vonatkozó eltérések csak a kutatási célú részre alkalmazhatók.',
       r.id, '{"required_facts":{"processes_personal_data":true}}'::jsonb, 85, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code='GDPR_ART89_RESEARCH_SAFEGUARDS'
  and not exists (select 1 from public.aic_policy_modules where module_code='GDPR_RESEARCH_SAFEGUARDS');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary' from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code='GDPR_ART89_RESEARCH_SAFEGUARDS' and p.provision_key='GDPR_ART89_RESEARCH'
  and not exists (select 1 from public.aic_rule_legal_bases b where b.rule_id=r.id and b.provision_id=p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio from public.aic_compliance_rules r,
(values
 ('RESEARCH_PURPOSE_JUSTIFY','A cél minősítésének indokolása',
  'Írásban rögzíteni kell, miért minősül az adott felhasználás kutatási vagy statisztikai célnak, és mi a jogalapja. A minősítés nem automatikus.','critical'),
 ('RESEARCH_PSEUDONYMISE','Álnevesítés alkalmazása',
  'Az adatot álnevesíteni kell, ha a cél így is elérhető; ha azonosítás nélkül is elérhető, azonosító nélkül kell végezni.','high'),
 ('RESEARCH_ACCESS_CONTROL','Hozzáférés korlátozása',
  'Meg kell határozni, ki fér hozzá a kutatási célra használt adathoz, és ezt naplózni kell.','medium')
) as v(kod,cim,leiras,prio)
where r.rule_code='GDPR_ART89_RESEARCH_SAFEGUARDS'
  and not exists (select 1 from public.aic_required_actions a where a.rule_id=r.id and a.action_code=v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id,'RESEARCH_SAFEGUARD_NOTE','A garanciák leírása',
       'Feljegyzés a cél minősítéséről, a jogalapról, az alkalmazott álnevesítésről és a hozzáférési körről.',array['pdf','docx'],true
from public.aic_compliance_rules r
where r.rule_code='GDPR_ART89_RESEARCH_SAFEGUARDS'
  and not exists (select 1 from public.aic_required_evidence e where e.rule_id=r.id and e.evidence_code='RESEARCH_SAFEGUARD_NOTE');

update public.aic_provision_coverage c
set proposed_status='covered', proposed_reason='A második köteg szabályai lefedik.', updated_at=now()
from public.aic_legal_sources s
where s.id=c.source_id and s.celex_number='32016R0679' and c.article_number in ('82','89');

select coalesce(proposed_status,'javaslat nélkül') as javaslat, count(*)
from public.aic_provision_coverage group by 1 order by 2 desc;

commit;
