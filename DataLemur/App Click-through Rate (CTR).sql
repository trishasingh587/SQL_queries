SELECT
app_id,
round(100.0*(count(case when event_type = 'click' then app_id end)) / 
(count(case when event_type = 'impression' then app_id end)),2) as ctr
FROM events
where date_part('year', timestamp) = 2022
group by 1
