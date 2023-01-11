with cte as (
select *,
dense_rank() over(order by salary desc) as rnk
from employee
)

select ifnull(
(select distinct salary
from cte where rnk = 2),null) as SecondHighestSalary 