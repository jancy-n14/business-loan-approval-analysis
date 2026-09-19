# Business Loan Approval Analysis

## Project Overview

This project analyzes historical business loan data to understand borrower repayment patterns and factors associated with different loan outcomes.

The analysis uses SQL to clean, explore, aggregate, and analyze loan data, with the goal of supporting data-driven decision-making in business loan assessment.

## Objectives

- Analyze historical business loan data
- Understand loan repayment outcomes
- Explore borrower and loan characteristics
- Identify patterns across states, industries, and loan sizes
- Use SQL to transform and analyze the dataset
- Create a structured decision-support framework based on historical data

## Dataset

The project uses historical SBA loan data stored in the `sba_loan_data` table.

**Dataset size:** 899,165 loan records

### Key Loan Outcomes

| Metric | Value |
|---|---:|
| Total Loans | 899,165 |
| Paid In Full | 739,610 |
| Charged Off | 157,558 |
| Average Approved Loan Amount | $192,686.82 |

## Tools & Technologies

- PostgreSQL
- SQL
- Data Cleaning
- Exploratory Data Analysis
- Data Aggregation
- Joins
- Decision-support analysis

##  Analysis Performed

### 1. Geographic Analysis

The analysis examined loan distribution across U.S. states and identified states with higher numbers of historical loans.

### 2. Industry Analysis

Loan records were analyzed using NAICS industry classifications to understand the distribution of loans across different business sectors.

### 3. Loan Size Analysis

Loans were grouped into:

- Small
- Medium
- Large

to examine differences in loan distribution.

### 4. Loan Status Analysis

Historical loan outcomes were examined using the `MIS_Status` field, including:

- Paid In Full (P I F)
- Charged Off (CHGOFF)

 5. SQL Joins
Separate subsets of loan status and borrower information were created and combined using an `INNER JOIN` to bring together:

- Loan Number
- Business Name
- State
- Lending Bank
- Loan Status
- Approved Loan Amount

 📊 Key Findings
 Top States by Number of Loans

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

 Loan Size Distribution

| Loan Size | Number of Loans |
|---|---:|
| Medium | 376,690 |
| Small | 279,942 |
| Large | 242,533 |

 SQL Skills Demonstrated

- CREATE TABLE
- ALTER TABLE
- UPDATE
- DELETE
- SELECT
- WHERE conditions
- Aggregations
- GROUP BY
- INNER JOIN
- Data filtering and transformation
- Window functions

 Project Structure

```text
business-loan-approval-analysis/
│
├── README.md
│
├── sql/
│   └── business_loan_analysis.sql
│
└── screenshots/
    └── project-results/
```

 Conclusion

The project demonstrates how SQL can be used to analyze historical business loan data, identify patterns in borrower and loan outcomes, and organize information into a structured decision-support framework.

---

**Project:** Automating Business Loan Approval System Using Historical Borrower Data  
**Focus:** SQL-Based Risk Assessment and Decision Support Framework
