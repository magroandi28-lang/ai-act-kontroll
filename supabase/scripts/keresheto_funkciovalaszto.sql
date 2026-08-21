-- Adatbázis-vezérelt, minden profilnál használható funkcióbővítés.

create or replace function public.aic_update_system_capabilities(
  p_system_id uuid,
  p_capability_codes text[],
  p_conditions_confirmed boolean
)
returns void
language plpgsql
security definer
set search_path=public,pg_temp
as $function$
declare
  v_user_id uuid:=auth.uid();
  v_system public.aic_ai_systems%rowtype;
  v_profile public.aic_usage_profiles%rowtype;
  v_type_code text;
  v_industry_code text;
  v_selected text[];
  v_before text[];
  v_unknown text[];
  v_missing_required text[];
  v_fact_keys text[];
  v_facts jsonb;
  v_capability record;
  v_special_count integer;
begin
  if v_user_id is null then raise exception 'A módosításhoz bejelentkezés szükséges.'; end if;
  if p_conditions_confirmed is distinct from true then raise exception 'A funkciók mentését meg kell erősíteni.'; end if;

  select * into v_system from public.aic_ai_systems
  where id=p_system_id and inventory_status='active' for update;
  if not found then raise exception 'Az MI-rendszer nem található vagy nem aktív.'; end if;
  if not exists (
    select 1 from public.aic_organisation_members
    where organisation_id=v_system.organisation_id and user_id=v_user_id
      and member_role in ('owner','admin','compliance','editor')
  ) then raise exception 'Nincs jogosultságod a rendszer módosításához.'; end if;

  select * into v_profile from public.aic_usage_profiles
  where code=v_system.usage_profile_code and active;
  if not found then raise exception 'A rendszerhez nincs aktív használati profil rendelve.'; end if;
  select type_code into v_type_code from public.aic_system_type_templates where id=v_system.system_type_id;
  select coalesce(v_system.industry_code,o.industry) into v_industry_code
  from public.aic_organisations o where o.id=v_system.organisation_id;

  select coalesce(array_agg(distinct selected_code.code order by selected_code.code),'{}'::text[])
  into v_selected
  from unnest(coalesce(p_capability_codes,'{}'::text[])) as selected_code(code);

  select coalesce(array_agg(selected_code.code order by selected_code.code),'{}'::text[]) into v_unknown
  from unnest(v_selected) as selected_code(code)
  where not exists (
    select 1 from public.aic_capabilities c
    where c.code=selected_code.code and c.active
      and (coalesce(cardinality(c.system_type_codes),0)=0 or v_type_code=any(c.system_type_codes))
      and (coalesce(cardinality(c.industry_codes),0)=0 or v_industry_code=any(c.industry_codes))
  );
  if cardinality(v_unknown)>0 then
    raise exception 'Nem kompatibilis vagy ismeretlen funkció: %.',array_to_string(v_unknown,', ');
  end if;

  select coalesce(array_agg(required_code.code order by required_code.code),'{}'::text[]) into v_missing_required
  from unnest(coalesce(v_profile.capability_codes,'{}'::text[])) as required_code(code)
  where not required_code.code=any(v_selected);
  if cardinality(v_missing_required)>0 then
    raise exception 'Az alap-profil kötelező funkciói nem távolíthatók el: %.',array_to_string(v_missing_required,', ');
  end if;

  if v_profile.code='ENERGY_CHAT_COMBINED' then
    select count(*) into v_special_count
    from unnest(v_selected) as selected_code(code)
    where selected_code.code=any(array['BILLING_INFORMATION','METER_READING_INTAKE','COMPLAINT_INTAKE','DEBT_DISCONNECTION_SUPPORT','VULNERABLE_CUSTOMER_SUPPORT']);
    if v_special_count<2 then raise exception 'A kombinált profilhoz legalább két konkrét ügyfélszolgálati funkció szükséges.'; end if;
  end if;

  select coalesce(array_agg(capability_code order by capability_code),'{}'::text[])
  into v_before from public.aic_ai_system_capabilities where system_id=p_system_id;
  delete from public.aic_ai_system_capabilities where system_id=p_system_id;
  insert into public.aic_ai_system_capabilities(system_id,capability_code,confirmed_by)
  select p_system_id,selected_code.code,v_user_id
  from unnest(v_selected) as selected_code(code);

  select coalesce(array_agg(distinct key),'{}'::text[]) into v_fact_keys
  from public.aic_capabilities c cross join lateral jsonb_object_keys(coalesce(c.fact_patch,'{}'::jsonb)) key;
  select facts into v_facts from public.aic_system_facts where system_id=p_system_id for update;
  v_facts:=(coalesce(v_facts,'{}'::jsonb)-v_fact_keys)||coalesce(v_profile.fact_patch,'{}'::jsonb);
  for v_capability in select fact_patch from public.aic_capabilities where code=any(v_selected) and active order by sort_order,code loop
    v_facts:=v_facts||coalesce(v_capability.fact_patch,'{}'::jsonb);
  end loop;
  v_facts:=v_facts||jsonb_build_object('capability_codes',to_jsonb(v_selected),'profile_conditions_confirmed',true,'profile_confirmed_at',now());
  insert into public.aic_system_facts(system_id,facts,completion_status,updated_by,updated_at)
  values(p_system_id,v_facts,'complete',v_user_id,now())
  on conflict(system_id) do update set facts=excluded.facts,completion_status='complete',updated_by=v_user_id,updated_at=now();

  insert into public.aic_system_change_log(organisation_id,system_id,changed_by,change_type,before_data,after_data)
  values(v_system.organisation_id,p_system_id,v_user_id,'reclassification',
    jsonb_build_object('capability_codes',to_jsonb(v_before)),jsonb_build_object('capability_codes',to_jsonb(v_selected)));
end;
$function$;

revoke all on function public.aic_update_system_capabilities(uuid,text[],boolean) from public,anon;
grant execute on function public.aic_update_system_capabilities(uuid,text[],boolean) to authenticated;

create or replace function public.aic_create_ai_system_from_profile(
  p_organisation_id uuid,
  p_name text,
  p_profile_code text,
  p_conditions_confirmed boolean,
  p_capability_codes text[]
)
returns uuid
language plpgsql
set search_path=public,pg_temp
as $function$
declare
  v_system_id uuid;
begin
  v_system_id:=public.aic_create_ai_system_from_profile(
    p_organisation_id,p_name,p_profile_code,p_conditions_confirmed
  );
  perform public.aic_update_system_capabilities(
    v_system_id,p_capability_codes,p_conditions_confirmed
  );
  return v_system_id;
end;
$function$;

revoke all on function public.aic_create_ai_system_from_profile(uuid,text,text,boolean,text[]) from public,anon;
grant execute on function public.aic_create_ai_system_from_profile(uuid,text,text,boolean,text[]) to authenticated;

-- A korábbi, kizárólag kombinált profilra készült végpontot az alkalmazás már nem használja.
revoke all on function public.aic_update_combined_profile_capabilities(uuid,text[],boolean) from authenticated;
