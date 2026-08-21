-- EnergiaAI Kontroll: bővíthető iparág- és képességkatalógus.
-- A Supabase projektben 2026-08-13-án alkalmazott, reprodukálható séma.

begin;

create table if not exists public.aic_industries (
  code text primary key, name_hu text not null, description_hu text not null,
  active boolean not null default true, sort_order integer not null default 100,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);

create table if not exists public.aic_capabilities (
  code text primary key, name_hu text not null, description_hu text not null,
  selection_hint_hu text not null, system_type_codes text[] not null default '{}',
  industry_codes text[] not null default '{}', fact_patch jsonb not null default '{}',
  active boolean not null default true, sort_order integer not null default 100,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(),
  constraint aic_capabilities_fact_patch_object check (jsonb_typeof(fact_patch)='object')
);

alter table public.aic_ai_systems add column if not exists industry_code text
  references public.aic_industries(code);

create table if not exists public.aic_ai_system_capabilities (
  system_id uuid not null references public.aic_ai_systems(id) on delete cascade,
  capability_code text not null references public.aic_capabilities(code),
  confirmed_by uuid not null references auth.users(id), confirmed_at timestamptz not null default now(),
  primary key(system_id,capability_code)
);

create index if not exists aic_ai_systems_industry_code_idx on public.aic_ai_systems(industry_code);
create index if not exists aic_ai_system_capabilities_capability_idx on public.aic_ai_system_capabilities(capability_code);

alter table public.aic_industries enable row level security;
alter table public.aic_capabilities enable row level security;
alter table public.aic_ai_system_capabilities enable row level security;

drop policy if exists industries_read_active on public.aic_industries;
create policy industries_read_active on public.aic_industries for select to authenticated using(active=true);
drop policy if exists capabilities_read_active on public.aic_capabilities;
create policy capabilities_read_active on public.aic_capabilities for select to authenticated using(active=true);
drop policy if exists system_capabilities_select on public.aic_ai_system_capabilities;
create policy system_capabilities_select on public.aic_ai_system_capabilities for select to authenticated using(
  exists(select 1 from public.aic_ai_systems s join public.aic_organisation_members m on m.organisation_id=s.organisation_id
    where s.id=system_id and m.user_id=(select auth.uid()))
);
drop policy if exists system_capabilities_insert on public.aic_ai_system_capabilities;
create policy system_capabilities_insert on public.aic_ai_system_capabilities for insert to authenticated with check(
  confirmed_by=(select auth.uid()) and exists(
    select 1 from public.aic_ai_systems s join public.aic_organisation_members m on m.organisation_id=s.organisation_id
    where s.id=system_id and m.user_id=(select auth.uid()) and m.member_role in ('owner','admin','compliance','editor'))
);
drop policy if exists system_capabilities_delete on public.aic_ai_system_capabilities;
create policy system_capabilities_delete on public.aic_ai_system_capabilities for delete to authenticated using(
  exists(select 1 from public.aic_ai_systems s join public.aic_organisation_members m on m.organisation_id=s.organisation_id
    where s.id=system_id and m.user_id=(select auth.uid()) and m.member_role in ('owner','admin','compliance','editor'))
);

grant select on public.aic_industries,public.aic_capabilities to authenticated;
grant select,insert,delete on public.aic_ai_system_capabilities to authenticated;

insert into public.aic_industries(code,name_hu,description_hu,sort_order) values
('energy','Energetika','Villamosenergia-, földgáz- és kapcsolódó energetikai szolgáltatások.',10)
on conflict(code) do update set name_hu=excluded.name_hu,description_hu=excluded.description_hu,
active=true,sort_order=excluded.sort_order,updated_at=now();

insert into public.aic_capabilities
(code,name_hu,description_hu,selection_hint_hu,system_type_codes,industry_codes,fact_patch,sort_order) values
('GENERAL_INFORMATION','Általános ügyféltájékoztatás','Nyilvános, általános információkat ad a szolgáltatásokról és ügyintézésről.','Akkor válaszd, ha ügyfél-azonosítás nélkül is elérhető tájékoztatást ad.',array['CUSTOMER_CHATBOT'],'{}','{"provides_general_information":true}',10),
('ENERGY_INFORMATION','Energetikai tájékoztatás','Energiaellátásról, tarifákról vagy ügyintézési folyamatról tájékoztat.','Akkor válaszd, ha energetikai szakmai vagy szolgáltatási információt közöl.',array['CUSTOMER_CHATBOT'],array['energy'],'{"provides_energy_information":true}',20),
('BILLING_INFORMATION','Számlázási tájékoztatás','Számlák tartalmát és a számlázási folyamatot magyarázza, de számlát nem módosít.','Akkor válaszd, ha számlázási kérdésekre válaszol vagy számlatételeket magyaráz.',array['CUSTOMER_CHATBOT'],array['energy'],'{"handles_billing_information":true}',30),
('CONSUMPTION_METERING_DATA','Fogyasztási vagy mérési adatok használata','Fogyasztási adatot, mérőállást vagy mérési eredményt kér le, jelenít meg vagy fogad.','Akkor válaszd, ha a dokumentáció fogyasztási vagy mérési adatok kezelését írja le.',array['CUSTOMER_CHATBOT'],array['energy'],'{"handles_metering_information":true,"uses_consumption_data":true}',40),
('PERSONAL_ACCOUNT_DATA','Személyes ügyféladatok elérése','Bejelentkezett ügyfél fiók-, szerződés- vagy számlaadatait használja.','Akkor válaszd, ha azonosítás után az adott ügyfél saját adataihoz hozzáfér.',array['CUSTOMER_CHATBOT'],'{}','{"accesses_personal_account_data":true,"processes_personal_data":true}',50),
('METER_READING_INTAKE','Mérőállás fogadása','Az ügyfél által megadott mérőállást rögzíti vagy továbbítja.','Akkor válaszd, ha mérőállás diktálására vagy beküldésére használható.',array['CUSTOMER_CHATBOT'],array['energy'],'{"accepts_meter_reading":true,"handles_metering_information":true}',60),
('COMPLAINT_INTAKE','Panasz rögzítése és továbbítása','Felismeri, rögzíti és panaszkezelési folyamatba továbbítja a panaszt.','Akkor válaszd, ha a chatbotban panasz indítható.',array['CUSTOMER_CHATBOT'],'{}','{"accepts_complaints":true}',70),
('DEBT_DISCONNECTION_SUPPORT','Tartozási és kikapcsolási tájékoztatás','Tartozásról, kikapcsolásról vagy visszakapcsolásról tájékoztat, de nem dönt.','Akkor válaszd, ha ilyen ügyeket kezel vagy emberhez irányít.',array['CUSTOMER_CHATBOT'],array['energy'],'{"handles_disconnection_information":true}',80),
('VULNERABLE_CUSTOMER_SUPPORT','Védendő fogyasztói ügyek támogatása','Védendő fogyasztói ügyet felismer és emberi folyamatba továbbít.','Akkor válaszd, ha ilyen státusszal vagy kedvezménnyel kapcsolatos ügyet fogad.',array['CUSTOMER_CHATBOT'],array['energy'],'{"handles_vulnerable_customer_matters":true}',90),
('GENERATIVE_RESPONSES','Generatív válaszok készítése','A rendszer előre rögzített válaszok mellett vagy helyett új szöveget állít elő.','Akkor válaszd, ha a dokumentáció generatív MI-modellt említ.',array['CUSTOMER_CHATBOT'],'{}','{"generates_content":true}',100)
on conflict(code) do update set name_hu=excluded.name_hu,description_hu=excluded.description_hu,
selection_hint_hu=excluded.selection_hint_hu,system_type_codes=excluded.system_type_codes,
industry_codes=excluded.industry_codes,fact_patch=excluded.fact_patch,active=true,
sort_order=excluded.sort_order,updated_at=now();

commit;

create or replace function public.aic_create_ai_system(
  p_organisation_id uuid, p_name text, p_system_type_id uuid, p_industry_code text,
  p_intended_purpose text, p_description text default null, p_provider_name text default null,
  p_organisation_role text default 'deployer', p_deployment_context text default null,
  p_lifecycle_stage text default 'planned', p_capability_codes text[] default '{}'
) returns uuid language plpgsql set search_path to 'public','pg_temp' as $function$
declare
  v_user_id uuid:=auth.uid(); v_system_id uuid; v_type_code text;
  v_default_facts jsonb; v_facts jsonb; v_capability record;
  v_requested_count integer; v_valid_count integer;
begin
  if v_user_id is null then raise exception 'A rendszer rögzítéséhez bejelentkezés szükséges.'; end if;
  if not exists(select 1 from public.aic_organisation_members m
    where m.organisation_id=p_organisation_id and m.user_id=v_user_id
    and m.member_role in ('owner','admin','compliance','editor')) then
    raise exception 'Nincs jogosultságod ehhez a szervezethez MI-rendszert rögzíteni.';
  end if;

  select type_code,default_facts into v_type_code,v_default_facts
  from public.aic_system_type_templates where id=p_system_type_id and active=true;
  if not found then raise exception 'A kiválasztott MI-rendszertípus nem elérhető.'; end if;
  if not exists(select 1 from public.aic_industries where code=p_industry_code and active=true) then
    raise exception 'A kiválasztott iparág nem elérhető.';
  end if;

  select count(distinct code) into v_requested_count
  from unnest(coalesce(p_capability_codes,'{}'::text[])) code;
  select count(*) into v_valid_count from public.aic_capabilities c
  where c.code=any(coalesce(p_capability_codes,'{}'::text[])) and c.active
    and (cardinality(c.system_type_codes)=0 or v_type_code=any(c.system_type_codes))
    and (cardinality(c.industry_codes)=0 or p_industry_code=any(c.industry_codes));
  if v_requested_count<>v_valid_count then
    raise exception 'A kiválasztott képességek között érvénytelen elem van.';
  end if;

  insert into public.aic_ai_systems(
    organisation_id,name,system_type_id,industry_code,description,intended_purpose,
    provider_name,organisation_role,deployment_context,lifecycle_stage,created_by,updated_by
  ) values(
    p_organisation_id,trim(regexp_replace(p_name,'\s+',' ','g')),p_system_type_id,
    p_industry_code,nullif(trim(p_description),''),trim(p_intended_purpose),
    nullif(trim(p_provider_name),''),p_organisation_role,nullif(trim(p_deployment_context),''),
    p_lifecycle_stage,v_user_id,v_user_id
  ) returning id into v_system_id;

  v_facts:=coalesce(v_default_facts,'{}'::jsonb)||jsonb_build_object(
    'industry',p_industry_code,'capability_codes',to_jsonb(coalesce(p_capability_codes,'{}'::text[])));
  for v_capability in select c.code,c.fact_patch from public.aic_capabilities c
    where c.code=any(coalesce(p_capability_codes,'{}'::text[])) order by c.sort_order,c.code
  loop
    v_facts:=v_facts||v_capability.fact_patch;
    insert into public.aic_ai_system_capabilities(system_id,capability_code,confirmed_by)
    values(v_system_id,v_capability.code,v_user_id);
  end loop;
  insert into public.aic_system_facts(system_id,facts,completion_status,updated_by)
  values(v_system_id,v_facts,'complete',v_user_id);
  return v_system_id;
end;
$function$;

revoke all on function public.aic_create_ai_system(uuid,text,uuid,text,text,text,text,text,text,text,text[]) from public,anon;
grant execute on function public.aic_create_ai_system(uuid,text,uuid,text,text,text,text,text,text,text,text[]) to authenticated;

update public.aic_policy_modules set
  applicability=jsonb_set(applicability,'{required_facts}',
    coalesce(applicability->'required_facts','{}'::jsonb)||'{"handles_disconnection_information":true}'::jsonb,true),
  version=version+1,updated_at=now()
where module_code='ENERGY_DISCONNECTION_RECONNECTION'
  and not(coalesce(applicability->'required_facts','{}'::jsonb) @> '{"handles_disconnection_information":true}'::jsonb);

update public.aic_policy_modules set
  applicability=jsonb_set(applicability,'{required_facts}',
    coalesce(applicability->'required_facts','{}'::jsonb)||'{"handles_vulnerable_customer_matters":true}'::jsonb,true),
  version=version+1,updated_at=now()
where module_code='ENERGY_VULNERABLE_CUSTOMER'
  and not(coalesce(applicability->'required_facts','{}'::jsonb) @> '{"handles_vulnerable_customer_matters":true}'::jsonb);

-- A generátor a szervezet általános iparága helyett elsőként az adott MI-rendszer iparágát használja.
do $do$
declare v_definition text;
begin
  select pg_get_functiondef('public.aic_generate_policy(uuid)'::regprocedure) into v_definition;
  v_definition:=replace(v_definition,'t.type_code, o.industry,','t.type_code, coalesce(s.industry_code, o.industry),');
  v_definition:=replace(v_definition,'''industry'', coalesce(o.industry, ''unknown'')','''industry'', coalesce(s.industry_code, o.industry, ''unknown'')');
  execute v_definition;
  select pg_get_functiondef('public.aic_generate_policy_if_changed(uuid)'::regprocedure) into v_definition;
  v_definition:=replace(v_definition,'''industry'', coalesce(o.industry, ''unknown'')','''industry'', coalesce(s.industry_code, o.industry, ''unknown'')');
  execute v_definition;
end
$do$;
