Ex1
select distinct CITY from STATION
where ID%2=0
Ex2
select count(CITY)-count(distinct CITY) from STATION
Ex4
select round(cast(sum(item_count*order_occurrences)/sum(order_occurrences) as Decimal),1) as mean 
from items_per_order
Ex5
SELECT candidate_id
FROM candidates
where skill IN('Python','Tableau','PostgreSQL')
group by candidate_id
having count(skill)=3
order by candidate_id asc
Ex7
SELECT card_name,
max(issued_amount)-min(issued_amount) as difference
FROM monthly_cards_issued
group by card_name
order by difference desc
Ex8
SELECT manufacturer,
count(drug) as drug_count,
abs(sum(total_sales-cogs)) as total_loss
FROM pharmacy_sales
where (total_sales-cogs) < 0
group by manufacturer
order by total_loss desc
Ex9
select * from Cinema
where id%2<>0 and description <> 'boring'
order by rating desc
Ex10
select teacher_id,
count(distinct subject_id) as cnt
from Teacher
group by teacher_id
Ex11
select user_id,
count(follower_id) as followers_count
from Followers
group by user_id
order by user_id asc
Ex12
select class
from Courses
group by class
having count(student)>=5
