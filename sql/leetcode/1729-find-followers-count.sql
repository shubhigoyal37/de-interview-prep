-- Platform:   LeetCode 1729
-- Title:      Find Followers Count
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/find-followers-count/
-- Solved:     2026-09-30
-- Hint used:  no
-- Redo:       no
-- Pattern:    GROUP BY + COUNT (count rows per key)
-- Time:       O(n log n): group the n follow rows, then sort by user_id
-- Space:      O(u) for the u user groups
-- Trap:       The result must be ordered by user_id ascending; GROUP BY alone doesn't guarantee order
-- Dialect:    MySQL (accepted on LeetCode)

SELECT
user_id, COUNT(follower_id) as followers_count
FROM Followers
GROUP by user_id
ORDER by user_id
