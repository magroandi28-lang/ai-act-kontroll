-- EnergiaAI Kontroll – katalógusból beemelés és visszacsatolás a szabálymotorra.
--
-- MIT OLD MEG
-- Ha a jogász hiányt talál a szabályzatban, ne kelljen fejezetet írnia: válasszon
-- a 120 elemű modulkatalógusból. A beemelt modul hozza magával a jogforrás-
-- hivatkozásait, teendőit és bizonyítékait, tehát ugyanolyan minőségű lesz,
-- mintha a motor választotta volna ki.
--
-- A VISSZACSATOLÁS
-- Minden kézi beemelés egy jelzés arról, hogy a szabálymotor feltétele hibás.
-- A beemeléskor elmentjük a rendszer akkori tényeit is, így utólag pontosan
-- megállapítható, milyen adat mellett maradt ki a modul. Az összesítésből
-- látszik, mely modulok feltételét kell javítani.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

-- ===========================================================================
-- 1. A visszacsatolás naplója
-- ===========================================================================

create table if not exists public.aic_module_manual_insertions (
  id uuid primary key default gen_random_uuid(),
  organisation_id uuid not null references public.aic_organisations(id) on delete cascade,
  policy_id uuid not null references public.aic_generated_policies(id) on delete cascade,
  ai_system_id uuid not null references public.aic_ai_systems(id) on delete cascade,
  module_id uuid references public.aic_policy_modules(id) on delete set null,
  module_code text not null,
  action text not null default 'inserted' check (action in ('inserted', 'removed')),
  reason_note text,
  -- A rendszer tényei a művelet pillanatában. Ebből derül ki, miért nem
  -- illeszkedett a modul feltétele.
  evaluated_profile jsonb,
  acted_by uuid not null references auth.users(id) on delete restrict,
  acted_at timestamptz not null default now()
);

create index if not exists aic_module_manual_insertions_module_idx
  on public.aic_module_manual_insertions (module_code, action, acted_at desc);

alter table public.aic_module_manual_insertions enable row level security;

drop policy if exists module_manual_insertions_select on public.aic_module_manual_insertions;
create policy module_manual_insertions_select on public.aic_module_manual_insertions
  for select to authenticated
  using (
    exists (
      select 1 from public.aic_organisation_members m
      where m.organisation_id = aic_module_manual_insertions.organisation_id
        and m.user_id = (select auth.uid())
    )
  );

-- ===========================================================================
-- 2. Egy modul fejezetté alakítása
--
-- Ugyanaz a megjelenítés, mint a generátorban, hogy a kézzel beemelt fejezet
-- semmiben ne különbözzön a gépitől.
-- ===========================================================================

create or replace function public.aic_render_policy_module(
  p_module_id uuid, p_ai_system_id uuid, p_section_number integer, p_origin text
) returns jsonb
language sql
stable
set search_path = public, pg_temp
as $function$
  select jsonb_build_object(
    'number', p_section_number,
    'section_key', m.section_key,
    'title', m.title,
    'module_kind', m.module_kind,
    'summary', m.summary_text,
    'content', replace(
      replace(m.full_text_template, '{{organisation_name}}', o.name),
      '{{system_name}}', s.name
    ),
    'rule_code', r.rule_code,
    'module_code', m.module_code,
    'legal_references', coalesce((
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
    ), '[]'::jsonb),
    'required_actions', coalesce((
      select jsonb_agg(
        jsonb_build_object('title', a.action_title, 'description', a.action_description, 'priority', a.priority)
        order by a.priority desc, a.action_title
      )
      from public.aic_required_actions a where a.rule_id = m.rule_id
    ), '[]'::jsonb),
    'required_evidence', coalesce((
      select jsonb_agg(
        jsonb_build_object('title', e.evidence_title, 'description', e.evidence_description,
                           'mandatory', e.mandatory, 'formats', e.accepted_formats)
        order by e.mandatory desc, e.evidence_title
      )
      from public.aic_required_evidence e where e.rule_id = m.rule_id
    ), '[]'::jsonb),
    'module_lifecycle_status', m.lifecycle_status,
    'requires_human_review', coalesce(r.requires_human_review, false),
    'origin', p_origin,
    'edited_at', to_jsonb(now()),
    'edited_by', to_jsonb(auth.uid())
  )
  from public.aic_policy_modules m
  left join public.aic_compliance_rules r on r.id = m.rule_id
  cross join lateral (
    select s2.name, s2.organisation_id from public.aic_ai_systems s2 where s2.id = p_ai_system_id
  ) s
  join public.aic_organisations o on o.id = s.organisation_id
  where m.id = p_module_id;
$function$;

-- ===========================================================================
-- 3. A választható katalógus
-- ===========================================================================

create or replace function public.aic_available_catalogue_modules(p_policy_id uuid)
returns table (
  module_id uuid,
  module_code text,
  title text,
  module_kind text,
  summary_text text,
  lifecycle_status text,
  legal_reference_labels text,
  already_in_document boolean
)
language sql
stable
set search_path = public, pg_temp
as $function$
  with policy as (
    select gp.id, coalesce(gp.edited_sections, gp.document_sections) as sections
    from public.aic_generated_policies gp
    where gp.id = p_policy_id
  ), used as (
    select distinct coalesce(elem->>'module_code', elem->>'rule_code') as code
    from policy, jsonb_array_elements(policy.sections) elem
  )
  select
    m.id, m.module_code, m.title, m.module_kind, m.summary_text, m.lifecycle_status,
    coalesce((
      select string_agg(distinct
        coalesce(src.title, '') || ' ' || coalesce(p.article_number, ''), ' · ')
      from public.aic_rule_legal_bases lb
      join public.aic_legal_provisions p on p.id = lb.provision_id
      join public.aic_legal_sources src on src.id = p.source_id
      where lb.rule_id = m.rule_id
    ), '') as legal_reference_labels,
    exists (
      select 1 from used u
      where u.code = m.module_code
         or u.code = (select r2.rule_code from public.aic_compliance_rules r2 where r2.id = m.rule_id)
    ) as already_in_document
  from public.aic_policy_modules m
  where m.lifecycle_status in ('approved', 'under_review')
    and (m.valid_from is null or m.valid_from <= current_date)
    and (m.valid_to is null or m.valid_to >= current_date)
  order by m.display_order, m.module_code;
$function$;

-- ===========================================================================
-- 4. Beemelés és eltávolítás
-- ===========================================================================

create or replace function public.aic_insert_catalogue_module(
  p_policy_id uuid, p_module_code text, p_note text default null
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
  v_module public.aic_policy_modules%rowtype;
  v_sections jsonb;
  v_next integer;
  v_section jsonb;
  v_profile jsonb;
begin
  v_policy := public.aic_assert_policy_editable(p_policy_id);

  select * into v_module from public.aic_policy_modules where module_code = p_module_code;
  if not found then
    raise exception 'A(z) "%" modul nem található a katalógusban.', p_module_code;
  end if;

  v_sections := coalesce(v_policy.edited_sections, v_policy.document_sections);

  if exists (
    select 1 from jsonb_array_elements(v_sections) elem
    where elem->>'module_code' = p_module_code
  ) then
    raise exception 'Ez a fejezet már szerepel a dokumentumban.';
  end if;

  select coalesce(max((elem->>'number')::integer), 0) + 1 into v_next
  from jsonb_array_elements(v_sections) elem;

  v_section := public.aic_render_policy_module(
    v_module.id, v_policy.ai_system_id, v_next, 'catalogue_added'
  );

  if v_section is null then
    raise exception 'A modul nem jeleníthető meg ehhez a rendszerhez.';
  end if;

  update public.aic_generated_policies
     set edited_sections = v_sections || jsonb_build_array(v_section),
         last_edited_by = auth.uid(),
         last_edited_at = now(),
         updated_by = auth.uid()
   where id = p_policy_id;

  -- A visszacsatoláshoz elmentjük a rendszer akkori tényeit.
  select f.facts into v_profile
  from public.aic_system_facts f where f.system_id = v_policy.ai_system_id;

  insert into public.aic_module_manual_insertions
    (organisation_id, policy_id, ai_system_id, module_id, module_code,
     action, reason_note, evaluated_profile, acted_by)
  values
    (v_policy.organisation_id, p_policy_id, v_policy.ai_system_id, v_module.id, p_module_code,
     'inserted', nullif(btrim(p_note), ''), v_profile, auth.uid());

  return jsonb_build_object('policy_id', p_policy_id, 'section_number', v_next, 'module_code', p_module_code);
end;
$function$;

create or replace function public.aic_remove_policy_section(
  p_policy_id uuid, p_section_number integer, p_note text default null
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
  v_sections jsonb;
  v_removed jsonb;
  v_profile jsonb;
begin
  v_policy := public.aic_assert_policy_editable(p_policy_id);

  v_sections := coalesce(v_policy.edited_sections, v_policy.document_sections);

  select elem into v_removed
  from jsonb_array_elements(v_sections) elem
  where (elem->>'number')::integer = p_section_number;

  if v_removed is null then
    raise exception 'A(z) %. fejezet nem található.', p_section_number;
  end if;

  if jsonb_array_length(v_sections) <= 1 then
    raise exception 'Az utolsó fejezet nem távolítható el.';
  end if;

  -- Újraszámozzuk a megmaradt fejezeteket, hogy ne maradjon lyuk.
  select jsonb_agg(
           jsonb_set(elem, '{number}', to_jsonb(row_number() over (order by (elem->>'number')::integer)))
           order by (elem->>'number')::integer
         )
    into v_sections
  from jsonb_array_elements(v_sections) elem
  where (elem->>'number')::integer <> p_section_number;

  update public.aic_generated_policies
     set edited_sections = v_sections,
         last_edited_by = auth.uid(),
         last_edited_at = now(),
         updated_by = auth.uid()
   where id = p_policy_id;

  select f.facts into v_profile
  from public.aic_system_facts f where f.system_id = v_policy.ai_system_id;

  -- Az eltávolítás is jelzés: a motor olyat választott, ami nem tartozik ide.
  if v_removed->>'module_code' is not null then
    insert into public.aic_module_manual_insertions
      (organisation_id, policy_id, ai_system_id, module_code,
       action, reason_note, evaluated_profile, acted_by)
    values
      (v_policy.organisation_id, p_policy_id, v_policy.ai_system_id, v_removed->>'module_code',
       'removed', nullif(btrim(p_note), ''), v_profile, auth.uid());
  end if;

  return jsonb_build_object('policy_id', p_policy_id, 'removed_section', p_section_number);
end;
$function$;

-- ===========================================================================
-- 5. A tanulság: mely modulok feltételét kell javítani
-- ===========================================================================

create or replace view public.aic_rule_engine_feedback as
select
  i.module_code,
  m.title,
  m.applicability,
  count(*) filter (where i.action = 'inserted') as kezi_beemeles,
  count(*) filter (where i.action = 'removed') as kezi_eltavolitas,
  count(distinct i.ai_system_id) as erintett_rendszer,
  max(i.acted_at) as utolso_muvelet,
  jsonb_agg(distinct i.reason_note) filter (where i.reason_note is not null) as indoklasok
from public.aic_module_manual_insertions i
left join public.aic_policy_modules m on m.module_code = i.module_code
group by i.module_code, m.title, m.applicability
order by count(*) desc;

comment on view public.aic_rule_engine_feedback is
  'Mely modulokat kell rendszeresen kézzel pótolni vagy eltávolítani. A sok beemelés azt jelzi, hogy a modul feltétele túl szigorú, a sok eltávolítás azt, hogy túl megengedő.';

-- ===========================================================================
-- 6. Jogosultságok
-- ===========================================================================

revoke all on function public.aic_render_policy_module(uuid, uuid, integer, text) from public, anon;
revoke all on function public.aic_available_catalogue_modules(uuid) from public, anon;
revoke all on function public.aic_insert_catalogue_module(uuid, text, text) from public, anon;
revoke all on function public.aic_remove_policy_section(uuid, integer, text) from public, anon;

grant execute on function public.aic_render_policy_module(uuid, uuid, integer, text) to authenticated;
grant execute on function public.aic_available_catalogue_modules(uuid) to authenticated;
grant execute on function public.aic_insert_catalogue_module(uuid, text, text) to authenticated;
grant execute on function public.aic_remove_policy_section(uuid, integer, text) to authenticated;

grant select on public.aic_rule_engine_feedback to authenticated;

commit;
