with cte as(

    select 
        tf.*,
        dw.*
    from {{ ref('trip_fact') }} tf 
    left join {{ ref('daily_weather') }} dw 
    on tf.TRIP_DATE=dw.date_weather
)

select *
from cte