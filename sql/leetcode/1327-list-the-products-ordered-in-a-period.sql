-- Platform:   LeetCode 1327
-- Title:      List the Products Ordered in a Period
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/list-the-products-ordered-in-a-period/
-- Solved:     2026-10-23
-- Hint used:  no
-- Redo:       no
-- Pattern:    Aggregate first (WHERE date range + GROUP BY + HAVING SUM), then JOIN to the lookup table for names
-- Time:       O(n log n): filter the n orders to February, group by product, then join the survivors to Products
-- Space:      O(p) for the p product groups
-- Trap:       Use a half-open range (>= 2020-02-01 AND < 2020-03-01) so the leap day 02-29 is included without hardcoding the month's end; the 100-unit threshold goes in HAVING, not WHERE
-- Dialect:    MySQL (accepted on LeetCode)

SELECT product_name, unit
FROM 
(SELECT product_id, SUM(unit) AS unit
FROM Orders
WHERE order_date >= '2020-02-01' AND order_date < '2020-03-01'
GROUP BY product_id
HAVING SUM(unit) >=100) AS o
JOIN Products AS p ON o.product_id = p.product_id
