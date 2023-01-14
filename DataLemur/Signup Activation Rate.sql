SELECT
round(1.0*(count(distinct case when signup_action = 'Confirmed' then user_id end))/ (count(distinct user_id)),2)
FROM emails e 
left join texts t on t.email_id = e.email_id