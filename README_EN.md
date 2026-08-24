# AI Act Kontroll

**Deterministic AI compliance and policy-generation platform for enterprise AI systems**

**AI Act Kontroll** is an enterprise compliance application for registering AI systems, determining which legal obligations apply to them, and generating versioned compliance policies.

Its core design principle is **deterministic evaluation**: policy content is not written by a language model. User responses are transformed into a structured system profile, evaluated by a PostgreSQL-based rule engine, and mapped to predefined policy modules with explicit legal bases.

> **Legal notice:** AI Act Kontroll does not provide legal advice. The legal catalogue and generated policies require professional legal review before production use.

**Live application:** https://energia-ai-kontroll.vercel.app

---

## Project objective

As organisations adopt more AI systems, it becomes increasingly difficult to maintain a consistent view of:

- which AI systems are currently in use;
- what those systems actually do;
- which legal obligations apply to them;
- which requirements depend on industry or organisational role;
- which policy version corresponded to a given system state;
- which documents may be affected by a legal-source change.

AI Act Kontroll addresses this through a single auditable workflow:

1. register an AI system;
2. capture legally relevant system characteristics;
3. derive additional facts;
4. evaluate applicable compliance rules;
5. assemble a policy from approved modules;
6. attach the relevant legal references;
7. store the document as a versioned record;
8. monitor legal-source changes and flag affected content for review.

The current legal catalogue is based on the **EU AI Act (Regulation (EU) 2024/1689)**, the **GDPR**, and related Hungarian legal sources represented in the application.

---

## Core capabilities

### Guided AI-system registration

The application collects facts that are relevant to compliance decisions. The registration flow is organised around actual system behaviour and use context.

### Deterministic rule evaluation

The same system profile produces the same applicable rule set. Compliance decisions are executed in PostgreSQL functions rather than through prompt-based generation.

### Traceable policy generation

Every compliance rule must have a legal basis. Generated policy content can therefore be traced back to specific legal provisions.

### Legal-change monitoring

A scheduled background process checks supported legal sources, detects content changes through fingerprints, records differences, and flags affected rules for review.

### Policy versioning

When a registered AI system changes, a new policy version can be generated while preserving the previous version.

### Bulk AI-system import

Multiple AI systems can be registered through a generated Excel template derived from the current trigger catalogue.

### Role-based access control

Organisation-level permissions separate administrative, compliance, editing, and read-only responsibilities.

---

## Why deterministic?

A language model can generate fluent policy text, but compliance automation requires more than fluent text.

The primary engineering requirements are **reproducibility, traceability, and testability**.

### Reproducible

The same input produces the same result. This enables regression testing and audit reconstruction.

### Traceable

Every compliance rule is linked to a legal basis. Each generated requirement can be traced back to its source provision.

### Reviewable

Legal content is represented as structured data rather than hidden in prompts. Professional review can therefore focus on source provisions, interpretations, rule conditions, and policy modules.

### Explicit trade-off

The legal catalogue is itself a derived model of legislation. An incorrect interpretation can propagate into every policy that depends on it. Professional legal validation is therefore a prerequisite for production use.

---

## Architecture

```text
┌──────────────────────────────┐
│          Next.js 14          │
│          App Router          │
│                              │
│  Server pages                │
│  Server actions              │
│  Client components           │
└──────────────┬───────────────┘
               │ RPC
               ▼
┌──────────────────────────────┐
│      Supabase / Postgres     │
│                              │
│  PL/pgSQL rule engine        │
│  SECURITY DEFINER RPCs       │
│  Row Level Security          │
│  Versioned compliance data   │
└──────────────────────────────┘
```

The UI is responsible for interaction and presentation. Compliance decisions are centralised in PostgreSQL functions.

This is a deliberate architectural choice: guided registration, bulk import, and scheduled legal-update processing use the same database logic, preventing different application paths from producing inconsistent compliance results.

**Current documented database footprint:** 35 tables, 114 functions, with RLS enabled on all `aic_*` tables.

---

## Domain model

The domain model is organised into four layers.

### 1. Legal layer

| Table | Responsibility |
|---|---|
| `aic_legal_sources` | Legal sources, official URLs, content fingerprints, and update configuration |
| `aic_legal_provisions` | Article-, paragraph-, and point-level legal provisions |
| `aic_legal_text` | Paragraph-level legal text with deep links |
| `aic_provision_coverage` | Review decision on whether a provision is relevant to AI systems |

### 2. Compliance-rule layer

| Table | Responsibility |
|---|---|
| `aic_compliance_rules` | Active compliance rules, organisational-role and lifecycle context |
| `aic_rule_legal_bases` | Mandatory mapping between rules and legal bases |
| `aic_policy_modules` | Policy text and applicability conditions |
| `aic_required_actions` | Required operational actions |
| `aic_required_evidence` | Required evidence and documentation |

**A compliance rule cannot exist without a legal basis.**

### 3. System-fact layer

| Table | Responsibility |
|---|---|
| `aic_trigger_catalogue` | Canonical system facts used by rule conditions |

The current catalogue contains **93 facts**:

- **72 user-answerable**
- **21 derived**

Facts describe system behaviour rather than arbitrary product categories.

### 4. AI-system and document layer

| Table | Responsibility |
|---|---|
| `aic_ai_systems` | Registered organisational AI systems |
| `aic_system_facts` | Structured system profile stored in `jsonb` |
| `aic_generated_policies` | Versioned generated policy documents with content fingerprints |

---

## Rule engine

The core applicability function is:

```sql
aic_applicability_matches(applicability jsonb, profile jsonb)
```

Supported condition groups include:

```jsonc
{
  "all": [
    { "fact": "PROCESSES_PERSONAL_DATA", "is_true": true }
  ],
  "any": [
    { "fact": "USE_EMPLOYMENT" },
    { "fact": "USE_EDUCATION" }
  ],
  "industry_codes": ["energy"]
}
```

An empty `industry_codes` array means that the rule is industry-independent.

The evaluated profile is produced by:

```sql
aic_system_profile(system_id)
```

It contains stored facts plus derived facts such as `system_is_high_risk`.

### Canonical fact keys

Earlier catalogue versions used multiple identifiers for some facts. Historical identifiers are retained in `legacy_fact_keys`, while new rules use canonical keys only.

The compatibility layer resolves legacy and current identifiers into the same evaluation profile.

---

## Policy generation

```text
User responses
    │
    ▼
aic_eszkoz_mentese_v2
    │
    ├── aic_felviteli_profil_v2
    │      └── builds the system profile
    │
    ├── aic_felviteli_hianyok_v2
    │      └── identifies missing decision inputs
    │
    └── aic_refresh_system_policy_links
           └── links applicable policy modules
                    │
                    ▼
              aic_generate_policy
                    │
                    ├── aic_jogforras_hivatkozasok
                    │      └── legal references
                    │
                    └── aic_vezetoi_osszefoglalo
                           └── executive summary
```

Legal-reference generation is centralised in:

```sql
aic_jogforras_hivatkozasok(rule_id)
```

This prevents separate code paths from producing inconsistent legal references.

---

## Legal-change monitoring

The scheduled update runs weekly on **Monday at 04:00 UTC**.

Vercel Cron calls:

```text
/api/jogszabaly-frissites
```

The endpoint requires the `CRON_SECRET` header.

```text
download
   ↓
parse
   ↓
SHA-256 fingerprint
   ↓
difference?
   ├── no  → no further compliance change
   └── yes
        ├── record in aic_legal_text_changes
        ├── flag affected rules for review
        └── mark affected policies as outdated
```

Two parsers are supported:

- `eurlex` — EUR-Lex HTML for EU legal sources;
- `njt` — `njt.hu` HTML for Hungarian legislation.

The NJT parser extracts section-, paragraph-, and point-level anchors:

```text
SZ47
SZ47@BE1
SZ47@BE1@POA
```

---

## Security and authorisation

All `aic_*` tables use **Row Level Security**.

Client code does not write directly to compliance tables. Mutations are performed through `SECURITY DEFINER` RPC functions that validate organisational permissions through:

```sql
aic_szervezeti_szerep(organisation_id)
```

### Roles

| Role | Access |
|---|---|
| `owner`, `admin` | Full organisational administration |
| `compliance` | Manage AI systems and policies; approve legal-catalogue items |
| `editor` | Register and edit AI systems |
| `viewer` | Read-only access |

Legal-catalogue approval is restricted to `compliance` and `owner`.

### Service-role isolation

`SUPABASE_SERVICE_ROLE_KEY` bypasses RLS and must remain server-side only.

According to the current project structure, it is used only by:

```text
app/api/jogszabaly-frissites/route.js
```

---

## Bulk AI-system import

The application supports registering multiple AI systems through a generated Excel template.

The template is generated from the current trigger catalogue:

```bash
node scripts/build-import-template.js
```

Current location:

```text
public/energiaai-rendszerimport-sablon.xlsx
```

When the trigger catalogue changes, the template must be regenerated to keep imported function identifiers aligned with the rule engine.

---

## Policy versioning

Generated policies are stored as versioned documents.

When an AI system changes, a new policy version can be generated while preserving the previous version. This supports historical review and later audit.

---

## Technology stack

| Layer | Technology |
|---|---|
| Web application | Next.js 14, App Router |
| Database | Supabase PostgreSQL 17 |
| Business and rule logic | PL/pgSQL |
| Authentication / authorisation | Supabase Auth + RLS + RPC |
| Deployment | Vercel |
| Scheduled jobs | Vercel Cron |
| EU legal-source processing | EUR-Lex HTML |
| Hungarian legal-source processing | NJT HTML |
| Bulk import | Generated `.xlsx` template |

---

## Project structure

```text
app/
├── page.js                         # login and product introduction
├── jogtar/                         # legal catalogue and approval UI
├── rendszerek/
│   ├── uj/                         # guided AI-system registration
│   ├── importalas/                 # bulk import
│   ├── [id]/                       # system details
│   ├── [id]/szerkesztes/           # editing
│   └── [id]/szabalyzat/            # generated policy
├── szabalyzatok/                   # stored policies and versions
├── vezerlopult/                    # organisational overview
└── api/
    └── jogszabaly-frissites/       # scheduled update endpoint

lib/
├── supabase/                       # client, server, and middleware integration
├── njt-feldolgozo.js               # Hungarian legal-source parser
└── jogszabaly-feldolgozo.js        # EUR-Lex parser

scripts/                             # import and template-generation utilities
supabase/migrations/                 # database schema history
docs/                                # requirements, tests, and audit artefacts
```

---

## Local development

### Requirements

- Node.js 18+
- npm
- configured Supabase project

### Install and run

```bash
npm install
npm run dev
```

Local application:

```text
http://localhost:3000
```

### Quality commands

```bash
npm run build
npm run lint
```

---

## Environment variables

Create `.env.local` for local development.

| Variable | Scope | Purpose |
|---|---|---|
| `NEXT_PUBLIC_SUPABASE_URL` | client + server | Supabase project URL |
| `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY` | client + server | Public key protected by RLS |
| `SUPABASE_SERVICE_ROLE_KEY` | server only | Legal-update workflow |
| `CRON_SECRET` | server only | Authentication of the scheduled endpoint |

> `SUPABASE_SERVICE_ROLE_KEY` bypasses Row Level Security. Never expose it in client-side code.

---

## Migrations and legal-source loading

Schema migrations are stored in:

```text
supabase/migrations/
```

Naming convention:

```text
YYYYMMDDHHMMSS_description.sql
```

The current documentation records **72 migration files**.

The migrations directory is the schema source of truth. Manual database changes must also be represented by a migration to prevent environment drift.

### Loading legal sources

```bash
python scripts/njt_betolto.py
python scripts/jogszabaly_betolto.py
node scripts/build-import-template.js
```

| Command | Purpose |
|---|---|
| `njt_betolto.py` | Import Hungarian legislation from `njt.hu` |
| `jogszabaly_betolto.py` | Import EU legal sources from EUR-Lex |
| `build-import-template.js` | Regenerate the bulk-import spreadsheet |

---

## Testing

The current documented test baseline consists of manual test artefacts:

- requirements;
- manual test cases;
- test execution records;
- defect log.

These are maintained under:

```text
docs/
```

### Planned automation layers

1. **Rule-engine regression tests**  
   Fixed system profiles should resolve to fixed compliance-rule sets.

2. **Database / RPC integration tests**  
   Validate permissions, policy generation, versioning, and legal-reference consistency.

3. **API tests**  
   Validate the legal-update endpoint and authentication.

4. **UI end-to-end tests**  
   Cover authentication, AI-system registration, editing, bulk import, and policy access.

The documented development direction proposes **pgTAP** for rule-engine regression testing because the core compliance logic resides in PostgreSQL.

---

## Known limitations and engineering roadmap

### Rule-engine regression automation

The rule engine is deterministic, but the current documented baseline relies mainly on manual tests.

**Planned direction:** fixed profiles and expected rule sets executed with pgTAP.

### Legal-diff granularity

Legal-source comparison currently operates at article level.

Planned comparison key:

```text
(source_id, article_number, paragraph_number)
```

This is intended to reduce false-positive change events caused by different document segmentation.

### Legal validation

The legal catalogue is machine-derived and requires professional legal review before production use.

### Additional industries

The current documentation records:

- 142 active rules;
- 134 industry-independent rules;
- 21 energy-specific rules.

The architecture is designed so that adding an industry primarily requires loading and reviewing additional sector-specific legislation rather than redesigning the core rule engine.

### Multiple organisational roles

`aic_ai_systems` can already store multiple organisational roles, and the registration flow supports multiple selections.

The current documented limitation is that `aic_generate_policy` still reads the singular `organisation_role` field, so generated policy content currently reflects only the primary role.

### Upcoming obligations

The data model already stores future obligations in `upcoming_obligations`.

A planned enhancement is to display requirements that are not yet applicable on the issue date but require advance preparation.

---

## Engineering principles

1. **Single source of truth for compliance decisions**  
   Business and rule logic is centralised in the database.

2. **No rule without a legal basis**  
   Traceability is enforced structurally.

3. **Same input → same result**  
   Rule evaluation is deterministic.

4. **Versioned output**  
   Policy history is retained when system characteristics change.

5. **Legal change is an observable event**  
   Source updates can propagate review status to affected rules and generated policies.

---

## Disclaimer

AI Act Kontroll is a software-engineering and compliance-automation project.

It is not a substitute for qualified legal advice. Before production use, the legal catalogue, rule interpretations, and generated policies must be professionally reviewed.
