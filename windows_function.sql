-- order of execution of sql seatement

-- window functions
-- window functions perform calculations across a set of table rows 
-- related to the current row, without grouping the results into a single row

-- rank 
-- The RANK() function in MySQL is a window function that assigns a 
-- rank to each row within an ordered result set or partition
-- imp questions for interview (rank ,dense rank, roll no.)

-- DENSE_RANK()
-- The DENSE_RANK() function is a MySQL window function that assigns a rank to each row 
-- within a result set or partition, with no gaps in the ranking sequence, even for tied values

CREATE DATABASE window_fn_practice;
USE window_fn_practice;
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
department VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
salary INT NOT NULL,
hire_date DATE NOT NULL
);
CREATE TABLE sales (
sale_id INT PRIMARY KEY,
emp_id INT NOT NULL,
sale_date DATE NOT NULL,
amount DECIMAL(10,2) NOT NULL,
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO employees (emp_id, full_name, department, city, salary, hire_date) VALUES
(101, 'Asha Nair',   'Sales',      'Mumbai',    65000, '2022-04-10'),
(102, 'Rohan Mehta', 'Sales',      'Pune',      72000, '2021-07-05'),
(103, 'Neha Singh',  'Sales',      'Delhi',     68000, '2023-01-15'),
(104, 'Kabir Rao',   'Engineering','Bengaluru', 120000,'2020-09-20'),
(105, 'Isha Verma',  'Engineering','Hyderabad', 110000,'2021-11-12'),
(106, 'Vikram Das',  'Engineering','Bengaluru', 125000,'2019-03-08'),
(107, 'Pooja Shah',  'HR',         'Mumbai',    60000, '2020-02-01'),
(108, 'Arjun Iyer',  'HR',         'Chennai',   58000, '2022-06-18');

INSERT INTO sales (sale_id, emp_id, sale_date, amount) VALUES
(1, 101, '2026-01-02', 12000.00),
(2, 101, '2026-01-05',  8000.00),
(3, 102, '2026-01-03', 15000.00),
(4, 102, '2026-01-09',  5000.00),
(5, 103, '2026-01-04',  7000.00),
(6, 103, '2026-01-10', 11000.00),
(7, 101, '2026-02-02', 14000.00),
(8, 102, '2026-02-03',  9000.00),
(9, 103, '2026-02-05', 13000.00),
(10,101, '2026-02-08',  6000.00),
(11,102, '2026-02-10', 16000.00),
(12,103, '2026-02-12',  4000.00);

select * from employees;

select * ,rank() over(order by salary) from employees;
select * ,rank() over(order by salary) from employees;

-- Q1) Add a row number for employees sorted by salary (highest first)
select * ,rank() over(order by desc) from employees;

-- Q2) Rank employees by salary (ties share rank) 
select *,rank() over(order by salary)  from employees;

-- Q3) Dense rank employees by salary (no gaps in rank numbers)
select *,dense_rank() over(order by salary)  from employees;

-- Q4) Row number within each department by salary desc
--select *,rank() over(order by salary)  from employees;

-- Q5) Rank within each department by salary desc


-- Q6) Show previous and next salary in overall salary order (LAG/LEAD)
-- lag = pervious
-- lead = next
select * ,
lag(salary) over(order by salary desc),
lead(salary) over(order by salary desc) from employees;

select *,lag(salary,1) over(order by salary) from employees;
select *,-lag(salary,1) over(partition by department order by hire_Date) from employees;

-- Q7) Running total of sales amounts by date (overall)
select *, sum(amount) over (order by sale_date) from sales;

-- Q8) Running total of sales per employee by date
select* ,sum(amount) over(partition by emp_id order by sale_date) from sales; 

-- Q9) Total sales per row (same total repeated using window SUM)
select* ,sum(amount) over() from sales; 

-- Q10) Average salary per department shown on every employee row


-- Medium level

-- Q1) Top 2 salaries in each department (use ROW_NUMBER)
select * from (select* ,row_number() over(partition by department order by salary) as row_value
 from employees) tempdata where row_value <= 2; 
-- subquery saved to a variable named as "tempdata"
-- frist the subquery is solve save to the variable 
-- and then we access the colomn and we fuilter out the data
-- order of execution of sql seatement

-- Q2) Salary difference vs department average
select * , avg(salary) over(partition by department),
salary - avg(salary) over(partition by department) from employees;

-- Q3) Percent rank of employees by salary (overall)

-- The PERCENT_RANK() function in MySQL is a window function 
-- used to calculate the relative rank of a row within a result 
-- set or a specific partition, with a value ranging from 0 to 1

select * , sum(salary) over() ,
rank() over(order by salary),
percent_rank() over(order by salary)
from employees;


-- Q4) Salary distribution into 4 buckets (NTILE)
-- Q5) Find each employee’s first and last sale date (MIN/MAX window)
-- Q6) Month-wise running total of sales (per month)
