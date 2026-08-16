-- EnergiaAI Kontroll – alpontszintű jogszabályszöveg és őszinte pontosságjelzés.
--
-- KÉT HIBA JAVÍTÁSA
--
-- 1. Az adatbázis alpontokra hivatkozik: "5 (1(a))", "5 (1(b))" … "5 (1(i))".
--    A betöltő viszont csak bekezdésszintig bontott, ezért ezek egyike sem
--    kapott saját szöveget – mind a teljes 5. cikket tárolta (12 127 karakter).
--
-- 2. Az elemző abból következtetett a pontosságra, hogy van-e bekezdésszám,
--    nem abból, hogy milyen részletességű szöveg van eltárolva. Így a teljes
--    cikk szövegét "bekezdésszintű, megbízható" jelzésként mutatta – ezért
--    került a 24 órás bűnüldözési határidő az érzelemfelismerés tilalmához.
--
-- A JAVÍTÁS
--   - verbatim_scope oszlop: a betöltő rögzíti, milyen részletességű a szöveg
--     (cikk / bekezdés / alpont)
--   - az elemző ebből számolja a pontosságot, nem a hivatkozás alakjából
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Utána újra kell futtatni a betöltő új kimenetét.

begin;

alter table public.aic_legal_provisions
  add column if not exists verbatim_scope text;

alter table public.aic_legal_provisions
  drop constraint if exists aic_legal_provisions_verbatim_scope_check;

alter table public.aic_legal_provisions
  add constraint aic_legal_provisions_verbatim_scope_check
  check (verbatim_scope is null or verbatim_scope in ('article', 'paragraph', 'point'));

comment on column public.aic_legal_provisions.verbatim_scope is
  'A tárolt hivatalos szöveg részletessége: teljes cikk, egy bekezdés vagy egy alpont. Ebből derül ki, mennyire megbízható az eltéréselemzés.';

-- ===========================================================================
-- A betöltő rögzíti a részletességet
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
  v_provision record;
  v_new_hash text;
  v_scope text;
  v_affected integer := 0;
  v_updated integer := 0;
  v_changed integer := 0;
begin
  if nullif(btrim(p_verbatim), '') is null then
    raise exception 'Üres szöveggel nem tölthető be jogszabályhely.';
  end if;

  v_new_hash := encode(sha256(convert_to(btrim(p_verbatim), 'UTF8')), 'hex');

  v_scope := case
    when p_paragraph_number is null then 'article'
    when p_paragraph_number ~ '^\d+$' then 'paragraph'
    else 'point'
  end;

  for v_provision in
    select p.id, p.verbatim_sha256, p.provision_text_verbatim, p.article_number,
           p.paragraph_number, s.title as source_title
    from public.aic_legal_provisions p
    join public.aic_legal_sources s on s.id = p.source_id
    where s.celex_number = p_celex
      and p.article_number = p_article_number
      and (
        (p_paragraph_number is null and p.paragraph_number is null)
        or (p_paragraph_number is not null and p.paragraph_number = p_paragraph_number)
      )
  loop
    v_updated := v_updated + 1;

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

      -- Csak akkor tesszük felülvizsgálandóvá, ha a jogszabály szövege valóban
      -- megváltozott, nem akkor, ha csak pontosabb részletet töltöttünk be.
      if v_provision.paragraph_number is null or v_scope <> 'article' then
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
      end if;

      v_changed := v_changed + 1;
    end if;

    update public.aic_legal_provisions
       set provision_text_verbatim = btrim(p_verbatim),
           verbatim_sha256 = v_new_hash,
           verbatim_scope = v_scope,
           verbatim_retrieved_at = now(),
           verbatim_source_url = coalesce(p_source_url, verbatim_source_url),
           deep_link = coalesce(p_deep_link, deep_link)
     where id = v_provision.id;
  end loop;

  return jsonb_build_object(
    'celex', p_celex, 'article', p_article_number, 'paragraph', p_paragraph_number,
    'scope', v_scope, 'updated_provisions', v_updated,
    'changed', v_changed, 'affected_modules', v_affected
  );
end;
$function$;

revoke all on function public.aic_upsert_legal_text(text, text, text, text, text, text) from public, anon;
grant execute on function public.aic_upsert_legal_text(text, text, text, text, text, text) to authenticated;

-- A korábbi betöltésekhez visszamenőleg beállítjuk a részletességet.
update public.aic_legal_provisions
   set verbatim_scope = 'article'
 where provision_text_verbatim is not null and verbatim_scope is null;

-- ===========================================================================
-- Az elemző a tárolt szöveg részletességéből számol
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
  v_osszes integer := 0;
  v_pontos integer := 0;
  v_pontossag text;
  v_hianyzo_ido text[];
  v_hianyzo_cikk text[];
  v_hianyzo_mell text[];
  v_jelzesek jsonb := '[]'::jsonb;
  v_utoirat text;
begin
  select m.id, m.module_code, m.title, m.full_text_template, m.rule_id, m.module_kind
    into v_modul
  from public.aic_policy_modules m where m.id = p_module_id;

  if not found then
    return jsonb_build_object('error', 'A modul nem található.');
  end if;

  select coalesce(string_agg(p.provision_text_verbatim, E'\n\n'), ''),
         coalesce(string_agg(distinct
           p.article_number || coalesce(' (' || p.paragraph_number || ')', ''),
           ', ' order by p.article_number || coalesce(' (' || p.paragraph_number || ')', '')), ''),
         count(*),
         -- A pontos jelzeshez a tarolt szoveg reszletessege szamit.
         count(*) filter (where p.verbatim_scope in ('paragraph', 'point'))
    into v_jogszabaly, v_helyek, v_osszes, v_pontos
  from public.aic_rule_legal_bases lb
  join public.aic_legal_provisions p on p.id = lb.provision_id
  where lb.rule_id = v_modul.rule_id
    and p.provision_text_verbatim is not null;

  if btrim(v_jogszabaly) = '' then
    return jsonb_build_object(
      'module_code', v_modul.module_code, 'title', v_modul.title,
      'elemezheto', false,
      'ok', 'Nincs betöltve a hivatkozott jogszabályhely hivatalos szövege.'
    );
  end if;

  v_pontossag := case
    when v_pontos = v_osszes then 'pontos'
    when v_pontos = 0 then 'cikkszintu'
    else 'vegyes'
  end;

  v_utoirat := case v_pontossag
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
    where p2.article_number = c and m2.lifecycle_status in ('approved', 'under_review')
  );

  select coalesce(array_agg(x order by x), '{}'::text[]) into v_hianyzo_mell
  from unnest(public.aic_kinyert_mellekletek(v_jogszabaly)) x
  where not (x = any (public.aic_kinyert_mellekletek(v_modul.full_text_template)));

  if cardinality(v_hianyzo_ido) > 0 then
    v_jelzesek := v_jelzesek || jsonb_build_array(jsonb_build_object(
      'tipus', 'hianyzo_hatarido',
      'sulyossag', case when v_pontossag = 'pontos' then 'magas' else 'alacsony' end,
      'pontossag', v_pontossag,
      'uzenet', 'A jogszabály időtartamot ír elő, ami a fejezetben nem szerepel: '
                || array_to_string(v_hianyzo_ido, ', ') || '.' || v_utoirat,
      'ertekek', to_jsonb(v_hianyzo_ido)
    ));
  end if;

  if cardinality(v_hianyzo_cikk) > 0 then
    v_jelzesek := v_jelzesek || jsonb_build_array(jsonb_build_object(
      'tipus', 'lefedetlen_kereszthivatkozas',
      'sulyossag', case when v_pontossag = 'pontos' then 'kozepes' else 'alacsony' end,
      'pontossag', v_pontossag,
      'uzenet', 'A jogszabályhely más cikkre hivatkozik, ami a katalógusban nincs lefedve: '
                || array_to_string(v_hianyzo_cikk, '. cikk, ') || '. cikk.' || v_utoirat,
      'ertekek', to_jsonb(v_hianyzo_cikk)
    ));
  end if;

  if cardinality(v_hianyzo_mell) > 0 then
    v_jelzesek := v_jelzesek || jsonb_build_array(jsonb_build_object(
      'tipus', 'hianyzo_melleklet',
      'sulyossag', case when v_pontossag = 'pontos' then 'kozepes' else 'alacsony' end,
      'pontossag', v_pontossag,
      'uzenet', 'A jogszabályhely mellékletre hivatkozik, a fejezet nem: '
                || array_to_string(v_hianyzo_mell, ', ') || '.' || v_utoirat,
      'ertekek', to_jsonb(v_hianyzo_mell)
    ));
  end if;

  return jsonb_build_object(
    'module_code', v_modul.module_code, 'title', v_modul.title,
    'elemezheto', true, 'hivatkozott_helyek', v_helyek, 'pontossag', v_pontossag,
    'jelzes_szam', jsonb_array_length(v_jelzesek), 'jelzesek', v_jelzesek
  );
end;
$function$;

drop view if exists public.aic_elteres_jelzesek;

create view public.aic_elteres_jelzesek as
select
  m.module_code,
  m.title,
  m.module_kind,
  (e->>'elemezheto')::boolean as elemezheto,
  e->>'pontossag' as pontossag,
  coalesce((e->>'jelzes_szam')::integer, 0) as jelzes_szam,
  e->>'hivatkozott_helyek' as hivatkozott_helyek,
  e->'jelzesek' as jelzesek,
  coalesce(e->>'ok', '') as megjegyzes,
  (select count(distinct g.ai_system_id)
     from public.aic_generated_policies g, jsonb_array_elements(g.document_sections) x
    where x->>'title' = m.title) as hany_szabalyzatban
from public.aic_policy_modules m
cross join lateral public.aic_modul_elteres_elemzes(m.id) e
where m.lifecycle_status in ('approved', 'under_review')
order by
  case e->>'pontossag' when 'pontos' then 0 when 'vegyes' then 1 else 2 end,
  coalesce((e->>'jelzes_szam')::integer, 0) desc,
  m.title;

comment on view public.aic_elteres_jelzesek is
  'Eltéréselemzés a fejezetszöveg és a hivatkozott jogszabályhely között. A "pontos" jelzés bekezdés- vagy alpontszintű szövegen alapul, a "cikkszintu" csak becslés.';

grant select on public.aic_elteres_jelzesek to authenticated;

commit;
