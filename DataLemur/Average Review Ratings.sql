SELECT extract(month from submit_date), product_id, round(avg(stars),2)
FROM reviews
group by 1,2
order by 1,2