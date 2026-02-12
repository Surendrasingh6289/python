USE world;

SELECT * FROM  city;

SELECT * 
FROM city
WHERE
    population >1000000;

--Retrieve all cities from the City table where the population is greater than 1 million.
SELECT *
FROM country
WHERE
    LifeExpectancy>75

--Get all countries from the Country table where the life expectancy is greater than 75 years.

SELECT * 
FROM city
WHERE
    countrycode = 'USA'
--Find all cities in the City table that belong to the country with the code 'USA'.

SELECT *
FROM country
WHERE 
    GovernmentForm = 'republic'
--List all countries where the government form is a republic.

SELECT *
FROM countrylanguage
WHERE
    Percentage>50
--Retrieve all languages from the CountryLanguage table where the language is spoken by more than 50% of the population.

SELECT countrycode,SUM(population) as Total_population
FROM city
GROUP BY CountryCode;
--Find the total population of each country by grouping records by CountryCode in the City table.

SELECT continent, AVG(LifeExpectancy)
FROM country
GROUP BY continent;
--  Get the average life expectancy for each continent by grouping by Continent in the Country table.

SELECT `CountryCode`,COUNT(IsOfficial)
FROM countrylanguage
WHERE isofficial = 'T'
GROUP BY `CountryCode`;

--Find the number of official languages spoken in each country by grouping records
--in the CountryLanguage table.

SELECT `CountryCode`,count(name)
FROM city
GROUP BY `CountryCode`;
--Get the top 5 countries with the highest number of cities by using GROUP BY on
--the City table.

SELECT city.`Name` as city_name,country.`Name` as country_name
FROM city
JOIN country
ON city.`CountryCode`=country.`Code`;
--Retrieve all cities along with their country names by joining the City and Country
--tables.

select `CountryCode`,count(name) as total_city
from city
GROUP BY `CountryCode`
HAVING COUNT(`Name`)>10;
--Count how many cities exist in each country and display only those countries where
--the number of cities is greater than 10.

SELECT country.`Name`,countrylanguage.`Language`
FROM country
JOIN countrylanguage
ON country.`Code`=countrylanguage.`CountryCode`
WHERE `IsOfficial`='T'
--Get the official language spoken in each country by joining CountryLanguage and
--Country tables.

SELECT city.`Name` as city_name,country.`Continent`
FROM city
JOIN country
ON city.`CountryCode`=country.`Code`;
--Find all cities and their corresponding continent by joining the City table with the
--Country table.

SELECT city.`Name`,city.`Population`,country.`GovernmentForm`
FROM city
JOIN country
ON city.`CountryCode`=country.`Code`
--Retrieve all cities, their population, and their respective government type from the
--City and Country tables.

SELECT city.`Name`,countrylanguage.`Language`
FROM city
JOIN countrylanguage
ON city.`CountryCode`=countrylanguage.`CountryCode`
--Get a list of languages spoken in each city by joining City, Country, and
--CountryLanguage tables.

SELECT country.`Name` as country_name,
city.`Name` as city_name
FROM country
LEFT JOIN city
ON country.`Code`=city.`CountryCode`;
--Retrieve all countries and their respective cities, ensuring that even countries without
--cities are included.

SELECT country.`Name`,countrylanguage.`Language`
FROM country
LEFT JOIN countrylanguage
ON country.`Code`=countrylanguage.`CountryCode` ;
--Get a list of all countries along with their official language, ensuring that countries
--without languages are also included.

SELECT country.`Name`,COUNT(countrylanguage.`Language`)
FROM country
LEFT JOIN countrylanguage
ON country.`Code`=countrylanguage.`CountryCode`
GROUP BY country.`Name`
;
--18) Fetch the total number of languages spoken in each country, including countries with
--no known languages.

SELECT city.`Name`,country.`Name`,country.`Continent`
FROM city
LEFT JOIN country
ON city.`CountryCode`=country.`Code`;
--19) Retrieve a list of all cities along with their country name and continent, including
--cities without country details.

SELECT country.`Name`
FROM country
JOIN countrylanguage
ON country.`Code`=countrylanguage.`CountryCode`
AND countrylanguage.`IsOfficial`='T'
WHERE countrylanguage.`IsOfficial` IS NULL;

--20) Find all countries that do not have any official languages listed in the
--CountryLanguage table.