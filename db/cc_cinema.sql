-- DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  funds INT4 NOT NULL
);

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  price INT4 NoT NULL
);

-- CREATE TABLE tickets (
--   id SERIAL4 PRIMARY KEY,
--   customer_id INT4 REFERENCES customer(id) ON DELETE CASCADE,
--   film_id INT4 REFERENCES film(id) ON DELETE CASCADE
-- );
