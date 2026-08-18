-- EnergiaAI Kontroll – a szabályok leválasztása az eszköztípusról.
--
-- A HIBA
-- Huszonnégy modul a CUSTOMER_CHATBOT eszköztípushoz van kötve, köztük az
-- összes energetikai szabály. Emiatt egy hangalapú ügyfélszolgálati rendszer,
-- egy e-mailt megválaszoló MI vagy egy önkiszolgáló portál egyetlen
-- energetikai szabályt sem kapna meg – pedig ugyanaz a kötelezettség
-- vonatkozik rájuk.
--
-- A jog nem az eszköz típusához köti a kötelezettséget, hanem ahhoz, hogy mit
-- csinál. A 273/2007. 26. §-a nem chatbotokról szól, hanem a kereskedőváltásról.
--
-- A JAVÍTÁS KÉT LÉPÉSBEN
--   1. Ahol van funkciófeltétel is, ott az eszköztípus-korlát fölösleges:
--      töröljük. Tizenhat modul.
--   2. Ahol nincs, ott előbb meg kell adni, mihez kötődik a szabály, és csak
--      utána törölhető a korlát. Nyolc modul.
--
-- MIÉRT NEM VESZÉLYES
-- A funkciófeltételek szigorúbbak, mint az eszköztípus. Egy chatbot, amely nem
-- kezel kikapcsolási ügyet, eddig sem kapta meg a kikapcsolási szabályt – a
-- feltétel ott is szűrt. A korlát törlése csak azt engedi meg, hogy más
-- típusú eszköz is megkapja, ha ugyanazt csinálja.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. A nyolc modul funkcióhoz kötése.
--
-- Indoklás modulonként:
--   AI_ACT_CLASSIFICATION – minden MI-rendszert be kell sorolni
--   ROLES_RESPONSIBILITIES – minden MI-rendszernél kell felelős
--   PURPOSE_SCOPE – minden MI-rendszernek van célja és határa
--   MONITORING_REVIEW – minden MI-rendszert figyelni kell
--   HUMAN_HANDOFF – csak ott, ahol a rendszer emberrel kommunikál
--   RESPONSE_ACCURACY – ugyanígy: a válasz pontossága akkor kérdés, ha válaszol
--   SOURCE_GOVERNANCE – ugyanígy: a tudásforrás akkor kérdés, ha tájékoztat
--   VENDOR_CHANGE – csak ott, ahol külső szolgáltatót használnak
-- ---------------------------------------------------------------------------
update public.aic_policy_modules
set applicability = applicability || '{"all":[{"fact":"is_ai_system","operator":"is_true"}]}'::jsonb,
    version = version + 1, updated_at = now()
where module_code in ('CHATBOT_AI_ACT_CLASSIFICATION','CHATBOT_ROLES_RESPONSIBILITIES',
                      'CHATBOT_PURPOSE_SCOPE','CHATBOT_MONITORING_REVIEW')
  and not (applicability ? 'all');

update public.aic_policy_modules
set applicability = applicability || '{"all":[{"fact":"interaction_with_natural_person","operator":"is_true"}]}'::jsonb,
    version = version + 1, updated_at = now()
where module_code in ('CHATBOT_HUMAN_HANDOFF','CHATBOT_RESPONSE_ACCURACY','CHATBOT_SOURCE_GOVERNANCE')
  and not (applicability ? 'all');

update public.aic_policy_modules
set applicability = applicability || '{"all":[{"fact":"uses_external_ai_provider","operator":"is_true"}]}'::jsonb,
    version = version + 1, updated_at = now()
where module_code = 'CHATBOT_VENDOR_CHANGE'
  and not (applicability ? 'all');

-- ---------------------------------------------------------------------------
-- 2. Az eszköztípus-korlát törlése mind a huszonnégynél.
-- ---------------------------------------------------------------------------
update public.aic_policy_modules
set applicability = applicability - 'system_type_codes',
    version = version + 1, updated_at = now()
where applicability ? 'system_type_codes';

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select count(*) as eszkoztipushoz_kotott_modul
from public.aic_policy_modules where applicability ? 'system_type_codes';

select count(*) as feltetel_nelkuli_modul
from public.aic_policy_modules
where not (applicability ? 'required_facts') and not (applicability ? 'all')
  and not (applicability ? 'any') and not (applicability ? 'industry_codes');

select s.name as rendszer,
       (select count(*) from public.aic_policy_modules m
        where public.aic_applicability_matches(m.applicability, public.aic_system_profile(s.id))
          and m.lifecycle_status in ('approved','under_review')) as illeszkedo_szabaly
from public.aic_ai_systems s where s.inventory_status='active'
order by 2 desc limit 5;

commit;
