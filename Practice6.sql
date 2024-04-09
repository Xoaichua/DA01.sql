Ex1
with new_table as 
(SELECT company_id, title, description, count(job_id) as job_count
FROM job_listings
group by company_id, title, description)
select count (company_id) as duplicate_companies from new_table
where job_count = 2
Ex2
Ex3
with new_table as
(select policy_holder_id, count(case_id) as case_count
from callers
group by policy_holder_id
having count(case_id) >=3)
select count(policy_holder_id)
from new_table
Ex4
select page_id from pages
where page_id not in (select page_id from page_likes
where page_id is not null)
Ex5
Ex6
Ex7
select product_id, year as first_year, quantity, price from sales
where (product_id, year) in (SELECT  product_id,  MIN(year) AS year 
FROM Sales 
GROUP BY product_id)
Ex8
SELECT  customer_id FROM Customer GROUP BY customer_id
HAVING COUNT(distinct product_key) = (SELECT COUNT(product_key) FROM Product)
Ex9
select employee_id
from Employees
where manager_id NOT IN (select employee_id from Employees) AND salary < 30000
Ex11
(select u.name as results from Users as u
join MovieRating as m
on u.user_id=m.user_id
group by u.name
order by count(rating) desc, name
limit 1)
union all
(SELECT b.title from Movies as b
join MovieRating as m
on b.movie_id=m.movie_id
where extract(month from created_at)=02 and extract(year from created_at)='2020'
group by m.movie_id
order by avg(rating) desc, b.title
limit 1)
Ex12
with ID_table as
((Select requester_id as id from RequestAccepted )
union all
(select accepter_id as id from RequestAccepted)) 
select id, count(id) as num
from ID_table
group by id
order by count(id) desc
limit 1

