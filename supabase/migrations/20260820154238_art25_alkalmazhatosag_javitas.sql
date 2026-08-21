begin;

update public.aic_trigger_catalogue
set ask_only_if = '{
      "actor_roles":["deployer","importer","distributor"],
      "all":[{"fact":"SYSTEM_IS_HIGH_RISK","operator":"is_true"}]
    }'::jsonb,
    updated_at = now()
where trigger_key = 'BECOMES_PROVIDER';

update public.aic_policy_modules
set applicability = '{
      "actor_roles":["deployer","importer","distributor"],
      "industry_codes":[],
      "all":[
        {"fact":"SYSTEM_IS_HIGH_RISK","operator":"is_true"},
        {"fact":"BECOMES_PROVIDER","operator":"is_true"}
      ]
    }'::jsonb,
    updated_at = now()
where module_code = 'GENERIC_RULE_ART25_PROVIDER_ROLE_TRANSFER';

do $assertions$
declare
  v_app jsonb;
  v_question_condition jsonb;
begin
  select applicability into v_app
  from public.aic_policy_modules
  where module_code = 'GENERIC_RULE_ART25_PROVIDER_ROLE_TRANSFER';

  if public.aic_applicability_state(
       v_app,
       '{"organisation_roles":["importer"],"SYSTEM_IS_HIGH_RISK":false}'::jsonb
     ) <> 'not_applicable' then
    raise exception 'Az Art. 25 modul nem magas kockázatú rendszernél alkalmazandóvá válhat.';
  end if;

  if public.aic_applicability_state(
       v_app,
       '{"organisation_roles":["importer"],"SYSTEM_IS_HIGH_RISK":true}'::jsonb
     ) <> 'needs_data' then
    raise exception 'A magas kockázatú importőri profilnál nem kér további adatot.';
  end if;

  if public.aic_applicability_state(
       v_app,
       '{"organisation_roles":["importer"],"SYSTEM_IS_HIGH_RISK":true,"BECOMES_PROVIDER":true}'::jsonb
     ) <> 'applicable' then
    raise exception 'Az Art. 25 modul nem kapcsolódik a teljesülő tényálláshoz.';
  end if;

  if public.aic_applicability_state(
       v_app,
       '{"organisation_roles":["provider"],"SYSTEM_IS_HIGH_RISK":true}'::jsonb
     ) <> 'not_applicable' then
    raise exception 'Az Art. 25 szerepátszállási modul eleve szolgáltatónál tévesen aktiválódik.';
  end if;

  select ask_only_if into v_question_condition
  from public.aic_trigger_catalogue
  where trigger_key = 'BECOMES_PROVIDER';

  if public.aic_applicability_state(
       v_question_condition,
       '{"organisation_roles":["distributor"],"SYSTEM_IS_HIGH_RISK":true}'::jsonb
     ) <> 'applicable' then
    raise exception 'A szükséges Art. 25 pontosítás nem jelenik meg.';
  end if;
end;
$assertions$;

commit;
