with cte as (
    select 
    TO_TIMESTAMP(started_at) STARTED_AT,
    DATE(TO_TIMESTAMP(started_at)) DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(started_at)) HOUR_STARTED_AT,
    {{ day_type('started_at') }} DAY_TYPE,
    {{ get_season('started_at') }} STATION_OF_YEAR
    from {{ source('demo', 'bike') }}
    where started_at != 'started_at'
)
select * from cte
