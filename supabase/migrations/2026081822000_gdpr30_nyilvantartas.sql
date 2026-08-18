-- EnergiaAI Kontroll – adatkezelési nyilvántartás (GDPR 30. cikk).
--
-- MIÉRT
-- A törzs egyik legnagyobb hiánya volt: a 30. cikk minden adatkezelőre és
-- adatfeldolgozóra kötelezettséget ró, mégsem tartozott hozzá szabály.
--
-- A 250 FŐS MENTESSÉGRŐL
-- Az (5) bekezdés mentesíti a 250 főnél kisebb szervezeteket, de három
-- kivétellel: ha az adatkezelés nem alkalmi jellegű, ha kockázattal jár az
-- érintettek jogaira, vagy ha különleges adatra terjed ki. MI-eszköznél
-- tipikusan mindhárom megbukik, mert a rendszer folyamatosan fut. Ezért a
-- szabály kimondja: a mentességre a rendszer vonatkozásában nem lehet
-- automatikusan hivatkozni. Enélkül egy kisebb cég tévesen mentesnek hinné magát.
--
-- SZEREPKÖR
-- 'any', mert a kötelezettség az adatkezelőt és az adatfeldolgozót egyaránt
-- terheli, csak eltérő tartalommal. Mindkettőt egy szabály kezeli.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. A jogszabályhely.
-- ---------------------------------------------------------------------------
insert into public.aic_legal_provisions
  (source_id, provision_key, article_number, heading, provision_text,
   text_fidelity, language_code, deep_link)
select s.id, 'GDPR_ART30_RECORDS', '30',
       'Az adatkezelési tevékenységek nyilvántartása',
       'Minden adatkezelő nyilvántartást vezet a felelősségébe tartozóan végzett adatkezelési tevékenységekről: célok, az érintettek és a személyes adatok kategóriái, címzettek, harmadik országba történő továbbítás és garanciái, törlési határidők, valamint a technikai és szervezési intézkedések általános leírása. Az adatfeldolgozó az adatkezelő nevében végzett tevékenységek kategóriáiról vezet nyilvántartást. A nyilvántartást írásban kell vezetni, és a felügyeleti hatóság megkeresésére rendelkezésre kell bocsátani. A 250 főnél kisebb szervezetekre vonatkozó mentesség nem alkalmazható, ha az adatkezelés kockázattal jár, nem alkalmi jellegű, vagy különleges, illetve büntetőjogi adatra terjed ki.',
       'expert_paraphrase', 'hu', 'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_30'
from public.aic_legal_sources s
where s.celex_number = '32016R0679'
  and not exists (select 1 from public.aic_legal_provisions p
                  where p.source_id = s.id and p.provision_key = 'GDPR_ART30_RECORDS');

-- ---------------------------------------------------------------------------
-- 2. A szabály.
-- ---------------------------------------------------------------------------
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review,
   legal_interpretation_note)
select 'GDPR_ART30_PROCESSING_RECORDS',
       'Adatkezelési tevékenységek nyilvántartása',
       'Az MI-eszköz működésével összefüggő adatkezelést fel kell venni az adatkezelési nyilvántartásba, és naprakészen kell tartani.',
       'any', 'documentation', 'AND', 'under_review', true,
       'A 250 fős mentesség megítélése tényállásfüggő. A szabály nem zárja ki a mentességet, hanem azt mondja ki, hogy MI-eszköznél nem lehet rá automatikusan hivatkozni, mert az (5) bekezdés három kivétele közül tipikusan legalább egy fennáll.'
where not exists (select 1 from public.aic_compliance_rules
                  where rule_code = 'GDPR_ART30_PROCESSING_RECORDS');

-- ---------------------------------------------------------------------------
-- 3. A szabályzatba kerülő szöveg.
--    Alkalmazhatóság: nincs iparági vagy eszköztípus szerinti szűkítés, mert
--    ez törzsi szabály. Feltétel: az eszköz kezel személyes adatot.
-- ---------------------------------------------------------------------------
insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'GDPR_PROCESSING_RECORDS',
       'Adatkezelési nyilvántartás',
       'processing_records',
       'legal_requirement',
       'Az MI-eszköz adatkezelését fel kell venni a nyilvántartásba, és változáskor frissíteni kell.',
       'A {{organisation_name}} a {{system_name}} működésével összefüggő adatkezelési tevékenységeiről írásban – ideértve az elektronikus formát is – nyilvántartást vezet. A nyilvántartás tartalmazza az adatkezelés céljait, az érintettek és a személyes adatok kategóriáit, a címzettek kategóriáit, a harmadik országba vagy nemzetközi szervezet részére történő továbbítást és annak garanciáit, a törlésre előirányzott határidőket, valamint a technikai és szervezési intézkedések általános leírását. Ha a {{organisation_name}} más adatkezelő nevében jár el, a nevében végzett adatkezelési tevékenységek kategóriáiról vezet nyilvántartást. A nyilvántartást a felügyeleti hatóság megkeresésére rendelkezésre kell bocsátani. A 250 főnél kisebb szervezetekre vonatkozó mentesség a {{system_name}} vonatkozásában nem alkalmazható, ha az adatkezelés nem alkalmi jellegű, az érintettek jogaira és szabadságaira nézve kockázattal jár, vagy különleges adatok kezelésére terjed ki.',
       r.id,
       '{"required_facts":{"processes_personal_data":true}}'::jsonb,
       40, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code = 'GDPR_ART30_PROCESSING_RECORDS'
  and not exists (select 1 from public.aic_policy_modules where module_code = 'GDPR_PROCESSING_RECORDS');

-- ---------------------------------------------------------------------------
-- 4. Jogalap.
-- ---------------------------------------------------------------------------
insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary'
from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code = 'GDPR_ART30_PROCESSING_RECORDS'
  and p.provision_key = 'GDPR_ART30_RECORDS'
  and not exists (select 1 from public.aic_rule_legal_bases b
                  where b.rule_id = r.id and b.provision_id = p.id);

-- ---------------------------------------------------------------------------
-- 5. Teendők.
-- ---------------------------------------------------------------------------
insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio
from public.aic_compliance_rules r,
(values
 ('ART30_REGISTER_SYSTEM',
  'Az MI-eszköz felvétele a nyilvántartásba',
  'A rendszert önálló adatkezelési tevékenységként vagy egy meglévő tevékenység részeként fel kell venni, a 30. cikk (1) bekezdése szerinti teljes tartalommal. Ha a szervezet más nevében jár el, a (2) bekezdés szerinti tartalommal.',
  'critical'),
 ('ART30_KEEP_CURRENT',
  'A bejegyzés naprakészen tartása',
  'A bejegyzést frissíteni kell, ha változik az adatkezelés célja, a felhasznált modell vagy szolgáltató, a címzettek köre, a harmadik országba történő továbbítás, vagy a tárolási idő.',
  'high'),
 ('ART30_AUTHORITY_READY',
  'Hatósági kiadhatóság',
  'Biztosítani kell, hogy a nyilvántartás megkeresésre észszerű időn belül, olvasható formában kiadható legyen.',
  'medium')
) as v(kod,cim,leiras,prio)
where r.rule_code = 'GDPR_ART30_PROCESSING_RECORDS'
  and not exists (select 1 from public.aic_required_actions a
                  where a.rule_id = r.id and a.action_code = v.kod);

-- ---------------------------------------------------------------------------
-- 6. Bizonyíték.
-- ---------------------------------------------------------------------------
insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id, 'ART30_REGISTER_EXTRACT',
       'Nyilvántartási kivonat',
       'Az adatkezelési nyilvántartás adott rendszerre vonatkozó kivonata, a legutóbbi frissítés dátumával.',
       array['pdf','xlsx','docx'], true
from public.aic_compliance_rules r
where r.rule_code = 'GDPR_ART30_PROCESSING_RECORDS'
  and not exists (select 1 from public.aic_required_evidence e
                  where e.rule_id = r.id and e.evidence_code = 'ART30_REGISTER_EXTRACT');

-- ---------------------------------------------------------------------------
-- 7. A lefedettség átáll.
-- ---------------------------------------------------------------------------
update public.aic_provision_coverage c
set proposed_status = 'covered',
    proposed_reason = 'A GDPR_ART30_PROCESSING_RECORDS szabály lefedi.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '32016R0679' and c.article_number = '30';

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select coalesce(proposed_status,'javaslat nélkül') as javaslat, count(*)
from public.aic_provision_coverage group by 1 order by 2 desc;

commit;
