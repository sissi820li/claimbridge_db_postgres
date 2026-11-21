# ClaimBridge DB

A normalized PostgreSQL relational database for **ClaimBridge**, an Extended Health Care (EHC) insurance claims platform supporting member benefit enrollment, coordination of benefits, automated anomaly flagging, and human investigator adjudication.

## Domain Overview

ClaimBridge models the end-to-end lifecycle of health insurance claims:

- **Benefit Plans & Enrollment:** Members enroll in one or two benefit plans (a `Primary` plan and an optional `Secondary` plan for coordination of benefits), recording coverage tier (`Single` or `Family`) and annual plan maximums.
- **Claims & Practitioners:** Enrolled members submit claims for services billed by registered healthcare practitioners under a specific benefit plan.
- **Anomaly Flagging:** Automated checks can attach zero or more explainable reason codes (with severity levels and timestamps) to any claim.
- **Human Adjudication:** Each claim receives at most one final review (`Approved` or `Denied`) from an investigator, while unreviewed claims remain implicitly pending.

## Schema Summary

| Table | Type | Purpose |
| :--- | :--- | :--- |
| `BenefitPlan` | Entity | Insurance plans, contract numbers, carriers, and annual dollar maximums |
| `Member` | Entity | Covered plan members and contact details |
| `EnrolledIn` | Relationship | Member-to-plan enrollments with `coverage_tier` and `plan_priority` |
| `Practitioner` | Entity | Registered healthcare providers and clinical disciplines |
| `Claim` | Entity | Submitted claims (folds 1:1 links to `Member`, `BenefitPlan`, and `Practitioner`) |
| `ReasonCode` | Entity | Catalog of explainable eligibility and anomaly codes with severity levels |
| `FlaggedWith` | Relationship | Many-to-many link between claims and triggered reason codes with `flagged_at` |
| `Investigator` | Entity | Human adjusters and senior investigators |
| `ReviewedBy` | Relationship | Final `(0, 1)` adjudication record per claim with `decision` and `reviewed_at` |

## Key Design Decisions & Tradeoffs

- **Zero `NULL` columns (`ReviewedBy` separation):** Because pending claims have not yet been reviewed, storing review fields in a dedicated `ReviewedBy` table with `claim_id` as `PRIMARY KEY` eliminates nullable columns on `Claim` while enforcing at most one final review per claim.
- **Trigger-free `(1, 2)` enrollment cap:** Combining `CHECK (plan_priority IN ('Primary', 'Secondary'))` with `UNIQUE (member_id, plan_priority)` on `EnrolledIn` enforces at most two plans per member directly in DDL.
- **Enrollment-safe claims via composite foreign key:** `Claim` references `EnrolledIn(member_id, plan_id)` rather than `Member` and `BenefitPlan` independently, guaranteeing that every claim is assessed under a plan the member is actually enrolled in without adding redundant columns.
- **No redundant status column:** `Claim` omits a `status` attribute because a claim's state is derived cleanly from `ReviewedBy` (absent = pending; present = `Approved` or `Denied`).
- **Documented assumptions:** Constraints that would require triggers, assertions, or circular foreign keys in PostgreSQL — minimum participation (`Member (1, 2)` and `BenefitPlan (1, N)` in `EnrolledIn`), cross-table timestamp ordering (`flagged_at` / `reviewed_at >= submission_date`), and annual maximum aggregation — are documented in `schema.ddl` for enforcement at the application or trigger layer.

## Repository Structure

```text
.
├── ER.pdf           # Chen-style Entity-Relationship diagram with (min, max) cardinalities
├── schema.ddl       # PostgreSQL schema definition (tables, keys, CHECK/UNIQUE constraints)
├── data.sql         # Synthetic dataset populating all tables
├── q1.sql           # Analytical query 1
├── q2.sql           # Analytical query 2
├── q3.sql           # Analytical query 3
└── slides.pdf       # Technical design presentation
```

## Getting Started

### Prerequisites

- PostgreSQL 14+ (`psql` CLI)

### Setup & Run

1. Open a PostgreSQL session:

```bash
psql -U <your_username> -d <your_database>
```

2. Load the schema and synthetic dataset:

```sql
\i schema.ddl
\i data.sql
```

3. Run the analytical queries:

```sql
\i q1.sql
\i q2.sql
\i q3.sql
```

## Analytical Queries

- **`q1.sql`:** [Add your Q1 English question and SQL highlight, e.g., outer join]
- **`q2.sql`:** [Add your Q2 English question and SQL highlight, e.g., `GROUP BY` / `HAVING`]
- **`q3.sql`:** [Add your Q3 English question and SQL highlight, e.g., subquery]
