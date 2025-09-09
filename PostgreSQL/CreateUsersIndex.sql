--CREATE INDEX users_username_idx ON users (username);

--Drop index users_username_idx;

--EXPLAIN ANALYZE SELECT *
--FROM users
--WHERE username = 'Emil30';

SELECT pg_size_pretty(pg_relation_size('users_username_idx'))