with cte as (
select date(transaction_date) as order_date, user_id, count(product_id) as purchase_count,
row_number() over(partition by user_id order by date(transaction_date) desc) as row_num
from user_transactions
group by 1,2
order by user_id
)

select order_date, user_id, purchase_count 
from cte 
where row_num = 1 order by order_date