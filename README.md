# Cyclistic Bike-Share Usage Analysis (2023-2024)

- Analyzing Cyclistic Bike-Share usage (2023-2024), using Excel,SQL and Tableau.

![Alt image](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Cyclistic%20Bike-Share%20Dashboard%202023-2024.png)

## **Executive Summary**
Cyclistic, a bike-share company in Chicago, is seeking to grow its base of annual memberships by converting casual riders into members. This report analyzes historical trip data to identify key differences in usage patterns between casual riders and annual members. Key findings reveal disparities in trip durations, time-of-use patterns, and bike preferences, such as:

1. Casual riders take longer trips (24.1 minutes on average) than members (12.5 minutes).
2. Members are consistent in commuting patterns, while casual riders peak on weekends.
3. Casual riders favor electric bikes and tourist hotspots as starting locations.

Recommendations focus on leveraging these trends to convert casual riders into members.

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
  - `ride_id`, `rideable_type`, `started_at`, `ended_at`, `start_station_name`, `start_station_id`, `end_station_name`, `end_station_id`, `start_lat`, `start_lng`, `end_lat`, `end_lng`, `member_casual`.
- **Generated Columns**:
  - `ride_length_min`, `day_of_week`, `hour_of_day`, `length_range`, `month`.

### **Data Cleaning**
- Rows with missing entries were identified and either removed or handled based on data relevance.
- Date and time fields are standardized to a consistent format, making it easier to calculate metrics like ride duration.
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

Tools used include SQL, Tableau, and Excel.

---

## **Analysis and Findings**

### **1. Trip Duration and Frequency**
- Casual riders have longer average trip durations (24.1 minutes) compared to members (12.5 minutes).
  
![Alt image](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Average%20Trip%20Duration%20by%20User%20Type.png).

- Casual riders dominate longer trips (>60 minutes), while members dominate shorter trips (5–15 minutes).

![Alt image](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Distribution%20of%20Trip%20Durations.png)

---

### **2. Seasonal, Daily, and Hourly Trends**
#### **Daily Usage**:
- Members are consistent during weekdays, peaking during commute hours.
- Casual riders peak on weekends.

![Alt image](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Daily%20Usage%20Trends.png)

#### **Hourly Usage**:
- Members peak in the morning (8 AM) and evening (5–6 PM), indicating commuting behavior.
- Casual riders peak midday, indicating leisure usage.


![Alt image](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Hourly%20Usage%20Trends.png)


- **Seasonal Trends:**  
  - Casual ridership surges during summer months (June–August).

  
![Alt image](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Monthly%20Trends.png)
  
---

### **3. Station and Geographic Insights**
- Popular starting locations for casual riders include tourist hotspots (e.g., Streeter Dr & Grand Ave).
- Members favor stations near commercial areas.

![Alt image](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Popular%20Starting%20Stations.png)

---

### **4. Bike Type Preferences**
- Members primarily use classic bikes, while casual riders have a higher preference for electric bikes.

![Alt image](https://github.com/anijic/Cyclistic_Bike_Share_Repo/blob/1f2b281cead983a77261a7eb996b91f49cb85485/Images/Bike%20Type%20Distribution.png)

---

## **Recommendations**
1. **Seasonal Campaigns**:
   - Target casual riders with summer campaigns and promotions that highlight the cost savings and flexibility of annual memberships while also offering discounts or incentives.
2. **Targeted Membership Campaigns**:
   - Focus on casual riders who frequently use bikes during weekends and off-peak hours.
   - Highlight benefits like unlimited rides and cost savings for shorter, frequent trips.
3. **Leverage Electric Bike Popularity**:
   - Emphasize cost savings, the convenience of electric bike access, and added flexibility for casual riders in marketing campaigns, especially at hotspots frequented by casual riders.


---

## **6. Conclusion**
This analysis highlights clear differences in usage patterns between casual riders and annual members, providing a foundation for Cyclistic’s marketing strategy. By focusing on leisure riders, targeting key locations, and promoting electric bike features, Cyclistic can drive membership growth and boost profitability.


---

## **References**
1. **Data Source**: Cyclistic trip data (publicly available) [here](https://divvy-tripdata.s3.amazonaws.com/index.html).  
2. **Tools Used**: SQL, Tableau, Excel.  
3. **Analysis Team**: Cyclistic marketing analytics.
