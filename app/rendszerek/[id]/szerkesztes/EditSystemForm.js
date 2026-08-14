"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { archiveSystem, updateSystem } from "./actions";

const lifecycleOptions = [
  ["planned", "Tervezett"],
  ["development", "Fejlesztés alatt"],
  ["testing", "Tesztelés alatt"],
  ["pilot", "Próbaüzem"],
  ["production", "Éles üzemben"],
  ["suspended", "Felfüggesztett"],
  ["retired", "Kivezetett"],
];

export default function EditSystemForm({ system }) {
  const router = useRouter();
  const [name, setName] = useState(system.name);
  const [lifecycleStage, setLifecycleStage] = useState(system.lifecycle_stage);
  const [message, setMessage] = useState("");
  const [messageType, setMessageType] = useState("");
  const [saving, setSaving] = useState(false);
  const [confirmingDelete, setConfirmingDelete] = useState(false);

  async function handleSave(event) {
    event.preventDefault();
    setMessage("");
    setMessageType("");
    const cleanName = name.trim().replace(/\s+/g, " ");
    if (!cleanName) {
      setMessage("A rendszer neve nem lehet üres.");
      setMessageType("error");
      return;
    }

    setSaving(true);
    const result = await updateSystem(system.id, { name: cleanName, lifecycleStage });
    setSaving(false);
    if (result?.error) {
      setMessage(result.error);
      setMessageType("error");
      return;
    }
    setName(cleanName);
    setMessage("A módosításokat sikeresen elmentettük.");
    setMessageType("success");
    router.refresh();
  }

  async function handleArchive() {
    setSaving(true);
    setMessage("");
    const result = await archiveSystem(system.id);
    setSaving(false);
    if (result?.error) {
      setMessage(result.error);
      return;
    }
    router.push("/rendszerek?torolve=1");
    router.refresh();
  }

  return (
    <>
      <form className="edit-system-form" onSubmit={handleSave}>
        <label htmlFor="edit-system-name">Rendszer neve</label>
        <input id="edit-system-name" value={name} onChange={(event) => setName(event.target.value)} disabled={saving} maxLength={160} />

        <label htmlFor="edit-system-lifecycle">Életciklus-állapot</label>
        <select id="edit-system-lifecycle" value={lifecycleStage} onChange={(event) => setLifecycleStage(event.target.value)} disabled={saving}>
          {lifecycleOptions.map(([value, label]) => <option key={value} value={value}>{label}</option>)}
        </select>

        <div className="edit-system-readonly">
          <span>Használati profil</span>
          <strong>{system.aic_usage_profiles?.name_hu || "Nincs profil megadva"}</strong>
          <p>A profil módosítása új szakmai besorolást igényel, ezért ezen az oldalon nem írható át véletlenül.</p>
        </div>

        {message && (
          <p
            className={`system-form-message ${messageType === "success" ? "is-success" : "is-error"}`}
            role={messageType === "success" ? "status" : "alert"}
          >
            {message}
          </p>
        )}
        <button className="primary-button" type="submit" disabled={saving}>{saving ? "Mentés…" : "Módosítás mentése"}</button>
      </form>

      <section className="system-danger-zone">
        <h2>Rendszer törlése</h2>
        <p>A rendszer eltűnik az aktív listából, de az előzményei és szabályzatai biztonságosan megmaradnak.</p>
        {!confirmingDelete ? (
          <button type="button" onClick={() => setConfirmingDelete(true)} disabled={saving}>Rendszer törlése</button>
        ) : (
          <div className="archive-confirmation" role="alert">
            <strong>Biztosan törlöd ezt a rendszert?</strong>
            <div>
              <button type="button" onClick={() => setConfirmingDelete(false)} disabled={saving}>Mégsem</button>
              <button className="confirm-archive" type="button" onClick={handleArchive} disabled={saving}>{saving ? "Törlés…" : "Igen, törlöm"}</button>
            </div>
          </div>
        )}
      </section>
    </>
  );
}
