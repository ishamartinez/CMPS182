/* Adds foreign key constraints for mg_customers and cb_books. */
ALTER TABLE mg_customers
ADD CONSTRAINT address_id_fkey
FOREIGN KEY (address_id) REFERENCES dv_address;

ALTER TABLE cb_books
ADD CONSTRAINT author_id_fkey
FOREIGN KEY (author_id) REFERENCES cb_authors;