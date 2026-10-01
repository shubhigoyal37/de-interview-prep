-- Platform:   LeetCode 1141
-- Title:      User Activity for the Past 30 Days I
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
-- Solved:     2026-10-01
-- Hint used:  yes
-- Redo:       yes
-- Pattern:    Date-window filter (WHERE on a DATE_SUB range) + GROUP BY with COUNT(DISTINCT)
-- Time:       O(n log n): filter the n activity rows to the window, then group by day
-- Space:      O(d) for the d day groups (at most 30)
-- Trap:       The 30-day window ending 2019-07-27 inclusive starts at 06-28, so use > DATE_SUB(.., 30 DAY), not >=; COUNT(DISTINCT user_id) because one user logs many activities a day
-- Dialect:    MySQL (accepted on LeetCode)

SELECT
activity_date AS day,
COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE 
activity_date > DATE_SUB('2019-07-27', INTERVAL 30 DAY) AND activity_date <= '2019-07-27'
GROUP BY activity_date
