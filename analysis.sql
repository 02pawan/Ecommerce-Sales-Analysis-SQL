
SELECT * FROM nk.train;
SELECT Product_Name,sum(Sales) as total_sale FROM nk.train group by Product_Name order by total_sale desc limit 10;

SELECT Category,sum(Sales) as total_sales_by_category FROM nk.train group by Category;

SELECT sum(case when Category="Furniture" then Sales else 0 end)*100/sum(Sales) as furniture_sales_percent FROM nk.train;
SELECT sum(case when Category="Office Supplies" then Sales else 0 end)*100/sum(Sales) as Office_sales_percent FROM nk.train;
SELECT sum(case when Category="Technology" then Sales else 0 end)*100/sum(Sales) as Technology_sales_percent FROM nk.train;

SELECT City,sum(Sales) as city_wise_sales FROM nk.train group by City order by city_wise_sales desc limit 10;

SELECT City, Product_Name, SUM(Sales) AS total_sales
FROM nk.train
GROUP BY City, Product_Name
ORDER BY total_sales DESC
LIMIT 10;

SELECT 
    Category,
    SUM(Sales) AS total_sales,
    SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER() AS percentage
FROM nk.train
GROUP BY Category;


SELECT City,sum(Sales) as sales_by_city FROM nk.train group by City order by sales_by_city desc limit 3;

