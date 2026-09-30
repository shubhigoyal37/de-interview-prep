-- Platform:   LeetCode 1633
-- Title:      Percentage of Users Attended a Contest
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/percentage-of-users-attended-a-contest/
-- Solved:     2026-09-30
-- Hint used:  yes
-- Redo:       no
-- Pattern:    GROUP BY aggregate / scalar subquery denominator (percentage of a total)
-- Time:       O(R + U + C log C): scan Register and Users, then sort the C contest groups
-- Space:      O(C) for the group buckets
-- Trap:       The denominator is every user in Users, not the users who registered; don't forget the contest_id tie-break in ORDER BY
-- Dialect:    MySQL (accepted on LeetCode)

SELECT 
contest_id,
ROUND((COUNT(user_id)/(SELECT COUNT(user_id) FROM Users))*100,2) AS percentage
FROM Register 
GROUP BY contest_id
ORDER BY percentage DESC, contest_id
