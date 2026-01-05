/* SUBQUERY
is a query within a another query is called subsquer id is used to perform the 
calculation  based on related table and also used  to perform on the based on 
dynamic calculation
*/
use world;
select * from city;
select * from country;

use sakila;
select * from payment;
 
-- SINGLE ROW SUBQUERY

select * from payment 
where amount = (select amount from payment where payment_id =3);

-- payment infromation where staff serving payment_id = 8
select * from payment 
where staff_id = (select staff_id from payment where payment_id = 8);

-- get the payment_id, amount and the paymentdate where the month of 
-- paymnet should be same as of payment id 20
select payment_id, payment_date, amount from  payment 
where month(payment_date)=(select month(payment_date) from payment where payment_id = 20);

-- get the amount and the total no. of payment done for the each amount where the 
-- amount should be less then the amount of rental id 1725

select amount, count(*) from payment where amount < (select amount from payment where rental_id = 1725)
group by amount;

-- get the month and the total amount spend from the payment table where the month is greater then the month of customer_id 1
-- with the payment id 3

select month(payment_date) from payment where payment_id = 3 and customer_id =1;

select month(payment_date) ,sum(amount) from payment where month(payment_date) > 
(select month(payment_date) from payment where payment_id = 3 and customer_id =1)
group by month (payment_date);

-- MULTI ROW SUBWUERY
-- subquery return multiple rom 
-- can not use comparision operator (>, <, =, !=)
-- we can use in , any , all

select * from payment where payment_id = 2 or paymnet_id =3;

-- using =
select * from payment
where amount = (select amount from payment where payment_id = 2 or payment_id =3);

-- using in
select * from payment
where amount in (select amount from payment where payment_id = 2 or payment_id =3);