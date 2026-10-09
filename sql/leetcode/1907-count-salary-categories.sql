-- Platform:   LeetCode 1907
-- Title:      Count Salary Categories
-- Difficulty: Medium
-- Link:       https://leetcode.com/problems/count-salary-categories/
-- Solved:     2026-10-09
-- Hint used:  yes
-- Redo:       no
-- Pattern:    UNION ALL of one filtered COUNT per fixed category (so every category always appears)
-- Time:       O(n): three scans of the n accounts, one per category
-- Space:      O(1): the result is always three rows
-- Trap:       GROUP BY on a CASE bucket drops any category with no accounts; a COUNT with no GROUP BY always returns a row, so empty categories show 0
-- Dialect:    MySQL (accepted on LeetCode)

SELECT 'Low Salary' AS category, COUNT(income) AS accounts_count 
FROM Accounts
WHERE income < 20000
UNION ALL
SELECT 'Average Salary' AS category, COUNT(income) AS accounts_count 
FROM Accounts
WHERE income BETWEEN 20000 AND 50000
UNION ALL
SELECT 'High Salary' AS category, COUNT(income) AS accounts_count 
FROM Accounts
WHERE income > 50000
