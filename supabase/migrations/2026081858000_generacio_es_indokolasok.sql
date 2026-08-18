-- EnergiaAI Kontroll – a régi modell megjelölése és a hiányzó jogi indokolások.
--
-- HÁROM DOLOG
-- 1. A régi modell öt táblája megjegyzést kap, hogy a Supabase felületén
--    egyértelmű legyen: nem használjuk, ne épüljön rájuk semmi.
-- 2. A modulok generáció-jelölést kapnak. Az első generációs szövegek a
--    projekt elejéről valók; a jogtárban jelezzük, hogy figyelmesebb átnézést
--    érdemelnek. Jóváhagyáskor a jelölés magától aktuálisra vált.
-- 3. Tíz szabálynál hiányzott a jogi indokolás – ezek pótlása.
--    (A 14 MI-rendeleti átvételnél helyes, hogy nincs: azok szó szerinti
--    rendelkezések, nincs bennük következtetés.)
--
-- Adatot nem töröl, táblát nem ejt.
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. A régi modell tábláinak megjelölése
-- ---------------------------------------------------------------------------

comment on table aic_capabilities is
  'RÉGI MODELL – NEM HASZNÁLT. A funkciókat az aic_trigger_catalogue tartalmazza, a jogszabályok szövegéből levezetve. Ez a tábla a régi, eszköztípus-alapú felvitelhez tartozott. Törölhető, ha a régi felvitel és szerkesztés oldal átépült.';

comment on table aic_ai_system_capabilities is
  'RÉGI MODELL – NEM HASZNÁLT. Az eszköz tényeit az aic_system_facts tárolja, a kapcsolókatalógus kulcsaival. Törölhető, ha a régi rendszeroldalak átépültek.';

comment on table aic_capability_dependencies is
  'RÉGI MODELL – NEM HASZNÁLT. A kapcsolók közötti függést az aic_trigger_catalogue.ask_only_if mezője kezeli. Törölhető.';

comment on table aic_usage_profiles is
  'RÉGI MODELL – NEM HASZNÁLT, egyetlen kódsor sem hivatkozik rá. Törölhető.';

comment on table aic_template_questions is
  'RÉGI MODELL – NEM HASZNÁLT, egyetlen kódsor sem hivatkozik rá. A kérdéseket az aic_felviteli_kerdesek függvény állítja elő a kapcsolókatalógusból. Törölhető.';

-- A megtartott, aktív táblák megjelölése, hogy ne kelljen fejből tudni.
comment on table aic_trigger_catalogue is
  'FUNKCIÓKATALÓGUS. A jogszabályok szövegéből levezetett funkciók és feltételek. Minden sor jogszabályhelyhez kötött. Erre épül a szabályok bekapcsolása és a felvitel kérdéssora.';

comment on table aic_provision_coverage is
  'JOGI KATALÓGUS. Minden feldolgozott jogszabályhely és a döntés arról, kell-e hozzá szabály.';

comment on table aic_rule_legal_bases is
  'A szabály és a jogszabályhely kapcsolata. basis_type = primary: ebből ered a kötelezettség.';

-- ---------------------------------------------------------------------------
-- 2. Generáció-jelölés
-- ---------------------------------------------------------------------------

alter table aic_policy_modules
  add column if not exists generacio text not null default 'aktualis';

do $$
begin
  if not exists (select 1 from pg_constraint where conname = 'aic_policy_modules_generacio_check') then
    alter table aic_policy_modules
      add constraint aic_policy_modules_generacio_check
      check (generacio in ('elso','aktualis'));
  end if;
end $$;

comment on column aic_policy_modules.generacio is
  'elso = a projekt elejéről származó, ügyfélszolgálati chatbotra írt szöveg; aktualis = általános MI-rendszerre írt vagy jogász által jóváhagyott.';

update aic_policy_modules set generacio = 'elso'
where module_code in (
  'CHATBOT_ACCESSIBILITY','CHATBOT_AI_ACT_CLASSIFICATION','CHATBOT_AI_LITERACY',
  'CHATBOT_COMPLAINT_PROCESS','CHATBOT_DATA_PROTECTION','CHATBOT_DATA_SECURITY_RETENTION',
  'CHATBOT_DATA_SUBJECT_RIGHTS','CHATBOT_DPIA_SCREENING','CHATBOT_HUMAN_HANDOFF',
  'CHATBOT_INTERACTION_NOTICE','CHATBOT_LAWFUL_DATA_PROCESSING','CHATBOT_MONITORING_REVIEW',
  'CHATBOT_PRIVACY_INCIDENT','CHATBOT_PRIVACY_NOTICE','CHATBOT_PROHIBITED_PRACTICES',
  'CHATBOT_PURPOSE_SCOPE','CHATBOT_RESPONSE_ACCURACY','CHATBOT_ROLES_RESPONSIBILITIES',
  'CHATBOT_SOURCE_GOVERNANCE','CHATBOT_SPECIAL_CATEGORY_DATA',
  'ENERGY_BILLING_METERING','ENERGY_CONTROLLED_INFORMATION','ENERGY_CYBERSECURITY',
  'ENERGY_DISCONNECTION_RECONNECTION','ENERGY_METER_READING_INTAKE',
  'ENERGY_SUPPLIER_SWITCH','ENERGY_VULNERABLE_ACCESSIBLE_HANDOFF','ENERGY_VULNERABLE_CUSTOMER');

-- A jóváhagyás aktuálissá teszi: ha egy jogász végigolvasta és elfogadta,
-- a szöveg többé nem "első generációs".
create or replace function public.aic_generacio_frissites()
returns trigger
language plpgsql
as $function$
begin
  if new.approved_at is not null and (old.approved_at is null) then
    update aic_policy_modules set generacio = 'aktualis'
    where rule_id = new.id and generacio = 'elso';
  end if;
  return new;
end;
$function$;

drop trigger if exists aic_generacio_frissites_trg on aic_compliance_rules;
create trigger aic_generacio_frissites_trg
  after update on aic_compliance_rules
  for each row execute function public.aic_generacio_frissites();

-- ---------------------------------------------------------------------------
-- 3. A hiányzó jogi indokolások
-- ---------------------------------------------------------------------------

update aic_compliance_rules set legal_interpretation_note =
 'A 2022. évi XVII. törvény a szolgáltatás akadálymentességét írja elő, nem nevesíti az MI-rendszereket. Az értelmezés: ha a szolgáltatás a rendszeren keresztül érhető el, a rendszer felülete a szolgáltatás része, ezért rá is vonatkoznak az akadálymentességi követelmények.'
where rule_code = 'ACCESSIBLE_CHATBOT_SERVICE' and legal_interpretation_note is null;

update aic_compliance_rules set legal_interpretation_note =
 'Az Fgytv. a panasz befogadását és megválaszolását a vállalkozás kötelezettségeként írja elő, függetlenül attól, milyen eszközön érkezik. Az értelmezés: az automatizált csatorna nem szűkítheti a panaszjogot, ezért a rendszernek fel kell ismernie a panaszszándékot, és nem minősítheti azt egyszerű tájékoztatási kérdésnek.'
where rule_code = 'FGYTV_COMPLAINT_HANDLING' and legal_interpretation_note is null;

update aic_compliance_rules set legal_interpretation_note =
 'A GDPR 25. és 32. cikke kockázatarányos intézkedéseket ír elő, konkrét technikai listát nem. Az értelmezés: a hozzáférés-korlátozás, a megőrzési idő meghatározása és az ellenőrizhető törlés az a minimum, amivel a beépített adatvédelem egy naplózó rendszernél igazolható.'
where rule_code = 'GDPR_PRIVACY_SECURITY' and legal_interpretation_note is null;

update aic_compliance_rules set legal_interpretation_note =
 'A GDPR 5. cikke alapelveket rögzít, konkrét tiltólistát nem. Az értelmezés: a célhoz kötöttség és az adattakarékosság egy szabad szöveges bemenetet fogadó rendszernél csak úgy tartható, ha a bekérhető adatok köre előre rögzített, és a szükségtelen adat bekérése kifejezetten tiltott. Az elszámoltathatóság miatt a célt, jogalapot és adatkört előzetesen dokumentálni kell.'
where rule_code = 'GDPR_DATA_PRINCIPLES' and legal_interpretation_note is null;

update aic_compliance_rules set legal_interpretation_note =
 'A GDPR 12–13. cikke az adatfelvétel időpontjához köti a tájékoztatást. Az értelmezés: ha az érintett a rendszerrel közvetlenül lép kapcsolatba, a tájékoztatásnak a rendszer felületéről kell elérhetőnek lennie, mert a máshol elhelyezett tájékoztató nem felel meg a "könnyen hozzáférhető" követelménynek.'
where rule_code = 'GDPR_TRANSPARENCY_NOTICE' and legal_interpretation_note is null;

update aic_compliance_rules set legal_interpretation_note =
 'A 2024. évi LXIX. törvény az elektronikus információs rendszerekre vonatkozik, MI-rendszert nem nevesít. Az értelmezés: ha a rendszer a szervezet érintett információs rendszeréhez kapcsolódik vagy annak adatait éri el, a hatálya alá tartozik, ezért a kockázatkezelésbe és a biztonsági osztályba sorolásba be kell vonni.'
where rule_code = 'KIBTV_CHATBOT_SECURITY' and legal_interpretation_note is null;

update aic_compliance_rules set legal_interpretation_note =
 'A VET 47. és 57. §-a, valamint a Vhr. 24–25. §-a a kikapcsolás eljárási rendjét és a kereskedő kötelezettségeit rögzíti; azt nem mondja ki, hogy automatizált rendszer nem járhat el. Az értelmezés: a kikapcsolás joghatással járó döntés, amelyhez a törvény feltételek együttes fennállását és igazolható értesítést követel meg, így a döntés és annak közlése nem automatizálható. A tájékoztatás megengedett, ha hiteles és időbélyeges adatra épül.'
where rule_code = 'VET_DISCONNECTION_DECISION_BLOCK' and legal_interpretation_note is null;

update aic_compliance_rules set legal_interpretation_note =
 'A Vhr. 30–36. §-a a védendő fogyasztó nyilvántartásba vételének eljárását szabályozza. Az értelmezés: a státusz megállapítása mérlegelést és okirati bizonyítást igényel, ezért nem automatizálható; a rendszer szerepe a hozzáférhető tájékoztatás és a megfelelő emberi ügyintézőhöz továbbítás.'
where rule_code = 'VET_VULNERABLE_ACCESSIBLE_HANDOFF' and legal_interpretation_note is null;

update aic_compliance_rules set legal_interpretation_note =
 'A GDPR 35. cikke a magas kockázat valószínűsítéséhez köti a hatásvizsgálatot, és példálózó felsorolást ad. Az értelmezés: a felsorolt esetkörök – különleges adat, profilalkotás, automatizált döntés, nagymértékű megfigyelés – MI-rendszernél tipikusan együtt járnak új technológia alkalmazásával, ezért ezek bármelyikének fennállása a hatásvizsgálat elvégzését indokolja. A vizsgálat elhagyását is dokumentálni kell.'
where rule_code = 'GDPR_DPIA_TRIGGER' and legal_interpretation_note is null;

update aic_compliance_rules set legal_interpretation_note =
 'Az Ekertv. 4. §-a a szolgáltató azonosító adatainak folyamatos és közvetlen hozzáférhetőségét követeli meg. Az értelmezés: ha a szolgáltatás a rendszer felületén keresztül vehető igénybe, az adatoknak onnan is elérhetőnek kell lenniük; a kérésre történő közlés nem elégíti ki a folyamatos hozzáférhetőség követelményét.'
where rule_code = 'EKTV_PROVIDER_IDENTIFICATION' and legal_interpretation_note is null;

commit;
