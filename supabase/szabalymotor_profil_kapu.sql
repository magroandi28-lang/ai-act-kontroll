begin;

-- Egyetlen központi, determinisztikus ellenőrzés mondja meg, hogy a rendszer
-- használati profilja alkalmas-e szabályzat előállítására.
create or replace function public.aic_require_valid_usage_profile(p_ai_system_id uuid)
returns jsonb
language plpgsql
stable
set search_path to 'public', 'pg_temp'
as $function$
declare
  v_usage_profile_code text;
  v_profile_code text;
  v_profile_active boolean;
  v_profile_industry_code text;
  v_profile_system_type_code text;
  v_profile_fact_patch jsonb;
  v_profile_capability_codes text[];
  v_system_industry_code text;
  v_system_type_code text;
  v_facts jsonb;
  v_missing_capabilities text[];
begin
  select
    s.usage_profile_code,
    p.code,
    p.active,
    p.industry_code,
    p.system_type_code,
    p.fact_patch,
    p.capability_codes,
    coalesce(s.industry_code, o.industry, 'unknown'),
    t.type_code,
    f.facts
  into
    v_usage_profile_code,
    v_profile_code,
    v_profile_active,
    v_profile_industry_code,
    v_profile_system_type_code,
    v_profile_fact_patch,
    v_profile_capability_codes,
    v_system_industry_code,
    v_system_type_code,
    v_facts
  from public.aic_ai_systems s
  join public.aic_organisations o on o.id = s.organisation_id
  join public.aic_system_type_templates t on t.id = s.system_type_id
  left join public.aic_usage_profiles p on p.code = s.usage_profile_code
  left join public.aic_system_facts f on f.system_id = s.id
  where s.id = p_ai_system_id
    and s.inventory_status = 'active';

  if not found then
    raise exception 'A szabályzat nem készíthető el: az MI-rendszer nem található, nem aktív vagy nincs rendszertípusa.';
  end if;

  if v_usage_profile_code is null or btrim(v_usage_profile_code) = '' then
    raise exception 'A szabályzat nem készíthető el, mert a rendszerhez nincs érvényes használati profil rendelve.';
  end if;

  if v_profile_code is null then
    raise exception 'A szabályzat nem készíthető el, mert a(z) "%" használati profil nem található a profilkatalógusban.', v_usage_profile_code;
  end if;

  if not v_profile_active then
    raise exception 'A szabályzat nem készíthető el, mert a(z) "%" használati profil inaktív.', v_profile_code;
  end if;

  if v_profile_system_type_code is distinct from v_system_type_code then
    raise exception 'A szabályzat nem készíthető el, mert a használati profil rendszertípusa nem egyezik a nyilvántartott rendszer típusával.';
  end if;

  if v_profile_industry_code is distinct from v_system_industry_code then
    raise exception 'A szabályzat nem készíthető el, mert a használati profil iparága nem egyezik a rendszer iparágával.';
  end if;

  if v_facts is null then
    raise exception 'A szabályzat nem készíthető el, mert a használati profilhoz szükséges rendszertények hiányoznak.';
  end if;

  if not v_facts @> coalesce(v_profile_fact_patch, '{}'::jsonb) then
    raise exception 'A szabályzat nem készíthető el, mert a rendszertények nem teljesítik a kiválasztott használati profil kötelező feltételeit.';
  end if;

  select coalesce(array_agg(required_code order by required_code), '{}'::text[])
  into v_missing_capabilities
  from unnest(coalesce(v_profile_capability_codes, '{}'::text[])) required_code
  where not coalesce(v_facts -> 'capability_codes', '[]'::jsonb) ? required_code;

  if cardinality(v_missing_capabilities) > 0 then
    raise exception 'A szabályzat nem készíthető el, mert a használati profil kötelező képességei hiányoznak: %.', array_to_string(v_missing_capabilities, ', ');
  end if;

  return v_facts || jsonb_build_object(
    'usage_profile_code', v_profile_code,
    'system_type_code', v_system_type_code,
    'industry', v_system_industry_code,
    'profile_validated', true
  );
end;
$function$;

revoke all on function public.aic_require_valid_usage_profile(uuid) from public, anon;
grant execute on function public.aic_require_valid_usage_profile(uuid) to authenticated;

-- Adatbázisszintű védelem: érvénytelen profilú rendszerhez más kódútvonalon
-- sem kerülhet új generált szabályzat a táblába.
create or replace function public.aic_enforce_generated_policy_profile()
returns trigger
language plpgsql
set search_path to 'public', 'pg_temp'
as $function$
declare
  v_validated_profile jsonb;
begin
  v_validated_profile := public.aic_require_valid_usage_profile(new.ai_system_id);
  new.source_snapshot := jsonb_set(
    coalesce(new.source_snapshot, '{}'::jsonb),
    '{evaluated_profile}',
    v_validated_profile,
    true
  );
  return new;
end;
$function$;

revoke all on function public.aic_enforce_generated_policy_profile() from public, anon, authenticated;

drop trigger if exists aic_generated_policy_profile_guard on public.aic_generated_policies;
create trigger aic_generated_policy_profile_guard
before insert or update of ai_system_id on public.aic_generated_policies
for each row execute function public.aic_enforce_generated_policy_profile();

-- A felület által használt verzióellenőrző generátor is a kapu után dolgozik.
create or replace function public.aic_generate_policy_if_changed(p_ai_system_id uuid)
returns jsonb
language plpgsql
set search_path to 'public', 'pg_temp'
as $function$
declare
  v_user_id uuid := auth.uid();
  v_organisation_id uuid;
  v_profile jsonb;
  v_current_modules jsonb;
  v_latest_id uuid;
  v_latest_snapshot jsonb;
  v_new_id uuid;
begin
  if v_user_id is null then
    raise exception 'A dokumentum frissítéséhez bejelentkezés szükséges.';
  end if;

  select s.organisation_id
    into v_organisation_id
  from public.aic_ai_systems s
  where s.id = p_ai_system_id
    and s.inventory_status = 'active';

  if not found then
    raise exception 'Az MI-rendszer nem található vagy nem aktív.';
  end if;

  if not exists (
    select 1
    from public.aic_organisation_members m
    where m.organisation_id = v_organisation_id
      and m.user_id = v_user_id
      and m.member_role in ('owner', 'admin', 'compliance', 'editor')
  ) then
    raise exception 'Nincs jogosultságod a dokumentum frissítéséhez.';
  end if;

  v_profile := public.aic_require_valid_usage_profile(p_ai_system_id);

  perform pg_advisory_xact_lock(hashtextextended(p_ai_system_id::text, 0));

  select coalesce(
    jsonb_agg(
      jsonb_build_object(
        'module_id', m.id,
        'module_code', m.module_code,
        'module_version', m.version,
        'rule_id', m.rule_id,
        'rule_code', r.rule_code
      )
      order by m.display_order, m.module_code
    ),
    '[]'::jsonb
  )
  into v_current_modules
  from public.aic_policy_modules m
  left join public.aic_compliance_rules r on r.id = m.rule_id
  where m.lifecycle_status in ('approved', 'under_review')
    and (m.valid_from is null or m.valid_from <= current_date)
    and (m.valid_to is null or m.valid_to >= current_date)
    and public.aic_applicability_matches(m.applicability, v_profile);

  if jsonb_array_length(v_current_modules) = 0 then
    raise exception 'A szabályzat nem készíthető el, mert az érvényes használati profilhoz nincs alkalmazható szabálymodul.';
  end if;

  select gp.id, gp.source_snapshot
    into v_latest_id, v_latest_snapshot
  from public.aic_generated_policies gp
  where gp.ai_system_id = p_ai_system_id
  order by gp.version desc
  limit 1;

  if v_latest_id is not null
     and (
       coalesce(v_latest_snapshot -> 'evaluated_profile', 'null'::jsonb) = v_profile
       or coalesce(v_latest_snapshot -> 'evaluated_profile', 'null'::jsonb)
            = (v_profile - 'usage_profile_code' - 'profile_validated')
     )
     and coalesce(v_latest_snapshot -> 'modules', '[]'::jsonb) = v_current_modules then
    return jsonb_build_object('policy_id', v_latest_id, 'created', false);
  end if;

  v_new_id := public.aic_generate_policy(p_ai_system_id);
  return jsonb_build_object('policy_id', v_new_id, 'created', true);
end;
$function$;

revoke all on function public.aic_generate_policy_if_changed(uuid) from public, anon;
grant execute on function public.aic_generate_policy_if_changed(uuid) to authenticated;

commit;
