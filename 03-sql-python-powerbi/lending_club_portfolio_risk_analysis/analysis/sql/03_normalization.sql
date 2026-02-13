-- =========================================
-- 03_normalization.sql
-- Project: Lending Club Portfolio Risk Analysis
-- Description: Normalize staging data into relational model
-- =========================================

-- Loan Status

INSERT INTO loan_status (status_name)
SELECT DISTINCT 
	CASE 
		WHEN loan_status ILIKE '%Fully Paid%' THEN 'Fully Paid'
		WHEN loan_status ILIKE '%Charged Off%' THEN 'Charged Off'
		WHEN loan_status ILIKE '%Current%' THEN 'Current'
		WHEN loan_status ILIKE '%Late%' THEN 'Late'
		WHEN loan_status ILIKE '%Grace%' THEN 'Late'
		ELSE 'Other'
	END AS status_clean
FROM staging_loans;

-- Borrowers 

INSERT INTO borrowers (
    annual_income,
    employment_length,
    home_ownership,
    credit_score,
    purpose
)
SELECT DISTINCT
    annual_inc,
    emp_length,
    home_ownership,
    fico_range_high::INTEGER,
    purpose
FROM staging_loans
WHERE annual_inc IS NOT NULL
  AND fico_range_high IS NOT NULL;

-- Loans

INSERT INTO loans (
    borrower_id,
    loan_amount,
    interest_rate,
    term_months,
    issue_date,
    loan_status_id
)
SELECT
    b.borrower_id,
    s.loan_amnt,
    REPLACE(s.int_rate, '%', '')::NUMERIC AS interest_rate,
    REPLACE(s.term, ' months', '')::INTEGER AS term_months,
    TO_DATE(s.issue_d, 'Mon-YYYY') AS issue_date,
    ls.loan_status_id
FROM staging_loans s
JOIN borrowers b
    ON s.annual_inc = b.annual_income
   AND s.emp_length = b.employment_length
   AND s.home_ownership = b.home_ownership
   AND s.fico_range_high::INTEGER = b.credit_score
   AND s.purpose = b.purpose
JOIN loan_status ls
    ON (
        CASE
            WHEN s.loan_status ILIKE '%Late%' THEN 'Late'
        WHEN s.loan_status ILIKE '%Grace%' THEN 'Late'
            WHEN s.loan_status ILIKE '%Fully Paid%' THEN 'Fully Paid'
            WHEN s.loan_status ILIKE '%Charged Off%' THEN 'Charged Off'
            WHEN s.loan_status ILIKE '%Current%' THEN 'Current'
            ELSE 'Other'
        END
    ) = ls.status_name;

-- Loan Map 

CREATE TABLE loan_map AS
SELECT
    ROW_NUMBER() OVER () AS rn,
    loan_id
FROM loans;

Acomodar orden en staging 
CREATE TABLE staging_map AS
SELECT
    ROW_NUMBER() OVER () AS rn,
    total_pymnt,
    total_rec_prncp,
    total_rec_int,
    TO_DATE(last_pymnt_d, 'Mon-YYYY') AS last_payment_date
FROM staging_loans s
WHERE EXISTS (
    SELECT 1
    FROM loans l
    WHERE
        s.loan_amnt = l.loan_amount
        AND s.issue_date_parsed = l.issue_date
);

-- Payments

Insertar payments 

INSERT INTO payments (
    loan_id,
    total_payment,
    principal_paid,
    interest_paid,
    last_payment_date
)
SELECT
    lm.loan_id,
    sm.total_pymnt,
    sm.total_rec_prncp,
    sm.total_rec_int,
    sm.last_payment_date
FROM loan_map lm
JOIN staging_map sm
  ON lm.rn = sm.rn;