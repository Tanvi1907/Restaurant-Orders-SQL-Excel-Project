create database restaurant_db;
use restaurant_db;
create Table restaurant_orders (
order_id int primary key,
customer_name varchar(100),
food_item varchar(100),
category varchar(50),
quantity int,
price decimal(10,2),
payment_method varchar(50),
order_time DATETIME
);
select * from restaurant_orders;

LOAD DATA LOCAL INFILE 'C:/Users/Tanvi/Downloads/restaurant_orders.csv'
INTO TABLE restaurant_orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_name, food_item, category, quantity, price, payment_method, order_time);


SELECT COUNT(*) FROM restaurant_orders;
SELECT * FROM restaurant_orders LIMIT 10;

-- Total Sales by Category
SELECT food_item, SUM(quantity) AS total_ordered
FROM restaurant_orders
GROUP BY food_item
ORDER BY total_ordered DESC
LIMIT 5;
-- Total Sales by Category
SELECT category, SUM(price * quantity) AS total_sales
FROM restaurant_orders
GROUP BY category
ORDER BY total_sales DESC;

-- Payment Method Trends
SELECT payment_method, COUNT(*) AS total_orders
FROM restaurant_orders
GROUP BY payment_method;

-- daily_sales
SELECT DATE(order_time) AS order_date, SUM(price * quantity) AS daily_sales
FROM restaurant_orders
GROUP BY order_date
ORDER BY order_date;

-- Customer-wise Spending
SELECT customer_name, SUM(price * quantity) AS total_spent
FROM restaurant_orders
GROUP BY customer_name
ORDER BY total_spent DESC;

