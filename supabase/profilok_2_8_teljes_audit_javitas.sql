-- A 2–8. energetikai chatbotprofil teljes auditjának javításai.
-- Cél: pontos jogforrások, végrehajtható kontrollok, bizonyítékok,
-- funkciófüggőségek és szakértői felülvizsgálatra kész szabályzattervezet.

begin;

-- 1. Jogforrások pontosítása és pótlása.

update public.aic_legal_sources
set retrieved_at=now(),updated_at=now()
where official_url in (
  'https://njt.hu/jogszabaly/1997-155-00-00',
  'https://njt.hu/jogszabaly/2007-273-20-22',
  'https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng'
);

update public.aic_legal_provisions
set article_number='2. melléklet',
    heading='Mérés, elszámolás és számlakifogás',
    provision_text='A 2. melléklet külön pontokban szabályozza a mérést, az elszámolást és a számlakifogás kezelését; a chatbot követelményeit az alkalmazandó 14–16. pontok pontos alpontjaihoz kell kötni.',
    source_locator='2. melléklet, 14–16. pont',
    text_fidelity='expert_paraphrase'
where provision_key='VHR_ANNEX_BILLING';

update public.aic_legal_provisions
set provision_key='VHR_24_25_DISCONNECTION',
    article_number='24–25',
    heading='Lakossági fogyasztó kikapcsolása és értesítése',
    provision_text='A lakossági fogyasztó kikapcsolásának feltételeit, időzítését, értesítését és a kapcsolódó eljárási követelményeket a 24–25. § rendezi; a visszakapcsolás külön joghelyhez kötendő.',
    source_locator='24–25. §',
    text_fidelity='expert_paraphrase'
where provision_key='VHR_24_26_DISCONNECTION';

with vhr as (
  select id from public.aic_legal_sources
  where official_url='https://njt.hu/jogszabaly/2007-273-20-22'
  limit 1
)
insert into public.aic_legal_provisions(
  id,source_id,provision_key,article_number,heading,provision_text,
  text_fidelity,language_code,valid_from,source_locator
)
select gen_random_uuid(),vhr.id,x.provision_key,x.article_number,x.heading,
       x.provision_text,'expert_paraphrase','hu',date '2008-01-01',x.source_locator
from vhr
cross join (values
  ('VHR_30_36_VULNERABLE','30–36','Védendő fogyasztók részletes szabályai',
   'A rendelet a védendő fogyasztók nyilvántartásba vételéhez, igazolásához, fizetési könnyítéseihez, különleges bánásmódjához és speciális szolgáltatásaihoz részletes követelményeket állapít meg.',
   '30–36. §'),
  ('VHR_26_SUPPLIER_SWITCH','26','Kereskedőváltás',
   'A 26. § kereskedőváltási tényállást szabályoz; kikapcsolási követelményként csak akkor alkalmazható, ha a konkrét ügy kereskedőváltást is érint.',
   '26. §')
) as x(provision_key,article_number,heading,provision_text,source_locator)
on conflict(source_id,provision_key,language_code) do update
set article_number=excluded.article_number,
    heading=excluded.heading,
    provision_text=excluded.provision_text,
    source_locator=excluded.source_locator,
    text_fidelity=excluded.text_fidelity;

with gdpr as (
  select id from public.aic_legal_sources
  where celex_number='32016R0679'
     or official_url='https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng'
  order by (celex_number='32016R0679') desc
  limit 1
)
insert into public.aic_legal_provisions(
  id,source_id,provision_key,article_number,heading,provision_text,
  text_fidelity,language_code,valid_from,source_locator
)
select gen_random_uuid(),gdpr.id,'GDPR_ART9_SPECIAL_CATEGORIES','9',
       'A személyes adatok különleges kategóriái',
       'Egészségi állapotra vagy fogyatékosságra utaló személyes adat csak a GDPR 9. cikkében meghatározott megfelelő feltétellel, célhoz kötötten és fokozott garanciákkal kezelhető.',
       'expert_paraphrase','hu',date '2018-05-25','9. cikk'
from gdpr
on conflict(source_id,provision_key,language_code) do update
set article_number=excluded.article_number,
    heading=excluded.heading,
    provision_text=excluded.provision_text,
    source_locator=excluded.source_locator,
    text_fidelity=excluded.text_fidelity;

with fgytv as (
  select id from public.aic_legal_sources
  where official_url='https://njt.hu/jogszabaly/1997-155-00-00'
  limit 1
)
insert into public.aic_legal_provisions(
  id,source_id,provision_key,article_number,heading,provision_text,
  text_fidelity,language_code,valid_from,source_locator
)
select gen_random_uuid(),fgytv.id,x.provision_key,x.article_number,x.heading,
       x.provision_text,'expert_paraphrase','hu',date '1998-03-01',x.source_locator
from fgytv
cross join (values
  ('FGYTV_17A_ELECTRONIC_ACK','17/A','Elektronikus panasz visszaigazolása és azonosítása',
   'Az elektronikus panaszfogadásnál az ügyfélnek haladéktalan elektronikus visszaigazolást, illetve az elektronikus kommunikációban egyedi ügyazonosítót kell biztosítani.',
   '17/A. § elektronikus panaszkezelési rendelkezései'),
  ('FGYTV_17A_RESPONSE_RETENTION','17/A','Panaszválasz, indokolás és megőrzés',
   'Az írásbeli panaszt főszabály szerint harminc napon belül írásban, igazolható módon és érdemben meg kell válaszolni; az elutasítást indokolni és a jogorvoslati fórumokról tájékoztatni kell, a panaszt és választ pedig három évig meg kell őrizni.',
   '17/A. § írásbeli panaszra vonatkozó rendelkezései')
) as x(provision_key,article_number,heading,provision_text,source_locator)
on conflict(source_id,provision_key,language_code) do update
set article_number=excluded.article_number,
    heading=excluded.heading,
    provision_text=excluded.provision_text,
    source_locator=excluded.source_locator,
    text_fidelity=excluded.text_fidelity;

-- 2. A panaszprofil szűkítése és a kritikus tények kiegészítése.

update public.aic_usage_profiles
set name_hu='Panasz fogadása',
    description_hu='Fogyasztói panaszt fogad, visszaigazol és ellenőrzött emberi panaszkezelési folyamatba továbbít; általános kérelmet nem kezel panaszként.',
    intended_purpose_template='Energetikai fogyasztói panaszok fogadása, azonnali elektronikus visszaigazolása és emberi panaszkezelésbe továbbítása.',
    system_description_template='A chatbot felismeri és rögzíti a fogyasztói panaszt, egyedi ügyazonosítót és elektronikus visszaigazolást ad, majd az ügyet ellenőrzött emberi panaszkezelési folyamatba továbbítja. Általános kérelmet nem minősít automatikusan panasznak, a panaszt nem bírálja el és joghatású döntést nem hoz.',
    capability_codes=array['GENERAL_INFORMATION','ENERGY_INFORMATION','COMPLAINT_INTAKE'],
    optional_capability_codes=array['PERSONAL_ACCOUNT_DATA','GENERATIVE_RESPONSES'],
    forbidden_capability_codes=array[
      'BILLING_INFORMATION','CONSUMPTION_METERING_DATA','METER_READING_INTAKE',
      'DEBT_DISCONNECTION_SUPPORT','VULNERABLE_CUSTOMER_SUPPORT'
    ],
    required_assertions=to_jsonb(array[
      'Ügyfélkapcsolati chatbotként, energetikai környezetben működik.',
      'Fogyasztói panaszt fogad és rögzít; az általános kérelmet külön folyamatba irányítja.',
      'Az elektronikus panaszról haladéktalan visszaigazolást és egyedi ügyazonosítót ad.',
      'A panaszt ellenőrzött emberi panaszkezelési folyamatba továbbítja.',
      'A panaszt nem bírálja el és joghatású döntést nem hoz.',
      'Teljes ügyfélfiók-hozzáférést csak akkor használ, ha az az ügyhöz szükséges és a funkció külön ki van választva.',
      'A kezelt személyes adatok körét a szükséges minimumra korlátozza.'
    ]),
    fact_patch=(fact_patch-'requires_customer_authentication'-'accesses_personal_account_data')
      ||jsonb_build_object(
        'accepts_general_requests',false,
        'provides_case_acknowledgement',true,
        'requires_immediate_electronic_acknowledgement',true
      ),
    updated_at=now()
where code='ENERGY_CHAT_COMPLAINT_INTAKE';

update public.aic_usage_profiles
set fact_patch=fact_patch||jsonb_build_object(
      'requires_input_confirmation',true,
      'validates_meter_reading_input',true,
      'prevents_duplicate_submission',true,
      'provides_submission_receipt',true
    ),
    required_assertions=to_jsonb(array[
      'Ügyfélkapcsolati chatbotként, energetikai környezetben működik.',
      'A mérési pontot és az ügyfelet megbízhatóan összerendeli.',
      'A mérőállás formátumát, mértékegységét és ésszerűségét ellenőrzi.',
      'A beküldés előtt az ügyféllel megerősítteti a rögzített adatot.',
      'A duplikált beküldést felismeri, az eredményről bizonylatot ad.',
      'Rendellenes vagy vitás értéket emberi ügyintézőhöz továbbít.',
      'A mérőállás elfogadásáról vagy elszámolásáról önálló döntést nem hoz.'
    ]),
    updated_at=now()
where code='ENERGY_CHAT_METER_READING';

update public.aic_usage_profiles
set fact_patch=fact_patch||jsonb_build_object(
      'may_process_vulnerability_data',true,
      'requires_accessible_handoff',true,
      'determines_vulnerability_eligibility',false
    ),
    updated_at=now()
where code in ('ENERGY_CHAT_VULNERABLE_SUPPORT','ENERGY_CHAT_FULL_SERVICE');

-- Az opcionális PERSONAL_ACCOUNT_DATA kapcsolhatja be ezeket a tényeket.
-- Ezért a panasz- és védendő alapprofil nem követelhet fix false értéket,
-- mert az a helyes opcionális true értékkel ütközne a profilkapuban.
update public.aic_usage_profiles
set fact_patch=fact_patch-'requires_customer_authentication'-'accesses_personal_account_data',
    updated_at=now()
where code in ('ENERGY_CHAT_COMPLAINT_INTAKE','ENERGY_CHAT_VULNERABLE_SUPPORT');

update public.aic_capabilities
set fact_patch=fact_patch||jsonb_build_object(
      'validates_meter_reading_input',true,
      'prevents_duplicate_submission',true,
      'provides_submission_receipt',true
    )
where code='METER_READING_INTAKE';

update public.aic_capabilities
set fact_patch=fact_patch||jsonb_build_object(
      'accepts_general_requests',false,
      'requires_immediate_electronic_acknowledgement',true
    )
where code='COMPLAINT_INTAKE';

update public.aic_capabilities
set fact_patch=fact_patch||jsonb_build_object(
      'requires_accessible_handoff',true,
      'determines_vulnerability_eligibility',false
    )
where code='VULNERABLE_CUSTOMER_SUPPORT';

-- 3. Adatvezérelt képességfüggőségek.

create table if not exists public.aic_capability_dependencies(
  capability_code text not null references public.aic_capabilities(code) on delete cascade,
  requires_capability_code text not null references public.aic_capabilities(code) on delete restrict,
  reason_hu text not null,
  created_at timestamptz not null default now(),
  primary key(capability_code,requires_capability_code),
  constraint aic_capability_dependencies_not_self check(capability_code<>requires_capability_code)
);

alter table public.aic_capability_dependencies enable row level security;
drop policy if exists capability_dependencies_read_authenticated on public.aic_capability_dependencies;
create policy capability_dependencies_read_authenticated
on public.aic_capability_dependencies for select
to authenticated
using(true);

revoke all on table public.aic_capability_dependencies from anon;
grant select on table public.aic_capability_dependencies to authenticated;

insert into public.aic_capability_dependencies(capability_code,requires_capability_code,reason_hu)
values
  ('BILLING_INFORMATION','PERSONAL_ACCOUNT_DATA','Egyedi számlaadat csak azonosított ügyfélhez és ellenőrzött jogosultsággal kapcsolható.'),
  ('CONSUMPTION_METERING_DATA','PERSONAL_ACCOUNT_DATA','Egyedi fogyasztási vagy mérési adat személyes ügyféladatnak minősülhet, ezért jogosultság-ellenőrzés szükséges.'),
  ('METER_READING_INTAKE','PERSONAL_ACCOUNT_DATA','A mérőállást az ügyfélhez és a mérési ponthoz megbízhatóan hozzá kell rendelni.'),
  ('METER_READING_INTAKE','CONSUMPTION_METERING_DATA','A mérőállás ellenőrzéséhez a mérési adatkör és a korábbi értékek kezelése szükséges.'),
  ('DEBT_DISCONNECTION_SUPPORT','PERSONAL_ACCOUNT_DATA','Tartozási és kikapcsolási státusz kizárólag azonosított, jogosult ügyfélnek jeleníthető meg.')
on conflict(capability_code,requires_capability_code) do update
set reason_hu=excluded.reason_hu;

create or replace function public.aic_missing_capability_dependencies(p_selected text[])
returns text[]
language sql
stable
security invoker
set search_path=public,pg_temp
as $function$
  select coalesce(array_agg(
    d.capability_code||' -> '||d.requires_capability_code
    order by d.capability_code,d.requires_capability_code
  ),'{}'::text[])
  from public.aic_capability_dependencies d
  where d.capability_code=any(coalesce(p_selected,'{}'::text[]))
    and not d.requires_capability_code=any(coalesce(p_selected,'{}'::text[]));
$function$;

revoke all on function public.aic_missing_capability_dependencies(text[]) from public,anon;
grant execute on function public.aic_missing_capability_dependencies(text[]) to authenticated;

-- 4. Új megfelelőségi szabályok és a szabály nélküli modulok bekötése.

insert into public.aic_compliance_rules(
  id,rule_code,title,plain_language_requirement,actor_role,outcome_type,
  condition_groups_operator,lifecycle_status,requires_human_review,legal_interpretation_note
)
values
  (gen_random_uuid(),'CHATBOT_PURPOSE_BOUNDARY_CONTROL','A chatbot rendeltetésének és döntési határának rögzítése',
   'A dokumentált rendeltetésnek tételesen meg kell határoznia az engedélyezett tájékoztatást, a tiltott döntéseket és az emberi átadás határát.',
   'deployer','requirement','AND','under_review',true,null),
  (gen_random_uuid(),'CHATBOT_ROLE_ASSIGNMENT','Chatbot-felelősségi körök kijelölése',
   'A rendszer-, tartalom-, adatvédelmi, információbiztonsági és ügyfélszolgálati felelőst írásban ki kell jelölni.',
   'deployer','requirement','AND','under_review',true,null),
  (gen_random_uuid(),'CHATBOT_SOURCE_GOVERNANCE_CONTROL','Chatbot-tudásforrások irányítása',
   'Csak azonosított, hatályos, jóváhagyott és verziózott forrás használható; hiány vagy ellentmondás esetén emberi átadás szükséges.',
   'deployer','requirement','AND','under_review',true,null),
  (gen_random_uuid(),'CHATBOT_DATA_GOVERNANCE_CONTROL','Beszélgetési adatok belső irányítása',
   'A chatbot adatköreit, megőrzését, hozzáféréseit, továbbításait és törlését dokumentált belső kontrollal kell kezelni.',
   'deployer','requirement','AND','under_review',true,null),
  (gen_random_uuid(),'CHATBOT_HUMAN_HANDOFF_CONTROL','Működő emberi átadás biztosítása',
   'Az ügyfél kérésére, bizonytalanság, vita, joghatás vagy sérülékeny helyzet esetén működő és naplózott emberi átadás szükséges.',
   'deployer','human_review','AND','under_review',true,null),
  (gen_random_uuid(),'CHATBOT_MONITORING_CONTROL','Chatbot-hibák és kontrollok felülvizsgálata',
   'A hibás válaszokat, incidenseket, eszkalációkat és javító intézkedéseket rendszeresen és lényeges változáskor felül kell vizsgálni.',
   'deployer','monitoring','AND','under_review',true,null),
  (gen_random_uuid(),'CHATBOT_CHANGE_CONTROL','Modell-, forrás- és beszállítói változáskezelés',
   'Minden lényeges modell-, prompt-, forrás-, integrációs és beszállítói változást jóváhagyás, teszt és verziózott dokumentáció előzzön meg.',
   'deployer','requirement','AND','under_review',true,null),
  (gen_random_uuid(),'VET_METER_READING_INTAKE_CONTROL','Mérőállás biztonságos fogadása és visszaigazolása',
   'A mérőállást azonosított mérési ponthoz kell kötni, ellenőrizni, az ügyféllel megerősíttetni, duplikáció ellen védeni és bizonylattal visszaigazolni.',
   'deployer','requirement','AND','under_review',true,
   'A chatbot formai és ésszerűségi ellenőrzést végezhet, de vitás vagy rendellenes mérőállást nem fogadhat el önállóan elszámolási döntésként.'),
  (gen_random_uuid(),'GDPR_SPECIAL_CATEGORY_VULNERABILITY_DATA','Védendőségi különleges adatok kezelése',
   'Egészségi állapotra vagy fogyatékosságra utaló adat csak külön dokumentált GDPR 9. cikk szerinti feltétellel, minimális adatkörrel és fokozott hozzáférés-védelemmel kezelhető.',
   'deployer','requirement','AND','under_review',true,
   'A konkrét 9. cikk szerinti feltételt és a kapcsolódó uniós vagy tagállami jogalapot adatvédelmi szakértőnek kell jóváhagynia.'),
  (gen_random_uuid(),'VET_VULNERABLE_ACCESSIBLE_HANDOFF','Védendő fogyasztó hozzáférhető emberi támogatása',
   'A védendő fogyasztói ügyben érthető, hozzáférhető kommunikációt és megfelelően képzett emberi ügyintézőhöz történő gyors átadást kell biztosítani.',
   'deployer','human_review','AND','under_review',true,null),
  (gen_random_uuid(),'ENERGY_ACCOUNT_DATA_TRACEABILITY','Egyedi energetikai adatok forrás- és jogosultsági nyomkövetése',
   'Minden számla-, fogyasztási, mérési, tartozási vagy ügyállapot-válasz forrását, lekérdezési idejét, jogosultság-ellenőrzését és emberi eszkalációját visszakereshetően naplózni kell.',
   'deployer','monitoring','AND','under_review',true,null)
on conflict(rule_code) do update
set title=excluded.title,
    plain_language_requirement=excluded.plain_language_requirement,
    actor_role=excluded.actor_role,
    outcome_type=excluded.outcome_type,
    condition_groups_operator=excluded.condition_groups_operator,
    lifecycle_status='under_review',
    requires_human_review=excluded.requires_human_review,
    legal_interpretation_note=excluded.legal_interpretation_note,
    approved_by=null,
    approved_at=null,
    updated_at=now();

with mapping(module_code,rule_code) as (values
  ('CHATBOT_PURPOSE_SCOPE','CHATBOT_PURPOSE_BOUNDARY_CONTROL'),
  ('CHATBOT_ROLES_RESPONSIBILITIES','CHATBOT_ROLE_ASSIGNMENT'),
  ('CHATBOT_SOURCE_GOVERNANCE','CHATBOT_SOURCE_GOVERNANCE_CONTROL'),
  ('CHATBOT_DATA_PROTECTION','CHATBOT_DATA_GOVERNANCE_CONTROL'),
  ('CHATBOT_HUMAN_HANDOFF','CHATBOT_HUMAN_HANDOFF_CONTROL'),
  ('CHATBOT_MONITORING_REVIEW','CHATBOT_MONITORING_CONTROL'),
  ('CHATBOT_VENDOR_CHANGE','CHATBOT_CHANGE_CONTROL')
)
update public.aic_policy_modules m
set rule_id=r.id,version=m.version+1,lifecycle_status='under_review',updated_at=now()
from mapping x
join public.aic_compliance_rules r on r.rule_code=x.rule_code
where m.module_code=x.module_code
  and m.rule_id is distinct from r.id;

-- 5. Új szakmodulok és a meglévő szakmodulok pontosítása.

insert into public.aic_policy_modules(
  id,module_code,title,section_key,module_kind,summary_text,full_text_template,
  rule_id,applicability,display_order,version,lifecycle_status,valid_from
)
select gen_random_uuid(),x.module_code,x.title,x.section_key,x.module_kind,x.summary_text,
       x.full_text_template,r.id,x.applicability,x.display_order,1,'under_review',x.valid_from
from (values
  ('ENERGY_METER_READING_INTAKE','Mérőállás fogadása, ellenőrzése és bizonylata','meter_reading_intake','internal_control',
   'A mérőállás csak azonosított mérési ponthoz, ellenőrzötten, megerősítve és visszakereshető bizonylattal továbbítható.',
   'A {{system_name}} a mérőállás beküldése előtt ellenőrzi az ügyfél és a mérési pont összerendelését, a mérőazonosítót, a formátumot, a mértékegységet, a korábbi értékhez viszonyított ésszerűséget és a duplikációt. Az ügyfél a továbbítás előtt összefoglalót kap és megerősíti az adatot. A rendszer a sikeres vagy sikertelen továbbításról időbélyeges bizonylatot és ügyazonosítót ad. Csökkenő, kirívó, ellentmondásos vagy vitatott értéket nem fogad el elszámolási döntésként, hanem emberi ügyintézőhöz továbbít.',
   'VET_METER_READING_INTAKE_CONTROL',
   '{"system_type_codes":["CUSTOMER_CHATBOT"],"industry_codes":["energy"],"required_facts":{"accepts_meter_reading":true,"requires_input_confirmation":true,"validates_meter_reading_input":true,"prevents_duplicate_submission":true,"provides_submission_receipt":true}}'::jsonb,
   125,date '2008-01-01'),
  ('CHATBOT_SPECIAL_CATEGORY_DATA','Védendőségi és egészségi adatok fokozott védelme','special_category_data','legal_requirement',
   'A védendőségi ügyben előforduló egészségi vagy fogyatékossági adat csak külön jogalappal és fokozott garanciákkal kezelhető.',
   'Ha a {{system_name}} egészségi állapotra, fogyatékosságra vagy más GDPR 9. cikk szerinti különleges adatra utaló információt kezel, a {{organisation_name}} előzetesen dokumentálja a 6. és 9. cikk szerinti jogalapot, a pontos célt, a minimális adatmezőket, a hozzáférési szerepköröket, a címzetteket, a dokumentumtípusonkénti megőrzést és az ellenőrzött törlést. A chatbot nem kérhet diagnózist vagy teljes igazolást, ha a cél szűkebb adattal is elérhető, és jogosultságot nem állapíthat meg.',
   'GDPR_SPECIAL_CATEGORY_VULNERABILITY_DATA',
   '{"system_type_codes":["CUSTOMER_CHATBOT"],"required_facts":{"may_process_vulnerability_data":true}}'::jsonb,
   146,date '2018-05-25'),
  ('ENERGY_VULNERABLE_ACCESSIBLE_HANDOFF','Védendő fogyasztó hozzáférhető támogatása és átadása','vulnerable_accessible_handoff','internal_control',
   'A védendő fogyasztó számára érthető, hozzáférhető tájékoztatást és megfelelő emberi ügyintézőt kell biztosítani.',
   'A {{system_name}} a védendő fogyasztói ügyet egyszerű, érthető nyelven kezeli, támogatja a billentyűzetes és segítő technológiás használatot, nem kényszeríti az ügyfelet szükségtelen különleges adat megadására, és működő csatornán megfelelően képzett emberi ügyintézőhöz továbbít. A hozzáférhető működést és az átadási időt rendszeresen tesztelni kell.',
   'VET_VULNERABLE_ACCESSIBLE_HANDOFF',
   '{"system_type_codes":["CUSTOMER_CHATBOT"],"industry_codes":["energy"],"required_facts":{"handles_vulnerable_customer_matters":true,"requires_accessible_handoff":true}}'::jsonb,
   147,date '2008-01-01'),
  ('ENERGY_ACCOUNT_DATA_TRACEABILITY','Egyedi ügyféladatok forrás- és jogosultsági nyomkövetése','account_data_traceability','internal_control',
   'Az egyedi energetikai adat csak aktuális, jogosult és visszakereshető lekérdezésből jeleníthető meg.',
   'A {{system_name}} minden egyedi számla-, fogyasztási, mérési, tartozási, kikapcsolási vagy ügyállapot-válasznál naplózza a forrásrendszert, a lekérdezés és válasz időpontját, az érintett adatmezők körét, a jogosultság-ellenőrzés eredményét, a rendszerverziót és az esetleges emberi átadást. Lejárt, nem hiteles vagy jogosulatlan adatból nem készíthet választ, és az adatot nem értelmezheti önálló döntésként.',
   'ENERGY_ACCOUNT_DATA_TRACEABILITY',
   '{"system_type_codes":["CUSTOMER_CHATBOT"],"industry_codes":["energy"],"required_facts":{"accesses_personal_account_data":true,"requires_customer_authentication":true}}'::jsonb,
   148,date '2018-05-25')
) as x(module_code,title,section_key,module_kind,summary_text,full_text_template,rule_code,applicability,display_order,valid_from)
join public.aic_compliance_rules r on r.rule_code=x.rule_code
on conflict(module_code) do update
set title=excluded.title,
    section_key=excluded.section_key,
    module_kind=excluded.module_kind,
    summary_text=excluded.summary_text,
    full_text_template=excluded.full_text_template,
    rule_id=excluded.rule_id,
    applicability=excluded.applicability,
    display_order=excluded.display_order,
    version=public.aic_policy_modules.version+1,
    lifecycle_status='under_review',
    valid_from=excluded.valid_from,
    updated_at=now();

update public.aic_policy_modules
set applicability=jsonb_build_object(
      'system_type_codes',jsonb_build_array('CUSTOMER_CHATBOT'),
      'required_facts',jsonb_build_object(
        'accepts_complaints',true,
        'provides_case_acknowledgement',true,
        'requires_immediate_electronic_acknowledgement',true
      )
    ),
    full_text_template='Ha az ügyfél fogyasztói panaszt, vitatást vagy jogorvoslati igényt jelez, a {{system_name}} azt nem kezelheti egyszerű tájékoztatási kérdésként és nem minősíthet általános kérelmet automatikusan panasznak. A panasz befogadásához csak a szükséges adatokat kérheti, teljes ügyfélfiók-hozzáférést nem követelhet indokolatlanul. Elektronikus fogadáskor haladéktalan visszaigazolást és egyedi ügyazonosítót ad, majd emberi panaszkezelésbe továbbít. Az írásbeli panaszt főszabály szerint harminc napon belül érdemben és igazolható módon meg kell válaszolni, az elutasítást indokolni és a jogorvoslati fórumokról tájékoztatni kell; a panaszt és választ három évig meg kell őrizni. Ágazati rövidebb határidő esetén a szigorúbb szabály alkalmazandó.',
    version=version+1,
    lifecycle_status='under_review',
    updated_at=now()
where module_code='CHATBOT_COMPLAINT_PROCESS';

update public.aic_policy_modules
set full_text_template='Általános számlamagyarázat kizárólag ellenőrzött tudásforrásból adható. Konkrét számla, fogyasztási vagy mérési adat csak megfelelő azonosítás, mezőszintű jogosultság-ellenőrzés, hiteles rendszerkapcsolat és időbélyeges lekérdezés alapján jeleníthető meg. A mérés, elszámolás és számlakifogás követelményeit a VET, a 273/2007. (X. 19.) Korm. rendelet 21/A. §-a, valamint a 2. melléklet vonatkozó 14–16. pontjai szerint kell kezelni. A chatbot számlát vagy mérési adatot nem módosíthat, és ellenőrzött adat hiányában nem becsülhet.',
    version=version+1,
    lifecycle_status='under_review',
    updated_at=now()
where module_code='ENERGY_BILLING_METERING';

update public.aic_policy_modules
set full_text_template='Kikapcsolással, visszakapcsolással vagy tartozási státusszal kapcsolatos egyedi tájékoztatást a {{system_name}} csak azonosítás, jogosultság-ellenőrzés és időbélyeges, hiteles háttérrendszeri lekérdezés után adhat. A kikapcsolás fő eljárási szabályait a VET 47. § és a Vhr. 24–25. §, a tartozás rendezése utáni visszakapcsolást a Vhr. 22/C. § alapján kell kezelni. A Vhr. 26. § csak kereskedőváltási ügyben alkalmazható. A chatbot tartozást nem állapíthat meg, kikapcsolást vagy visszakapcsolást nem rendelhet el, fizetési könnyítésről nem dönthet, és vitás vagy elavult státusznál emberi ügyintézőhöz továbbít.',
    version=version+1,
    lifecycle_status='under_review',
    updated_at=now()
where module_code='ENERGY_DISCONNECTION_RECONNECTION';

update public.aic_policy_modules
set applicability=jsonb_build_object(
      'system_type_codes',jsonb_build_array('CUSTOMER_CHATBOT'),
      'required_facts',jsonb_build_object(
        'handles_vulnerable_customer_matters',true,
        'may_process_vulnerability_data',true
      )
    ),
    full_text_template='Ha az ügyfél szociális rászorultságra, fogyatékosságra, védendő fogyasztói státuszra vagy kapcsolódó kedvezményre hivatkozik, a {{system_name}} kizárólag a VET 64–65. § és a Vhr. 30–36. § szerinti hivatalos eljárásról adhat tájékoztatást. Külön kell kezelni az általános tájékoztatást, az igazolás befogadását, a nyilvántartásba vételt, a fizetési könnyítést és a különleges szolgáltatás igénylését. A chatbot jogosultságot nem állapíthat meg, szükségtelen különleges adatot nem kérhet, és az egyedi ügyet megfelelően azonosított, hozzáférésre jogosult emberi ügyintézőhöz továbbítja.',
    version=version+1,
    lifecycle_status='under_review',
    updated_at=now()
where module_code='ENERGY_VULNERABLE_CUSTOMER';

-- 6. Jogi alapok összerendezése.

delete from public.aic_rule_legal_bases b
using public.aic_compliance_rules r,public.aic_legal_provisions p
where b.rule_id=r.id and b.provision_id=p.id
  and r.rule_code='VET_DISCONNECTION_DECISION_BLOCK'
  and p.provision_key='VHR_26_SUPPLIER_SWITCH';

insert into public.aic_rule_legal_bases(rule_id,provision_id,basis_type)
select r.id,p.id,x.basis_type
from (values
  ('FGYTV_COMPLAINT_HANDLING','FGYTV_17A_ELECTRONIC_ACK','primary'),
  ('FGYTV_COMPLAINT_HANDLING','FGYTV_17A_RESPONSE_RETENTION','primary'),
  ('VET_BILLING_METERING_ESCALATION','VHR_21A_BILLING','primary'),
  ('VET_BILLING_METERING_ESCALATION','VHR_ANNEX_BILLING','primary'),
  ('VET_METER_READING_INTAKE_CONTROL','VHR_ANNEX_BILLING','primary'),
  ('VET_DISCONNECTION_DECISION_BLOCK','VET_47_DISCONNECTION','primary'),
  ('VET_DISCONNECTION_DECISION_BLOCK','VHR_22C_RECONNECTION','primary'),
  ('VET_DISCONNECTION_DECISION_BLOCK','VHR_24_25_DISCONNECTION','primary'),
  ('VET_VULNERABLE_CUSTOMER_HANDLING','VET_64_65_VULNERABLE','primary'),
  ('VET_VULNERABLE_CUSTOMER_HANDLING','VHR_30_36_VULNERABLE','primary'),
  ('GDPR_SPECIAL_CATEGORY_VULNERABILITY_DATA','GDPR_ART9_SPECIAL_CATEGORIES','primary'),
  ('GDPR_SPECIAL_CATEGORY_VULNERABILITY_DATA','GDPR_ART6','supporting'),
  ('VET_VULNERABLE_ACCESSIBLE_HANDOFF','VHR_30_36_VULNERABLE','supporting'),
  ('ENERGY_ACCOUNT_DATA_TRACEABILITY','GDPR_ART25','supporting'),
  ('ENERGY_ACCOUNT_DATA_TRACEABILITY','GDPR_ART28_32','supporting'),
  ('ENERGY_ACCOUNT_DATA_TRACEABILITY','VET_57','supporting')
) as x(rule_code,provision_key,basis_type)
join public.aic_compliance_rules r on r.rule_code=x.rule_code
join public.aic_legal_provisions p on p.provision_key=x.provision_key
on conflict(rule_id,provision_id) do update
set basis_type=excluded.basis_type;

-- 7. Szakmodulokhoz rendelt konkrét műveletek és bizonyítékok.

insert into public.aic_required_actions(
  id,rule_id,action_code,action_title,action_description,priority,due_date_policy
)
select gen_random_uuid(),r.id,x.action_code,x.action_title,x.action_description,x.priority,
       jsonb_build_object('trigger','before_go_live_and_on_material_change')
from (values
  ('VET_METER_READING_INTAKE_CONTROL','VALIDATE_METER_READING_SUBMISSION','Mérőállás-beküldés ellenőrzése','Vezess be mérési pont-összerendelést, formai és ésszerűségi validációt, duplikációvédelmet, ügyfél-megerősítést, bizonylatot és emberi hibautat.','critical'),
  ('FGYTV_COMPLAINT_HANDLING','ACKNOWLEDGE_AND_ROUTE_COMPLAINT','Panasz visszaigazolása és továbbítása','Biztosíts haladéktalan elektronikus visszaigazolást, egyedi ügyazonosítót, határidőfigyelést, indokolt választ, jogorvoslati tájékoztatást és hároméves megőrzést.','critical'),
  ('GDPR_SPECIAL_CATEGORY_VULNERABILITY_DATA','CONTROL_SPECIAL_CATEGORY_DATA','Különleges adatok kezelési feltételeinek jóváhagyása','Az adatvédelmi felelős dokumentálja a GDPR 6. és 9. cikk szerinti feltételt, a minimális adatmezőket, a hozzáférést, megőrzést és törlést.','critical'),
  ('VET_VULNERABLE_ACCESSIBLE_HANDOFF','TEST_ACCESSIBLE_HANDOFF','Hozzáférhető emberi átadás tesztelése','Teszteld az érthető kommunikációt, billentyűzetes és segítő technológiás használatot, valamint a megfelelő emberi ügyintézőhöz történő átadást.','high'),
  ('ENERGY_ACCOUNT_DATA_TRACEABILITY','LOG_ACCOUNT_DATA_ACCESS','Egyedi adatlekérések nyomkövetése','Naplózd a forrásrendszert, adatmezőket, lekérdezési és válaszidőt, jogosultság-ellenőrzést, rendszerverziót és eszkalációt.','critical')
) as x(rule_code,action_code,action_title,action_description,priority)
join public.aic_compliance_rules r on r.rule_code=x.rule_code
on conflict(rule_id,action_code) do update
set action_title=excluded.action_title,
    action_description=excluded.action_description,
    priority=excluded.priority,
    due_date_policy=excluded.due_date_policy;

insert into public.aic_required_evidence(
  id,rule_id,evidence_code,evidence_title,evidence_description,accepted_formats,mandatory
)
select gen_random_uuid(),r.id,x.evidence_code,x.evidence_title,x.evidence_description,
       x.accepted_formats,true
from (values
  ('VET_METER_READING_INTAKE_CONTROL','METER_READING_RECEIPT_LOG','Mérőállás-beküldési és bizonylati napló','A mérési pont, validáció, megerősítés, duplikációvizsgálat, továbbítás, időbélyeg, bizonylat és hibautak tesztbizonyítéka.',array['json','xlsx','pdf','png','text']::text[]),
  ('FGYTV_COMPLAINT_HANDLING','COMPLAINT_INTAKE_LOG','Panaszbefogadási és határidőnapló','A visszaigazolást, ügyazonosítót, beérkezést, továbbítást, válaszidőt, indokolást, jogorvoslati tájékoztatást és megőrzést igazoló nyilvántartás.',array['json','xlsx','pdf','text']::text[]),
  ('GDPR_SPECIAL_CATEGORY_VULNERABILITY_DATA','SPECIAL_CATEGORY_DATA_REGISTER','Különlegesadat-kezelési nyilvántartás','A cél, jogalap, GDPR 9. cikk szerinti feltétel, adatmezők, szerepkörök, címzettek, megőrzés és törlés jóváhagyott dokumentuma.',array['pdf','docx','xlsx','json','text']::text[]),
  ('VET_VULNERABLE_ACCESSIBLE_HANDOFF','ACCESSIBLE_HANDOFF_TEST','Hozzáférhetőségi és átadási tesztjegyzőkönyv','A segítő technológiás használatot, érthetőséget, emberi átadási útvonalat és válaszidőt igazoló tesztjegyzőkönyv.',array['pdf','docx','xlsx','png','text']::text[]),
  ('ENERGY_ACCOUNT_DATA_TRACEABILITY','ACCOUNT_DATA_ACCESS_LOG','Egyedi ügyféladat-hozzáférési napló','A forrás, időbélyeg, adatmező, jogosultsági eredmény, rendszerverzió és eszkaláció visszakereshető naplója.',array['json','xlsx','pdf','text']::text[])
) as x(rule_code,evidence_code,evidence_title,evidence_description,accepted_formats)
join public.aic_compliance_rules r on r.rule_code=x.rule_code
on conflict(rule_id,evidence_code) do update
set evidence_title=excluded.evidence_title,
    evidence_description=excluded.evidence_description,
    accepted_formats=excluded.accepted_formats,
    mandatory=excluded.mandatory;

-- Minden chatbot- és energetikai modul kap legalább egy végrehajtási műveletet.
insert into public.aic_required_actions(
  id,rule_id,action_code,action_title,action_description,priority,due_date_policy
)
select gen_random_uuid(),m.rule_id,'IMPLEMENT_MODULE_CONTROL',m.title||' végrehajtása',
       m.summary_text||' A felelőst, határidőt, elfogadási feltételt és eltéréskezelést dokumentálni kell.',
       case when m.module_kind='legal_requirement' then 'high' else 'medium' end,
       jsonb_build_object('trigger','before_go_live_and_on_material_change')
from public.aic_policy_modules m
where (m.module_code like 'CHATBOT_%' or m.module_code like 'ENERGY_%')
  and m.rule_id is not null
  and not exists(select 1 from public.aic_required_actions a where a.rule_id=m.rule_id)
on conflict(rule_id,action_code) do nothing;

-- Minden chatbot- és energetikai modul kap legalább egy ellenőrizhető bizonyítékot.
insert into public.aic_required_evidence(
  id,rule_id,evidence_code,evidence_title,evidence_description,accepted_formats,mandatory
)
select gen_random_uuid(),m.rule_id,'MODULE_CONTROL_EVIDENCE',m.title||' bizonyítéka',
       'A követelmény végrehajtását, felelősét, dátumát, rendszerverzióját, teszteredményét és felülvizsgálatát igazoló dokumentum vagy napló.',
       array['pdf','docx','xlsx','json','png','text']::text[],true
from public.aic_policy_modules m
where (m.module_code like 'CHATBOT_%' or m.module_code like 'ENERGY_%')
  and m.rule_id is not null
  and not exists(select 1 from public.aic_required_evidence e where e.rule_id=m.rule_id)
on conflict(rule_id,evidence_code) do nothing;

-- 8. Függőségi kapu a szabályzatkészítésben.

create or replace function public.aic_require_valid_usage_profile(p_ai_system_id uuid)
returns jsonb
language plpgsql
stable
security invoker
set search_path=public,pg_temp
as $function$
declare
  v_usage_profile_code text;
  v_profile_code text;
  v_profile_active boolean;
  v_profile_industry_code text;
  v_profile_system_type_code text;
  v_profile_fact_patch jsonb;
  v_required text[];
  v_optional text[];
  v_forbidden text[];
  v_system_industry_code text;
  v_system_type_code text;
  v_facts jsonb;
  v_selected text[];
  v_missing text[];
  v_not_allowed text[];
  v_explicitly_forbidden text[];
  v_dependency_violations text[];
begin
  select s.usage_profile_code,p.code,p.active,p.industry_code,p.system_type_code,
         p.fact_patch,p.capability_codes,p.optional_capability_codes,
         p.forbidden_capability_codes,coalesce(s.industry_code,o.industry,'unknown'),
         t.type_code,f.facts
  into v_usage_profile_code,v_profile_code,v_profile_active,v_profile_industry_code,
       v_profile_system_type_code,v_profile_fact_patch,v_required,v_optional,v_forbidden,
       v_system_industry_code,v_system_type_code,v_facts
  from public.aic_ai_systems s
  join public.aic_organisations o on o.id=s.organisation_id
  join public.aic_system_type_templates t on t.id=s.system_type_id
  left join public.aic_usage_profiles p on p.code=s.usage_profile_code
  left join public.aic_system_facts f on f.system_id=s.id
  where s.id=p_ai_system_id and s.inventory_status='active';

  if not found then
    raise exception 'A szabályzat nem készíthető el: az MI-rendszer nem található, nem aktív vagy nincs rendszertípusa.';
  end if;
  if v_usage_profile_code is null or btrim(v_usage_profile_code)='' then
    raise exception 'A szabályzat nem készíthető el, mert a rendszerhez nincs érvényes használati profil rendelve.';
  end if;
  if v_profile_code is null then
    raise exception 'A szabályzat nem készíthető el, mert a(z) "%" használati profil nem található a profilkatalógusban.',v_usage_profile_code;
  end if;
  if not v_profile_active then
    raise exception 'A szabályzat nem készíthető el, mert a(z) "%" használati profil inaktív.',v_profile_code;
  end if;
  if v_profile_system_type_code is distinct from v_system_type_code then
    raise exception 'A szabályzat nem készíthető el, mert a használati profil rendszertípusa nem egyezik a nyilvántartott rendszer típusával.';
  end if;
  if v_profile_industry_code is distinct from v_system_industry_code then
    raise exception 'A szabályzat nem készíthető el, mert a használati profil iparága nem egyezik a rendszer iparágával.';
  end if;
  if v_facts is null then
    raise exception 'A szabályzat nem készíthető el, mert a használati profilhoz szükséges rendszertények hiányoznak.';
  end if;
  if not v_facts @> coalesce(v_profile_fact_patch,'{}'::jsonb) then
    raise exception 'A szabályzat nem készíthető el, mert a rendszertények nem teljesítik a kiválasztott használati profil kötelező feltételeit.';
  end if;

  select coalesce(array_agg(value order by value),'{}'::text[])
  into v_selected
  from jsonb_array_elements_text(coalesce(v_facts->'capability_codes','[]'::jsonb));

  select coalesce(array_agg(code order by code),'{}'::text[])
  into v_missing
  from unnest(coalesce(v_required,'{}'::text[])) as item(code)
  where not item.code=any(v_selected);
  if cardinality(v_missing)>0 then
    raise exception 'A szabályzat nem készíthető el, mert a használati profil kötelező funkciói hiányoznak: %.',array_to_string(v_missing,', ');
  end if;

  select coalesce(array_agg(code order by code),'{}'::text[])
  into v_not_allowed
  from unnest(v_selected) as item(code)
  where not item.code=any(coalesce(v_required,'{}'::text[])||coalesce(v_optional,'{}'::text[]));
  if cardinality(v_not_allowed)>0 then
    raise exception 'A szabályzat nem készíthető el, mert a profilhoz nem engedélyezett funkció van rögzítve: %.',array_to_string(v_not_allowed,', ');
  end if;

  select coalesce(array_agg(code order by code),'{}'::text[])
  into v_explicitly_forbidden
  from unnest(v_selected) as item(code)
  where item.code=any(coalesce(v_forbidden,'{}'::text[]));
  if cardinality(v_explicitly_forbidden)>0 then
    raise exception 'A szabályzat nem készíthető el, mert a profil által kizárt funkció van rögzítve: %.',array_to_string(v_explicitly_forbidden,', ');
  end if;

  v_dependency_violations:=public.aic_missing_capability_dependencies(v_selected);
  if cardinality(v_dependency_violations)>0 then
    raise exception 'A szabályzat nem készíthető el, mert funkciófüggőség hiányzik: %.',array_to_string(v_dependency_violations,', ');
  end if;

  if v_profile_code='ENERGY_CHAT_COMBINED' and (
    select count(*) from unnest(v_selected) as item(code)
    where item.code=any(array[
      'BILLING_INFORMATION','METER_READING_INTAKE','COMPLAINT_INTAKE',
      'DEBT_DISCONNECTION_SUPPORT','VULNERABLE_CUSTOMER_SUPPORT'
    ])
  )<2 then
    raise exception 'A szabályzat nem készíthető el, mert a kombinált profilhoz legalább két konkrét ügyfélszolgálati funkció szükséges.';
  end if;

  return v_facts||jsonb_build_object(
    'usage_profile_code',v_profile_code,'system_type_code',v_system_type_code,
    'industry',v_system_industry_code,'profile_validated',true,
    'capability_dependencies_validated',true
  );
end;
$function$;

revoke all on function public.aic_require_valid_usage_profile(uuid) from public,anon;
grant execute on function public.aic_require_valid_usage_profile(uuid) to authenticated;

-- 9. Függőségi kapu a funkciók mentésében is.

drop policy if exists system_change_log_insert_editors on public.aic_system_change_log;
create policy system_change_log_insert_editors
on public.aic_system_change_log for insert
to authenticated
with check(
  changed_by=(select auth.uid())
  and exists(
    select 1 from public.aic_organisation_members m
    where m.organisation_id=aic_system_change_log.organisation_id
      and m.user_id=(select auth.uid())
      and m.member_role in ('owner','admin','compliance','editor')
  )
);

grant insert on table public.aic_system_change_log to authenticated;

create or replace function public.aic_update_system_capabilities(
  p_system_id uuid,
  p_capability_codes text[],
  p_conditions_confirmed boolean
)
returns void
language plpgsql
security invoker
set search_path=public,pg_temp
as $function$
declare
  v_user_id uuid:=auth.uid();
  v_system public.aic_ai_systems%rowtype;
  v_profile public.aic_usage_profiles%rowtype;
  v_type_code text;
  v_industry_code text;
  v_default_facts jsonb;
  v_selected text[];
  v_allowed text[];
  v_before text[];
  v_unknown text[];
  v_not_allowed text[];
  v_forbidden text[];
  v_missing_required text[];
  v_dependency_violations text[];
  v_facts jsonb;
  v_capability record;
  v_special_count integer;
begin
  if v_user_id is null then raise exception 'A módosításhoz bejelentkezés szükséges.'; end if;
  if p_conditions_confirmed is distinct from true then raise exception 'A funkciók mentését meg kell erősíteni.'; end if;

  select * into v_system from public.aic_ai_systems
  where id=p_system_id and inventory_status='active' for update;
  if not found then raise exception 'Az MI-rendszer nem található vagy nem aktív.'; end if;

  if not exists(
    select 1 from public.aic_organisation_members
    where organisation_id=v_system.organisation_id and user_id=v_user_id
      and member_role in ('owner','admin','compliance','editor')
  ) then raise exception 'Nincs jogosultságod a rendszer módosításához.'; end if;

  select * into v_profile from public.aic_usage_profiles
  where code=v_system.usage_profile_code and active;
  if not found then raise exception 'A rendszerhez nincs aktív használati profil rendelve.'; end if;

  select type_code,coalesce(default_facts,'{}'::jsonb)
  into v_type_code,v_default_facts
  from public.aic_system_type_templates
  where id=v_system.system_type_id and active;
  if not found then raise exception 'A rendszer típusa nem elérhető.'; end if;

  select coalesce(v_system.industry_code,o.industry)
  into v_industry_code
  from public.aic_organisations o
  where o.id=v_system.organisation_id;

  select coalesce(array_agg(distinct selected_code.code order by selected_code.code),'{}'::text[])
  into v_selected
  from unnest(coalesce(p_capability_codes,'{}'::text[])) as selected_code(code);

  v_allowed:=coalesce(v_profile.capability_codes,'{}'::text[])
    ||coalesce(v_profile.optional_capability_codes,'{}'::text[]);

  select coalesce(array_agg(selected_code.code order by selected_code.code),'{}'::text[])
  into v_unknown
  from unnest(v_selected) as selected_code(code)
  where not exists(
    select 1 from public.aic_capabilities c
    where c.code=selected_code.code and c.active
      and (coalesce(cardinality(c.system_type_codes),0)=0 or v_type_code=any(c.system_type_codes))
      and (coalesce(cardinality(c.industry_codes),0)=0 or v_industry_code=any(c.industry_codes))
  );
  if cardinality(v_unknown)>0 then
    raise exception 'Nem kompatibilis vagy ismeretlen funkció: %.',array_to_string(v_unknown,', ');
  end if;

  select coalesce(array_agg(selected_code.code order by selected_code.code),'{}'::text[])
  into v_not_allowed
  from unnest(v_selected) as selected_code(code)
  where not selected_code.code=any(v_allowed);
  if cardinality(v_not_allowed)>0 then
    raise exception 'A kiválasztott profilhoz nem engedélyezett funkció: %.',array_to_string(v_not_allowed,', ');
  end if;

  select coalesce(array_agg(selected_code.code order by selected_code.code),'{}'::text[])
  into v_forbidden
  from unnest(v_selected) as selected_code(code)
  where selected_code.code=any(coalesce(v_profile.forbidden_capability_codes,'{}'::text[]));
  if cardinality(v_forbidden)>0 then
    raise exception 'A kiválasztott profil kizárja ezt a funkciót: %.',array_to_string(v_forbidden,', ');
  end if;

  select coalesce(array_agg(required_code.code order by required_code.code),'{}'::text[])
  into v_missing_required
  from unnest(coalesce(v_profile.capability_codes,'{}'::text[])) as required_code(code)
  where not required_code.code=any(v_selected);
  if cardinality(v_missing_required)>0 then
    raise exception 'A profil kötelező funkciói nem távolíthatók el: %.',array_to_string(v_missing_required,', ');
  end if;

  v_dependency_violations:=public.aic_missing_capability_dependencies(v_selected);
  if cardinality(v_dependency_violations)>0 then
    raise exception 'A kiválasztott funkciók kötelező függősége hiányzik: %.',array_to_string(v_dependency_violations,', ');
  end if;

  if v_profile.code='ENERGY_CHAT_COMBINED' then
    select count(*) into v_special_count
    from unnest(v_selected) as selected_code(code)
    where selected_code.code=any(array[
      'BILLING_INFORMATION','METER_READING_INTAKE','COMPLAINT_INTAKE',
      'DEBT_DISCONNECTION_SUPPORT','VULNERABLE_CUSTOMER_SUPPORT'
    ]);
    if v_special_count<2 then
      raise exception 'A kombinált profilhoz legalább két konkrét ügyfélszolgálati funkció szükséges.';
    end if;
  end if;

  select coalesce(array_agg(capability_code order by capability_code),'{}'::text[])
  into v_before
  from public.aic_ai_system_capabilities
  where system_id=p_system_id;

  delete from public.aic_ai_system_capabilities where system_id=p_system_id;
  insert into public.aic_ai_system_capabilities(system_id,capability_code,confirmed_by)
  select p_system_id,selected_code.code,v_user_id
  from unnest(v_selected) as selected_code(code);

  v_facts:=v_default_facts
    ||jsonb_build_object('industry',v_industry_code,'system_name',v_system.name)
    ||coalesce(v_profile.fact_patch,'{}'::jsonb);

  for v_capability in
    select fact_patch from public.aic_capabilities
    where code=any(v_selected) and active order by sort_order,code
  loop
    v_facts:=v_facts||coalesce(v_capability.fact_patch,'{}'::jsonb);
  end loop;

  v_facts:=v_facts||jsonb_build_object(
    'capability_codes',to_jsonb(v_selected),
    'usage_profile_code',v_profile.code,
    'profile_conditions_confirmed',true,
    'profile_confirmed_at',now(),
    'profile_revalidation_required',false,
    'capability_dependencies_validated',true
  );

  insert into public.aic_system_facts(system_id,facts,completion_status,updated_by,updated_at)
  values(p_system_id,v_facts,'complete',v_user_id,now())
  on conflict(system_id) do update
  set facts=excluded.facts,completion_status='complete',updated_by=v_user_id,updated_at=now();

  insert into public.aic_system_change_log(
    organisation_id,system_id,changed_by,change_type,before_data,after_data
  ) values(
    v_system.organisation_id,p_system_id,v_user_id,'reclassification',
    jsonb_build_object('capability_codes',to_jsonb(v_before)),
    jsonb_build_object(
      'capability_codes',to_jsonb(v_selected),
      'facts_rebuilt',true,
      'capability_dependencies_validated',true
    )
  );
end;
$function$;

revoke all on function public.aic_update_system_capabilities(uuid,text[],boolean) from public,anon;
grant execute on function public.aic_update_system_capabilities(uuid,text[],boolean) to authenticated;

-- 10. A megváltozott profilokhoz tartozó aktív rendszerek újraigazolást kérnek.

update public.aic_system_facts f
set facts=(f.facts-'profile_confirmed_at')||jsonb_build_object(
      'profile_conditions_confirmed',false,
      'profile_revalidation_required',true,
      'profile_confirmation_method','audit_2_8_revalidation_required'
    ),
    completion_status='draft',
    updated_at=now()
from public.aic_ai_systems s
where s.id=f.system_id
  and s.inventory_status='active'
  and s.usage_profile_code in (
    'ENERGY_CHAT_BILLING_CONSUMPTION','ENERGY_CHAT_METER_READING',
    'ENERGY_CHAT_COMPLAINT_INTAKE','ENERGY_CHAT_DEBT_DISCONNECTION',
    'ENERGY_CHAT_VULNERABLE_SUPPORT','ENERGY_CHAT_COMBINED','ENERGY_CHAT_FULL_SERVICE'
  );

commit;
