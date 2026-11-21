-- CSC343 Assignment 3: ClaimBridge Relational Schema (PostgreSQL DDL)
--
-- Design & Constraint Notes:
-- 1. All entity sets use single-attribute integer PRIMARY KEYs, and all natural
--    keys (contract_number, registration_number, code_label, email) are enforced
--    with UNIQUE constraints.
-- 2. Every column in the schema is NOT NULL. To avoid NULL values on pending
--    claims, ReviewedBy is stored in its own table with claim_id as PRIMARY KEY
--    (enforcing at most one final review per claim).
-- 3. Many-to-one total relationships on Claim (Submits, AssessedUnder, BilledBy)
--    are folded into Claim as NOT NULL foreign keys. Referencing EnrolledIn on
--    (member_id, plan_id) ensures a claim can only be assessed under a benefit
--    plan that the member is actually enrolled in, with zero redundancy.
-- 4. On EnrolledIn, UNIQUE (member_id, plan_priority) combined with
--    CHECK (plan_priority IN ('Primary', 'Secondary')) enforces the max
--    cardinality of 2 benefit plans per member without triggers or assertions.
--
-- Unenforceable Constraints (Assumptions — require triggers/assertions or
-- circular foreign keys in PostgreSQL):
-- - Every Member must be enrolled in at least 1 BenefitPlan (Member (1, 2)
--   participation in EnrolledIn).
-- - Every BenefitPlan must have at least 1 enrolled Member (BenefitPlan (1, N)
--   participation in EnrolledIn).
-- - FlaggedWith.flagged_at and ReviewedBy.reviewed_at must not occur before
--   the corresponding Claim.submission_date.
-- - A member's total approved claims under a benefit plan in a calendar year
--   should be evaluated against BenefitPlan.annual_max in application logic.

drop schema if exists ClaimBridge cascade;
create schema ClaimBridge;
set search_path to ClaimBridge;

-- Insurance benefit plans offered by carriers.
CREATE TABLE BenefitPlan (
    plan_id         INT PRIMARY KEY,
    contract_number VARCHAR(50) NOT NULL UNIQUE,
    carrier_name    VARCHAR(100) NOT NULL,
    annual_max      NUMERIC(10, 2) NOT NULL CHECK (annual_max > 0)
);

-- People covered under one or two benefit plans.
CREATE TABLE Member (
    member_id  INT PRIMARY KEY,
    full_name  VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    phone      VARCHAR(30) NOT NULL
);

-- Enrollment of members in benefit plans (Member (1, 2) — BenefitPlan (1, N)).
-- UNIQUE (member_id, plan_priority) enforces at most 2 plans per member
-- (one Primary and at most one Secondary).
CREATE TABLE EnrolledIn (
    member_id     INT NOT NULL REFERENCES Member(member_id),
    plan_id       INT NOT NULL REFERENCES BenefitPlan(plan_id),
    coverage_tier VARCHAR(10) NOT NULL CHECK (coverage_tier IN ('Single', 'Family')),
    plan_priority VARCHAR(10) NOT NULL CHECK (plan_priority IN ('Primary', 'Secondary')),
    PRIMARY KEY (member_id, plan_id),
    UNIQUE (member_id, plan_priority)
);

-- Healthcare practitioners who provide billed services.
CREATE TABLE Practitioner (
    practitioner_id     INT PRIMARY KEY,
    registration_number VARCHAR(50) NOT NULL UNIQUE,
    full_name           VARCHAR(100) NOT NULL,
    discipline          VARCHAR(100) NOT NULL
);

-- Extended Health Care claims submitted by members.
-- Folds Submits (Claim 1,1), AssessedUnder (Claim 1,1), and BilledBy (Claim 1,1).
-- Composite FK to EnrolledIn guarantees the member is enrolled in that plan.
CREATE TABLE Claim (
    claim_id        INT PRIMARY KEY,
    member_id       INT NOT NULL,
    plan_id         INT NOT NULL,
    practitioner_id INT NOT NULL REFERENCES Practitioner(practitioner_id),
    submission_date DATE NOT NULL,
    amount_claimed  NUMERIC(10, 2) NOT NULL CHECK (amount_claimed > 0),
    FOREIGN KEY (member_id, plan_id) REFERENCES EnrolledIn(member_id, plan_id)
);

-- Catalog of explainable eligibility and anomaly reason codes.
CREATE TABLE ReasonCode (
    code_id     INT PRIMARY KEY,
    code_label  VARCHAR(50) NOT NULL UNIQUE,
    severity    VARCHAR(10) NOT NULL CHECK (severity IN ('Low', 'Medium', 'High')),
    description TEXT NOT NULL
);

-- Many-to-many link between claims and triggered reason codes.
CREATE TABLE FlaggedWith (
    claim_id   INT NOT NULL REFERENCES Claim(claim_id),
    code_id    INT NOT NULL REFERENCES ReasonCode(code_id),
    flagged_at TIMESTAMP NOT NULL,
    PRIMARY KEY (claim_id, code_id)
);

-- Human investigators who adjudicate claims.
CREATE TABLE Investigator (
    investigator_id INT PRIMARY KEY,
    full_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(150) NOT NULL UNIQUE,
    role            VARCHAR(30) NOT NULL CHECK (role IN ('Adjuster', 'Senior Investigator'))
);

-- Final investigator review for a claim (Claim (0, 1) — Investigator (0, N)).
-- Stored separately from Claim so pending claims have no NULL review columns.
CREATE TABLE ReviewedBy (
    claim_id        INT PRIMARY KEY REFERENCES Claim(claim_id),
    investigator_id INT NOT NULL REFERENCES Investigator(investigator_id),
    decision        VARCHAR(10) NOT NULL CHECK (decision IN ('Approved', 'Denied')),
    reviewed_at     TIMESTAMP NOT NULL
);