-- EnergiaAI Kontroll – harmadik köteg: az MI-rendelet három hiánya.
--
-- MI VAN BENNE
-- 1. Korrekciós kötelezettség hatósági eljárásban – 79-83. cikk
-- 2. Már működő rendszerek megfelelési határideje – 111. cikk
-- 3. Kettős szabályozás alá eső termékek – 8. cikk (2) és I. melléklet
--
-- MIÉRT VOLTAK LÁTHATATLANOK
-- Mindhárom olyan helyen áll, amit elsőre hatóságinak vagy technikainak lehet
-- nézni. A 79-83. cikk piacfelügyeleti eljárást ír le, de a gazdasági szereplőt
-- kötelezi korrekcióra. A 111. cikk átmeneti rendelkezés, mégis minden ma
-- működő rendszert érint. Az I. melléklet jegyzék, de a 8. cikk (2) bekezdésén
-- keresztül a gyártói oldal alapja.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

insert into public.aic_legal_provisions
  (source_id, provision_key, article_number, heading, provision_text,
   text_fidelity, language_code, deep_link)
select s.id, v.kulcs, v.cikk, v.cim, v.szoveg, 'expert_paraphrase', 'hu',
       'https://eur-lex.europa.eu/eli/reg/2024/1689/oj/hun#' || v.horgony
from public.aic_legal_sources s,
(values
 ('AIA_ART79_CORRECTIVE','79','A kockázatot jelentő MI-rendszerek kezelése','art_79',
  'Ha a piacfelügyeleti hatóságnak elegendő oka van úgy megítélni, hogy egy MI-rendszer kockázatot jelent, elvégzi az értékelést. A gazdasági szereplőnek biztosítania kell, hogy az általa forgalmazott valamennyi érintett MI-rendszer tekintetében minden megfelelő korrekciós intézkedést meghozzon, az előírt határidőn belül. Ha ez elmarad, a hatóság átmeneti intézkedéseket hoz, ideértve a forgalomból kivonást és a visszahívást.'),
 ('AIA_ART83_FORMAL','83','Alaki meg nem felelés','art_83',
  'Ha a piacfelügyeleti hatóság alaki hiányosságot állapít meg – így a CE-jelölés hiányát vagy szabálytalan feltüntetését, az EU-megfelelőségi nyilatkozat hiányát, a nyilvántartásba vétel elmaradását vagy a meghatalmazott képviselő hiányát –, meg kell követelnie a szolgáltatótól, hogy a meg nem felelést megszüntesse. Ha a hiányosság fennmarad, a hatóság korlátozza vagy megtiltja a forgalmazást, illetve elrendeli a visszahívást.'),
 ('AIA_ART111_TRANSITIONAL','111','Már forgalomba hozott vagy üzembe helyezett rendszerek','art_111',
  'A rendelet a hatálybalépése előtt forgalomba hozott vagy üzembe helyezett MI-rendszerekre meghatározott átmeneti feltételekkel alkalmazandó. A X. mellékletben felsorolt jogi aktusokkal létrehozott nagy méretű informatikai rendszerek alkotóelemeire külön határidő vonatkozik. Az egyéb, már forgalomban lévő nagy kockázatú rendszerekre a rendelet akkor alkalmazandó, ha azok kialakítását jelentősen módosítják. A 2025. augusztus 2. előtt forgalomba hozott általános célú MI-modellek szolgáltatóinak 2027. augusztus 2-ig kell megtenniük a megfeleléshez szükséges lépéseket.'),
 ('AIA_ANNEX_I_HARMONISATION','Annex I','Az uniós harmonizációs jogszabályok jegyzéke','anx_I',
  'Az I. melléklet A. szakasza felsorolja azokat az uniós harmonizációs jogszabályokat – így a gépekre, a játékokra, a felvonókra, az egyéni védőeszközökre, a rádióberendezésekre és az orvostechnikai eszközökre vonatkozókat –, amelyek hatálya alá tartozó termék biztonsági alkotóelemeként működő MI-rendszer nagy kockázatúnak minősül. A 8. cikk (2) bekezdése szerint ilyen esetben a szolgáltató felelős azért, hogy a termék mind e rendelet, mind az alkalmazandó harmonizációs jogszabály valamennyi követelményének megfeleljen, és a dokumentációt összevonhatja.')
) as v(kulcs,cikk,cim,horgony,szoveg)
where s.celex_number='02024R1689-20260727'
  and not exists (select 1 from public.aic_legal_provisions p
                  where p.source_id=s.id and p.provision_key=v.kulcs);

-- ===========================================================================
-- 1. KORREKCIÓS KÖTELEZETTSÉG (79-83.)
-- ===========================================================================
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review, legal_interpretation_note)
select 'AIA_MARKET_SURVEILLANCE_CORRECTION',
       'Korrekciós kötelezettség piacfelügyeleti eljárásban',
       'Hatósági eljárás esetén határidőn belül korrekciós intézkedést kell hozni, és fel kell készülni a kivonásra, visszahívásra és a tájékoztatásra.',
       'any', 'requirement', 'AND', 'under_review', true,
       'A 79-83. cikk elsősorban a piacfelügyeleti hatóság eljárását szabályozza. A gazdasági szereplő kötelezettsége a 79. cikk (4) bekezdéséből és a 83. cikkből következik. A szabály ezt előrehozza: a korrekciós képességet nem az eljárás megindulásakor kell kialakítani, hanem előre. Ez értelmezés, de a határidős teljesítés máshogy nem biztosítható.'
where not exists (select 1 from public.aic_compliance_rules where rule_code='AIA_MARKET_SURVEILLANCE_CORRECTION');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'AIA_CORRECTIVE_ACTION','Korrekciós intézkedés hatósági eljárásban','corrective_action','legal_requirement',
       'Előre ki kell alakítani a korrekciós képességet: felelős, határidő, kivonás, visszahívás, tájékoztatás.',
       'A {{organisation_name}} felkészül arra, hogy a {{system_name}} vonatkozásában indított piacfelügyeleti eljárásban a hatóság által megállapított határidőn belül korrekciós intézkedést hozzon. Ennek érdekében előre meghatározza, ki jogosult a rendszer korlátozásáról, felfüggesztéséről vagy kivonásáról dönteni, és milyen technikai lépésekkel valósítható meg a rendszer működésének leállítása vagy visszaállítása korábbi állapotba. A {{organisation_name}} nyilvántartja, mely szervezeti egységeknél és mely csatornákon érhető el a {{system_name}}, hogy a korlátozás vagy a visszahívás teljes körű lehessen. Alaki hiányosság – így a CE-jelölés, az EU-megfelelőségi nyilatkozat, a nyilvántartásba vétel vagy a meghatalmazott képviselő hiánya – megállapítása esetén a {{organisation_name}} a hiányosságot a hatóság által előírt határidőn belül megszünteti. A hatósággal folytatott levelezést és a megtett intézkedéseket dokumentálni kell.',
       r.id, '{"required_facts":{"is_ai_system":true}}'::jsonb, 150, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code='AIA_MARKET_SURVEILLANCE_CORRECTION'
  and not exists (select 1 from public.aic_policy_modules where module_code='AIA_CORRECTIVE_ACTION');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, case when p.provision_key='AIA_ART79_CORRECTIVE' then 'primary' else 'supporting' end
from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code='AIA_MARKET_SURVEILLANCE_CORRECTION'
  and p.provision_key in ('AIA_ART79_CORRECTIVE','AIA_ART83_FORMAL')
  and not exists (select 1 from public.aic_rule_legal_bases b where b.rule_id=r.id and b.provision_id=p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio from public.aic_compliance_rules r,
(values
 ('CORR_DECISION_OWNER','A döntési jogkör kijelölése',
  'Meg kell nevezni, ki jogosult a rendszer korlátozásáról, felfüggesztéséről vagy kivonásáról dönteni, és milyen helyettesítési rendben.','critical'),
 ('CORR_TECHNICAL_CAPABILITY','A leállítás technikai képessége',
  'Ki kell alakítani és ki kell próbálni, hogyan állítható le a rendszer vagy állítható vissza korábbi állapotba.','high'),
 ('CORR_DEPLOYMENT_INVENTORY','A használati helyek nyilvántartása',
  'Nyilván kell tartani, mely szervezeti egységeknél és mely csatornákon érhető el a rendszer, hogy a korlátozás teljes körű lehessen.','high'),
 ('CORR_AUTHORITY_RECORD','A hatósági eljárás dokumentálása',
  'A hatósággal folytatott levelezést és a megtett intézkedéseket dokumentálni kell.','medium')
) as v(kod,cim,leiras,prio)
where r.rule_code='AIA_MARKET_SURVEILLANCE_CORRECTION'
  and not exists (select 1 from public.aic_required_actions a where a.rule_id=r.id and a.action_code=v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id,'CORR_PLAN','Korrekciós eljárásrend',
       'A leállításra, korlátozásra és visszahívásra vonatkozó eljárásrend, felelősökkel és határidőkkel.',array['pdf','docx'],true
from public.aic_compliance_rules r
where r.rule_code='AIA_MARKET_SURVEILLANCE_CORRECTION'
  and not exists (select 1 from public.aic_required_evidence e where e.rule_id=r.id and e.evidence_code='CORR_PLAN');

-- ===========================================================================
-- 2. MÁR MŰKÖDŐ RENDSZEREK (111.)
-- ===========================================================================
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review, legal_interpretation_note)
select 'AIA_ART111_EXISTING_SYSTEMS',
       'Már működő MI-rendszerek megfelelési határideje',
       'A rendelet hatálybalépése előtt bevezetett rendszereknél meg kell határozni, mikortól kell megfelelniük, és a jelentős módosítást figyelni kell.',
       'any', 'classification', 'AND', 'under_review', true,
       'A 111. cikk a jelentős módosításhoz köti az alkalmazandóságot a már forgalomban lévő nagy kockázatú rendszerekre. Annak megítélése, mi minősül jelentős módosításnak, tényállásfüggő; a modellcsere és a rendeltetés bővítése mint tipikus eset értelmezés.'
where not exists (select 1 from public.aic_compliance_rules where rule_code='AIA_ART111_EXISTING_SYSTEMS');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'AIA_EXISTING_SYSTEMS','Már működő rendszerek','existing_systems','legal_requirement',
       'Rögzíteni kell a bevezetés időpontját és a megfelelési határidőt, és figyelni a jelentős módosítást.',
       'A {{organisation_name}} rögzíti, hogy a {{system_name}} mikor került forgalomba hozatalra vagy üzembe helyezésre, és ennek alapján meghatározza, mely időponttól kell a rendszernek az MI-rendeletnek megfelelnie. A rendelet alkalmazásának kezdete előtt bevezetett, nagy kockázatú rendszerre a rendelet akkor alkalmazandó, ha a rendszer kialakítását jelentősen módosítják; a {{organisation_name}} figyelemmel kíséri az ilyen módosításokat, és a modell cseréjét, a rendeltetés bővítését vagy új adatforrás bevonását ebből a szempontból megvizsgálja. Ha a {{system_name}} általános célú MI-modellre épül, amelyet 2025. augusztus 2. előtt hoztak forgalomba, a {{organisation_name}} nyomon követi, hogy a modell szolgáltatója a 2027. augusztus 2-i határidőig megtette-e a megfeleléshez szükséges lépéseket, és ezt a szerződésben biztosítja.',
       r.id, '{"required_facts":{"is_ai_system":true}}'::jsonb, 20, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code='AIA_ART111_EXISTING_SYSTEMS'
  and not exists (select 1 from public.aic_policy_modules where module_code='AIA_EXISTING_SYSTEMS');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary' from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code='AIA_ART111_EXISTING_SYSTEMS' and p.provision_key='AIA_ART111_TRANSITIONAL'
  and not exists (select 1 from public.aic_rule_legal_bases b where b.rule_id=r.id and b.provision_id=p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio from public.aic_compliance_rules r,
(values
 ('EXIST_RECORD_DATE','A bevezetés időpontjának rögzítése',
  'Rögzíteni kell, mikor került a rendszer üzembe, és ebből mely megfelelési határidő következik.','critical'),
 ('EXIST_CHANGE_WATCH','A jelentős módosítás figyelése',
  'A modell cseréjét, a rendeltetés bővítését és új adatforrás bevonását meg kell vizsgálni abból a szempontból, hogy jelentős módosításnak minősül-e.','high'),
 ('EXIST_GPAI_DEADLINE','A modellszolgáltató határidejének követése',
  'Ha a rendszer 2025. augusztus 2. előtt forgalomba hozott általános célú modellre épül, nyomon kell követni a szolgáltató 2027. augusztus 2-i megfelelését.','medium')
) as v(kod,cim,leiras,prio)
where r.rule_code='AIA_ART111_EXISTING_SYSTEMS'
  and not exists (select 1 from public.aic_required_actions a where a.rule_id=r.id and a.action_code=v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id,'EXIST_TIMELINE','Bevezetési és módosítási napló',
       'A rendszer bevezetésének időpontja és a jelentősnek minősített módosítások listája, dátummal.',array['xlsx','pdf','docx'],true
from public.aic_compliance_rules r
where r.rule_code='AIA_ART111_EXISTING_SYSTEMS'
  and not exists (select 1 from public.aic_required_evidence e where e.rule_id=r.id and e.evidence_code='EXIST_TIMELINE');

-- ===========================================================================
-- 3. KETTŐS SZABÁLYOZÁS ALÁ ESŐ TERMÉKEK (8. cikk (2), I. melléklet)
-- ===========================================================================
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review, legal_interpretation_note)
select 'AIA_ART8_DUAL_REGIME_PRODUCTS',
       'Kettős szabályozás alá eső termékek',
       'Ha az MI-rendszer olyan termék alkotóeleme, amelyre uniós harmonizációs jogszabály is vonatkozik, mindkét szabályrendszernek meg kell felelni, és a dokumentáció összevonható.',
       'provider', 'requirement', 'AND', 'under_review', true,
       'A 8. cikk (2) bekezdése a szolgáltatóra ró kötelezettséget. A szabály a gyártói és építőipari irány alapja: gépek, felvonók, orvostechnikai eszközök és védőeszközök esetén a két szabályrendszer együtt alkalmazandó. Az összevont dokumentáció a rendelet szerint lehetőség, nem kötelezettség.'
where not exists (select 1 from public.aic_compliance_rules where rule_code='AIA_ART8_DUAL_REGIME_PRODUCTS');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'AIA_DUAL_REGIME_PRODUCTS','Kettős szabályozás alá eső termékek','dual_regime','legal_requirement',
       'Termékbe épített MI-nél mindkét szabályrendszernek meg kell felelni; a dokumentáció összevonható.',
       'Ha a {{system_name}} olyan termék biztonsági alkotóeleme, vagy olyan termék, amelyre az MI-rendelet I. mellékletének A. szakaszában felsorolt uniós harmonizációs jogszabály – így különösen a gépekre, a felvonókra, az egyéni védőeszközökre, a játékokra, a rádióberendezésekre vagy az orvostechnikai eszközökre vonatkozó jogszabály – is alkalmazandó, a {{organisation_name}} mint szolgáltató felelős azért, hogy a termék mind az MI-rendelet, mind az alkalmazandó harmonizációs jogszabály valamennyi követelményének megfeleljen. A {{organisation_name}} megvizsgálja és írásban rögzíti, hogy a termékre mely harmonizációs jogszabály vonatkozik, és melyik követelmény melyik szabályrendszerből ered. A megfelelés igazolásához szükséges tesztelési és jelentéstételi folyamatokat, információkat és dokumentációt a {{organisation_name}} beépítheti a harmonizációs jogszabály által előírt meglévő dokumentációba és eljárásokba, feltéve, hogy az MI-rendelet szerinti tartalom hiánytalanul azonosítható marad.',
       r.id, '{"required_facts":{"is_ai_system":true}}'::jsonb, 25, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code='AIA_ART8_DUAL_REGIME_PRODUCTS'
  and not exists (select 1 from public.aic_policy_modules where module_code='AIA_DUAL_REGIME_PRODUCTS');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary' from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code='AIA_ART8_DUAL_REGIME_PRODUCTS' and p.provision_key='AIA_ANNEX_I_HARMONISATION'
  and not exists (select 1 from public.aic_rule_legal_bases b where b.rule_id=r.id and b.provision_id=p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio from public.aic_compliance_rules r,
(values
 ('DUAL_IDENTIFY_LEGISLATION','Az alkalmazandó harmonizációs jogszabály azonosítása',
  'Meg kell határozni és írásban rögzíteni, hogy a termékre az I. melléklet A. szakaszából mely jogszabály vonatkozik.','critical'),
 ('DUAL_REQUIREMENT_MAPPING','A követelmények megfeleltetése',
  'Össze kell rendelni, melyik követelmény melyik szabályrendszerből ered, hogy egyik se maradjon ki és ne is duplázódjon.','high'),
 ('DUAL_DOC_INTEGRATION','A dokumentáció összevonása',
  'Ha a meglévő műszaki dokumentációba építik be az MI-rendelet szerinti tartalmat, biztosítani kell, hogy az azonosítható maradjon.','medium')
) as v(kod,cim,leiras,prio)
where r.rule_code='AIA_ART8_DUAL_REGIME_PRODUCTS'
  and not exists (select 1 from public.aic_required_actions a where a.rule_id=r.id and a.action_code=v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id,'DUAL_MAPPING_TABLE','Követelmény-megfeleltetés',
       'Táblázat arról, mely követelmény melyik jogszabályból ered, és hol teljesül.',array['xlsx','pdf','docx'],true
from public.aic_compliance_rules r
where r.rule_code='AIA_ART8_DUAL_REGIME_PRODUCTS'
  and not exists (select 1 from public.aic_required_evidence e where e.rule_id=r.id and e.evidence_code='DUAL_MAPPING_TABLE');

-- ===========================================================================
-- LEFEDETTSÉG
-- ===========================================================================
update public.aic_provision_coverage c
set proposed_status='covered', proposed_reason='A harmadik köteg szabályai lefedik.', updated_at=now()
from public.aic_legal_sources s
where s.id=c.source_id and s.celex_number='02024R1689-20260727'
  and c.article_number in ('79','80','81','82','83','111','Annex I');

select coalesce(proposed_status,'javaslat nélkül') as javaslat, count(*)
from public.aic_provision_coverage group by 1 order by 2 desc;

commit;
