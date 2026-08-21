-- EnergiaAI Kontroll - energetikai ügyfélkapcsolati chatbot profilkatalógus.
-- Az adatbázisban már alkalmazva; GitHubon a reprodukálhatóságot szolgálja.

insert into public.aic_usage_profiles(
 code,industry_code,system_type_code,name_hu,description_hu,
 intended_purpose_template,system_description_template,required_assertions,
 capability_codes,fact_patch,sort_order
) values
('ENERGY_CHAT_PUBLIC_INFO','energy','CUSTOMER_CHATBOT','Általános energetikai tájékoztatás',
 'Nyilvános energetikai és ügyintézési információkat ad, személyes ügyféladatot nem jelenít meg.',
 'Nyilvános energetikai szolgáltatási és ügyintézési információk közérthető megválaszolása.',
 'A chatbot nyilvános, ellenőrzött energetikai forrásokból ad általános tájékoztatást. Személyes ügyféladatot nem kér le, egyedi ügyben nem hoz döntést, és szükség esetén emberi ügyintézőhöz irányít.',
 '["Ügyfélkapcsolati chatbotként, energetikai környezetben működik.","Kizárólag nyilvános és általános tájékoztatást ad.","Személyes ügyféladatot nem kér le és nem jelenít meg.","Ellenőrzött vállalati vagy hivatalos tudásforrásokat használ.","Pénzügyi vagy joghatású döntést nem hoz.","Szükség esetén emberi ügyintézőhöz továbbít."]',
 array['GENERAL_INFORMATION','ENERGY_INFORMATION','GENERATIVE_RESPONSES'],
 '{"uses_controlled_knowledge_sources":true,"requires_human_handoff":true,"accesses_personal_account_data":false,"processes_personal_data":false,"makes_legally_effective_decisions":false}',20),

('ENERGY_CHAT_METER_READING','energy','CUSTOMER_CHATBOT','Mérőállás rögzítése',
 'Az ügyfél mérőállását fogadja, ellenőrzi és hiteles vállalati folyamatba továbbítja.',
 'Ügyfél által megadott mérőállás fogadása, formai ellenőrzése és továbbítása.',
 'A chatbot azonosított ügyféltől mérőállást fogad, a bevitt adatot a mentés előtt visszaigazoltatja, majd hiteles vállalati rendszerbe továbbítja. Elszámolást nem készít és vitás mérési ügyben nem dönt.',
 '["Ügyfélkapcsolati chatbotként, energetikai környezetben működik.","Az ügyfél által megadott mérőállást rögzíti vagy továbbítja.","Az ügyfelet az adat rögzítése előtt megfelelően azonosítja.","A bevitt mérőállást mentés előtt visszaigazoltatja.","Elszámolást nem készít és vitás mérési ügyben nem dönt.","Hiba vagy bizonytalanság esetén emberi ügyintézőhöz továbbít."]',
 array['GENERAL_INFORMATION','ENERGY_INFORMATION','CONSUMPTION_METERING_DATA','PERSONAL_ACCOUNT_DATA','METER_READING_INTAKE'],
 '{"requires_customer_authentication":true,"uses_controlled_knowledge_sources":true,"requires_human_handoff":true,"makes_legally_effective_decisions":false}',30),

('ENERGY_CHAT_COMPLAINT_INTAKE','energy','CUSTOMER_CHATBOT','Panasz és kérelem fogadása',
 'Panaszt vagy kérelmet rögzít, visszaigazol és ellenőrzött ügyintézési folyamatba továbbít.',
 'Energetikai ügyfélpanaszok és kérelmek fogadása, rögzítése és emberi ügyintézőhöz továbbítása.',
 'A chatbot felismeri és rögzíti az ügyfél panaszát vagy kérelmét, visszaigazolást ad, majd az ügyet ellenőrzött panaszkezelési folyamatba továbbítja. A panaszt nem bírálja el és joghatású döntést nem hoz.',
 '["Ügyfélkapcsolati chatbotként, energetikai környezetben működik.","Panaszt vagy kérelmet fogad és rögzít.","A rögzítésről az ügyfélnek visszaigazolást ad.","Az ügyet ellenőrzött emberi panaszkezelési folyamatba továbbítja.","A panaszt nem bírálja el és joghatású döntést nem hoz.","A kezelt személyes adatok körét a szükséges minimumra korlátozza."]',
 array['GENERAL_INFORMATION','ENERGY_INFORMATION','PERSONAL_ACCOUNT_DATA','COMPLAINT_INTAKE'],
 '{"requires_customer_authentication":true,"uses_controlled_knowledge_sources":true,"requires_human_handoff":true,"makes_legally_effective_decisions":false}',40),

('ENERGY_CHAT_DEBT_DISCONNECTION','energy','CUSTOMER_CHATBOT','Tartozási és kikapcsolási tájékoztatás',
 'Tartozási, kikapcsolási és visszakapcsolási ügyekben tájékoztat, de nem hoz döntést.',
 'Azonosított ügyfelek tájékoztatása tartozási, kikapcsolási és visszakapcsolási ügyekben.',
 'A chatbot hiteles vállalati adatból tájékoztat a tartozási, kikapcsolási vagy visszakapcsolási ügy állapotáról és a következő lépésekről. Fizetési kötelezettséget nem állapít meg, kikapcsolásról nem dönt, és szükség esetén jogosult emberi ügyintézőhöz továbbít.',
 '["Ügyfélkapcsolati chatbotként, energetikai környezetben működik.","Tartozási, kikapcsolási vagy visszakapcsolási ügyben tájékoztat.","Egyedi ügyadatot csak megfelelő ügyfél-azonosítás után jelenít meg.","Hiteles vállalati adatforrást használ.","Tartozást nem állapít meg és kikapcsolásról nem dönt.","Az egyedi vagy vitás ügyet emberi ügyintézőhöz továbbítja."]',
 array['GENERAL_INFORMATION','ENERGY_INFORMATION','PERSONAL_ACCOUNT_DATA','DEBT_DISCONNECTION_SUPPORT'],
 '{"requires_customer_authentication":true,"uses_controlled_knowledge_sources":true,"requires_human_handoff":true,"makes_legally_effective_decisions":false,"can_disconnect_service":false}',50),

('ENERGY_CHAT_VULNERABLE_SUPPORT','energy','CUSTOMER_CHATBOT','Védendő fogyasztói ügyek támogatása',
 'Védendő fogyasztói ügyet felismer, általános tájékoztatást ad és biztonságos emberi folyamatba továbbít.',
 'Védendő fogyasztói státusszal és kapcsolódó ügyintézéssel összefüggő tájékoztatás és továbbítás.',
 'A chatbot a védendő fogyasztói ügyet felismeri, a hivatalos eljárásról általános tájékoztatást ad, és az ügyet megfelelően azonosított emberi ügyintézőhöz továbbítja. Jogosultságot nem állapít meg és szükségtelen különleges adatot nem kér.',
 '["Ügyfélkapcsolati chatbotként, energetikai környezetben működik.","Védendő fogyasztói státusszal vagy kedvezménnyel kapcsolatos ügyet fogad.","Kizárólag a hivatalos eljárásról ad általános tájékoztatást.","Jogosultságot vagy kedvezményt nem állapít meg.","Szükségtelen különleges adatot nem kér.","Az ügyet megfelelő emberi ügyintézőhöz továbbítja."]',
 array['GENERAL_INFORMATION','ENERGY_INFORMATION','PERSONAL_ACCOUNT_DATA','VULNERABLE_CUSTOMER_SUPPORT'],
 '{"requires_customer_authentication":true,"uses_controlled_knowledge_sources":true,"requires_human_handoff":true,"makes_legally_effective_decisions":false}',60),

('ENERGY_CHAT_FULL_SERVICE','energy','CUSTOMER_CHATBOT','Komplex energetikai ügyfélszolgálat',
 'Számla-, fogyasztási, mérőállás-, panasz-, tartozási és védendő fogyasztói ügyeket egyaránt támogat, önálló döntés nélkül.',
 'Energetikai ügyfelek több ügytípusra kiterjedő, azonosított és ellenőrzött ügyfélszolgálati támogatása.',
 'A chatbot több energetikai ügytípust támogat: számla- és fogyasztási adatot jelenít meg, mérőállást fogad, panaszt vagy kérelmet rögzít, továbbá tartozási és védendő fogyasztói ügyben tájékoztat. Számlát nem módosít, panaszt vagy jogosultságot nem bírál el, kikapcsolásról nem dönt, és szükség esetén emberi ügyintézőhöz továbbít.',
 '["Ügyfélkapcsolati chatbotként, energetikai környezetben működik.","A felsorolt ügytípusok közül többet ténylegesen és dokumentáltan támogat.","Személyes ügyféladatot csak megfelelő azonosítás után használ.","Hiteles vállalati és hivatalos forrásokat használ.","Számlát nem módosít, panaszt vagy jogosultságot nem bírál el, kikapcsolásról nem dönt.","Minden joghatású, vitás vagy bizonytalan ügyet emberi ügyintézőhöz továbbít."]',
 array['GENERAL_INFORMATION','ENERGY_INFORMATION','BILLING_INFORMATION','CONSUMPTION_METERING_DATA','PERSONAL_ACCOUNT_DATA','METER_READING_INTAKE','COMPLAINT_INTAKE','DEBT_DISCONNECTION_SUPPORT','VULNERABLE_CUSTOMER_SUPPORT','GENERATIVE_RESPONSES'],
 '{"requires_customer_authentication":true,"uses_controlled_knowledge_sources":true,"requires_human_handoff":true,"makes_legally_effective_decisions":false,"can_modify_invoice":false,"can_disconnect_service":false}',70)
on conflict(code) do update set
 industry_code=excluded.industry_code,system_type_code=excluded.system_type_code,
 name_hu=excluded.name_hu,description_hu=excluded.description_hu,
 intended_purpose_template=excluded.intended_purpose_template,
 system_description_template=excluded.system_description_template,
 required_assertions=excluded.required_assertions,capability_codes=excluded.capability_codes,
 fact_patch=excluded.fact_patch,active=true,sort_order=excluded.sort_order,updated_at=now();
