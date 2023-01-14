SELECT 
manufacturer,
CONCAT('$', ROUND(SUM(total_sales) / 1000000), ' million')
FROM pharmacy_sales
GROUP BY 1
ORDER BY CEIL(SUM(total_sales) / 1000000) DESC