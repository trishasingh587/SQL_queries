SELECT sender_id, count(message_id) 
FROM messages
where extract(month from sent_date) = 08
and extract(year from sent_date) = 2022
group by 1
order by 2 desc
limit 2