-- Query 1 (Outer Join):
-- For every submitted claim, report the claim ID, member's full name,
-- insurance carrier name, amount claimed, total number of triggered anomaly
-- reason codes (0 if unflagged), and the final review decision ('Pending' if
-- the claim has not yet been reviewed by an investigator). Order the results
-- by flag count descending, then amount claimed descending, then claim ID.

SET search_path TO ClaimBridge;

SELECT
    c.claim_id,
    m.full_name AS member_name,
    bp.carrier_name,
    c.amount_claimed,
    -- COUNT(f.code_id) counts only non-NULL matches, unflagged claims get 0
    COUNT(f.code_id) AS flag_count,
    -- COALESCE replaces NULL (no review row yet) with 'Pending'
    COALESCE(r.decision, 'Pending') AS review_status
FROM Claim c
-- Every claim has exactly one member and one benefit plan (inner joins)
JOIN Member m
    ON c.member_id = m.member_id
JOIN BenefitPlan bp
    ON c.plan_id = bp.plan_id
-- Outer join keeps claims that have 0 triggered reason codes
LEFT JOIN FlaggedWith f
    ON c.claim_id = f.claim_id
-- Outer join keeps claims that are still pending (not yet in ReviewedBy)
LEFT JOIN ReviewedBy r
    ON c.claim_id = r.claim_id
-- Group by all non-aggregated columns so COUNT(f.code_id) counts flags per claim
GROUP BY
    c.claim_id,
    m.full_name,
    bp.carrier_name,
    c.amount_claimed,
    r.decision
-- Put the highest-risk (most flagged, highest dollar) claims at the top
ORDER BY
    flag_count DESC,
    c.amount_claimed DESC,
    c.claim_id ASC;