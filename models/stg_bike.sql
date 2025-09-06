with cte as(

select 
    RIDE_ID,
    REPLACE(started_at,'"','') as STARTED_AT,
    REPLACE(ENDED_AT,'"','')as ENDED_AT,
    START_STATION_NAME,
    START_STATION_ID,
    END_STATION_NAME,
    END_STATION_ID,
    START_LAT,
    START_LNG,
    END_LAT,
    END_LNG,
    MEMBER_CSUAL

from {{ source('demo', 'bike') }}
WHERE RIDE_ID !='"bikeid"' and RIDE_ID !='bikeid' and STARTED_AT!='"starttime"' and STARTED_AT!='starttime'
)

select *
from cte