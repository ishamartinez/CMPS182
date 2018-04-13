/* Creates views and queries those views. */
/* Customer City */
CREATE VIEW customer_city AS
SELECT dv_customer.first_name, dv_customer.last_name, dv_address.city_id
FROM dv_customer, dv_address, cb_customers
WHERE dv_customer.first_name = cb_customers.first_name AND dv_customer.last_name = cb_customers.last_name;

/* District Stat */
CREATE VIEW district_stat AS
SELECT district, COUNT(customer_id)
FROM dv_address, dv_customer
WHERE dv_address.address_id = dv_customer.address_id
GROUP BY district
ORDER BY COUNT(customer_id); 

/* Author Title */
CREATE VIEW author_title AS
SELECT cb_authors.first_name, cb_authors.last_name, cb_books.title
FROM cb_books, cb_authors
WHERE cb_books.author_id = cb_authors.author_id;

/* Which are the books written by Stephen Fry? */
SELECT title
FROM author_title
WHERE first_name = 'Stephen' AND last_name = 'Fry';

/* Which district has the least number of customers? */
SELECT district
FROM district_stat
ORDER BY COUNT(*)
LIMIT 5;

/* Change name of customer_city. */
ALTER VIEW customer_city RENAME TO new_customer_city;