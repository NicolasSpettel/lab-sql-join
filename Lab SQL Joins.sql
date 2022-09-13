use sakila;

-- List the number of films per category.
select * from film_category;
select * from category;
select count(film_id) as number_of_films, name as category from film_category f
join category c 
using(category_id)
group by category_id;

-- Display the first and the last names, as well as the address, of each staff member.
select * from staff;
select * from address;
select first_name, last_name, address from staff s
join address a 
on s.address_id = a.address_id;

-- Display the total amount rung up by each staff member in August 2005.
select * from staff;
select * from payment;

select staff_id, first_name, last_name, sum(amount) as rung_up from payment p
right outer join staff s 
using(staff_id)
where date_format(payment_date, '%M') = 'August'
and date_format(payment_date, '%Y') = '2005'
group by staff_id;

-- List all films and the number of actors who are listed for each film.
select * from film;
select * from film_actor;
select title, count(actor_id) as number_of_actors from film f
left join film_actor a
using(film_id)
group by title;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select * from payment;
select * from customer;
select first_name, last_name, sum(amount) as total_amount_paid from customer c
join payment p
using(customer_id)
group by customer_id
order by last_name;