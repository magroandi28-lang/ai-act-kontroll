-- EnergiaAI Kontroll – szerepköri szűrés hiánya a moduloknál.
--
-- A HIBA
-- A szabály szerepköre az aic_compliance_rules.actor_role mezőben van, de a
-- motor a modul applicability mezőjéből dolgozik. 33 modulnál a szabály
-- szerepkörhöz kötött – gyártó, importőr, forgalmazó, meghatalmazott képviselő
-- –, az applicability viszont nem szűr rá. Emiatt egy alkalmazó cég olyan
-- szabályokat is megkap, amelyek nem rá vonatkoznak.
--
-- HOGYAN DERÜLT KI
-- Egy energetikai ügyfélszolgálati chatbotra illeszkedett a "Kettős
-- szabályozás alá eső termékek" szabály, ami kifejezetten szolgáltatói
-- kötelezettség.
--
-- A JAVÍTÁS
-- Minden ilyen modul applicability mezőjébe bekerül az actor_roles szűrő a
-- szabály szerepköre alapján.
--
-- EGY JOGI FINOMSÁG
-- A termékgyártót az MI-rendelet 25. cikk (3) bekezdése szolgáltatónak
-- tekinti, ha a rendszer az I. mellékletes termék biztonsági alkotóeleme.
-- Ezért a szolgáltatói szabályok a product_manufacturer szerepkörre is
-- vonatkoznak.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

update public.aic_policy_modules m
set applicability = m.applicability || jsonb_build_object('actor_roles',
      case r.actor_role
        when 'provider' then '["provider","product_manufacturer"]'::jsonb
        when 'product_manufacturer' then '["product_manufacturer","provider"]'::jsonb
        else to_jsonb(array[r.actor_role])
      end),
    version = m.version + 1,
    updated_at = now()
from public.aic_compliance_rules r
where r.id = m.rule_id
  and r.actor_role <> 'any'
  and not (m.applicability ? 'actor_roles');

-- ---------------------------------------------------------------------------
-- Ellenőrzés: maradt-e szerepkörhöz kötött szabály szűrő nélkül, és hogyan
-- változott az illeszkedés a meglévő rendszereken.
-- ---------------------------------------------------------------------------
select count(*) as maradt_szuro_nelkul
from public.aic_policy_modules m join public.aic_compliance_rules r on r.id = m.rule_id
where r.actor_role <> 'any' and not (m.applicability ? 'actor_roles');

select s.name as rendszer, s.organisation_role as szerepkor,
       (select count(*) from public.aic_policy_modules m
        where public.aic_applicability_matches(m.applicability, public.aic_system_profile(s.id))
          and m.lifecycle_status in ('approved','under_review')) as illeszkedo_szabaly
from public.aic_ai_systems s
where s.inventory_status = 'active'
order by 3 desc limit 5;

commit;
