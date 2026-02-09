-- =====================================================
-- 02_data_validation.sql
-- Project: Product Revenue Drivers Analysis
-- Description: Data quality and integrity validation
-- =====================================================

-- =========================
-- 1. Row count per table

SELECT COUNT(*) AS total_categories FROM categories;
SELECT COUNT(*) AS total_countries FROM countries;
SELECT COUNT(*) AS total_cities FROM cities;
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_employees FROM employees;
SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_sales FROM sales;

-- =========================
-- 2. Primary key uniqueness

SELECT CategoryID, COUNT(*) 
FROM categories
GROUP BY CategoryID
HAVING COUNT(*) > 1;

SELECT ProductID, COUNT(*) 
FROM products
GROUP BY ProductID
HAVING COUNT(*) > 1;

SELECT SalesID, COUNT(*) 
FROM sales
GROUP BY SalesID
HAVING COUNT(*) > 1;

-- =========================
-- 3. Null and suspicious values

-- Products with missing or zero price
SELECT *
FROM products
WHERE price IS NULL OR price = 0;

-- Sales with null quantity or discount
SELECT *
FROM sales
WHERE quantity IS NULL
   OR discount IS NULL;

-- Customers with missing city
SELECT *
FROM customers
WHERE cityid IS NULL;

-- =========================
-- 4. Referential integrity checks

-- Sales without matching product
SELECT s.*
FROM sales s
LEFT JOIN products p
    ON s.productid = p.productid
WHERE p.productid IS NULL;

-- Sales without matching customer
SELECT s.*
FROM sales s
LEFT JOIN customers c
    ON s.customerid = c.customerid
WHERE c.customerid IS NULL;

-- Products without category
SELECT p.*
FROM products p
LEFT JOIN categories c
    ON p.categoryid = c.categoryid
WHERE c.categoryid IS NULL;

-- =========================
-- 5. Revenue sanity checks

-- Sales where TotalPrice is zero
SELECT *
FROM sales
WHERE totalprice = 0;

-- Sales with discount greater than 100%
SELECT *
FROM sales
WHERE discount > 1;

-- =========================
-- 6. Date validation

-- Sales with missing dates
SELECT *
FROM sales
WHERE salesdate IS NULL;

-- Min and max sales date
SELECT 
    MIN(salesdate) AS min_sales_date,
    MAX(salesdate) AS max_sales_date
FROM sales;
