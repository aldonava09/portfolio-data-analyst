-- =========================================
-- 01_create_tables.sql
-- Project: Lending Club Portfolio Risk Analysis
-- Description: Database schema definition
-- =========================================

-- Borrowers

CREATE TABLE borrowers (
    borrower_id SERIAL PRIMARY KEY,
    annual_income NUMERIC,
    employment_length VARCHAR(20),
    home_ownership VARCHAR(20),
    credit_score INTEGER,
    purpose VARCHAR(50)
);

-- Loan_status

CREATE TABLE loan_status (
    loan_status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(100) UNIQUE
);

-- Loans

CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    borrower_id INTEGER REFERENCES borrowers(borrower_id),
    loan_amount NUMERIC,
    interest_rate NUMERIC,
    term_months INTEGER,
    issue_date DATE,
    loan_status_id INTEGER REFERENCES loan_status(loan_status_id)
);

-- Payments

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    loan_id INTEGER REFERENCES loans(loan_id),
    total_payment NUMERIC,
    principal_paid NUMERIC,
    interest_paid NUMERIC,
    last_payment_date DATE
);
