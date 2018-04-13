/* Unit tests */
/* DELETE commands that violate foreign key constraints. */
DELETE FROM dv_address
WHERE (dv_address.address_id = mg_customers.address_id);

DELETE FROM cb_authors
WHERE (cb_books.author_id = cb_authors.author_id);

/* INSERT commands that meet and violate general constraints. */
INSERT INTO dv_film (film_id, length)
VALUES (123, 234);
INSERT INTO dv_film (film_id, length)
VALUES (223, -234);

INSERT INTO mg_customers (customer_id, address_id)
VALUES (345, 456);
INSERT INTO mg_customers (customer_id, address_id)
VALUES (334, NULL);

INSERT INTO dv_address (address_id, address)
VALUES (567, '678 Some Street')
INSERT INTO dv_address (address_id, address)
VALUES (556, NULL);
