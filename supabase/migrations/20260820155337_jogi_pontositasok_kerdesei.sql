begin;

update public.aic_trigger_catalogue
set question_hu = case trigger_key
  when 'BEHAVIOUR_MATERIALLY_DISTORTED'
    then 'A működés érdemben torzíthatja az érintett személy viselkedését vagy döntési képességét?'
  when 'SIGNIFICANT_HARM_LIKELY'
    then 'A működés jelentős fizikai, pszichológiai, pénzügyi vagy más kárt okozhat, illetve ennek érdemi kockázata fennáll?'
  when 'OBJECTIVE_HUMAN_ASSESSMENT'
    then 'A bűnelkövetési kockázat értékelése objektív, ellenőrizhető tényeken alapuló emberi értékelést támogat?'
  when 'ART5_MEDICAL_SAFETY_EXCEPTION'
    then 'Az érzelemfelismerés kizárólag orvosi vagy biztonsági okból szükséges?'
  when 'ART5_LAW_ENFORCEMENT_EXCEPTION'
    then 'Fennáll az MI-rendelet 5. cikke szerinti kifejezett bűnüldözési kivétel?'
  when 'THIRD_PARTY_CONFORMITY_REQUIRED'
    then 'A szabályozott termékhez harmadik fél által végzett megfelelőségértékelés szükséges?'
  when 'ART6_3_LIMITED_TASK'
    then 'A rendszer kizárólag szűk eljárási, előkészítő vagy segítő feladatot végez, amely nem befolyásolja érdemben a döntés eredményét?'
  when 'AI_INTERACTION_OBVIOUS'
    then 'Az érintett számára a körülményekből egyértelmű, hogy MI-rendszerrel kommunikál?'
  when 'ART50_ASSISTIVE_EXCEPTION'
    then 'A rendszer csak szerkesztést segít, és nem változtatja meg érdemben a bemeneti adatot vagy annak jelentését?'
  when 'ART50_ARTISTIC_EXCEPTION'
    then 'A deepfake művészeti, kreatív, szatirikus vagy hasonló mű része?'
  when 'ART50_LAW_ENFORCEMENT_EXCEPTION'
    then 'A használatot jogszabály engedélyezi bűncselekmény felderítésére, megelőzésére, nyomozására vagy üldözésére?'
  when 'HUMAN_EDITORIAL_RESPONSIBILITY'
    then 'A közérdekű szöveget ember felülvizsgálja, és természetes vagy jogi személy szerkesztői felelősséget vállal érte?'
  when 'CONSENT_IS_LEGAL_BASIS'
    then 'A személyes adatok kezelésének jogalapja az érintett hozzájárulása?'
  when 'LARGE_SCALE_MONITORING'
    then 'A rendszer érintetteket rendszeresen, módszeresen és nagy számban figyel meg?'
  when 'JOINT_CONTROLLER'
    then 'A szervezet más adatkezelővel közösen határozza meg az adatkezelés célját és eszközeit?'
  when 'RIGHTS_RESERVATION_RESPECTED'
    then 'A modell tanításakor tiszteletben tartják a géppel olvasható szerzői jogi jogfenntartásokat?'
  else question_hu
end,
updated_at = now()
where intake_mode = 'legal_review';

do $assertions$
begin
  if exists (
    select 1
    from public.aic_trigger_catalogue
    where intake_mode = 'legal_review'
      and nullif(btrim(question_hu), '') is null
  ) then
    raise exception 'Maradt kérdésszöveg nélküli jogi pontosítás.';
  end if;
end;
$assertions$;

commit;
