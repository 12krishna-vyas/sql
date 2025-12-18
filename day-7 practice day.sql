use sakila;
show tables;
select * from payment;

-- you need to find total amount of transation from month of may
select payment_date ,month(payment_date),extract(month from payment_date) from payment
where month(payment_date)=5; 

select amount,count(*) from payment where month(payment_date)=5 
group by amount;

-- you need to find out the max amount spend ,avg amount spend and the total amount spend 
-- for each staff

select * from payment;
select staff_id,max(amount),avg(amount),sum(amount) from payment group by staff_id;

-- you need to find out the max amount spend ,avg amount spend and the total amount spend 
-- for each staff only for the customer id=1,3,7,11

select staff_id,max(amount),avg(amount),sum(amount) from payment 
where customer_id=1 or customer_id=3 or customer_id=7 or customer_id=11 
group by staff_id ;

-- find the total amount spend and the no. of customer done the payment in each month
-- where the amount spend should be greater than one doller

select month(payment_date),count(customer_id),sum(amount) from payment where amount > 1
group by month(payment_date); 

select year(payment_date),count(customer_id)
from paymnet group by year(payment_date),month(paymnet_date);