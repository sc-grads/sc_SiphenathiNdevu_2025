SELECT *
FROM products 
ORDER BY price ASC;
-------------------
SELECT *
FROM products 
ORDER BY name ASC;
------------Two variation on strings
SELECT *
FROM products 
ORDER BY price, weight;
-------------
--SELECT *
--FROM users
--LIMIT 999;
SELECT *
FROM products
ORDER BY price
LIMIT 5;

--SELECT *
--FROM users
--LIMIT 999;
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

--SELECT *
--FROM users
--LIMIT 999;
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5
OFFSET 1;