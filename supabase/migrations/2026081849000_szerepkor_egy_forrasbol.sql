-- EnergiaAI Kontroll – a szerepkör egyetlen forrásból.
--
-- A HIBA
-- Az előző lépés bevezette a szerepkörlistát, de a szűrő megtartotta a régi
-- egyértékű mezőt is. Így a szabály akkor is illeszkedett, ha a régi mező
-- egyezett – akkor is, ha a lista mást mondott. Emiatt a gyártó-forgalmazó
-- összeállítás is megkapta az alkalmazói szabályokat.
--
-- A JAVÍTÁS
-- A szűrő kizárólag a szerepkörlistából dolgozik. A ténylap mindig ad listát:
-- ha nincs külön megadva, az egyetlen szerepkörből áll. Így egy forrás van,
-- és nem szivároghat be szabály a másik oldalról.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

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
    -- Szerepkör: kizárólag a listából. Ha nincs lista, az egyértékű mező
    -- egyelemű listaként viselkedik – ezt a ténylap biztosítja.
    and case when p_applicability?'actor_roles'
      then coalesce(
             (select bool_or((p_applicability->'actor_roles') ? r)
              from jsonb_array_elements_text(
                     case when jsonb_typeof(p_profile->'organisation_roles')='array'
                          then p_profile->'organisation_roles'
                          else jsonb_build_array(coalesce(p_profile->>'organisation_role','unknown'))
                     end) r),
             false)
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
  'Illeszkedés-vizsgálat. A szerepkör kizárólag az organisation_roles listából jön; az egyértékű mező csak akkor számít, ha lista nincs.';

-- ---------------------------------------------------------------------------
-- Ellenőrzés: most már a szerepkörnek különbséget kell tennie.
-- A tényeket is a szerepkörhöz igazítjuk, mert azok is szerepkörből
-- levezetettek – enélkül a próba megint félrevezetne.
-- ---------------------------------------------------------------------------
with alap as (select aic_system_profile(id) p from aic_ai_systems where inventory_status='active' limit 1),
esetek as (
  select 'csak alkalmazó' as eset,
    (select p from alap) || jsonb_build_object(
      'organisation_roles','["deployer"]'::jsonb,
      'organisation_is_provider',false,'uses_ai_system_under_own_authority',true,
      'develops_or_has_ai_system_developed',false,
      'places_on_market_or_puts_into_service_under_own_name',false,
      'makes_ai_system_available_on_eu_market',false,'is_provider_or_importer',false) as p
  union all select 'csak gyártó',
    (select p from alap) || jsonb_build_object(
      'organisation_roles','["provider"]'::jsonb,
      'organisation_is_provider',true,'uses_ai_system_under_own_authority',false,
      'develops_or_has_ai_system_developed',true,
      'places_on_market_or_puts_into_service_under_own_name',true,
      'makes_ai_system_available_on_eu_market',true,'is_provider_or_importer',true)
  union all select 'gyártó és forgalmazó',
    (select p from alap) || jsonb_build_object(
      'organisation_roles','["provider","distributor"]'::jsonb,
      'organisation_is_provider',true,'uses_ai_system_under_own_authority',false,
      'develops_or_has_ai_system_developed',true,
      'places_on_market_or_puts_into_service_under_own_name',true,
      'makes_ai_system_available_on_eu_market',true,'is_provider_or_importer',true)
  union all select 'gyártó és alkalmazó',
    (select p from alap) || jsonb_build_object(
      'organisation_roles','["provider","deployer"]'::jsonb,
      'organisation_is_provider',true,'uses_ai_system_under_own_authority',true,
      'develops_or_has_ai_system_developed',true,
      'places_on_market_or_puts_into_service_under_own_name',true,
      'makes_ai_system_available_on_eu_market',true,'is_provider_or_importer',true)
)
select e.eset,
       (select count(*) from aic_policy_modules m
        where aic_applicability_matches(m.applicability, e.p)
          and m.lifecycle_status in ('approved','under_review')) as szabaly
from esetek e;

commit;
