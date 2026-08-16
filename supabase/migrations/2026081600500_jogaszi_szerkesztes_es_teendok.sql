-- EnergiaAI Kontroll – jogászi szerkesztés, teendők és bizonyítékok.
--
-- HÁROM DOLGOT OLD MEG
--
-- 1. Teendők és bizonyítékok a szabályzatban
--    Az aic_required_actions (99 sor) és az aic_required_evidence (135 sor)
--    eddig egyetlen kódútvonalon sem szerepelt. Ezek mondják meg fejezetenként,
--    hogy mit kell tenni és mit kell megőrizni. Enélkül a dokumentum csak
--    követelményeket sorol, teendőket nem.
--
-- 2. Jogászi szerkesztés a dokumentumban
--    A jogász átírhat bármely fejezetet és újat is felvehet. A gépi változat
--    a document_sections mezőben érintetlen marad, a módosítások külön
--    rétegben (edited_sections) tárolódnak, fejezetenként jelölve, ki és
--    mikor írta át. Így a szerkesztés teljes, de a dokumentumról bármikor
--    megmondható, mi gépi és mi emberi eredetű.
--
-- 3. Elutasítás oktípussal
--    "Rendszeradat hibás" a rögzítőnek szól, "Szabályzati tartalom hiányos"
--    a jogász saját teendője. Eddig minden elutasítás a rögzítőhöz került.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

-- ===========================================================================
-- 1. Új mezők
-- ===========================================================================

alter table public.aic_generated_policies
  add column if not exists edited_sections jsonb,
  add column if not exists last_edited_by uuid references auth.users(id) on delete set null,
  add column if not exists last_edited_at timestamptz,
  add column if not exists review_reason_type text;

alter table public.aic_generated_policies
  drop constraint if exists aic_generated_policies_review_reason_type_check;

alter table public.aic_generated_policies
  add constraint aic_generated_policies_review_reason_type_check
  check (review_reason_type is null or review_reason_type in ('system_data', 'policy_content'));

alter table public.aic_generated_policies
  drop constraint if exists aic_generated_policies_edited_sections_check;

alter table public.aic_generated_policies
  add constraint aic_generated_policies_edited_sections_check
  check (edited_sections is null or jsonb_typeof(edited_sections) = 'array');

comment on column public.aic_generated_policies.edited_sections is
  'A jogász által szerkesztett fejezetek. Ha üres, a document_sections gépi változata érvényes.';
comment on column public.aic_generated_policies.review_reason_type is
  'Elutasítás oka: system_data = a rögzítő javítja, policy_content = a jogász javítja.';

-- A megjelenítendő tartalom: a szerkesztett réteg, ha van, egyébként a gépi.
create or replace function public.aic_effective_sections(p_policy public.aic_generated_policies)
returns jsonb
language sql
immutable
set search_path = public, pg_temp
as $function$
  select coalesce(p_policy.edited_sections, p_policy.document_sections);
$function$;

-- ===========================================================================
-- 2. Az ujjlenyomat a ténylegesen látott tartalomra vonatkozzon
-- ===========================================================================

create or replace function public.aic_set_policy_content_hash()
returns trigger
language plpgsql
set search_path = public, pg_temp
as $function$
begin
  new.content_sha256 := public.aic_policy_content_hash(
    new.title,
    new.executive_summary,
    coalesce(new.edited_sections, new.document_sections)
  );
  return new;
end;
$function$;

drop trigger if exists aic_generated_policies_content_hash on public.aic_generated_policies;
create trigger aic_generated_policies_content_hash
  before insert or update of title, executive_summary, document_sections, edited_sections
  on public.aic_generated_policies
  for each row execute function public.aic_set_policy_content_hash();

-- A jóváhagyott dokumentum szerkesztett rétege is zárolt.
create or replace function public.aic_protect_approved_policy()
returns trigger
language plpgsql
set search_path = public, pg_temp
as $function$
begin
  if old.status <> 'approved' then
    return new;
  end if;

  if new.title is distinct from old.title
     or new.executive_summary is distinct from old.executive_summary
     or new.document_sections is distinct from old.document_sections
     or new.edited_sections is distinct from old.edited_sections
     or new.document_text is distinct from old.document_text
     or new.source_snapshot is distinct from old.source_snapshot
     or new.version is distinct from old.version then
    raise exception 'A jóváhagyott szabályzat tartalma nem módosítható. Készíts új verziót.';
  end if;

  if new.status not in ('approved', 'archived') then
    raise exception 'A jóváhagyott szabályzat állapota csak archiváltra változtatható.';
  end if;

  return new;
end;
$function$;

-- ===========================================================================
-- 3. Teendők és bizonyítékok bekötése a generátorba
-- ===========================================================================

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
      -- Konkrét teendők a szabályhoz.
      coalesce((
        select jsonb_agg(
          jsonb_build_object(
            'title', a.action_title,
            'description', a.action_description,
            'priority', a.priority
          ) order by a.priority desc, a.action_title
        )
        from public.aic_required_actions a where a.rule_id = m.rule_id
      ), '[]'::jsonb) as required_actions,
      -- Megőrzendő bizonyítékok.
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
    'A dokumentum legfontosabb alkalmazandó követelményei és kontrolljai:' || E'\n\n' ||
      string_agg('- ' || summary_text, E'\n' order by section_number),
    v_system_name || ' alkalmazandó szabályozási és megfelelőségi követelményei' || E'\n\n' ||
      string_agg(section_number || '. ' || title || E'\n\n' || rendered_text, E'\n\n' order by section_number),
    jsonb_build_object(
      'generated_at', now(),
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
  into v_sections, v_summary, v_document_text, v_source_snapshot, v_pending_review
  from selected_modules;

  if v_sections is null or jsonb_array_length(v_sections) = 0 then
    raise exception 'Ehhez a rendszertípushoz még nincs elérhető szabályzati modul.';
  end if;

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

-- ===========================================================================
-- 4. Jogászi szerkesztés
-- ===========================================================================

-- Közös ellenőrzés: jogosultság és szerkeszthető állapot.
create or replace function public.aic_assert_policy_editable(p_policy_id uuid)
returns public.aic_generated_policies
language plpgsql
stable
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
begin
  v_policy := public.aic_assert_policy_permission(
    p_policy_id, array['owner', 'admin', 'compliance']
  );

  if v_policy.status = 'approved' then
    raise exception 'A jóváhagyott szabályzat nem szerkeszthető. Készíts új verziót.';
  end if;
  if v_policy.status = 'archived' then
    raise exception 'Az archivált szabályzat nem szerkeszthető.';
  end if;

  return v_policy;
end;
$function$;

-- Egy fejezet átírása. Az első szerkesztéskor a gépi változatból másolunk.
create or replace function public.aic_edit_policy_section(
  p_policy_id uuid, p_section_number integer, p_title text, p_content text
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
  v_sections jsonb;
  v_index integer;
begin
  v_policy := public.aic_assert_policy_editable(p_policy_id);

  if nullif(btrim(p_content), '') is null then
    raise exception 'A fejezet szövege nem lehet üres.';
  end if;

  v_sections := coalesce(v_policy.edited_sections, v_policy.document_sections);

  select ordinality - 1 into v_index
  from jsonb_array_elements(v_sections) with ordinality as t(elem, ordinality)
  where (t.elem->>'number')::integer = p_section_number;

  if v_index is null then
    raise exception 'A(z) %. fejezet nem található.', p_section_number;
  end if;

  v_sections := jsonb_set(
    v_sections,
    array[v_index::text],
    (v_sections->v_index)
      || jsonb_build_object(
           'title', coalesce(nullif(btrim(p_title), ''), v_sections->v_index->>'title'),
           'content', btrim(p_content),
           'origin', 'edited',
           'edited_at', to_jsonb(now()),
           'edited_by', to_jsonb(auth.uid())
         )
  );

  update public.aic_generated_policies
     set edited_sections = v_sections,
         last_edited_by = auth.uid(),
         last_edited_at = now(),
         updated_by = auth.uid()
   where id = p_policy_id;

  return jsonb_build_object('policy_id', p_policy_id, 'section_number', p_section_number);
end;
$function$;

-- Új, jogász által írt fejezet hozzáadása a dokumentum végére.
create or replace function public.aic_add_policy_section(
  p_policy_id uuid, p_title text, p_content text
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
  v_sections jsonb;
  v_next integer;
begin
  v_policy := public.aic_assert_policy_editable(p_policy_id);

  if nullif(btrim(p_title), '') is null or nullif(btrim(p_content), '') is null then
    raise exception 'Az új fejezethez cím és szöveg is szükséges.';
  end if;

  v_sections := coalesce(v_policy.edited_sections, v_policy.document_sections);

  select coalesce(max((elem->>'number')::integer), 0) + 1 into v_next
  from jsonb_array_elements(v_sections) elem;

  v_sections := v_sections || jsonb_build_array(jsonb_build_object(
    'number', v_next,
    'section_key', 'legal_addition',
    'title', btrim(p_title),
    'module_kind', 'legal_requirement',
    'summary', left(btrim(p_content), 200),
    'content', btrim(p_content),
    'legal_references', '[]'::jsonb,
    'required_actions', '[]'::jsonb,
    'required_evidence', '[]'::jsonb,
    'module_lifecycle_status', 'approved',
    'requires_human_review', false,
    'origin', 'lawyer_added',
    'edited_at', to_jsonb(now()),
    'edited_by', to_jsonb(auth.uid())
  ));

  update public.aic_generated_policies
     set edited_sections = v_sections,
         last_edited_by = auth.uid(),
         last_edited_at = now(),
         updated_by = auth.uid()
   where id = p_policy_id;

  return jsonb_build_object('policy_id', p_policy_id, 'section_number', v_next);
end;
$function$;

-- Egy fejezet visszaállítása a gépi változatra.
create or replace function public.aic_reset_policy_section(
  p_policy_id uuid, p_section_number integer
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
  v_sections jsonb;
  v_original jsonb;
  v_index integer;
begin
  v_policy := public.aic_assert_policy_editable(p_policy_id);

  if v_policy.edited_sections is null then
    return jsonb_build_object('policy_id', p_policy_id, 'changed', false);
  end if;

  select elem into v_original
  from jsonb_array_elements(v_policy.document_sections) elem
  where (elem->>'number')::integer = p_section_number;

  if v_original is null then
    raise exception 'Ez a fejezet nem szerepel a gépi változatban, ezért nem állítható vissza.';
  end if;

  select ordinality - 1 into v_index
  from jsonb_array_elements(v_policy.edited_sections) with ordinality as t(elem, ordinality)
  where (t.elem->>'number')::integer = p_section_number;

  v_sections := jsonb_set(v_policy.edited_sections, array[v_index::text], v_original);

  update public.aic_generated_policies
     set edited_sections = case when v_sections = v_policy.document_sections then null else v_sections end,
         last_edited_by = auth.uid(),
         last_edited_at = now(),
         updated_by = auth.uid()
   where id = p_policy_id;

  return jsonb_build_object('policy_id', p_policy_id, 'changed', true);
end;
$function$;

-- ===========================================================================
-- 5. Elutasítás oktípussal
-- ===========================================================================

drop function if exists public.aic_reject_policy(uuid, text);

create or replace function public.aic_reject_policy(
  p_policy_id uuid, p_note text, p_reason_type text default 'system_data'
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
begin
  v_policy := public.aic_assert_policy_permission(
    p_policy_id, array['owner', 'admin', 'compliance']
  );

  if v_policy.status <> 'in_review' then
    raise exception 'Csak felülvizsgálat alatt álló szabályzat utasítható el. Jelenlegi állapot: %.', v_policy.status;
  end if;
  if nullif(btrim(p_note), '') is null then
    raise exception 'Az elutasítás indoklása kötelező.';
  end if;
  if p_reason_type not in ('system_data', 'policy_content') then
    raise exception 'Az elutasítás oka csak system_data vagy policy_content lehet.';
  end if;

  update public.aic_generated_policies
     set status = 'rejected',
         reviewed_by = auth.uid(),
         reviewed_at = now(),
         review_note = btrim(p_note),
         review_reason_type = p_reason_type,
         updated_by = auth.uid()
   where id = p_policy_id;

  insert into public.aic_policy_approvals
    (policy_id, organisation_id, action, from_status, to_status, note, content_sha256, acted_by)
  values
    (p_policy_id, v_policy.organisation_id, 'rejected', v_policy.status, 'rejected',
     btrim(p_note), v_policy.content_sha256, auth.uid());

  return jsonb_build_object(
    'policy_id', p_policy_id, 'status', 'rejected', 'reason_type', p_reason_type
  );
end;
$function$;

-- A jóváhagyás a ténylegesen látott tartalomra vonatkozzon.
create or replace function public.aic_approve_policy(
  p_policy_id uuid, p_note text default null
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
  v_current_hash text;
begin
  v_policy := public.aic_assert_policy_permission(
    p_policy_id, array['owner', 'admin', 'compliance']
  );

  if v_policy.status <> 'in_review' then
    raise exception 'Csak felülvizsgálat alatt álló szabályzat hagyható jóvá. Jelenlegi állapot: %.', v_policy.status;
  end if;

  v_current_hash := public.aic_policy_content_hash(
    v_policy.title,
    v_policy.executive_summary,
    coalesce(v_policy.edited_sections, v_policy.document_sections)
  );

  if v_policy.content_sha256 is distinct from v_current_hash then
    raise exception 'A dokumentum tartalma megváltozott a beküldés óta. Küldd be újra felülvizsgálatra.';
  end if;

  update public.aic_generated_policies
     set status = 'approved',
         reviewed_by = auth.uid(),
         reviewed_at = now(),
         review_note = nullif(btrim(p_note), ''),
         review_reason_type = null,
         updated_by = auth.uid()
   where id = p_policy_id;

  insert into public.aic_policy_approvals
    (policy_id, organisation_id, action, from_status, to_status, note, content_sha256, acted_by)
  values
    (p_policy_id, v_policy.organisation_id, 'approved', v_policy.status, 'approved',
     nullif(btrim(p_note), ''), v_current_hash, auth.uid());

  return jsonb_build_object('policy_id', p_policy_id, 'status', 'approved', 'content_sha256', v_current_hash);
end;
$function$;

-- ===========================================================================
-- 6. Jogosultságok
-- ===========================================================================

revoke all on function public.aic_effective_sections(public.aic_generated_policies) from public, anon;
revoke all on function public.aic_assert_policy_editable(uuid) from public, anon;
revoke all on function public.aic_edit_policy_section(uuid, integer, text, text) from public, anon;
revoke all on function public.aic_add_policy_section(uuid, text, text) from public, anon;
revoke all on function public.aic_reset_policy_section(uuid, integer) from public, anon;
revoke all on function public.aic_reject_policy(uuid, text, text) from public, anon;
revoke all on function public.aic_approve_policy(uuid, text) from public, anon;

grant execute on function public.aic_effective_sections(public.aic_generated_policies) to authenticated;
grant execute on function public.aic_assert_policy_editable(uuid) to authenticated;
grant execute on function public.aic_edit_policy_section(uuid, integer, text, text) to authenticated;
grant execute on function public.aic_add_policy_section(uuid, text, text) to authenticated;
grant execute on function public.aic_reset_policy_section(uuid, integer) to authenticated;
grant execute on function public.aic_reject_policy(uuid, text, text) to authenticated;
grant execute on function public.aic_approve_policy(uuid, text) to authenticated;

commit;
