use world;
-- get the name,continent,region from country where continent is not same as europe
select name , continent , region from country where continent != 'europe';

-- get the name,continent,region from country where second letter of region is 'a'
select name , continent , region from country where region like '_a%';

-- get the name,continent,region from country where in the continent the last 3rd char is 'i'
select name , continent , region from country where continent like '%i__';

-- get the name,continent,region from country where continent name should be of minimum of 5 char
select name , continent , region from country where continent like '_____%';

-- get the name,continent,region from country where in the continent second letter is 'c' 
-- last second char is 'i'
select name , continent , region from country where continent like '_c%i_';

-- get the name,continent,region from country where two 'a' should be there seprated with the name
select name , continent , region from country where name like '%a_a%';

-- and , or operator 
-- and example
select * from country where continent = 'asia' and region = 'middle east';

-- or example

-- concat
select name , code , concat(name,' ',code) from country ;
