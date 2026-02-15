create table dummy_country
(select name,continent,region,population from country);

select name,region,sum(population)
over(partition by continent)
from dummy_country;

select name,region,sum(population)
over(partition by region)
from dummy_country;

select name,region,avg(population)
over(partition by continent)
from dummy_country;

select * ,
row_number() over (order by population )  as "RowNumber" 
from dummy_country;

select * ,
row_number() over (order by population desc)  as "RowNumber" 
from dummy_country;

select * ,
rank() over (order by population desc)  as "RowNumber" 
from dummy_country;

select * ,
dense_rank() over (order by population desc)  as "RowNumber" 
from dummy_country;

select * ,
row_number() over (order by population asc)  as "RowNumber",
rank() over (order by population asc)  as "rank" ,
dense_rank() over (order by population asc)  as "drank" ,
percent_rank() over (order by population asc)  as "prank"
from dummy_country;


select * from sakila.actor;
alter table actor
add column wordlength int;


update sakila.actor
set wordlength = s
select * from actor;