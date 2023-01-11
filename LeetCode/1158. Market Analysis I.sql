select u.user_id as buyer_id, u.join_date, count(o.order_id) as orders_in_2019
from users u
left join orders o on o.buyer_id = u.user_id
and extract(year from o.order_date) = 2019
group by 1,2
order by 1