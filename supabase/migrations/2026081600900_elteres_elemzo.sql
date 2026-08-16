-- EnergiaAI Kontroll – eltéréselemző.
--
-- MIT CSINÁL
-- Összeveti a szabályzat fejezetének szövegét a hivatkozott cikk hivatalos
-- szövegével, és jelzi, ha a jogszabályban szereplő mechanikus elemek
-- hiányoznak a fejezetből.
--
-- MIT TALÁL MEG MEGBÍZHATÓAN
--   - határidőket és időtartamokat (hat hónap, 15 nap, tíz év)
--   - számszerű előírásokat
--   - kereszthivatkozásokat más cikkekre és mellékletekre
--   - kötelezettséget kifejező igék arányát
--
-- MIT NEM
-- Azt nem dönti el, hogy a megfogalmazás értelmileg fedi-e a normát.
-- Az a jogász feladata marad. Ez csak megmondja, hova nézzen.
--
-- Nyelvi modellt nem használ, ezért nem hallucinál: ugyanabból a szövegből
-- mindig ugyanazt az eredményt adja.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Előfeltétel: 20260816_jogszabalyszoveg_szerkezet.sql

begin;

-- ===========================================================================
-- 1. Időtartamok kinyerése
--
-- A magyar jogszabályszöveg számmal és betűvel is írhat időtartamot,
-- ezért mindkettőt egységes alakra hozzuk: "6 hónap".
-- ===========================================================================

create or replace function public.aic_szam_ertek(p_szo text)
returns integer
language sql
immutable
set search_path = public, pg_temp
as $function$
  select case lower(btrim(p_szo))
    when 'egy' then 1 when 'két' then 2 when 'kettő' then 2 when 'ketto' then 2
    when 'három' then 3 when 'harom' then 3 when 'négy' then 4 when 'negy' then 4
    when 'öt' then 5 when 'ot' then 5 when 'hat' then 6 when 'hét' then 7 when 'het' then 7
    when 'nyolc' then 8 when 'kilenc' then 9 when 'tíz' then 10 when 'tiz' then 10
    when 'tizenegy' then 11 when 'tizenkét' then 12 when 'tizenkettő' then 12
    when 'tizenöt' then 15 when 'tizenot' then 15 when 'húsz' then 20 when 'husz' then 20
    when 'harminc' then 30 when 'negyven' then 40 when 'ötven' then 50 when 'otven' then 50
    when 'hatvan' then 60 when 'hetven' then 70 when 'nyolcvan' then 80 when 'kilencven' then 90
    else nullif(regexp_replace(p_szo, '\D', '', 'g'), '')::integer
  end;
$function$;

create or replace function public.aic_kinyert_idotartamok(p_szoveg text)
returns text[]
language sql
immutable
set search_path = public, pg_temp
as $function$
  select coalesce(array_agg(distinct ertek order by ertek), '{}'::text[])
  from (
    select public.aic_szam_ertek(t[1]) || ' ' ||
           case lower(t[2])
             when 'napon' then 'nap' when 'napig' then 'nap' when 'napos' then 'nap'
             when 'hónapig' then 'hónap' when 'hónapon' then 'hónap' when 'hónapos' then 'hónap'
             when 'évig' then 'év' when 'éves' then 'év' when 'évente' then 'év'
             when 'órán' then 'óra' when 'óráig' then 'óra'
             when 'munkanapon' then 'munkanap' when 'munkanapig' then 'munkanap'
             else lower(t[2])
           end as ertek
    from regexp_matches(
      coalesce(p_szoveg, ''),
      '(\d{1,4}|egy|két|kettő|ketto|három|harom|négy|negy|öt|ot|hat|hét|het|nyolc|kilenc|tíz|tiz|tizenegy|tizenkét|tizenkettő|tizenöt|tizenot|húsz|husz|harminc|negyven|ötven|otven|hatvan|hetven|nyolcvan|kilencven)\s+(nap|napon|napig|napos|hét|hónap|hónapig|hónapon|hónapos|év|évig|éves|évente|óra|órán|óráig|munkanap|munkanapon|munkanapig)\M',
      'gi'
    ) t
    where public.aic_szam_ertek(t[1]) is not null
  ) x;
$function$;

-- ===========================================================================
-- 2. Kereszthivatkozások kinyerése
-- ===========================================================================

create or replace function public.aic_kinyert_cikkhivatkozasok(p_szoveg text)
returns text[]
language sql
immutable
set search_path = public, pg_temp
as $function$
  select coalesce(array_agg(distinct t[1] order by t[1]), '{}'::text[])
  from regexp_matches(coalesce(p_szoveg, ''), '(\d{1,3})\.\s*cikk', 'g') t;
$function$;

create or replace function public.aic_kinyert_mellekletek(p_szoveg text)
returns text[]
language sql
immutable
set search_path = public, pg_temp
as $function$
  select coalesce(array_agg(distinct upper(t[1]) order by upper(t[1])), '{}'::text[])
  from regexp_matches(coalesce(p_szoveg, ''), '\m(I{1,3}|IV|IX|VI{0,3}|XI{0,2})\.\s*mell[ée]klet', 'gi') t;
$function$;

-- ===========================================================================
-- 3. Egy modul elemzése
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
  v_hianyzo_ido text[];
  v_hianyzo_cikk text[];
  v_hianyzo_mell text[];
  v_jelzesek jsonb := '[]'::jsonb;
begin
  select m.id, m.module_code, m.title, m.full_text_template, m.rule_id, m.module_kind
    into v_modul
  from public.aic_policy_modules m where m.id = p_module_id;

  if not found then
    return jsonb_build_object('error', 'A modul nem található.');
  end if;

  -- A hivatkozott cikkek hivatalos szövegének összefűzése.
  select coalesce(string_agg(p.provision_text_verbatim, E'\n\n'), ''),
         coalesce(string_agg(distinct p.article_number, ', ' order by p.article_number), '')
    into v_jogszabaly, v_cikkek
  from public.aic_rule_legal_bases lb
  join public.aic_legal_provisions p on p.id = lb.provision_id
  where lb.rule_id = v_modul.rule_id
    and p.provision_text_verbatim is not null;

  if btrim(v_jogszabaly) = '' then
    return jsonb_build_object(
      'module_code', v_modul.module_code,
      'title', v_modul.title,
      'elemezheto', false,
      'ok', 'Nincs betöltve a hivatkozott cikk hivatalos szövege.'
    );
  end if;

  -- Időtartamok, amelyek a jogszabályban szerepelnek, a fejezetben nem.
  select coalesce(array_agg(e order by e), '{}'::text[]) into v_hianyzo_ido
  from unnest(public.aic_kinyert_idotartamok(v_jogszabaly)) e
  where not (e = any (public.aic_kinyert_idotartamok(v_modul.full_text_template)));

  -- Hivatkozott cikkek, amelyek a katalógusban sehol nem jelennek meg.
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
      'sulyossag', 'magas',
      'uzenet', 'A jogszabály időtartamot ír elő, ami a fejezetben nem szerepel: '
                || array_to_string(v_hianyzo_ido, ', ') || '.',
      'ertekek', to_jsonb(v_hianyzo_ido)
    ));
  end if;

  if cardinality(v_hianyzo_cikk) > 0 then
    v_jelzesek := v_jelzesek || jsonb_build_array(jsonb_build_object(
      'tipus', 'lefedetlen_kereszthivatkozas',
      'sulyossag', 'kozepes',
      'uzenet', 'A cikk más cikkre hivatkozik, ami a katalógusban nincs lefedve: '
                || array_to_string(v_hianyzo_cikk, '. cikk, ') || '. cikk.',
      'ertekek', to_jsonb(v_hianyzo_cikk)
    ));
  end if;

  if cardinality(v_hianyzo_mell) > 0 then
    v_jelzesek := v_jelzesek || jsonb_build_array(jsonb_build_object(
      'tipus', 'hianyzo_melleklet',
      'sulyossag', 'kozepes',
      'uzenet', 'A jogszabály mellékletre hivatkozik, a fejezet nem: '
                || array_to_string(v_hianyzo_mell, ', ') || '.',
      'ertekek', to_jsonb(v_hianyzo_mell)
    ));
  end if;

  -- Arányjelzés: a fejezet lényegesen rövidebb-e, mint a norma.
  if length(v_modul.full_text_template) * 4 < length(v_jogszabaly) then
    v_jelzesek := v_jelzesek || jsonb_build_array(jsonb_build_object(
      'tipus', 'aranytalanul_rovid',
      'sulyossag', 'alacsony',
      'uzenet', 'A fejezet a hivatkozott jogszabályszöveg negyedénél is rövidebb, '
                || 'ezért könnyen kimaradhatott belőle kötelezettség.',
      'ertekek', to_jsonb(array[length(v_modul.full_text_template)::text, length(v_jogszabaly)::text])
    ));
  end if;

  return jsonb_build_object(
    'module_code', v_modul.module_code,
    'title', v_modul.title,
    'elemezheto', true,
    'hivatkozott_cikkek', v_cikkek,
    'jelzes_szam', jsonb_array_length(v_jelzesek),
    'jelzesek', v_jelzesek
  );
end;
$function$;

-- ===========================================================================
-- 4. Teljes elemzés nézetként
-- ===========================================================================

create or replace view public.aic_elteres_jelzesek as
select
  m.module_code,
  m.title,
  m.module_kind,
  (e->>'elemezheto')::boolean as elemezheto,
  coalesce((e->>'jelzes_szam')::integer, 0) as jelzes_szam,
  e->>'hivatkozott_cikkek' as hivatkozott_cikkek,
  e->'jelzesek' as jelzesek,
  coalesce(e->>'ok', '') as megjegyzes,
  (select count(distinct g.ai_system_id)
     from public.aic_generated_policies g, jsonb_array_elements(g.document_sections) x
    where x->>'title' = m.title) as hany_szabalyzatban
from public.aic_policy_modules m
cross join lateral public.aic_modul_elteres_elemzes(m.id) e
where m.lifecycle_status in ('approved', 'under_review')
order by
  coalesce((e->>'jelzes_szam')::integer, 0) desc,
  (select count(distinct g.ai_system_id)
     from public.aic_generated_policies g, jsonb_array_elements(g.document_sections) x
    where x->>'title' = m.title) desc,
  m.title;

comment on view public.aic_elteres_jelzesek is
  'Determinisztikus eltéréselemzés a fejezetszöveg és a hivatkozott jogszabály között. A jelzés nem hiba, hanem figyelemterelés a felülvizsgálónak.';

grant select on public.aic_elteres_jelzesek to authenticated;

revoke all on function public.aic_szam_ertek(text) from public, anon;
revoke all on function public.aic_kinyert_idotartamok(text) from public, anon;
revoke all on function public.aic_kinyert_cikkhivatkozasok(text) from public, anon;
revoke all on function public.aic_kinyert_mellekletek(text) from public, anon;
revoke all on function public.aic_modul_elteres_elemzes(uuid) from public, anon;

grant execute on function public.aic_szam_ertek(text) to authenticated;
grant execute on function public.aic_kinyert_idotartamok(text) to authenticated;
grant execute on function public.aic_kinyert_cikkhivatkozasok(text) to authenticated;
grant execute on function public.aic_kinyert_mellekletek(text) to authenticated;
grant execute on function public.aic_modul_elteres_elemzes(uuid) to authenticated;

commit;
