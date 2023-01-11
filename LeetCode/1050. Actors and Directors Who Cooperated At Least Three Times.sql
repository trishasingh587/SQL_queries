with cte as (
select *,
row_number() over(partition by actor_id, director_id order by timestamp) as row_num
from ActorDirector
)

select distinct actor_id, director_id from cte where row_num >= 3