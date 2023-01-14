select
count(case when device_type = 'laptop' then user_id end) as laptop_views,
count(case when device_type in ('phone', 'tablet') then user_id end) as mobile_views
from viewership;