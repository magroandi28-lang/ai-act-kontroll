-- EnergiaAI Kontroll – kapcsolók felismerése dokumentumból.
--
-- MIÉRT
-- Aki felvisz egy MI-eszközt, arról már van leírása: README, specifikáció,
-- forráskód, függőséglista. Ne kérdezzük meg tőle azt, ami ott áll. Töltse
-- fel, és a rendszer tegyen javaslatot a kapcsolókra.
--
-- MIÉRT NEM NYELVI MODELL
-- Mintaillesztéssel is megbízhatóan felismerhető a kapcsolók nagy része, és
-- így megmagyarázható marad: minden javaslat mellé odatehető, melyik sorból
-- következett. Nyelvi modellnél ez nem garantálható.
--
-- A minták adatként élnek, nem kódban. A szkript buta: keres, és visszaadja a
-- találatot a forrásszöveggel. A tudás itt van, ezért bővíthető anélkül, hogy
-- kódot kellene írni.
--
-- AMIT NEM SZABAD RÁBÍZNI
-- A jogi minősítéseket. Hogy a 6. cikk (3) bekezdés szerinti mentesség
-- fennáll-e, vagy hogy a kár jelentős-e, azt szöveg nem dönti el. Ezért a
-- jogi_minosites kategóriájú kapcsolók nem kapnak mintát.
--
-- MŰKÖDÉS
--   1. A felvivő feltölt egy dokumentumot vagy forrásfájlt.
--   2. A szkript végigfut a mintákon, és javaslatot ad – a talált sorral.
--   3. A felvivő megerősíti vagy elveti. A döntés forrása rögzül.
-- Semmi nem áll be magától.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

alter table public.aic_trigger_catalogue
  add column if not exists detection_patterns jsonb not null default '[]'::jsonb,
  add column if not exists detection_note text;

comment on column public.aic_trigger_catalogue.detection_patterns is
  'Minták, amelyek a kapcsolóra utalnak. Elemenként: {"minta":"...","tipus":"szoveg|fuggoseg|oszlopnev","suly":"eros|gyenge"}. A gyenge találat csak megerősítést kér, az erős javaslatot tesz.';
comment on column public.aic_trigger_catalogue.detection_note is
  'Mire figyeljen az ember a javaslat elfogadásakor.';

-- ---------------------------------------------------------------------------
-- Biometria és érzelemfelismerés.
-- A függőséglista a legerősebb jel: egy arcfelismerő csomag nem kerül
-- véletlenül a projektbe.
-- ---------------------------------------------------------------------------
update public.aic_trigger_catalogue set detection_patterns = '[
  {"minta":"arcfelismer","tipus":"szoveg","suly":"eros"},
  {"minta":"face recognition","tipus":"szoveg","suly":"eros"},
  {"minta":"biometri","tipus":"szoveg","suly":"gyenge"},
  {"minta":"face_recognition","tipus":"fuggoseg","suly":"eros"},
  {"minta":"deepface","tipus":"fuggoseg","suly":"eros"},
  {"minta":"insightface","tipus":"fuggoseg","suly":"eros"},
  {"minta":"opencv","tipus":"fuggoseg","suly":"gyenge"}
]'::jsonb,
detection_note = 'Az opencv önmagában nem jelent arcfelismerést: képfeldolgozásra általánosan használt. Ellenőrizni kell, mire használják.',
updated_at = now()
where trigger_key = 'REALTIME_REMOTE_BIOMETRIC_ID';

update public.aic_trigger_catalogue set detection_patterns = '[
  {"minta":"érzelem","tipus":"szoveg","suly":"eros"},
  {"minta":"hangulat","tipus":"szoveg","suly":"gyenge"},
  {"minta":"sentiment","tipus":"szoveg","suly":"eros"},
  {"minta":"emotion","tipus":"szoveg","suly":"eros"},
  {"minta":"elégedettség","tipus":"szoveg","suly":"gyenge"},
  {"minta":"sentiment-analysis","tipus":"fuggoseg","suly":"eros"},
  {"minta":"text2emotion","tipus":"fuggoseg","suly":"eros"}
]'::jsonb,
detection_note = 'Az ügyfél-elégedettség mérése nem feltétlenül érzelemfelismerés. Ha a rendszer a beszélgetésből következtet érzelmi állapotra, akkor igen.',
updated_at = now()
where trigger_key = 'EMOTION_RECOGNITION';

update public.aic_trigger_catalogue set detection_patterns = '[
  {"minta":"kategorizál","tipus":"szoveg","suly":"gyenge"},
  {"minta":"biometric categor","tipus":"szoveg","suly":"eros"},
  {"minta":"etnik","tipus":"szoveg","suly":"gyenge"},
  {"minta":"nem, kor becsl","tipus":"szoveg","suly":"gyenge"}
]'::jsonb,
updated_at = now()
where trigger_key = 'BIOMETRIC_CATEGORISATION';

-- ---------------------------------------------------------------------------
-- Profilalkotás és döntéstámogatás.
-- ---------------------------------------------------------------------------
update public.aic_trigger_catalogue set detection_patterns = '[
  {"minta":"profilalkot","tipus":"szoveg","suly":"eros"},
  {"minta":"profiling","tipus":"szoveg","suly":"eros"},
  {"minta":"scoring","tipus":"szoveg","suly":"eros"},
  {"minta":"pontszám","tipus":"szoveg","suly":"gyenge"},
  {"minta":"rangsor","tipus":"szoveg","suly":"gyenge"},
  {"minta":"ranking","tipus":"szoveg","suly":"gyenge"},
  {"minta":"score","tipus":"oszlopnev","suly":"gyenge"},
  {"minta":"risk_score","tipus":"oszlopnev","suly":"eros"}
]'::jsonb,
detection_note = 'A rangsorolás önmagában nem profilalkotás. Akkor az, ha természetes személyre vonatkozik és jellemzőiből következtet.',
updated_at = now()
where trigger_key = 'PROFILES_NATURAL_PERSONS';

-- ---------------------------------------------------------------------------
-- Használati területek.
-- ---------------------------------------------------------------------------
update public.aic_trigger_catalogue set detection_patterns = '[
  {"minta":"önéletrajz","tipus":"szoveg","suly":"eros"},
  {"minta":"toborz","tipus":"szoveg","suly":"eros"},
  {"minta":"jelölt","tipus":"szoveg","suly":"gyenge"},
  {"minta":"recruitment","tipus":"szoveg","suly":"eros"},
  {"minta":"candidate","tipus":"szoveg","suly":"gyenge"},
  {"minta":"applicant","tipus":"oszlopnev","suly":"eros"}
]'::jsonb,
updated_at = now()
where trigger_key = 'USE_EMPLOYMENT';

update public.aic_trigger_catalogue set detection_patterns = '[
  {"minta":"hitelkép","tipus":"szoveg","suly":"eros"},
  {"minta":"creditworthiness","tipus":"szoveg","suly":"eros"},
  {"minta":"biztosítási díj","tipus":"szoveg","suly":"eros"},
  {"minta":"szociális ellátás","tipus":"szoveg","suly":"eros"},
  {"minta":"segélyhív","tipus":"szoveg","suly":"eros"}
]'::jsonb,
updated_at = now()
where trigger_key = 'USE_ESSENTIAL_SERVICES';

update public.aic_trigger_catalogue set detection_patterns = '[
  {"minta":"scada","tipus":"szoveg","suly":"eros"},
  {"minta":"vezérl","tipus":"szoveg","suly":"gyenge"},
  {"minta":"hálózatirányít","tipus":"szoveg","suly":"eros"},
  {"minta":"kritikus infrastruktúra","tipus":"szoveg","suly":"eros"},
  {"minta":"modbus","tipus":"fuggoseg","suly":"eros"}
]'::jsonb,
updated_at = now()
where trigger_key = 'USE_CRITICAL_INFRASTRUCTURE';

-- ---------------------------------------------------------------------------
-- Termékbe épített MI.
-- ---------------------------------------------------------------------------
update public.aic_trigger_catalogue set detection_patterns = '[
  {"minta":"beágyazott","tipus":"szoveg","suly":"gyenge"},
  {"minta":"embedded","tipus":"szoveg","suly":"gyenge"},
  {"minta":"gépbe épít","tipus":"szoveg","suly":"eros"},
  {"minta":"orvostechnikai","tipus":"szoveg","suly":"eros"},
  {"minta":"CE-jelöl","tipus":"szoveg","suly":"eros"},
  {"minta":"biztonsági alkotóelem","tipus":"szoveg","suly":"eros"}
]'::jsonb,
updated_at = now()
where trigger_key = 'ANNEX_I_PRODUCT';

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select category as kategoria,
       count(*) as kapcsolo,
       count(*) filter (where jsonb_array_length(detection_patterns) > 0) as van_mintaja
from public.aic_trigger_catalogue
group by category order by 2 desc;

commit;
