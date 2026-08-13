-- Több MI-rendszer atomi importálása ellenőrzött használati profilokból.
-- Egyetlen hibás sor esetén a teljes import visszagörgetésre kerül.

create or replace function public.aic_import_ai_systems_from_profiles(
  p_organisation_id uuid,
  p_rows jsonb,
  p_conditions_confirmed boolean
)
returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_row jsonb;
  v_name text;
  v_profile_code text;
  v_system_id uuid;
  v_ids jsonb := '[]'::jsonb;
  v_count integer := 0;
begin
  if auth.uid() is null then
    raise exception 'Az importáláshoz bejelentkezés szükséges.';
  end if;

  if not exists (
    select 1
    from public.aic_organisation_members
    where organisation_id = p_organisation_id
      and user_id = auth.uid()
  ) then
    raise exception 'A szervezet nem érhető el.';
  end if;

  if p_conditions_confirmed is distinct from true then
    raise exception 'A profilok kötelező feltételeit meg kell erősíteni.';
  end if;

  if jsonb_typeof(p_rows) <> 'array' or jsonb_array_length(p_rows) = 0 then
    raise exception 'Az importálandó adatsorok hiányoznak.';
  end if;

  if jsonb_array_length(p_rows) > 100 then
    raise exception 'Egyszerre legfeljebb 100 rendszer importálható.';
  end if;

  for v_row in select value from jsonb_array_elements(p_rows)
  loop
    v_name := nullif(trim(v_row ->> 'name'), '');
    v_profile_code := nullif(trim(v_row ->> 'profile_code'), '');

    if v_name is null or v_profile_code is null then
      raise exception 'Minden sorban kötelező a rendszer neve és a használati profil.';
    end if;

    v_system_id := public.aic_create_ai_system_from_profile(
      p_organisation_id,
      v_name,
      v_profile_code,
      true
    );

    v_ids := v_ids || jsonb_build_array(v_system_id);
    v_count := v_count + 1;
  end loop;

  return jsonb_build_object(
    'imported_count', v_count,
    'system_ids', v_ids
  );
end;
$function$;

revoke all on function public.aic_import_ai_systems_from_profiles(uuid, jsonb, boolean) from public;
revoke all on function public.aic_import_ai_systems_from_profiles(uuid, jsonb, boolean) from anon;
grant execute on function public.aic_import_ai_systems_from_profiles(uuid, jsonb, boolean) to authenticated;
