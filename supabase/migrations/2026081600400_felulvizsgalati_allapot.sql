-- EnergiaAI Kontroll – felülvizsgálati állapot a szabályzatban.
--
-- MIÉRT
-- A 120 modulból egyetlenegy sincs 'approved' állapotban, és a 117 szabályból
-- 109-nél be van kapcsolva a requires_human_review jelző. A dokumentum eddig
-- ezt elhallgatta: a jogász nem tudta megkülönböztetni, mit nézett át már
-- valaki szakmailag, és mit nem.
--
-- MIT VEZET BE
--   1. Minden fejezet magával viszi a forrásmodul állapotát és a szakértői
--      felülvizsgálat jelzőjét.
--   2. A dokumentum összegzése tartalmazza, hány fejezet vár még jóváhagyásra.
--   3. Külön függvény a szabálykatalógus tételes jóváhagyására.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

-- ---------------------------------------------------------------------------
-- 1. A generátor átadja a fejezetek felülvizsgálati állapotát
-- ---------------------------------------------------------------------------

create or replace function public.aic_generate_policy(p_ai_system_id uuid)
returns uuid
language plpgsql
set search_path to 'public', 'pg_temp'
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
  where s.id = p_ai_system_id
    and s.inventory_status = 'active';

  if not found then
    raise exception 'Az MI-rendszer nem található, nem aktív vagy nincs rendszertípusa.';
  end if;

  if not exists (
    select 1
    from public.aic_organisation_members m
    where m.organisation_id = v_organisation_id
      and m.user_id = v_user_id
      and m.member_role in ('owner', 'admin', 'compliance', 'editor')
  ) then
    raise exception 'Nincs jogosultságod szabályzatot létrehozni ehhez a rendszerhez.';
  end if;

  perform pg_advisory_xact_lock(hashtextextended(p_ai_system_id::text, 0));

  with selected_modules as (
    select
      m.id,
      m.module_code,
      m.title,
      m.section_key,
      m.module_kind,
      m.summary_text,
      replace(
        replace(m.full_text_template, '{{organisation_name}}', v_organisation_name),
        '{{system_name}}', v_system_name
      ) as rendered_text,
      m.rule_id,
      m.version,
      m.display_order,
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
          )
          order by p.article_number, p.paragraph_number
        )
        from public.aic_rule_legal_bases lb
        join public.aic_legal_provisions p on p.id = lb.provision_id
        join public.aic_legal_sources src on src.id = p.source_id
        where lb.rule_id = m.rule_id
      ), '[]'::jsonb) as legal_references
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
        'module_lifecycle_status', module_lifecycle_status,
        'requires_human_review', requires_human_review
      )
      order by section_number
    ),
    'A dokumentum legfontosabb alkalmazandó követelményei és kontrolljai:' || E'\n\n' ||
      string_agg('- ' || summary_text, E'\n' order by section_number),
    v_system_name || ' alkalmazandó szabályozási és megfelelőségi követelményei' || E'\n\n' ||
      string_agg(
        section_number || '. ' || title || E'\n\n' || rendered_text,
        E'\n\n'
        order by section_number
      ),
    jsonb_build_object(
      'generated_at', now(),
      'system_type_code', v_system_type_code,
      'industry', coalesce(v_industry, 'unknown'),
      'evaluated_profile', v_profile,
      'modules', jsonb_agg(
        jsonb_build_object(
          'module_id', id,
          'module_code', module_code,
          'module_version', version,
          'rule_id', rule_id,
          'rule_code', rule_code
        )
        order by section_number
      )
    ),
    count(*) filter (where module_lifecycle_status <> 'approved' or requires_human_review)
  into v_sections, v_summary, v_document_text, v_source_snapshot, v_pending_review
  from selected_modules;

  if v_sections is null or jsonb_array_length(v_sections) = 0 then
    raise exception 'Ehhez a rendszertípushoz még nincs elérhető szabályzati modul.';
  end if;

  -- A felülvizsgálatra váró fejezetek száma a dokumentum részévé válik.
  v_source_snapshot := v_source_snapshot || jsonb_build_object(
    'pending_expert_review_count', v_pending_review,
    'section_count', jsonb_array_length(v_sections)
  );

  select coalesce(max(version), 0) + 1
    into v_next_version
  from public.aic_generated_policies
  where ai_system_id = p_ai_system_id;

  insert into public.aic_generated_policies (
    organisation_id, ai_system_id, title, executive_summary, document_sections,
    document_text, source_snapshot, version, status, created_by, updated_by
  )
  values (
    v_organisation_id,
    p_ai_system_id,
    v_system_name || ' alkalmazandó szabályozási és megfelelőségi követelményei',
    v_summary,
    v_sections,
    v_document_text,
    v_source_snapshot,
    v_next_version,
    'draft',
    v_user_id,
    v_user_id
  )
  returning id into v_policy_id;

  return v_policy_id;
end;
$function$;

-- ---------------------------------------------------------------------------
-- 2. A szabálykatalógus tételes jóváhagyása
--
-- A dokumentum jóváhagyása és a mögötte lévő szabály jóváhagyása két külön
-- dolog. Ez a függvény az utóbbit végzi: egy szabályt és a hozzá tartozó
-- modulokat állítja 'approved' állapotba.
-- ---------------------------------------------------------------------------

create or replace function public.aic_approve_compliance_rule(
  p_rule_code text, p_note text default null
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_rule_id uuid;
  v_modules integer;
begin
  if auth.uid() is null then
    raise exception 'A jóváhagyáshoz bejelentkezés szükséges.';
  end if;

  -- Szabályt csak megfelelőségi felelős, adminisztrátor vagy tulajdonos hagyhat jóvá.
  if not exists (
    select 1 from public.aic_organisation_members m
    where m.user_id = auth.uid()
      and m.member_role in ('owner', 'admin', 'compliance')
  ) then
    raise exception 'Nincs jogosultságod szabályt jóváhagyni.';
  end if;

  select id into v_rule_id
  from public.aic_compliance_rules
  where rule_code = p_rule_code;

  if not found then
    raise exception 'A(z) "%" szabály nem található.', p_rule_code;
  end if;

  update public.aic_compliance_rules
     set lifecycle_status = 'approved',
         approved_by = auth.uid(),
         approved_at = now(),
         requires_human_review = false,
         legal_interpretation_note = coalesce(
           nullif(btrim(p_note), ''), legal_interpretation_note
         ),
         updated_at = now()
   where id = v_rule_id;

  update public.aic_policy_modules
     set lifecycle_status = 'approved',
         version = version + 1,
         updated_at = now()
   where rule_id = v_rule_id;

  get diagnostics v_modules = row_count;

  return jsonb_build_object(
    'rule_code', p_rule_code,
    'approved_modules', v_modules
  );
end;
$function$;

revoke all on function public.aic_approve_compliance_rule(text, text) from public, anon;
grant execute on function public.aic_approve_compliance_rule(text, text) to authenticated;

commit;
