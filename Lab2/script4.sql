/* Queries for Downtown Video and City Books */

/* 1. What are the first and last names of all people who are customers of both Downtown Video and City Books? */
SELECT dv_customer.first_name, dv_customer.last_name
FROM dv_customer, cb_customers
WHERE dv_customer.first_name = cb_customers.first_name AND dv_customer.last_name = cb_customers.last_name;

/* 2. What are phone number of all people who are customers of both Downtown Video and City Books? */
SELECT dv_address.phone
FROM dv_address, dv_customer, cb_customers
WHERE dv_address.address_id = dv_customer.address_id AND dv_customer.first_name = cb_customers.first_name AND dv_customer.last_name = cb_customers.last_name;

/* 3. What are the first and last names of all customers who live in the district having the most customers? */
SELECT dv_customer.first_name, dv_customer.last_name
FROM dv_customer, dv_address
WHERE dv_address.address_id = dv_customer.address_id AND dv_address.district = 
	(SELECT district
	FROM dv_address
	GROUP BY district
	ORDER BY COUNT(*) DESC
	LIMIT 1);

/* 4. What rating is the least common among films in the Downtown Video database, and how many films have that rating? */
SELECT rating, COUNT(f)
FROM dv_film f
GROUP BY rating
ORDER BY COUNT(*) ASC
LIMIT 1;

/* 5. What are the first and last names of the top 10 authors when ranked by the number of books each has written? */
SELECT DISTINCT cb_authors.first_name, cb_authors.last_name
FROM cb_authors, cb_books
WHERE cb_authors.author_id = cb_books.author_id AND cb_authors.author_id IN
	(SELECT b.author_id
	FROM cb_books b
	GROUP BY b.author_id
	ORDER BY COUNT(*) DESC
	LIMIT 10);