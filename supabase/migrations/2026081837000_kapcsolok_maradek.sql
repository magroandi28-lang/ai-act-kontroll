-- EnergiaAI Kontroll – a maradék 25 kapcsoló.
--
-- MIÉRT MARADTAK KI
-- Az eddigi hét fájl a jogszabályok szerkezetét követte: 5., 6., 50. cikk,
-- GDPR, szerepkörök. Ez a huszonöt máshonnan jön – részben triviális, részben
-- működés közbeni esemény, részben ügyfélszolgálati részletfunkció.
--
-- A LEGFONTOSABB: is_ai_system
-- Tizenegy szabály függ tőle, és soha nem áll be. Pedig nem is kérdés: ha
-- valamit felvisznek az MI-nyilvántartásba, az MI-rendszer. Ezért nemcsak
-- kapcsolóként vesszük fel, hanem levezetettként, alapértelmezés szerint
-- igazként.
--
-- ESEMÉNYEK, NEM TULAJDONSÁGOK
-- Hét kapcsoló olyat ír le, ami működés közben történik: gyanú merül fel,
-- hatósági eljárás indul, hiányos tájékoztatás derül ki. Ezek nem a
-- felvitelkor derülnek ki, és nem is szabad ott kérdezni őket. Az ezekre
-- épülő szabályok mindig bekerülnek a szabályzatba, mert arról szólnak, mit
-- kell tenni, ha bekövetkeznek.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. Levezetett alapok.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   derived, derivation_note, display_order, legacy_fact_keys)
select v.kulcs, v.nev, v.leiras, v.kategoria, s.id, v.cikk, true, v.megjegyzes, v.sorrend, v.regi
from public.aic_legal_sources s,
(values
 ('IS_AI_SYSTEM',
  'MI-rendszer',
  'A nyilvántartásba felvett eszköz az MI-rendelet szerinti MI-rendszer.',
  'besorolas', '3', 1,
  'Nem kérdés: ha egy eszközt felvisznek az MI-nyilvántartásba, akkor MI-rendszer. Alapértelmezés szerint igaz. Ha valakiről kiderül, hogy nem az, a rendszert törölni kell a nyilvántartásból, nem a tényt átállítani.',
  array['is_ai_system']),

 ('OPERATES_ON_BEHALF',
  'Nevünkben eljáró személyek használják',
  'A rendszert a szervezet nevében eljáró személyek működtetik vagy használják – munkavállalók, alvállalkozók.',
  'szerepkor', '4', 405,
  'Alapértelmezés szerint igaz minden vállalati eszköznél. A 4. cikk szerinti MI-ismereti kötelezettség ehhez kötődik.',
  array['persons_operate_or_use_ai_on_behalf']),

 ('OUT_OF_SCOPE_MILITARY',
  'Kizárólag honvédelmi vagy nemzetbiztonsági cél',
  'A rendszert kizárólag katonai, védelmi vagy nemzetbiztonsági célra használják. Ilyenkor az MI-rendelet nem alkalmazandó.',
  'besorolas', '2', 416,
  'A szervezet típusából és a rendeltetésből számolt. Vállalati eszköznél alapértelmezés szerint hamis.',
  array['purpose_exclusively_military_defence_or_national_security']),

 ('PRE_MARKET_PHASE',
  'Forgalomba hozatal vagy üzembe helyezés előtt',
  'A rendszer még nem került forgalomba vagy üzembe. Több kötelezettség ehhez az időponthoz kötött.',
  'besorolas', '16', 417,
  'Az életciklus-állapotból számolt: a lifecycle_stage mezőből.',
  array['before_market_or_putting_into_service','activity_is_research_testing_or_development']),

 ('WHISTLEBLOWER_RULES_APPLY',
  'Bejelentővédelmi szabályok hatálya',
  'A szervezetre a bejelentők védelméről szóló szabályok vonatkoznak.',
  'jogi_minosites', '87', 440,
  'A cégméretből számolt: ötven főnél több foglalkoztatottnál irányadó.',
  array['organisation_subject_to_whistleblower_rules']),

 ('AI_COMPLIANCE_DATABASE',
  'Megfelelőségi nyilvántartás használata',
  'A szervezet strukturált nyilvántartást vezet az MI-eszközeiről és azok megfelelőségéről.',
  'besorolas', '49', 441,
  'Ebben az alkalmazásban mindig igaz, hiszen maga az alkalmazás a nyilvántartás.',
  array['ai_compliance_database_in_use'])
) as v(kulcs,nev,leiras,kategoria,cikk,sorrend,megjegyzes,regi)
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- 2. Események: működés közben történnek.
--    Az ezekre épülő szabályok mindig bekerülnek a szabályzatba, mert azt
--    írják le, mit kell tenni, ha bekövetkeznek. Nem kérdés, nem alapérték.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   derivation_note, display_order, legacy_fact_keys)
select v.kulcs, v.nev, v.leiras, 'esemeny', s.id, v.cikk, v.megjegyzes, v.sorrend, v.regi
from public.aic_legal_sources s,
(values
 ('EVENT_PROHIBITED_PRACTICE_SUSPECTED',
  'Tiltott gyakorlat gyanúja',
  'Felmerül, hogy a rendszer az 5. cikk szerinti tiltott gyakorlatot valósít meg.',
  '5', 'Működés közbeni esemény. A rá épülő szabály azonnali jogi vizsgálatot és a használat felfüggesztését írja elő.', 600,
  array['article_5_prohibition_relevant','article_5_prohibition_breached_or_suspected']),

 ('EVENT_INFRINGEMENT_SUSPECTED',
  'Jogsértés gyanúja',
  'Felmerül, hogy a rendszer működése sérti az MI-rendeletet.',
  '87', 'Működés közbeni esemény. Bejelentési és kivizsgálási kötelezettséget indít.', 610,
  array['suspected_ai_act_infringement']),

 ('EVENT_OPERATOR_NONCOMPLIANCE',
  'Alkalmazói kötelezettség megsértése',
  'Kiderül, hogy a szervezet nem teljesítette valamely kötelezettségét.',
  '79', 'Működés közbeni esemény. Korrekciós intézkedést és hatósági együttműködést indít.', 620,
  array['operator_obligation_noncompliance_identified']),

 ('EVENT_GPAI_NONCOMPLIANCE',
  'Modellszolgáltató mulasztása',
  'Kiderül, hogy az általános célú modell szolgáltatója nem felel meg a kötelezettségeinek.',
  '53', 'Működés közbeni esemény. A szerződéses következmények és a szolgáltatóváltás mérlegelését indítja.', 630,
  array['gpai_provider_noncompliance_identified']),

 ('EVENT_MISLEADING_AUTHORITY_INFO',
  'Hiányos vagy félrevezető hatósági tájékoztatás',
  'Kiderül, hogy a hatóságnak adott tájékoztatás helytelen, hiányos vagy félrevezető volt.',
  '99', 'Működés közbeni esemény. Önálló bírságtényállás, ezért helyesbítési kötelezettséget indít.', 640,
  array['incorrect_incomplete_or_misleading_authority_information']),

 ('EVENT_SIGNIFICANT_RISK',
  'Jelentős kockázat felmerülése',
  'A rendszer jelentős kockázatot jelent az egészségre, a biztonságra vagy az alapvető jogokra.',
  '79', 'Működés közbeni esemény. A piacfelügyeleti eljárás és a korrekciós kötelezettség kiváltója.', 650,
  array['significant_risk_to_health_safety_or_fundamental_rights'])
) as v(kulcs,nev,leiras,cikk,megjegyzes,sorrend,regi)
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- 3. Ami hiányzott a korábbi kapcsolókból.
-- ---------------------------------------------------------------------------
update public.aic_trigger_catalogue
set legacy_fact_keys = legacy_fact_keys || array['annex_iii_biometrics_use_case'],
    updated_at = now()
where trigger_key = 'BIOMETRIC_CATEGORISATION'
  and not legacy_fact_keys @> array['annex_iii_biometrics_use_case'];

update public.aic_trigger_catalogue
set legacy_fact_keys = legacy_fact_keys || array['generates_nonconsensual_intimate_or_csam_content'],
    updated_at = now()
where trigger_key = 'GENERATES_SYNTHETIC_CONTENT'
  and not legacy_fact_keys @> array['generates_nonconsensual_intimate_or_csam_content'];

update public.aic_trigger_catalogue
set legacy_fact_keys = legacy_fact_keys || array['article_50_notice_required','system_function'],
    updated_at = now()
where trigger_key = 'DIRECT_HUMAN_INTERACTION'
  and not legacy_fact_keys @> array['article_50_notice_required'];

-- ---------------------------------------------------------------------------
-- 4. Valós körülmények közötti tesztelés és ügyfélszolgálati részletfunkciók.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   question_hu, ask_only_if, display_order, legacy_fact_keys, detection_patterns)
select v.kulcs, v.nev, v.leiras, v.kategoria, s.id, v.cikk, v.kerdes,
       v.felteteles::jsonb, v.sorrend, v.regi, v.minta::jsonb
from public.aic_legal_sources s,
(values
 ('REAL_WORLD_TESTING',
  'Valós körülmények közötti tesztelés',
  'A rendszert forgalomba hozatal előtt valós körülmények között tesztelik, éles adatokon vagy valódi felhasználókkal.',
  'kornyezet', '60',
  'Tesztelik a rendszert valós körülmények között, éles adatokon vagy valódi felhasználókkal?',
  '{"all":[{"fact":"organisation_is_provider","operator":"is_true"}]}', 660,
  array['testing_in_real_world_conditions'],
  '[{"minta":"pilot","tipus":"szoveg","suly":"eros"},
    {"minta":"éles teszt","tipus":"szoveg","suly":"eros"},
    {"minta":"beta","tipus":"szoveg","suly":"gyenge"}]'),

 ('CASE_INTAKE_HANDLING',
  'Beadvány fogadása és visszaigazolása',
  'A rendszer beadványt, bejelentést vagy adatot fogad a felhasználótól, és arról visszaigazolást ad – például panaszt vagy mérőállást.',
  'funkcio', '17/A',
  'Fogad a rendszer beadványt vagy adatot a felhasználótól, amiről visszaigazolást kell adni?',
  null, 670,
  array['provides_case_acknowledgement','provides_submission_receipt','requires_immediate_electronic_acknowledgement','requires_input_confirmation','prevents_duplicate_submission','validates_meter_reading_input'],
  '[{"minta":"visszaigazol","tipus":"szoveg","suly":"eros"},
    {"minta":"iktat","tipus":"szoveg","suly":"eros"},
    {"minta":"beadvány","tipus":"szoveg","suly":"eros"},
    {"minta":"ticket","tipus":"oszlopnev","suly":"eros"}]')
) as v(kulcs,nev,leiras,kategoria,cikk,kerdes,felteteles,sorrend,regi,minta)
where s.celex_number = case when v.cikk = '17/A' then 'NJT-1997-155-00-00' else '02024R1689-20260727' end
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- Ellenőrzés: maradt-e lefedetlen régi tény.
-- ---------------------------------------------------------------------------
with hasznalt as (
  select key as teny from aic_policy_modules m,
       lateral jsonb_object_keys(coalesce(m.applicability->'required_facts','{}'::jsonb)) key
  union
  select c->>'fact' from aic_policy_modules m,
       lateral jsonb_array_elements(coalesce(m.applicability->'all','[]'::jsonb)) c
  union
  select c->>'fact' from aic_policy_modules m,
       lateral jsonb_array_elements(coalesce(m.applicability->'any','[]'::jsonb)) c
  union
  select c->>'fact' from aic_policy_modules m,
       lateral jsonb_array_elements(coalesce(m.applicability->'none','[]'::jsonb)) c
),
lefedett as (select distinct k from aic_trigger_catalogue c, lateral unnest(c.legacy_fact_keys) k)
select
 (select count(*) from aic_trigger_catalogue) as kapcsolo,
 (select count(*) from hasznalt) as regi_teny,
 (select count(*) from hasznalt where teny not in (select k from lefedett)) as lefedetlen,
 (select count(*) from aic_trigger_catalogue where always_ask) as mindig_kerdezzuk,
 (select count(*) from aic_trigger_catalogue where ask_only_if is not null) as feltetelesen;

commit;
