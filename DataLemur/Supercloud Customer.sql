WITH cte AS (
SELECT customer_id, COUNT(DISTINCT product_category)
FROM customer_contracts c
LEFT JOIN products p ON p.product_id = c.product_id
GROUP BY 1
HAVING COUNT(DISTINCT product_category) >= 3
ORDER BY customer_id
)

SELECT COUNT(DISTINCT customer_id) FROM cte 