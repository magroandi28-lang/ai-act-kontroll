-- Első determinisztikus használati profil.
-- Az adatbázisban már alkalmazva; GitHubon a reprodukálhatóságot szolgálja.

begin;

create table if not exists public.aic_usage_profiles (
  code text primary key,
  industry_code text not null references public.aic_industries(code),
  system_type_code text not null references public.aic_system_type_templates(type_code),
  name_hu text not null,
  description_hu text not null,
  intended_purpose_template text not null,
  system_description_template text not null,
  required_assertions jsonb not null default '[]',
  capability_codes text[] not null default '{}',
  fact_patch jsonb not null default '{}',
  active boolean not null default true,
  sort_order integer not null default 100,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint aic_usage_profiles_assertions_array check(jsonb_typeof(required_assertions)='array'),
  constraint aic_usage_profiles_fact_patch_object check(jsonb_typeof(fact_patch)='object')
);

alter table public.aic_ai_systems add column if not exists usage_profile_code text
  references public.aic_usage_profiles(code);
create index if not exists aic_usage_profiles_lookup_idx
  on public.aic_usage_profiles(industry_code,system_type_code,active,sort_order);
create index if not exists aic_ai_systems_usage_profile_idx
  on public.aic_ai_systems(usage_profile_code);

alter table public.aic_usage_profiles enable row level security;
drop policy if exists usage_profiles_read_active on public.aic_usage_profiles;
create policy usage_profiles_read_active on public.aic_usage_profiles
for select to authenticated using(active=true);
grant select on public.aic_usage_profiles to authenticated;

insert into public.aic_usage_profiles(
  code,industry_code,system_type_code,name_hu,description_hu,
  intended_purpose_template,system_description_template,required_assertions,
  capability_codes,fact_patch,sort_order
) values (
  'ENERGY_CHAT_BILLING_CONSUMPTION','energy','CUSTOMER_CHATBOT',
  'Számla- és fogyasztási ügyintézés',
  'Bejelentkezett energetikai ügyfelek saját számla-, fogyasztási és mérési adatainak megjelenítését és magyarázatát támogató chatbot.',
  'Bejelentkezett ügyfelek saját számlázási, fogyasztási és mérési adatainak megjelenítése és közérthető magyarázata.',
  'A chatbot hiteles vállalati adatforrásból jeleníti meg az ügyfél saját számla-, fogyasztási és mérési adatait. Számlát nem módosít, pénzügyi vagy joghatású döntést nem hoz, és szükség esetén emberi ügyintézőhöz irányít.',
  '["Ügyfélkapcsolati chatbotként, energetikai környezetben működik.","Számlázási, fogyasztási vagy mérési adatokat kezel.","Személyes adatot csak az ügyfél megfelelő azonosítása után jelenít meg.","Az adatokat hiteles vállalati rendszerből kapja.","Számlát nem módosít, és pénzügyi vagy joghatású döntést nem hoz.","Szükség esetén emberi ügyintézőhöz továbbít."]'::jsonb,
  array['GENERAL_INFORMATION','ENERGY_INFORMATION','BILLING_INFORMATION','CONSUMPTION_METERING_DATA','PERSONAL_ACCOUNT_DATA'],
  '{"requires_customer_authentication":true,"uses_controlled_knowledge_sources":true,"requires_human_handoff":true,"makes_legally_effective_decisions":false,"can_modify_invoice":false}'::jsonb,
  10
)
on conflict(code) do update set
  industry_code=excluded.industry_code,system_type_code=excluded.system_type_code,
  name_hu=excluded.name_hu,description_hu=excluded.description_hu,
  intended_purpose_template=excluded.intended_purpose_template,
  system_description_template=excluded.system_description_template,
  required_assertions=excluded.required_assertions,capability_codes=excluded.capability_codes,
  fact_patch=excluded.fact_patch,active=true,sort_order=excluded.sort_order,updated_at=now();

create or replace function public.aic_create_ai_system_from_profile(
  p_organisation_id uuid,p_name text,p_profile_code text,p_conditions_confirmed boolean
) returns uuid language plpgsql set search_path to 'public','pg_temp' as $function$
declare
  v_profile public.aic_usage_profiles%rowtype;
  v_system_type_id uuid; v_system_id uuid; v_user_id uuid:=auth.uid();
begin
  if v_user_id is null then raise exception 'A rendszer rögzítéséhez bejelentkezés szükséges.'; end if;
  if p_conditions_confirmed is distinct from true then raise exception 'A profil kötelező feltételeit meg kell erősíteni.'; end if;
  if nullif(trim(p_name),'') is null then raise exception 'A rendszer neve kötelező.'; end if;
  select * into v_profile from public.aic_usage_profiles where code=p_profile_code and active;
  if not found then raise exception 'A kiválasztott használati profil nem elérhető.'; end if;
  select id into v_system_type_id from public.aic_system_type_templates
    where type_code=v_profile.system_type_code and active;
  if not found then raise exception 'A profilhoz tartozó rendszertípus nem elérhető.'; end if;

  v_system_id:=public.aic_create_ai_system(
    p_organisation_id,p_name,v_system_type_id,v_profile.industry_code,
    v_profile.intended_purpose_template,v_profile.system_description_template,
    null,'deployer',null,'production',v_profile.capability_codes
  );
  update public.aic_ai_systems set usage_profile_code=v_profile.code,updated_at=now() where id=v_system_id;
  update public.aic_system_facts set
    facts=facts||v_profile.fact_patch||jsonb_build_object(
      'usage_profile_code',v_profile.code,'profile_conditions_confirmed',true,'profile_confirmed_at',now()),
    updated_at=now() where system_id=v_system_id;
  return v_system_id;
end;
$function$;

revoke all on function public.aic_create_ai_system_from_profile(uuid,text,text,boolean) from public,anon;
grant execute on function public.aic_create_ai_system_from_profile(uuid,text,text,boolean) to authenticated;

commit;
