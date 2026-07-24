SELECT
COUNT(*) AS neg_zero_trip_durations
  FROM `eng-skyline-475719-c2.Bikes_data.combined_bikes_data`
WHERE ended_at <= started_at;
