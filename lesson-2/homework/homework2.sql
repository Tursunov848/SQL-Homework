-- Basic Level Tasks
-- Task - 1

create table Employees (EmpID int, Name varchar(50), Salary decimal(20))
--select * from Employees

-- Task 2

INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
    (1, 'Eshmat', 3000),
    (2, 'Toshmat', 4000),
    (3, 'Samat', 4500)
--select * from Employees

-- Task 3 

Update Employees
Set Salary = 3500 Where empid = 1
--select * from Employees

-- Task 4

Delete from Employees
where empid = 2
--select * from Employees

-- Task 5 
-- Creating test table (using easier way, getting ready table for test)

Select * into TestTable from Employees
--select * from TestTable

-- Deleting (testing delete command with one row using begin tran and rollback so i can use others asl well)

begin tran 
delete from TestTable 
where empid = 3
--select * from TestTable
rollback tran
--select * from TestTable

-- Truncate (testing truncate command using begin tran and rollback so i can use others asl well)

begin tran
truncate table Testtable
--select * from TestTable
rollback tran
--select * from TestTable

-- Drop 

drop table TestTable
--select * from TestTable

-- Task 6 

Alter table Employees
Alter column Name varchar(100)

-- Task 7 

Alter table employees
Add Department varchar(50)
--select * from Employees

-- Task 8 

Alter table employees
alter column salary float

-- Task 9 

Create table Departments ([Department ID] int primary key, [Department Name] varchar (50))
--select * from Departments

-- Task 10

Truncate table employees
--select * from Employees

-- Intermediate-Level Tasks
-- Task 11

Insert Departments
select DepID, Department from Employee_dep
--select * from Departments

-- Task 12 
-- First i'm adding salary column as i was asked to update salary but i didn't have salary column
ALTER TABLE Departments ADD Salary FLOAT; 
select * from Departments

Update Departments
Set Salary = 
    Case 
        When [Department ID] = 1 then 4000
        When [Department ID] = 2 then 5500
        When [Department ID] = 3 then 6200
        When [Department ID] = 4 then 4800
        When [Department ID] = 5 then 7000
    end;

-- now i have salaries and can do the task 12

Update Departments
Set [Department Name] = 'Management'
Where Salary > 5000
--select * from Departments

-- Task 13

Truncate table Departments
--select * from Departments

-- Task 14

Alter table employees
drop column department
--select * from Employees

-- Task 15 

Exec sp_rename 'Employees', 'StaffMembers'
--select * from StaffMembers

-- Task 16 

Drop table Departments
--select * from departments (successfully deleted)

-- Advanced-Level Tasks 
-- Task 17

Create table Products 
    (ProductID int primary key, 
	ProductName varchar(50),
	Category varchar(50),
	Price decimal(10,2),
	SupplierName varchar (50))
--select * from Products

-- Task 18

Alter table Products
Add Constraint chk_price check (Price > 0)

-- Task 19 

Alter table Products 
Add StockQuantity int default 50
--select * from Products

-- Task 20

Exec sp_rename 'Products.Category', 'ProductCategory', 'column'
--select * from Products

-- Task 21

Insert Products 
Values 
    (1, 'Laptop', 'Electronics', 1200.99, 'Tech Supplier', 30),
    (2, 'Telefon', 'Electronics', 799.50, 'Mobile Distributors', 50),
    (3, 'Divan', 'Furniture', 150.00, 'Furniture World', 40),
    (4, 'Kirmoshina', 'Appliances', 499.99, 'Home Essentials', 25),
    (5, 'Telefon chexoli', 'Accessories', 59.99, 'Tech Supplier', 100)
--select * from Products

-- Task 22

Select * into Products_backup from Products
--select * from Products_backup

-- Task 23

Exec sp_rename 'Products', 'Inventory'
select * from inventory

-- Task 24 

Alter table Inventory
Drop constraint chk_price

Alter table Inventory
Alter column price float

Alter table Inventory
Add Constraint chk_price check (Price > 0)

--Dear AI, in order to done this task i had to drop the constraint first, so i could change the data type of price to float since on task 18 i had added constraint before


-- Task 25

Alter table Inventory add ProductCode INT IDENTITY(1000, 5) 
