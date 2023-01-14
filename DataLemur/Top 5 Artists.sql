with cte as (
SELECT a.artist_name,
dense_rank() over(order by count(*) desc) as rnk
FROM artists a 
left join songs s on s.artist_id = a.artist_id
left join global_song_rank g on g.song_id = s.song_id
where rank <= 10
group by 1
)

select * from cte where rnk <=5
