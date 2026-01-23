/*
window functions
 MySQL window functions perform calculations across a set 
 of table rows that are related to the current row, without 
 collapsing the result into a single row using GROUP BY.
 This allows you to perform analytical tasks like calculating 
 running totals, rankings, and moving averages efficiently. 

OVER()
The OVER clause in MySQL is used with window functions to perform 
calculations across a set of table rows that are related to the current row
*/

use world;

select code , name ,continent, population ,sum(population) over(),
avg(population) over() from country;

-- PARTITION BY: 
-- Divides the rows into groups (partitions) based on a specified 
-- column, and the window function calculation is applied within each 
-- partition separately.

-- divide deata on the basis of continent
select code , name ,continent, population ,
sum(population) over(partition by continent)
 from country; 	
 
 
 -- running sum , cummunative sum
 select code , name ,continent, population ,
sum(population) over(order by population)
 from country; 	