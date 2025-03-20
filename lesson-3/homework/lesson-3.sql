-- Task 1
-- With 'BULK INSERT' we can quicly import large amounts of datas from csv or txt files. It gives us efficient data loading, automates data import, supports various file formats, control over data import and etc.

-- Task 2
-- Fours file formats which can be imported to SQL server are: 1. CSV (Comma-Separated Values), TXT (Plain Text / Fixed Width / Delimited Text Files), Excel Files (.xls or .xlsx), XML (Extensible Markup Language). 

-- Task 3

Create table Products (ProductID int primary key, ProductName varchar(50), Price decimal(10,2))
--Select * from Products

-- Task 4

Insert into Products values (1, 'Noutbuk', 800)
Insert into Products values (2, 'Telefon', 1000)
Insert into Products values (3, 'Naushnik', 200)
--Select * from Products

-- Task 5 

-- Let's first see table with not null

Create table test_notnull (id int not null, name varchar(20))
--Select * from test_notnull

Insert into test_notnull values (1, 'a')
Insert into test_notnull values (-10, 'b')
Insert into test_notnull values (30, 'c')
Insert into test_notnull values (0, 'd')
--Select * from test_notnull
--le'ts try to add null to this table now

Insert into test_notnull values (null, 'e')
--didn't add. So le'ts now change this table from not null to nullable and insert nulls

Alter table test_notnull
Alter column id int null

Insert into test_notnull values (null, 'e')
--Select * from test_notnull
-- here we got

-- Task 6 
Alter table Products
Add constraint uq_productname unique (ProductName)

-- to check, i will try to add duplicate prodcuts name

Insert Products values (4, 'Chexol', 50)
--select * from Products
Insert Products values (5, 'Chexol', 60)
--didn't add

-- Task 7 

/* 
So UNIQUE constraint can:   
1. Prevent duplicate names/id etc. from being inserted.  
2. Ensure data integrity and consistency.  
3. Help maintain a clean and reliable product catalog.  
*/

-- Task 8 

Create table Categories (CategoryID int primary key, CategoryName varchar(50) unique)
(Select * from Categories)

-- Task 9 

/* 
We use IDENTITY column in order to automatically generate 
unique numeric values for column, typically for primary keys. 
It ensures that each row gets a unique, sequential number without manual input.
*/

-- Task 10

--select * from Products
Bulk insert Products  
From 'C:\\Users\\laziz\\Desktop\\SQLtask_20\\SQLtask20.txt'
With (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 1
)
--select * from Products

-- Task 11 and 12. dear Ai it may seem liitle bit confusing, but what i am doing is linking foreign key and primary, but before that we have to fix somethings here. Im now adding records to categories as i didn't have records. however at the end I tested in all ways, so no worries. 
--select * from Products
--select * from Categories

Alter table Products
Add CategoryID int

Insert Categories   
Values 
(1, 'Electronics'),  
(2, 'Mobile Devices'),  
(3, 'Accessories'),  
(4, 'Audio Equipment'),  
(5, 'Home Appliances'),  
(6, 'Discounted Items'),  
(7, 'Chargers & Power');  

Update Products Set CategoryID = 1 Where ProductID = 1  
Update Products Set CategoryID = 2 Where ProductID = 2
Update Products Set CategoryID = 4 Where ProductID = 3  
Update Products Set CategoryID = 3 Where ProductID = 4 
Update Products Set CategoryID = 2 Where ProductID = 5 
Update Products Set CategoryID = 5 Where ProductID = 6   
Update Products Set CategoryID = 7 Where ProductID = 7

Alter table Products  
Add CONSTRAINT FK_Products_Categories  
Foreign key (CategoryID) references Categories(CategoryID)

--select * from Products
--select * from Categories
-- Now checking no make sure again wethere it's working or not

Insert Products 
Values (8, 'Smartwatch', 250.00, 1)
--select * from Products

Insert Products 
Values (9, 'Tablet', 400.00, 99)
-- everything working

-- Task 13

Alter table Products  
Add Constraint Ck_Price CHECK (Price > 0)

-- Task 14

Alter table Products  
Add Stock INT NOT NULL DEFAULT 0
--select * from Products

-- task 15

Select ProductID, ProductName, Price, ISNULL(Stock, 0) as Stock from Products
--select * from Products
Insert Products 
Values (9, 'Chexol', 100, '2', NULL)

-- Task 16

/*
We use Foreign key to establish and enforce a relationship between two tables. 
So it ensures referential integrity, meaning that the values in the foreign key column of one table must 
match values in the primary key column of another table.
*/

-- Task 17

Create table Customers (
    CustomerID int primary key, 
    CustomerName varchar(50) NOT NULL, 
    Age int NOT NULL, 
    Email varchar(100), 
    Check (Age >= 18) 
)
--Select * from Customers

--checking
Insert Customers 
Values (2, 'Abdumannof', 16, 'blabla@gmail.com')

Insert Customers 
Values (2, 'Abdumannof', 18, 'blabla@gmail.com')
--Select * from Customers

-- Task 18

Create table Employees (
    EmployeeID int identity(100, 10) primary key, 
    EmployeeName varchar(100) NOT NULL, 
    Position varchar(50), 
    Salary decimal(10,2)
)
--Select * from Employees

Insert Employees 
VALUES 
    ('Dindiq Dindigovich', 'Manager', 75000.00),
    ('Mitig mitigovich', 'Developer', 65000.00)
   --Select * from Employees

--Task 19

Create table OrderDetails (
    OrderID int NOT NULL,  
    ProductID int NOT NULL,  
    Quantity int NOT NULL,  
    Price decimal(10,2) NOT NULL,  
    Primary key (OrderID, ProductID)  
)
--Select * from OrderDetails

--checking

Insert OrderDetails 
Values (1, 101, 2, 50.00)
--Select * from OrderDetails
Insert OrderDetails 
Values (1, 101, 3, 60.00)
-- all good

-- Task 20

--select * from Customers

--delete customers
--where CustomerID = 2

--alter table customers
--alter column Phone varchar(50)

Insert Customers 
Values
(1, 'Abdumannof', 21, 'yes@email.com', NULL),  
(2, 'Ali', 22, NULL, '88-888-8888'),  
(3, 'Vali', 25, NULL, NULL) 
--select * from Customers

Select 
    CustomerID, CustomerName,  
    ISNULL(Email, 'No Email Provided') as EmailStatus,  
    ISNULL(Phone, 'No Phone') as PhoneStatus,  
    COALESCE(Phone, 'No Contact Available') as PreferredContact  
From Customers

-- Task 21

Create table Employeess (
    EmpID int primary key,          
    EmpName varchar(50) NOT NULL, 
    Age int check (Age >= 18),     
    Email varchar(100) UNIQUE,    
    Salary decimal(10,2) NOT NULL  
)
--select * from Employeess

Insert Employeess 
Values (1, 'Surnechi', 25, 'toyxizmatlari@email.com', 5000.00)
--select * from Employeess
Insert Employeess 
Values (2, 'Karnechi', 28, 'toyxizmatlari@email.com', 4000.00)

Insert Employeess 
Values (3, 'Gichchechi', 29, null, 4000.00)
--select * from Employeess

-- Task 22

Create table Customerss (
    CustomerID int primary key,
    CustomerName varchar(50) NOT NULL
)
--select * from Customerss

Create table Orders (
    OrderID int primary key,
    CustomerID int,
    OrderDate Date NOT NULL,
    foreign key (CustomerID) references Customers(CustomerID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
)
--select * from Customerss
--select * from Orders

Insert Customerss Values (1, 'Qoshnim')
Insert Orders Values (101, 1, '2025-03-20')

--select * from Customerss
--select * from Orders

Delete from Customerss 
Where CustomerID = 1

--select * from Customerss
--select * from Orders

Update Customers 
Set CustomerID = 4 
Where CustomerID = 1

--select * from Customerss
--select * from Orders
