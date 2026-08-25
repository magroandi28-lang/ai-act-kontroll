'use client';

import { useCallback, useEffect, useRef, useState } from 'react';

/* Bemutató film a belépési oldalon.
   A filmet a /bemutato.html tölti be, az óráját ez a komponens hajtja
   (a beágyazott lejátszó magától nem indul el).

   Telefonon a film nem fér el olvashatóan: a vászon 1600x900, és egy 390 px
   széles kijelzőn a 28 px-es felirat 6-7 px-re zsugorodna. Ezért kis kijelzőn
   a film be sem töltődik, hanem egy indítókártya áll a helyén, és a film
   teljes képernyőn játszódik le — álló tájolásban negyed fordulattal
   elforgatva, hogy a vászon a kijelző hosszabbik oldalát kapja meg. */

const DUR = 30;
const MOBIL_HATAR = 700;
const VEZERLO_MAGASSAG = 64;

export default function BemutatoFilm({ lang = 'hu' }) {
  const filmRef = useRef(null);
  const boxRef = useRef(null);
  const trackRef = useRef(null);
  const timeRef = useRef(0);
  const lastRef = useRef(0);
  const rafRef = useRef(0);
  const aliveRef = useRef(true);
  const [playing, setPlaying] = useState(false);
  const [t, setT] = useState(0);
  const [fit, setFit] = useState({ scale: 0.6, top: 0 });

  // null = még nem tudjuk (szerveroldali render), utána true/false
  const [mobil, setMobil] = useState(null);
  const [teljesKepernyo, setTeljesKepernyo] = useState(false);
  const [szinpad, setSzinpad] = useState(null);

  const stage = () => {
    const f = filmRef.current;
    try {
      return f && f.contentDocument && f.contentDocument.querySelector('[data-om-exportable-video-with-duration-secs]');
    } catch (e) {
      return null;
    }
  };

  const seek = (time) => {
    const s = stage();
    if (s) s.dispatchEvent(new CustomEvent('data-om-seek-to-time-frame', { detail: { time, sync: true } }));
  };

  const tick = () => {
    if (!aliveRef.current) return;
    const now = performance.now();
    const dt = Math.min(0.05, Math.max(0, (now - lastRef.current) / 1000));
    lastRef.current = now;
    timeRef.current = Math.min(DUR, timeRef.current + dt);
    seek(timeRef.current);
    setT(timeRef.current);
    if (timeRef.current >= DUR) { setPlaying(false); return; }
    rafRef.current = requestAnimationFrame(tick);
  };

  const play = useCallback(() => {
    if (timeRef.current >= DUR - 0.02) { timeRef.current = 0; seek(0); }
    lastRef.current = performance.now();
    cancelAnimationFrame(rafRef.current);
    setPlaying(true);
    rafRef.current = requestAnimationFrame(tick);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const pause = useCallback(() => {
    cancelAnimationFrame(rafRef.current);
    setPlaying(false);
  }, []);

  const scrub = (e) => {
    const el = trackRef.current;
    if (!el) return;
    const r = el.getBoundingClientRect();
    const p = Math.min(1, Math.max(0, (e.clientX - r.left) / Math.max(1, r.width)));
    timeRef.current = p * DUR;
    lastRef.current = performance.now();
    seek(timeRef.current);
    setT(timeRef.current);
  };

  /* ── kicsi kijelző felismerése ── */
  useEffect(() => {
    const mq = window.matchMedia('(max-width: ' + MOBIL_HATAR + 'px)');
    const frissit = () => setMobil(mq.matches);
    frissit();
    mq.addEventListener('change', frissit);
    return () => mq.removeEventListener('change', frissit);
  }, []);

  /* ── a teljes képernyős nézet mérete ──
     Álló telefonon a filmet negyed fordulattal elforgatjuk, ezért a keret
     szélessége és magassága felcserélődik. A film 16:9, alatta a vezérlősáv:
     a szélességet a magasság is korlátozza. */
  useEffect(() => {
    if (!teljesKepernyo) { setSzinpad(null); return undefined; }
    const merj = () => {
      const vw = window.innerWidth;
      const vh = window.innerHeight;
      const allo = vh > vw;
      const keretW = allo ? vh : vw;
      const keretH = allo ? vw : vh;
      const filmW = Math.floor(Math.min(keretW, (keretH - VEZERLO_MAGASSAG) * (16 / 9)));
      setSzinpad({ allo, keretW, keretH, filmW });
    };
    merj();
    window.addEventListener('resize', merj);
    window.addEventListener('orientationchange', merj);
    return () => {
      window.removeEventListener('resize', merj);
      window.removeEventListener('orientationchange', merj);
    };
  }, [teljesKepernyo]);

  /* ── görgetészár és Esc, amíg a teljes képernyős nézet nyitva van ── */
  useEffect(() => {
    if (!teljesKepernyo) return undefined;
    const elozo = document.body.style.overflow;
    document.body.style.overflow = 'hidden';
    const onKey = (e) => { if (e.key === 'Escape') { pause(); setTeljesKepernyo(false); } };
    document.addEventListener('keydown', onKey);
    return () => {
      document.body.style.overflow = elozo;
      document.removeEventListener('keydown', onKey);
    };
  }, [teljesKepernyo, pause]);

  // a film 1600x900-as vászna a doboz szélességére skálázva, függőlegesen középre
  useEffect(() => {
    const measure = () => {
      const el = boxRef.current;
      if (!el) return;
      const scale = el.clientWidth / 1600;
      const top = Math.round((el.clientHeight - 900 * scale) / 2);
      setFit((prev) => (Math.abs(prev.scale - scale) > 0.002 || prev.top !== top ? { scale, top } : prev));
    };
    measure();
    const ro = typeof ResizeObserver !== 'undefined' && boxRef.current ? new ResizeObserver(measure) : null;
    if (ro) ro.observe(boxRef.current);
    window.addEventListener('resize', measure);
    return () => { if (ro) ro.disconnect(); window.removeEventListener('resize', measure); };
  }, [mobil, teljesKepernyo, szinpad]);

  /* ── a lejátszó rááll a filmre, amint az betöltött ──
     Kis kijelzőn csak akkor, amikor a teljes képernyős nézet kinyílt: addig
     az iframe be sincs töltve, nem viszi feleslegesen a mobiladatot. */
  const filmLatszik = mobil === false || teljesKepernyo;

  useEffect(() => {
    if (!filmLatszik) return undefined;
    aliveRef.current = true;
    let tries = 0;
    const poll = setInterval(() => {
      tries += 1;
      if (!aliveRef.current || tries > 40) { clearInterval(poll); return; }
      if (stage()) {
        clearInterval(poll);
        timeRef.current = 0;
        seek(0);
        setT(0);
        if (!document.hidden) setTimeout(play, 900);
      }
    }, 150);
    const onVis = () => { if (document.hidden) pause(); };
    document.addEventListener('visibilitychange', onVis);
    return () => {
      aliveRef.current = false;
      clearInterval(poll);
      cancelAnimationFrame(rafRef.current);
      document.removeEventListener('visibilitychange', onVis);
    };
    // nyelvváltáskor a film újratölt, ezért újra be kell állni az elejére
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [lang, filmLatszik]);

  const mm = String(Math.floor(t)).padStart(2, '0');

  const film = (
    <div className="bemutato-doboz" ref={boxRef}>
      <iframe
        ref={filmRef}
        src={'/bemutato.html?lang=' + lang}
        title="Bemutató film"
        className="bemutato-film"
        style={{
          position: 'absolute',
          left: 0,
          top: fit.top + 'px',
          width: '1600px',
          height: '1000px',
          border: 0,
          transform: 'scale(' + fit.scale + ')',
          transformOrigin: 'top left',
          pointerEvents: 'none',
        }}
      />
    </div>
  );

  const vezerlo = (
    <div className="bemutato-vezerlo">
      <button type="button" onClick={playing ? pause : play} className="bemutato-gomb">
        <span className="bemutato-ikon">{playing ? '❚❚' : '▶'}</span>
        {playing ? 'Szünet' : (t >= DUR - 0.05 ? 'Újra' : 'Bemutató indítása')}
      </button>
      <div ref={trackRef} onClick={scrub} className="bemutato-sav">
        <div className="bemutato-sav-belso">
          <div className="bemutato-sav-kitolt" style={{ width: (t / DUR) * 100 + '%' }} />
        </div>
      </div>
      <span className="bemutato-ora">{'0:' + mm + ' / 0:30'}</span>
    </div>
  );

  /* ── kis kijelző: indítókártya, a film csak teljes képernyőn ── */
  if (mobil) {
    return (
      <>
        <div className="bemutato-inditokartya">
          <p className="bemutato-inditokartya-cim">30 másodperces bemutató</p>
          <p className="bemutato-inditokartya-szoveg">
            Végigveszi, hogyan lesz a rögzített MI-rendszerből kiadható szabályzat.
          </p>
          <button
            type="button"
            className="bemutato-inditokartya-gomb"
            onClick={() => { timeRef.current = 0; setT(0); setTeljesKepernyo(true); }}
          >
            <span className="bemutato-ikon">▶</span> Bemutató megtekintése
          </button>
          <p className="bemutato-inditokartya-sugo">Teljes képernyőn nyílik meg.</p>
        </div>

        {teljesKepernyo && (
          <div className="bemutato-teljes" role="dialog" aria-modal="true" aria-label="Bemutató film">
            <button
              type="button"
              className="bemutato-bezar"
              onClick={() => { pause(); setTeljesKepernyo(false); }}
              aria-label="Bezárás"
            >
              ✕
            </button>
            {szinpad && (
              <div
                className="bemutato-forgatott"
                style={{
                  width: szinpad.keretW + 'px',
                  height: szinpad.keretH + 'px',
                  transform: szinpad.allo
                    ? 'translateX(' + szinpad.keretH + 'px) rotate(90deg)'
                    : 'none',
                }}
              >
                <div className="bemutato-keret" style={{ width: szinpad.filmW + 'px' }}>
                  {film}
                  {vezerlo}
                </div>
              </div>
            )}
          </div>
        )}
      </>
    );
  }

  /* ── nagy kijelző, és a szerveroldali első render is ── */
  return (
    <div className="bemutato-keret">
      {mobil === null ? <div className="bemutato-doboz" /> : film}
      {vezerlo}
    </div>
  );
}
