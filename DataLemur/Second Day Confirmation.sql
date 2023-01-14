select user_id
from emails e 
left join texts t on t.email_id = e.email_id
where signup_action	= 'Confirmed'
and extract(day from (action_date - signup_date)) = 1
order by user_id