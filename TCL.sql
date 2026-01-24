-- imp topics 
-- correalted join subquery windows 

/*
TCL (transaction control language)
Transaction => set of logical statement (permanent nahi hai)
*/

use regex;
create table actor_cp2 as select actor_id ,first_name from sakila.actor
where actor_id between 1 and 5;

-- autocommit -> enable
set @@autocommit=0;  -- for auto save disable 
select @@autocommit ; -- 1 (autosave enable)

insert into actor_cp2 values(7,'testoo');
-- for checking it is permanently save or nor we need to make another connection
rollback;

/*
when transaction starts 
in case if you run any DML operation or start transaction we need to use 
'start' keyword 

when muy transaction will be automaticly close 
if we use any TCl command like commit,rollback it will automaticly close
or in case any DDL operation or DCL operation 

commit => hamare data ko ussi stable condition me le aata hai 
*/

start transaction; -- iske ander ka kuch bhi change nahi hoga jab tak mai DDl command nahi lagau 
insert into actor_cp2 values (13,'filpcard');
-- commit use krna padega save k liye verna DDL command 
-- roleback vapas picha jane k liye (like a checkpoint in game)

-- save point (specafic point)
-- apne hisab se kisi point pr save kr sakte hai 

-- rollback to savepoint
savepoint db_actor_cp2_svp1;
insert into actor_cp2 values (15,'kri');
insert into actor_cp2 values (16,'shna');

-- rollback to savepoint
rollback to db_actor_cp2_svp1;

create table xyz(id int); -- DDl command 


select * from actor_cp2; 
