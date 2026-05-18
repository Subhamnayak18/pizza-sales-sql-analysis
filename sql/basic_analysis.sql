--Retrieve the Total Number of Orders Placed

SELECT COUNT(*) AS total_orders
FROM orders;

--Calculate the Total Revenue Generated from Pizza Sales

SELECT ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p
ON od.pizza_id = p.pizza_id;

--Identify the Highest-Priced Pizza

SELECT pizza_id,pizza_types.name,price
FROM pizzas
JOIN pizza_types
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
ORDER BY price DESC
LIMIT 1;

--Identify the Most Common Pizza Size Ordered

SELECT p.size,
       COUNT(*) AS total_orders
FROM order_details od
JOIN pizzas p
ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total_orders DESC
LIMIT 1;

--List the Top 5 Most Ordered Pizza Types Along with Their Quantities

SELECT pt.name,
       SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p
ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity DESC
LIMIT 5;