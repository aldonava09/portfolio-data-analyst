/* 
---------------------------
Clara Case Study
Funnel Modeling PostgreSQL
Author: Aldo Navarro
---------------------------
*/

/* --- 1. CREATE SCHEMAS --- */

CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS analytics;

/* --- 2. CREATE RAW TABLES --- */

CREATE TABLE IF NOT EXISTS raw.home_page (
    user_id INT,
    page TEXT
);

CREATE TABLE IF NOT EXISTS raw.search_page (
    user_id INT,
    page TEXT
);

CREATE TABLE IF NOT EXISTS raw.payment_page (
    user_id INT,
    page TEXT
);

CREATE TABLE IF NOT EXISTS raw.payment_confirmation_page (
    user_id INT,
    page TEXT
);

CREATE TABLE IF NOT EXISTS raw.users (
    user_id INT,
    date DATE,
    device TEXT,
    sex TEXT
);
   
/* --- 3. BUILD ANALYTICS FUNNEL TABLE --- */

DROP TABLE IF EXISTS analytics.fact_funnel;
CREATE TABLE analytics.fact_funnel AS

WITH max_date AS (
    SELECT MAX(date) AS funnel_date FROM raw.users
),

funnel AS (
    SELECT 
        u.user_id,
        u.device,
        u.sex,
        u.date,
        CASE 
            WHEN u.date = (SELECT funnel_date FROM max_date)
            THEN 'new_user'
            ELSE 'returning_user'
        END AS user_type,
        CASE WHEN h.user_id IS NOT NULL THEN 1 ELSE 0 END AS home,
        CASE WHEN s.user_id IS NOT NULL THEN 1 ELSE 0 END AS search,
        CASE WHEN p.user_id IS NOT NULL THEN 1 ELSE 0 END AS payment,
        CASE WHEN c.user_id IS NOT NULL THEN 1 ELSE 0 END AS confirmation
    FROM raw.users u
    LEFT JOIN raw.home_page h 
        ON u.user_id = h.user_id
    LEFT JOIN raw.search_page s 
        ON u.user_id = s.user_id
    LEFT JOIN raw.payment_page p 
        ON u.user_id = p.user_id
    LEFT JOIN raw.payment_confirmation_page c 
        ON u.user_id = c.user_id
)

SELECT *
FROM funnel;

/* --- 4. GENERAL FUNNEL METRICS --- */

SELECT
    COUNT(*) AS total_users,
    SUM(search)::float / COUNT(*) AS home_to_search_rate,
    SUM(payment)::float / SUM(search) AS search_to_payment_rate,
    SUM(confirmation)::float / SUM(payment) AS payment_to_confirmation_rate,
    SUM(confirmation)::float / COUNT(*) AS overall_conversion_rate
FROM analytics.fact_funnel;

/* --- 5. CONVERSION BY USER TYPE --- */

SELECT
    user_type,
    COUNT(*) AS users,
    SUM(search)::float / COUNT(*) AS home_to_search_rate,
    SUM(payment)::float / SUM(search) AS search_to_payment_rate,
    SUM(confirmation)::float / SUM(payment) AS payment_to_confirmation_rate,
    SUM(confirmation)::float / COUNT(*) AS overall_conversion_rate
FROM analytics.fact_funnel
GROUP BY user_type
ORDER BY overall_conversion_rate DESC;

/* --- 6. CONVERSION BY DEVICE --- */

SELECT
    device,
    COUNT(*) AS users,
    SUM(search)::float / COUNT(*) AS home_to_search_rate,
    SUM(payment)::float / SUM(search) AS search_to_payment_rate,
    SUM(confirmation)::float / SUM(payment) AS payment_to_confirmation_rate,
    SUM(confirmation)::float / COUNT(*) AS overall_conversion_rate
FROM analytics.fact_funnel
GROUP BY device
ORDER BY overall_conversion_rate DESC;

/* --- 7. CONVERSION BY USER TYPE & DEVICE --- */

SELECT
    user_type,
    device,
    COUNT(*) AS users,
    SUM(search)::float / COUNT(*) AS home_to_search_rate,
    SUM(payment)::float / SUM(search) AS search_to_payment_rate,
    SUM(confirmation)::float / SUM(payment) AS payment_to_confirmation_rate,
    SUM(confirmation)::float / COUNT(*) AS overall_conversion_rate
FROM analytics.fact_funnel
GROUP BY user_type, device
ORDER BY user_type, device;

/* --- 6. CONVERSION BY GENDER --- */

SELECT
    sex,
    COUNT(*) AS users,
    SUM(search)::float / COUNT(*) AS home_to_search_rate,
    SUM(payment)::float / SUM(search) AS search_to_payment_rate,
    SUM(confirmation)::float / SUM(payment) AS payment_to_confirmation_rate,
    SUM(confirmation)::float / COUNT(*) AS overall_conversion_rate
FROM analytics.fact_funnel
GROUP BY sex
ORDER BY overall_conversion_rate DESC;