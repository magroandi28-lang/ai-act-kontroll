-- EnergiaAI Kontroll – a teljes szabályátvizsgálás három leletének javítása.
--
-- Az ellenőrzés eredménye: 134 szabályból 131 mindenben rendben. Mindháromnak
-- helyes az elsődleges jogalapja; a hiba a feltételekben és a szövegben volt.
--
-- 1. ART50_SYNTHETIC_CONTENT_MARKING – a feltétel kisbetűs kulcsra hivatkozott
--    ('synthetic_content_type'), a funkciókatalógusban 'SYNTHETIC_CONTENT_TYPE'
--    szerepel. Emiatt a szabály sosem léphetett be. Elírás javítása.
--
-- 2. GDPR_DPIA_TRIGGER – jogalap GDPR 35. cikk, de nem volt szövege és
--    feltétele. Megkapja mindkettőt.
--
-- 3. EKTV_PROVIDER_IDENTIFICATION – jogalap Ekertv 4. §, de nem volt szövege és
--    feltétele. Megkapja mindkettőt.
--
-- A feltételek kizárólag a funkciókatalógusban meglévő kapcsolókat használják:
--   PROCESSES_PERSONAL_DATA, SPECIAL_CATEGORY_DATA, PROFILES_NATURAL_PERSONS,
--   AUTOMATED_DECISION, LARGE_SCALE_MONITORING, ELECTRONIC_SERVICE_PROVIDER
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. Kisbetűs kulcs javítása
-- ---------------------------------------------------------------------------

update aic_policy_modules
set applicability = jsonb_set(
      applicability, '{all}',
      (select jsonb_agg(case when c->>'fact' = 'synthetic_content_type'
                             then jsonb_set(c, '{fact}', '"SYNTHETIC_CONTENT_TYPE"')
                             else c end)
         from jsonb_array_elements(applicability->'all') c)),
    updated_at = now()
where module_code = 'GENERIC_RULE_ART50_SYNTHETIC_CONTENT_MARKING'
  and applicability->'all' @> '[{"fact":"synthetic_content_type"}]'::jsonb;

-- ---------------------------------------------------------------------------
-- 2. GDPR 35. cikk – adatvédelmi hatásvizsgálat
-- ---------------------------------------------------------------------------

insert into aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select
  'GDPR_DPIA_REQUIREMENT',
  'Adatvédelmi hatásvizsgálat elvégzése',
  'applicable_requirements',
  'legal_requirement',
  'Ha az adatkezelés valószínűsíthetően magas kockázattal jár, az adatkezelés megkezdése előtt hatásvizsgálatot kell végezni.',
  'Ha a(z) {{system_name}} adatkezelése – jellegére, hatókörére, körülményeire és céljaira tekintettel, különösen új technológia alkalmazása miatt – valószínűsíthetően magas kockázattal jár a természetes személyek jogaira és szabadságaira nézve, a(z) {{organisation_name}} az adatkezelés megkezdése előtt adatvédelmi hatásvizsgálatot végez. A hatásvizsgálat kiterjed a tervezett adatkezelési műveletek módszeres leírására, a célok és a jogos érdek ismertetésére, a szükségesség és arányosság vizsgálatára, az érintetti jogokat fenyegető kockázatok értékelésére, valamint a kockázatok kezelésére tervezett intézkedésekre és garanciákra. Adatvédelmi tisztviselő kijelölése esetén a hatásvizsgálat során ki kell kérni a szakmai véleményét. Ha a hatásvizsgálat a kockázatcsökkentő intézkedések ellenére is magas kockázatot állapít meg, az adatkezelés megkezdése előtt a felügyeleti hatóságtól előzetes konzultációt kell kérni. A hatásvizsgálatot és eredményét dokumentálni kell, és az adatkezelés lényeges változásakor felül kell vizsgálni.',
  r.id,
  jsonb_build_object(
    'industry_codes', '[]'::jsonb,
    'all', jsonb_build_array(
      jsonb_build_object('fact','PROCESSES_PERSONAL_DATA','operator','is_true','value',null)),
    'any', jsonb_build_array(
      jsonb_build_object('fact','SPECIAL_CATEGORY_DATA','operator','is_true','value',null),
      jsonb_build_object('fact','PROFILES_NATURAL_PERSONS','operator','is_true','value',null),
      jsonb_build_object('fact','AUTOMATED_DECISION','operator','is_true','value',null),
      jsonb_build_object('fact','LARGE_SCALE_MONITORING','operator','is_true','value',null))),
  1520, 1, 'under_review'
from aic_compliance_rules r
where r.rule_code = 'GDPR_DPIA_TRIGGER'
  and not exists (select 1 from aic_policy_modules m where m.rule_id = r.id);

-- ---------------------------------------------------------------------------
-- 3. Ekertv 4. § – a szolgáltató azonosító adatai
-- ---------------------------------------------------------------------------

insert into aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select
  'EKTV_PROVIDER_IDENTIFICATION_NOTICE',
  'A szolgáltató azonosító adatainak közzététele',
  'applicable_requirements',
  'legal_requirement',
  'Elektronikusan nyújtott szolgáltatásnál a szolgáltató azonosító adatait folyamatosan és közvetlenül hozzáférhetővé kell tenni.',
  'Ha a(z) {{system_name}} elektronikus kereskedelmi vagy más információs társadalommal összefüggő szolgáltatás részeként érhető el, a(z) {{organisation_name}} a szolgáltatás igénybe vevője számára folyamatosan, közvetlenül és könnyen hozzáférhető módon közzéteszi a nevét, székhelyét, elektronikus levelezési címét és az elektronikus kapcsolattartásra szolgáltató további adatait, a nyilvántartási számát és a nyilvántartó szervet, engedélyköteles tevékenység esetén az engedélyező hatóságot és az engedély számát, továbbá szabályozott szakma esetén a szakmai testületre és a szakmai szabályokra vonatkozó adatokat. Az adatoknak a rendszer felületéről is elérhetőnek kell lenniük, és a rendszer nem helyettesítheti ezt a közzétételt azzal, hogy az adatot kérésre közli. Az adatokat változás esetén haladéktalanul frissíteni kell.',
  r.id,
  jsonb_build_object(
    'industry_codes', '[]'::jsonb,
    'all', jsonb_build_array(
      jsonb_build_object('fact','ELECTRONIC_SERVICE_PROVIDER','operator','is_true','value',null))),
  1530, 1, 'under_review'
from aic_compliance_rules r
where r.rule_code = 'EKTV_PROVIDER_IDENTIFICATION'
  and not exists (select 1 from aic_policy_modules m where m.rule_id = r.id);

commit;
