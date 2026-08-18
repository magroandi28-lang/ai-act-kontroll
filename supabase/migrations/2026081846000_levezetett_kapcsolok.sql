-- EnergiaAI Kontroll – a levezetett kapcsolók tényleges kiszámítása.
--
-- A HIBA
-- Tizenkét kapcsolót levezetettnek jelöltünk, de csak a nagy kockázatú
-- besorolást és a szerepkör-tényeket számolta ki bármi. A többihez soha nem
-- keletkezett érték, ezért az azokra épülő szabályok – körülbelül tizenöt –
-- ma sem lépnek működésbe.
--
-- Ez különösen az energetikánál fájó: egy fogyasztóknak szóló chatbotra
-- alkalmazandó lenne az akadálymentességi törvény és a kiberbiztonsági
-- törvény, de egyik szabály sem indul be, mert a hatályt senki nem állapítja
-- meg.
--
-- MIBŐL VEZETJÜK LE
-- A szervezet adataiból: ország, ágazat, létszámsáv. Ezek a felvitelnél már
-- megvannak, tehát nem kell új kérdés.
--
-- MIT NEM DÖNTÜNK EL
-- A jogi minősítéseket javaslatként állítjuk be, nem véglegesként. Aki
-- ellenőrzi, felülírhatja – a megadott érték mindig elsőbbséget élvez a
-- levezetettel szemben. A GPAI-szolgáltatói minőséget nem vezetjük le
-- automatikusan igazra: külső modell használata attól még nem tesz senkit
-- modellszolgáltatóvá.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

create or replace function public.aic_szervezeti_tenyek(p_organisation_id uuid, p_szerep text)
returns jsonb
language sql stable
set search_path = public, pg_temp
as $function$
  select jsonb_build_object(
    -- Uniós hatály. Magyar vagy más EGT-beli székhelynél igaz.
    'eu_scope_connection_exists',
      coalesce(o.country_code, 'HU') in ('HU','AT','BE','BG','HR','CY','CZ','DK','EE','FI','FR','DE',
        'GR','IE','IT','LV','LT','LU','MT','NL','PL','PT','RO','SK','SI','ES','SE','IS','LI','NO'),
    'EU_SCOPE_APPLIES',
      coalesce(o.country_code, 'HU') in ('HU','AT','BE','BG','HR','CY','CZ','DK','EE','FI','FR','DE',
        'GR','IE','IT','LV','LT','LU','MT','NL','PL','PT','RO','SK','SI','ES','SE','IS','LI','NO'),
    'entity_established_in_eu',
      coalesce(o.country_code, 'HU') in ('HU','AT','BE','BG','HR','CY','CZ','DK','EE','FI','FR','DE',
        'GR','IE','IT','LV','LT','LU','MT','NL','PL','PT','RO','SK','SI','ES','SE','IS','LI','NO'),
    'NO_EU_ESTABLISHMENT',
      coalesce(o.country_code, 'HU') not in ('HU','AT','BE','BG','HR','CY','CZ','DK','EE','FI','FR','DE',
        'GR','IE','IT','LV','LT','LU','MT','NL','PL','PT','RO','SK','SI','ES','SE','IS','LI','NO'),

    -- Közszolgáltatói tevékenység. A fogyasztóvédelmi törvény szigorúbb
    -- ügyfélszolgálati szabályai ehhez kötődnek.
    'IS_PUBLIC_SERVICE_PROVIDER',
      coalesce(o.industry,'') in ('energy','water','waste','telecom','public_transport','district_heating'),

    -- Kiberbiztonsági törvény hatálya. A 2. és 3. melléklet szerinti ágazat és
    -- a középvállalkozási küszöb együtt. Mikro- és kisvállalkozás jellemzően
    -- mentesül, de az energetikai engedélyes méretétől függetlenül érintett
    -- lehet – ezért ott a küszöböt nem alkalmazzuk.
    'subject_to_cybersecurity_act',
      coalesce(o.industry,'') in ('energy','water','waste','telecom','health','transport','banking',
                                  'digital_infrastructure','public_administration')
      and (coalesce(o.industry,'') = 'energy'
           or coalesce(o.employee_count_range,'') in ('50-249','250-499','500+')),
    'SUBJECT_TO_CYBERSECURITY_ACT',
      coalesce(o.industry,'') in ('energy','water','waste','telecom','health','transport','banking',
                                  'digital_infrastructure','public_administration')
      and (coalesce(o.industry,'') = 'energy'
           or coalesce(o.employee_count_range,'') in ('50-249','250-499','500+')),

    -- Akadálymentességi törvény hatálya. Fogyasztóknak nyújtott szolgáltatás,
    -- mikrovállalkozás mentesül.
    'subject_to_accessibility_requirements',
      coalesce(o.employee_count_range,'') <> '1-9'
      and coalesce(o.industry,'') in ('energy','water','telecom','banking','insurance','transport',
                                      'retail','ecommerce','public_administration','district_heating'),
    'SUBJECT_TO_ACCESSIBILITY',
      coalesce(o.employee_count_range,'') <> '1-9'
      and coalesce(o.industry,'') in ('energy','water','telecom','banking','insurance','transport',
                                      'retail','ecommerce','public_administration','district_heating'),

    -- Bejelentővédelem: ötven fő felett.
    'organisation_subject_to_whistleblower_rules',
      coalesce(o.employee_count_range,'') in ('50-249','250-499','500+'),
    'WHISTLEBLOWER_RULES_APPLY',
      coalesce(o.employee_count_range,'') in ('50-249','250-499','500+'),

    -- Közfeladatot ellátó szerv.
    'PUBLIC_BODY', coalesce(o.industry,'') = 'public_administration',
    'operator_is_eu_institution_body_office_or_agency', false,

    -- Importőri és forgalmazói minőség a bejelentett szerepkörből.
    'ORG_IS_IMPORTER_DISTRIBUTOR', p_szerep in ('importer','distributor'),
    'places_third_country_branded_ai_system_on_eu_market', p_szerep = 'importer',

    -- Általános célú modell szolgáltatója. Nem vezetjük le igazra: külső modell
    -- használata nem tesz senkit modellszolgáltatóvá. Alapértelmezésben hamis,
    -- felülírható.
    'ORG_IS_GPAI_PROVIDER', false,
    'organisation_is_gpai_provider', false,
    'non_eu_gpai_provider_requires_representative', false,
    'GPAI_SYSTEMIC_RISK', false,
    'gpai_model_has_systemic_risk', false,
    'gpai_systemic_threshold_reached', false
  )
  from public.aic_organisations o
  where o.id = p_organisation_id;
$function$;

comment on function public.aic_szervezeti_tenyek(uuid, text) is
  'A szervezet adataiból – ország, ágazat, létszámsáv – levezetett tények. Javaslat jellegű: a ténylapon megadott érték felülírja.';

-- ---------------------------------------------------------------------------
-- A ténylap kiegészítése a szervezeti tényekkel.
-- ---------------------------------------------------------------------------
create or replace function public.aic_system_profile(p_ai_system_id uuid)
returns jsonb
language plpgsql stable
set search_path = public, pg_temp
as $function$
declare
  v_alap jsonb; v_szerep text; v_teljes jsonb; v_org uuid;
  v_szolgaltato boolean; v_alkalmazo boolean; v_online boolean;
begin
  select coalesce(f.facts, '{}'::jsonb)
       || jsonb_build_object(
            'system_type_code', t.type_code,
            'industry', coalesce(s.industry_code, o.industry, 'unknown'),
            'organisation_role', coalesce(s.organisation_role, 'unknown'),
            'lifecycle_stage', s.lifecycle_stage
          ),
       s.organisation_id,
       coalesce(s.deployment_context,'') not in ('internal','on_premise')
  into v_alap, v_org, v_online
  from public.aic_ai_systems s
  join public.aic_organisations o on o.id = s.organisation_id
  join public.aic_system_type_templates t on t.id = s.system_type_id
  left join public.aic_system_facts f on f.system_id = s.id
  where s.id = p_ai_system_id and s.inventory_status = 'active';

  if v_alap is null then return null; end if;

  v_szerep := v_alap ->> 'organisation_role';
  v_szolgaltato := v_szerep in ('provider','product_manufacturer','multiple');
  v_alkalmazo   := v_szerep in ('deployer','multiple');

  v_teljes := jsonb_build_object(
      'is_ai_system', true, 'IS_AI_SYSTEM', true,
      'persons_operate_or_use_ai_on_behalf', true,
      'ai_compliance_database_in_use', true,
      'use_is_purely_personal_non_professional', false,
      'purpose_exclusively_military_defence_or_national_security', false,
      'ELECTRONIC_SERVICE_PROVIDER', v_online
    )
    || public.aic_szervezeti_tenyek(v_org, v_szerep)
    || jsonb_build_object(
      'organisation_is_provider', v_szolgaltato,
      'uses_ai_system_under_own_authority', v_alkalmazo,
      'is_provider_or_importer', v_szerep in ('provider','importer','product_manufacturer','multiple'),
      'develops_or_has_ai_system_developed', v_szolgaltato,
      'places_on_market_or_puts_into_service_under_own_name', v_szolgaltato,
      'makes_ai_system_available_on_eu_market',
        v_szerep in ('provider','importer','distributor','product_manufacturer','multiple'),
      'in_ai_supply_chain', v_szerep <> 'unknown'
    )
    || jsonb_build_object(
      'before_market_or_putting_into_service',
        coalesce(v_alap ->> 'lifecycle_stage', '') in ('planning','development','testing')
    )
    || v_alap;

  v_teljes := public.aic_tenylap_nevfeloldas(v_teljes);
  v_teljes := public.aic_nagy_kockazatu(v_teljes) || v_teljes;
  v_teljes := public.aic_tenylap_nevfeloldas(v_teljes);

  return v_teljes;
end;
$function$;

-- ---------------------------------------------------------------------------
-- Ellenőrzés: maradt-e levezetettnek jelölt kapcsoló érték nélkül.
-- ---------------------------------------------------------------------------
with x as (select aic_system_profile(id) p from aic_ai_systems where inventory_status='active' limit 1)
select c.trigger_key, c.name_hu
from aic_trigger_catalogue c, x
where c.derived = true
  and not (x.p ? c.trigger_key)
  and not exists (select 1 from unnest(c.legacy_fact_keys) k where x.p ? k)
order by 1;

select s.name as rendszer,
       (select count(*) from public.aic_policy_modules m
        where public.aic_applicability_matches(m.applicability, public.aic_system_profile(s.id))
          and m.lifecycle_status in ('approved','under_review')) as illeszkedo_szabaly
from public.aic_ai_systems s where s.inventory_status='active'
order by 2 desc limit 5;

commit;
