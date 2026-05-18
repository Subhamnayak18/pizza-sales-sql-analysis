--Calculate the Percentage Contribution of Each Pizza Type to Total Revenue

SELECT pt.name,
       ROUND(SUM(od.quantity * p.price), 2) AS revenue,
       ROUND(
           SUM(od.quantity * p.price) * 100 /
           (SELECT SUM(od2.quantity * p2.price)
            FROM order_details od2
            JOIN pizzas p2
            ON od2.pizza_id = p2.pizza_id),
       2) AS revenue_percentage
FROM order_details od
JOIN pizzas p
ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue_percentage DESC;

--Analyze the Cumulative Revenue Generated Over Time

SELECT order_date,
       revenue,
       SUM(revenue) OVER (ORDER BY order_date) AS cumulative_revenue
FROM (
    SELECT o.date AS order_date,
           ROUND(SUM(od.quantity * p.price), 2) AS revenue
    FROM orders o
    JOIN order_details od
    ON o.order_id = od.order_id
    JOIN pizzas p
    ON od.pizza_id = p.pizza_id
    GROUP BY o.date
) AS daily_revenue;

--Determine the Top 3 Most Ordered Pizza Types Based on Revenue for Each Pizza Category

SELECT category,
       name,
       revenue
FROM (
    SELECT pt.category,
           pt.name,
           ROUND(SUM(od.quantity * p.price), 2) AS revenue,
           RANK() OVER (
               PARTITION BY pt.category
               ORDER BY SUM(od.quantity * p.price) DESC
           ) AS rank
    FROM order_details od
    JOIN pizzas p
    ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category, pt.name
) AS ranked_pizzas
WHERE rank <= 3;