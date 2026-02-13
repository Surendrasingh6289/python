use world;

SELECT *,
CASE
    WHEN `Population` > 10000000 THEN "Metro City"
    WHEN `Population` > 1000000 THEN "Large City"
    WHEN `Population` > 100000  THEN "Medium CIty"
    WHEN `Population` > 1000  THEN "Small City"
    ELSE "ganv me rahta hai tu"
END AS city_category6
FROM city;


SELECT 
    * 
FROM
    city
WHERE
    `Population` > (SELECT
    AVG(`Population`) as Average_population
    FROM
        city);

SELECT * FROM city
WHERE `Population` > (SELECT AVG(`Population`) AS average_population
                      FROM city) ;

SELECT * FROM country
WHERE `LifeExpectancy`> (SELECT `LifeExpectancy`
FROM country
WHERE `Name`='India'
);

SELECT city.`Name`,country.`LifeExpectancy`
FROM city
JOIN country
ON city.`CountryCode`=country.`Code`
WHERE `LifeExpectancy`> (SELECT `LifeExpectancy`
FROM country
WHERE `Name`='India'
);
--5. List countries whose life expectancy is greater than the life expectancy of India.

SELECT * FROM country
WHERE `Population`>
 (SELECT AVG(`Population`) AS average_population
                      FROM country
);  --Find the name of the country whose population is greater than the average population of all countries.

SELECT name,population
FROM city
WHERE `Population`> (SELECT AVG(`Population`) FROM city);
--List all cities that have a population greater than the average population of cities.

SELECT `Name`,`SurfaceArea`
FROM country
WHERE `SurfaceArea`= (SELECT MAX(`SurfaceArea`) from country);
--Find the country with the maximum surface area.


SELECT `Name`,`Population`
FROM city
WHERE `Population` = (
SELECT MAX(`Population`)
FROM city
WHERE `Population` <(SELECT MAX(`Population`) from city));
--Find the city with the second highest population.

SELECT `Name`,`Population`
FROM country
WHERE `Population`< (SELECT `Population` FROM country WHERE `Name`="Australia");
--Find countries where the population is less than the population of Australia.

SELECT `Name`,`Population`
FROM country
WHERE `Population` > 
(SELECT AVG(`Population`) FROM country
WHERE `Continent` = 'Asia');
--Display countries that have a population greater than the average population of countries in Asia.

SELECT *
FROM city
WHERE `CountryCode` = (SELECT `Code`
FROM country
where `Population`=(SELECT MAX(`Population`) FROM country)
);
--List all cities that belong to the country having the highest population.

SELECT `Name`,`GNP`
FROM country
WHERE `GNP`> (SELECT AVG(`GNP`) FROM country
WHERE `Continent` = 'Europe');
--Find countries where the GNP is greater than the average GNP of Europe.

SELECT `Name`
FROM country
WHERE `Code` IN (SELECT `CountryCode`
FROM countrylanguage
WHERE `Language` IN (SELECT `Language` FROM countrylanguage
WHERE `CountryCode` = 'IND'));
--List all countries that speak the same language as India.


SELECT name,Population FROM city
WHERE ID IN (SELECT Capital FROM country)
and Population > 1000000 ;
--Find countries whose capital city population is greater than 1 million.

select name,population from country
where Population > (select max(Population) from country
where Continent = 'Africa');
--Display countries that have more population than any country in Africa.

-- List cities that are located in countries with life expectancy below global average life expectancy.
select name from city
where CountryCode in (select code from country
where LifeExpectancy < (select avg(LifeExpectancy) from country));


SELECT *
FROM countrylanguage
WHERE language ='English' and isOfficial ='T'

SELECT name
FROM country
where code in (SELECT countrycode
FROM countrylanguage
WHERE language ='English' and isOfficial ='T')
--List countries where the official language is English and population is greater than the `Code`average population of English-speaking countries.

SELECT `CountryCode`, count(name)
FROM city
GROUP BY countrycode;
 