SELECT contents, username
FROM COMMENTS
JOIN users ON users.id = comments.user_id;