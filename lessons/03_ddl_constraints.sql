-- DDL constraints
USE temp;

-- PRIMARY KEY constraint
CREATE TABLE customers(
    id INT PRIMARY KEY,
    c_name VARCHAR(225),
    address VARCHAR(225),
    gender char(2),
    city VARCHAR(225),
    pincode INT
    -- or
    -- PRIMARY KEY(id)
);  

-- FOREIGN KEY constraint
CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) REFERENCES customers(id)
);

-- UNIQUE constraint -- ensures no duplicate values can exist

-- CHECK constraint
CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT CHECK(AGE >= 18),
    salary DECIMAL(10,2)
    -- multiple column check
    -- CHECK(age >= 18 AND salary > 0)
    -- or named check constraint
    -- CONSTRAINT chk_employee CHECK(age >= 18 AND salary > 0)
);

-- DEFAULT constraint
/*
CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT DEFAULT 25
);
*/

-- ALTER opertaions in DDL
-- add a new column
ALTER TABLE employees
ADD department VARCHAR(50);

-- adding multiple coulmns
/*
ALTER TABLE employees
ADD(
    salary DECIMAL(10,2),
    join_date date
);
*/

-- modify column
ALTER TABLE employees
MODIFY age SMALLINT;

-- drop a column
ALTER TABLE employees
DROP COLUMN salary;
-- or 
-- DROP salary;

-- rename a column
ALTER TABLE employees
RENAME COLUMN department TO dept;
-- or 
-- CHANGE COLUMN department dept VARCHAR(50);

-- rename table
ALTER TABLE employees
RENAME TO emp;

-- show the structure (schema) of a table
DESC emp;










