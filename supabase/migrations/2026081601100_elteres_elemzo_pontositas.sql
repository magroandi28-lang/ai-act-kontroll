-- EnergiaAI Kontroll – az eltéréselemző pontosítása bekezdésszintre.
--
-- A HIBA
-- A jogszabályt cikkenként töltöttük be, a szabályzat fejezetei viszont egy-egy
-- bekezdéshez tartoznak. Egy szűk fejezetet a teljes cikkhez mérve téves
-- jelzések keletkeztek: az 5. cikk bűnüldözési kivételéből származó "24 óra"
-- kigyulladt az érzelemfelismerés tilalmánál is.
--
-- Mérés a javítás előtt: 189 jelzés, ebből 80 használhatatlan
-- ("aránytalanul rövid" – 82 modulból 80-nál kigyulladt).
--
-- A JAVÍTÁS
--   1. A betöltő bekezdésenként is eltárolja a szöveget.
--   2. Az elemző a jogszabályhelyhez tartozó pontos szöveget használja.
--   3. Ahol nincs bekezdésszám, a jelzés "cikkszintű becslés" jelölést kap.
--   4. Az "aránytalanul rövid" jelzés megszűnik.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Ezután futtatandó a betöltő új kimenete.

begin;

-- ===========================================================================
-- 1. A betöltő függvény bekezdésszintre bővítve
-- ===========================================================================

drop function if exists public.aic_upsert_legal_text(text, text, text, text, text);

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
  v_affected integer := 0;
  v_updated integer := 0;
  v_changed integer := 0;
begin
  if nullif(btrim(p_verbatim), '') is null then
    raise exception 'Üres szöveggel nem tölthető be jogszabályhely.';
  end if;

  v_new_hash := encode(sha256(convert_to(btrim(p_verbatim), 'UTF8')), 'hex');

  for v_provision in
    select p.id, p.verbatim_sha256, p.provision_text_verbatim, p.article_number,
           p.paragraph_number, s.title as source_title
    from public.aic_legal_provisions p
    join public.aic_legal_sources s on s.id = p.source_id
    where s.celex_number = p_celex
      and p.article_number = p_article_number
      -- Bekezdésszám nélküli hívás a cikkhez tartozó, bekezdés nélküli
      -- hivatkozásokat tölti; bekezdésszámmal csak a pontos találatot.
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
    'paragraph', p_paragraph_number,
    'updated_provisions', v_updated,
    'changed', v_changed,
    'affected_modules', v_affected
  );
end;
$function$;

revoke all on function public.aic_upsert_legal_text(text, text, text, text, text, text) from public, anon;
grant execute on function public.aic_upsert_legal_text(text, text, text, text, text, text) to authenticated;

-- ===========================================================================
-- 2. Az elemző pontosítása
--
-- A jelzés mellé kiírjuk, hogy bekezdésszintű összevetésen alapul-e vagy
-- csak a cikk egészén. Az utóbbi bizonytalanabb, ezt a jogásznak látnia kell.
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
  v_cikkek text := '';
  v_osszes integer := 0;
  v_bekezdesszintu integer := 0;
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
         count(*) filter (where p.paragraph_number is not null)
    into v_jogszabaly, v_cikkek, v_osszes, v_bekezdesszintu
  from public.aic_rule_legal_bases lb
  join public.aic_legal_provisions p on p.id = lb.provision_id
  where lb.rule_id = v_modul.rule_id
    and p.provision_text_verbatim is not null;

  if btrim(v_jogszabaly) = '' then
    return jsonb_build_object(
      'module_code', v_modul.module_code,
      'title', v_modul.title,
      'elemezheto', false,
      'ok', 'Nincs betöltve a hivatkozott jogszabályhely hivatalos szövege.'
    );
  end if;

  -- Pontosság: minden hivatkozás bekezdésszintű, vegyes, vagy csak cikkszintű.
  v_pontossag := case
    when v_bekezdesszintu = v_osszes then 'bekezdes'
    when v_bekezdesszintu = 0 then 'cikk'
    else 'vegyes'
  end;

  v_utoirat := case v_pontossag
    when 'cikk' then ' (cikkszintű becslés – a hivatkozás nem jelöl bekezdést, ezért a jelzés bizonytalan)'
    when 'vegyes' then ' (részben cikkszintű becslés)'
    else ''
  end;

  select coalesce(array_agg(e order by e), '{}'::text[]) into v_hianyzo_ido
  from unnest(public.aic_kinyert_idotartamok(v_jogszabaly)) e
  where not (e = any (public.aic_kinyert_idotartamok(v_modul.full_text_template)));

  select coalesce(array_agg(c order by c), '{}'::text[]) into v_hianyzo_cikk
  from unnest(public.aic_kinyert_cikkhivatkozasok(v_jogszabaly)) c
  where not exists (
    select 1
    from public.aic_policy_modules m2
    join public.aic_rule_legal_bases lb2 on lb2.rule_id = m2.rule_id
    join public.aic_legal_provisions p2 on p2.id = lb2.provision_id
    where p2.article_number = c
      and m2.lifecycle_status in ('approved', 'under_review')
  );

  select coalesce(array_agg(x order by x), '{}'::text[]) into v_hianyzo_mell
  from unnest(public.aic_kinyert_mellekletek(v_jogszabaly)) x
  where not (x = any (public.aic_kinyert_mellekletek(v_modul.full_text_template)));

  if cardinality(v_hianyzo_ido) > 0 then
    v_jelzesek := v_jelzesek || jsonb_build_array(jsonb_build_object(
      'tipus', 'hianyzo_hatarido',
      'sulyossag', case when v_pontossag = 'bekezdes' then 'magas' else 'kozepes' end,
      'pontossag', v_pontossag,
      'uzenet', 'A jogszabály időtartamot ír elő, ami a fejezetben nem szerepel: '
                || array_to_string(v_hianyzo_ido, ', ') || '.' || v_utoirat,
      'ertekek', to_jsonb(v_hianyzo_ido)
    ));
  end if;

  if cardinality(v_hianyzo_cikk) > 0 then
    v_jelzesek := v_jelzesek || jsonb_build_array(jsonb_build_object(
      'tipus', 'lefedetlen_kereszthivatkozas',
      'sulyossag', case when v_pontossag = 'bekezdes' then 'kozepes' else 'alacsony' end,
      'pontossag', v_pontossag,
      'uzenet', 'A jogszabályhely más cikkre hivatkozik, ami a katalógusban nincs lefedve: '
                || array_to_string(v_hianyzo_cikk, '. cikk, ') || '. cikk.' || v_utoirat,
      'ertekek', to_jsonb(v_hianyzo_cikk)
    ));
  end if;

  if cardinality(v_hianyzo_mell) > 0 then
    v_jelzesek := v_jelzesek || jsonb_build_array(jsonb_build_object(
      'tipus', 'hianyzo_melleklet',
      'sulyossag', case when v_pontossag = 'bekezdes' then 'kozepes' else 'alacsony' end,
      'pontossag', v_pontossag,
      'uzenet', 'A jogszabályhely mellékletre hivatkozik, a fejezet nem: '
                || array_to_string(v_hianyzo_mell, ', ') || '.' || v_utoirat,
      'ertekek', to_jsonb(v_hianyzo_mell)
    ));
  end if;

  -- Az "aranytalanul rovid" jelzes megszunt: 82 modulbol 80-nal kigyulladt,
  -- ezert nem informacio, csak zaj volt.

  return jsonb_build_object(
    'module_code', v_modul.module_code,
    'title', v_modul.title,
    'elemezheto', true,
    'hivatkozott_helyek', v_cikkek,
    'pontossag', v_pontossag,
    'jelzes_szam', jsonb_array_length(v_jelzesek),
    'jelzesek', v_jelzesek
  );
end;
$function$;

-- A nezet oszlopai valtoznak, ezert eldobjuk es ujra letrehozzuk.
-- A create or replace nem tud oszlopnevet vagy sorrendet modositani.
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
  case e->>'pontossag' when 'bekezdes' then 0 when 'vegyes' then 1 else 2 end,
  coalesce((e->>'jelzes_szam')::integer, 0) desc,
  m.title;

comment on view public.aic_elteres_jelzesek is
  'Determinisztikus eltéréselemzés a fejezetszöveg és a hivatkozott jogszabályhely között. A bekezdésszintű jelzés megbízható, a cikkszintű csak becslés.';

grant select on public.aic_elteres_jelzesek to authenticated;

commit;
