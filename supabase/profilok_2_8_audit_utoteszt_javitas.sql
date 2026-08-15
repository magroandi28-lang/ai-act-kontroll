-- A 2–8. profilaudit utótesztje során jelzett, közvetlenül érintett
-- teljesítmény- és RLS-finomítások.

begin;

create index if not exists aic_capability_dependencies_required_idx
  on public.aic_capability_dependencies(requires_capability_code);

drop policy if exists system_change_log_select_members on public.aic_system_change_log;
create policy system_change_log_select_members
on public.aic_system_change_log for select
to authenticated
using(
  exists(
    select 1 from public.aic_organisation_members m
    where m.organisation_id=aic_system_change_log.organisation_id
      and m.user_id=(select auth.uid())
  )
);

commit;
