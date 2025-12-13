use world;

-- numeric functionb, dates
-- round()
select lifeexpectancy, round(lifeexpectancy) from country;
select 83.62, round(83.62); -- => 84 

-- round () decimal
select 83.62, round(83.62,1); -- => 83.6

-- round of nearest (hundred(-3) , tenth(-2) , once(-1))
-- -1 means first one on the left side of decimal
-- 1 means first right side of decimel 
-- gives 0 if data is not there (456.32,-4) 
select (456.23) , round(476.23,-2);

-- truncate => extract decimal values
-- mod() => returns the remainder of a division operation
select 456.23 ,round(456.23,1) ,truncate(456.23,1) , mod(60,3);

-- pow => power
-- ceil => increase && floor => decrease

select pow(2,3) ,ceil(3.005), floor(3.99999);
/*
date => inbuild date ,that print date and time
NOW() Returns the current date and time
CURDATE()	Returns only the current date
CURRENT_TIME()	Returns only the current time
CURRENT_TIMESTAMP()	An alias for NOW(), returning the current date and time.
*/
select now(),curdate(),current_time(), current_timestamp(); 

-- add date

select now() , adddate(now(),2) , adddate(now() ,interval 3 month );  

-- subdate() => function that subtracts a specified time or date 
-- interval from a given starting date
select now(),subdate(now(),2);

-- extract =>functions or operations that pull out specific data or components from a larger source
select now() , extract(MONTH from now());

-- %M %Y %W are attributes
-- date_format() =>  format a date as specified by a format string
select now(), date_format(now() ,'Month is %M & year is %Y & week is %W ');

-- distinct keyword => use to remove duplicate
select distinct(continent) from country;

select count(continent) , count(distinct(continent)) from country ;