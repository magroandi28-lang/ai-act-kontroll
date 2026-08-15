"use client";

import { useEffect, useMemo, useRef, useState } from "react";

export default function FunctionCombobox({ capabilities, selectedCodes, requiredCodes, onChange }) {
  const rootRef = useRef(null);
  const [open, setOpen] = useState(false);
  const [query, setQuery] = useState("");
  const required = new Set(requiredCodes || []);

  useEffect(() => {
    function closeOnOutsideClick(event) {
      if (rootRef.current && !rootRef.current.contains(event.target)) setOpen(false);
    }
    document.addEventListener("mousedown", closeOnOutsideClick);
    return () => document.removeEventListener("mousedown", closeOnOutsideClick);
  }, []);

  const selected = capabilities.filter((item) => selectedCodes.includes(item.code));
  const available = useMemo(() => {
    const normalizedQuery = query.trim().toLocaleLowerCase("hu-HU");
    return capabilities.filter((item) => {
      if (selectedCodes.includes(item.code)) return false;
      if (!normalizedQuery) return true;
      return `${item.name_hu} ${item.description_hu || ""}`.toLocaleLowerCase("hu-HU").includes(normalizedQuery);
    });
  }, [capabilities, query, selectedCodes]);

  function add(code) {
    onChange([...selectedCodes, code]);
    setQuery("");
    setOpen(true);
  }

  function remove(code) {
    if (required.has(code)) return;
    onChange(selectedCodes.filter((item) => item !== code));
  }

  return (
    <div className="function-picker" ref={rootRef}>
      <div className="function-chips" aria-label="Aktív funkciók">
        {selected.map((item) => (
          <span className={`function-chip ${required.has(item.code) ? "is-required" : ""}`} key={item.code}>
            {item.name_hu}
            {required.has(item.code)
              ? <small title="A rendszer működéséhez szükséges funkció">Kötelező</small>
              : <button type="button" onClick={() => remove(item.code)} aria-label={`${item.name_hu} eltávolítása`}>×</button>}
          </span>
        ))}
      </div>

      <div className="function-combobox-wrap">
        <input
          className="function-combobox"
          value={query}
          role="combobox"
          aria-expanded={open}
          aria-controls="function-options"
          aria-autocomplete="list"
          placeholder="Funkció hozzáadása – gépelj vagy nyisd le a listát"
          onFocus={() => setOpen(true)}
          onClick={() => setOpen(true)}
          onChange={(event) => { setQuery(event.target.value); setOpen(true); }}
          onKeyDown={(event) => { if (event.key === "Escape") setOpen(false); }}
        />
        <button className="function-combobox-toggle" type="button" onClick={() => setOpen((value) => !value)} aria-label="Funkciólista megnyitása">⌄</button>
      </div>

      {open && (
        <div className="function-options" id="function-options" role="listbox" aria-multiselectable="true">
          {available.length ? available.map((item) => (
            <button type="button" role="option" aria-selected="false" key={item.code} onClick={() => add(item.code)}>
              <strong>{item.name_hu}</strong>
              <span>{item.description_hu}</span>
            </button>
          )) : <p>{query ? "Nincs ilyen hozzáadható funkció." : "Minden elérhető funkció hozzá van adva."}</p>}
        </div>
      )}
    </div>
  );
}
