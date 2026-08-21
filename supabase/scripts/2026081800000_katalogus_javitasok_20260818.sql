-- EnergiaAI Kontroll – 2026. augusztus 18-i katalógusjavítások.
--
-- MIÉRT EZ A FÁJL
-- Ezeket a változtatásokat aznap közvetlenül az adatbázison végeztük, fájl
-- nélkül. Enélkül a supabase/migrations mappából nem lehetne nulláról
-- felépíteni ugyanezt az állapotot. A tartalom megegyezik azzal, ami már
-- él az adatbázisban, ezért újrafuttatva nem okoz kárt.
--
-- MI VAN BENNE
-- 1. A kiberbiztonsági törvénynél egy jogforrás-sor törlése, aminek nem volt
--    szakaszszáma, és tartalmilag az 5. § duplikátuma volt.
-- 2. A kiberbiztonsági törvény 2. mellékletének betöltése, 22 ágazati ponttal.
-- 3. Az MI-rendelet mellékleteinek szétbontása pontokra. Eddig egyetlen
--    szövegtömb volt mindegyik; a III. mellékletre nyolc szabály épül, de nem
--    lehetett megmondani, melyik pontjára.
-- 4. Az akadálymentességi törvény 1. mellékletének szétbontása.
-- 5. Öt szabály elsődleges jogalapjának rendezése. Ezeknek csak támogató
--    hivatkozásuk volt, ezért a katalógusban nem volt helyük.
-- 6. A szabályzatok visszavonása piszkozatba. A katalógus jóváhagyása előtt
--    egyetlen dokumentum sem lehet felülvizsgálat alatt vagy kiadva.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. Szakaszszám nélküli jogforrás-sor törlése.
-- ---------------------------------------------------------------------------
delete from aic_rule_legal_bases lb
using aic_legal_provisions p, aic_legal_sources s
where lb.provision_id = p.id and p.source_id = s.id
  and s.celex_number = 'NJT-2024-69-00-00' and p.article_number = '–';

delete from aic_legal_provisions p
using aic_legal_sources s
where p.source_id = s.id
  and s.celex_number = 'NJT-2024-69-00-00' and p.article_number = '–';

-- ---------------------------------------------------------------------------
-- 2. Kiberbiztonsági törvény, 2. melléklet.
-- ---------------------------------------------------------------------------
insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select src.id,'2. melléklet',v.p,'paragraph',v.c, encode(sha256(v.c::bytea),'hex'),
       'https://njt.hu/jogszabaly/2024-69-00-00#2mell','https://njt.hu/jogszabaly/2024-69-00-00',now()
from aic_legal_sources src cross join (values
 ('2','Energetika – Villamos energia: a villamos energiáról szóló törvény szerinti villamosenergia-ipari vállalkozás a közvilágítási üzemeltetési engedélyes kivételével,'),
 ('3','Energetika – Távfűtés és hűtés: a távhőszolgáltatásról szóló törvény szerinti engedélyes,'),
 ('4','Energetika – Kőolaj: a bányászatról szóló törvény szerinti a) szénhidrogén szállítóvezetéket létesítő és üzemben tartó engedélyes, b) a kőolajfeldolgozásban, tárolásban használt létesítmény üzemeltetője,'),
 ('5','Energetika – Kőolaj: a behozott kőolaj és kőolajtermékek biztonsági készletezéséről szóló törvény szerinti központi készletező szervezet,'),
 ('6','Energetika – Földgáz: – az egyablakos kapacitásértékesítő, a szervezett földgázpiaci engedélyes és a vezetékes PB-gáz szolgáltató kivételével – a földgázellátásról szóló törvény szerinti engedélyes tevékenységet folytató földgázipari vállalkozás,'),
 ('7','Energetika – Hidrogén: a hidrogéntermelés, -tárolás és -szállítás üzemeltetője,'),
 ('8','Közlekedés – Légi közlekedés: a polgári légiközlekedés védelmének szabályairól és a Légiközlekedés Védelmi Bizottság jogköréről, feladatairól és működésének rendjéről szóló kormányrendelet szerinti légiközlekedés védelmében közreműködő szervezet,'),
 ('9','Közlekedés – Vasúti közlekedés: az erdőről, az erdő védelméről és az erdőgazdálkodásról szóló 2009. évi XXXVII. törvény 1. melléklet e szerinti gazdasági társaságok kivételével a vasúti közlekedésről szóló törvény szerinti vasúti pályahálózat működtetője – a saját célú vasúti pályahálózatok, iparvágányok kivételével –, a vállalkozó vasúti társaság, a vasúti pályakapacitás-elosztó szervezet,'),
 ('10','Közlekedés – Közúti közlekedés: a közúti közlekedésről szóló törvény felhatalmazása alapján kiadott rendelet szerinti a) intelligens közúti közlekedési rendszerek üzemeltetését végző szolgáltató, b) forgalomirányítást végző szervezet,'),
 ('11','Közlekedés – Vízi közlekedés: a víziközlekedésről szóló törvény szerinti hajózási tevékenység folytatásában részt vevő jogi személy, jogi személyiséggel nem rendelkező gazdálkodó szervezet,'),
 ('12','Közlekedés – Tömegközlekedés: a vasúti és közúti személyszállítási közszolgáltatásról, valamint az 1191/69/EGK és az 1107/70/EGK tanácsi rendelet hatályon kívül helyezéséről szóló, 2007. október 23-i 1370/2007/EK európai parlamenti és tanácsi rendelet 2. cikk d) pontja szerinti közszolgáltató szervezet,'),
 ('13','Egészségügy: az egészségügyről szóló törvény szerinti egészségügyi szolgáltató, magas biztonsági szintű biológiai laboratóriumok üzemeltetője, egészségügyi tartalékokat és vérkészleteket kezelő szervezet, gyógyszerek kutatásával és fejlesztésével foglalkozó szervezet, gyógyszeripari alaptermékeket és gyógyszerkészítményeket gyártó szervezet, gyógyszer-nagykereskedő, népegészségügyi szükséghelyzet kritikus fontosságú eszközeinek jegyzékén szereplő kritikus fontosságú orvostechnikai eszközt gyártó szervezet,'),
 ('14','Ivóvíz, szennyvíz – Víziközmű szolgáltatás: a víziközmű-szolgáltatásról szóló törvény szerinti víziközmű-szolgáltató,'),
 ('15','Hírközlési szolgáltatás: az elektronikus hírközlésről szóló törvény szerinti a) elektronikus hírközlési szolgáltató, b) adatkicserélő szolgáltatást nyújtó szolgáltató,'),
 ('16','Hírközlési szolgáltatás: a digitális államról és a digitális szolgáltatások nyújtásának egyes szabályairól szóló törvény szerinti bizalmi szolgáltató,'),
 ('17','Digitális infrastruktúra: a felhőszolgáltató,'),
 ('18','Digitális infrastruktúra: adatközponti szolgáltatást nyújtó szolgáltató,'),
 ('19','Digitális infrastruktúra: legfelső szintű doménnév-nyilvántartó,'),
 ('20','Digitális infrastruktúra: a DNS-szolgáltató,'),
 ('21','Digitális infrastruktúra: tartalomszolgáltató hálózat szolgáltatója,'),
 ('22','Kihelyezett IKT szolgáltatások: a) kihelyezett (irányított) infokommunikációs szolgáltatást nyújtó szolgáltató, b) kihelyezett (irányított) infokommunikációs biztonsági szolgáltatást nyújtó szolgáltató,'),
 ('23','Űralapú szolgáltatás: űralapú szolgáltatások nyújtását támogató földi infrastruktúra üzemeltető')
) as v(p,c)
where src.celex_number='NJT-2024-69-00-00'
  and not exists (select 1 from aic_legal_text t where t.source_id=src.id
                    and t.article_number='2. melléklet' and t.paragraph_number=v.p);

insert into aic_legal_text (source_id,article_number,paragraph_number,scope,content,content_sha256,deep_link,source_url,retrieved_at)
select t.source_id,'2. melléklet',null,'article',
  '2. melléklet a 2024. évi LXIX. törvényhez — Kiemelten kockázatos ágazatokban működő szolgáltatók és szervezetek' || E'\n\n' ||
  string_agg(t.paragraph_number || '. ' || t.content, E'\n' order by t.paragraph_number::int),
  encode(sha256(('2mell'||string_agg(t.content,'|' order by t.paragraph_number::int))::bytea),'hex'),
  'https://njt.hu/jogszabaly/2024-69-00-00#2mell','https://njt.hu/jogszabaly/2024-69-00-00',now()
from aic_legal_text t join aic_legal_sources s on s.id=t.source_id
where s.celex_number='NJT-2024-69-00-00' and t.article_number='2. melléklet' and t.paragraph_number is not null
  and not exists (select 1 from aic_legal_text x where x.source_id=t.source_id
                    and x.article_number='2. melléklet' and x.paragraph_number is null)
group by t.source_id;

-- ---------------------------------------------------------------------------
-- 3. MI-rendelet mellékletei pontokra bontva.
--    A szakaszjelölő ("A. szakasz") előtaggá válik, ahol van, mert az I. és a
--    VIII. mellékletben a pontszámozás szakaszonként újraindul.
-- ---------------------------------------------------------------------------
with forras as (
  select t.id, t.source_id, t.article_number, t.content, t.deep_link, t.source_url
  from aic_legal_text t join aic_legal_sources s on s.id=t.source_id
  where s.celex_number='02024R1689-20260727' and t.article_number like 'Annex%'
    and t.paragraph_number is null
),
blokk as (
  select f.id, f.source_id, f.article_number, f.deep_link, f.source_url, b.ord, btrim(b.txt) as txt
  from forras f,
       lateral unnest(regexp_split_to_array(f.content, E'\r?\n\\s*\r?\n')) with ordinality as b(txt, ord)
  where btrim(b.txt) <> ''
),
jelolt as (
  select *,
    case when txt ~ '^[A-Z]\.\s*szakasz' then substring(txt from '^([A-Z])\.') end as szak_jel,
    case when txt ~ '^\d+\.$' then rtrim(txt,'.') end as pont_jel
  from blokk
),
kitoltve as (
  select *,
    max(szak_jel) over (partition by id order by ord rows between unbounded preceding and current row) as szakasz,
    max(pont_jel) over (partition by id order by ord rows between unbounded preceding and current row) as pont
  from jelolt
),
osszevont as (
  select source_id, article_number, deep_link, source_url,
         coalesce(szakasz || '.', '') || pont as pontszam,
         string_agg(txt, E'\n' order by ord) as tartalom
  from kitoltve
  where pont is not null and pont_jel is null
  group by source_id, article_number, deep_link, source_url, coalesce(szakasz || '.', '') || pont
)
insert into aic_legal_text (source_id, article_number, paragraph_number, scope, content, content_sha256, deep_link, source_url, retrieved_at)
select o.source_id, o.article_number, o.pontszam, 'paragraph', o.tartalom,
       encode(sha256(o.tartalom::bytea),'hex'), o.deep_link, o.source_url, now()
from osszevont o
where not exists (select 1 from aic_legal_text x where x.source_id=o.source_id
                    and x.article_number=o.article_number and x.paragraph_number=o.pontszam);

-- ---------------------------------------------------------------------------
-- 4. Akadálymentességi törvény, 1. melléklet.
--    Hierarchikus számozás: 1., 1.2., 1.2.1.1. Az azonos számú blokkok
--    összevonva, mert a melléklet több helyen újrakezdi a számozást.
-- ---------------------------------------------------------------------------
with f as (
  select t.source_id, t.article_number, t.deep_link, t.source_url, t.content
  from aic_legal_text t join aic_legal_sources s on s.id=t.source_id
  where s.celex_number='NJT-2022-17-00-00' and t.paragraph_number is null
),
b as (
  select f.source_id, f.article_number, f.deep_link, f.source_url, btrim(x.txt) as txt, x.ord
  from f, lateral unnest(regexp_split_to_array(f.content, E'\r?\n\\s*\r?\n')) with ordinality as x(txt, ord)
  where btrim(x.txt) <> ''
),
p as (
  select source_id, article_number, deep_link, source_url, ord,
         rtrim((regexp_match(txt, '^((?:\d+\.)+)\s'))[1], '.') as pontszam,
         btrim(regexp_replace(txt, '^(?:\d+\.)+\s+', '')) as tartalom
  from b where txt ~ '^(?:\d+\.)+\s'
),
g as (
  select source_id, article_number, min(deep_link) as deep_link, min(source_url) as source_url,
         pontszam, string_agg(tartalom, E'\n' order by ord) as tartalom
  from p group by source_id, article_number, pontszam
)
insert into aic_legal_text (source_id, article_number, paragraph_number, scope, content, content_sha256, deep_link, source_url, retrieved_at)
select g.source_id, g.article_number, g.pontszam, 'paragraph', g.tartalom,
       encode(sha256(g.tartalom::bytea),'hex'), g.deep_link, g.source_url, now()
from g
where not exists (select 1 from aic_legal_text x where x.source_id=g.source_id
                    and x.article_number=g.article_number and x.paragraph_number=g.pontszam);

-- ---------------------------------------------------------------------------
-- 5. Öt szabály elsődleges jogalapja.
--    A meglévő hivatkozások megmaradnak támogatóként.
-- ---------------------------------------------------------------------------
update aic_rule_legal_bases lb set basis_type='primary'
from aic_compliance_rules r, aic_legal_provisions p, aic_legal_sources s
where lb.rule_id=r.id and lb.provision_id=p.id and p.source_id=s.id
  and r.rule_code='VET_VULNERABLE_ACCESSIBLE_HANDOFF'
  and s.celex_number='NJT-2007-273-20-22' and p.article_number='30–36';

update aic_rule_legal_bases lb set basis_type='primary'
from aic_compliance_rules r, aic_legal_provisions p, aic_legal_sources s
where lb.rule_id=r.id and lb.provision_id=p.id and p.source_id=s.id
  and r.rule_code='ENERGY_ACCOUNT_DATA_TRACEABILITY'
  and s.celex_number='NJT-2007-273-20-22' and p.article_number='21/A';

update aic_rule_legal_bases lb set basis_type='primary'
from aic_compliance_rules r, aic_legal_provisions p, aic_legal_sources s
where lb.rule_id=r.id and lb.provision_id=p.id and p.source_id=s.id
  and r.rule_code='CHATBOT_DATA_GOVERNANCE_CONTROL'
  and s.celex_number='32016R0679' and p.article_number='5';

-- A változáskezelés és a hibakezelés az alkalmazói kötelezettségekből fakad:
-- a modell vagy a prompt cseréje megtörheti a használati utasítás szerinti
-- használatot, a naplók megőrzése pedig kifejezett alkalmazói kötelezettség.
insert into aic_rule_legal_bases (rule_id, provision_id, basis_type)
select r.id, p.id, 'primary'
from aic_compliance_rules r, aic_legal_provisions p, aic_legal_sources s
where p.source_id = s.id and s.celex_number = '02024R1689-20260727'
  and p.article_number = '26' and p.paragraph_number is null
  and r.rule_code in ('CHATBOT_CHANGE_CONTROL','CHATBOT_MONITORING_CONTROL')
  and not exists (select 1 from aic_rule_legal_bases b
                  where b.rule_id = r.id and b.provision_id = p.id);

-- ---------------------------------------------------------------------------
-- 6. Szabályzatok visszavonása piszkozatba.
-- ---------------------------------------------------------------------------
update aic_generated_policies
set status='draft', submitted_by=null, submitted_at=null,
    reviewed_by=null, reviewed_at=null, review_note=null,
    review_findings=null, review_findings_at=null
where status <> 'draft';

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select
 (select count(*) from aic_compliance_rules) as szabaly,
 (select count(*) from aic_compliance_rules r
   where not exists (select 1 from aic_rule_legal_bases b
                     where b.rule_id=r.id and b.basis_type='primary')) as elsodleges_nelkul,
 (select count(*) from aic_legal_text t join aic_legal_sources s on s.id=t.source_id
   where s.celex_number='02024R1689-20260727' and t.article_number like 'Annex%'
     and t.paragraph_number is not null) as mi_melleklet_pontok,
 (select count(*) from aic_generated_policies where status<>'draft') as nem_piszkozat;

commit;
