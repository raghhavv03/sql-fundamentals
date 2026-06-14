USE company;

-- create a view to show only employee names and cities
CREATE VIEW employee_cities AS
SELECT name,city
FROM employees;

SELECT * FROM employee_cities;

-- altering the view to also include employee email
CREATE OR REPLACE VIEW employee_cities AS
SELECT name,city,salary
FROM employees;

SELECT * FROM employee_cities;

-- dropping a view
DROP VIEW employee_cities;




