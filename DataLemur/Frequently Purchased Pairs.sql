with cte as (
SELECT t.transaction_id, t.product_id, p.product_name
FROM transactions t 
left join products p on t.product_id = p.product_id
order by 1,2
)

select 
count(*)
from cte c1 
inner join cte c2 on c1.transaction_id = c2.transaction_id 
and c1.product_id < c2.product_id