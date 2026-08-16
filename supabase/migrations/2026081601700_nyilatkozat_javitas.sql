-- EnergiaAI Kontroll – a nyilatkozat-függvény javítása.
--
-- HIBA
-- Ha a "nem alkalmaz tiltott gyakorlatot" nyilatkozat hiányzott, a függvény
-- mind a három tiltott gyakorlat tényét igazra állította. Ez azt állította
-- volna a dokumentumban, hogy a szervezet manipulatív technikát alkalmaz,
-- sérülékenységet használ ki ÉS társadalmi pontozást végez.
--
-- A nyilatkozat hiánya viszont csak annyit jelent, hogy nem tudta megerősíteni.
--
-- JAVÍTÁS
-- A három konkrét tény hamis marad. Csak az article_5_prohibition_relevant
-- kapcsol be, ami a figyelmeztető fejezetet emeli a szabályzatba.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.

begin;

create or replace function public.aic_nyilatkozat_tenyek(
  p_eu_hasznalat boolean,
  p_mi_egyertelmu boolean,
  p_nincs_tiltott_gyakorlat boolean,
  p_szabalyozott_termekbe_epul boolean default false
) returns jsonb
language sql
immutable
set search_path = public, pg_temp
as $function$
  select jsonb_build_object(
    'eu_scope_connection_exists', coalesce(p_eu_hasznalat, true),
    'ai_interaction_obvious', coalesce(p_mi_egyertelmu, true),

    -- A konkrét tiltott gyakorlatok tényét nem állítjuk igazra pusztán azért,
    -- mert a nyilatkozat hiányzik. Azt a szervezet nem jelentette ki magáról.
    'uses_subliminal_manipulative_or_deceptive_techniques', false,
    'exploits_age_disability_or_social_economic_vulnerability', false,
    'evaluates_persons_over_time_from_social_behaviour_or_personal_traits', false,

    -- Ez viszont bekapcsol: nincs megerősítés, ezért jogi vizsgálat kell.
    'article_5_prohibition_relevant', not coalesce(p_nincs_tiltott_gyakorlat, true),

    'annex_i_product_or_safety_component', coalesce(p_szabalyozott_termekbe_epul, false)
  )
  || case when coalesce(p_szabalyozott_termekbe_epul, false)
          then '{"system_is_high_risk": true}'::jsonb
          else '{}'::jsonb end;
$function$;

-- A meglévő rendszereknél is helyreállítjuk, ha a korábbi futás
-- tévesen igazra állította volna a három tényt.
update public.aic_system_facts f
set facts = f.facts || jsonb_build_object(
      'uses_subliminal_manipulative_or_deceptive_techniques', false,
      'exploits_age_disability_or_social_economic_vulnerability', false,
      'evaluates_persons_over_time_from_social_behaviour_or_personal_traits', false
    ),
    updated_at = now()
where coalesce((f.facts->>'uses_subliminal_manipulative_or_deceptive_techniques')::boolean, false)
   or coalesce((f.facts->>'exploits_age_disability_or_social_economic_vulnerability')::boolean, false)
   or coalesce((f.facts->>'evaluates_persons_over_time_from_social_behaviour_or_personal_traits')::boolean, false);

commit;
