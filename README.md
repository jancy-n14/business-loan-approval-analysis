# Business Loan Approval Analysis

### A SQL-Based Analysis and Decision Support Framework

##  Project Overview

This project analyzes historical business loan data to understand loan outcomes, borrower characteristics, loan distribution, and lending patterns.

Using PostgreSQL and SQL, the project demonstrates how historical loan data can be cleaned, transformed, analyzed, and summarized to support data-driven decision-making.

##  Objectives

- Analyze historical business loan records.
- Understand loan repayment outcomes.
- Identify states and industries with higher numbers of loans.
- Categorize loans based on approved loan amount.
- Combine borrower and loan-status information using SQL JOINs.
- Apply SQL window functions to analyze loan outcomes and identify top loan records.
- Demonstrate SQL techniques used for business data analysis and decision support.

##  Dataset

The dataset contains historical U.S. Small Business Administration (SBA) loan records.

**Total Loan Records:** 899,165

### Key Loan Outcomes

| Metric | Value |
|---|---:|
| Total Loans | 899,165 |
| Paid In Full | 739,610 |
| Charged Off | 157,558 |
| Average Approved Loan Amount | $192,686.82 |

##  Tools & Technologies

- PostgreSQL
- SQL
- Data Cleaning & Transformation
- Data Aggregation
- Data Analysis
- Window Functions
- SQL JOINs

##  Analysis Performed

### 1. Loan Volume Analysis

Calculated the total number of historical loan records to understand the overall size of the dataset.

### 2. State-Level Analysis

Identified the top states based on the number of loan records.

| State | Number of Loans |
|---|---:|
| CA | 130,619 |
| TX | 70,458 |
| NY | 57,693 |
| FL | 41,212 |
| PA | 35,170 |
| OH | 32,622 |
| IL | 29,669 |
| MA | 25,272 |
| MN | 24,373 |
| NJ | 24,035 |

### 3. Industry Analysis

Analyzed loan distribution across NAICS industry codes to identify industries with higher numbers of loan records.

### 4. Loan Size Classification

Loans were categorized according to their approved loan amount:

- **Small Loan:** Less than $50,000
- **Medium Loan:** $50,000 – $200,000
- **Large Loan:** Above $200,000

### Loan Size Distribution

| Loan Size | Number of Loans |
|---|---:|
| Small | 279,942 |
| Medium | 376,690 |
| Large | 242,533 |

### 5. SQL JOINs

Created separate borrower and loan-status subsets and combined them using an **INNER JOIN** based on the loan number.

The resulting analysis brought together:

- Loan Number
- Business Name
- State
- Lending Bank
- Loan Status
- Approved Loan Amount

### 6. Loan Outcome Cohorts

Used SQL window functions to group loan records based on their historical loan outcomes:

- **Paid In Full (P I F)**
- **Charged Off (CHGOFF)**

The analysis also calculated the count and percentage of records within each outcome group.

### 7. Top Loan Records

Used the `ROW_NUMBER()` window function to rank paid-in-full loan records based on approved loan amount and identify the top records.

##  Key Findings

### Top States by Number of Loans

California had the highest number of loan records in the analyzed dataset, followed by Texas and New York.

### Loan Size Distribution

Medium-sized loans represented the largest loan-size category, followed by small and large loans.

### Loan Outcomes

The dataset contains both paid-in-full and charged-off loan records, allowing historical loan outcomes to be examined using SQL-based analysis.

##  SQL Skills Demonstrated

The project demonstrates practical use of:

- `CREATE TABLE`
- `ALTER TABLE`
- `UPDATE`
- `DELETE`
- `SELECT`
- `WHERE`
- `GROUP BY`
- Aggregate functions
- Data transformation
- `INNER JOIN`
- `CASE` statements
- Window functions
- `ROW_NUMBER()`
- Percentage calculations using window functions
- Sorting and filtering

##  Project Structure

```text
business-loan-approval-analysis/
│
├── README.md
│
└── sql/
    └── business_loan_analysis.sql
```

##  SQL File

The complete SQL queries used for the analysis are available here:

`sql/business_loan_analysis.sql`

##  Conclusion

This project demonstrates how SQL can be used to analyze large historical loan datasets, identify patterns in loan outcomes, and organize information into a structured framework for data-driven decision support.

The project helped strengthen practical skills in SQL querying, data transformation, aggregation, JOINs, and window functions.

###  Focus

**SQL-Based Analysis and Decision Support Framework**
