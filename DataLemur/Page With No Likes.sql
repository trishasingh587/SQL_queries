select p.page_id from pages p
left join page_likes pl on pl.page_id = p.page_id
where pl.page_id is null