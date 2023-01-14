WITH cte AS 
(SELECT
*, ROW_NUMBER() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) AS row_num
FROM monthly_cards_issued
ORDER BY card_name, issue_year, issue_month)

SELECT card_name, issued_amount FROM cte WHERE row_num = 1 ORDER BY issued_amount DESC