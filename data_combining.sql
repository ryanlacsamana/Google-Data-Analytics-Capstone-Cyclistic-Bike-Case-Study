/* Combination of Trip Data from July 2022 to June 2023 */

CREATE TABLE cyclistic_tripdata_202207_202306.combined_tripdata AS (
  SELECT * FROM `cyclistic_tripdata_202207_202306.202207_tripdata`
  UNION ALL
  SELECT * FROM `cyclistic_tripdata_202207_202306.202208_tripdata`
  UNION ALL
  SELECT * FROM `cyclistic_tripdata_202207_202306.202209_tripdata`
  UNION ALL
  SELECT * FROM `cyclistic_tripdata_202207_202306.202210_tripdata`
  UNION ALL
  SELECT * FROM `cyclistic_tripdata_202207_202306.202211_tripdata`
  UNION ALL
  SELECT * FROM `cyclistic_tripdata_202207_202306.202212_tripdata`
  UNION ALL
  SELECT * FROM `cyclistic_tripdata_202207_202306.202301_tripdata`
  UNION ALL
  SELECT * FROM `cyclistic_tripdata_202207_202306.202302_tripdata`
  UNION ALL
  SELECT * FROM `cyclistic_tripdata_202207_202306.202303_tripdata`
  UNION ALL
  SELECT * FROM `cyclistic_tripdata_202207_202306.202304_tripdata`
  UNION ALL
  SELECT * FROM `cyclistic_tripdata_202207_202306.202305_tripdata`
  UNION ALL
  SELECT * FROM `cyclistic_tripdata_202207_202306.202306_tripdata`
)
