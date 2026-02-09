-- =====================================================
-- 05_business_questions.sql
-- Project: Product Revenue Drivers Analysis
-- Description: Business-driven SQL analysis
-- =====================================================

-- =====================================================
-- Q1. What are the top products by revenue?

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
ORDER BY revenue DESC
LIMIT 10;

-- =====================================================
-- Q2. Which categories generate the highest revenue?

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
-- Q3. Is revenue driven more by volume or by price?
-- Comparing revenue, units sold, and average selling price by product

SELECT
    p.productid,
    p.productname,
    SUM(s.quantity) AS units_sold,
    SUM(s.quantity * p.price * (1 - s.discount)) AS revenue,
    SUM(s.quantity * p.price * (1 - s.discount))
        / NULLIF(SUM(s.quantity), 0) AS avg_selling_price
FROM sales s
JOIN products p
    ON s.productid = p.productid
GROUP BY
    p.productid,
    p.productname
ORDER BY revenue DESC;

-- =====================================================
-- Q4. Are there products with high volume but low revenue?

SELECT
    p.productid,
    p.productname,
    SUM(s.quantity) AS units_sold,
    SUM(s.quantity * p.price * (1 - s.discount)) AS revenue
FROM sales s
JOIN products p
    ON s.productid = p.productid
GROUP BY
    p.productid,
    p.productname
HAVING SUM(s.quantity) > 0
   AND SUM(s.quantity * p.price * (1 - s.discount)) = 0
ORDER BY units_sold DESC;

-- =====================================================
-- Q5. Which products have zero price but significant volume?

SELECT
    p.productid,
    p.productname,
    p.price,
    SUM(s.quantity) AS units_sold
FROM sales s
JOIN products p
    ON s.productid = p.productid
WHERE p.price = 0
GROUP BY
    p.productid,
    p.productname,
    p.price
ORDER BY units_sold DESC;

-- =====================================================
-- Q6. How does pricing differ across categories?

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

-- =====================================================
-- Q7. Do higher-priced categories generate higher revenue?

SELECT
    c.categoryid,
    c.categoryname,
    SUM(s.quantity) AS units_sold,
    SUM(s.quantity * p.price * (1 - s.discount)) AS revenue,
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
ORDER BY revenue DESC;
