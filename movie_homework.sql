CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  billing_info VARCHAR(100)
);

CREATE TABLE ticket (
  ticket_id SERIAL PRIMARY KEY,
  amount VARCHAR(100),
  film_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  FOREIGN KEY(film_id) REFERENCES movie(film_id),
  FOREIGN KEY(order_id) REFERENCES order_(order_id) 
);

CREATE TABLE Movie (
  film_id SERIAL PRIMARY KEY,
  title VARCHAR(100),
  rating VARCHAR(100)
);

CREATE TABLE order_(
  order_id SERIAL PRIMARY KEY,
  order_date DATE DEFAULT CURRENT_DATE,
  sub_total NUMERIC(8,2),
  total_cost NUMERIC(10,2)
);

CREATE TABLE inventory(
  upc SERIAL PRIMARY KEY ,
  product_amount INTEGER,
  order_id INTEGER not null,
    CONSTRAINT valid_product CHECK (product_amount > 0),
    FOREIGN KEY (order_id)
      REFERENCES order_(order_id)
);

CREATE TABLE concessions (
  item_id SERIAL PRIMARY KEY,
  amount VARCHAR(100),
  prod_name VARCHAR(100),
  upc INTEGER NOT NULL,
  FOREIGN KEY (upc) REFERENCES inventory(upc)
);

ALTER TABLE public."Concessions" RENAME TO concessions;

ALTER TABLE public."Customer" RENAME TO customer;

ALTER TABLE public."Movie" RENAME TO movie;

ALTER TABLE public."Ticket" RENAME TO ticket;

insert into customer(
	customer_id,
	first_name,
	last_name,
	billing_info
) values (
	1,
	'Seth',
	'Franklin',
	'4242-4242-4242-4242 555 01/20'
);

insert into customer(
	customer_id,
	first_name,
	last_name,
	billing_info
) values (
	2,
	'Joe',
	'Schmoe',
	'4242-4242-4242-4242 555 01/20'
);

insert into order_(
	 order_id,
  	 sub_total,
  	 total_cost
) values (
	1,
	30.00,
	34.79
);



insert into movie(
	film_id,
	title,
	rating
) values (
	1,
	'wunderbar',
	'PG-13'
);

insert into ticket(
	ticket_id,
	amount,
	film_id,
	order_id
) values (
	1,
	13.00,
	1,
	1
);

insert into inventory(
	upc,
	product_amount,
	order_id
) values (
	12345678,
	20,
	1
);


insert into concessions(
	item_id,
	amount,
	prod_name,
	upc
) values (
	1,
	5.00,
	'popcorn',
	12345678
);

