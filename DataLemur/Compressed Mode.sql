with cte as (
select item_count, mode() within group (order by order_occurrences) as mode_1
from items_per_order
group by 1
order by 2 desc
limit 2
)

select item_count from cte