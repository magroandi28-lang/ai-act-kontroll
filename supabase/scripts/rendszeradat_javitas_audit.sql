begin;

create table if not exists public.aic_system_change_log (
  id uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references public.aic_organisations(id) on delete cascade,
  system_id uuid not null references public.aic_ai_systems(id) on delete cascade,
  changed_by uuid not null references auth.users(id),
  change_type text not null check (change_type in ('data_correction','profile_assignment','lifecycle_change','archive','reclassification')),
  before_data jsonb not null default '{}'::jsonb check (jsonb_typeof(before_data)='object'),
  after_data jsonb not null default '{}'::jsonb check (jsonb_typeof(after_data)='object'),
  created_at timestamptz not null default now()
);

create index if not exists aic_system_change_log_system_created_idx
  on public.aic_system_change_log(system_id,created_at desc);

alter table public.aic_system_change_log enable row level security;
drop policy if exists system_change_log_select_members on public.aic_system_change_log;
create policy system_change_log_select_members on public.aic_system_change_log
for select to authenticated using (
  exists (
    select 1 from public.aic_organisation_members m
    where m.organisation_id=aic_system_change_log.organisation_id
      and m.user_id=auth.uid()
  )
);
revoke all on public.aic_system_change_log from public,anon,authenticated;
grant select on public.aic_system_change_log to authenticated;

create or replace function public.aic_log_ai_system_change()
returns trigger
language plpgsql
security definer
set search_path to 'public','pg_temp'
as $function$
declare
  v_change_type text;
  v_actor uuid:=coalesce(auth.uid(),new.updated_by);
begin
  if new.inventory_status is distinct from old.inventory_status and new.inventory_status='archived' then
    v_change_type:='archive';
  elsif new.usage_profile_code is distinct from old.usage_profile_code then
    v_change_type:=case when old.usage_profile_code is null then 'profile_assignment' else 'reclassification' end;
  elsif new.lifecycle_stage is distinct from old.lifecycle_stage then
    v_change_type:='lifecycle_change';
  elsif new.name is distinct from old.name then
    v_change_type:='data_correction';
  else
    return new;
  end if;

  if v_actor is null then raise exception 'A módosítás végrehajtója nem azonosítható.'; end if;

  insert into public.aic_system_change_log(
    organisation_id,system_id,changed_by,change_type,before_data,after_data
  ) values (
    new.organisation_id,new.id,v_actor,v_change_type,
    jsonb_build_object('name',old.name,'lifecycle_stage',old.lifecycle_stage,
      'usage_profile_code',old.usage_profile_code,'inventory_status',old.inventory_status),
    jsonb_build_object('name',new.name,'lifecycle_stage',new.lifecycle_stage,
      'usage_profile_code',new.usage_profile_code,'inventory_status',new.inventory_status)
  );
  return new;
end;
$function$;

revoke all on function public.aic_log_ai_system_change() from public,anon,authenticated;
drop trigger if exists aic_ai_system_change_audit on public.aic_ai_systems;
create trigger aic_ai_system_change_audit
after update of name,lifecycle_stage,usage_profile_code,inventory_status on public.aic_ai_systems
for each row execute function public.aic_log_ai_system_change();

create or replace function public.aic_assign_missing_usage_profile(
  p_system_id uuid,p_profile_code text,p_conditions_confirmed boolean
) returns jsonb
language plpgsql
set search_path to 'public','pg_temp'
as $function$
declare
  v_user_id uuid:=auth.uid();
  v_system public.aic_ai_systems%rowtype;
  v_profile public.aic_usage_profiles%rowtype;
  v_system_type_code text;
  v_system_industry_code text;
begin
  if v_user_id is null then raise exception 'A profil pótlásához bejelentkezés szükséges.'; end if;
  if p_conditions_confirmed is distinct from true then
    raise exception 'A profil kötelező feltételeit meg kell erősíteni.';
  end if;

  select * into v_system from public.aic_ai_systems
  where id=p_system_id and inventory_status='active' for update;
  if not found then raise exception 'Az MI-rendszer nem található vagy már archivált.'; end if;

  if not exists (
    select 1 from public.aic_organisation_members m
    where m.organisation_id=v_system.organisation_id and m.user_id=v_user_id
      and m.member_role in ('owner','admin','compliance','editor')
  ) then raise exception 'Nincs jogosultságod a rendszer profiljának pótlásához.'; end if;

  if v_system.usage_profile_code is not null then
    raise exception 'A rendszernek már van használati profilja. A módosításhoz naplózott újrabesorolás szükséges.';
  end if;

  select * into v_profile from public.aic_usage_profiles
  where code=p_profile_code and active;
  if not found then raise exception 'A kiválasztott használati profil nem elérhető.'; end if;

  select t.type_code,coalesce(v_system.industry_code,o.industry,'unknown')
    into v_system_type_code,v_system_industry_code
  from public.aic_system_type_templates t
  join public.aic_organisations o on o.id=v_system.organisation_id
  where t.id=v_system.system_type_id and t.active;
  if not found then raise exception 'A rendszer típusa vagy szervezete nem elérhető.'; end if;

  if v_profile.system_type_code is distinct from v_system_type_code
     or v_profile.industry_code is distinct from v_system_industry_code then
    raise exception 'A kiválasztott profil nem kompatibilis a rendszer iparágával és típusával.';
  end if;

  insert into public.aic_system_facts(system_id,facts,completion_status,updated_by)
  values (
    p_system_id,
    v_profile.fact_patch||jsonb_build_object(
      'industry',v_system_industry_code,'industry_code',v_system_industry_code,
      'system_type_code',v_system_type_code,'capability_codes',to_jsonb(v_profile.capability_codes),
      'usage_profile_code',v_profile.code,'profile_conditions_confirmed',true,
      'profile_confirmed_at',now()),
    'complete',v_user_id
  )
  on conflict(system_id) do update set
    facts=coalesce(aic_system_facts.facts,'{}'::jsonb)
      ||excluded.facts,
    completion_status='complete',updated_by=v_user_id,updated_at=now();

  update public.aic_ai_systems set
    usage_profile_code=v_profile.code,
    intended_purpose=case when nullif(trim(intended_purpose),'') is null
      then v_profile.intended_purpose_template else intended_purpose end,
    description=case when nullif(trim(description),'') is null
      then v_profile.system_description_template else description end,
    updated_by=v_user_id,updated_at=now()
  where id=p_system_id;

  perform public.aic_require_valid_usage_profile(p_system_id);
  return jsonb_build_object('success',true,'system_id',p_system_id,'profile_code',v_profile.code);
end;
$function$;

revoke all on function public.aic_assign_missing_usage_profile(uuid,text,boolean) from public,anon;
grant execute on function public.aic_assign_missing_usage_profile(uuid,text,boolean) to authenticated;

commit;
