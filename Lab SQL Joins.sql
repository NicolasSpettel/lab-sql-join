USE sakila;

-- List the number of films per category.
SELECT * FROM film_category;
SELECT * FROM category;
SELECT COUNT(film_id) AS number_of_films, name AS category FROM film_category f
JOIN category c 
USING(category_id)
GROUP BY category_id;

-- Display the first and the last names, as well as the address, of each staff member.
SELECT * FROM staff;
SELECT * FROM address;
SELECT first_name, last_name, address FROM staff s
JOIN address a 
ON s.address_id = a.address_id;

-- Display the total amount rung up by each staff member in August 2005.
SELECT * FROM staff;
SELECT * FROM payment;

SELECT staff_id, first_name, last_name, SUM(amount) AS rung_up FROM payment p
RIGHT OUTER JOIN staff s 
USING(staff_id)
WHERE DATE_FORMAT(payment_date, '%M') = 'August'
AND DATE_FORMAT(payment_date, '%Y') = '2005'
GROUP BY staff_id;

-- List all films and the number of actors who are listed for each film.
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT title, COUNT(actor_id) AS number_of_actors FROM film f
LEFT JOIN film_actor a
USING(film_id)
GROUP BY title;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT * FROM payment;
SELECT * FROM customer;
SELECT first_name, last_name, SUM(amount) AS total_amount_paid FROM customer c
JOIN payment p
USING(customer_id)
GROUP BY customer_id
ORDER BY last_name;