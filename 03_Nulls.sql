SELECT
    COUNT(*) AS total_rows,
    COUNTIF(end_lng IS NULL) AS null_end_lng,
    COUNTIF(end_lat IS NULL) AS null_end_lat,
    COUNTIF(start_lng IS NULL) AS null_start_lng,
    COUNTIF(start_lat IS NULL) AS null_start_lat
FROM `eng-skyline-475719-c2.Bikes_data.combined_bikes_data`;
