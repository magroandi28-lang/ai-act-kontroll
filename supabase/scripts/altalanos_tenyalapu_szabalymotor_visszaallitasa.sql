-- EnergiaAI Kontroll: az általános, funkció- és tényalapú szabálymotor visszaállítása.
-- A használati profilok többé nem kényszerítenek funkciókat a rendszerre.

begin;

insert into public.aic_industries(code,name_hu,description_hu,active,sort_order)
values('general','Általános / ágazatfüggetlen','Bármely olyan MI-rendszerhez, amelyhez nincs külön ágazati szabálymodul.',true,1)
on conflict(code) do update set
  name_hu=excluded.name_hu,
  description_hu=excluded.description_hu,
  active=true,
  sort_order=excluded.sort_order,
  updated_at=now();

-- Ágazatfüggetlen, ténylegesen kiválasztható funkciók.
insert into public.aic_capabilities
  (code,name_hu,description_hu,selection_hint_hu,system_type_codes,industry_codes,fact_patch,active,sort_order)
values
  ('NATURAL_PERSON_INTERACTION','Kapcsolattartás természetes személlyel',
   'A rendszer közvetlenül kommunikál természetes személlyel.',
   'Akkor válaszd, ha a felhasználó közvetlenül kérdezhet vagy választ kaphat a rendszertől.',
   '{}','{}','{"interaction_with_natural_person":true,"direct_two_way_interaction":true,"natural_person_exposed":true}',true,200),
  ('PERSONAL_DATA_PROCESSING','Személyes adatok kezelése',
   'A rendszer azonosított vagy azonosítható természetes személy adatait használja.',
   'Akkor válaszd, ha bemenetben, háttérrendszerben, naplóban vagy kimenetben személyes adat szerepel.',
   '{}','{}','{"processes_personal_data":true}',true,210),
  ('CONTENT_GENERATION','Tartalom generálása vagy módosítása',
   'A rendszer új szöveget, képet, hangot, videót vagy más szintetikus tartalmat készít.',
   'Akkor válaszd, ha nem kizárólag keres vagy osztályoz, hanem új tartalmat is előállít.',
   '{}','{}','{"generates_content":true,"generates_synthetic_content":true}',true,220),
  ('DOCUMENT_PROCESSING','Dokumentumok feldolgozása',
   'A rendszer dokumentumot osztályoz, adatot nyer ki, összefoglal vagy ellenőriz.',
   'Akkor válaszd, ha a rendszer iratokkal, szerződésekkel, számlákkal vagy más dokumentumokkal dolgozik.',
   '{}','{}','{"processes_documents":true}',true,230),
  ('DECISION_SUPPORT','Döntéstámogatás',
   'A rendszer kimenete emberi vagy szervezeti döntést érdemben támogat.',
   'Akkor válaszd, ha a kimenetet rangsoroláshoz, jóváhagyáshoz, elutasításhoz vagy más döntéshez használják.',
   '{}','{}','{"materially_influences_decision":true}',true,240),
  ('NATURAL_PERSON_PROFILING','Természetes személy profilozása',
   'A rendszer természetes személy jellemzőit elemzi, értékeli vagy előrejelzi.',
   'Akkor válaszd, ha személyek viselkedését, teljesítményét, érdeklődését vagy kockázatát profilozza.',
   '{}','{}','{"profiles_natural_persons":true}',true,250),
  ('BIOMETRIC_PROCESSING','Biometrikus feldolgozás',
   'A rendszer biometrikus azonosítást, kategorizálást vagy elemzést végez.',
   'Akkor válaszd, ha arcot, hangot, ujjnyomatot vagy más biometrikus jellemzőt használ.',
   '{}','{}','{"annex_iii_biometrics_use_case":true,"annex_iii_listed":true}',true,260),
  ('EMOTION_INFERENCE','Érzelemfelismerés',
   'A rendszer természetes személy érzelmi állapotára következtet.',
   'Akkor válaszd, ha arc, hang, szöveg vagy viselkedés alapján érzelmet próbál meghatározni.',
   '{}','{}','{"infers_natural_person_emotions":true}',true,270),
  ('EMPLOYMENT_DECISION_SUPPORT','Foglalkoztatási döntések támogatása',
   'A rendszer toborzási, kiválasztási, feladatkiosztási vagy munkaviszonyi döntést támogat.',
   'Akkor válaszd, ha jelölteket vagy munkavállalókat értékelnek a kimenetével.',
   '{}','{}','{"annex_iii_employment_use_case":true,"annex_iii_listed":true,"system_is_high_risk":true}',true,280),
  ('CRITICAL_INFRASTRUCTURE_OPERATION','Kritikus infrastruktúra működtetése',
   'A rendszer kritikus infrastruktúra biztonsági elemeként irányítást vagy működtetést támogat.',
   'Akkor válaszd, ha a kimenet közvetlenül befolyásolhat kritikus infrastruktúra-üzemet.',
   '{}','{}','{"is_safety_component_critical_infrastructure_operation":true,"annex_iii_critical_infrastructure":true,"annex_iii_listed":true,"system_is_high_risk":true}',true,290),
  ('ESSENTIAL_SERVICE_ACCESS','Alapvető szolgáltatáshoz való hozzáférés értékelése',
   'A rendszer alapvető köz- vagy magánszolgáltatáshoz való hozzáférést értékel.',
   'Akkor válaszd, ha a kimenet hitelhez, biztosításhoz vagy más alapvető szolgáltatáshoz való hozzáférést befolyásol.',
   '{}','{}','{"annex_iii_essential_services_use_case":true,"annex_iii_listed":true,"system_is_high_risk":true}',true,300),
  ('FORECASTING','Előrejelzés készítése',
   'A rendszer jövőbeli értéket, igényt, termelést, árat vagy eseményt jelez előre.',
   'Akkor válaszd, ha a rendszer idősoros vagy más prediktív előrejelzést készít.',
   '{}','{}','{"performs_forecasting":true}',true,310),
  ('ANOMALY_DETECTION','Anomália vagy hiba felismerése',
   'A rendszer rendellenességet, csalást, hibát vagy szokatlan mintát jelez.',
   'Akkor válaszd, ha eltérések vagy kockázatos események felismerése a cél.',
   '{}','{}','{"performs_anomaly_detection":true}',true,320)
on conflict(code) do update set
  name_hu=excluded.name_hu,
  description_hu=excluded.description_hu,
  selection_hint_hu=excluded.selection_hint_hu,
  system_type_codes=excluded.system_type_codes,
  industry_codes=excluded.industry_codes,
  fact_patch=excluded.fact_patch,
  active=true,
  sort_order=excluded.sort_order,
  updated_at=now();

update public.aic_capabilities
set system_type_codes='{}'::text[],
    fact_patch=fact_patch||'{"generates_synthetic_content":true}'::jsonb,
    updated_at=now()
where code='GENERATIVE_RESPONSES';

-- Közös ténykérdések minden rendszertípushoz. A típus saját kérdései megmaradnak.
with common(question_key,fact_key,question_text_hu,help_text_hu,question_order,show_when) as (
  values
    ('common_eu_scope','eu_scope_connection_exists','Az MI-rendszert az Európai Unióban használják, kínálják, vagy a kimenete az EU-ban fejti ki hatását?',null,101,null::jsonb),
    ('common_personal_data','processes_personal_data','Kezel a rendszer személyes adatot?',null,102,null::jsonb),
    ('common_person_interaction','interaction_with_natural_person','Közvetlenül kommunikál természetes személlyel?',null,103,null::jsonb),
    ('common_ai_obvious','ai_interaction_obvious','A felhasználó számára egyértelmű, hogy MI-rendszerrel kommunikál?',null,104,'{"fact_key":"interaction_with_natural_person","equals":true}'::jsonb),
    ('common_synthetic','generates_synthetic_content','Generál vagy lényegesen módosít szöveget, képet, hangot, videót vagy más tartalmat?',null,105,null::jsonb),
    ('common_decision','materially_influences_decision','A rendszer kimenete érdemben befolyásol természetes személyről vagy szervezeti működésről hozott döntést?',null,106,null::jsonb),
    ('common_profiling','profiles_natural_persons','Profiloz, rangsorol vagy értékel természetes személyeket?',null,107,null::jsonb),
    ('common_external_provider','uses_external_ai_provider','Használ külső MI- vagy felhőszolgáltatót?',null,108,null::jsonb),
    ('common_international_transfer','international_data_transfer','Történik személyesadat-továbbítás az Európai Gazdasági Térségen kívülre?',null,109,'{"fact_key":"processes_personal_data","equals":true}'::jsonb),
    ('common_research','activity_is_research_testing_or_development','Kizárólag forgalomba hozatal vagy üzembe helyezés előtti kutatásra, tesztelésre vagy fejlesztésre használják?',null,110,null::jsonb),
    ('common_real_world_test','testing_in_real_world_conditions','Valós körülmények között tesztelik?',null,111,'{"fact_key":"activity_is_research_testing_or_development","equals":true}'::jsonb),
    ('common_manipulation','uses_subliminal_manipulative_or_deceptive_techniques','Használ tudatalatti, manipulatív vagy megtévesztő technikát a viselkedés befolyásolására?',null,112,null::jsonb),
    ('common_vulnerability','exploits_age_disability_or_social_economic_vulnerability','Használja ki személyek életkorából, fogyatékosságából vagy társadalmi-gazdasági helyzetéből eredő sérülékenységét?',null,113,null::jsonb),
    ('common_social_scoring','evaluates_persons_over_time_from_social_behaviour_or_personal_traits','Értékel személyeket hosszabb időn át társadalmi viselkedésük vagy személyes jellemzőik alapján?',null,114,null::jsonb)
)
insert into public.aic_template_questions(
  id,template_id,question_key,fact_key,question_text_hu,help_text_hu,
  answer_type,answer_options,required,question_order,show_when
)
select gen_random_uuid(),t.id,c.question_key,c.fact_key,c.question_text_hu,c.help_text_hu,
       'boolean',null,true,c.question_order,c.show_when
from public.aic_system_type_templates t
cross join common c
where t.active
  and not exists(
    select 1 from public.aic_template_questions q
    where q.template_id=t.id and q.fact_key=c.fact_key
  );

-- A szerepkörből származtatható tényeket a központi feltételvizsgálat kezeli.
create or replace function public.aic_fact_condition_matches(p_profile jsonb,p_condition jsonb)
returns boolean
language sql
immutable
parallel safe
set search_path=public,pg_temp
as $function$
  select case
    when p_condition->>'fact'='organisation_is_provider'
      and p_condition->>'operator'='is_true'
      then coalesce(p_profile->>'organisation_role','')='provider'
    when p_condition->>'fact'='is_provider_or_importer'
      and p_condition->>'operator'='is_true'
      then coalesce(p_profile->>'organisation_role','') in ('provider','importer')
    when p_condition->>'fact'='uses_ai_system_under_own_authority'
      and p_condition->>'operator'='is_true'
      then coalesce(p_profile->>'organisation_role','')='deployer'
    when p_condition->>'fact'='develops_or_has_ai_system_developed'
      and p_condition->>'operator'='is_true'
      then coalesce(p_profile->>'organisation_role','')='provider'
    when p_condition->>'fact'='makes_ai_system_available_on_eu_market'
      and p_condition->>'operator'='is_true'
      then coalesce(p_profile->>'organisation_role','') in ('provider','importer','distributor')
    else case p_condition->>'operator'
      when 'eq' then p_profile->(p_condition->>'fact')=p_condition->'value'
      when 'neq' then coalesce(p_profile->(p_condition->>'fact')<>p_condition->'value',true)
      when 'exists' then p_profile?(p_condition->>'fact')
      when 'not_exists' then not(p_profile?(p_condition->>'fact'))
      when 'is_true' then p_profile->(p_condition->>'fact')='true'::jsonb
      when 'is_false' then p_profile->(p_condition->>'fact')='false'::jsonb
      when 'in' then coalesce((p_condition->'value') @> jsonb_build_array(p_profile->(p_condition->>'fact')),false)
      when 'contains' then coalesce((p_profile->(p_condition->>'fact')) @> (p_condition->'value'),false)
      else false
    end
  end;
$function$;

create or replace function public.aic_applicability_matches(p_applicability jsonb,p_profile jsonb)
returns boolean
language sql
stable
parallel safe
set search_path=public,pg_temp
as $function$
  select
    case when p_applicability?'system_type_codes'
      then (p_applicability->'system_type_codes')?(p_profile->>'system_type_code') else true end
    and not case when p_applicability?'excluded_system_type_codes'
      then (p_applicability->'excluded_system_type_codes')?(p_profile->>'system_type_code') else false end
    and case when p_applicability?'industry_codes'
      then (p_applicability->'industry_codes')?(p_profile->>'industry') else true end
    and case when p_applicability?'actor_roles'
      then (p_applicability->'actor_roles')?(p_profile->>'organisation_role') else true end
    and case when p_applicability?'required_facts'
      then p_profile @> (p_applicability->'required_facts') else true end
    and not case when p_applicability?'excluded_facts'
      then p_profile @> (p_applicability->'excluded_facts') else false end
    and case when jsonb_typeof(p_applicability->'all')='array'
      then not exists(
        select 1 from jsonb_array_elements(p_applicability->'all') condition
        where not public.aic_fact_condition_matches(p_profile,condition)
      ) else true end
    and case when jsonb_typeof(p_applicability->'any')='array'
      then exists(
        select 1 from jsonb_array_elements(p_applicability->'any') condition
        where public.aic_fact_condition_matches(p_profile,condition)
      ) else true end
    and case when jsonb_typeof(p_applicability->'none')='array'
      then not exists(
        select 1 from jsonb_array_elements(p_applicability->'none') condition
        where public.aic_fact_condition_matches(p_profile,condition)
      ) else true end;
$function$;

-- A 86 már meglévő, feltétellel rendelkező általános szabályból generálható modul.
with rule_data as (
  select r.id,r.rule_code,r.title,r.plain_language_requirement,r.actor_role,
         r.lifecycle_status,r.valid_from,r.valid_to,g.group_operator,
         coalesce(jsonb_agg(
           jsonb_build_object('fact',c.fact_key,'operator',c.comparison_operator,'value',c.expected_value)
           order by c.condition_order
         ) filter(where c.id is not null and c.fact_key<>'organisation_role_matches_rule'),'[]'::jsonb) conditions,
         coalesce((
           select jsonb_agg(distinct type_code)
           from public.aic_policy_modules existing
           cross join lateral jsonb_array_elements_text(existing.applicability->'system_type_codes') type_code
           where existing.rule_id=r.id and existing.module_code not like 'GENERIC_RULE_%'
         ),'[]'::jsonb) excluded_types,
         exists(select 1 from public.aic_rule_legal_bases lb where lb.rule_id=r.id) has_legal_basis
  from public.aic_compliance_rules r
  join public.aic_rule_condition_groups g on g.rule_id=r.id
  left join public.aic_rule_conditions c on c.condition_group_id=g.id
  where r.lifecycle_status in ('approved','under_review')
  group by r.id,g.id
), prepared as (
  select *,
    (case when actor_role<>'any' then jsonb_build_object('actor_roles',jsonb_build_array(actor_role)) else '{}'::jsonb end)
    ||(case when jsonb_array_length(excluded_types)>0 then jsonb_build_object('excluded_system_type_codes',excluded_types) else '{}'::jsonb end)
    ||(case when jsonb_array_length(conditions)>0 then jsonb_build_object(case when group_operator='OR' then 'any' else 'all' end,conditions) else '{}'::jsonb end)
      as applicability_json
  from rule_data
)
insert into public.aic_policy_modules(
  id,module_code,title,section_key,module_kind,summary_text,full_text_template,
  rule_id,applicability,display_order,version,lifecycle_status,valid_from,valid_to
)
select gen_random_uuid(),'GENERIC_RULE_'||rule_code,title,'applicable_requirements',
       case when has_legal_basis then 'legal_requirement' else 'internal_control' end,
       plain_language_requirement,plain_language_requirement,id,applicability_json,
       1000+row_number() over(order by rule_code),1,lifecycle_status,valid_from,valid_to
from prepared
on conflict(module_code) do update set
  title=excluded.title,
  section_key=excluded.section_key,
  module_kind=excluded.module_kind,
  summary_text=excluded.summary_text,
  full_text_template=excluded.full_text_template,
  rule_id=excluded.rule_id,
  applicability=excluded.applicability,
  display_order=excluded.display_order,
  lifecycle_status=excluded.lifecycle_status,
  valid_from=excluded.valid_from,
  valid_to=excluded.valid_to,
  version=public.aic_policy_modules.version+1,
  updated_at=now();

insert into public.aic_policy_modules(
  id,module_code,title,section_key,module_kind,summary_text,full_text_template,
  rule_id,applicability,display_order,version,lifecycle_status
)
values
  (gen_random_uuid(),'GENERIC_AI_PURPOSE_SCOPE','A rendszer célja és határai','governance','internal_control',
   'A rendeltetést, az engedélyezett funkciókat és a tiltott felhasználásokat dokumentálni kell.',
   'A {{system_name}} kizárólag a nyilvántartásban rögzített rendeltetésre és aktív funkciókra használható. Új funkció, új felhasználói kör vagy lényeges működésváltozás előtt ismételt tényfelvétel és szabályzati kiértékelés szükséges.',
   null,'{"required_facts":{"is_ai_system":true}}',5,1,'under_review'),
  (gen_random_uuid(),'GENERIC_AI_ROLES','Szerepek és felelősségek','governance','internal_control',
   'A rendszer tulajdonosát, alkalmazóját, adat- és biztonsági felelőseit ki kell jelölni.',
   'A(z) {{organisation_name}} dokumentáltan kijelöli a {{system_name}} üzleti tulajdonosát, szakmai felelősét, adatvédelmi és információbiztonsági kapcsolattartóját, valamint az emberi felügyeletet végző személyeket.',
   null,'{"required_facts":{"is_ai_system":true}}',6,1,'under_review'),
  (gen_random_uuid(),'GENERIC_AI_CHANGE_MONITORING','Változáskezelés és rendszeres felülvizsgálat','governance','internal_control',
   'Minden lényeges adat-, modell-, funkció- és beszállítóváltozást tesztelni és dokumentálni kell.',
   'A {{system_name}} modelljének, adatforrásának, integrációjának, aktív funkcióinak vagy beszállítójának lényeges változását jóváhagyás, teszt és új szabálykiértékelés előzi meg. A hibákat, incidenseket és javító intézkedéseket visszakereshetően meg kell őrizni.',
   null,'{"required_facts":{"is_ai_system":true}}',7,1,'under_review')
on conflict(module_code) do update set
  title=excluded.title,summary_text=excluded.summary_text,full_text_template=excluded.full_text_template,
  applicability=excluded.applicability,lifecycle_status='under_review',version=public.aic_policy_modules.version+1,updated_at=now();

-- A GDPR-modulok ne csak chatbotokra legyenek alkalmazhatók.
update public.aic_policy_modules
set applicability=applicability-'system_type_codes',updated_at=now(),version=version+1
where module_code in (
  'CHATBOT_DATA_PROTECTION','CHATBOT_LAWFUL_DATA_PROCESSING','CHATBOT_DATA_SECURITY_RETENTION',
  'CHATBOT_DATA_SUBJECT_RIGHTS','CHATBOT_DPIA_SCREENING','CHATBOT_INTERNATIONAL_TRANSFER',
  'CHATBOT_PRIVACY_INCIDENT'
);

-- Generikus létrehozás: a felhasználó rendszertípust és aktív funkciókat választ, nem profilt.
create or replace function public.aic_create_ai_system(
  p_organisation_id uuid,p_name text,p_system_type_id uuid,p_industry_code text,
  p_intended_purpose text,p_description text default null,p_provider_name text default null,
  p_organisation_role text default 'deployer',p_deployment_context text default null,
  p_lifecycle_stage text default 'planned',p_capability_codes text[] default '{}'
) returns uuid
language plpgsql
security invoker
set search_path=public,pg_temp
as $function$
declare
  v_user_id uuid:=auth.uid();
  v_system_id uuid;
  v_type_code text;
  v_default_facts jsonb;
  v_facts jsonb;
  v_selected text[];
  v_capability record;
  v_invalid text[];
  v_dependency_errors text[];
begin
  if v_user_id is null then raise exception 'A rendszer rögzítéséhez bejelentkezés szükséges.'; end if;
  if nullif(btrim(p_name),'') is null then raise exception 'A rendszer neve kötelező.'; end if;
  if nullif(btrim(p_intended_purpose),'') is null then raise exception 'A rendszer rendeltetésének rövid leírása kötelező.'; end if;
  if p_organisation_role not in ('provider','deployer','importer','distributor','authorised_representative') then
    raise exception 'A szervezeti szerepkör érvénytelen.';
  end if;
  if not exists(select 1 from public.aic_organisation_members m
    where m.organisation_id=p_organisation_id and m.user_id=v_user_id
      and m.member_role in ('owner','admin','compliance','editor')) then
    raise exception 'Nincs jogosultságod ehhez a szervezethez MI-rendszert rögzíteni.';
  end if;
  select type_code,coalesce(default_facts,'{}'::jsonb) into v_type_code,v_default_facts
  from public.aic_system_type_templates where id=p_system_type_id and active;
  if not found then raise exception 'A kiválasztott MI-rendszertípus nem elérhető.'; end if;
  if not exists(select 1 from public.aic_industries where code=p_industry_code and active) then
    raise exception 'A kiválasztott iparág nem elérhető.';
  end if;
  select coalesce(array_agg(distinct item.code order by item.code),'{}'::text[]) into v_selected
  from unnest(coalesce(p_capability_codes,'{}'::text[])) as item(code);
  select coalesce(array_agg(item.code order by item.code),'{}'::text[]) into v_invalid
  from unnest(v_selected) as item(code)
  where not exists(select 1 from public.aic_capabilities c where c.code=item.code and c.active
    and (cardinality(c.system_type_codes)=0 or v_type_code=any(c.system_type_codes))
    and (cardinality(c.industry_codes)=0 or p_industry_code=any(c.industry_codes)));
  if cardinality(v_invalid)>0 then raise exception 'Nem használható aktív funkció: %.',array_to_string(v_invalid,', '); end if;
  v_dependency_errors:=public.aic_missing_capability_dependencies(v_selected);
  if cardinality(v_dependency_errors)>0 then
    raise exception 'A kiválasztott funkció kötelező függősége hiányzik: %.',array_to_string(v_dependency_errors,', ');
  end if;
  insert into public.aic_ai_systems(
    organisation_id,name,system_type_id,industry_code,description,intended_purpose,
    provider_name,organisation_role,deployment_context,lifecycle_stage,created_by,updated_by
  ) values(
    p_organisation_id,btrim(regexp_replace(p_name,'\s+',' ','g')),p_system_type_id,p_industry_code,
    nullif(btrim(p_description),''),btrim(p_intended_purpose),nullif(btrim(p_provider_name),''),
    p_organisation_role,nullif(btrim(p_deployment_context),''),p_lifecycle_stage,v_user_id,v_user_id
  ) returning id into v_system_id;
  v_facts:=v_default_facts||jsonb_build_object(
    'system_name',btrim(regexp_replace(p_name,'\s+',' ','g')),
    'system_type_code',v_type_code,'industry',p_industry_code,
    'organisation_role',p_organisation_role,'capability_codes',to_jsonb(v_selected),
    'is_ai_system',true,'persons_operate_or_use_ai_on_behalf',true,
    'ai_compliance_database_in_use',true,'law_enforcement_exception_applies',false,
    'selection_basis','active_capabilities_and_system_facts'
  );
  for v_capability in select code,fact_patch from public.aic_capabilities
    where code=any(v_selected) order by sort_order,code loop
    v_facts:=v_facts||coalesce(v_capability.fact_patch,'{}'::jsonb);
    insert into public.aic_ai_system_capabilities(system_id,capability_code,confirmed_by)
    values(v_system_id,v_capability.code,v_user_id);
  end loop;
  insert into public.aic_system_facts(system_id,facts,completion_status,updated_by)
  values(v_system_id,v_facts,'draft',v_user_id);
  return v_system_id;
end;
$function$;

-- Funkciómódosítás profilcsomag nélkül; csak kompatibilitás és valódi függőség számít.
create or replace function public.aic_update_system_capabilities(
  p_system_id uuid,p_capability_codes text[],p_conditions_confirmed boolean default true
) returns void
language plpgsql
security invoker
set search_path=public,pg_temp
as $function$
declare
  v_user_id uuid:=auth.uid();
  v_system public.aic_ai_systems%rowtype;
  v_type_code text;
  v_selected text[];
  v_before text[];
  v_invalid text[];
  v_dependency_errors text[];
  v_capability_keys text[];
  v_facts jsonb;
  v_capability record;
begin
  if v_user_id is null then raise exception 'A funkciók módosításához bejelentkezés szükséges.'; end if;
  select * into v_system from public.aic_ai_systems where id=p_system_id and inventory_status='active' for update;
  if not found then raise exception 'Az MI-rendszer nem található vagy nem aktív.'; end if;
  if not exists(select 1 from public.aic_organisation_members m
    where m.organisation_id=v_system.organisation_id and m.user_id=v_user_id
      and m.member_role in ('owner','admin','compliance','editor')) then
    raise exception 'Nincs jogosultságod a rendszer módosításához.';
  end if;
  select type_code into v_type_code from public.aic_system_type_templates
  where id=v_system.system_type_id and active;
  if not found then raise exception 'A rendszer típusa nem elérhető.'; end if;
  select coalesce(array_agg(distinct item.code order by item.code),'{}'::text[]) into v_selected
  from unnest(coalesce(p_capability_codes,'{}'::text[])) as item(code);
  select coalesce(array_agg(item.code order by item.code),'{}'::text[]) into v_invalid
  from unnest(v_selected) as item(code)
  where not exists(select 1 from public.aic_capabilities c where c.code=item.code and c.active
    and (cardinality(c.system_type_codes)=0 or v_type_code=any(c.system_type_codes))
    and (cardinality(c.industry_codes)=0 or v_system.industry_code=any(c.industry_codes)));
  if cardinality(v_invalid)>0 then raise exception 'Nem használható aktív funkció: %.',array_to_string(v_invalid,', '); end if;
  v_dependency_errors:=public.aic_missing_capability_dependencies(v_selected);
  if cardinality(v_dependency_errors)>0 then
    raise exception 'A kiválasztott funkció kötelező függősége hiányzik: %.',array_to_string(v_dependency_errors,', ');
  end if;
  select coalesce(array_agg(capability_code order by capability_code),'{}'::text[]) into v_before
  from public.aic_ai_system_capabilities where system_id=p_system_id;
  select coalesce(array_agg(distinct key),'{}'::text[]) into v_capability_keys
  from public.aic_capabilities c cross join lateral jsonb_object_keys(c.fact_patch) key;
  select coalesce(facts,'{}'::jsonb) into v_facts from public.aic_system_facts where system_id=p_system_id;
  v_facts:=(coalesce(v_facts,'{}'::jsonb)-v_capability_keys)||jsonb_build_object(
    'system_name',v_system.name,'system_type_code',v_type_code,'industry',v_system.industry_code,
    'organisation_role',v_system.organisation_role,'capability_codes',to_jsonb(v_selected),
    'selection_basis','active_capabilities_and_system_facts',
    'profile_revalidation_required',false
  );
  delete from public.aic_ai_system_capabilities where system_id=p_system_id;
  for v_capability in select code,fact_patch from public.aic_capabilities
    where code=any(v_selected) order by sort_order,code loop
    v_facts:=v_facts||coalesce(v_capability.fact_patch,'{}'::jsonb);
    insert into public.aic_ai_system_capabilities(system_id,capability_code,confirmed_by)
    values(p_system_id,v_capability.code,v_user_id);
  end loop;
  insert into public.aic_system_facts(system_id,facts,completion_status,updated_by,updated_at)
  values(p_system_id,v_facts,'complete',v_user_id,now())
  on conflict(system_id) do update set facts=excluded.facts,completion_status='complete',updated_by=v_user_id,updated_at=now();
  insert into public.aic_system_change_log(organisation_id,system_id,changed_by,change_type,before_data,after_data)
  values(v_system.organisation_id,p_system_id,v_user_id,'reclassification',
    jsonb_build_object('capability_codes',to_jsonb(v_before),'selection_basis','legacy_profile'),
    jsonb_build_object('capability_codes',to_jsonb(v_selected),'selection_basis','active_capabilities_and_system_facts'));
end;
$function$;

-- A korábbi függvénynév kompatibilitásból megmarad, de már nem használati profilt ellenőriz.
create or replace function public.aic_require_valid_usage_profile(p_ai_system_id uuid)
returns jsonb
language plpgsql
stable
security invoker
set search_path=public,pg_temp
as $function$
declare
  v_system public.aic_ai_systems%rowtype;
  v_type_code text;
  v_facts jsonb;
  v_completion text;
  v_selected text[];
  v_invalid text[];
  v_dependency_errors text[];
begin
  select s.* into v_system
  from public.aic_ai_systems s
  join public.aic_system_type_templates t on t.id=s.system_type_id and t.active
  where s.id=p_ai_system_id and s.inventory_status='active';
  if not found then raise exception 'A szabályzat nem készíthető el: az MI-rendszer nem található, nem aktív vagy nincs rendszertípusa.'; end if;
  select type_code into v_type_code
  from public.aic_system_type_templates
  where id=v_system.system_type_id and active;
  select facts,completion_status into v_facts,v_completion from public.aic_system_facts where system_id=p_ai_system_id;
  if v_facts is null then raise exception 'A szabályzat nem készíthető el, mert a rendszer tényei hiányoznak.'; end if;
  if v_completion<>'complete' then raise exception 'A szabályzat előtt ellenőrizni kell a rendszer alkalmazási adatait.'; end if;
  select coalesce(array_agg(capability_code order by capability_code),'{}'::text[]) into v_selected
  from public.aic_ai_system_capabilities where system_id=p_ai_system_id;
  select coalesce(array_agg(item.code order by item.code),'{}'::text[]) into v_invalid
  from unnest(v_selected) as item(code)
  where not exists(select 1 from public.aic_capabilities c where c.code=item.code and c.active
    and (cardinality(c.system_type_codes)=0 or v_type_code=any(c.system_type_codes))
    and (cardinality(c.industry_codes)=0 or v_system.industry_code=any(c.industry_codes)));
  if cardinality(v_invalid)>0 then raise exception 'A szabályzat nem készíthető el, mert érvénytelen aktív funkció szerepel: %.',array_to_string(v_invalid,', '); end if;
  v_dependency_errors:=public.aic_missing_capability_dependencies(v_selected);
  if cardinality(v_dependency_errors)>0 then
    raise exception 'A szabályzat nem készíthető el, mert funkciófüggőség hiányzik: %.',array_to_string(v_dependency_errors,', ');
  end if;
  return v_facts||jsonb_build_object(
    'system_name',v_system.name,'system_type_code',v_type_code,'industry',coalesce(v_system.industry_code,'general'),
    'organisation_role',coalesce(v_system.organisation_role,'deployer'),'lifecycle_stage',v_system.lifecycle_stage,
    'capability_codes',to_jsonb(v_selected),'facts_validated',true,
    'capability_dependencies_validated',true,'selection_basis','active_capabilities_and_system_facts'
  );
end;
$function$;

-- A régi profilkatalógus kompatibilitási és auditnyomként megmarad.
-- A korábbi profilok átmeneti kompatibilitásként aktívak maradnak. Az új felület
-- nem követeli meg őket, de a már telepített klienssel sem szakítjuk meg a felvitelt.

-- A szintetikus mintarendszerek funkcióadatait egységesítjük.
-- Egyetlen hibás mintafüggőség javítása: mérőállás-fogadáshoz mérési adatkör szükséges.
insert into public.aic_ai_system_capabilities(system_id,capability_code,confirmed_by)
select s.id,'CONSUMPTION_METERING_DATA',s.created_by
from public.aic_ai_systems s
where s.name='Ügyfélszolgálati kombinált chatbot'
  and s.inventory_status='active'
  and exists(select 1 from public.aic_ai_system_capabilities c where c.system_id=s.id and c.capability_code='METER_READING_INTAKE')
  and not exists(select 1 from public.aic_ai_system_capabilities c where c.system_id=s.id and c.capability_code='CONSUMPTION_METERING_DATA')
on conflict(system_id,capability_code) do nothing;

with selected as (
  select s.id,coalesce(array_agg(c.capability_code order by c.capability_code) filter(where c.capability_code is not null),'{}'::text[]) codes
  from public.aic_ai_systems s
  left join public.aic_ai_system_capabilities c on c.system_id=s.id
  where s.inventory_status='active'
  group by s.id
)
update public.aic_system_facts f
set facts=f.facts||jsonb_build_object(
      'capability_codes',to_jsonb(selected.codes),
      'profile_revalidation_required',false,
      'selection_basis','active_capabilities_and_system_facts'
    ),
    completion_status='complete',
    updated_at=now()
from selected
where selected.id=f.system_id;

-- Generikus, atomi tömeges import.
create or replace function public.aic_import_ai_systems(
  p_organisation_id uuid,p_rows jsonb,p_data_confirmed boolean
) returns jsonb
language plpgsql
security invoker
set search_path=public,pg_temp
as $function$
declare
  v_row jsonb;
  v_type_id uuid;
  v_codes text[];
  v_id uuid;
  v_ids jsonb:='[]'::jsonb;
  v_count integer:=0;
begin
  if auth.uid() is null then raise exception 'Az importáláshoz bejelentkezés szükséges.'; end if;
  if p_data_confirmed is distinct from true then raise exception 'Az importadatokat meg kell erősíteni.'; end if;
  if jsonb_typeof(p_rows)<>'array' or jsonb_array_length(p_rows)=0 then raise exception 'Az importálandó adatsorok hiányoznak.'; end if;
  if jsonb_array_length(p_rows)>100 then raise exception 'Egyszerre legfeljebb 100 rendszer importálható.'; end if;
  for v_row in select value from jsonb_array_elements(p_rows) loop
    select id into v_type_id from public.aic_system_type_templates
    where type_code=v_row->>'system_type_code' and active;
    if not found then raise exception 'Ismeretlen rendszertípus: %.',v_row->>'system_type_code'; end if;
    select coalesce(array_agg(value order by value),'{}'::text[]) into v_codes
    from jsonb_array_elements_text(coalesce(v_row->'capability_codes','[]'::jsonb));
    v_id:=public.aic_create_ai_system(
      p_organisation_id,v_row->>'name',v_type_id,coalesce(v_row->>'industry_code','general'),
      v_row->>'intended_purpose',v_row->>'description',v_row->>'provider_name',
      coalesce(v_row->>'organisation_role','deployer'),v_row->>'deployment_context',
      coalesce(v_row->>'lifecycle_stage','planned'),v_codes
    );
    v_ids:=v_ids||jsonb_build_array(v_id);
    v_count:=v_count+1;
  end loop;
  return jsonb_build_object('imported_count',v_count,'system_ids',v_ids);
end;
$function$;

revoke all on function public.aic_import_ai_systems(uuid,jsonb,boolean) from public,anon;
grant execute on function public.aic_import_ai_systems(uuid,jsonb,boolean) to authenticated;

commit;
