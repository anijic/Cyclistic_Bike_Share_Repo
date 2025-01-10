## Data Cleaning

##  1. Check for Null values
SELECT * FROM bike_trips
WHERE ride_id IS NULL
   OR rideable_type IS NULL
   OR started_at IS NULL
   OR ended_at IS NULL 
   OR start_station_name IS NULL
   OR start_station_id IS NULL
   OR end_station_name IS NULL
   OR end_station_id IS NULL
   OR start_lat IS NULL
   OR start_lng IS NULL
   OR end_lat IS NULL
   OR end_lng IS NULL
   OR member_casual IS NULL;


## 2a. Check for empty rows
SELECT count(*) FROM bike_trips
WHERE ride_id = ''
   OR rideable_type = ''
   OR started_at = ''
   OR ended_at = '' 
   OR start_station_name = ''
   OR end_station_name = ''
   OR start_lat = ''
   OR start_lng = ''
   OR member_casual = '';
   -- **Total Number of affected rows**
   -- **1626148**


## 2b. Delete empty rows
DELETE FROM bike_trips
WHERE ride_id = ''
   OR rideable_type = ''
   OR started_at = ''
   OR ended_at = '' 
   OR start_station_name = ''
   OR end_station_name = ''
   OR member_casual = '';


## 3a. Identify rows with extra spaces
SELECT *
FROM bike_trips
WHERE ride_id != TRIM(ride_id)
   OR rideable_type != TRIM(rideable_type)
   OR started_at != TRIM(started_at)
   OR ended_at != TRIM(ended_at)
   OR start_station_name != TRIM(start_station_name)
   OR end_station_name != TRIM(end_station_name)
   OR start_lat != TRIM(start_lat)
   OR start_lng != TRIM(start_lng)
   OR member_casual != TRIM(member_casual);


## 3b. Trim extra spaces
UPDATE bike_trips
SET ride_id = TRIM(ride_id),
    rideable_type = TRIM(rideable_type),
    started_at = TRIM(started_at),
    ended_at = TRIM(ended_at),
    start_station_name = TRIM(start_station_name),
    end_station_name = TRIM(end_station_name),
    member_casual = TRIM(member_casual);


## 4. Check for Duplicates
SELECT ride_id, COUNT(*) AS duplicate_count
FROM bike_trips
GROUP BY ride_id
HAVING COUNT(*) > 1;
-- No Duplicates found


## 5a. Date and Time Standardization
SELECT STR_TO_DATE(started_at, '%m/%d/%Y %H:%i') AS started_at_temp,
		STR_TO_DATE(ended_at, '%m/%d/%Y %H:%i') AS ended_at_temp
from bike_trips;


## 5b. Update table
UPDATE bike_trips 
SET started_at = STR_TO_DATE(started_at, '%m/%d/%Y %H:%i'),
    ended_at = STR_TO_DATE(ended_at, '%m/%d/%Y %H:%i');


##  5c. Convert to DATETIME 
ALTER TABLE bike_trips
MODIFY started_at DATETIME,
MODIFY ended_at DATETIME;


## 6a. Validate Trip Durations
SELECT ride_id, 
TIMESTAMPDIFF(MINUTE, started_at, ended_at) AS ride_length
FROM bike_trips 
WHERE TIMESTAMPDIFF(MINUTE, started_at, ended_at) <= 0;


##  6b. Remove rows with Zero or negative durations
DELETE from bike_trips 
WHERE TIMESTAMPDIFF(MINUTE, started_at, ended_at) <= 0;


## Add and populate calculated columns required for analysis.

## 7a. ride_length_min
ALTER TABLE bike_trips
ADD COLUMN ride_length_min INT;

UPDATE bike_trips
SET ride_length_min = TIMESTAMPDIFF(MINUTE, started_at, ended_at);


## 7b. day_of_week
ALTER TABLE bike_trips
ADD COLUMN day_of_week VARCHAR(10);

UPDATE bike_trips
SET day_of_week = DAYNAME(started_at);


## 7c. hour_of_day
ALTER TABLE bike_trips
ADD COLUMN hour_of_day INT;

UPDATE bike_trips
SET hour_of_day = HOUR(started_at);
    

## 7d. length_range
ALTER TABLE bike_trips
ADD COLUMN length_range VARCHAR(20);

UPDATE bike_trips
SET length_range = 
    CASE 
        WHEN ride_length_min < 5 THEN '<5 min'
        WHEN ride_length_min BETWEEN 5 AND 15 THEN '5-15 min'
        WHEN ride_length_min BETWEEN 16 AND 30 THEN '16-30 min'
        WHEN ride_length_min BETWEEN 31 AND 60 THEN '31-60 min'
        ELSE '>60 min'
    END;


## 7e. month 
ALTER TABLE bike_trips
ADD COLUMN month VARCHAR(10);

UPDATE bike_trips
SET month = MONTHNAME(started_at);
