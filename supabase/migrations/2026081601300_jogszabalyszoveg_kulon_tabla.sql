-- EnergiaAI Kontroll – a jogszabályszöveg külön táblába kerül.
--
-- A PROBLÉMA
-- A hivatalos szöveget eddig a hivatkozás sorára tároltuk. Csakhogy a
-- katalógus hivatkozásai tartományokat használnak:
--
--     "5. cikk (1–2)"      "12–13. cikk (1–5; 1–2)"
--     "15–22. cikk"        "28, 32. cikk"
--
-- A betöltő viszont cikkenként és bekezdésenként dolgozik, ezért a 15 GDPR-
-- hivatkozásból csak 3 kapott szöveget. Ugyanez lesz minden új jogforrásnál.
--
-- Emellett ugyanaz a cikkszöveg 50 soron duplázódott.
--
-- A MEGOLDÁS
-- A jogszabályszöveg saját táblába kerül, a katalógustól függetlenül:
--   egy sor = egy cikk, bekezdés vagy alpont.
-- A hivatkozás pedig feloldja magát ehhez: a "15–22. cikk" megkapja a 15.,
-- 16., … 22. cikk szövegét.
--
-- Ez egyben megoldja a frissítést is: a betöltő újrafuttatásakor a rendszer
-- ujjlenyomat alapján észreveszi, ha egy cikk szövege megváltozott, naplózza,
-- és felülvizsgálandóvá teszi az érintett szabályokat.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Utána újra kell futtatni a betöltéseket (AI Act, GDPR).

begin;

-- ===========================================================================
-- 1. A jogszabályszöveg tábla
-- ===========================================================================

create table if not exists public.aic_legal_text (
  id uuid primary key default gen_random_uuid(),
  source_id uuid not null references public.aic_legal_sources(id) on delete cascade,
  article_number text not null,
  paragraph_number text,
  scope text not null check (scope in ('article', 'paragraph', 'point')),
  content text not null,
  content_sha256 text not null,
  deep_link text,
  source_url text,
  retrieved_at timestamptz not null default now(),
  constraint aic_legal_text_unique
    unique (source_id, article_number, paragraph_number)
);

create index if not exists aic_legal_text_lookup_idx
  on public.aic_legal_text (source_id, article_number);

alter table public.aic_legal_text enable row level security;

drop policy if exists legal_text_select on public.aic_legal_text;
create policy legal_text_select on public.aic_legal_text
  for select to authenticated using (true);

comment on table public.aic_legal_text is
  'A jogszabályok hivatalos szövege cikk, bekezdés és alpont bontásban. Független a szabálykatalógus hivatkozásaitól.';

-- ===========================================================================
-- 2. Hivatkozás feloldása
--
-- A katalógus hivatkozásai emberi alakúak: "15–22", "28, 32", "1–5; 1–2".
-- Ezek feloldása adja meg, mely cikkek szövege tartozik hozzájuk.
-- ===========================================================================

create or replace function public.aic_cikkszamok(p_hivatkozas text)
returns text[]
language plpgsql
immutable
set search_path = public, pg_temp
as $function$
declare
  v_eredmeny text[] := '{}';
  v_darab text;
  v_tol integer;
  v_ig integer;
begin
  if p_hivatkozas is null or btrim(p_hivatkozas) = '' then
    return '{}';
  end if;

  -- Vesszo es pontosvesszo menten bontunk: "28, 32" vagy "12; 13".
  foreach v_darab in array regexp_split_to_array(p_hivatkozas, '\s*[,;]\s*') loop
    v_darab := btrim(v_darab);

    -- Tartomany: "15–22" (nagykotojel) vagy "15-22" (kiskotojel).
    if v_darab ~ '^\d+\s*[–—-]\s*\d+$' then
      v_tol := (regexp_match(v_darab, '^(\d+)'))[1]::integer;
      v_ig  := (regexp_match(v_darab, '(\d+)$'))[1]::integer;
      -- Ertelmetlen vagy tul nagy tartomanyt nem bontunk fel.
      if v_ig >= v_tol and v_ig - v_tol <= 60 then
        v_eredmeny := v_eredmeny
          || (select array_agg(i::text) from generate_series(v_tol, v_ig) i);
      end if;
    elsif v_darab ~ '^\d+' then
      v_eredmeny := v_eredmeny || (regexp_match(v_darab, '^(\d+)'))[1];
    end if;
  end loop;

  return (select coalesce(array_agg(distinct x order by x::integer), '{}'::text[])
          from unnest(v_eredmeny) x);
end;
$function$;

-- A hivatkozashoz tartozo hivatalos szoveg osszefuzve.
create or replace function public.aic_hivatkozas_szovege(p_provision_id uuid)
returns table (szoveg text, reszletesseg text, talalat integer, melylink text)
language sql
stable
set search_path = public, pg_temp
as $function$
  with hivatkozas as (
    select p.source_id, p.article_number, p.paragraph_number
    from public.aic_legal_provisions p where p.id = p_provision_id
  ),
  cikkek as (
    select unnest(public.aic_cikkszamok(h.article_number)) as cikk, h.source_id, h.paragraph_number
    from hivatkozas h
  ),
  -- Ha a bekezdes egyetlen szam vagy alpont, pontosan arra szukitunk.
  -- Tartomanynal vagy ures ertekenel a teljes cikk szovege jon.
  talalatok as (
    select t.content, t.scope, t.deep_link,
           row_number() over (order by c.cikk::integer, t.paragraph_number nulls first) as sorszam
    from cikkek c
    join public.aic_legal_text t
      on t.source_id = c.source_id
     and t.article_number = c.cikk
     and (
       case
         when c.paragraph_number ~ '^\d+$' then t.paragraph_number = c.paragraph_number
         when c.paragraph_number ~ '^\d+\([a-z]\)$' then t.paragraph_number = c.paragraph_number
         else t.paragraph_number is null
       end
     )
  )
  select
    string_agg(content, E'\n\n' order by sorszam),
    case
      when count(*) = 0 then 'nincs'
      when bool_and(scope in ('paragraph', 'point')) then 'pontos'
      when bool_or(scope in ('paragraph', 'point')) then 'vegyes'
      else 'cikkszintu'
    end,
    count(*)::integer,
    min(deep_link)
  from talalatok;
$function$;

-- ===========================================================================
-- 3. Betöltő az új táblába, változásfigyeléssel
-- ===========================================================================

create or replace function public.aic_upsert_legal_text(
  p_celex text,
  p_article_number text,
  p_paragraph_number text,
  p_verbatim text,
  p_source_url text default null,
  p_deep_link text default null
) returns jsonb
language plpgsql
set search_path = public, pg_temp
as $function$
declare
  v_source_id uuid;
  v_source_title text;
  v_scope text;
  v_new_hash text;
  v_regi record;
  v_valtozott boolean := false;
  v_erintett integer := 0;
begin
  if nullif(btrim(p_verbatim), '') is null then
    raise exception 'Üres szöveggel nem tölthető be jogszabályhely.';
  end if;

  select id, title into v_source_id, v_source_title
  from public.aic_legal_sources where celex_number = p_celex;

  if not found then
    raise exception 'Ismeretlen jogforrás: %.', p_celex;
  end if;

  v_new_hash := encode(sha256(convert_to(btrim(p_verbatim), 'UTF8')), 'hex');
  v_scope := case
    when p_paragraph_number is null then 'article'
    when p_paragraph_number ~ '^\d+$' then 'paragraph'
    else 'point'
  end;

  select content_sha256, content into v_regi
  from public.aic_legal_text
  where source_id = v_source_id
    and article_number = p_article_number
    and paragraph_number is not distinct from p_paragraph_number;

  if found and v_regi.content_sha256 <> v_new_hash then
    v_valtozott := true;

    -- Mely szabalyok hivatkoznak erre a cikkre? A tartomanyos hivatkozasokat is
    -- figyelembe vesszuk, ezert a feloldason keresztul keresunk.
    select count(distinct r.id) into v_erintett
    from public.aic_compliance_rules r
    join public.aic_rule_legal_bases lb on lb.rule_id = r.id
    join public.aic_legal_provisions p on p.id = lb.provision_id
    where p.source_id = v_source_id
      and p_article_number = any (public.aic_cikkszamok(p.article_number));

    insert into public.aic_legal_text_changes
      (provision_id, source_title, article_number, previous_sha256, new_sha256,
       previous_text, new_text, affected_module_count)
    select p.id, v_source_title, p_article_number, v_regi.content_sha256, v_new_hash,
           v_regi.content, btrim(p_verbatim), v_erintett
    from public.aic_legal_provisions p
    where p.source_id = v_source_id
      and p_article_number = any (public.aic_cikkszamok(p.article_number))
    limit 1;

    update public.aic_compliance_rules r
       set requires_human_review = true,
           lifecycle_status = case when r.lifecycle_status = 'approved'
                                   then 'under_review' else r.lifecycle_status end,
           updated_at = now()
     where r.id in (
       select lb.rule_id from public.aic_rule_legal_bases lb
       join public.aic_legal_provisions p on p.id = lb.provision_id
       where p.source_id = v_source_id
         and p_article_number = any (public.aic_cikkszamok(p.article_number))
     );
  end if;

  insert into public.aic_legal_text
    (source_id, article_number, paragraph_number, scope, content,
     content_sha256, deep_link, source_url)
  values
    (v_source_id, p_article_number, p_paragraph_number, v_scope, btrim(p_verbatim),
     v_new_hash, p_deep_link, p_source_url)
  on conflict (source_id, article_number, paragraph_number) do update set
    scope = excluded.scope,
    content = excluded.content,
    content_sha256 = excluded.content_sha256,
    deep_link = coalesce(excluded.deep_link, public.aic_legal_text.deep_link),
    source_url = coalesce(excluded.source_url, public.aic_legal_text.source_url),
    retrieved_at = now();

  return jsonb_build_object(
    'celex', p_celex, 'article', p_article_number, 'paragraph', p_paragraph_number,
    'scope', v_scope, 'changed', v_valtozott, 'affected_rules', v_erintett
  );
end;
$function$;

-- ===========================================================================
-- 4. Az elemző a feloldón keresztül dolgozik
-- ===========================================================================

create or replace function public.aic_modul_elteres_elemzes(p_module_id uuid)
returns jsonb
language plpgsql
stable
set search_path = public, pg_temp
as $function$
declare
  v_modul record;
  v_jogszabaly text := '';
  v_helyek text := '';
  v_reszletesseg text := 'nincs';
  v_hivatkozas record;
  v_darab record;
  v_pontos integer := 0;
  v_osszes integer := 0;
  v_hianyzo_ido text[];
  v_hianyzo_cikk text[];
  v_hianyzo_mell text[];
  v_jelzesek jsonb := '[]'::jsonb;
  v_utoirat text;
begin
  select m.id, m.module_code, m.title, m.full_text_template, m.rule_id
    into v_modul
  from public.aic_policy_modules m where m.id = p_module_id;

  if not found then
    return jsonb_build_object('error', 'A modul nem található.');
  end if;

  for v_hivatkozas in
    select p.id, p.article_number, p.paragraph_number
    from public.aic_rule_legal_bases lb
    join public.aic_legal_provisions p on p.id = lb.provision_id
    where lb.rule_id = v_modul.rule_id
  loop
    select * into v_darab from public.aic_hivatkozas_szovege(v_hivatkozas.id);
    if v_darab.talalat > 0 then
      v_jogszabaly := v_jogszabaly || coalesce(v_darab.szoveg, '') || E'\n\n';
      v_helyek := v_helyek || case when v_helyek = '' then '' else ', ' end
        || v_hivatkozas.article_number
        || coalesce(' (' || v_hivatkozas.paragraph_number || ')', '');
      v_osszes := v_osszes + 1;
      if v_darab.reszletesseg = 'pontos' then
        v_pontos := v_pontos + 1;
      end if;
    end if;
  end loop;

  if btrim(v_jogszabaly) = '' then
    return jsonb_build_object(
      'module_code', v_modul.module_code, 'title', v_modul.title,
      'elemezheto', false,
      'ok', 'Nincs betöltve a hivatkozott jogszabályhely hivatalos szövege.'
    );
  end if;

  v_reszletesseg := case
    when v_pontos = v_osszes then 'pontos'
    when v_pontos = 0 then 'cikkszintu'
    else 'vegyes'
  end;

  v_utoirat := case v_reszletesseg
    when 'cikkszintu' then ' (cikkszintű becslés – a teljes cikkhez mérve, ezért téves is lehet)'
    when 'vegyes' then ' (részben cikkszintű becslés)'
    else ''
  end;

  select coalesce(array_agg(e order by e), '{}'::text[]) into v_hianyzo_ido
  from unnest(public.aic_kinyert_idotartamok(v_jogszabaly)) e
  where not (e = any (public.aic_kinyert_idotartamok(v_modul.full_text_template)));

  select coalesce(array_agg(c order by c), '{}'::text[]) into v_hianyzo_cikk
  from unnest(public.aic_kinyert_cikkhivatkozasok(v_jogszabaly)) c
  where not exists (
    select 1 from public.aic_policy_modules m2
    join public.aic_rule_legal_bases lb2 on lb2.rule_id = m2.rule_id
    join public.aic_legal_provisions p2 on p2.id = lb2.provision_id
    where c = any (public.aic_cikkszamok(p2.article_number))
      and m2.lifecycle_status in ('approved', 'under_review')
  );

  select coalesce(array_agg(x order by x), '{}'::text[]) into v_hianyzo_mell
  from unnest(public.aic_kinyert_mellekletek(v_jogszabaly)) x
  where not (x = any (public.aic_kinyert_mellekletek(v_modul.full_text_template)));

  if cardinality(v_hianyzo_ido) > 0 then
    v_jelzesek := v_jelzesek || jsonb_build_array(jsonb_build_object(
      'tipus', 'hianyzo_hatarido',
      'sulyossag', case when v_reszletesseg = 'pontos' then 'magas' else 'alacsony' end,
      'pontossag', v_reszletesseg,
      'uzenet', 'A jogszabály időtartamot ír elő, ami a fejezetben nem szerepel: '
                || array_to_string(v_hianyzo_ido, ', ') || '.' || v_utoirat,
      'ertekek', to_jsonb(v_hianyzo_ido)
    ));
  end if;

  if cardinality(v_hianyzo_cikk) > 0 then
    v_jelzesek := v_jelzesek || jsonb_build_array(jsonb_build_object(
      'tipus', 'lefedetlen_kereszthivatkozas',
      'sulyossag', case when v_reszletesseg = 'pontos' then 'kozepes' else 'alacsony' end,
      'pontossag', v_reszletesseg,
      'uzenet', 'A jogszabályhely más cikkre hivatkozik, ami a katalógusban nincs lefedve: '
                || array_to_string(v_hianyzo_cikk, '. cikk, ') || '. cikk.' || v_utoirat,
      'ertekek', to_jsonb(v_hianyzo_cikk)
    ));
  end if;

  if cardinality(v_hianyzo_mell) > 0 then
    v_jelzesek := v_jelzesek || jsonb_build_array(jsonb_build_object(
      'tipus', 'hianyzo_melleklet',
      'sulyossag', case when v_reszletesseg = 'pontos' then 'kozepes' else 'alacsony' end,
      'pontossag', v_reszletesseg,
      'uzenet', 'A jogszabályhely mellékletre hivatkozik, a fejezet nem: '
                || array_to_string(v_hianyzo_mell, ', ') || '.' || v_utoirat,
      'ertekek', to_jsonb(v_hianyzo_mell)
    ));
  end if;

  return jsonb_build_object(
    'module_code', v_modul.module_code, 'title', v_modul.title,
    'elemezheto', true, 'hivatkozott_helyek', v_helyek, 'pontossag', v_reszletesseg,
    'jelzes_szam', jsonb_array_length(v_jelzesek), 'jelzesek', v_jelzesek
  );
end;
$function$;

-- ===========================================================================
-- 5. Lefedettség az új szerkezet szerint
-- ===========================================================================

-- A nezet oszlopai valtoznak, ezert eldobjuk es ujra letrehozzuk.
drop view if exists public.aic_legal_text_coverage;

create view public.aic_legal_text_coverage as
select
  s.title as jogforras,
  s.celex_number,
  count(distinct p.id) as hivatkozas,
  count(distinct p.id) filter (
    where (select talalat from public.aic_hivatkozas_szovege(p.id)) > 0
  ) as van_szovege,
  (select count(*) from public.aic_legal_text t where t.source_id = s.id) as betoltott_szovegreszlet,
  (select max(retrieved_at) from public.aic_legal_text t where t.source_id = s.id) as utolso_betoltes
from public.aic_legal_sources s
left join public.aic_legal_provisions p on p.source_id = s.id
group by s.id, s.title, s.celex_number
order by count(distinct p.id) desc;

grant select on public.aic_legal_text_coverage to authenticated;

revoke all on function public.aic_cikkszamok(text) from public, anon;
revoke all on function public.aic_hivatkozas_szovege(uuid) from public, anon;
grant execute on function public.aic_cikkszamok(text) to authenticated;
grant execute on function public.aic_hivatkozas_szovege(uuid) to authenticated;

commit;
