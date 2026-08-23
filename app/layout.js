import "./globals.css";
import "./arculat.css";   // <-- EZ AZ ÚJ SOR
import "./szabalyzat-arculat.css";
import "./szabalyzat-nyomtatas.css";
import DemoBanner from "./DemoBanner";

export const metadata = {
  title: "AI Act Kontroll",
  description: "Vállalati MI-megfelelőség egyszerűen.",
};

export default function RootLayout({ children }) {
  return (
    <html lang="hu">
      <body>
        <DemoBanner />
        {children}
      </body>
    </html>
  );
}
