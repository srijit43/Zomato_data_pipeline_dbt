{{ config(materialized='view') }}

with restaurantcostscale as 
(
    select
        r.restaurant_id,
        restaurant_name,
        c.country,
        r.city,
        (r.avg_bill * c.conversion_rate) as INR_bill
    from
        {{ ref('restaurants_stg') }} as r
    left join
        {{ ref('countrylookup_stg') }} as c
    on
        r.country_code = c.country_code
)

select * from restaurantcostscale
