-- =====================================================
-- 04_revenue_calculations.sql
-- Project: Product Revenue Drivers Analysis
-- Description: Core revenue and pricing calculations
-- =====================================================

-- =====================================================
-- 1. Revenue calculation per transaction (logical base)
-- Revenue is calculated using:
-- Unit Price * Quantity * (1 - Discount)
-- TotalPrice field is NOT used due to inconsistencies

SELECT
    s.salesid,
    s.productid,
    s.quantity,
    p.price AS unit_price,
    s.discount,
    (s.quantity * p.price * (1 - s.discount)) AS revenue
FROM sales s
JOIN products p
    ON s.productid = p.productid;

-- =====================================================
-- 2. Total Revenue

SELECT
    SUM(s.quantity * p.price * (1 - s.discount)) AS total_revenue
FROM sales s
JOIN products p
    ON s.productid = p.productid;

-- =====================================================
-- 3. Revenue by Product

SELECT
    p.productid,
    p.productname,
    SUM(s.quantity * p.price * (1 - s.discount)) AS revenue
FROM sales s
JOIN products p
    ON s.productid = p.productid
GROUP BY
    p.productid,
    p.productname
ORDER BY revenue DESC;

-- =====================================================
-- 4. Units Sold by Product

SELECT
    p.productid,
    p.productname,
    SUM(s.quantity) AS units_sold
FROM sales s
JOIN products p
    ON s.productid = p.productid
GROUP BY
    p.productid,
    p.productname
ORDER BY units_sold DESC;

-- =====================================================
-- 5. Average Selling Price by Product
-- Weighted average price:
-- Revenue / Units Sold

SELECT
    p.productid,
    p.productname,
    SUM(s.quantity * p.price * (1 - s.discount))
        / NULLIF(SUM(s.quantity), 0) AS avg_selling_price
FROM sales s
JOIN products p
    ON s.productid = p.productid
GROUP BY
    p.productid,
    p.productname
ORDER BY avg_selling_price DESC;

-- =====================================================
-- 6. Revenue by Category

SELECT
    c.categoryid,
    c.categoryname,
    SUM(s.quantity * p.price * (1 - s.discount)) AS revenue
FROM sales s
JOIN products p
    ON s.productid = p.productid
JOIN categories c
    ON p.categoryid = c.categoryid
GROUP BY
    c.categoryid,
    c.categoryname
ORDER BY revenue DESC;

-- =====================================================
-- 7. Units Sold by Category

SELECT
    c.categoryid,
    c.categoryname,
    SUM(s.quantity) AS units_sold
FROM sales s
JOIN products p
    ON s.productid = p.productid
JOIN categories c
    ON p.categoryid = c.categoryid
GROUP BY
    c.categoryid,
    c.categoryname
ORDER BY units_sold DESC;

-- =====================================================
-- 8. Average Selling Price by Category

SELECT
    c.categoryid,
    c.categoryname,
    SUM(s.quantity * p.price * (1 - s.discount))
        / NULLIF(SUM(s.quantity), 0) AS avg_selling_price
FROM sales s
JOIN products p
    ON s.productid = p.productid
JOIN categories c
    ON p.categoryid = c.categoryid
GROUP BY
    c.categoryid,
    c.categoryname
ORDER BY avg_selling_price DESC;