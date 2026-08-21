"use client";

import { useState, useTransition } from "react";
import { changeRole, inviteMember, removeMember } from '@/app/szervezet/actions';

// A szerepkörök jelentése egy helyen. Ugyanezt látja a felhasználó a
// felületen is, hogy ne kelljen kitalálnia, mit választ.
const ROLES = [
  ["owner", "Tulajdonos", "Mindent tehet, a jóváhagyást is. Tartalék, ha a jogász nem elérhető."],
  ["compliance", "Jogász", "Szabályzatot szerkeszt és hagy jóvá. Szerkeszteni csak ő tud."],
  ["editor", "Szerkesztő", "MI-rendszert visz fel és tart karban. Beküldhet felülvizsgálatra, de nem hagy jóvá."],
  ["admin", "Adminisztrátor", "Tagokat kezel. A szabályzatokhoz nem nyúl."],
];

const ROLE_LABELS = Object.fromEntries(ROLES.map(([value, label]) => [value, label]));

function initials(name, email) {
  const forras = String(name || email || "?").trim();
  const reszek = forras.split(/[\s.@]+/).filter(Boolean);
  return (reszek[0]?.[0] || "?").toUpperCase() + (reszek[1]?.[0] || "").toUpperCase();
}

export default function MembersPanel({ organisationId, myRole, members, readOnly = false }) {
  const [pending, startTransition] = useTransition();
  const [message, setMessage] = useState(null);
  const [selectedRole, setSelectedRole] = useState("compliance");

  const canManage = !readOnly && (myRole === "owner" || myRole === "admin");

  function run(action) {
    setMessage(null);
    startTransition(async () => {
      const result = await action();
      if (result?.error) setMessage({ type: "error", text: result.error });
      else if (result?.message) setMessage({ type: "ok", text: result.message });
    });
  }

  function handleInvite(formData) {
    run(() => inviteMember(organisationId, formData));
  }

  return (
    <div className="org-panel">
      {message && (
        <p className={`org-message org-message-${message.type}`} role="alert">
          {message.text}
        </p>
      )}

      <section className="org-block">
        <h2>Tagok</h2>
        <ul className="org-members">
          {members.map((member) => (
            <li className="org-member" key={member.user_id}>
              <span className="org-avatar" aria-hidden="true">
                {initials(member.full_name, member.email)}
              </span>

              <span className="org-member-main">
                <strong>
                  {member.full_name || member.email}
                  {member.is_self && <em className="org-self"> · te</em>}
                </strong>
                <small>{member.email}</small>
                {member.invitation_pending && (
                  <small className="org-pending">Meghívva – még nem lépett be</small>
                )}
              </span>

              {canManage && !member.is_self ? (
                <span className="org-member-actions">
                  <label className="org-visually-hidden" htmlFor={`role-${member.user_id}`}>
                    Szerepkör
                  </label>
                  <select
                    id={`role-${member.user_id}`}
                    className="org-role-select"
                    value={member.member_role}
                    disabled={pending}
                    onChange={(event) =>
                      run(() => changeRole(organisationId, member.user_id, event.target.value))
                    }
                  >
                    {ROLES.map(([value, label]) => (
                      <option key={value} value={value}>{label}</option>
                    ))}
                  </select>
                  <button
                    type="button"
                    className="org-remove"
                    disabled={pending}
                    onClick={() => run(() => removeMember(organisationId, member.user_id))}
                  >
                    Eltávolítás
                  </button>
                </span>
              ) : (
                <span className="org-role-badge">{ROLE_LABELS[member.member_role] || member.member_role}</span>
              )}
            </li>
          ))}
        </ul>
      </section>

      {canManage && (
        <section className="org-block">
          <h2>Tag meghívása</h2>
          <p className="org-note">
            A meghívott e-mailben kap egy linket, amellyel beállítja a jelszavát,
            és belép ebbe a szervezetbe.
          </p>

          <form className="org-invite" action={handleInvite}>
            <div className="org-field">
              <label htmlFor="full_name">Név</label>
              <input id="full_name" name="full_name" placeholder="dr. Minta Judit" disabled={pending} />
            </div>

            <div className="org-field">
              <label htmlFor="email">E-mail cím</label>
              <input id="email" name="email" type="email" placeholder="nev@cegnev.hu" disabled={pending} required />
            </div>

            <div className="org-field">
              <label htmlFor="member_role">Szerepkör</label>
              <select
                id="member_role"
                name="member_role"
                value={selectedRole}
                disabled={pending}
                onChange={(event) => setSelectedRole(event.target.value)}
              >
                {ROLES.map(([value, label]) => (
                  <option key={value} value={value}>{label}</option>
                ))}
              </select>
              <p className="org-role-help">
                {ROLES.find(([value]) => value === selectedRole)?.[2]}
              </p>
            </div>

            <button className="org-invite-button" type="submit" disabled={pending}>
              {pending ? "Küldés…" : "Meghívó küldése"}
            </button>
          </form>
        </section>
      )}

      <section className="org-block">
        <h2>Mit jelentenek a szerepkörök</h2>
        <dl className="org-roles">
          {ROLES.map(([value, label, leiras]) => (
            <div className="org-role-row" key={value}>
              <dt>{label}</dt>
              <dd>{leiras}</dd>
            </div>
          ))}
        </dl>
      </section>
    </div>
  );
}
