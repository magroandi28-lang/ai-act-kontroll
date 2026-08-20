"use client";

import { useEffect, useMemo, useRef, useState } from "react";

export default function TriggerCombobox({ questions, values, onChange }) {
  const rootRef = useRef(null);
  const [open, setOpen] = useState(false);
  const [query, setQuery] = useState("");

  useEffect(() => {
    function closeOnOutsideClick(event) {
      if (rootRef.current && !rootRef.current.contains(event.target)) setOpen(false);
    }
    document.addEventListener("mousedown", closeOnOutsideClick);
    return () => document.removeEventListener("mousedown", closeOnOutsideClick);
  }, []);

  const selected = useMemo(
    () => questions.filter((item) => values[item.kulcs] === true),
    [questions, values]
  );

  const available = useMemo(() => {
    const normalizedQuery = query.trim().toLocaleLowerCase("hu-HU");
    return questions.filter((item) => {
      if (values[item.kulcs] === true) return false;
      if (!normalizedQuery) return true;
      return `${item.nev || ""} ${item.kerdes || ""} ${item.magyarazat || ""}`
        .toLocaleLowerCase("hu-HU")
        .includes(normalizedQuery);
    });
  }, [questions, query, values]);

  function add(key) {
    onChange(key, true);
    setQuery("");
    setOpen(true);
  }

  return (
    <div className="felvitel-funkcio" ref={rootRef}>
      <div className="felvitel-funkcio-cimkek" aria-label="Kiválasztott rendszerfunkciók">
        {selected.map((item) => (
          <span className="felvitel-funkcio-cimke" key={item.kulcs}>
            {item.nev}
            <button
              type="button"
              onClick={() => onChange(item.kulcs, false)}
              aria-label={`${item.nev} eltávolítása`}
            >
              ×
            </button>
          </span>
        ))}
      </div>

      <div className="felvitel-funkcio-kereso">
        <input
          value={query}
          role="combobox"
          aria-expanded={open}
          aria-controls="felvitel-funkcio-lista"
          aria-autocomplete="list"
          placeholder="Funkció keresése vagy hozzáadása"
          onFocus={() => setOpen(true)}
          onClick={() => setOpen(true)}
          onChange={(event) => {
            setQuery(event.target.value);
            setOpen(true);
          }}
          onKeyDown={(event) => {
            if (event.key === "Escape") setOpen(false);
          }}
        />
        <button
          type="button"
          onClick={() => setOpen((value) => !value)}
          aria-label="Funkciólista megnyitása"
        >
          ⌄
        </button>
      </div>

      {open && (
        <div className="felvitel-funkcio-lista" id="felvitel-funkcio-lista" role="listbox">
          {available.length ? (
            available.map((item) => (
              <button type="button" role="option" aria-selected="false" key={item.kulcs} onClick={() => add(item.kulcs)}>
                <strong>{item.nev}</strong>
                {item.magyarazat && <span>{item.magyarazat}</span>}
              </button>
            ))
          ) : (
            <p>{query ? "Nincs ilyen hozzáadható funkció." : "Minden elérhető funkció ki van választva."}</p>
          )}
        </div>
      )}
    </div>
  );
}
