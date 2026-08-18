-- EnergiaAI Kontroll – a GDPR 30. cikkes szabály MI-specifikussá tétele.
--
-- MIÉRT
-- Kimondtuk alapelvként: minden szabálynak meg kell mondania, mit jelent az
-- MI-eszközre. A törvényszöveg megismétlése nem szabály.
--
-- Az eredeti megfogalmazás – "a rendszer működésével összefüggő adatkezelési
-- tevékenységekről nyilvántartást vezet" – igaz, de nem mondja meg, mi az, ami
-- MI-nél ténylegesen a nyilvántartásba kerül. Egy nyilvántartás, amelyből
-- hiányzik a modell megnevezése, a beszélgetési napló mint adatkategória és a
-- tanítóadat forrása, formálisan létezik, tartalmilag üres.
--
-- MI VÁLTOZIK
-- A szabályzatba kerülő szöveg kiegészül a nyilvántartás MI-specifikus
-- tartalmával, és egy új teendővel. A jogalap és a szabály kódja változatlan.
-- A modul verziószáma emelkedik, hogy a korábban generált dokumentumok
-- újragenerálása szükséges legyen.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

update public.aic_policy_modules
set full_text_template =
      'A {{organisation_name}} a {{system_name}} működésével összefüggő adatkezelési tevékenységeiről írásban – ideértve az elektronikus formát is – nyilvántartást vezet. A nyilvántartás tartalmazza az adatkezelés céljait, az érintettek és a személyes adatok kategóriáit, a címzettek kategóriáit, a harmadik országba vagy nemzetközi szervezet részére történő továbbítást és annak garanciáit, a törlésre előirányzott határidőket, valamint a technikai és szervezési intézkedések általános leírását. '
      || 'A {{system_name}} vonatkozásában a nyilvántartásban külön meg kell jelölni a felhasznált modellt vagy szolgáltatást és annak nyújtóját, a rendszer működése során keletkező adatkategóriákat – így különösen a beszélgetési vagy interakciós naplókat és a hozzájuk kapcsolt azonosítókat –, a tanításhoz vagy finomhangoláshoz felhasznált adatok forrását, továbbá azt, hogy a naplók meddig maradnak visszakereshetők. '
      || 'Ha a {{organisation_name}} más adatkezelő nevében jár el, a nevében végzett adatkezelési tevékenységek kategóriáiról vezet nyilvántartást. A nyilvántartást a felügyeleti hatóság megkeresésére rendelkezésre kell bocsátani. A 250 főnél kisebb szervezetekre vonatkozó mentesség a {{system_name}} vonatkozásában nem alkalmazható, ha az adatkezelés nem alkalmi jellegű, az érintettek jogaira és szabadságaira nézve kockázattal jár, vagy különleges adatok kezelésére terjed ki.',
    summary_text = 'Az MI-eszköz adatkezelését fel kell venni a nyilvántartásba, megnevezve a modellt, a naplókat és a tanítóadat forrását.',
    version = version + 1,
    updated_at = now()
where module_code = 'GDPR_PROCESSING_RECORDS';

-- Új teendő: a nyilvántartás MI-specifikus tartalma.
insert into public.aic_required_actions (rule_id, action_code, action_title, action_description, priority)
select r.id, 'ART30_AI_SPECIFIC_CONTENT',
       'A nyilvántartás MI-specifikus tartalma',
       'A bejegyzésben nevesíteni kell a felhasznált modellt vagy szolgáltatást és annak nyújtóját, a beszélgetési vagy interakciós naplókat mint adatkategóriát, a tanításhoz felhasznált adatok forrását, és a naplók visszakereshetőségének idejét.',
       'high'
from public.aic_compliance_rules r
where r.rule_code = 'GDPR_ART30_PROCESSING_RECORDS'
  and not exists (select 1 from public.aic_required_actions a
                  where a.rule_id = r.id and a.action_code = 'ART30_AI_SPECIFIC_CONTENT');

-- A jegyzet rögzíti, mi törvényszöveg és mi értelmezés.
update public.aic_compliance_rules
set legal_interpretation_note = coalesce(legal_interpretation_note || ' ', '')
      || 'A 30. cikk (1) bekezdése kategóriákat sorol fel, nem nevesíti a modellt, a naplót vagy a tanítóadat forrását. Ezek megjelölése értelmezés: azt bontja ki, mi tartozik MI-eszköznél az "adatkezelés céljai", az "érintettek és a személyes adatok kategóriái", illetve a "címzettek" fogalma alá.',
    updated_at = now()
where rule_code = 'GDPR_ART30_PROCESSING_RECORDS';

select m.module_code, m.version, length(m.full_text_template) as szoveg_hossz,
       (select count(*) from public.aic_required_actions a where a.rule_id = m.rule_id) as teendo
from public.aic_policy_modules m
where m.module_code = 'GDPR_PROCESSING_RECORDS';

commit;
