"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "../../../lib/supabase/client";

export default function NewSystemForm({ organisationId, userId, templates }) {
  const router = useRouter();
  const [message, setMessage] = useState("");
  const [saving, setSaving] = useState(false);

  async function handleSubmit(event) {
    event.preventDefault();
    setMessage("");
    const data = new FormData(event.currentTarget);
    const name = String(data.get("name") || "").trim().replace(/\s+/g, " ");
    const intendedPurpose = String(data.get("intendedPurpose") || "").trim();
    const systemTypeId = String(data.get("systemTypeId") || "");

    if (!name || !intendedPurpose || !systemTypeId) {
      setMessage("A rendszer neve, típusa és rendeltetési célja kötelező.");
      return;
    }

    setSaving(true);
    const supabase = createClient();
    const { error } = await supabase.from("aic_ai_systems").insert({
      organisation_id: organisationId,
      name,
      system_type_id: systemTypeId,
      description: String(data.get("description") || "").trim() || null,
      intended_purpose: intendedPurpose,
      provider_name: String(data.get("providerName") || "").trim() || null,
      organisation_role: String(data.get("organisationRole") || "unknown"),
      deployment_context: String(data.get("deploymentContext") || "").trim() || null,
      lifecycle_stage: String(data.get("lifecycleStage") || "planned"),
      created_by: userId,
      updated_by: userId,
    });
    setSaving(false);

    if (error?.code === "23505") {
      setMessage(`A szervezetnél már létezik „${name}” nevű MI-rendszer.`);
      return;
    }
    if (error) {
      setMessage("A rendszer mentése nem sikerült. Ellenőrizd az adatokat, majd próbáld újra.");
      return;
    }

    router.push("/rendszerek?letrehozva=1");
    router.refresh();
  }

  return (
    <form className="system-form" onSubmit={handleSubmit} noValidate>
      <label htmlFor="systemName">Rendszer neve *</label>
      <input id="systemName" name="name" disabled={saving} />

      <label htmlFor="systemType">Rendszertípus *</label>
      <select id="systemType" name="systemTypeId" defaultValue="" disabled={saving}>
        <option value="" disabled>Válassz rendszertípust</option>
        {templates.map((template) => <option key={template.id} value={template.id}>{template.name_hu}</option>)}
      </select>

      <label htmlFor="intendedPurpose">Rendeltetési cél *</label>
      <textarea id="intendedPurpose" name="intendedPurpose" rows="3" disabled={saving} />

      <label htmlFor="description">Rövid leírás</label>
      <textarea id="description" name="description" rows="3" disabled={saving} />

      <div className="system-form-grid">
        <div>
          <label htmlFor="providerName">Szolgáltató neve</label>
          <input id="providerName" name="providerName" disabled={saving} />
        </div>
        <div>
          <label htmlFor="organisationRole">A szervezet szerepe</label>
          <select id="organisationRole" name="organisationRole" defaultValue="deployer" disabled={saving}>
            <option value="deployer">Alkalmazó</option><option value="provider">Szolgáltató</option>
            <option value="importer">Importőr</option><option value="distributor">Forgalmazó</option>
            <option value="multiple">Több szerep</option><option value="unknown">Még nem ismert</option>
          </select>
        </div>
      </div>

      <label htmlFor="deploymentContext">Alkalmazási környezet</label>
      <textarea id="deploymentContext" name="deploymentContext" rows="2" disabled={saving} />

      <label htmlFor="lifecycleStage">Életciklus-állapot</label>
      <select id="lifecycleStage" name="lifecycleStage" defaultValue="production" disabled={saving}>
        <option value="planned">Tervezett</option><option value="development">Fejlesztés alatt</option>
        <option value="testing">Tesztelés alatt</option><option value="pilot">Próbaüzem</option>
        <option value="production">Éles üzemben</option><option value="suspended">Felfüggesztett</option>
        <option value="retired">Kivezetett</option>
      </select>

      {message && <p className="system-form-message" role="alert">{message}</p>}
      <button className="primary-button" type="submit" disabled={saving}>{saving ? "Mentés…" : "Rendszer mentése"}</button>
    </form>
  );
}
