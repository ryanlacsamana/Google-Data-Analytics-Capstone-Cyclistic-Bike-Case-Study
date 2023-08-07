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

#### [Data Preparation](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/blob/main/Data%20Preparation%20in%20SQL)
Checked the data for duplicates, inconsistencies, and null values.
1.	Upon checking the primary key, ride_id, for duplicates, the query returns 5,779,444 distinct rows, which is the same as the total number of rows. This means that there are no duplicate rows in the data.
2.	Upon checking the number of characters for the primary key, ride_id, the query returns 16, which means that the number of characters for ride_id is consistent.
3.	Upon checking for null values, the query returns 857,860, 857,992, 915,655, and 915,796 null values for start_station_name, start_station_id, end_station_name, and end_station_id, respectively. However, the values for start_station_id and end_station_id will not influence the analysis, they will be ignored.
4.	The query also returns 5,795 null values for both end_lat and end_lng, these can not be plotted on a chart and will be removed.
5.	The query to check for the number of bike types in the table returns three types of bikes, which is the correct number of bikes to be used for the analysis.
6.	The query to check for the number of member types in the table returns two types, which is the correct number of member types.

#### [Data Cleaning](https://github.com/ryanlacsamana/Google-Data-Analytics-Capstone-Cyclistic-Bike-Case-Study/blob/main/Data%20Cleaning%20in%20SQL)
1.	Created a new table named “cleaned_combined_tripdata”.
2.	Created separate columns for day_of_week, month, and year from the data indicated in the started_at and ended_at columns.
3.	Created a column named ride_length_mins, which is the difference between the date and time indicated in the ended_at and started_at columns, expressed in minutes.
4.	Rows with null values are not included in the new table.
5.	4,409,335 rows were returned; therefore, 1,370,109 rows were removed.

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

1.	Comparison between bike type preference per member type
   ![image](


