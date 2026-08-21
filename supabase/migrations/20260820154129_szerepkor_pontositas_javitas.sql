begin;

update public.aic_trigger_catalogue
set szerepkorok = array['deployer','importer','distributor']::text[],
    ask_only_if = '{"actor_roles":["deployer","importer","distributor"]}'::jsonb,
    updated_at = now()
where trigger_key = 'BECOMES_PROVIDER';

do $assertions$
declare
  v_condition jsonb;
begin
  select ask_only_if into v_condition
  from public.aic_trigger_catalogue
  where trigger_key = 'BECOMES_PROVIDER';

  if public.aic_applicability_state(
       v_condition,
       '{"organisation_roles":["importer"]}'::jsonb
     ) <> 'applicable' then
    raise exception 'Az importőri szolgáltatóvá válás pontosítása nem jelenik meg.';
  end if;

  if public.aic_applicability_state(
       v_condition,
       '{"organisation_roles":["provider"]}'::jsonb
     ) <> 'not_applicable' then
    raise exception 'A már szolgáltató szervezetnél feleslegesen jelenik meg a szerepváltási kérdés.';
  end if;
end;
$assertions$;

commit;
