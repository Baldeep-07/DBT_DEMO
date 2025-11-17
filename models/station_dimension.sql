with stations as(
    select 
    ride_id,
    start_station_name,
    start_statio_id,
    start_lat,
    start_lng
    from {{ source('demo', 'bike') }} 
    where ride_id !='ride_id'
)
select * from stations