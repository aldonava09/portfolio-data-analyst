-- =====================================================
-- 03_data_cleaning.sql
-- Project: Product Revenue Drivers Analysis
-- Description: Data cleaning and standardization
-- =====================================================

-- =====================================================
-- 1. Handle NULL discounts

-- Set NULL discounts to 0 (no discount applied)
UPDATE sales
SET discount = 0
WHERE discount IS NULL;

-- =====================================================
-- 2. Handle NULL quantities

-- Replace NULL quantities with 0 to avoid calculation errors
UPDATE sales
SET quantity = 0
WHERE quantity IS NULL;

-- =====================================================
-- 3. Standardize zero prices

-- Do NOT modify products with price = 0
-- These are treated as promotional or free products
-- This step is intentionally documented but not altered

-- =====================================================
-- 4. Clean NULL TotalPrice values

-- Set NULL TotalPrice to 0 to avoid inconsistencies
UPDATE sales
SET totalprice = 0
WHERE totalprice IS NULL;

-- =====================================================
-- 5. Date consistency check

-- No transformation applied to SalesDate
-- Invalid or NULL dates were identified in validation
-- Records are preserved for transparency