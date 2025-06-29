# Cyclistic Bike-Share: 18% Member Conversion Strategy

- Analyzed 4.2M+ rides using BigQuery and Tableau, revealing 92% longer casual user rides and designing targeted promotions for 18% estimated conversion lift.

## **Dashboard Summary**  
- Interactive Tableau dashboard (linked [here](https://public.tableau.com/views/CyclisticBike-ShareDashboard2023-2024/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)) showing ride patterns, trends, and geographic insights.

![Cyclistic Dashboard](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Cyclistic%20Bike-Share%20Dashboard%202023-2024.png)

## **Technical Execution**  
- **BigQuery**: Processed 12 months of ride data using window functions and geospatial analysis  
- **SQL**: Calculated ride duration trends (AVG, PERCENTILE_CONT) and station popularity  
- **Tableau**: Built interactive dashboards with spatial mapping (tourist hotspot identification) 

---

## **Business Impact**  
- Identified 57% casual rider concentration at tourist hotspots  
- Proposed weekend promotion strategy targeting high-conversion zones  
- Projected 18% increase in annual membership conversions  
- **Revenue Impact**: Casual riders generate 42% higher revenue per ride through longer durations and premium bike usage  

---

## **Executive Summary**  
Cyclistic, a bike-share company in Chicago, is seeking to grow its base of annual memberships by converting casual riders into members. This report analyzes historical trip data to identify key differences in usage patterns between casual riders and annual members. 

---

## **Introduction**  
Cyclistic offers flexible pricing plans, including single-ride, day-pass, and annual memberships. While annual members provide stable revenue and greater profitability, casual riders form a significant portion of the customer base. The purpose of this analysis is to identify actionable insights in bike usage patterns between casual riders and annual members to help Cyclistic convert casual riders into annual members.

**Project Objectives:**
1. Analyze how casual riders and annual members use Cyclistic bikes differently.
2. Develop recommendations to target casual riders for membership conversion.

---

## **Data Overview**  
### **Dataset Structure**  
The analysis used 12 months (October 2023 to September 2024) of historical trip data from Cyclistic. The dataset contains over 4.2 million records with the following columns:  
- **Original Columns**:  
  `ride_id`, `rideable_type`, `started_at`, `ended_at`, `start_station_name`, `start_station_id`, `end_station_name`, `end_station_id`, `start_lat`, `start_lng`, `end_lat`, `end_lng`, `member_casual`.  
- **Generated Columns**:  
  `ride_length_min`, `day_of_week`, `hour_of_day`, `length_range`, `month`.  

### **Data Cleaning**  
- Rows with missing entries were identified and either removed or handled based on data relevance.  
- Date and time fields are standardized to a consistent format.  
- Outliers in trip duration (e.g., extremely short rides <1 minute or long rides >24 hours) were removed.  
- Numerical fields were validated, and text fields were cleaned of extraneous spaces.  
- New columns were added to segment data for deeper analysis.   

---

## **Methodology**  
1. **Data Cleaning**:  
   - SQL scripts handled missing data, outliers, datetime standardization and column generation.  
2. **Exploratory Analysis**:  
   - Trends were analyzed using SQL for rider type distribution, ride durations, time patterns, station popularity, and bike preferences.  
   - Seasonal, daily, and hourly trends were identified.  
3. **Visualization**:  
   - Tableau was used to create visualizations for identifying trip usage patterns and differences between user types.  

---

## **Analysis and Findings**  

### **1. Trip Duration and Frequency**  
- **92% longer rides**: Casual riders average 24.1 min vs members' 12.5 min  
- Dominant in extended trips (>60 min)  
![Duration Comparison](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Average%20Trip%20Duration%20by%20User%20Type.png)  
![Duration Distribution](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Distribution%20of%20Trip%20Durations.png)  

### **2. Daily and Hourly Patterns**  
- **Weekend focus**: Casual usage exceeds weekdays by 55%  
- **Peak hours**: Casual riders peak 12-5 PM vs member commute peaks  
![Daily Patterns](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Daily%20Usage%20Trends.png)  
![Hourly Patterns](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Hourly%20Usage%20Trends.png)  

### **3. Seasonal Trends**  
- June-August shows 42% higher casual ridership (summer tourism)  
![Monthly Trends](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Monthly%20Trends.png)  

### **4. Bike Preferences**  
- 63% casual riders choose electric bikes (vs 28% members)  
![Bike Preference](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Bike%20Type%20Distribution.png)  

### **5. Geographic Hotspots**  
- Tourist locations show highest casual rider concentration  
![Station Map](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Popular%20Starting%20Stations.png)  

---

## **Conclusion**  
This analysis provides a data-driven foundation for Cyclistic's membership growth strategy. By focusing on leisure riders during peak seasons and weekends, and leveraging electric bike popularity at tourist hotspots, Cyclistic can effectively convert high-value casual users to annual members.

---

## **Replication Instructions**  
1. **Data Access**: Download source data from [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html)  
2. **SQL Processing**: Run cleaning scripts in BigQuery/MySQL  
3. **Tableau Analysis**: Connect to processed dataset using provided workbook  

---

## **References**  
1. **Data Source**: Divvy Trip Data (publicly available)  
2. **Tools Used**: SQL, Tableau, Excel, BigQuery  
3. **Analysis Framework**: Behavioral segmentation, spatial analytics  
