SELECT 
  ride_id,
  table_month
FROM cleaned_bike_data
WHERE ride_id IN (
  SELECT ride_id
  FROM cleaned_bike_data
  GROUP BY ride_id
  HAVING COUNT (*) > 1
)
ORDER BY ride_id
