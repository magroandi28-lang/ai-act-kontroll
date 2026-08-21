-- A nyolc energetikai chatbotprofil audit utani egységes ténymodellje.
-- Cél: a szabálymodulok kizárólag bizonyított rendszertények alapján kerüljenek a dokumentumba.

begin;

-- A közvetlen ügyfél-chat minden esetben felhasználói bemenetet dolgoz fel.
-- Ez nem jelent ügyfélfiók-hozzáférést, de adatvédelmi szempontból konzervatívan
-- személyesadat-kezelésnek minősülhet (szabad szöveg, technikai azonosító, napló).
update public.aic_system_type_templates
set default_facts=coalesce(default_facts,'{}'::jsonb)||jsonb_build_object(
  'accepts_user_input',true,
  'accepts_free_text_input',true,
  'processes_personal_data',true,
  'accesses_personal_account_data',false,
  'international_data_transfer',false,
  'uses_external_ai_provider',false,
  'uses_conversation_for_model_training',false
),
updated_at=now()
where type_code='CUSTOMER_CHATBOT';

-- A funkciók ne csak címkét, hanem a szabálymotor számára szükséges tényeket is adják.
update public.aic_capabilities set fact_patch=jsonb_build_object(
  'processes_personal_data',true,
  'accesses_personal_account_data',true,
  'requires_customer_authentication',true
) where code='PERSONAL_ACCOUNT_DATA';

update public.aic_capabilities set fact_patch=jsonb_build_object(
  'accepts_meter_reading',true,
  'handles_metering_information',true,
  'requires_input_confirmation',true,
  'processes_personal_data',true
) where code='METER_READING_INTAKE';

update public.aic_capabilities set fact_patch=jsonb_build_object(
  'accepts_complaints',true,
  'provides_case_acknowledgement',true,
  'requires_human_handoff',true,
  'processes_personal_data',true
) where code='COMPLAINT_INTAKE';

update public.aic_capabilities set fact_patch=jsonb_build_object(
  'handles_disconnection_information',true,
  'makes_legally_effective_decisions',false,
  'can_disconnect_service',false
) where code='DEBT_DISCONNECTION_SUPPORT';

update public.aic_capabilities set fact_patch=jsonb_build_object(
  'handles_vulnerable_customer_matters',true,
  'may_process_vulnerability_data',true,
  'requires_human_handoff',true,
  'makes_legally_effective_decisions',false
) where code='VULNERABLE_CUSTOMER_SUPPORT';

update public.aic_capabilities set fact_patch=jsonb_build_object(
  'generates_content',true,
  'uses_generative_ai',true
) where code='GENERATIVE_RESPONSES';

-- Minden profil közös, bizonyított működési korlátai.
update public.aic_usage_profiles
set fact_patch=coalesce(fact_patch,'{}'::jsonb)||jsonb_build_object(
  'processes_personal_data',true,
  'makes_legally_effective_decisions',false,
  'uses_controlled_knowledge_sources',true,
  'requires_human_handoff',true,
  'profile_conditions_confirmed',true
),
updated_at=now()
where active and system_type_code='CUSTOMER_CHATBOT' and industry_code='energy';

-- Nyilvános tájékoztató: személyes fiókadatot nem ér el, de a beszélgetési bemenetet kezeli.
update public.aic_usage_profiles set
  description_hu='Nyilvános energetikai és ügyintézési információkat ad; azonosított ügyfél fiókadatait nem éri el.',
  required_assertions=to_jsonb(array[
    'Ügyfélkapcsolati chatbotként, energetikai környezetben működik.',
    'Kizárólag nyilvános és általános tájékoztatást ad.',
    'Azonosított ügyfél fiók-, szerződés-, számla- vagy fogyasztási adatait nem éri el.',
    'A felhasználói bemenet adatvédelmi kezelését dokumentálták.',
    'Ellenőrzött vállalati vagy hivatalos tudásforrásokat használ.',
    'Pénzügyi vagy joghatású döntést nem hoz, és szükség esetén emberi ügyintézőhöz továbbít.'
  ]),
  fact_patch=(fact_patch-'processes_personal_data')||jsonb_build_object(
    'processes_personal_data',true,
    'accesses_personal_account_data',false,
    'requires_customer_authentication',false
  ),
  updated_at=now()
where code='ENERGY_CHAT_PUBLIC_INFO';

-- Számla és fogyasztás: csak azonosítás után, olvasási és magyarázati célból.
update public.aic_usage_profiles set
  fact_patch=fact_patch||jsonb_build_object(
    'requires_customer_authentication',true,
    'accesses_personal_account_data',true,
    'can_modify_invoice',false
  ),updated_at=now()
where code='ENERGY_CHAT_BILLING_CONSUMPTION';

-- Mérőállás: kötelező visszaigazolás, önálló elszámolási döntés nélkül.
update public.aic_usage_profiles set
  fact_patch=fact_patch||jsonb_build_object(
    'requires_customer_authentication',true,
    'accesses_personal_account_data',true,
    'requires_input_confirmation',true
  ),updated_at=now()
where code='ENERGY_CHAT_METER_READING';

-- Panasz: az ügyet rögzíti és visszaigazolja, de nem bírálja el.
update public.aic_usage_profiles set
  fact_patch=fact_patch||jsonb_build_object(
    'requires_customer_authentication',true,
    'accesses_personal_account_data',true,
    'provides_case_acknowledgement',true
  ),updated_at=now()
where code='ENERGY_CHAT_COMPLAINT_INTAKE';

-- Tartozás/kikapcsolás: kizárólag tájékoztat, döntés és szolgáltatáskapcsolás nélkül.
update public.aic_usage_profiles set
  fact_patch=fact_patch||jsonb_build_object(
    'requires_customer_authentication',true,
    'accesses_personal_account_data',true,
    'can_disconnect_service',false
  ),updated_at=now()
where code='ENERGY_CHAT_DEBT_DISCONNECTION';

-- Védendő fogyasztó: az általános támogatás nem követel fiókadatot;
-- az opcionális PERSONAL_ACCOUNT_DATA funkció teszi azonosított ügyintézéssé.
update public.aic_usage_profiles set
  fact_patch=(fact_patch-'requires_customer_authentication')||jsonb_build_object(
    'requires_customer_authentication',false,
    'accesses_personal_account_data',false,
    'may_process_vulnerability_data',true
  ),
  required_assertions=to_jsonb(array[
    'Ügyfélkapcsolati chatbotként, energetikai környezetben működik.',
    'Védendő fogyasztói státusszal vagy kedvezménnyel kapcsolatos ügyet felismer.',
    'Jogosultságot vagy kedvezményt nem állapít meg.',
    'Szükségtelen érzékeny vagy különleges adatot nem kér.',
    'Azonosított ügyféladatot csak a Személyes ügyféladatok elérése funkcióval és megfelelő azonosítás után használ.',
    'Az ügyet megfelelő emberi ügyintézőhöz továbbítja.'
  ]),updated_at=now()
where code='ENERGY_CHAT_VULNERABLE_SUPPORT';

-- Kombinált: csak a ténylegesen kiválasztott funkciók aktívak.
update public.aic_usage_profiles set
  required_assertions=to_jsonb(array[
    'Energetikai ügyfélszolgálati chatbotként működik.',
    'Legalább két dokumentált ügyfélszolgálati funkciót támogat.',
    'Csak a külön kiválasztott és igazolt funkciók tekinthetők aktívnak.',
    'Személyes fiókadatot kizárólag a megfelelő funkció és ügyfél-azonosítás mellett használ.',
    'Önálló joghatású döntést nem hoz.',
    'Bizonytalan, vitás vagy egyedi ügyet emberi ügyintézőhöz továbbít.'
  ]),updated_at=now()
where code='ENERGY_CHAT_COMBINED';

-- Komplex: a leírás és a kötelező funkciók most azonos jelentésűek.
update public.aic_usage_profiles set
  description_hu='A teljes felsorolt energetikai ügyfélszolgálati funkciókört támogatja, önálló joghatású döntés nélkül.',
  required_assertions=to_jsonb(array[
    'Ügyfélkapcsolati chatbotként, energetikai környezetben működik.',
    'Minden felsorolt ügytípust ténylegesen és dokumentáltan támogat.',
    'Személyes ügyféladatot csak megfelelő azonosítás után használ.',
    'Hiteles vállalati és hivatalos forrásokat használ.',
    'Számlát nem módosít, panaszt vagy jogosultságot nem bírál el, kikapcsolásról nem dönt.',
    'Minden joghatású, vitás vagy bizonytalan ügyet emberi ügyintézőhöz továbbít.'
  ]),
  fact_patch=fact_patch||jsonb_build_object(
    'requires_customer_authentication',true,
    'accesses_personal_account_data',true,
    'requires_input_confirmation',true,
    'provides_case_acknowledgement',true,
    'may_process_vulnerability_data',true,
    'can_modify_invoice',false,
    'can_disconnect_service',false
  ),updated_at=now()
where code='ENERGY_CHAT_FULL_SERVICE';

-- GDPR-modulok csak tényleges személyesadat-kezelés esetén.
update public.aic_policy_modules
set applicability=jsonb_build_object(
  'system_type_codes',jsonb_build_array('CUSTOMER_CHATBOT'),
  'required_facts',jsonb_build_object('processes_personal_data',true)
),version=version+1,updated_at=now()
where module_code in (
  'CHATBOT_DATA_PROTECTION','CHATBOT_LAWFUL_DATA_PROCESSING','CHATBOT_PRIVACY_NOTICE',
  'CHATBOT_DATA_SECURITY_RETENTION','CHATBOT_DATA_SUBJECT_RIGHTS',
  'CHATBOT_DPIA_SCREENING','CHATBOT_PRIVACY_INCIDENT'
);

-- Nemzetközi adattovábbítás csak dokumentált EGT-n kívüli továbbításnál.
update public.aic_policy_modules
set applicability=jsonb_build_object(
  'system_type_codes',jsonb_build_array('CUSTOMER_CHATBOT'),
  'required_facts',jsonb_build_object(
    'processes_personal_data',true,
    'international_data_transfer',true
  )
),version=version+1,updated_at=now()
where module_code='CHATBOT_INTERNATIONAL_TRANSFER';

-- Egyszeri, determinisztikus újraépítés minden aktív profilos rendszerhez.
do $cleanup$
declare
  r record;
  v_selected text[];
  v_facts jsonb;
  v_capability record;
begin
  for r in
    select s.id,s.name,s.industry_code,s.usage_profile_code,s.created_by,o.industry organisation_industry,
           p.fact_patch,t.default_facts
    from public.aic_ai_systems s
    join public.aic_organisations o on o.id=s.organisation_id
    join public.aic_usage_profiles p on p.code=s.usage_profile_code and p.active
    join public.aic_system_type_templates t on t.id=s.system_type_id and t.active
    where s.inventory_status='active'
  loop
    select coalesce(array_agg(capability_code order by capability_code),'{}'::text[])
    into v_selected from public.aic_ai_system_capabilities where system_id=r.id;

    v_facts:=coalesce(r.default_facts,'{}'::jsonb)
      ||jsonb_build_object('industry',coalesce(r.industry_code,r.organisation_industry),'system_name',r.name)
      ||coalesce(r.fact_patch,'{}'::jsonb);

    for v_capability in
      select fact_patch from public.aic_capabilities
      where code=any(v_selected) and active order by sort_order,code
    loop
      v_facts:=v_facts||coalesce(v_capability.fact_patch,'{}'::jsonb);
    end loop;

    v_facts:=v_facts||jsonb_build_object(
      'capability_codes',to_jsonb(v_selected),
      'usage_profile_code',r.usage_profile_code,
      'profile_conditions_confirmed',false,
      'profile_confirmation_method','revalidation_required',
      'profile_revalidation_required',true
    );

    insert into public.aic_system_facts(system_id,facts,completion_status,updated_by,updated_at)
    values(r.id,v_facts,'complete',r.created_by,now())
    on conflict(system_id) do update set
      facts=excluded.facts,completion_status='complete',
      updated_by=coalesce(public.aic_system_facts.updated_by,r.created_by),updated_at=now();
  end loop;
end;
$cleanup$;

commit;
