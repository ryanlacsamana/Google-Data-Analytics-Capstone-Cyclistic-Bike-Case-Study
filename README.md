# Google Data Analytics Capstone: Cyclistic Bike Case Study
This is a requirement for Google Data Analytics Specialization Certificate, conducted by Google

### Background
Cyclistic is a bike-sharing company that offers more than 5,800 bicycles and 600 docking stations. Aside from the standard two-wheeled bike, Cyclistic also offers assistive options such as reclining bikes, hand tricycle, and cargo bikes, which considers users with disabilities and those who can’t use a standard two-wheeled bike. The riders using the assistive options make up the 8% of the total riders.

Customers are categorized into casual riders and annual members. Casual riders involve customers who purchase single-ride or full-day passes, while annual members purchase annual memberships.

For this case study, I am assuming the position of a Junior Data Analyst at Cyclistic. I am tasked with analyzing the data from casual riders and annual members to provide insights and recommendations that will help the team in designing a new marketing strategy aimed at converting casual riders into annual members.

### Ask
The business task is to provide a new marketing strategy aimed to convert casual riders into annual members.
The following questions will guide the future marketing program:

1.	How do annual members and casual riders use Cyclistic bikes differently?
2.	Why would casual riders buy Cyclistic annual memberships?
3.	How can Cyclistic use digital media to influence casual riders to become members?
    
To help them devise a new marketing strategy, the director of marketing assigned me to answer the first question, <b>“How do annual members and casual riders use Cyclistic bikes differently?”</b>

### Prepare
As a preparation for the analysis, I downloaded the historical bike trip data which includes data from the previous 12 months. The data is downloaded at [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) and includes data from July 2022 to June 2023, which is the most recent data. The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement). The data is also provided in the official website of Divvy Bikes.
The data is organized by the following:
    
1.	The downloaded data are stored in a ZIP folder which includes a CSV file of the bike trip data. 
2.	To store the data, a new folder is created to store the CSV file of 12 bike trip data. 
3.	The filename uses a clear and standard file naming convention of YYYYMM-divvy-tripdata.
4.	Upon checking the columns in each spreadsheet, no personal information are included.
5.	Per the [Divvy Bikes](https://divvybikes.com/system-data) website, trips taken by staff for service and inspection, and trips below 60 seconds in length are not included in the data.

### Process
Each spreadsheet file contains 13 columns and varying number of rows. The combined number of rows is 5,779,444 (excluding headers) which is more than the maximum number of rows a spreadsheet can hold, which is 1,048,576. Therefore, I will be using <b>SQL</b> on <b>Google Cloud BigQuery</b> to combine and clean the data.

#### [Data Combining](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/blob/main/Data%20Combining%20in%20SQL)
1.	In BigQuery, created a dataset named “cyclistic_tripdata_202207_202306”
2.	Uploaded the 12 CSV files as tables and named as YYYYMM_tripdata, where the table contains trip data from July 2022 to June 2023.
3.	Combined 12 tables into one table “combined_tripdata”. The table contains 13 columns/fields and 5,779,444 rows, which matches the total rows from 12 spreadsheet files.

![Screenshot 2023-08-08 135150](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/assets/138304188/1e3f256f-922f-49dd-ad12-e303201ebc0c)

#### [Data Preparation](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/blob/main/Data%20Preparation%20in%20SQL)
Checked the data for duplicates, inconsistencies, and null values.
1.	Upon checking the primary key, ride_id, for duplicates, the query returns 5,779,444 distinct rows, which is the same as the total number of rows. This means that there are no duplicate rows in the data.
2.	Upon checking the number of characters for the primary key, ride_id, the query returns 16, which means that the number of characters for ride_id is consistent.
3.	Upon checking for null values, the query returns 857,860, 857,992, 915,655, and 915,796 null values for start_station_name, start_station_id, end_station_name, and end_station_id, respectively. However, the values for start_station_id and end_station_id will not influence the analysis, they will be ignored.
4.	The query also returns 5,795 null values for both end_lat and end_lng, these can not be plotted on a chart and will be removed.
5.	The query to check for the number of bike types in the table returns three types of bikes, which is the correct number of bikes to be used for the analysis.
6.	The query to check for the number of member types in the table returns two types, which is the correct number of member types.

![Screenshot 2023-08-08 134813](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/assets/138304188/c5327983-72c8-4b1f-97d7-241d9e98d48f)

#### [Data Cleaning](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/blob/main/Data%20Cleaning%20in%20SQL)
1.	Created a new table named “cleaned_combined_tripdata”.
2.	Created separate columns for day_of_week, month, and year from the data indicated in the started_at and ended_at columns.
3.	Created a column named ride_length_mins, which is the difference between the date and time indicated in the ended_at and started_at columns, expressed in minutes.
4.	Rows with null values are not included in the new table.
5.	4,409,335 rows were returned; therefore, 1,370,109 rows were removed.

![Screenshot 2023-08-08 135720](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/assets/138304188/d29e79c1-6dfa-475a-877d-b9ca482bd28a)

### [Analysis](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/blob/main/Data%20Analysis%20in%20SQL)
After cleaning the data, multiple tables were created to be used for analysis.
1.	Created comparison tables for number of trips of each member type:</br>

    a.	Number of trips for each bike type</br>
    b.	Number of trips per month</br>
    c.	Number of trips per day of week</br>
    d.	Number of trips per hour of day</br>
    
2.	Created comparison tables for the average ride length of each member type:</br>

    a.	Average ride length per month</br>
    b.	Average ride length per day of week</br>
    c.	Average ride length per hour of day</br>
    
3.	Created tables for start and end docking location for each member type.

### Insights
Created visualizations from the results of data analysis using Tableau.

#### 1.	Comparison between bike type preference per member type
   
![Bike Types](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/assets/138304188/c335cdfd-a1b4-412d-b514-14a4f127b5b9)

As shown above, riders prefer using classic bikes over the other bike types, which makes up 56.52% of the total rides. Annual members prefer both classic bikes and electric bikes with more than double the number of trips used by casual riders for classic bikes, and with a small margin for the electric bikes.

#### 2.	Comparison of monthly trips
   
![Bike Trips per Month](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/assets/138304188/666d9da1-bb98-460a-9ab9-5bbb348edac6)

The chart above shows the number of bike trips and the average ride length per month. 

As shown above, most bike trips occur on the month of July for casual riders and August for annual members. The highest average ride length also occurred on the month of July for both annual members and casual riders. 

The number of bike trips and average ride length were also significantly higher on the months of June, July, and August, and started to decline from September and at its lowest on the months of December and January. This could indicate that weather is a factor for the number of trips and average ride length, as it is likely that riders spend much time riding on summer than winter months.

#### 3.	Comparison of daily trips

![Bike Trips per Day of Week](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/assets/138304188/e072d33d-04e3-407c-8340-648e5098bf14)

From the graphs showing the number of trips per day, shows an inverse correlation between annual members and casual riders during weekdays. However, for the average ride length per day, the graph shows a correlation between both member types.

For annual members, the number of trips is higher during weekdays, and the average ride length is almost the same from Monday to Friday. This could indicate that annual members likely use the bikes for work.

For casual riders, both the number of trips and the average ride length is higher during weekends. The average ride length is also longer than what is recorded for the annual members. This could indicate that casual riders oftenly use the bikes for leisure.

#### 4.	Comparison of hourly trips

![Bike Trips per Hour](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/assets/138304188/bbd4d4eb-e2c5-4135-a947-f0c40547f96f)

The graphs above further support the findings on the comparison of daily trips. A significantly higher number of trips was found during 8 AM and 5 PM, which is the usual time for the start and end of work shift. A line with almost no significant changes was also found in the average ride length per hour graph which could indicate that the bikes used by annual member travels at an almost constant distance, which could be the distance between the docking station to their work.

For the casual riders, the number of trips and the average ride length both starting to increase at around 7 AM to 2 PM, which is the usual time of day that is spent for leisure.

#### 5.	Comparison for start and end docking stations

![Total Trips at Starting Locations](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/assets/138304188/f1746231-1471-469b-bf0c-894c3a0e19db)

![Total Trips at End Locations](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/assets/138304188/5f11f5a8-48f6-4e45-83e3-0cb5d5c9fd2a)

Shown above are the plotted locations of the top 100 frequent locations for start and end docking for each member type.

As shown in the maps, annual members typically start and end their locations inland, where there are establishments such as schools, restaurants, and other business establishments. It was also noticed that the start and end locations have quite a small distance.

For casual riders, the start and end locations are typically found near parks and lakes. The distance between the start and end locations are somewhat noticeable, indicating that casual riders tend to spend more time with bicycles travelling longer distances.

#### Summary of Insights

Annual Members    | Casual Riders
------------------|------------------
Typically use bikes for commuting | Typically use bikes for leisure
Prefers using classic bikes             | With small difference in preference between classic bikes and electric bikes
Rides bikes for a shorter duration | Rides bikes for a longer duration

#### Recommendations

1.	Flexible membership plan could be implemented to target casual riders. The membership plan includes discounts or promos during spring and summer seasons and/or weekend rides.
2.	Another membership plan to include discounts and promos for longer rides, to attract casual riders who frequently drive a longer distance.
3.	Advertising campaigns should be held on parks, piers, and other leisure locations during spring and summer seasons.




