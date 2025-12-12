-- FUNCTIONS
/*
set of statement 
code reusuable
scaler function => row by row (result for each row)
multi lone function => multiple line pr apply and goive 1 output

scalar can apply : date,int,float,string
*/

-- string function (IMPORTANT)
-- CASE CONVERSION
use world;
select name, continent, upper(name),lower(name) from country;

-- CONCATE
select name , continent,concat(continent, '-' ,code,' ','regex') from country;

-- concat with a seperater (concat_ws) 	IMPORTANT
select name , continent ,concat_ws('-',continent,code,'regex') from country;

-- substr (SUBSTRING) => character extract based on the position
select name,substr(name,2) from country; -- start from 2nd char
select name,substr(name,2,5) from country; 
-- (name,position,total_char(5))
-- krishna => rishn

-- select from behind
select name,substr(name,-5,3) from country; 

-- Q country name whose first character is same hai continect name 
select name,continent from country 
where substr(name,1,1) = substr(continent,1,1);

select name,continent from country where substr(name,1,3) = 'alg';
-- or
select name,continent from country where name like 'alg%';

-- instr => search position of character
select name , instr(name,'e') from country;

select ' yesh'; -- dummy

-- length => (show total byte use not toatl character use(length) )
-- char_length => used to show character length 
select name, char_length(name) from country;

-- trim => used to remover extra white space or remove character
--        => default remove spaces
-- ltrim => trim from left
-- rtrim => trim from right
select char_length('       yash      '); -- 17
select trim('       yash      ');

-- remove char from trim
select trim( both 'g' from '     yashgggg');
select name, trim(both 'A' from name) from country ;
-- both => remove from both the side
-- NOTE: data is case sensitive use 'A' or 'a' 

-- lpad and rpad
select name , population, lpad(population,9,'#') from country;


