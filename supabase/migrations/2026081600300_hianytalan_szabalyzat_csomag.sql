-- EnergiaAI Kontroll – hiánytalan szabályzat minden MI-rendszerre.
--
-- Ez a csomag azt a célt szolgálja, hogy bármilyen MI-eszközre teljes
-- szabályzat készüljön, ne csak energetikai chatbotra.
--
-- Tartalom:
--   1. GDPR 22. cikk – automatizált döntéshozatal (eddig hiányzott a katalógusból)
--   2. AI Act 73. cikk – incidensjelentés állandó kötelezettséggé alakítása
--   3. AI Act 86. cikk – a döntésmagyarázathoz való jog bekötése
--   4. Négy hiányzó III. mellékletes terület funkcióként
--   5. Munkafolyamat-automatizálás (n8n és hasonlók) mint rendszertípus
--   6. Általános célú MI (GPAI) lefedése
--   7. A meglévő rendszerek tényeinek frissítése
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

-- ===========================================================================
-- 1. GDPR 22. cikk – automatizált döntéshozatal
--
-- Toborzásnál, hitelbírálatnál, biztosítási elbírálásnál központi rendelkezés,
-- de egyáltalán nem szerepelt a jogforrások között.
-- ===========================================================================

insert into public.aic_legal_provisions
  (source_id, provision_key, article_number, heading, provision_text,
   text_fidelity, language_code, valid_from, source_locator)
select s.id, 'gdpr_art_22', '22', 'Automatizált döntéshozatal egyedi ügyekben',
  'Az érintettnek joga van arra, hogy ne terjedjen ki rá az olyan, kizárólag '
  'automatizált adatkezelésen alapuló döntés hatálya, amely rá nézve joghatással '
  'jár vagy őt hasonlóképpen jelentős mértékben érinti. Ha a döntés szerződés '
  'teljesítéséhez szükséges, jogszabály teszi lehetővé, vagy az érintett '
  'kifejezett hozzájárulásán alapul, az adatkezelőnek megfelelő intézkedéseket '
  'kell tennie: biztosítania kell az emberi beavatkozáshoz, az álláspont '
  'kifejtéséhez és a döntés megtámadásához való jogot.',
  'expert_paraphrase', 'hu', '2018-05-25', 'Article 22'
from public.aic_legal_sources s
where s.celex_number = '32016R0679'
on conflict (source_id, provision_key, language_code) do update set
  heading = excluded.heading,
  provision_text = excluded.provision_text,
  source_locator = excluded.source_locator;

insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review,
   legal_interpretation_note)
values
  ('GDPR_ART22_AUTOMATED_DECISION',
   'Automatizált egyedi döntéshozatal korlátai',
   'Ha a rendszer kimenete olyan döntést alapoz meg, amely természetes személyre '
   'joghatással jár vagy őt hasonlóképpen jelentősen érinti, a döntés nem hozható '
   'kizárólag automatizált módon. Biztosítani kell az érdemi emberi beavatkozást, '
   'az érintett álláspontjának kifejtését és a döntés megtámadásának lehetőségét. '
   'A döntés logikájáról érthető tájékoztatást kell adni.',
   'any', 'requirement', 'AND', 'under_review', true,
   'A "kizárólag automatizált" fogalom értelmezése esetfüggő: a formális emberi '
   'jóváhagyás önmagában nem elegendő, érdemi mérlegelés szükséges.')
on conflict (rule_code) do update set
  title = excluded.title,
  plain_language_requirement = excluded.plain_language_requirement,
  legal_interpretation_note = excluded.legal_interpretation_note,
  updated_at = now();

insert into public.aic_rule_condition_groups (rule_id, group_order, group_operator)
select r.id, 1, 'AND' from public.aic_compliance_rules r
where r.rule_code = 'GDPR_ART22_AUTOMATED_DECISION'
on conflict (rule_id, group_order) do nothing;

insert into public.aic_rule_conditions
  (condition_group_id, condition_order, fact_key, comparison_operator, question_text_hu)
select g.id, v.ord, v.fact, 'is_true', v.kerdes
from public.aic_rule_condition_groups g
join public.aic_compliance_rules r on r.id = g.rule_id
cross join (values
  (1, 'processes_personal_data', 'Kezel a rendszer személyes adatot?'),
  (2, 'materially_influences_decision',
      'A kimenet érdemben befolyásol természetes személyre vonatkozó döntést?')
) as v(ord, fact, kerdes)
where r.rule_code = 'GDPR_ART22_AUTOMATED_DECISION' and g.group_order = 1
on conflict (condition_group_id, condition_order) do nothing;

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary'
from public.aic_compliance_rules r
cross join public.aic_legal_provisions p
join public.aic_legal_sources s on s.id = p.source_id
where r.rule_code = 'GDPR_ART22_AUTOMATED_DECISION'
  and s.celex_number = '32016R0679' and p.provision_key = 'gdpr_art_22'
on conflict (rule_id, provision_id) do nothing;

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select
  'GDPR_ART22_AUTOMATED_DECISION',
  'Automatizált egyedi döntéshozatal korlátai',
  'applicable_requirements', 'legal_requirement',
  'A személyt jelentősen érintő döntés nem hozható kizárólag automatizált módon.',
  'A {{system_name}} kimenete nem lehet kizárólagos alapja olyan döntésnek, amely '
  'természetes személyre joghatással jár vagy őt hasonlóképpen jelentősen érinti. '
  'A(z) {{organisation_name}} kijelöli azt a munkakört, amely a döntést érdemi '
  'mérlegeléssel hagyja jóvá vagy bírálja felül. Az érintett kérheti a döntés '
  'felülvizsgálatát, kifejtheti álláspontját, és érthető tájékoztatást kap a '
  'döntés alapjául szolgáló logikáról. A felülvizsgálati kérelmeket és azok '
  'eredményét dokumentálni kell.',
  r.id,
  '{"all": [{"fact": "processes_personal_data", "operator": "is_true", "value": null}, {"fact": "materially_influences_decision", "operator": "is_true", "value": null}]}'::jsonb,
  1500, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code = 'GDPR_ART22_AUTOMATED_DECISION'
on conflict (module_code) do update set
  title = excluded.title,
  summary_text = excluded.summary_text,
  full_text_template = excluded.full_text_template,
  applicability = excluded.applicability,
  rule_id = excluded.rule_id,
  version = public.aic_policy_modules.version + 1,
  updated_at = now();

-- ===========================================================================
-- 2. AI Act 73. cikk – incidensjelentés állandó kötelezettséggé
--
-- A modulok feltétele eddig az volt, hogy a súlyos incidens MÁR bekövetkezett.
-- Egy szabályzatnak viszont épp azt kell tartalmaznia, mi a teendő, HA bekövetkezik.
-- ===========================================================================

delete from public.aic_rule_conditions c
using public.aic_rule_condition_groups g, public.aic_compliance_rules r
where c.condition_group_id = g.id and g.rule_id = r.id
  and r.rule_code in ('ART73_SERIOUS_INCIDENT_REPORTING', 'ART73_EXPEDITED_INCIDENT_ESCALATION')
  and c.fact_key in ('serious_incident_identified', 'incident_requires_expedited_reporting');

update public.aic_policy_modules m
set applicability = jsonb_set(
      m.applicability, '{all}',
      coalesce((
        select jsonb_agg(cond)
        from jsonb_array_elements(m.applicability->'all') cond
        where cond->>'fact' not in ('serious_incident_identified', 'incident_requires_expedited_reporting')
      ), '[]'::jsonb)
    ),
    version = m.version + 1,
    updated_at = now()
where m.module_code in (
  'GENERIC_RULE_ART73_SERIOUS_INCIDENT_REPORTING',
  'GENERIC_RULE_ART73_EXPEDITED_INCIDENT_ESCALATION'
)
and m.applicability ? 'all';

-- ===========================================================================
-- 3-4. Hiányzó III. mellékletes területek és a döntésmagyarázat bekötése
--
-- A 86. cikk szerinti magyarázathoz való jog feltétele az
-- annex_iii_ai_assisted_significant_individual_decision tény, amit eddig
-- semmi nem állított be. Most a funkciók állítják be, plusz kérdés nélkül.
-- ===========================================================================

insert into public.aic_capabilities
  (code, name_hu, description_hu, selection_hint_hu,
   system_type_codes, industry_codes, fact_patch, active, sort_order)
values
  ('EDUCATION_ACCESS_ASSESSMENT', 'Oktatási hozzáférés vagy értékelés',
   'A rendszer oktatási felvételről, besorolásról, értékelésről vagy vizsgafelügyeletről dönt vagy azt támogatja.',
   'Akkor válaszd, ha a kimenet tanulók felvételét, értékelését vagy vizsgáztatását befolyásolja.',
   '{}', '{}',
   '{"annex_iii_education_use_case":true,"annex_iii_listed":true,"system_is_high_risk":true,"annex_iii_ai_assisted_significant_individual_decision":true,"materially_influences_decision":true}',
   true, 330),

  ('JUSTICE_DEMOCRACY_SUPPORT', 'Igazságszolgáltatás vagy demokratikus folyamat támogatása',
   'A rendszer igazságszolgáltatási hatóságot támogat tények vagy jog értelmezésében, vagy választási folyamatot befolyásol.',
   'Akkor válaszd, ha bírósági, ügyészségi döntés-előkészítést vagy választási folyamatot érint.',
   '{}', '{}',
   '{"annex_iii_justice_democracy_use_case":true,"annex_iii_listed":true,"system_is_high_risk":true,"annex_iii_ai_assisted_significant_individual_decision":true,"materially_influences_decision":true}',
   true, 340),

  ('LAW_ENFORCEMENT_SUPPORT', 'Bűnüldözési célú felhasználás',
   'A rendszer bűnüldözési kockázatértékelést, bizonyítékértékelést vagy hasonló feladatot támogat.',
   'Akkor válaszd, ha bűnüldöző szerv használja, vagy a kimenet bűnüldözési döntést alapoz meg.',
   '{}', '{}',
   '{"annex_iii_law_enforcement_use_case":true,"annex_iii_listed":true,"system_is_high_risk":true,"annex_iii_ai_assisted_significant_individual_decision":true,"materially_influences_decision":true}',
   true, 350),

  ('MIGRATION_BORDER_SUPPORT', 'Migrációs, menekültügyi vagy határellenőrzési felhasználás',
   'A rendszer kérelmek elbírálását, kockázatértékelést vagy határellenőrzési feladatot támogat.',
   'Akkor válaszd, ha vízum-, menekültügyi vagy határellenőrzési eljárásban használják.',
   '{}', '{}',
   '{"annex_iii_migration_border_use_case":true,"annex_iii_listed":true,"system_is_high_risk":true,"annex_iii_ai_assisted_significant_individual_decision":true,"materially_influences_decision":true}',
   true, 360),

  ('EXTERNAL_AI_PROVIDER_USE', 'Külső MI-szolgáltató használata',
   'A rendszer külső szolgáltató MI-modelljét vagy API-ját hívja meg a működéséhez.',
   'Akkor válaszd, ha a rendszer nem saját modellt futtat, hanem külső szolgáltatóét (például felhőalapú nyelvi modellt).',
   '{}', '{}',
   '{"uses_external_ai_provider":true}',
   true, 370),

  ('GPAI_MODEL_PROVISION', 'Általános célú MI-modell szolgáltatása',
   'A szervezet általános célú MI-modellt hoz forgalomba vagy helyez üzembe saját néven.',
   'Akkor válaszd, ha a cég maga szolgáltat általános célú modellt. Ha csak használ egyet, ne ezt válaszd, hanem a külső MI-szolgáltató használatát.',
   '{}', '{}',
   '{"model_is_general_purpose_ai":true,"organisation_is_gpai_provider":true}',
   true, 380),

  ('GPAI_SYSTEMIC_RISK', 'Rendszerszintű kockázatú általános célú modell',
   'A szolgáltatott általános célú modell eléri a rendszerszintű kockázat küszöbét.',
   'Akkor válaszd, ha a modell nagy hatóerejű, és a rendszerszintű kockázat feltételei teljesülnek. Csak az általános célú modell szolgáltatása mellett értelmezhető.',
   '{}', '{}',
   '{"gpai_model_has_systemic_risk":true,"gpai_systemic_threshold_reached":true}',
   true, 390)
on conflict (code) do update set
  name_hu = excluded.name_hu,
  description_hu = excluded.description_hu,
  selection_hint_hu = excluded.selection_hint_hu,
  system_type_codes = excluded.system_type_codes,
  industry_codes = excluded.industry_codes,
  fact_patch = excluded.fact_patch,
  active = true,
  sort_order = excluded.sort_order,
  updated_at = now();

-- A GPAI rendszerszintű kockázat csak a modellszolgáltatás mellett értelmes.
insert into public.aic_capability_dependencies (capability_code, requires_capability_code, reason_hu)
values ('GPAI_SYSTEMIC_RISK', 'GPAI_MODEL_PROVISION',
        'Rendszerszintű kockázat csak akkor merül fel, ha a szervezet maga szolgáltatja a modellt.')
on conflict do nothing;

-- A már meglévő, egyedi döntést támogató funkciókhoz is bekötjük a 86. cikk tényét.
update public.aic_capabilities
set fact_patch = fact_patch || '{"annex_iii_ai_assisted_significant_individual_decision":true}'::jsonb,
    updated_at = now()
where code in ('EMPLOYMENT_DECISION_SUPPORT', 'ESSENTIAL_SERVICE_ACCESS');

-- ===========================================================================
-- 5. Munkafolyamat-automatizálás mint rendszertípus
--
-- Az n8n, Make, Power Automate és hasonló eszközökkel épített, MI-t hívó
-- folyamatokra eddig csak az "Egyéb MI-rendszer" típus volt választható.
-- ===========================================================================

insert into public.aic_system_type_templates
  (type_code, name_hu, category, description_hu, typical_examples_hu, default_facts, active, sort_order)
values
  ('WORKFLOW_AUTOMATION_AI', 'Munkafolyamat-automatizálás MI-vel', 'other',
   'Automatizált folyamat, amely egy vagy több lépésében MI-modellt hív meg. A folyamat maga nem MI, de az MI-t használó lépései az AI Act hatálya alá tartoznak.',
   'n8n, Make vagy Power Automate folyamat, amely dokumentumot osztályoz, választ fogalmaz vagy adatot nyer ki.',
   '{"is_ai_system":true}', true, 95)
on conflict (type_code) do update set
  name_hu = excluded.name_hu,
  description_hu = excluded.description_hu,
  typical_examples_hu = excluded.typical_examples_hu,
  active = true,
  updated_at = now();

-- Az új típus is megkapja a közös ténykérdéseket.
with common(question_key, fact_key, question_text_hu, question_order, show_when) as (values
  ('common_eu_scope','eu_scope_connection_exists','Az MI-rendszert az Európai Unióban használják, kínálják, vagy a kimenete az EU-ban fejti ki hatását?',101,null::jsonb),
  ('common_personal_data','processes_personal_data','Kezel a rendszer személyes adatot?',102,null::jsonb),
  ('common_person_interaction','interaction_with_natural_person','Közvetlenül kommunikál természetes személlyel?',103,null::jsonb),
  ('common_ai_obvious','ai_interaction_obvious','A felhasználó számára egyértelmű, hogy MI-rendszerrel kommunikál?',104,'{"fact_key":"interaction_with_natural_person","equals":true}'::jsonb),
  ('common_synthetic','generates_synthetic_content','Generál vagy lényegesen módosít szöveget, képet, hangot, videót vagy más tartalmat?',105,null::jsonb),
  ('common_decision','materially_influences_decision','A rendszer kimenete érdemben befolyásol természetes személyről vagy szervezeti működésről hozott döntést?',106,null::jsonb),
  ('common_profiling','profiles_natural_persons','Profiloz, rangsorol vagy értékel természetes személyeket?',107,null::jsonb),
  ('common_external_provider','uses_external_ai_provider','Használ külső MI- vagy felhőszolgáltatót?',108,null::jsonb),
  ('common_international_transfer','international_data_transfer','Történik személyesadat-továbbítás az Európai Gazdasági Térségen kívülre?',109,'{"fact_key":"processes_personal_data","equals":true}'::jsonb),
  ('common_research','activity_is_research_testing_or_development','Kizárólag forgalomba hozatal vagy üzembe helyezés előtti kutatásra, tesztelésre vagy fejlesztésre használják?',110,null::jsonb),
  ('common_real_world_test','testing_in_real_world_conditions','Valós körülmények között tesztelik?',111,'{"fact_key":"activity_is_research_testing_or_development","equals":true}'::jsonb),
  ('common_manipulation','uses_subliminal_manipulative_or_deceptive_techniques','Használ tudatalatti, manipulatív vagy megtévesztő technikát a viselkedés befolyásolására?',112,null::jsonb),
  ('common_vulnerability','exploits_age_disability_or_social_economic_vulnerability','Használja ki személyek életkorából, fogyatékosságából vagy társadalmi-gazdasági helyzetéből eredő sérülékenységét?',113,null::jsonb),
  ('common_social_scoring','evaluates_persons_over_time_from_social_behaviour_or_personal_traits','Értékel személyeket hosszabb időn át társadalmi viselkedésük vagy személyes jellemzőik alapján?',114,null::jsonb)
)
insert into public.aic_template_questions
  (template_id, question_key, fact_key, question_text_hu, answer_type, required, question_order, show_when)
select t.id, c.question_key, c.fact_key, c.question_text_hu, 'boolean', true, c.question_order, c.show_when
from public.aic_system_type_templates t
cross join common c
where t.active
  and not exists (
    select 1 from public.aic_template_questions q
    where q.template_id = t.id and q.fact_key = c.fact_key
  );

-- ===========================================================================
-- 6. A meglévő rendszerek tényeinek frissítése
--
-- A fact_patch módosítása csak az új mentéseknél hatna, ezért a már rögzített
-- rendszerek tényeit itt egészítjük ki.
-- ===========================================================================

update public.aic_system_facts f
set facts = f.facts || '{"annex_iii_ai_assisted_significant_individual_decision":true}'::jsonb,
    updated_at = now()
where exists (
  select 1 from public.aic_ai_system_capabilities c
  where c.system_id = f.system_id
    and c.capability_code in ('EMPLOYMENT_DECISION_SUPPORT', 'ESSENTIAL_SERVICE_ACCESS')
);

commit;
