with cte as (
SELECT a.user_id, a.status, d.paid
FROM advertiser a 
left join daily_pay d on d.user_id = a.user_id
UNION
SELECT d.user_id, a.status, d.paid
FROM daily_pay d
left join advertiser a on d.user_id = a.user_id
)

select user_id,
case when paid is null then 'CHURN' 
when status = 'CHURN' then 'RESURRECT'
when status is null then 'NEW'
else 'EXISTING'
end as new_status
from cte
order by 1