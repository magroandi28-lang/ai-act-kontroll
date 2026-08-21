begin;

update public.aic_trigger_catalogue
set name_hu = 'A szervezet szolgáltatóvá válása',
    updated_at = now()
where trigger_key = 'BECOMES_PROVIDER';

do $assertions$
begin
  if not exists (
    select 1 from public.aic_trigger_catalogue
    where trigger_key = 'BECOMES_PROVIDER'
      and name_hu = 'A szervezet szolgáltatóvá válása'
  ) then
    raise exception 'A szerepsemleges megnevezés frissítése sikertelen.';
  end if;
end;
$assertions$;

commit;
