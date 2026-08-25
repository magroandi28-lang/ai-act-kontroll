'use client';

import { useEffect, useRef, useState } from 'react';

/* Bemutató film a belépési oldalon.
   A filmet a /bemutato.html tölti be, az óráját ez a komponens hajtja
   (a beágyazott lejátszó magától nem indul el). */

const DUR = 30;

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
  const [fit, setFit] = useState({ scale: 0.6, top: 0, left: 0 });
  // a keret csak akkor jelenik meg, ha a film valódi mérete már megvan —
  // így nem ugrik egyet a kép a betöltés utáni átméretezéskor
  const [kesz, setKesz] = useState(false);

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

  const play = () => {
    if (timeRef.current >= DUR - 0.02) { timeRef.current = 0; seek(0); }
    lastRef.current = performance.now();
    cancelAnimationFrame(rafRef.current);
    setPlaying(true);
    rafRef.current = requestAnimationFrame(tick);
  };

  const pause = () => { cancelAnimationFrame(rafRef.current); setPlaying(false); };

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

  // a film 1600x900-as vászna a dobozba illesztve (contain), vízszintesen és függőlegesen középre
  useEffect(() => {
    const measure = () => {
      const el = boxRef.current;
      if (!el) return;
      const w = el.clientWidth, h = el.clientHeight;
      let cw = 1600, ch = 900, cx = 0, cy = 0;
      try {
        const fd = filmRef.current && filmRef.current.contentDocument;
        const st = fd && (fd.querySelector("[data-om-exportable-video-with-duration-secs]") || fd.body.firstElementChild);
        if (st) {
          const r = st.getBoundingClientRect();
          // csak a film valódi mérete alapján méretezünk, hogy ne legyen utólagos ugrás
          if (r.width > 200 && r.height > 100) { cw = r.width; ch = r.height; cx = r.left; cy = r.top; setKesz(true); }
        }
      } catch (e) {}
      const scale = Math.min(w / cw, h / ch) * 1.07;
      const top = Math.round((h - ch * scale) / 2 - cy * scale);
      const left = Math.round((w - cw * scale) / 2 - cx * scale);
      setFit((prev) => (Math.abs(prev.scale - scale) > 0.002 || prev.top !== top || prev.left !== left ? { scale, top, left } : prev));
    };
    measure();
    [60, 120, 250, 400, 650, 900, 1400, 2200, 3000].forEach(function (ms) { setTimeout(measure, ms); });
    // biztonsági háló: ha bármiért nem sikerül megmérni, 2 s után akkor is megjelenik
    const halo = setTimeout(function () { setKesz(true); }, 2000);
    const ro = typeof ResizeObserver !== 'undefined' && boxRef.current ? new ResizeObserver(measure) : null;
    if (ro) ro.observe(boxRef.current);
    window.addEventListener('resize', measure);
    return () => { clearTimeout(halo); if (ro) ro.disconnect(); window.removeEventListener('resize', measure); };
  }, []);

  useEffect(() => {
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
  }, [lang]);

  const mm = String(Math.floor(t)).padStart(2, '0');

  return (
    <div className="bemutato-doboz" ref={boxRef}>
      <iframe
        ref={filmRef}
        src={'/bemutato.html?lang=' + lang}
        onLoad={() => {
          // a film a 0. másodpercnél áll meg, és csak utána válik láthatóvá,
          // így nem villan fel egy köztes képkocka, és nem ugrik vissza az elejére
          timeRef.current = 0;
          setT(0);
          seek(0);
          setTimeout(() => seek(0), 60);
          setTimeout(() => seek(0), 250);
        }}
        title="Bemutató film"
        className="bemutato-film"
        style={{
          position: 'absolute',
          left: '0px',
          top: '0px',
          width: '1600px',
          height: '900px',
          border: 0,
          background: '#0b1620',
          colorScheme: 'dark',
          transform: 'translate(' + fit.left + 'px, ' + fit.top + 'px) scale(' + fit.scale + ')',
          transformOrigin: 'top left',
          opacity: kesz ? 1 : 0,
          transition: 'opacity 220ms ease',
          pointerEvents: 'none',
        }}
      />
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
    </div>
  );
}
