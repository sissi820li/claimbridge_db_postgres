-- Run after loading schema.ddl:  \i schema.ddl  then  \i data.sql

SET search_path TO ClaimBridge;

-- Populate BenefitPlan (6 rows)
INSERT INTO BenefitPlan VALUES (1, 'SL-999496', 'Sun Life', 2500.00);
INSERT INTO BenefitPlan VALUES (2, 'ML-842105', 'Manulife', 3000.00);
INSERT INTO BenefitPlan VALUES (3, 'CL-771230', 'Canada Life', 2000.00);
INSERT INTO BenefitPlan VALUES (4, 'GS-615482', 'Green Shield Canada', 1800.00);
INSERT INTO BenefitPlan VALUES (5, 'BC-503917', 'Ontario Blue Cross', 2200.00);
INSERT INTO BenefitPlan VALUES (6, 'DJ-449021', 'Desjardins', 3500.00);

-- Populate Member (20 rows)
INSERT INTO Member VALUES (1, 'Maya Patel', '1991-04-12', '416-555-0101');
INSERT INTO Member VALUES (2, 'Liam Chen', '1988-09-23', '416-555-0102');
INSERT INTO Member VALUES (3, 'Sofia Rossi', '1995-02-08', '647-555-0103');
INSERT INTO Member VALUES (4, 'Noah Tremblay', '1983-11-19', '905-555-0104');
INSERT INTO Member VALUES (5, 'Amara Okafor', '1990-07-30', '416-555-0105');
INSERT INTO Member VALUES (6, 'Ethan Kim', '1993-01-15', '647-555-0106');
INSERT INTO Member VALUES (7, 'Chloe Gagnon', '1986-06-04', '905-555-0107');
INSERT INTO Member VALUES (8, 'Lucas Silva', '1997-12-21', '416-555-0108');
INSERT INTO Member VALUES (9, 'Hannah Nguyen', '1989-03-17', '647-555-0109');
INSERT INTO Member VALUES (10, 'Daniel Brooks', '1979-08-25', '905-555-0110');
INSERT INTO Member VALUES (11, 'Priya Sharma', '1994-10-02', '416-555-0111');
INSERT INTO Member VALUES (12, 'Owen MacLeod', '1985-05-14', '647-555-0112');
INSERT INTO Member VALUES (13, 'Zara Haddad', '1992-07-09', '416-555-0113');
INSERT INTO Member VALUES (14, 'Benjamin Park', '1987-11-28', '905-555-0114');
INSERT INTO Member VALUES (15, 'Olivia Kowalski', '1996-01-31', '647-555-0115');
INSERT INTO Member VALUES (16, 'Mateo Alvarez', '1984-09-06', '416-555-0116');
INSERT INTO Member VALUES (17, 'Grace Liu', '1991-12-13', '647-555-0117');
INSERT INTO Member VALUES (18, 'Samuel Mensah', '1982-04-27', '905-555-0118');
INSERT INTO Member VALUES (19, 'Ava Deschamps', '1998-06-18', '416-555-0119');
INSERT INTO Member VALUES (20, 'Caleb Wright', '1980-02-22', '647-555-0120');

-- Populate EnrolledIn (28 rows)
INSERT INTO EnrolledIn VALUES (1, 1, 'Family', 'Primary');
INSERT INTO EnrolledIn VALUES (1, 2, 'Family', 'Secondary');
INSERT INTO EnrolledIn VALUES (2, 2, 'Single', 'Primary');
INSERT INTO EnrolledIn VALUES (3, 1, 'Single', 'Primary');
INSERT INTO EnrolledIn VALUES (3, 3, 'Family', 'Secondary');
INSERT INTO EnrolledIn VALUES (4, 3, 'Family', 'Primary');
INSERT INTO EnrolledIn VALUES (5, 4, 'Single', 'Primary');
INSERT INTO EnrolledIn VALUES (5, 1, 'Family', 'Secondary');
INSERT INTO EnrolledIn VALUES (6, 5, 'Single', 'Primary');
INSERT INTO EnrolledIn VALUES (7, 2, 'Family', 'Primary');
INSERT INTO EnrolledIn VALUES (7, 6, 'Family', 'Secondary');
INSERT INTO EnrolledIn VALUES (8, 6, 'Single', 'Primary');
INSERT INTO EnrolledIn VALUES (9, 1, 'Single', 'Primary');
INSERT INTO EnrolledIn VALUES (10, 3, 'Family', 'Primary');
INSERT INTO EnrolledIn VALUES (10, 4, 'Family', 'Secondary');
INSERT INTO EnrolledIn VALUES (11, 4, 'Single', 'Primary');
INSERT INTO EnrolledIn VALUES (12, 5, 'Family', 'Primary');
INSERT INTO EnrolledIn VALUES (12, 2, 'Family', 'Secondary');
INSERT INTO EnrolledIn VALUES (13, 6, 'Single', 'Primary');
INSERT INTO EnrolledIn VALUES (14, 1, 'Family', 'Primary');
INSERT INTO EnrolledIn VALUES (15, 2, 'Single', 'Primary');
INSERT INTO EnrolledIn VALUES (15, 5, 'Family', 'Secondary');
INSERT INTO EnrolledIn VALUES (16, 3, 'Single', 'Primary');
INSERT INTO EnrolledIn VALUES (17, 4, 'Family', 'Primary');
INSERT INTO EnrolledIn VALUES (18, 5, 'Family', 'Primary');
INSERT INTO EnrolledIn VALUES (18, 6, 'Family', 'Secondary');
INSERT INTO EnrolledIn VALUES (19, 6, 'Single', 'Primary');
INSERT INTO EnrolledIn VALUES (20, 2, 'Family', 'Primary');

-- Populate Practitioner (12 rows)
INSERT INTO Practitioner VALUES (1, 'PT-33357', 'Dr. Nadia Kapoor', 'Physiotherapy');
INSERT INTO Practitioner VALUES (2, 'PT-41892', 'Marcus Reid', 'Physiotherapy');
INSERT INTO Practitioner VALUES (3, 'PT-50214', 'Elena Novak', 'Physiotherapy');
INSERT INTO Practitioner VALUES (4, 'MT-20911', 'Claire Bouchard', 'Massage Therapy');
INSERT INTO Practitioner VALUES (5, 'MT-28463', 'David Tran', 'Massage Therapy');
INSERT INTO Practitioner VALUES (6, 'MT-31905', 'Sarah Jenkins', 'Massage Therapy');
INSERT INTO Practitioner VALUES (7, 'DC-11428', 'Dr. Kenji Sato', 'Chiropractic');
INSERT INTO Practitioner VALUES (8, 'DC-15874', 'Dr. Rachel Goldstein', 'Chiropractic');
INSERT INTO Practitioner VALUES (9, 'DC-19203', 'Dr. Tariq Mansour', 'Chiropractic');
INSERT INTO Practitioner VALUES (10, 'PS-70122', 'Dr. Evelyn Cho', 'Psychology');
INSERT INTO Practitioner VALUES (11, 'PS-74839', 'Dr. Patrick O''Connor', 'Psychology');
INSERT INTO Practitioner VALUES (12, 'PS-79510', 'Dr. Fatima Al-Sayed', 'Psychology');

-- Populate Claim (40 rows)
INSERT INTO Claim VALUES (1, 1, 1, 1, '2026-09-02', 135.00);
INSERT INTO Claim VALUES (2, 1, 2, 1, '2026-09-18', 290.00);
INSERT INTO Claim VALUES (3, 2, 2, 2, '2026-09-05', 145.00);
INSERT INTO Claim VALUES (4, 2, 2, 2, '2026-09-25', 360.00);
INSERT INTO Claim VALUES (5, 3, 1, 3, '2026-09-08', 125.00);
INSERT INTO Claim VALUES (6, 3, 3, 1, '2026-10-01', 420.00);
INSERT INTO Claim VALUES (7, 4, 3, 2, '2026-09-11', 150.00);
INSERT INTO Claim VALUES (8, 4, 3, 3, '2026-10-04', 310.00);
INSERT INTO Claim VALUES (9, 5, 4, 1, '2026-09-14', 130.00);
INSERT INTO Claim VALUES (10, 5, 1, 2, '2026-10-09', 450.00);
INSERT INTO Claim VALUES (11, 6, 5, 4, '2026-09-03', 110.00);
INSERT INTO Claim VALUES (12, 6, 5, 5, '2026-09-29', 265.00);
INSERT INTO Claim VALUES (13, 7, 2, 4, '2026-09-07', 115.00);
INSERT INTO Claim VALUES (14, 7, 6, 6, '2026-10-02', 340.00);
INSERT INTO Claim VALUES (15, 8, 6, 5, '2026-09-10', 105.00);
INSERT INTO Claim VALUES (16, 8, 6, 4, '2026-10-06', 250.00);
INSERT INTO Claim VALUES (17, 9, 1, 6, '2026-09-15', 120.00);
INSERT INTO Claim VALUES (18, 9, 1, 5, '2026-10-11', 315.00);
INSERT INTO Claim VALUES (19, 10, 3, 4, '2026-09-19', 100.00);
INSERT INTO Claim VALUES (20, 10, 4, 6, '2026-10-14', 285.00);
INSERT INTO Claim VALUES (21, 11, 4, 7, '2026-09-04', 90.00);
INSERT INTO Claim VALUES (22, 11, 4, 8, '2026-09-27', 240.00);
INSERT INTO Claim VALUES (23, 12, 5, 7, '2026-09-09', 95.00);
INSERT INTO Claim VALUES (24, 12, 2, 9, '2026-10-05', 320.00);
INSERT INTO Claim VALUES (25, 13, 6, 8, '2026-09-12', 85.00);
INSERT INTO Claim VALUES (26, 13, 6, 7, '2026-10-08', 275.00);
INSERT INTO Claim VALUES (27, 14, 1, 9, '2026-09-16', 105.00);
INSERT INTO Claim VALUES (28, 14, 1, 8, '2026-10-12', 230.00);
INSERT INTO Claim VALUES (29, 15, 2, 7, '2026-09-20', 95.00);
INSERT INTO Claim VALUES (30, 15, 5, 9, '2026-10-16', 350.00);
INSERT INTO Claim VALUES (31, 16, 3, 10, '2026-09-06', 190.00);
INSERT INTO Claim VALUES (32, 16, 3, 11, '2026-10-03', 380.00);
INSERT INTO Claim VALUES (33, 17, 4, 10, '2026-09-13', 185.00);
INSERT INTO Claim VALUES (34, 17, 4, 12, '2026-10-07', 410.00);
INSERT INTO Claim VALUES (35, 18, 5, 11, '2026-09-17', 200.00);
INSERT INTO Claim VALUES (36, 18, 6, 12, '2026-10-10', 490.00);
INSERT INTO Claim VALUES (37, 19, 6, 10, '2026-09-21', 195.00);
INSERT INTO Claim VALUES (38, 19, 6, 11, '2026-10-15', 360.00);
INSERT INTO Claim VALUES (39, 20, 2, 12, '2026-09-24', 180.00);
INSERT INTO Claim VALUES (40, 20, 2, 10, '2026-10-18', 520.00);

-- Populate ReasonCode (8 rows)
INSERT INTO ReasonCode VALUES (1, 'ELG_MAX_EXCEEDED', 'High', 'Claimed amount pushes member beyond annual EHC plan maximum.');
INSERT INTO ReasonCode VALUES (2, 'RUL_DUP_CLAIM', 'High', 'Duplicate service date and billed amount detected across claims.');
INSERT INTO ReasonCode VALUES (3, 'RUL_CLOSED_DAY', 'Medium', 'Billed service date falls on a day the clinic is normally closed.');
INSERT INTO ReasonCode VALUES (4, 'XDC_DATE_MISMATCH', 'Medium', 'Service date on receipt does not match submitted claim date.');
INSERT INTO ReasonCode VALUES (5, 'PEER_HIGH_Z', 'High', 'Billed amount is significantly above peer average for this discipline.');
INSERT INTO ReasonCode VALUES (6, 'ELG_MISSING_REF', 'Low', 'Physician referral recommended for extended therapy series.');
INSERT INTO ReasonCode VALUES (7, 'PEER_FREQ_SPIKE', 'Medium', 'Member claim frequency exceeds typical monthly utilization baseline.');
INSERT INTO ReasonCode VALUES (8, 'RUL_COB_OVERLAP', 'Low', 'Secondary plan claim overlaps primary plan submission window.');

-- Populate FlaggedWith (40 rows)
INSERT INTO FlaggedWith VALUES (2, 5, '2026-09-18 14:10:00');
INSERT INTO FlaggedWith VALUES (2, 8, '2026-09-18 14:10:05');
INSERT INTO FlaggedWith VALUES (4, 5, '2026-09-25 11:20:00');
INSERT INTO FlaggedWith VALUES (4, 3, '2026-09-25 11:20:04');
INSERT INTO FlaggedWith VALUES (6, 5, '2026-10-01 09:45:00');
INSERT INTO FlaggedWith VALUES (6, 1, '2026-10-01 09:45:02');
INSERT INTO FlaggedWith VALUES (6, 8, '2026-10-01 09:45:06');
INSERT INTO FlaggedWith VALUES (8, 5, '2026-10-04 16:05:00');
INSERT INTO FlaggedWith VALUES (8, 4, '2026-10-04 16:05:03');
INSERT INTO FlaggedWith VALUES (10, 5, '2026-10-09 10:15:00');
INSERT INTO FlaggedWith VALUES (10, 2, '2026-10-09 10:15:04');
INSERT INTO FlaggedWith VALUES (12, 5, '2026-09-29 13:30:00');
INSERT INTO FlaggedWith VALUES (14, 5, '2026-10-02 15:00:00');
INSERT INTO FlaggedWith VALUES (14, 8, '2026-10-02 15:00:05');
INSERT INTO FlaggedWith VALUES (16, 6, '2026-10-06 12:12:00');
INSERT INTO FlaggedWith VALUES (18, 5, '2026-10-11 08:50:00');
INSERT INTO FlaggedWith VALUES (18, 7, '2026-10-11 08:50:02');
INSERT INTO FlaggedWith VALUES (20, 5, '2026-10-14 17:40:00');
INSERT INTO FlaggedWith VALUES (20, 4, '2026-10-14 17:40:03');
INSERT INTO FlaggedWith VALUES (22, 5, '2026-09-27 09:05:00');
INSERT INTO FlaggedWith VALUES (24, 5, '2026-10-05 14:22:00');
INSERT INTO FlaggedWith VALUES (24, 2, '2026-10-05 14:22:05');
INSERT INTO FlaggedWith VALUES (26, 3, '2026-10-08 11:18:00');
INSERT INTO FlaggedWith VALUES (28, 6, '2026-10-12 10:33:00');
INSERT INTO FlaggedWith VALUES (30, 5, '2026-10-16 15:45:00');
INSERT INTO FlaggedWith VALUES (30, 1, '2026-10-16 15:45:02');
INSERT INTO FlaggedWith VALUES (32, 5, '2026-10-03 13:10:00');
INSERT INTO FlaggedWith VALUES (32, 7, '2026-10-03 13:10:04');
INSERT INTO FlaggedWith VALUES (34, 5, '2026-10-07 16:30:00');
INSERT INTO FlaggedWith VALUES (34, 4, '2026-10-07 16:30:05');
INSERT INTO FlaggedWith VALUES (36, 5, '2026-10-10 09:12:00');
INSERT INTO FlaggedWith VALUES (36, 1, '2026-10-10 09:12:03');
INSERT INTO FlaggedWith VALUES (36, 8, '2026-10-10 09:12:07');
INSERT INTO FlaggedWith VALUES (38, 6, '2026-10-15 11:55:00');
INSERT INTO FlaggedWith VALUES (40, 5, '2026-10-18 14:00:00');
INSERT INTO FlaggedWith VALUES (40, 2, '2026-10-18 14:00:04');
INSERT INTO FlaggedWith VALUES (1, 6, '2026-09-02 10:00:00');
INSERT INTO FlaggedWith VALUES (11, 4, '2026-09-03 11:00:00');
INSERT INTO FlaggedWith VALUES (21, 3, '2026-09-04 12:00:00');
INSERT INTO FlaggedWith VALUES (31, 7, '2026-09-06 13:00:00');

-- Populate Investigator (6 rows)
INSERT INTO Investigator VALUES (1, 'Jordan Mercer', 'j.mercer@claimbridge.ca', 'Senior Investigator');
INSERT INTO Investigator VALUES (2, 'Priyanka Das', 'p.das@claimbridge.ca', 'Senior Investigator');
INSERT INTO Investigator VALUES (3, 'Kevin Osei', 'k.osei@claimbridge.ca', 'Adjuster');
INSERT INTO Investigator VALUES (4, 'Melissa Tremblay', 'm.tremblay@claimbridge.ca', 'Adjuster');
INSERT INTO Investigator VALUES (5, 'Raymond Wu', 'r.wu@claimbridge.ca', 'Adjuster');
INSERT INTO Investigator VALUES (6, 'Tessa Gallagher', 't.gallagher@claimbridge.ca', 'Senior Investigator');

-- Populate ReviewedBy (28 rows)
INSERT INTO ReviewedBy VALUES (1, 3, 'Approved', '2026-09-04 09:30:00');
INSERT INTO ReviewedBy VALUES (2, 1, 'Approved', '2026-09-20 14:15:00');
INSERT INTO ReviewedBy VALUES (3, 4, 'Approved', '2026-09-07 10:00:00');
INSERT INTO ReviewedBy VALUES (4, 1, 'Denied', '2026-09-27 16:20:00');
INSERT INTO ReviewedBy VALUES (5, 5, 'Approved', '2026-09-10 11:45:00');
INSERT INTO ReviewedBy VALUES (6, 2, 'Denied', '2026-10-03 15:10:00');
INSERT INTO ReviewedBy VALUES (7, 3, 'Approved', '2026-09-13 09:00:00');
INSERT INTO ReviewedBy VALUES (9, 4, 'Approved', '2026-09-16 13:25:00');
INSERT INTO ReviewedBy VALUES (10, 6, 'Denied', '2026-10-11 10:40:00');
INSERT INTO ReviewedBy VALUES (11, 5, 'Approved', '2026-09-05 14:50:00');
INSERT INTO ReviewedBy VALUES (12, 3, 'Approved', '2026-10-01 12:05:00');
INSERT INTO ReviewedBy VALUES (13, 4, 'Approved', '2026-09-09 08:30:00');
INSERT INTO ReviewedBy VALUES (14, 1, 'Denied', '2026-10-04 17:00:00');
INSERT INTO ReviewedBy VALUES (15, 5, 'Approved', '2026-09-12 10:15:00');
INSERT INTO ReviewedBy VALUES (17, 3, 'Approved', '2026-09-17 15:30:00');
INSERT INTO ReviewedBy VALUES (19, 4, 'Approved', '2026-09-21 11:00:00');
INSERT INTO ReviewedBy VALUES (21, 5, 'Approved', '2026-09-06 09:45:00');
INSERT INTO ReviewedBy VALUES (22, 2, 'Approved', '2026-09-29 14:20:00');
INSERT INTO ReviewedBy VALUES (23, 3, 'Approved', '2026-09-11 16:10:00');
INSERT INTO ReviewedBy VALUES (24, 6, 'Denied', '2026-10-07 13:05:00');
INSERT INTO ReviewedBy VALUES (25, 4, 'Approved', '2026-09-14 10:50:00');
INSERT INTO ReviewedBy VALUES (27, 5, 'Approved', '2026-09-18 12:30:00');
INSERT INTO ReviewedBy VALUES (29, 3, 'Approved', '2026-09-22 09:15:00');
INSERT INTO ReviewedBy VALUES (31, 4, 'Approved', '2026-09-08 11:20:00');
INSERT INTO ReviewedBy VALUES (32, 2, 'Denied', '2026-10-05 15:45:00');
INSERT INTO ReviewedBy VALUES (33, 5, 'Approved', '2026-09-15 14:00:00');
INSERT INTO ReviewedBy VALUES (35, 3, 'Approved', '2026-09-19 10:30:00');
INSERT INTO ReviewedBy VALUES (37, 4, 'Approved', '2026-09-23 16:00:00');