SELECT * FROM pizza_sales;


SELECT SUM(total_price) AS Total_revenue FROM pizza_sales;

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales;

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_order FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2)) 
AS Avg_Pizzas_Per_Order FROM pizza_sales; 

SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id)
AS Total_Orders FROM pizza_sales GROUP BY DATENAME(DW, order_date);

SELECT DATEPART(HOUR, order_time) AS Order_Hours, COUNT(DISTINCT order_id)
AS Total_Orders FROM pizza_sales GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);

SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price)
FROM pizza_sales) AS Percent_of_TotalSales FROM pizza_sales GROUP BY pizza_category;

SELECT pizza_size, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)
AS Percent_Of_TotalSales FROM pizza_sales GROUP BY pizza_size;

SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales
GROUP BY pizza_category;

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_sold FROM pizza_sales
GROUP BY pizza_name ORDER BY SUM(quantity) DESC;

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_sold FROM pizza_sales
GROUP BY pizza_name ORDER BY SUM(quantity) ASC;