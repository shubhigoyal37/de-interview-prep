-- Platform:   LeetCode 570
-- Title:      Managers with at Least 5 Direct Reports
-- Difficulty: Medium
-- Link:       https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
-- Solved:     unknown
-- Hint used:  unknown
-- Redo:       yes
-- Pattern:    Self-join + GROUP BY / HAVING (filter on an aggregate)
-- Time:       O(n log n): self-join on the id index, then grouping
-- Space:      O(n) for the joined rows and group buckets
-- Trap:       Group by m.id, not m.name: two managers can share a name, and grouping by name merges their reports
-- Dialect:    MySQL (accepted on LeetCode). SQL Server: m.name must also be in GROUP BY (GROUP BY m.id, m.name)

SELECT m.name
FROM Employee AS m
INNER JOIN Employee AS e ON e.managerId = m.Id
GROUP BY m.id
HAVING count(e.id) >=5
