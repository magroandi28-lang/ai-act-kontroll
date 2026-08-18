-- EnergiaAI Kontroll – kapcsolók az MI-rendelet 50. cikkéből.
--
-- MIÉRT FONTOS
-- Az 50. cikk adja egy chatbot fő kötelezettségeit. Négy különálló esetet
-- szabályoz, és mindegyiknek más a címzettje:
--   (1) természetes személlyel közvetlenül interakcióba lépő rendszer   -> szolgáltató
--   (2) szintetikus hang, kép, videó vagy szöveg előállítása            -> szolgáltató
--   (3) érzelemfelismerés vagy biometrikus kategorizálás működtetése    -> alkalmazó
--   (4) deepfake tartalom előállítása vagy manipulálása                 -> alkalmazó
--
-- EGY GYAKORI FÉLREÉRTÉS
-- Az (1) bekezdés kötelezettsége akkor is fennáll, ha a rendszer nem generál
-- semmit – elég, hogy emberrel beszél. A tájékoztatás elhagyható, ha az
-- érintett körülmények között nyilvánvaló, hogy MI-vel kommunikál. Ez utóbbi
-- megítélése nem a felvivő dolga, ezért jogi minősítés.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   paragraph_number, question_hu, always_ask, display_order, legacy_fact_keys, detection_patterns, detection_note)
select v.kulcs, v.nev, v.leiras, v.kategoria, s.id, '50', v.bekezdes, v.kerdes, v.mindig, v.sorrend, v.regi, v.minta::jsonb, v.megjegyzes
from public.aic_legal_sources s,
(values
 ('DIRECT_HUMAN_INTERACTION',
  'Közvetlen interakció természetes személlyel',
  'A rendszert arra szánták, hogy közvetlenül természetes személlyel lépjen kapcsolatba. Ilyenkor tájékoztatni kell, hogy MI-vel beszél – kivéve, ha ez a körülményekből nyilvánvaló.',
  'funkcio', '1',
  'Lép a rendszer közvetlen kapcsolatba természetes személlyel – például beszélget, válaszol, üzenetet küld?',
  true, 200, array['interaction_with_natural_person','direct_two_way_interaction','user_is_natural_person','natural_person_exposed'],
  '[{"minta":"chatbot","tipus":"szoveg","suly":"eros"},
    {"minta":"beszélget","tipus":"szoveg","suly":"eros"},
    {"minta":"ügyfélszolgálat","tipus":"szoveg","suly":"eros"},
    {"minta":"assistant","tipus":"szoveg","suly":"gyenge"},
    {"minta":"conversation","tipus":"szoveg","suly":"eros"},
    {"minta":"message","tipus":"oszlopnev","suly":"gyenge"}]',
  null),

 ('GENERATES_SYNTHETIC_CONTENT',
  'Szintetikus tartalom előállítása',
  'A rendszer szintetikus hang-, kép-, videó- vagy szöveges tartalmat hoz létre. A kimenetet géppel olvasható módon meg kell jelölni mesterségesen előállítottként.',
  'funkcio', '2',
  'Hoz létre a rendszer új szöveget, hangot, képet vagy videót?',
  true, 210, array['generates_synthetic_content','ai_generated_or_manipulated_text','synthetic_content_type'],
  '[{"minta":"generat","tipus":"szoveg","suly":"eros"},
    {"minta":"szöveggenerálás","tipus":"szoveg","suly":"eros"},
    {"minta":"képgenerálás","tipus":"szoveg","suly":"eros"},
    {"minta":"llm","tipus":"szoveg","suly":"eros"},
    {"minta":"openai","tipus":"fuggoseg","suly":"eros"},
    {"minta":"anthropic","tipus":"fuggoseg","suly":"eros"},
    {"minta":"transformers","tipus":"fuggoseg","suly":"gyenge"},
    {"minta":"diffusers","tipus":"fuggoseg","suly":"eros"}]',
  'A nyelvi modell használata önmagában szintetikus tartalom előállítása, akkor is, ha csak belső célra készül a szöveg.'),

 ('CONTENT_IS_DEEPFAKE',
  'Deepfake tartalom',
  'A rendszer valós személyt, tárgyat, helyet vagy eseményt megtévesztően valósnak mutató kép-, hang- vagy videótartalmat hoz létre vagy manipulál.',
  'funkcio', '4',
  'Hoz létre vagy módosít a rendszer olyan kép-, hang- vagy videótartalmat, amely valós személyt vagy eseményt megtévesztően valósnak mutat?',
  false, 220, array['content_is_deepfake'],
  '[{"minta":"deepfake","tipus":"szoveg","suly":"eros"},
    {"minta":"arccsere","tipus":"szoveg","suly":"eros"},
    {"minta":"face swap","tipus":"szoveg","suly":"eros"},
    {"minta":"hangklón","tipus":"szoveg","suly":"eros"},
    {"minta":"voice clon","tipus":"szoveg","suly":"eros"}]',
  null),

 ('PUBLISHED_PUBLIC_INTEREST_TEXT',
  'Közérdekű tájékoztatásként közzétett szöveg',
  'A generált szöveget közérdekű kérdésről szóló nyilvános tájékoztatásként teszik közzé. Ilyenkor jelölni kell, hogy mesterségesen készült – kivéve, ha érdemi emberi szerkesztés és felelősségvállalás történt.',
  'kornyezet', '4',
  'Közzéteszik a generált szöveget nyilvánosan, közérdekű tájékoztatásként?',
  false, 230, array['text_is_published','purpose_is_public_information','subject_is_public_interest'],
  '[{"minta":"közzététel","tipus":"szoveg","suly":"gyenge"},
    {"minta":"sajtóközlemény","tipus":"szoveg","suly":"eros"},
    {"minta":"publish","tipus":"szoveg","suly":"gyenge"}]',
  null)
) as v(kulcs,nev,leiras,kategoria,bekezdes,kerdes,mindig,sorrend,regi,minta,megjegyzes)
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- Jogi minősítések az 50. cikkhez.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   paragraph_number, derived, derivation_note, display_order, legacy_fact_keys)
select v.kulcs, v.nev, v.leiras, 'jogi_minosites', s.id, '50', v.bekezdes, false, v.megjegyzes, v.sorrend, v.regi
from public.aic_legal_sources s,
(values
 ('AI_INTERACTION_OBVIOUS',
  'Nyilvánvaló, hogy MI-vel kommunikál',
  'Az észszerűen tájékozott felhasználó számára a körülményekből nyilvánvaló, hogy MI-rendszerrel áll kapcsolatban. Ilyenkor az 50. cikk (1) bekezdés szerinti tájékoztatás elhagyható.',
  '1', 'Megítélést igényel: mit tud egy átlagos felhasználó a körülményekből. A "chatbot" felirat önmagában nem feltétlenül elég.', 205,
  array['ai_interaction_obvious']),

 ('ART50_ASSISTIVE_EXCEPTION',
  'Szerkesztést segítő kivétel a jelölés alól',
  'A szintetikus tartalom jelölési kötelezettsége nem áll fenn, ha a rendszer csak szabványos szerkesztést végez, és nem változtatja meg érdemben a bemeneti adatot.',
  '2', 'Jogi megítélést igényel.', 215,
  array['article_50_2_exception_applies']),

 ('ART50_ARTISTIC_EXCEPTION',
  'Művészi vagy szatirikus kivétel',
  'A deepfake jelölési kötelezettsége enyhébb, ha a tartalom nyilvánvalóan művészi, kreatív, szatirikus vagy fikciós mű része.',
  '4', 'Jogi megítélést igényel.', 225,
  array['article_50_3_exception_applies']),

 ('ART50_LAW_ENFORCEMENT_EXCEPTION',
  'Bűnüldözési kivétel az 50. cikkhez',
  'A jelölési és tájékoztatási kötelezettség nem alkalmazandó, ha a rendszert bűncselekmény felderítésére, megelőzésére vagy üldözésére engedélyezték.',
  '4', 'Csak bűnüldöző szervnél merül fel. Alapértelmezésben hamis.', 235,
  array['article_50_4_law_enforcement_exception','law_enforcement_exception_applies']),

 ('HUMAN_EDITORIAL_RESPONSIBILITY',
  'Érdemi emberi szerkesztés és felelősségvállalás',
  'A közzétett szöveget ember érdemben átnézte, és valaki felelősséget vállalt a tartalmáért. Ilyenkor a jelölési kötelezettség nem áll fenn.',
  '4', 'Megítélést igényel: a formai átolvasás nem érdemi szerkesztés.', 240,
  array['substantive_human_review_and_editorial_responsibility'])
) as v(kulcs,nev,leiras,bekezdes,megjegyzes,sorrend,regi)
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- Feltételes kérdezés: a deepfake és a közzététel csak akkor kérdés, ha a
-- rendszer egyáltalán generál tartalmat.
-- ---------------------------------------------------------------------------
update public.aic_trigger_catalogue
set ask_only_if = '{"all":[{"fact":"generates_synthetic_content","operator":"is_true"}]}'::jsonb,
    updated_at = now()
where trigger_key in ('CONTENT_IS_DEEPFAKE','PUBLISHED_PUBLIC_INTEREST_TEXT');

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select category as kategoria, count(*) as kapcsolo,
       count(*) filter (where always_ask) as mindig_kerdezzuk,
       count(*) filter (where ask_only_if is not null) as feltetelesen,
       count(*) filter (where jsonb_array_length(detection_patterns) > 0) as van_mintaja
from public.aic_trigger_catalogue group by category order by 2 desc;

commit;
