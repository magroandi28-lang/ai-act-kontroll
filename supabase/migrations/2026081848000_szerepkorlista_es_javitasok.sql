-- EnergiaAI Kontroll – szerepkörlista, és két hiba a névfeloldásban.
--
-- HÁROM DOLOG VAN BENNE
--
-- 1. SZEREPKÖRLISTA
-- Eddig egy rendszerhez egy szerepkör tartozott, és a "multiple" azt jelentette:
-- mindegyik. Aki fejlesztő és forgalmazó, az így megkapta az alkalmazói
-- szabályokat is, pedig nem használja a rendszert. Mostantól felsorolható,
-- pontosan mely szerepkörökben jár el a szervezet.
--
-- 2. A synthetic_content_type HIBÁS KEZELÉSE
-- Ez nem logikai tény, hanem érték: hang, kép, videó vagy szöveg. A
-- névfeloldás igazra állította, ezért az 50. cikk (2) bekezdése szerinti
-- gépi jelölési kötelezettség soha nem tudott beindulni. Kivesszük a
-- névfeloldásból, és önálló kapcsolót kap kérdéssel.
--
-- 3. A CSAM-TÉNY HIBÁS ÖSSZEKAPCSOLÁSA
-- A generates_nonconsensual_intimate_or_csam_content ugyanabba a kupacba
-- került, mint a tartalomgenerálás. Ez azt jelentette volna, hogy minden
-- generatív rendszerre ráhúzódik az 5. cikk szerinti tilalom. Tárgyi tévedés,
-- ezért külön kapcsolót kap.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. Szerepkörlista a rendszereknél.
-- ---------------------------------------------------------------------------
alter table public.aic_ai_systems
  add column if not exists organisation_roles text[];

comment on column public.aic_ai_systems.organisation_roles is
  'A szervezet szerepkörei ehhez a rendszerhez. Ha üres, az organisation_role egyetlen értéke érvényes. A "multiple" helyett ezt kell használni.';

-- A meglévő rendszereknél a lista az egyetlen szerepkörből áll.
update public.aic_ai_systems
set organisation_roles = case
      when organisation_role = 'multiple' then array['provider','deployer']
      when organisation_role is null or organisation_role = 'unknown' then null
      else array[organisation_role] end
where organisation_roles is null;

-- ---------------------------------------------------------------------------
-- 2. A szerepkörszűrő listát is elfogad.
-- ---------------------------------------------------------------------------
create or replace function public.aic_applicability_matches(p_applicability jsonb, p_profile jsonb)
returns boolean
language sql stable parallel safe
set search_path to 'public', 'pg_temp'
as $function$
  select
    case when p_applicability?'system_type_codes'
      then (p_applicability->'system_type_codes')?(p_profile->>'system_type_code') else true end
    and not case when p_applicability?'excluded_system_type_codes'
      then (p_applicability->'excluded_system_type_codes')?(p_profile->>'system_type_code') else false end
    and case when p_applicability?'industry_codes'
      then (p_applicability->'industry_codes')?(p_profile->>'industry') else true end
    and case when p_applicability?'actor_roles'
      then (p_applicability->'actor_roles')?(p_profile->>'organisation_role')
           or (jsonb_typeof(p_profile->'organisation_roles')='array'
               and exists (select 1
                           from jsonb_array_elements_text(p_profile->'organisation_roles') r
                           where (p_applicability->'actor_roles') ? r))
      else true end
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

comment on function public.aic_applicability_matches(jsonb, jsonb) is
  'Illeszkedés-vizsgálat. A szerepkör lista is lehet: ha a rendszer több minőségben működik, minden felsorolt szerepkör szabályai vonatkoznak rá.';

-- ---------------------------------------------------------------------------
-- 3. A két hibás névfeloldás megszüntetése.
-- ---------------------------------------------------------------------------
update public.aic_trigger_catalogue
set legacy_fact_keys = array_remove(
      array_remove(legacy_fact_keys, 'synthetic_content_type'),
      'generates_nonconsensual_intimate_or_csam_content'),
    updated_at = now()
where trigger_key = 'GENERATES_SYNTHETIC_CONTENT';

insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   question_hu, ask_only_if, display_order, legacy_fact_keys)
select 'SYNTHETIC_CONTENT_TYPE',
       'A generált tartalom típusa',
       'Milyen típusú tartalmat állít elő a rendszer: hang, kép, videó vagy szöveg. Az 50. cikk (2) bekezdése szerinti gépi jelölési kötelezettség ehhez kötött.',
       'funkcio', s.id, '50',
       'Milyen tartalmat generál a rendszer? Szöveg · hang · kép · videó',
       '{"all":[{"fact":"generates_synthetic_content","operator":"is_true"}]}'::jsonb,
       212, array[]::text[]
from public.aic_legal_sources s
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue where trigger_key='SYNTHETIC_CONTENT_TYPE');

insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   question_hu, ask_only_if, display_order, legacy_fact_keys)
select 'CSAM_CAPABILITY',
       'Beleegyezés nélküli intim vagy gyermekbántalmazási tartalom előállítására való képesség',
       'A rendszer képes beleegyezés nélküli intim tartalom vagy gyermekek szexuális bántalmazását ábrázoló anyag előállítására. Az MI-rendelet 5. cikke szerint tiltott.',
       'funkcio', s.id, '5',
       'Képes a rendszer beleegyezés nélküli intim tartalom vagy gyermekbántalmazási anyag előállítására?',
       '{"all":[{"fact":"generates_synthetic_content","operator":"is_true"}]}'::jsonb,
       214, array['generates_nonconsensual_intimate_or_csam_content']
from public.aic_legal_sources s
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue where trigger_key='CSAM_CAPABILITY');

-- ---------------------------------------------------------------------------
-- 4. A ténylap kiadja a szerepkörlistát.
-- ---------------------------------------------------------------------------
create or replace function public.aic_system_profile(p_ai_system_id uuid)
returns jsonb
language plpgsql stable
set search_path = public, pg_temp
as $function$
declare
  v_alap jsonb; v_szerep text; v_teljes jsonb; v_org uuid;
  v_szerepek text[]; v_szolgaltato boolean; v_alkalmazo boolean; v_online boolean;
begin
  select coalesce(f.facts, '{}'::jsonb)
       || jsonb_build_object(
            'system_type_code', t.type_code,
            'industry', coalesce(s.industry_code, o.industry, 'unknown'),
            'organisation_role', coalesce(s.organisation_role, 'unknown'),
            'organisation_roles', to_jsonb(coalesce(s.organisation_roles,
                                    array[coalesce(s.organisation_role,'unknown')])),
            'lifecycle_stage', s.lifecycle_stage
          ),
       s.organisation_id,
       coalesce(s.organisation_roles, array[coalesce(s.organisation_role,'unknown')]),
       coalesce(s.deployment_context,'') not in ('internal','on_premise')
  into v_alap, v_org, v_szerepek, v_online
  from public.aic_ai_systems s
  join public.aic_organisations o on o.id = s.organisation_id
  join public.aic_system_type_templates t on t.id = s.system_type_id
  left join public.aic_system_facts f on f.system_id = s.id
  where s.id = p_ai_system_id and s.inventory_status = 'active';

  if v_alap is null then return null; end if;

  v_szerep := v_alap ->> 'organisation_role';
  v_szolgaltato := v_szerepek && array['provider','product_manufacturer'];
  v_alkalmazo   := v_szerepek && array['deployer'];

  v_teljes := jsonb_build_object(
      'is_ai_system', true, 'IS_AI_SYSTEM', true,
      'persons_operate_or_use_ai_on_behalf', true,
      'ai_compliance_database_in_use', true,
      'use_is_purely_personal_non_professional', false,
      'purpose_exclusively_military_defence_or_national_security', false,
      'ELECTRONIC_SERVICE_PROVIDER', v_online
    )
    || public.aic_szervezeti_tenyek(v_org, v_szerep)
    || jsonb_build_object(
      'organisation_is_provider', v_szolgaltato,
      'uses_ai_system_under_own_authority', v_alkalmazo,
      'is_provider_or_importer', v_szerepek && array['provider','importer','product_manufacturer'],
      'develops_or_has_ai_system_developed', v_szolgaltato,
      'places_on_market_or_puts_into_service_under_own_name', v_szolgaltato,
      'makes_ai_system_available_on_eu_market',
        v_szerepek && array['provider','importer','distributor','product_manufacturer'],
      'ORG_IS_IMPORTER_DISTRIBUTOR', v_szerepek && array['importer','distributor'],
      'in_ai_supply_chain', v_szerep <> 'unknown'
    )
    || jsonb_build_object(
      'before_market_or_putting_into_service',
        coalesce(v_alap ->> 'lifecycle_stage', '') in ('planning','development','testing')
    )
    || v_alap;

  v_teljes := public.aic_tenylap_nevfeloldas(v_teljes);
  v_teljes := public.aic_nagy_kockazatu(v_teljes) || v_teljes;
  v_teljes := public.aic_tenylap_nevfeloldas(v_teljes);

  return v_teljes;
end;
$function$;

-- ---------------------------------------------------------------------------
-- Ellenőrzés: négy szerepkör-összeállítás ugyanazon a rendszeren.
-- ---------------------------------------------------------------------------
with alap as (select aic_system_profile(id) p from aic_ai_systems where inventory_status='active' limit 1),
esetek as (
  select 'csak alkalmazó' as eset, (select p from alap) || jsonb_build_object('organisation_roles','["deployer"]'::jsonb,'organisation_is_provider',false,'uses_ai_system_under_own_authority',true) as p
  union all select 'csak gyártó', (select p from alap) || jsonb_build_object('organisation_roles','["provider"]'::jsonb,'organisation_is_provider',true,'uses_ai_system_under_own_authority',false)
  union all select 'gyártó és forgalmazó', (select p from alap) || jsonb_build_object('organisation_roles','["provider","distributor"]'::jsonb,'organisation_is_provider',true,'uses_ai_system_under_own_authority',false)
  union all select 'gyártó és alkalmazó', (select p from alap) || jsonb_build_object('organisation_roles','["provider","deployer"]'::jsonb,'organisation_is_provider',true,'uses_ai_system_under_own_authority',true)
)
select e.eset, (select count(*) from aic_policy_modules m
        where aic_applicability_matches(m.applicability, e.p)
          and m.lifecycle_status in ('approved','under_review')) as szabaly
from esetek e;

commit;
