--ALTER TABLE products
--ALTER COLUMN price
--SET NOT NULL

--Update products
--SET price = 9999
--WHERE price is NULL

--ADD Check
ALTER TABLE products
ADD Check (price>0)