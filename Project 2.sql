SELECT *
FROM [Dataset for Data Analytics_2];

/* ITEMS IN CART STATISTICS */

SELECT
    COUNT(ItemsInCart) AS Items_Count,
    AVG(ItemsInCart) AS Mean_Items_In_Cart,
    MIN(ItemsInCart) AS Minimum_Items_In_Cart,
    MAX(ItemsInCart) AS Maximum_Items_In_Cart
FROM [Dataset for Data Analytics_2];

-- Median Items in Cart
SELECT DISTINCT
    PERCENTILE_CONT(0.5)
    WITHIN GROUP (ORDER BY ItemsInCart)
    OVER () AS Median_Items_In_Cart
FROM [Dataset for Data Analytics_2];


/* PRODUCT ANALYSIS */

SELECT
    Product,
    COUNT(OrderID) AS Total_Orders,
    SUM(Quantity) AS Units_Sold,
    SUM(TotalPrice) AS Revenue,
    AVG(TotalPrice) AS Average_Order_Value
FROM [Dataset for Data Analytics_2]
GROUP BY Product
ORDER BY Revenue DESC;


/* PRODUCT QUANTITY ANALYSIS */

SELECT
    Product,
    SUM(Quantity) AS Total_Units_Sold
FROM [Dataset for Data Analytics_2]
GROUP BY Product
ORDER BY Total_Units_Sold DESC;


/* SALES BY YEAR */

SELECT
    YEAR(Date) AS Sales_Year,
    COUNT(OrderID) AS Total_Orders,
    SUM(Quantity) AS Units_Sold,
    SUM(TotalPrice) AS Revenue,
    AVG(TotalPrice) AS Average_Order_Value
FROM [Dataset for Data Analytics_2]
GROUP BY YEAR(Date)
ORDER BY Sales_Year;


/* MONTHLY SALES TREND */

SELECT
    YEAR(Date) AS Sales_Year,
    MONTH(Date) AS Sales_Month,
    COUNT(OrderID) AS Total_Orders,
    SUM(Quantity) AS Units_Sold
FROM [Dataset for Data Analytics_2];
    
/* CHECK THE DATA */

-- View the first 10 records
SELECT TOP 10 *
FROM [Dataset for Data Analytics_2];


-- Count total records
SELECT COUNT(*) AS Total_Records
FROM [Dataset for Data Analytics_2];


-- Check the date range
SELECT
    MIN(Date) AS First_Order_Date,
    MAX(Date) AS Last_Order_Date
FROM [Dataset for Data Analytics_2];


/* CHECK FOR MISSING VALUE */

SELECT
    SUM(CASE WHEN OrderID IS NULL THEN 1 ELSE 0 END) AS Missing_OrderID,
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS Missing_CustomerID,
    SUM(CASE WHEN Product IS NULL THEN 1 ELSE 0 END) AS Missing_Product,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity,
    SUM(CASE WHEN UnitPrice IS NULL THEN 1 ELSE 0 END) AS Missing_UnitPrice,
    SUM(CASE WHEN PaymentMethod IS NULL THEN 1 ELSE 0 END) AS Missing_PaymentMethod,
    SUM(CASE WHEN OrderStatus IS NULL THEN 1 ELSE 0 END) AS Missing_OrderStatus,
    SUM(CASE WHEN ItemsInCart IS NULL THEN 1 ELSE 0 END) AS Missing_ItemsInCart,
    SUM(CASE WHEN CouponCode IS NULL THEN 1 ELSE 0 END) AS Missing_CouponCode,
    SUM(CASE WHEN ReferralSource IS NULL THEN 1 ELSE 0 END) AS Missing_ReferralSource,
    SUM(CASE WHEN TotalPrice IS NULL THEN 1 ELSE 0 END) AS Missing_TotalPrice
FROM [Dataset for Data Analytics_2];


/* CHECK FOR DUPLICATES */

SELECT
    OrderID,
    COUNT(*) AS Duplicate_Count
FROM [Dataset for Data Analytics_2]
GROUP BY OrderID
HAVING COUNT(*) > 1;


/* BASIC STATISTICS */

SELECT
    COUNT(*) AS Total_Orders,
    COUNT(DISTINCT CustomerID) AS Unique_Customers,
    SUM(Quantity) AS Total_Units_Sold,
    SUM(TotalPrice) AS Total_Revenue,
    AVG(TotalPrice) AS Average_Order_Value,
    MIN(TotalPrice) AS Minimum_Order_Value,
    MAX(TotalPrice) AS Maximum_Order_Value
FROM [Dataset for Data Analytics_2];


/* MEDIAN TOTAL PRICE */

SELECT DISTINCT
    PERCENTILE_CONT(0.5)
    WITHIN GROUP (ORDER BY TotalPrice)
    OVER () AS Median_Order_Value
FROM [Dataset for Data Analytics_2];


/* QUANTITY STATISTICS */

SELECT
    COUNT(Quantity) AS Quantity_Count,
    AVG(Quantity) AS Mean_Quantity,
    MIN(Quantity) AS Minimum_Quantity,
    MAX(Quantity) AS Maximum_Quantity
FROM [Dataset for Data Analytics_2];


-- Median quantity
SELECT DISTINCT
    PERCENTILE_CONT(0.5)
    WITHIN GROUP (ORDER BY Quantity)
    OVER () AS Median_Quantity
FROM [Dataset for Data Analytics_2];


/* UNIT PRICE STATISTICS */

SELECT
    COUNT(UnitPrice) AS UnitPrice_Count,
    AVG(UnitPrice) AS Mean_UnitPrice,
    MIN(UnitPrice) AS Minimum_UnitPrice,
    MAX(UnitPrice) AS Maximum_UnitPrice
FROM [Dataset for Data Analytics_2];


-- Median Unit Price
SELECT DISTINCT
    PERCENTILE_CONT(0.5)
    WITHIN GROUP (ORDER BY UnitPrice)
    OVER () AS Median_UnitPrice
FROM [Dataset for Data Analytics_2];


/* MONTHLY SALES WITH MONTH NAME */

SELECT
    YEAR(Date) AS Sales_Year,
    MONTH(Date) AS Sales_Month,
    DATENAME(MONTH, Date) AS Month_Name,
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Revenue
FROM [Dataset for Data Analytics_2]
GROUP BY
    YEAR(Date),
    MONTH(Date),
    DATENAME(MONTH, Date)
ORDER BY
    Sales_Year,
    Sales_Month;


/* ORDER STATUS ANALYSIS */

SELECT
    OrderStatus,
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Revenue,
    AVG(TotalPrice) AS Average_Order_Value
FROM [Dataset for Data Analytics_2]
GROUP BY OrderStatus
ORDER BY Total_Orders DESC;


/* CANCELLED AND RETURNED ORDERS */

SELECT
    COUNT(*) AS Cancelled_Returned_Orders,
    SUM(TotalPrice) AS Cancelled_Returned_Value
FROM [Dataset for Data Analytics_2]
WHERE OrderStatus IN ('Cancelled', 'Returned');


/* ORDER STATUS PERCENTAGE */

SELECT
    OrderStatus,
    COUNT(*) AS Total_Orders,
    CAST(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()
        AS DECIMAL(10,2)
    ) AS Order_Percentage
FROM [Dataset for Data Analytics_2]
GROUP BY OrderStatus
ORDER BY Total_Orders DESC;


/* PAYMENT METHOD ANALYSIS */

SELECT
    PaymentMethod,
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Revenue,
    AVG(TotalPrice) AS Average_Order_Value
FROM [Dataset for Data Analytics_2]
GROUP BY PaymentMethod
ORDER BY Revenue DESC;


/* REFERRAL SOURCE ANALYSIS */

SELECT
    ReferralSource,
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Revenue,
    AVG(TotalPrice) AS Average_Order_Value
FROM [Dataset for Data Analytics_2]
GROUP BY ReferralSource
ORDER BY Revenue DESC;


/* COUPON PERFORMANCE */

SELECT
    CouponCode,
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Revenue,
    AVG(TotalPrice) AS Average_Order_Value
FROM [Dataset for Data Analytics_2]
GROUP BY CouponCode
ORDER BY Revenue DESC;


/* CUSTOMER ANALYSIS */

SELECT
    CustomerID,
    COUNT(OrderID) AS Number_of_Orders,
    SUM(Quantity) AS Units_Purchased,
    SUM(TotalPrice) AS Total_Spent
FROM [Dataset for Data Analytics_2]
GROUP BY CustomerID
ORDER BY Total_Spent DESC;

/* TOP 10 CUSTOMERS */

SELECT TOP 10
    CustomerID,
    COUNT(OrderID) AS Number_of_Orders,
    SUM(Quantity) AS Units_Purchased,
    SUM(TotalPrice) AS Total_Spent
FROM [Dataset for Data Analytics_2]
GROUP BY CustomerID
ORDER BY Total_Spent DESC;


/* OUTLIER ANALYSIS USING IQR */

WITH Quartiles AS
(
    SELECT DISTINCT
        PERCENTILE_CONT(0.25)
        WITHIN GROUP (ORDER BY TotalPrice)
        OVER () AS Q1,

        PERCENTILE_CONT(0.75)
        WITHIN GROUP (ORDER BY TotalPrice)
        OVER () AS Q3
    FROM Orders
)

SELECT
    Q1,
    Q3,
    Q3 - Q1 AS IQR,
    Q1 - (1.5 * (Q3 - Q1)) AS Lower_Bound,
    Q3 + (1.5 * (Q3 - Q1)) AS Upper_Bound
FROM Quartiles;


/* FIND HIGH-VALUE OUTLIERS */

WITH Quartiles AS
(
    SELECT DISTINCT
        PERCENTILE_CONT(0.25)
        WITHIN GROUP (ORDER BY TotalPrice)
        OVER () AS Q1,

        PERCENTILE_CONT(0.75)
        WITHIN GROUP (ORDER BY TotalPrice)
        OVER () AS Q3
    FROM [Dataset for Data Analytics_2]
)

SELECT
    o.OrderID,
    o.Date,
    o.CustomerID,
    o.Product,
    o.Quantity,
    o.UnitPrice,
    o.TotalPrice
FROM [Dataset for Data Analytics_2] o
CROSS JOIN Quartiles q
WHERE o.TotalPrice >
      q.Q3 + (1.5 * (q.Q3 - q.Q1))
ORDER BY o.TotalPrice DESC;


/* TOP 10 HIGHEST-VALUE ORDERS */

SELECT TOP 10
    OrderID,
    Date,
    CustomerID,
    Product,
    Quantity,
    UnitPrice,
    TotalPrice
FROM [Dataset for Data Analytics_2]
ORDER BY TotalPrice DESC;


/* LOWEST 10 ORDERS */

SELECT TOP 10
    OrderID,
    Date,
    CustomerID,
    Product,
    Quantity,
    UnitPrice,
    TotalPrice
FROM [Dataset for Data Analytics_2]
ORDER BY TotalPrice ASC;


/* DAILY SALES TREND */

SELECT
    Date,
    COUNT(OrderID) AS Total_Orders,
    SUM(Quantity) AS Units_Sold,
    SUM(TotalPrice) AS Revenue
FROM [Dataset for Data Analytics_2]
GROUP BY Date
ORDER BY Date;


/* PRODUCT + ORDER STATUS ANALYSIS */

SELECT
    Product,
    OrderStatus,
    COUNT(OrderID) AS Total_Orders,
    SUM(TotalPrice) AS Revenue
FROM [Dataset for Data Analytics_2]
GROUP BY
    Product,
    OrderStatus
ORDER BY
    Product,
    Total_Orders DESC;


/* FINAL EDA SUMMARY */

SELECT
    COUNT(*) AS Total_Orders,
    COUNT(DISTINCT CustomerID) AS Unique_Customers,
    SUM(Quantity) AS Total_Units_Sold,
    SUM(TotalPrice) AS Total_Revenue,
    AVG(TotalPrice) AS Average_Order_Value,
    MIN(TotalPrice) AS Minimum_Order_Value,
    MAX(TotalPrice) AS Maximum_Order_Value,
    MIN(Date) AS First_Order_Date,
    MAX(Date) AS Last_Order_Date
FROM [Dataset for Data Analytics_2];



