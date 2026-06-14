-- referential constraints
USE temp;

CREATE TABLE departments(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- INSERT constraint
INSERT INTO departments
VALUES (10, 'HR');

-- works because dept_id=10 exists
INSERT INTO employees
VALUES (1, 'Alice', 10);

-- inavlid insert
-- INSERT INTO employees VALUES (2, 'Bob', 99);

-- DELETE constraint
-- invalid delete
-- DELETE FROM departments WHERE dept_id = 10;

-- ON DELETE CASCADE
/*
CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
	ON DELETE CASCADE
);

-- employees with dept_id=10 are also deleted
DELETE FROM departments
WHERE dept_id = 10;
*/

-- ON DELETE SET NULL
/*
CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
	ON DELETE SET NULL
);

-- employees with dept_id=10 will have dept_id set to NULL
DELETE FROM departments
WHERE dept_id = 10;
*/









