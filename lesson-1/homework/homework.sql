--Data includes raw data or information
--Database: A place where we store and organize a lot of information for easy access and management.
--Relational Database: A type of database that organizes data into tables with rows and columns, using relationships between them.
--Table: A structured set of data in a database, like a spreadsheet, with rows and columns

--Five key features of SQL Server: 1. Database management. 2. Security. 3. Performance. 4. High Availability. 5. Sorting Data for Analysis.

-- Authentication modes: 1. Windows Authentication Mode. 2. SQL Server Authentication

create database SchoolDB
CREATE TABLE Students (StudentID INT PRIMARY KEY, Name VARCHAR(50), Age INT)

--SQL Server - is a software made by Microsoft company to work with SQL. Also known as T-SQL
--SSMS - is a sql server management studio. Interface that gives us a chance to work with SQL server
--SQL - is a structured query language

-- DQL: Data Query language (retrieves data, main command is select)
--Example:

Select 'MAAB Academy'

--DDL: Data Definiton language (defines structure, main commands are create, alter, drop, truncate)
--Example:

DROP TABLE Students
CREATE TABLE Students (StudentID INT PRIMARY KEY, Name VARCHAR(50), Age INT)
ALTER TABLE Students ADD Email VARCHAR(100)
Select * from Students

--DML: Data Manipulation Language (modifies data, main commands are insert, update, delete)
--Example: 

Insert Students values (1, 'John Doe', 20, 'palonchi@gmail.com')
Update Students 
Set Age = 21 
Where StudentID = 1;

Delete from  Students 
where StudentID = 1;

--DCL: Data Control Language (manages permissions, main commands are grant and revoke)
--Example:

GRANT SELECT ON Students TO user1
REVOKE SELECT ON Students FROM user1 --these are just examples that i got by researching, didn't create user as teacher said we will study this in class 20

--TCL: Transaction Control Language (manages transactions, main commands are begin, rollback, commit, savepoint)
--Example: 

begin tran
INSERT Students values (3, 'Abdumannof', 22, 'blabla@gmail.com')
Rollback tran

begin tran
INSERT Students values (1, 'Abdumannof', 23, 'blabla@gmail.com')
select * from Students
commit

-- Three records into the Students table:

INSERT Students values (3, 'Eshmat', 30, 'blabla@gmail.com')
INSERT Students values (4, 'Toshmat', 25, 'blabla@gmail.com')
INSERT Students values (5, 'Ahmad', 40, 'blabla@gmail.com')
select * from Students

--Steps to backup the database:
--Right-click on SchoolDB → Select Tasks → Click Back Up → Backup type: Choose "Full → Destination: Select "Disk", then click Add → Set the path → confirm → start the backup process.

--Steps to restore the database
--Right-click Databases → Select Restore Database → Under "Source", choose "Device" → Click Browse → Click Add → select → click ok → click ok

Use SchoolDB  
Select * from Students
