-- EnergiaAI Kontroll – kereskedőváltási szabály (273/2007. 26. §).
--
-- MIÉRT
-- Ez volt az energetikai réteg egyetlen hiánya. A 273/2007. 26. § a
-- kereskedőváltásról szól: a régi kereskedő nem tarthatja bent a felhasználót,
-- és ha akadálya van a váltásnak – jellemzően lejárt tartozás –, pontosan meg
-- kell mondania, mi az és hogyan rendezhető. A teljesítés után haladéktalanul
-- vissza kell igazolnia írásban, és be kell jelentenie a hálózati engedélyes
-- felé. A (8) bekezdés szerint a késedelemért kártérítéssel tartozik.
--
-- MI A KOCKÁZAT EGY CHATBOTNÁL
-- Ha rosszul mondja meg a tartozás összegét, vagy azt állítja, hogy a váltás
-- nem indítható, amikor indítható, a cég egyszerre sérti a felhasználó
-- váltási jogát és vállal kártérítési kockázatot.
--
-- EZÉRT A SZABÁLY KÉT DOLGOT KÖT KI
-- Azonosítás nélkül nincs egyedi tájékoztatás, és a visszaigazolás emberi
-- ügyintéző hatásköre marad.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. A jogszabályhely felvétele hivatkozható rendelkezésként.
-- ---------------------------------------------------------------------------
insert into public.aic_legal_provisions
  (source_id, provision_key, article_number, heading, provision_text,
   text_fidelity, language_code, deep_link)
select s.id, 'VHR_26_SUPPLIER_SWITCH', '26',
       'Kereskedőváltás lebonyolítása és visszaigazolása',
       'A villamosenergia-kereskedő részletes tájékoztatást ad a nem teljesített szerződéses feltételekről, így különösen a lejárt tartozásról és rendezésének módjáról. A feltételek teljesítése után haladéktalanul írásban visszaigazol, és bejelentést tesz a hálózati engedélyes felé. A záró mérőállás és az új kereskedő első számlájának kezdő mérőállása azonos. A kereskedőváltással kapcsolatos kötelezettségeit nem teljesítő fél a késedelemből eredő kárt és költséget kamatokkal együtt megtéríti.',
       'expert_paraphrase', 'hu', 'https://njt.hu/jogszabaly/2007-273-20-22#SZ26'
from public.aic_legal_sources s
where s.celex_number = 'NJT-2007-273-20-22'
  and not exists (select 1 from public.aic_legal_provisions p
                  where p.source_id = s.id and p.provision_key = 'VHR_26_SUPPLIER_SWITCH');

-- ---------------------------------------------------------------------------
-- 2. A szabály.
--    Tiltás jellegű: nem azt írja elő, mit tegyen a rendszer, hanem azt, mit
--    nem tehet önállóan. Ez követi a kikapcsolási szabály logikáját.
-- ---------------------------------------------------------------------------
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review,
   legal_interpretation_note)
select 'VET_SUPPLIER_SWITCH_GUARDRAIL',
       'Kereskedőváltás – egyedi tájékoztatás és visszaigazolás',
       'A rendszer kereskedőváltással kapcsolatos egyedi tájékoztatást csak azonosítás után, hiteles háttérrendszeri adat alapján adhat, és a váltást nem igazolhatja vissza.',
       'deployer', 'prohibition', 'AND', 'under_review', true,
       'A 26. § a kereskedőre ró kötelezettséget. Ha a tájékoztatás csatornája automatizált rendszer, a kötelezettség attól nem enyhül: a hibás vagy késleltető válasz a (8) bekezdés szerinti kártérítési felelősséget alapozhat meg.'
where not exists (select 1 from public.aic_compliance_rules
                  where rule_code = 'VET_SUPPLIER_SWITCH_GUARDRAIL');

-- ---------------------------------------------------------------------------
-- 3. A szabályzatba kerülő szöveg.
-- ---------------------------------------------------------------------------
insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'ENERGY_SUPPLIER_SWITCH',
       'Kereskedőváltás kezelése',
       'supplier_switch',
       'legal_requirement',
       'A chatbot kereskedőváltásnál csak azonosítás után adhat egyedi tájékoztatást, és a váltást nem igazolhatja vissza.',
       'A {{organisation_name}} biztosítja, hogy a {{system_name}} kereskedőváltással kapcsolatos egyedi tájékoztatást – így különösen a felmondás szerződéses feltételeiről, a lejárt tartozásról, a záró mérőállásról, a pénzügyi biztosíték összegéről és a váltás határidőiről – kizárólag azonosítás és jogosultság-ellenőrzés után, hiteles háttérrendszeri adat alapján ad. A rendszer nem beszélheti le a felhasználót a váltásról és nem késleltetheti azt. A váltás visszaigazolása és a hálózati engedélyes felé tett bejelentés kizárólag emberi ügyintéző hatásköre; ezekről a rendszer nem tehet a {{organisation_name}}-t kötelező nyilatkozatot. Ha a felhasználó a váltás akadályát jelzi, az ügyet emberi ügyintézőhöz kell továbbítani.',
       r.id,
       '{"industry_codes":["energy"],"system_type_codes":["CUSTOMER_CHATBOT"],"required_facts":{"handles_contract_information":true}}'::jsonb,
       135, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code = 'VET_SUPPLIER_SWITCH_GUARDRAIL'
  and not exists (select 1 from public.aic_policy_modules where module_code = 'ENERGY_SUPPLIER_SWITCH');

-- ---------------------------------------------------------------------------
-- 4. Jogalap.
-- ---------------------------------------------------------------------------
insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary'
from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code = 'VET_SUPPLIER_SWITCH_GUARDRAIL'
  and p.provision_key = 'VHR_26_SUPPLIER_SWITCH'
  and not exists (select 1 from public.aic_rule_legal_bases b
                  where b.rule_id = r.id and b.provision_id = p.id);

-- ---------------------------------------------------------------------------
-- 5. Teendők.
-- ---------------------------------------------------------------------------
insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio
from public.aic_compliance_rules r,
(values
 ('SWITCH_SOURCE_APPROVAL',
  'Kereskedőváltási válaszok forrásának kijelölése',
  'Ki kell jelölni, melyik háttérrendszer adja a tartozásra, a mérőállásra és a váltás állapotára vonatkozó adatot, és jóvá kell hagyni a válaszsablonokat. Sablon nélküli szabad szöveges válasz erre a témára nem engedhető.',
  'critical'),
 ('SWITCH_HUMAN_HANDOFF',
  'Emberi átadás beállítása',
  'A visszaigazolásra és az akadály jelzésére emberi átadást kell beállítani. A rendszer nem zárhatja le az ügyet.',
  'high'),
 ('SWITCH_CASE_LOGGING',
  'Váltási ügyek naplózása',
  'A váltással kapcsolatos megkereséseket, a válasz forrását és az átadás időpontját naplózni kell, hogy egy esetleges késedelem oka utólag kimutatható legyen.',
  'medium')
) as v(kod,cim,leiras,prio)
where r.rule_code = 'VET_SUPPLIER_SWITCH_GUARDRAIL'
  and not exists (select 1 from public.aic_required_actions a
                  where a.rule_id = r.id and a.action_code = v.kod);

-- ---------------------------------------------------------------------------
-- 6. Bizonyíték.
-- ---------------------------------------------------------------------------
insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id, v.kod, v.cim, v.leiras, v.formatum, v.kotelezo
from public.aic_compliance_rules r,
(values
 ('SWITCH_TEMPLATES',
  'Jóváhagyott válaszsablonok',
  'A kereskedőváltásra adott válaszok sablonjai, a forrásrendszer megjelölésével és a jóváhagyás dátumával.',
  array['pdf','docx'], true),
 ('SWITCH_HANDOFF_LOG',
  'Átadási napló',
  'Kivonat a váltási ügyek emberi átadásairól, időbélyeggel.',
  array['csv','xlsx'], true)
) as v(kod,cim,leiras,formatum,kotelezo)
where r.rule_code = 'VET_SUPPLIER_SWITCH_GUARDRAIL'
  and not exists (select 1 from public.aic_required_evidence e
                  where e.rule_id = r.id and e.evidence_code = v.kod);

-- ---------------------------------------------------------------------------
-- 7. A lefedettség átáll: a hiány megszűnt.
-- ---------------------------------------------------------------------------
update public.aic_provision_coverage c
set proposed_status = 'covered',
    proposed_reason = 'A VET_SUPPLIER_SWITCH_GUARDRAIL szabály lefedi.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = 'NJT-2007-273-20-22'
  and c.article_number = '26';

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select r.rule_code, m.module_code, r.actor_role, r.lifecycle_status,
       (select count(*) from public.aic_rule_legal_bases b where b.rule_id = r.id) as jogalap,
       (select count(*) from public.aic_required_actions a where a.rule_id = r.id) as teendo,
       (select count(*) from public.aic_required_evidence e where e.rule_id = r.id) as bizonyitek
from public.aic_compliance_rules r
join public.aic_policy_modules m on m.rule_id = r.id
where r.rule_code = 'VET_SUPPLIER_SWITCH_GUARDRAIL';

select coalesce(proposed_status,'javaslat nélkül') as javaslat, count(*)
from public.aic_provision_coverage group by 1 order by 2 desc;

commit;
