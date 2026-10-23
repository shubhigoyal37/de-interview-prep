-- Platform:   LeetCode 602
-- Title:      Friend Requests II: Who Has the Most Friends
-- Difficulty: Medium
-- Link:       https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
-- Solved:     2026-10-23
-- Hint used:  no
-- Redo:       yes
-- Pattern:    UNION ALL two columns into one id column, then GROUP BY + ORDER BY COUNT DESC LIMIT 1
-- Time:       O(n log n): stack 2n ids, group them, then sort the groups by count
-- Space:      O(n) for the stacked ids and groups
-- Trap:       A friendship counts for both the requester and the accepter; UNION (not ALL) would dedupe the stacked ids and collapse everyone's count to 1
-- Dialect:    MySQL (accepted on LeetCode)

SELECT id, COUNT(id) AS num FROM (SELECT requester_id AS id FROM RequestAccepted 
UNION ALL
SELECT accepter_id FROM RequestAccepted) AS final
GROUP BY id
ORDER BY COUNT(id) DESC
LIMIT 1
