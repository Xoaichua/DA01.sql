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
Ex3
