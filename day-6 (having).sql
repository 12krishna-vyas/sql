use world;
--  group by rules 
-- not allow to use 'name' directly only able to use fuctions 
select region ,count(name),count(continent) as TotalCity from country group by region;

-- no. of citys in district whose population is greater then 1-lakh
select district,count(name) from city where population > 100000 group by district ;
-- where (subse phele excute hoga filter ke liye) => group by => count()

-- get total country which got independence after 1950 in easy continent 
select continent, count(name) from country where indepyear >1950 group by continent;

-- NOTE: where will only filter the data which is in original table
 
 -- HAVING 
 select continent,sum(population) from country group by continent
 having sum(population) > 100;
 
/*
-- imp question
where clause is use to filter the data from table
having use to filter the data on aggregate column
*/

--  Q continent name ,total population in continent only those country whose life 
-- expractency is greater then 35.0
select continent,sum(population) from country where lifeexpectancy > 35.0 group by continent ;

-- Q you need to find out the total countries for each governmentform where total no. 
-- of country should be greater then 30
select   governmentform , count(name) from country  group by  governmentform 
having count(name) > 30 ;

-- Q you need to find out the total countries for each government form only for the countries 
-- having there capital greater then 30 and total population greater than 3 lakh
select   governmentform , count(name) , sum(population) from country  where capital>30 
group by country 
having sum(population) > 300000 ;
 
select continent,region,count(name) from country 
group by continent, region;	