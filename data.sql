-- Run after loading schema.ddl:  \i schema.ddl  then  \i data.sql

SET search_path TO ClaimBridge;

-- Populate BenefitPlan (6 rows)
INSERT INTO BenefitPlan VALUES (1, 'SL-999496', 'Sun Life', 2500.00);
INSERT INTO BenefitPlan VALUES (2, 'ML-842105', 'Manulife', 3000.00);
INSERT INTO BenefitPlan VALUES (3, 'CL-771230', 'Canada Life', 2000.00);
INSERT INTO BenefitPlan VALUES (4, 'GS-615482', 'Green Shield Canada', 1800.00);
INSERT INTO BenefitPlan VALUES (5, 'BC-503917', 'Ontario Blue Cross', 2200.00);
INSERT INTO BenefitPlan VALUES (6, 'DJ-449021', 'Desjardins', 3500.00);