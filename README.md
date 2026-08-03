<img width="1280" height="720" alt="image" src="https://github.com/user-attachments/assets/5f693da4-effe-40a0-83ef-307d689315ac" />

# Egyptian Demographics & Marriage Distribution Analysis

## Project Overview
This project is an end-to-end data analytics pipeline focusing on the adult demographic and marriage distribution across Egypt. The goal was to extract raw census data, perform exploratory data analysis (EDA) and data cleaning using SQL Server, and build an interactive Power BI dashboard to visualize population trends across different regions, life stages, and genders.

## Tools & Technologies Used
* **SQL Server:** Data extraction, filtering out non-applicable demographics (minors), and aggregating population totals.
* **Power BI:** Data modeling, DAX, and building the final interactive dashboard.
* **Data Source:** 2017 Annual Census Data provided by the Central Agency for Public Mobilization and Statistics of Egypt (CAPMAS). [Link to source](https://www.capmas.gov.eg)

## Key Insights & Business Takeaways

* **Rural Majority:** Rural areas hold 31.2M adults (~55% of the total), while Urban areas account for 25.6M (~45%). 
  * *Takeaway:* National programs and commercial campaigns targeted at adults must prioritize rural reach to hit the majority of the population.
* **The Marriage Transition:** In the 18–29 age group, the majority are single (57.6% Never Married). In the 30–49 age group, this flips completely, with Married adults jumping to 87.7%.
  * *Takeaway:* The primary transition window into marriage in Egypt happens sharply as citizens approach age 30.
* **Gender Distribution:** Females make up 51.5% (~29M) of the total adult population, while males sit at 48.5% (~28M).
  * *Takeaway:* There is a consistent ~1M female surplus across the eligible adult demographic.
* **Elderly Needs:** Widowed status is practically nonexistent in youth but peaks at 39.6% among Elderly adults (65+).
  * *Takeaway:* Nearly 4 out of 10 seniors have lost a spouse, highlighting a massive demographic needing localized senior care and social safety nets.

## Project Files
* `EGY_Demographics_EDA.sql`: Contains the SQL queries used to clean, filter, and structure the raw database.
* `EGY_Demographics_Dashboard.pbix`: The final Power BI dashboard file.
