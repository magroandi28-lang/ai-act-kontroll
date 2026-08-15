"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "../../../lib/supabase/client";
import FunctionCombobox from "../FunctionCombobox";

// A szervezeti szerepkör dönti el, hogy a szabálymotor a szolgáltatói vagy az
// alkalmazói kötelezettségeket rendeli a rendszerhez, ezért nem tippelhető meg.
const roleOptions = [
  ["deployer", "Alkalmazó", "A szervezet saját felelősségére használja a rendszert."],
  ["provider", "Szolgáltató", "A szervezet fejleszti, fejlesztteti vagy saját néven hozza forgalomba."],
  ["importer", "Importőr", "A szervezet EU-n kívüli szolgáltató rendszerét hozza be az uniós piacra."],
  ["distributor", "Forgalmazó", "A szervezet továbbforgalmazza a rendszert, de nem szolgáltató és nem importőr."],
  ["authorised_representative", "Meghatalmazott képviselő", "A szervezet EU-n kívüli szolgáltatót képvisel írásbeli megbízás alapján."],
];

const lifecycleOptions = [
  ["planned", "Tervezett"],
  ["development", "Fejlesztés alatt"],
  ["testing", "Tesztelés alatt"],
  ["pilot", "Próbaüzem"],
  ["production", "Éles üzemben"],
  ["suspended", "Felfüggesztett"],
  ["retired", "Kivezetett"],
];

export default function NewSystemForm({ organisationId, industries, systemTypes, capabilities }) {
  const router = useRouter();
  const [name, setName] = useState("");
  const [systemTypeId, setSystemTypeId] = useState("");
  const [industryCode, setIndustryCode] = useState("general");
  const [intendedPurpose, setIntendedPurpose] = useState("");
  const [organisationRole, setOrganisationRole] = useState("");
  const [lifecycleStage, setLifecycleStage] = useState("");
  const [selectedCapabilities, setSelectedCapabilities] = useState([]);
  const [message, setMessage] = useState("");
  const [saving, setSaving] = useState(false);

  const selectedRole = roleOptions.find(([value]) => value === organisationRole);

  const selectedType = systemTypes.find((type) => type.id === systemTypeId);
  const compatibleCapabilities = useMemo(() => capabilities.filter((capability) => {
    const typeMatches = !capability.system_type_codes?.length || capability.system_type_codes.includes(selectedType?.type_code);
    const industryMatches = !capability.industry_codes?.length || capability.industry_codes.includes(industryCode);
    return typeMatches && industryMatches;
  }), [capabilities, industryCode, selectedType]);

  async function handleSubmit(event) {
    event.preventDefault();
    setMessage("");
    const cleanName = name.trim().replace(/\s+/g, " ");

    if (!cleanName || !systemTypeId || !industryCode || !intendedPurpose.trim()) {
      setMessage("Add meg a rendszer nevét, típusát, alkalmazási területét és rendeltetését.");
      return;
    }

    if (!organisationRole) {
      setMessage("Válaszd ki, milyen szerepben használja a szervezet ezt a rendszert.");
      return;
    }

    if (!lifecycleStage) {
      setMessage("Válaszd ki a rendszer életciklus-állapotát.");
      return;
    }

    setSaving(true);
    const supabase = createClient();
    const { data: systemId, error } = await supabase.rpc("aic_create_ai_system", {
      p_organisation_id: organisationId,
      p_name: cleanName,
      p_system_type_id: systemTypeId,
      p_industry_code: industryCode,
      p_intended_purpose: intendedPurpose.trim(),
      p_description: null,
      p_provider_name: null,
      p_organisation_role: organisationRole,
      p_deployment_context: null,
      p_lifecycle_stage: lifecycleStage,
      p_capability_codes: selectedCapabilities,
    });
    setSaving(false);

    if (error?.code === "23505") {
      setMessage(`A szervezetnél már létezik „${cleanName}” nevű MI-rendszer.`);
      return;
    }
    if (error) {
      setMessage(error.message || "A rendszer mentése nem sikerült.");
      return;
    }

    router.push(`/rendszerek/${systemId}/vizsgalat`);
    router.refresh();
  }

  return (
    <form className="quick-system-form" onSubmit={handleSubmit} noValidate>
      <div className="quick-form-step">
        <span>01</span>
        <div>
          <label htmlFor="systemName">Mi a rendszer neve?</label>
          <input id="systemName" value={name} onChange={(event) => setName(event.target.value)} placeholder="Például: EnergiaChat" disabled={saving} />
        </div>
      </div>

      <div className="quick-form-step">
        <span>02</span>
        <div>
          <label htmlFor="systemType">Milyen típusú MI-rendszer?</label>
          <select id="systemType" value={systemTypeId} disabled={saving} onChange={(event) => {
            setSystemTypeId(event.target.value);
            setSelectedCapabilities([]);
          }}>
            <option value="" disabled>Válassz rendszertípust</option>
            {systemTypes.map((type) => <option key={type.id} value={type.id}>{type.name_hu}</option>)}
          </select>
          {selectedType && <p className="quick-form-note">{selectedType.description_hu}</p>}
        </div>
      </div>

      <div className="quick-form-step">
        <span>03</span>
        <div>
          <label htmlFor="industry">Melyik területen használják?</label>
          <select id="industry" value={industryCode} disabled={saving} onChange={(event) => {
            setIndustryCode(event.target.value);
            setSelectedCapabilities([]);
          }}>
            {industries.map((industry) => <option key={industry.code} value={industry.code}>{industry.name_hu}</option>)}
          </select>
        </div>
      </div>

      <div className="quick-form-step">
        <span>04</span>
        <div>
          <label htmlFor="intendedPurpose">Mi a rendszer tényleges rendeltetése?</label>
          <textarea
            id="intendedPurpose"
            value={intendedPurpose}
            onChange={(event) => setIntendedPurpose(event.target.value)}
            placeholder="Például: beérkező dokumentumok osztályozása és az ügyintéző támogatása"
            disabled={saving}
            rows={4}
          />
        </div>
      </div>

      <div className="quick-form-step">
        <span>05</span>
        <div>
          <label htmlFor="organisationRole">Milyen szerepben használja a szervezet?</label>
          <select id="organisationRole" value={organisationRole} disabled={saving} onChange={(event) => setOrganisationRole(event.target.value)}>
            <option value="" disabled>Válassz szerepkört</option>
            {roleOptions.map(([value, label]) => <option key={value} value={value}>{label}</option>)}
          </select>
          {selectedRole && <p className="quick-form-note">{selectedRole[2]}</p>}
          <p className="quick-form-note">A szerepkör dönti el, hogy a szabályzat a szolgáltatói vagy az alkalmazói kötelezettségeket tartalmazza.</p>
        </div>
      </div>

      <div className="quick-form-step">
        <span>06</span>
        <div>
          <label htmlFor="lifecycleStage">Hol tart a rendszer az életciklusában?</label>
          <select id="lifecycleStage" value={lifecycleStage} disabled={saving} onChange={(event) => setLifecycleStage(event.target.value)}>
            <option value="" disabled>Válassz életciklus-állapotot</option>
            {lifecycleOptions.map(([value, label]) => <option key={value} value={value}>{label}</option>)}
          </select>
        </div>
      </div>

      {selectedType && (
        <section className="profile-confirmation">
          <p className="profile-label">07 · Tényleges működés</p>
          <h2>Aktív funkciók</h2>
          <p>Csak azt válaszd ki, amit ez a konkrét rendszer valóban végez. A szabályzat az aktív funkciókat és az ellenőrzött alkalmazási adatokat követi.</p>
          <div className="profile-functions">
            <FunctionCombobox
              capabilities={compatibleCapabilities}
              selectedCodes={selectedCapabilities}
              requiredCodes={[]}
              onChange={setSelectedCapabilities}
            />
          </div>
        </section>
      )}

      {message && <p className="system-form-message" role="alert">{message}</p>}
      <button className="primary-button" type="submit" disabled={saving || !selectedType}>
        {saving ? "Mentés…" : "Mentés és adatok ellenőrzése"}
      </button>
    </form>
  );
}
