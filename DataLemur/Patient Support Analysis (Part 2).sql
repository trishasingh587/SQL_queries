SELECT 
ROUND(100.0*COUNT(CASE WHEN (call_category IS NULL) OR (call_category = 'n/a') THEN case_id END) / COUNT(case_id),1)
FROM callers;