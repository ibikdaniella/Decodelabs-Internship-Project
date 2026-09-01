SQL Data Analysis – Project 3

Project Overview

This project demonstrates the use of SQL Server to analyze a cleaned sales dataset and extract meaningful business insights.

The analysis focuses on SQL fundamentals including:

• SELECT
• WHERE
• ORDER BY
• GROUP BY
• Aggregate functions: COUNT(), SUM(), and AVG()
• Filtering, sorting, grouping, and summarizing business data

Project Goal

To use SQL queries to explore sales transactions, identify patterns, and generate insights that can support business decision-making.

Dataset

File: Cleaned_Dataset_for_Data_Analytics(1).xlsx

The workbook contains a cleaned sales dataset with:

• 1,200 rows
• 14 columns
• 1,200 unique orders
• 1,189 unique customers
• Date coverage: 2023-01-01 to 2025-06-30
• 0 duplicate rows
• 0 missing cells

Analysis Performed

The SQL analysis was used to answer questions such as:

1. What are the total sales?
2. What is the average order value?
3. How many orders are in the dataset?
4. Which products generate the highest sales?
5. How many units of each product were sold?
6. Which payment methods generate the most sales?
7. Which referral sources generate the most sales?
8. How are orders distributed by status?
9. Which orders have a high total value?
10. How does sales performance vary over time?

Key Findings

Overall Performance

• Total order value: 1,264,761.96
• Total quantity sold: 3,535
• Average order value: 1,053.97

Product Performance

The highest-performing products by total order value were Chair and Printer, followed closely by Laptop and Tablet.

Referral Performance

Instagram was the strongest referral source by number of orders and total order value.

Payment Methods

Credit Card generated the highest total order value among the payment methods in the dataset.

Order Status

The dataset contains multiple order statuses, including Cancelled, Pending, Shipped, Returned, and Delivered. This is important when interpreting revenue because total order value is not necessarily the same as realized revenue.

Tools Used

• Microsoft Excel – Dataset preparation and review
• SQL Server / SQL Server Management Studio (SSMS) – Data querying and analysis
• SQL – Data extraction, filtering, grouping, sorting, and aggregation
• GitHub – Project documentation and version control

Business Insights

The analysis demonstrates how SQL can be used to:

• Identify top-performing products
• Monitor sales performance
• Compare payment methods
• Evaluate marketing/referral sources
• Understand order-status patterns
• Calculate important business KPIs

One important consideration is that gross order value should not automatically be treated as realized revenue when cancelled, returned, pending, or other non-completed orders are included.

Skills Demonstrated

• SQL querying
• Data aggregation
• Data filtering
• Data grouping
• Sorting and ranking
• Business KPI calculation
• Data interpretation
• Analytical thinking
• Documentation

Suggested Repository Structure

```text
SQL-Data-Analysis-Project-3/
│
├── README.md
├── Cleaned_Dataset_for_Data_Analytics(1).xlsx
└── SQL_Data_Analysis_Project_3.sql
```

Conclusion

This project strengthened my practical SQL skills by taking a cleaned dataset and transforming raw transactional data into useful business insights.

It also improved my ability to connect SQL queries with real-world analytical questions and communicate findings clearly.

────────

Project: SQL Data Analysis – Project 3
Focus: Sales Data Analysis using SQL
