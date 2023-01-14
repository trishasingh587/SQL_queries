SELECT city, COUNT(distinct order_id) AS total_orders
FROM users u 
LEFT JOIN trades t on t.user_id = u.user_id
WHERE status = 'Completed'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;