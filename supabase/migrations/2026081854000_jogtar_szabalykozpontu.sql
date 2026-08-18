-- EnergiaAI Kontroll – a jogtár szabályközpontú átépítése.
--
-- MIÉRT
-- A jogtár eddig a törvényt tette előre és a szabályt a végére. Egy szakasz
-- hosszú, mert mindent szabályoz; az MI-re vonatkozó következmény ebből
-- néhány sor. Így a szabály maradéknak látszott, és a felület
-- megbízhatatlannak. A jogásznak nem a törvényt kell olvasnia, hanem azt
-- eldöntenie, hogy a szabály helyes következmény-e. Egy képernyő = egy döntés.
--
-- MI KÉSZÜL
--   aic_bekezdes_ertek()        – bekezdésjel numerikus értéke
--   aic_bekezdes_illeszkedik()  – beleesik-e a bekezdés a jogalap-hivatkozásba
--   aic_jogtar_szabalyok()      – a bal oldali lista: szabályok, jogszabály szerint
--   aic_jogtar_szabaly()        – egy szabály + a hivatkozott törvényszöveg
--
-- Csak olvasási függvények, a katalógus adataihoz nem nyúl.
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. Bekezdés-illesztés
-- ---------------------------------------------------------------------------

create or replace function public.aic_bekezdes_ertek(p_jel text)
returns numeric
language sql immutable
as $function$
  select nullif((regexp_match(coalesce(p_jel,''), '^\s*(\d+(?:\.\d+)?)'))[1], '')::numeric;
$function$;

comment on function public.aic_bekezdes_ertek(text) is
  'Bekezdésjel numerikus értéke tartomány-összehasonlításhoz. 1a -> 1, 4.11 -> 4.11.';

create or replace function public.aic_bekezdes_illeszkedik(p_bekezdes text, p_hivatkozas text)
returns boolean
language plpgsql immutable
as $function$
declare
  v_ertek numeric;
  v_token text;
  v_resz text[];
begin
  -- Üres hivatkozás: a jogalap a teljes szakasz.
  if p_hivatkozas is null or btrim(p_hivatkozas) = '' then
    return true;
  end if;

  v_ertek := public.aic_bekezdes_ertek(p_bekezdes);
  if v_ertek is null then
    return false;
  end if;

  foreach v_token in array regexp_split_to_array(p_hivatkozas, '\s*[;,]\s*')
  loop
    v_token := btrim(v_token);
    continue when v_token = '';

    -- Tartomány: "1–3", "5-8", "4.1–4.11"
    v_resz := regexp_match(v_token, '^(\d+(?:\.\d+)?)[^0-9]*[–—-][^0-9]*(\d+(?:\.\d+)?)');
    if v_resz is not null then
      if v_ertek >= v_resz[1]::numeric and v_ertek <= v_resz[2]::numeric then
        return true;
      end if;
      continue;
    end if;

    if public.aic_bekezdes_ertek(v_token) = v_ertek then
      return true;
    end if;
  end loop;

  return false;
end;
$function$;

comment on function public.aic_bekezdes_illeszkedik(text, text) is
  'Beleesik-e a törvényszöveg bekezdése a jogalapként megjelölt bekezdéshivatkozásba.';

-- ---------------------------------------------------------------------------
-- 2. Bal oldali lista: szabályok, nem cikkek
-- ---------------------------------------------------------------------------

create or replace function public.aic_jogtar_szabalyok(
  p_reteg text default 'mind',
  p_szerepkor text default null,
  p_allapot text default 'jovahagyasra_var'
) returns jsonb
language plpgsql stable security definer
set search_path = public, pg_temp
as $function$
declare v_eredmeny jsonb;
begin
  if auth.uid() is null then
    raise exception 'A jogtár megtekintéséhez bejelentkezés szükséges.';
  end if;

  with szurt as (
    select
      r.rule_code,
      r.actor_role,
      r.approved_at,
      m.title,
      m.display_order,
      s.id   as source_id,
      s.title as forras,
      -- Egy szabálynak több elsődleges jogalapja is lehet; a listában a
      -- legelső jogszabályhelyet mutatjuk.
      min(p.article_number) as cikk,
      min(coalesce(p.paragraph_number,'')) as bekezdes
    from aic_rule_legal_bases lb
    join aic_compliance_rules r on r.id = lb.rule_id
    join aic_policy_modules m on m.rule_id = r.id
    join aic_legal_provisions p on p.id = lb.provision_id
    join aic_legal_sources s on s.id = p.source_id
    where lb.basis_type = 'primary'
      and m.lifecycle_status in ('approved','under_review')
      and (p_szerepkor is null or r.actor_role in (p_szerepkor, 'any'))
      and (p_reteg = 'mind'
           or (p_reteg = 'torzs' and jsonb_array_length(coalesce(m.applicability->'industry_codes','[]'::jsonb)) = 0)
           or (p_reteg not in ('mind','torzs') and (m.applicability->'industry_codes') ? p_reteg))
      and (p_allapot = 'mind'
           or (p_allapot = 'jovahagyasra_var' and r.approved_at is null)
           or (p_allapot = 'jovahagyott' and r.approved_at is not null))
    group by r.rule_code, r.actor_role, r.approved_at, m.title, m.display_order, s.id, s.title
  )
  select jsonb_build_object(
    'osszesites', jsonb_build_object(
      'szabaly', (select count(*) from szurt),
      'jovahagyott', (select count(*) from szurt where approved_at is not null)),
    'forrasok', coalesce((
      select jsonb_agg(f order by f->>'forras')
      from (
        select jsonb_build_object(
                 'forras', forras,
                 'source_id', source_id,
                 'szabalyok', jsonb_agg(jsonb_build_object(
                     'rule_code', rule_code,
                     'cim', title,
                     'szerep', actor_role,
                     'cikk', cikk,
                     'bekezdes', nullif(bekezdes,''),
                     'jovahagyva', approved_at is not null)
                   order by approved_at nulls first, display_order, title)) as f
        from szurt group by forras, source_id) q), '[]'::jsonb))
  into v_eredmeny;

  return v_eredmeny;
end;
$function$;

comment on function public.aic_jogtar_szabalyok(text, text, text) is
  'A jogtár bal oldali listája: a szűrésnek megfelelő szabályok jogszabály szerint csoportosítva.';

revoke all on function public.aic_jogtar_szabalyok(text, text, text) from public, anon;
grant execute on function public.aic_jogtar_szabalyok(text, text, text) to authenticated;

-- ---------------------------------------------------------------------------
-- 3. Egy szabály és a hozzá tartozó bizonyíték
-- ---------------------------------------------------------------------------

create or replace function public.aic_jogtar_szabaly(p_rule_code text)
returns jsonb
language plpgsql stable security definer
set search_path = public, pg_temp
as $function$
declare
  v_rule aic_compliance_rules%rowtype;
  v_modul aic_policy_modules%rowtype;
  v_eredmeny jsonb;
begin
  if auth.uid() is null then
    raise exception 'A jogtár megtekintéséhez bejelentkezés szükséges.';
  end if;

  select * into v_rule from aic_compliance_rules where rule_code = p_rule_code;
  if not found then
    raise exception 'Ismeretlen szabály: %', p_rule_code;
  end if;

  select * into v_modul from aic_policy_modules where rule_id = v_rule.id limit 1;

  select jsonb_build_object(
    'rule_code', v_rule.rule_code,
    'cim', coalesce(v_modul.title, v_rule.title),
    'szoveg', v_modul.full_text_template,
    'osszefoglalo', v_modul.summary_text,
    'szerep', v_rule.actor_role,
    'kovetkezmeny', v_rule.outcome_type,
    'jovahagyva', v_rule.approved_at is not null,
    'jovahagyva_mikor', v_rule.approved_at,
    'ertelmezes', v_rule.legal_interpretation_note,
    'hatalyos_tol', v_modul.valid_from,
    'verzio', v_modul.version,
    'iparagak', coalesce(v_modul.applicability->'industry_codes','[]'::jsonb),

    -- Mikor lép be az eszközre. Enélkül a jogász nem tudja megítélni, hogy a
    -- szabály a helyes esetkörre szól-e.
    'kapcsolok', coalesce((
       select jsonb_agg(distinct jsonb_build_object(
                'kulcs', k.kulcs,
                'nev', coalesce(tc.name_hu, k.kulcs),
                'kerdes', tc.question_hu))
       from (
         select key as kulcs from jsonb_object_keys(coalesce(v_modul.applicability->'required_facts','{}'::jsonb)) key
         union select c->>'fact' from jsonb_array_elements(coalesce(v_modul.applicability->'all','[]'::jsonb)) c
         union select c->>'fact' from jsonb_array_elements(coalesce(v_modul.applicability->'any','[]'::jsonb)) c
       ) k
       left join aic_trigger_catalogue tc
         on tc.trigger_key = k.kulcs or k.kulcs = any(tc.legacy_fact_keys)
       where k.kulcs is not null), '[]'::jsonb),

    'teendok', coalesce((
       select jsonb_agg(jsonb_build_object('cim', a.action_title, 'leiras', a.action_description,
                                           'prioritas', a.priority)
              order by case a.priority when 'critical' then 1 when 'high' then 2 else 3 end)
       from aic_required_actions a where a.rule_id = v_rule.id), '[]'::jsonb),

    -- A bizonyíték: minden elsődleges jogalap, és hozzá pontosan a hivatkozott
    -- bekezdések szövege. A szakasz többi bekezdése külön tömbben megy, hogy a
    -- felület összecsukva tudja mutatni.
    'jogalapok', coalesce((
      select jsonb_agg(jsonb_build_object(
          'forras', s.title,
          'forras_link', s.official_url,
          'cikk', p.article_number,
          'bekezdes', p.paragraph_number,
          'fejlec', p.heading,
          'melylink', coalesce(p.deep_link,
                        (select min(t.deep_link) from aic_legal_text t
                          where t.source_id = p.source_id
                            and t.article_number = any (aic_cikkszamok(p.article_number)))),
          'hivatkozott', coalesce((
             select jsonb_agg(jsonb_build_object('bekezdes', t.paragraph_number, 'szoveg', t.content)
                    order by coalesce((regexp_match(t.paragraph_number,'^(\d+)'))[1]::int,0), t.paragraph_number)
             from aic_legal_text t
             where t.source_id = p.source_id
               and t.article_number = any (aic_cikkszamok(p.article_number))
               and t.paragraph_number is not null
               and aic_bekezdes_illeszkedik(t.paragraph_number, p.paragraph_number)), '[]'::jsonb),
          'tobbi', coalesce((
             select jsonb_agg(jsonb_build_object('bekezdes', t.paragraph_number, 'szoveg', t.content)
                    order by coalesce((regexp_match(t.paragraph_number,'^(\d+)'))[1]::int,0), t.paragraph_number)
             from aic_legal_text t
             where t.source_id = p.source_id
               and t.article_number = any (aic_cikkszamok(p.article_number))
               and t.paragraph_number is not null
               and not aic_bekezdes_illeszkedik(t.paragraph_number, p.paragraph_number)), '[]'::jsonb),
          'teljes_szoveg', (select t.content from aic_legal_text t
                             where t.source_id = p.source_id
                               and t.article_number = any (aic_cikkszamok(p.article_number))
                               and t.paragraph_number is null limit 1),
          'kivonat', p.provision_text_verbatim)
        order by s.title, p.article_number)
      from aic_rule_legal_bases lb
      join aic_legal_provisions p on p.id = lb.provision_id
      join aic_legal_sources s on s.id = p.source_id
      where lb.rule_id = v_rule.id and lb.basis_type = 'primary'), '[]'::jsonb),

    -- Támogató hivatkozások: nem ezekből ered a kötelezettség, de a jogász
    -- lássa, mi támasztja alá.
    'tamogato', coalesce((
      select jsonb_agg(jsonb_build_object('forras', s.title, 'cikk', p.article_number,
                                          'bekezdes', p.paragraph_number)
             order by s.title, p.article_number)
      from aic_rule_legal_bases lb
      join aic_legal_provisions p on p.id = lb.provision_id
      join aic_legal_sources s on s.id = p.source_id
      where lb.rule_id = v_rule.id and lb.basis_type <> 'primary'), '[]'::jsonb)
  )
  into v_eredmeny;

  return v_eredmeny;
end;
$function$;

comment on function public.aic_jogtar_szabaly(text) is
  'Egy szabály teljes döntési képe: szöveg, feltételek, és a hivatkozott jogszabályhely szó szerinti szövege.';

revoke all on function public.aic_jogtar_szabaly(text) from public, anon;
grant execute on function public.aic_jogtar_szabaly(text) to authenticated;

commit;
