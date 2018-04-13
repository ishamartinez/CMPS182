/* Adds general constraints. */
/*The length of a film must be a positive integer. */
ALTER TABLE dv_film ADD CONSTRAINT positive_length CHECK (length > 0);

/* Sequence */
SELECT MAX(address_id) + 1 FROM dv_address;
SELECT customer_id FROM mg_customers WHERE address_id IS NULL;

UPDATE mg_customers SET address_id = 606
WHERE ctid IN (SELECT ctid FROM mg_customers
	WHERE address_id IS NULL
	LIMIT 1);

UPDATE mg_customers SET address_id = 607
WHERE ctid IN (SELECT ctid FROM mg_customers
	WHERE address_id IS NULL
	LIMIT 1);

UPDATE mg_customers SET address_id = 608
WHERE ctid IN (SELECT ctid FROM mg_customers
	WHERE address_id IS NULL
	LIMIT 1);

UPDATE mg_customers SET address_id = 609
WHERE ctid IN (SELECT ctid FROM mg_customers
	WHERE address_id IS NULL
	LIMIT 1);

UPDATE mg_customers SET address_id = 610
WHERE ctid IN (SELECT ctid FROM mg_customers
	WHERE address_id IS NULL
	LIMIT 1);

UPDATE mg_customers SET address_id = 611
WHERE ctid IN (SELECT ctid FROM mg_customers
	WHERE address_id IS NULL
	LIMIT 1);

UPDATE mg_customers SET address_id = 612
WHERE ctid IN (SELECT ctid FROM mg_customers
	WHERE address_id IS NULL
	LIMIT 1);

UPDATE mg_customers SET address_id = 613
WHERE ctid IN (SELECT ctid FROM mg_customers
	WHERE address_id IS NULL
	LIMIT 1);

INSERT INTO dv_address (address_id, address)
VALUES (606, $$unknown$$);

INSERT INTO dv_address (address_id, address)
VALUES (607, $$unknown$$);

INSERT INTO dv_address (address_id, address)
VALUES (608, $$unknown$$);

INSERT INTO dv_address (address_id, address)
VALUES (609, $$unknown$$);

INSERT INTO dv_address (address_id, address)
VALUES (610, $$unknown$$);

INSERT INTO dv_address (address_id, address)
VALUES (611, $$unknown$$);

INSERT INTO dv_address (address_id, address)
VALUES (612, $$unknown$$);

INSERT INTO dv_address (address_id, address)
VALUES (613, $$unknown$$);

/* Create the address_id sequence. */
CREATE SEQUENCE dv_address_seq START 606;

/* Next value. */
ALTER TABLE dv_address
ALTER COLUMN address_id
SET DEFAULT nextval($$dv_address_seq$$);

/* An mg_customers tuple must not have a NULL address_id field. */
ALTER TABLE mg_customers ALTER COLUMN address_id SET NOT NULL;

/* A dv_address tuple must not have a NULL address field. */
ALTER TABLE dv_address ALTER COLUMN address SET NOT NULL;