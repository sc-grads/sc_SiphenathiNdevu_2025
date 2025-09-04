SELECT photo_id, COUNT(*)
FROM COMMENTS
WHERE photo_id < 3
GROUP BY photo_id
HAVING COUNT(*) > 2;

--SELECT photo_id, COUNT(*)
--FROM COMMENTS
--WHERE photo_id < 3
--GROUP BY photo_id
--HAVING COUNT(*) > 2;

SELECT user_id, COUNT(*)
FROM COMMENTS
WHERE photo_id < 50
GROUP BY user_id
HAVING COUNT(*) > 20;