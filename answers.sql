
-- Question 1:
-- USE salesdb;

-- -- Create a new table to store the 1NF data.  We'll include the original columns
-- -- that identify the order, and a new column for the individual product.
-- CREATE TABLE ProductDetail_1NF (
--     OrderID INT,
--     CustomerName VARCHAR(255),
--     Product VARCHAR(255)
-- );

-- -- Populate the new table by splitting the 'Products' string from the original
-- -- table into individual rows.  We'll use a combination of string manipulation
-- -- functions to achieve this.  The approach works for MySQL.
-- INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
-- SELECT
--     OrderID,
--     CustomerName,
--     -- Extract each product using SUBSTRING_INDEX.  The numbers (1, 2, 3)
--     --  correspond to the position of the product in the comma-separated list.
--     SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.n), ',', -1) AS Product
-- FROM
--     ProductDetail
--     -- Create a helper table 'numbers' to generate the sequence 1, 2, 3.
--     --  This is used to extract each product from the comma-separated string.
--     --  For simplicity, I'm creating a temporary table here.  In a real
--     --  database, you might have a permanent table of numbers.
--     CROSS JOIN (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3) AS n
-- WHERE
--     -- Filter out any empty product strings.  This handles cases where there
--     -- might be trailing commas or empty entries in the original 'Products' column.
--     LENGTH(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.n), ',', -1)) > 0
-- ORDER BY OrderID, Product;

-- -- Verify the result:
-- SELECT * FROM ProductDetail_1NF;

-- -- Drop the original table (optional, if you only want to keep the 1NF version):
-- -- DROP TABLE ProductDetail;

-- Question 2:

-- Use the salesdb database
-- USE salesdb;

-- Check if the Orders table exists, and create it if it doesn't
-- CREATE TABLE IF NOT EXISTS Orders (
--     OrderID INT PRIMARY KEY,
--     CustomerName VARCHAR(255)
-- );

-- Check if the OrderItems table exists, and create it if it doesn't
-- CREATE TABLE IF NOT EXISTS OrderItems (
--     OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
--     OrderID INT,
--     Product VARCHAR(255),
--     Quantity INT,
--     FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
-- );

-- Insert data into the Orders table
-- INSERT INTO Orders (OrderID, CustomerName)
-- VALUES
--     (101, 'John Doe'),
--     (102, 'Jane Smith'),
--     (103, 'Emily Clark');

-- Insert data into the OrderItems table
-- INSERT INTO OrderItems (OrderID, Product, Quantity)
-- VALUES
--     (101, 'Laptop', 2),
--     (101, 'Mouse', 1),
--     (102, 'Tablet', 3),
--     (102, 'Keyboard', 1),
--     (102, 'Mouse', 2),
--     (103, 'Phone', 1);

-- Display the new tables to show the transformation to 2NF
-- SELECT * FROM Orders;
-- SELECT * FROM OrderItems;


