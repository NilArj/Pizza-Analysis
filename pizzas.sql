
/* obtain a glimpse of the database */
SELECT *
FROM pizza_sales
LIMIT 5;

/* obtain the data type of each column */
SELECT COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = "project"
    AND TABLE_NAME = "pizza_sales";

/* data cleaning */
/* change data type */
UPDATE pizza_sales
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');

ALTER TABLE pizza_sales
MODIFY COLUMN order_date DATE; 

ALTER TABLE pizza_sales
MODIFY COLUMN order_time TIME;

ALTER TABLE pizza_sales 
MODIFY COLUMN pizza_category VARCHAR(50);

ALTER TABLE pizza_sales 
MODIFY COLUMN pizza_size VARCHAR(50);

ALTER TABLE pizza_sales 
MODIFY COLUMN pizza_name VARCHAR(50);

ALTER TABLE pizza_sales 
MODIFY COLUMN pizza_name_id VARCHAR(100);

ALTER TABLE pizza_sales 
MODIFY COLUMN pizza_ingredients VARCHAR(200);

ALTER TABLE pizza_sales 
MODIFY COLUMN order_id INT;

ALTER TABLE pizza_sales
MODIFY COLUMN quantity INT;

ALTER TABLE pizza_sales 
MODIFY COLUMN total_price FLOAT;

ALTER TABLE pizza_sales
MODIFY COLUMN unit_price FLOAT;

/* change pizza_size data */
SELECT DISTINCT pizza_size
FROM pizza_sales;

UPDATE pizza_sales
SET pizza_size =
    CASE pizza_size 
        WHEN 'S' THEN 'Small'
        WHEN 'M' THEN 'Medium'
        WHEN 'L' THEN 'Large'
        WHEN 'XL' THEN 'Extra large'
        WHEN 'XXL' THEN 'Extra extra large'
        ELSE pizza_size
    END;

SELECT DISTINCT pizza_size
FROM pizza_sales;



/* analyze key indicators for our pizza sales data */
/* total revenue */
SELECT ROUND (SUM(total_price), 2) AS total_revenue
FROM pizza_sales;

/* average spending per order */
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS avg_order_value
FROM pizza_sales;

/* total pizzas sold */
SELECT SUM(quantity) AS pizzas_sold
FROM pizza_sales;

/* total orders */
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;

/* average pizza per order */
SELECT ROUND(SUM(quantity)/COUNT(DISTINCT order_id))AS avg_pizza_per_order
FROM pizza_sales;

/* daily trend for total orders */
SELECT DAYNAME(order_date) AS day_order, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY day_order;

/* month trend for total orders */
SELECT MONTHNAME(order_date) as month_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY month_name, MONTH(order_date)
ORDER BY MONTH(order_date);

/* percentage of sales by pizza category */
SELECT pizza_category, ROUND(SUM(total_price)) AS sales_by_category, ROUND(SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales) * 100,2) AS category_percentage 
FROM pizza_sales
GROUP BY pizza_category;

/* percentage of sales by pizza size */
SELECT pizza_size, ROUND(SUM(total_price)) as sales_by_size, ROUND(SUM(total_price)/ (SELECT SUM(total_price) FROM pizza_sales) * 100,2 ) AS size_percentage
FROM pizza_sales
GROUP BY pizza_size
ORDER BY size_percentage DESC;

/* top 5 best sellers by revenue */
SELECT pizza_name, SUM(total_price) as revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 5;

/* bottom 5 best sellers by revenue */
SELECT pizza_name, ROUND(SUM(total_price), 2) as revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY revenue 
LIMIT 5;

/* top 5 best sellers by quantity */
SELECT pizza_name, SUM(quantity) as quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY quantity DESC
LIMIT 5;

/* bottom 5 best sellers by quantity */
SELECT pizza_name, SUM(quantity) as quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY quantity 
LIMIT 5;

/* top 5 best sellers by orders */
SELECT pizza_name, COUNT(DISTINCT order_id) as total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;

/* bottom 5 best sellers by orders */
SELECT pizza_name, COUNT(DISTINCT order_id) as total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders
LIMIT 5;