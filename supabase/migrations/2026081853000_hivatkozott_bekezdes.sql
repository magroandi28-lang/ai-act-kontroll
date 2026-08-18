-- EnergiaAI Kontroll – a jogtár csak a ténylegesen hivatkozott bekezdést emelje ki.
--
-- A HIBA
-- A jogtár a teljes szakasz szövegét kiöntötte. A VET 56/A. §-nál például a
-- szabály jogalapja az (1)–(3) bekezdés, de a felületen ott volt a (9) is a
-- villamosenergia-tárolók adathozzáféréséről, aminek semmi köze egy
-- MI-rendszerhez. Így a katalógus hibásnak látszott, pedig pontos volt.
--
-- A JAVÍTÁS
-- 1. aic_bekezdes_illeszkedik(): eldönti, hogy egy törvényszöveg-bekezdés
--    beleesik-e egy jogalap-hivatkozásba. Kezeli az egyest ("3"), a
--    tartományt ("1–3"), a felsorolást ("3, 6, 8") és a pontszámozást ("4.1–4.11").
-- 2. aic_jogtar_cikk(): minden szabályhoz visszaadja, melyik bekezdésre
--    hivatkozik, és a cikk szintjén megjelöli a hivatkozott bekezdéseket.
--
-- Nem nyúl a katalógus adataihoz, csak olvasási függvényekhez.
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- Egy bekezdésjelből numerikus rendezőérték. Az "1a" -> 1, a "4.11" -> 4.11,
-- a "7b" -> 7. Erre a tartományok összehasonlítása épül.
create or replace function public.aic_bekezdes_ertek(p_jel text)
returns numeric
language sql immutable
as $function$
  select nullif((regexp_match(coalesce(p_jel,''), '^\s*(\d+(?:\.\d+)?)'))[1], '')::numeric;
$function$;

comment on function public.aic_bekezdes_ertek(text) is
  'Bekezdésjel numerikus értéke tartomány-összehasonlításhoz. 1a -> 1, 4.11 -> 4.11.';

-- Illeszkedik-e a szöveg bekezdése a jogalap hivatkozásához.
-- p_hivatkozas üres  -> a teljes szakasz a jogalap, minden bekezdés illeszkedik.
create or replace function public.aic_bekezdes_illeszkedik(p_bekezdes text, p_hivatkozas text)
returns boolean
language plpgsql immutable
as $function$
declare
  v_ertek numeric;
  v_token text;
  v_also numeric;
  v_felso numeric;
  v_resz text[];
begin
  if p_hivatkozas is null or btrim(p_hivatkozas) = '' then
    return true;
  end if;

  v_ertek := public.aic_bekezdes_ertek(p_bekezdes);
  if v_ertek is null then
    return false;
  end if;

  -- Pontosvessző és vessző egyaránt felsorolást jelöl.
  foreach v_token in array regexp_split_to_array(p_hivatkozas, '\s*[;,]\s*')
  loop
    v_token := btrim(v_token);
    continue when v_token = '';

    -- Tartomány: gondolatjel, kötőjel vagy nagykötőjel választja el.
    v_resz := regexp_match(v_token, '^(\d+(?:\.\d+)?)[^0-9]*[–—-][^0-9]*(\d+(?:\.\d+)?)');
    if v_resz is not null then
      v_also := v_resz[1]::numeric;
      v_felso := v_resz[2]::numeric;
      if v_ertek >= v_also and v_ertek <= v_felso then
        return true;
      end if;
      continue;
    end if;

    -- Egyedi bekezdés.
    if public.aic_bekezdes_ertek(v_token) = v_ertek then
      return true;
    end if;
  end loop;

  return false;
end;
$function$;

comment on function public.aic_bekezdes_illeszkedik(text, text) is
  'Beleesik-e a törvényszöveg bekezdése a jogalapként megjelölt bekezdéshivatkozásba.';

-- A cikklekérdezés kiegészítése: hivatkozott bekezdések a cikk szintjén és
-- szabályonként is.
create or replace function public.aic_jogtar_cikk(
  p_source_id uuid,
  p_cikk text,
  p_szerepkor text default null,
  p_reteg text default 'mind'
) returns jsonb
language plpgsql stable security definer
set search_path = public, pg_temp
as $function$
declare
  v_eredmeny jsonb;
  v_hivatkozasok text[];
begin
  if auth.uid() is null then
    raise exception 'A jogtár megtekintéséhez bejelentkezés szükséges.';
  end if;

  -- A szűrésnek megfelelő szabályok jogalapjai. Ezekből derül ki, mely
  -- bekezdéseket kell kiemelni.
  select array_agg(distinct coalesce(p.paragraph_number, ''))
    into v_hivatkozasok
  from aic_rule_legal_bases lb
  join aic_compliance_rules r on r.id = lb.rule_id
  join aic_policy_modules m on m.rule_id = r.id
  join aic_legal_provisions p on p.id = lb.provision_id
  where lb.basis_type = 'primary'
    and p.source_id = p_source_id
    and p_cikk = any (aic_cikkszamok(p.article_number))
    and m.lifecycle_status in ('approved','under_review')
    and (p_szerepkor is null or r.actor_role in (p_szerepkor, 'any'))
    and (p_reteg = 'mind'
         or (p_reteg = 'torzs' and jsonb_array_length(coalesce(m.applicability->'industry_codes','[]'::jsonb)) = 0)
         or (p_reteg not in ('mind','torzs') and (m.applicability->'industry_codes') ? p_reteg));

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

    -- Emberi olvasásra: "(1)–(3)". Ha nincs bekezdésre bontva a jogalap, üres.
    'hivatkozas_cimke', (
      select string_agg(distinct h, ', ')
      from unnest(coalesce(v_hivatkozasok, array[]::text[])) h
      where btrim(h) <> ''),

    -- Minden bekezdés megkapja, hogy hivatkozott-e. A felület ez alapján
    -- választja szét a kiemelt és a többi bekezdést.
    'bekezdesek', coalesce((
      select jsonb_agg(jsonb_build_object(
               'bekezdes', t.paragraph_number,
               'szoveg', t.content,
               'hivatkozott', exists (
                  select 1 from unnest(coalesce(v_hivatkozasok, array[]::text[])) h
                  where aic_bekezdes_illeszkedik(t.paragraph_number, nullif(btrim(h),''))))
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
          'hivatkozott_bekezdes', p.paragraph_number,
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
