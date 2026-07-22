CREATE OR REPLACE TABLE `eng-skyline-475719-c2.Bikes_data.combined_bikes_data` AS
SELECT * FROM `eng-skyline-475719-c2.Bikes_data.trips_2025_06`
UNION ALL
SELECT * FROM `eng-skyline-475719-c2.Bikes_data.trips_2025_07`
UNION ALL
SELECT * FROM `eng-skyline-475719-c2.Bikes_data.trips_2025_08`
UNION ALL
SELECT * FROM `eng-skyline-475719-c2.Bikes_data.trips_2025_09`
UNION ALL
SELECT * FROM `eng-skyline-475719-c2.Bikes_data.trips_2025_10`
UNION ALL
SELECT * FROM `eng-skyline-475719-c2.Bikes_data.trips_2025_11`
UNION ALL
SELECT * FROM `eng-skyline-475719-c2.Bikes_data.trips_2025_12`
UNION ALL
SELECT * FROM `eng-skyline-475719-c2.Bikes_data.trips_2026_01`
UNION ALL
SELECT * FROM `eng-skyline-475719-c2.Bikes_data.trips_2026_02`
UNION ALL
SELECT * FROM `eng-skyline-475719-c2.Bikes_data.trips_2026_03`
UNION ALL
SELECT * FROM `eng-skyline-475719-c2.Bikes_data.trips_2026_04`
UNION ALL
SELECT * FROM `eng-skyline-475719-c2.Bikes_data.trips_2026_05`;
