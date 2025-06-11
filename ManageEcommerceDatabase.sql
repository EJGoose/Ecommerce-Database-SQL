
-- Create a table to store customer information, including a unique identifier for each customer, their first and last names, email address, and the date they joined the store.

CREATE TABLE Customer_Info (
	CustomerID INT NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(100),
	JoinDate DATE NOT NULL,
	PRIMARY KEY (CustomerID)
);

-- Insert records for four sample customers

INSERT INTO Customer_Info (CustomerID, FirstName, LastName, Email, JoinDate) 
	Values 
		(1, 'John', 'Doe', 'JoeDoe@gmail.com', '2004-05-05'),
		(2, 'Jane', 'Smith', 'MileySmiley@hotmail.com', '2021-09-08'),
		(3, 'Reggie', 'Cool', 'theAncientSongs@duck.com', '1997-11-01'),
		(4, 'Alice', 'Johnson', 'AJ65@aol.com', '2018-09-06');


--Create a table to hold product details, including a unique product identifier, product name, price, and available stock quantity.

CREATE TABLE Product_Info (
	ProductID INT NOT NULL,
	ProductName VARCHAR(50) NOT NULL,
	Price FLOAT NOT NULL,
	StockQuantity INT NOT NULL,
	PRIMARY KEY (ProductID)
);



--Insert records for four different sample products. 

INSERT INTO Product_Info (ProductID, ProductName, Price, StockQuantity) 
	Values 
		(10001, 'TV', 35.70, 200),
		(10002, 'Laptop', 357.20, 36),
		(10003, 'Smartphone', 18.78, 11),
		(10004, 'Headphones', 12.34, 5);


--Create a table to track customer orders. This table includes an order identifier, the customer's identifier (linking to the Customers table), the product's identifier (linking to the Products table), the order date, and the quantity ordered.

CREATE TABLE Order_Info (
	OrderID INT NOT NULL,
	CustomerID INT NOT NULL,
	ProductID INT NOT NULL,
	OrderDate DATE NOT NULL,
	QuantityOrdered INT NOT NULL,
	PRIMARY KEY (OrderID),
	CONSTRAINT FK_CustomerOrder FOREIGN KEY (CustomerID)
	REFERENCES Customer_Info(CustomerID),
	CONSTRAINT FK_ProductOrder FOREIGN KEY (ProductID)
	REFERENCES Product_Info(ProductID)
);

--Insert records for four orders

INSERT INTO Order_Info (OrderID, CustomerID, ProductID, OrderDate, QuantityOrdered) 
	Values 
		(1001, 1, 10001, 2024-07-03, 7),
		(1002, 2, 10003, 2024-03-06, 2),
		(1003, 2, 10002, 2024-11-12, 6),
		(1004, 3, 10001, 2024-11-17, 9);




--modify the record of a customer.
UPDATE Customer_Info
SET Email = 'john.doe.new@example.com'
WHERE CustomerID = 1;


--Adjust the price in the `Products` table for the laptop.
UPDATE Product_Info
SET Price = 1099.99
WHERE ProductName = 'Laptop';


--Update an order record.
UPDATE Order_Info
SET QuantityOrdered = 1
WHERE OrderID = '1002';


-- Delete a customers account
DELETE FROM Customer_Info
WHERE FirstName = 'Alice' AND
LastName = 'Johnson' AND
CustomerID = 4;

--remove a product from the table
DELETE FROM Product_Info
WHERE ProductName = 'Headphones' AND
ProductID = 10004;

--Delete an order from the table
DELETE FROM Order_Info
WHERE OrderID = 1003 AND
CustomerID = 4;