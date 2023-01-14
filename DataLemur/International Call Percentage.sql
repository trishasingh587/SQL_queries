SELECT
ROUND(100.0*COUNT(CASE WHEN pic.country_id <> pir.country_id THEN pc.caller_id END) / COUNT(*),1)
FROM phone_calls pc 
LEFT JOIN phone_info pic ON pic.caller_id = pc.caller_id
LEFT JOIN phone_info pir ON pir.caller_id = pc.receiver_id