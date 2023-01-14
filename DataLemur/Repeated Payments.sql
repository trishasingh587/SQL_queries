WITH cte AS (
SELECT
merchant_id, credit_card_id, amount, transaction_timestamp,
LAG(transaction_timestamp) 
OVER(PARTITION BY merchant_id, credit_card_id, amount 
ORDER BY transaction_timestamp) AS lagg,
ROW_NUMBER() 
OVER(PARTITION BY merchant_id, credit_card_id, amount 
ORDER BY transaction_timestamp) AS row_num
FROM transactions
)

SELECT COUNT(merchant_id)
FROM cte 
WHERE row_num <> 1
AND (EXTRACT(EPOCH FROM (transaction_timestamp - lagg)) / 60) <= 10