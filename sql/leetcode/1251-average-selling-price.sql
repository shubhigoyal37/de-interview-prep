-- Platform:   LeetCode 1251
-- Title:      Average Selling Price
-- Difficulty: Easy
-- Link:       https://leetcode.com/problems/average-selling-price/
-- Solved:     2026-09-30
-- Hint used:  yes
-- Redo:       no
-- Pattern:    Range join (LEFT JOIN on key + BETWEEN dates) + weighted average SUM(x*w)/SUM(w)
-- Time:       O((p + u) log(p + u)): join each sale to its price period on product_id, then group per product
-- Space:      O(p + u) for the joined rows and product groups
-- Trap:       Put the BETWEEN date condition in ON, not WHERE, or products with no sales get dropped; COALESCE turns their NULL average into 0
-- Dialect:    MySQL (accepted on LeetCode)

SELECT
p.product_id,
ROUND(COALESCE(SUM(p.price * u.units)/SUM(u.units),0),2) AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS u ON u.product_id = p.product_id AND u.purchase_date BETWEEN p.start_date AND p.end_date   
GROUP BY p.product_id
