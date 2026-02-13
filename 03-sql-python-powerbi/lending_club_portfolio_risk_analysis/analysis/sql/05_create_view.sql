-- =========================================
-- 05_create_view.sql
-- Project: Lending Club Portfolio Risk Analysis
-- Description: Create clean analysis dataset view
-- =========================================

-- Loan Analysis Dataset View

CREATE OR REPLACE VIEW loan_analysis_dataset AS
SELECT
    l.loan_id,
    CASE
        WHEN b.credit_score < 600 THEN 'Poor (<600)'
        WHEN b.credit_score BETWEEN 600 AND 649 THEN 'Fair (600-649)'
        WHEN b.credit_score BETWEEN 650 AND 699 THEN 'Good (650-699)'
        WHEN b.credit_score BETWEEN 700 AND 749 THEN 'Very Good (700-749)'
        ELSE 'Excellent (750+)'
    END AS credit_score_bucket,
    l.term_months,
    l.loan_amount,
    p.total_payment,
    p.interest_paid,
    ls.status_name AS loan_status,
    CASE
        WHEN ls.status_name = 'Charged Off' THEN 1
        ELSE 0
    END AS is_default,
    CASE
        WHEN ls.status_name = 'Late' THEN 1
        ELSE 0
    END AS is_late,
    ROUND(
        p.interest_paid::NUMERIC
        / NULLIF(l.loan_amount, 0) * 100,
        2
    ) AS roi_percentage
FROM loans l
JOIN borrowers b
    ON l.borrower_id = b.borrower_id
JOIN payments p
    ON l.loan_id = p.loan_id
JOIN loan_status ls
    ON l.loan_status_id = ls.loan_status_id;