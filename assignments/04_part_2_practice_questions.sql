-- practice questions
USE uof;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers (customer_id, customer_name)
VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Emma');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_name VARCHAR(50)
);

INSERT INTO orders (order_id, customer_id, order_name)
VALUES
(101, 1, 'Laptop'),
(102, 2, 'Phone'),
(103, 2, 'Headphones'),
(104, 6, 'Monitor'),
(105, 7, 'Keyboard');

-- Q1
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- Q2
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;