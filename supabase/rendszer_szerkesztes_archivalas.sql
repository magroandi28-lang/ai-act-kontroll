-- Meglévő MI-rendszer alapadatainak biztonságos módosítása és archiválása.
-- Nem hoz létre új táblát. Az archivált rendszer eltűnik az aktív listából,
-- de a hozzá tartozó előzmények és szabályzatverziók megmaradnak.

begin;

create or replace function public.aic_update_ai_system_basics(
  p_system_id uuid,
  p_name text,
  p_lifecycle_stage text
) returns jsonb
language plpgsql
set search_path to 'public','pg_temp'
as $function$
declare
  v_user_id uuid := auth.uid();
  v_system public.aic_ai_systems%rowtype;
  v_clean_name text := trim(regexp_replace(coalesce(p_name,''),'\s+',' ','g'));
begin
  if v_user_id is null then
    raise exception 'A módosításhoz bejelentkezés szükséges.';
  end if;
  if v_clean_name = '' then
    raise exception 'A rendszer neve kötelező.';
  end if;
  if p_lifecycle_stage not in ('planned','development','testing','pilot','production','suspended','retired') then
    raise exception 'Érvénytelen életciklus-állapot.';
  end if;

  select * into v_system
  from public.aic_ai_systems
  where id = p_system_id and inventory_status = 'active'
  for update;

  if not found then
    raise exception 'Az MI-rendszer nem található vagy már archivált.';
  end if;

  if not exists (
    select 1 from public.aic_organisation_members m
    where m.organisation_id = v_system.organisation_id
      and m.user_id = v_user_id
      and m.member_role in ('owner','admin','compliance','editor')
  ) then
    raise exception 'Nincs jogosultságod a rendszer módosításához.';
  end if;

  if exists (
    select 1 from public.aic_ai_systems s
    where s.organisation_id = v_system.organisation_id
      and s.inventory_status = 'active'
      and s.id <> p_system_id
      and lower(trim(s.name)) = lower(v_clean_name)
  ) then
    raise exception 'A szervezetnél már létezik ilyen nevű aktív MI-rendszer.';
  end if;

  update public.aic_ai_systems
  set name = v_clean_name,
      lifecycle_stage = p_lifecycle_stage,
      updated_by = v_user_id,
      updated_at = now()
  where id = p_system_id;

  update public.aic_system_facts
  set facts = jsonb_set(coalesce(facts,'{}'::jsonb),'{system_name}',to_jsonb(v_clean_name),true),
      updated_by = v_user_id,
      updated_at = now()
  where system_id = p_system_id;

  return jsonb_build_object('success',true,'system_id',p_system_id,'name',v_clean_name);
end;
$function$;

create or replace function public.aic_archive_ai_system(
  p_system_id uuid
) returns jsonb
language plpgsql
set search_path to 'public','pg_temp'
as $function$
declare
  v_user_id uuid := auth.uid();
  v_system public.aic_ai_systems%rowtype;
begin
  if v_user_id is null then
    raise exception 'A törléshez bejelentkezés szükséges.';
  end if;

  select * into v_system
  from public.aic_ai_systems
  where id = p_system_id and inventory_status = 'active'
  for update;

  if not found then
    raise exception 'Az MI-rendszer nem található vagy már archivált.';
  end if;

  if not exists (
    select 1 from public.aic_organisation_members m
    where m.organisation_id = v_system.organisation_id
      and m.user_id = v_user_id
      and m.member_role in ('owner','admin','compliance','editor')
  ) then
    raise exception 'Nincs jogosultságod a rendszer törléséhez.';
  end if;

  update public.aic_ai_systems
  set inventory_status = 'archived',
      updated_by = v_user_id,
      updated_at = now()
  where id = p_system_id;

  return jsonb_build_object('success',true,'system_id',p_system_id);
end;
$function$;

revoke all on function public.aic_update_ai_system_basics(uuid,text,text) from public,anon;
revoke all on function public.aic_archive_ai_system(uuid) from public,anon;
grant execute on function public.aic_update_ai_system_basics(uuid,text,text) to authenticated;
grant execute on function public.aic_archive_ai_system(uuid) to authenticated;

commit;
