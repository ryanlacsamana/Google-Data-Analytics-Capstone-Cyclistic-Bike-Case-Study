/* Creating a table with cleaned data */

CREATE TABLE cyclistic_tripdata_202207_202306.cleaned_combined_tripdata AS (
SELECT
  ride_id, rideable_type, started_at, ended_at,
  CASE EXTRACT(DAYOFWEEK FROM started_at)
    WHEN 1 THEN 'SUN'
    WHEN 2 THEN 'MON'
    WHEN 3 THEN 'TUE'
    WHEN 4 THEN 'WED'
    WHEN 5 THEN 'THU'
    WHEN 6 THEN 'FRI'
    WHEN 7 THEN 'SAT'
  END AS day_of_week,
  CASE EXTRACT(MONTH FROM started_at)
    WHEN 1 THEN 'JAN'
    WHEN 2 THEN 'FEB'
    WHEN 3 THEN 'MAR'
    WHEN 4 THEN 'APR'
    WHEN 5 THEN 'MAY'
    WHEN 6 THEN 'JUN'
    WHEN 7 THEN 'JUL'
    WHEN 8 THEN 'AUG'
    WHEN 9 THEN 'SEP'
    WHEN 10 THEN 'OCT'
    WHEN 11 THEN 'NOV'
    WHEN 12 THEN 'DEC'
  END AS month,
  EXTRACT(YEAR FROM started_at) AS year,
  TIMESTAMP_DIFF(ended_at,started_at,MINUTE) AS ride_length_mins,
  start_station_name, end_station_name, start_lat, start_lng, end_lat, end_lng, member_casual
FROM cyclistic_tripdata_202207_202306.combined_tripdata
WHERE
  start_station_name IS NOT NULL AND
  end_station_name IS NOT NULL AND
  start_lat IS NOT NULL AND
  start_lng IS NOT NULL AND
  end_lat IS NOT NULL AND
  end_lng IS NOT NULL
)
