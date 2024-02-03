select * from pizza_sales


select SUM(total_price) Total_Revenue from pizza_sales


select SUM(total_price) / COUNT(DISTINCT order_id) Average_Order_Value from pizza_sales


select SUM(quantity) Total_Pizzas_Sold from pizza_sales


select COUNT(DISTINCT order_id) Total_Orders from pizza_sales


select CAST(CAST(SUM(quantity) as DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) as DECIMAL(10,2)) 
as DECIMAL(10,2)) Avg_order_per_sale from pizza_sales



select DATENAME(MONTH, order_date) as Month_name, COUNT(DISTINCT order_id) as Total_orders from pizza_sales  group by DATENAME(MONTH, order_date) 
order by Total_orders desc



SELECT DATEPART(HOUR, order_time) Time_in_hour, COUNT(DISTINCT order_id) Total_orders
from pizza_sales group by DATEPART(HOUR, order_time) order by DATEPART(HOUR, order_time)



select pizza_category, SUM(total_price) as Total_sales, SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales where MONTH(order_date) = 1) 
as PCT_of_total_sales from pizza_sales where MONTH(order_date) = 1 group by pizza_category order by PCT_of_total_sales DESC


select pizza_size, CAST(SUM(total_price) as DECIMAL(10,2)) as Total_sales, CAST(SUM(total_price) * 100 /  
(select SUM(total_price) from pizza_sales where DATEPART(QUARTER, order_date) = 1)  as DECIMAL(10,2)) as PCT_of_total_sales from pizza_sales 
where DATEPART(QUARTER, order_date) = 1 group by pizza_size order by PCT_of_total_sales DESC



SELECT TOP 5 pizza_name, CAST(SUM(total_price) as DECIMAL(10,2)) Total_Revenue from pizza_sales
group by pizza_name order by Total_Revenue DESC



SELECT TOP 5 pizza_name, CAST(SUM(total_price) as DECIMAL(10,2)) Total_Revenue from pizza_sales
group by pizza_name order by Total_Revenue


SELECT TOP 5 pizza_name, CAST(SUM(quantity) as DECIMAL(10,2)) Total_quantity from pizza_sales
group by pizza_name order by Total_quantity DESC


SELECT TOP 5 pizza_name, CAST(SUM(quantity) as DECIMAL(10,2)) Total_quantity from pizza_sales
group by pizza_name order by Total_quantity


SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) Total_orders from pizza_sales
group by pizza_name order by Total_orders DESC


SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) Total_orders from pizza_sales
group by pizza_name order by Total_orders
