
-- =====================================================
-- PROJECT: E-COMMERCE SALES & PROFITABILITY ANALYSIS
-- DATABASE: ecommerce_sales
-- TOOLS: MySQL Workbench
-- =====================================================

USE ecommerce_sales;


-- =====================================================
-- 1. DATABASE VALIDATION
-- =====================================================

SHOW TABLES;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_detail_records
FROM details;

SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM details;


-- =====================================================
-- 2. OVERALL BUSINESS KPIs
-- =====================================================

SELECT
    SUM(amount) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(amount) /
        COUNT(DISTINCT order_id), 2) AS average_order_value,
    ROUND(SUM(profit) /
        SUM(amount) * 100, 2) AS profit_margin
FROM details;


-- =====================================================
-- 3. CATEGORY ANALYSIS
-- =====================================================

SELECT
    category,
    SUM(amount) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit) /
        SUM(amount) * 100, 2) AS profit_margin
FROM details
GROUP BY category
ORDER BY total_sales DESC;


-- =====================================================
-- 4. SUB-CATEGORY ANALYSIS
-- =====================================================

SELECT
    sub_category,
    SUM(amount) AS total_sales,
    SUM(profit) AS total_profit
FROM details
GROUP BY sub_category
ORDER BY total_profit DESC;


-- =====================================================
-- 5. MONTHLY SALES ANALYSIS
-- =====================================================

SELECT
    YEAR(o.order_date) AS sales_year,
    MONTHNAME(o.order_date) AS sales_month,
    SUM(d.amount) AS total_sales,
    SUM(d.profit) AS total_profit,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN details d
    ON o.order_id = d.order_id
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date),
    MONTHNAME(o.order_date)
ORDER BY
    sales_year,
    MONTH(o.order_date);


-- =====================================================
-- 6. STATE-WISE ANALYSIS
-- =====================================================

SELECT
    o.state,
    SUM(d.amount) AS total_sales,
    SUM(d.profit) AS total_profit
FROM orders o
JOIN details d
    ON o.order_id = d.order_id
GROUP BY o.state
ORDER BY total_sales DESC;


-- =====================================================
-- 7. CUSTOMER ANALYSIS
-- =====================================================

SELECT
    o.customer_name,
    SUM(d.amount) AS total_sales,
    SUM(d.profit) AS total_profit,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN details d
    ON o.order_id = d.order_id
GROUP BY o.customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- =====================================================
-- 8. PAYMENT MODE ANALYSIS
-- =====================================================

SELECT
    payment_mode,
    SUM(amount) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit) /
        SUM(amount) * 100, 2) AS profit_margin
FROM details
GROUP BY payment_mode
ORDER BY total_sales DESC;


-- =====================================================
-- 9. LOSS-MAKING SUB-CATEGORIES
-- =====================================================

SELECT
    sub_category,
    SUM(amount) AS total_sales,
    SUM(profit) AS total_profit
FROM details
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit;


-- =====================================================
-- 10. ORDER VALUE ANALYSIS
-- =====================================================

SELECT
    order_id,
    SUM(amount) AS order_value,
    SUM(profit) AS order_profit,
    SUM(quantity) AS total_quantity
FROM details
GROUP BY order_id
ORDER BY order_value DESC
LIMIT 10;


-- =====================================================
-- 11. CUSTOMER RANKING
-- =====================================================

WITH customer_sales AS (
    SELECT
        o.customer_name,
        SUM(d.amount) AS total_sales
    FROM orders o
    JOIN details d
        ON o.order_id = d.order_id
    GROUP BY o.customer_name
)
SELECT
    customer_name,
    total_sales,
    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS sales_rank
FROM customer_sales;


-- =====================================================
-- 12. LOSS-MAKING ORDERS
-- =====================================================

SELECT
    order_id,
    SUM(amount) AS order_value,
    SUM(profit) AS order_profit
FROM details
GROUP BY order_id
HAVING SUM(profit) < 0
ORDER BY order_profit;
