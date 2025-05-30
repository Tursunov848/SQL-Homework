-- Creating database homework_21

Create database homework_21
Use homework_21

-- Inserting table
CREATE TABLE ProductSales (
    SaleID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    SaleDate DATE NOT NULL,
    SaleAmount DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    CustomerID INT NOT NULL
);
Select * from ProductSales

INSERT INTO ProductSales (SaleID, ProductName, SaleDate, SaleAmount, Quantity, CustomerID)
VALUES 
(1, 'Product A', '2023-01-01', 148.00, 2, 101),
(2, 'Product B', '2023-01-02', 202.00, 3, 102),
(3, 'Product C', '2023-01-03', 248.00, 1, 103),
(4, 'Product A', '2023-01-04', 149.50, 4, 101),
(5, 'Product B', '2023-01-05', 203.00, 5, 104),
(6, 'Product C', '2023-01-06', 252.00, 2, 105),
(7, 'Product A', '2023-01-07', 151.00, 1, 101),
(8, 'Product B', '2023-01-08', 205.00, 8, 102),
(9, 'Product C', '2023-01-09', 253.00, 7, 106),
(10, 'Product A', '2023-01-10', 152.00, 2, 107),
(11, 'Product B', '2023-01-11', 207.00, 3, 108),
(12, 'Product C', '2023-01-12', 249.00, 1, 109),
(13, 'Product A', '2023-01-13', 153.00, 4, 110),
(14, 'Product B', '2023-01-14', 208.50, 5, 111),
(15, 'Product C', '2023-01-15', 251.00, 2, 112),
(16, 'Product A', '2023-01-16', 154.00, 1, 113),
(17, 'Product B', '2023-01-17', 210.00, 8, 114),
(18, 'Product C', '2023-01-18', 254.00, 7, 115),
(19, 'Product A', '2023-01-19', 155.00, 3, 116),
(20, 'Product B', '2023-01-20', 211.00, 4, 117),
(21, 'Product C', '2023-01-21', 256.00, 2, 118),
(22, 'Product A', '2023-01-22', 157.00, 5, 119),
(23, 'Product B', '2023-01-23', 213.00, 3, 120),
(24, 'Product C', '2023-01-24', 255.00, 1, 121),
(25, 'Product A', '2023-01-25', 158.00, 6, 122),
(26, 'Product B', '2023-01-26', 215.00, 7, 123),
(27, 'Product C', '2023-01-27', 257.00, 3, 124),
(28, 'Product A', '2023-01-28', 159.50, 4, 125),
(29, 'Product B', '2023-01-29', 218.00, 5, 126),
(30, 'Product C', '2023-01-30', 258.00, 2, 127);
Select * from ProductSales

-- Task 1
--Select * from ProductSales

Select *, row_number() over(order by saledate) Row_Number from ProductSales

-- Task 2
--Select * from ProductSales

Select ProductName, 
       sum(quantity) TotalQuantity, 
       dense_rank() over(order by sum(quantity) desc) Rank  from ProductSales
Group by ProductName

-- Task 3
--Select * from ProductSales

Select *, rank() over(partition by CustomerID order by SaleAmount desc) TopSale from ProductSales

-- task 4
--Select * from ProductSales

Select *, lead(saledate) over(Order by SaleDate) Next_SaleDate from ProductSales

-- Task 5
--Select * from ProductSales

Select *, lag(saledate) over(Order by SaleDate) Next_SaleDate from ProductSales

-- Task 6
--Select * from ProductSales

Select *, lag(SaleAmount) over(Order by Saledate) Next_SaleDate,
Case 
When Saleamount > lag(SaleAmount) over(Order by Saledate) then 'Higher'
Else 'Lower'
End Rank
From ProductSales

-- Task 7
--Select * from ProductSales

Select *, saleamount - lag(SaleAmount) over(order by saledate) from ProductSales

-- Task 8
--Select * from ProductSales

Select *, lead(saleamount) over(Order by SaleDate) Next_Sale ,
          cast((lead(saleamount) over (Order by saledate) - saleamount) * 100.0 / saleamount as decimal(5,2)
) percentage from ProductSales

-- Task 9
--Select * from ProductSales

-- Task 10
--Select * from ProductSales

Select *, saleamount - first_value(saleamount) over(partition by productname order by saledate) firstsale_diff
from ProductSales;

-- Task 11
--Select * from ProductSales

With cte as(
Select *, lag(saleamount) over(partition by productname order by saledate) sales from ProductSales) 
Select * from cte Where saleamount > sales

-- Task 12
--Select * from ProductSales

select *, sum(saleamount) over (order by saledate) Closing_balance from Productsales

-- Task 13
--Select * from ProductSales

Select *, avg(saleamount) over(partition by productname order by saledate
rows between 2 preceding and current row) avg_sales from ProductSales

-- Task 14
--Select * from ProductSales

Select *, saleamount - avg(saleamount) over () from ProductSales

-- Inserting 2nd table
CREATE TABLE Employees1 (
    EmployeeID   INT PRIMARY KEY,
    Name         VARCHAR(50),
    Department   VARCHAR(50),
    Salary       DECIMAL(10,2),
    HireDate     DATE
);
Select * from Employees1

INSERT INTO Employees1 (EmployeeID, Name, Department, Salary, HireDate) VALUES
(1, 'John Smith', 'IT', 60000.00, '2020-03-15'),
(2, 'Emma Johnson', 'HR', 50000.00, '2019-07-22'),
(3, 'Michael Brown', 'Finance', 75000.00, '2018-11-10'),
(4, 'Olivia Davis', 'Marketing', 55000.00, '2021-01-05'),
(5, 'William Wilson', 'IT', 62000.00, '2022-06-12'),
(6, 'Sophia Martinez', 'Finance', 77000.00, '2017-09-30'),
(7, 'James Anderson', 'HR', 52000.00, '2020-04-18'),
(8, 'Isabella Thomas', 'Marketing', 58000.00, '2019-08-25'),
(9, 'Benjamin Taylor', 'IT', 64000.00, '2021-11-17'),
(10, 'Charlotte Lee', 'Finance', 80000.00, '2016-05-09'),
(11, 'Ethan Harris', 'IT', 63000.00, '2023-02-14'),
(12, 'Mia Clark', 'HR', 53000.00, '2022-09-05'),
(13, 'Alexander Lewis', 'Finance', 78000.00, '2015-12-20'),
(14, 'Amelia Walker', 'Marketing', 57000.00, '2020-07-28'),
(15, 'Daniel Hall', 'IT', 61000.00, '2018-10-13'),
(16, 'Harper Allen', 'Finance', 79000.00, '2017-03-22'),
(17, 'Matthew Young', 'HR', 54000.00, '2021-06-30'),
(18, 'Ava King', 'Marketing', 56000.00, '2019-04-16'),
(19, 'Lucas Wright', 'IT', 65000.00, '2022-12-01'),
(20, 'Evelyn Scott', 'Finance', 81000.00, '2016-08-07');

Select * from Employees1

-- task 15
--Select * from Employees1

Select *, dense_rank() over(order by salary desc) salary_rank from Employees1;

-- Task 16
--Select * from Employees1

With cte as(
Select  *, dense_rank() over(partition by Department order by salary desc) salary_rank from Employees1)
Select * from cte where salary_rank <= 2;

-- Task 17
--Select * from Employees1

With cte as(
Select  *, dense_rank() over(partition by Department order by salary asc) salary_rank from Employees1)
Select * from cte where salary_rank = 1

-- Task 18
--Select * from Employees1

Select *, sum(salary) over(partition by department order by salary) Running_total from Employees1

-- Task 19
--Select * from Employees1

Select *, sum(salary) over(partition by department) Total_salary from Employees1

-- Task 20
--Select * from Employees1

Select *, avg(salary) over(partition by department) avg_salary from Employees1

-- Task 21
--Select * from Employees1

Select *, salary - avg(salary) over(partition by department) salary_diff from Employees1

-- Task 22
--Select * from Employees1

Select *, avg(salary) over( order by employeeid
rows between 1 preceding and 1 following) avg_sales from Employees1

-- Task 23
--Select * from Employees1

Select *, sum(salary) over(partition by hiredate order by employeeid
rows between 2 preceding and current row) sum_sales from Employees1
