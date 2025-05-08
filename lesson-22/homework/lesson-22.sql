Create database homework_22
Use homework_22

-- Inserting table
CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);
Select * from sales_data

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')

	Select * from sales_data

-- Task 1
--Select * from sales_data

Select *, sum(total_amount) over(partition by customer_id order by order_date) Running_total from Sales_data

-- Task 2
--Select * from sales_data

Select *, count(sale_id) over(partition by product_category) total_orders from sales_data

-- Task 3
--Select * from sales_data

--First aproach
Select *, max(total_amount) over(partition by product_category) from sales_data

-- Second aproach
With cte as(
Select *, dense_rank() over (partition by product_category order by total_amount desc) max_amount from sales_data)
Select * from cte where max_amount = 1

-- Task 4
--Select * from sales_data

Select *, min(unit_price) over(partition by product_category) min_price from sales_data

-- Task 5
--Select * from sales_data

Select *, avg(total_amount) over(order by order_date 
rows between 1 preceding and 1 following) avg_sales from sales_data

-- Task 6
--Select * from sales_data

Select *, count(sale_id) over(partition by region) total_sales from sales_data

-- Task 7
--Select * from sales_data

Select *, dense_rank() over(partition by customer_id order by total_amount desc) from sales_data

-- Task 8
--Select * from sales_data

Select *, total_amount - lag(total_amount) over(partition by customer_id order by order_date) from sales_data

-- Task 9
--Select * from sales_data

With cte as(
Select *, row_number() over(partition by product_category order by unit_price desc) top3 from sales_data)
Select * from cte where top3 <=3

-- Task 10
--Select * from sales_data

Select *, sum(quantity_sold) over(partition by region order by order_date) from sales_data

-- Task 11
--Select * from sales_data

Select *, sum(total_amount) over(partition by product_category order by order_date) revenue from sales_data

-- Task 12
CREATE TABLE SampleIDs (
    ID INT
);
Select * from SampleIDs

INSERT INTO SampleIDs (ID) VALUES 
(1),
(2),
(3),
(4),
(5);
Select * from SampleIDs

-- Answer: 
--Select * from SampleIDs

Select *, sum(id) over(order by id) SumPreValues from SampleIDs

-- Task 12
CREATE TABLE OneColumn (
    Value SMALLINT
);
Select * from OneColumn

INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);
Select * from OneColumn

-- Answer: 
--Select * from OneColumn

Select *, sum(value) over(order by value
rows between 1 preceding and current row) SumofPrevious from OneColumn

-- Task 14
CREATE TABLE Row_Nums (
    Id INT,
    Vals VARCHAR(10)
);
Select * from Row_Nums

INSERT INTO Row_Nums VALUES
(101,'a'), (102,'b'), (102,'c'), (103,'f'), (103,'e'), (103,'q'), (104,'r'), (105,'p');

Select * from Row_Nums

-- Answer: 
--Select * from Row_Nums

Select *, row_number() over(partition by id order by vals)* 2 -1 from Row_Nums

-- Task 15
--Select * from sales_data


With cte as (
Select distinct Customer_ID, Product_Category from sales_data), 
Cte2 as(
Select *, count(customer_id) over(partition by customer_id) count from cte)
Select * from cte2 where count > 1

-- Task 16
--Select * from sales_data


With cte as(
Select customer_id, region, sum(total_amount) total_spending from sales_data group by customer_id, region),
cte2 as (
Select *, avg(total_spending) over (partition by region) avg_spending from cte)
Select * from cte2 where total_spending > avg_spending

-- Task 17
--Select * from sales_data


Select *, dense_rank() over(partition by region order by total_amount desc) from sales_data

-- Task 18
--Select * from sales_data

Select *, sum(total_amount) over(partition by customer_id order by order_date) cumulative_sales from sales_data

-- Task 19
Select * from sales_data

-- Task 20
--Select * from sales_data


With cte as(
Select *, sum(total_amount) over(partition by customer_id) total_spending,
row_number() over(partition by customer_id order by order_date desc) last_order
from sales_data)
Select * from cte where last_order = 1 and total_spending > total_amount


-- Task 21
--Select * from sales_data

With cte as(
Select *, avg(unit_price) over() avg_price from sales_data)
Select * from cte Where unit_price > avg_price

-- Task 22
CREATE TABLE MyData (
    Id INT, Grp INT, Val1 INT, Val2 INT
);
Select * from MyData

INSERT INTO MyData VALUES
(1,1,30,29), (2,1,19,0), (3,1,11,45), (4,2,0,0), (5,2,100,17);
Select * from MyData

-- Answer: 
--Select * from MyData

Select *,
Case 
when row_number() over (partition by grp order by Id) = 1
then sum(val1 + val2) over(partition by grp) 
else null
End tot
from MyData

-- Task 23
CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
Select * from TheSumPuzzle
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), (1235,100,130), (1235,100,135), (1236,12,136);
Select * from TheSumPuzzle

-- Answer: 
--Select * from TheSumPuzzle


Select Id, sum(Cost) Cost, sum(distinct Quantity) Quantity from TheSumPuzzle
Group by Id

-- Task 24
CREATE TABLE Seats 
( 
SeatNumber INTEGER 
); 
Select * from Seats
INSERT INTO Seats VALUES 
(7),(13),(14),(15),(27),(28),(29),(30), 
(31),(32),(33),(34),(35),(52),(53),(54); 

Select * from Seats

-- Answer: 
Select * from Seats


