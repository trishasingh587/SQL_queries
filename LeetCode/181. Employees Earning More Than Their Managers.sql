select e.name as Employee
from employee e 
left join employee m on m.id = e.managerId
where e.salary > m.salary