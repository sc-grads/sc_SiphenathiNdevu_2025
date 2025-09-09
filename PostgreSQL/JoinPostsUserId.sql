SELECT username, caption
FROM users
JOIN posts ON posts.user_id = users.id
WHERE users.id = 200;