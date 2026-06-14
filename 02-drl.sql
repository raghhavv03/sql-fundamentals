-- DRL 

-- create a new database called org
CREATE DATABASE org;

-- show all databases
SHOW DATABASES;

-- switch to org database
USE org;

-- create workers table
CREATE TABLE workers (
    worker_id     INT PRIMARY KEY,
    first_name    VARCHAR(25),
    last_name     VARCHAR(25),
    salary        INT,
    joining_date  DATE,
    department    CHAR(25)
);

-- insert records into workers table
INSERT INTO workers(worker_id, first_name, last_name, salary, joining_date, department)
VALUES 
(001, 'Raghav', 'Gupta', 1000000, '2024-06-15', 'HR'),
(002, 'Aarav',  'Sharma', 850000, '2025-03-01', 'Admin'),
(003, 'Ishita', 'Mehta',  920000, '2024-11-20', 'HR'),
(004, 'Kabir',  'Verma',  760000, '2025-07-10', 'Admin'),
(005, 'Ananya', 'Singh',  880000, '2026-01-05', 'Admin'),
(006, 'Dev',    'Patel',  950000, '2025-09-12', 'Finance'),
(007, 'Sanya',  'Kapoor', 720000, '2024-08-25', 'Finance'),
(008, 'Arjun',  'Nair',   870000, '2025-05-15', 'Admin');

-- view all workers
SELECT * 
FROM workers;

-- create bonuses table with foreign key referencing workers
CREATE TABLE bonuses (
    worker_ref_id INT,
    bonus_amount  INT,
    bonus_date    DATE,
    FOREIGN KEY(worker_ref_id) REFERENCES workers(worker_id) ON DELETE CASCADE
);

-- insert records into bonuses table
INSERT INTO bonuses(worker_ref_id, bonus_amount, bonus_date)
VALUES 
(001, 10000, '2025-06-01'),
(003,  5000, '2025-11-01'),
(007,  3000, '2025-08-01');

-- view bonuses
SELECT * 
FROM bonuses;

-- create titles table with foreign key referencing workers
CREATE TABLE titles (
    worker_ref_id INT,
    worker_title  CHAR(25),
    affected_from DATE,
    FOREIGN KEY(worker_ref_id) REFERENCES workers(worker_id) ON DELETE CASCADE
);

-- insert records into titles table
INSERT INTO titles(worker_ref_id, worker_title, affected_from)
VALUES 
(001, 'Lead',              '2024-06-15'),
(002, 'Assistant Manager', '2025-03-01'),
(003, 'Executive',         '2024-11-20'),
(004, 'Execuitve',         '2025-07-10'),
(005, 'Manager',           '2026-01-05'),
(006, 'Lead',              '2025-09-12'),
(007, 'Assistant Manager', '2024-08-25'),
(008, 'Executive',         '2025-05-15');

-- view titles
SELECT * 
FROM titles;

-- basic arithmetic and functions using SELECT
SELECT 55 + 11;

SELECT NOW();

SELECT LCASE('RAGHAV');

SELECT UCASE('raghav');

-- using WHERE clause
SELECT * FROM workers WHERE salary > 900000;

SELECT * FROM workers WHERE department = 'Admin';

-- using BETWEEN clause
SELECT * 
FROM workers 
WHERE salary BETWEEN 900000 AND 1000000;

-- using IN clause
SELECT * 
FROM workers 
WHERE department IN ('HR', 'Admin');

-- Using subquery with IN clause
SELECT first_name 
FROM workers 
WHERE salary IN (
    SELECT salary 
    FROM workers 
    WHERE salary NOT BETWEEN 900000 AND 1000000
);

-- using NOT clause
SELECT * 
FROM workers 
WHERE department NOT IN ('HR', 'Admin');

-- using IS NULL clause
INSERT INTO workers
VALUES (009, 'Sagar', 'Gupta', NULL, '2025-06-01', 'Finance');

SELECT * 
FROM workers 
WHERE salary IS NULL;

-- IS NOT NULL example
INSERT INTO workers
VALUES (010, 'Hardik', 'Kaushik', 0, '2025-04-01', 'Finance');

SELECT * 
FROM workers 
WHERE salary IS NOT NULL;

-- pattern matching using '%' wildcard for multiple characters
-- first_names starting with 'R'
SELECT first_name 
FROM workers 
WHERE first_name LIKE 'R%';

-- first_names ending with 'r'
SELECT first_name 
FROM workers 
WHERE first_name LIKE '%r';

-- first_names containing 'an'
SELECT first_name 
FROM workers 
WHERE first_name LIKE '%an%';

-- pattern matching using '_' wildcard for a single character
-- first_names where 2nd letter is 'a'
SELECT first_name 
FROM workers 
WHERE first_name LIKE '_a%';

-- first_names with 2nd letter 'a' and exactly 5 characters
SELECT first_name 
FROM workers 
WHERE first_name LIKE '_a___';

-- first_names with 2nd letter 'a' and ending with 'v'
SELECT first_name 
FROM workers 
WHERE first_name LIKE '_a%v';

-- sorting using ORDER BY
-- ascending by salary
SELECT * 
FROM workers 
ORDER BY salary;

-- descending by salary
SELECT * 
FROM workers 
ORDER BY salary DESC;

-- sort workers first by department, then salary desc
SELECT * 
FROM workers 
ORDER BY department ASC, salary DESC;

-- sort workers by the 2nd column in SELECT list
SELECT * 
FROM workers 
ORDER BY 2 DESC;

-- display worker_id, first_name, and annual salary (calculated),
-- then sort by annual salary in descending order
SELECT worker_id, first_name, salary*12 AS annual_salary
FROM workers
ORDER BY annual_salary DESC;

-- using DISTINCT clause
SELECT DISTINCT department 
FROM workers;

SELECT COUNT(DISTINCT department) AS unique_departments 
FROM workers;

-- insert duplicate-like data for DISTINCT examples
INSERT INTO workers(worker_id, first_name, last_name, salary, joining_date, department)
VALUES 
(011, 'Aseem',      'Gupta',    1000000, '2024-06-15', 'HR'),
(012, 'Deeptanshu', 'Bhardwaj',  850000, '2025-03-01', 'Admin'),
(013, 'Azeem',      'Khan',      920000, '2024-11-20', 'HR'),
(014, 'Param',      'Verma',     760000, '2025-07-10', 'Admin');

-- get distinct combinations of department and salary
SELECT DISTINCT department, salary 
FROM workers 
ORDER BY salary DESC;

-- grouping using GROUP BY
-- count workers in each department
SELECT department, COUNT(*) AS num_workers
FROM workers
GROUP BY department;

-- sum of salaries by department
SELECT department, SUM(salary) AS total_salary
FROM workers
GROUP BY department;

-- group by multiple columns
SELECT department, salary, COUNT(*) AS num_workers
FROM workers
GROUP BY department, salary;

-- average salary by department
SELECT department, AVG(salary) AS avg_salary
FROM workers
GROUP BY department;

-- using HAVING clause
-- total salary per department > 3,000,000
SELECT department, SUM(salary) AS total_salary
FROM workers
GROUP BY department
HAVING SUM(salary) > 3000000;

-- count of workers per department >= 5
SELECT department, COUNT(*) AS num_workers
FROM workers
GROUP BY department
HAVING COUNT(*) > 5;

-- count workers with salary >= 900000, then filter groups with >= 2 workers
SELECT department, COUNT(*) AS num_workers
FROM workers
WHERE salary >= 900000
GROUP BY department
HAVING COUNT(*) >= 2;




 











































