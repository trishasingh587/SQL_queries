WITH cte AS (
SELECT order_occurrences, (item_count*order_occurrences) AS total_items
FROM items_per_order)

SELECT ROUND(((SUM(total_items)*1.0)/(SUM(order_occurrences)*1.0)),1)
FROM cte