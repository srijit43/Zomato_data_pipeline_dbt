{{ config(materialized = 'view')}}

with location_country_count as 
(
Select
country_code, count(*)
from
zomato.raw.restaurants_zomato
group by country_code
)

Select * from location_country_count