-- EnergiaAI Kontroll – a ténykérdések helyett nyilatkozat a felvitelben.
--
-- MI VÁLTOZIK
-- Eddig a felvitel után egy külön oldalon 17 igen/nem kérdés következett.
-- Ebből 8 ugyanazt kérdezte, amit a funkcióválasztás már eldöntött, a többi
-- pedig szétszórva gyűjtött néhány hatályossági tényt.
--
-- Helyette a felvitel végén három nyilatkozat áll (szolgáltatónál négy),
-- és a rendszer a mentéskor azonnal kész állapotba kerül. Külön oldal nincs.
--
-- A NYILATKOZATOK
--   1. A rendszert az Európai Unióban használjuk                (alap: igen)
--   2. A felhasználó számára egyértelmű, hogy MI-vel kommunikál (alap: igen)
--   3. Nem alkalmaz tiltott gyakorlatot                          (alap: igen)
--   4. Szabályozott termékbe épül – csak szolgáltatónál          (alap: nem)
--
-- A harmadik nyilatkozat kivétele nem marad következmény nélkül: ilyenkor a
-- rendszer az article_5_prohibition_relevant tényt kapja, ami figyelmeztető
-- fejezetet emel a szabályzatba. Enélkül a pipa csak dísz lenne.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

-- ===========================================================================
-- 1. Nyilatkozatokból tények
-- ===========================================================================

create or replace function public.aic_nyilatkozat_tenyek(
  p_eu_hasznalat boolean,
  p_mi_egyertelmu boolean,
  p_nincs_tiltott_gyakorlat boolean,
  p_szabalyozott_termekbe_epul boolean default false
) returns jsonb
language sql
immutable
set search_path = public, pg_temp
as $function$
  select jsonb_build_object(
    'eu_scope_connection_exists', coalesce(p_eu_hasznalat, true),
    'ai_interaction_obvious', coalesce(p_mi_egyertelmu, true),

    -- Ha a nyilatkozat megvan, a három tiltott gyakorlat ténye hamis.
    -- Ha hiányzik, nem állítjuk hamisra, és megjelöljük vizsgálandónak.
    'uses_subliminal_manipulative_or_deceptive_techniques',
      not coalesce(p_nincs_tiltott_gyakorlat, true),
    'exploits_age_disability_or_social_economic_vulnerability',
      not coalesce(p_nincs_tiltott_gyakorlat, true),
    'evaluates_persons_over_time_from_social_behaviour_or_personal_traits',
      not coalesce(p_nincs_tiltott_gyakorlat, true),
    'article_5_prohibition_relevant',
      not coalesce(p_nincs_tiltott_gyakorlat, true),

    'annex_i_product_or_safety_component', coalesce(p_szabalyozott_termekbe_epul, false)
  )
  -- Szabályozott termékbe épülő rendszer a 6. cikk (1) alapján magas kockázatú.
  || case when coalesce(p_szabalyozott_termekbe_epul, false)
          then '{"system_is_high_risk": true}'::jsonb
          else '{}'::jsonb end;
$function$;

-- ===========================================================================
-- 2. Felvitel a nyilatkozatokkal, azonnal kész állapotban
-- ===========================================================================

create or replace function public.aic_create_ai_system(
  p_organisation_id uuid, p_name text, p_system_type_id uuid, p_industry_code text,
  p_intended_purpose text, p_description text default null, p_provider_name text default null,
  p_organisation_role text default 'deployer', p_deployment_context text default null,
  p_lifecycle_stage text default 'planned', p_capability_codes text[] default '{}',
  p_eu_hasznalat boolean default true,
  p_mi_egyertelmu boolean default true,
  p_nincs_tiltott_gyakorlat boolean default true,
  p_szabalyozott_termekbe_epul boolean default false
) returns uuid
language plpgsql
security invoker
set search_path = public, pg_temp
as $function$
declare
  v_user_id uuid := auth.uid();
  v_system_id uuid;
  v_type_code text;
  v_default_facts jsonb;
  v_facts jsonb;
  v_selected text[];
  v_capability record;
  v_invalid text[];
  v_dependency_errors text[];
begin
  if v_user_id is null then raise exception 'A rendszer rögzítéséhez bejelentkezés szükséges.'; end if;
  if nullif(btrim(p_name), '') is null then raise exception 'A rendszer neve kötelező.'; end if;
  if nullif(btrim(p_intended_purpose), '') is null then
    raise exception 'A rendszer rendeltetésének rövid leírása kötelező.';
  end if;
  if p_organisation_role not in ('provider','deployer','importer','distributor','authorised_representative') then
    raise exception 'A szervezeti szerepkör érvénytelen.';
  end if;
  if not exists (
    select 1 from public.aic_organisation_members m
    where m.organisation_id = p_organisation_id and m.user_id = v_user_id
      and m.member_role in ('owner','admin','compliance','editor')
  ) then
    raise exception 'Nincs jogosultságod ehhez a szervezethez MI-rendszert rögzíteni.';
  end if;

  select type_code, coalesce(default_facts, '{}'::jsonb) into v_type_code, v_default_facts
  from public.aic_system_type_templates where id = p_system_type_id and active;
  if not found then raise exception 'A kiválasztott MI-rendszertípus nem elérhető.'; end if;

  if not exists (select 1 from public.aic_industries where code = p_industry_code and active) then
    raise exception 'A kiválasztott iparág nem elérhető.';
  end if;

  select coalesce(array_agg(distinct item.code order by item.code), '{}'::text[]) into v_selected
  from unnest(coalesce(p_capability_codes, '{}'::text[])) as item(code);

  select coalesce(array_agg(item.code order by item.code), '{}'::text[]) into v_invalid
  from unnest(v_selected) as item(code)
  where not exists (
    select 1 from public.aic_capabilities c
    where c.code = item.code and c.active
      and (cardinality(c.system_type_codes) = 0 or v_type_code = any (c.system_type_codes))
      and (cardinality(c.industry_codes) = 0 or p_industry_code = any (c.industry_codes))
  );
  if cardinality(v_invalid) > 0 then
    raise exception 'Nem használható aktív funkció: %.', array_to_string(v_invalid, ', ');
  end if;

  v_dependency_errors := public.aic_missing_capability_dependencies(v_selected);
  if cardinality(v_dependency_errors) > 0 then
    raise exception 'A kiválasztott funkció kötelező függősége hiányzik: %.',
      array_to_string(v_dependency_errors, ', ');
  end if;

  insert into public.aic_ai_systems(
    organisation_id, name, system_type_id, industry_code, description, intended_purpose,
    provider_name, organisation_role, deployment_context, lifecycle_stage, created_by, updated_by
  ) values (
    p_organisation_id, btrim(regexp_replace(p_name, '\s+', ' ', 'g')), p_system_type_id, p_industry_code,
    nullif(btrim(p_description), ''), btrim(p_intended_purpose), nullif(btrim(p_provider_name), ''),
    p_organisation_role, nullif(btrim(p_deployment_context), ''), p_lifecycle_stage, v_user_id, v_user_id
  ) returning id into v_system_id;

  v_facts := v_default_facts
    || jsonb_build_object(
         'system_name', btrim(regexp_replace(p_name, '\s+', ' ', 'g')),
         'system_type_code', v_type_code, 'industry', p_industry_code,
         'organisation_role', p_organisation_role, 'capability_codes', to_jsonb(v_selected),
         'is_ai_system', true, 'persons_operate_or_use_ai_on_behalf', true,
         'ai_compliance_database_in_use', true, 'law_enforcement_exception_applies', false,
         'selection_basis', 'active_capabilities_and_declarations'
       )
    -- A nyilatkozatok tényei a funkciók után jönnek, hogy felül tudják írni
    -- a rendszertípus alapértelmezéseit.
    || public.aic_nyilatkozat_tenyek(
         p_eu_hasznalat, p_mi_egyertelmu, p_nincs_tiltott_gyakorlat, p_szabalyozott_termekbe_epul
       );

  for v_capability in
    select code, fact_patch from public.aic_capabilities
    where code = any (v_selected) order by sort_order, code
  loop
    v_facts := v_facts || coalesce(v_capability.fact_patch, '{}'::jsonb);
    insert into public.aic_ai_system_capabilities(system_id, capability_code, confirmed_by)
    values (v_system_id, v_capability.code, v_user_id);
  end loop;

  -- A nyilatkozat tényei a funkciók fölött állnak: ha valaki kijelentette,
  -- hogy nem alkalmaz tiltott gyakorlatot, azt egy funkció sem írhatja felül.
  v_facts := v_facts || public.aic_nyilatkozat_tenyek(
    p_eu_hasznalat, p_mi_egyertelmu, p_nincs_tiltott_gyakorlat, p_szabalyozott_termekbe_epul
  );

  -- Minden tény megvan a felvitelkor, ezért nincs külön ellenőrző lépés.
  insert into public.aic_system_facts(system_id, facts, completion_status, updated_by)
  values (v_system_id, v_facts, 'complete', v_user_id);

  return v_system_id;
end;
$function$;

-- ===========================================================================
-- 3. Szerkesztés: funkciók és nyilatkozatok egy helyen
-- ===========================================================================

create or replace function public.aic_update_system_capabilities(
  p_system_id uuid,
  p_capability_codes text[],
  p_conditions_confirmed boolean default true,
  p_eu_hasznalat boolean default null,
  p_mi_egyertelmu boolean default null,
  p_nincs_tiltott_gyakorlat boolean default null,
  p_szabalyozott_termekbe_epul boolean default null
) returns void
language plpgsql
security invoker
set search_path = public, pg_temp
as $function$
declare
  v_user_id uuid := auth.uid();
  v_system public.aic_ai_systems%rowtype;
  v_type_code text;
  v_selected text[];
  v_before text[];
  v_invalid text[];
  v_dependency_errors text[];
  v_capability_keys text[];
  v_facts jsonb;
  v_regi jsonb;
  v_capability record;
begin
  if v_user_id is null then raise exception 'A funkciók módosításához bejelentkezés szükséges.'; end if;

  select * into v_system from public.aic_ai_systems
  where id = p_system_id and inventory_status = 'active' for update;
  if not found then raise exception 'Az MI-rendszer nem található vagy nem aktív.'; end if;

  if not exists (
    select 1 from public.aic_organisation_members m
    where m.organisation_id = v_system.organisation_id and m.user_id = v_user_id
      and m.member_role in ('owner','admin','compliance','editor')
  ) then
    raise exception 'Nincs jogosultságod a rendszer módosításához.';
  end if;

  select type_code into v_type_code from public.aic_system_type_templates
  where id = v_system.system_type_id and active;
  if not found then raise exception 'A rendszer típusa nem elérhető.'; end if;

  select coalesce(array_agg(distinct item.code order by item.code), '{}'::text[]) into v_selected
  from unnest(coalesce(p_capability_codes, '{}'::text[])) as item(code);

  select coalesce(array_agg(item.code order by item.code), '{}'::text[]) into v_invalid
  from unnest(v_selected) as item(code)
  where not exists (
    select 1 from public.aic_capabilities c
    where c.code = item.code and c.active
      and (cardinality(c.system_type_codes) = 0 or v_type_code = any (c.system_type_codes))
      and (cardinality(c.industry_codes) = 0 or v_system.industry_code = any (c.industry_codes))
  );
  if cardinality(v_invalid) > 0 then
    raise exception 'Nem használható aktív funkció: %.', array_to_string(v_invalid, ', ');
  end if;

  v_dependency_errors := public.aic_missing_capability_dependencies(v_selected);
  if cardinality(v_dependency_errors) > 0 then
    raise exception 'A kiválasztott funkció kötelező függősége hiányzik: %.',
      array_to_string(v_dependency_errors, ', ');
  end if;

  select coalesce(array_agg(capability_code order by capability_code), '{}'::text[]) into v_before
  from public.aic_ai_system_capabilities where system_id = p_system_id;

  select coalesce(array_agg(distinct key), '{}'::text[]) into v_capability_keys
  from public.aic_capabilities c cross join lateral jsonb_object_keys(c.fact_patch) key;

  select coalesce(facts, '{}'::jsonb) into v_regi
  from public.aic_system_facts where system_id = p_system_id;

  v_facts := (coalesce(v_regi, '{}'::jsonb) - v_capability_keys)
    || jsonb_build_object(
         'system_name', v_system.name, 'system_type_code', v_type_code,
         'industry', v_system.industry_code, 'organisation_role', v_system.organisation_role,
         'capability_codes', to_jsonb(v_selected),
         'selection_basis', 'active_capabilities_and_declarations'
       );

  delete from public.aic_ai_system_capabilities where system_id = p_system_id;

  for v_capability in
    select code, fact_patch from public.aic_capabilities
    where code = any (v_selected) order by sort_order, code
  loop
    v_facts := v_facts || coalesce(v_capability.fact_patch, '{}'::jsonb);
    insert into public.aic_ai_system_capabilities(system_id, capability_code, confirmed_by)
    values (p_system_id, v_capability.code, v_user_id);
  end loop;

  -- A nyilatkozatok csak akkor módosulnak, ha kaptunk értéket. Ha nem,
  -- a korábbiak maradnak érvényben.
  if p_eu_hasznalat is not null or p_mi_egyertelmu is not null
     or p_nincs_tiltott_gyakorlat is not null or p_szabalyozott_termekbe_epul is not null then
    v_facts := v_facts || public.aic_nyilatkozat_tenyek(
      coalesce(p_eu_hasznalat, (v_regi->>'eu_scope_connection_exists')::boolean, true),
      coalesce(p_mi_egyertelmu, (v_regi->>'ai_interaction_obvious')::boolean, true),
      coalesce(p_nincs_tiltott_gyakorlat,
               not coalesce((v_regi->>'article_5_prohibition_relevant')::boolean, false)),
      coalesce(p_szabalyozott_termekbe_epul,
               (v_regi->>'annex_i_product_or_safety_component')::boolean, false)
    );
  end if;

  insert into public.aic_system_facts(system_id, facts, completion_status, updated_by, updated_at)
  values (p_system_id, v_facts, 'complete', v_user_id, now())
  on conflict (system_id) do update set
    facts = excluded.facts, completion_status = 'complete',
    updated_by = v_user_id, updated_at = now();

  insert into public.aic_system_change_log(
    organisation_id, system_id, changed_by, change_type, before_data, after_data
  ) values (
    v_system.organisation_id, p_system_id, v_user_id, 'reclassification',
    jsonb_build_object('capability_codes', to_jsonb(v_before)),
    jsonb_build_object('capability_codes', to_jsonb(v_selected))
  );
end;
$function$;

-- ===========================================================================
-- 4. Figyelmeztető fejezet, ha a tiltott gyakorlat nyilatkozat hiányzik
-- ===========================================================================

insert into public.aic_policy_modules(
  module_code, title, section_key, module_kind, summary_text, full_text_template,
  rule_id, applicability, display_order, version, lifecycle_status
) values (
  'DECLARATION_PROHIBITED_PRACTICE_WARNING',
  'Tiltott gyakorlat gyanúja – azonnali jogi vizsgálat szükséges',
  'governance', 'legal_requirement',
  'A szervezet nem nyilatkozott arról, hogy a rendszer mentes a tiltott MI-gyakorlatoktól.',
  'A(z) {{organisation_name}} a {{system_name}} rendszer rögzítésekor nem erősítette meg, '
  'hogy a rendszer mentes az AI Act 5. cikke szerinti tiltott gyakorlatoktól. '
  'A tiltott gyakorlatok 2025. február 2. óta alkalmazandók, megsértésük a legsúlyosabb '
  'bírsági kategóriába tartozik. A rendszer használatát a jogi vizsgálat lezárultáig '
  'fel kell függeszteni, és a vizsgálat eredményét dokumentálni kell.',
  null,
  '{"required_facts": {"article_5_prohibition_relevant": true}}'::jsonb,
  1, 1, 'under_review'
)
on conflict (module_code) do update set
  title = excluded.title,
  summary_text = excluded.summary_text,
  full_text_template = excluded.full_text_template,
  applicability = excluded.applicability,
  display_order = excluded.display_order,
  version = public.aic_policy_modules.version + 1,
  updated_at = now();

-- ===========================================================================
-- 5. A meglévő rendszerek nyilatkozatai
--
-- A korábban felvett rendszerek a ténykérdésekre már válaszoltak, ezért
-- a meglévő tényeikből származtatjuk a nyilatkozatokat.
-- ===========================================================================

update public.aic_system_facts f
set facts = f.facts || jsonb_build_object(
      'article_5_prohibition_relevant',
      coalesce((f.facts->>'uses_subliminal_manipulative_or_deceptive_techniques')::boolean, false)
        or coalesce((f.facts->>'exploits_age_disability_or_social_economic_vulnerability')::boolean, false)
        or coalesce((f.facts->>'evaluates_persons_over_time_from_social_behaviour_or_personal_traits')::boolean, false),
      'annex_i_product_or_safety_component',
      coalesce((f.facts->>'annex_i_product_or_safety_component')::boolean, false)
    ),
    updated_at = now()
where not (f.facts ? 'article_5_prohibition_relevant');

revoke all on function public.aic_nyilatkozat_tenyek(boolean, boolean, boolean, boolean) from public, anon;
grant execute on function public.aic_nyilatkozat_tenyek(boolean, boolean, boolean, boolean) to authenticated;

commit;
