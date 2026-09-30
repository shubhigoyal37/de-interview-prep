-- Platform:   LeetCode 183
-- Title:      Customers Who Never Order
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/customers-who-never-order/
-- Solved:     2026-09-30
-- Hint used:  no
-- Redo:       no
-- Pattern:    Anti-join (LEFT JOIN + WHERE right.key IS NULL)
-- Time:       O(c + o): hash/index join of customers to orders on customerId
-- Space:      O(c + o) for the joined rows
-- Trap:       Filter on the right table's join key IS NULL; NOT IN (SELECT customerId ...) breaks if the subquery returns a NULL
-- Dialect:    MySQL (accepted on LeetCode)

SELECT c.name AS Customers
FROM Customers AS c
LEFT JOIN Orders As o ON o.customerId = c.id
WHERE o.customerId IS NULL
