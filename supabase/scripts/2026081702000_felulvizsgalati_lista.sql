-- EnergiaAI Kontroll – a jogász várólistája.
--
-- MIÉRT
-- A vezérlőpult „Jóváhagyásra vár" kártyája nem létező oldalra mutatott. A
-- jóváhagyás mechanizmusa készen volt a dokumentum oldalán, de a jogásznak
-- nem volt honnan tudnia, melyik dokumentum vár rá – egyesével kellett volna
-- rendszereket nyitogatnia.
--
-- MIT AD VISSZA
-- Rendszerenként a legfrissebb szabályzatverziót, állapottal, fejezetszámmal
-- és azzal, hány fejezet áll még jóvá nem hagyott szabályon. Az utolsó szám a
-- lényeg: ez fogy el, ahogy a jogász halad, mert egy fejezet jóváhagyása a
-- mögötte álló szabálymodult hagyja jóvá, minden dokumentumban egyszerre.
--
-- A rendezés cselekvés szerinti: elöl, ami rá vár, hátul, ami kész.
--
-- Ezt a függvényt a fejlesztés során már alkalmaztuk az adatbázisban.
-- Az ismételt futtatás ártalmatlan (create or replace).
--
-- Helye: supabase/migrations/

begin;

create or replace function public.aic_felulvizsgalati_lista(p_organisation_id uuid)
returns table (
  policy_id uuid,
  ai_system_id uuid,
  system_name text,
  version integer,
  status text,
  section_count integer,
  pending_rule_count integer,
  submitted_at timestamptz,
  reviewed_at timestamptz,
  updated_at timestamptz,
  review_note text
)
language plpgsql
stable
security invoker
set search_path = public, pg_temp
as $function$
begin
  if auth.uid() is null then
    raise exception 'A lista megtekintéséhez bejelentkezés szükséges.';
  end if;

  if public.aic_szervezeti_szerep(p_organisation_id) is null then
    raise exception 'Nem vagy tagja ennek a szervezetnek.';
  end if;

  return query
  with legfrissebb as (
    select distinct on (p.ai_system_id) p.*
    from public.aic_generated_policies p
    where p.organisation_id = p_organisation_id
    order by p.ai_system_id, p.version desc
  )
  select l.id, l.ai_system_id, s.name, l.version, l.status,
         jsonb_array_length(coalesce(l.document_sections,'[]'::jsonb))::integer,
         (select count(*)::integer
          from jsonb_array_elements(coalesce(l.document_sections,'[]'::jsonb)) sec
          where coalesce(sec->>'module_lifecycle_status','') <> 'approved'),
         l.submitted_at, l.reviewed_at, l.updated_at, l.review_note
  from legfrissebb l
  join public.aic_ai_systems s on s.id = l.ai_system_id
  where s.inventory_status = 'active'
  order by
    case l.status
      when 'in_review' then 1
      when 'rejected' then 2
      when 'draft' then 3
      when 'approved' then 4
      else 5
    end,
    coalesce(l.submitted_at, l.updated_at) desc;
end;
$function$;

revoke all on function public.aic_felulvizsgalati_lista(uuid) from public, anon;
grant execute on function public.aic_felulvizsgalati_lista(uuid) to authenticated;

commit;
