-- EnergiaAI Kontroll – a 273/2007. 26. § besorolása.
--
-- MIÉRT
-- Ez volt az utolsó jogszabályhely az Infotv-n kívül, amiről nem született
-- javaslat. A szakasz a kereskedőváltásról szól: részletes tájékoztatás a nem
-- teljesített szerződéses feltételekről, írásbeli visszaigazolás, záró
-- mérőállás, pénzügyi biztosíték, és felelősség a késedelemért.
--
-- MIÉRT HIÁNY
-- A meglévő energetikai szabályunk (VET_DISCONNECTION_DECISION_BLOCK) a
-- kikapcsolásról, visszakapcsolásról és tartozásról szól, nem a
-- kereskedőváltásról. Egy ügyfélszolgálati chatbot viszont biztosan kap
-- szolgáltatóváltással kapcsolatos kérdést, és a rossz válasznak a 26. § (8)
-- bekezdése szerint kártérítési következménye van.
--
-- Ez a fájl javaslatot ír, nem dönt.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

update public.aic_provision_coverage c
set proposed_status = 'gap',
    proposed_reason = 'Kereskedőváltás: tájékoztatás a nem teljesített szerződéses feltételekről, írásbeli visszaigazolás, záró mérőállás, pénzügyi biztosíték, és a késedelemért való kártérítési felelősség. A meglévő energetikai szabály a kikapcsolásról szól, nem erről.',
    updated_at = now()
from public.aic_legal_sources s
where s.id = c.source_id and s.celex_number = 'NJT-2007-273-20-22'
  and c.article_number = '26' and c.proposed_status is null;

select coalesce(c.proposed_status,'javaslat nélkül') as javaslat,
       count(*) as jogszabalyhely
from public.aic_provision_coverage c
group by 1 order by 2 desc;

commit;
