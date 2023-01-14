WITH cte AS (
SELECT
policy_holder_id,
call_received,
LAG(call_received) OVER(PARTITION BY policy_holder_id ORDER BY call_received) AS lagg
FROM callers
)

SELECT 
COUNT(DISTINCT policy_holder_id)
FROM cte
WHERE (EXTRACT(EPOCH FROM (call_received - lagg)) / 86400) <= 7