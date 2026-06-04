CREATE DATABASE internship_week_3_project

use internship_week_3_project

CREATE TABLE Sales_data
 (
order_id varchar (50),
date  date,
customer_id varchar(20),
product varchar(20),
quantity int,
unit_price decimal(10,2),
shipping_address varchar(255),
payment_method varchar(20),
order_status varchar(50),
tracking_number varchar(100),
items_in_cart int,
coupon_code varchar(50),
referral_source varchar(50),
total_price decimal(10,2)
);

-- VIEWING FULL DATASET
SELECT * FROM sales_data

-- TOTAL NUMBERS OF ORDER
SELECT COUNT(*) FROM sales_data

-- TOTAL REVENUE
SELECT SUM(total_price) AS total_revenue FROM Sales_data;

-- AVERAGE ORDER VALUE
SELECT AVG(total_price) AS avg_order_value FROM Sales_data

-- HIGH VALUE ORDERS
SELECT * FROM Sales_data where total_price > 1000;

-- ORDERS WITH SPECIFIC STATUS
SELECT * FROM Sales_data WHERE order_status ='SHIPPED'
SELECT * FROM Sales_data WHERE order_status ='CANCELLED'
SELECT * FROM Sales_data WHERE order_status ='DELIVERED'

-- HIGHEST ORDER
SELECT order_id, product FROM Sales_data ORDER BY total_price DESC;


-- REVENUE PER PRODUCT
SELECT product, SUM(total_price) AS total_revenue FROM Sales_data GROUP BY product ORDER BY total_revenue DESC;

-- ORDERS PER PRODUCT
SELECT product, COUNT(*) AS total_order FROM Sales_data GROUP BY product ORDER BY total_order DESC;

-- ORDERS PER PAYMENT METHOD
SELECT Payment_method, COUNT(*) AS total_orders FROM Sales_data GROUP BY payment_method;

-- REVENUE BY PAYMENT METHOD
SELECT payment_method, SUM(total_price) AS revenue FROM Sales_data GROUP BY payment_method ORDER BY revenue DESC;

-- REERRAL SOURCE PERFORMANCE
SELECT referral_source, Count(*) as total_order from Sales_data group by referral_source order by total_order desc;

-- REFERRAL SOURCE  REVENUE
SELECT referral_source, SUM(total_price) AS revenue From Sales_data GROUP BY referral_source ORDER BY revenue DESC;

-- ORDER STATUS BREAKDOWN
SELECT order_status, COUNT(*) AS total_orders FROM Sales_data GROUP BY order;

-- AVERAGE QUANTITY PER PRODUCT
SELECT product, avg(quantity) as avg_quantity from Sales_data group by product order by avg_quantity desc;

-- TOP PRODUCT BY REVENUE
SELECT product, SUM(total_price) AS total_revenue FROM sales_data GROUP BY product ORDER BY total_revenue DESC LIMIT 1;

-- TOP 3 PRODUCT BY REVENUE
SELECT product, SUM(total_price) AS total_revenue FROM sales_data GROUP BY product ORDER BY total_revenue DESC LIMIT 3;

-- TOP PRODUCT BY ORDER
SELECT product, Count(*) as total_order from sales_data group by product order by total_order DESC LIMIT 1

-- TOP 3 PRODUCT BY ORDER
SELECT product, Count(*) as total_order from sales_data group by product order by total_order DESC LIMIT 3

-- MONTHLY SALES TREND
SELECT 
YEAR(date) AS YEAR,
MONTH(date) AS MONTH,
SUM(total_price) as total_revenue
FROM Sales_data
group by year (date), month (date)
order by year, month;

-- MONTLY REVENUE SUMMARY
SELECT DATE_FORMAT(date, '%Y-%m') as MONTH,
sum(total_price) as total_revenue from Sales_data group by date_format(date, '%Y-%m')
order by month;

-- MONTH WITH HIGHEST SALES
SELECT DATE_FORMAT(date, '%Y-%m') as month,
sum(total_price) as total_revenue from Sales_data group by month
order by total_revenue desc limit 1;

-- MONTH WITH LOWEST SALES
SELECT DATE_FORMAT(date, '%Y-%m') as month,
sum(total_price) as total_revenue from Sales_data group by month
order by total_revenue ASC limit 1;

-- CONFIRMING DATE FORMAT
SELECT date from Sales_data limit 5