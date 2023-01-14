WITH cte AS (
SELECT
DATE(measurement_time) AS datee,
ROW_NUMBER() OVER(PARTITION BY DATE(measurement_time) ORDER BY measurement_time) AS row_num,
*
FROM measurements)

SELECT 
datee,
SUM(CASE WHEN (row_num % 2 <> 0) THEN measurement_value END) AS odd_sum,
SUM(CASE WHEN (row_num % 2 = 0) THEN measurement_value END) AS even_sum
FROM cte
GROUP BY 1