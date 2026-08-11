import "./globals.css";

export const metadata = {
  title: "EnergiaAI Kontroll",
  description: "Vállalati MI-megfelelőség egyszerűen.",
};

export default function RootLayout({ children }) {
  return (
    <html lang="hu">
      <body>{children}</body>
    </html>
  );
}
