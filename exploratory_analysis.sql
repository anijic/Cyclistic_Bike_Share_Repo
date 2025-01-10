## Exploratory Data Analysis (EDA)

## Trip Durations and Frequencies

## 1a. Average, Minimum, and Maximum Trip Durations by User Type
SELECT 
    member_casual, 
    AVG(ride_length_min) AS avg_length_min, 
    MIN(ride_length_min) AS min_length_min, 
    MAX(ride_length_min) AS max_length_min,
    COUNT(ride_id) AS total_rides
FROM bike_trips
GROUP BY member_casual;


## 1b. Distribution of Trip Durations 
SELECT 
    CASE 
        WHEN ride_length_min < 5 THEN '<5 min'
        WHEN ride_length_min BETWEEN 5 AND 15 THEN '5-15 min'
        WHEN ride_length_min BETWEEN 16 AND 30 THEN '16-30 min'
        WHEN ride_length_min BETWEEN 31 AND 60 THEN '31-60 min'
        ELSE '>60 min'
    END AS length_range,
    member_casual,
    COUNT(ride_id) AS total_rides
FROM bike_trips
GROUP BY length_range, member_casual
ORDER BY length_range;


## Seasonal, Daily, and Hourly Trends

## 2a. Daily Trends in Usage
SELECT 
    member_casual, 
    day_of_week, 
    COUNT(ride_id) AS total_rides
FROM bike_trips
GROUP BY member_casual, day_of_week
ORDER BY FIELD(day_of_week, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');


## 2b. Hourly Trends in Usage
SELECT 
    member_casual, 
    hour_of_day, 
    COUNT(ride_id) AS total_rides
FROM bike_trips
GROUP BY member_casual, hour_of_day
ORDER BY hour_of_day;


## 2c. Monthly Trends in Usage
SELECT 
    member_casual, 
    month, 
    COUNT(ride_id) AS total_rides
FROM bike_trips
GROUP BY member_casual, month
ORDER BY FIELD(month, 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');


## Usage Differences Between Casual Riders and Members

## 3a. Popular Starting Stations by User Type
SELECT 
    member_casual, 
    start_station_name, 
    COUNT(ride_id) AS total_rides
FROM bike_trips
GROUP BY member_casual, start_station_name
ORDER BY total_rides DESC
LIMIT 10;


## 3b. Popular Bike Types by User Type
SELECT 
    member_casual, 
    rideable_type, 
    COUNT(ride_id) AS total_rides
FROM bike_trips
GROUP BY member_casual, rideable_type
ORDER BY total_rides DESC;


## 3c. Average Ride Duration by Bike Type and User Type
SELECT 
    member_casual, 
    rideable_type, 
    AVG(ride_length_min) AS avg_length_min
FROM bike_trips
GROUP BY member_casual, rideable_type
ORDER BY avg_length_min DESC;