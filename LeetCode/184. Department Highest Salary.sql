with cte as (
select
e.name as Employee,
e.salary as Salary,
d.name as Department,
dense_rank() over(partition by d.name order by e.salary desc) as rnk
from employee e 
left join department d on d.id = e.departmentId
)

select 
Department, Employee, Salary
from cte where rnk = 1