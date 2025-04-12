-- Creating database for homework12

Create database Homework_12
Use Homework_12

-- Puzzle 1
/*
Create table Person (personId int, firstName varchar(255), lastName varchar(255)) 

select * from Person

insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen') 
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob') 

select * from Person

Create table Address (addressId int, personId int, city varchar(255), state varchar(255)) 

select * from Address 

insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York') 

insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')

select * from Address 
*/

-- Answer:
Select firstName, lastName, city, state from Person p
Left Join Address a on p.personID = a.personID

-- Puzzle 2
/*
Create table Employee (id int, name varchar(255), salary int, managerId int) 

Select * from Employee 

insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3') 
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4') 
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL) 
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

Select * from Employee 
*/

-- Answer:
/*
Select e1.name Employee from Employee e1
Join Employee e2 on e1.managerId = e2.Id
Where e1.Salary > e2.Salary

-- Puzzle 3
drop table Person
Create table Person (Id int, Email varchar(255))

Select * from Person

insert into Person (id, email) values ('1', 'a@b.com') 
insert into Person (id, email) values ('2', 'c@d.com') 
insert into Person (id, email) values ('3', 'a@b.com')

Select * from Person
*/

-- Answer:
Select email from person
group by email
having count(email) > 1

-- Puzzle 4
/*
Create table Person (Id int, Email varchar(255))

truncate table Person

Select * from Person

insert into Person (id, email) values ('1', 'john@example.com')
insert into Person (id, email) values ('2', 'bob@example.com')
insert into Person (id, email) values ('3', 'john@example.com')

Select * from Person
*/

-- Answer:
Delete p1 from person p1, person p2
Where p1.id > p2.id and p1.email = p2.email

-- Puzzle 5
/*
CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);
Select * from boys

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George'); 
Select * from boys

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);
Select * from girls

INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');
Select * from girls
*/

-- Answer: 
Select distinct g.parentname from boys b
RIght Join girls g on b.parentName = g.parentName
Where b.parentname is null

-- Puzzle 6 
Use [TSQL2012]

Select * from Sales.Orders 
-- Answers



--Puzzle 7
Use Homework_12
/*
CREATE TABLE Cart1 ( Item VARCHAR(100) PRIMARY KEY ); 
Select * from cart1

INSERT INTO Cart1 (Item) VALUES ('Sugar'),('Bread'),('Juice'),('Soda'),('Flour'); 
Select * from cart1

CREATE TABLE Cart2 ( Item VARCHAR(100) PRIMARY KEY ); 
Select * from cart2

INSERT INTO Cart2 (Item) VALUES ('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit'); 
Select * from cart2


Select * from cart1
Select * from cart2
*/
--Answer:
select isnull(c1.item, ' ') [item Cart1], isnull(c2.item, ' ') [item Cart2] from Cart1 c1
full Join Cart2 c2 on c1.item = c2.item 
Order by c1.item desc

-- Puzzle 8

create table match1 (MatchID int, Match varchar(30), Score varchar(5)) 

Select * from match1

insert into match1 values 
(1,'Italy-Spain','2:0'), (2,'Spain-France','2:1'), (3,'France-Belgium','0:0'), 
(4,'Belgium-Spain','2:2'), (5,'Belgium-Italy','0:3'), (6,'Italy-France','2:0');

Select * from match1

-- Answer:

-- Puzzle 9
/*
Create table Customers (id int, name varchar(255)) 

Select * from Customers

insert into Customers (id, name) values ('1', 'Joe') 
insert into Customers (id, name) values ('2', 'Henry') 
insert into Customers (id, name) values ('3', 'Sam') 
insert into Customers (id, name) values ('4', 'Max') 

Select * from Customers

Create table Orders (id int, customerId int) 

Select * from Orders

insert into Orders (id, customerId) values ('1', '3') 
insert into Orders (id, customerId) values ('2', '1')

Select * from Orders
Select * from Customers
*/
-- Answer: 
Select name Customers from Customers c
left Join Orders o on c.id = o.customerid
Where o.id is null

-- Puzzle 10
/*
Create table Students (student_id int, student_name varchar(20)) 
Select * from Students

Create table Subjects (subject_name varchar(20)) 
Select * from Subjects

Create table Examinations (student_id int, subject_name varchar(20)) 
Select * from Examinations

insert into Students (student_id, student_name) values ('1', 'Alice')
insert into Students (student_id, student_name) values ('2', 'Bob') 
insert into Students (student_id, student_name) values ('13', 'John')
insert into Students (student_id, student_name) values ('6', 'Alex') 
Select * from Students

insert into Subjects (subject_name) values ('Math') 
insert into Subjects (subject_name) values ('Physics') 
insert into Subjects (subject_name) values ('Programming') 
Select * from Subjects

insert into Examinations (student_id, subject_name) values ('1', 'Math') 
insert into Examinations (student_id, subject_name) values ('1', 'Physics') 
insert into Examinations (student_id, subject_name) values ('1', 'Programming') 
insert into Examinations (student_id, subject_name) values ('2', 'Programming') 
insert into Examinations (student_id, subject_name) values ('1', 'Physics') 
insert into Examinations (student_id, subject_name) values ('1', 'Math') 
insert into Examinations (student_id, subject_name) values ('13', 'Math') 
insert into Examinations (student_id, subject_name) values ('13', 'Programming') 
insert into Examinations (student_id, subject_name) values ('13', 'Physics')
insert into Examinations (student_id, subject_name) values ('2', 'Math') 
insert into Examinations (student_id, subject_name) values ('1', 'Math')
Select * from Examinations

Select * from Students
Select * from Subjects
Select * from Examinations
*/
-- Answer:

Select s.student_id, s.student_name, su.subject_name, 
count(e.student_id) attended_exams from Students s 
Cross join Subjects su 
Left join Examinations e on s.student_id = e.Student_id and su.subject_name = e.subject_name
Group by s.student_id, s.student_name, su.subject_name
Order by  s.student_id, su.subject_name


