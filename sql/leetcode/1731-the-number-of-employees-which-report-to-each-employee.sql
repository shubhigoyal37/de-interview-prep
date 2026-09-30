-- Platform:   LeetCode 1731
-- Title:      The Number of Employees Which Report to Each Employee
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
-- Solved:     2026-10-01
-- Hint used:  no
-- Redo:       no
-- Pattern:    Self-join (manager to reports) + GROUP BY with COUNT / AVG
-- Time:       O(n log n): self-join on reports_to, then group and sort by manager id
-- Space:      O(n) for the joined rows and manager groups
-- Trap:       INNER JOIN, not LEFT: employees with no direct reports must not appear; ROUND(AVG(age)) with no digits rounds to the nearest integer
-- Dialect:    MySQL (accepted on LeetCode)

SELECT 
m.employee_id, 
m.name, 
COUNT(e.employee_id) AS reports_count, 
ROUND(AVG(e.age)) AS average_age
FROM Employees AS m
INNER JOIN Employees AS e ON e.reports_to = m.employee_id
GROUP by m.employee_id
ORDER BY m.employee_id
