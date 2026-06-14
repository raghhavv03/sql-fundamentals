-- subqueries
CREATE DATABASE company;

use company;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'Alice', 'New York', 60000),
(2, 'Bob', 'Chicago', 75000),
(3, 'Charlie', 'New York', 50000),
(4, 'David', 'Boston', 90000),
(5, 'Eva', 'Chicago', 55000);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT,
    start_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO projects VALUES
(101, 'Project A', 1, '2023-01-01'),
(102, 'Project B', 2, '2023-03-15'),
(103, 'Project C', 2, '2023-06-01'),
(104, 'Project D', 3, '2023-07-20'),
(105, 'Project E', NULL, NULL);

-- single row subqueries
-- find employees earning more than the average salary
SELECT name,salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- find the highest-paid employee
SELECT name,salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- find employees whose salary is above the average salary of all employees in 'New York'
SELECT name,city,salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE city = 'New York'
);

-- multi row subqueries
-- find employees working on a project
SELECT name
FROM employees
WHERE emp_id IN (SELECT emp_id FROM projects WHERE emp_id IS NOT NULL);

-- find employees who live in the same city as 'Bob'
SELECT name,city
FROM employees
WHERE city IN(
    SELECT city
    FROM employees
    WHERE name = 'Bob'
);

-- find employees who earn more than ALL employees in 'New York'
SELECT name,salary
FROM employees
WHERE salary > ALL(
    SELECT salary
    FROM employees
    WHERE city = 'New York'
);

-- correlated subqueries
-- find employees who earn more than the average salary in their city
SELECT name,city,salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE city = e.city
);

-- find employees whose salary is the highest in their city
SELECT name,city,salary
FROM employees e
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE city = e.city
);

-- find the employees who have the 3rd highest salary in the company
SELECT name,salary
FROM employees e1
WHERE 3 = (
	SELECT COUNT(e2.salary)
    FROM employees e2
    WHERE e2.salary >= e1.salary
);

-- subqueries in FROM
-- list each city and number of employees
SELECT city,total_employees
FROM(
    SELECT city,COUNT(*) AS total_employees
    FROM employees
    GROUP BY city
) AS city_summary;

-- find cities with more than 1 employee
SELECT city,total_employees
FROM(
    SELECT city,COUNT(*) AS total_employees
    FROM employees
    GROUP BY city
) AS city_summary
WHERE total_employees > 1;


-- find the highest salary among the employees whose names contain letter 'a'
SELECT MAX(salary)
FROM(
	SELECT * 
    FROM employees 
    WHERE name LIKE '%a%'
) AS temp;

-- subqueries in SELECT
-- show each employee and total number of projects in the company
SELECT name,
       (SELECT COUNT(*) FROM projects) AS total_projects
FROM employees;

-- show each employee and the number of projects they are handling
SELECT name,
       (SELECT COUNT(*)
        FROM projects p
        WHERE p.emp_id = e.emp_id) AS project_count
FROM employees e;

-- show employees and difference between their salary and company’s average salary
SELECT name,salary,
       salary - (SELECT AVG(salary) FROM employees) AS diff_from_avg
FROM employees;

















