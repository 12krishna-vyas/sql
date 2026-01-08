-- CONSTRAINTS
-- rules that we apply to limit the data in the table
-- we use it to maintain accuracy and reliablity in the data
-- avoide invalid data

-- structure (data defination language)
-- create alter,drop, truncate
use regex;
create table test1(sno int);

-- dml (insert,update,delete,merge)
-- null
insert into test1 values(10);
insert into test1 (sno) values(20); 
insert into test1 (sno) values (null),(30);
select * from test1;

-- not null
create table test2 (sno int not null,salary int);
insert into test2(sno,salary) values(20,1000);
insert into test2(sno,salary) values(21,null);
insert into test2(sno,salary) values(null,6000); -- error
insert into test2(salary) values(1000); -- error

select * from test2;

-- not null default
create table test3 (sno int not null default 80,salary int);
insert into test3(salary) values(1000);
insert into test3(sno) values(20);

select * from test3;

-- unique
create table test4 (sno int not null, salary int unique default 100);
insert into test4(sno,salary) values(1000,20000);
insert into test4(sno,salary) values(1001,20000); -- error duplicate values
insert into test4(sno) values(1000);
insert into test4(sno) values(1500); -- error default 100 already in table

-- null value can be duplicate
insert into test4(sno,salary) values(1600,null);
insert into test4(sno,salary) values(1700,null);

select * from test4;

-- check 
create table test7 (sno int , salary int ,
-- gib=ving name to constraint
constraint regex_test7_sno_check check (sno between 1 and 100),
constraint regex_test7_salary_check check (salary in (1000,2000)) );

insert into test7(sno,salary) values(4,1000); 
insert into test7(sno,salary) values(150,1000); -- error
insert into test7(sno,salary) values(90,1500); -- error
select * from test7;

create table test8 (sno int primary key , salary int) ;
insert into test8(sno,salary) values(4,1000); 
insert into test8(sno,salary) values(null,12233); -- error

-- foreign key 
create table customer1(cid int primary key, cname varchar(20));
insert into customer1 values(10,'aman'),(11,'abhishek'); 

drop table order1; -- delete table

create table order1(order_id int primary key, city varchar(20), cid int,
foreign key (cid) references customer1(cid) );

insert into order1 values(1007,'jaipur',10),(1008,'goa',11),(1009,'mumbai',10);
insert into order1 values(10010,'j&k',25); -- error as 25 cid is not in customer table
select * from order1;

