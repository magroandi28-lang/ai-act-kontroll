-- EnergiaAI Kontroll – az új felvitel három függvénye.
--
-- MIÉRT
-- A kapcsolókatalógus készen van, de a felület nem tud rá építeni: nincs mi
-- megmondja, mely kérdéseket kell feltenni, nincs mi elmentse a válaszokat, és
-- nincs mi megmutassa a következményt mentés előtt.
--
-- A HÁROM FÜGGVÉNY
--   aic_felviteli_kerdesek – mely kérdések jelenjenek meg, az eszköztípus és az
--                            eddigi válaszok alapján
--   aic_eszkoz_mentese     – a válaszok és a szerepkörök mentése
--   aic_felvitel_elonezet  – besorolás és szabályszám mentés előtt
--
-- MIÉRT SZERVEROLDALON
-- A feltételek kiértékelése nem történhet a böngészőben. Ha ott dőlne el, mely
-- kérdés jelenik meg, akkor a szabályzat tartalma a felület verziójától
-- függene, nem a jogtól.
--
-- A RÉGI FELVITELRŐL
-- A használati profilokra épülő régi út egyelőre megmarad, mert a jelenlegi
-- oldal azt hívja. Törlése egyetlen migráció lesz, amint az új oldal él.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. Mely kérdéseket kell feltenni.
--
-- A kérdés akkor jelenik meg, ha:
--   – always_ask, VAGY
--   – ask_only_if feltétele teljesül az eddigi válaszok alapján
-- és nem tölti ki eleve az eszköztípus alapértéke.
--
-- Az eszköztípus alapértékei nem tűnnek el: bekerülnek a válaszok közé, csak
-- nem kérdezzük meg őket. A felvivő a haladó nézetben felülírhatja.
-- ---------------------------------------------------------------------------
create or replace function public.aic_felviteli_kerdesek(
  p_system_type_code text,
  p_valaszok jsonb default '{}'::jsonb,
  p_iparag text default null,
  p_szerepkorok text[] default null
) returns jsonb
language plpgsql stable security definer
set search_path = public, pg_temp
as $function$
declare
  v_alap jsonb;
  v_profil jsonb;
  v_kerdesek jsonb;
begin
  if auth.uid() is null then
    raise exception 'A felvitelhez bejelentkezés szükséges.';
  end if;

  select coalesce(t.default_facts, '{}'::jsonb) into v_alap
  from public.aic_system_type_templates t where t.type_code = p_system_type_code;

  -- A kiértékeléshez használt profil: alapértékek, iparág, szerepkörök,
  -- majd a tényleges válaszok felülírják.
  v_profil := coalesce(v_alap,'{}'::jsonb)
    || jsonb_build_object(
         'industry', coalesce(p_iparag,'unknown'),
         'organisation_roles', to_jsonb(coalesce(p_szerepkorok, array['deployer'])),
         'organisation_is_provider', coalesce(p_szerepkorok,array['deployer']) && array['provider','product_manufacturer'],
         'uses_ai_system_under_own_authority', coalesce(p_szerepkorok,array['deployer']) && array['deployer']
       )
    || coalesce(p_valaszok,'{}'::jsonb);
  v_profil := public.aic_tenylap_nevfeloldas(v_profil);

  select coalesce(jsonb_agg(jsonb_build_object(
           'kulcs', c.trigger_key,
           'kerdes', c.question_hu,
           'nev', c.name_hu,
           'magyarazat', c.description_hu,
           'kategoria', c.category,
           'valasz', v_profil -> c.trigger_key,
           'elore_kitoltve', (v_alap ? c.trigger_key)
                             or exists (select 1 from unnest(c.legacy_fact_keys) k where v_alap ? k),
           'sorrend', c.display_order
         ) order by c.display_order), '[]'::jsonb)
  into v_kerdesek
  from public.aic_trigger_catalogue c
  where c.question_hu is not null
    and c.derived = false
    and (c.always_ask
         or (c.ask_only_if is not null
             and public.aic_applicability_matches(c.ask_only_if, v_profil)));

  return jsonb_build_object(
    'kerdesek', v_kerdesek,
    'kerdes_szam', jsonb_array_length(v_kerdesek),
    'alapertekek', coalesce(v_alap,'{}'::jsonb)
  );
end;
$function$;

revoke all on function public.aic_felviteli_kerdesek(text, jsonb, text, text[]) from public, anon;
grant execute on function public.aic_felviteli_kerdesek(text, jsonb, text, text[]) to authenticated;

-- ---------------------------------------------------------------------------
-- 2. Előnézet: mi következik a válaszokból, mentés előtt.
-- ---------------------------------------------------------------------------
create or replace function public.aic_felvitel_elonezet(
  p_organisation_id uuid,
  p_system_type_code text,
  p_valaszok jsonb,
  p_szerepkorok text[],
  p_iparag text default null
) returns jsonb
language plpgsql stable security definer
set search_path = public, pg_temp
as $function$
declare
  v_profil jsonb; v_besorolas jsonb; v_szabaly int; v_lista jsonb;
begin
  if auth.uid() is null then
    raise exception 'Az előnézethez bejelentkezés szükséges.';
  end if;
  if public.aic_szervezeti_szerep(p_organisation_id) is null then
    raise exception 'Nincs jogosultságod ehhez a szervezethez.';
  end if;

  select coalesce(t.default_facts,'{}'::jsonb) into v_profil
  from public.aic_system_type_templates t where t.type_code = p_system_type_code;

  v_profil := jsonb_build_object(
      'is_ai_system', true, 'persons_operate_or_use_ai_on_behalf', true,
      'ai_compliance_database_in_use', true,
      'use_is_purely_personal_non_professional', false,
      'purpose_exclusively_military_defence_or_national_security', false
    )
    || public.aic_szervezeti_tenyek(p_organisation_id, coalesce(p_szerepkorok[1],'deployer'))
    || coalesce(v_profil,'{}'::jsonb)
    || jsonb_build_object(
         'system_type_code', p_system_type_code,
         'industry', coalesce(p_iparag, (select industry from public.aic_organisations where id=p_organisation_id), 'unknown'),
         'organisation_roles', to_jsonb(p_szerepkorok),
         'organisation_role', coalesce(p_szerepkorok[1],'deployer'),
         'organisation_is_provider', p_szerepkorok && array['provider','product_manufacturer'],
         'uses_ai_system_under_own_authority', p_szerepkorok && array['deployer'],
         'is_provider_or_importer', p_szerepkorok && array['provider','importer','product_manufacturer'],
         'develops_or_has_ai_system_developed', p_szerepkorok && array['provider','product_manufacturer'],
         'places_on_market_or_puts_into_service_under_own_name', p_szerepkorok && array['provider','product_manufacturer'],
         'makes_ai_system_available_on_eu_market', p_szerepkorok && array['provider','importer','distributor','product_manufacturer'],
         'in_ai_supply_chain', true
       )
    || coalesce(p_valaszok,'{}'::jsonb);

  v_profil := public.aic_tenylap_nevfeloldas(v_profil);
  v_besorolas := public.aic_nagy_kockazatu(v_profil);
  v_profil := v_besorolas || v_profil;
  v_profil := public.aic_tenylap_nevfeloldas(v_profil);

  select count(*), coalesce(jsonb_agg(jsonb_build_object(
           'cim', m.title, 'modul', m.module_code, 'szerep', r.actor_role,
           'jovahagyva', r.approved_at is not null,
           'hatalyos_tol', m.valid_from) order by m.display_order), '[]'::jsonb)
  into v_szabaly, v_lista
  from public.aic_policy_modules m
  join public.aic_compliance_rules r on r.id = m.rule_id
  where m.lifecycle_status in ('approved','under_review')
    and public.aic_applicability_matches(m.applicability, v_profil);

  return jsonb_build_object(
    'nagy_kockazatu', (v_besorolas->>'system_is_high_risk')::boolean,
    'besorolas_indok', v_besorolas->>'high_risk_indok',
    'szabaly_szam', v_szabaly,
    'jovahagyott_szabaly', (select count(*) from jsonb_array_elements(v_lista) x
                            where (x->>'jovahagyva')::boolean),
    'jovobeli_szabaly', (select count(*) from jsonb_array_elements(v_lista) x
                         where (x->>'hatalyos_tol') is not null
                           and (x->>'hatalyos_tol')::date > current_date),
    'szabalyok', v_lista
  );
end;
$function$;

revoke all on function public.aic_felvitel_elonezet(uuid, text, jsonb, text[], text) from public, anon;
grant execute on function public.aic_felvitel_elonezet(uuid, text, jsonb, text[], text) to authenticated;

-- ---------------------------------------------------------------------------
-- 3. Mentés.
-- ---------------------------------------------------------------------------
create or replace function public.aic_eszkoz_mentese(
  p_organisation_id uuid,
  p_nev text,
  p_system_type_code text,
  p_valaszok jsonb,
  p_szerepkorok text[],
  p_rendeltetes text default null,
  p_system_id uuid default null
) returns jsonb
language plpgsql security definer
set search_path = public, pg_temp
as $function$
declare
  v_szerep text; v_id uuid; v_type uuid; v_alap jsonb; v_tenyek jsonb;
begin
  if auth.uid() is null then
    raise exception 'A mentéshez bejelentkezés szükséges.';
  end if;
  v_szerep := public.aic_szervezeti_szerep(p_organisation_id);
  if v_szerep is null or v_szerep not in ('owner','admin','compliance','editor') then
    raise exception 'Nincs jogosultságod eszközt rögzíteni ebben a szervezetben.';
  end if;
  if p_szerepkorok is null or array_length(p_szerepkorok,1) is null then
    raise exception 'Legalább egy szerepkört meg kell adni.';
  end if;
  if btrim(coalesce(p_nev,'')) = '' then
    raise exception 'A rendszer nevét meg kell adni.';
  end if;

  select id, coalesce(default_facts,'{}'::jsonb) into v_type, v_alap
  from public.aic_system_type_templates where type_code = p_system_type_code and active;
  if v_type is null then
    raise exception 'Ismeretlen eszköztípus: %.', p_system_type_code;
  end if;

  -- Az eszköztípus alapértékei és a válaszok együtt alkotják a ténylapot.
  -- A válasz mindig felülírja az alapértéket.
  v_tenyek := v_alap || coalesce(p_valaszok, '{}'::jsonb);

  if p_system_id is null then
    insert into public.aic_ai_systems
      (organisation_id, name, intended_purpose, system_type_id,
       organisation_role, organisation_roles, industry_code,
       lifecycle_stage, inventory_status, created_by, updated_by)
    values
      (p_organisation_id, btrim(p_nev), nullif(btrim(coalesce(p_rendeltetes,'')),''), v_type,
       p_szerepkorok[1], p_szerepkorok,
       (select industry from public.aic_organisations where id = p_organisation_id),
       'operation', 'active', auth.uid(), auth.uid())
    returning id into v_id;
  else
    update public.aic_ai_systems
       set name = btrim(p_nev),
           intended_purpose = coalesce(nullif(btrim(coalesce(p_rendeltetes,'')),''), intended_purpose),
           system_type_id = v_type,
           organisation_role = p_szerepkorok[1],
           organisation_roles = p_szerepkorok,
           updated_by = auth.uid(), updated_at = now()
     where id = p_system_id and organisation_id = p_organisation_id
    returning id into v_id;
    if v_id is null then
      raise exception 'A rendszer nem található ebben a szervezetben.';
    end if;
  end if;

  insert into public.aic_system_facts (system_id, facts)
  values (v_id, v_tenyek)
  on conflict (system_id) do update set facts = excluded.facts;

  return jsonb_build_object(
    'system_id', v_id,
    'szerepkorok', to_jsonb(p_szerepkorok),
    'teny_szam', (select count(*) from jsonb_object_keys(v_tenyek)),
    'nagy_kockazatu', (public.aic_system_profile(v_id) ->> 'system_is_high_risk')::boolean,
    'szabaly_szam', (select count(*) from public.aic_policy_modules m
                     where m.lifecycle_status in ('approved','under_review')
                       and public.aic_applicability_matches(m.applicability, public.aic_system_profile(v_id)))
  );
end;
$function$;

revoke all on function public.aic_eszkoz_mentese(uuid, text, text, jsonb, text[], text, uuid) from public, anon;
grant execute on function public.aic_eszkoz_mentese(uuid, text, text, jsonb, text[], text, uuid) to authenticated;

-- ---------------------------------------------------------------------------
-- A régi felvitel megjelölése.
-- ---------------------------------------------------------------------------
comment on function public.aic_create_ai_system_from_profile(uuid, text, text, boolean) is
  'ELAVULT. A használati profilokra épülő régi felvitel. Az aic_eszkoz_mentese váltja fel; törlendő, amint az új oldal él.';
comment on function public.aic_update_system_capabilities(uuid, text[], boolean) is
  'ELAVULT. Az aic_eszkoz_mentese váltja fel.';

commit;
