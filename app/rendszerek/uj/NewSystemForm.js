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

export default function NewSystemForm({ organisationId, industries, systemTypes, capabilities }) {
  const router = useRouter();
  const [name, setName] = useState("");
  const [systemTypeId, setSystemTypeId] = useState("");
  const [industryCode, setIndustryCode] = useState("general");
  const [selectedCapabilities, setSelectedCapabilities] = useState([]);
  const [organisationRole, setOrganisationRole] = useState("");
  const [providerName, setProviderName] = useState("");
  const [intendedPurpose, setIntendedPurpose] = useState("");
  // A nyilatkozatok alapertelmezese a szokasos eset. Aki kiveszi valamelyiket,
  // annak a szabalyzata is mas lesz.
  const [euHasznalat, setEuHasznalat] = useState(true);
  const [miEgyertelmu, setMiEgyertelmu] = useState(true);
  const [nincsTiltottGyakorlat, setNincsTiltottGyakorlat] = useState(true);
  const [szabalyozottTermek, setSzabalyozottTermek] = useState(false);
  const [message, setMessage] = useState("");
  const [saving, setSaving] = useState(false);

  // Az életciklus-állapot egyetlen szabálymodult sem befolyásol, ezért nem
  // kérdezzük a felvitelnél. A szerkesztőoldalon módosítható.
  const lifecycleStage = "planned";

  const selectedRole = roleOptions.find(([value]) => value === organisationRole);

  // Szolgáltatói szerepkörnél a szervezet maga a szolgáltató, ezért nincs kitől.
  const providerRelevant = organisationRole !== "" && organisationRole !== "provider";

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

    setSaving(true);
    const supabase = createClient();
    const { data: systemId, error } = await supabase.rpc("aic_create_ai_system", {
      p_organisation_id: organisationId,
      p_name: cleanName,
      p_system_type_id: systemTypeId,
      p_industry_code: industryCode,
      p_intended_purpose: intendedPurpose.trim(),
      p_description: null,
      p_provider_name: providerRelevant ? (providerName.trim() || null) : null,
      p_organisation_role: organisationRole,
      p_deployment_context: null,
      p_lifecycle_stage: lifecycleStage,
      p_capability_codes: selectedCapabilities,
      p_eu_hasznalat: euHasznalat,
      p_mi_egyertelmu: miEgyertelmu,
      p_nincs_tiltott_gyakorlat: nincsTiltottGyakorlat,
      p_szabalyozott_termekbe_epul: organisationRole === "provider" ? szabalyozottTermek : false,
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

    router.push(`/rendszerek/${systemId}`);
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

      {selectedType && (
        <section className="profile-confirmation">
          <p className="profile-label">04 · Tényleges működés</p>
          <h2>Eszköz funkciók</h2>
          <p>Jelöld be, amit a rendszer ténylegesen csinál. Ezekből dől el, mely jogszabályok vonatkoznak rá.</p>
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

      <div className="quick-form-step">
        <span>05</span>
        <div>
          <label htmlFor="intendedPurpose">Mi a rendszer tényleges rendeltetése?</label>
          <textarea
            id="intendedPurpose"
            value={intendedPurpose}
            onChange={(event) => setIntendedPurpose(event.target.value)}
            placeholder="Például: beérkező dokumentumok osztályozása és az ügyintéző támogatása. Ez a mondat szó szerint bekerül a szabályzatba."
            disabled={saving}
            rows={4}
          />
        </div>
      </div>

      <div className="quick-form-step">
        <span>06</span>
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

      {providerRelevant && (
        <div className="quick-form-step">
          <span>07</span>
          <div>
            <label htmlFor="providerName">Ki a rendszer szolgáltatója?</label>
            <input
              id="providerName"
              value={providerName}
              onChange={(event) => setProviderName(event.target.value)}
              placeholder="Például: OpenAI, Microsoft, vagy a beszállító cég neve"
              disabled={saving}
              maxLength={160}
            />
            <p className="quick-form-note">
              A szolgáltató az, aki a rendszert forgalomba hozta vagy üzembe helyezte.
              Nem kötelező — ha nem tudod, üresen hagyható.
            </p>
          </div>
        </div>
      )}

      <section className="declaration-block">
        <h2>Nyilatkozat</h2>
        <p>A szokásos eset be van jelölve. Ha valamelyik nem igaz a rendszeretekre, vedd ki — a szabályzat ehhez igazodik.</p>

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

        {organisationRole === "provider" && (
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

      {message && <p className="system-form-message" role="alert">{message}</p>}
      <button className="primary-button" type="submit" disabled={saving || !selectedType}>
        {saving ? "Mentés…" : "Rendszer mentése"}
      </button>
    </form>
  );
}
