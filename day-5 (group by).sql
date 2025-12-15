use world;

-- * counts no. of values include null/0 where as column name only count rows with values 
select count(*) , count(indepyear) from country;

-- SUM
select (populatiobn) , sum (population) , avg(population) from country;

select count(distinct governmentform) from country where continent ='asia';

select count(name), sum (population), count(distinct indepyear) 
from country where continent ='africa';

-- Q => get the total countries avg surface area and the total population for the 
-- countries which got there independence from year 1947-1998 these should not be included
select count(name), avg(SurfaceArea), sum(population) from country  
where indepyear > 1947 and indepyear < 1998; 

-- Q => get the total no. of countries and the no. of uniqye continents along with the avg population
-- and the total no. of capitals for the countries staring with a or d 
select count(name) , count(distinct continent),avg(population), sum(capital) from country
where name like 'A%' or name like 'D%'; 

-- GRUUP bY
select continent ,count(*) from country group by continent;

select indepyear ,count(*) from country group by indepyear;

select governmentform , count(*) from country group by governmentform;
 
select continent, count(name) ,sum(population),avg(population),
max(population), min(population), max(indepyear) from country group by continent;

-- from the city table you have to find the total cities , 
-- toatl district ,unique district ,the total population 
select * from city;
select countrycode, count(*),count(district),count(distinct district), sum(population) from city
group by countrycode;