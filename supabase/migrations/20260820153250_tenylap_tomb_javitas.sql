-- A kanonikus névfeloldó csak logikai tényeket tükrözhet a régi kulcsokra.
-- A többválasztós értékeket (például energetikai ügytípus) változatlanul hagyja.

begin;

create or replace function public.aic_tenylap_nevfeloldas(p_profile jsonb)
returns jsonb
language sql
stable
set search_path = public, pg_temp
as $function$
  with regibol as (
    select jsonb_object_agg(c.trigger_key, true) as j
    from public.aic_trigger_catalogue c
    where exists (
      select 1 from unnest(c.legacy_fact_keys) k
      where jsonb_typeof(p_profile->k) = 'boolean'
        and p_profile->k = 'true'::jsonb
    )
  ),
  ujbol as (
    select jsonb_object_agg(k, true) as j
    from public.aic_trigger_catalogue c
    cross join lateral unnest(c.legacy_fact_keys) k
    where jsonb_typeof(p_profile->c.trigger_key) = 'boolean'
      and p_profile->c.trigger_key = 'true'::jsonb
  )
  select coalesce((select j from regibol), '{}'::jsonb)
      || coalesce((select j from ujbol), '{}'::jsonb)
      || coalesce(p_profile, '{}'::jsonb);
$function$;

comment on function public.aic_tenylap_nevfeloldas(jsonb) is
  'A logikai kanonikus és régi ténykulcsokat feloldja. Tömbös és szöveges tényeket változatlanul hagy.';

do $assertions$
begin
  if public.aic_tenylap_nevfeloldas(
       '{"ENERGY_CUSTOMER_MATTERS":["billing","complaint"]}'::jsonb
     )->'ENERGY_CUSTOMER_MATTERS'
     <> '["billing","complaint"]'::jsonb then
    raise exception 'A tömbös tény nem maradt változatlan.';
  end if;
end;
$assertions$;

commit;
