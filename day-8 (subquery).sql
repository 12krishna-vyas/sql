use sakila;

-- SUB-QUERY (nested)
 -- a query that is nested inside another query. 
 -- SQL subqueries are also called “nested queries” or “inner queries”
-- Write a SQL query to find all payment records where the payment amount 
-- is greater than the amount of the payment whose payment_id is 25.

-- using 2 query (long)
select amount from payment where payment_id=25; 
select * from payment where amount > 4.99;

-- using 2 query (short)
select * from paymnet where 
amount > (select amount from payment where payment_id=25);

/*
Primary Key 
A Primary Key is a column (or a set of columns) that uniquely identifies 
each row in a table.

Candidate Key
A Candidate Key is a minimal super key that can uniquely identify 
a record and has no extra attributes.

Super Key
A Super Key is a set of one or more columns that can uniquely 
identify a record (row) in a table.


*/