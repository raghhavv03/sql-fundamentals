-- set operations
USE test;

-- SET operations
-- UNION
SELECT city FROM employees
UNION 
SELECT city FROM clients;

-- UNION ALL 
-- includes duplicates
SELECT city FROM employees
UNION ALL
SELECT city FROM clients;

-- INTERSECT
-- using INNER JOIN
SELECT DISTINCT e.city
FROM employees e
INNER JOIN clients c
ON e.city = c.city;

-- using IN
SELECT city 
FROM employees
WHERE city IN (SELECT city FROM clients);

-- MINUS
-- using LEFT JOIN ... IS NULL
SELECT DISTINCT e.city
FROM employees e
LEFT JOIN clients c
ON e.city = c.city
WHERE c.city IS NULL;

-- using NOT IN 
SELECT city 
FROM employees
WHERE city NOT IN (SELECT city FROM clients);

CREATE TABLE department_1(
	emp_id INT PRIMARY KEY,
    name VARCHAR(25),
    role VARCHAR(25)
);

INSERT INTO department_1 VALUES
(1, 'Alice', 'Engineer'),
(2, 'Bob', 'Manager'),
(3, 'Charlie', 'Analyst'),
(4, 'David', 'Engineer');


CREATE TABLE department_2(
	emp_id INT PRIMARY KEY,
    name VARCHAR(25),
    role VARCHAR(25)
);

INSERT INTO department_2 VALUES
(3, 'Charlie', 'Analyst'),   
(4, 'David', 'Engineer'),   
(5, 'Eve', 'Manager'),
(6, 'Frank', 'Engineer');

-- list all the employees in the company
SELECT * FROM department_1
UNION 
SELECT * FROM department_2;

-- list all the employees in the company who are engineers
SELECT * FROM department_1 WHERE role = 'engineer'
UNION 
SELECT * FROM department_2 WHERE role = 'engineer';

-- list all the employees who work in both the departments
SELECT DISTINCT d1.*
FROM department_1 d1
INNER JOIN department_2 d2
ON d1.emp_id = d2.emp_id;

-- list all the employees working in department_1 but not in department_2
SELECT d1.*
FROM department_1 d1
LEFT JOIN department_2 d2
ON d1.emp_id = d2.emp_id
WHERE d2.emp_id IS NULL;




