#create database named online_sales
create database online_sales;
use online_sales;
#created table order_a
CREATE TABLE order_a (
    transaction_id INT,
    date DATE,
    product_category VARCHAR(100),
    product_name VARCHAR(255),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_revenue DECIMAL(10,2),
    region VARCHAR(100),
    payment_method VARCHAR(100)
);
#imported csv file using table data import wizard
#analyzed monthly revenue and order volume
SELECT
    YEAR(date) AS order_year,
    MONTH(date) AS order_month,
    SUM(total_revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS order_volume
FROM order_a
GROUP BY YEAR(date), MONTH(date)
ORDER BY order_year, order_month;

SELECT
    EXTRACT(MONTH FROM date) AS order_month
FROM order_a;
SELECT
    EXTRACT(YEAR FROM date) AS order_year,
    EXTRACT(MONTH FROM date) AS order_month
FROM order_a
GROUP BY EXTRACT(YEAR FROM date), EXTRACT(MONTH FROM date);
SELECT
    EXTRACT(YEAR FROM date) AS order_year,
    EXTRACT(MONTH FROM date) AS order_month,
    SUM(total_revenue) AS total_revenue
FROM order_a
GROUP BY EXTRACT(YEAR FROM date), EXTRACT(MONTH FROM date);
select * from order_a order by date desc;
SELECT COUNT(DISTINCT transaction_id) as transaction_id from order_a where product_category='sports';
select sum(units_sold) as unit_sold from order_a;
select transaction_id,units_sold,count(*) from order_a group by transaction_id,units_sold;
select * from order_a WHERE YEAR(date) = 2024;
SELECT
    EXTRACT(YEAR FROM date) AS order_year,
    EXTRACT(MONTH FROM date) AS order_month,
    SUM(total_revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS order_volume
FROM order_a
WHERE date BETWEEN '2024-01-01' AND '2024-12-31' 
GROUP BY EXTRACT(YEAR FROM date), EXTRACT(MONTH FROM date)  
ORDER BY order_year, order_month;

