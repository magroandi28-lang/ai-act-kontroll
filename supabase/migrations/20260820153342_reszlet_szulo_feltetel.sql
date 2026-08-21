-- Feltételes részlet csak akkor kötelező, ha a szülő funkció igaz.

begin;

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
      and (c.parent_trigger_key is null
        or p_profile->c.parent_trigger_key = 'true'::jsonb)
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

commit;
