SELECT
    started_at,
    ended_at,
    start_station_name,
    end_station_name
FROM `eng-skyline-475719-c2.Bikes_data.combined_bikes_data`
WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) < 60
  AND start_station_name = end_station_name;
