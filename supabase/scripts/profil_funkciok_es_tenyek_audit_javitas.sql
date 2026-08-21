-- Profilonkénti funkcióhatárok és a származtatott rendszertények tiszta újraépítése.

alter table public.aic_usage_profiles
  add column if not exists optional_capability_codes text[] not null default '{}'::text[],
  add column if not exists forbidden_capability_codes text[] not null default '{}'::text[];

alter table public.aic_usage_profiles
  drop constraint if exists aic_usage_profiles_capability_sets_disjoint;

alter table public.aic_usage_profiles
  add constraint aic_usage_profiles_capability_sets_disjoint check (
    not (coalesce(capability_codes,'{}'::text[]) && optional_capability_codes)
    and not (coalesce(capability_codes,'{}'::text[]) && forbidden_capability_codes)
    and not (optional_capability_codes && forbidden_capability_codes)
  );

update public.aic_usage_profiles set
  capability_codes=array['GENERAL_INFORMATION','ENERGY_INFORMATION'],
  optional_capability_codes=array['GENERATIVE_RESPONSES'],
  forbidden_capability_codes=array[
    'BILLING_INFORMATION','CONSUMPTION_METERING_DATA','PERSONAL_ACCOUNT_DATA',
    'METER_READING_INTAKE','COMPLAINT_INTAKE','DEBT_DISCONNECTION_SUPPORT',
    'VULNERABLE_CUSTOMER_SUPPORT'
  ]
where code='ENERGY_CHAT_PUBLIC_INFO';

update public.aic_usage_profiles set
  optional_capability_codes=array['GENERATIVE_RESPONSES'],
  forbidden_capability_codes=array[
    'METER_READING_INTAKE','COMPLAINT_INTAKE','DEBT_DISCONNECTION_SUPPORT',
    'VULNERABLE_CUSTOMER_SUPPORT'
  ]
where code='ENERGY_CHAT_BILLING_CONSUMPTION';

update public.aic_usage_profiles set
  optional_capability_codes=array['GENERATIVE_RESPONSES'],
  forbidden_capability_codes=array[
    'BILLING_INFORMATION','COMPLAINT_INTAKE','DEBT_DISCONNECTION_SUPPORT',
    'VULNERABLE_CUSTOMER_SUPPORT'
  ]
where code='ENERGY_CHAT_METER_READING';

update public.aic_usage_profiles set
  optional_capability_codes=array['GENERATIVE_RESPONSES'],
  forbidden_capability_codes=array[
    'BILLING_INFORMATION','CONSUMPTION_METERING_DATA','METER_READING_INTAKE',
    'DEBT_DISCONNECTION_SUPPORT','VULNERABLE_CUSTOMER_SUPPORT'
  ]
where code='ENERGY_CHAT_COMPLAINT_INTAKE';

update public.aic_usage_profiles set
  optional_capability_codes=array['GENERATIVE_RESPONSES'],
  forbidden_capability_codes=array[
    'BILLING_INFORMATION','CONSUMPTION_METERING_DATA','METER_READING_INTAKE',
    'COMPLAINT_INTAKE','VULNERABLE_CUSTOMER_SUPPORT'
  ]
where code='ENERGY_CHAT_DEBT_DISCONNECTION';

update public.aic_usage_profiles set
  capability_codes=array['GENERAL_INFORMATION','ENERGY_INFORMATION','VULNERABLE_CUSTOMER_SUPPORT'],
  optional_capability_codes=array['PERSONAL_ACCOUNT_DATA','GENERATIVE_RESPONSES'],
  forbidden_capability_codes=array[
    'BILLING_INFORMATION','CONSUMPTION_METERING_DATA','METER_READING_INTAKE',
    'COMPLAINT_INTAKE','DEBT_DISCONNECTION_SUPPORT'
  ]
where code='ENERGY_CHAT_VULNERABLE_SUPPORT';

update public.aic_usage_profiles set
  capability_codes=array['GENERAL_INFORMATION','ENERGY_INFORMATION'],
  optional_capability_codes=array[
    'BILLING_INFORMATION','CONSUMPTION_METERING_DATA','PERSONAL_ACCOUNT_DATA',
    'METER_READING_INTAKE','COMPLAINT_INTAKE','DEBT_DISCONNECTION_SUPPORT',
    'VULNERABLE_CUSTOMER_SUPPORT','GENERATIVE_RESPONSES'
  ],
  forbidden_capability_codes='{}'::text[]
where code='ENERGY_CHAT_COMBINED';

update public.aic_usage_profiles set
  capability_codes=array[
    'GENERAL_INFORMATION','ENERGY_INFORMATION','BILLING_INFORMATION',
    'CONSUMPTION_METERING_DATA','PERSONAL_ACCOUNT_DATA','METER_READING_INTAKE',
    'COMPLAINT_INTAKE','DEBT_DISCONNECTION_SUPPORT','VULNERABLE_CUSTOMER_SUPPORT'
  ],
  optional_capability_codes=array['GENERATIVE_RESPONSES'],
  forbidden_capability_codes='{}'::text[]
where code='ENERGY_CHAT_FULL_SERVICE';

-- A szabalyzatkeszito kapu nemcsak a kotelezo, hanem a profilhoz
-- engedelyezett es tiltott funkciokat is adatbazisszinten ellenorzi.
create or replace function public.aic_require_valid_usage_profile(p_ai_system_id uuid)
returns jsonb
language plpgsql
stable
set search_path=public,pg_temp
as $function$
declare
  v_usage_profile_code text;
  v_profile_code text;
  v_profile_active boolean;
  v_profile_industry_code text;
  v_profile_system_type_code text;
  v_profile_fact_patch jsonb;
  v_required text[];
  v_optional text[];
  v_forbidden text[];
  v_system_industry_code text;
  v_system_type_code text;
  v_facts jsonb;
  v_selected text[];
  v_missing text[];
  v_not_allowed text[];
  v_explicitly_forbidden text[];
begin
  select s.usage_profile_code,p.code,p.active,p.industry_code,p.system_type_code,
         p.fact_patch,p.capability_codes,p.optional_capability_codes,
         p.forbidden_capability_codes,coalesce(s.industry_code,o.industry,'unknown'),
         t.type_code,f.facts
  into v_usage_profile_code,v_profile_code,v_profile_active,v_profile_industry_code,
       v_profile_system_type_code,v_profile_fact_patch,v_required,v_optional,v_forbidden,
       v_system_industry_code,v_system_type_code,v_facts
  from public.aic_ai_systems s
  join public.aic_organisations o on o.id=s.organisation_id
  join public.aic_system_type_templates t on t.id=s.system_type_id
  left join public.aic_usage_profiles p on p.code=s.usage_profile_code
  left join public.aic_system_facts f on f.system_id=s.id
  where s.id=p_ai_system_id and s.inventory_status='active';

  if not found then
    raise exception 'A szabalyzat nem keszitheto el: az MI-rendszer nem talalhato, nem aktiv vagy nincs rendszertipusa.';
  end if;
  if v_usage_profile_code is null or btrim(v_usage_profile_code)='' then
    raise exception 'A szabalyzat nem keszitheto el, mert a rendszerhez nincs ervenyes hasznalati profil rendelve.';
  end if;
  if v_profile_code is null then
    raise exception 'A szabalyzat nem keszitheto el, mert a(z) "%" hasznalati profil nem talalhato a profilkatalogusban.',v_usage_profile_code;
  end if;
  if not v_profile_active then
    raise exception 'A szabalyzat nem keszitheto el, mert a(z) "%" hasznalati profil inaktiv.',v_profile_code;
  end if;
  if v_profile_system_type_code is distinct from v_system_type_code then
    raise exception 'A szabalyzat nem keszitheto el, mert a hasznalati profil rendszertipusa nem egyezik a nyilvantartott rendszer tipusaval.';
  end if;
  if v_profile_industry_code is distinct from v_system_industry_code then
    raise exception 'A szabalyzat nem keszitheto el, mert a hasznalati profil iparaga nem egyezik a rendszer iparagaval.';
  end if;
  if v_facts is null then
    raise exception 'A szabalyzat nem keszitheto el, mert a hasznalati profilhoz szukseges rendszertenyek hianyoznak.';
  end if;
  if not v_facts @> coalesce(v_profile_fact_patch,'{}'::jsonb) then
    raise exception 'A szabalyzat nem keszitheto el, mert a rendszertenyek nem teljesitik a kivalsztott hasznalati profil kotelezo felteteleit.';
  end if;

  select coalesce(array_agg(value order by value),'{}'::text[])
  into v_selected
  from jsonb_array_elements_text(coalesce(v_facts->'capability_codes','[]'::jsonb));

  select coalesce(array_agg(code order by code),'{}'::text[])
  into v_missing from unnest(coalesce(v_required,'{}'::text[])) as item(code)
  where not item.code=any(v_selected);
  if cardinality(v_missing)>0 then
    raise exception 'A szabalyzat nem keszitheto el, mert a hasznalati profil kotelezo funkcioi hianyoznak: %.',array_to_string(v_missing,', ');
  end if;

  select coalesce(array_agg(code order by code),'{}'::text[])
  into v_not_allowed from unnest(v_selected) as item(code)
  where not item.code=any(coalesce(v_required,'{}'::text[])||coalesce(v_optional,'{}'::text[]));
  if cardinality(v_not_allowed)>0 then
    raise exception 'A szabalyzat nem keszitheto el, mert a profilhoz nem engedelyezett funkcio van rogzitve: %.',array_to_string(v_not_allowed,', ');
  end if;

  select coalesce(array_agg(code order by code),'{}'::text[])
  into v_explicitly_forbidden from unnest(v_selected) as item(code)
  where item.code=any(coalesce(v_forbidden,'{}'::text[]));
  if cardinality(v_explicitly_forbidden)>0 then
    raise exception 'A szabalyzat nem keszitheto el, mert a profil altal kizart funkcio van rogzitve: %.',array_to_string(v_explicitly_forbidden,', ');
  end if;

  if v_profile_code='ENERGY_CHAT_COMBINED' and (
    select count(*) from unnest(v_selected) as item(code)
    where item.code=any(array[
      'BILLING_INFORMATION','METER_READING_INTAKE','COMPLAINT_INTAKE',
      'DEBT_DISCONNECTION_SUPPORT','VULNERABLE_CUSTOMER_SUPPORT'
    ])
  )<2 then
    raise exception 'A szabalyzat nem keszitheto el, mert a kombinalt profilhoz legalabb ket konkret ugyfelszolgalati funkcio szukseges.';
  end if;

  return v_facts||jsonb_build_object(
    'usage_profile_code',v_profile_code,'system_type_code',v_system_type_code,
    'industry',v_system_industry_code,'profile_validated',true
  );
end;
$function$;

revoke all on function public.aic_require_valid_usage_profile(uuid) from public,anon;
grant execute on function public.aic_require_valid_usage_profile(uuid) to authenticated;

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
  v_default_facts jsonb;
  v_selected text[];
  v_allowed text[];
  v_before text[];
  v_unknown text[];
  v_not_allowed text[];
  v_forbidden text[];
  v_missing_required text[];
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

  select type_code,coalesce(default_facts,'{}'::jsonb)
  into v_type_code,v_default_facts
  from public.aic_system_type_templates where id=v_system.system_type_id and active;
  if not found then raise exception 'A rendszer típusa nem elérhető.'; end if;

  select coalesce(v_system.industry_code,o.industry)
  into v_industry_code from public.aic_organisations o where o.id=v_system.organisation_id;

  select coalesce(array_agg(distinct selected_code.code order by selected_code.code),'{}'::text[])
  into v_selected
  from unnest(coalesce(p_capability_codes,'{}'::text[])) as selected_code(code);

  v_allowed:=coalesce(v_profile.capability_codes,'{}'::text[])
    ||coalesce(v_profile.optional_capability_codes,'{}'::text[]);

  select coalesce(array_agg(selected_code.code order by selected_code.code),'{}'::text[])
  into v_unknown
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

  select coalesce(array_agg(selected_code.code order by selected_code.code),'{}'::text[])
  into v_not_allowed from unnest(v_selected) as selected_code(code)
  where not selected_code.code=any(v_allowed);
  if cardinality(v_not_allowed)>0 then
    raise exception 'A kiválasztott profilhoz nem engedélyezett funkció: %.',array_to_string(v_not_allowed,', ');
  end if;

  select coalesce(array_agg(selected_code.code order by selected_code.code),'{}'::text[])
  into v_forbidden from unnest(v_selected) as selected_code(code)
  where selected_code.code=any(coalesce(v_profile.forbidden_capability_codes,'{}'::text[]));
  if cardinality(v_forbidden)>0 then
    raise exception 'A kiválasztott profil kizárja ezt a funkciót: %.',array_to_string(v_forbidden,', ');
  end if;

  select coalesce(array_agg(required_code.code order by required_code.code),'{}'::text[])
  into v_missing_required
  from unnest(coalesce(v_profile.capability_codes,'{}'::text[])) as required_code(code)
  where not required_code.code=any(v_selected);
  if cardinality(v_missing_required)>0 then
    raise exception 'A profil kötelező funkciói nem távolíthatók el: %.',array_to_string(v_missing_required,', ');
  end if;

  if v_profile.code='ENERGY_CHAT_COMBINED' then
    select count(*) into v_special_count
    from unnest(v_selected) as selected_code(code)
    where selected_code.code=any(array[
      'BILLING_INFORMATION','METER_READING_INTAKE','COMPLAINT_INTAKE',
      'DEBT_DISCONNECTION_SUPPORT','VULNERABLE_CUSTOMER_SUPPORT'
    ]);
    if v_special_count<2 then
      raise exception 'A kombinált profilhoz legalább két konkrét ügyfélszolgálati funkció szükséges.';
    end if;
  end if;

  select coalesce(array_agg(capability_code order by capability_code),'{}'::text[])
  into v_before from public.aic_ai_system_capabilities where system_id=p_system_id;

  delete from public.aic_ai_system_capabilities where system_id=p_system_id;
  insert into public.aic_ai_system_capabilities(system_id,capability_code,confirmed_by)
  select p_system_id,selected_code.code,v_user_id
  from unnest(v_selected) as selected_code(code);

  -- Nem a régi JSON-t foltozzuk: a hiteles forrásokból tisztán újraépítjük.
  v_facts:=v_default_facts
    ||jsonb_build_object('industry',v_industry_code,'system_name',v_system.name)
    ||coalesce(v_profile.fact_patch,'{}'::jsonb);

  for v_capability in
    select fact_patch from public.aic_capabilities
    where code=any(v_selected) and active order by sort_order,code
  loop
    v_facts:=v_facts||coalesce(v_capability.fact_patch,'{}'::jsonb);
  end loop;

  v_facts:=v_facts||jsonb_build_object(
    'capability_codes',to_jsonb(v_selected),
    'usage_profile_code',v_profile.code,
    'profile_conditions_confirmed',true,
    'profile_confirmed_at',now()
  );

  insert into public.aic_system_facts(system_id,facts,completion_status,updated_by,updated_at)
  values(p_system_id,v_facts,'complete',v_user_id,now())
  on conflict(system_id) do update set
    facts=excluded.facts,completion_status='complete',updated_by=v_user_id,updated_at=now();

  insert into public.aic_system_change_log(
    organisation_id,system_id,changed_by,change_type,before_data,after_data
  ) values (
    v_system.organisation_id,p_system_id,v_user_id,'reclassification',
    jsonb_build_object('capability_codes',to_jsonb(v_before)),
    jsonb_build_object('capability_codes',to_jsonb(v_selected),'facts_rebuilt',true)
  );
end;
$function$;

revoke all on function public.aic_update_system_capabilities(uuid,text[],boolean) from public,anon;
grant execute on function public.aic_update_system_capabilities(uuid,text[],boolean) to authenticated;

-- Egyszeri adatjavítás: minden aktív, profilhoz rendelt rendszer származtatott tényeit újraépíti.
do $cleanup$
declare
  r record;
  v_selected text[];
  v_facts jsonb;
  v_capability record;
begin
  for r in
    select s.id,s.name,s.industry_code,s.usage_profile_code,o.industry as organisation_industry,
           p.fact_patch,t.default_facts
    from public.aic_ai_systems s
    join public.aic_organisations o on o.id=s.organisation_id
    join public.aic_usage_profiles p on p.code=s.usage_profile_code and p.active
    join public.aic_system_type_templates t on t.id=s.system_type_id and t.active
    where s.inventory_status='active'
  loop
    select coalesce(array_agg(capability_code order by capability_code),'{}'::text[])
    into v_selected from public.aic_ai_system_capabilities where system_id=r.id;

    v_facts:=coalesce(r.default_facts,'{}'::jsonb)
      ||jsonb_build_object(
        'industry',coalesce(r.industry_code,r.organisation_industry),
        'system_name',r.name
      )
      ||coalesce(r.fact_patch,'{}'::jsonb);

    for v_capability in
      select fact_patch from public.aic_capabilities
      where code=any(v_selected) and active order by sort_order,code
    loop
      v_facts:=v_facts||coalesce(v_capability.fact_patch,'{}'::jsonb);
    end loop;

    v_facts:=v_facts||jsonb_build_object(
      'capability_codes',to_jsonb(v_selected),
      'usage_profile_code',r.usage_profile_code,
      'profile_conditions_confirmed',true,
      'profile_confirmed_at',now()
    );

    update public.aic_system_facts
    set facts=v_facts,completion_status='complete',updated_at=now()
    where system_id=r.id;
  end loop;
end;
$cleanup$;
