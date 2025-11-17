With CTE AS (
    SELECT 
    TO_TIMESTAMP(STARTED_AT) started_at,
    DATE(TO_TIMESTAMP(STARTED_AT)) DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) HOUR_STARTED_AT,
    {{get_day('STARTED_AT')}} AS DAY_TYPE,
    {{get_season('STARTED_AT')}} as Season_type
    FROM {{ source('demo', 'bike') }}
    where started_at!='started_at'
)
select * from cte