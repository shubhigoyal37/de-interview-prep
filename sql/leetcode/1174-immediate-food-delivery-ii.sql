-- Platform:   LeetCode 1174
-- Title:      Immediate Food Delivery II
-- Difficulty: Medium
-- Link:       https://leetcode.com/problems/immediate-food-delivery-ii/
-- Solved:     2026-10-04
-- Hint used:  yes
-- Redo:       yes
-- Pattern:    Derived table of first event per key, then LEFT JOIN back with the condition in ON; COUNT(matched) / COUNT(all) gives the percentage
-- Time:       O(n log n): group Delivery for each customer's first order, then join each customer back on (customer_id, order_date)
-- Space:      O(c) for the c first-order rows
-- Trap:       Only the customer's FIRST order counts, not every order; keep the immediate check in ON so non-immediate customers stay in the denominator with a NULL match
-- Dialect:    MySQL (accepted on LeetCode)

SELECT ROUND(COUNT(i.order_date) / COUNT(f.first_date) * 100, 2) AS immediate_percentage
FROM (
    SELECT customer_id, MIN(order_date) AS first_date
    FROM Delivery
    GROUP BY customer_id
) AS f
LEFT JOIN Delivery AS i
       ON i.customer_id = f.customer_id
      AND i.order_date  = f.first_date
      AND i.order_date  = i.customer_pref_delivery_date;
