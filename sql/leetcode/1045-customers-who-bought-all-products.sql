-- Platform:   LeetCode 1045
-- Title:      Customers Who Bought All Products
-- Difficulty: Medium
-- Link:       https://leetcode.com/problems/customers-who-bought-all-products/
-- Solved:     2026-09-30
-- Hint used:  no
-- Redo:       no
-- Pattern:    Relational division: GROUP BY + HAVING COUNT(DISTINCT x) = total count
-- Time:       O(n log n + p): group the n purchase rows by customer, count p products once
-- Space:      O(n) for the per-customer distinct product sets
-- Trap:       COUNT(DISTINCT product_key), not COUNT(*): a customer can buy the same product more than once
-- Dialect:    MySQL (accepted on LeetCode)

SELECT customer_id 
FROM Customer 
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product)
