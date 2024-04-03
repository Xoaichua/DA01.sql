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
