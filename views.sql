/*
schema - a logical container 

1. What is a View in SQL?

A View in SQL is a virtual table that is created using a SELECT query.
It does not store data physically 
it stores the SQL query and shows data from one or more tables when queried
ADVANTAGE
it will make your complex query easy
it will help in security 

TYPE OF VIEWS
SIMPLE -> any dml change will be visible on original 

COMPLEX -> aggrigate function , windows,DISTINCT, GROUP BY ,HAVING chalne pr view ko update nahi kr sakte


Materialized View (Definition)
A Materialized View stores the actual result of a query on disk and needs to be refreshed to reflect updated data.

Non-Materialized View (Normal View)
A normal view runs the query every time it is accessed.

3. How to Create a New User in SQL
Creating a user allows a person or application to access the database with specific permissions.

What are DML Permissions?
DML (Data Manipulation Language) permissions allow a user to:
INSERT data
UPDATE data
DELETE data
SELECT data

How to Assign DML Permissions to a User
DML permissions are assigned using the GRANT command to control what actions a user can perform on tables.
*/

use regex;

create table newactor as 
select actor_id,first_name from sakila.actor where actor_id between 1 and 3;

create view actor_v as       -- creatin view
select *,substr(first_name,2) from newactor;

select * from newactor;  -- 3 row 2 column
insert into newactor value(4,'riya'); -- 4 row 
select * from newactor;
 
create view actor_v2 as 
select * from newactor where actor_id in (1,2);
 
select * from newactor;  
insert into newactor value(5,'sakshi'); -- 4row table
select * from actor_v2;  



create table newpayment as 
select payment_id,amount from sakila.payment where payment_id between 1 and 7;

create view payment_v as       -- creatin view
select count(*) from newactor;

 select * from payment_v;  
insert into payment_v values(10); -- not insertable because of complex view


/*
dcl
authentatication and authortization

user => create => permission
ddl statement

*/

create user regex identified by 'regex' ; -- create user

select * from mysql.user; -- show all user

create table regex.actor2 as 
select actor_id,first_name from sakila.actor where actor_id between 3 and 7;

show grants for regex; -- to check permission 

grant select on regex.actor2 to regex; -- give permission 

grant all privileges on regex.actor2 to regex ; -- given all privileges to delect,insert , etc
show grants for regex;


/* 
ASSINGMENT
1. give the privileges to 1 or 2 column 
2. only select or delete
3. try to revoke those privileges
4. what is role 

*/