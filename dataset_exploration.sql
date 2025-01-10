## Initial Dataset Exploration

## 1. Create Database and table
CREATE DATABASE cyclistic_db;

USE cyclistic_db;

## 2. Create table
CREATE TABLE bike_trips (
  ride_id VARCHAR(50),
  rideable_type VARCHAR(20),
  started_at VARCHAR(20),
  ended_at VARCHAR(20),
  start_station_name VARCHAR(100),
  start_station_id VARCHAR(20),
  end_station_name VARCHAR(100),
  end_station_id VARCHAR(20),
  start_lat DECIMAL(10, 7),
  start_lng DECIMAL(10, 7),
  end_lat DECIMAL(10, 7),
  end_lng DECIMAL(10, 7),
  member_casual VARCHAR(10)
);


## 3. upload csv files using command prompt (Repeat for all 12 files 2310.csv-2409.csv)
LOAD DATA local INFILE 'C:/Users/pc1/Desktop/Projects/Ride_Share/2409.csv'
INTO TABLE bike_trips
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


## 4. Summary of User Types:
SELECT member_casual, COUNT(*) AS total_rides
FROM bike_trips
GROUP BY member_casual;


## 5. Average and Total Ride Duration:
SELECT 
    member_casual, 
    AVG(TIMESTAMPDIFF(MINUTE, started_at, ended_at)) AS avg_duration_minutes, 
    SUM(TIMESTAMPDIFF(MINUTE, started_at, ended_at)) AS total_duration_minutes
FROM bike_trips
GROUP BY member_casual;


## 6.Most Popular Start Stations:
SELECT 
    start_station_name, 
    member_casual, 
    COUNT(*) AS ride_count
FROM bike_trips
GROUP BY start_station_name, member_casual
ORDER BY ride_count DESC
LIMIT 10;

## 7. Trips by Day of the Week:
SELECT 
    member_casual, 
    DAYNAME(started_at) AS day_of_week, 
    COUNT(ride_id) AS total_rides
FROM bike_trips
GROUP BY member_casual, day_of_week
ORDER BY FIELD(day_of_wk, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');


## 8. Popular Bike Types by User Type
SELECT 
    rideable_type,
    member_casual,
    COUNT(*) AS ride_count
FROM bike_trips
GROUP BY rideable_type, member_casual
ORDER BY ride_count DESC;
