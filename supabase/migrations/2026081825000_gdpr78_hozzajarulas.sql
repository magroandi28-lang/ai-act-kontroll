-- EnergiaAI Kontroll – hozzájárulás és a gyermek hozzájárulása (GDPR 7-8. cikk).
--
-- MIÉRT
-- A hozzájárulás a leggyakrabban rosszul használt jogalap. A 7. cikk négy
-- feltételt szab: igazolhatóság, elkülönített és világos kérés, bármikori
-- visszavonhatóság, és önkéntesség. A negyedik a legkényesebb: nem önkéntes a
-- hozzájárulás, ha a szolgáltatást olyan adatkezeléshez kötik, amely a
-- szerződés teljesítéséhez nem szükséges.
--
-- A GYERMEKRŐL
-- A 8. cikk közvetlenül gyermekeknek kínált, információs társadalommal
-- összefüggő szolgáltatásra vonatkozik. Nyilvános chatbotnál ez azért éles,
-- mert a kiskorú felhasználót nem lehet kizárni: aki eléri az oldalt, használni
-- fogja. Magyarország nem szállította le a 16 éves korhatárt, ezért az
-- irányadó.
--
-- EGY ÉRTELMEZÉS
-- A rendelet a "közvetlenül gyermekeknek kínált" szolgáltatásról szól. A szabály
-- ezt kiterjeszti arra az esetre is, amikor a rendszer kiskorúak számára
-- egyszerűen elérhető, mert egy nyilvános ügyfélszolgálati felületnél a kettő
-- gyakorlatilag elválaszthatatlan. Ez értelmezés, a jegyzet rögzíti.
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
 ('GDPR_ART7_CONSENT','7','A hozzájárulás feltételei',
  'Ha az adatkezelés hozzájáruláson alapul, az adatkezelőnek igazolnia kell tudni, hogy az érintett hozzájárult. Ha a hozzájárulást más ügyekre is vonatkozó nyilatkozat keretében adják meg, a kérelmet ezektől egyértelműen megkülönböztethető módon, érthető és könnyen hozzáférhető formában, világos és közérthető nyelven kell előadni. Az érintett a hozzájárulást bármikor visszavonhatja, a visszavonás a korábbi adatkezelés jogszerűségét nem érinti, és a visszavonásnak ugyanolyan egyszerűnek kell lennie, mint a megadásnak. Az önkéntesség megítélésénél figyelembe kell venni, hogy a szerződés teljesítését olyan adatkezeléshez való hozzájáruláshoz kötötték-e, amely ahhoz nem szükséges.'),
 ('GDPR_ART8_CHILD_CONSENT','8','A gyermek hozzájárulása információs társadalommal összefüggő szolgáltatásnál',
  'A közvetlenül gyermekeknek kínált, információs társadalommal összefüggő szolgáltatásnál a hozzájáruláson alapuló adatkezelés akkor jogszerű, ha a gyermek a 16. életévét betöltötte; ez alatt a hozzájárulást a szülői felügyeletet gyakorló adja meg vagy hagyja jóvá. Az adatkezelő az elérhető technológia figyelembevételével észszerű erőfeszítéseket tesz ennek ellenőrzésére.')
) as v(kulcs,cikk,cim,szoveg)
where s.celex_number = '32016R0679'
  and not exists (select 1 from public.aic_legal_provisions p
                  where p.source_id = s.id and p.provision_key = v.kulcs);

insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review,
   legal_interpretation_note)
select 'GDPR_ART7_8_CONSENT',
       'Hozzájárulás feltételei és a gyermek hozzájárulása',
       'Hozzájáruláson alapuló adatkezelésnél a hozzájárulást igazolható módon, elkülönítve és visszavonhatóan kell kérni; 16 év alatti gyermeknél a szülői felügyeletet gyakorló adhatja meg.',
       'any', 'requirement', 'AND', 'under_review', true,
       'A 8. cikk a "közvetlenül gyermekeknek kínált" szolgáltatásra vonatkozik. A szabály ezt kiterjeszti arra is, ha a rendszer kiskorúak számára egyszerűen elérhető: nyilvános ügyfélszolgálati felületnél a kettő nem választható el. Ez értelmezés. A 16 éves korhatár Magyarországon irányadó, mert a tagállami eltérés lehetőségével a jogalkotó nem élt.'
where not exists (select 1 from public.aic_compliance_rules
                  where rule_code = 'GDPR_ART7_8_CONSENT');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'GDPR_CONSENT_CONDITIONS',
       'Hozzájárulás',
       'consent',
       'legal_requirement',
       'A hozzájárulást igazolható módon, elkülönítve és visszavonhatóan kell kérni; kiskorúnál szülői jóváhagyás kell.',
       'Ha a {{system_name}} valamely adatkezelése hozzájáruláson alapul, a {{organisation_name}} igazolható módon rögzíti a hozzájárulás megadásának tényét, idejét és tartalmát. A hozzájárulás kérését más ügyektől egyértelműen megkülönböztethető módon, érthető és könnyen hozzáférhető formában, világos és közérthető nyelven kell előadni. Az érintettet a hozzájárulás megadása előtt tájékoztatni kell arról, hogy azt bármikor, a megadással azonos egyszerűséggel visszavonhatja; a visszavonás nem érinti a visszavonás előtti adatkezelés jogszerűségét. Nem tekinthető önkéntesnek a hozzájárulás, ha a szolgáltatás nyújtását olyan adatkezeléshez való hozzájáruláshoz kötik, amely a szerződés teljesítéséhez nem szükséges. Ha a {{system_name}} közvetlenül gyermekeknek kínált szolgáltatás részeként működik, vagy kiskorúak számára elérhető, a 16. életévét be nem töltött gyermek esetében a hozzájárulást a szülői felügyeletet gyakorló adhatja meg vagy hagyhatja jóvá; a {{organisation_name}} az elérhető technológia figyelembevételével észszerű erőfeszítést tesz ennek ellenőrzésére.',
       r.id,
       '{"required_facts":{"processes_personal_data":true}}'::jsonb,
       55, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code = 'GDPR_ART7_8_CONSENT'
  and not exists (select 1 from public.aic_policy_modules where module_code = 'GDPR_CONSENT_CONDITIONS');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id,
       case when p.provision_key = 'GDPR_ART7_CONSENT' then 'primary' else 'supporting' end
from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code = 'GDPR_ART7_8_CONSENT'
  and p.provision_key in ('GDPR_ART7_CONSENT','GDPR_ART8_CHILD_CONSENT')
  and not exists (select 1 from public.aic_rule_legal_bases b
                  where b.rule_id = r.id and b.provision_id = p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio
from public.aic_compliance_rules r,
(values
 ('CONSENT_IDENTIFY_BASIS',
  'Hozzájáruláson alapuló adatkezelések azonosítása',
  'Meg kell határozni, a rendszer mely adatkezelései alapulnak hozzájáruláson, és melyek más jogalapon. Ahol a szerződés teljesítése vagy jogi kötelezettség a jogalap, ott hozzájárulást kérni félrevezető.',
  'critical'),
 ('CONSENT_RECORD_WITHDRAW',
  'Igazolható rögzítés és visszavonás',
  'Rögzíteni kell a hozzájárulás tényét, idejét és tartalmát, és biztosítani kell, hogy a visszavonás ugyanolyan egyszerű legyen, mint a megadás.',
  'high'),
 ('CONSENT_SEPARATE_WORDING',
  'Elkülönített, világos hozzájárulási szöveg',
  'A hozzájárulás kérését el kell különíteni az általános szerződési feltételektől, és közérthető nyelven kell megfogalmazni.',
  'high'),
 ('CONSENT_MINOR_HANDLING',
  'Kiskorú felhasználók kezelése',
  'Meg kell határozni, hogyan kezeli a rendszer a 16 év alatti felhasználót: életkor bekérése, szülői jóváhagyás, vagy a hozzájáruláson alapuló adatkezelés mellőzése ebben a körben.',
  'high')
) as v(kod,cim,leiras,prio)
where r.rule_code = 'GDPR_ART7_8_CONSENT'
  and not exists (select 1 from public.aic_required_actions a
                  where a.rule_id = r.id and a.action_code = v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id, v.kod, v.cim, v.leiras, v.formatum, v.kotelezo
from public.aic_compliance_rules r,
(values
 ('CONSENT_LOG_SAMPLE','Hozzájárulási napló mintája',
  'Kivonat a hozzájárulások nyilvántartásából: időpont, tartalom, a visszavonás lehetősége.',
  array['csv','xlsx','pdf'], true),
 ('CONSENT_UI_TEXT','A hozzájárulási felület szövege',
  'A felhasználónak megjelenő hozzájárulási szöveg és felület képe.',
  array['pdf','png','docx'], true)
) as v(kod,cim,leiras,formatum,kotelezo)
where r.rule_code = 'GDPR_ART7_8_CONSENT'
  and not exists (select 1 from public.aic_required_evidence e
                  where e.rule_id = r.id and e.evidence_code = v.kod);

update public.aic_provision_coverage c
set proposed_status = 'covered',
    proposed_reason = 'A GDPR_ART7_8_CONSENT szabály lefedi.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '32016R0679'
  and c.article_number in ('7','8');

select coalesce(proposed_status,'javaslat nélkül') as javaslat, count(*)
from public.aic_provision_coverage group by 1 order by 2 desc;

commit;
