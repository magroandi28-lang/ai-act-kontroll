-- EnergiaAI Kontroll – kapcsolók katalógusa, 1. rész: MI-rendelet 5. cikk.
--
-- MIÉRT
-- A szabályok ma 112 szabad szöveges "tényre" hivatkoznak, amiket valaki
-- menet közben elnevezett. Nincs róluk lista, nincs magyar nevük, nincs
-- definíciójuk, és nem derül ki, melyik jogszabályhelyből származnak. Ezért
-- nem lehet őket kezelni, és ezért nem ér össze a felviteli kérdőív a
-- szabályokkal.
--
-- A HELYES IRÁNY
-- Nem abból indulunk ki, amit eddig építettünk, hanem abból, hogy a törvény
-- mihez köti a kötelezettséget. A kapcsolókat a jogszabályszövegből olvassuk
-- ki, cikkenként.
--
-- HATFÉLE KAPCSOLÓ VAN, ÉS MINDEGYIKKEL MÁSKÉNT KELL BÁNNI
--   funkcio        – mit tud az eszköz. Ezt a felvitelnél kipipálják.
--   besorolas      – a rendszer jogi osztálya. Levezetett, nem kérdés.
--   szerepkor      – a szervezet minősége a láncban. Levezetett.
--   kornyezet      – hol és mire használják.
--   jogi_minosites – jogi megítélést igényel; nem a felvivő dolga.
--   esemeny        – működés közben történik, nem felvitelkor derül ki.
--
-- EZ A FÁJL
-- Létrehozza a táblát, és feltölti az MI-rendelet 5. cikkének nyolc tiltott
-- gyakorlatával. A tiltott gyakorlatok a legtisztább eset: a rendelet maga
-- nevesíti mind a nyolcat, tehát nem kell értelmezni, csak kiolvasni.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

create table if not exists public.aic_trigger_catalogue (
  id uuid primary key default gen_random_uuid(),
  trigger_key text not null unique,
  name_hu text not null,
  description_hu text not null,
  category text not null
    check (category in ('funkcio','besorolas','szerepkor','kornyezet','jogi_minosites','esemeny')),
  source_id uuid references public.aic_legal_sources(id),
  article_number text,
  paragraph_number text,
  question_hu text,
  derived boolean not null default false,
  derivation_note text,
  legacy_fact_keys text[] not null default '{}',
  display_order integer not null default 100,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.aic_trigger_catalogue is
  'Kapcsolók: mihez köti a törvény a kötelezettséget. A jogszabályszövegből kiolvasva, nem a meglévő szabályokból visszafejtve.';
comment on column public.aic_trigger_catalogue.legacy_fact_keys is
  'A meglévő szabályokban használt régi ténykulcsok, amelyek ide tartoznak. Az összekötéshez kell.';
comment on column public.aic_trigger_catalogue.derived is
  'Igaz, ha nem kérdezzük, hanem más válaszokból számoljuk.';

create index if not exists aic_trigger_catalogue_category_idx
  on public.aic_trigger_catalogue (category);

alter table public.aic_trigger_catalogue enable row level security;
drop policy if exists aic_trigger_catalogue_olvasas on public.aic_trigger_catalogue;
create policy aic_trigger_catalogue_olvasas on public.aic_trigger_catalogue
  for select to authenticated using (true);

-- ---------------------------------------------------------------------------
-- MI-rendelet 5. cikk (1) bekezdés – nyolc tiltott gyakorlat.
--
-- Mindegyik funkció: arról szól, mit csinál a rendszer. A tiltás feltételei
-- (jelentős kár, viselkedés érdemi torzítása, kivételek) külön kapcsolók
-- lesznek – azok jogi minősítések, nem funkciók.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   paragraph_number, question_hu, display_order, legacy_fact_keys)
select v.kulcs, v.nev, v.leiras, v.kategoria, s.id, '5', v.bekezdes, v.kerdes, v.sorrend, v.regi
from public.aic_legal_sources s,
(values
 ('SUBLIMINAL_MANIPULATION',
  'Tudatalatti vagy megtévesztő befolyásolás',
  'A rendszer tudatalatti, manipulatív vagy megtévesztő technikát alkalmaz azzal a céllal vagy hatással, hogy érdemben torzítsa a személy viselkedését.',
  'funkcio', '1(a)',
  'Alkalmaz a rendszer tudatalatti, manipulatív vagy megtévesztő technikát a viselkedés befolyásolására?',
  10, array['uses_subliminal_manipulative_or_deceptive_techniques']),

 ('EXPLOITS_VULNERABILITY',
  'Sérülékenység kihasználása',
  'A rendszer életkorból, fogyatékosságból vagy társadalmi-gazdasági helyzetből fakadó sérülékenységet használ ki.',
  'funkcio', '1(b)',
  'Használja ki a rendszer az életkorból, fogyatékosságból vagy társadalmi-gazdasági helyzetből fakadó sérülékenységet?',
  20, array['exploits_age_disability_or_social_economic_vulnerability']),

 ('SOCIAL_SCORING',
  'Társadalmi pontozás',
  'A rendszer természetes személyeket értékel vagy osztályoz hosszabb időn át társadalmi viselkedésük vagy személyes jellemzőik alapján.',
  'funkcio', '1(c)',
  'Értékel a rendszer személyeket hosszabb időn át társadalmi viselkedésük vagy személyes jellemzőik alapján?',
  30, array['evaluates_persons_over_time_from_social_behaviour_or_personal_traits','prohibited_social_scoring_outcome']),

 ('CRIMINAL_RISK_PREDICTION',
  'Bűnelkövetési kockázat előrejelzése',
  'A rendszer azt jelzi előre, hogy egy természetes személy bűncselekményt fog-e elkövetni, kizárólag profilalkotás vagy személyiségjegyek alapján.',
  'funkcio', '1(d)',
  'Jelzi előre a rendszer, hogy egy személy bűncselekményt követhet el?',
  40, array['predicts_individual_criminal_offence_risk','based_solely_on_profiling_or_personality_traits']),

 ('FACE_SCRAPING',
  'Arcképek cél nélküli gyűjtése',
  'A rendszer arcfelismerő adatbázist hoz létre vagy bővít az internetről vagy térfigyelő felvételekből, célzás nélkül gyűjtött arcképekkel.',
  'funkcio', '1(e)',
  'Gyűjt a rendszer arcképeket az internetről vagy térfigyelő felvételekből arcfelismerő adatbázis építéséhez?',
  50, array['creates_or_expands_facial_recognition_database','uses_untargeted_internet_or_cctv_face_scraping']),

 ('EMOTION_RECOGNITION',
  'Érzelemfelismerés',
  'A rendszer természetes személyek érzelmeire következtet. Munkahelyen és oktatásban tiltott, egyebütt átláthatósági kötelezettséget von maga után.',
  'funkcio', '1(f)',
  'Következtet a rendszer természetes személyek érzelmeire?',
  60, array['infers_natural_person_emotions']),

 ('BIOMETRIC_CATEGORISATION',
  'Biometrikus kategorizálás',
  'A rendszer biometrikus adatból védett vagy érzékeny jellemzőt következtet ki, például faji hovatartozást, politikai véleményt vagy szexuális irányultságot.',
  'funkcio', '1(g)',
  'Következtet a rendszer biometrikus adatból védett vagy érzékeny jellemzőre?',
  70, array['biometric_categorisation_of_individuals','infers_protected_sensitive_characteristics']),

 ('REALTIME_REMOTE_BIOMETRIC_ID',
  'Valós idejű távoli biometrikus azonosítás',
  'A rendszer valós időben, távolról azonosít személyeket a nyilvánosság számára hozzáférhető helyen.',
  'funkcio', '1(h)',
  'Végez a rendszer valós idejű távoli biometrikus azonosítást nyilvános helyen?',
  80, array['uses_realtime_remote_biometric_identification'])
) as v(kulcs,nev,leiras,kategoria,bekezdes,kerdes,sorrend,regi)
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- Az 5. cikk feltételei és kivételei – ezek nem funkciók.
-- A tiltás csak akkor áll fenn, ha ezek is teljesülnek. Megítélésük jogi
-- kérdés, ezért nem a felvivőtől kérdezzük.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   paragraph_number, question_hu, derived, derivation_note, display_order, legacy_fact_keys)
select v.kulcs, v.nev, v.leiras, v.kategoria, s.id, '5', v.bekezdes, null, false, v.megjegyzes, v.sorrend, v.regi
from public.aic_legal_sources s,
(values
 ('BEHAVIOUR_MATERIALLY_DISTORTED',
  'A viselkedés érdemi torzítása',
  'A befolyásolás érdemben torzítja a személy viselkedését vagy tájékozott döntését. A tiltás enélkül nem áll fenn.',
  'jogi_minosites', '1(a)-(b)',
  'Jogi megítélést igényel: mikor érdemi a torzítás. Nem a felvivő dolga eldönteni.',
  15, array['materially_distorts_behaviour','materially_distorts_informed_decision']),

 ('SIGNIFICANT_HARM_LIKELY',
  'Jelentős kár bekövetkezése vagy valószínűsége',
  'A gyakorlat jelentős kárt okoz vagy valószínűsíthetően okoz. Az 5. cikk több tiltásának együttes feltétele.',
  'jogi_minosites', '1(a)-(b)',
  'Jogi megítélést igényel.',
  16, array['significant_harm_caused_or_likely']),

 ('ART5_LAW_ENFORCEMENT_EXCEPTION',
  'Bűnüldözési kivétel az 5. cikkhez',
  'A valós idejű távoli biometrikus azonosítás szigorú, bírói engedélyhez kötött bűnüldözési kivétele fennáll.',
  'jogi_minosites', '2-7',
  'Csak bűnüldöző szervnél merül fel, bírói engedéllyel. Alapértelmezésben hamis.',
  85, array['strict_article_5_law_enforcement_exception_met','article_5_biometric_exception_applies','context_is_public_space_law_enforcement']),

 ('ART5_MEDICAL_SAFETY_EXCEPTION',
  'Orvosi vagy biztonsági kivétel az érzelemfelismeréshez',
  'Az érzelemfelismerés munkahelyen és oktatásban akkor megengedett, ha orvosi vagy biztonsági okból történik.',
  'jogi_minosites', '1(f)',
  'Jogi megítélést igényel.',
  65, array['medical_or_safety_exception_applies']),

 ('OBJECTIVE_HUMAN_ASSESSMENT',
  'Tényeken alapuló emberi értékelés',
  'A bűnelkövetési kockázat előrejelzésének tilalma nem áll fenn, ha a rendszer objektív, tényeken alapuló emberi értékelést támogat.',
  'jogi_minosites', '1(d)',
  'Jogi megítélést igényel.',
  45, array['objective_fact_based_human_assessment_exception'])
) as v(kulcs,nev,leiras,kategoria,bekezdes,megjegyzes,sorrend,regi)
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = v.kulcs);

-- ---------------------------------------------------------------------------
-- Környezet, ami az 5. cikk (1) bekezdés f) pontjához kell.
-- ---------------------------------------------------------------------------
insert into public.aic_trigger_catalogue
  (trigger_key, name_hu, description_hu, category, source_id, article_number,
   paragraph_number, question_hu, display_order, legacy_fact_keys)
select 'CONTEXT_WORKPLACE_EDUCATION',
       'Munkahelyi vagy oktatási használat',
       'A rendszert munkahelyen vagy oktatási intézményben használják. Az érzelemfelismerés tilalma ehhez a környezethez kötött.',
       'kornyezet', s.id, '5', '1(f)',
       'Munkahelyen vagy oktatási intézményben használják a rendszert?',
       62, array['context_is_workplace_or_education']
from public.aic_legal_sources s
where s.celex_number = '02024R1689-20260727'
  and not exists (select 1 from public.aic_trigger_catalogue c where c.trigger_key = 'CONTEXT_WORKPLACE_EDUCATION');

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select category as kategoria, count(*) as kapcsolo,
       count(*) filter (where question_hu is not null) as van_kerdes
from public.aic_trigger_catalogue
group by category order by 2 desc;

commit;
