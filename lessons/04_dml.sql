-- DML
USE org;

CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2)
);

-- INSERT
-- insert one row
INSERT INTO employees(emp_id, name, age, salary)
VALUES (1, 'Raghav', 25, 50000.00);

-- insert multiple rows
INSERT INTO employees(emp_id, name, age, salary)
VALUES 
(2, 'Neha', 30, 60000.00),
(3, 'Aman', 28, 55000.00);

-- SELECT
-- get all rows
SELECT * FROM employees;

-- get specific columns
SELECT name, salary FROM employees;

-- add conditions
SELECT * FROM employees
WHERE age > 27;

-- UPDATE
-- update salary of one employee
UPDATE employees
SET salary = 65000
WHERE emp_id = 2;

-- update multiple columns
UPDATE employees
SET age = 29, salary = 57000
WHERE emp_id = 3;

-- DELETE
-- delete one row
DELETE FROM employees
WHERE emp_id = 1;

-- delete all rows (but keep table structure)
-- disable safe updates so we can delete all rows without a WHERE clause
SET SQL_SAFE_UPDATES = 0;
DELETE FROM employees;

-- REPLACE
-- replace with same emp_id=1
REPLACE INTO employees(emp_id, name, age)
VALUES (1, 'Raghav Gupta', 26);











