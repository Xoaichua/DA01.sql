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
Ex4
with new_table as
(SELECT transaction_date, user_id, product_id,
rank() over (partition by user_id order by transaction_date desc) as rank
FROM user_transactions) 
select transaction_date, user_id, count(product_id) as purchase_count
from new_table
where rank=1
group by transaction_date, user_id
Ex5, neeed help
with new_table as
(SELECT user_id, tweet_date, tweet_count,
lag(tweet_count) over (partition by user_id) as lag1,
lag(tweet_count, 2) over (partition by user_id) as lag2
FROM tweets)
select 
user_id, tweet_date,
round((cast(tweet_count+lag1+lag2) as decimal/(1 + case when lag1!=0 then 1 else 0 end + case when lag2!=0 then 1 else 0 end)),2) as rolling_avg_3d
from new_table
Ex6
with new_table as
(SELECT merchant_id,credit_card_id, amount, 
(transaction_timestamp-lag(transaction_timestamp) over(partition by merchant_id, credit_card_id, amount order by transaction_timestamp)) as mins
FROM transactions)
select count(*) as payment_count
from new_table 
where mins <= '00:10:00'
Ex7
with new_table AS
(SELECT category, product, 
sum(spend) as total_spend,
row_number() over (partition by category order by sum(spend) desc) as rank
FROM product_spend
where extract(year from transaction_date)=2022
group by category, product)
select category, product, total_spend
from new_table
where rank =1 or rank=2
Ex8
with new_table as
(SELECT a.artist_name,
dense_rank() over (order by count(b.song_id) desc) as artist_rank
FROM artists AS a
join songs as b on a.artist_id=b.artist_id
join global_song_rank as c on b.song_id=c.song_id
where c.rank <=10
group by a.artist_name)
select artist_name, artist_rank
from new_table
where artist_rank <=5

