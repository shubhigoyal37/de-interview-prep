-- Platform:   LeetCode 550
-- Title:      Game Play Analysis IV
-- Difficulty: Medium
-- Link:       https://leetcode.com/problems/game-play-analysis-iv/
-- Solved:     2026-09-30
-- Hint used:  yes
-- Redo:       yes
-- Pattern:    Derived table of first event per key, then LEFT JOIN back on (key, date + 1) to test retention
-- Time:       O(n log n): group Activity for first logins, then join each player back on (player_id, event_date)
-- Space:      O(p) for the p first-login rows
-- Trap:       Match the day after the player's FIRST login, not any two consecutive days; COUNT(a.player_id) counts only matches while COUNT(*) counts every player
-- Dialect:    MySQL (accepted on LeetCode)

SELECT ROUND(COUNT(a.player_id) / COUNT(*), 2) AS fraction
FROM (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) AS f
LEFT JOIN Activity AS a
       ON a.player_id = f.player_id
      AND a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY);
