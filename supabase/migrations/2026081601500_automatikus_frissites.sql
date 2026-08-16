-- EnergiaAI Kontroll – automatikus jogszabályfrissítés adatbázis-oldala.
--
-- MIT AD HOZZÁ
--   1. A jogforrás sorában megadható, honnan frissüljön magától.
--   2. Kötegelt betöltő: egy hívással több száz szövegrészlet, hogy a
--      Vercel időkorlátjába beleférjen (1750 részlet egyenként nem menne).
--   3. Futásnapló: mikor futott, mi változott, hiba volt-e.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Előfeltétel: 20260816_jogszabalyszoveg_kulon_tabla.sql

begin;

-- ===========================================================================
-- 1. Honnan frissüljön a jogforrás
-- ===========================================================================

alter table public.aic_legal_sources
  add column if not exists auto_update_url text,
  add column if not exists auto_update_enabled boolean not null default false,
  add column if not exists auto_update_parser text not null default 'eurlex',
  add column if not exists last_auto_update_at timestamptz;

alter table public.aic_legal_sources
  drop constraint if exists aic_legal_sources_parser_check;

alter table public.aic_legal_sources
  add constraint aic_legal_sources_parser_check
  check (auto_update_parser in ('eurlex', 'njt'));

comment on column public.aic_legal_sources.auto_update_url is
  'Ahonnan az ütemezett frissítés letölti a hatályos szöveget. Magyar nyelvű változatra mutasson.';
comment on column public.aic_legal_sources.auto_update_parser is
  'Melyik feldolgozó kezeli: eurlex (uniós jogszabályok) vagy njt (Nemzeti Jogszabálytár).';

-- A két uniós jogforrás magyar szövegének címe.
update public.aic_legal_sources
   set auto_update_url = 'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun',
       auto_update_enabled = true,
       auto_update_parser = 'eurlex'
 where celex_number = '02024R1689-20260727';

update public.aic_legal_sources
   set auto_update_url = 'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun',
       auto_update_enabled = true,
       auto_update_parser = 'eurlex'
 where celex_number = '32016R0679';

-- ===========================================================================
-- 2. Futásnapló
-- ===========================================================================

create table if not exists public.aic_legal_update_runs (
  id uuid primary key default gen_random_uuid(),
  source_id uuid references public.aic_legal_sources(id) on delete set null,
  source_title text,
  started_at timestamptz not null default now(),
  finished_at timestamptz,
  status text not null default 'running' check (status in ('running', 'success', 'error', 'skipped')),
  fetched_bytes integer,
  parsed_items integer,
  changed_items integer,
  affected_rules integer,
  error_message text
);

create index if not exists aic_legal_update_runs_idx
  on public.aic_legal_update_runs (started_at desc);

alter table public.aic_legal_update_runs enable row level security;

drop policy if exists legal_update_runs_select on public.aic_legal_update_runs;
create policy legal_update_runs_select on public.aic_legal_update_runs
  for select to authenticated using (true);

-- ===========================================================================
-- 3. Kötegelt betöltő
--
-- A bemenet egy tömb: [{"article":"26","paragraph":"6","content":"…"}, …]
-- Egy hívással több száz részlet feldolgozható.
-- ===========================================================================

create or replace function public.aic_upsert_legal_text_batch(
  p_celex text,
  p_items jsonb,
  p_source_url text default null
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_item jsonb;
  v_eredmeny jsonb;
  v_feldolgozott integer := 0;
  v_valtozott integer := 0;
  v_erintett integer := 0;
begin
  if jsonb_typeof(p_items) <> 'array' then
    raise exception 'A betöltendő tételek formátuma hibás.';
  end if;

  for v_item in select value from jsonb_array_elements(p_items) loop
    v_eredmeny := public.aic_upsert_legal_text(
      p_celex,
      v_item->>'article',
      nullif(v_item->>'paragraph', ''),
      v_item->>'content',
      coalesce(v_item->>'source_url', p_source_url),
      v_item->>'deep_link'
    );
    v_feldolgozott := v_feldolgozott + 1;
    if (v_eredmeny->>'changed')::boolean then
      v_valtozott := v_valtozott + 1;
      v_erintett := v_erintett + coalesce((v_eredmeny->>'affected_rules')::integer, 0);
    end if;
  end loop;

  return jsonb_build_object(
    'processed', v_feldolgozott,
    'changed', v_valtozott,
    'affected_rules', v_erintett
  );
end;
$function$;

-- ===========================================================================
-- 4. Nyitott jogszabályváltozások – ez kerül a főoldali riasztásba
-- ===========================================================================

create or replace view public.aic_nyitott_jogszabalyvaltozasok as
select
  c.id,
  c.source_title,
  c.article_number,
  c.detected_at,
  c.affected_module_count,
  left(c.new_text, 300) as uj_szoveg_eleje,
  (select count(*) from public.aic_compliance_rules r
    where r.requires_human_review and r.updated_at >= c.detected_at) as felulvizsgalando_szabaly
from public.aic_legal_text_changes c
where c.reviewed_at is null
order by c.detected_at desc;

grant select on public.aic_nyitott_jogszabalyvaltozasok to authenticated;

revoke all on function public.aic_upsert_legal_text_batch(text, jsonb, text) from public, anon;
grant execute on function public.aic_upsert_legal_text_batch(text, jsonb, text) to authenticated;

commit;
