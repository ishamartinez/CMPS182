/* More queries! */
/* Changes mg_customers active to true wherever it is NULL and customer's last name starts with a B or C. */
UPDATE mg_customers
SET active = TRUE 
WHERE active IS NULL AND (last_name LIKE 'B%' OR last_name LIKE 'C%');

/* Adds John Smith's information to mg_customers and dv_address. */
INSERT INTO dv_address(address_id, address, city_id, postal_code)
VALUES (700, 'Koshland Way', 654, '95064');

INSERT INTO mg_customers(first_name, last_name, address_id)
VALUES ('John', 'Smith', 700);

/* List the title of each film whose length exceeds the average length of all films. */
SELECT title
FROM dv_film
WHERE length > (SELECT AVG(length)
	FROM dv_film);

/* What is the maximum, minimum, and average length of the films in each rating category? */
SELECT rating, MAX(length), MIN (length), AVG(length)
FROM dv_film
GROUP BY rating;

/* Deletes all books written by Nevil Shute. */
DELETE FROM cb_books
WHERE author_id = (SELECT author_id
	FROM cb_authors
	WHERE first_name = 'Nevil' AND last_name = 'Shute');
