CREATE DATABASE joins;
use joins;
CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30) NOT NULL,
    technology VARCHAR(20) NOT NULL,
    salary FLOAT NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(1)
)

SELECT * FROM employee;

SELECT employee.emp_name,employee.technology,address.`State`,address.city
FROM employee
JOIN address
ON employee.emp_id = address.emp_id;

SELECT employee.emp_name,employee.technology,projects.project_name
FROM employee
INNER JOIN projects
ON employee.emp_id = projects.emp_id;

SELECT employee.emp_name,employee.technology,projects.project_name
FROM employee
LEFT JOIN projects
ON employee.emp_id = projects.emp_id;

SELECT employee.emp_name,employee.technology,projects.project_name
FROM employee
RIGHT JOIN projects
ON employee.emp_id = projects.emp_id;

SELECT employee.emp_name,employee.technology,address.`State`,address.city
FROM employee
JOIN address
ON employee.emp_id = address.emp_id;

SELECT e.emp_name,e.technology,a.`State`,a.city
FROM employee AS e
INNER JOIN address AS a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           JOIN address AS a
ON e.emp_id = a.emp_id;


SELECT a.city,a.`State`,e.emp_name,e.technology
FROM address AS a 
RIGHT JOIN employee as e
ON a.emp_id = e.emp_id;


SELECT a.city,a.`State`,p.project_name,p.start_date
FROM address AS a 
RIGHT JOIN projects AS p
ON p.emp_id = a.emp_id;

SELECT salary as second_max_salary 
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

SELECT emp_id  From employee
UNION ALl
SELECT city FROM address;

SELECT emp_name, technology FROM employee
UNION ALL
SELECT `State`,city FROM address;


SELECT e.emp_name,e.technology,a.`State`,a.city
FROM employee AS e
INNER JOIN address AS a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           JOIN address AS a
ON e.emp_id = a.emp_id
union ALL
SELECT a.city,a.`State`,e.emp_name,e.technology
FROM address AS a 
RIGHT JOIN employee as e
ON a.emp_id = e.emp_id;


SELECT e.emp_name,e.salary,a.city,a.`State`,p.project_name,p.start_date
FROM employee as e
JOIN address AS a
ON a.emp_id = e.emp_id
JOIN projects as p
ON p.emp_id=e.emp_id;

CREATE TABLE concat_data(
    SELECT 
    e.emp_name,
    e.salary,
    a.city,
    a.`State`,
    p.project_name,
    p.start_date
    FROM employee as e
    JOIN address AS a
    ON a.emp_id = e.emp_id
    JOIN projects as p
    ON p.emp_id=e.emp_id);


SELECT 
    e.emp_name,
    e.salary,
    e.technology,
    a.city,
    a.`State`,
    p.project_name,
    p.start_date
FROM employee as e
JOIN address AS a
    ON a.emp_id = e.emp_id
JOIN projects as p
    ON p.emp_id=e.emp_id
WHERE salary>=40000
ORDER BY salary ASC
LIMIT 1 OFFSET 1;