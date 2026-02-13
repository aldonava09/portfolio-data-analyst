-- =========================================
-- 02_staging_table.sql
-- Project: Lending Club Portfolio Risk Analysis
-- Description: Create staging table for raw CSV import
-- =========================================

-- Staging Loans

CREATE TABLE staging_loans (
    annual_inc NUMERIC,
    emp_length VARCHAR(20),
    home_ownership VARCHAR(20),
    fico_range_high NUMERIC,
    purpose VARCHAR(50),
    loan_amnt NUMERIC,
    int_rate NUMERIC,
    term VARCHAR(20),
    issue_d DATE,
    loan_status VARCHAR(100),
    total_pymnt NUMERIC,
    total_rec_prncp NUMERIC,
    total_rec_int NUMERIC,
    last_pymnt_d DATE
);
