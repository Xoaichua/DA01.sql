Ex1
select COUNTRY.Continent, floor(avg(CITY.Population))
from COUNTRY 
inner join CITY on COUNTRY.Code = CITY.CountryCode
group by COUNTRY.Continent
Ex2
SELECT round(cast(count(t.email_id) as decimal)/count(distinct e.email_id),2) as confirm_rate
FROM emails as e
left join texts as t 
on e.email_id=t.email_id
and t.signup_action='Confirmed'
Ex4
SELECT 
customer_id
FROM customer_contracts as c
JOIN products p on c.product_id=p.product_id
group by customer_id
having COUNT(DISTINCT product_category) =
(SELECT COUNT(DISTINCT product_category) FROM products)
Ex5
SELECT 
 reports_to AS employee_id,  
 (SELECT  name  
 FROM  employees e1 
  WHERE  e.reports_to = e1.employee_id ) AS name,  
 COUNT(reports_to) AS reports_count, ROUND( AVG(age)) AS average_age 
 FROM employees e 
 GROUP BY reports_to 
 HAVING reports_count > 0 
 ORDER BY employee_id
Ex6
select product_name, sum(unit) as unit from Orders as o 
left join Products as p
on o.product_id = p.product_id 
where order_date between '2020-02-01' and '2020-02-29'
group by o.product_id 
having sum(unit) >= 100 
Ex7
SELECT p.page_id
FROM pages as p  
left join page_likes as l
on p.page_id=l.page_id
where liked_date is null
order by p.page_id asc
