-- EnergiaAI Kontroll – jóváhagyási lánc a generált szabályzatokhoz.
--
-- Miért kell:
-- A szabályzatok eddig kivétel nélkül 'draft' állapotban maradtak, és nem volt
-- mód arra, hogy egy szakember jóváhagyja őket. Nem volt eltárolva, ki és mikor
-- hagyta jóvá, és a jóváhagyott dokumentum tartalma sem volt védve a további
-- módosítástól.
--
-- Mit vezet be:
--   1. állapotgép: draft -> in_review -> approved | rejected  (+ archived)
--   2. jóváhagyási napló minden állapotváltásról
--   3. tartalmi ujjlenyomat (SHA-256), hogy a jóváhagyott szöveg igazolható legyen
--   4. zárolás: jóváhagyott szabályzat tartalma nem írható felül
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

-- ---------------------------------------------------------------------------
-- 1. Állapotok és jóváhagyási mezők
-- ---------------------------------------------------------------------------

alter table public.aic_generated_policies
  drop constraint if exists aic_generated_policies_status_check;

alter table public.aic_generated_policies
  add constraint aic_generated_policies_status_check
  check (status = any (array['draft', 'in_review', 'approved', 'rejected', 'published', 'archived']));

alter table public.aic_generated_policies
  add column if not exists submitted_by uuid references auth.users(id) on delete set null,
  add column if not exists submitted_at timestamptz,
  add column if not exists reviewed_by uuid references auth.users(id) on delete set null,
  add column if not exists reviewed_at timestamptz,
  add column if not exists review_note text,
  add column if not exists content_sha256 text;

comment on column public.aic_generated_policies.content_sha256 is
  'A dokumentum tartalmi ujjlenyomata. A jóváhagyott verzió igazolására szolgál.';

create index if not exists aic_generated_policies_status_idx
  on public.aic_generated_policies (organisation_id, status);

-- ---------------------------------------------------------------------------
-- 2. Jóváhagyási napló
-- ---------------------------------------------------------------------------

create table if not exists public.aic_policy_approvals (
  id uuid primary key default gen_random_uuid(),
  policy_id uuid not null references public.aic_generated_policies(id) on delete cascade,
  organisation_id uuid not null references public.aic_organisations(id) on delete cascade,
  action text not null check (action = any (array['submitted', 'approved', 'rejected', 'reopened'])),
  from_status text not null,
  to_status text not null,
  note text,
  content_sha256 text,
  acted_by uuid not null references auth.users(id) on delete restrict,
  acted_at timestamptz not null default now()
);

create index if not exists aic_policy_approvals_policy_idx
  on public.aic_policy_approvals (policy_id, acted_at desc);

alter table public.aic_policy_approvals enable row level security;

drop policy if exists policy_approvals_select on public.aic_policy_approvals;
create policy policy_approvals_select on public.aic_policy_approvals
  for select to authenticated
  using (
    exists (
      select 1 from public.aic_organisation_members m
      where m.organisation_id = aic_policy_approvals.organisation_id
        and m.user_id = (select auth.uid())
    )
  );

-- A naplóba kizárólag az alábbi függvények írnak, közvetlen beszúrás nincs.
drop policy if exists policy_approvals_insert on public.aic_policy_approvals;

-- ---------------------------------------------------------------------------
-- 3. Tartalmi ujjlenyomat
-- ---------------------------------------------------------------------------

create or replace function public.aic_policy_content_hash(
  p_title text, p_summary text, p_sections jsonb
) returns text
language sql
immutable
set search_path = public, pg_temp
as $function$
  select encode(
    sha256(
      convert_to(
        coalesce(p_title, '') || '|' || coalesce(p_summary, '') || '|' ||
        coalesce(p_sections::text, '[]'),
        'UTF8'
      )
    ),
    'hex'
  );
$function$;

create or replace function public.aic_set_policy_content_hash()
returns trigger
language plpgsql
set search_path = public, pg_temp
as $function$
begin
  new.content_sha256 := public.aic_policy_content_hash(
    new.title, new.executive_summary, new.document_sections
  );
  return new;
end;
$function$;

drop trigger if exists aic_generated_policies_content_hash on public.aic_generated_policies;
create trigger aic_generated_policies_content_hash
  before insert or update of title, executive_summary, document_sections
  on public.aic_generated_policies
  for each row execute function public.aic_set_policy_content_hash();

-- A meglévő szabályzatok ujjlenyomatának pótlása.
update public.aic_generated_policies
   set content_sha256 = public.aic_policy_content_hash(title, executive_summary, document_sections)
 where content_sha256 is null;

-- ---------------------------------------------------------------------------
-- 4. Jóváhagyott dokumentum zárolása
-- ---------------------------------------------------------------------------

create or replace function public.aic_protect_approved_policy()
returns trigger
language plpgsql
set search_path = public, pg_temp
as $function$
begin
  if old.status <> 'approved' then
    return new;
  end if;

  -- Jóváhagyott dokumentum tartalma nem módosítható. Csak archiválni lehet.
  if new.title is distinct from old.title
     or new.executive_summary is distinct from old.executive_summary
     or new.document_sections is distinct from old.document_sections
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

drop trigger if exists aic_generated_policies_approved_guard on public.aic_generated_policies;
create trigger aic_generated_policies_approved_guard
  before update on public.aic_generated_policies
  for each row execute function public.aic_protect_approved_policy();

-- ---------------------------------------------------------------------------
-- 5. Állapotváltó függvények
-- ---------------------------------------------------------------------------

-- Közös jogosultság-ellenőrzés. A jóváhagyáshoz szigorúbb szerepkör kell,
-- mint a beküldéshez: szerkesztő beküldhet, de nem hagyhat jóvá.
create or replace function public.aic_assert_policy_permission(
  p_policy_id uuid, p_roles text[]
) returns public.aic_generated_policies
language plpgsql
stable
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
begin
  if auth.uid() is null then
    raise exception 'A művelethez bejelentkezés szükséges.';
  end if;

  select * into v_policy
  from public.aic_generated_policies
  where id = p_policy_id;

  if not found then
    raise exception 'A szabályzat nem található.';
  end if;

  if not exists (
    select 1 from public.aic_organisation_members m
    where m.organisation_id = v_policy.organisation_id
      and m.user_id = auth.uid()
      and m.member_role = any (p_roles)
  ) then
    raise exception 'Nincs jogosultságod ehhez a művelethez.';
  end if;

  return v_policy;
end;
$function$;

-- Beküldés felülvizsgálatra.
create or replace function public.aic_submit_policy_for_review(
  p_policy_id uuid, p_note text default null
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
begin
  v_policy := public.aic_assert_policy_permission(
    p_policy_id, array['owner', 'admin', 'compliance', 'editor']
  );

  if v_policy.status not in ('draft', 'rejected') then
    raise exception 'Csak piszkozat vagy elutasított szabályzat küldhető felülvizsgálatra. Jelenlegi állapot: %.', v_policy.status;
  end if;

  update public.aic_generated_policies
     set status = 'in_review',
         submitted_by = auth.uid(),
         submitted_at = now(),
         reviewed_by = null,
         reviewed_at = null,
         review_note = null,
         updated_by = auth.uid()
   where id = p_policy_id;

  insert into public.aic_policy_approvals
    (policy_id, organisation_id, action, from_status, to_status, note, content_sha256, acted_by)
  values
    (p_policy_id, v_policy.organisation_id, 'submitted', v_policy.status, 'in_review',
     nullif(btrim(p_note), ''), v_policy.content_sha256, auth.uid());

  return jsonb_build_object('policy_id', p_policy_id, 'status', 'in_review');
end;
$function$;

-- Jóváhagyás. Ezt végzi a szakember.
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

  -- A jóváhagyás arra a tartalomra vonatkozik, amit a szakember látott.
  v_current_hash := public.aic_policy_content_hash(
    v_policy.title, v_policy.executive_summary, v_policy.document_sections
  );

  if v_policy.content_sha256 is distinct from v_current_hash then
    raise exception 'A dokumentum tartalma megváltozott a beküldés óta. Küldd be újra felülvizsgálatra.';
  end if;

  update public.aic_generated_policies
     set status = 'approved',
         reviewed_by = auth.uid(),
         reviewed_at = now(),
         review_note = nullif(btrim(p_note), ''),
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

-- Elutasítás. Az indoklás kötelező, enélkül a beküldő nem tudja, mit javítson.
create or replace function public.aic_reject_policy(
  p_policy_id uuid, p_note text
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

  update public.aic_generated_policies
     set status = 'rejected',
         reviewed_by = auth.uid(),
         reviewed_at = now(),
         review_note = btrim(p_note),
         updated_by = auth.uid()
   where id = p_policy_id;

  insert into public.aic_policy_approvals
    (policy_id, organisation_id, action, from_status, to_status, note, content_sha256, acted_by)
  values
    (p_policy_id, v_policy.organisation_id, 'rejected', v_policy.status, 'rejected',
     btrim(p_note), v_policy.content_sha256, auth.uid());

  return jsonb_build_object('policy_id', p_policy_id, 'status', 'rejected');
end;
$function$;

-- ---------------------------------------------------------------------------
-- 6. Jogosultságok
-- ---------------------------------------------------------------------------

revoke all on function public.aic_policy_content_hash(text, text, jsonb) from public, anon;
revoke all on function public.aic_assert_policy_permission(uuid, text[]) from public, anon;
revoke all on function public.aic_submit_policy_for_review(uuid, text) from public, anon;
revoke all on function public.aic_approve_policy(uuid, text) from public, anon;
revoke all on function public.aic_reject_policy(uuid, text) from public, anon;

grant execute on function public.aic_policy_content_hash(text, text, jsonb) to authenticated;
grant execute on function public.aic_assert_policy_permission(uuid, text[]) to authenticated;
grant execute on function public.aic_submit_policy_for_review(uuid, text) to authenticated;
grant execute on function public.aic_approve_policy(uuid, text) to authenticated;
grant execute on function public.aic_reject_policy(uuid, text) to authenticated;

commit;
