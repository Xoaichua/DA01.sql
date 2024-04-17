Ex1
with yearly_spend_table as
(SELECT extract(year from transaction_date) as year, 
product_id, spend as curr_year_spend,
lag(spend) over (partition by product_id order by product_id,extract(year from transaction_date) asc) as prev_year_spend
FROM user_transactions)
select year, product_id,curr_year_spend,prev_year_spend,
round(100*(curr_year_spend-prev_year_spend)/prev_year_spend,2) as yoy_rate
from yearly_spend_table
Ex2
select card_name, issued_amount from
(SELECT card_name, issued_amount,
row_number() over(partition by card_name order by issued_amount) as rank
FROM monthly_cards_issued) as a
where rank =1
order by issued_amount desc
Ex3
select user_id, spend, transaction_date from 
(SELECT *,
row_number() over(partition by user_id order by transaction_date 
 asc) as rank
FROM transactions) as a
where rank=3
