"use client";

import { useEffect, useMemo, useRef, useState } from "react";
import { useRouter } from "next/navigation";

function searchable(value) {
  return String(value || "")
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLocaleLowerCase("hu-HU");
}

export default function SystemFinder({ systems }) {
  const router = useRouter();
  const wrapperRef = useRef(null);
  const [query, setQuery] = useState("");
  const [open, setOpen] = useState(false);
  const [activeIndex, setActiveIndex] = useState(-1);

  const matches = useMemo(() => {
    const term = searchable(query.trim());
    if (!term) return systems;
    return systems.filter((system) => searchable(
      `${system.name} ${system.purpose} ${system.type}`
    ).includes(term));
  }, [query, systems]);

  useEffect(() => {
    function closeOnOutsideClick(event) {
      if (!wrapperRef.current?.contains(event.target)) {
        setOpen(false);
        setActiveIndex(-1);
      }
    }
    document.addEventListener("mousedown", closeOnOutsideClick);
    return () => document.removeEventListener("mousedown", closeOnOutsideClick);
  }, []);

  function choose(system) {
    setQuery(system.name);
    setOpen(false);
    setActiveIndex(-1);
    router.push(`/rendszerek?oldal=${system.page}#rendszer-${system.id}`);
  }

  function handleKeyDown(event) {
    if (event.key === "ArrowDown") {
      event.preventDefault();
      setOpen(true);
      setActiveIndex((index) => Math.min(index + 1, matches.length - 1));
    } else if (event.key === "ArrowUp") {
      event.preventDefault();
      setOpen(true);
      setActiveIndex((index) => Math.max(index - 1, 0));
    } else if (event.key === "Enter" && open && activeIndex >= 0) {
      event.preventDefault();
      choose(matches[activeIndex]);
    } else if (event.key === "Escape") {
      setOpen(false);
      setActiveIndex(-1);
    }
  }

  return (
    <div className="systems-search">
      <label htmlFor="system-finder">Rendszer gyors megkeresése</label>
      <div className="system-combobox" ref={wrapperRef}>
        <input
          id="system-finder"
          type="text"
          value={query}
          placeholder="Válassz a listából, vagy kezdj el gépelni…"
          autoComplete="off"
          role="combobox"
          aria-autocomplete="list"
          aria-expanded={open}
          aria-controls="system-finder-options"
          aria-activedescendant={activeIndex >= 0 ? `system-option-${matches[activeIndex]?.id}` : undefined}
          onFocus={() => setOpen(true)}
          onChange={(event) => {
            setQuery(event.target.value);
            setOpen(true);
            setActiveIndex(-1);
          }}
          onKeyDown={handleKeyDown}
        />
        {query ? (
          <button
            className="system-combobox-clear"
            type="button"
            aria-label="Keresés törlése"
            onClick={() => {
              setQuery("");
              setOpen(true);
              setActiveIndex(-1);
            }}
          >×</button>
        ) : (
          <button
            className="system-combobox-toggle"
            type="button"
            aria-label="Rendszerek megjelenítése"
            onClick={() => setOpen((value) => !value)}
          >⌄</button>
        )}

        {open && (
          <div className="system-combobox-menu" id="system-finder-options" role="listbox">
            {matches.length ? matches.map((system, index) => (
              <button
                id={`system-option-${system.id}`}
                className={index === activeIndex ? "is-active" : ""}
                type="button"
                role="option"
                aria-selected={index === activeIndex}
                key={system.id}
                onMouseEnter={() => setActiveIndex(index)}
                onClick={() => choose(system)}
              >
                <strong>{system.name}</strong>
                <span>{system.purpose || system.type}</span>
              </button>
            )) : (
              <p className="system-combobox-empty">Nincs ilyen mentett rendszer.</p>
            )}
          </div>
        )}
      </div>
      <p>Kattints a mezőre a teljes listához, vagy keress név és működés alapján.</p>
    </div>
  );
}
