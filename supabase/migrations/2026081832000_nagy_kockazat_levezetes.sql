-- EnergiaAI Kontroll – nagy kockázatú besorolás (MI-rendelet 6. cikk,
-- I. és III. melléklet).
--
-- MIÉRT EZ A LEGFONTOSABB
-- 31 szabály függ a system_is_high_risk kapcsolótól – ez a legtöbb az egész
-- katalógusban. Ma senki nem állítja be, ezért az a 31 szabály soha nem
-- illeszkedik egyetlen eszközre sem.
--
-- MIT MOND A 6. CIKK
--   (1) nagy kockázatú, ha a rendszer az I. melléklet szerinti termék
--       biztonsági alkotóeleme vagy maga a termék, és a termékhez harmadik
--       feles megfelelőségértékelés kell
--   (2) nagy kockázatú a III. melléklet nyolc területének bármelyike
--   (3) kivétel: a III. mellékletes rendszer mégsem nagy kockázatú, ha nem
--       jelent érdemi kockázatot – szűk eljárási feladat, korábbi emberi
--       tevékenység eredményének javítása, döntési minták felismerése emberi
--       értékelés helyettesítése nélkül, vagy előkészítő feladat
--   (3) második albekezdés: a kivétel soha nem alkalmazható, ha a rendszer
--       természetes személyekről profilt alkot
--   (4) aki a kivételre hivatkozik, köteles az értékelést dokumentálni és a
--       rendszert nyilvántartásba venni
--
-- HOGYAN KÉRDEZZÜK
-- Nem nyolc igen-nem kérdéssel. Egyetlen kérdés: melyik területen használják a
-- rendszert. A válasz az iparágból előre kitöltött, a felvivő csak módosít.
-- A besorolást ebből számoljuk, nem kérdezzük.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. A III. melléklet nyolc területe.
--    Az első pont – biometria – nem szerepel külön, mert azt már az 5. cikknél
--    felvett biometrikus kapcsolók fedik.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   paragraph_number, question_hu, display_order, legacy_fact_keys)
select v.kulcs, v.nev, v.leiras, 'kornyezet', s.id, 'Annex III', v.pont, v.kerdes, v.sorrend, v.regi
from public.aic_legal_sources s,
(values
 ('USE_CRITICAL_INFRASTRUCTURE',
  'Kritikus infrastruktúra',
  'A rendszer kritikus digitális infrastruktúra, közúti forgalom, illetve víz-, gáz-, fűtés- vagy villamosenergia-ellátás irányításának vagy működtetésének biztonsági alkotóeleme.',
  '2', 'Biztonsági elemként befolyásolja a rendszer kritikus infrastruktúra működését?', 110,
  array['annex_iii_critical_infrastructure','is_safety_component_critical_infrastructure_operation']),

 ('USE_EDUCATION',
  'Oktatás és szakképzés',
  'A rendszer oktatási intézménybe való bejutásról, felvételről, tanulási eredmények értékeléséről vagy vizsgai magatartás megfigyeléséről dönt vagy azt befolyásolja.',
  '3', 'Használják a rendszert oktatásban vagy szakképzésben felvételi, értékelési vagy vizsgafelügyeleti célra?', 120,
  array['annex_iii_education_use_case']),

 ('USE_EMPLOYMENT',
  'Foglalkoztatás és munkavállalók irányítása',
  'A rendszer toborzásnál, kiválasztásnál, előléptetésnél, felmondásnál, feladatkiosztásnál vagy teljesítményértékelésnél működik közre.',
  '4', 'Használják a rendszert toborzásnál, kiválasztásnál vagy munkavállalók értékelésénél?', 130,
  array['annex_iii_employment_use_case']),

 ('USE_ESSENTIAL_SERVICES',
  'Alapvető szolgáltatásokhoz való hozzáférés',
  'A rendszer alapvető köz- vagy magánszolgáltatáshoz való hozzáférést értékel: szociális ellátás, hitelképesség, biztosítási díjszabás, sürgősségi hívások rangsorolása.',
  '5', 'Értékel a rendszer alapvető köz- vagy magánszolgáltatáshoz való hozzáférést, például hitelképességet vagy ellátásra jogosultságot?', 140,
  array['annex_iii_essential_services_use_case']),

 ('USE_LAW_ENFORCEMENT',
  'Bűnüldözés',
  'A rendszert bűnüldöző hatóság használja vagy annak nevében működik.',
  '6', 'Bűnüldöző hatóság használja a rendszert vagy annak nevében működik?', 150,
  array['annex_iii_law_enforcement_use_case']),

 ('USE_MIGRATION_BORDER',
  'Migráció, menekültügy és határigazgatás',
  'A rendszert migrációs, menekültügyi vagy határigazgatási eljárásban használják.',
  '7', 'Használják a rendszert migrációs, menekültügyi vagy határigazgatási eljárásban?', 160,
  array['annex_iii_migration_border_use_case']),

 ('USE_JUSTICE_DEMOCRACY',
  'Igazságszolgáltatás és demokratikus folyamatok',
  'A rendszert igazságügyi hatóság használja tényállás vagy jog értelmezéséhez, vagy választási magatartás befolyásolására.',
  '8', 'Használják a rendszert igazságszolgáltatásban vagy választási folyamat befolyásolására?', 170,
  array['annex_iii_justice_democracy_use_case'])
) as v(kulcs,nev,leiras,pont,kerdes,sorrend,regi)
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- 2. Az I. mellékletes út és a 6. cikk (3) bekezdés szerinti kivétel.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   paragraph_number, question_hu, derived, derivation_note, display_order, legacy_fact_keys)
select v.kulcs, v.nev, v.leiras, v.kategoria, s.id, v.cikk, v.bekezdes, v.kerdes, v.szamolt, v.megjegyzes, v.sorrend, v.regi
from public.aic_legal_sources s,
(values
 ('ANNEX_I_PRODUCT',
  'I. mellékletes szabályozott termék',
  'A rendszer az I. melléklet szerinti uniós harmonizációs jogszabály hatálya alá tartozó termék, vagy annak biztonsági alkotóeleme – például gép, felvonó, játék, orvostechnikai eszköz.',
  'funkcio', '6', '1',
  'A rendszer szabályozott termék része, például gépbe, felvonóba vagy orvostechnikai eszközbe épül?',
  false, null, 100, array['annex_i_product_or_safety_component']),

 ('THIRD_PARTY_CONFORMITY_REQUIRED',
  'Harmadik feles megfelelőségértékelés szükséges',
  'Az I. mellékletes termék forgalomba hozatalához harmadik fél által végzett megfelelőségértékelés kell. A 6. cikk (1) bekezdés szerinti nagy kockázat együttes feltétele.',
  'jogi_minosites', '6', '1', null,
  false, 'A vonatkozó harmonizációs jogszabály dönti el; jogi megítélést igényel.', 105,
  array['third_party_conformity_assessment_required']),

 ('PROFILES_NATURAL_PERSONS',
  'Profilalkotás természetes személyekről',
  'A rendszer természetes személyekről profilt alkot. Ha ez fennáll, a 6. cikk (3) bekezdése szerinti mentesség nem alkalmazható.',
  'funkcio', '6', '3',
  'Készít a rendszer profilt természetes személyekről – például viselkedés, preferencia vagy teljesítmény alapján?',
  false, null, 180, array['profiles_natural_persons']),

 ('ART6_3_LIMITED_TASK',
  'Szűk, előkészítő vagy segítő feladat',
  'A rendszer csak szűk eljárási feladatot végez, korábbi emberi tevékenység eredményét javítja, döntési mintát ismer fel emberi értékelés helyettesítése nélkül, vagy előkészítő feladatot lát el. Ilyenkor a III. mellékletes besorolás alól mentesülhet.',
  'jogi_minosites', '6', '3', null,
  false, 'A mentesség megítélése jogi kérdés, és a szolgáltatónak dokumentálnia kell. Profilalkotás esetén soha nem alkalmazható.', 185,
  array['performs_limited_article_6_3_task']),

 ('SYSTEM_IS_HIGH_RISK',
  'Nagy kockázatú MI-rendszer',
  'A rendszer az MI-rendelet szerint nagy kockázatúnak minősül. Nem kérdés, hanem a többi válaszból számolt besorolás.',
  'besorolas', '6', null, null,
  true,
  'Igaz, ha: I. mellékletes termék és harmadik feles értékelés szükséges; VAGY a III. melléklet valamely területe fennáll. Utóbbi esetben a 6. cikk (3) bekezdés szerinti mentesség kizárja, kivéve ha a rendszer profilt alkot természetes személyekről.',
  190, array['system_is_high_risk','annex_iii_listed'])
) as v(kulcs,nev,leiras,kategoria,cikk,bekezdes,kerdes,szamolt,megjegyzes,sorrend,regi)
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- 3. A besorolás kiszámítása.
--    Ez a függvény tölti ki a system_is_high_risk és az annex_iii_listed
--    tényeket a ténylapból, hogy a 31 rájuk épülő szabály működni tudjon.
-- ---------------------------------------------------------------------------
create or replace function public.aic_nagy_kockazatu(p_profile jsonb)
returns jsonb
language sql immutable
set search_path = public, pg_temp
as $function$
  with t as (
    select
      coalesce((p_profile->>'annex_i_product_or_safety_component')::boolean, false) as annex_i,
      coalesce((p_profile->>'third_party_conformity_assessment_required')::boolean, false) as harmadik_fel,
      coalesce((p_profile->>'annex_iii_biometrics_use_case')::boolean, false)
        or coalesce((p_profile->>'uses_realtime_remote_biometric_identification')::boolean, false)
        or coalesce((p_profile->>'biometric_categorisation_of_individuals')::boolean, false) as biometria,
      coalesce((p_profile->>'annex_iii_critical_infrastructure')::boolean, false)
        or coalesce((p_profile->>'is_safety_component_critical_infrastructure_operation')::boolean, false) as kritikus,
      coalesce((p_profile->>'annex_iii_education_use_case')::boolean, false) as oktatas,
      coalesce((p_profile->>'annex_iii_employment_use_case')::boolean, false) as foglalkoztatas,
      coalesce((p_profile->>'annex_iii_essential_services_use_case')::boolean, false) as alapveto,
      coalesce((p_profile->>'annex_iii_law_enforcement_use_case')::boolean, false) as bunuldozes,
      coalesce((p_profile->>'annex_iii_migration_border_use_case')::boolean, false) as migracio,
      coalesce((p_profile->>'annex_iii_justice_democracy_use_case')::boolean, false) as igazsagszolgaltatas,
      coalesce((p_profile->>'performs_limited_article_6_3_task')::boolean, false) as szuk_feladat,
      coalesce((p_profile->>'profiles_natural_persons')::boolean, false) as profilalkotas
  ),
  szamolt as (
    select
      (biometria or kritikus or oktatas or foglalkoztatas or alapveto
       or bunuldozes or migracio or igazsagszolgaltatas) as annex_iii,
      (annex_i and harmadik_fel) as annex_i_ut,
      szuk_feladat, profilalkotas
    from t
  )
  select jsonb_build_object(
    'annex_iii_listed', annex_iii,
    'system_is_high_risk',
      annex_i_ut or (annex_iii and (profilalkotas or not szuk_feladat)),
    'high_risk_indok',
      case
        when annex_i_ut then 'I. mellékletes termék, harmadik feles megfelelőségértékeléssel.'
        when annex_iii and profilalkotas then 'III. mellékletes terület, és a rendszer profilt alkot – a 6. cikk (3) bekezdés szerinti mentesség kizárt.'
        when annex_iii and not szuk_feladat then 'III. mellékletes terület, mentességi feltétel nem áll fenn.'
        when annex_iii and szuk_feladat then 'III. mellékletes terület, de a 6. cikk (3) bekezdés szerinti mentesség fennáll. A szolgáltatónak az értékelést dokumentálnia és a rendszert nyilvántartásba vennie kell.'
        else 'Sem I. mellékletes termék, sem III. mellékletes terület.'
      end
  ) from szamolt;
$function$;

revoke all on function public.aic_nagy_kockazatu(jsonb) from public, anon;
grant execute on function public.aic_nagy_kockazatu(jsonb) to authenticated;

-- ---------------------------------------------------------------------------
-- Ellenőrzés: három tipikus eset.
-- ---------------------------------------------------------------------------
select 'ügyfélszolgálati chatbot' as eset,
       public.aic_nagy_kockazatu('{}'::jsonb) as eredmeny
union all
select 'toborzási MI',
       public.aic_nagy_kockazatu('{"annex_iii_employment_use_case":true}'::jsonb)
union all
select 'toborzási MI, csak előkészítő feladat',
       public.aic_nagy_kockazatu('{"annex_iii_employment_use_case":true,"performs_limited_article_6_3_task":true}'::jsonb)
union all
select 'toborzási MI, előkészítő feladat de profilalkotással',
       public.aic_nagy_kockazatu('{"annex_iii_employment_use_case":true,"performs_limited_article_6_3_task":true,"profiles_natural_persons":true}'::jsonb);

commit;
