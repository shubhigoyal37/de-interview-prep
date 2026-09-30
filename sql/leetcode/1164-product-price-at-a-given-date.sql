-- Platform:   LeetCode 1164
-- Title:      Product Price at a Given Date
-- Difficulty: Medium
-- Link:       https://leetcode.com/problems/product-price-at-a-given-date/
-- Solved:     2026-09-30
-- Hint used:  yes
-- Redo:       no
-- Pattern:    Latest row per group as of a date (tuple IN on (key, MAX(date))) + LEFT JOIN from all keys with COALESCE default
-- Time:       O(n log n): group rows up to the cutoff for each product's latest date, then join back to all distinct products
-- Space:      O(n) for the distinct product list and latest-price rows
-- Trap:       Products whose first change is after 2019-08-16 have no row before the cutoff; start from ALL distinct products and COALESCE to 10, or they disappear
-- Dialect:    MySQL (accepted on LeetCode)

SELECT p.product_id,
       COALESCE(l.price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) AS p       
LEFT JOIN (
    SELECT product_id, new_price AS price
    FROM Products
    WHERE (product_id, change_date) IN (
        SELECT product_id, MAX(change_date)                         
        FROM Products
        WHERE  change_date <= '2019-08-16'                                      
        GROUP BY product_id
    )
) AS l ON l.product_id = p.product_id;
