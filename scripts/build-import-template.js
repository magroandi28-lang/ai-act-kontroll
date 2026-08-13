const ExcelJS = require("exceljs");

const profiles = [
  ["Nyilvános tájékoztatás", "ENERGY_CHAT_PUBLIC_INFO", "Általános, személyes adat nélküli energetikai tájékoztatás."],
  ["Számla- és fogyasztási ügyintézés", "ENERGY_CHAT_BILLING_CONSUMPTION", "Számlázási, fogyasztási és mérési adatok kezelése."],
  ["Mérőállás-bejelentés", "ENERGY_CHAT_METER_READING", "Mérőállás rögzítése és kapcsolódó ügyintézés."],
  ["Panaszfelvétel", "ENERGY_CHAT_COMPLAINT_INTAKE", "Ügyfélpanaszok felvétele és továbbítása."],
  ["Tartozás és kikapcsolás", "ENERGY_CHAT_DEBT_DISCONNECTION", "Tartozási, fizetési és kikapcsolási ügyek támogatása."],
  ["Védendő fogyasztók támogatása", "ENERGY_CHAT_VULNERABLE_SUPPORT", "Védendő vagy kiszolgáltatott fogyasztók célzott támogatása."],
  ["Teljes körű energetikai ügyfélszolgálat", "ENERGY_CHAT_FULL_SERVICE", "Az összes felsorolt ügyfélszolgálati funkció egy rendszerben."],
];

async function build() {
  const workbook = new ExcelJS.Workbook();
  workbook.creator = "EnergiaAI Kontroll";
  const systems = workbook.addWorksheet("Rendszerek", { views: [{ state: "frozen", ySplit: 4 }] });
  const catalog = workbook.addWorksheet("Profilok");

  systems.columns = [{ width: 34 }, { width: 48 }];
  systems.mergeCells("A1:B1");
  systems.getCell("A1").value = "EnergiaAI Kontroll – rendszerimport";
  systems.getCell("A1").font = { bold: true, size: 18, color: { argb: "FFFFFFFF" } };
  systems.getCell("A1").fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FF061B2A" } };
  systems.getCell("A1").alignment = { vertical: "middle" };
  systems.getRow(1).height = 34;
  systems.mergeCells("A2:B2");
  systems.getCell("A2").value = "Adj nevet a rendszernek, majd válassz használati profilt a legördülő listából. A fejlécet ne módosítsd.";
  systems.getCell("A2").font = { color: { argb: "FF4F6570" }, italic: true };
  systems.getCell("A2").alignment = { wrapText: true };
  systems.getRow(2).height = 32;
  systems.getRow(4).values = ["Rendszer neve", "Használati profil"];
  systems.getRow(4).eachCell((cell) => {
    cell.font = { bold: true, color: { argb: "FFFFFFFF" } };
    cell.fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FF00AFCB" } };
    cell.alignment = { vertical: "middle" };
  });
  systems.getRow(4).height = 26;

  for (let row = 5; row <= 24; row += 1) {
    systems.getRow(row).height = 25;
    for (let column = 1; column <= 2; column += 1) {
      const cell = systems.getCell(row, column);
      cell.fill = { type: "pattern", pattern: "solid", fgColor: { argb: row % 2 ? "FFF4F8FA" : "FFFFFFFF" } };
      cell.border = { bottom: { style: "thin", color: { argb: "FFDDE7EB" } } };
    }
    systems.getCell(row, 2).dataValidation = {
      type: "list",
      allowBlank: true,
      formulae: ["HasznalatiProfilok"],
      showErrorMessage: true,
      errorTitle: "Érvénytelen profil",
      error: "Válassz a legördülő listából.",
    };
  }
  systems.autoFilter = "A4:B24";

  catalog.columns = [{ width: 42 }, { width: 42 }, { width: 70 }];
  catalog.addRow(["Használati profil", "Profilkód", "Leírás"]);
  catalog.addRows(profiles);
  catalog.getRow(1).eachCell((cell) => {
    cell.font = { bold: true, color: { argb: "FFFFFFFF" } };
    cell.fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FF061B2A" } };
  });
  catalog.eachRow((row, index) => {
    row.alignment = { vertical: "top", wrapText: true };
    if (index > 1) row.height = 34;
  });
  workbook.definedNames.add("Profilok!$A$2:$A$8", "HasznalatiProfilok");

  await workbook.xlsx.writeFile("public/energiaai-rendszerimport-sablon.xlsx");
}

build().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
