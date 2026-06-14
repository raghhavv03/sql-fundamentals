-- practice set 1
-- Q1
CREATE DATABASE uof;

USE uof;

CREATE TABLE teachers(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(20),
    salary INT
);

INSERT INTO teachers
(id, name, subject, salary)
VALUES
(23, "ajay", "math", 50000),
(47, "bharat", "english", 60000),
(18, "chetan", "chemistry", 45000),
(09, "divya", "physics", 75000);

SELECT * FROM teachers;

-- Q2
SELECT id, name FROM teachers
WHERE salary > 55000;
-- Q3
ALTER TABLE teachers 
CHANGE COLUMN salary ctc INT;

-- Q4
UPDATE teachers
SET ctc = ctc * 1.25;

-- Q5
ALTER TABLE teachers
ADD COLUMN city VARCHAR(20) DEFAULT "gurgaon";

-- Q6
ALTER TABLE teachers
DROP COLUMN ctc;

-- practice set 2
-- Q1
CREATE TABLE students(
	roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(20),
    marks INT
);

INSERT INTO students
(roll_no, name, city, marks)
VALUES
(110, "adam", "delhi", 76),
(108, "bob", "mumbai", 65),
(124, "casey", "pune", 94),
(112, "duke", "pune", 80);

SELECT * FROM students;

-- Q2
SELECT roll_no, name FROM students
WHERE marks > 75;

-- Q3
SELECT DISTINCT city 
FROM students;
-- or
SELECT city 
FROM students
GROUP BY city;

-- Q4
SELECT city, max(marks) 
FROM students
GROUP BY city;

-- Q5
SELECT avg(marks) 
FROM students;

-- Q6
ALTER TABLE students
ADD COLUMN grade VARCHAR(2);

UPDATE students
SET grade = "O"
WHERE marks >= 80;

UPDATE students
SET grade = "A"
WHERE marks >= 70 AND marks < 80;

UPDATE students
SET grade = "B"
WHERE marks >= 60 AND marks < 70;

