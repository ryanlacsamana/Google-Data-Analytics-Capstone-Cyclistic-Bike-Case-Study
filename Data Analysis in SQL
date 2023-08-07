/* COMPARISON FOR NUMBER OF TRIPS FOR EACH MEMBER TYPE */

/* Number of trips for each bike type */

SELECT member_casual, rideable_type,
  COUNT(*) AS trip_per_biketype
FROM cyclistic_tripdata_202207_202306.cleaned_combined_tripdata
GROUP BY member_casual, rideable_type
ORDER BY member_casual, trip_per_biketype

/* Number of trips per month */

SELECT 
  CONCAT(month, " ", year) AS month_year, member_casual,
  COUNT(ride_id) AS total_trip_per_month
FROM cyclistic_tripdata_202207_202306.cleaned_combined_tripdata
GROUP BY month_year, member_casual
ORDER BY member_casual

/* Number of trips per day of week */

SELECT day_of_week, member_casual,
  COUNT(ride_id) AS total_trip_per_week
FROM cyclistic_tripdata_202207_202306.cleaned_combined_tripdata
GROUP BY day_of_week, member_casual
ORDER BY member_casual

/* Number of trips per hour */

SELECT
  EXTRACT(HOUR FROM started_at) AS hour_of_day,
  member_casual,
  COUNT(ride_id) AS total_trip_per_hour
FROM cyclistic_tripdata_202207_202306.cleaned_combined_tripdata
GROUP BY hour_of_day, member_casual
ORDER BY member_casual

/* COMPARISON FOR AVERAGE RIDE LENGTH FOR EACH MEMBER TYPE */

/* Average ride length per month */

SELECT 
  CONCAT(month, " ", year) AS month_year, member_casual,
  AVG(ride_length_mins) AS ave_ride_length_month
FROM cyclistic_tripdata_202207_202306.cleaned_combined_tripdata
GROUP BY month_year, member_casual
ORDER BY member_casual

/* Average ride length per day of week */

SELECT day_of_week, member_casual,
  AVG(ride_length_mins) AS ave_ride_length_week
FROM cyclistic_tripdata_202207_202306.cleaned_combined_tripdata
GROUP BY day_of_week, member_casual
ORDER BY member_casual

/* Average ride length per hour */

SELECT
  EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual,
  AVG(ride_length_mins) AS ave_ride_length_hour
FROM cyclistic_tripdata_202207_202306.cleaned_combined_tripdata
GROUP BY hour_of_day, member_casual
ORDER BY member_casual


/* DOCKING STATIONS PER MEMBER */

/* Start docking locations for annual members */

SELECT
  start_station_name,
  AVG(start_lat) AS start_lat, 
  AVG(start_lng) AS start_lng,
  COUNT (ride_id) AS num_of_rides
FROM cyclistic_tripdata_202207_202306.cleaned_combined_tripdata
WHERE member_casual = 'member'
GROUP BY start_station_name

/* End docking locations for annual members */

SELECT
  end_station_name,
  AVG(end_lat) AS end_lat, 
  AVG(end_lng) AS end_lng,
  COUNT (ride_id) AS num_of_rides
FROM cyclistic_tripdata_202207_202306.cleaned_combined_tripdata
WHERE member_casual = 'member'
GROUP BY end_station_name

/* Start docking locations for casual riders */

SELECT
  start_station_name,
  AVG(start_lat) AS start_lat, 
  AVG(start_lng) AS start_lng,
  COUNT (ride_id) AS num_of_rides
FROM cyclistic_tripdata_202207_202306.cleaned_combined_tripdata
WHERE member_casual = 'casual'
GROUP BY start_station_name

/* End docking locations for casual riders */

SELECT
  end_station_name,
  AVG(end_lat) AS end_lat, 
  AVG(end_lng) AS end_lng,
  COUNT (ride_id) AS num_of_rides
FROM cyclistic_tripdata_202207_202306.cleaned_combined_tripdata
WHERE member_casual = 'casual'
GROUP BY end_station_name
