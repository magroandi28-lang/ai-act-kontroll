-- EnergiaAI Kontroll – összekötés: a ténylap kiegészítése a kapcsolókból.
--
-- A PROBLÉMA
-- A szabályok 112 különböző feltételre hivatkoznak, a felviteli kérdőív 30-at
-- kérdez, és a kettő elnevezése nem egyezik. Emiatt szabályok tucatjai soha nem
-- lépnek működésbe – köztük az a 31, amely a nagy kockázatú besoroláson múlik,
-- és az a 11, amely az is_ai_system tényen.
--
-- A MEGOLDÁS HELYE
-- Nem a szabályokat írjuk át, hanem a ténylapot egészítjük ki. Az
-- aic_system_profile az egyetlen hely, ahonnan a motor a tényeket kapja, tehát
-- itt kell teljessé tenni. Így a 134 szabály feltételeihez nem kell hozzányúlni,
-- és a változtatás visszafordítható.
--
-- MI TÖRTÉNIK A TÉNYLAPPAL
--   1. Alap: a tárolt válaszok, az eszköztípus, az iparág, a szerepkör.
--   2. Triviális tények: aki szerepel a nyilvántartásban, az MI-rendszer;
--      a nevünkben eljáró személyek használják; a nyilvántartás létezik.
--   3. Szerepkör-tények a megadott organisation_role értékéből.
--   4. Névfeloldás: a kapcsolókatalógus legacy_fact_keys mezője alapján a régi
--      és az új elnevezés kölcsönösen kitölti egymást. Ettől mindkét névtér
--      működik, és nem kell egyszerre átállítani mindent.
--   5. Nagy kockázatú besorolás kiszámítása az aic_nagy_kockazatu függvénnyel.
--   6. Még egy névfeloldás, hogy a számolt besorolás is mindkét néven meglegyen.
--
-- AMIT NEM CSINÁL
-- Nem talál ki tényt. Ha valamire nincs válasz, az hiányzik marad, és a motor
-- – helyesen – nem teljesültnek veszi. A levezetés csak abból dolgozik, ami
-- ténylegesen meg van adva.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- Névfeloldás: régi ténykulcs és kapcsoló kölcsönös kitöltése.
-- ---------------------------------------------------------------------------
create or replace function public.aic_tenylap_nevfeloldas(p_profile jsonb)
returns jsonb
language sql stable
set search_path = public, pg_temp
as $function$
  with regibol as (
    -- ha bármelyik régi kulcs igaz, a kapcsoló is igaz
    select jsonb_object_agg(c.trigger_key, true) as j
    from public.aic_trigger_catalogue c
    where exists (
      select 1 from unnest(c.legacy_fact_keys) k
      where (p_profile ->> k)::boolean is true
    )
  ),
  ujbol as (
    -- ha a kapcsoló igaz, minden hozzá tartozó régi kulcs is igaz
    select jsonb_object_agg(k, true) as j
    from public.aic_trigger_catalogue c, unnest(c.legacy_fact_keys) k
    where (p_profile ->> c.trigger_key)::boolean is true
  )
  select coalesce((select j from regibol), '{}'::jsonb)
      || coalesce((select j from ujbol), '{}'::jsonb)
      || p_profile;
$function$;

comment on function public.aic_tenylap_nevfeloldas(jsonb) is
  'A régi ténykulcsok és az új kapcsolók kölcsönösen kitöltik egymást. A megadott értékek felülírják a levezetetteket.';

-- ---------------------------------------------------------------------------
-- A ténylap előállítása.
-- ---------------------------------------------------------------------------
create or replace function public.aic_system_profile(p_ai_system_id uuid)
returns jsonb
language plpgsql stable
set search_path = public, pg_temp
as $function$
declare
  v_alap jsonb;
  v_szerep text;
  v_teljes jsonb;
begin
  select coalesce(f.facts, '{}'::jsonb)
       || jsonb_build_object(
            'system_type_code', t.type_code,
            'industry', coalesce(s.industry_code, o.industry, 'unknown'),
            'organisation_role', coalesce(s.organisation_role, 'unknown'),
            'lifecycle_stage', s.lifecycle_stage
          )
  into v_alap
  from public.aic_ai_systems s
  join public.aic_organisations o on o.id = s.organisation_id
  join public.aic_system_type_templates t on t.id = s.system_type_id
  left join public.aic_system_facts f on f.system_id = s.id
  where s.id = p_ai_system_id and s.inventory_status = 'active';

  if v_alap is null then
    return null;
  end if;

  v_szerep := v_alap ->> 'organisation_role';

  -- Triviális tények. Aki szerepel az MI-nyilvántartásban, az MI-rendszer;
  -- ha valakiről kiderül, hogy nem az, a rendszert törölni kell, nem a tényt
  -- átállítani.
  v_teljes := jsonb_build_object(
      'is_ai_system', true,
      'IS_AI_SYSTEM', true,
      'persons_operate_or_use_ai_on_behalf', true,
      'ai_compliance_database_in_use', true,
      'use_is_purely_personal_non_professional', false,
      'purpose_exclusively_military_defence_or_national_security', false
    )
    -- Szerepkör-tények a megadott értékből.
    || jsonb_build_object(
      'organisation_is_provider', v_szerep in ('provider','product_manufacturer'),
      'uses_ai_system_under_own_authority', v_szerep = 'deployer',
      'is_provider_or_importer', v_szerep in ('provider','importer','product_manufacturer'),
      'develops_or_has_ai_system_developed', v_szerep in ('provider','product_manufacturer'),
      'places_on_market_or_puts_into_service_under_own_name', v_szerep in ('provider','product_manufacturer'),
      'makes_ai_system_available_on_eu_market', v_szerep in ('provider','importer','distributor','product_manufacturer'),
      'in_ai_supply_chain', v_szerep <> 'unknown'
    )
    -- Az életciklusból.
    || jsonb_build_object(
      'before_market_or_putting_into_service',
        coalesce(v_alap ->> 'lifecycle_stage', '') in ('planning','development','testing')
    )
    || v_alap;

  -- Első névfeloldás: a megadott válaszok mindkét néven meglegyenek.
  v_teljes := public.aic_tenylap_nevfeloldas(v_teljes);

  -- Nagy kockázatú besorolás. A megadott érték elsőbbséget élvez: ha valaki
  -- kifejezetten beállította, azt nem írjuk felül.
  v_teljes := public.aic_nagy_kockazatu(v_teljes) || v_teljes;

  -- Második névfeloldás, hogy a számolt besorolás is mindkét néven meglegyen.
  v_teljes := public.aic_tenylap_nevfeloldas(v_teljes);

  return v_teljes;
end;
$function$;

comment on function public.aic_system_profile(uuid) is
  'A rendszer teljes ténylapja: tárolt válaszok, triviális és szerepkörből levezetett tények, névfeloldás a kapcsolókatalógus alapján, és a nagy kockázatú besorolás.';

-- ---------------------------------------------------------------------------
-- Ellenőrzés: hány szabály illeszkedik a meglévő rendszerekre a változás után.
-- ---------------------------------------------------------------------------
select s.name as rendszer,
       t.type_code as tipus,
       (select count(*) from public.aic_policy_modules m
        where public.aic_applicability_matches(m.applicability, public.aic_system_profile(s.id))
          and m.lifecycle_status in ('approved','under_review')) as illeszkedo_szabaly,
       (public.aic_system_profile(s.id) ->> 'system_is_high_risk')::boolean as nagy_kockazatu
from public.aic_ai_systems s
join public.aic_system_type_templates t on t.id = s.system_type_id
where s.inventory_status = 'active'
order by 3 desc
limit 15;

commit;
