-- EnergiaAI Kontroll – a jogtár függvényei.
--
-- MIT AD
--   aic_jogtar_lista  – a bal oldali navigáció: jogforrások és cikkek, mellettük
--                       hány szabály tartozik hozzájuk és mennyi van jóváhagyva
--   aic_jogtar_cikk   – egy cikk teljes tartalma: a hatályos jogszabályszöveg
--                       bekezdésenként, és a belőle írt szabályok a bekapcsoló
--                       funkciókkal, az értelmezési jegyzettel és a teendőkkel
--   aic_szabaly_mentese – a szabály szövegének módosítása, verzióemeléssel
--
-- A SZŰRÉSRŐL
-- Három szűrő van: réteg (törzs, iparág, mind), szerepkör, és állapot. A réteg
-- azért kell, mert a törzset egyszer kell végigvinni, egy új iparág felvételekor
-- pedig csak az új néhány szabályt.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. Navigáció: jogforrások és cikkek.
-- ---------------------------------------------------------------------------
create or replace function public.aic_jogtar_lista(
  p_reteg text default 'mind',        -- 'torzs' | 'mind' | iparágkód
  p_szerepkor text default null,
  p_allapot text default 'mind'       -- 'mind' | 'jovahagyasra_var' | 'jovahagyott' | 'nincs_szabaly'
) returns jsonb
language plpgsql stable security definer
set search_path = public, pg_temp
as $function$
declare v_forrasok jsonb; v_ossz jsonb;
begin
  if auth.uid() is null then
    raise exception 'A jogtár megtekintéséhez bejelentkezés szükséges.';
  end if;

  with szabaly as (
    select p.source_id, p.article_number,
           r.id as rule_id, r.rule_code, r.actor_role, r.approved_at,
           m.title, m.display_order,
           coalesce(m.applicability->'industry_codes', '[]'::jsonb) as iparagak
    from aic_rule_legal_bases lb
    join aic_legal_provisions p on p.id = lb.provision_id
    join aic_compliance_rules r on r.id = lb.rule_id
    join aic_policy_modules m on m.rule_id = r.id
    where lb.basis_type = 'primary'
      and m.lifecycle_status in ('approved','under_review')
      and (p_szerepkor is null or r.actor_role in (p_szerepkor, 'any'))
      and (p_reteg = 'mind'
           or (p_reteg = 'torzs' and jsonb_array_length(coalesce(m.applicability->'industry_codes','[]'::jsonb)) = 0)
           or (p_reteg not in ('mind','torzs') and (m.applicability->'industry_codes') ? p_reteg))
  ),
  hely as (
    select c.source_id, c.article_number, c.coverage_status, c.proposed_status,
           coalesce(c.rationale, c.proposed_reason) as indok,
           s.title as forras, s.celex_number,
           coalesce((regexp_match(c.article_number,'^(\d+)'))[1]::int, 9000) as sorszam,
           (select nullif(split_part(t.content, E'\r\n', 1),'')
              from aic_legal_text t
             where t.source_id = c.source_id and t.article_number = c.article_number
               and t.paragraph_number is null limit 1) as cim
    from aic_provision_coverage c
    join aic_legal_sources s on s.id = c.source_id
  ),
  osszevont as (
    select h.*,
           count(sz.rule_id) as szabaly_szam,
           count(sz.rule_id) filter (where sz.approved_at is not null) as jovahagyott,
           coalesce(array_agg(distinct sz.actor_role) filter (where sz.actor_role is not null), '{}') as szerepek
    from hely h
    left join szabaly sz on sz.source_id = h.source_id and sz.article_number = h.article_number
    group by h.source_id, h.article_number, h.coverage_status, h.proposed_status,
             h.indok, h.forras, h.celex_number, h.sorszam, h.cim
  ),
  szurt as (
    select * from osszevont o
    where case p_allapot
      when 'jovahagyasra_var' then o.szabaly_szam > o.jovahagyott
      when 'jovahagyott' then o.szabaly_szam > 0 and o.szabaly_szam = o.jovahagyott
      when 'nincs_szabaly' then o.szabaly_szam = 0
      else true end
      and (p_reteg = 'mind' or o.szabaly_szam > 0 or p_allapot = 'nincs_szabaly')
  )
  select jsonb_agg(f order by f->>'rend', f->>'forras'),
         jsonb_build_object(
           'hely', sum((f->>'hely_szam')::int),
           'szabaly', sum((f->>'szabaly_szam')::int),
           'jovahagyott', sum((f->>'jovahagyott')::int))
  into v_forrasok, v_ossz
  from (
    select jsonb_build_object(
      'forras', z.forras,
      'celex', z.celex_number,
      'rend', case when z.celex_number like '%2024R1689%' then '1'
                   when z.celex_number like '%2016R0679%' then '2' else '3' end,
      'hely_szam', count(*),
      'szabaly_szam', coalesce(sum(z.szabaly_szam),0),
      'jovahagyott', coalesce(sum(z.jovahagyott),0),
      'cikkek', jsonb_agg(jsonb_build_object(
          'source_id', z.source_id,
          'cikk', z.article_number,
          'cim', z.cim,
          'szabaly_szam', z.szabaly_szam,
          'jovahagyott', z.jovahagyott,
          'szerepek', to_jsonb(z.szerepek),
          'allapot', z.coverage_status,
          'javaslat', z.proposed_status,
          'indok', z.indok
        ) order by z.sorszam, z.article_number)
    ) as f
    from szurt z
    group by z.forras, z.celex_number
  ) t;

  return jsonb_build_object('osszesites', coalesce(v_ossz,'{}'::jsonb),
                            'forrasok', coalesce(v_forrasok,'[]'::jsonb));
end;
$function$;

revoke all on function public.aic_jogtar_lista(text, text, text) from public, anon;
grant execute on function public.aic_jogtar_lista(text, text, text) to authenticated;

-- ---------------------------------------------------------------------------
-- 2. Egy cikk teljes tartalma.
-- ---------------------------------------------------------------------------
create or replace function public.aic_jogtar_cikk(p_source_id uuid, p_cikk text)
returns jsonb
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
          -- Mely kapcsolók kapcsolják be a szabályt. A feltételekből olvassuk ki,
          -- és a katalógusból vesszük a magyar nevet.
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
        and m.lifecycle_status in ('approved','under_review')), '[]'::jsonb)
  )
  into v_eredmeny
  from aic_legal_sources s where s.id = p_source_id;

  return v_eredmeny;
end;
$function$;

revoke all on function public.aic_jogtar_cikk(uuid, text) from public, anon;
grant execute on function public.aic_jogtar_cikk(uuid, text) to authenticated;

-- ---------------------------------------------------------------------------
-- 3. A szabály szövegének módosítása.
--    A jóváhagyás a módosított szövegre vonatkozik, ezért mentéskor a korábbi
--    jóváhagyás elvész: aki átírja, annak újra jóvá kell hagynia.
-- ---------------------------------------------------------------------------
create or replace function public.aic_szabaly_mentese(
  p_rule_code text,
  p_szoveg text,
  p_ertelmezes text default null
) returns jsonb
language plpgsql security definer
set search_path = public, pg_temp
as $function$
declare v_szerep text; v_modul text; v_verzio int;
begin
  if auth.uid() is null then
    raise exception 'A szerkesztéshez bejelentkezés szükséges.';
  end if;
  select szerepem into v_szerep from public.aic_szervezeteim() limit 1;
  if v_szerep is null or v_szerep not in ('compliance','owner') then
    raise exception 'A szabály szövegét jogász vagy tulajdonos módosíthatja.';
  end if;
  if btrim(coalesce(p_szoveg,'')) = '' then
    raise exception 'A szabály szövege nem lehet üres.';
  end if;

  update public.aic_policy_modules m
     set full_text_template = btrim(p_szoveg),
         version = m.version + 1,
         updated_at = now()
    from public.aic_compliance_rules r
   where r.id = m.rule_id and r.rule_code = p_rule_code
  returning m.module_code, m.version into v_modul, v_verzio;

  if v_modul is null then
    raise exception 'Nincs ilyen szabály: %.', p_rule_code;
  end if;

  update public.aic_compliance_rules
     set legal_interpretation_note = coalesce(nullif(btrim(coalesce(p_ertelmezes,'')),''), legal_interpretation_note),
         approved_by = null, approved_at = null,
         updated_at = now()
   where rule_code = p_rule_code;

  return jsonb_build_object('modul', v_modul, 'verzio', v_verzio, 'jovahagyas', 'visszavonva');
end;
$function$;

revoke all on function public.aic_szabaly_mentese(text, text, text) from public, anon;
grant execute on function public.aic_szabaly_mentese(text, text, text) to authenticated;

commit;
