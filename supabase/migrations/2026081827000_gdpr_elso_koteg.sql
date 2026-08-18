-- EnergiaAI Kontroll – első köteg: négy GDPR-szabály, hét jogszabályhely.
--
-- MI VAN BENNE
-- 1. Szerepek az MI-láncban          – 26., 27., 29. cikk
-- 2. Hatósági együttműködés          – 31., 36. cikk
-- 3. Büntetőjogi adatok              – 10. cikk
-- 4. Azonosítást nem igénylő kezelés – 11. cikk
--
-- ALAPELV, AMIT MINDEGYIKRE ALKALMAZTUNK
-- Minden szabálynak meg kell mondania, mit jelent az MI-eszközre. A
-- törvényszöveg megismétlése nem szabály. Ahol a konkretizálás túlmegy a
-- rendelet szövegén, ott a legal_interpretation_note ezt kimondja, hogy a
-- jogász a jóváhagyáskor lássa, min dönt.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ===========================================================================
-- JOGSZABÁLYHELYEK
-- ===========================================================================
insert into public.aic_legal_provisions
  (source_id, provision_key, article_number, heading, provision_text,
   text_fidelity, language_code, deep_link)
select s.id, v.kulcs, v.cikk, v.cim, v.szoveg, 'expert_paraphrase', 'hu',
       'https://eur-lex.europa.eu/eli/reg/2016/679/oj/hun#art_' || v.cikk
from public.aic_legal_sources s,
(values
 ('GDPR_ART26_JOINT','26','Közös adatkezelők',
  'Ha az adatkezelés céljait és eszközeit két vagy több adatkezelő közösen határozza meg, közös adatkezelőnek minősülnek, és megállapodásban, átlátható módon határozzák meg a kötelezettségek megosztását, különösen a tájékoztatás és az érintetti jogok gyakorlása tekintetében. A megállapodás lényegét az érintett rendelkezésére kell bocsátani. Az érintett a megállapodástól függetlenül mindegyik adatkezelővel szemben gyakorolhatja jogait.'),
 ('GDPR_ART27_REPRESENTATIVE','27','Az Unióban tevékenységi hellyel nem rendelkező adatkezelő képviselője',
  'A 3. cikk (2) bekezdése szerinti esetben az adatkezelő vagy az adatfeldolgozó írásban uniós képviselőt jelöl ki abban a tagállamban, ahol az érintettek tartózkodnak. A megbízásnak ki kell terjednie arra, hogy a képviselőhöz a felügyeleti hatóságok és az érintettek fordulhassanak. A kötelezettség nem vonatkozik az alkalmi jellegű, különleges vagy büntetőjogi adatra nem kiterjedő, kockázattal nem járó adatkezelésre, illetve a közhatalmi szervekre.'),
 ('GDPR_ART29_INSTRUCTION','29','Az adatkezelő vagy az adatfeldolgozó irányítása alatt végzett adatkezelés',
  'Az adatfeldolgozó és bármely, az adatkezelő vagy az adatfeldolgozó irányítása alatt eljáró, a személyes adatokhoz hozzáféréssel rendelkező személy ezeket az adatokat kizárólag az adatkezelő utasításának megfelelően kezelheti, kivéve, ha az ettől való eltérésre őt uniós vagy tagállami jog kötelezi.'),
 ('GDPR_ART31_COOPERATION','31','Együttműködés a felügyeleti hatósággal',
  'Az adatkezelő és az adatfeldolgozó, valamint képviselőjük feladatai végrehajtása során a felügyeleti hatósággal – annak megkeresésére – együttműködik.'),
 ('GDPR_ART36_PRIOR_CONSULT','36','Előzetes konzultáció',
  'Ha az adatvédelmi hatásvizsgálat megállapítja, hogy az adatkezelés a kockázat mérséklésére tett intézkedések hiányában valószínűsíthetően magas kockázattal jár, az adatkezelő az adatkezelést megelőzően konzultál a felügyeleti hatósággal. A konzultáció során tájékoztatni kell a hatóságot a felelősségi körökről, az adatkezelés céljairól és eszközeiről, a garanciákról, az adatvédelmi tisztviselő elérhetőségéről és a hatásvizsgálatról.'),
 ('GDPR_ART10_CRIMINAL','10','Büntetőjogi felelősségre és bűncselekményekre vonatkozó adatok',
  'A büntetőjogi felelősség megállapítására vonatkozó határozatokra és a bűncselekményekre vonatkozó személyes adatok kezelésére kizárólag közhatalmi szerv felügyelete mellett kerülhet sor, vagy akkor, ha az adatkezelést az érintett jogai és szabadságai tekintetében megfelelő garanciákat nyújtó uniós vagy tagállami jog lehetővé teszi. A büntetőjogi felelősség megállapítására vonatkozó határozatok teljes körű nyilvántartása kizárólag közhatalmi szerv által végzett adatkezelés keretében történhet.'),
 ('GDPR_ART11_NO_ID','11','Azonosítást nem igénylő adatkezelés',
  'Ha az adatkezelés céljai nem vagy már nem teszik szükségessé az érintett azonosítását, az adatkezelő nem köteles kiegészítő információt megőrizni, beszerezni vagy kezelni pusztán azért, hogy megfeleljen a rendeletnek. Ha bizonyítani tudja, hogy nincs abban a helyzetben, hogy azonosítsa az érintettet, erről lehetőség szerint tájékoztatja őt; ilyen esetben a 15-20. cikk szerinti jogok nem alkalmazandók, kivéve, ha az érintett azonosítás céljából kiegészítő információt nyújt.')
) as v(kulcs,cikk,cim,szoveg)
where s.celex_number = '32016R0679'
  and not exists (select 1 from public.aic_legal_provisions p
                  where p.source_id = s.id and p.provision_key = v.kulcs);

-- ===========================================================================
-- 1. SZEREPEK AZ MI-LÁNCBAN (26., 27., 29.)
--    A 29. cikk MI-specifikus éle: a szállító nem használhatja a beszélgetési
--    naplókat saját modell tanítására, hacsak erről írásban nem rendelkeztek.
--    A rendelet ezt nem nevesíti – az "utasításnak megfelelően" fordulatot
--    bontja ki. Ez a leggyakoribb rejtett kockázat, mert a szállítói
--    szerződések hallgatnak róla.
-- ===========================================================================
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review, legal_interpretation_note)
select 'GDPR_ART26_27_29_ROLES',
       'Adatkezelői szerepek az MI-láncban',
       'Bevezetés előtt írásban tisztázni kell, ki az adatkezelő, a közös adatkezelő és az adatfeldolgozó, és rendelkezni kell arról, hogy a szolgáltató felhasználhatja-e a naplókat saját modell tanítására.',
       'any', 'requirement', 'AND', 'under_review', true,
       'A 29. cikk annyit mond, hogy az adatfeldolgozó az utasításnak megfelelően kezelheti az adatot. A modelltanítás nevesítése értelmezés: azt bontja ki, mit jelent az "utasítás" MI-szolgáltatónál. A közös adatkezelői minőség fennállása tényállásfüggő, azt a szabály nem dönti el – csak azt írja elő, hogy a kérdést bevezetés előtt tisztázni kell.'
where not exists (select 1 from public.aic_compliance_rules where rule_code = 'GDPR_ART26_27_29_ROLES');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'GDPR_CONTROLLER_ROLES', 'Adatkezelői szerepek', 'controller_roles', 'legal_requirement',
       'Tisztázni kell a szerepeket a láncban, és írásban rendelkezni a naplók szolgáltatói felhasználásáról.',
       'A {{organisation_name}} a {{system_name}} bevezetése előtt írásban meghatározza, hogy az eszközzel összefüggő adatkezelés tekintetében ki minősül adatkezelőnek, közös adatkezelőnek és adatfeldolgozónak, ideértve a modell vagy a szolgáltatás nyújtójának szerepét. Ha az adatkezelés céljait és eszközeit a {{organisation_name}} más szervezettel közösen határozza meg, a felek megállapodásban rögzítik a kötelezettségek megosztását – különösen a tájékoztatás és az érintetti jogok gyakorlása tekintetében –, és a megállapodás lényegét az érintett rendelkezésére bocsátják. Az érintett a megállapodás feltételeitől függetlenül bármelyik adatkezelővel szemben gyakorolhatja jogait. Az adatfeldolgozó, valamint a {{organisation_name}} irányítása alatt eljáró, személyes adatokhoz hozzáféréssel rendelkező személy az adatokat kizárólag a {{organisation_name}} utasításának megfelelően kezelheti, kivéve, ha az eltérésre jogszabály kötelezi. Az utasítási rendet írásban kell rögzíteni, és abban kifejezetten rendelkezni kell arról, hogy a szolgáltató a {{system_name}} működése során keletkezett adatokat – így különösen a beszélgetési és interakciós naplókat – felhasználhatja-e saját modell tanítására, továbbfejlesztésére vagy egyéb saját céljára. Ilyen felhasználás csak akkor megengedett, ha arról a {{organisation_name}} írásban rendelkezett, és annak önálló jogalapja van. Ha a {{organisation_name}} nem rendelkezik uniós tevékenységi hellyel, és a szolgáltatás uniós érintettekre irányul vagy magatartásukat figyeli meg, írásban uniós képviselőt jelöl ki.',
       r.id, '{"required_facts":{"processes_personal_data":true}}'::jsonb, 60, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code = 'GDPR_ART26_27_29_ROLES'
  and not exists (select 1 from public.aic_policy_modules where module_code = 'GDPR_CONTROLLER_ROLES');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, case when p.provision_key='GDPR_ART26_JOINT' then 'primary' else 'supporting' end
from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code='GDPR_ART26_27_29_ROLES'
  and p.provision_key in ('GDPR_ART26_JOINT','GDPR_ART27_REPRESENTATIVE','GDPR_ART29_INSTRUCTION')
  and not exists (select 1 from public.aic_rule_legal_bases b where b.rule_id=r.id and b.provision_id=p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio from public.aic_compliance_rules r,
(values
 ('ROLES_WRITTEN_MAPPING','Szerepek írásbeli tisztázása',
  'Bevezetés előtt rögzíteni kell, ki az adatkezelő, a közös adatkezelő és az adatfeldolgozó, és mire terjed ki a szolgáltató szerepe.','critical'),
 ('ROLES_TRAINING_CLAUSE','Rendelkezés a naplók felhasználásáról',
  'A szolgáltatói szerződésben kifejezetten rendelkezni kell arról, hogy a szolgáltató felhasználhatja-e a beszélgetési és interakciós naplókat saját modell tanítására vagy egyéb saját céljára.','critical'),
 ('ROLES_JOINT_AGREEMENT','Közös adatkezelői megállapodás',
  'Közös adatkezelés esetén megállapodásban kell rendezni a kötelezettségek megosztását, és a lényegét elérhetővé kell tenni az érintettek számára.','high'),
 ('ROLES_EU_REPRESENTATIVE','Uniós képviselő kijelölése',
  'Ha nincs uniós tevékenységi hely, és a szolgáltatás uniós érintettekre irányul, írásban uniós képviselőt kell kijelölni.','medium')
) as v(kod,cim,leiras,prio)
where r.rule_code='GDPR_ART26_27_29_ROLES'
  and not exists (select 1 from public.aic_required_actions a where a.rule_id=r.id and a.action_code=v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id, v.kod, v.cim, v.leiras, v.formatum, v.kotelezo from public.aic_compliance_rules r,
(values
 ('ROLES_MAPPING_DOC','Szerepmeghatározás','A szerepek írásbeli tisztázása a láncban részt vevő felek megnevezésével.',array['pdf','docx'],true),
 ('ROLES_CONTRACT','Szerződés vagy megállapodás','Az adatfeldolgozói szerződés vagy a közös adatkezelői megállapodás, benne a naplók felhasználására vonatkozó kikötéssel.',array['pdf','docx'],true)
) as v(kod,cim,leiras,formatum,kotelezo)
where r.rule_code='GDPR_ART26_27_29_ROLES'
  and not exists (select 1 from public.aic_required_evidence e where e.rule_id=r.id and e.evidence_code=v.kod);

-- ===========================================================================
-- 2. HATÓSÁGI EGYÜTTMŰKÖDÉS ÉS ELŐZETES KONZULTÁCIÓ (31., 36.)
--    A 36. cikk a 35. cikkre épül, ami már lefedett: ha a hatásvizsgálat magas
--    kockázatot állapít meg és az nem mérsékelhető, az adatkezelést megelőzően
--    konzultálni kell.
-- ===========================================================================
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review, legal_interpretation_note)
select 'GDPR_ART31_36_AUTHORITY',
       'Hatósági együttműködés és előzetes konzultáció',
       'Ki kell jelölni a hatósági kapcsolattartót, és ha a hatásvizsgálat mérsékelhetetlen magas kockázatot állapít meg, a bevezetés előtt konzultálni kell a hatósággal.',
       'any', 'requirement', 'AND', 'under_review', true,
       'A konzultációs kötelezettség a 35. cikk szerinti hatásvizsgálat eredményétől függ; annak megítélése tényállásfüggő. A szabály nem dönti el, hogy egy adott rendszernél fennáll-e, hanem azt írja elő, hogy a kérdést a bevezetés előtt fel kell tenni és a választ dokumentálni kell.'
where not exists (select 1 from public.aic_compliance_rules where rule_code='GDPR_ART31_36_AUTHORITY');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'GDPR_AUTHORITY_COOPERATION','Hatósági együttműködés','authority_cooperation','legal_requirement',
       'Kapcsolattartó kijelölése, és előzetes konzultáció, ha a hatásvizsgálat magas kockázatot állapít meg.',
       'A {{organisation_name}} a felügyeleti hatósággal annak megkeresésére együttműködik, és kijelöli azt a szervezeti egységet vagy személyt, amely a {{system_name}}-t érintő hatósági megkeresésre válaszol. A megkeresés megválaszolásához szükséges dokumentációt – így különösen az adatkezelési nyilvántartást, a hatásvizsgálatot, a szolgáltatói szerződést és a naplókat – rendelkezésre kell tudni bocsátani. Ha a {{system_name}} vonatkozásában elvégzett adatvédelmi hatásvizsgálat azt állapítja meg, hogy az adatkezelés a kockázat mérséklésére tett intézkedések hiányában valószínűsíthetően magas kockázattal jár, a {{organisation_name}} a rendszer éles üzembe helyezése előtt konzultál a felügyeleti hatósággal, és a konzultáció eredményét dokumentálja. A konzultáció szükségességéről hozott döntést – akkor is, ha az nemleges – írásban rögzíteni kell.',
       r.id, '{"required_facts":{"processes_personal_data":true}}'::jsonb, 65, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code='GDPR_ART31_36_AUTHORITY'
  and not exists (select 1 from public.aic_policy_modules where module_code='GDPR_AUTHORITY_COOPERATION');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, case when p.provision_key='GDPR_ART36_PRIOR_CONSULT' then 'primary' else 'supporting' end
from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code='GDPR_ART31_36_AUTHORITY'
  and p.provision_key in ('GDPR_ART31_COOPERATION','GDPR_ART36_PRIOR_CONSULT')
  and not exists (select 1 from public.aic_rule_legal_bases b where b.rule_id=r.id and b.provision_id=p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio from public.aic_compliance_rules r,
(values
 ('AUTH_CONTACT_POINT','Hatósági kapcsolattartó kijelölése',
  'Meg kell nevezni, ki válaszol a rendszert érintő hatósági megkeresésre, és milyen határidővel.','high'),
 ('AUTH_CONSULT_DECISION','Döntés az előzetes konzultációról',
  'A hatásvizsgálat alapján írásban rögzíteni kell, szükséges-e előzetes konzultáció. A nemleges döntést is indokolni kell.','critical'),
 ('AUTH_DOC_READINESS','Dokumentáció kiadhatósága',
  'Biztosítani kell, hogy a nyilvántartás, a hatásvizsgálat, a szerződések és a naplók megkeresésre kiadhatók legyenek.','medium')
) as v(kod,cim,leiras,prio)
where r.rule_code='GDPR_ART31_36_AUTHORITY'
  and not exists (select 1 from public.aic_required_actions a where a.rule_id=r.id and a.action_code=v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id,'AUTH_CONSULT_RECORD','A konzultációs döntés feljegyzése',
       'Feljegyzés arról, hogy szükséges-e előzetes konzultáció, és ha igen, annak eredménye.',array['pdf','docx'],true
from public.aic_compliance_rules r
where r.rule_code='GDPR_ART31_36_AUTHORITY'
  and not exists (select 1 from public.aic_required_evidence e where e.rule_id=r.id and e.evidence_code='AUTH_CONSULT_RECORD');

-- ===========================================================================
-- 3. BÜNTETŐJOGI ADATOK (10.)
--    MI-nél tipikus rejtett eset: a rendszer szabad szöveges bemenetből
--    következtet vagy címkéz, például csalásgyanút jelöl meg. A 10. cikk
--    szerint ilyen adat kezelése csak közhatalmi felügyelet vagy kifejezett
--    jogszabályi felhatalmazás mellett lehetséges.
-- ===========================================================================
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review, legal_interpretation_note)
select 'GDPR_ART10_CRIMINAL_DATA',
       'Büntetőjogi felelősségre vonatkozó adatok',
       'A rendszer nem kezelhet és nem hozhat létre bűncselekményre vagy büntetőjogi felelősségre vonatkozó adatot, kivéve ha erre kifejezett jogszabályi felhatalmazás van.',
       'any', 'prohibition', 'AND', 'under_review', true,
       'A rendelet a büntetőjogi adat kezeléséről szól. A szabály kiterjeszti arra az esetre is, amikor a rendszer maga állít elő ilyen adatot – például gyanúra utaló címkét vagy pontszámot –, mert a keletkeztetés is adatkezelés. Ez értelmezés, de a 10. cikk céljából következik.'
where not exists (select 1 from public.aic_compliance_rules where rule_code='GDPR_ART10_CRIMINAL_DATA');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'GDPR_CRIMINAL_DATA','Büntetőjogi adatok','criminal_data','legal_requirement',
       'A rendszer nem címkézhet és nem tárolhat bűncselekményre utaló adatot jogszabályi felhatalmazás nélkül.',
       'A {{system_name}} bűncselekményre vagy büntetőjogi felelősség megállapítására vonatkozó személyes adatot nem kezelhet, és ilyen adatot nem hozhat létre – így különösen nem rendelhet a felhasználóhoz bűncselekmény elkövetésére utaló megjelölést, gyanúra utaló címkét vagy pontszámot –, kivéve, ha az adatkezelés közhatalmi szerv felügyelete mellett történik, vagy azt megfelelő garanciákat nyújtó uniós vagy tagállami jog kifejezetten lehetővé teszi. Ha a {{system_name}} szabad szöveges bemenetet dolgoz fel, biztosítani kell, hogy az ilyen tartalomból ne keletkezzen tartós, a felhasználóhoz kapcsolt büntetőjogi vonatkozású adat. A büntetőjogi felelősség megállapítására vonatkozó határozatok teljes körű nyilvántartását a {{organisation_name}} nem vezetheti.',
       r.id, '{"required_facts":{"processes_personal_data":true}}'::jsonb, 70, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code='GDPR_ART10_CRIMINAL_DATA'
  and not exists (select 1 from public.aic_policy_modules where module_code='GDPR_CRIMINAL_DATA');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary' from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code='GDPR_ART10_CRIMINAL_DATA' and p.provision_key='GDPR_ART10_CRIMINAL'
  and not exists (select 1 from public.aic_rule_legal_bases b where b.rule_id=r.id and b.provision_id=p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio from public.aic_compliance_rules r,
(values
 ('CRIM_SCREEN_OUTPUT','A kimenet átvizsgálása',
  'Meg kell vizsgálni, keletkezik-e a rendszerben bűncselekményre utaló címke, pontszám vagy megjegyzés, és ha igen, azt meg kell szüntetni vagy jogalapot kell hozzá találni.','critical'),
 ('CRIM_LEGAL_BASIS','Jogalap ellenőrzése',
  'Ha ilyen adat kezelése elkerülhetetlen, meg kell nevezni azt a jogszabályt, amely lehetővé teszi, és a garanciákat.','high')
) as v(kod,cim,leiras,prio)
where r.rule_code='GDPR_ART10_CRIMINAL_DATA'
  and not exists (select 1 from public.aic_required_actions a where a.rule_id=r.id and a.action_code=v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id,'CRIM_REVIEW_NOTE','A kimenetvizsgálat feljegyzése',
       'Feljegyzés arról, hogy a rendszer keletkeztet-e büntetőjogi vonatkozású adatot, és milyen intézkedés történt.',array['pdf','docx'],true
from public.aic_compliance_rules r
where r.rule_code='GDPR_ART10_CRIMINAL_DATA'
  and not exists (select 1 from public.aic_required_evidence e where e.rule_id=r.id and e.evidence_code='CRIM_REVIEW_NOTE');

-- ===========================================================================
-- 4. AZONOSÍTÁST NEM IGÉNYLŐ ADATKEZELÉS (11.)
--    MI-nél a névtelen chatbot tipikus esete: ha a rendszer nem tudja
--    azonosítani a felhasználót, nem szabad pusztán a jogszabálynak való
--    megfelelés kedvéért azonosítót gyűjteni. Cserébe az érintetti jogok
--    gyakorlása korlátozott, és erről tájékoztatni kell.
-- ===========================================================================
insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, requires_human_review, legal_interpretation_note)
select 'GDPR_ART11_NO_IDENTIFICATION',
       'Azonosítást nem igénylő adatkezelés',
       'Ha a cél nem kívánja meg az azonosítást, nem szabad azonosítót gyűjteni pusztán a megfelelés kedvéért; az érintettet tájékoztatni kell, hogy emiatt jogai korlátozottan gyakorolhatók.',
       'any', 'requirement', 'AND', 'under_review', true,
       'A 11. cikk lehetőséget ad, nem kötelezettséget. A szabály azt a következtetést vonja le belőle, hogy azonosító gyűjtése kizárólag a megfelelés kedvéért ellentétes az adattakarékosság elvével. Ez értelmezés, amely az 5. cikk (1) bekezdés c) pontjával együtt olvasva következik.'
where not exists (select 1 from public.aic_compliance_rules where rule_code='GDPR_ART11_NO_IDENTIFICATION');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status)
select 'GDPR_NO_IDENTIFICATION','Azonosítás nélküli használat','no_identification','legal_requirement',
       'Ha a cél nem igényel azonosítást, nem gyűjtünk azonosítót; az érintettet tájékoztatjuk a jogai korlátozottságáról.',
       'Ha a {{system_name}} céljai nem vagy már nem teszik szükségessé a felhasználó azonosítását – így különösen névtelen tájékoztatás vagy általános kérdések megválaszolása esetén –, a {{organisation_name}} nem gyűjt és nem őriz meg kiegészítő azonosító adatot pusztán azért, hogy a rendeletnek való megfelelést igazolja. Ha a {{organisation_name}} nincs abban a helyzetben, hogy a felhasználót azonosítsa, erről a felhasználót lehetőség szerint tájékoztatja, és felhívja a figyelmét arra, hogy az érintetti jogait ebben az esetben csak akkor tudja gyakorolni, ha azonosítás céljából kiegészítő információt bocsát rendelkezésre. A {{organisation_name}} meghatározza, mely funkciók használhatók azonosítás nélkül, és mely funkciók igénylik az azonosítást.',
       r.id, '{"required_facts":{"processes_personal_data":true}}'::jsonb, 75, 1, 'under_review'
from public.aic_compliance_rules r
where r.rule_code='GDPR_ART11_NO_IDENTIFICATION'
  and not exists (select 1 from public.aic_policy_modules where module_code='GDPR_NO_IDENTIFICATION');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary' from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code='GDPR_ART11_NO_IDENTIFICATION' and p.provision_key='GDPR_ART11_NO_ID'
  and not exists (select 1 from public.aic_rule_legal_bases b where b.rule_id=r.id and b.provision_id=p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio from public.aic_compliance_rules r,
(values
 ('NOID_FUNCTION_MAP','Funkciók besorolása',
  'Meg kell határozni, mely funkciók használhatók azonosítás nélkül, és melyek igényelnek azonosítást.','high'),
 ('NOID_USER_NOTICE','Tájékoztatás a jogok korlátozottságáról',
  'Ahol nincs azonosítás, tájékoztatni kell a felhasználót, hogy jogait csak kiegészítő információ megadásával tudja gyakorolni.','medium')
) as v(kod,cim,leiras,prio)
where r.rule_code='GDPR_ART11_NO_IDENTIFICATION'
  and not exists (select 1 from public.aic_required_actions a where a.rule_id=r.id and a.action_code=v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id,'NOID_FUNCTION_LIST','Funkciólista azonosítási igény szerint',
       'A rendszer funkcióinak listája annak megjelölésével, melyik igényel azonosítást.',array['xlsx','pdf','docx'],false
from public.aic_compliance_rules r
where r.rule_code='GDPR_ART11_NO_IDENTIFICATION'
  and not exists (select 1 from public.aic_required_evidence e where e.rule_id=r.id and e.evidence_code='NOID_FUNCTION_LIST');

-- ===========================================================================
-- LEFEDETTSÉG
-- ===========================================================================
update public.aic_provision_coverage c
set proposed_status='covered',
    proposed_reason='Az első köteg szabályai lefedik.',
    updated_at=now()
from public.aic_legal_sources s
where s.id=c.source_id and s.celex_number='32016R0679'
  and c.article_number in ('26','27','29','31','36','10','11');

select coalesce(proposed_status,'javaslat nélkül') as javaslat, count(*)
from public.aic_provision_coverage group by 1 order by 2 desc;

commit;
