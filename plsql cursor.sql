/*
Q1. Difference between %TYPE and %ROWTYPE

%TYPE is used to declare a variable with the SAME DATATYPE as a table column.
-- Why we use it:
Avoid datatype mismatch
If column datatype changes

%ROWTYPE is used to declare a variable that can STORE AN ENTIRE ROW OF TABLE.
-- Why we use it:
When you need multiple columns at once
Reduces multiple variable declarations

Q2. How to Optimize SQL Query
SQL optimization means writing queries that run faster and use fewer resources.

Q3. CTE (Common Table Expression)
A CTE is a temporary named result set created using WITH clause.
🔹 Why we use it
Improves readability
Replaces complex subqueries
Can be reused in same query

Q4. Views
A view is a virtual table created using a SELECT query.
🔹 Why we use views
Security (hide columns)
Simplify complex queries
Reusability

Q5.Correlated Query (Correlated Subquery)
A correlated subquery is a subquery that depends on the outer query and runs once per row.

Q6.Cursor
this is a pointer which provide control over the result of a sql query 

🔹 Types of Cursor
1. Implicit Cursor
Automatically created by plsql/Oracle for DML & SELECT INTO statements.
-- attributs 
	%found
	%notfount 
	%rowcount 
	%isopen

2. Explicit Cursor
Manually declared and controlled by the programmer.

Steps:
Declare
Open
Fetch
Close

-- assingment
stored processers or function
in,out,inout


*/
/*
-- create a plsql program to find no. is armstrong no. or not
-- ex - 153 is armstrong no.
DECLARE
    num INT := 1;
    num2 INT := 5;
    num3 INT := 3;
BEGIN
    if 
    
END;


-- you have been given a number check whether a number is prime or not 
DECLARE
    var1 int := 13;
    v_factor INT := 0;
BEGIN

    for i in 1..var1 loop
        dbms_output.PUT_LINE(i);
        if mod(var1,i)=0 THEN
            v_factor: = v_factor = 1;
            dbms_output.PUT_LINE('factor :' || ' ' || v_factor);
        end if;
    end loop;
end;
*/

-- CREATE table emp_cp
-- as select employee_id first_name  from hr.employees where employee_id 
-- between 100 and 104 ;

-- select * from emp_cp;

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('we are inside the begin');

-- -- update emp_cp set first_name = 'regex';
--     delete from emp_cp where employee_id < 103;
--     DBMS_OUTPUT.PUT_LINE(SQL%rowcount); 
--     -- counting kitni rows change huye bcz of dml operation
-- end;

DECLARE 
    cursor emp_cur is select * from emp_cp; -- cursor created explicit
    emp_record emp_cp%rowtype; -- record variable as same as of the table

begin 
    open emp_cur;  -- openned cursor
        fetch emp_cur into emp_record; -- here we fetch data from cursor

    if emp_cur%isopen THEN -- is cursor open => true otherwise false
        dbms_output.PUT_LINE('cursor open');
    end if;

    if emp_cur%found then -- true (based on the fetch output)
        dbms_output.PUT_LINE('cursor got the data');
    else
        dbms_output.PUT_LINE('cursor dont found the data');
    end if;
    
    close emp_cur; -- close the cursor here
end;



DECLARE 
    cursor emp_cur is select * from emp_cp; -- cursor created explicit
    emp_record emp_cp%rowtype; -- record variable as same as of the table

begin 
    for  line in emp_cur LOOP
        DBMS_OUTPUT.PUT_LINE(line.employee_id);
    end loop;

    -- open emp_cur;  -- openned cursor
    --     fetch emp_cur into emp_record; -- here we fetch data from cursor
    -- while emp_cur%found LOOP
    --     dbms_output.PUT_LINE('emp_record.employee_id');
    --     fetch emp_cur into emp_record;
    -- end loop;
    
    -- close emp_cur; -- close the cursor here
end;