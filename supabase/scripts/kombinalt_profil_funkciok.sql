-- A kombinált profil csak legalább két igazolt, konkrét funkcióval használható.

create or replace function public.aic_update_combined_profile_capabilities(
  p_system_id uuid,
  p_capability_codes text[],
  p_conditions_confirmed boolean
)
returns void
language plpgsql
security definer
set search_path = public, pg_temp
as $function$
declare
  v_user_id uuid := auth.uid();
  v_system public.aic_ai_systems%rowtype;
  v_allowed constant text[] := array[
    'BILLING_INFORMATION','METER_READING_INTAKE','COMPLAINT_INTAKE',
    'DEBT_DISCONNECTION_SUPPORT','VULNERABLE_CUSTOMER_SUPPORT'
  ];
  v_selected text[];
  v_before text[];
  v_all_codes text[];
  v_facts jsonb;
  v_capability record;
begin
  if v_user_id is null then raise exception 'A módosításhoz bejelentkezés szükséges.'; end if;
  if p_conditions_confirmed is distinct from true then raise exception 'A funkciók hitelességét meg kell erősíteni.'; end if;

  select * into v_system from public.aic_ai_systems
  where id=p_system_id and inventory_status='active' for update;
  if not found then raise exception 'Az MI-rendszer nem található vagy nem aktív.'; end if;
  if v_system.usage_profile_code <> 'ENERGY_CHAT_COMBINED' then
    raise exception 'Ezen az oldalon csak a kombinált profil funkciói módosíthatók.';
  end if;
  if not exists (
    select 1 from public.aic_organisation_members
    where organisation_id=v_system.organisation_id and user_id=v_user_id
      and member_role in ('owner','admin','compliance','editor')
  ) then raise exception 'Nincs jogosultságod a rendszer módosításához.'; end if;

  select coalesce(array_agg(distinct code order by code),'{}'::text[])
  into v_selected from unnest(coalesce(p_capability_codes,'{}'::text[])) code
  where code=any(v_allowed);
  if cardinality(v_selected) < 2 then
    raise exception 'A kombinált profilhoz legalább két konkrét funkció szükséges.';
  end if;
  if exists (select 1 from unnest(coalesce(p_capability_codes,'{}'::text[])) code where not code=any(v_allowed)) then
    raise exception 'A kiválasztott funkciók egyike nem használható ebben a profilban.';
  end if;

  select coalesce(array_agg(capability_code order by capability_code),'{}'::text[])
  into v_before from public.aic_ai_system_capabilities where system_id=p_system_id;

  delete from public.aic_ai_system_capabilities
  where system_id=p_system_id and capability_code=any(v_allowed);
  insert into public.aic_ai_system_capabilities(system_id,capability_code,confirmed_by)
  select p_system_id,code,v_user_id from unnest(v_selected) code
  on conflict(system_id,capability_code) do update
    set confirmed_by=excluded.confirmed_by,confirmed_at=now();

  v_all_codes := array['GENERAL_INFORMATION','ENERGY_INFORMATION']::text[] || v_selected;
  if v_selected && array['BILLING_INFORMATION','METER_READING_INTAKE','COMPLAINT_INTAKE','DEBT_DISCONNECTION_SUPPORT','VULNERABLE_CUSTOMER_SUPPORT']::text[] then
    v_all_codes := v_all_codes || array['PERSONAL_ACCOUNT_DATA'];
  end if;
  if 'BILLING_INFORMATION'=any(v_selected) then v_all_codes:=v_all_codes||array['CONSUMPTION_METERING_DATA']; end if;
  if 'METER_READING_INTAKE'=any(v_selected) then v_all_codes:=v_all_codes||array['CONSUMPTION_METERING_DATA']; end if;
  select array_agg(distinct code order by code) into v_all_codes from unnest(v_all_codes) code;

  select facts into v_facts from public.aic_system_facts where system_id=p_system_id for update;
  v_facts := coalesce(v_facts,'{}'::jsonb) - array[
    'handles_billing_information','uses_consumption_data','handles_metering_information',
    'accepts_meter_reading','accepts_complaints','handles_disconnection_information',
    'handles_vulnerable_customer_matters','processes_personal_data','accesses_personal_account_data'
  ];
  for v_capability in select fact_patch from public.aic_capabilities where code=any(v_all_codes) and active order by sort_order,code loop
    v_facts:=v_facts||coalesce(v_capability.fact_patch,'{}'::jsonb);
  end loop;
  v_facts:=v_facts||jsonb_build_object(
    'capability_codes',to_jsonb(v_all_codes),
    'profile_conditions_confirmed',true,
    'profile_confirmed_at',now()
  );
  insert into public.aic_system_facts(system_id,facts,completion_status,updated_by,updated_at)
  values(p_system_id,v_facts,'complete',v_user_id,now())
  on conflict(system_id) do update set facts=excluded.facts,completion_status='complete',updated_by=v_user_id,updated_at=now();

  insert into public.aic_system_change_log(
    organisation_id,system_id,changed_by,change_type,before_data,after_data
  ) values (
    v_system.organisation_id,p_system_id,v_user_id,'reclassification',
    jsonb_build_object('capability_codes',to_jsonb(v_before)),
    jsonb_build_object('capability_codes',to_jsonb(v_all_codes))
  );
end;
$function$;

revoke all on function public.aic_update_combined_profile_capabilities(uuid,text[],boolean) from public, anon;
grant execute on function public.aic_update_combined_profile_capabilities(uuid,text[],boolean) to authenticated;

-- A szabálymotor adatbázis-oldali védelme.
create or replace function public.aic_require_valid_usage_profile(p_ai_system_id uuid)
returns jsonb
language plpgsql
stable
set search_path = public, pg_temp
as $function$
declare
  v_usage_profile_code text; v_profile_code text; v_profile_active boolean;
  v_profile_industry_code text; v_profile_system_type_code text;
  v_profile_fact_patch jsonb; v_profile_capability_codes text[];
  v_system_industry_code text; v_system_type_code text; v_facts jsonb;
  v_missing_capabilities text[]; v_combined_count integer;
begin
  select s.usage_profile_code,p.code,p.active,p.industry_code,p.system_type_code,p.fact_patch,p.capability_codes,
    coalesce(s.industry_code,o.industry,'unknown'),t.type_code,f.facts
  into v_usage_profile_code,v_profile_code,v_profile_active,v_profile_industry_code,v_profile_system_type_code,
    v_profile_fact_patch,v_profile_capability_codes,v_system_industry_code,v_system_type_code,v_facts
  from public.aic_ai_systems s
  join public.aic_organisations o on o.id=s.organisation_id
  join public.aic_system_type_templates t on t.id=s.system_type_id
  left join public.aic_usage_profiles p on p.code=s.usage_profile_code
  left join public.aic_system_facts f on f.system_id=s.id
  where s.id=p_ai_system_id and s.inventory_status='active';

  if not found then raise exception 'A szabályzat nem készíthető el: az MI-rendszer nem található, nem aktív vagy nincs rendszertípusa.'; end if;
  if v_usage_profile_code is null or btrim(v_usage_profile_code)='' then raise exception 'A szabályzat nem készíthető el, mert a rendszerhez nincs érvényes használati profil rendelve.'; end if;
  if v_profile_code is null then raise exception 'A szabályzat nem készíthető el, mert a(z) "%" használati profil nem található a profilkatalógusban.',v_usage_profile_code; end if;
  if not v_profile_active then raise exception 'A szabályzat nem készíthető el, mert a(z) "%" használati profil inaktív.',v_profile_code; end if;
  if v_profile_system_type_code is distinct from v_system_type_code then raise exception 'A szabályzat nem készíthető el, mert a használati profil rendszertípusa nem egyezik a nyilvántartott rendszer típusával.'; end if;
  if v_profile_industry_code is distinct from v_system_industry_code then raise exception 'A szabályzat nem készíthető el, mert a használati profil iparága nem egyezik a rendszer iparágával.'; end if;
  if v_facts is null then raise exception 'A szabályzat nem készíthető el, mert a használati profilhoz szükséges rendszertények hiányoznak.'; end if;
  if not v_facts @> coalesce(v_profile_fact_patch,'{}'::jsonb) then raise exception 'A szabályzat nem készíthető el, mert a rendszertények nem teljesítik a kiválasztott használati profil kötelező feltételeit.'; end if;

  select coalesce(array_agg(required_code order by required_code),'{}'::text[])
  into v_missing_capabilities from unnest(coalesce(v_profile_capability_codes,'{}'::text[])) required_code
  where not coalesce(v_facts->'capability_codes','[]'::jsonb) ? required_code;
  if cardinality(v_missing_capabilities)>0 then raise exception 'A szabályzat nem készíthető el, mert a használati profil kötelező képességei hiányoznak: %.',array_to_string(v_missing_capabilities,', '); end if;

  if v_profile_code='ENERGY_CHAT_COMBINED' then
    select count(*) into v_combined_count from jsonb_array_elements_text(coalesce(v_facts->'capability_codes','[]'::jsonb)) code
    where code=any(array['BILLING_INFORMATION','METER_READING_INTAKE','COMPLAINT_INTAKE','DEBT_DISCONNECTION_SUPPORT','VULNERABLE_CUSTOMER_SUPPORT']);
    if v_combined_count<2 then
      raise exception 'A szabályzat még nem készíthető el: a kombinált profilhoz előbb legalább két konkrét funkciót kell megadni a szerkesztőoldalon.';
    end if;
  end if;

  return v_facts||jsonb_build_object('usage_profile_code',v_profile_code,'system_type_code',v_system_type_code,'industry',v_system_industry_code,'profile_validated',true);
end;
$function$;

