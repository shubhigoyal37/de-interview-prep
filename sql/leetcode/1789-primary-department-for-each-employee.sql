-- Platform:   LeetCode 1789
-- Title:      Primary Department for Each Employee
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/primary-department-for-each-employee/
-- Solved:     2026-10-01
-- Hint used:  no
-- Redo:       no
-- Pattern:    GROUP BY + CASE on COUNT, with a correlated subquery for the flagged row
-- Time:       O(n log n): group the n rows by employee_id, plus one indexed lookup per multi-department employee
-- Space:      O(e) for the e employee groups
-- Trap:       An employee with one department has primary_flag = 'N', so filtering on 'Y' alone drops them; handle the single-department case separately
-- Dialect:    MySQL (accepted on LeetCode)

SELECT 
employee_id,
CASE 
    WHEN COUNT(department_id) = 1 THEN department_id
    ELSE (SELECT department_id FROM Employee WHERE primary_flag = 'Y' AND employee_id = e.employee_id)
    END AS department_id
FROM Employee AS e
GROUP BY employee_id
