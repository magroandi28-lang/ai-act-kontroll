-- EnergiaAI Kontroll – tájékoztatás közvetett adatszerzésnél (GDPR 14. cikk).
--
-- MIÉRT
-- A 13. cikk – amikor az adatot magától az érintettől kapjuk – már lefedett.
-- A 14. cikk, vagyis a közvetett adatszerzés, nem volt az. MI-eszköznél pedig
-- ez a gyakoribb eset: külső adatforrás, megvásárolt vagy nyilvános
-- adatkészlet, csoporton belüli adatátadás, illetve a modell tanításához
-- felhasznált adat.
--
-- KÉT DOLOG, AMI KÖNNYEN KIMARAD
-- Az egyik a forrás megjelölése: a 14. cikk (2) bekezdés f) pontja szerint meg
-- kell mondani, honnan származik az adat, akkor is, ha nyilvánosan hozzáférhető
-- forrásból. A másik a határidő: legkésőbb egy hónap, illetve az első
-- kapcsolatfelvétel.
--
-- A CÉLVÁLTOZÁSRÓL
-- A (4) bekezdés előzetes tájékoztatást ír elő, ha az adatot a megszerzés
-- céljától eltérő célra használják. A modelltanítás mint példa értelmezés:
-- a rendelet nem nevesíti, de tipikus eltérő cél. A szabály jegyzete ezt rögzíti.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

insert into public.aic_legal_provisions
  (source_id, provision_key, article_number, heading, provision_text,
   text_fidelity, language_code, deep_link)
select s.id, 'GDPR_ART14_INDIRECT', '14',
       'Rendelkezésre bocsátandó információk, ha a személyes adatokat nem az érintettől szerezték meg',
       'Ha a személyes adatokat nem az érintettől szerezték meg, az adatkezelő tájékoztatja az érintettet a kilétéről és elérhetőségéről, az adatvédelmi tisztviselő elérhetőségéről, az adatkezelés céljáról és jogalapjáról, az érintett személyes adatok kategóriáiról, a címzettekről, a tárolás időtartamáról, az érintetti jogokról, a felügyeleti hatósághoz fordulás jogáról, valamint arról, hogy az adat milyen forrásból származik, ideértve a nyilvánosan hozzáférhető forrást is. A tájékoztatást a megszerzéstől számított észszerű határidőn, de legkésőbb egy hónapon belül, illetve az érintettel való első kapcsolatfelvételkor kell megadni. Eltérő célú további adatkezelés előtt előzetesen tájékoztatni kell. A tájékoztatás az (5) bekezdésben meghatározott esetekben mellőzhető.',
       'expert_paraphrase', 'hu', 'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_14'
from public.aic_legal_sources s
where s.celex_number = '32016R0679'
  and not exists (select 1 from public.aic_legal_provisions p
                  where p.source_id = s.id and p.provision_key = 'GDPR_ART14_INDIRECT');

insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review,
   legal_interpretation_note)
select 'GDPR_ART14_INDIRECT_COLLECTION',
       'Tájékoztatás, ha az adat nem az érintettől származik',
       'Ha a rendszer nem közvetlenül az érintettől szerzett adatot kezel, tájékoztatni kell az érintettet, meg kell jelölni az adat forrását, és be kell tartani az egy hónapos határidőt.',
       'any', 'transparency', 'AND', 'under_review', true,
       'A modelltanítás mint eltérő cél a (4) bekezdés alkalmazására vonatkozó értelmezés: a rendelet nem nevesíti, de a megszerzés céljától eltérő célnak minősül, ha az adatot eredetileg szolgáltatásnyújtáshoz gyűjtötték. Az (5) bekezdés szerinti mentesülés – különösen az aránytalanul nagy erőfeszítés – megítélése tényállásfüggő, azt a szabály nem dönti el.'
where not exists (select 1 from public.aic_compliance_rules
                  where rule_code = 'GDPR_ART14_INDIRECT_COLLECTION');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'GDPR_INDIRECT_COLLECTION_NOTICE',
       'Tájékoztatás közvetett adatszerzésnél',
       'indirect_collection',
       'legal_requirement',
       'Nem az érintettől szerzett adatnál tájékoztatni kell, meg kell jelölni a forrást, és egy hónapon belül ki kell adni.',
       'Ha a {{system_name}} olyan személyes adatot kezel, amelyet nem közvetlenül az érintettől szereztek meg – így különösen külső adatforrásból, nyilvánosan hozzáférhető forrásból, más társaságtól vagy a modell tanításához felhasznált adatkészletből –, a {{organisation_name}} tájékoztatja az érintettet az adatkezelő kilétéről, az adatkezelés céljáról és jogalapjáról, az érintett személyes adatok kategóriáiról, a címzettekről, a tárolás időtartamáról, az érintetti jogokról, valamint arról, hogy az adat milyen forrásból származik, ideértve azt is, ha nyilvánosan hozzáférhető forrásból. A tájékoztatást az adat megszerzésétől számított észszerű határidőn belül, de legkésőbb egy hónapon belül meg kell adni; ha az adatot az érintettel való kapcsolattartásra használják, legkésőbb az első kapcsolatfelvételkor. Ha az adatot a megszerzés céljától eltérő célra – így a modell tanítására vagy továbbfejlesztésére – kívánják felhasználni, az érintettet erről előzetesen tájékoztatni kell. A tájékoztatás a 14. cikk (5) bekezdésében meghatározott esetekben mellőzhető; a mellőzés indokát dokumentálni kell.',
       r.id,
       '{"required_facts":{"processes_personal_data":true}}'::jsonb,
       50, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code = 'GDPR_ART14_INDIRECT_COLLECTION'
  and not exists (select 1 from public.aic_policy_modules where module_code = 'GDPR_INDIRECT_COLLECTION_NOTICE');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary'
from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code = 'GDPR_ART14_INDIRECT_COLLECTION'
  and p.provision_key = 'GDPR_ART14_INDIRECT'
  and not exists (select 1 from public.aic_rule_legal_bases b
                  where b.rule_id = r.id and b.provision_id = p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio
from public.aic_compliance_rules r,
(values
 ('ART14_SOURCE_INVENTORY',
  'Adatforrások számbavétele',
  'Össze kell írni, mely személyes adatok nem közvetlenül az érintettől származnak, és pontosan honnan: külső szolgáltató, megvásárolt adatkészlet, nyilvános forrás, csoporton belüli átadás, tanítóadat.',
  'critical'),
 ('ART14_NOTICE_DELIVERY',
  'Tájékoztató elkészítése és kiadása',
  'El kell készíteni a 14. cikk szerinti tartalmú tájékoztatót, és ki kell adni a megszerzéstől számított egy hónapon belül, illetve az első kapcsolatfelvételkor.',
  'high'),
 ('ART14_PURPOSE_CHANGE',
  'Előzetes tájékoztatás célváltozáskor',
  'Ha az adatot a megszerzés céljától eltérő célra használnák – például modelltanításra –, az érintettet előzetesen tájékoztatni kell.',
  'high'),
 ('ART14_EXEMPTION_RECORD',
  'A mellőzés indokolása',
  'Ha a tájékoztatás a 14. cikk (5) bekezdése alapján elmarad, az indokot – például az aránytalanul nagy erőfeszítést – írásban rögzíteni kell.',
  'medium')
) as v(kod,cim,leiras,prio)
where r.rule_code = 'GDPR_ART14_INDIRECT_COLLECTION'
  and not exists (select 1 from public.aic_required_actions a
                  where a.rule_id = r.id and a.action_code = v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id, v.kod, v.cim, v.leiras, v.formatum, v.kotelezo
from public.aic_compliance_rules r,
(values
 ('ART14_SOURCE_LIST','Adatforrás-jegyzék',
  'Jegyzék a nem az érintettől származó adatokról, forrás és jogalap megjelölésével.',
  array['xlsx','pdf','csv'], true),
 ('ART14_NOTICE_TEXT','A kiadott tájékoztató',
  'A 14. cikk szerinti tájékoztató szövege és a kiadás módjának igazolása.',
  array['pdf','docx','png'], true)
) as v(kod,cim,leiras,formatum,kotelezo)
where r.rule_code = 'GDPR_ART14_INDIRECT_COLLECTION'
  and not exists (select 1 from public.aic_required_evidence e
                  where e.rule_id = r.id and e.evidence_code = v.kod);

update public.aic_provision_coverage c
set proposed_status = 'covered',
    proposed_reason = 'A GDPR_ART14_INDIRECT_COLLECTION szabály lefedi.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '32016R0679' and c.article_number = '14';

select coalesce(proposed_status,'javaslat nélkül') as javaslat, count(*)
from public.aic_provision_coverage group by 1 order by 2 desc;

commit;
