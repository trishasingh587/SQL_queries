with cte as (
select company_id, title, description, count(*)
from job_listings
group by 1,2,3
having count(*) > 1
)

select count(*) as co_w_duplicate_jobs
from cte