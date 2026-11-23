-- Query 2 (HAVING Clause):
-- Find all members who have submitted at least 2 claims with a combined
-- amount claimed greater than $350. For each qualifying member, report their
-- member ID, full name, total number of claims, total dollar amount claimed,
-- and average claim amount (rounded to 2 decimal places). Order the results
-- by total amount claimed descending, then member ID ascending.

SET search_path TO ClaimBridge;

SELECT
    m.member_id,
    m.full_name AS member_name,
    COUNT(c.claim_id) AS claim_count,
    SUM(c.amount_claimed) AS total_claimed,
    ROUND(AVG(c.amount_claimed), 2) AS avg_claim_amount
FROM Member m
-- Match each member to the claims they submitted
JOIN Claim c
    ON m.member_id = c.member_id
-- Group all claims belonging to the same member into one summary row
GROUP BY
    m.member_id,
    m.full_name
-- HAVING filter to select groups after aggregation
HAVING
    COUNT(c.claim_id) >= 2
    AND SUM(c.amount_claimed) > 350.00
-- Put the highest-spending members at the top
ORDER BY
    total_claimed DESC,
    m.member_id ASC;