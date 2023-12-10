-- Display all available tables in the Sakila Database
SHOW TABLES FROM sakila;

-- Retrieve all the data from the tables actor, film and customer
SELECT * FROM sakila.actor;
SELECT * FROM sakila.film;
SELECT * FROM sakila.customer;

/* Retrieve the following columns from their respective tables:
3.1 Titles of all films from the film table
3.2 List of languages used in films, with the column aliased as language from the language table
3.3 List of first names of all employees from the staff table*/
SELECT title AS Film_titles from sakila.film;
SELECT name AS Language from sakila.language;
SELECT first_name from sakila.staff;

-- Retrieve unique release years.
SELECT DISTINCT release_year FROM sakila.film;

/*Counting records for database insights:

5.1 Determine the number of stores that the company has.
5.2 Determine the number of employees that the company has.
5.3 Determine how many films are available for rent and how many have been rented.
5.4 Determine the number of distinct last names of the actors in the database.*/
SELECT COUNT(store_id) FROM sakila.store;
SELECT COUNT(staff_id) FROM sakila.staff;
-- Films available to rent, including copies from all film_id on both stores
SELECT COUNT(inventory_id) FROM inventory;
-- Total films rented, returned and not return
SELECT COUNT(rental_id) FROM rental;
-- Films that has been rented and not returned
SELECT COUNT(inventory_id) FROM rental
where return_date is null;
SELECT DISTINCT COUNT(last_name) FROM actor;

-- Retrieve the 10 longest films.
SELECT title, length FROM film
ORDER BY length DESC
LIMIT 10;

/*Use filtering techniques in order to:

7.1 Retrieve all actors with the first name "SCARLETT".
BONUS:

7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer 
than 100 minutes.

7.3 Determine the number of films that include Behind the Scenes content*/

SELECT first_name, actor_id FROM actor
WHERE first_name = "SCARLETT";

SELECT title, length FROM film
WHERE title LIKE "%ARMAGEDDON%" and length > 100;

SELECT COUNT(film_id), special_features FROM film
WHERE special_features LIKE "%Behind the Scenes%";