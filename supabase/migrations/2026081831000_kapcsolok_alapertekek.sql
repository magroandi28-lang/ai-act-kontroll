-- EnergiaAI Kontroll – kapcsolók: feltételes kérdezés, alapértékek az
-- eszköztípusoknál.
--
-- MIÉRT
-- A törvény sok kapcsolót ismer, de egy konkrét eszköznél a legtöbbjük eleve
-- kizárt. Egy ügyfélszolgálati chatbotnál nem kérdés, hogy gyűjt-e arcképet az
-- internetről. Ha mégis megkérdezzük, a felvitel bürokratikus lesz, és senki
-- nem fogja használni.
--
-- A MÉRCE
-- Egy eszköz felvitele legfeljebb nyolc-tíz valódi kérdés legyen. Minden
-- további kapcsoló vagy levezetett, vagy az eszköztípusból előre kitöltött.
--
-- HOL VANNAK AZ ALAPÉRTÉKEK
-- Nem itt. Az aic_system_type_templates.default_facts már erre való, és 13
-- eszköztípusnál működik is. Ezt a fájl kiegészíti, nem megkettőzi: az 5. cikk
-- tiltott gyakorlatait veszi fel alapértéknek azoknál a típusoknál, ahol
-- fogalmilag kizártak.
--
-- AMIT A KAPCSOLÓKATALÓGUS KAP
--   ask_only_if – a kérdés csak akkor kerül elő, ha ez a feltétel teljesül
--   always_ask  – minden eszköznél fel kell tenni, mert a típusból nem
--                 következik
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

alter table public.aic_trigger_catalogue
  add column if not exists ask_only_if jsonb,
  add column if not exists always_ask boolean not null default false;

comment on column public.aic_trigger_catalogue.ask_only_if is
  'Feltétel, amely mellett a kérdés egyáltalán előkerül. Szerkezete azonos a szabályok feltételeivel.';
comment on column public.aic_trigger_catalogue.always_ask is
  'Igaz, ha a kérdést minden eszköznél fel kell tenni, mert az eszköztípusból nem következik.';

-- ---------------------------------------------------------------------------
-- 1. Az 5. cikk tiltott gyakorlatai alapból nemlegesek azoknál a típusoknál,
--    ahol fogalmilag kizártak.
--
--    Ez nem azt jelenti, hogy nem lehetnek igazak. Azt jelenti, hogy nem
--    kérdezzük meg alapból, és a szabályzat nemleges nyilatkozatként
--    tartalmazza. A felvivő a haladó beállításoknál bármikor átállíthatja.
--
--    A képfeldolgozó és a csalásértékelő típus szándékosan kimarad: ott ezek
--    valós kérdések.
-- ---------------------------------------------------------------------------
update public.aic_system_type_templates t
set default_facts = t.default_facts || jsonb_build_object(
      'uses_subliminal_manipulative_or_deceptive_techniques', false,
      'exploits_age_disability_or_social_economic_vulnerability', false,
      'evaluates_persons_over_time_from_social_behaviour_or_personal_traits', false,
      'predicts_individual_criminal_offence_risk', false,
      'creates_or_expands_facial_recognition_database', false,
      'uses_untargeted_internet_or_cctv_face_scraping', false,
      'biometric_categorisation_of_individuals', false,
      'uses_realtime_remote_biometric_identification', false),
    updated_at = now()
where t.type_code in ('CUSTOMER_CHATBOT','INTERNAL_ASSISTANT','DOCUMENT_PROCESSING_AI',
                      'ENERGY_FORECAST_AI','ENERGY_ANOMALY_AI','WORKFLOW_AUTOMATION_AI',
                      'GENERATIVE_CONTENT_AI','RECRUITMENT_AI','EMPLOYEE_MONITORING_AI',
                      'CRITICAL_INFRASTRUCTURE_CONTROL_AI');

-- A képfeldolgozó és biometrikus típusnál a biometrikus kapcsolók valódi
-- kérdések, ezért csak a nyilvánvalóan kizártakat töltjük ki.
update public.aic_system_type_templates t
set default_facts = t.default_facts || jsonb_build_object(
      'uses_subliminal_manipulative_or_deceptive_techniques', false,
      'exploits_age_disability_or_social_economic_vulnerability', false,
      'predicts_individual_criminal_offence_risk', false),
    updated_at = now()
where t.type_code in ('COMPUTER_VISION_AI','FRAUD_RISK_AI');

-- ---------------------------------------------------------------------------
-- 2. Feltételes kérdezés.
-- ---------------------------------------------------------------------------

-- Az érzelemfelismerést minden eszköznél meg kell kérdezni: hangalapú
-- ügyfélszolgálati rendszerekben ma már valós funkció, és nem következik a
-- típusból.
update public.aic_trigger_catalogue
set always_ask = true,
    question_hu = 'Következtet a rendszer a felhasználó érzelmi állapotára, hangulatára vagy elégedettségére?',
    updated_at = now()
where trigger_key = 'EMOTION_RECOGNITION';

-- A munkahelyi vagy oktatási környezet csak akkor számít, ha van
-- érzelemfelismerés. Enélkül az 5. cikk szempontjából nincs jelentősége.
update public.aic_trigger_catalogue
set ask_only_if = '{"all":[{"fact":"infers_natural_person_emotions","operator":"is_true"}]}'::jsonb,
    updated_at = now()
where trigger_key = 'CONTEXT_WORKPLACE_EDUCATION';

-- A jogi minősítések soha nem kérdések.
update public.aic_trigger_catalogue
set question_hu = null, always_ask = false, updated_at = now()
where category = 'jogi_minosites';

-- A többi tiltott gyakorlat kérdése megmarad a katalógusban, de csak akkor
-- kerül elő, ha az eszköztípus nem töltötte ki előre.
update public.aic_trigger_catalogue
set always_ask = false, updated_at = now()
where category = 'funkcio' and trigger_key <> 'EMOTION_RECOGNITION';

-- ---------------------------------------------------------------------------
-- Ellenőrzés: hány kérdés marad egy ügyfélszolgálati chatbotnál az 5. cikkből.
-- ---------------------------------------------------------------------------
select c.trigger_key, c.name_hu, c.category,
       case
         when c.category <> 'funkcio' then 'nem kérdés'
         when c.always_ask then 'MEGKÉRDEZZÜK'
         when exists (
           select 1 from public.aic_system_type_templates t, lateral unnest(c.legacy_fact_keys) k
           where t.type_code = 'CUSTOMER_CHATBOT' and t.default_facts ? k)
         then 'előre kitöltve'
         else 'megkérdezzük'
       end as chatbotnal
from public.aic_trigger_catalogue c
where c.article_number = '5'
order by c.display_order;

commit;
