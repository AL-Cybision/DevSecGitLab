-- Create a new table called 'tblEmployee' in schema 'SchemaName'
-- Drop the table if it already exists

-- Create the table in the specified schema
CREATE TABLE tblEmployee
(
    id INTEGER NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    salary INTEGER NOT NULL,
    departID INTEGER NULL
);
GO
-- DROP TABLE tblDepartment
CREATE TABLE tblDepartment
(
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);

INSERT into tblEmployee
VALUES(1, 'Sami', 'Ullah', 37000, 3);
INSERT into tblEmployee
VALUES(2, 'Hamid', 'Khan', 38000, 2);
INSERT into tblEmployee
VALUES(3, 'Aftab', 'Khan', 39000, 3);
INSERT into tblEmployee
VALUES(4, 'Abhishek', 'Raj', 35000, 3);
INSERT into tblEmployee
VALUES(5, 'Daniya', 'Zafar', 25000, NULL);
INSERT into tblEmployee
VALUES(6, 'Umar', 'Jamshed', 15000, NULL);
INSERT into tblEmployee
VALUES(7, 'Imran', 'Khan', 5000, NULL);
INSERT into tblEmployee
VALUES(8, 'Nawaz', 'Sharif', 15000, 6);
INSERT into tblEmployee
VALUES(9, 'Osman', 'binErtugrul', 25000, NULL);
INSERT into tblEmployee
VALUES(10, 'Ertugrul', 'binSalman', 6000, NULL);

INSERT into tblDepartment
VALUES(1, 'Structured Query Language', 'Lahore');
INSERT into tblDepartment
VALUES(2, 'Finance and Management', 'Peshawar');
INSERT into tblDepartment
VALUES(3, 'Marketing', 'Karachi');
INSERT into tblDepartment
VALUES(4, 'Marketing', 'Karachi');
INSERT into tblDepartment
VALUES(5, 'Marketing', 'Karachi');
INSERT into tblDepartment
VALUES(6, 'Marketing', 'Karachi');
INSERT into tblDepartment
VALUES(7, 'Marketing', 'Karachi');
INSERT into tblDepartment
VALUES(8, 'Marketing', 'Karachi');
INSERT into tblDepartment
VALUES(9, 'Marketing', 'Karachi');
INSERT into tblDepartment
VALUES(10, 'Marketing', 'Karachi');

-- DELETE FROM tblEmployee WHERE lastName='Sharif' AND departID=NULL

-- Exercise 1 Inner Join a.k.a Join
SELECT
    tblEmployee.id,
    tblEmployee.firstName,
    tblEmployee.lastName,
    tblEmployee.salary,
    tblDepartment.name,
    tblDepartment.location
FROM tblEmployee
    JOIN tblDepartment
    ON tblEmployee.departID = tblDepartment.id;

-- Exercise 2 Left Join
SELECT
    tblEmployee.id,
    tblEmployee.firstName,
    tblEmployee.lastName,
    tblEmployee.salary,
    tblDepartment.name,
    tblDepartment.location
FROM tblEmployee
    LEFT JOIN tblDepartment
    ON tblEmployee.departID = tblDepartment.id;

-- Exercise 3 Right Join
SELECT
    tblEmployee.id,
    tblEmployee.firstName,
    tblEmployee.lastName,
    tblEmployee.salary,
    tblDepartment.name,
    tblDepartment.location
FROM tblEmployee
    RIGHT JOIN tblDepartment
    ON tblEmployee.departID = tblDepartment.id;

--Exercise 4 Full Outer Join
SELECT
    tblEmployee.id,
    tblEmployee.firstName,
    tblEmployee.lastName,
    tblEmployee.salary,
    tblDepartment.name,
    tblDepartment.location
FROM tblEmployee
    FULL JOIN tblDepartment
    ON tblEmployee.departID = tblDepartment.id;

-- Exercise 5 Cross Join
SELECT *
from tblEmployee
CROSS JOIN tblDepartment;

-- Exercise Sub Query
Select *
from tblEmployee
where salary > (SELECT salary
from tblEmployee
where lastName='Raj')

-- Execise SubQuery

select *
from tblEmployee
where salary > (select salary
    from tblEmployee
    where lastName='Raj') AND departID = (select departID
    from tblEmployee
    where lastName='Raj' )

-- Task 1
SELECT
    tblEmployee.id,
    tblEmployee.firstName,
    tblEmployee.lastName,
    tblEmployee.salary,
    tblDepartment.name,
    tblDepartment.location
FROM tblEmployee
    Left JOIN tblDepartment
    ON tblEmployee.departID = tblDepartment.id
where salary >= 35000;

-- Task 3
SELECT *
from tblEmployee
WHERE salary = (SELECT MIN(salary)
from tblEmployee);

-- Task 4
SELECT
    tblEmployee.id,
    avg(tblEmployee.salary)
FROM tblEmployee
    JOIN tblDepartment
    ON tblEmployee.departID = tblDepartment.id
HAVING avg(salary) <
  (SELECT avg(salary)
FROM tblEmployee);

