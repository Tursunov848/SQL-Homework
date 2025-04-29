-- Creating database for homework_19 --

Create database homework_19
Use homework_19

-- Level 1 --
-- Task 1

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);
Select * from employees

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

Select * from employees

-- Answer:
--Select * from employees

Select * from Employees
Where salary = (select min(salary) from employees)

-- Task 2
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);
Select * from Products

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);

Select * from Products

-- Answer: 
--Select * from Products

Select * from products
Where price > (select avg(price) from products)

-- Level 2 --
-- Task 3

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
Select * from departments

-- Changed the name of table cuz i had one in this database and didnt want to drop the table or change database
CREATE TABLE employees1 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
Select * from employees1

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');
Select * from departments

INSERT INTO employees1 (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);
Select * from employees1

-- Answer:
--Select * from departments
--Select * from employees1

Select * from employees1 
Where department_id 
  in (Select id from departments 
      Where department_name = 'sales')

-- Task 4
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);
Select * from customers

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
Select * from orders

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');
Select * from customers

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);
Select * from orders

-- Answer: 
--Select * from customers
--Select * from orders

Select * from Customers 
Where customer_id not in 
      (Select customer_id from Orders)


-- Level 3 --
-- Task 5

-- Changed the name of table cuz i had one in this database and didnt want to drop the table or change database
CREATE TABLE products1 (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);
Select * from products1

INSERT INTO products1 (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);
Select * from products1

-- Answer: 
--Select * from products1

Select * from products1 p1
Where price in 
     (Select max(price) from products1 
	  Where p1.category_id = category_id)

-- Task 6
CREATE TABLE departments1 (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
Select * from departments1

CREATE TABLE employees2 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
Select * from employees2

INSERT INTO departments1 (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');
Select * from departments1

INSERT INTO employees2 (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);
Select * from employees2

-- Answer: 
--Select * from employees2
--Select * from departments1

Select *, d.department_name from employees2 e
Join departments1 d on e.department_id = d.id
Where e.department_id = 
    (Select top 1 department_id from employees2
     Group by department_id
     Order by avg(salary) desc)

-- Level 4 --
-- Task 7

CREATE TABLE employees3 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);
Select * from employees3

INSERT INTO employees3 (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);
Select * from employees3

-- Answer: 
--Select * from employees3

Select * from Employees3 e3
Where salary > (Select avg(salary) from employees3 
                Where e3.department_id = department_id 
				Group by department_id )

-- Task 8
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);
Select * from Students

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
Select * from grades

INSERT INTO students (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');
Select * from Students

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);
Select * from grades

-- Answer: 
--Select * from Students
--Select * from grades

Select s.student_id, name, course_id, grade from students s
Join grades g on s.student_id = g.student_id
Where grade = 
    (Select max(grade) from grades
     Where course_id = g.course_id)

-- Level 5
-- Task 9
CREATE TABLE products2 (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);
Select * from products2

INSERT INTO products2 (id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);

Select * from products2

-- Answer: 
--Select * from products2

Select * from products2 p1
Where 2 = (Select count(distinct price) from products2 
Where category_id = p1.category_id and price > p1.price)

-- Task 10
CREATE TABLE employees4 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);
Select * from employees4

INSERT INTO employees4 (id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);

Select * from employees4

-- Answer: 
--Select * from employees4

Select * from employees4 e
Where salary > (Select avg(salary) from employees4) 
and salary < (Select max(salary) from employees4 
              Where department_id = e.department_id 
			  Group by department_id)
