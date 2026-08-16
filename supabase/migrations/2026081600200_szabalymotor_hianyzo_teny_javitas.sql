-- EnergiaAI Kontroll – a szabálymotor hiányzó tény kezelésének javítása.
--
-- A HIBA
-- Az aic_fact_condition_matches SQL-ben háromértékű logikát használt: ha egy
-- tény hiányzott a rendszer adataiból, a feltétel NULL-t adott vissza.
-- Az aic_applicability_matches "all" ága így nézett ki:
--
--     not exists (select 1 from ... where not aic_fact_condition_matches(...))
--
-- Hiányzó ténynél a belső kifejezés NULL lett, a NULL pedig nem TRUE, ezért a
-- WHERE nem választotta ki a sort. A "not exists" így igazat adott, vagyis a
-- modul bekerült a szabályzatba. Következmény: minden olyan szabály beépült,
-- amelynek feltételét az alkalmazás soha nem kérdezte meg.
--
-- Mérés a javítás előtt:
--   - 35 modul illeszkedett egy teljesen üres profilra
--   - egy funkció nélküli belső asszisztens 43 jogi követelményt kapott
--   - egy energetikai chatbot szabályzatában szerepelt az uniós intézményekre,
--     a honvédelmi kizárásra és a GPAI-szolgáltatókra vonatkozó fejezet
--
-- A JAVÍTÁS
-- Ismeretlen tény esetén a feltétel nem teljesül. A kifejezést coalesce(..., false)
-- zárja le, így NULL nem juthat ki a függvényből.
--
-- Az irány szándékosan óvatos:
--   - is_true / is_false / eq / neq ismeretlen ténynél hamis, tehát a szabály
--     nem kerül be. Inkább maradjon ki egy fejezet, mint hogy a szakember elé
--     olyan követelmény kerüljön, ami nem az adott rendszerre vonatkozik.
--   - exists / not_exists továbbra is a tény meglétét vizsgálja, nem az értékét.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

create or replace function public.aic_fact_condition_matches(
  p_profile jsonb, p_condition jsonb
) returns boolean
language sql
immutable
parallel safe
set search_path = public, pg_temp
as $function$
  select coalesce(
    case
      -- A szervezeti szerepkörből származtatott tények. Ezeket nem kérdezzük
      -- külön, a rendszer organisation_role mezőjéből következnek.
      when p_condition->>'fact' = 'organisation_is_provider'
        and p_condition->>'operator' = 'is_true'
        then coalesce(p_profile->>'organisation_role','') = 'provider'
      when p_condition->>'fact' = 'is_provider_or_importer'
        and p_condition->>'operator' = 'is_true'
        then coalesce(p_profile->>'organisation_role','') in ('provider','importer')
      when p_condition->>'fact' = 'uses_ai_system_under_own_authority'
        and p_condition->>'operator' = 'is_true'
        then coalesce(p_profile->>'organisation_role','') = 'deployer'
      when p_condition->>'fact' = 'develops_or_has_ai_system_developed'
        and p_condition->>'operator' = 'is_true'
        then coalesce(p_profile->>'organisation_role','') = 'provider'
      when p_condition->>'fact' = 'makes_ai_system_available_on_eu_market'
        and p_condition->>'operator' = 'is_true'
        then coalesce(p_profile->>'organisation_role','') in ('provider','importer','distributor')

      else case p_condition->>'operator'
        when 'eq' then p_profile->(p_condition->>'fact') = p_condition->'value'
        when 'neq' then p_profile->(p_condition->>'fact') <> p_condition->'value'
        when 'exists' then p_profile ? (p_condition->>'fact')
        when 'not_exists' then not (p_profile ? (p_condition->>'fact'))
        when 'is_true' then p_profile->(p_condition->>'fact') = 'true'::jsonb
        when 'is_false' then p_profile->(p_condition->>'fact') = 'false'::jsonb
        when 'in' then (p_condition->'value') @> jsonb_build_array(p_profile->(p_condition->>'fact'))
        when 'contains' then (p_profile->(p_condition->>'fact')) @> (p_condition->'value')
        else false
      end
    end,
    false
  );
$function$;

comment on function public.aic_fact_condition_matches(jsonb, jsonb) is
  'Egy tényfeltétel kiértékelése. Ismeretlen tény esetén hamis: a szabály nem kerül a szabályzatba.';

commit;
