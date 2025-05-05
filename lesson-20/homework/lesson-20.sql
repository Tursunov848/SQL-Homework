-- Creating database for homework_20

Create database homework_20
Use homework_20

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);
Select * from Sales

INSERT INTO Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
('David', 'Laptop', 1, 1300.00, '2024-03-05'),
('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
('Jack', 'Smartphone', 1, 820.00, '2024-06-01');
Select * from Sales

-- Task 1
--Select * from Sales

Select * from Sales s1 where 
exists 
     (Select sum(quantity) from sales 
      Where s1.saleid = saleid
      Group by saleid
	  Having sum(quantity) >= 1)

-- Task 2
--Select * from sales

Select product, total_revenue
From (Select product, sum(price * quantity) total_revenue from sales
      Group by product) product_revenue
Where total_revenue = (Select max(total_revenue)
From(Select product, sum(price * quantity) total_revenue from sales
     Group by product) max_revenue_subquery);


-- Task 3
--Select * from Sales

Select max(SaleAmount) Second_highest_sale
  From (Select Quantity * Price as SaleAmount from Sales) Sales
Where SaleAmount < (Select max(Quantity * Price) from Sales)

-- Task 4
--Select * from Sales

Select Salesmonths, sum(quantity) TotalQuantity from 
(Select month(saledate) Salesmonths, quantity from Sales) Eachmonths
Group by Salesmonths

-- Task 5
--Select * from Sales

Select distinct customername from Sales s
Where exists (Select * from Sales 
              Where s.product = product 
			  and s.Customername != Customername)

-- Task 6
create table Fruits(Name varchar(50), Fruit varchar(50))
Select * from Fruits

insert into Fruits values 
('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), ('Mario', 'Orange')
Select * from Fruits

-- Answer: 
--Select * from Fruits


Select Name,
   Count(Case When Fruit = 'Apple' then 1 end) Apple,
   Count(Case When Fruit = 'Orange' then 1 end) Orange,
   Count(Case When Fruit = 'Banana' then 1 end) Banana
From Fruits
Group by name

-- Task 7
create table Family(ParentId int, ChildID int)
Select * from Family

insert into Family values (1, 2), (2, 3), (3, 4)
Select * from Family;

-- Answer: 
--Select * from Family

With cte as 
  (Select ParentId, ChildID from Family
   UNION ALL
   Select cte.ParentId, f.ChildID from cte 
   Join Family f on cte.ChildID = f.ParentId)
Select distinct ParentId OlderPerson, ChildID YoungerPerson
From cte

-- Task 8

CREATE TABLE Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);
Select * from Orders

INSERT INTO Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);

Select * from Orders

-- Answer: 
--Select * from Orders

Select * from Orders
Where DeliveryState = 'TX' and CustomerID in
(Select Customerid from Orders where Deliverystate = 'CA')


-- Task 9
create table residents(resid int identity, fullname varchar(50), address varchar(100))
Select * from Residents

insert into residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22')
Select * from Residents

-- Answer: 
--Select * from Residents

-- Task 10


-- Task 11
CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)
Select * from #RankingPuzzle
 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')

Select * from #RankingPuzzle

-- Answer:
Select *, rank() over(order by vals) Rank from #RankingPuzzle 

-- Task 12
CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);
Select * from #EmployeeSales
INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);
Select * from #EmployeeSales

-- Answer: 
--Select * from #EmployeeSales

Select * from #EmployeeSales e
Where salesamount > (Select avg(salesamount) from #EmployeeSales Where department = e.department)

-- Task 13
--Select * from #EmployeeSales

Select * from #EmployeeSales e
Where exists (Select max(salesamount) from #EmployeeSales Where e.employeeid = employeeid and e.salesmonth = salesmonth)

-- Task 14
--Select * from #EmployeeSales


-- Task 15
CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);
Select * from Products

INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);
Select * from Products

-- Answer:
--Select * from Products

Select Name from products
Where price > (Select avg(price) from products)

-- Task 16
--Select * from Products

Select name, stock from products
Where stock < (Select max(stock) from products)

-- Task 17
--Select * from Products

Select name from Products
Where category = (Select category from Products Where Category = 'Laptop')

-- Task 18
--Select * from Products

Select name, Price from Products
Where Price > (Select min(Price) from Products where category = 'Electronics')

-- Task 19 
--Select * from Products

Select name, category, price from Products p
Where price > (Select avg(price) from Products where p.category = category)

-- Task 20
Drop table Orders
CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
Select * from Orders
INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');
Select * from Orders

-- Answer: 
--Select * from Orders

 Select * from Orders 
 Where ProductId in (Select ProductId from Orders Group by ProductID Having count(OrderID) >= 1)

 -- Task 21
 --Select * from Orders
 --Select * from Products

 Select Name from Orders o
 Join Products p on o.ProductID = p.ProductId
 Where Quantity > (Select avg(Quantity) from Orders)

 -- Task 22
 --Select * from Orders
 --Select * from Products


Select name from products p
Left join orders o on p.productid = o.productid
Where o.productid is null

-- Task 23
 --Select * from Orders
 --Select * from Products

Select name, sum(quantity) total_quantity from products p
Join orders o on p.productid = o.productid
Group by name


