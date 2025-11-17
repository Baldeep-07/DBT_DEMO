with daily_weather as (
    select date(time) weather_date,
    weather,
    humidity,
    pressure,
    temp,
    clouds
    from {{ source('demo', 'weather') }} 
),
daily_weather_agg as(
    select weather_date,
    weather,
    round(avg(clouds),2) clouds,
    round(avg(humidity),2) humidity,
    round(avg(pressure),2) pressure,
    round(avg(temp),2) temperature
    from daily_weather
    GROUP BY WEATHER_DATE,WEATHER
    QUALIFY ROW_NUMBER() OVER(PARTITION BY WEATHER_DATE ORDER BY COUNT(WEATHER) DESC) =1 
)

select * from daily_weather_agg