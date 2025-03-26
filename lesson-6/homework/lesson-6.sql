--Create database Puzzle_homework
--Use Puzzle_homework

-- Puzzle 1:

CREATE TABLE InputTbl ( col1 VARCHAR(10), col2 VARCHAR(10) ); 

INSERT INTO InputTbl (col1, col2) 
VALUES ('a', 'b'), ('a', 'b'), ('b', 'a'), ('c', 'd'), ('c', 'd'), ('m', 'n'), ('n', 'm');

Select * from InputTbl

-- Answer 1:
Select distinct LEAST(col1, col2) as col1, GREATEST(col1, col2) as col2
From InputTbl;

--Answer 2:
SELECT DISTINCT col1, col2
FROM InputTbl
WHERE col1 < col2;

-- Puzzle 2

Create table TestMultipleZero 
( A INT NULL, B INT NULL, C INT NULL, D INT NULL );

Insert TestMultipleZero(A,B,C,D) 
VALUES (0,0,0,1), (0,0,1,0), (0,1,0,0), (1,0,0,0), (0,0,0,0), (1,1,1,0);

Select * from TestMultipleZero

-- Answer: 
Select * from TestMultipleZero
Where A + B + C + D > 0;

-- Puzzle 3:

Create table section1(id int, name varchar(20)) 

Insert section1 values 
(1, 'Been'), (2, 'Roma'), (3, 'Steven'), (4, 'Paulo'), (5, 'Genryh'), (6, 'Bruno'), (7, 'Fred'), (8, 'Andro')

Select * from section1

-- Answer:
Select * from section1
Where ID % 2 = 1


-- Puzzle 4:

Select top 1 * from section1 order by ID asc

-- Puzzle 5: Answer
Select top 1 * from section1 order by ID desc

-- Puzzle 6: Answer

Select * from section1
Where Name like 'B%'

-- Puzzle 7: 
Create table ProductCodes ( Code VARCHAR(20) );

Insert ProductCodes (Code) 
VALUES ('X-123'), ('X_456'), ('X#789'), ('X-001'), ('X%202'), ('X_ABC'), ('X#DEF'), ('X-999');

Select * from ProductCodes

-- Answer:

Select * from ProductCodes
Where Code like '%@_%' escape '@'
