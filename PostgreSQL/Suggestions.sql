WITH RECURSIVE suggestions(leader_id, follower_id, depth) AS (
    -- Initial: who does user 1 follow?
    SELECT leader_id, follower_id, 1 AS depth
    FROM followers
    WHERE follower_id = 1
    
    UNION
    
    -- Recursive: who do those leaders follow?
    SELECT f.leader_id, f.follower_id, s.depth + 1
    FROM followers f
    JOIN suggestions s ON s.leader_id = f.follower_id
    WHERE s.depth < 3
)
SELECT DISTINCT u.id, u.username
FROM suggestions s
JOIN users u ON u.id = s.leader_id
WHERE depth > 1
LIMIT 30;
