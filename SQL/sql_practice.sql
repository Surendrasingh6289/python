-- Active: 1770635952694@@127.0.0.1@3306@parks_and_recreation
SELECT 
    gender,
    AVG(salary)
FROM employee_demographics dem
JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
GROUP BY gender;

SELECT 
    dem.first_name,
    dem.last_name,
    gender,
    AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id;

SELECT 
    dem.first_name,
    dem.last_name,
    gender,
    salary,
    SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) as rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id;

SELECT 
    dem.employee_id,
    dem.first_name,
    dem.last_name,
    gender,
    salary,
    ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC)row_num,
    RANK() OVER(PARTITION BY gender ORDER BY salary DESC) rank_num,
    DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) dense_rank_num

FROM employee_demographics dem
JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id;



WITH cte_employee as
(SELECT
    first_name,
    last_name,
    gender,
    salary,
    COUNT(gender) OVER(PARTITION BY gender) as totalgender,
    AVG(salary) OVER(PARTITION BY gender) as avgsalary
FROM employee_demographics emp
JOIN employee_salary sal
    ON emp.employee_id = sal.employee_id
WHERE salary >'45000'
)
SELECT first_name,avgsalary
from cte_employee;