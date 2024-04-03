Ex1 
SELECT 
sum(CASE
when device_type='laptop' then 1 else 0
end) as laptop_views,
sum(CASE
when device_type in ('tablet','phone') then 1 else 0
end) as mobile_views
FROM viewership
Ex2
select
*,
case
when (x+y>z and y+z>x and x+z>y) then 'Yes'
else 'No'
end as triangle
from Triangle
Ex3
SELECT 
ROUND(100.0 * COUNT(case_id)/COUNT(*) FROM callers),1) AS call_percentage
FROM callers
WHERE call_category IS NULL 
OR call_category = 'n/a'
Ex4
select name from Customer
where referee_id is null or referee_id<>2
Ex5
SELECT
survived,
sum(case
when pclass=1 then 1 else 0 end) as first_class,
sum(case
when pclass=2 then 1 else 0 end) as second_class,
sum(case
when pclass=3 then 1 else 0 end) as third_class
FROM titanic
group by survived
