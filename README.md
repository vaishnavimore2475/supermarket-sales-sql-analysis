# Supermarket Sales Analysis Using SQL

## Project Overview
This project analyzes supermarket sales data using MySQL to identify business insights, sales trends, customer behavior, and product performance.

The analysis helps understand which cities, branches, product lines, and payment methods contribute most to business revenue.

## Objectives
- Analyze overall supermarket sales performance.
- Compare revenue across different cities and branches.
- Identify the best-performing product lines.
- Understand customer purchasing behavior.
- Analyze sales by month, weekday, and hour.
- Evaluate payment methods and customer ratings.
- Use SQL queries to generate meaningful business insights.

## Tools and Technologies
- MySQL
- MySQL Workbench
- SQL
- GitHub
- Excel (for future dashboard development)

## Dataset
The project uses a supermarket sales dataset containing 1,000 transactions and 17 columns.

Key fields include:
- Invoice ID
- Branch
- City
- Customer type
- Gender
- Product line
- Unit price
- Quantity
- Total
- Payment
- Date
- Time
- Rating
- Gross income

*Note: This is a supermarket sales dataset, not verified official Walmart corporate data.*

## SQL Topics Covered
- Data validation
- SELECT and aggregate functions
- WHERE and GROUP BY
- ORDER BY and LIMIT
- Date and time functions
- Subqueries
- Percentage calculations
- RANK() window function
- Running totals
- Business performance analysis

## Business Questions
A total of 25 business questions were solved, covering:
1. Overall business performance
2. City-wise sales performance
3. Product line performance
4. Branch-wise sales performance
5. Customer type analysis
6. Gender-wise sales analysis
7. Payment method analysis
8. Monthly sales analysis
9. Sales by day of week
10. Hourly sales analysis
11. Product line sales by city
12. Customer type by city
13. Average rating by city and product line
14. Gross income by product line
15. Sales by payment method and customer type
16. Top 5 highest-value transactions
17. Bottom 5 lowest-value transactions
18. Quantity sold by product line
19. Revenue contribution by product line
20. Gross income by city
21. Rank product lines by revenue
22. Rank branches by revenue
23. Running monthly revenue
24. Customer spending analysis
25. Final city-wise business performance

## Key Business Insights
1. Total revenue was 322,966.75 across 1,000 transactions.
2. Naypyitaw generated the highest revenue of 110,568.71.
3. Food and beverages was the highest-revenue product line, contributing 17.38%.
4. Saturday recorded the highest daily revenue of 56,120.81.
5. 7 PM recorded the highest hourly revenue of 39,699.51.

## Project Files
- `Walmart_final_query.sql` – Contains SQL solutions for all 25 business questions.

## Conclusion
This project helped apply SQL concepts to a real-world-style business dataset and convert raw sales data into meaningful business insights.

It demonstrates practical skills in data analysis, SQL querying, aggregation, subqueries, and window functions.

## SQL Query Results

### 1. Overall Business Performance
![Overall Performance](screenshots/Q1_Overall_Performance.png)

### 2. City-wise Sales Performance
![City Sales](screenshots/Q2_City_Sales.png)

### 3. Product Line Performance
![Product Performance](screenshots/Q3_Product_Performance.png)

### 4. Monthly Sales Analysis
![Monthly Sales](screenshots/Q8_Monthly_Sales.png)

### 5. Final City-wise Business Summary
![City Summary](screenshots/Q25_City_Summary.png)


## Excel Dashboard

Created an interactive Supermarket Sales Dashboard using Microsoft Excel.

### Dashboard Features
- Total Revenue, Total Transactions, Total Quantity Sold and Average Customer Rating KPI cards.
- City-wise Revenue Analysis.
- Product Line Revenue Analysis.
- Monthly Sales Trend.
- Payment Method Analysis.
- Customer Type Revenue Analysis.
- Hourly Sales Revenue Analysis.
- Interactive slicers for City, Gender, Customer Type, Product Line, Payment and Branch.

### Tools Used
- MySQL
- Microsoft Excel
- PivotTables
- PivotCharts
- Slicers

### Project Files
- `Walmart_Sales_Analysis.sql` – SQL business analysis queries.
- `Supermarket_Sales_Dashboard.xlsx` – Interactive Excel dashboard.
- `screenshots/` – Project screenshots.
