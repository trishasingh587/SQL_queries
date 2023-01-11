with cte as (
select
id, num,
lag(num) over(order by id) as bef,
lead(num) over(order by id) as aft
from logs
)

select distinct num as ConsecutiveNums
from cte 
where num = bef 
and bef = aft