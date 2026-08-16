-- EnergiaAI Kontroll – valódi vezetői összefoglaló.
--
-- HIBA
-- Az összefoglaló eddig a fejezetek összefoglaló mondatait fűzte egymás alá.
-- Ez nem összefoglaló, hanem tartalomjegyzék teljes mondatokban: két teljesen
-- különböző MI-rendszer szó szerint azonos összefoglalót kapott, mert a szöveg
-- semmilyen rendszerspecifikus adatot nem hordozott.
--
-- JAVÍTÁS
-- Az összefoglaló önálló függvénybe kerül, és abból épül fel, ami a döntéshez
-- kell: mi a rendszer, milyen szerepben használják, mekkora a kockázata, mely
-- jogforrások vonatkoznak rá, mit kell tenni, és mennyire megbízható a
-- dokumentum. Minden érték az adatbázisból számítható – nyelvi modell nincs
-- benne, ugyanaz a bemenet mindig ugyanazt a szöveget adja.
--
-- A külön függvény azért jó, mert önmagában is meghívható és tesztelhető:
--   select public.aic_vezetoi_osszefoglalo(
--     '<rendszer-id>',
--     (select document_sections from aic_generated_policies
--       where ai_system_id = '<rendszer-id>' order by version desc limit 1));
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

-- ---------------------------------------------------------------------------
-- 1. Az összefoglalót előállító függvény.
-- ---------------------------------------------------------------------------
create or replace function public.aic_vezetoi_osszefoglalo(
  p_ai_system_id uuid,
  p_sections jsonb
) returns text
language plpgsql
stable
security invoker
set search_path = public, pg_temp
as $function$
declare
  v_nev text;
  v_rendeltetes text;
  v_szolgaltato text;
  v_szerep text;
  v_szerep_cimke text;
  v_szerep_magyarazat text;
  v_tenyek jsonb;
  v_besorolas text;
  v_besorolas_indok text;
  v_fejezet integer;
  v_forras_db integer;
  v_forras_lista text;
  v_teendo_ossz integer;
  v_teendo_azonnali integer;
  v_teendo_lista text;
  v_jovobeli_sor text;
  v_fuggo integer;
  v_szoveg text;
begin
  select s.name,
         nullif(btrim(coalesce(s.intended_purpose, '')), ''),
         nullif(btrim(coalesce(s.provider_name, '')), ''),
         coalesce(s.organisation_role, 'unknown'),
         coalesce(f.facts, '{}'::jsonb)
    into v_nev, v_rendeltetes, v_szolgaltato, v_szerep, v_tenyek
  from public.aic_ai_systems s
  left join public.aic_system_facts f on f.system_id = s.id
  where s.id = p_ai_system_id;

  if not found then
    return null;
  end if;

  -- A szerepkör dönti el, mely kötelezettségek terhelik a szervezetet,
  -- ezért a vezetőnek elsőként ezt kell látnia.
  select cimke, magyarazat into v_szerep_cimke, v_szerep_magyarazat
  from (values
    ('deployer', 'Alkalmazó',
     'A szervezet a saját felelősségére használja a rendszert, ezért az alkalmazói kötelezettségek terhelik.'),
    ('provider', 'Szolgáltató',
     'A szervezet fejleszti vagy saját néven hozza forgalomba a rendszert, ezért a lényegesen szélesebb szolgáltatói kötelezettségek terhelik.'),
    ('importer', 'Importőr',
     'A szervezet EU-n kívüli szolgáltató rendszerét hozza be az uniós piacra, ezért az importőri kötelezettségek terhelik.'),
    ('distributor', 'Forgalmazó',
     'A szervezet továbbforgalmazza a rendszert, ezért a forgalmazói ellenőrzési kötelezettségek terhelik.'),
    ('authorised_representative', 'Meghatalmazott képviselő',
     'A szervezet EU-n kívüli szolgáltatót képvisel írásbeli megbízás alapján.')
  ) as t(kod, cimke, magyarazat)
  where t.kod = v_szerep;

  if v_szerep_cimke is null then
    v_szerep_cimke := 'Nincs megadva';
    v_szerep_magyarazat := 'A szervezeti szerepkör hiányzik, ezért a kötelezettségek köre nem határozható meg pontosan.';
  end if;

  -- A besorolás a felvitelkor rögzített tényekből következik. Nem jogi
  -- minősítés: azt a felülvizsgáló mondja ki. Ezt a szöveg ki is mondja.
  if coalesce((v_tenyek->>'article_5_prohibition_relevant')::boolean, false) then
    v_besorolas := 'Jogi vizsgálatot igényel';
    v_besorolas_indok := 'A felvitelkor nem erősítették meg, hogy a rendszer mentes az AI Act 5. cikke szerinti tiltott gyakorlatoktól. Amíg ez nem tisztázott, a rendszer használata jogi kockázatot hordoz.';
  elsif coalesce((v_tenyek->>'system_is_high_risk')::boolean, false)
     or coalesce((v_tenyek->>'annex_i_product_or_safety_component')::boolean, false)
     or coalesce((v_tenyek->>'annex_iii_biometrics_use_case')::boolean, false)
     or coalesce((v_tenyek->>'makes_legally_effective_decisions')::boolean, false) then
    v_besorolas := 'Magas kockázatú';
    v_besorolas_indok := 'A rendszer az AI Act magas kockázatú kategóriájába esik, ezért kockázatkezelési, adatminőségi, dokumentációs, emberi felügyeleti és naplózási kötelezettségek terhelik.';
  elsif coalesce((v_tenyek->>'interaction_with_natural_person')::boolean, false)
     or coalesce((v_tenyek->>'generates_synthetic_content')::boolean, false)
     or coalesce((v_tenyek->>'article_50_notice_required')::boolean, false) then
    v_besorolas := 'Átláthatósági kötelezettség alá eső';
    v_besorolas_indok := 'A rendszer természetes személlyel érintkezik vagy tartalmat állít elő, ezért az AI Act 50. cikke szerinti tájékoztatási és megjelölési kötelezettségek terhelik.';
  else
    v_besorolas := 'Általános';
    v_besorolas_indok := 'A rögzített működés alapján a rendszert nem terhelik a magas kockázatú kategória külön kötelezettségei.';
  end if;

  select count(*)::integer into v_fejezet
  from jsonb_array_elements(coalesce(p_sections, '[]'::jsonb));

  -- Hány jogforrásból, és melyekből. A vezető ebből látja a dokumentum súlyát.
  select count(distinct ref->>'source_title')::integer,
         string_agg(distinct ref->>'source_title', ', ' order by ref->>'source_title')
    into v_forras_db, v_forras_lista
  from jsonb_array_elements(coalesce(p_sections, '[]'::jsonb)) sec,
       jsonb_array_elements(coalesce(sec->'legal_references', '[]'::jsonb)) ref
  where ref->>'source_title' is not null;

  select count(*)::integer,
         count(*) filter (where a->>'priority' = 'critical')::integer
    into v_teendo_ossz, v_teendo_azonnali
  from jsonb_array_elements(coalesce(p_sections, '[]'::jsonb)) sec,
       jsonb_array_elements(coalesce(sec->'required_actions', '[]'::jsonb)) a;

  -- A három legsürgősebb teendő. Ugyanaz a teendő több fejezetben is
  -- előfordulhat, ezért címre csoportosítunk.
  with teendok as (
    select a->>'title' as cim,
           min(case a->>'priority'
                 when 'critical' then 1
                 when 'high' then 2
                 else 3
               end) as prioritas
    from jsonb_array_elements(coalesce(p_sections, '[]'::jsonb)) sec,
         jsonb_array_elements(coalesce(sec->'required_actions', '[]'::jsonb)) a
    where nullif(btrim(coalesce(a->>'title', '')), '') is not null
    group by 1
  )
  select string_agg('- ' || cim, E'\n' order by prioritas, cim)
    into v_teendo_lista
  from (select cim, prioritas from teendok order by prioritas, cim limit 3) t;

  -- A később hatályba lépő kötelezettségek. Az AI Act átmeneti határidői
  -- miatt ez tervezési információ, nem érdekesség.
  select string_agg(
           to_char((g->>'effective_from')::date, 'YYYY. MM. DD.')
             || ' – további ' || (g->>'module_count') || ' kötelezettség',
           E'\n' order by (g->>'effective_from')::date)
    into v_jovobeli_sor
  from jsonb_array_elements(
         coalesce(public.aic_upcoming_obligations(p_ai_system_id), '[]'::jsonb)) g;

  select count(*)::integer into v_fuggo
  from jsonb_array_elements(coalesce(p_sections, '[]'::jsonb)) sec
  where coalesce(sec->>'module_lifecycle_status', '') <> 'approved';

  v_szoveg :=
    'A RENDSZER' || E'\n' ||
    v_nev || coalesce('. ' || v_rendeltetes, '.') ||
    coalesce(E'\n' || 'Szolgáltató: ' || v_szolgaltato || '.', '') || E'\n\n' ||

    'SZEREP ÉS BESOROLÁS' || E'\n' ||
    v_szerep_cimke || '. ' || v_szerep_magyarazat || E'\n' ||
    'Besorolás: ' || v_besorolas || '. ' || v_besorolas_indok || E'\n\n' ||

    'ALKALMAZANDÓ SZABÁLYOZÁS' || E'\n' ||
    'A dokumentum ' || v_fejezet || ' kötelezettséget tartalmaz' ||
    case
      when coalesce(v_forras_db, 0) > 0
        then ', ' || v_forras_db || ' jogforrás alapján: ' || v_forras_lista || '.'
      else '.'
    end ||
    coalesce(E'\n' || 'Később hatályba lépő kötelezettségek:' || E'\n' || v_jovobeli_sor, '') || E'\n\n' ||

    'TEENDŐK' || E'\n' ||
    case
      when coalesce(v_teendo_ossz, 0) = 0
        then 'A dokumentumhoz nem tartozik külön nevesített teendő; a kötelezettségek a fejezetek szövegéből következnek.'
      else v_teendo_ossz || ' nevesített teendő tartozik a dokumentumhoz, ebből '
           || v_teendo_azonnali || ' azonnali prioritású.'
           || coalesce(E'\n' || 'A legsürgősebbek:' || E'\n' || v_teendo_lista, '')
    end || E'\n\n' ||

    'A DOKUMENTUM ÁLLAPOTA' || E'\n' ||
    case
      when coalesce(v_fuggo, 0) = 0
        then 'Minden fejezet jogi felülvizsgálaton átesett szabályon alapul.'
      else v_fuggo || ' fejezet olyan szabályon alapul, amelyet jogi felülvizsgálat még nem hagyott jóvá.'
    end || E'\n' ||
    'A besorolás a felvitelkor tett nyilatkozatokból következik. A végleges jogi minősítés a felülvizsgáló feladata; ez a dokumentum döntéstámogatás, nem jogi tanácsadás.';

  return v_szoveg;
end;
$function$;

revoke all on function public.aic_vezetoi_osszefoglalo(uuid, jsonb) from public, anon;
grant execute on function public.aic_vezetoi_osszefoglalo(uuid, jsonb) to authenticated;

-- ---------------------------------------------------------------------------
-- 2. A generátor az új függvényt használja.
--    Az egyetlen érdemi változás: az összefoglalót már nem a fejezetek
--    összefűzése adja, hanem a fenti függvény, a kész fejezetlistából.
-- ---------------------------------------------------------------------------
create or replace function public.aic_generate_policy(p_ai_system_id uuid)
returns uuid
language plpgsql
security invoker
set search_path = public, pg_temp
as $function$
declare
  v_user_id uuid := auth.uid();
  v_organisation_id uuid;
  v_organisation_name text;
  v_system_name text;
  v_system_type_code text;
  v_industry text;
  v_profile jsonb;
  v_policy_id uuid;
  v_next_version integer;
  v_sections jsonb;
  v_summary text;
  v_document_text text;
  v_source_snapshot jsonb;
  v_pending_review integer;
begin
  if v_user_id is null then
    raise exception 'A szabályzat létrehozásához bejelentkezés szükséges.';
  end if;

  select s.organisation_id, o.name, s.name, t.type_code, coalesce(s.industry_code, o.industry),
         coalesce(f.facts, '{}'::jsonb)
           || jsonb_build_object(
                'system_type_code', t.type_code,
                'industry', coalesce(s.industry_code, o.industry, 'unknown'),
                'organisation_role', coalesce(s.organisation_role, 'unknown'),
                'lifecycle_stage', s.lifecycle_stage
              )
    into v_organisation_id, v_organisation_name, v_system_name,
         v_system_type_code, v_industry, v_profile
  from public.aic_ai_systems s
  join public.aic_organisations o on o.id = s.organisation_id
  join public.aic_system_type_templates t on t.id = s.system_type_id
  left join public.aic_system_facts f on f.system_id = s.id
  where s.id = p_ai_system_id and s.inventory_status = 'active';

  if not found then
    raise exception 'Az MI-rendszer nem található, nem aktív vagy nincs rendszertípusa.';
  end if;

  if not exists (
    select 1 from public.aic_organisation_members m
    where m.organisation_id = v_organisation_id and m.user_id = v_user_id
      and m.member_role in ('owner', 'admin', 'compliance', 'editor')
  ) then
    raise exception 'Nincs jogosultságod szabályzatot létrehozni ehhez a rendszerhez.';
  end if;

  perform pg_advisory_xact_lock(hashtextextended(p_ai_system_id::text, 0));

  with selected_modules as (
    select
      m.id, m.module_code, m.title, m.section_key, m.module_kind, m.summary_text,
      replace(
        replace(m.full_text_template, '{{organisation_name}}', v_organisation_name),
        '{{system_name}}', v_system_name
      ) as rendered_text,
      m.rule_id, m.version, m.display_order,
      m.lifecycle_status as module_lifecycle_status,
      coalesce(r.requires_human_review, false) as requires_human_review,
      row_number() over (order by m.display_order, m.module_code) as section_number,
      r.rule_code,
      coalesce((
        select jsonb_agg(
          jsonb_build_object(
            'article_number', p.article_number,
            'paragraph_number', p.paragraph_number,
            'heading', p.heading,
            'source_title', src.title,
            'official_url', src.official_url
          ) order by p.article_number, p.paragraph_number
        )
        from public.aic_rule_legal_bases lb
        join public.aic_legal_provisions p on p.id = lb.provision_id
        join public.aic_legal_sources src on src.id = p.source_id
        where lb.rule_id = m.rule_id
      ), '[]'::jsonb) as legal_references,
      -- A prioritás szöveges mező, ezért a betűrend szerinti rendezés rossz
      -- sorrendet adott: a "medium" került előre a "critical" elé.
      coalesce((
        select jsonb_agg(
          jsonb_build_object(
            'title', a.action_title,
            'description', a.action_description,
            'priority', a.priority
          ) order by case a.priority
                       when 'critical' then 1
                       when 'high' then 2
                       when 'medium' then 3
                       else 4
                     end, a.action_title
        )
        from public.aic_required_actions a where a.rule_id = m.rule_id
      ), '[]'::jsonb) as required_actions,
      coalesce((
        select jsonb_agg(
          jsonb_build_object(
            'title', e.evidence_title,
            'description', e.evidence_description,
            'mandatory', e.mandatory,
            'formats', e.accepted_formats
          ) order by e.mandatory desc, e.evidence_title
        )
        from public.aic_required_evidence e where e.rule_id = m.rule_id
      ), '[]'::jsonb) as required_evidence
    from public.aic_policy_modules m
    left join public.aic_compliance_rules r on r.id = m.rule_id
    where m.lifecycle_status in ('approved', 'under_review')
      and (m.valid_from is null or m.valid_from <= current_date)
      and (m.valid_to is null or m.valid_to >= current_date)
      and public.aic_applicability_matches(m.applicability, v_profile)
  )
  select
    jsonb_agg(
      jsonb_build_object(
        'number', section_number,
        'section_key', section_key,
        'title', title,
        'module_kind', module_kind,
        'summary', summary_text,
        'content', rendered_text,
        'rule_code', rule_code,
        'legal_references', legal_references,
        'required_actions', required_actions,
        'required_evidence', required_evidence,
        'module_lifecycle_status', module_lifecycle_status,
        'requires_human_review', requires_human_review,
        'origin', 'generated'
      ) order by section_number
    ),
    v_system_name || ' alkalmazandó szabályozási és megfelelőségi követelményei' || E'\n\n' ||
      string_agg(section_number || '. ' || title || E'\n\n' || rendered_text, E'\n\n' order by section_number),
    jsonb_build_object(
      'generated_at', now(),
      -- A generátor verziója. Ha a generátor logikája változik, ezt emeljük,
      -- és a dokumentumok a következő megnyitáskor újraépülnek. Enélkül a
      -- régi séma szerint mentett fejezetek örökre ott ragadnának.
      'generator_version', 2,
      'system_type_code', v_system_type_code,
      'industry', coalesce(v_industry, 'unknown'),
      'evaluated_profile', v_profile,
      'modules', jsonb_agg(
        jsonb_build_object(
          'module_id', id, 'module_code', module_code, 'module_version', version,
          'rule_id', rule_id, 'rule_code', rule_code
        ) order by section_number
      )
    ),
    count(*) filter (where module_lifecycle_status <> 'approved' or requires_human_review)
  into v_sections, v_document_text, v_source_snapshot, v_pending_review
  from selected_modules;

  if v_sections is null or jsonb_array_length(v_sections) = 0 then
    raise exception 'Ehhez a rendszertípushoz még nincs elérhető szabályzati modul.';
  end if;

  -- Az összefoglaló a kész fejezetlistából épül, nem annak összefűzéséből.
  v_summary := public.aic_vezetoi_osszefoglalo(p_ai_system_id, v_sections);

  v_source_snapshot := v_source_snapshot || jsonb_build_object(
    'pending_expert_review_count', v_pending_review,
    'section_count', jsonb_array_length(v_sections)
  );

  select coalesce(max(version), 0) + 1 into v_next_version
  from public.aic_generated_policies where ai_system_id = p_ai_system_id;

  insert into public.aic_generated_policies (
    organisation_id, ai_system_id, title, executive_summary, document_sections,
    document_text, source_snapshot, version, status, created_by, updated_by
  ) values (
    v_organisation_id, p_ai_system_id,
    v_system_name || ' alkalmazandó szabályozási és megfelelőségi követelményei',
    v_summary, v_sections, v_document_text, v_source_snapshot,
    v_next_version, 'draft', v_user_id, v_user_id
  ) returning id into v_policy_id;

  return v_policy_id;
end;
$function$;

-- ---------------------------------------------------------------------------
-- 3. A meglévő dokumentumok újraépítése.
--
--    A már mentett fejezetek egy korábbi generátorváltozattól származnak: a
--    622 fejezetből csak 46-ban van teendőkulcs, és abban is üresen. Ha csak
--    az összefoglalót írnánk felül, az azt állítaná, hogy nincsenek teendők –
--    ami nem igaz, 99 teendő van rögzítve.
--
--    Ezért nem foltozunk: a frissítés-ellenőrző mostantól a generátor
--    verzióját is nézi. Ha a mentett dokumentum régebbi generátorral készült,
--    a következő megnyitáskor új verzió épül, teendőkkel és új összefoglalóval.
--    A jóváhagyott dokumentumok érintetlenek maradnak: azok tartalma zárolt,
--    és új verzió mellettük keletkezik, nem helyettük.
-- ---------------------------------------------------------------------------
create or replace function public.aic_generate_policy_if_changed(p_ai_system_id uuid)
returns jsonb
language plpgsql
security invoker
set search_path = public, pg_temp
as $function$
declare
  v_user_id uuid := auth.uid();
  v_organisation_id uuid;
  v_profile jsonb;
  v_current_modules jsonb;
  v_latest_id uuid;
  v_latest_snapshot jsonb;
  v_latest_profile jsonb;
  v_new_id uuid;
  v_generator_version constant integer := 2;
begin
  if v_user_id is null then
    raise exception 'A dokumentum frissítéséhez bejelentkezés szükséges.';
  end if;

  select s.organisation_id into v_organisation_id
  from public.aic_ai_systems s
  where s.id = p_ai_system_id and s.inventory_status = 'active';
  if not found then
    raise exception 'Az MI-rendszer nem található vagy nem aktív.';
  end if;

  if not exists (
    select 1 from public.aic_organisation_members m
    where m.organisation_id = v_organisation_id
      and m.user_id = v_user_id
      and m.member_role in ('owner','admin','compliance','editor')
  ) then
    raise exception 'Nincs jogosultságod a dokumentum frissítéséhez.';
  end if;

  v_profile := public.aic_require_valid_usage_profile(p_ai_system_id);
  perform pg_advisory_xact_lock(hashtextextended(p_ai_system_id::text, 0));

  select coalesce(jsonb_agg(jsonb_build_object(
      'module_id', m.id, 'module_code', m.module_code, 'module_version', m.version,
      'rule_id', m.rule_id, 'rule_code', r.rule_code
    ) order by m.display_order, m.module_code), '[]'::jsonb)
  into v_current_modules
  from public.aic_policy_modules m
  left join public.aic_compliance_rules r on r.id = m.rule_id
  where m.lifecycle_status in ('approved','under_review')
    and (m.valid_from is null or m.valid_from <= current_date)
    and (m.valid_to is null or m.valid_to >= current_date)
    and public.aic_applicability_matches(m.applicability, v_profile);

  if jsonb_array_length(v_current_modules) = 0 then
    raise exception 'A szabályzat nem készíthető el, mert az érvényes használati profilhoz nincs alkalmazható szabálymodul.';
  end if;

  select gp.id, gp.source_snapshot
  into v_latest_id, v_latest_snapshot
  from public.aic_generated_policies gp
  where gp.ai_system_id = p_ai_system_id
  order by gp.version desc
  limit 1;

  v_latest_profile := coalesce(v_latest_snapshot->'evaluated_profile', 'null'::jsonb);

  -- Változatlan akkor és csak akkor, ha a profil, a modullista ÉS a generátor
  -- verziója is egyezik.
  if v_latest_id is not null
     and coalesce((v_latest_snapshot->>'generator_version')::integer, 0) = v_generator_version
     and (
       (v_latest_profile - 'profile_validated' - 'capability_dependencies_validated')
         = (v_profile - 'profile_validated' - 'capability_dependencies_validated')
       or
       (v_latest_profile - 'profile_validated' - 'capability_dependencies_validated' - 'usage_profile_code')
         = (v_profile - 'profile_validated' - 'capability_dependencies_validated' - 'usage_profile_code')
     )
     and coalesce(v_latest_snapshot->'modules', '[]'::jsonb) = v_current_modules then
    return jsonb_build_object('policy_id', v_latest_id, 'created', false);
  end if;

  v_new_id := public.aic_generate_policy(p_ai_system_id);
  return jsonb_build_object('policy_id', v_new_id, 'created', true);
end;
$function$;

commit;
