-- Strukturált rendszeradatok -> determinisztikus profil -> szabályzat.
-- Nem hoz létre új táblát; a meglévő profil-, képesség- és ténytáblákat használja.

insert into public.aic_usage_profiles(
  code,industry_code,system_type_code,name_hu,description_hu,
  intended_purpose_template,system_description_template,required_assertions,
  capability_codes,fact_patch,sort_order
) values (
  'ENERGY_CHAT_COMBINED','energy','CUSTOMER_CHATBOT','Kombinált energetikai ügyfélszolgálat',
  'Több, de nem teljes körű energetikai ügyfélszolgálati funkciót kapcsol össze.',
  'A táblázatban rögzített energetikai ügyfélszolgálati feladatok támogatása.',
  'A chatbot több dokumentált energetikai ügyfélszolgálati feladatot támogat. A szabályzat kizárólag a rendszerleltárban Igen értékkel megjelölt működésekhez kapcsolja a speciális előírásokat.',
  '["Energetikai ügyfélszolgálati chatbotként működik.","Csak a dokumentált funkciók tekinthetők aktívnak.","Önálló joghatású döntést nem hoz.","Bizonytalan vagy egyedi ügyet emberi ügyintézőhöz továbbít."]',
  array['GENERAL_INFORMATION','ENERGY_INFORMATION'],
  '{"uses_controlled_knowledge_sources":true,"requires_human_handoff":true,"makes_legally_effective_decisions":false}',65
) on conflict(code) do update set
  name_hu=excluded.name_hu,description_hu=excluded.description_hu,
  intended_purpose_template=excluded.intended_purpose_template,
  system_description_template=excluded.system_description_template,
  required_assertions=excluded.required_assertions,capability_codes=excluded.capability_codes,
  fact_patch=excluded.fact_patch,active=true,sort_order=excluded.sort_order,updated_at=now();

create or replace function public.aic_classify_energy_chatbot(p_facts jsonb)
returns jsonb
language plpgsql
immutable
set search_path = public, pg_temp
as $function$
declare
  v_profile_code text;
  v_special_count integer := 0;
  v_errors jsonb := '[]'::jsonb;
begin
  if coalesce(p_facts ->> 'industry_code', '') <> 'energy' then
    v_errors := v_errors || '"Az iparág csak Energetika lehet ebben a katalógusban."'::jsonb;
  end if;
  if coalesce(p_facts ->> 'system_type_code', '') <> 'CUSTOMER_CHATBOT' then
    v_errors := v_errors || '"A rendszertípus csak ügyfélszolgálati chatbot lehet."'::jsonb;
  end if;
  if coalesce((p_facts ->> 'requires_human_handoff')::boolean, false) is not true then
    v_errors := v_errors || '"Az emberi ügyintézőhöz történő átadás kötelező."'::jsonb;
  end if;
  if coalesce((p_facts ->> 'makes_legally_effective_decisions')::boolean, false) is true then
    v_errors := v_errors || '"Önálló joghatású döntést hozó rendszerhez ez a katalógus nem használható."'::jsonb;
  end if;

  v_special_count :=
    case when coalesce((p_facts ->> 'handles_billing_consumption')::boolean, false) then 1 else 0 end +
    case when coalesce((p_facts ->> 'accepts_meter_reading')::boolean, false) then 1 else 0 end +
    case when coalesce((p_facts ->> 'accepts_complaints')::boolean, false) then 1 else 0 end +
    case when coalesce((p_facts ->> 'handles_debt_disconnection')::boolean, false) then 1 else 0 end +
    case when coalesce((p_facts ->> 'handles_vulnerable_customers')::boolean, false) then 1 else 0 end;

  if v_special_count = 5 then v_profile_code := 'ENERGY_CHAT_FULL_SERVICE';
  elsif v_special_count >= 2 then v_profile_code := 'ENERGY_CHAT_COMBINED';
  elsif coalesce((p_facts ->> 'handles_vulnerable_customers')::boolean, false) then v_profile_code := 'ENERGY_CHAT_VULNERABLE_SUPPORT';
  elsif coalesce((p_facts ->> 'handles_debt_disconnection')::boolean, false) then v_profile_code := 'ENERGY_CHAT_DEBT_DISCONNECTION';
  elsif coalesce((p_facts ->> 'accepts_complaints')::boolean, false) then v_profile_code := 'ENERGY_CHAT_COMPLAINT_INTAKE';
  elsif coalesce((p_facts ->> 'accepts_meter_reading')::boolean, false) then v_profile_code := 'ENERGY_CHAT_METER_READING';
  elsif coalesce((p_facts ->> 'handles_billing_consumption')::boolean, false) then v_profile_code := 'ENERGY_CHAT_BILLING_CONSUMPTION';
  else v_profile_code := 'ENERGY_CHAT_PUBLIC_INFO';
  end if;

  return jsonb_build_object(
    'valid', jsonb_array_length(v_errors) = 0,
    'profile_code', v_profile_code,
    'errors', v_errors
  );
exception when invalid_text_representation then
  return jsonb_build_object('valid', false, 'profile_code', null,
    'errors', jsonb_build_array('Az Igen/Nem mezők egyikében érvénytelen érték szerepel.'));
end;
$function$;

create or replace function public.aic_preview_energy_chatbot_import(p_rows jsonb)
returns jsonb
language plpgsql
stable
set search_path = public, pg_temp
as $function$
declare
  v_row jsonb;
  v_result jsonb := '[]'::jsonb;
  v_classification jsonb;
  v_profile_name text;
begin
  if auth.uid() is null then raise exception 'Az ellenőrzéshez bejelentkezés szükséges.'; end if;
  if jsonb_typeof(p_rows) <> 'array' then raise exception 'Az adatsorok formátuma hibás.'; end if;

  for v_row in select value from jsonb_array_elements(p_rows)
  loop
    v_classification := public.aic_classify_energy_chatbot(v_row -> 'facts');
    select name_hu into v_profile_name
    from public.aic_usage_profiles
    where code = v_classification ->> 'profile_code' and active;
    v_result := v_result || jsonb_build_array(v_row || jsonb_build_object(
      'valid', (v_classification ->> 'valid')::boolean,
      'profile_code', v_classification ->> 'profile_code',
      'profile_name', v_profile_name,
      'errors', v_classification -> 'errors'
    ));
  end loop;
  return v_result;
end;
$function$;

create or replace function public.aic_import_ai_systems_from_facts(
  p_organisation_id uuid,
  p_rows jsonb,
  p_conditions_confirmed boolean
)
returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_row jsonb;
  v_classification jsonb;
  v_profile public.aic_usage_profiles%rowtype;
  v_type_id uuid;
  v_capabilities text[];
  v_system_id uuid;
  v_ids jsonb := '[]'::jsonb;
  v_count integer := 0;
begin
  if auth.uid() is null then raise exception 'Az importáláshoz bejelentkezés szükséges.'; end if;
  if p_conditions_confirmed is distinct from true then raise exception 'Az adatok hitelességét meg kell erősíteni.'; end if;
  if not exists (
    select 1 from public.aic_organisation_members
    where organisation_id = p_organisation_id and user_id = auth.uid()
      and member_role in ('owner','admin','compliance','editor')
  ) then raise exception 'Nincs jogosultságod ehhez a szervezethez importálni.'; end if;
  if jsonb_typeof(p_rows) <> 'array' or jsonb_array_length(p_rows) = 0 then raise exception 'Az importálandó adatsorok hiányoznak.'; end if;
  if jsonb_array_length(p_rows) > 100 then raise exception 'Egyszerre legfeljebb 100 rendszer importálható.'; end if;

  for v_row in select value from jsonb_array_elements(p_rows)
  loop
    if nullif(trim(v_row ->> 'name'), '') is null then raise exception 'Minden rendszer neve kötelező.'; end if;
    v_classification := public.aic_classify_energy_chatbot(v_row -> 'facts');
    if (v_classification ->> 'valid')::boolean is not true then
      raise exception 'A(z) % rendszer besorolása sikertelen: %', v_row ->> 'name', v_classification -> 'errors';
    end if;
    select * into v_profile from public.aic_usage_profiles
      where code = v_classification ->> 'profile_code' and active;
    select id into v_type_id from public.aic_system_type_templates
      where type_code = 'CUSTOMER_CHATBOT' and active;
    v_capabilities := array['GENERAL_INFORMATION','ENERGY_INFORMATION']::text[];
    if coalesce((v_row->'facts'->>'handles_billing_consumption')::boolean,false) then
      v_capabilities:=v_capabilities||array['BILLING_INFORMATION','CONSUMPTION_METERING_DATA','PERSONAL_ACCOUNT_DATA']; end if;
    if coalesce((v_row->'facts'->>'accepts_meter_reading')::boolean,false) then
      v_capabilities:=v_capabilities||array['CONSUMPTION_METERING_DATA','PERSONAL_ACCOUNT_DATA','METER_READING_INTAKE']; end if;
    if coalesce((v_row->'facts'->>'accepts_complaints')::boolean,false) then
      v_capabilities:=v_capabilities||array['PERSONAL_ACCOUNT_DATA','COMPLAINT_INTAKE']; end if;
    if coalesce((v_row->'facts'->>'handles_debt_disconnection')::boolean,false) then
      v_capabilities:=v_capabilities||array['PERSONAL_ACCOUNT_DATA','DEBT_DISCONNECTION_SUPPORT']; end if;
    if coalesce((v_row->'facts'->>'handles_vulnerable_customers')::boolean,false) then
      v_capabilities:=v_capabilities||array['PERSONAL_ACCOUNT_DATA','VULNERABLE_CUSTOMER_SUPPORT']; end if;
    if coalesce((v_row->'facts'->>'generates_content')::boolean,false) then
      v_capabilities:=v_capabilities||array['GENERATIVE_RESPONSES']; end if;
    select array_agg(distinct code) into v_capabilities from unnest(v_capabilities) code;

    v_system_id := public.aic_create_ai_system(
      p_organisation_id, v_row->>'name', v_type_id, 'energy',
      v_profile.intended_purpose_template, v_profile.system_description_template,
      null, 'deployer', null, 'production', v_capabilities
    );
    update public.aic_ai_systems set usage_profile_code=v_profile.code,updated_at=now()
      where id=v_system_id;
    update public.aic_system_facts
      set facts = facts || v_profile.fact_patch || (v_row -> 'facts'), updated_at = now(), updated_by = auth.uid()
      where system_id = v_system_id;
    v_ids := v_ids || jsonb_build_array(v_system_id);
    v_count := v_count + 1;
  end loop;
  return jsonb_build_object('imported_count', v_count, 'system_ids', v_ids);
end;
$function$;

revoke all on function public.aic_classify_energy_chatbot(jsonb) from public, anon;
revoke all on function public.aic_preview_energy_chatbot_import(jsonb) from public, anon;
revoke all on function public.aic_import_ai_systems_from_facts(uuid,jsonb,boolean) from public, anon;
grant execute on function public.aic_classify_energy_chatbot(jsonb) to authenticated;
grant execute on function public.aic_preview_energy_chatbot_import(jsonb) to authenticated;
grant execute on function public.aic_import_ai_systems_from_facts(uuid,jsonb,boolean) to authenticated;
