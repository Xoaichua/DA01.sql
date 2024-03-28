Ex1
select 
Name
from STUDENTS
where Marks > 75
order by right(Name,3), ID
Ex2
select user_id,
concat(left(upper(name),1),right(lower(name),length(name)-1)) as name
from Users
order by user_id
Ex3
SELECT 
manufacturer,
'$'||round(sum(total_sales)/1000000,0)||' '||'million' as sale
FROM pharmacy_sales
group by manufacturer
order by sum(total_sales) desc, manufacturer
Ex4
SELECT extract(month from submit_date) as mth,
product_id as product,
round(avg(stars),2) as avg_stars
FROM reviews
group by product_id, extract(month from submit_date)
order by mth, product
Ex5
SELECT
sender_id,
count(message_id) as message_count
FROM messages
where extract(month from sent_date)=08 and extract(year from sent_date)=2022
group by sender_id
order by message_count desc
limit 2
Ex6
select 
tweet_id
from Tweets
where length(content)>15
Ex7
select
activity_date as day,
count(distinct user_id) as active_users
from Activity
where activity_date between '2019-06-27' and '2019-07-27'
Ex8
select  
count(id)
from employees
where joining_date between '2022-01-01'and '2022-07-31'
Ex9
select 
position('a' in first_name)
from worker
where first_name='Amitah'
Ex10
select 
substring(title from (length(winery)+2) for 4)
from winemag_p2
where country='Macedonia'
