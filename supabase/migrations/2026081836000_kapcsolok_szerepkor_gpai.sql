-- EnergiaAI Kontroll – kapcsolók: szerepkörök, hatály, általános célú modell.
--
-- MIÉRT NINCS ITT EGYETLEN ÚJ KÉRDÉS SEM
-- Ez a rész teljes egészében levezetett. A szerepkört a felvitelnél már
-- megadják (organisation_role), a hatályt a szervezet adataiból tudjuk, az
-- általános célú modell pedig abból, hogy a rendszer külső modellre épül-e.
-- Ha ezeket külön megkérdeznénk, ugyanazt kérdeznénk kétszer.
--
-- MIÉRT KELL MÉGIS FELVENNI ŐKET
-- Mert 14 szabály hivatkozik az organisation_is_provider tényre, 3 a
-- GPAI-szolgáltatóira, és ma egyiket sem állítja be senki. A kapcsolókatalógus
-- rögzíti, honnan kell számolni őket.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   derived, derivation_note, display_order, legacy_fact_keys)
select v.kulcs, v.nev, v.leiras, v.kategoria, s.id, v.cikk, true, v.megjegyzes, v.sorrend, v.regi
from public.aic_legal_sources s,
(values
 ('ORG_IS_PROVIDER',
  'A szervezet szolgáltató',
  'A szervezet fejleszti vagy fejleszteti a rendszert, és saját neve alatt hozza forgalomba vagy helyezi üzembe.',
  'szerepkor', '3', 400,
  'A felvitelnél megadott organisation_role értékéből: provider. Termékbe épített MI-nél a 25. cikk (3) bekezdése alapján a termék gyártója is ide tartozik.',
  array['organisation_is_provider','develops_or_has_ai_system_developed','places_on_market_or_puts_into_service_under_own_name','makes_ai_system_available_on_eu_market','is_provider_or_importer']),

 ('ORG_IS_DEPLOYER',
  'A szervezet alkalmazó',
  'A szervezet saját felelősségi körében használja a rendszert, nem személyes, nem szakmai tevékenységen kívüli célra.',
  'szerepkor', '3', 405,
  'A felvitelnél megadott organisation_role értékéből: deployer.',
  array['uses_ai_system_under_own_authority','use_is_purely_personal_non_professional']),

 ('ORG_IS_IMPORTER_DISTRIBUTOR',
  'A szervezet importőr vagy forgalmazó',
  'A szervezet harmadik országbeli szolgáltató rendszerét hozza az uniós piacra, vagy továbbadja anélkül, hogy ő fejlesztette volna.',
  'szerepkor', '3', 410,
  'A felvitelnél megadott organisation_role értékéből: importer vagy distributor.',
  array['places_third_country_branded_ai_system_on_eu_market']),

 ('EU_SCOPE_APPLIES',
  'Uniós hatály',
  'A rendszert az Unióban használják vagy kínálják, vagy a kimenetét az Unióban használják fel. Enélkül az MI-rendelet nem alkalmazandó.',
  'besorolas', '2', 415,
  'A szervezet székhelyéből és a felhasználók helyéből számolt. Magyar cégnél alapértelmezésben igaz.',
  array['eu_scope_connection_exists','entity_established_in_eu','operator_is_eu_institution_body_office_or_agency']),

 ('MODEL_IS_GPAI',
  'Általános célú MI-modell',
  'A rendszer általános célú MI-modellre épül, vagy a szervezet ilyen modellt szolgáltat. Az általános célú modell sokféle feladatra alkalmas, és több rendszerbe integrálható.',
  'besorolas', '51', 420,
  'Abból számolt, hogy a rendszer külső nyelvi vagy multimodális modellre épül-e. Aki csak használ ilyen modellt, attól még nem lesz GPAI-szolgáltató.',
  array['model_is_general_purpose_ai']),

 ('ORG_IS_GPAI_PROVIDER',
  'A szervezet általános célú modell szolgáltatója',
  'A szervezet maga hoz forgalomba általános célú MI-modellt. Ez lényegesen szigorúbb kötelezettségeket von maga után, mint a modell használata.',
  'szerepkor', '53', 425,
  'Akkor igaz, ha a szervezet szolgáltató ÉS maga fejleszti az általános célú modellt. Külső modell használata nem elég hozzá.',
  array['organisation_is_gpai_provider','non_eu_gpai_provider_requires_representative']),

 ('GPAI_SYSTEMIC_RISK',
  'Rendszerszintű kockázatú általános célú modell',
  'A modell nagy hatású képességekkel rendelkezik, és eléri a rendszerszintű kockázat küszöbét. Többletkötelezettségeket von maga után.',
  'jogi_minosites', '51', 430,
  'A Bizottság kritériumai és a XIII. melléklet alapján ítélendő meg. Kis- és középvállalkozásnál gyakorlatilag kizárt.',
  array['gpai_model_has_systemic_risk','gpai_systemic_threshold_reached'])
) as v(kulcs,nev,leiras,kategoria,cikk,sorrend,megjegyzes,regi)
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- Magyar ágazati kapcsolók.
--
-- Ezek nagy része az iparágból és az eszköz funkcióiból következik, nem külön
-- kérdés. Ami valódi kérdés: milyen ügytípusokat kezel az eszköz. Az
-- energetikai chatbotnál ez egyetlen többválasztós kérdés, nem hat igen-nem.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   question_hu, ask_only_if, derived, derivation_note, display_order, legacy_fact_keys, detection_patterns)
select v.kulcs, v.nev, v.leiras, v.kategoria, s.id, v.cikk, v.kerdes,
       v.felteteles::jsonb, v.szamolt, v.megjegyzes, v.sorrend, v.regi, v.minta::jsonb
from public.aic_legal_sources s,
(values
 ('ENERGY_CUSTOMER_MATTERS',
  'Energetikai ügyfélügyek kezelése',
  'A rendszer energetikai ügyfélügyeket kezel: számlázás, mérőállás, kikapcsolás, kereskedőváltás, védendő fogyasztói státusz, panasz.',
  'funkcio', '21/A', 'NJT-2007-273-20-22',
  'Mely ügytípusokat kezeli a rendszer? Számlázás · mérőállás · kikapcsolás és tartozás · kereskedőváltás · védendő fogyasztó · panasz',
  null, false, null, 500,
  array['handles_billing_information','handles_metering_information','handles_disconnection_information','handles_contract_information','handles_vulnerable_customer_matters','accepts_complaints','accepts_meter_reading','accesses_personal_account_data','provides_energy_information','requires_customer_authentication'],
  '[{"minta":"számla","tipus":"szoveg","suly":"eros"},
    {"minta":"mérőállás","tipus":"szoveg","suly":"eros"},
    {"minta":"kikapcsol","tipus":"szoveg","suly":"eros"},
    {"minta":"kereskedőváltás","tipus":"szoveg","suly":"eros"},
    {"minta":"védendő","tipus":"szoveg","suly":"eros"},
    {"minta":"panasz","tipus":"szoveg","suly":"eros"}]'),

 ('SUBJECT_TO_ACCESSIBILITY',
  'Akadálymentességi követelmény hatálya',
  'A szolgáltatás az akadálymentességi törvény hatálya alá tartozik: fogyasztóknak nyújtott elektronikus kereskedelmi, banki, hírközlési vagy közlekedési szolgáltatás.',
  'jogi_minosites', '1. melléklet', 'NJT-2022-17-00-00',
  null, null, true,
  'Az iparágból és abból számolt, hogy a szolgáltatás fogyasztóknak szól-e. Mikrovállalkozás mentesül.', 510,
  array['subject_to_accessibility_requirements','requires_accessible_handoff'], '[]'),

 ('SUBJECT_TO_CYBERSECURITY_ACT',
  'Kiberbiztonsági törvény hatálya',
  'A szervezet a kiberbiztonsági törvény 2. vagy 3. melléklete szerinti ágazatban működik, és eléri a méretküszöböt.',
  'jogi_minosites', '2. melléklet', 'NJT-2024-69-00-00',
  null, null, true,
  'Az iparágból és a cégméretből számolt. Energetikai engedélyesnél jellemzően igaz.', 520,
  array['subject_to_cybersecurity_act'], '[]')
) as v(kulcs,nev,leiras,kategoria,cikk,celex,kerdes,felteteles,szamolt,megjegyzes,sorrend,regi,minta)
where s.celex_number = v.celex
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- Az energetikai ügytípus kérdés csak energetikai iparágnál kerül elő.
-- ---------------------------------------------------------------------------
update public.aic_trigger_catalogue
set ask_only_if = '{"all":[{"fact":"industry","operator":"equals","value":"energy"}]}'::jsonb,
    updated_at = now()
where trigger_key = 'ENERGY_CUSTOMER_MATTERS';

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select category as kategoria, count(*) as kapcsolo,
       count(*) filter (where always_ask) as mindig,
       count(*) filter (where ask_only_if is not null) as feltetelesen,
       count(*) filter (where derived) as levezetett
from public.aic_trigger_catalogue group by category order by 2 desc;

select count(*) as kapcsolo_ossz,
       count(*) filter (where always_ask) as mindig_kerdezzuk,
       count(*) filter (where ask_only_if is not null) as feltetelesen,
       count(*) filter (where derived) as levezetett,
       (select count(distinct k) from public.aic_trigger_catalogue c, lateral unnest(c.legacy_fact_keys) k) as lefedett_regi_teny
from public.aic_trigger_catalogue;

commit;
