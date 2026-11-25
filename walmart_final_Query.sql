-- =====================================================
-- PROJECT: SUPERMARKET SALES ANALYSIS USING SQL
-- DATABASE: walmart_sales_project
-- TABLE: walmart_sales
-- TOOL: MySQL Workbench
-- TOTAL BUSINESS QUESTIONS: 25
-- =====================================================

USE walmart_sales_project;


-- =====================================================
-- SECTION 1: DATA VALIDATION
-- =====================================================

-- Check total number of records
SELECT COUNT(*) AS total_records
FROM walmart_sales;


-- =====================================================
-- SECTION 2: OVERALL BUSINESS ANALYSIS
-- =====================================================

-- Q1: Overall Business Performance

-- The management team wants to understand the overall performance of the supermarket.

-- Total number of transactions.
-- Total sales revenue.
-- Average transaction value.
-- Total quantity of products sold.
-- Average customer rating.


SELECT
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_transaction_value,
    SUM(`Quantity`) AS total_quantity_sold,
    ROUND(AVG(`Rating`), 2) AS average_rating
FROM walmart_sales;


-- =====================================================
-- SECTION 3: SALES PERFORMANCE ANALYSIS
-- =====================================================

-- Q2: City-wise Sales Performance

-- Business scenario:
-- Management wants to identify which city generates the highest revenue and which city has the highest average transaction value.

-- Task
-- City name
-- Total transactions
-- Total revenue
-- Average sales per transaction
-- Total quantity sold


SELECT
    `City`,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_sales,
    SUM(`Quantity`) AS total_quantity
FROM walmart_sales
GROUP BY `City`
ORDER BY total_revenue DESC;



-- =====================================================
-- Q3: Product Line Performance
-- =====================================================

-- Management wants to identify the best-performing
-- product line based on revenue, quantity and rating.

SELECT
    `Product line`,
    COUNT(`Invoice ID`) AS total_transactions,
    SUM(`Quantity`) AS total_quantity,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_revenue,
    ROUND(AVG(`Rating`), 2) AS average_rating
FROM walmart_sales
GROUP BY `Product line`
ORDER BY total_revenue DESC;


-- =====================================================
-- Q4: Branch-wise Sales Performance
-- =====================================================

-- Management wants to compare the performance
-- of each branch.

SELECT
    `Branch`,
    `City`,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_sales,
    SUM(`Quantity`) AS total_quantity,
    ROUND(AVG(`Rating`), 2) AS average_rating
FROM walmart_sales
GROUP BY `Branch`, `City`
ORDER BY total_revenue DESC



-- =====================================================
-- Q5: Customer Type Analysis
-- =====================================================

-- Compare Member and Normal customers based on
-- transactions, revenue, quantity and rating.

SELECT
    `Customer type`,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_sales,
    SUM(`Quantity`) AS total_quantity,
    ROUND(AVG(`Rating`), 2) AS average_rating
FROM walmart_sales
GROUP BY `Customer type`
ORDER BY total_revenue DESC;


-- =====================================================
-- Q6: Gender-wise Sales Analysis
-- =====================================================

-- Compare sales performance between female and male customers.

SELECT
    `Gender`,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_sales,
    SUM(`Quantity`) AS total_quantity,
    ROUND(AVG(`Rating`), 2) AS average_rating
FROM walmart_sales
GROUP BY `Gender`
ORDER BY total_revenue DESC;


-- =====================================================
-- Q7: Payment Method Analysis
-- =====================================================

-- Identify the most commonly used payment method
-- and compare revenue across payment methods.

SELECT
    `Payment`,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_transaction_value,
    SUM(`Quantity`) AS total_quantity,
    ROUND(AVG(`Rating`), 2) AS average_rating
FROM walmart_sales
GROUP BY `Payment`
ORDER BY total_revenue DESC;


-- =====================================================
-- Q8: Monthly Sales Analysis
-- =====================================================

-- Analyze monthly revenue and transaction trends.

SELECT
    MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS month_number,
    MONTHNAME(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS month_name,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_sales,
    SUM(`Quantity`) AS total_quantity
FROM walmart_sales
GROUP BY month_number, month_name
ORDER BY month_number;



-- =====================================================
-- Q9: Sales by Day of Week
-- =====================================================

-- Identify which day generates the highest revenue.

SELECT
    DAYNAME(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS day_name,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_sales,
    SUM(`Quantity`) AS total_quantity
FROM walmart_sales
GROUP BY
    DAYOFWEEK(STR_TO_DATE(`Date`, '%Y-%m-%d')),
    DAYNAME(STR_TO_DATE(`Date`, '%Y-%m-%d'))
ORDER BY DAYOFWEEK(STR_TO_DATE(`Date`, '%Y-%m-%d'));


-- =====================================================
-- Q10: Hourly Sales Analysis
-- =====================================================

-- Identify the busiest hour and highest-revenue hour.

SELECT
    HOUR(STR_TO_DATE(`Time`, '%H:%i:%s')) AS sales_hour,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_sales,
    SUM(`Quantity`) AS total_quantity
FROM walmart_sales
GROUP BY sales_hour
ORDER BY sales_hour;


-- =====================================================
-- Q11: Product Line Sales by City
-- =====================================================

-- Find the best-performing product line in each city.

SELECT
    `City`,
    `Product line`,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    SUM(`Quantity`) AS total_quantity,
    ROUND(AVG(`Rating`), 2) AS average_rating
FROM walmart_sales
GROUP BY `City`, `Product line`
ORDER BY `City`, total_revenue DESC;


-- =====================================================
-- Q12: Customer Type by City
-- =====================================================

-- Compare Member and Normal customers in each city.

SELECT
    `City`,
    `Customer type`,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_sales,
    SUM(`Quantity`) AS total_quantity
FROM walmart_sales
GROUP BY `City`, `Customer type`
ORDER BY `City`, total_revenue DESC;



-- =====================================================
-- Q13: Average Rating by City and Product Line
-- =====================================================

-- Identify the highest-rated product line in each city.

SELECT
    `City`,
    `Product line`,
    ROUND(AVG(`Rating`), 2) AS average_rating,
    COUNT(`Invoice ID`) AS total_transactions
FROM walmart_sales
GROUP BY `City`, `Product line`
ORDER BY `City`, average_rating DESC;


-- =====================================================
-- Q14: Gross Income by Product Line
-- =====================================================

-- Compare gross income across different product lines.

SELECT
    `Product line`,
    ROUND(SUM(`gross income`), 2) AS total_gross_income,
    ROUND(AVG(`gross income`), 2) AS average_gross_income,
    ROUND(SUM(`Total`), 2) AS total_revenue
FROM walmart_sales
GROUP BY `Product line`
ORDER BY total_gross_income DESC;


-- =====================================================
-- Q15: Sales by Payment Method and Customer Type
-- =====================================================

-- Analyze payment preferences of Member and Normal customers.

SELECT
    `Customer type`,
    `Payment`,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_sales
FROM walmart_sales
GROUP BY `Customer type`, `Payment`
ORDER BY `Customer type`, total_transactions DESC;


-- =====================================================
-- Q16: Top 5 Highest-Value Transactions
-- =====================================================

-- Find the five transactions with the highest sales value.

SELECT
    `Invoice ID`,
    `City`,
    `Customer type`,
    `Product line`,
    `Payment`,
    ROUND(`Total`, 2) AS total_amount,
    `Date`,
    `Time`
FROM walmart_sales
ORDER BY `Total` DESC
LIMIT 5;


-- =====================================================
-- Q17: Bottom 5 Lowest-Value Transactions
-- =====================================================

-- Find the five transactions with the lowest sales value.

SELECT
    `Invoice ID`,
    `City`,
    `Customer type`,
    `Product line`,
    `Payment`,
    ROUND(`Total`, 2) AS total_amount,
    `Date`,
    `Time`
FROM walmart_sales
ORDER BY `Total` ASC
LIMIT 5;


-- =====================================================
-- Q18: Quantity Sold by Product Line
-- =====================================================

-- Identify which product line sells the highest quantity.

SELECT
    `Product line`,
    SUM(`Quantity`) AS total_quantity_sold,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(AVG(`Quantity`), 2) AS average_quantity_per_transaction
FROM walmart_sales
GROUP BY `Product line`
ORDER BY total_quantity_sold DESC;


-- =====================================================
-- Q19: Revenue Contribution by Product Line (%)
-- =====================================================

-- Calculate each product line's percentage contribution
-- to total supermarket revenue.

SELECT
    `Product line`,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(
        SUM(`Total`) * 100 /
        (SELECT SUM(`Total`)
         FROM walmart_sales),
        2
    ) AS revenue_percentage
FROM walmart_sales
GROUP BY `Product line`
ORDER BY revenue_percentage DESC;


-- =====================================================
-- Q20: Gross Income by City
-- =====================================================

-- Compare gross income and revenue across cities.

SELECT
    `City`,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`gross income`), 2) AS total_gross_income,
    ROUND(AVG(`gross income`), 2) AS average_gross_income,
    ROUND(SUM(`Total`), 2) AS total_revenue
FROM walmart_sales
GROUP BY `City`
ORDER BY total_gross_income DESC;


-- =====================================================
-- Q21: Rank Product Lines by Revenue
-- Topic: RANK() Window Function
-- =====================================================

-- Rank product lines based on total revenue.

SELECT
    `Product line`,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(`Total`) DESC
    ) AS revenue_rank
FROM walmart_sales
GROUP BY `Product line`;


-- =====================================================
-- Q22: Rank Branches by Revenue
-- Topic: RANK() Window Function
-- =====================================================

-- Rank branches based on total revenue.

SELECT
    `Branch`,
    `City`,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(`Total`) DESC
    ) AS revenue_rank
FROM walmart_sales
GROUP BY `Branch`, `City`;


-- =====================================================
-- Q23: Running Monthly Revenue
-- Topic: Window Function + Running Total
-- =====================================================

-- Calculate monthly revenue and cumulative revenue.

SELECT
    MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS month_number,
    MONTHNAME(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS month_name,
    ROUND(SUM(`Total`), 2) AS monthly_revenue,
    ROUND(
        SUM(SUM(`Total`)) OVER (
            ORDER BY MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d'))
        ),
        2
    ) AS running_revenue
FROM walmart_sales
GROUP BY month_number, month_name
ORDER BY month_number;


-- =====================================================
-- Q24: Customer Spending Analysis
-- Topic: Subquery + Aggregate Functions
-- =====================================================

-- Compare spending and revenue contribution
-- between Member and Normal customers.

SELECT
    `Customer type`,
    COUNT(`Invoice ID`) AS total_transactions,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(AVG(`Total`), 2) AS average_spending,
    ROUND(
        SUM(`Total`) * 100 /
        (SELECT SUM(`Total`)
         FROM walmart_sales),
        2
    ) AS revenue_percentage
FROM walmart_sales
GROUP BY `Customer type`
ORDER BY total_revenue DESC;


-- =====================================================
-- Q25: Final City-wise Business Performance
-- =====================================================

-- Prepare a complete city-wise performance summary.

SELECT
    `City`,
    COUNT(`Invoice ID`) AS total_transactions,
    SUM(`Quantity`) AS total_quantity_sold,
    ROUND(SUM(`Total`), 2) AS total_revenue,
    ROUND(SUM(`gross income`), 2) AS total_gross_income,
    ROUND(AVG(`Total`), 2) AS average_transaction_value,
    ROUND(AVG(`Rating`), 2) AS average_customer_rating
FROM walmart_sales
GROUP BY `City`
ORDER BY total_revenue DESC;

