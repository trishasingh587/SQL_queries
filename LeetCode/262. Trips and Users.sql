select
request_at as Day,
round(count(distinct case when status in ('cancelled_by_driver', 'cancelled_by_client') then t.id end) / count(distinct t.id),2) as 'Cancellation Rate'
from trips t 
left join users cli on cli.users_id = t.client_id 
left join users dri on dri.users_id = t.driver_id
where cli.banned = 'No' and dri.banned = 'No'
group by 1