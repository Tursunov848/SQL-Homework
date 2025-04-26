--Creating database for homework 18

Create database homework_18
Use homework_18

-- Part 1:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2)
);
Select * from Employees

CREATE TABLE DepartmentBonus (
    Department NVARCHAR(50) PRIMARY KEY,
    BonusPercentage DECIMAL(5,2)
);
Select * from DepartmentBonus


INSERT INTO Employees VALUES
(1, 'John', 'Doe', 'Sales', 5000),
(2, 'Jane', 'Smith', 'Sales', 5200),
(3, 'Mike', 'Brown', 'IT', 6000),
(4, 'Anna', 'Taylor', 'HR', 4500);
Select * from Employees


INSERT INTO DepartmentBonus VALUES
('Sales', 10),
('IT', 15),
('HR', 8);
Select * from DepartmentBonus

-- Task 1: 
--Select * from Employees
--Select * from DepartmentBonus

Create proc GetEmployeeBonus
As
Begin
    Create table #EmployeeBonus(EmployeeID int, FullName varchar(50), Department varchar(50), 
	Salary float(10), BonusAmount float(10))

    Insert into #EmployeeBonus 
    Select EmployeeID, FirstName + ' ' + LastName as FullName, e.Department, Salary, 
	Salary * BonusPercentage / 100 as BonusAmount from Employees e
	Join DepartmentBonus d on e.Department = d.Department

    Select * from #EmployeeBonus
End

Exec GetEmployeeBonus

-- Task 2
--Select * from Employees
--Select * from DepartmentBonus

Create proc EmployeeSalary @DepartmentName varchar(50), @IncreasePercentage float(10)
As
Begin
    Update Employees
    Set Salary = Salary + (Salary * @IncreasePercentage / 100)
    Where Department = @DepartmentName

    Select * from Employees
    Where Department = @DepartmentName
End

Exec EmployeeSalary @DepartmentName = 'Sales', @IncreasePercentage = 10


-- Part 2:
CREATE TABLE Products_Current (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);
Select * from Products_Current

CREATE TABLE Products_New (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);
Select * from Products_New

INSERT INTO Products_Current VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 600),
(3, 'Smartphone', 800);
Select * from Products_Current

INSERT INTO Products_New VALUES
(2, 'Tablet Pro', 700),
(3, 'Smartphone', 850),
(4, 'Smartwatch', 300);
Select * from Products_New

-- Task 3
--Select * from Products_New
--Select * from Products_Current

Merge into Products_Current as target
Using Products_New as source on target.ProductID = source.ProductID

When matched then 
update set target.ProductName = source.ProductName, target.Price = source.Price

When not matched by target then
Insert (ProductID, ProductName, Price) values (source.ProductID, source.ProductName, source.Price)

When not matched by source then delete;

Select * from Products_Current

-- Task 4
Create table Tree (id int, p_id int)
Select * from tree

insert into Tree (id, p_id) values ('1', NULL)
insert into Tree (id, p_id) values ('2', '1')
insert into Tree (id, p_id) values ('3', '1')
insert into Tree (id, p_id) values ('4', '2')
insert into Tree (id, p_id) values ('5', '2')
Select * from tree

-- Answer: 
Select id, 
Case 
    When p_id is null then 'Root' 
    When p_id is not null and id in (Select p_id from Tree) then 'Inner' 
    Else 'Leaf' 
End type from Tree

-- Task 5
Create table Signups (user_id int, time_stamp datetime)
Select * from Signups

Create Confirmations (user_id int, time_stamp datetime, action varchar(20) check (action in ('confirmed', 'timeout')))
Select * from Confirmations

insert into Signups (user_id, time_stamp) values ('3', '2020-03-21 10:16:13')
insert into Signups (user_id, time_stamp) values ('7', '2020-01-04 13:57:59')
insert into Signups (user_id, time_stamp) values ('2', '2020-07-29 23:09:44')
insert into Signups (user_id, time_stamp) values ('6', '2020-12-09 10:39:37')
Select * from Signups

insert into Confirmations (user_id, time_stamp, action) values ('3', '2021-01-06 03:30:46', 'timeout')
insert into Confirmations (user_id, time_stamp, action) values ('3', '2021-07-14 14:00:00', 'timeout')
insert into Confirmations (user_id, time_stamp, action) values ('7', '2021-06-12 11:57:29', 'confirmed')
insert into Confirmations (user_id, time_stamp, action) values ('7', '2021-06-13 12:58:28', 'confirmed')
insert into Confirmations (user_id, time_stamp, action) values ('7', '2021-06-14 13:59:27', 'confirmed')
insert into Confirmations (user_id, time_stamp, action) values ('2', '2021-01-22 00:00:00', 'confirmed')
insert into Confirmations (user_id, time_stamp, action) values ('2', '2021-02-28 23:59:59', 'timeout')
Select * from Confirmations

-- Answer: 
--Select * from Signups
--Select * from Confirmations

Select s.user_id, Round(avg(case when c.action = 'confirmed' then 1.00 else 0.00 end),2)  confirmation_rate from Signups s
Left join Confirmations c on s.user_id = c.user_id
Group by s.user_id

-- Task 6
CREATE TABLE employees1 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);
Select * from employees1

INSERT INTO employees1 (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);
Select * from employees1

-- Answer: 
--Select * from employees1
-- I changed the name of the table as i have table under this name in this database, i didnt want to drop that table 

Select * from Employees1
Where Salary = (Select min(salary) from Employees1)

-- Task 7
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2)
);
Select * from Products

-- Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    SaleDate DATE
);
Select * from Sales

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop Model A', 'Electronics', 1200),
(2, 'Laptop Model B', 'Electronics', 1500),
(3, 'Tablet Model X', 'Electronics', 600),
(4, 'Tablet Model Y', 'Electronics', 700),
(5, 'Smartphone Alpha', 'Electronics', 800),
(6, 'Smartphone Beta', 'Electronics', 850),
(7, 'Smartwatch Series 1', 'Wearables', 300),
(8, 'Smartwatch Series 2', 'Wearables', 350),
(9, 'Headphones Basic', 'Accessories', 150),
(10, 'Headphones Pro', 'Accessories', 250),
(11, 'Wireless Mouse', 'Accessories', 50),
(12, 'Wireless Keyboard', 'Accessories', 80),
(13, 'Desktop PC Standard', 'Computers', 1000),
(14, 'Desktop PC Gaming', 'Computers', 2000),
(15, 'Monitor 24 inch', 'Displays', 200),
(16, 'Monitor 27 inch', 'Displays', 300),
(17, 'Printer Basic', 'Office', 120),
(18, 'Printer Pro', 'Office', 400),
(19, 'Router Basic', 'Networking', 70),
(20, 'Router Pro', 'Networking', 150);
Select * from Products

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 2, '2024-01-15'), -- Laptop A
(2, 1, 1, '2024-02-10'), -- Laptop A again
(3, 1, 3, '2024-03-08'), -- Laptop A again
(4, 2, 1, '2024-01-22'), -- Laptop B
(5, 3, 5, '2024-01-20'), -- Tablet X
(6, 5, 2, '2024-02-18'), -- Smartphone Alpha
(7, 5, 1, '2024-03-25'), -- Smartphone Alpha again
(8, 6, 4, '2024-04-02'), -- Smartphone Beta
(9, 7, 2, '2024-01-30'), -- Smartwatch 1
(10, 7, 1, '2024-02-25'), -- Smartwatch 1 again
(11, 7, 1, '2024-03-15'), -- Smartwatch 1 again
(12, 9, 8, '2024-01-18'), -- Headphones Basic
(13, 9, 5, '2024-02-20'), -- Headphones Basic again
(14, 10, 3, '2024-03-22'), -- Headphones Pro
(15, 11, 2, '2024-02-14'), -- Mouse
(16, 13, 1, '2024-03-10'), -- Desktop PC Standard
(17, 14, 2, '2024-03-22'), -- Desktop PC Gaming
(18, 15, 5, '2024-02-01'), -- Monitor 24
(19, 15, 3, '2024-03-11'), -- Monitor 24 again
(20, 19, 4, '2024-04-01'); -- Router Basic
Select * from Sales

-- Answer: 
--Select * from Products
--Select * from Sales

Create proc GetProductSalesSummary @ProductID int
As
Begin
    Select p.ProductName, sum(s.Quantity) TotalQuantitySold, sum(s.Quantity * p.Price) TotalSalesAmount,
    min(s.SaleDate) FirstSaleDate,
    max(s.SaleDate) LastSaleDate from Products p
    Left join Sales s on p.ProductID = s.ProductID
    Where p.ProductID = @ProductID
    Group by p.ProductName
End

Exec GetProductSalesSummary @ProductID = 1





