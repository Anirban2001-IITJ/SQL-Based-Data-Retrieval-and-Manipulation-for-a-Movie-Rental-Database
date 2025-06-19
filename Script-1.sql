/* 𝐒𝐐𝐋 𝐄𝐗𝐄𝐑𝐂𝐈𝐒𝐄 𝐀𝐒𝐒𝐈𝐆𝐍𝐌𝐄𝐍𝐓 (𝐁𝐲 𝐏𝐫𝐨𝐟. 𝐒𝐮𝐦𝐚𝐧 𝐊𝐮𝐧𝐝𝐮)
 * 
 *
 1Q) Write a SQL Query to retrive all columns and rows from the actor table.
  
 */ -> SELECT * FROM actor; 

/*
 * 
 * 
 2Q) Write a SQL Query to retrieve the first_name, last_name and email from the table for all customers.
 
 */ -> SELECT first_name, last_name, email FROM customer;

/*
 * 
 * 
 3Q) Write a SQL Query to insert a new row into the category table with the time "Sci-Fi".
 
 */ -> INSERT INTO category (category_id, name, last_update)
       VALUES ((SELECT MAX(category_id) + 1 FROM category), 'Sci-Fi', CURRENT_TIMESTAMP);

 /*
  *
  *
  4Q) Write a SQL Query to update the last_name of the actor with actor_id 5 to "Smith".

  */ -> UPDATE actor
        SET last_name = 'Smith'
        WHERE actor_id = 5;
 
 /*
  * 
  * 
  5Q) Write a SQL query to retrieve the film_id, title and release_year from the film table for the films released in the year 2006.
  
  */ -> SELECT film_id, title, release_year
        FROM film
        WHERE release_year = 2006;
 
 /*
  * 
  * 
  6Q) Write a SQL query to retrieve the first_name and last_name of all actors whose first name starts with "A".
  
  */ -> SELECT first_name, last_name
        FROM actor
        WHERE first_name LIKE 'A%'
        
  /*
   * 
   * 
   7Q) Write an SQL query to retrieve the total number of customers in the customer table.
   
   / -> SELECT COUNT () AS total_customers 
         FROM customer;
  
  /* 
   * 
   * 
   8Q) Write an SQL query to retrieve the average rental duration (in days) from the film table, aliased as average_duration.
   
   */ -> SELECT AVG (rental_duration) AS average_duration
         FROM film;
  
  /*
   *
   *
   9Q) Write an SQL query to retrieve the film titles and their corresponding category names.
  
   */ ->  SELECT f.title, c.name AS category_name
         FROM film f
         JOIN film_category fc ON f.film_id = fc.film_id
         JOIN category c ON fc.category_id = c.category_id
         
   /*
    *
    *
    10Q) Write an SQL query to find the actors who have appeared in more than 20 films. 
         Display the actor's first name, last name, and the number of films they have appeared in.
         
     */ -> SELECT a.first_name, a.last_name, COUNT (fa.film_id) AS film_count
           FROM actor a
           JOIN film_actor fa ON a.actor_id = fa.actor_id
           GROUP BY a.actor_id
           HAVING COUNT (fa.film_id) > 20;
   /*
    * 
    * 
    11Q) Write an SQL query to find the customers who have rented movies for a total duration of more than 150 hours. 
         Display the customer's first name, last name, and the total rental duration in hours.
         
    */ -> SELECT cu.first_name, cu.last_name, SUM(f.rental_duration * 24) AS total_rental_hours
          FROM customer cu
          JOIN rental r ON cu.customer_id = r.customer_id
          JOIN inventory i ON r.inventory_id = i.inventory_id
          JOIN film f ON i.film_id = f.film_id
          GROUP BY cu.customer_id
          HAVING total_rental_hours > 150;