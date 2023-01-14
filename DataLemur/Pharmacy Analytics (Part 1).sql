SELECT
drug, total_sales - cogs
FROM pharmacy_sales
ORDER BY 2 DESC
LIMIT 3