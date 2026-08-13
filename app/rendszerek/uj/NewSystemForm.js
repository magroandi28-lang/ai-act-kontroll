"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "../../../lib/supabase/client";

export default function NewSystemForm({ organisationId, templates, industries, capabilities }) {
  const router = useRouter();
  const [message, setMessage] = useState("");
  const [saving, setSaving] = useState(false);
  const [industryCode, setIndustryCode] = useState("");
  const [systemTypeId, setSystemTypeId] = useState("");
  const [selectedCapabilities, setSelectedCapabilities] = useState([]);

  const selectedTemplate = templates.find((template) => template.id === systemTypeId);
  const availableCapabilities = useMemo(() => capabilities.filter((capability) => {
    const typeMatches = !capability.system_type_codes?.length || capability.system_type_codes.includes(selectedTemplate?.type_code);
    const industryMatches = !capability.industry_codes?.length || capability.industry_codes.includes(industryCode);
    return typeMatches && industryMatches;
  }), [capabilities, industryCode, selectedTemplate?.type_code]);

  function changeContext(nextIndustry, nextSystemTypeId) {
    const nextTemplate = templates.find((template) => template.id === nextSystemTypeId);
    setSelectedCapabilities((current) => current.filter((code) => {
      const capability = capabilities.find((item) => item.code === code);
      if (!capability) return false;
      const typeMatches = !capability.system_type_codes?.length || capability.system_type_codes.includes(nextTemplate?.type_code);
      const industryMatches = !capability.industry_codes?.length || capability.industry_codes.includes(nextIndustry);
      return typeMatches && industryMatches;
    }));
  }

  function toggleCapability(code) {
    setSelectedCapabilities((current) => current.includes(code)
      ? current.filter((item) => item !== code)
      : [...current, code]);
  }

  async function handleSubmit(event) {
    event.preventDefault();
    setMessage("");
    const data = new FormData(event.currentTarget);
    const name = String(data.get("name") || "").trim().replace(/\s+/g, " ");
    const intendedPurpose = String(data.get("intendedPurpose") || "").trim();

    if (!name || !intendedPurpose || !systemTypeId || !industryCode) {
      setMessage("A rendszer neve, iparága, típusa és rendeltetési célja kötelező.");
      return;
    }
    if (selectedTemplate?.type_code === "CUSTOMER_CHATBOT" && selectedCapabilities.length === 0) {
      setMessage("Válassz legalább egy, a dokumentációban szereplő chatbotképességet.");
      return;
    }

    setSaving(true);
    const supabase = createClient();
    const { error } = await supabase.rpc("aic_create_ai_system", {
      p_organisation_id: organisationId,
      p_name: name,
      p_system_type_id: systemTypeId,
      p_industry_code: industryCode,
      p_intended_purpose: intendedPurpose,
      p_description: String(data.get("description") || "").trim() || null,
      p_provider_name: String(data.get("providerName") || "").trim() || null,
      p_organisation_role: String(data.get("organisationRole") || "unknown"),
      p_deployment_context: String(data.get("deploymentContext") || "").trim() || null,
      p_lifecycle_stage: String(data.get("lifecycleStage") || "planned"),
      p_capability_codes: selectedCapabilities,
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

      <label htmlFor="industry">Iparág *</label>
      <select
        id="industry"
        name="industryCode"
        value={industryCode}
        disabled={saving}
        onChange={(event) => {
          const nextIndustry = event.target.value;
          setIndustryCode(nextIndustry);
          changeContext(nextIndustry, systemTypeId);
        }}
      >
        <option value="" disabled>Válassz iparágat</option>
        {industries.map((industry) => <option key={industry.code} value={industry.code}>{industry.name_hu}</option>)}
      </select>
      {industryCode && <p className="field-help">{industries.find((industry) => industry.code === industryCode)?.description_hu}</p>}

      <label htmlFor="systemType">Rendszertípus *</label>
      <select
        id="systemType"
        name="systemTypeId"
        value={systemTypeId}
        disabled={saving}
        onChange={(event) => {
          const nextSystemTypeId = event.target.value;
          setSystemTypeId(nextSystemTypeId);
          changeContext(industryCode, nextSystemTypeId);
        }}
      >
        <option value="" disabled>Válassz rendszertípust</option>
        {templates.map((template) => <option key={template.id} value={template.id}>{template.name_hu}</option>)}
      </select>
      {selectedTemplate && <p className="field-help">{selectedTemplate.description_hu}</p>}

      {industryCode && systemTypeId && (
        <fieldset className="capability-selector">
          <legend>Mit tud a rendszer? *</legend>
          <p className="field-help">Csak olyan képességet jelölj, amelyet a rendszer dokumentációja egyértelműen igazol.</p>
          {availableCapabilities.length ? availableCapabilities.map((capability) => (
            <label className={`capability-option ${selectedCapabilities.includes(capability.code) ? "is-selected" : ""}`} key={capability.code}>
              <input
                type="checkbox"
                checked={selectedCapabilities.includes(capability.code)}
                onChange={() => toggleCapability(capability.code)}
                disabled={saving}
              />
              <span>
                <strong>{capability.name_hu}</strong>
                <small>{capability.description_hu}</small>
                <em>{capability.selection_hint_hu}</em>
              </span>
            </label>
          )) : <p className="system-form-message">Ehhez a típushoz még nincs képességkatalógus. Az alapadatok ettől még rögzíthetők.</p>}
        </fieldset>
      )}

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
