SELECT
EXTRACT(MONTH FROM event_date),
COUNT(DISTINCT user_id) AS monthly_active_users
FROM user_actions
WHERE user_id IN (SELECT
DISTINCT user_id
FROM user_actions
WHERE EXTRACT(MONTH FROM event_date) = 6)
AND EXTRACT(MONTH FROM event_date) = 7
GROUP BY 1