import "@/styles/globals.css";
import DemoBanner from "@/components/ui/DemoBanner";

export const metadata = {
  title: "EnergiaAI Kontroll",
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
