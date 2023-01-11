with cte as (
select
*, 
lag(temperature) over(order by recordDate) as temp1,
lag(recordDate) over(order by recordDate) as date1
from weather
)

select id from cte
where datediff(recordDate,date1) = 1
and temperature > temp1