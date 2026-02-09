
 /*
PLSQL
PL/SQL (Procedural Language/SQL) is Oracle Corporation's procedural extension for 
SQL that combines the data manipulation power of SQL with the procedural features
 of a programming language, such as loops, conditions, and error handling.
 
 WHY WE USE PLSQL
 - reuseablity 
 - we can use all control flow structure if,else,while loop, functions
 
declare 
    cursor, variable, exception

begin 
        (executable )

end

exception

*/

SET SERVEROUTPUT ON;

DECLARE
    var INT := 0;
BEGIN
    var := 12; -- value is changed
    IF MOD(var, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('hey hello world - ' || var);
    ELSE
        DBMS_OUTPUT.PUT_LINE('regex software');
    END IF;
END;
/

DECLARE
    var INT := 0;
BEGIN
    WHILE var <= 3 LOOP
        DBMS_OUTPUT.PUT_LINE('counter is: ' || var);
        var := var + 1; -- increment 
    END LOOP;
END;
/

-- cursor
-- this is a pointer which provide control over the result of a sql query 

DECLARE 
    v_name varchar(20);
    v_salary hr.employees.salary%type;
begin
select first_name into v_name from hr.employees where employee_id = 102;
select salary into v_salary from hr.employees where employee_id = 102;
dbms_output.put_line(v_name || '-' || v_salary);

end ;
/

-- %ROWTYPE
-- is a attribute which is used to create a variale of record type
-- in this record type we store/create a column with its datatype

-- record datatype
-- record is a data structure which is used to store diff type as a single unit

DECLARE 
    v_rec hr.employees%rowtype;
begin
select * into v_rec from hr.employees where employee_id = 102;
dbms_output.put_line(v_rec.first_name || '-' || v_rec.hire_date);

end ;
/

-- diff bet %type and %rowtype
-- how to optimise sql query 
-- cte views correlated query

-- create a plsql program to find no. is armstrong no. or not
-- you have m=been given a number check whether a number is prime or not 
-- using while loop find the lcm of 2 numbers
-- what is cursor and its type (implicit and explicit)