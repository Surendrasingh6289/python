CREATE DATABASE nirmal;
use nirmal;

CREATE table study_time(sname VARCHAR(20),
    study_hours int,
    sleep_hours INT,
    student_performance INT);

INSERT INTO study_time
VALUES  (11,'surendra',8,9,60),
        (12,'anuj',9,6,80),
        (13,'anshul',6,6,50);

SELECT * FROM study_time;

ALTER table study_time 
ADD id INT  PRIMARY KEY AUTO_INCREMENT FIRST;

ALTER TABLE study_time 
ADD PRIMARY KEY(id);

ALTER TABLE study_time
DROP id;

ALTER TABLE study_time
ADD COLUMN last_name VARCHAR(20);

UPDATE study_time
SET last_name = 'koranga';

UPDATE study_time
SET sleep_hours  = 10
WHERE sname = 'surendra';


update study_time
SET study_hours = 10
WHERE last_name = 'koranga'

update study_time
SET sleep_hours = 8
WHERE sname = 'anuj';


USE world;
SELECT * from city
WHERE CountryCode = 'IND';

SELECT SUM(population) as Total_population
from city
where CountryCode = 'IND';

SELECT 
    AVG(population) as Avg_population
FROM
    city
WHERE
    CountryCode = 'IND';

SELECT
    COUNT('name') AS Count_City
FROM
    city
WHERE
    CountryCode = 'IND';

SELECT 
    MIN(population) as Min_population
FROM
    city
WHERE
    CountryCode = 'IND';

SELECT 
    MAX(population) as Max_population
FROM
    city
WHERE
    CountryCode = 'IND';

SELECT * FROM city
WHERE population > 5000000;

SELECT * FROM city
WHERE population = 5000000;

SELECT * FROM city
WHERE population != 5000000;

SELECT * FROM city
WHERE population < 5000000;

SELECT * from countrylanguage;

SELECT * FROM city
WHERE CountryCode = 'IND' and District = "Maharashtra"

SELECT COUNT(ID) AS Total_city
FROM city
WHERE CountryCode = 'IND' and District = "Maharashtra"

SELECT Name, Population
FROM city
WHERE 
    CountryCode ='IND'
        AND District = 'Madhya Pradesh'
        AND Population > 100000;

SELECT *FROM city
WHERE 
        CountryCode ='IND'
        OR District = 'Madhya Pradesh'
        OR population >1000000;

SELECT *  FROM city
WHERE CountryCode = 'IND'
    OR (DIstrict = 'Madhya Pradesh' 
    AND Population >1000000);

SELECT * from city
WHERE  NOT(countrycode ='Pak' 
    OR CountryCode = "AFG" 
    OR countrycode = 'ARG');

SELECT * FROM city
WHERE countrycode in ('IND','NLD','ARG');

SELECT * FROM city
WHERE countrycode not in ('IND','NLD','ARG');

SELECT * FROM city
WHERE population between 500000 AND 1000000;

SELECT name,countrycode,population FROM city
WHERE population between 500000 AND 1000000;


SELECT * from city
WHERE countrycode LIKE 'A%';

SELECT * from city
WHERE countrycode LIKE '%A';
-- match with end
SELECT * from city
WHERE countrycode LIKE '%AU%';

SELECT * from city
WHERE countrycode LIKE '%IN%';

SELECT * from city
WHERE countrycode LIKE 'I_D';

SELECT * from city
WHERE countrycode LIKE 'A__';

SELECT * from city
WHERE name LIKE 'B_o___%';

SELECT * from city
WHERE countrycode LIKE 'B_o_';

use world;

SELECT * FROM city
WHERE countrycode = 'IND' or district = 'Madhya Pradesh'
ORDER BY population DESC;

SELECT * FROM city
WHERE countrycode = 'IND' or district = 'Madhya Pradesh'
ORDER BY population ASC;

SELECT * FROM city
WHERE countrycode = 'IND' or district = 'Madhya Pradesh'
ORDER BY name ASC;

SELECT CountryCode, min(population) as min_population
FROM city
GROUP BY CountryCode
ORDER BY CountryCode ASC;

SELECT CountryCode, MAX(population) as max_population
FROM city
GROUP BY CountryCode
ORDER BY max_population ASC;

SELECT continent,sum(population) AS total_population
FROM country
GROUP BY continent;

SELECT continent,count(CODE)as total_country
FROM country
GROUP BY continent
ORDER BY total_country DESC;

USE world;

SELECT continent,count(CODE)as total_country
FROM country
GROUP BY continent
ORDER BY total_country DESC
LIMIT 4;

SELECT continent,count(CODE)as total_country
FROM country
GROUP BY continent
ORDER BY total_country DESC
LIMIT 4 OFFSET 1;


SELECT continent,count(CODE)as total_country
FROM country
GROUP BY continent
ORDER BY total_country DESC
LIMIT 1 OFFSET 1;


SELECT countrycode,avg(population)as avg_population
FROM city
GROUP BY countrycode
ORDER BY avg_population DESC;

SELECT countrycode,avg(population)as avg_population
FROM city
GROUP BY countrycode
ORDER BY avg_population DESC;

SELECT AVG(population) FROM city;

SELECT countrycode,max(population) as MAX_pop
FROM city
GROUP BY countrycode
HAVING max_pop > avg(population)
ORDER BY max_pop DESC
LIMIT 5 ;