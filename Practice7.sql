Ex1
with yearly_spend_table as
(SELECT extract(year from transaction_date) as year, 
product_id, spend as curr_year_spend,
lag(spend) over (partition by product_id order by product_id,extract(year from transaction_date) asc) as prev_year_spend
FROM user_transactions)
select year, product_id,curr_year_spend,prev_year_spend,
round(100*(curr_year_spend-prev_year_spend)/prev_year_spend,2) as yoy_rate
from yearly_spend_table
