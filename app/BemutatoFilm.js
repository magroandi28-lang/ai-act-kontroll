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
  const [fit, setFit] = useState({ scale: 0.6, top: 0 });

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
    <div className="bemutato-keret">
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
