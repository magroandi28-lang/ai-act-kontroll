-- EnergiaAI Kontroll – jogi jogosultság szigorítása és a felülvizsgálat rangsorolása.
--
-- 1. JOGOSULTSÁG
--    Jogi tartalomhoz csak a megfelelőségi felelős (compliance) és a tulajdonos
--    (owner) nyúlhat. Az adminisztrátor nem: ő technikai szerepkör.
--    A tulajdonos vészhelyzeti tartalék; a napló megőrzi, ki döntött.
--
-- 2. RANGSOR
--    Az átnézendő fejezetek nem egyformák. Ez a nézet előre veszi azokat,
--    ahol a legvalószínűbb a hiba, hogy a jogász ne egyforma tételek
--    tömegével nézzen szembe.
--
--    Mért jelzések az 55 használt modulon:
--      7  fejezet jogforrás nélkül, mégis "kötelező jogi követelmény"
--      24 fejezet 200 karakternél rövidebb szöveggel
--      8  fejezet teendő nélkül
--      48 fejezet szakértői felülvizsgálatra jelölve
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

-- ===========================================================================
-- 1. Jogi tartalom: csak compliance és owner
-- ===========================================================================

create or replace function public.aic_assert_policy_editable(p_policy_id uuid)
returns public.aic_generated_policies
language plpgsql
stable
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
begin
  -- Jogi tartalmat csak a megfelelőségi felelős és a tulajdonos szerkeszthet.
  v_policy := public.aic_assert_policy_permission(p_policy_id, array['compliance', 'owner']);

  if v_policy.status = 'approved' then
    raise exception 'A jóváhagyott szabályzat nem szerkeszthető. Készíts új verziót.';
  end if;
  if v_policy.status = 'archived' then
    raise exception 'Az archivált szabályzat nem szerkeszthető.';
  end if;

  return v_policy;
end;
$function$;

create or replace function public.aic_approve_policy(
  p_policy_id uuid, p_note text default null
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
  v_current_hash text;
  v_role text;
begin
  v_policy := public.aic_assert_policy_permission(p_policy_id, array['compliance', 'owner']);

  if v_policy.status <> 'in_review' then
    raise exception 'Csak felülvizsgálat alatt álló szabályzat hagyható jóvá. Jelenlegi állapot: %.', v_policy.status;
  end if;

  v_current_hash := public.aic_policy_content_hash(
    v_policy.title, v_policy.executive_summary,
    coalesce(v_policy.edited_sections, v_policy.document_sections)
  );

  if v_policy.content_sha256 is distinct from v_current_hash then
    raise exception 'A dokumentum tartalma megváltozott a beküldés óta. Küldd be újra felülvizsgálatra.';
  end if;

  -- A naplóban megőrizzük, hogy megfelelőségi felelős vagy tulajdonos döntött-e.
  select m.member_role into v_role
  from public.aic_organisation_members m
  where m.organisation_id = v_policy.organisation_id and m.user_id = auth.uid()
  limit 1;

  update public.aic_generated_policies
     set status = 'approved', reviewed_by = auth.uid(), reviewed_at = now(),
         review_note = nullif(btrim(p_note), ''), review_reason_type = null,
         updated_by = auth.uid()
   where id = p_policy_id;

  insert into public.aic_policy_approvals
    (policy_id, organisation_id, action, from_status, to_status, note, content_sha256, acted_by)
  values
    (p_policy_id, v_policy.organisation_id, 'approved', v_policy.status, 'approved',
     coalesce(nullif(btrim(p_note), '') || ' ', '') || '[' || coalesce(v_role, 'ismeretlen') || ']',
     v_current_hash, auth.uid());

  return jsonb_build_object(
    'policy_id', p_policy_id, 'status', 'approved',
    'approved_by_role', v_role, 'content_sha256', v_current_hash
  );
end;
$function$;

create or replace function public.aic_reject_policy(
  p_policy_id uuid, p_note text, p_reason_type text default 'system_data'
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
begin
  v_policy := public.aic_assert_policy_permission(p_policy_id, array['compliance', 'owner']);

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
     set status = 'rejected', reviewed_by = auth.uid(), reviewed_at = now(),
         review_note = btrim(p_note), review_reason_type = p_reason_type,
         updated_by = auth.uid()
   where id = p_policy_id;

  insert into public.aic_policy_approvals
    (policy_id, organisation_id, action, from_status, to_status, note, content_sha256, acted_by)
  values
    (p_policy_id, v_policy.organisation_id, 'rejected', v_policy.status, 'rejected',
     btrim(p_note), v_policy.content_sha256, auth.uid());

  return jsonb_build_object('policy_id', p_policy_id, 'status', 'rejected', 'reason_type', p_reason_type);
end;
$function$;

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

  if not exists (
    select 1 from public.aic_organisation_members m
    where m.user_id = auth.uid() and m.member_role in ('compliance', 'owner')
  ) then
    raise exception 'Szabályt csak megfelelőségi felelős vagy tulajdonos hagyhat jóvá.';
  end if;

  select id into v_rule_id from public.aic_compliance_rules where rule_code = p_rule_code;
  if not found then
    raise exception 'A(z) "%" szabály nem található.', p_rule_code;
  end if;

  update public.aic_compliance_rules
     set lifecycle_status = 'approved', approved_by = auth.uid(), approved_at = now(),
         requires_human_review = false,
         legal_interpretation_note = coalesce(nullif(btrim(p_note), ''), legal_interpretation_note),
         updated_at = now()
   where id = v_rule_id;

  update public.aic_policy_modules
     set lifecycle_status = 'approved', version = version + 1, updated_at = now()
   where rule_id = v_rule_id;

  get diagnostics v_modules = row_count;
  return jsonb_build_object('rule_code', p_rule_code, 'approved_modules', v_modules);
end;
$function$;

-- ===========================================================================
-- 2. Felülvizsgálati rangsor
--
-- A pontszám nem jogi ítélet, csak figyelemterelés: hol a legvalószínűbb,
-- hogy a fejezet hiányos vagy pontatlan.
-- ===========================================================================

create or replace view public.aic_review_priority as
select
  m.module_code,
  m.title,
  m.module_kind,
  m.lifecycle_status,
  r.rule_code,
  coalesce(r.requires_human_review, false) as szakertoi_jelolessel,
  (m.rule_id is null) as nincs_szabaly,
  not exists (select 1 from public.aic_rule_legal_bases lb where lb.rule_id = m.rule_id) as nincs_jogforras,
  not exists (select 1 from public.aic_required_actions a where a.rule_id = m.rule_id) as nincs_teendo,
  length(m.full_text_template) as szoveg_hossz,
  (select count(distinct g.ai_system_id)
     from public.aic_generated_policies g, jsonb_array_elements(g.document_sections) e
    where e->>'title' = m.title) as hany_szabalyzatban,

  -- Súlyozott figyelmeztetési pontszám.
  (case when m.module_kind = 'legal_requirement'
          and not exists (select 1 from public.aic_rule_legal_bases lb where lb.rule_id = m.rule_id)
        then 40 else 0 end)
  + (case when length(m.full_text_template) < 200 then 20 else 0 end)
  + (case when not exists (select 1 from public.aic_required_actions a where a.rule_id = m.rule_id)
          then 15 else 0 end)
  + (case when coalesce(r.requires_human_review, false) then 10 else 0 end)
  + (case when m.rule_id is null then 5 else 0 end)
    as figyelmeztetes_pont,

  case
    when m.module_kind = 'legal_requirement'
     and not exists (select 1 from public.aic_rule_legal_bases lb where lb.rule_id = m.rule_id)
      then 'Kötelező jogi követelményként jelenik meg, de nincs mögötte jogforrás-hivatkozás.'
    when length(m.full_text_template) < 200
      then 'A fejezet szövege szokatlanul rövid, könnyen hiányos lehet.'
    when not exists (select 1 from public.aic_required_actions a where a.rule_id = m.rule_id)
      then 'Nincs hozzá konkrét teendő, így a vezető nem tudja, mit kell tennie.'
    when coalesce(r.requires_human_review, false)
      then 'A katalógus készítője szakértői felülvizsgálatra jelölte.'
    else 'Nincs kiemelt jelzés.'
  end as fo_jelzes

from public.aic_policy_modules m
left join public.aic_compliance_rules r on r.id = m.rule_id
where m.lifecycle_status in ('approved', 'under_review')
order by 12 desc, m.title;

comment on view public.aic_review_priority is
  'A szabályzati fejezetek felülvizsgálati rangsora. A pontszám nem jogi ítélet, csak azt jelzi, hol érdemes elsőként megnézni.';

grant select on public.aic_review_priority to authenticated;

commit;
