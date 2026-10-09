-- Platform:   LeetCode 1070
-- Title:      Product Sales Analysis III
-- Difficulty: Medium
-- Link:       https://leetcode.com/problems/product-sales-analysis-iii/
-- Solved:     2026-10-09
-- Hint used:  no
-- Redo:       no
-- Pattern:    Derived table of first event per key (GROUP BY + MIN), then JOIN back on (key, min value) to fetch the full rows
-- Time:       O(n log n): group Sales for each product's first year, then join back on (product_id, year)
-- Space:      O(p) for the p first-year rows
-- Trap:       A product can have several sales rows in its first year and all of them must be returned; selecting quantity/price straight from the GROUP BY gives an arbitrary row's values
-- Dialect:    MySQL (accepted on LeetCode)

SELECT p.product_id, f.first_year, p.quantity, p.price
FROM
(SELECT product_id, MIN(year) As first_year
FROM Sales
GROUP BY product_id) AS f
JOIN Sales As p
ON p.product_id = f.product_id
AND p.year = f.first_year
