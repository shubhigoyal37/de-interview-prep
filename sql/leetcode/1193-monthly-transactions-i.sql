-- Platform:   LeetCode 1193
-- Title:      Monthly Transactions I
-- Difficulty: Medium
-- Link:       https://leetcode.com/problems/monthly-transactions-i/
-- Solved:     2026-09-30
-- Hint used:  no
-- Redo:       no
-- Pattern:    Conditional aggregation (COUNT/SUM over CASE WHEN) with GROUP BY on a derived month key
-- Time:       O(n log n): one scan of the n transactions, grouped by (month, country)
-- Space:      O(g) for the g (month, country) groups
-- Trap:       COUNT(CASE ...) needs no ELSE (ELSE 0 would count every row); SUM(CASE ...) needs ELSE 0 so a group with no approvals shows 0, not NULL
-- Dialect:    MySQL (accepted on LeetCode)

SELECT 
DATE_FORMAT(trans_date, '%Y-%m') AS month,
country,
COUNT(*) AS trans_count,
COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount 
FROM Transactions
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country
