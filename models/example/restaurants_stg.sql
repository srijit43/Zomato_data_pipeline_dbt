{{ config(materialized = 'table') }}

with restaurants_stg as (
    Select
    restaurant_id, restaurant_name, country_code, city, cuisines, average_cost_for_two as avg_bill, currency, has_online_delivery as delivery_flag,
    price_range, aggregate_rating as rating, votes

    from zomato.raw.restaurants_zomato   
)

Select * from restaurants_stg