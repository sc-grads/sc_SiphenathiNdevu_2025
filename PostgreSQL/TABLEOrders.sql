--CREATE TABLE orders (
---    id SERIAL PRIMARY KEY,
--    name VARCHAR(40) NOT NULL,
--    created_at TIMESTAMP NOT NULL,
--    est_delivery TIMESTAMP NOT NULL,
 --   CHECK (created_at < est_delivery)
--);
INSERT INTO orders (name, created_at, est_delivery)
VALUES ('Shirt', '2020-11-20 01:00 AM', '2020-11-25 01:00 AM');


