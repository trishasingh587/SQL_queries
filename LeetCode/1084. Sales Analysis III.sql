select distinct p.product_id, p.product_name
from sales s 
left join product p on p.product_id = s.product_id
where p.product_id not in (
    select distinct product_id from sales 
    where sale_date NOT BETWEEN '2019-01-01' and '2019-03-31'
)