with cte as (
SELECT user_id, tweet_date, count(*) as value
FROM tweets
group by 1,2
order by user_id, tweet_date
)

select user_id, tweet_date, 
round(avg(value) over(partition by user_id 
                order by tweet_date
                rows between 2 preceding and current row),2) as output
from cte