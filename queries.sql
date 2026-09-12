-- Retail Sales Data Validation & Performance Dashboard
-- SQL Analysis Queries

-- ============================================
-- SETUP
-- ============================================
CREATE TABLE orders (
    row_id INT,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    region VARCHAR(50),
    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    sales NUMERIC(10,2),
    quantity INT,
    discount NUMERIC(4,2),
    profit NUMERIC(10,2)
);

-- ============================================
-- DATA VALIDATION
-- ============================================

-- Check 1: No order should ship before it was placed
SELECT order_id, order_date, ship_date
FROM orders
WHERE order_date > ship_date;
-- Result: 0 rows — data passes logical consistency check

-- ============================================
-- ANALYSIS
-- ============================================

-- Revenue and profit by region
SELECT region, ROUND(SUM(sales)::numeric, 2) AS total_sales, ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

-- Top 10 products by profit
SELECT product_name, ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM orders
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- Monthly sales trend
SELECT DATE_TRUNC('month', order_date) AS month, ROUND(SUM(sales)::numeric, 2) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

-- Loss-making order detection (anomaly check)
SELECT COUNT(*) AS loss_making_orders, ROUND(SUM(profit)::numeric, 2) AS total_loss
FROM orders
WHERE profit < 0;

-- Profit by discount band — root cause analysis
SELECT
  CASE
    WHEN discount = 0 THEN 'No Discount'
    WHEN discount <= 0.2 THEN 'Low (1-20%)'
    WHEN discount <= 0.4 THEN 'Medium (21-40%)'
    ELSE 'High (40%+)'
  END AS discount_band,
  COUNT(*) AS order_count,
  ROUND(SUM(profit)::numeric, 2) AS total_profit,
  ROUND(AVG(profit)::numeric, 2) AS avg_profit_per_order
FROM orders
GROUP BY discount_band
ORDER BY avg_profit_per_order;
