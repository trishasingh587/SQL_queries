with cte as (
SELECT category, product, sum(spend) as spend, 
row_number() over(partition by category order by sum(spend) desc) as row_num
FROM product_spend
where extract(year from transaction_date) = 2022
group by 1,2
)

select category, product, spend 
from cte where row_num <= 2