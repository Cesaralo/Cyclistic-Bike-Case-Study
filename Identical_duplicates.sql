SELECT
    ride_id,
    table_month,
    started_at,
    ended_at,
    start_station_name,
    rideable_type
FROM combined_bikes_data
WHERE ride_id IN (
    SELECT ride_id
    FROM cleaned_bike_data
    GROUP BY ride_id
    HAVING COUNT(*) > 1
)
ORDER BY ride_id;
