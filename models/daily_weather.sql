with daily_weather as
(
    select 
     date(time) as date_weather,
     weather,
     temp,
     pressure,
     humidity,
     clouds
    from {{source ('demo','weather')}}
),
daily_weather_agg as(
    select 
        date_weather,
        weather,
        round(avg(temp),2) as avg_tmep,
        round(avg(humidity),2) as avg_humidity,
        round(avg(pressure),2) as avg_pressure,
        round(avg(clouds),2) as avg_clouds
    from daily_weather
    group by date_weather,weather
    QUALIFY ROW_NUMBER() OVER (PARTITION BY date_weather ORDER BY count(weather) desc)=1
)



SELECT *
FROM daily_weather_agg