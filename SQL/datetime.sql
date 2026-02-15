-- Active: 1770635952694@@127.0.0.1@3306@parks_and_recreation
USE parks_and_recreation;




alter TABLE employee_demographics
DROP COLUMN joining;

ALTER TABLE employee_demographics
ADD COLUMN joiningDate DATE DEFAULT '2012-01-01';

SELECT
    birth_date,
    YEAR(birth_date) AS year,
    MONTH(birth_date) AS month,
    DAY(birth_date) AS day,
    WEEK(birth_date) AS week,
    WEEKDAY(birth_date) as WEEKDAY,
    DAYNAME(birth_date) AS DAYNAME
FROM employee_demographics;


ALTER TABLE employee_demographics
ADD COLUMN birth_time TIME DEFAULT CURRENT_TIME;

ALTER TABLE employee_demographics
ADD COLUMN birth_time TIME DEFAULT CURRENT_TIME;



ALTER TABLE employee_demographics
DROP COLUMN birth_time;


ALTER TABLE employee_demographics
ADD COLUMN birth_time TIME DEFAULT (CURRENT_TIME);


SELECT * FROM employee_demographics;

SELECT
    birth_time,
    HOUR(birth_time) AS hour,
    MINUTE(birth_time) AS MINUTE,
    SECOND(birth_date) As SECOND
FROM employee_demographics

SELECT
    birth_date,joiningDate,
    DATEDIFF(joiningdate,birth_date) as dateDiffernce,
    TIMESTAMPDIFF(MONTH,birth_date,joiningDate) AS   MONTHdiffernce,
    TIMESTAMPDIFF(HOUR,birth_date,`joiningDate`) as hourdiffernce,
    TIMESTAMPDIFF(MINUTE,birth_date,`joiningDate`) as minuteDiffernce

FROM employee_demographics;
