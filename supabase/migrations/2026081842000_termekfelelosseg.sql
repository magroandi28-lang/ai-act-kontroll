-- EnergiaAI Kontroll – termékfelelősség (EU) 2024/2853 irányelv.
--
-- MIÉRT
-- Ez az irányelv mondja ki, hogy a szoftver termék. Eddig a katalógusban nem
-- szerepelt olyan szabály, amely a hibás MI-ért való kártérítési felelősséggel
-- foglalkozott volna.
--
-- A HÁROM LÉNYEGES RENDELKEZÉS
--   4. cikk 1. pont – a "termék" magában foglalja a szoftvereket
--   7. cikk (2) c)  – a hiba vizsgálatakor figyelembe kell venni a forgalomba
--                     hozatal utáni TANULÁSI KÉPESSÉG hatását. Ez az egyetlen
--                     hely, ahol a jog kifejezetten az önfejlődő rendszerre
--                     szabja a hibafogalmat.
--   11. cikk (1) c) – a gyártó mentesül, ha valószínű, hogy a hiba a forgalomba
--                     hozatal után keletkezett. Tanuló rendszernél ez a mentesség
--                     nem magától értetődő, mert a tanulás a gyártó által
--                     tervezett képesség.
--
-- MIKORTÓL
-- A 2. cikk (1) bekezdése szerint a 2026. december 9. után forgalomba hozott
-- vagy használatba vett termékekre alkalmazandó. A szabály valid_from mezője
-- ezt tükrözi.
--
-- KIRE NEM VONATKOZIK
-- A 2. cikk (2) bekezdése kiveszi a nem kereskedelmi tevékenység során
-- fejlesztett szabad és nyílt forráskódú szoftvert.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

insert into public.aic_legal_sources
  (title, source_kind, issuing_body, celex_number, official_url, language_code, is_official, notes)
select 'Termékfelelősségi irányelv – (EU) 2024/2853', 'regulation',
       'Európai Parlament és Tanács', '32024L2853',
       'https://eur-lex.europa.eu/legal-content/HU/TXT/HTML/?uri=CELEX:32024L2853', 'hu', true,
       'Kimondja, hogy a szoftver termék. A 7. cikk (2) c) pontja kifejezetten az önfejlődő rendszerekre szabja a hibafogalmat. Átültetési határidő 2026. december 9.; magyar szövege még nincs.'
where not exists (select 1 from public.aic_legal_sources where celex_number = '32024L2853');

insert into public.aic_legal_text
  (source_id, article_number, paragraph_number, scope, content, content_sha256, deep_link, source_url, retrieved_at)
select s.id, v.cikk, v.bek, case when v.bek is null then 'article' else 'paragraph' end,
       v.szoveg, encode(sha256(v.szoveg::bytea),'hex'),
       'https://eur-lex.europa.eu/legal-content/HU/TXT/HTML/?uri=CELEX:32024L2853',
       'https://eur-lex.europa.eu/legal-content/HU/TXT/HTML/?uri=CELEX:32024L2853', now()
from public.aic_legal_sources s,
(values
 ('2','1','Ezen irányelv a 2026. december 9. után forgalomba hozott vagy használatba vett termékekre alkalmazandó.'),
 ('2','2','Ez az irányelv nem alkalmazandó a nem kereskedelmi tevékenység során kifejlesztett vagy rendelkezésre bocsátott szabad és nyílt forráskódú szoftverekre.'),
 ('4','1','„termék”: minden ingó dolog, abban az esetben is, ha azt egy másik ingó dologba vagy ingatlanba építették be, vagy ha az egy másik ingó dologhoz vagy ingatlanhoz kapcsolódik; a „termék” magában foglalja a villamos energiát, a digitális gyártási fájlokat, a nyersanyagokat és szoftvereket.'),
 ('4','3','„kapcsolódó szolgáltatás”: olyan digitális szolgáltatás, amelyet oly módon építettek be egy termékbe vagy kapcsoltak össze azzal, hogy annak hiányában a termék nem tudná betölteni egy vagy több funkcióját.'),
 ('7','1','Egy termék hibásnak tekintendő, amennyiben nem nyújtja a bárki által jogosan elvárható, vagy az uniós vagy a nemzeti jogban előírt biztonságot.'),
 ('7','2','A termék hibájának vizsgálatakor figyelembe kell venni minden körülményt, többek között: a termék kiszerelését és jellemzőit, ideértve a címkézést, tervezést, műszaki jellemzőket, összetételt, csomagolást, valamint az összeszerelésre, telepítésre, használatra és karbantartásra vonatkozó utasításokat; a termék észszerűen előrelátható használatát; a forgalomba hozatalt vagy használatbavételt követően a folyamatos tanulásra vagy új tulajdonságok szerzésére való képességnek a termékre gyakorolt bármely hatását; más termékek észszerűen előrelátható hatását, többek között összekapcsolás révén; valamint a forgalomba hozatal időpontját.'),
 ('11','1','A gazdasági szereplő nem tartozik felelősséggel, ha bizonyítja többek között azt, hogy a terméket nem ő hozta forgalomba; annak valószínűségét, hogy a kárt okozó hiba nem állt fenn a forgalomba hozatalkor, vagy azt követően keletkezett; hogy a hiba jogi előírásnak való megfelelésből fakad; vagy hogy a hiba a forgalomba hozatalkor a tudományos és műszaki ismeretek objektív állása szerint nem volt felismerhető.')
) as v(cikk,bek,szoveg)
where s.celex_number = '32024L2853'
  and not exists (select 1 from public.aic_legal_text t
                  where t.source_id = s.id and t.article_number = v.cikk and t.paragraph_number = v.bek);

insert into public.aic_legal_text
  (source_id, article_number, paragraph_number, scope, content, content_sha256, deep_link, source_url, retrieved_at)
select t.source_id, t.article_number, null, 'article',
       string_agg('(' || t.paragraph_number || ') ' || t.content, E'\n' order by t.paragraph_number),
       encode(sha256(string_agg(t.content,'|' order by t.paragraph_number)::bytea),'hex'),
       min(t.deep_link), min(t.source_url), now()
from public.aic_legal_text t join public.aic_legal_sources s on s.id = t.source_id
where s.celex_number = '32024L2853' and t.paragraph_number is not null
  and not exists (select 1 from public.aic_legal_text x
                  where x.source_id = t.source_id and x.article_number = t.article_number
                    and x.paragraph_number is null)
group by t.source_id, t.article_number;

insert into public.aic_provision_coverage (source_id, article_number)
select distinct t.source_id, t.article_number
from public.aic_legal_text t join public.aic_legal_sources s on s.id = t.source_id
where s.celex_number = '32024L2853'
  and not exists (select 1 from public.aic_provision_coverage c
                  where c.source_id = t.source_id and c.article_number = t.article_number);

-- ---------------------------------------------------------------------------
-- Kapcsoló: tanul-e a rendszer forgalomba hozatal után.
-- Ez az irányelv 7. cikk (2) c) pontjából jön, és eddig sehol nem szerepelt.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   question_hu, always_ask, display_order, detection_patterns, detection_note)
select 'CONTINUOUS_LEARNING',
       'Folyamatos tanulás üzembe helyezés után',
       'A rendszer az üzembe helyezés után is tanul, vagy új tulajdonságokat szerez – például visszajelzésből, új adatokból vagy automatikus frissítésből.',
       'funkcio', s.id, '7',
       'Tanul a rendszer az üzembe helyezés után is – visszajelzésből, új adatokból vagy automatikus frissítésből?',
       true, 760,
       '[{"minta":"online learning","tipus":"szoveg","suly":"eros"},
         {"minta":"folyamatos tanul","tipus":"szoveg","suly":"eros"},
         {"minta":"visszacsatolás","tipus":"szoveg","suly":"gyenge"},
         {"minta":"retrain","tipus":"szoveg","suly":"eros"},
         {"minta":"automatikus frissít","tipus":"szoveg","suly":"gyenge"}]'::jsonb,
       'A modell időszakos újratanítása is ide tartozik, nem csak a valós idejű tanulás. A puszta promptváltoztatás nem.'
from public.aic_legal_sources s
where s.celex_number = '32024L2853'
  and not exists (select 1 from public.aic_trigger_catalogue where trigger_key = 'CONTINUOUS_LEARNING');

-- ---------------------------------------------------------------------------
-- Jogszabályhely és szabály.
-- ---------------------------------------------------------------------------
insert into public.aic_legal_provisions
  (source_id, provision_key, article_number, heading, provision_text,
   text_fidelity, language_code, deep_link)
select s.id, 'PLD_ART7_DEFECT', '7', 'Hiba',
       'A termék hibás, ha nem nyújtja a jogosan elvárható biztonságot. A hiba vizsgálatakor figyelembe kell venni a forgalomba hozatal utáni folyamatos tanulásra vagy új tulajdonságok szerzésére való képesség hatását, más termékek észszerűen előrelátható hatását, valamint a használati és karbantartási utasításokat. A szoftver a 4. cikk 1. pontja szerint terméknek minősül.',
       'expert_paraphrase', 'hu', 'https://eur-lex.europa.eu/legal-content/HU/TXT/HTML/?uri=CELEX:32024L2853'
from public.aic_legal_sources s
where s.celex_number = '32024L2853'
  and not exists (select 1 from public.aic_legal_provisions p
                  where p.source_id = s.id and p.provision_key = 'PLD_ART7_DEFECT');

insert into public.aic_compliance_rules
  (rule_code, title, plain_language_requirement, actor_role, outcome_type,
   condition_groups_operator, lifecycle_status, valid_from, requires_human_review,
   legal_interpretation_note)
select 'PLD_DEFECT_AND_LEARNING',
       'Termékfelelősség és a rendszer tanulása',
       'Dokumentálni kell, mit tud a rendszer az átadáskor, hogyan változik utána, és mikor minősül a változás hibának.',
       'provider', 'documentation', 'AND', 'under_review', date '2026-12-09', true,
       'Az irányelv a 2026. december 9. után forgalomba hozott termékekre alkalmazandó, és Magyarországon még nincs átültetve. A 11. cikk (1) c) pontja szerinti mentesség – hogy a hiba a forgalomba hozatal után keletkezett – tanuló rendszernél nem magától értetődő, mert a tanulás a gyártó által tervezett képesség. Ezt a szabály nem dönti el, hanem azt írja elő, hogy a kiindulási állapotot és a változásokat dokumentálni kell, mert a bizonyítás enélkül lehetetlen.'
where not exists (select 1 from public.aic_compliance_rules where rule_code = 'PLD_DEFECT_AND_LEARNING');

insert into public.aic_policy_modules
  (module_code, title, section_key, module_kind, summary_text, full_text_template,
   rule_id, applicability, display_order, version, lifecycle_status, valid_from)
select 'PLD_PRODUCT_LIABILITY', 'Termékfelelősség és a rendszer változása', 'product_liability',
       'legal_requirement',
       'Rögzíteni kell az átadáskori állapotot és a későbbi változásokat, mert ezen múlik a felelősség megítélése.',
       'A {{organisation_name}} a {{system_name}} forgalomba hozatalakor vagy üzembe helyezésekor írásban rögzíti, milyen képességekkel rendelkezik a rendszer, milyen biztonsági jellemzőket nyújt, és milyen használatra szánták. A {{organisation_name}} nyilvántartja a rendszer későbbi változásait – így különösen a modell újratanítását, az automatikus frissítéseket és a működés közbeni tanulásból eredő eltéréseket –, a változás időpontjával és okával együtt. A {{organisation_name}} meghatározza, mely változás minősül a rendszer rendeltetésszerű fejlődésének, és mely változás igényel új biztonsági értékelést. A használati és karbantartási utasítást naprakészen kell tartani, mert a hiba megítélésénél ezt is figyelembe veszik. Ha a rendszer más rendszerrel összekapcsolva működik, a {{organisation_name}} rögzíti, mely összekapcsolásokat tekinti észszerűen előreláthatónak.',
       r.id, '{"all":[{"fact":"CONTINUOUS_LEARNING","operator":"is_true"}]}'::jsonb,
       155, 1, 'under_review', date '2026-12-09'
from public.aic_compliance_rules r
where r.rule_code = 'PLD_DEFECT_AND_LEARNING'
  and not exists (select 1 from public.aic_policy_modules where module_code = 'PLD_PRODUCT_LIABILITY');

insert into public.aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary'
from public.aic_compliance_rules r, public.aic_legal_provisions p
where r.rule_code = 'PLD_DEFECT_AND_LEARNING' and p.provision_key = 'PLD_ART7_DEFECT'
  and not exists (select 1 from public.aic_rule_legal_bases b where b.rule_id = r.id and b.provision_id = p.id);

insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, v.kod, v.cim, v.leiras, v.prio from public.aic_compliance_rules r,
(values
 ('PLD_BASELINE','Átadáskori állapot rögzítése',
  'Írásban rögzíteni kell, mit tud a rendszer az átadáskor, milyen biztonsági jellemzőket nyújt, és milyen használatra szánták.','critical'),
 ('PLD_CHANGE_LOG','Változásnapló',
  'Nyilván kell tartani a modell újratanítását, az automatikus frissítéseket és a tanulásból eredő eltéréseket, időponttal és okkal.','critical'),
 ('PLD_THRESHOLD','A jelentős változás küszöbe',
  'Meg kell határozni, mely változás igényel új biztonsági értékelést, és melyik minősül rendeltetésszerű fejlődésnek.','high'),
 ('PLD_INSTRUCTIONS','Utasítások naprakészen tartása',
  'A használati és karbantartási utasítást frissíteni kell, mert a hiba megítélésénél ezt is figyelembe veszik.','medium')
) as v(kod,cim,leiras,prio)
where r.rule_code = 'PLD_DEFECT_AND_LEARNING'
  and not exists (select 1 from public.aic_required_actions a where a.rule_id = r.id and a.action_code = v.kod);

insert into public.aic_required_evidence (rule_id, evidence_code, evidence_title, evidence_description, accepted_formats, mandatory)
select r.id, 'PLD_BASELINE_DOC', 'Átadáskori állapotleírás és változásnapló',
       'A rendszer átadáskori képességeinek leírása, és a későbbi változások naplója.',
       array['pdf','docx','xlsx'], true
from public.aic_compliance_rules r
where r.rule_code = 'PLD_DEFECT_AND_LEARNING'
  and not exists (select 1 from public.aic_required_evidence e where e.rule_id = r.id and e.evidence_code = 'PLD_BASELINE_DOC');

update public.aic_provision_coverage c
set proposed_status = case when c.article_number = '7' then 'covered' else 'not_required' end,
    proposed_reason = case when c.article_number = '7'
      then 'A PLD_DEFECT_AND_LEARNING szabály lefedi.'
      else 'Hatályt, fogalmakat és mentesülési okokat határoz meg; önálló cselekvési kötelezettséget nem ír elő.' end,
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '32024L2853' and c.proposed_status is null;

select (select count(*) from public.aic_compliance_rules) as szabaly,
       (select count(*) from public.aic_trigger_catalogue) as kapcsolo,
       (select count(*) from public.aic_legal_sources) as jogforras,
       (select count(*) from public.aic_provision_coverage) as jogszabalyhely;

commit;
