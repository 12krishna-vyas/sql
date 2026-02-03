/*
object
=>object is any component of the database system used to store, manage, or manipulate data

indexes 
=> is like a structure which is use to exices the data in a faster way

multiple indexes:
multiple indexes in two primary ways: by creating a single multi-column 
(composite) index on several columns, or by having multiple separate 
single-column indexes on different column


2 type of index

=> cluster index
 clustered index is the physical ordering of the data rows in the table, 
 based on the values of its key columns.
note: there is only one cluster index in the table



*/

use sakila;

create table test100 as 
select actor_id,first_name from actor where actor_id between 1 and 10;

select * from test100; 
explain select * from test100 where actor_id = 5;

explain select * from test100 where first_name = 'nick' ;

insert into test100 values(14,'kri'),(12,'zdvd'),(13,'bbg'),(15,'bsf');

-- alter staterment 
alter table test100 add primary key (actor_id);
alter table test100 drop primary key;

create index indx1 on test100(actor_id);
explain select * from test100 where actor_id = 5;

-- index on 2 column 
create index indx_composite on test100 (actor_id,first_name);
show index from test100;
explain select * from test100 where actor_id > 10 and first_name = 'kri';

insert into test100 values(16,'johas'),(17,'johshep'),(18,'johly'),(19,'joh');
truncate table test100;

create index index_3 on test100 (first_name(3));
show index from test100;


/*
create role 
add user in it
give permission in it 
check users permission - show grant 
login user and check privleges 
*/