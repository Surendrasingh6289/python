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
SELECT * from city;