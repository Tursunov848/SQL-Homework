CREATE TABLE Hometask_19_02 (EmployeeID INT PRIMARY KEY, Name VARCHAR(100), Department VARCHAR(50), Position VARCHAR(50), Salary INT, JoiningDate DATE, City VARCHAR(50))

INSERT INTO Hometask_19_02 (EmployeeID, Name, Department, Position, Salary, JoiningDate, City) 
VALUES 
(101, 'Alice Carter', 'HR', 'Manager', 75000, '2020-05-15', 'New York'),
(102, 'Bob Smith', 'IT', 'Developer', 65000, '2018-03-10', 'San Francisco'),
(103, 'Carol Jones', 'Finance', 'Analyst', 58000, '2019-08-20', 'Chicago'),
(104, 'David Brown', 'IT', 'Tester', 50000, '2021-01-05', 'New York'),
(105, 'Eva Green', 'HR', 'Assistant', 45000, '2022-07-18', 'Boston'),
(106, 'Frank White', 'Finance', 'Manager', 80000, '2017-09-12', 'Chicago'),
(107, 'Grace Hall', 'IT', 'Developer', 65000, '2019-04-25', 'Seattle'),
(108, 'Helen King', 'IT', 'Developer', 65000, '2020-03-11', 'San Francisco'),
(109, 'Ian Brown', 'HR', 'Manager', 75000, '2018-06-20', 'New York');

Select * from Hometask_19_02
WHERE Department = 'IT'
Select * from Hometask_19_02

WHERE Department = 'IT' and Salary > 60000;
SELECT * FROM Hometask_19_02
ORDER BY Salary DESC;
SELECT * FROM Hometask_19_02
WHERE Department = 'IT' and Salary > 60000;
ORDER BY Salary;
SELECT * FROM Hometask_19_02
WHERE Department = 'IT' AND Salary > 60000
ORDER BY Salary DESC, JoiningDate ASC;

