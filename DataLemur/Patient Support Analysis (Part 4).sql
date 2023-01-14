WITH cte AS (
SELECT 
EXTRACT(YEAR FROM call_received) AS yr,
EXTRACT(MONTH FROM call_received) AS mo,
COUNT(*) AS curr,
LAG(COUNT(*)) OVER(ORDER BY EXTRACT(MONTH FROM call_received)) AS prev
FROM callers
WHERE call_duration_secs >= 300
GROUP BY 1,2
ORDER BY 1,2
)

SELECT
yr, mo,
ROUND(100.0*(curr - prev)/prev,1) AS growth_pct
FROM cte 