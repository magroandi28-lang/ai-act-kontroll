-- EnergiaAI Kontroll – kapcsolók a magyar jogszabályokból.
--
-- MIÉRT KELL EZ KÜLÖN
-- Az EU-s rendeletek ahhoz kötik a kötelezettséget, hogy MIT TUD a rendszer:
-- biometria, generálás, profilalkotás. A magyar ágazati jog máshoz: ahhoz,
-- hogy MILYEN TEVÉKENYSÉGET végez a cég, és milyen ügyet intéz az eszköz.
--
-- Ezért a magyar jogból olyan kapcsolók jönnek, amiket az MI-rendelet
-- feldolgozása nem adott meg. Ez a hét hiányzott.
--
-- HONNAN
--   1997. évi CLV. 17/A-17/B. §  – panaszügyintézés, ügyfélszolgálat
--   2001. évi CVIII. 4. §        – elektronikus szolgáltatás nyújtása
--   2008. évi XLVII. 3., 6-7. §  – kereskedelmi gyakorlat
--   273/2007. 14/C., 27/B. §     – okosmérési adat, adatkiadás kérésre
--   2011. évi CXII. 26-37. §     – közfeladatot ellátó szerv
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   question_hu, always_ask, ask_only_if, derived, derivation_note,
   display_order, detection_patterns, detection_note)
select v.kulcs, v.nev, v.leiras, v.kategoria, s.id, v.cikk, v.kerdes, v.mindig,
       v.felteteles::jsonb, v.szamolt, v.megjegyzes, v.sorrend, v.minta::jsonb, v.dnote
from public.aic_legal_sources s,
(values
 ('OPERATES_CUSTOMER_SERVICE',
  'Ügyfélszolgálati feladatot lát el',
  'A rendszer ügyfélszolgálati feladatot lát el vagy annak részeként működik: kérdésre válaszol, ügyet vesz fel, tájékoztat.',
  'funkcio', '17/B', 'NJT-1997-155-00-00',
  'Lát el a rendszer ügyfélszolgálati feladatot – kérdésre válaszol, ügyet vesz fel vagy tájékoztat?',
  true, null, false, null, 700,
  '[{"minta":"ügyfélszolgálat","tipus":"szoveg","suly":"eros"},
    {"minta":"customer service","tipus":"szoveg","suly":"eros"},
    {"minta":"helpdesk","tipus":"szoveg","suly":"eros"},
    {"minta":"support","tipus":"szoveg","suly":"gyenge"}]',
  'A fogyasztóvédelmi törvény az ügyfélszolgálathoz köti a tájékoztatási és panaszkezelési kötelezettségeket, függetlenül attól, hogy ember vagy gép működteti.'),

 ('IS_PUBLIC_SERVICE_PROVIDER',
  'Közszolgáltatói tevékenység',
  'A szervezet közszolgáltatási tevékenységet folytat – villamos energia, gáz, víz, távhő, hulladék, hírközlés. Szigorúbb ügyfélszolgálati és panaszkezelési szabályok vonatkoznak rá.',
  'szerepkor', '17/B', 'NJT-1997-155-00-00',
  null, false, null, true,
  'Az iparágból számolt. Energetikai engedélyesnél igaz.', 705,
  '[]', null),

 ('ELECTRONIC_SERVICE_PROVIDER',
  'Elektronikusan nyújtott szolgáltatás',
  'A szolgáltatást elektronikus úton, távollévők részére nyújtják. Az elektronikus kereskedelmi törvény szolgáltatói adatközlési kötelezettségét váltja ki.',
  'kornyezet', '4', 'NJT-2001-108-00-00',
  null, false, null, true,
  'Minden online elérhető eszköznél igaz. A telepítési módból számolt.', 710,
  '[]', null),

 ('COMMERCIAL_PRACTICE',
  'Kereskedelmi gyakorlatot valósít meg',
  'A rendszer terméket vagy szolgáltatást ajánl, tarifát javasol, akciót közöl, vagy más módon befolyásolja a fogyasztó ügyleti döntését. Ilyenkor a tisztességtelen kereskedelmi gyakorlat tilalma alá esik.',
  'funkcio', '3', 'NJT-2008-47-00-00',
  'Ajánl a rendszer terméket, szolgáltatást, tarifát vagy akciót a felhasználónak?',
  true, null, false, null, 715,
  '[{"minta":"ajánlat","tipus":"szoveg","suly":"eros"},
    {"minta":"tarifa","tipus":"szoveg","suly":"eros"},
    {"minta":"akció","tipus":"szoveg","suly":"gyenge"},
    {"minta":"upsell","tipus":"szoveg","suly":"eros"},
    {"minta":"recommend","tipus":"szoveg","suly":"eros"}]',
  'Egy chatbot, amely tarifát ajánl, kereskedelmi gyakorlatot valósít meg. A pontatlan vagy hiányos válasz megtévesztésnek minősülhet.'),

 ('PUBLIC_BODY',
  'Közfeladatot ellátó szerv',
  'A szervezet közfeladatot ellátó szerv. Az Infotv. szerinti közérdekűadat-igénylési és közzétételi kötelezettségek vonatkoznak rá.',
  'szerepkor', '26', 'NJT-2011-112-00-00',
  null, false, null, true,
  'A szervezet típusából számolt. A közigazgatási iparág felvételekor lesz jelentősége.', 720,
  '[]', null),

 ('SMART_METERING_DATA',
  'Okosmérési adathoz való hozzáférés',
  'A rendszer okosmérőből származó fogyasztási adatot jelenít meg vagy dolgoz fel.',
  'funkcio', '14/C', 'NJT-2007-273-20-22',
  'Jelenít meg vagy dolgoz fel a rendszer okosmérőből származó fogyasztási adatot?',
  false, '{"all":[{"fact":"industry","operator":"equals","value":"energy"}]}', false, null, 725,
  '[{"minta":"okosmérő","tipus":"szoveg","suly":"eros"},
    {"minta":"smart meter","tipus":"szoveg","suly":"eros"},
    {"minta":"fogyasztási adat","tipus":"szoveg","suly":"eros"},
    {"minta":"consumption","tipus":"oszlopnev","suly":"eros"}]',
  null),

 ('DATA_DISCLOSURE_ON_REQUEST',
  'Adatkiadás a felhasználó kérésére',
  'A rendszer a felhasználó kérésére adatot ad ki vagy továbbít – például fogyasztási előzményt harmadik félnek.',
  'funkcio', '27/B', 'NJT-2007-273-20-22',
  'Ad ki vagy továbbít a rendszer adatot a felhasználó kérésére, akár harmadik félnek?',
  false, '{"all":[{"fact":"industry","operator":"equals","value":"energy"}]}', false, null, 730,
  '[{"minta":"adatkiadás","tipus":"szoveg","suly":"eros"},
    {"minta":"adatexport","tipus":"szoveg","suly":"eros"},
    {"minta":"export","tipus":"szoveg","suly":"gyenge"}]',
  null)
) as v(kulcs,nev,leiras,kategoria,cikk,celex,kerdes,mindig,felteteles,szamolt,megjegyzes,sorrend,minta,dnote)
where s.celex_number = v.celex
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select s.title as jogforras, count(*) as kapcsolo
from public.aic_trigger_catalogue c
left join public.aic_legal_sources s on s.id = c.source_id
group by s.title order by 2 desc;

select count(*) as kapcsolo_ossz,
       count(*) filter (where always_ask) as mindig_kerdezzuk,
       count(*) filter (where ask_only_if is not null) as feltetelesen,
       count(*) filter (where derived) as levezetett,
       count(*) filter (where category = 'jogi_minosites') as jogi_dontes,
       count(*) filter (where category = 'esemeny') as esemeny
from public.aic_trigger_catalogue;

commit;
