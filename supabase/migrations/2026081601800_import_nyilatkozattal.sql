-- EnergiaAI Kontroll – a tömeges import átadja a nyilatkozatokat.
--
-- A felviteli űrlap már négy nyilatkozatot gyűjt. Az importsablon is megkapta
-- ugyanezt a négy oszlopot, de az aic_import_ai_systems nem adta tovább őket,
-- ezért az importált rendszerek az alapértelmezéseket kapták volna.
--
-- Ezzel a felvitel és a táblázat ugyanazt az adatot gyűjti.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Előfeltétel: 20260816_nyilatkozat_a_felvitelben.sql

begin;

create or replace function public.aic_import_ai_systems(
  p_organisation_id uuid, p_rows jsonb, p_data_confirmed boolean
) returns jsonb
language plpgsql
security invoker
set search_path = public, pg_temp
as $function$
declare
  v_row jsonb;
  v_type_id uuid;
  v_codes text[];
  v_id uuid;
  v_ids jsonb := '[]'::jsonb;
  v_count integer := 0;
begin
  if auth.uid() is null then raise exception 'Az importáláshoz bejelentkezés szükséges.'; end if;
  if p_data_confirmed is distinct from true then
    raise exception 'Az importadatokat meg kell erősíteni.';
  end if;
  if jsonb_typeof(p_rows) <> 'array' or jsonb_array_length(p_rows) = 0 then
    raise exception 'Az importálandó adatsorok hiányoznak.';
  end if;
  if jsonb_array_length(p_rows) > 100 then
    raise exception 'Egyszerre legfeljebb 100 rendszer importálható.';
  end if;

  for v_row in select value from jsonb_array_elements(p_rows) loop
    select id into v_type_id from public.aic_system_type_templates
    where type_code = v_row->>'system_type_code' and active;
    if not found then
      raise exception 'Ismeretlen rendszertípus: %.', v_row->>'system_type_code';
    end if;

    select coalesce(array_agg(value order by value), '{}'::text[]) into v_codes
    from jsonb_array_elements_text(coalesce(v_row->'capability_codes', '[]'::jsonb));

    v_id := public.aic_create_ai_system(
      p_organisation_id,
      v_row->>'name',
      v_type_id,
      coalesce(v_row->>'industry_code', 'general'),
      v_row->>'intended_purpose',
      v_row->>'description',
      v_row->>'provider_name',
      coalesce(v_row->>'organisation_role', 'deployer'),
      v_row->>'deployment_context',
      coalesce(v_row->>'lifecycle_stage', 'planned'),
      v_codes,
      -- A táblázat nyilatkozatoszlopai. Hiányzó érték esetén a szokásos eset.
      coalesce((v_row->>'eu_hasznalat')::boolean, true),
      coalesce((v_row->>'mi_egyertelmu')::boolean, true),
      coalesce((v_row->>'nincs_tiltott_gyakorlat')::boolean, true),
      coalesce((v_row->>'szabalyozott_termek')::boolean, false)
    );

    v_ids := v_ids || jsonb_build_array(v_id);
    v_count := v_count + 1;
  end loop;

  return jsonb_build_object('imported_count', v_count, 'system_ids', v_ids);
end;
$function$;

revoke all on function public.aic_import_ai_systems(uuid, jsonb, boolean) from public, anon;
grant execute on function public.aic_import_ai_systems(uuid, jsonb, boolean) to authenticated;

commit;
