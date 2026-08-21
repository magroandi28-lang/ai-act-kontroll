-- A hamis érték is tény: a névfeloldó nem hagyhatja hiányzóként.

begin;

create or replace function public.aic_tenylap_nevfeloldas(p_profile jsonb)
returns jsonb
language sql
stable
set search_path = public, pg_temp
as $function$
  with legacy_values as (
    select c.trigger_key, p_profile->k as value
    from public.aic_trigger_catalogue c
    cross join lateral unnest(c.legacy_fact_keys) k
    where jsonb_typeof(p_profile->k) = 'boolean'
  ),
  legacy_resolved as (
    select trigger_key,
           case when bool_or(value = 'true'::jsonb)
                then 'true'::jsonb else 'false'::jsonb end as value
    from legacy_values
    group by trigger_key
  ),
  regibol as (
    select jsonb_object_agg(trigger_key, value) as j
    from legacy_resolved
  ),
  ujbol as (
    select jsonb_object_agg(k, p_profile->c.trigger_key) as j
    from public.aic_trigger_catalogue c
    cross join lateral unnest(c.legacy_fact_keys) k
    where jsonb_typeof(p_profile->c.trigger_key) = 'boolean'
  )
  select coalesce((select j from regibol), '{}'::jsonb)
      || coalesce((select j from ujbol), '{}'::jsonb)
      || coalesce(p_profile, '{}'::jsonb);
$function$;

comment on function public.aic_tenylap_nevfeloldas(jsonb) is
  'A kanonikus és régi logikai ténykulcsokat igaz és hamis értékkel is feloldja. Tömbös és szöveges tényeket változatlanul hagy.';

do $assertions$
declare v jsonb;
begin
  v := public.aic_tenylap_nevfeloldas(
    '{"system_is_high_risk":false,"ENERGY_CUSTOMER_MATTERS":["billing"]}'::jsonb
  );
  if v->'SYSTEM_IS_HIGH_RISK' <> 'false'::jsonb then
    raise exception 'A hamis régi érték nem oldódott fel a kanonikus kulcsra.';
  end if;
  if v->'ENERGY_CUSTOMER_MATTERS' <> '["billing"]'::jsonb then
    raise exception 'A tömbös tény megváltozott.';
  end if;
end;
$assertions$;

commit;
