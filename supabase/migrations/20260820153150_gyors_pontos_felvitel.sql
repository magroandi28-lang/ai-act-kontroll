-- EnergiaAI Kontroll – Jogtár-alapú, típustól független rendszerfelvitel.
--
-- Forrás: a 149 kész aic_policy_modules.applicability feltétele.
-- A migráció nem ír át szabályzatszöveget. Azt rendezi, milyen rendszeradat
-- szükséges a kész Jogtár-szövegek alkalmazhatóságának eldöntéséhez.

begin;

-- ---------------------------------------------------------------------------
-- 1. A 93 tény felviteli szerepe.
-- ---------------------------------------------------------------------------
alter table public.aic_trigger_catalogue
  add column if not exists intake_mode text,
  add column if not exists parent_trigger_key text,
  add column if not exists onboarding_round smallint,
  add column if not exists ux_group text;

do $constraints$
begin
  if not exists (
    select 1 from pg_constraint
    where conname = 'aic_trigger_catalogue_intake_mode_check'
  ) then
    alter table public.aic_trigger_catalogue
      add constraint aic_trigger_catalogue_intake_mode_check
      check (intake_mode in (
        'function_card', 'function_detail',
        'context_card', 'context_detail', 'role_detail',
        'derived', 'legal_review', 'later_status', 'later_event'
      ));
  end if;

  if not exists (
    select 1 from pg_constraint
    where conname = 'aic_trigger_catalogue_parent_trigger_key_fkey'
  ) then
    alter table public.aic_trigger_catalogue
      add constraint aic_trigger_catalogue_parent_trigger_key_fkey
      foreign key (parent_trigger_key)
      references public.aic_trigger_catalogue(trigger_key);
  end if;

  if not exists (
    select 1 from pg_constraint
    where conname = 'aic_trigger_catalogue_onboarding_round_check'
  ) then
    alter table public.aic_trigger_catalogue
      add constraint aic_trigger_catalogue_onboarding_round_check
      check (onboarding_round is null or onboarding_round in (1, 2));
  end if;
end;
$constraints$;

create index if not exists aic_trigger_catalogue_intake_mode_idx
  on public.aic_trigger_catalogue (intake_mode, onboarding_round, display_order);

comment on column public.aic_trigger_catalogue.intake_mode is
  'A tény felviteli forrása. Elválasztja a funkciókártyát, feltételes részletet, levezetett tényt, jogi felülvizsgálatot és a későbbi eseményt/állapotot.';
comment on column public.aic_trigger_catalogue.parent_trigger_key is
  'Feltételes részlet esetén annak a funkciókártyának a kulcsa, amelyen a részlet megjelenik.';
comment on column public.aic_trigger_catalogue.onboarding_round is
  '1 = alapműködés; 2 = érzékeny és kiemelt használat. Nem jogi kategória.';
comment on column public.aic_trigger_catalogue.ux_group is
  'Kizárólag felületi rendezés; nem vesz részt a Jogtár-szövegek kiválasztásában.';

update public.aic_trigger_catalogue
set intake_mode = case
      when derived then 'derived'
      when category = 'funkcio' then 'function_card'
      when category = 'kornyezet' then 'context_card'
      when category = 'jogi_minosites' then 'legal_review'
      when category = 'dokumentacio' then 'later_status'
      when category = 'esemeny' then 'later_event'
      when category = 'szerepkor' then 'role_detail'
      when category = 'besorolas' then 'derived'
    end,
    parent_trigger_key = null,
    onboarding_round = null,
    ux_group = null;

update public.aic_trigger_catalogue
set intake_mode = 'derived',
    derivation_note = 'Szervezeti fiókban automatikusan hamis; személyes használathoz nem szervezeti szabályzat készül.'
where trigger_key = 'PERSONAL_NON_PROFESSIONAL_USE';

update public.aic_trigger_catalogue
set intake_mode = 'function_detail',
    parent_trigger_key = case
      when trigger_key in ('SYNTHETIC_CONTENT_TYPE','CSAM_CAPABILITY','CONTENT_IS_DEEPFAKE')
        then 'GENERATES_SYNTHETIC_CONTENT'
      else 'PROCESSES_PERSONAL_DATA'
    end,
    onboarding_round = 1,
    ux_group = 'content_data'
where trigger_key in (
  'SYNTHETIC_CONTENT_TYPE', 'CSAM_CAPABILITY', 'CONTENT_IS_DEEPFAKE',
  'SPECIAL_CATEGORY_DATA', 'CRIMINAL_DATA',
  'INDIRECT_DATA_COLLECTION', 'INTERNATIONAL_TRANSFER'
);

update public.aic_trigger_catalogue
set intake_mode = 'context_detail',
    parent_trigger_key = case trigger_key
      when 'CONTEXT_WORKPLACE_EDUCATION' then 'EMOTION_RECOGNITION'
      when 'PUBLIC_SPACE_LAW_ENFORCEMENT' then 'REALTIME_REMOTE_BIOMETRIC_ID'
      when 'PUBLISHED_PUBLIC_INTEREST_TEXT' then 'GENERATES_SYNTHETIC_CONTENT'
      when 'ACCESSIBLE_TO_MINORS' then 'PROCESSES_PERSONAL_DATA'
    end,
    onboarding_round = case
      when trigger_key in ('CONTEXT_WORKPLACE_EDUCATION','PUBLIC_SPACE_LAW_ENFORCEMENT') then 2
      else 1
    end,
    ux_group = case
      when trigger_key in ('CONTEXT_WORKPLACE_EDUCATION','PUBLIC_SPACE_LAW_ENFORCEMENT') then 'sensitive'
      else 'content_data'
    end
where trigger_key in (
  'CONTEXT_WORKPLACE_EDUCATION', 'PUBLIC_SPACE_LAW_ENFORCEMENT',
  'PUBLISHED_PUBLIC_INTEREST_TEXT', 'ACCESSIBLE_TO_MINORS'
);

update public.aic_trigger_catalogue
set intake_mode = 'role_detail', onboarding_round = 1, ux_group = 'role'
where trigger_key in ('REAL_WORLD_TESTING', 'BECOMES_PROVIDER');

update public.aic_trigger_catalogue
set onboarding_round = 1,
    ux_group = case
      when trigger_key in (
        'DIRECT_HUMAN_INTERACTION','CASE_INTAKE_HANDLING','OPERATES_CUSTOMER_SERVICE',
        'ENERGY_CUSTOMER_MATTERS','COMMERCIAL_PRACTICE','DATA_DISCLOSURE_ON_REQUEST'
      ) then 'contact'
      when trigger_key in ('GENERATES_SYNTHETIC_CONTENT','PROCESSES_PERSONAL_DATA')
        then 'content_data'
      when trigger_key in (
        'PROFILES_NATURAL_PERSONS','AUTOMATED_DECISION','SOCIAL_SCORING',
        'CRIMINAL_RISK_PREDICTION','ANALYTICS_OR_TARGETING'
      ) then 'decision'
      else 'development'
    end
where intake_mode = 'function_card'
  and trigger_key in (
    'DIRECT_HUMAN_INTERACTION','CASE_INTAKE_HANDLING','OPERATES_CUSTOMER_SERVICE',
    'ENERGY_CUSTOMER_MATTERS','COMMERCIAL_PRACTICE','DATA_DISCLOSURE_ON_REQUEST',
    'GENERATES_SYNTHETIC_CONTENT','PROCESSES_PERSONAL_DATA',
    'PROFILES_NATURAL_PERSONS','AUTOMATED_DECISION','SOCIAL_SCORING',
    'CRIMINAL_RISK_PREDICTION','ANALYTICS_OR_TARGETING',
    'ANNEX_I_PRODUCT','USES_EXTERNAL_PROVIDER','SMART_METERING_DATA',
    'TRAINS_OR_FINETUNES_MODEL','CONTINUOUS_LEARNING'
  );

update public.aic_trigger_catalogue
set onboarding_round = 2, ux_group = 'sensitive'
where intake_mode = 'function_card'
  and trigger_key in (
    'SUBLIMINAL_MANIPULATION','EXPLOITS_VULNERABILITY','FACE_SCRAPING',
    'EMOTION_RECOGNITION','BIOMETRIC_CATEGORISATION','REALTIME_REMOTE_BIOMETRIC_ID'
  );

update public.aic_trigger_catalogue
set onboarding_round = 2, ux_group = 'high_risk_use'
where intake_mode = 'context_card'
  and trigger_key in (
    'USE_CRITICAL_INFRASTRUCTURE','USE_EDUCATION','USE_EMPLOYMENT',
    'USE_ESSENTIAL_SERVICES','USE_LAW_ENFORCEMENT',
    'USE_MIGRATION_BORDER','USE_JUSTICE_DEMOCRACY'
  );

-- ---------------------------------------------------------------------------
-- 2. Háromállapotú feltételértékelés és tömbértékek.
-- ---------------------------------------------------------------------------
create or replace function public.aic_fact_condition_state(
  p_profile jsonb,
  p_condition jsonb
) returns boolean
language plpgsql
immutable
parallel safe
set search_path = public, pg_temp
as $function$
declare
  v_fact text := p_condition->>'fact';
  v_operator text := p_condition->>'operator';
  v_value jsonb;
begin
  if v_fact is null or v_operator is null then return false; end if;
  if v_operator = 'exists' then return p_profile ? v_fact; end if;
  if v_operator = 'not_exists' then return not (p_profile ? v_fact); end if;
  if not (p_profile ? v_fact) or p_profile->v_fact = 'null'::jsonb then return null; end if;

  v_value := p_profile->v_fact;
  return case v_operator
    when 'eq' then v_value = p_condition->'value'
    when 'equals' then v_value = p_condition->'value'
    when 'neq' then v_value <> p_condition->'value'
    when 'is_true' then v_value = 'true'::jsonb
    when 'is_false' then v_value = 'false'::jsonb
    when 'in' then
      case
        when jsonb_typeof(v_value) = 'array' then exists (
          select 1 from jsonb_array_elements(v_value) profile_item
          where coalesce(p_condition->'value','[]'::jsonb) @> jsonb_build_array(profile_item)
        )
        else coalesce(p_condition->'value','[]'::jsonb) @> jsonb_build_array(v_value)
      end
    when 'contains' then v_value @> coalesce(p_condition->'value','null'::jsonb)
    else false
  end;
end;
$function$;

create or replace function public.aic_fact_condition_matches(
  p_profile jsonb,
  p_condition jsonb
) returns boolean
language sql
immutable
parallel safe
set search_path = public, pg_temp
as $function$
  select coalesce(public.aic_fact_condition_state(p_profile, p_condition), false);
$function$;

create or replace function public.aic_applicability_state(
  p_applicability jsonb,
  p_profile jsonb
) returns text
language plpgsql
stable
parallel safe
set search_path = public, pg_temp
as $function$
declare
  v_condition jsonb;
  v_key text;
  v_expected jsonb;
  v_state boolean;
  v_unknown boolean := false;
  v_any_true boolean;
  v_any_unknown boolean;
  v_roles jsonb := case
    when jsonb_typeof(p_profile->'organisation_roles') = 'array'
      then p_profile->'organisation_roles'
    else jsonb_build_array(coalesce(p_profile->>'organisation_role','unknown'))
  end;
begin
  p_applicability := coalesce(p_applicability, '{}'::jsonb);
  p_profile := coalesce(p_profile, '{}'::jsonb);

  if jsonb_typeof(p_applicability->'system_type_codes') = 'array'
     and jsonb_array_length(p_applicability->'system_type_codes') > 0 then
    if nullif(p_profile->>'system_type_code','') is null then
      v_unknown := true;
    elsif not ((p_applicability->'system_type_codes') ? (p_profile->>'system_type_code')) then
      return 'not_applicable';
    end if;
  end if;

  if jsonb_typeof(p_applicability->'excluded_system_type_codes') = 'array'
     and jsonb_array_length(p_applicability->'excluded_system_type_codes') > 0
     and nullif(p_profile->>'system_type_code','') is not null
     and (p_applicability->'excluded_system_type_codes') ? (p_profile->>'system_type_code') then
    return 'not_applicable';
  end if;

  if jsonb_typeof(p_applicability->'industry_codes') = 'array'
     and jsonb_array_length(p_applicability->'industry_codes') > 0 then
    if nullif(p_profile->>'industry','') is null then
      v_unknown := true;
    elsif not ((p_applicability->'industry_codes') ? (p_profile->>'industry')) then
      return 'not_applicable';
    end if;
  end if;

  if jsonb_typeof(p_applicability->'actor_roles') = 'array'
     and jsonb_array_length(p_applicability->'actor_roles') > 0
     and not exists (
       select 1 from jsonb_array_elements_text(v_roles) role_item
       where (p_applicability->'actor_roles') ? role_item
     ) then
    return 'not_applicable';
  end if;

  for v_key, v_expected in
    select key, value from jsonb_each(coalesce(p_applicability->'required_facts','{}'::jsonb))
  loop
    if not (p_profile ? v_key) or p_profile->v_key = 'null'::jsonb then
      v_unknown := true;
    elsif p_profile->v_key <> v_expected then
      return 'not_applicable';
    end if;
  end loop;

  for v_key, v_expected in
    select key, value from jsonb_each(coalesce(p_applicability->'excluded_facts','{}'::jsonb))
  loop
    if not (p_profile ? v_key) or p_profile->v_key = 'null'::jsonb then
      v_unknown := true;
    elsif p_profile->v_key = v_expected then
      return 'not_applicable';
    end if;
  end loop;

  if jsonb_typeof(p_applicability->'all') = 'array'
     and jsonb_array_length(p_applicability->'all') > 0 then
    for v_condition in select value from jsonb_array_elements(p_applicability->'all') loop
      v_state := public.aic_fact_condition_state(p_profile, v_condition);
      if v_state is false then return 'not_applicable'; end if;
      if v_state is null then v_unknown := true; end if;
    end loop;
  end if;

  if jsonb_typeof(p_applicability->'any') = 'array'
     and jsonb_array_length(p_applicability->'any') > 0 then
    v_any_true := false;
    v_any_unknown := false;
    for v_condition in select value from jsonb_array_elements(p_applicability->'any') loop
      v_state := public.aic_fact_condition_state(p_profile, v_condition);
      if v_state is true then v_any_true := true; end if;
      if v_state is null then v_any_unknown := true; end if;
    end loop;
    if not v_any_true and not v_any_unknown then return 'not_applicable'; end if;
    if not v_any_true and v_any_unknown then v_unknown := true; end if;
  end if;

  if jsonb_typeof(p_applicability->'none') = 'array'
     and jsonb_array_length(p_applicability->'none') > 0 then
    for v_condition in select value from jsonb_array_elements(p_applicability->'none') loop
      v_state := public.aic_fact_condition_state(p_profile, v_condition);
      if v_state is true then return 'not_applicable'; end if;
      if v_state is null then v_unknown := true; end if;
    end loop;
  end if;

  return case when v_unknown then 'needs_data' else 'applicable' end;
end;
$function$;

create or replace function public.aic_applicability_matches(
  p_applicability jsonb,
  p_profile jsonb
) returns boolean
language sql
stable
parallel safe
set search_path = public, pg_temp
as $function$
  select public.aic_applicability_state(p_applicability, p_profile) = 'applicable';
$function$;

comment on function public.aic_applicability_state(jsonb, jsonb) is
  'Háromállapotú Jogtár-illesztés: applicable, not_applicable vagy needs_data. A hiányzó adat nem minősül nemleges válasznak.';

-- ---------------------------------------------------------------------------
-- 3. A feltárt hibás modulkapcsolatok javítása.
-- ---------------------------------------------------------------------------
update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"CASE_INTAKE_HANDLING","operator":"is_true"},{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["complaint"]}]}'::jsonb
where module_code = 'CHATBOT_COMPLAINT_PROCESS';

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"neq","value":[]}]}'::jsonb
where module_code in ('ENERGY_ACCOUNT_DATA_TRACEABILITY','ENERGY_CONTROLLED_INFORMATION');

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"any":[{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["billing"]},{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["metering"]}]}'::jsonb
where module_code = 'ENERGY_BILLING_METERING';

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["disconnection"]}]}'::jsonb
where module_code = 'ENERGY_DISCONNECTION_RECONNECTION';

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"CASE_INTAKE_HANDLING","operator":"is_true"},{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["metering"]}]}'::jsonb
where module_code = 'ENERGY_METER_READING_INTAKE';

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["switching"]}]}'::jsonb
where module_code = 'ENERGY_SUPPLIER_SWITCH';

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["vulnerable"]},{"fact":"SUBJECT_TO_ACCESSIBILITY","operator":"is_true"}]}'::jsonb
where module_code = 'ENERGY_VULNERABLE_ACCESSIBLE_HANDOFF';

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["vulnerable"]},{"fact":"SPECIAL_CATEGORY_DATA","operator":"is_true"}]}'::jsonb
where module_code = 'ENERGY_VULNERABLE_CUSTOMER';

update public.aic_policy_modules
set applicability = applicability - 'any'
where module_code in ('IMPORTER_VERIFICATION_PROCESS','DISTRIBUTOR_VERIFICATION_PROCESS');

-- ---------------------------------------------------------------------------
-- 4. Közös, típustól független előnézeti profil.
-- ---------------------------------------------------------------------------
create or replace function public.aic_felviteli_profil_v2(
  p_organisation_id uuid,
  p_iparag text,
  p_szerepkorok text[],
  p_valaszok jsonb default '{}'::jsonb
) returns jsonb
language plpgsql
stable
security invoker
set search_path = public, pg_temp
as $function$
declare
  v_szerepkorok text[] := coalesce(p_szerepkorok, '{}'::text[]);
  v_elso_szerep text;
  v_profil jsonb;
begin
  if cardinality(v_szerepkorok) = 0 then
    raise exception 'Legalább egy szervezeti szerepkört meg kell adni.';
  end if;
  if not v_szerepkorok <@ array[
    'deployer','provider','importer','distributor','authorised_representative'
  ]::text[] then
    raise exception 'Ismeretlen szervezeti szerepkör.';
  end if;

  if coalesce((p_valaszok->>'BECOMES_PROVIDER')::boolean, false)
     and not ('provider' = any(v_szerepkorok)) then
    v_szerepkorok := array_append(v_szerepkorok, 'provider');
  end if;
  v_elso_szerep := v_szerepkorok[1];

  v_profil := public.aic_szervezeti_tenyek(p_organisation_id, v_elso_szerep)
    || jsonb_build_object(
      'system_type_code', 'OTHER_AI',
      'industry', p_iparag,
      'declared_organisation_roles', to_jsonb(coalesce(p_szerepkorok,'{}'::text[])),
      'organisation_roles', to_jsonb(v_szerepkorok),
      'organisation_role', v_elso_szerep,
      'IS_AI_SYSTEM', true,
      'is_ai_system', true,
      'PERSONAL_NON_PROFESSIONAL_USE', false,
      'use_is_purely_personal_non_professional', false,
      'purpose_exclusively_military_defence_or_national_security', false,
      'persons_operate_or_use_ai_on_behalf', true,
      'ai_compliance_database_in_use', true,
      'ELECTRONIC_SERVICE_PROVIDER', true,
      'EVENT_PROHIBITED_PRACTICE_SUSPECTED', false,
      'EVENT_INFRINGEMENT_SUSPECTED', false,
      'EVENT_OPERATOR_NONCOMPLIANCE', false,
      'EVENT_GPAI_NONCOMPLIANCE', false,
      'EVENT_MISLEADING_AUTHORITY_INFO', false,
      'EVENT_SIGNIFICANT_RISK', false,
      'SUSPECTED_NONCONFORMITY', false
    )
    || coalesce(p_valaszok,'{}'::jsonb)
    || jsonb_build_object(
      'organisation_roles', to_jsonb(v_szerepkorok),
      'organisation_role', v_elso_szerep,
      'organisation_is_provider', v_szerepkorok && array['provider'],
      'uses_ai_system_under_own_authority', v_szerepkorok && array['deployer'],
      'is_provider_or_importer', v_szerepkorok && array['provider','importer'],
      'develops_or_has_ai_system_developed', v_szerepkorok && array['provider'],
      'places_on_market_or_puts_into_service_under_own_name', v_szerepkorok && array['provider'],
      'makes_ai_system_available_on_eu_market', v_szerepkorok && array['provider','importer','distributor'],
      'ORG_IS_PROVIDER', v_szerepkorok && array['provider'],
      'ORG_IS_DEPLOYER', v_szerepkorok && array['deployer'],
      'ORG_IS_IMPORTER_DISTRIBUTOR', v_szerepkorok && array['importer','distributor']
    );

  v_profil := public.aic_tenylap_nevfeloldas(v_profil);
  v_profil := public.aic_nagy_kockazatu(v_profil) || v_profil;
  return public.aic_tenylap_nevfeloldas(v_profil);
end;
$function$;

create or replace function public.aic_applicability_fact_keys(p_applicability jsonb)
returns table(fact_key text)
language sql
stable
set search_path = public, pg_temp
as $function$
  select distinct key
  from (
    select key from jsonb_each(coalesce(p_applicability->'required_facts','{}'::jsonb))
    union all
    select key from jsonb_each(coalesce(p_applicability->'excluded_facts','{}'::jsonb))
    union all
    select item->>'fact' from jsonb_array_elements(coalesce(p_applicability->'all','[]'::jsonb)) item where item ? 'fact'
    union all
    select item->>'fact' from jsonb_array_elements(coalesce(p_applicability->'any','[]'::jsonb)) item where item ? 'fact'
    union all
    select item->>'fact' from jsonb_array_elements(coalesce(p_applicability->'none','[]'::jsonb)) item where item ? 'fact'
  ) facts(key)
  where key is not null;
$function$;

create or replace function public.aic_felviteli_hianyok_v2(p_profile jsonb)
returns jsonb
language sql
stable
set search_path = public, pg_temp
as $function$
  with visible_inputs as (
    select c.*
    from public.aic_trigger_catalogue c
    where c.intake_mode in (
      'function_card','function_detail','context_card','context_detail','role_detail'
    )
      and (c.ask_only_if is null
        or public.aic_applicability_state(c.ask_only_if, p_profile) = 'applicable')
  ), missing_inputs as (
    select c.trigger_key, c.name_hu, c.intake_mode
    from visible_inputs c
    where not (p_profile ? c.trigger_key)
       or p_profile->c.trigger_key = 'null'::jsonb
       or case
            when c.valasz_lehetosegek is not null then
              jsonb_typeof(p_profile->c.trigger_key) is distinct from 'array'
              or (c.intake_mode in ('function_detail','context_detail')
                and jsonb_typeof(p_profile->c.trigger_key) = 'array'
                and jsonb_array_length(p_profile->c.trigger_key) = 0)
            else jsonb_typeof(p_profile->c.trigger_key) is distinct from 'boolean'
          end
  ), review_missing as (
    select distinct c.trigger_key, c.name_hu
    from public.aic_policy_modules m
    cross join lateral public.aic_applicability_fact_keys(m.applicability) f
    join public.aic_trigger_catalogue c on c.trigger_key = f.fact_key
    where m.lifecycle_status in ('approved','under_review')
      and public.aic_applicability_state(m.applicability, p_profile) = 'needs_data'
      and c.intake_mode = 'legal_review'
      and (not (p_profile ? c.trigger_key) or p_profile->c.trigger_key = 'null'::jsonb)
      and not exists (select 1 from missing_inputs)
  ), internal_missing as (
    select distinct c.trigger_key, c.name_hu
    from public.aic_policy_modules m
    cross join lateral public.aic_applicability_fact_keys(m.applicability) f
    join public.aic_trigger_catalogue c on c.trigger_key = f.fact_key
    where m.lifecycle_status in ('approved','under_review')
      and public.aic_applicability_state(m.applicability, p_profile) = 'needs_data'
      and c.intake_mode = 'derived'
      and (not (p_profile ? c.trigger_key) or p_profile->c.trigger_key = 'null'::jsonb)
      and not exists (select 1 from missing_inputs)
  )
  select jsonb_build_object(
    'cards', coalesce((select jsonb_agg(jsonb_build_object(
      'key', trigger_key, 'label', name_hu, 'mode', intake_mode
    ) order by trigger_key) from missing_inputs), '[]'::jsonb),
    'legal_review', coalesce((select jsonb_agg(jsonb_build_object(
      'key', trigger_key, 'label', name_hu
    ) order by trigger_key) from review_missing), '[]'::jsonb),
    'internal', coalesce((select jsonb_agg(jsonb_build_object(
      'key', trigger_key, 'label', name_hu
    ) order by trigger_key) from internal_missing), '[]'::jsonb)
  );
$function$;

-- ---------------------------------------------------------------------------
-- 5. A felület új, típusfüggetlen adatforrása.
-- ---------------------------------------------------------------------------
create or replace function public.aic_felviteli_katalogus_v2(
  p_organisation_id uuid,
  p_iparag text,
  p_szerepkorok text[],
  p_valaszok jsonb default '{}'::jsonb
) returns jsonb
language plpgsql
stable
security definer
set search_path = public, pg_temp
as $function$
declare
  v_profile jsonb;
  v_missing jsonb;
  v_cards jsonb;
  v_role_details jsonb;
  v_review jsonb;
begin
  if auth.uid() is null then raise exception 'A felvitelhez bejelentkezés szükséges.'; end if;
  if public.aic_szervezeti_szerep(p_organisation_id) is null then
    raise exception 'Nincs jogosultságod ehhez a szervezethez.';
  end if;

  v_profile := public.aic_felviteli_profil_v2(
    p_organisation_id, p_iparag, p_szerepkorok, p_valaszok
  );
  v_missing := public.aic_felviteli_hianyok_v2(v_profile);

  select coalesce(jsonb_agg(jsonb_build_object(
    'key', c.trigger_key,
    'label', c.name_hu,
    'question', c.question_hu,
    'description', c.description_hu,
    'group', c.ux_group,
    'round', c.onboarding_round,
    'input', case when c.valasz_lehetosegek is null then 'boolean' else 'multi' end,
    'options', coalesce(c.valasz_lehetosegek,'[]'::jsonb),
    'details', coalesce((
      select jsonb_agg(jsonb_build_object(
        'key', d.trigger_key,
        'label', d.name_hu,
        'question', d.question_hu,
        'input', case when d.valasz_lehetosegek is null then 'boolean' else 'multi' end,
        'options', coalesce(d.valasz_lehetosegek,'[]'::jsonb)
      ) order by d.display_order)
      from public.aic_trigger_catalogue d
      where d.parent_trigger_key = c.trigger_key
        and d.intake_mode in ('function_detail','context_detail')
    ), '[]'::jsonb)
  ) order by c.onboarding_round, c.display_order), '[]'::jsonb)
  into v_cards
  from public.aic_trigger_catalogue c
  where c.intake_mode in ('function_card','context_card')
    and (c.ask_only_if is null
      or public.aic_applicability_state(c.ask_only_if, v_profile) = 'applicable');

  select coalesce(jsonb_agg(jsonb_build_object(
    'key', c.trigger_key, 'label', c.name_hu, 'question', c.question_hu
  ) order by c.display_order), '[]'::jsonb)
  into v_role_details
  from public.aic_trigger_catalogue c
  where c.intake_mode = 'role_detail'
    and (c.ask_only_if is null
      or public.aic_applicability_state(c.ask_only_if, v_profile) = 'applicable');

  select coalesce(jsonb_agg(jsonb_build_object(
    'key', c.trigger_key, 'label', c.name_hu
  ) order by c.display_order), '[]'::jsonb)
  into v_review
  from public.aic_trigger_catalogue c
  where c.trigger_key in (
    select item->>'key' from jsonb_array_elements(v_missing->'legal_review') item
  );

  return jsonb_build_object(
    'cards', v_cards,
    'role_details', v_role_details,
    'legal_review', v_review,
    'missing', v_missing,
    'counts', jsonb_build_object(
      'jogtar_modules', (select count(*) from public.aic_policy_modules
                         where lifecycle_status in ('approved','under_review')),
      'function_facts', (select count(*) from public.aic_trigger_catalogue
                         where category='funkcio' and not derived),
      'usage_contexts', (select count(*) from public.aic_trigger_catalogue
                         where category='kornyezet' and not derived),
      'visible_cards', jsonb_array_length(v_cards)
    )
  );
end;
$function$;

revoke all on function public.aic_felviteli_katalogus_v2(uuid, text, text[], jsonb)
  from public, anon;
grant execute on function public.aic_felviteli_katalogus_v2(uuid, text, text[], jsonb)
  to authenticated;

create or replace function public.aic_felvitel_elonezet_v2(
  p_organisation_id uuid,
  p_valaszok jsonb,
  p_szerepkorok text[],
  p_iparag text
) returns jsonb
language plpgsql
stable
security definer
set search_path = public, pg_temp
as $function$
declare
  v_profile jsonb;
  v_missing jsonb;
begin
  if auth.uid() is null then raise exception 'Az előnézethez bejelentkezés szükséges.'; end if;
  if public.aic_szervezeti_szerep(p_organisation_id) is null then
    raise exception 'Nincs jogosultságod ehhez a szervezethez.';
  end if;

  v_profile := public.aic_felviteli_profil_v2(
    p_organisation_id, p_iparag, p_szerepkorok, p_valaszok
  );
  v_missing := public.aic_felviteli_hianyok_v2(v_profile);

  return jsonb_build_object(
    'missing', v_missing,
    'applicable_count', (
      select count(*) from public.aic_policy_modules m
      where m.lifecycle_status in ('approved','under_review')
        and public.aic_applicability_state(m.applicability, v_profile) = 'applicable'
    ),
    'needs_data_count', (
      select count(*) from public.aic_policy_modules m
      where m.lifecycle_status in ('approved','under_review')
        and public.aic_applicability_state(m.applicability, v_profile) = 'needs_data'
    ),
    'applicable_modules', coalesce((
      select jsonb_agg(jsonb_build_object(
        'module_id', m.id, 'module_code', m.module_code, 'title', m.title
      ) order by m.display_order, m.module_code)
      from public.aic_policy_modules m
      where m.lifecycle_status in ('approved','under_review')
        and public.aic_applicability_state(m.applicability, v_profile) = 'applicable'
    ), '[]'::jsonb)
  );
end;
$function$;

revoke all on function public.aic_felvitel_elonezet_v2(uuid, jsonb, text[], text)
  from public, anon;
grant execute on function public.aic_felvitel_elonezet_v2(uuid, jsonb, text[], text)
  to authenticated;

-- ---------------------------------------------------------------------------
-- 6. Közvetlen MI-rendszer ↔ kész Jogtár-szöveg kapcsolat.
-- ---------------------------------------------------------------------------
create table if not exists public.aic_ai_system_policy_modules (
  system_id uuid not null references public.aic_ai_systems(id) on delete cascade,
  module_id uuid not null references public.aic_policy_modules(id) on delete cascade,
  module_version integer not null,
  linked_at timestamptz not null default now(),
  linked_by uuid references auth.users(id),
  primary key (system_id, module_id)
);

comment on table public.aic_ai_system_policy_modules is
  'Az MI-rendszerhez determinisztikusan kapcsolt, már kész Jogtár-szövegek. Nem új szabályzatszöveg.';

alter table public.aic_ai_system_policy_modules enable row level security;
drop policy if exists aic_system_policy_modules_select on public.aic_ai_system_policy_modules;
create policy aic_system_policy_modules_select
on public.aic_ai_system_policy_modules for select
to authenticated
using (exists (
  select 1
  from public.aic_ai_systems s
  join public.aic_organisation_members om on om.organisation_id = s.organisation_id
  where s.id = system_id and om.user_id = (select auth.uid())
));

grant select on public.aic_ai_system_policy_modules to authenticated;

create or replace function public.aic_refresh_system_policy_links(p_system_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = public, pg_temp
as $function$
declare
  v_user_id uuid := auth.uid();
  v_profile jsonb;
  v_completion text;
  v_count integer;
begin
  if v_user_id is null then raise exception 'A szabályzatkapcsoláshoz bejelentkezés szükséges.'; end if;
  if not exists (
    select 1
    from public.aic_ai_systems s
    join public.aic_organisation_members om on om.organisation_id = s.organisation_id
    where s.id = p_system_id and om.user_id = v_user_id
      and om.member_role in ('owner','admin','compliance','editor')
  ) then
    raise exception 'Nincs jogosultságod ehhez a rendszerhez.';
  end if;

  select completion_status into v_completion
  from public.aic_system_facts where system_id = p_system_id;

  delete from public.aic_ai_system_policy_modules where system_id = p_system_id;
  if v_completion is distinct from 'complete' then
    return jsonb_build_object('linked', 0, 'completion_status', coalesce(v_completion,'draft'));
  end if;

  v_profile := public.aic_system_profile(p_system_id);
  insert into public.aic_ai_system_policy_modules(
    system_id, module_id, module_version, linked_by
  )
  select p_system_id, m.id, m.version, v_user_id
  from public.aic_policy_modules m
  where m.lifecycle_status in ('approved','under_review')
    and (m.valid_from is null or m.valid_from <= current_date)
    and (m.valid_to is null or m.valid_to >= current_date)
    and public.aic_applicability_matches(m.applicability, v_profile);

  get diagnostics v_count = row_count;
  return jsonb_build_object('linked', v_count, 'completion_status', v_completion);
end;
$function$;

revoke all on function public.aic_refresh_system_policy_links(uuid) from public, anon;
grant execute on function public.aic_refresh_system_policy_links(uuid) to authenticated;

update public.aic_system_type_templates
set default_facts = '{"IS_AI_SYSTEM":true,"is_ai_system":true}'::jsonb
where type_code = 'OTHER_AI';

create or replace function public.aic_eszkoz_mentese_v2(
  p_organisation_id uuid,
  p_nev text,
  p_valaszok jsonb,
  p_szerepkorok text[],
  p_iparag text,
  p_rendeltetes text,
  p_system_id uuid default null,
  p_vegleges boolean default true
) returns jsonb
language plpgsql
security definer
set search_path = public, pg_temp
as $function$
declare
  v_member_role text;
  v_id uuid;
  v_type_id uuid;
  v_profile jsonb;
  v_missing jsonb;
  v_completion text;
  v_effective_roles text[] := p_szerepkorok;
  v_facts jsonb;
  v_links jsonb;
begin
  if auth.uid() is null then raise exception 'A mentéshez bejelentkezés szükséges.'; end if;
  v_member_role := public.aic_szervezeti_szerep(p_organisation_id);
  if v_member_role is null or v_member_role not in ('owner','admin','compliance','editor') then
    raise exception 'Nincs jogosultságod eszközt rögzíteni ebben a szervezetben.';
  end if;
  if btrim(coalesce(p_nev,'')) = '' then raise exception 'A rendszer nevét meg kell adni.'; end if;
  if char_length(btrim(coalesce(p_rendeltetes,''))) < 10 then
    raise exception 'A rendszer rendeltetését legalább 10 karakterben meg kell adni.';
  end if;
  if not exists (select 1 from public.aic_industries where code = p_iparag and active) then
    raise exception 'Ismeretlen vagy inaktív iparág: %.', p_iparag;
  end if;

  v_profile := public.aic_felviteli_profil_v2(
    p_organisation_id, p_iparag, p_szerepkorok, p_valaszok
  );
  v_missing := public.aic_felviteli_hianyok_v2(v_profile);

  if coalesce((p_valaszok->>'BECOMES_PROVIDER')::boolean, false)
     and not ('provider' = any(v_effective_roles)) then
    v_effective_roles := array_append(v_effective_roles, 'provider');
  end if;

  if jsonb_array_length(v_missing->'cards') > 0
     or jsonb_array_length(v_missing->'legal_review') > 0
     or jsonb_array_length(v_missing->'internal') > 0 then
    v_completion := 'draft';
  else
    v_completion := 'complete';
  end if;

  if p_vegleges and v_completion <> 'complete' then
    raise exception 'A végleges mentéshez további adat szükséges: %.', v_missing::text;
  end if;

  select id into v_type_id
  from public.aic_system_type_templates
  where type_code = 'OTHER_AI' and active;
  if v_type_id is null then raise exception 'A belső, semleges rendszertípus nem érhető el.'; end if;

  v_facts := coalesce(p_valaszok,'{}'::jsonb) || jsonb_build_object(
    'declared_organisation_roles', to_jsonb(p_szerepkorok),
    'EVENT_PROHIBITED_PRACTICE_SUSPECTED', false,
    'EVENT_INFRINGEMENT_SUSPECTED', false,
    'EVENT_OPERATOR_NONCOMPLIANCE', false,
    'EVENT_GPAI_NONCOMPLIANCE', false,
    'EVENT_MISLEADING_AUTHORITY_INFO', false,
    'EVENT_SIGNIFICANT_RISK', false,
    'SUSPECTED_NONCONFORMITY', false
  );

  if p_system_id is null then
    insert into public.aic_ai_systems(
      organisation_id, name, intended_purpose, system_type_id,
      organisation_role, organisation_roles, industry_code,
      lifecycle_stage, inventory_status, created_by, updated_by
    ) values (
      p_organisation_id, btrim(p_nev), btrim(p_rendeltetes), v_type_id,
      v_effective_roles[1], v_effective_roles, p_iparag,
      'production', 'active', auth.uid(), auth.uid()
    ) returning id into v_id;
  else
    update public.aic_ai_systems
    set name = btrim(p_nev), intended_purpose = btrim(p_rendeltetes),
        system_type_id = v_type_id, organisation_role = v_effective_roles[1],
        organisation_roles = v_effective_roles, industry_code = p_iparag,
        updated_by = auth.uid(), updated_at = now()
    where id = p_system_id and organisation_id = p_organisation_id
    returning id into v_id;
    if v_id is null then raise exception 'A rendszer nem található ebben a szervezetben.'; end if;
  end if;

  insert into public.aic_system_facts(
    system_id, facts, completion_status, updated_by, updated_at
  ) values (v_id, v_facts, v_completion, auth.uid(), now())
  on conflict (system_id) do update
  set facts = excluded.facts,
      completion_status = excluded.completion_status,
      updated_by = excluded.updated_by,
      updated_at = excluded.updated_at;

  v_links := public.aic_refresh_system_policy_links(v_id);
  return jsonb_build_object(
    'system_id', v_id,
    'completion_status', v_completion,
    'missing', v_missing,
    'linked_policy_modules', coalesce((v_links->>'linked')::integer,0)
  );
end;
$function$;

revoke all on function public.aic_eszkoz_mentese_v2(
  uuid, text, jsonb, text[], text, text, uuid, boolean
) from public, anon;
grant execute on function public.aic_eszkoz_mentese_v2(
  uuid, text, jsonb, text[], text, text, uuid, boolean
) to authenticated;

create or replace function public.aic_require_valid_usage_profile(p_ai_system_id uuid)
returns jsonb
language plpgsql
stable
set search_path = public, pg_temp
as $function$
declare
  v_facts jsonb;
  v_completion text;
  v_profile jsonb;
begin
  if not exists (
    select 1 from public.aic_ai_systems
    where id = p_ai_system_id and inventory_status = 'active'
  ) then
    raise exception 'A szabályzat nem kapcsolható: az MI-rendszer nem található vagy nem aktív.';
  end if;

  select facts, completion_status into v_facts, v_completion
  from public.aic_system_facts where system_id = p_ai_system_id;
  if v_facts is null then
    raise exception 'A szabályzat nem kapcsolható, mert a rendszer tényei hiányoznak.';
  end if;
  if v_completion <> 'complete' then
    raise exception 'A kész szabályzatok kapcsolása előtt a hiányzó rendszeradatokat rendezni kell.';
  end if;

  v_profile := public.aic_system_profile(p_ai_system_id);
  if v_profile is null then raise exception 'A rendszer teljes tényprofilja nem állítható össze.'; end if;
  return v_profile || jsonb_build_object(
    'facts_validated', true,
    'selection_basis', 'jogtar_trigger_catalogue'
  );
end;
$function$;

-- ---------------------------------------------------------------------------
-- 7. Migrációs önellenőrzések.
-- ---------------------------------------------------------------------------
do $assertions$
declare
  v_count integer;
begin
  select count(*) into v_count from public.aic_trigger_catalogue where intake_mode is null;
  if v_count <> 0 then raise exception 'Besorolatlan tény maradt: %.', v_count; end if;

  select count(*) into v_count from public.aic_trigger_catalogue
  where category='funkcio' and not derived;
  if v_count <> 31 then raise exception 'A Jogtár-alapú funkciók száma nem 31, hanem %.', v_count; end if;

  select count(*) into v_count from public.aic_trigger_catalogue
  where category='kornyezet' and not derived;
  if v_count <> 12 then raise exception 'A használati környezetek száma nem 12, hanem %.', v_count; end if;

  select count(*) into v_count from public.aic_trigger_catalogue where intake_mode='function_card';
  if v_count <> 24 then raise exception 'A gyökér funkciókártyák száma nem 24, hanem %.', v_count; end if;

  select count(*) into v_count from public.aic_trigger_catalogue where intake_mode='function_detail';
  if v_count <> 7 then raise exception 'A funkciórészletek száma nem 7, hanem %.', v_count; end if;

  select count(*) into v_count from public.aic_trigger_catalogue
  where intake_mode in ('context_card','context_detail','role_detail') and category='kornyezet';
  if v_count <> 12 then raise exception 'A 12 környezet felviteli besorolása hiányos: %.', v_count; end if;

  if public.aic_applicability_state(
    '{"all":[{"fact":"PROCESSES_PERSONAL_DATA","operator":"is_true"}]}'::jsonb,
    '{}'::jsonb
  ) <> 'needs_data' then
    raise exception 'A hiányzó tény tévesen nem needs_data.';
  end if;

  if not public.aic_fact_condition_matches(
    '{"SYNTHETIC_CONTENT_TYPE":["text","image"]}'::jsonb,
    '{"fact":"SYNTHETIC_CONTENT_TYPE","operator":"in","value":["text","audio","image","video"]}'::jsonb
  ) then raise exception 'A tömbös in feltétel nem illeszkedik.'; end if;

  if not public.aic_fact_condition_matches(
    '{"ENERGY_CUSTOMER_MATTERS":["billing","complaint"]}'::jsonb,
    '{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["billing"]}'::jsonb
  ) then raise exception 'Az energetikai tömbfeltétel nem illeszkedik.'; end if;

  if public.aic_fact_condition_matches(
    '{"ENERGY_CUSTOMER_MATTERS":["billing","complaint"]}'::jsonb,
    '{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["disconnection"]}'::jsonb
  ) then raise exception 'Az energetikai tömbfeltétel tévesen illeszkedik.'; end if;

  if exists (
    select 1 from public.aic_policy_modules
    where module_code in ('IMPORTER_VERIFICATION_PROCESS','DISTRIBUTOR_VERIFICATION_PROCESS')
      and applicability ? 'any'
  ) then raise exception 'A dokumentumállapot még mindig jogtári alkalmazhatóságot vezérel.'; end if;
end;
$assertions$;

commit;
