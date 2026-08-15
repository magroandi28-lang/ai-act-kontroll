const ExcelJS = require("exceljs");

const systemTypes = [
  ["CUSTOMER_CHATBOT", "Ügyfélszolgálati chatbot"],
  ["INTERNAL_ASSISTANT", "Belső vállalati MI-asszisztens"],
  ["DOCUMENT_PROCESSING_AI", "Dokumentumfeldolgozó MI"],
  ["RECRUITMENT_AI", "Toborzási és kiválasztási MI"],
  ["EMPLOYEE_MONITORING_AI", "Munkavállalói teljesítmény- vagy magatartáselemző MI"],
  ["ENERGY_FORECAST_AI", "Energiafogyasztási vagy termelési előrejelző MI"],
  ["ENERGY_ANOMALY_AI", "Energetikai anomália- és hibadetektáló MI"],
  ["CRITICAL_INFRASTRUCTURE_CONTROL_AI", "Kritikus energetikai infrastruktúrát vezérlő MI"],
  ["COMPUTER_VISION_AI", "Képfeldolgozó vagy biometrikus MI"],
  ["GENERATIVE_CONTENT_AI", "Generatív tartalomkészítő MI"],
  ["FRAUD_RISK_AI", "Csalás- vagy kockázatértékelő MI"],
  ["OTHER_AI", "Egyéb MI-rendszer"],
];

const capabilities = [
  ["GENERAL_INFORMATION", "Általános ügyféltájékoztatás", "CUSTOMER_CHATBOT", "bármely"],
  ["ENERGY_INFORMATION", "Energetikai tájékoztatás", "CUSTOMER_CHATBOT", "energy"],
  ["BILLING_INFORMATION", "Számlázási tájékoztatás", "CUSTOMER_CHATBOT", "energy"],
  ["CONSUMPTION_METERING_DATA", "Fogyasztási vagy mérési adatok használata", "CUSTOMER_CHATBOT", "energy"],
  ["PERSONAL_ACCOUNT_DATA", "Személyes ügyféladatok elérése", "CUSTOMER_CHATBOT", "bármely"],
  ["METER_READING_INTAKE", "Mérőállás fogadása", "CUSTOMER_CHATBOT", "energy"],
  ["COMPLAINT_INTAKE", "Panasz rögzítése és továbbítása", "CUSTOMER_CHATBOT", "bármely"],
  ["DEBT_DISCONNECTION_SUPPORT", "Tartozási és kikapcsolási tájékoztatás", "CUSTOMER_CHATBOT", "energy"],
  ["VULNERABLE_CUSTOMER_SUPPORT", "Védendő fogyasztói ügyek támogatása", "CUSTOMER_CHATBOT", "energy"],
  ["GENERATIVE_RESPONSES", "Generatív válaszok készítése", "bármely", "bármely"],
  ["NATURAL_PERSON_INTERACTION", "Kapcsolattartás természetes személlyel", "bármely", "bármely"],
  ["PERSONAL_DATA_PROCESSING", "Személyes adatok kezelése", "bármely", "bármely"],
  ["CONTENT_GENERATION", "Tartalom generálása vagy módosítása", "bármely", "bármely"],
  ["DOCUMENT_PROCESSING", "Dokumentumok feldolgozása", "bármely", "bármely"],
  ["DECISION_SUPPORT", "Döntéstámogatás", "bármely", "bármely"],
  ["NATURAL_PERSON_PROFILING", "Természetes személy profilozása", "bármely", "bármely"],
  ["BIOMETRIC_PROCESSING", "Biometrikus feldolgozás", "bármely", "bármely"],
  ["EMOTION_INFERENCE", "Érzelemfelismerés", "bármely", "bármely"],
  ["EMPLOYMENT_DECISION_SUPPORT", "Foglalkoztatási döntések támogatása", "bármely", "bármely"],
  ["CRITICAL_INFRASTRUCTURE_OPERATION", "Kritikus infrastruktúra működtetése", "bármely", "bármely"],
  ["ESSENTIAL_SERVICE_ACCESS", "Alapvető szolgáltatáshoz való hozzáférés értékelése", "bármely", "bármely"],
  ["FORECASTING", "Előrejelzés készítése", "bármely", "bármely"],
  ["ANOMALY_DETECTION", "Anomália vagy hiba felismerése", "bármely", "bármely"],
];

const headerStyle = {
  font: { bold: true, color: { argb: "FFFFFFFF" } },
  fill: { type: "pattern", pattern: "solid", fgColor: { argb: "FF00AFCB" } },
  alignment: { vertical: "middle", wrapText: true },
};

function styleCatalog(sheet, widths) {
  sheet.columns = widths.map((width) => ({ width }));
  sheet.getRow(1).eachCell((cell) => Object.assign(cell, headerStyle));
  sheet.views = [{ state: "frozen", ySplit: 1 }];
  sheet.autoFilter = `A1:${String.fromCharCode(64 + widths.length)}1`;
  sheet.eachRow((row) => { row.alignment = { vertical: "top", wrapText: true }; });
}

async function build() {
  const workbook = new ExcelJS.Workbook();
  workbook.creator = "EnergiaAI Kontroll";
  const systems = workbook.addWorksheet("Rendszerleltár", { views: [{ state: "frozen", ySplit: 4 }] });
  const types = workbook.addWorksheet("Rendszertípusok");
  const functions = workbook.addWorksheet("Aktív funkciók");
  const values = workbook.addWorksheet("Engedélyezett értékek");

  systems.columns = [{ width: 32 }, { width: 36 }, { width: 16 }, { width: 58 }, { width: 58 }, { width: 24 }, { width: 20 }];
  systems.mergeCells("A1:G1");
  systems.getCell("A1").value = "EnergiaAI Kontroll – általános MI-rendszerimport";
  systems.getCell("A1").font = { bold: true, size: 18, color: { argb: "FFFFFFFF" } };
  systems.getCell("A1").fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FF061B2A" } };
  systems.getRow(1).height = 34;
  systems.mergeCells("A2:G2");
  systems.getCell("A2").value = "Egy sor egy MI-rendszer. Az aktív funkciókódokat | jellel válaszd el. A fejlécet ne módosítsd; használati profil nem szükséges.";
  systems.getCell("A2").font = { color: { argb: "FF4F6570" }, italic: true };
  systems.getCell("A2").alignment = { wrapText: true };
  systems.getRow(2).height = 32;
  systems.getRow(4).values = ["Rendszer neve", "Rendszertípus kód", "Iparág kód", "Rendeltetés", "Aktív funkciókódok", "Szervezeti szerep", "Életciklus"];
  systems.getRow(4).eachCell((cell) => Object.assign(cell, headerStyle));
  systems.getRow(4).height = 38;

  const examples = [
    ["Belső tudásasszisztens", "INTERNAL_ASSISTANT", "general", "Belső szabályzatok keresése és összefoglalása a munkatársaknak.", "GENERATIVE_RESPONSES|NATURAL_PERSON_INTERACTION|CONTENT_GENERATION", "deployer", "pilot"],
    ["Számlafeldolgozó MI", "DOCUMENT_PROCESSING_AI", "general", "Beérkező számlák adatainak kinyerése és ellenőrzésre előkészítése.", "DOCUMENT_PROCESSING|PERSONAL_DATA_PROCESSING", "deployer", "production"],
    ["Fogyasztás-előrejelző", "ENERGY_FORECAST_AI", "energy", "Másnapi villamosenergia-fogyasztás előrejelzése üzemirányítási támogatásra.", "FORECASTING", "provider", "testing"],
  ];
  systems.addRows(examples);
  for (let row = 5; row <= 104; row += 1) {
    systems.getRow(row).height = 34;
    for (let column = 1; column <= 7; column += 1) {
      const cell = systems.getCell(row, column);
      cell.fill = { type: "pattern", pattern: "solid", fgColor: { argb: row % 2 ? "FFF4F8FA" : "FFFFFFFF" } };
      cell.border = { bottom: { style: "thin", color: { argb: "FFDDE7EB" } } };
      cell.alignment = { vertical: "top", wrapText: true };
    }
    systems.getCell(row, 2).dataValidation = { type: "list", allowBlank: true, formulae: ["RendszerTipusKodok"], showErrorMessage: true, error: "Válassz érvényes rendszertípuskódot." };
    systems.getCell(row, 3).dataValidation = { type: "list", allowBlank: false, formulae: ['"general,energy"'] };
    systems.getCell(row, 6).dataValidation = { type: "list", allowBlank: false, formulae: ['"deployer,provider,importer,distributor,authorised_representative"'] };
    systems.getCell(row, 7).dataValidation = { type: "list", allowBlank: false, formulae: ['"planned,development,testing,pilot,production,suspended,retired"'] };
  }
  systems.autoFilter = "A4:G104";

  types.addRow(["Rendszertípus kód", "Megnevezés"]);
  types.addRows(systemTypes);
  styleCatalog(types, [42, 64]);
  functions.addRow(["Funkciókód", "Megnevezés", "Rendszertípus", "Iparág"]);
  functions.addRows(capabilities);
  styleCatalog(functions, [42, 62, 40, 18]);
  values.addRows([
    ["Mező", "Engedélyezett értékek"],
    ["Iparág kód", "general | energy"],
    ["Szervezeti szerep", "deployer | provider | importer | distributor | authorised_representative"],
    ["Életciklus", "planned | development | testing | pilot | production | suspended | retired"],
  ]);
  styleCatalog(values, [30, 90]);
  workbook.definedNames.add("Rendszertípusok!$A$2:$A$13", "RendszerTipusKodok");
  await workbook.xlsx.writeFile("public/energiaai-rendszerimport-sablon.xlsx");
}

build().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
