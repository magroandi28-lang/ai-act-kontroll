-- EnergiaAI Kontroll – a szabályok feltételei a kapcsolók valódi nevére állnak.
--
-- MÁR LEFUTOTT az adatbázison. Ez a fájl a migrációs napló teljességéért van.
--
-- MIÉRT
-- 226 feltétel-hivatkozásból 216 még régi ténykulcsot használt, amit az
-- aic_trigger_catalogue.legacy_fact_keys oldott fel. Emiatt fordulhatott elő,
-- hogy ugyanaz a kapcsoló kétszer jelent meg a jogtárban: két különböző régi
-- kulcs, egy kapcsoló. A ténylap-feloldó mindkét irányban kitölti a kulcsokat,
-- ezért az illesztés nem változik. A legacy_fact_keys megmarad.

begin;

create or replace function public.aic_kapcsolo_kanonikus(p_kulcs text)
returns text language sql stable
set search_path = public, pg_temp
as $$
  select coalesce((select tc.trigger_key from public.aic_trigger_catalogue tc
                    where tc.trigger_key = p_kulcs or p_kulcs = any(tc.legacy_fact_keys)
                    limit 1), p_kulcs);
$$;

comment on function public.aic_kapcsolo_kanonikus(text) is
  'Egy feltételkulcs kanonikus kapcsolóneve. Régi ténykulcsot is felold.';

create or replace function public.aic_applicability_kanonikus(p jsonb)
returns jsonb language plpgsql stable
set search_path = public, pg_temp
as $function$
declare v jsonb := p; v_rf jsonb; v_arr jsonb; mezo text;
begin
  if p is null then return p; end if;

  if p ? 'required_facts' then
    select coalesce(jsonb_object_agg(kk, ertek), '{}'::jsonb) into v_rf
    from (select public.aic_kapcsolo_kanonikus(k) as kk, max(val::text)::jsonb as ertek
            from jsonb_each(p->'required_facts') e(k, val) group by 1) q;
    v := jsonb_set(v, '{required_facts}', v_rf);
  end if;

  foreach mezo in array array['all','any','none'] loop
    if p ? mezo then
      select coalesce(jsonb_agg(c order by c->>'fact'), '[]'::jsonb) into v_arr
      from (select distinct jsonb_set(c, '{fact}',
                     to_jsonb(public.aic_kapcsolo_kanonikus(c->>'fact'))) as c
              from jsonb_array_elements(p->mezo) c
             where c ? 'fact') q;
      v := jsonb_set(v, array[mezo], v_arr);
    end if;
  end loop;

  return v;
end;
$function$;

comment on function public.aic_applicability_kanonikus(jsonb) is
  'Egy modul feltételblokkját kanonikus kapcsolónevekre írja át, duplikáció nélkül.';

update aic_policy_modules
set applicability = public.aic_applicability_kanonikus(applicability),
    updated_at = now()
where applicability is not null
  and applicability is distinct from public.aic_applicability_kanonikus(applicability);

commit;
