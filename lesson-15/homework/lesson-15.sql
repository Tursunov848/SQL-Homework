-- Creating database for homework15

Create database homework_15
Use homework_15

-- Inserting tables

-- 1st table

CREATE TABLE Schedule ( ScheduleID CHAR(1) PRIMARY KEY, StartTime DATETIME NOT NULL, EndTime DATETIME NOT NULL ); 

Select * from Schedule

INSERT INTO Schedule (ScheduleID, StartTime, EndTime) VALUES 
('A',CAST('2021-10-01 10:00:00' AS DATETIME),CAST('2021-10-01 15:00:00' AS DATETIME)), 
('B',CAST('2021-10-01 10:15:00' AS DATETIME),CAST('2021-10-01 12:15:00' AS DATETIME));

Select * from Schedule

-- 2nd table

CREATE TABLE Activity ( ScheduleID CHAR(1) REFERENCES Schedule (ScheduleID), ActivityName VARCHAR(100), StartTime DATETIME, 
EndTime DATETIME, PRIMARY KEY (ScheduleID, ActivityName, StartTime, EndTime) );

Select * from Activity

INSERT INTO Activity (ScheduleID, ActivityName, StartTime, EndTime) VALUES 
('A','Meeting',CAST('2021-10-01 10:00:00' AS DATETIME),CAST('2021-10-01 10:30:00' AS DATETIME)), 
('A','Break',CAST('2021-10-01 12:00:00' AS DATETIME),CAST('2021-10-01 12:30:00' AS DATETIME)),
('A','Meeting',CAST('2021-10-01 13:00:00' AS DATETIME),CAST('2021-10-01 13:30:00' AS DATETIME)), 
('B','Break',CAST('2021-10-01 11:00:00'AS DATETIME),CAST('2021-10-01 11:15:00' AS DATETIME));

Select * from Activity

-- 3rd table

CREATE TABLE Numbers ( Id INTEGER, StepNumber INTEGER, [Count] INTEGER ); 

Select * from Numbers

INSERT INTO Numbers VALUES (1,1,1) ,(1,2,-2) ,(1,3,-1) ,(1,4,12) ,(1,5,-2) ,(2,1,7) ,(2,2,-3);

Select * from Numbers

-- 4th table

CREATE TABLE Example ( Id INTEGER IDENTITY(1,1) PRIMARY KEY, String VARCHAR(30) NOT NULL ); 

Select * from Example

INSERT INTO Example VALUES
('123456789'),('abcdefghi');

Select * from Example

-- 5 th table

CREATE TABLE Employees ( EmployeeID INT PRIMARY KEY, DepartmentID INT, 
FirstName VARCHAR(50), LastName VARCHAR(50), Salary DECIMAL(10, 2) );

Select * from Employees

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00), (2, 1, 'Jane', 'Smith', 65000.00), (3, 2, 'James', 'Brown', 70000.00), 
(4, 3, 'Mary', 'Johnson', 75000.00), (5, 4, 'Linda', 'Williams', 80000.00), (6, 2, 'Michael', 'Jones', 85000.00), 
(7, 1, 'Robert', 'Miller', 55000.00), (8, 3, 'Patricia', 'Davis', 72000.00), (9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00);

Select * from Employees

-- 6th table

CREATE TABLE Departments ( DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50) );

Select * from Departments

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES 
(1, 'HR'), (2, 'Sales'), (3, 'Marketing'), (4, 'Finance'), (5, 'IT'), 
(6, 'Operations'), (7, 'Customer Service'), (8, 'R&D'), (9, 'Legal'), (10, 'Logistics');

Select * from Departments

-- 7th table

CREATE TABLE Sales ( SalesID INT PRIMARY KEY, EmployeeID INT, ProductID INT, SalesAmount DECIMAL(10, 2), SaleDate DATE );

Select * from Sales

INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES 
(1, 1, 1, 1500.00, '2025-01-01'), (2, 2, 2, 2000.00, '2025-01-02'), (3, 3, 3, 1200.00, '2025-01-03'),
(4, 4, 4, 1800.00, '2025-01-04'), (5, 5, 5, 2200.00, '2025-01-05'), (6, 6, 6, 1400.00, '2025-01-06'), 
(7, 7, 1, 2500.00, '2025-01-07'), (8, 8, 2, 1700.00, '2025-01-08'), (9, 9, 3, 1600.00, '2025-01-09'), 
(10, 10, 4, 1900.00, '2025-01-10'), (11, 1, 5, 2100.00, '2025-01-11'), (12, 2, 6, 1300.00, '2025-01-12'), 
(13, 3, 1, 2000.00, '2025-01-13'), (14, 4, 2, 1800.00, '2025-01-14'), (15, 5, 3, 1500.00, '2025-01-15'),
(16, 6, 4, 2200.00, '2025-01-16'), (17, 7, 5, 1700.00, '2025-01-17'), (18, 8, 6, 1600.00, '2025-01-18'), 
(19, 9, 1, 2500.00, '2025-01-19'), (20, 10, 2, 1800.00, '2025-01-20'), (21, 1, 3, 1400.00, '2025-01-21'), 
(22, 2, 4, 1900.00, '2025-01-22'), (23, 3, 5, 2100.00, '2025-01-23'), (24, 4, 6, 1600.00, '2025-01-24'), 
(25, 5, 1, 1500.00, '2025-01-25'), (26, 6, 2, 2000.00, '2025-01-26'), (27, 7, 3, 2200.00, '2025-01-27'), 
(28, 8, 4, 1300.00, '2025-01-28'), (29, 9, 5, 2500.00, '2025-01-29'), (30, 10, 6, 1800.00, '2025-01-30'), 
(31, 1, 1, 2100.00, '2025-02-01'), (32, 2, 2, 1700.00, '2025-02-02'), (33, 3, 3, 1600.00, '2025-02-03'), 
(34, 4, 4, 1900.00, '2025-02-04'), (35, 5, 5, 2000.00, '2025-02-05'), (36, 6, 6, 2200.00, '2025-02-06'), 
(37, 7, 1, 2300.00, '2025-02-07'), (38, 8, 2, 1750.00, '2025-02-08'), (39, 9, 3, 1650.00, '2025-02-09'), 
(40, 10, 4, 1950.00, '2025-02-10');

Select * from Sales

-- 8th table

CREATE TABLE Products ( ProductID INT PRIMARY KEY, CategoryID INT, ProductName VARCHAR(100), Price DECIMAL(10, 2) );

Select * from Products

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES 
(1, 1, 'Laptop', 1000.00), (2, 1, 'Smartphone', 800.00), (3, 2, 'Tablet', 500.00), 
(4, 2, 'Monitor', 300.00), (5, 3, 'Headphones', 150.00), (6, 3, 'Mouse', 25.00), 
(7, 4, 'Keyboard', 50.00), (8, 4, 'Speaker', 200.00), (9, 5, 'Smartwatch', 250.00), 
(10, 5, 'Camera', 700.00);

Select * from Products;

-- Easy tasks
-- Task 1
With numbers as (
 Select 1 as number
 union all
 Select number + 1 from numbers where number < 10
)
Select * from Numbers;


-- Task 2

With numbers as (
 Select 1 as number
 union all
 Select number * 2 from numbers where number < 10
)
Select * from Numbers

-- Task 3
--Select * from Sales
--Select * from Employees

Select e.EmployeeID, FirstName EmployeeName, SalesSum from Employees e
Join (Select employeeId, sum(SalesAmount) SalesSum from Sales
Group by employeeID) s
on s.EmployeeId = e.employeeID;

-- Task 4
--Select * from Employees

With AvgSalaryEmp as 
(Select avg(Salary) AvgSalary from Employees)
Select * from AvgSalaryEmp;

-- Task 5
--Select * from sales
--Select * from Products

Select p.ProductID, ProductName, SalesSum from Products p
Join (Select top 1 ProductID, sum(SalesAmount) SalesSum from Sales
Group by ProductID
Order by sum(SalesAmount) desc) s on p.ProductID = s.ProductID

-- Task 6
--Select * from Sales
--Select * from employees


With SalesEmp as 
(Select EmployeeID, count(SalesId) TotalSales from Sales
Group by employeeID) 
Select Firstname, totalsales from Employees e join SalesEmp s on s.employeeid = e.employeeid
where TotalSales > 5;

-- Task 7
--Select * from Sales
--Select * from Products

With SalesProducts as
(Select ProductID, sum(SalesAmount) TotalSales from Sales
Group by ProductID)
Select p.ProductID, p.ProductName, TotalSales from Products p join SalesProducts s on p.productID = s.ProductID
Where TotalSales > 500;

-- Task 8
--Select * from Employees

With SalaryAvg as
(Select avg(Salary) Avgsalary from Employees)
Select EmployeeID, FirstName, Salary from Employees e 
Join SalaryAvg on e.Salary > Avgsalary;

-- Task 9
--Select * from Sales
--Select * from Products

Select p.ProductId, ProductName, Sold from Products p
Join (Select ProductID, count(salesID) Sold from Sales
Group by ProductID) s on p.ProductID = s.ProductID

-- Task 10
--Select * from Sales
--Select * from employees

With EmpSales as
(Select distinct employeeid from sales)
Select e.EmployeeID, Firstname EmployeeName from Employees e left join EmpSales s on e.EmployeeID = s.employeeID
Where s.employeeid is null

-- Medium Tasks
-- Task 1

With FactorialNumber as 
(Select 1 as n, 1 as factorial
UNION ALL
Select n + 1, (n + 1) * factorial from FactorialNumber
Where n < 10
)
Select factorial from FactorialNumber
Where n = 10; 

-- Task 2


-- Task 3
--Select * from Example

With StringSplit as
(Select 1 as position, substring('Example', 1, 1) string
UNION ALL
Select position + 1, substring('Example', position + 1, 1) from StringSplit
Where position < len('Example'))
Select string from StringSplit;

-- Task 4
--Select * from employees
--Select * from Sales


With Ranking as 
(Select e.EmployeeID, sum(s.SalesAmount) TotalSales from Employees e
Join Sales s on e.EmployeeID = s.EmployeeID
Group by e.EmployeeID)
Select EmployeeID, TotalSales,
RANK() OVER (Order by TotalSales desc) SalesRank from Ranking
Order by SalesRank;

-- Task 5
--Select * from Employees
--Select * from Sales


Select top 5 e.employeeid, FirstName EmployeeName, Orders from Employees e
Join (Select EmployeeID, count(SalesID) Orders from Sales
Group by EmployeeID) s on e.employeeid = s.employeeid

-- Task 6
--Select * from Sales

With MonthlySales as 
(Select format(SaleDate, 'yyyy-MM') SaleMonth, sum(SalesAmount) TotalSales from Sales
Group by format(SaleDate, 'yyyy-MM')),
SalesDifference as
(Select SaleMonth, TotalSales, lag(TotalSales) over (Order by SaleMonth) PrevMonthSales,
TotalSales - lag(TotalSales) over (Order by SaleMonth) SalesDiff from MonthlySales)
Select * from SalesDifference;

-- Task 7
--Select * from sales
--Select * from Products

Select  p.CategoryID, Sales from Products p
Join (Select ProductID, sum(SalesAmount) Sales from Sales
Group by ProductID) s on p.ProductID = s.ProductID
GROUP BY p.CategoryID, Sales;

-- Task 8
--Select * from sales
--Select * from Products

With LastYearSales as
(Select ProductID, sum(SalesAmount) TotalSales from Sales s
Where SaleDate >= DATEADD(Year, -1, GETDATE()) 
Group by ProductID
),
RankedProducts as 
(Select p.ProductID, ProductName, TotalSales,
Rank() over (Order by TotalSales desc) SalesRank from Products p
Join LastYearSales s2 on p.ProductID = s2.ProductID
)
Select * from RankedProducts;

-- Task 9
--Select * from Sales
--Select * from Employees

Select e.EmployeeID, e.FirstName, e2.Quarter, e2.TotalSales from Employees e
Join (Select EmployeeID, Concat(year(SaleDate), '-Q', DATEPART(QUARTER, SaleDate)) as Quarter,
Sum(SalesAmount) TotalSales from Sales s
Group by EmployeeID, year(SaleDate), DATEPART(QUARTER, SaleDate)
Having sum(SalesAmount) > 5000) e2 on e.EmployeeID = e2.EmployeeID;


-- Task 10
--Select * from sales
--Select * from Employees


-- Difficult tasks
-- Task 1

With Numbers as 
(Select 1 as num, cast('1' as VARCHAR(Max)) as sequence
UNION ALL
Select num + 1, sequence + cast(num + 1 as varchar) from Numbers
Where num < 5)
Select * from Numbers;

-- Task 2
--Select * from employees
--Select * from Sales

Select e.EmployeeID, e.FirstName, sales.TotalSales from Employees e
Join (Select EmployeeID, sum(SalesAmount) TotalSales from Sales
Where SaleDate >= DATEADD(month, -6, GETDATE())
Group by EmployeeID) sales on e.EmployeeID = sales.EmployeeID
Order by sales.TotalSales desc;

-- Task 3

-- Task 4
--Select * from schedule
--Select * from Activity




