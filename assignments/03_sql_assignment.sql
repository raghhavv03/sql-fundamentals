-- sql assignment
USE uof;

CREATE TABLE employees(
	emp_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    department VARCHAR(30),
    salary INT,
    hire_date DATE
);

INSERT INTO employees
(emp_id, first_name, last_name, department, salary, hire_date)
VALUES
(101, 'Alice', 'Johnson', 'IT', 6500, '2020-03-15'),
(102, 'Mark', 'Rivera', 'HR', 4800, '2019-07-22'),
(103, 'Sophia', 'Lee', 'Finance', 7200, '2021-01-10'),
(104, 'Daniel', 'Kim', 'IT', 5800, '2018-11-05'),
(105, 'Emma', 'Brown', 'Marketing', 5300, '2022-04-18'),
(106, 'Liam', 'Patel', 'Finance', 6900, '2020-09-29'),
(107, 'Olivia', 'Garcia', 'HR', 4600, '2017-06-30'),
(108, 'Noah', 'Thompson', 'IT', 7500, '2023-02-12'),
(109, 'Ava', 'Martinez', 'Marketing', 5100, '2019-12-02'),
(110, 'Ethan', 'Davis', 'Finance', 8000, '2016-05-14');

-- Q1
SELECT * FROM employees;

-- Q2
SELECT first_name, last_name, salary 
FROM employees;

-- Q3
SELECT *
FROM employees
WHERE department = "IT";

-- Q4
SELECT *
FROM employees
WHERE salary > 6000;

-- Q5
SELECT *
FROM employees
ORDER BY hire_date DESC;

-- Q6
SELECT DISTINCT department 
FROM employees;

-- Q7
SELECT emp_id, first_name
FROM employees
WHERE first_name LIKE 'A%';

-- Q8
SELECT *
FROM employees
WHERE salary BETWEEN 4000 AND 7000;

-- Q9
SELECT AVG(salary) AS average_salary
FROM employees;

-- Q10
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;




