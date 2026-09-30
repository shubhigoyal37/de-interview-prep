-- Platform:   LeetCode 511
-- Title:      Game Play Analysis I
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/game-play-analysis-i/
-- Solved:     2026-09-30
-- Hint used:  no
-- Redo:       no
-- Pattern:    GROUP BY + MIN (first event per key)
-- Time:       O(n log n): group the n activity rows by player_id
-- Space:      O(p) for the p player groups
-- Trap:       Only MIN(event_date) is safe to select; adding device_id or games_played without a join/window gives an arbitrary row's value, not the first login's
-- Dialect:    MySQL (accepted on LeetCode)

SELECT player_id ,MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id  
