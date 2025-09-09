-- CREATE VIEW recent_posts AS (
--     SELECT *
--     FROM posts
--     ORDER BY created_at DESC
--     LIMIT 10
-- );

-- CREATE VIEW tags AS (
--     SELECT id, created_at, user_id, post_id, 'photo_tag' AS type FROM photo_tags
--     UNION ALL
--     SELECT id, created_at, user_id, post_id, 'caption_tag' AS type FROM caption_tags
-- );

-- CREATE OR REPLACE VIEW recent_posts AS (
--     SELECT *
--     FROM posts
--     ORDER BY created_at DESC
--     LIMIT 15
-- );

DROP VIEW recent_posts;
