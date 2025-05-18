CREATE TABLE returns (
    Order_ID TEXT,
    Customer_ID TEXT,
    Product_Category TEXT,
    Product_Price REAL,
    Order_Quantity INTEGER,
    Discount REAL,
    Shipping_Method TEXT,
    Payment_Method TEXT,
    City TEXT,
    Is_Returned INTEGER,
    Return_Reason TEXT
);
INSERT INTO returns (
    Order_ID, Customer_ID, Product_Category, Product_Price, Order_Quantity, Discount,
    Shipping_Method, Payment_Method, City, Is_Returned, Return_Reason
)
VALUES (
    'ORD001', 'CUST01', 'Clothing', 1299.99, 1, 0.10, 'Express', 'Credit Card', 'Mumbai', 1, 'Defective'
);
SELECT * FROM returns LIMIT 10;
SELECT Product_Category, COUNT(*) AS Total_Returns
FROM returns
WHERE Is_Returned = 1
GROUP BY Product_Category
ORDER BY Total_Returns DESC
LIMIT 5;
SELECT City,
       COUNT(*) AS Total_Orders,
       SUM(Is_Returned) AS Returned_Orders,
       ROUND(SUM(Is_Returned)*100.0 / COUNT(*), 2) AS Return_Rate_Percentage
FROM returns
GROUP BY City
ORDER BY Return_Rate_Percentage DESC;
SELECT Product_Category, AVG(Discount) AS Avg_Discount, SUM(Is_Returned) AS Returned_Count
FROM returns
GROUP BY Product_Category
HAVING Avg_Discount > 0.20
ORDER BY Returned_Count DESC;
SELECT Return_Reason, COUNT(*) AS Count
FROM returns
WHERE Is_Returned = 1
GROUP BY Return_Reason
ORDER BY Count DESC;




