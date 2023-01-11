select distinct sp.name from salesperson sp
left join orders o on o.sales_id = sp.sales_id
left join company c on c.com_id = o.com_id
where sp.sales_id not in (
select distinct sp.sales_id
from salesperson sp
left join orders o on o.sales_id = sp.sales_id
left join company c on c.com_id = o.com_id
where c.name in ('RED')
)