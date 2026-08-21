"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { archiveSystem, updateSystem, updateSystemCapabilities } from '@/app/rendszerek/[id]/szerkesztes/actions';
import FunctionCombobox from '@/components/rendszerek/FunctionCombobox';

const lifecycleOptions = [
  ["planned", "Tervezett"],
  ["development", "Fejlesztés alatt"],
  ["testing", "Tesztelés alatt"],
  ["pilot", "Próbaüzem"],
  ["production", "Éles üzemben"],
  ["suspended", "Felfüggesztett"],
  ["retired", "Kivezetett"],
];

export default function EditSystemForm({ system, configurableCapabilities, declarations }) {
  const router = useRouter();
  const [name, setName] = useState(system.name);
  const [lifecycleStage, setLifecycleStage] = useState(system.lifecycle_stage);
  const [message, setMessage] = useState("");
  const [messageType, setMessageType] = useState("");
  const [saving, setSaving] = useState(false);
  const [confirmingDelete, setConfirmingDelete] = useState(false);
  const [euHasznalat, setEuHasznalat] = useState(declarations?.euHasznalat ?? true);
  const [miEgyertelmu, setMiEgyertelmu] = useState(declarations?.miEgyertelmu ?? true);
  const [nincsTiltottGyakorlat, setNincsTiltottGyakorlat] = useState(
    declarations?.nincsTiltottGyakorlat ?? true
  );
  const [szabalyozottTermek, setSzabalyozottTermek] = useState(
    declarations?.szabalyozottTermek ?? false
  );
  const szolgaltato = system.organisation_role === "provider";
  const [selectedCapabilities, setSelectedCapabilities] = useState(
    (system.aic_ai_system_capabilities || []).map((item) => item.capability_code)
  );
  const initialCapabilities = (system.aic_ai_system_capabilities || [])
    .map((item) => item.capability_code).sort().join("|");
  const capabilitiesChanged = [...selectedCapabilities].sort().join("|") !== initialCapabilities;

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
    if (!result?.error) {
      // A funkciókat és a nyilatkozatokat együtt mentjük, mert egy tényhalmazt alkotnak.
      const allowed = configurableCapabilities.map((item) => item.code);
      const selected = selectedCapabilities.filter((code) => allowed.includes(code));
      const capabilityResult = await updateSystemCapabilities(system.id, selected, true, {
        euHasznalat,
        miEgyertelmu,
        nincsTiltottGyakorlat,
        szabalyozottTermek: szolgaltato ? szabalyozottTermek : false,
      });
      if (capabilityResult?.error) result.error = capabilityResult.error;
    }
    setSaving(false);
    if (result?.error) {
      setMessage(result.error);
      setMessageType("error");
      return;
    }
    setName(cleanName);
    router.push(`/rendszerek?rendszer=${system.id}&modositva=1#rendszer-${system.id}`);
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
          <span>Rendszertípus</span>
          <strong>{system.aic_system_type_templates?.name_hu}</strong>
          <p>{system.intended_purpose}</p>
        </div>

        <section className="profile-confirmation edit-profile-assignment">
          <p className="profile-label">Eszköz funkciók</p>
          <h2>Eszköz funkciók módosítása</h2>
          <p>Egyik funkciót sem kényszeríti rá profil. Csak a rendszer tényleges működését jelöld.</p>
          <FunctionCombobox
            capabilities={configurableCapabilities}
            selectedCodes={selectedCapabilities}
            requiredCodes={[]}
            onChange={setSelectedCapabilities}
          />
        </section>

        <section className="declaration-block">
          <h2>Nyilatkozat</h2>
          <p>Ha valamelyik nem igaz a rendszeretekre, vedd ki — a szabályzat ehhez igazodik.</p>

          <label className="declaration-row">
            <input type="checkbox" checked={euHasznalat} disabled={saving}
              onChange={(event) => setEuHasznalat(event.target.checked)} />
            <span>A rendszert az Európai Unióban használjuk</span>
          </label>

          <label className="declaration-row">
            <input type="checkbox" checked={miEgyertelmu} disabled={saving}
              onChange={(event) => setMiEgyertelmu(event.target.checked)} />
            <span>A felhasználó számára egyértelmű, hogy MI-rendszerrel kommunikál</span>
          </label>

          <label className="declaration-row">
            <input type="checkbox" checked={nincsTiltottGyakorlat} disabled={saving}
              onChange={(event) => setNincsTiltottGyakorlat(event.target.checked)} />
            <span>
              A rendszer nem alkalmaz manipulatív technikát, nem használja ki személyek
              sérülékenységét, és nem végez társadalmi pontozást
            </span>
          </label>

          {!nincsTiltottGyakorlat && (
            <p className="declaration-warning" role="alert">
              Ha ezt nem tudod megerősíteni, a szabályzat élére figyelmeztetés kerül:
              a rendszer tiltott gyakorlatot valósíthat meg, ezért azonnali jogi vizsgálat szükséges.
            </p>
          )}

          {szolgaltato && (
            <label className="declaration-row">
              <input type="checkbox" checked={szabalyozottTermek} disabled={saving}
                onChange={(event) => setSzabalyozottTermek(event.target.checked)} />
              <span>
                A rendszer beépül egy szabályozott termékbe — orvostechnikai eszköz, gép, jármű, játék
                <em>Ilyenkor a rendszer automatikusan magas kockázatúnak minősül.</em>
              </span>
            </label>
          )}
        </section>

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
