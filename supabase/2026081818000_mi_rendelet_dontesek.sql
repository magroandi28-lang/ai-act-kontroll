-- EnergiaAI Kontroll – döntés az MI-rendelet 20 nyitott cikkéről.
--
-- MIÉRT
-- A lefedettségi tábla első futása után 20 MI-rendeleti cikk maradt javaslat
-- nélkül. Átnéztük mind a húszat. A kérdés mindegyiknél ugyanaz volt:
-- keletkezik-e ebből kötelezettség egy cégre, amely MI-t használ vagy gyárt.
--
-- EREDMÉNY
-- 14 cikk lezárva, 6 cikkhez szabály kell.
--
-- Ez a fájl csak a javaslatot írja be. A coverage_status továbbra is undecided
-- marad: a végleges döntés emberé, és az aic_lefedettseg_dontes függvényen
-- keresztül rögzül, névvel és időponttal.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. Módosító cikkek: 102-110.
--    Más uniós jogszabályokat módosítanak – repülésbiztonság, gépjárművek,
--    vasút, hajófelszerelés, mezőgazdasági járművek, képviseleti keresetek.
--    A kötelezettség a módosított jogszabályban jelenik meg, nem itt.
-- ---------------------------------------------------------------------------
update public.aic_provision_coverage c
set proposed_status = 'not_required',
    proposed_reason = 'Más uniós jogszabályt módosító rendelkezés. A kötelezettség a módosított jogi aktusban keletkezik, nem itt.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '02024R1689-20260727'
  and c.proposed_status is null
  and c.article_number in ('102','103','104','105','106','107','108','109','110');

-- ---------------------------------------------------------------------------
-- 2. Kedvezmények: 62., 63., 95.
--    Kkv-knak szóló tagállami intézkedések, mikrovállalkozásoknak biztosított
--    egyszerűsítés, önkéntes magatartási kódexek. Jogot adnak, nem
--    kötelezettséget, ezért nem keletkezik belőlük szabályzati előírás.
-- ---------------------------------------------------------------------------
update public.aic_provision_coverage c
set proposed_status = 'not_required',
    proposed_reason = 'Kedvezményt vagy önkéntes lehetőséget biztosít, nem kötelezettséget ír elő.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '02024R1689-20260727'
  and c.proposed_status is null
  and c.article_number in ('62','63','95');

-- ---------------------------------------------------------------------------
-- 3. Feltételes: 46., 59.
--    A 46. cikk akkor él, ha a cég maga kérelmezi a megfelelőségértékeléstől
--    való eltérést. Az 59. cikk akkor, ha szabályozói tesztkörnyezetben vesz
--    részt. Egyik sem általános helyzet, ezért most nem írunk belőlük szabályt.
--    Ha egy ügyfél ilyet tesz, ide vissza kell térni.
-- ---------------------------------------------------------------------------
update public.aic_provision_coverage c
set proposed_status = 'not_required',
    proposed_reason = 'Csak akkor alkalmazandó, ha a cég maga kezdeményezi: eltérés kérelmezése, illetve szabályozói tesztkörnyezetben való részvétel. Ilyen esetben újra kell értékelni.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '02024R1689-20260727'
  and c.proposed_status is null
  and c.article_number in ('46','59');

-- ---------------------------------------------------------------------------
-- 4. Ide szabály kell: 79-83. és 111.
--
--    79-83.: piacfelügyeleti eljárások. Elsőre hatóságinak látszanak, de amikor
--    a hatóság eljárást indít, a gazdasági szereplőnek tényleges kötelezettsége
--    keletkezik: korrekciós intézkedés, visszahívás, kivonás, tájékoztatás.
--
--    111.: átmeneti rendelkezés a már forgalomba hozott vagy üzembe helyezett
--    MI-rendszerekre. Ez minden olyan céget érint, amelynek ma is működik
--    MI-eszköze – vagyis a felhasználók többségét.
-- ---------------------------------------------------------------------------
update public.aic_provision_coverage c
set proposed_status = 'gap',
    proposed_reason = 'Piacfelügyeleti eljárás esetén a gazdasági szereplőnek korrekciós kötelezettsége keletkezik: kijavítás, visszahívás, forgalomból kivonás, tájékoztatás. Egyetlen szabály sem fedi le.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '02024R1689-20260727'
  and c.proposed_status is null
  and c.article_number in ('79','80','81','82','83');

update public.aic_provision_coverage c
set proposed_status = 'gap',
    proposed_reason = 'Átmeneti rendelkezés a már forgalomba hozott vagy üzembe helyezett MI-rendszerekre: mikortól kell megfelelniük. Minden olyan céget érint, amelynek már ma is működik MI-eszköze.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = '02024R1689-20260727'
  and c.proposed_status is null
  and c.article_number = '111';

-- ---------------------------------------------------------------------------
-- Ellenőrzés.
-- ---------------------------------------------------------------------------
select coalesce(c.proposed_status,'javaslat nélkül') as javaslat,
       count(*) as cikk,
       string_agg(c.article_number, ', ' order by
         coalesce((regexp_match(c.article_number,'^(\d+)'))[1]::int, 999)) as cikkek
from public.aic_provision_coverage c
join public.aic_legal_sources s on s.id = c.source_id
where s.celex_number = '02024R1689-20260727'
  and (c.proposed_status is null or c.proposed_status = 'gap')
group by 1;

commit;
