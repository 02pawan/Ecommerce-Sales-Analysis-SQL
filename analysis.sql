-- Use database
USE nk;

-- View dataset (for understanding structure)
SELECT * FROM nk.train;

--------------------------------------------------
-- Top 10 Products by Revenue
-- Helps identify best-selling products
SELECT 
    Product_Name, 
    SUM(Sales) AS total_sales 
FROM nk.train 
GROUP BY Product_Name 
ORDER BY total_sales DESC 
LIMIT 10;

--------------------------------------------------
-- Sales by Category
-- Shows contribution of each category
SELECT 
    Category, 
    SUM(Sales) AS total_sales_by_category 
FROM nk.train 
GROUP BY Category;

--------------------------------------------------
-- Category-wise Sales Percentage (Optimized)
-- Shows percentage contribution of each category
SELECT 
    Category,
    SUM(Sales) AS total_sales,
    SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER() AS percentage
FROM nk.train
GROUP BY Category;

--------------------------------------------------
-- Top 10 Cities by Sales
-- Identifies high revenue locations
SELECT 
    City,
    SUM(Sales) AS city_wise_sales 
FROM nk.train 
GROUP BY City 
ORDER BY city_wise_sales DESC 
LIMIT 10;

--------------------------------------------------
-- Top Product-City Combinations
-- Shows which product performs best in which city
SELECT 
    City, 
    Product_Name, 
    SUM(Sales) AS total_sales
FROM nk.train
GROUP BY City, Product_Name
ORDER BY total_sales DESC
LIMIT 10;

--------------------------------------------------
-- Top 3 Cities (Final Key Insight)
-- Major revenue driving cities
SELECT 
    City,
    SUM(Sales) AS sales_by_city 
FROM nk.train 
GROUP BY City 
ORDER BY sales_by_city DESC 
LIMIT 3;
