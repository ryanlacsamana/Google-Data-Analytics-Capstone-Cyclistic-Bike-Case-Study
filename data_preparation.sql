/* Checking for duplicate values in ride_id */

SELECT
  COUNT (DISTINCT(ride_id))
FROM cyclistic_tripdata_202207_202306.combined_tripdata

/* Checking if number of characters in ride_id is consistent */

SELECT
  LENGTH(ride_id)
FROM cyclistic_tripdata_202207_202306.combined_tripdata
GROUP BY LENGTH(ride_id)

/* Checking for null values in the table */

SELECT
  COUNT(*) - COUNT(ride_id) ride_id,
  COUNT(*) - COUNT(rideable_type) rideable_type,
  COUNT(*) - COUNT(started_at) started_at,
  COUNT(*) - COUNT(ended_at) ended_at,
  COUNT(*) - COUNT(start_station_name) start_station_name,
  COUNT(*) - COUNT(start_station_id) start_station_id,
  COUNT(*) - COUNT(end_station_name) end_station_name,
  COUNT(*) - COUNT(end_station_id) end_station_id,
  COUNT(*) - COUNT(start_lat) start_lat,
  COUNT(*) - COUNT(start_lng) start_lng,
  COUNT(*) - COUNT(end_lat) end_lat,
  COUNT(*) - COUNT(end_lng) end_lng,
  COUNT(*) - COUNT(member_casual) member_casual
FROM cyclistic_tripdata_202207_202306.combined_tripdata


/* Check if there are only 3 types of bike in the table */

SELECT DISTINCT(rideable_type)
FROM cyclistic_tripdata_202207_202306.combined_tripdata

/* Check if there are only 2 types of members in the table */

SELECT DISTINCT(member_casual)
FROM cyclistic_tripdata_202207_202306.combined_tripdata
