begin;

create or replace function public.aic_normalize_intake_facts(p_facts jsonb)
returns jsonb
language plpgsql
stable
set search_path = public, pg_temp
as $function$
declare
  v_facts jsonb := public.aic_tenylap_nevfeloldas(coalesce(p_facts, '{}'::jsonb));
  v_system_functions jsonb := '[]'::jsonb;
begin
  if v_facts @> '{"GENERATES_SYNTHETIC_CONTENT":false}'::jsonb then
    v_facts := v_facts || jsonb_build_object(
      'SYNTHETIC_CONTENT_TYPE', '[]'::jsonb,
      'CSAM_CAPABILITY', false,
      'CONTENT_IS_DEEPFAKE', false,
      'PUBLISHED_PUBLIC_INTEREST_TEXT', false
    );
  end if;

  if v_facts @> '{"PROCESSES_PERSONAL_DATA":false}'::jsonb then
    v_facts := v_facts || jsonb_build_object(
      'SPECIAL_CATEGORY_DATA', false,
      'CRIMINAL_DATA', false,
      'INDIRECT_DATA_COLLECTION', false,
      'INTERNATIONAL_TRANSFER', false,
      'ACCESSIBLE_TO_MINORS', false
    );
  end if;

  if v_facts @> '{"EMOTION_RECOGNITION":false}'::jsonb then
    v_facts := v_facts || jsonb_build_object(
      'CONTEXT_WORKPLACE_EDUCATION', false
    );
  end if;

  if v_facts @> '{"REALTIME_REMOTE_BIOMETRIC_ID":false}'::jsonb then
    v_facts := v_facts || jsonb_build_object(
      'PUBLIC_SPACE_LAW_ENFORCEMENT', false
    );
  end if;

  if v_facts @> '{"EMOTION_RECOGNITION":true}'::jsonb then
    v_system_functions := v_system_functions || jsonb_build_array('emotion_recognition');
  end if;

  if v_facts @> '{"BIOMETRIC_CATEGORISATION":true}'::jsonb then
    v_system_functions := v_system_functions || jsonb_build_array('biometric_categorisation');
  end if;

  v_facts := v_facts || jsonb_build_object(
    'SYSTEM_FUNCTION_TYPE', v_system_functions,
    'system_function', v_system_functions
  );

  return public.aic_tenylap_nevfeloldas(v_facts);
end;
$function$;

comment on function public.aic_normalize_intake_facts(jsonb) is
  'A felvitel háromértékű ténylapját normalizálja: a kizárt főfunkciók részleteit hamisra vezeti le, és előállítja a szabályfeltételekhez szükséges összetett tényeket.';

create or replace function public.aic_normalize_system_facts_trigger()
returns trigger
language plpgsql
set search_path = public, pg_temp
as $function$
begin
  new.facts := public.aic_normalize_intake_facts(new.facts);
  return new;
end;
$function$;

drop trigger if exists aic_normalize_system_facts_before_write
on public.aic_system_facts;

create trigger aic_normalize_system_facts_before_write
before insert or update of facts on public.aic_system_facts
for each row execute function public.aic_normalize_system_facts_trigger();

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
      'OUT_OF_SCOPE_MILITARY', false,
      'purpose_exclusively_military_defence_or_national_security', false,
      'PRE_MARKET_PHASE', false,
      'EU_SCOPE_APPLIES', true,
      'MODEL_IS_GPAI', false,
      'AI_COMPLIANCE_DATABASE', true,
      'ai_compliance_database_in_use', true,
      'persons_operate_or_use_ai_on_behalf', true,
      'ELECTRONIC_SERVICE_PROVIDER', true,
      'EVENT_PROHIBITED_PRACTICE_SUSPECTED', false,
      'EVENT_INFRINGEMENT_SUSPECTED', false,
      'EVENT_OPERATOR_NONCOMPLIANCE', false,
      'EVENT_GPAI_NONCOMPLIANCE', false,
      'EVENT_MISLEADING_AUTHORITY_INFO', false,
      'EVENT_SIGNIFICANT_RISK', false,
      'SUSPECTED_NONCONFORMITY', false
    )
    || coalesce(p_valaszok, '{}'::jsonb)
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

  v_profil := public.aic_normalize_intake_facts(v_profil);
  v_profil := public.aic_nagy_kockazatu(v_profil) || v_profil;
  v_profil := public.aic_tenylap_nevfeloldas(v_profil);
  v_profil := v_profil || jsonb_build_object(
    'SYSTEM_IS_HIGH_RISK',
    coalesce((v_profil->>'system_is_high_risk')::boolean, false)
  );

  return public.aic_tenylap_nevfeloldas(v_profil);
end;
$function$;

do $assertions$
declare
  v jsonb;
begin
  v := public.aic_normalize_intake_facts(
    '{"GENERATES_SYNTHETIC_CONTENT":false,"PROCESSES_PERSONAL_DATA":false,"EMOTION_RECOGNITION":false,"REALTIME_REMOTE_BIOMETRIC_ID":false}'::jsonb
  );

  if v->'CONTENT_IS_DEEPFAKE' <> 'false'::jsonb
     or v->'SPECIAL_CATEGORY_DATA' <> 'false'::jsonb
     or v->'CONTEXT_WORKPLACE_EDUCATION' <> 'false'::jsonb
     or v->'PUBLIC_SPACE_LAW_ENFORCEMENT' <> 'false'::jsonb then
    raise exception 'A feltételes részletek hamis levezetése sikertelen.';
  end if;

  v := public.aic_normalize_intake_facts(
    '{"EMOTION_RECOGNITION":true,"BIOMETRIC_CATEGORISATION":true}'::jsonb
  );

  if not (v->'SYSTEM_FUNCTION_TYPE' @> '["emotion_recognition","biometric_categorisation"]'::jsonb) then
    raise exception 'A rendszerfunkció-típus levezetése sikertelen.';
  end if;
end;
$assertions$;

commit;
