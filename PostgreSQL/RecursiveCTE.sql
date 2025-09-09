WITH RECURSIVE countdown(val) AS (
    SELECT 50 AS val
    UNION
    SELECT val - 1 FROM countdown WHERE val > 1
)
SELECT *
FROM countdown;