"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "../../../lib/supabase/client";
import FunctionCombobox from "../FunctionCombobox";

export default function NewSystemForm({ organisationId, industries, profiles, capabilities }) {
  const router = useRouter();
  const [name, setName] = useState("");
  const [industryCode, setIndustryCode] = useState("");
  const [profileCode, setProfileCode] = useState("");
  const [confirmed, setConfirmed] = useState(false);
  const [selectedCapabilities, setSelectedCapabilities] = useState([]);
  const [message, setMessage] = useState("");
  const [saving, setSaving] = useState(false);

  const availableProfiles = useMemo(
    () => profiles.filter((profile) => profile.industry_code === industryCode),
    [industryCode, profiles]
  );
  const selectedProfile = profiles.find((profile) => profile.code === profileCode);
  const compatibleCapabilities = useMemo(() => capabilities.filter((capability) => {
    const typeMatches = !capability.system_type_codes?.length || capability.system_type_codes.includes(selectedProfile?.system_type_code);
    const industryMatches = !capability.industry_codes?.length || capability.industry_codes.includes(industryCode);
    return typeMatches && industryMatches;
  }), [capabilities, industryCode, selectedProfile]);

  async function handleSubmit(event) {
    event.preventDefault();
    setMessage("");
    const cleanName = name.trim().replace(/\s+/g, " ");

    if (!cleanName || !industryCode || !profileCode) {
      setMessage("Add meg a rendszer nevét, majd válaszd ki az iparágat és a használati profilt.");
      return;
    }
    if (!confirmed) {
      setMessage("A mentéshez erősítsd meg, hogy a profil feltételei igazak a rendszerre.");
      return;
    }

    setSaving(true);
    const supabase = createClient();
    const { error } = await supabase.rpc("aic_create_ai_system_from_profile", {
      p_organisation_id: organisationId,
      p_name: cleanName,
      p_profile_code: profileCode,
      p_conditions_confirmed: confirmed,
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

    router.push("/rendszerek?letrehozva=1");
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
          <label htmlFor="industry">Melyik iparágban használják?</label>
          <select id="industry" value={industryCode} disabled={saving} onChange={(event) => {
            setIndustryCode(event.target.value);
            setProfileCode("");
            setSelectedCapabilities([]);
            setConfirmed(false);
          }}>
            <option value="" disabled>Válassz iparágat</option>
            {industries.map((industry) => <option key={industry.code} value={industry.code}>{industry.name_hu}</option>)}
          </select>
        </div>
      </div>

      <div className="quick-form-step">
        <span>03</span>
        <div>
          <label htmlFor="usageProfile">Mire használják?</label>
          <select id="usageProfile" value={profileCode} disabled={!industryCode || saving} onChange={(event) => {
            const nextProfile = profiles.find((profile) => profile.code === event.target.value);
            setProfileCode(event.target.value);
            setSelectedCapabilities(nextProfile?.capability_codes || []);
            setConfirmed(false);
          }}>
            <option value="" disabled>Válassz használati profilt</option>
            {availableProfiles.map((profile) => <option key={profile.code} value={profile.code}>{profile.name_hu}</option>)}
          </select>
          {industryCode && availableProfiles.length === 0 && <p className="quick-form-note">Ehhez az iparághoz még nincs elkészült használati profil.</p>}
        </div>
      </div>

      {selectedProfile && (
        <section className="profile-confirmation">
          <p className="profile-label">Kiválasztott profil</p>
          <h2>{selectedProfile.name_hu}</h2>
          <p>{selectedProfile.description_hu}</p>
          <h3>Ez a profil akkor használható, ha:</h3>
          <ul>
            {(selectedProfile.required_assertions || []).map((assertion) => <li key={assertion}>{assertion}</li>)}
          </ul>
          <label className="profile-confirm-check">
            <input type="checkbox" checked={confirmed} onChange={(event) => setConfirmed(event.target.checked)} disabled={saving} />
            <span>A rendszer dokumentációja alapján minden felsorolt feltétel igaz.</span>
          </label>
          <div className="profile-functions">
            <h3>Funkciók</h3>
            <p>A profil alapfunkciói automatikusan bekerültek. A kereshető listából további funkciókat adhatsz hozzá.</p>
            <FunctionCombobox
              capabilities={compatibleCapabilities}
              selectedCodes={selectedCapabilities}
              requiredCodes={selectedProfile.capability_codes || []}
              onChange={setSelectedCapabilities}
            />
          </div>
        </section>
      )}

      {message && <p className="system-form-message" role="alert">{message}</p>}
      <button className="primary-button" type="submit" disabled={saving || !selectedProfile || !confirmed}>
        {saving ? "Mentés…" : "Rendszer mentése"}
      </button>
    </form>
  );
}
