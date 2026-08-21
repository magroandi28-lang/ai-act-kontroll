begin;

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
        'description', d.description_hu,
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
    'key', c.trigger_key,
    'label', c.name_hu,
    'question', c.question_hu,
    'description', c.description_hu,
    'input', case when c.valasz_lehetosegek is null then 'boolean' else 'multi' end,
    'options', coalesce(c.valasz_lehetosegek,'[]'::jsonb),
    'kind', 'role_detail'
  ) order by c.display_order), '[]'::jsonb)
  into v_role_details
  from public.aic_trigger_catalogue c
  where c.intake_mode = 'role_detail'
    and (c.ask_only_if is null
      or public.aic_applicability_state(c.ask_only_if, v_profile) = 'applicable');

  select coalesce(jsonb_agg(jsonb_build_object(
    'key', c.trigger_key,
    'label', c.name_hu,
    'question', c.question_hu,
    'description', c.description_hu,
    'input', case when c.valasz_lehetosegek is null then 'boolean' else 'multi' end,
    'options', coalesce(c.valasz_lehetosegek,'[]'::jsonb),
    'kind', 'legal_review'
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
    'high_risk', coalesce((v_profile->>'SYSTEM_IS_HIGH_RISK')::boolean, false),
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

commit;
