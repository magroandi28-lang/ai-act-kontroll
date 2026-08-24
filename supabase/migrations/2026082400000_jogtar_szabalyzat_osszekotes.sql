-- EnergiaAI Kontroll – a jogtár és a szabályzatok összekötése.
-- 2026. augusztus 24.
--
-- MÁR LEFUTOTT az adatbázison, tizenegy külön migrációként. Ez a fájl a
-- migrációs napló teljességéért van: futtatni nem kell, de a repóban legyen
-- ott, hogy a séma története hiánytalan legyen.
--
-- MIT OLD MEG
-- A jogtárban a jóváhagyás eddig csak a szabályt jelölte jóváhagyottnak, a
-- szabályzatba kerülő szöveget nem. Emiatt minden szabályzat piszkozat maradt,
-- és minden előírás "szakértői jóváhagyásra vár" jelzést kapott, hiába hagyta
-- jóvá a jogász mind a 143 szabályt.
--
-- A LÁNC MOSTANTÓL
--   jogász jóváhagy  ->  a szabályzati szöveg is jóváhagyott
--                    ->  a szabályzat állapota újraszámolódik
--                    ->  a vezetői összefoglaló újraíródik
--   rendszer adata változik -> a szabályzat elavult jelzést kap
--   jogszabály módosul      -> a szabály visszaesik, a szabályzat piszkozat lesz
--
-- Az egyes migrációk neve a Supabase naplójában:
--   jogtar_jovahagyas_atvezetese_a_szabalyzatra
--   szabalyzat_allapota_a_jovahagyasbol
--   szabalyzat_allapot_keretszoveg_javitas
--   szabalyzat_allapot_automatikus_frissitese
--   uj_szabalyzat_allapota_automatikus
--   vedoszabaly_es_vezetoi_osszefoglalo
--   vezetoi_osszefoglalo_ujraepitese
--   tenylap_ertek_biztonsagos_olvasasa
--   vezetoi_osszefoglalo_biztonsagos_teny_olvasas
--   vezetoi_osszefoglalo_frissitese_a_meglevoknel
--   vezetoi_osszefoglalo_teljes_ujraszamolas
--   szabalyzat_elavulas_jelzese
--
-- A függvények teljes szövege az adatbázisban él; ha valaha új környezetbe
-- kell telepíteni, a Supabase migrációs naplójából kinyerhető.

-- ---------------------------------------------------------------------------
-- Séma-változások, amelyek nélkül a fenti működés nem áll helyre
-- ---------------------------------------------------------------------------

alter table aic_generated_policies
  add column if not exists elavult_ok text,
  add column if not exists elavult_ota timestamptz;

comment on column aic_generated_policies.elavult_ok is
  'Miért avult el a szabályzat: a rendszer adatai a generálás óta megváltoztak.';

alter table aic_trigger_catalogue
  add column if not exists szerepkorok text[] not null
    default array['deployer','provider','importer','distributor','authorised_representative'],
  add column if not exists kerdes_csoport text,
  add column if not exists valasz_lehetosegek jsonb;

comment on column aic_trigger_catalogue.szerepkorok is
  'Mely szerepkörben lévő felhasználótól kérdezzük meg. Üres tömb: a felvitelnél nem kérdezzük.';
comment on column aic_trigger_catalogue.kerdes_csoport is
  'A felvitelnél egy kártyán megjelenő kérdéscsoport azonosítója. Üres: önálló kérdés.';
comment on column aic_trigger_catalogue.valasz_lehetosegek is
  'Több választós kérdés lehetőségei: [{"kod":"audio","cimke":"Hang"}]. Üres: eldöntendő kérdés.';

alter table aic_compliance_rules
  add column if not exists felulvizsgalat_valtozas_id uuid
    references aic_legal_text_changes(id) on delete set null;

comment on column aic_compliance_rules.felulvizsgalat_valtozas_id is
  'Ha ki van töltve, a szabály jogalapja megváltozott és felülvizsgálatra vár.';

alter table aic_policy_modules
  add column if not exists generacio text not null default 'aktualis';

create table if not exists aic_kerdes_csoportok (
  csoport text primary key,
  cim text not null,
  leiras text,
  nincs_egyik_cimke text not null default 'Egyiket sem',
  sorrend integer not null default 100
);

alter table aic_kerdes_csoportok enable row level security;

drop policy if exists aic_kerdes_csoportok_olvasas on aic_kerdes_csoportok;
create policy aic_kerdes_csoportok_olvasas on aic_kerdes_csoportok
  for select to authenticated using (true);
