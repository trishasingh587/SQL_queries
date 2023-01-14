select user_id, extract(day from (max(post_date) - min(post_date)))
from posts where user_id in (
select user_id from posts 
where extract(year from post_date) = 2021
group by user_id
having count(*) > 1
order by user_id
)
group by 1
order by 1