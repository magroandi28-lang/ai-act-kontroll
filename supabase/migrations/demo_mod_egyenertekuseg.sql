-- ============================================================================
--  AI Act Kontroll – demó mód egyenértékűvé tétele
--
--  Probléma: a demó belépő új, üres "Demó szervezet"-et kapott, ezért nem
--  látta a meglévő MI-rendszereket és szabályzatokat.
--
--  Megoldás: a demó látogató a MEGLÉVŐ szervezet tagja lesz — abba, amelyben
--  a legtöbb aktív MI-rendszer van. Semmilyen tartalmat nem hoz létre és nem
--  módosít, csak tagságot ad.
--
--  Futtatás: Supabase → SQL Editor → Run
-- ============================================================================

create or replace function public.aic_demo_csatlakozas()
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_org  uuid;
begin
  if v_user is null then
    raise exception 'A demóhoz bejelentkezés szükséges.';
  end if;

  -- Ha már tagja valamelyik szervezetnek, nincs mit tenni.
  select organisation_id
    into v_org
  from public.aic_organisation_members
  where user_id = v_user
  limit 1;

  if v_org is not null then
    return v_org;
  end if;

  -- A demó célpontja az a szervezet, amelyben a legtöbb aktív MI-rendszer van.
  -- Egyenlőség esetén a legrégebben létrehozott.
  select o.id
    into v_org
  from public.aic_organisations o
  left join public.aic_ai_systems s
         on s.organisation_id = o.id
        and s.inventory_status = 'active'
  group by o.id, o.created_at
  order by count(s.id) desc, o.created_at asc
  limit 1;

  if v_org is null then
    raise exception 'Nincs olyan szervezet, amit a demó megmutathatna.';
  end if;

  insert into public.aic_organisation_members (organisation_id, user_id, member_role)
  values (v_org, v_user, 'owner')
  on conflict do nothing;

  return v_org;
end;
$$;

comment on function public.aic_demo_csatlakozas() is
  'A demó látogatót a meglévő, tartalommal rendelkező szervezethez csatolja, hogy ugyanazt lássa, mint egy éles felhasználó.';

grant execute on function public.aic_demo_csatlakozas() to authenticated;
