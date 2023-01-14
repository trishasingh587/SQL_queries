SELECT
age_bucket, 
round(100.0*((sum(case when activity_type = 'send' then time_spent end))/(sum(time_spent))),2) as sending_perc,
round(100.0*((sum(case when activity_type = 'open' then time_spent end))/(sum(time_spent))),2) as opening_perc
FROM activities a
left join age_breakdown ab on ab.user_id = a.user_id
where activity_type in ('open', 'send')
group by 1