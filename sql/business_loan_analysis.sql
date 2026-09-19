```sql
-- ============================================================
-- BUSINESS LOAN APPROVAL ANALYSIS
-- SQL Project: Automating Business Loan Approval System
-- Database: PostgreSQL
-- ============================================================


-- ============================================================
-- 1. DATABASE AND TABLE CREATION
-- ============================================================

CREATE TABLE sba_loan_data (
    LoanNr_ChkDgt TEXT,
    Name TEXT,
    City TEXT,
    State TEXT,
    Zip TEXT,
    Bank TEXT,
    BankState TEXT,
    NAICS TEXT,
    ApprovalDate TEXT,
    ApprovalFY TEXT,
    Term TEXT,
    NoEmp TEXT,
    NewExist TEXT,
    CreateJob TEXT,
    RetainedJob TEXT,
    FranchiseCode TEXT,
    UrbanRural TEXT,
    RevLineCr TEXT,
    LowDoc TEXT,
    ChgOffDate TEXT,
    DisbursementDate TEXT,
    DisbursementGross TEXT,
    BalanceGross TEXT,
    MIS_Status TEXT,
    ChgOffPrinGr TEXT,
    GrAppv TEXT,
    SBA_Appv TEXT
);


-- ============================================================
-- 2. SAMPLE DATASET CREATION
-- ============================================================

CREATE TABLE sample_loans AS
SELECT *
FROM sba_loan_data
LIMIT 100;

SELECT COUNT(*)
FROM sample_loans;

SELECT *
FROM sample_loans
LIMIT 5;


-- ============================================================
-- 3. DDL OPERATIONS
-- ============================================================

ALTER TABLE sample_loans
ADD COLUMN loan_decision VARCHAR(20);

SELECT *
FROM sample_loans
LIMIT 5;


-- ============================================================
-- 4. DML OPERATIONS
-- ============================================================

-- UPDATE Operation

UPDATE sample_loans
SET loan_decision = 'Pending';


-- Verification Query

SELECT
    loan_decision,
    COUNT(*)
FROM sample_loans
GROUP BY loan_decision;


-- DELETE Operation

DELETE FROM sample_loans
WHERE LoanNr_ChkDgt = '1000034009';


-- ============================================================
-- 5. DATA ANALYSIS QUERIES
-- ============================================================

-- 5.1 Total Loans

SELECT COUNT(*) AS Total_Loans
FROM sba_loan_data;


-- 5.2 Top 10 States by Loan Applications

SELECT
    State,
    COUNT(*) AS Total_Loans
FROM sba_loan_data
GROUP BY State
ORDER BY Total_Loans DESC
LIMIT 10;


-- 5.3 Top 10 Industries by Loan Applications

SELECT
    NAICS,
    COUNT(*) AS Loans
FROM sba_loan_data
GROUP BY NAICS
ORDER BY Loans DESC
LIMIT 10;


-- 5.4 Loan Size Classification

SELECT
    CASE
        WHEN REPLACE(REPLACE(TRIM(GrAppv), '$', ''), ',', '')::NUMERIC < 50000
            THEN 'Small Loan'

        WHEN REPLACE(REPLACE(TRIM(GrAppv), '$', ''), ',', '')::NUMERIC
             BETWEEN 50000 AND 200000
            THEN 'Medium Loan'

        ELSE 'Large Loan'
    END AS Loan_Size,

    COUNT(*) AS Applications

FROM sba_loan_data

GROUP BY Loan_Size
ORDER BY Applications DESC;


-- ============================================================
-- 6. INNER JOIN ANALYSIS
-- ============================================================

CREATE TABLE loan_status_subset AS
SELECT
    LoanNr_ChkDgt,
    MIS_Status,
    GrAppv
FROM sba_loan_data;


CREATE TABLE borrower_subset AS
SELECT
    LoanNr_ChkDgt,
    Name,
    State,
    Bank
FROM sba_loan_data;


SELECT
    b.LoanNr_ChkDgt,
    b.Name,
    b.State,
    b.Bank,
    l.MIS_Status,
    l.GrAppv
FROM borrower_subset b
INNER JOIN loan_status_subset l
    ON b.LoanNr_ChkDgt = l.LoanNr_ChkDgt
LIMIT 20;


-- ============================================================
-- 7. ADVANCED SQL ANALYTICS USING WINDOW FUNCTIONS
-- ============================================================

-- 7.1 Approved / Declined Cohorts

SELECT
    CASE
        WHEN MIS_Status = 'P I F'
            THEN 'Approved Cohort'

        WHEN MIS_Status = 'CHGOFF'
            THEN 'Declined Cohort'

        ELSE 'Unknown'
    END AS Loan_Cohort,

    COUNT(*) AS Total_Customers,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(),
        2
    ) AS Percentage

FROM sba_loan_data

GROUP BY Loan_Cohort
ORDER BY Total_Customers DESC;


-- 7.2 Top 5 Ideal Loan Applicants

SELECT *
FROM
(
    SELECT
        Name,
        Bank,
        City,
        State,
        GrAppv,

        ROW_NUMBER() OVER(
            ORDER BY
                REPLACE(
                    REPLACE(GrAppv, '$', ''),
                    ',',
                    ''
                )::NUMERIC DESC
        ) AS Customer_Rank

    FROM sba_loan_data

    WHERE MIS_Status = 'P I F'

) Ranked_Customers

WHERE Customer_Rank <= 5;


-- ============================================================
-- 8. FINAL LOAN ELIGIBILITY QUERY
-- ============================================================

ALTER TABLE sba_loan_data
ADD COLUMN IF NOT EXISTS loan_eligibility VARCHAR(20);


SELECT
    Name,
    Bank,
    City,
    State,
    MIS_Status,

    REPLACE(
        REPLACE(GrAppv, '$', ''),
        ',',
        ''
    )::NUMERIC AS Approved_Loan,

    loan_eligibility

FROM sba_loan_data

ORDER BY Approved_Loan DESC;


-- ============================================================
-- END OF PROJECT
-- ============================================================
```
