-- EnergiaAI Kontroll – többes szerepkör kezelése.
--
-- A HELYZET
-- Aki a saját MI-eszközét fejleszti és használja is, egyszerre szolgáltató és
-- alkalmazó. Erre az esetre van a szerepkör mezőben a "multiple" érték.
--
-- A HIBA
-- A szabályok szerepkörszűrője szó szerinti egyezést néz: az actor_roles lista
-- tartalmazza-e a rendszer szerepkörét. A "multiple" egyik lista sem
-- tartalmazza, ezért az ilyen rendszer nem hogy több szabályt kapna, hanem
-- egyet sem a szerepkörhöz kötöttek közül.
--
-- A JOGI HÁTTÉR
-- Az MI-rendelet 25. cikk (1) bekezdése szerint az alkalmazó szolgáltatóvá
-- válik, ha a saját nevét vagy védjegyét helyezi el a nagy kockázatú
-- rendszeren, azt lényegesen módosítja, vagy megváltoztatja a rendeltetését.
-- Ez tehát nem kivételes helyzet, hanem a rendelet által szabályozott átmenet.
--
-- A JAVÍTÁS
--   1. A szerepkörszűrő elfogadja a "multiple" értéket minden listánál.
--   2. A ténylapban a többes szerepkörnél a szolgáltatói és az alkalmazói
--      tények egyaránt igazak.
--   3. Új kapcsoló: az alkalmazó szolgáltatóvá válásának három esete.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. A szerepkörszűrő elfogadja a többes szerepkört.
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
           or coalesce(p_profile->>'organisation_role','') = 'multiple'
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
  'Illeszkedés-vizsgálat. A "multiple" szerepkör minden szerepköri listára illeszkedik, mert az ilyen szervezet egyszerre több minőségben jár el.';

-- ---------------------------------------------------------------------------
-- 2. A ténylap a többes szerepkörnél mindkét oldal tényeit igazra állítja.
-- ---------------------------------------------------------------------------
create or replace function public.aic_system_profile(p_ai_system_id uuid)
returns jsonb
language plpgsql stable
set search_path = public, pg_temp
as $function$
declare
  v_alap jsonb; v_szerep text; v_teljes jsonb;
  v_szolgaltato boolean; v_alkalmazo boolean;
begin
  select coalesce(f.facts, '{}'::jsonb)
       || jsonb_build_object(
            'system_type_code', t.type_code,
            'industry', coalesce(s.industry_code, o.industry, 'unknown'),
            'organisation_role', coalesce(s.organisation_role, 'unknown'),
            'lifecycle_stage', s.lifecycle_stage
          )
  into v_alap
  from public.aic_ai_systems s
  join public.aic_organisations o on o.id = s.organisation_id
  join public.aic_system_type_templates t on t.id = s.system_type_id
  left join public.aic_system_facts f on f.system_id = s.id
  where s.id = p_ai_system_id and s.inventory_status = 'active';

  if v_alap is null then return null; end if;

  v_szerep := v_alap ->> 'organisation_role';
  v_szolgaltato := v_szerep in ('provider','product_manufacturer','multiple');
  v_alkalmazo   := v_szerep in ('deployer','multiple');

  v_teljes := jsonb_build_object(
      'is_ai_system', true,
      'IS_AI_SYSTEM', true,
      'persons_operate_or_use_ai_on_behalf', true,
      'ai_compliance_database_in_use', true,
      'use_is_purely_personal_non_professional', false,
      'purpose_exclusively_military_defence_or_national_security', false
    )
    || jsonb_build_object(
      'organisation_is_provider', v_szolgaltato,
      'uses_ai_system_under_own_authority', v_alkalmazo,
      'is_provider_or_importer', v_szerep in ('provider','importer','product_manufacturer','multiple'),
      'develops_or_has_ai_system_developed', v_szolgaltato,
      'places_on_market_or_puts_into_service_under_own_name', v_szolgaltato,
      'makes_ai_system_available_on_eu_market',
        v_szerep in ('provider','importer','distributor','product_manufacturer','multiple'),
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
-- 3. Kapcsoló: az alkalmazó szolgáltatóvá válása.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   question_hu, ask_only_if, display_order, detection_patterns, detection_note)
select 'BECOMES_PROVIDER',
       'Az alkalmazó szolgáltatóvá válása',
       'Az alkalmazó szolgáltatónak minősül, ha a saját nevét vagy védjegyét helyezi el a nagy kockázatú rendszeren, azt lényegesen módosítja, vagy megváltoztatja a rendeltetését.',
       'szerepkor', s.id, '25',
       'Saját néven kínálják a rendszert, lényegesen módosították, vagy más célra használják, mint amire készült?',
       '{"all":[{"fact":"uses_ai_system_under_own_authority","operator":"is_true"}]}'::jsonb,
       435,
       '[{"minta":"saját fejlesztés","tipus":"szoveg","suly":"eros"},
         {"minta":"testreszab","tipus":"szoveg","suly":"gyenge"},
         {"minta":"white label","tipus":"szoveg","suly":"eros"},
         {"minta":"finomhangol","tipus":"szoveg","suly":"gyenge"}]'::jsonb,
       'Ha erre igen a válasz, a szervezet szerepköre többes lesz, és a szolgáltatói szabályok is vonatkoznak rá.'
from public.aic_legal_sources s
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue where trigger_key = 'BECOMES_PROVIDER');

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select s.name as rendszer, s.organisation_role as szerepkor,
       (select count(*) from public.aic_policy_modules m
        where public.aic_applicability_matches(m.applicability, public.aic_system_profile(s.id))
          and m.lifecycle_status in ('approved','under_review')) as illeszkedo_szabaly
from public.aic_ai_systems s where s.inventory_status='active'
order by 3 desc limit 5;

-- Próba: ugyanaz a rendszer háromféle szerepkörrel, hány szabályt kapna.
with x as (select aic_system_profile(id) p from aic_ai_systems where inventory_status='active' limit 1)
select v.szerep,
       (select count(*) from aic_policy_modules m
        where aic_applicability_matches(m.applicability, (x.p || jsonb_build_object('organisation_role', v.szerep)))
          and m.lifecycle_status in ('approved','under_review')) as szabaly
from x, (values ('deployer'),('provider'),('multiple')) as v(szerep);

commit;
