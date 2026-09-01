/* Display all orders*/
SELECT *
FROM [Dataset for Data Analytics_2];

--Find orders above 1000
SELECT *
FROM [Dataset for Data Analytics_2]
WHERE TotalPrice > 1000;

--Sort orders by highest sales
SELECT *
FROM [Dataset for Data Analytics_2]
ORDER BY TotalPrice DESC;

--Total sales
SELECT SUM(TotalPrice) AS TotalSales
FROM [Dataset for Data Analytics_2];

--Average order values
SELECT AVG(TotalPrice) AS AveragePrice
FROM [Dataset for Data Analytics_2];

--Number of values
SELECT COUNT(OrderID) AS TotalOrders
FROM [Dataset for Data Analytics_2];

--Sales by product
SELECT 
    Product,
    COUNT(OrderID) AS NumberofOrders,
    SUM(Quantity) AS TotalQuantity,
    SUM(TotalPrice) AS TotalSales
FROM [Dataset for Data Analytics_2]
GROUP BY Product
ORDER BY TotalSales DESC;

--Sales by payment method
SELECT 
    PaymentMethod,
    COUNT(OrderID) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalSales
FROM [Dataset for Data Analytics_2]
GROUP BY PaymentMethod
ORDER BY TotalSales DESC;

--Sales by referral source
SELECT
    ReferralSource,
    COUNT(OrderID) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalSales,
    AVG(TotalPrice) AS AveragePrice
FROM [Dataset for Data Analytics_2]
GROUP BY ReferralSource
ORDER BY TotalSales;

--Order status analysis
SELECT
    OrderStatus,
    COUNT(OrderID) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalValue
FROM [Dataset for Data Analytics_2]
GROUP BY OrderStatus
ORDER BY TotalValue;
