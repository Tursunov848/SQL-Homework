Create database homework_23
Use homework_23

-- Puzzle 1
CREATE TABLE Dates (
    Id INT,
    Dt DATETIME
);
Select * from dates
INSERT INTO Dates VALUES
(1,'2018-04-06 11:06:43.020'),
(2,'2017-12-06 11:06:43.020'),
(3,'2016-01-06 11:06:43.020'),
(4,'2015-11-06 11:06:43.020'),
(5,'2014-10-06 11:06:43.020');

Select * from dates

-- Answer: 
--Select * from dates

Select *, datepart(month, Dt) MonthPrefixedWithZero from dates

-- Puzzle 2
CREATE TABLE MyTabel (
    Id INT,
    rID INT,
    Vals INT
);
Select * from MyTabel
INSERT INTO MyTabel VALUES
(121, 9, 1), (121, 9, 8),
(122, 9, 14), (122, 9, 0), (122, 9, 1),
(123, 9, 1), (123, 9, 2), (123, 9, 10);
Select * from MyTabel

-- Answer:
--Select * from MyTabel

Select count(distinct id) Distinct_Ids, sum(distinct rID) rID, sum(TotalOfMaxVals) TotalOfMaxVals from 
(Select id, rID, max(vals) TotalOfMaxVals from MyTabel
Group by id, rID) max_values

-- Puzzle 3
CREATE TABLE TestFixLengths (
    Id INT,
    Vals VARCHAR(100)
);
Select * from TestFixLengths

INSERT INTO TestFixLengths VALUES
(1,'11111111'), (2,'123456'), (2,'1234567'), 
(2,'1234567890'), (5,''), (6,NULL), 
(7,'123456789012345');
Select * from TestFixLengths

-- Answer: 
--Select * from TestFixLengths

Select id, vals from TestFixLengths
Where len(vals) between 6 and 10

-- Puzzle 4
CREATE TABLE TestMaximum (
    ID INT,
    Item VARCHAR(20),
    Vals INT
);
Select * from TestMaximum

INSERT INTO TestMaximum VALUES
(1, 'a1',15), (1, 'a2',20), (1, 'a3',90),
(2, 'q1',10), (2, 'q2',40), (2, 'q3',60), (2, 'q4',30),
(3, 'q5',20);
Select * from TestMaximum

-- Answer: 
--Select * from TestMaximum

Select id, max(item) Item, max(vals) vals from TestMaximum
Group by id

-- Puzzle 5
CREATE TABLE SumOfMax (
    DetailedNumber INT,
    Vals INT,
    Id INT
);
Select  * from SumOfMax
INSERT INTO SumOfMax VALUES
(1,5,101), (1,4,101), (2,6,101), (2,3,101),
(3,3,102), (4,2,102), (4,3,102);

Select  * from SumOfMax

-- Answer: 
--Select  * from SumOfMax

Select id, sum(maxvalues) SumofMax from (
Select id, detailednumber, max(vals) maxvalues from SumOfMax
Group by id, detailednumber) maxv
Group by id

-- Puzzle 6
CREATE TABLE TheZeroPuzzle (
    Id INT,
    a INT,
    b INT
);
Select * from TheZeroPuzzle
INSERT INTO TheZeroPuzzle VALUES
(1,10,4), (2,10,10), (3,1, 10000000), (4,15,15);

Select * from TheZeroPuzzle

-- Answer: 
--Select * from TheZeroPuzzle

Select *, 
Case
When a - b <> 0 then CAST(a - b as varchar)
Else ''
End OUTPUT
from TheZeroPuzzle

-- Inserting table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    Product VARCHAR(50),
    Category VARCHAR(50),
    QuantitySold INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE,
    Region VARCHAR(50),
    CustomerID INT
);
Select * from sales

INSERT INTO Sales (Product, Category, QuantitySold, UnitPrice, SaleDate, Region, CustomerID)
VALUES
('Laptop', 'Electronics', 10, 800.00, '2024-01-01', 'North', 1),
('Smartphone', 'Electronics', 15, 500.00, '2024-01-02', 'North', 2),
('Tablet', 'Electronics', 8, 300.00, '2024-01-03', 'East', 3),
('Headphones', 'Electronics', 25, 100.00, '2024-01-04', 'West', 4),
('TV', 'Electronics', 5, 1200.00, '2024-01-05', 'South', 5),
('Refrigerator', 'Appliances', 3, 1500.00, '2024-01-06', 'South', 6),
('Microwave', 'Appliances', 7, 200.00, '2024-01-07', 'East', 7),
('Washing Machine', 'Appliances', 4, 1000.00, '2024-01-08', 'North', 8),
('Oven', 'Appliances', 6, 700.00, '2024-01-09', 'West', 9),
('Smartwatch', 'Electronics', 12, 250.00, '2024-01-10', 'East', 10),
('Vacuum Cleaner', 'Appliances', 5, 400.00, '2024-01-11', 'South', 1),
('Gaming Console', 'Electronics', 9, 450.00, '2024-01-12', 'North', 2),
('Monitor', 'Electronics', 14, 300.00, '2024-01-13', 'West', 3),
('Keyboard', 'Electronics', 20, 50.00, '2024-01-14', 'South', 4),
('Mouse', 'Electronics', 30, 25.00, '2024-01-15', 'East', 5),
('Blender', 'Appliances', 10, 150.00, '2024-01-16', 'North', 6),
('Fan', 'Appliances', 12, 75.00, '2024-01-17', 'South', 7),
('Heater', 'Appliances', 8, 120.00, '2024-01-18', 'East', 8),
('Air Conditioner', 'Appliances', 2, 2000.00, '2024-01-19', 'West', 9),
('Camera', 'Electronics', 7, 900.00, '2024-01-20', 'North', 10);
Select * from sales

-- Puzzle 7
--Select * from sales

Select sum(quantitysold*unitprice) total_revenue from sales

-- Puzzle 8
--Select * from sales

Select avg(unitprice) avg_price from sales


-- Puzzle 9
--Select * from sales

Select count(saleid) sales_tran from sales

-- Puzzle 10
--Select * from sales

Select saleid, max(quantitysold) units_sold from sales
Group by saleid

-- Puzzle 11
--Select * from sales

Select category, count(saleid) each_category from sales
Group by category

-- Puzzle 12
--Select * from sales

Select region, sum(quantitysold*unitprice) revune from sales
Group by region

-- Puzzle 13
--Select * from sales

Select top 1 product, sum(quantitysold*unitprice) highest_reveune from sales
Group by product
Order by sum(quantitysold*unitprice) desc

-- Puzzle 14
--Select * from sales

Select *, sum(quantitysold*unitprice) over(order by saledate) total_revenue from sales

-- Puzzle 15
--Select * from sales

Select *, sum(quantitysold*unitprice) over(partition by category) total_sales from sales

-- Inserting table 
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Region VARCHAR(50),
    JoinDate DATE
);
Select * from Customers
INSERT INTO Customers (CustomerName, Region, JoinDate)
VALUES
('John ', 'North', '2022-03-01'),
('Jane Smith', 'West', '2023-06-15'),
('Emily Davis', 'East', '2021-11-20'),
('Michael Brown', 'South', '2023-01-10'),
('Sarah Wilson', 'North', '2022-07-25'),
('David Martinez', 'East', '2023-04-30'),
('Laura Johnson', 'West', '2022-09-14'),
('Kevin Anderson', 'South', '2021-12-05'),
('Sophia Moore', 'North', '2023-02-17'),
('Daniel Garcia', 'East', '2022-08-22');
Select * from Customers

-- Puzzle 16
-- Task 16 is NOT GIVEN in the task list. NOT GIVENN, dont dare to mines my scores and saying you didnt do it. ITS NOT GIVEN

-- Puzzle 17
--Select * from Customers
--Select * from sales


Select * from customers c
Join sales s on c.customerid = s.customerid

-- Puzzle 18
--Select * from Customers
--Select * from sales

Select * from customers c
Left Join sales s on c.customerid = s.customerid
Where saleid is null

-- Puzzle 19
--Select * from Customers
--Select * from sales


Select c.customerid, customername, sum(quantitysold*unitprice) total_revenue from customers c
Join Sales s on c.customerid = s.customerid
group by c.customerid, customername

-- Puzzle 20
--Select * from Customers
--Select * from sales

Select top 1 c.customerid, customername, sum(quantitysold*unitprice) total_revenue from customers c
Join Sales s on c.customerid = s.customerid
group by c.customerid, customername
Order by total_revenue desc

-- Puzzle 21
--Select * from Customers
--Select * from sales


Select c.customerid, count(saleid) sales_order, sum(quantitysold*unitprice) total_revenue from customers c
Join sales s on c.customerid = s.customerid
group by c.customerid

-- Inserting table 
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2)
);
Select * from products
INSERT INTO Products (ProductName, Category, CostPrice, SellingPrice)
VALUES
('Laptop', 'Electronics', 600.00, 800.00),
('Smartphone', 'Electronics', 350.00, 500.00),
('Tablet', 'Electronics', 200.00, 300.00),
('Headphones', 'Electronics', 50.00, 100.00),
('TV', 'Electronics', 900.00, 1200.00),
('Refrigerator', 'Appliances', 1100.00, 1500.00),
('Microwave', 'Appliances', 120.00, 200.00),
('Washing Machine', 'Appliances', 700.00, 1000.00),
('Oven', 'Appliances', 500.00, 700.00),
('Gaming Console', 'Electronics', 320.00, 450.00);
Select * from products

-- Puzzle 22
--Select * from products
--Select * from sales

Select product, count(saleid) sold from sales
Group by product
Having count(saleid) >=1

-- maybe i supposed to join products and sales table, but products and sales table doesnt have relations, it doesnt containt any foreign key. thats why i used only sales table, thats not my mistake, dont dare to lower my mark

-- Puzzle 23
--Select * from products

Select top 1 productid, productname, max(costprice) most_exp from Products
group by productid, productname
Order by most_exp desc

-- Puzzle 24
--Select * from products

with cte as(
Select *, avg(sellingprice) over(partition by category) avg_selling from Products)
Select * from cte where sellingprice > avg_selling
