-- =========================================
-- 04_business_questions.sql
-- Project: Lending Club Portfolio Risk Analysis
-- Description: Business questions backed by executed SQL queries
-- =========================================

-- =====================================================
-- Q1. What is the overall default rate of the portfolio?

SELECT
    COUNT(*) AS total_loans,
    SUM(CASE WHEN ls.status_name = 'Charged Off' THEN 1 ELSE 0 END) AS total_defaults,
    ROUND(
        SUM(CASE WHEN ls.status_name = 'Charged Off' THEN 1 ELSE 0 END)::NUMERIC
        / COUNT(*) * 100,
        2
    ) AS default_rate_percentage
FROM loans l
JOIN loan_status ls
    ON l.loan_status_id = ls.loan_status_id;

-- =====================================================
-- Q2. Does loan term 36 vs 60 months impact default risk?

SELECT
    l.term_months,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN ls.status_name = 'Charged Off' THEN 1 ELSE 0 END) AS total_defaults,
    ROUND(
        SUM(CASE WHEN ls.status_name = 'Charged Off' THEN 1 ELSE 0 END)::NUMERIC
        / COUNT(*) * 100,
        2
    ) AS default_rate_percentage
FROM loans l
JOIN loan_status ls
    ON l.loan_status_id = ls.loan_status_id
GROUP BY l.term_months
ORDER BY l.term_months;

-- =====================================================
-- Q3. Does loan term impact ROI?

SELECT
    l.term_months,
    COUNT(*) AS total_loans,
    ROUND(
        SUM(p.interest_paid)::NUMERIC
        / NULLIF(SUM(l.loan_amount), 0) * 100,
        2
    ) AS portfolio_roi_percentage
FROM loans l
JOIN payments p
    ON l.loan_id = p.loan_id
GROUP BY l.term_months
ORDER BY l.term_months;

-- =====================================================
-- Q4. Does credit score stratify default risk?

SELECT
    CASE
        WHEN b.credit_score >= 750 THEN 'Excellent (750+)'
        WHEN b.credit_score BETWEEN 700 AND 749 THEN 'Very Good (700-749)'
        WHEN b.credit_score BETWEEN 650 AND 699 THEN 'Good (650-699)'
        WHEN b.credit_score BETWEEN 600 AND 649 THEN 'Fair (600-649)'
        ELSE 'Poor (<600)'
    END AS credit_score_bucket,
    COUNT(*) AS total_loans,
    ROUND(
        SUM(CASE WHEN ls.status_name = 'Charged Off' THEN 1 ELSE 0 END)::NUMERIC
        / COUNT(*) * 100,
        2
    ) AS default_rate_percentage
FROM loans l
JOIN borrowers b
    ON l.borrower_id = b.borrower_id
JOIN loan_status ls
    ON l.loan_status_id = ls.loan_status_id
GROUP BY credit_score_bucket
ORDER BY default_rate_percentage DESC;

-- =====================================================
-- Q5. Which credit score and term combinations are most efficient?

SELECT
    CASE
        WHEN b.credit_score >= 750 THEN 'Excellent (750+)'
        WHEN b.credit_score BETWEEN 700 AND 749 THEN 'Very Good (700-749)'
        WHEN b.credit_score BETWEEN 650 AND 699 THEN 'Good (650-699)'
        WHEN b.credit_score BETWEEN 600 AND 649 THEN 'Fair (600-649)'
        ELSE 'Poor (<600)'
    END AS credit_score_bucket,
    l.term_months,
    COUNT(*) AS total_loans,
    ROUND(
        SUM(CASE WHEN ls.status_name = 'Charged Off' THEN 1 ELSE 0 END)::NUMERIC
        / COUNT(*) * 100,
        2
    ) AS default_rate_percentage,
    ROUND(
        SUM(p.interest_paid)::NUMERIC
        / NULLIF(SUM(l.loan_amount), 0) * 100,
        2
    ) AS portfolio_roi_percentage
FROM loans l
JOIN borrowers b
    ON l.borrower_id = b.borrower_id
JOIN loan_status ls
    ON l.loan_status_id = ls.loan_status_id
JOIN payments p
    ON l.loan_id = p.loan_id
GROUP BY credit_score_bucket, l.term_months
ORDER BY credit_score_bucket, l.term_months;

-- =====================================================
-- Q6. Is there early deterioration in long-term loans? 

SELECT
    l.term_months,
    COUNT(*) AS total_loans,
    ROUND(
        SUM(CASE WHEN ls.status_name = 'Late' THEN 1 ELSE 0 END)::NUMERIC
        / COUNT(*) * 100,
        2
    ) AS late_rate_percentage
FROM loans l
JOIN loan_status ls
    ON l.loan_status_id = ls.loan_status_id
GROUP BY l.term_months
ORDER BY l.term_months;