-- A demómód kizárólag a kijelölt demószervezethez csatlakozhat.
-- Az anonim felhasználó szerkesztő lehet a demókörnyezetben, de nem owner.

alter table public.aic_organisations
  add column if not exists is_demo boolean not null default false;

comment on column public.aic_organisations.is_demo is
  'Igaz kizárólag a közös, elkülönített AI Act Kontroll demószervezetnél.';

do $$
declare
  v_demo_count integer;
begin
  select count(*)::integer
    into v_demo_count
  from public.aic_organisations
  where name = 'EnergiaAI Demó Szervezet';

  if v_demo_count <> 1 then
    raise exception
      'Pontosan egy EnergiaAI Demó Szervezet szükséges, jelenlegi darabszám: %.',
      v_demo_count;
  end if;

  update public.aic_organisations
  set is_demo = true
  where name = 'EnergiaAI Demó Szervezet';
end;
$$;

create unique index if not exists aic_single_demo_organisation
  on public.aic_organisations ((is_demo))
  where is_demo;

-- A korábban létrejött anonim owner tagságok jogosultságának csökkentése.
update public.aic_organisation_members m
set member_role = case when o.is_demo then 'editor' else 'viewer' end
from auth.users u,
     public.aic_organisations o
where u.id = m.user_id
  and u.is_anonymous is true
  and o.id = m.organisation_id
  and m.member_role in ('owner', 'admin', 'compliance');

create or replace function public.aic_demo_csatlakozas()
returns uuid
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_user uuid := auth.uid();
  v_org uuid;
  v_is_anonymous boolean;
begin
  if v_user is null then
    raise exception 'A demóhoz bejelentkezés szükséges.';
  end if;

  select u.is_anonymous
    into v_is_anonymous
  from auth.users u
  where u.id = v_user;

  if v_is_anonymous is distinct from true then
    raise exception 'A demócsatlakozás csak anonim felhasználó számára engedélyezett.';
  end if;

  select o.id
    into v_org
  from public.aic_organisations o
  where o.is_demo is true;

  if v_org is null then
    raise exception 'A kijelölt demószervezet nem található.';
  end if;

  if exists (
    select 1
    from public.aic_organisation_members m
    where m.user_id = v_user
      and m.organisation_id <> v_org
  ) then
    raise exception 'Az anonim felhasználó nem kapcsolható másik szervezethez.';
  end if;

  insert into public.aic_organisation_members (
    organisation_id,
    user_id,
    member_role
  )
  values (v_org, v_user, 'editor')
  on conflict (organisation_id, user_id)
  do update set member_role = excluded.member_role;

  return v_org;
end;
$$;

comment on function public.aic_demo_csatlakozas() is
  'Anonim felhasználót kizárólag a kijelölt demószervezethez kapcsol editor szerepkörrel.';

revoke all on function public.aic_demo_csatlakozas() from public, anon;
grant execute on function public.aic_demo_csatlakozas() to authenticated;

-- A korábbi, minden szervezeti sort engedélyező szabályok eltávolítása.
drop policy if exists aic_orgs_all_access
  on public.aic_organisations;
drop policy if exists aic_members_all_access
  on public.aic_organisation_members;
drop policy if exists aic_ai_systems_select_policy
  on public.aic_ai_systems;
drop policy if exists "Anonymous users can create profile"
  on public.aic_user_profiles;
drop policy if exists "Anonymous users can create privacy acceptance"
  on public.aic_privacy_acceptances;

drop policy if exists aic_organisations_select_member
  on public.aic_organisations;
create policy aic_organisations_select_member
  on public.aic_organisations
  for select
  to authenticated
  using (
    created_by = (select auth.uid())
    or exists (
      select 1
      from public.aic_organisation_members m
      where m.organisation_id = aic_organisations.id
        and m.user_id = (select auth.uid())
    )
  );

drop policy if exists aic_organisations_insert_own
  on public.aic_organisations;
create policy aic_organisations_insert_own
  on public.aic_organisations
  for insert
  to authenticated
  with check (
    created_by = (select auth.uid())
    and is_demo is false
  );

drop policy if exists aic_organisations_update_admin
  on public.aic_organisations;
create policy aic_organisations_update_admin
  on public.aic_organisations
  for update
  to authenticated
  using (
    is_demo is false
    and exists (
      select 1
      from public.aic_organisation_members m
      where m.organisation_id = aic_organisations.id
        and m.user_id = (select auth.uid())
        and m.member_role in ('owner', 'admin')
    )
  )
  with check (
    is_demo is false
    and exists (
      select 1
      from public.aic_organisation_members m
      where m.organisation_id = aic_organisations.id
        and m.user_id = (select auth.uid())
        and m.member_role in ('owner', 'admin')
    )
  );

drop policy if exists aic_members_select_own
  on public.aic_organisation_members;
create policy aic_members_select_own
  on public.aic_organisation_members
  for select
  to authenticated
  using (user_id = (select auth.uid()));

drop policy if exists aic_members_insert_initial_owner
  on public.aic_organisation_members;
create policy aic_members_insert_initial_owner
  on public.aic_organisation_members
  for insert
  to authenticated
  with check (
    user_id = (select auth.uid())
    and member_role = 'owner'
    and exists (
      select 1
      from public.aic_organisations o
      where o.id = aic_organisation_members.organisation_id
        and o.created_by = (select auth.uid())
        and o.is_demo is false
    )
  );
