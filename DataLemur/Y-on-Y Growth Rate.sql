WITH cte AS (
SELECT
EXTRACT(YEAR FROM transaction_date) AS YEAR,
product_id,
spend,
LAG(spend, 3) OVER(ORDER BY EXTRACT(YEAR FROM transaction_date), product_id) AS prev_year_spend
FROM user_transactions
ORDER BY transaction_date, product_id
)

SELECT *, ROUND(100.0*(spend - prev_year_spend)/prev_year_spend,2) 
FROM cte
ORDER BY product_id, year