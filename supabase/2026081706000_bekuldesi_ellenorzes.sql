-- EnergiaAI Kontroll – az ellenőrzés a beküldéskor fut le.
--
-- MIÉRT
-- Az eltéréselemzés eddig a jogász nézetében futott, fejezetenként, minden
-- megnyitáskor újra. Ez két bajjal járt: a jogász munkáját szaporította ahelyett
-- hogy könnyítette volna, és minden megnyitáskor mást mutathatott, mert közben
-- a jogszabályszöveg vagy a katalógus változhatott.
--
-- MOSTANTÓL
-- A beküldés pillanatában lefut az ellenőrzés az EGÉSZ dokumentumra, és az
-- eredmény a dokumentumhoz tapad. A jogász pontosan azt látja, ami a beküldéskor
-- fennállt, és előre tudja, hány fejezetnél kell odafigyelnie.
--
-- MIT NEM CSINÁL
-- Nem tiltja meg a beküldést. A jelzések ma kivétel nélkül cikkszintű becslések
-- – a szabály a teljes cikkre hivatkozik, ezért a gép a cikk minden bekezdéséhez
-- méri a fejezetet. Amíg ez így van, a jelzés figyelemfelhívás, nem hibaállítás.
-- Beküldést blokkolni csak akkor lesz szabad, ha a hivatkozások bekezdésszintre
-- pontosodtak.
--
-- Futtatás: Supabase Dashboard -> SQL Editor -> beilleszt -> Run.
-- Helye ezután: supabase/migrations/

begin;

-- ---------------------------------------------------------------------------
-- 1. Az ellenőrzés eredménye a dokumentumon.
-- ---------------------------------------------------------------------------
alter table public.aic_generated_policies
  add column if not exists review_findings jsonb,
  add column if not exists review_findings_at timestamptz;

comment on column public.aic_generated_policies.review_findings is
  'A beküldéskor lefutott automatikus ellenőrzés eredménye, fejezetenként.';

-- ---------------------------------------------------------------------------
-- 2. Az egész dokumentumra lefutó ellenőrzés.
-- ---------------------------------------------------------------------------
create or replace function public.aic_dokumentum_ellenorzes(p_policy_id uuid)
returns jsonb
language plpgsql
stable
security definer
set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
  v_sections jsonb;
  v_fejezetek jsonb;
begin
  select * into v_policy from public.aic_generated_policies where id = p_policy_id;
  if not found then raise exception 'A szabályzat nem található.'; end if;

  v_sections := coalesce(v_policy.edited_sections, v_policy.document_sections, '[]'::jsonb);

  select coalesce(jsonb_agg(f order by (f->>'szam')::integer), '[]'::jsonb)
  into v_fejezetek
  from (
    select jsonb_build_object(
      'szam', sec->>'number',
      'cim', sec->>'title',
      'rule_code', sec->>'rule_code',
      'jelzesek', coalesce(el->'jelzesek', '[]'::jsonb),
      'jelzes_szam', coalesce((el->>'jelzes_szam')::integer, 0),
      'elemezheto', coalesce((el->>'elemezheto')::boolean, false),
      'pontossag', el->>'pontossag'
    ) as f
    from jsonb_array_elements(v_sections) sec
    left join public.aic_compliance_rules r on r.rule_code = sec->>'rule_code'
    left join lateral (
      select pm.id from public.aic_policy_modules pm
      where pm.rule_id = r.id order by pm.display_order limit 1
    ) m on true
    left join lateral (
      select case when m.id is null then null
                  else public.aic_modul_elteres_elemzes(m.id) end as el
    ) e on true
  ) t;

  return jsonb_build_object(
    'lefutott', now(),
    'fejezet_szam', jsonb_array_length(v_fejezetek),
    'elemezheto_fejezet', (select count(*) from jsonb_array_elements(v_fejezetek) x
                           where (x->>'elemezheto')::boolean),
    'figyelmet_igenyel', (select count(*) from jsonb_array_elements(v_fejezetek) x
                          where (x->>'jelzes_szam')::integer > 0),
    'jelzes_ossz', (select coalesce(sum((x->>'jelzes_szam')::integer),0)
                    from jsonb_array_elements(v_fejezetek) x),
    'fejezetek', v_fejezetek
  );
end;
$function$;

revoke all on function public.aic_dokumentum_ellenorzes(uuid) from public, anon;
grant execute on function public.aic_dokumentum_ellenorzes(uuid) to authenticated;

-- ---------------------------------------------------------------------------
-- 3. A beküldés lefuttatja és eltárolja.
-- ---------------------------------------------------------------------------
create or replace function public.aic_submit_policy_for_review(p_policy_id uuid, p_note text default null)
returns jsonb
language plpgsql
security definer
set search_path to 'public','pg_temp'
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
  v_ellenorzes jsonb;
begin
  v_policy := public.aic_assert_policy_permission(
    p_policy_id, array['owner','admin','compliance','editor']
  );

  if v_policy.status not in ('draft','rejected') then
    raise exception 'Csak piszkozat vagy javításra visszaküldött szabályzat küldhető felülvizsgálatra. Jelenlegi állapot: %.', v_policy.status;
  end if;

  v_ellenorzes := public.aic_dokumentum_ellenorzes(p_policy_id);

  update public.aic_generated_policies
     set status = 'in_review',
         submitted_by = auth.uid(),
         submitted_at = now(),
         reviewed_by = null,
         reviewed_at = null,
         review_note = null,
         review_findings = v_ellenorzes,
         review_findings_at = now(),
         updated_by = auth.uid()
   where id = p_policy_id;

  insert into public.aic_policy_approvals
    (policy_id, organisation_id, action, from_status, to_status, note, content_sha256, acted_by)
  values
    (p_policy_id, v_policy.organisation_id, 'submitted', v_policy.status, 'in_review',
     nullif(btrim(p_note), ''), v_policy.content_sha256, auth.uid());

  return jsonb_build_object(
    'policy_id', p_policy_id,
    'status', 'in_review',
    'fejezet_szam', v_ellenorzes->'fejezet_szam',
    'figyelmet_igenyel', v_ellenorzes->'figyelmet_igenyel'
  );
end;
$function$;

revoke all on function public.aic_submit_policy_for_review(uuid, text) from public, anon;
grant execute on function public.aic_submit_policy_for_review(uuid, text) to authenticated;

-- ---------------------------------------------------------------------------
-- 4. A jogász nézete a tárolt ellenőrzést mutatja.
-- ---------------------------------------------------------------------------
create or replace function public.aic_felulvizsgalati_dokumentum(p_policy_id uuid)
returns jsonb language plpgsql stable security definer set search_path = public, pg_temp
as $function$
declare
  v_policy public.aic_generated_policies%rowtype;
  v_szerep text; v_rendszer text; v_sections jsonb; v_fejezetek jsonb; v_ell jsonb;
begin
  if auth.uid() is null then raise exception 'A művelethez bejelentkezés szükséges.'; end if;
  select * into v_policy from public.aic_generated_policies where id = p_policy_id;
  if not found then raise exception 'A szabályzat nem található.'; end if;
  v_szerep := public.aic_szervezeti_szerep(v_policy.organisation_id);
  if v_szerep is null then raise exception 'Nincs jogosultságod ehhez a dokumentumhoz.'; end if;
  select name into v_rendszer from public.aic_ai_systems where id = v_policy.ai_system_id;
  v_sections := coalesce(v_policy.edited_sections, v_policy.document_sections, '[]'::jsonb);

  -- A beküldéskor rögzített ellenőrzést használjuk: a jogász pontosan azt
  -- látja, ami a beküldés pillanatában fennállt. Piszkozatnál most számoljuk.
  v_ell := coalesce(v_policy.review_findings, public.aic_dokumentum_ellenorzes(p_policy_id));

  select coalesce(jsonb_agg(f order by (f->>'szam')::integer), '[]'::jsonb) into v_fejezetek
  from (
    select jsonb_build_object(
      'szam', sec->>'number', 'cim', sec->>'title', 'tartalom', sec->>'content',
      'osszefoglalo', sec->>'summary', 'rule_code', sec->>'rule_code',
      'szerkesztett', coalesce(sec->>'origin','generated') <> 'generated',
      'szabaly_jovahagyva', coalesce(r.lifecycle_status = 'approved', false),
      'jogszabaly', coalesce((
        select jsonb_agg(jsonb_build_object(
                 'cimke', src.title
                          || case when p.article_number is null then '' else ' ' || p.article_number || '. cikk' end
                          || case when p.paragraph_number is null then '' else ' (' || p.paragraph_number || ')' end,
                 'szoveg', coalesce(lt.content, p.provision_text_verbatim, p.provision_text),
                 'magyar', lt.content is not null or p.provision_text_verbatim is not null,
                 'link', coalesce(lt.deep_link, p.deep_link, src.official_url)
               ) order by p.article_number, p.paragraph_number)
        from public.aic_rule_legal_bases lb
        join public.aic_legal_provisions p on p.id = lb.provision_id
        join public.aic_legal_sources src on src.id = p.source_id
        left join lateral (
          select t.content, t.deep_link from public.aic_legal_text t
          where t.source_id = p.source_id and t.article_number = any (public.aic_cikkszamok(p.article_number))
            and t.paragraph_number is not distinct from p.paragraph_number limit 1
        ) lt on true
        where lb.rule_id = r.id), '[]'::jsonb),
      'elemzes', (select jsonb_build_object(
                    'jelzesek', coalesce(x->'jelzesek','[]'::jsonb),
                    'jelzes_szam', coalesce(x->'jelzes_szam','0'::jsonb),
                    'elemezheto', coalesce(x->'elemezheto','false'::jsonb))
                  from jsonb_array_elements(coalesce(v_ell->'fejezetek','[]'::jsonb)) x
                  where x->>'szam' = sec->>'number' limit 1)
    ) as f
    from jsonb_array_elements(v_sections) sec
    left join public.aic_compliance_rules r on r.rule_code = sec->>'rule_code'
  ) t;

  return jsonb_build_object(
    'policy', jsonb_build_object('id', v_policy.id, 'cim', v_policy.title, 'rendszer', v_rendszer,
      'ai_system_id', v_policy.ai_system_id, 'verzio', v_policy.version, 'allapot', v_policy.status,
      'osszefoglalo', v_policy.executive_summary, 'bekuldve', v_policy.submitted_at),
    'szerepem', v_szerep,
    'dontheteek', v_szerep in ('compliance','owner'),
    'ellenorzes', jsonb_build_object(
      'lefutott', coalesce(v_ell->'lefutott','null'::jsonb),
      'figyelmet_igenyel', coalesce(v_ell->'figyelmet_igenyel','0'::jsonb),
      'jelzes_ossz', coalesce(v_ell->'jelzes_ossz','0'::jsonb),
      'elemezheto_fejezet', coalesce(v_ell->'elemezheto_fejezet','0'::jsonb)),
    'fejezetek', v_fejezetek,
    'osszesen', jsonb_array_length(v_fejezetek),
    'jovahagyott', (select count(*) from jsonb_array_elements(v_fejezetek) x where (x->>'szabaly_jovahagyva')::boolean));
end; $function$;

revoke all on function public.aic_felulvizsgalati_dokumentum(uuid) from public, anon;
grant execute on function public.aic_felulvizsgalati_dokumentum(uuid) to authenticated;

-- A már beküldött dokumentumok is kapjanak ellenőrzést.
update public.aic_generated_policies p
set review_findings = public.aic_dokumentum_ellenorzes(p.id),
    review_findings_at = now()
where p.status = 'in_review' and p.review_findings is null;

commit;
