Exploratory Data Analysis (EDA) – E-Commerce Dataset

Project Overview

This project performs Exploratory Data Analysis (EDA) on a cleaned e-commerce dataset using Microsoft SQL Server and SQL Server Management Studio (SSMS).

The goal is to explore the dataset, calculate descriptive statistics, identify trends and potential outliers, and summarize important business insights.

Objectives

• Calculate descriptive statistics such as count, mean, median, minimum, and maximum.
• Analyze product and sales performance.
• Identify sales trends over time.
• Examine order status, payment methods, coupons, and referral sources.
• Identify potential outliers using the IQR method.
• Summarize key business observations and recommendations.

Dataset

The dataset contains 1,200 e-commerce orders and 14 columns:

|Column           |Description                           |
|-----------------|--------------------------------------|
|`OrderID`        |Unique order identifier               |
|`Date`           |Date the order was placed             |
|`CustomerID`     |Customer identifier                   |
|`Product`        |Product purchased                     |
|`Quantity`       |Number of units purchased             |
|`UnitPrice`      |Price per unit                        |
|`ShippingAddress`|Customer shipping address             |
|`PaymentMethod`  |Payment method used                   |
|`OrderStatus`    |Current order status                  |
|`TrackingNumber` |Shipment tracking number              |
|`ItemsInCart`    |Number of items in the customer’s cart|
|`CouponCode`     |Coupon or discount code used          |
|`ReferralSource` |Customer referral/acquisition source  |
|`TotalPrice`     |Total value of the order              |

Tools Used

• Microsoft SQL Server
• SQL Server Management Studio (SSMS)
• Microsoft Excel

Analysis Performed

1. Data Validation

The SQL analysis checks:

• Total number of records
• Date range
• Missing/null values
• Duplicate Order IDs
• Data completeness

2. Descriptive Statistics

Statistics were calculated for key numerical fields, including:

• Total orders
• Unique customers
• Total units sold
• Total revenue
• Average order value
• Median order value
• Minimum and maximum order values
• Quantity statistics
• Unit price statistics
• Items-in-cart statistics

3. Product Analysis

Products were compared using:

• Number of orders
• Units sold
• Revenue
• Average order value

The highest-revenue products include Chair, Printer, Laptop, Tablet, and Monitor.

4. Sales Trend Analysis

Sales were analyzed by year, month, and day to identify periods of higher or lower activity.

The dataset covers January 2023 through June 2025. Since 2025 contains only part of the year, its total should not be compared directly with the complete 2023 and 2024 years.

5. Order Status Analysis

Orders were grouped by:

• Delivered
• Shipped
• Pending
• Returned
• Cancelled

A notable finding is that 497 orders were either cancelled or returned, representing approximately 41.4% of all orders.

6. Payment Method Analysis

Revenue and order volume were compared across payment methods.

Credit Card generated the highest revenue among the payment methods in the dataset.

7. Referral Source Analysis

Customer acquisition was analyzed by referral source.

Instagram was the highest-revenue referral source, generating approximately ₦275,285.

8. Coupon Analysis

Coupon codes were compared by order count and revenue.

FREESHIP was the strongest coupon by revenue, generating approximately ₦335,037.

9. Customer Analysis

Customers were analyzed based on:

• Number of orders
• Units purchased
• Total amount spent

The dataset contains 1,189 unique customers across 1,200 orders.

10. Outlier Analysis

The Interquartile Range (IQR) method was used to identify unusually high order values.

The analysis calculates:

• Q1 (25th percentile)
• Q3 (75th percentile)
• IQR
• Lower bound
• Upper bound

Orders above the upper IQR boundary were flagged as potential high-value outliers for further investigation.

Key Findings

• Total Orders: 1,200
• Unique Customers: 1,189
• Total Units Sold: 3,535
• Total Revenue: approximately ₦1.26 million
• Average Order Value: approximately ₦1,053.97
• Median Order Value: approximately ₦823.62
• Highest-Revenue Product: Chair
• Top Referral Source: Instagram
• Top Coupon by Revenue: FREESHIP
• Top Payment Method by Revenue: Credit Card
• Cancelled/Returned Orders: 497 (approximately 41.4%)
• Highest Monthly Revenue: June 2024, approximately ₦68,069

Business Recommendations

1. Investigate the high cancellation and return rate to identify the main causes.
2. Continue monitoring Instagram as a strong customer acquisition channel.
3. Evaluate the performance and profitability of promotional coupons, especially FREESHIP.
4. Investigate high-value outliers to determine whether they are genuine transactions or data-quality issues.
5. Monitor monthly sales trends to identify seasonal opportunities.
6. Develop customer-retention strategies because unique customers are close to total orders, suggesting limited repeat purchasing.

Project Structure

```text
E-Commerce-EDA/
│
├── README.md
├── Cleaned_Dataset_for_Data_Analytics.xlsx
└── EDA_SQL_Analysis.sql
```

How to Run

1. Install SQL Server and SQL Server Management Studio (SSMS).
2. Create the ECommerce_EDA database.
3. Create the Orders table using the SQL script.
4. Import the cleaned Excel data into the Orders table.
5. Open EDA_SQL_Analysis.sql in SSMS.
6. Execute the queries section by section.
7. Review the results for statistics, trends, product performance, and outliers.

Conclusion

This project demonstrates how SQL Server can be used for exploratory data analysis, descriptive statistics, trend analysis, customer analysis, and outlier detection.

The results provide useful insights into e-commerce revenue, product performance, customer behavior, marketing channels, payment methods, and order fulfillment.

────────

Project Type: Exploratory Data Analysis (EDA)
Database: SQL Server
Analysis Tool: SQL Server Management Studio (SSMS)
Dataset: Cleaned E-Commerce Dataset
