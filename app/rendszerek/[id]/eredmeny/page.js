import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { createClient } from "../../../../lib/supabase/server";

export default async function ResultPage({ params }) {
  const supabase = createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/");
  const { data: system } = await supabase.from("aic_ai_systems").select("id,name").eq("id",params.id).maybeSingle();
  if (!system) notFound();
  const { data: assessment } = await supabase.from("aic_assessments").select("id,status,rules_evaluated,matched_count,insufficient_count,created_at").eq("system_id",system.id).order("created_at",{ascending:false}).limit(1).maybeSingle();
  if (!assessment) redirect(`/rendszerek/${system.id}/vizsgalat`);
  const { data: rows } = await supabase.from("aic_assessment_results")
    .select("evaluation_status, aic_compliance_rules(rule_code,title,plain_language_requirement,outcome_type,requires_human_review,aic_rule_legal_bases(basis_type,aic_legal_provisions(article_number,annex_number,heading,source_locator,aic_legal_sources(title,official_url))))")
    .eq("assessment_id",assessment.id).eq("evaluation_status","matched");

  return <main className="result-page"><section className="result-shell">
    <Link className="back-link" href={`/rendszerek/${system.id}`}>← Vissza a rendszer adatlapjára</Link>
    <p className="system-form-eyebrow">Determinisztikus eredmény</p><h1>{system.name} szabályrendszere</h1>
    <div className="result-summary"><div><strong>{assessment.matched_count}</strong><span>vonatkozó szabály</span></div><div><strong>{assessment.rules_evaluated}</strong><span>vizsgált szabály</span></div><div><strong>{assessment.insufficient_count}</strong><span>további adatot igényel</span></div></div>
    {assessment.insufficient_count > 0 && <p className="result-warning">A rendszer nem találgatott: {assessment.insufficient_count} szabályhoz még nincs elegendő adat. Ezek később célzott kérdésekkel pontosíthatók.</p>}
    <div className="rule-results">{!rows?.length && <p className="result-empty">A megadott adatok alapján nincs megjeleníthető vonatkozó szabály.</p>}{(rows || []).map(({aic_compliance_rules:rule}) => <article className="rule-result" key={rule.rule_code}>
      <div><span>{rule.outcome_type}</span><code>{rule.rule_code}</code></div><h2>{rule.title}</h2><p>{rule.plain_language_requirement}</p>
      {rule.requires_human_review && <strong className="human-review">Szakértői ellenőrzést igényel</strong>}
      <div className="legal-bases">{(rule.aic_rule_legal_bases || []).map((base,index) => <a href={base.aic_legal_provisions?.aic_legal_sources?.official_url} target="_blank" rel="noreferrer" key={index}>AI Act {base.aic_legal_provisions?.article_number ? `${base.aic_legal_provisions.article_number}. cikk` : base.aic_legal_provisions?.annex_number || "jogforrás"} ↗</a>)}</div>
    </article>)}</div>
    <p className="dashboard-disclaimer">Az eredmény döntéstámogatás, nem minősül jogi tanácsadásnak. Az adatbázis szabályai jelenleg felülvizsgálat alatt állnak.</p>
  </section></main>;
}
