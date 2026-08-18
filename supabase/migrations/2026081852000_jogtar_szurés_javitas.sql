-- EnergiaAI Kontroll – a jogtár szűrésének javítása.
--
-- A HIBA
-- A szerepkör- és rétegszűrő csak a bal oldali listára hatott. A megnyitott
-- cikk minden hozzá tartozó szabályt megjelenített, függetlenül attól, hogy
-- alkalmazóra vagy szolgáltatóra szűrtünk. Így a 3. cikknél mind a négy
-- szerepkör szabálya megjelent, pedig felül az alkalmazó volt kiválasztva.
--
-- A JAVÍTÁS
-- A cikklekérdezés ugyanazt a két szűrőt kapja meg, mint a lista.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

create or replace function public.aic_jogtar_cikk(
  p_source_id uuid,
  p_cikk text,
  p_szerepkor text default null,
  p_reteg text default 'mind'
) returns jsonb
language plpgsql stable security definer
set search_path = public, pg_temp
as $function$
declare v_eredmeny jsonb;
begin
  if auth.uid() is null then
    raise exception 'A jogtár megtekintéséhez bejelentkezés szükséges.';
  end if;

  select jsonb_build_object(
    'forras', s.title,
    'forras_link', s.official_url,
    'cikk', p_cikk,
    'cim', (select nullif(split_part(t.content, E'\r\n', 1),'') from aic_legal_text t
             where t.source_id = p_source_id and t.article_number = p_cikk
               and t.paragraph_number is null limit 1),
    'melylink', (select min(t.deep_link) from aic_legal_text t
                  where t.source_id = p_source_id and t.article_number = p_cikk),
    'lefedettseg', (select jsonb_build_object('allapot', c.coverage_status,
                             'javaslat', c.proposed_status,
                             'indok', coalesce(c.rationale, c.proposed_reason),
                             'eldontve', c.decided_at)
                      from aic_provision_coverage c
                     where c.source_id = p_source_id and c.article_number = p_cikk),

    'bekezdesek', coalesce((
      select jsonb_agg(jsonb_build_object('bekezdes', t.paragraph_number, 'szoveg', t.content)
             order by coalesce((regexp_match(t.paragraph_number,'^(\d+)'))[1]::int, 0), t.paragraph_number)
      from aic_legal_text t
      where t.source_id = p_source_id and t.article_number = p_cikk
        and t.paragraph_number is not null), '[]'::jsonb),

    'teljes_szoveg', (select t.content from aic_legal_text t
                       where t.source_id = p_source_id and t.article_number = p_cikk
                         and t.paragraph_number is null limit 1),

    'szabalyok', coalesce((
      select jsonb_agg(jsonb_build_object(
          'rule_code', r.rule_code,
          'modul_kod', m.module_code,
          'cim', m.title,
          'szoveg', m.full_text_template,
          'osszefoglalo', m.summary_text,
          'szerep', r.actor_role,
          'iparagak', coalesce(m.applicability->'industry_codes','[]'::jsonb),
          'jovahagyva', r.approved_at is not null,
          'jovahagyva_mikor', r.approved_at,
          'ertelmezes', r.legal_interpretation_note,
          'hatalyos_tol', m.valid_from,
          'verzio', m.version,
          'kapcsolok', coalesce((
             select jsonb_agg(distinct jsonb_build_object(
                      'kulcs', k.kulcs, 'nev', coalesce(tc.name_hu, k.kulcs)))
             from (
               select key as kulcs from jsonb_object_keys(coalesce(m.applicability->'required_facts','{}'::jsonb)) key
               union select c->>'fact' from jsonb_array_elements(coalesce(m.applicability->'all','[]'::jsonb)) c
               union select c->>'fact' from jsonb_array_elements(coalesce(m.applicability->'any','[]'::jsonb)) c
             ) k
             left join aic_trigger_catalogue tc
               on tc.trigger_key = k.kulcs or k.kulcs = any(tc.legacy_fact_keys)
             where k.kulcs is not null), '[]'::jsonb),
          'teendok', coalesce((
             select jsonb_agg(jsonb_build_object('cim', a.action_title, 'leiras', a.action_description,
                                                 'prioritas', a.priority)
                    order by case a.priority when 'critical' then 1 when 'high' then 2 else 3 end)
             from aic_required_actions a where a.rule_id = r.id), '[]'::jsonb)
        ) order by r.approved_at nulls first, m.display_order)
      from aic_rule_legal_bases lb
      join aic_compliance_rules r on r.id = lb.rule_id
      join aic_policy_modules m on m.rule_id = r.id
      join aic_legal_provisions p on p.id = lb.provision_id
      where lb.basis_type = 'primary' and p.source_id = p_source_id
        and p_cikk = any (aic_cikkszamok(p.article_number))
        and m.lifecycle_status in ('approved','under_review')
        -- Ugyanaz a két szűrő, mint a listánál. Enélkül a megnyitott cikk
        -- minden szerepkör szabályát megmutatta.
        and (p_szerepkor is null or r.actor_role in (p_szerepkor, 'any'))
        and (p_reteg = 'mind'
             or (p_reteg = 'torzs' and jsonb_array_length(coalesce(m.applicability->'industry_codes','[]'::jsonb)) = 0)
             or (p_reteg not in ('mind','torzs') and (m.applicability->'industry_codes') ? p_reteg))
      ), '[]'::jsonb)
  )
  into v_eredmeny
  from aic_legal_sources s where s.id = p_source_id;

  return v_eredmeny;
end;
$function$;

revoke all on function public.aic_jogtar_cikk(uuid, text, text, text) from public, anon;
grant execute on function public.aic_jogtar_cikk(uuid, text, text, text) to authenticated;

commit;
