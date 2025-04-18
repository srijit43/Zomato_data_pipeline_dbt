{{ config(materialized = 'table')}}

with countrylookup_stg as (
Select
cc.country_code, cc.country, cy.currency, cy.conversion_rate
from
zomato.raw.zomato_country_code as cc
left join
zomato.raw.zomato_currency as cy
on
cc.country_code = cy.country_code
)

Select * from countrylookup_stg