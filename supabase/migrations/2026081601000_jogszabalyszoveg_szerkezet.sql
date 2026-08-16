-- EnergiaAI Kontroll – a hivatalos jogszabályszöveg tárolása és változásfigyelése.
--
-- MIÉRT
-- A szabályzat fejezetei értelmezések, amelyek egy-egy cikkre hivatkoznak.
-- A hivatkozott cikk tényleges szövege eddig sehol nem szerepelt, ezért
--   - a jogász nem tudta gyorsan ellenőrizni, hogy az értelmezés fedi-e a normát,
--   - a rendszer nem tudta észrevenni, ha a jogszabály megváltozott.
--
-- MIT VEZET BE
--   1. A cikkek hivatalos szövegének tárolása ujjlenyomattal és letöltési dátummal
--   2. Cikkre mutató mélylink, hogy egy kattintás legyen az ellenőrzés
--   3. Változásfigyelés: ha egy cikk szövege módosul, minden rá hivatkozó
--      modul automatikusan felülvizsgálandóvá válik
--
-- A tárolt szöveg nem helyettesíti a hivatalos forrást, csak összehasonlítási
-- alap. Ezért tároljuk mellé a letöltés dátumát és a forrás címét is.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

-- ===========================================================================
-- 1. Új mezők a jogszabályhelyeken
-- ===========================================================================

alter table public.aic_legal_provisions
  add column if not exists provision_text_verbatim text,
  add column if not exists verbatim_sha256 text,
  add column if not exists verbatim_retrieved_at timestamptz,
  add column if not exists verbatim_source_url text,
  add column if not exists deep_link text;

comment on column public.aic_legal_provisions.provision_text_verbatim is
  'A cikk hivatalos szövege, ahogy a forrásban szerepel. Összehasonlítási alap, nem jogforrás.';
comment on column public.aic_legal_provisions.verbatim_sha256 is
  'A hivatalos szöveg ujjlenyomata. Változása jelzi, hogy a jogszabály módosult.';
comment on column public.aic_legal_provisions.deep_link is
  'Közvetlen hivatkozás az adott cikkre, hogy a felülvizsgáló ne a rendelet elejére jusson.';

create index if not exists aic_legal_provisions_verbatim_idx
  on public.aic_legal_provisions (source_id, article_number)
  where provision_text_verbatim is not null;

-- ===========================================================================
-- 2. A jogszabályszöveg változásainak naplója
-- ===========================================================================

create table if not exists public.aic_legal_text_changes (
  id uuid primary key default gen_random_uuid(),
  provision_id uuid not null references public.aic_legal_provisions(id) on delete cascade,
  source_title text not null,
  article_number text,
  previous_sha256 text,
  new_sha256 text not null,
  previous_text text,
  new_text text,
  detected_at timestamptz not null default now(),
  affected_module_count integer not null default 0,
  reviewed_at timestamptz,
  reviewed_by uuid references auth.users(id) on delete set null
);

create index if not exists aic_legal_text_changes_open_idx
  on public.aic_legal_text_changes (detected_at desc) where reviewed_at is null;

alter table public.aic_legal_text_changes enable row level security;

drop policy if exists legal_text_changes_select on public.aic_legal_text_changes;
create policy legal_text_changes_select on public.aic_legal_text_changes
  for select to authenticated using (true);

-- ===========================================================================
-- 3. Betöltő függvény
--
-- A szövegbetöltő szkript ezt hívja cikkenként. Ha a szöveg változott,
-- naplózza, és felülvizsgálandóvá teszi az érintett modulokat.
-- ===========================================================================

create or replace function public.aic_upsert_legal_text(
  p_celex text,
  p_article_number text,
  p_verbatim text,
  p_source_url text default null,
  p_deep_link text default null
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_provision record;
  v_new_hash text;
  v_affected integer := 0;
  v_updated integer := 0;
  v_changed integer := 0;
begin
  if nullif(btrim(p_verbatim), '') is null then
    raise exception 'Üres szöveggel nem tölthető be jogszabályhely.';
  end if;

  v_new_hash := encode(sha256(convert_to(btrim(p_verbatim), 'UTF8')), 'hex');

  for v_provision in
    select p.id, p.verbatim_sha256, p.provision_text_verbatim, p.article_number, s.title as source_title
    from public.aic_legal_provisions p
    join public.aic_legal_sources s on s.id = p.source_id
    where s.celex_number = p_celex
      and p.article_number = p_article_number
  loop
    v_updated := v_updated + 1;

    -- Csak akkor naplózunk, ha korábban már volt szöveg és az megváltozott.
    if v_provision.verbatim_sha256 is not null
       and v_provision.verbatim_sha256 <> v_new_hash then

      select count(*) into v_affected
      from public.aic_policy_modules m
      join public.aic_rule_legal_bases lb on lb.rule_id = m.rule_id
      where lb.provision_id = v_provision.id;

      insert into public.aic_legal_text_changes
        (provision_id, source_title, article_number, previous_sha256, new_sha256,
         previous_text, new_text, affected_module_count)
      values
        (v_provision.id, v_provision.source_title, v_provision.article_number,
         v_provision.verbatim_sha256, v_new_hash,
         v_provision.provision_text_verbatim, btrim(p_verbatim), v_affected);

      -- Az érintett modulok visszakerülnek felülvizsgálatra.
      update public.aic_compliance_rules r
         set requires_human_review = true,
             lifecycle_status = case when r.lifecycle_status = 'approved'
                                     then 'under_review' else r.lifecycle_status end,
             updated_at = now()
       where r.id in (
         select m.rule_id from public.aic_policy_modules m
         join public.aic_rule_legal_bases lb on lb.rule_id = m.rule_id
         where lb.provision_id = v_provision.id and m.rule_id is not null
       );

      v_changed := v_changed + 1;
    end if;

    update public.aic_legal_provisions
       set provision_text_verbatim = btrim(p_verbatim),
           verbatim_sha256 = v_new_hash,
           verbatim_retrieved_at = now(),
           verbatim_source_url = coalesce(p_source_url, verbatim_source_url),
           deep_link = coalesce(p_deep_link, deep_link)
     where id = v_provision.id;
  end loop;

  return jsonb_build_object(
    'celex', p_celex,
    'article', p_article_number,
    'updated_provisions', v_updated,
    'changed', v_changed,
    'affected_modules', v_affected
  );
end;
$function$;

-- ===========================================================================
-- 4. Lefedettség: mely jogszabályhelyekhez van már hivatalos szöveg
-- ===========================================================================

create or replace view public.aic_legal_text_coverage as
select
  s.title as jogforras,
  s.celex_number,
  count(*) as jogszabalyhely,
  count(*) filter (where p.provision_text_verbatim is not null) as van_hivatalos_szoveg,
  count(*) filter (where p.provision_text_verbatim is null) as hianyzik,
  count(*) filter (where p.deep_link is not null) as van_melylink,
  max(p.verbatim_retrieved_at) as utolso_betoltes
from public.aic_legal_sources s
left join public.aic_legal_provisions p on p.source_id = s.id
group by s.title, s.celex_number
order by count(*) desc;

grant select on public.aic_legal_text_coverage to authenticated;

revoke all on function public.aic_upsert_legal_text(text, text, text, text, text) from public, anon;
grant execute on function public.aic_upsert_legal_text(text, text, text, text, text) to authenticated;

commit;
