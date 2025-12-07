 /*select 
round(sum(price * quantity),0) as total_revenue

from totalsales */


/*select round(avg(total_order_value),2) from(
SELECT  
    order_id,
    SUM(price * quantity)  AS total_order_value
FROM totalsales
GROUP BY order_id) as tot */

select sum(soldpizza) from(
select order_id,sum(quantity) as soldpizza  from totalsales
group by order_id) 

select count(say) as countorder from(
select order_id as say from totalsales
group by order_id) 

 select round((select sum(soldpizza) from(
select order_id,sum(quantity) as soldpizza  from totalsales
group by order_id) as a)/(select count(say) as countorder from(
select order_id as say from totalsales
group by order_id) as b ),2) as avgpizzaperorder

 ---------------------------------------------------------------------------------------------
 select * from totalsales
 
SELECT TO_CHAR(date, 'Day') AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM totalsales
GROUP BY TO_CHAR(date, 'Day')

select DATE_PART('hour', time),count(distinct order_id) from totalsales 
group by DATE_PART('hour', time)
-----------------------------------------------------------------------------
SELECT category, CAST(SUM(price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(price) * 100 / (SELECT SUM(price) from totalsales) AS DECIMAL(10,2)) AS PCT
FROM totalsales
GROUP BY category
---------------------------------------------------
SELECT size, CAST(SUM(price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(price) * 100 / (SELECT SUM(price) from totalsales) AS DECIMAL(10,2)) AS PCT
FROM totalsales
GROUP BY size
ORDER BY size

----------------------------------------
F. Total Pizzas Sold by Pizza Category
SELECT category, SUM(quantity) as Total_Quantity_Sold
FROM totalsales

GROUP BY category
ORDER BY Total_Quantity_Sold DESC
-----------------------------------------------------
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM totalsales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5

-------------------------
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM totalsales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5



 

