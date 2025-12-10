use world;
select *from country;
-- Get the name 
select Code, name from Country where region != 'Middle East';
-- Get the name indepyear and population with the expexted 10 % increment population
select name , indepyear ,population , (population * 0.1 + population) from country;
select * from country where lifeexpectancy in (38.3 , 66.4) ;
select name , continent , population , gnp from country where population not in (5000,200000);

-- like operator
select name , continent from country where name like 'A%';
select name , continent from country where name like 'ir__';