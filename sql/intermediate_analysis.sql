--Find the Total Quantity of Each Pizza Category Ordered

SELECT pt.category,
       SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p
ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;

--Determine the Distribution of Orders by Hour of the Day

SELECT EXTRACT(HOUR FROM time) AS order_hour,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_hour
ORDER BY order_hour;

--Find the Category-Wise Distribution of Pizzas

SELECT pt.category,
       COUNT(DISTINCT p.pizza_id) AS total_pizzas   
FROM pizzas p
JOIN pizza_types pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;

--Calculate the Average Number of Pizzas Ordered Per Day

SELECT ROUND(AVG(total_pizzas), 2) AS avg_pizzas_per_day
FROM (
    SELECT o.date,
           SUM(od.quantity) AS total_pizzas
    FROM orders o
    JOIN order_details od
    ON o.order_id = od.order_id
    GROUP BY o.date
) AS daily_orders;

--Find the Top 3 Most Ordered Pizza Types Based on Revenue

SELECT pt.name,
         ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p
ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue DESC
LIMIT 3;