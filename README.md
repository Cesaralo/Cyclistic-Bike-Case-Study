# Cyclistic-Bike-Case-Study
# Ask & Prepare Phases
Lily Moreno, our marketing director and manager, as well as the Cyclistic executive team, have assigned us to figure out how annual members and casual riders behave differently when using our services so that we can create a marketing strategy that appeals to casual riders' needs.
The data sources that we will be using span the 12 months prior to the creation of this case study and have been saved in local storage and in Google Drive. This data includes all customer bike usage, which is sufficient for our purposes; furthermore, the data satisfies the ROCCC framework since it has been provided directly by Motivate International Inc., located in Chicago, from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) under this [license](https://divvybikes.com/data-license-agreement)
# Process Phase
Given the large volume of data being used, the best option is to work with Google BigQuery, which allows us to process tons of data faster than traditional spreadsheet software. Tableau will be used for visualization and analysis as well. All data being used was successfully validated, ensuring the colmuns to be identical and that their types were well formatted, which will be listed below:
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/307eeecb-8641-4a1e-9617-f7de70c58429" />

## Merging the data
I have decided to use Union All instead of Join since the first one arranges the tables vertically, while Join does it horizontally.

SQL Query: [Data Combining](./01_combining_bikes_data.sql)

Once the data was merged altogether, I decided to execute this code to look for duplicated entries, obtaining 35 duplicates.

A round count check and a uniqueness check were conducted to ensure the dataset was free from errors... All 12 monthly files were merged using a WITH ... AS... clause, which was then paired with WHERE...IN to check for duplicate ride_ids across the relevant columns. This process revealed 35 duplicates, which appeared to arise from a month-end overlap.
COUNTIF was used to look for rows lacking starting and ending coordinate data. A total of 5,890 rows lacking ending coordinates were found, and starting coordinates were similarly verified for completeness.
Validation of data integrity was performed using COUNT(*), TIMESTAMP_DIFF, and WHERE filters to identify logical inconsistencies. We specifically focused on trips with negative durations or sessions lasting less than one minute, finding:
29 trips that finished before even starting
35,671 trips under one minute
Structural and consistency errors were sought by using SELECT DISTINCT, but no further anomalies were found. Ultimately, the 12 individual monthly datasets were consolidated via a UNION ALL statement into a single destination table while ensuring proper column data types, and new columns for ride_length and day_of_week were engineered to facilitate deeper analysis.
## Analyze & Share Phases
To address our primary objective of determining how annual members and casual riders utilize Cyclistic services differently, the following metrics were investigated:
Mean, maximum, and minimum ride duration per user category
Weekly patterns of usage
Hourly traffic distribution (time of day)
Monthly seasonal trends
Preferences regarding bike types
Highest traffic start stations
By executing targeted data aggregations—utilizing functions such as ROUND(AVG), MIN, MAX, COUNT, and EXTRACT grouped by user segments—the data revealed that casual riders record noticeably longer durations per trip, whereas annual members demonstrate high consistency with significantly greater total trip counts.
Furthermore, examining trip volume and averages across the week revealed that casual ridership peaks sharply during weekends. Conversely, annual members utilize the service most heavily on weekdays, reinforcing the conclusion that members rely on the system for daily commuting, while casual users engage primarily for leisure.
Regarding hourly traffic, casual riders are most active in a steady block between 08:00 and 19:00, while member activity shows distinct peaks aligned with typical professional rush hours within a broader 06:00 to 21:00 window. This highlights a clear behavioral boundary between those following a strict professional routine and those utilizing the bikes for sporadic recreational purposes.
From a seasonal perspective, the most effective period for marketing to casual riders spans from April to October. Promotional efforts should emphasize electric bikes—the top choice for both groups—and be concentrated at high-density casual locations like Navy Pier and the intersection of DuSable Lake Shore Dr & Monroe Drive.


You can interact with the complete data visualizations on the Cyclistic Project Insights Dashboard on Tableau Public

## Act
Finally, based on the distinct behavioral patterns found during the analysis phase, the following three data-driven recommendations are proposed to convert casual riders into loyal, annual members:
Launch a "Peak-Season" Campaign for Annual Memberships: Since casual riders heavily concentrate on weekends from April to October, we should introduce a summer marketing campaign offering incentives like granting the first month for free so that casual riders feel more interested in investing their money.
 
Deploy Campaigns at High-Traffic Hubs: Locations like Navy Pier and the intersection of DuSable Lake Shore Dr & Monroe Drive were proven to be high-traffic hubs; marketing campaigns should be scheduled to run during peak casual hours (08:00 to 19:00) emphasizing the financial and convenience benefits of becoming a member.

Leverage Electric Bike Perks for Annual Members: Offering members-only benefits, such as waived e-bike unlock fees or lower per-minute rates, will directly appeal to the casual users' preferences and incentivize them to switch.
