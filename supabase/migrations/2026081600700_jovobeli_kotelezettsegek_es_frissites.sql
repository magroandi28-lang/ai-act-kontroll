-- EnergiaAI Kontroll – jövőbeli kötelezettségek és automatikus frissítés.
--
-- A HELYZET
-- A 2026/1744 rendelet (AI Digital Omnibus, hatályos 2026. július 27-től)
-- elhalasztotta a III. mellékletes magas kockázatú kötelezettségeket
-- 2027. december 2-ára, az I. mellékletes termékekbe épített MI-t pedig
-- 2028. augusztus 2-ára.
--
-- A katalógusban ezért 41 modul jövőbeli hatálybalépéssel szerepel:
--     2026-12-02:  1 modul
--     2027-12-02: 38 modul
--     2028-08-02:  2 modul
--
-- A generátor ezeket helyesen kihagyja, mert még nem hatályosak. Csakhogy a
-- dokumentum így elhallgatja, hogy a cégre 2027 végén 38 új kötelezettség vár.
-- Egy vezető abból, amit ma lát, azt hiszi, készen van.
--
-- MIT VEZET BE
--   1. "Jövőbeli kötelezettségek" a szabályzatban, dátum szerint csoportosítva
--   2. Elavulás-figyelés: mely szabályzatok szorulnak újragenerálásra
--   3. Előkészítés az automatikus frissítéshez
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

alter table public.aic_generated_policies
  add column if not exists upcoming_obligations jsonb;

comment on column public.aic_generated_policies.upcoming_obligations is
  'Még nem hatályos, de a rendszerre később alkalmazandó követelmények, hatálybalépés szerint csoportosítva.';

-- ===========================================================================
-- 1. A rendszer tényprofilja, kivétel nélkül
--
-- Az aic_require_valid_usage_profile hibát dob, ha valami hiányzik. A
-- figyelőnézetekhez olyan változat kell, ami egyszerűen null-t ad vissza.
-- ===========================================================================

create or replace function public.aic_system_profile(p_ai_system_id uuid)
returns jsonb
language sql
stable
set search_path = public, pg_temp
as $function$
  select coalesce(f.facts, '{}'::jsonb)
       || jsonb_build_object(
            'system_type_code', t.type_code,
            'industry', coalesce(s.industry_code, o.industry, 'unknown'),
            'organisation_role', coalesce(s.organisation_role, 'unknown'),
            'lifecycle_stage', s.lifecycle_stage
          )
  from public.aic_ai_systems s
  join public.aic_organisations o on o.id = s.organisation_id
  join public.aic_system_type_templates t on t.id = s.system_type_id
  left join public.aic_system_facts f on f.system_id = s.id
  where s.id = p_ai_system_id and s.inventory_status = 'active';
$function$;

-- ===========================================================================
-- 2. Jövőbeli kötelezettségek
-- ===========================================================================

create or replace function public.aic_upcoming_obligations(p_ai_system_id uuid)
returns jsonb
language sql
stable
set search_path = public, pg_temp
as $function$
  with profil as (select public.aic_system_profile(p_ai_system_id) as v),
  jovobeli as (
    select
      m.valid_from,
      m.module_code,
      m.title,
      m.module_kind,
      m.summary_text,
      coalesce((
        select string_agg(distinct
          coalesce(src.title, '') ||
          case when p.article_number is null then '' else ' ' || p.article_number || '. cikk' end,
          '; ')
        from public.aic_rule_legal_bases lb
        join public.aic_legal_provisions p on p.id = lb.provision_id
        join public.aic_legal_sources src on src.id = p.source_id
        where lb.rule_id = m.rule_id
      ), '') as legal_reference_label
    from public.aic_policy_modules m, profil
    where m.lifecycle_status in ('approved', 'under_review')
      and m.valid_from is not null
      and m.valid_from > current_date
      and (m.valid_to is null or m.valid_to >= m.valid_from)
      and public.aic_applicability_matches(m.applicability, profil.v)
  )
  select coalesce(
    jsonb_agg(csoport order by csoport->>'effective_from'),
    '[]'::jsonb
  )
  from (
    select jsonb_build_object(
      'effective_from', valid_from,
      'module_count', count(*),
      'modules', jsonb_agg(
        jsonb_build_object(
          'module_code', module_code,
          'title', title,
          'module_kind', module_kind,
          'summary', summary_text,
          'legal_reference', legal_reference_label
        ) order by title
      )
    ) as csoport
    from jovobeli
    group by valid_from
  ) t;
$function$;

-- A meglévő szabályzatok is megkapják a jövőbeli listát, újragenerálás nélkül.
update public.aic_generated_policies gp
   set upcoming_obligations = public.aic_upcoming_obligations(gp.ai_system_id)
 where gp.status <> 'approved';

-- ===========================================================================
-- 3. A generátor kiszámolja a jövőbeli kötelezettségeket is
-- ===========================================================================

create or replace function public.aic_generate_policy_upcoming_patch()
returns trigger
language plpgsql
set search_path = public, pg_temp
as $function$
begin
  if new.upcoming_obligations is null then
    new.upcoming_obligations := public.aic_upcoming_obligations(new.ai_system_id);
  end if;
  return new;
end;
$function$;

drop trigger if exists aic_generated_policies_upcoming on public.aic_generated_policies;
create trigger aic_generated_policies_upcoming
  before insert on public.aic_generated_policies
  for each row execute function public.aic_generate_policy_upcoming_patch();

-- ===========================================================================
-- 4. Elavulás-figyelés
--
-- Egy szabályzat elavul, ha a rá alkalmazandó modulok halmaza megváltozott:
-- hatályba lépett egy új szabály, módosult egy modul, vagy változtak a
-- rendszer tényei. Ez a nézet mondja meg, melyiket kell újragenerálni.
-- ===========================================================================

create or replace view public.aic_policies_needing_refresh as
with legfrissebb as (
  select distinct on (gp.ai_system_id)
    gp.id, gp.ai_system_id, gp.organisation_id, gp.version, gp.status,
    gp.updated_at, gp.source_snapshot
  from public.aic_generated_policies gp
  order by gp.ai_system_id, gp.version desc
),
jelenlegi as (
  select
    l.id as policy_id,
    coalesce((
      select jsonb_agg(m.module_code order by m.module_code)
      from public.aic_policy_modules m
      where m.lifecycle_status in ('approved', 'under_review')
        and (m.valid_from is null or m.valid_from <= current_date)
        and (m.valid_to is null or m.valid_to >= current_date)
        and public.aic_applicability_matches(m.applicability, public.aic_system_profile(l.ai_system_id))
    ), '[]'::jsonb) as most_alkalmazando,
    coalesce((
      select jsonb_agg(elem->>'module_code' order by elem->>'module_code')
      from jsonb_array_elements(l.source_snapshot->'modules') elem
    ), '[]'::jsonb) as dokumentumban
  from legfrissebb l
)
select
  l.ai_system_id,
  s.name as rendszer_neve,
  l.organisation_id,
  l.id as policy_id,
  l.version as jelenlegi_verzio,
  l.status as allapot,
  l.updated_at as utolso_frissites,
  j.most_alkalmazando,
  j.dokumentumban,
  jsonb_array_length(j.most_alkalmazando) as most_modul,
  jsonb_array_length(j.dokumentumban) as dokumentum_modul
from legfrissebb l
join jelenlegi j on j.policy_id = l.id
join public.aic_ai_systems s on s.id = l.ai_system_id
where j.most_alkalmazando is distinct from j.dokumentumban
  and s.inventory_status = 'active';

comment on view public.aic_policies_needing_refresh is
  'Azok a szabályzatok, amelyekre már más szabályhalmaz vonatkozik, mint amiből készültek. Ok lehet hatálybalépés, modulmódosítás vagy megváltozott rendszertény.';

grant select on public.aic_policies_needing_refresh to authenticated;

-- ===========================================================================
-- 5. Jogosultságok
-- ===========================================================================

revoke all on function public.aic_system_profile(uuid) from public, anon;
revoke all on function public.aic_upcoming_obligations(uuid) from public, anon;

grant execute on function public.aic_system_profile(uuid) to authenticated;
grant execute on function public.aic_upcoming_obligations(uuid) to authenticated;

commit;
