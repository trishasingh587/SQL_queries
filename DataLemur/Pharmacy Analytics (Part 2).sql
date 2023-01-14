SELECT 
manufacturer,
COUNT(drug) AS no_of_drugs,
(SUM(cogs) - SUM(total_sales)) AS loss
FROM pharmacy_sales
WHERE (total_sales - cogs) < 0
GROUP BY 1
ORDER BY 3 DESC