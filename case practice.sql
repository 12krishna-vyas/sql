use sakila ;

select first_name , active ,
	case 
		when active = 1 then 'Active Customer'
		when active = 0 then 'Inactive Customer'
	end as status 
    from customer;
    
    
select * from film ;

select title ,length,
	case
		when length < 60 then 'Short'
        when length < 120 then 'Medium'
        when length > 120 then 'long'
	end as type 
    from film;
    

select  rating , count(*) as total,
	case
		when count(*) < 200 then 'low count'
		when count(*) between 200 and 400 then 'Medium count'
        when count(*) > 400 then 'high count'
    end from film group by rating ;


-- claculate total payment per customer
select c.customer_id ,first_name, sum(amount),
case
	when sum(amount) <90 then 'low spend'
    else 'high spend'
    end from payment as p 
join customer as c 
on c.customer_id  = p.customer_id
group by c.customer_id , c.first_name ;


-- 3 tables (film,inventory,rental)
-- find how many time  each  film has been rented 
-- show file title , total rental count 

select * from film ;
select * from inventory ;
select * from rental ;

select f.title, count(r.rental_id)
from film as f join inventory as i
on f.film_id = i.film_id
join rental as r 
on i.inventory_id = r.inventory_id
group by title; 

-- 
select * from customer as c1
join customer as c2
where c1.store_id = c2.store_id ;

-- tables(customer ,payment)
-- find customers whose total paymnet is greater than the avg total payment of all customer

select * from customer;
select * from payment ;

select c.customer_id , c.first_name as customer_name , sum(p.amount) as total_amount  
from customer as c join payment as p 
on c.customer_id = p.customer_id 
group by c.first_name ,c.customer_id
having sum(p.amount) > (
	select avg(amount) from payment);

-- tables(film , inventory ,rental )
-- find films whose rental count is greater than  the avg rentals per film 

