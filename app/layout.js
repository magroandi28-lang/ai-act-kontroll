import "./globals.css";
import "./arculat.css";   // <-- EZ AZ ÚJ SOR
import "./szabalyzat-arculat.css";
import "./szabalyzat-nyomtatas.css";
import DemoBanner from "./DemoBanner";

export const metadata = {
  title: "AI Act Kontroll — vállalati MI-megfelelőség",
  description:
    "MI-rendszerek nyilvántartása, kockázati besorolás determinisztikus szabálymotorral, jogtár pontos jogszabályi hivatkozásokkal és verziózott megfelelőségi szabályzat.",
  metadataBase: new URL("https://energia-ai-kontroll.vercel.app"),
  openGraph: {
    type: "website",
    locale: "hu_HU",
    url: "https://energia-ai-kontroll.vercel.app/",
    siteName: "AI Act Kontroll",
    title: "AI Act Kontroll — vállalati MI-megfelelőség",
    description:
      "Nyilvántartás · besorolás · jogtár · verziózott szabályzat. A besorolást determinisztikus szabálymotor végzi.",
    images: [{ url: "/og-aiact.png", width: 1200, height: 630, alt: "AI Act Kontroll" }],
  },
  twitter: {
    card: "summary_large_image",
    title: "AI Act Kontroll — vállalati MI-megfelelőség",
    description: "Nyilvántartás · besorolás · jogtár · verziózott szabályzat.",
    images: ["/og-aiact.png"],
  },
  // A böngésző a dátumokat és számsorokat magától hivatkozássá alakítja,
  // ettől a szabályzat címlapján narancsra színeződnek. Kikapcsoljuk.
  formatDetection: { telephone: false, date: false, address: false, email: false },
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
