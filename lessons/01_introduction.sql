-- introduction
CREATE DATABASE temp;

USE temp;

CREATE TABLE student(
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO student
VALUES (1, 'Raghav');

SELECT * 
FROM student;

