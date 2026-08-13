"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { importSystems, previewImport } from "./actions";

export default function ImportForm() {
  const router = useRouter();
  const [preview, setPreview] = useState(null);
  const [confirmed, setConfirmed] = useState(false);
  const [message, setMessage] = useState("");
  const [busy, setBusy] = useState(false);

  async function handlePreview(event) {
    event.preventDefault();
    setBusy(true);
    setMessage("");
    setConfirmed(false);
    const result = await previewImport(new FormData(event.currentTarget));
    setBusy(false);
    if (result.error) {
      setPreview(null);
      setMessage(result.error);
      return;
    }
    setPreview(result);
  }

  async function handleImport() {
    setBusy(true);
    setMessage("");
    const result = await importSystems(preview?.rows || [], confirmed);
    setBusy(false);
    if (result.error) {
      setMessage(result.error);
      return;
    }
    router.push(`/rendszerek?importalva=${result.importedCount}`);
    router.refresh();
  }

  return (
    <div className="import-workflow">
      <section className="import-step-card">
        <span className="import-step-number">01</span>
        <div>
          <h2>Töltsd le és töltsd ki a sablont</h2>
          <p>Minden sorban adj nevet egy chatbotnak, majd válaszd ki, mire használják. A kitöltött fájlt mentsd XLSX formátumban.</p>
          <a className="secondary-button import-download" href="/energiaai-rendszerimport-sablon.xlsx" download> XLSX-sablon letöltése</a>
        </div>
      </section>

      <form className="import-step-card" onSubmit={handlePreview}>
        <span className="import-step-number">02</span>
        <div>
          <h2>Fájl ellenőrzése</h2>
          <p>Az ellenőrzés még semmit nem ment az adatbázisba.</p>
          <input name="file" type="file" accept=".xlsx,.csv" required disabled={busy} />
          <button className="primary-button" type="submit" disabled={busy}>{busy ? "Ellenőrzés…" : "Fájl ellenőrzése"}</button>
        </div>
      </form>

      {message && <p className="system-form-message import-message" role="alert">{message}</p>}

      {preview && (
        <section className="import-preview" aria-live="polite">
          <div className="import-preview-header">
            <div><p className="profile-label">Ellenőrzési eredmény</p><h2>{preview.validCount} megfelelő, {preview.errorCount} hibás sor</h2></div>
          </div>
          <div className="import-table-wrap">
            <table>
              <thead><tr><th>Sor</th><th>Chatbot neve</th><th>Mire használják?</th><th>Állapot</th></tr></thead>
              <tbody>
                {preview.rows.map((row) => (
                  <tr key={row.rowNumber} className={row.valid ? "is-valid" : "is-error"}>
                    <td>{row.rowNumber}</td><td>{row.name || "—"}</td><td>{row.profileName || row.enteredProfile || "—"}</td>
                    <td>{row.valid ? "Rendben" : row.errors.join(" ")}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          {preview.errorCount === 0 ? (
            <div className="import-confirmation">
              <label><input type="checkbox" checked={confirmed} onChange={(event) => setConfirmed(event.target.checked)} disabled={busy} /><span>Megerősítem, hogy a kiválasztott használati profilok feltételei igazak a rendszerekre.</span></label>
              <button className="primary-button" type="button" onClick={handleImport} disabled={!confirmed || busy}>{busy ? "Importálás…" : `${preview.validCount} rendszer importálása`}</button>
            </div>
          ) : <p className="import-fix-note">Javítsd a jelzett sorokat a fájlban, majd ellenőrizd újra. Hibás fájl nem importálható.</p>}
        </section>
      )}
    </div>
  );
}
