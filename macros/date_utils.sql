{% macro get_season(x) %}
    CASE when month(TO_TIMESTAMP({{x}})) in (12,1,2)
        THEN 'WINTER'
        when month(TO_TIMESTAMP({{x}})) in (3,4,5)
        THEN 'SPRING'
        when month(TO_TIMESTAMP({{x}})) in (6,7,8)
        THEN 'SUMMER'
        ELSE 'AUTUMN'
        END AS STATION_OF_YEAR
{% endmacro %}

{% macro get_day(x) %}
        CASE 
        WHEN DAYNAME(TO_TIMESTAMP({{x}})) in ('Sat','Sun')
        THEN 'WEEKEND'
        ELSE 'BUSINESSDAY'
        END 
{% endmacro %}