-- EnergiaAI Kontroll – kapcsolók a GDPR-ból.
--
-- MIÉRT MÁS EZ, MINT AZ MI-RENDELET
-- Az MI-rendelet azt kérdezi, mit tud a rendszer. A GDPR azt, hogy mit csinál
-- az adattal. Egy chatbotnál a kettő elválik: a rendszer lehet egyszerű, az
-- adatkezelés mégis összetett.
--
-- A LEGFONTOSABB
-- A processes_personal_data kapcsolóra 19 szabály épül – a második legtöbb az
-- egész katalógusban. Ezt minden eszköznél meg kell kérdezni, mert nem
-- következik a típusból: egy előrejelző MI működhet személyes adat nélkül is.
--
-- AMI LEVEZETETT
-- Az uniós tevékenységi hely megléte a szervezet adataiból következik, nem
-- eszközkérdés. A közös adatkezelői minőség jogi megítélés.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   question_hu, always_ask, ask_only_if, display_order, legacy_fact_keys,
   detection_patterns, detection_note)
select v.kulcs, v.nev, v.leiras, v.kategoria, s.id, v.cikk, v.kerdes, v.mindig,
       v.felteteles::jsonb, v.sorrend, v.regi, v.minta::jsonb, v.megjegyzes
from public.aic_legal_sources s,
(values
 ('PROCESSES_PERSONAL_DATA',
  'Személyes adat kezelése',
  'A rendszer azonosított vagy azonosítható természetes személyre vonatkozó adatot kezel. A beszélgetési napló, az IP-cím és az ügyfélazonosító is ilyen.',
  'funkcio', '4',
  'Kezel a rendszer személyes adatot – ideértve a beszélgetési naplót, az ügyfélazonosítót vagy az IP-címet is?',
  true, null, 300, array['processes_personal_data'],
  '[{"minta":"személyes adat","tipus":"szoveg","suly":"eros"},
    {"minta":"gdpr","tipus":"szoveg","suly":"eros"},
    {"minta":"felhasználó","tipus":"szoveg","suly":"gyenge"},
    {"minta":"email","tipus":"oszlopnev","suly":"eros"},
    {"minta":"phone","tipus":"oszlopnev","suly":"eros"},
    {"minta":"user_id","tipus":"oszlopnev","suly":"eros"},
    {"minta":"customer","tipus":"oszlopnev","suly":"eros"},
    {"minta":"conversation","tipus":"oszlopnev","suly":"eros"}]',
  'A beszélgetési napló akkor is személyes adat, ha a felhasználó nem adja meg a nevét, mert az azonosító mellette áll.'),

 ('SPECIAL_CATEGORY_DATA',
  'Különleges adatok kezelése',
  'A rendszer egészségi állapotra, faji vagy etnikai származásra, politikai véleményre, vallásra, szakszervezeti tagságra, szexuális életre vagy biometrikus azonosításra vonatkozó adatot kezel.',
  'funkcio', '9',
  'Kezel a rendszer egészségügyi, származási, vallási, politikai vagy hasonló különleges adatot?',
  false, '{"all":[{"fact":"processes_personal_data","operator":"is_true"}]}',
  310, array['may_process_vulnerability_data','infers_protected_sensitive_characteristics'],
  '[{"minta":"egészség","tipus":"szoveg","suly":"eros"},
    {"minta":"betegség","tipus":"szoveg","suly":"eros"},
    {"minta":"fogyatékos","tipus":"szoveg","suly":"eros"},
    {"minta":"védendő fogyasztó","tipus":"szoveg","suly":"eros"},
    {"minta":"health","tipus":"oszlopnev","suly":"eros"}]',
  'Energetikában a védendő fogyasztói státusz gyakran egészségi adaton alapul – ez különleges adat.'),

 ('CRIMINAL_DATA',
  'Büntetőjogi adatok kezelése',
  'A rendszer bűncselekményre vagy büntetőjogi felelősség megállapítására vonatkozó adatot kezel vagy hoz létre – ideértve a gyanúra utaló címkét is.',
  'funkcio', '10',
  'Kezel vagy állít elő a rendszer bűncselekményre, csalásra vagy visszaélésre utaló megjelölést személyekhez kötve?',
  false, '{"all":[{"fact":"processes_personal_data","operator":"is_true"}]}',
  320, array['predicts_individual_criminal_offence_risk'],
  '[{"minta":"csalás","tipus":"szoveg","suly":"eros"},
    {"minta":"fraud","tipus":"szoveg","suly":"eros"},
    {"minta":"visszaélés","tipus":"szoveg","suly":"gyenge"},
    {"minta":"blacklist","tipus":"oszlopnev","suly":"eros"}]',
  null),

 ('AUTOMATED_DECISION',
  'Automatizált döntéshozatal',
  'A rendszer emberi közreműködés nélkül hoz olyan döntést, amely az érintettre joghatással jár vagy őt hasonlóan jelentős mértékben érinti.',
  'funkcio', '22',
  'Hoz a rendszer emberi jóváhagyás nélkül olyan döntést, amely az ügyfelet érdemben érinti – például elutasít, besorol vagy díjat állapít meg?',
  true, null, 330, array['materially_influences_decision','annex_iii_ai_assisted_significant_individual_decision'],
  '[{"minta":"automatikus döntés","tipus":"szoveg","suly":"eros"},
    {"minta":"jóváhagyás nélkül","tipus":"szoveg","suly":"eros"},
    {"minta":"auto_approve","tipus":"oszlopnev","suly":"eros"},
    {"minta":"decision","tipus":"oszlopnev","suly":"gyenge"}]',
  'A javaslattétel nem automatizált döntés, ha ember dönt. A kérdés az, hogy az emberi közreműködés érdemi-e.'),

 ('INDIRECT_DATA_COLLECTION',
  'Nem az érintettől szerzett adat',
  'A rendszer olyan személyes adatot kezel, amelyet nem közvetlenül az érintettől szereztek: külső forrásból, más társaságtól, nyilvános forrásból vagy tanítóadatból.',
  'funkcio', '14',
  'Kezel a rendszer olyan személyes adatot, amelyet nem közvetlenül az érintettől kaptak – például külső adatbázisból vagy tanítóadatból?',
  false, '{"all":[{"fact":"processes_personal_data","operator":"is_true"}]}',
  340, array[]::text[],
  '[{"minta":"tanítóadat","tipus":"szoveg","suly":"eros"},
    {"minta":"training data","tipus":"szoveg","suly":"eros"},
    {"minta":"adatvásárlás","tipus":"szoveg","suly":"eros"},
    {"minta":"scraping","tipus":"szoveg","suly":"eros"},
    {"minta":"import","tipus":"szoveg","suly":"gyenge"}]',
  null),

 ('INTERNATIONAL_TRANSFER',
  'Adattovábbítás az EGT-n kívülre',
  'A rendszer működése során személyes adat kerül az Európai Gazdasági Térségen kívülre – tipikusan Unión kívüli modellszolgáltató vagy felhő használatával.',
  'funkcio', '44',
  'Kerül személyes adat az Európai Gazdasági Térségen kívülre – például Unión kívüli modellszolgáltatóhoz vagy felhőbe?',
  false, '{"all":[{"fact":"processes_personal_data","operator":"is_true"}]}',
  350, array['international_data_transfer'],
  '[{"minta":"openai","tipus":"fuggoseg","suly":"eros"},
    {"minta":"anthropic","tipus":"fuggoseg","suly":"eros"},
    {"minta":"aws","tipus":"szoveg","suly":"gyenge"},
    {"minta":"us-east","tipus":"szoveg","suly":"eros"},
    {"minta":"azure","tipus":"szoveg","suly":"gyenge"}]',
  'A régió számít: az európai adatközpontban futó szolgáltatás nem feltétlenül jelent továbbítást.'),

 ('USES_EXTERNAL_PROVIDER',
  'Külső modell- vagy felhőszolgáltató',
  'A rendszer külső szolgáltató modelljét vagy infrastruktúráját használja. A szolgáltató adatfeldolgozónak minősülhet, és utasítási rendet kell vele rögzíteni.',
  'funkcio', '28',
  'Használ a rendszer külső MI-modellt vagy felhőszolgáltatót?',
  true, null, 360, array['uses_external_ai_provider','in_ai_supply_chain'],
  '[{"minta":"openai","tipus":"fuggoseg","suly":"eros"},
    {"minta":"anthropic","tipus":"fuggoseg","suly":"eros"},
    {"minta":"huggingface","tipus":"fuggoseg","suly":"eros"},
    {"minta":"api_key","tipus":"szoveg","suly":"eros"},
    {"minta":"supabase","tipus":"fuggoseg","suly":"gyenge"}]',
  null),

 ('ACCESSIBLE_TO_MINORS',
  'Kiskorúak számára elérhető',
  'A szolgáltatás közvetlenül gyermekeknek szól, vagy kiskorúak számára egyszerűen elérhető. Hozzájáruláson alapuló adatkezelésnél 16 év alatt szülői jóváhagyás kell.',
  'kornyezet', '8',
  'Elérhető a rendszer kiskorúak számára – például nyilvános weboldalon, életkor-ellenőrzés nélkül?',
  false, '{"all":[{"fact":"processes_personal_data","operator":"is_true"}]}',
  370, array[]::text[],
  '[{"minta":"nyilvános","tipus":"szoveg","suly":"gyenge"},
    {"minta":"regisztráció nélkül","tipus":"szoveg","suly":"eros"},
    {"minta":"életkor","tipus":"szoveg","suly":"gyenge"}]',
  'A nyilvános ügyfélszolgálati felület jellemzően elérhető kiskorúnak, még ha nem is nekik szánták.')
) as v(kulcs,nev,leiras,kategoria,cikk,kerdes,mindig,felteteles,sorrend,regi,minta,megjegyzes)
where s.celex_number = '32016R0679'
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- Jogi minősítések és levezetett kapcsolók a GDPR-ból.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   derived, derivation_note, display_order, legacy_fact_keys)
select v.kulcs, v.nev, v.leiras, v.kategoria, s.id, v.cikk, v.szamolt, v.megjegyzes, v.sorrend, v.regi
from public.aic_legal_sources s,
(values
 ('CONSENT_IS_LEGAL_BASIS',
  'Hozzájárulás a jogalap',
  'Az adatkezelés valamely része az érintett hozzájárulásán alapul. Ilyenkor a hozzájárulás érvényességi feltételeit be kell tartani.',
  'jogi_minosites', '6', false,
  'A jogalap megválasztása jogi döntés. Hozzájárulást csak ott szabad kérni, ahol az adatkezelés valóban önkéntes.', 305,
  array[]::text[]),

 ('LARGE_SCALE_MONITORING',
  'Rendszeres és nagymértékű megfigyelés',
  'A rendszer fő tevékenységként az érintettek rendszeres és szisztematikus, nagymértékű megfigyelését végzi. Ez alapozza meg az adatvédelmi tisztviselő kijelölését és a hatásvizsgálatot.',
  'jogi_minosites', '35', false,
  'A "nagymértékű" és a "rendszeres és szisztematikus" megítélése tényállásfüggő. Támpont: hány érintett, milyen gyakran, mennyi ideig.', 315,
  array[]::text[]),

 ('JOINT_CONTROLLER',
  'Közös adatkezelés',
  'Az adatkezelés céljait és eszközeit a szervezet más féllel közösen határozza meg.',
  'jogi_minosites', '26', false,
  'Nem attól függ, mit ír a szerződés, hanem attól, ki dönt ténylegesen a célról és az eszközökről.', 325,
  array[]::text[]),

 ('NO_EU_ESTABLISHMENT',
  'Nincs uniós tevékenységi hely',
  'A szervezetnek nincs uniós tevékenységi helye, de uniós érintetteknek nyújt szolgáltatást vagy figyeli a magatartásukat. Ilyenkor uniós képviselőt kell kijelölni.',
  'szerepkor', '27', true,
  'A szervezet székhelyéből következik, nem eszközkérdés. A felvitelnél nem kérdezzük.', 335,
  array['entity_established_in_eu','eu_scope_connection_exists'])
) as v(kulcs,nev,leiras,kategoria,cikk,szamolt,megjegyzes,sorrend,regi)
where s.celex_number = '32016R0679'
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- Ellenőrzés: hány kérdés jut egy eszközre.
-- ---------------------------------------------------------------------------
select category as kategoria, count(*) as kapcsolo,
       count(*) filter (where always_ask) as mindig_kerdezzuk,
       count(*) filter (where ask_only_if is not null) as feltetelesen,
       count(*) filter (where derived) as levezetett
from public.aic_trigger_catalogue group by category order by 2 desc;

select count(*) filter (where always_ask) as mindig,
       count(*) filter (where ask_only_if is not null) as csak_ha_kell,
       count(*) as ossz
from public.aic_trigger_catalogue;

commit;
