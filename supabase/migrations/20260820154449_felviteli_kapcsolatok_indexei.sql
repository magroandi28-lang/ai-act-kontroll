begin;

create index if not exists aic_ai_system_policy_modules_module_idx
  on public.aic_ai_system_policy_modules(module_id);

create index if not exists aic_ai_system_policy_modules_linked_by_idx
  on public.aic_ai_system_policy_modules(linked_by)
  where linked_by is not null;

create index if not exists aic_trigger_catalogue_parent_idx
  on public.aic_trigger_catalogue(parent_trigger_key)
  where parent_trigger_key is not null;

commit;
