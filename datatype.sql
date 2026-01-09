/*
 data type in sql
numeric => int,  float, decimal
tinyint,  medium int, big int,s small int , int
1 byte,, small => 2 byte, medium => 3, int => 4 byte, long 8 byte
1 byte => 8 bit ( 2**8) => 256
*/
use regex;
create table test10 (id tinyint);
insert into test10 value(1),(-128),(127);
insert into test10 value(128);

create table test11 (id tinyint unsigned);
insert into test11 value(129),(225);
select * from test11;

-- float
create table test12 (price float);
insert into test12 value(4561.129),(25.1236547);
select * from test12;

-- double
create table test13 (price float,price2 double);
insert into test13 value(4561.129,25.1236547),(12.1236545,52.54562123);
select * from test13;

create table test14 (price double(5,2));
-- dounle (presision,decimal)
insert into test14 value(45.1);
insert into test14 value(45.12);
insert into test14 value(4.145629);
insert into test14 value(455.654129);
insert into test14 value(4551.165429); -- errror out of range
select * from test14;

/*
varchar and char
vrchar is datatype => string / character calues
char=> character but of fix length of character
total 255 character can be stored 
*/

create table test15 (name char(10));
insert into test15 value('asdsf');
insert into test15 value('sasdfdgfhgjhk'); -- error
select * from test15;
