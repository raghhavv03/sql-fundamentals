-- joins
CREATE DATABASE test;

USE test;

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

INSERT INTO customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(101, 1, 'Laptop'),
(102, 1, 'Phone'),
(103, 2, 'Tablet'),
(104, 3, 'Headphones');

-- INNER JOIN
SELECT c.*, o.*
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.product
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- INNER JOIN without using JOIN
SELECT c.customer_name, o.product
FROM customers c, orders o
WHERE c.customer_id = o.customer_id;

-- LEFT JOIN
SELECT c.*, o.*
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.product
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- RIGHT JOIN
SELECT c.*, o.*
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.product
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- FULL JOIN
SELECT c.*, o.*
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT c.*, o.*
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.product
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.product
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- CROSS JOIN
SELECT c.*, o.*
FROM customers c
CROSS JOIN orders o;

SELECT c.customer_name, o.product
FROM customers c
CROSS JOIN orders o;

-- SELF JOIN
ALTER TABLE customers ADD referred_by INT;
UPDATE customers SET referred_by = 1 WHERE customer_id = 2; -- Bob referred by Alice
UPDATE customers SET referred_by = 2 WHERE customer_id = 3; -- Charlie referred by Bob

-- simulate using INNER JOIN
SELECT c.customer_name AS Customer, r.customer_name AS Referred_By
FROM customers c
INNER JOIN customers r
ON c.referred_by = r.customer_id;

-- simulate using LEFT JOIN
SELECT c.customer_name AS Customer, r.customer_name AS Referred_By
FROM customers c
LEFT JOIN customers r
ON c.referred_by = r.customer_id;

-- some more queries
CREATE TABLE employees(
	id INT PRIMARY KEY,
    name VARCHAR(25),
    email_id VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(25)
);

INSERT INTO employees (id, name, email_id, phone, city) VALUES
(1, 'Alice', 'alice@company.com', '9876543210', 'New York'),
(2, 'Bob', 'bob@company.com', '8765432109', 'Los Angeles'),
(3, 'Charlie', 'charlie@company.com', '7654321098', 'Chicago'),
(4, 'David', 'david@company.com', '6543210987', 'Houston'),
(5, 'Eva', 'eva@company.com', '5432109876', 'Miami'),
(6, 'Frank', 'frank@company.com', '4321098765', 'Seattle'),
(7, 'Grace', 'grace@company.com', '3210987654', 'Boston');

CREATE TABLE clients(
	id INT PRIMARY KEY,
    name VARCHAR(25),
    email_id VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(25),
    emp_id INT,
    FOREIGN KEY(emp_id)
    REFERENCES employees(id)
);

INSERT INTO clients (id, name, email_id, phone, city, emp_id) VALUES
(101, 'Delta Corp', 'contact@delta.com', '1111111111', 'New York', 1),
(102, 'Omega Ltd', 'support@omega.com', '2222222222', 'Los Angeles', 2),
(103, 'Zenith Inc', 'info@zenith.com', '3333333333', 'Chicago', 3),
(104, 'Alpha Solutions', 'hello@alpha.com', '4444444444', 'Houston', 4),
(105, 'Beta Systems', 'contact@beta.com', '5555555555', 'Miami', 5),
(106, 'Gamma Tech', 'team@gamma.com', '6666666666', 'Seattle', 6),
(107, 'Sigma Enterprises', 'info@sigma.com', '7777777777', 'Boston', 7),
(108, 'Nova Partners', 'nova@partners.com', '8888888888', 'Chicago', 1);

CREATE TABLE projects(
	id INT PRIMARY KEY,
    project_name VARCHAR(25),
    emp_id INT,
    start_date DATE,
    client_id INT,
    FOREIGN KEY(emp_id) REFERENCES employees(id),
    FOREIGN KEY(client_id) REFERENCES clients(id)
);

INSERT INTO projects (id, project_name, emp_id, start_date, client_id) VALUES
(1001, 'Website Revamp', 1, '2025-01-10', 101),
(1002, 'Mobile App Development', 2, '2025-02-15', 102),
(1003, 'Cloud Migration', 3, '2025-03-01', 103),
(1004, 'Data Analytics Dashboard', 1, '2025-04-05', 103),
(1005, 'CRM Implementation', 4, '2025-04-20', 104),
(1006, 'ERP Upgrade', 5, '2025-05-12', 105),
(1007, 'AI Chatbot', 6, '2025-05-25', 106),
(1008, 'E-commerce Platform', 7, '2025-06-02', 107),
(1009, 'Cybersecurity Audit', 2, '2025-06-10', 108),
(1010, 'IoT Integration', 3, '2025-06-18', 104);

-- INNER JOIN 
-- show all employees’ IDs and names, along with the projects they are working on
SELECT e.id, e.name, p.id, p.project_name
FROM employees e
INNER JOIN projects p
ON e.id = p.emp_id;

-- fetch all the employees’ IDs and contact details (name, email, phone) who work from 'New York' and handle clients located in 'Chicago'
SELECT e.id, e.name, e.email_id, e.phone, e.city, c.name, c.city
FROM employees e
INNER JOIN clients c
ON e.id = c.emp_id
WHERE e.city = 'New York' AND c.city = 'Chicago';

-- LEFT JOIN
-- fetch all projects allocated to each employee
SELECT e.id, e.name, p.id, p.project_name
FROM employees e
LEFT JOIN projects p
ON e.id = p.emp_id;

-- RIGHT JOIN
-- list all projects along with the employees' name and their respective emails
SELECT  p.id, p.project_name, e.name, e.email_id
FROM employees e
RIGHT JOIN projects p
ON e.id = p.emp_id;





























