-- EnergiaAI Kontroll – a cikkszám-feloldó javítása.
--
-- HIBA
-- Az array_agg(distinct x order by x::integer) alak nem megengedett:
-- a Postgres megköveteli, hogy a rendezés kifejezése szerepeljen a
-- DISTINCT argumentumlistájában. Ezért a függvény hibára futott.
--
-- JAVÍTÁS
-- Előbb egyedivé tesszük az értékeket, utána rendezünk.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

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

  -- Elobb egyedive tesszuk, utana rendezunk: a Postgres nem engedi
  -- az array_agg(distinct ... order by ...) alakot.
  return (
    select coalesce(array_agg(x order by x::integer), '{}'::text[])
    from (select distinct y as x from unnest(v_eredmeny) y) t
  );
end;
$function$;

grant execute on function public.aic_cikkszamok(text) to authenticated;

commit;
