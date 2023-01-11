with cte as (
select
*,
row_number() over(order by id) as row_num
from stadium
where people >= 100
)

select id, visit_date, people 
from cte where (id - row_num) in (
select (id - row_num) from cte 
group by 1 
having count(*) >= 3
)