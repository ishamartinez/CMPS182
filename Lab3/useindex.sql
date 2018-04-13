/* Database explains to show how query is performed to look up all customers with first name John mg_customer. */
/* Find all customers from mg_customers with first name John. 
This query uses a Seq Scan on mg_customers and its total runtime is 0.04 ms. */
EXPLAIN ANALYZE SELECT *
FROM mg_customers
WHERE first_name = 'John';

/* Makes an index of first name and last name 
After adding this index, the query still uses a Seq Scan on mg_customers and its total runtime is now 0.05 ms.*/
CREATE INDEX firstlast ON mg_customers (first_name, last_name); 