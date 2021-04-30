use vk;
UPDATE users SET updated_at = now() WHERE updated_at < created_at;
UPDATE communities SET updated_at = now() WHERE updated_at < created_at;
UPDATE friendship SET updated_at = now() WHERE updated_at < created_at;
UPDATE friendship_statuses SET updated_at = now() WHERE updated_at < created_at;
UPDATE media SET updated_at = now() WHERE updated_at < created_at;
UPDATE media_types SET updated_at = now() WHERE updated_at < created_at;
UPDATE profiles SET updated_at = now() WHERE updated_at < created_at;

DROP TABLE IF EXISTS extensions;
CREATE TEMPORARY TABLE extensions (name VARCHAR(10));
INSERT INTO extensions VALUES ('jpeg'), ('mp4'), ('mp3'), ('avi'), ('png');

UPDATE media SET filename = CONCAT(
  'http://yandeskdisk.ru/9p283yrp982ypry2/vk/',
  filename,
  '.',
  (SELECT name FROM extensions ORDER BY RAND() LIMIT 1)
);
UPDATE media SET size = FLOOR(10000 + (RAND() * 1000000)) WHERE size < 1000;
UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}'); 
ALTER TABLE media MODIFY COLUMN metadata JSON;

UPDATE friendship SET confirmed_at = now() WHERE confirmed_at < created_at;

TRUNCATE friendship_statuses;
INSERT INTO friendship_statuses (name) VALUES
  ('Requested'),
  ('Confirmed'),
  ('Rejected');
  
DELETE FROM communities WHERE id > 30;

DELETE FROM communities_users WHERE community_id > 30;


