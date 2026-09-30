-- Platform:   LeetCode 1934
-- Title:      Confirmation Rate
-- Difficulty: Medium
-- Link:       https://leetcode.com/problems/confirmation-rate/
-- Solved:     2026-09-30
-- Hint used:  yes
-- Redo:       no
-- Pattern:    LEFT JOIN + conditional aggregation (AVG over CASE WHEN 1/0 gives a rate)
-- Time:       O(s + c log c): join each signup to its confirmations on user_id, then group per user
-- Space:      O(s + c) for the joined rows and one group per signup
-- Trap:       LEFT JOIN from Signups so users with no confirmation requests still appear; ELSE 0 turns their NULL action into 0, giving 0.00 instead of NULL
-- Dialect:    MySQL (accepted on LeetCode)

SELECT 
u.user_id,
ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END),2) AS confirmation_rate
FROM Signups AS u
LEFT JOIN Confirmations AS c ON c.user_id = u.user_id
GROUP BY u.user_id
