-- EnergiaAI Kontroll – gyors, de jogilag teljes MI-rendszer-felvitel.
--
-- A migráció célja:
--   1. a funkciók egy kereshető katalóguskártyán jelenjenek meg;
--   2. a többválaszos tények tömbként is pontosan aktiválják a modulokat;
--   3. hiányos vagy hibás válaszokkal ne lehessen szabályzat-alapot menteni;
--   4. a kiválasztott iparág és a ténylap auditadatai ténylegesen mentődjenek.

begin;

-- A működési funkciók egy kártyára kerülnek. A feltételes elemek (például a
-- különleges adat) csak akkor jelennek meg a katalógusban, amikor az őket
-- kiváltó fő funkció már ki van választva.
update public.aic_kerdes_csoportok
set cim = 'Milyen funkciókat lát el a rendszer?',
    leiras = 'Keress rá a funkciókra, és válaszd ki mindazt, amit a rendszer ténylegesen végez. Ezekből, az iparágból és a szerepkörökből áll össze a szabályzat.'
where csoport = 'mukodes';

update public.aic_trigger_catalogue
set kerdes_csoport = 'mukodes',
    updated_at = now()
where trigger_key in (
  'SPECIAL_CATEGORY_DATA',
  'CRIMINAL_DATA',
  'INDIRECT_DATA_COLLECTION',
  'INTERNATIONAL_TRANSFER',
  'CASE_INTAKE_HANDLING',
  'OPERATES_CUSTOMER_SERVICE',
  'COMMERCIAL_PRACTICE',
  'SMART_METERING_DATA',
  'DATA_DISCLOSURE_ON_REQUEST'
);

-- Több szerepkör és tömbérték támogatása. Az "in" operátor skalár tény esetén
-- tagságot, tömb tény esetén legalább egy közös elemet jelent.
create or replace function public.aic_fact_condition_matches(
  p_profile jsonb,
  p_condition jsonb
) returns boolean
language sql
immutable
parallel safe
set search_path = public, pg_temp
as $function$
  select coalesce(
    case
      when p_condition->>'fact' = 'organisation_is_provider'
        and p_condition->>'operator' = 'is_true'
        then coalesce(p_profile->'organisation_roles', '[]'::jsonb) ?| array['provider','product_manufacturer']
          or coalesce(p_profile->>'organisation_role','') in ('provider','product_manufacturer')
      when p_condition->>'fact' = 'is_provider_or_importer'
        and p_condition->>'operator' = 'is_true'
        then coalesce(p_profile->'organisation_roles', '[]'::jsonb) ?| array['provider','importer','product_manufacturer']
          or coalesce(p_profile->>'organisation_role','') in ('provider','importer','product_manufacturer')
      when p_condition->>'fact' = 'uses_ai_system_under_own_authority'
        and p_condition->>'operator' = 'is_true'
        then coalesce(p_profile->'organisation_roles', '[]'::jsonb) ? 'deployer'
          or coalesce(p_profile->>'organisation_role','') = 'deployer'
      when p_condition->>'fact' = 'develops_or_has_ai_system_developed'
        and p_condition->>'operator' = 'is_true'
        then coalesce(p_profile->'organisation_roles', '[]'::jsonb) ?| array['provider','product_manufacturer']
          or coalesce(p_profile->>'organisation_role','') in ('provider','product_manufacturer')
      when p_condition->>'fact' = 'makes_ai_system_available_on_eu_market'
        and p_condition->>'operator' = 'is_true'
        then coalesce(p_profile->'organisation_roles', '[]'::jsonb) ?| array['provider','importer','distributor','product_manufacturer']
          or coalesce(p_profile->>'organisation_role','') in ('provider','importer','distributor','product_manufacturer')
      else case p_condition->>'operator'
        when 'eq' then p_profile->(p_condition->>'fact') = p_condition->'value'
        when 'equals' then p_profile->(p_condition->>'fact') = p_condition->'value'
        when 'neq' then p_profile->(p_condition->>'fact') <> p_condition->'value'
        when 'exists' then p_profile ? (p_condition->>'fact')
        when 'not_exists' then not (p_profile ? (p_condition->>'fact'))
        when 'is_true' then p_profile->(p_condition->>'fact') = 'true'::jsonb
        when 'is_false' then p_profile->(p_condition->>'fact') = 'false'::jsonb
        when 'in' then
          case
            when jsonb_typeof(p_profile->(p_condition->>'fact')) = 'array' then
              exists (
                select 1
                from jsonb_array_elements(p_profile->(p_condition->>'fact')) profile_value
                where p_condition->'value' @> jsonb_build_array(profile_value)
              )
            else p_condition->'value' @> jsonb_build_array(p_profile->(p_condition->>'fact'))
          end
        when 'contains' then p_profile->(p_condition->>'fact') @> p_condition->'value'
        else false
      end
    end,
    false
  );
$function$;

comment on function public.aic_fact_condition_matches(jsonb, jsonb) is
  'Tényfeltétel kiértékelése skalár és tömbértékekre, több szervezeti szerepkör támogatásával. Hiányzó tény esetén hamis.';

-- Az energetikai ügytípus nem igen/nem érték, hanem többválaszos lista.
-- Minden modul csak a saját ügytípusára aktiválódhat.
update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"CASE_INTAKE_HANDLING","operator":"is_true"},{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["complaint"]}]}'::jsonb
where module_code = 'CHATBOT_COMPLAINT_PROCESS';

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"neq","value":[]}]}'::jsonb
where module_code in ('ENERGY_ACCOUNT_DATA_TRACEABILITY','ENERGY_CONTROLLED_INFORMATION');

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"any":[{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["billing"]},{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["metering"]}]}'::jsonb
where module_code = 'ENERGY_BILLING_METERING';

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["disconnection"]}]}'::jsonb
where module_code = 'ENERGY_DISCONNECTION_RECONNECTION';

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"CASE_INTAKE_HANDLING","operator":"is_true"},{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["metering"]}]}'::jsonb
where module_code = 'ENERGY_METER_READING_INTAKE';

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["switching"]}]}'::jsonb
where module_code = 'ENERGY_SUPPLIER_SWITCH';

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["vulnerable"]},{"fact":"SUBJECT_TO_ACCESSIBILITY","operator":"is_true"}]}'::jsonb
where module_code = 'ENERGY_VULNERABLE_ACCESSIBLE_HANDOFF';

update public.aic_policy_modules
set applicability = '{"actor_roles":["deployer"],"industry_codes":["energy"],"all":[{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["vulnerable"]},{"fact":"SPECIAL_CATEGORY_DATA","operator":"is_true"}]}'::jsonb
where module_code = 'ENERGY_VULNERABLE_CUSTOMER';

-- A kliens által használt kérdéscsomag forráskódban is tükrözi az élő adatbázis
-- jelenlegi csoport- és többválaszos mezőit.
create or replace function public.aic_felviteli_kerdesek(
  p_system_type_code text,
  p_valaszok jsonb default '{}'::jsonb,
  p_iparag text default null,
  p_szerepkorok text[] default null
) returns jsonb
language plpgsql
stable
security definer
set search_path = public, pg_temp
as $function$
declare
  v_alap jsonb;
  v_profil jsonb;
  v_kerdesek jsonb;
  v_szerepek text[];
begin
  if auth.uid() is null then
    raise exception 'A felvitelhez bejelentkezés szükséges.';
  end if;

  v_szerepek := coalesce(p_szerepkorok, array['deployer']);

  select coalesce(t.default_facts, '{}'::jsonb)
  into v_alap
  from public.aic_system_type_templates t
  where t.type_code = p_system_type_code and t.active;

  if v_alap is null then
    raise exception 'Ismeretlen vagy inaktív eszköztípus: %.', p_system_type_code;
  end if;

  v_profil := v_alap
    || jsonb_build_object(
         'industry', coalesce(p_iparag,'unknown'),
         'organisation_roles', to_jsonb(v_szerepek),
         'organisation_role', coalesce(v_szerepek[1], 'deployer'),
         'organisation_is_provider', v_szerepek && array['provider','product_manufacturer'],
         'uses_ai_system_under_own_authority', v_szerepek && array['deployer']
       )
    || coalesce(p_valaszok,'{}'::jsonb);
  v_profil := public.aic_tenylap_nevfeloldas(v_profil);

  select coalesce(jsonb_agg(jsonb_build_object(
           'kulcs', c.trigger_key,
           'kerdes', c.question_hu,
           'nev', c.name_hu,
           'magyarazat', c.description_hu,
           'kategoria', c.category,
           'csoport', c.kerdes_csoport,
           'lehetosegek', c.valasz_lehetosegek,
           'valasz', v_profil -> c.trigger_key,
           'sorrend', c.display_order
         ) order by c.display_order), '[]'::jsonb)
  into v_kerdesek
  from public.aic_trigger_catalogue c
  where c.question_hu is not null
    and not c.derived
    and c.szerepkorok && v_szerepek
    and (
      c.always_ask
      or (c.ask_only_if is not null and public.aic_applicability_matches(c.ask_only_if, v_profil))
    );

  return jsonb_build_object(
    'kerdesek', v_kerdesek,
    'kerdes_szam', jsonb_array_length(v_kerdesek),
    'szerepkorok', to_jsonb(v_szerepek),
    'csoportok', coalesce((
      select jsonb_agg(jsonb_build_object(
        'csoport', g.csoport,
        'cim', g.cim,
        'leiras', g.leiras,
        'nincs_egyik_cimke', g.nincs_egyik_cimke,
        'sorrend', g.sorrend
      ) order by g.sorrend)
      from public.aic_kerdes_csoportok g
    ), '[]'::jsonb),
    'alapertekek', v_alap
  );
end;
$function$;

revoke all on function public.aic_felviteli_kerdesek(text, jsonb, text, text[]) from public, anon;
grant execute on function public.aic_felviteli_kerdesek(text, jsonb, text, text[]) to authenticated;

-- Új mentési végpont: az iparág kötelező bemenet. A mentés előtt ugyanazzal a
-- katalógussal ellenőrzi a válaszok teljességét, amelyből a felület dolgozik.
create or replace function public.aic_eszkoz_mentese(
  p_organisation_id uuid,
  p_nev text,
  p_system_type_code text,
  p_valaszok jsonb,
  p_szerepkorok text[],
  p_iparag text,
  p_rendeltetes text default null,
  p_system_id uuid default null
) returns jsonb
language plpgsql
security definer
set search_path = public, pg_temp
as $function$
declare
  v_szerep text;
  v_id uuid;
  v_type uuid;
  v_alap jsonb;
  v_tenyek jsonb;
  v_kerdesek jsonb;
  v_hibas text[];
begin
  if auth.uid() is null then
    raise exception 'A mentéshez bejelentkezés szükséges.';
  end if;

  v_szerep := public.aic_szervezeti_szerep(p_organisation_id);
  if v_szerep is null or v_szerep not in ('owner','admin','compliance','editor') then
    raise exception 'Nincs jogosultságod eszközt rögzíteni ebben a szervezetben.';
  end if;
  if p_szerepkorok is null or cardinality(p_szerepkorok) = 0 then
    raise exception 'Legalább egy szerepkört meg kell adni.';
  end if;
  if not p_szerepkorok <@ array['deployer','provider','importer','distributor','authorised_representative']::text[] then
    raise exception 'Ismeretlen szervezeti szerepkör.';
  end if;
  if btrim(coalesce(p_nev,'')) = '' then
    raise exception 'A rendszer nevét meg kell adni.';
  end if;
  if char_length(btrim(coalesce(p_rendeltetes,''))) < 10 then
    raise exception 'A rendszer rendeltetését legalább 10 karakterben meg kell adni.';
  end if;
  if not exists (select 1 from public.aic_industries where code = p_iparag and active) then
    raise exception 'Ismeretlen vagy inaktív iparág: %.', p_iparag;
  end if;

  select id, coalesce(default_facts,'{}'::jsonb)
  into v_type, v_alap
  from public.aic_system_type_templates
  where type_code = p_system_type_code and active;
  if v_type is null then
    raise exception 'Ismeretlen vagy inaktív eszköztípus: %.', p_system_type_code;
  end if;

  v_kerdesek := public.aic_felviteli_kerdesek(
    p_system_type_code,
    coalesce(p_valaszok, '{}'::jsonb),
    p_iparag,
    p_szerepkorok
  )->'kerdesek';

  select array_agg(q->>'kulcs' order by (q->>'sorrend')::int)
  into v_hibas
  from jsonb_array_elements(v_kerdesek) q
  where not coalesce(p_valaszok, '{}'::jsonb) ? (q->>'kulcs')
     or case
          when jsonb_typeof(q->'lehetosegek') = 'array' then
            jsonb_typeof(p_valaszok->(q->>'kulcs')) is distinct from 'array'
            or exists (
              select 1
              from jsonb_array_elements_text(p_valaszok->(q->>'kulcs')) answer(value)
              where not exists (
                select 1
                from jsonb_array_elements(q->'lehetosegek') option_item
                where option_item->>'kod' = answer.value
              )
            )
          else jsonb_typeof(p_valaszok->(q->>'kulcs')) is distinct from 'boolean'
        end;

  if cardinality(v_hibas) > 0 then
    raise exception 'Hiányzó vagy hibás válasz: %.', array_to_string(v_hibas, ', ');
  end if;

  v_tenyek := v_alap || coalesce(p_valaszok, '{}'::jsonb);

  if p_system_id is null then
    insert into public.aic_ai_systems (
      organisation_id, name, intended_purpose, system_type_id,
      organisation_role, organisation_roles, industry_code,
      lifecycle_stage, inventory_status, created_by, updated_by
    ) values (
      p_organisation_id, btrim(p_nev), btrim(p_rendeltetes), v_type,
      p_szerepkorok[1], p_szerepkorok, p_iparag,
      'operation', 'active', auth.uid(), auth.uid()
    )
    returning id into v_id;
  else
    update public.aic_ai_systems
    set name = btrim(p_nev),
        intended_purpose = btrim(p_rendeltetes),
        system_type_id = v_type,
        organisation_role = p_szerepkorok[1],
        organisation_roles = p_szerepkorok,
        industry_code = p_iparag,
        updated_by = auth.uid(),
        updated_at = now()
    where id = p_system_id and organisation_id = p_organisation_id
    returning id into v_id;

    if v_id is null then
      raise exception 'A rendszer nem található ebben a szervezetben.';
    end if;
  end if;

  insert into public.aic_system_facts (
    system_id, facts, completion_status, updated_by, updated_at
  ) values (
    v_id, v_tenyek, 'complete', auth.uid(), now()
  )
  on conflict (system_id) do update
  set facts = excluded.facts,
      completion_status = 'complete',
      updated_by = auth.uid(),
      updated_at = now();

  return jsonb_build_object(
    'system_id', v_id,
    'szerepkorok', to_jsonb(p_szerepkorok),
    'iparag', p_iparag,
    'teny_szam', (select count(*) from jsonb_object_keys(v_tenyek)),
    'nagy_kockazatu', (public.aic_system_profile(v_id)->>'system_is_high_risk')::boolean,
    'szabaly_szam', (
      select count(*)
      from public.aic_policy_modules m
      where m.lifecycle_status in ('approved','under_review')
        and public.aic_applicability_matches(m.applicability, public.aic_system_profile(v_id))
    )
  );
end;
$function$;

revoke all on function public.aic_eszkoz_mentese(uuid, text, text, jsonb, text[], text, text, uuid) from public, anon;
grant execute on function public.aic_eszkoz_mentese(uuid, text, text, jsonb, text[], text, text, uuid) to authenticated;

-- A korábbi hétparaméteres függvényt szándékosan nem írjuk át: így a régi
-- importáló és szerkesztő folyamatok működése nem változik. Az új oldal a
-- p_iparag nevű paraméter miatt egyértelműen az új, nyolcparaméteres végpontot
-- hívja.

-- Migrációs önellenőrzések: ha a tömbkezelés hibás, a tranzakció visszagördül.
do $assertions$
begin
  if not public.aic_fact_condition_matches(
    '{"SYNTHETIC_CONTENT_TYPE":["text","image"]}'::jsonb,
    '{"fact":"SYNTHETIC_CONTENT_TYPE","operator":"in","value":["text","audio","image","video"]}'::jsonb
  ) then
    raise exception 'Önellenőrzés sikertelen: a tömbös in feltétel nem illeszkedik.';
  end if;

  if not public.aic_fact_condition_matches(
    '{"ENERGY_CUSTOMER_MATTERS":["billing","complaint"]}'::jsonb,
    '{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["billing"]}'::jsonb
  ) then
    raise exception 'Önellenőrzés sikertelen: a billing feltétel nem illeszkedik.';
  end if;

  if public.aic_fact_condition_matches(
    '{"ENERGY_CUSTOMER_MATTERS":["billing","complaint"]}'::jsonb,
    '{"fact":"ENERGY_CUSTOMER_MATTERS","operator":"contains","value":["disconnection"]}'::jsonb
  ) then
    raise exception 'Önellenőrzés sikertelen: a disconnection feltétel tévesen illeszkedik.';
  end if;
end;
$assertions$;

commit;
