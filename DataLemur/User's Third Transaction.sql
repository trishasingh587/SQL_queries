WITH cte AS (
SELECT
*,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS row_num
FROM transactions
ORDER BY user_id, transaction_date ASC
)

SELECT user_id,	spend, transaction_date FROM cte WHERE row_num = 3