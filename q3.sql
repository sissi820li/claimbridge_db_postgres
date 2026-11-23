-- Query 3 (Non-Set-Operation Subquery):
-- Find all claims whose amount claimed is strictly greater than the average
-- amount claimed across all claims billed by practitioners in the same
-- clinical discipline (peer-comparison billing outliers). Report the claim ID,
-- member's full name, practitioner's full name, clinical discipline, and
-- amount claimed. Order by clinical discipline ascending, then amount claimed
-- descending, then claim ID ascending.

SET search_path TO ClaimBridge;

SELECT
    c.claim_id,
    m.full_name AS member_name,
    p.full_name AS practitioner_name,
    p.discipline,
    c.amount_claimed
FROM Claim c
-- Join Member and Practitioner to display names and clinical discipline
JOIN Member m
    ON c.member_id = m.member_id
JOIN Practitioner p
    ON c.practitioner_id = p.practitioner_id
-- Correlated subquery: for each claim, compute the average amount claimed
-- among all claims in that same practitioner discipline, keep outliers
WHERE c.amount_claimed > (
    SELECT AVG(c2.amount_claimed)
    FROM Claim c2
    JOIN Practitioner p2
        ON c2.practitioner_id = p2.practitioner_id
    WHERE p2.discipline = p.discipline
)
ORDER BY
    p.discipline ASC,
    c.amount_claimed DESC,
    c.claim_id ASC;