-- п.з. №8: Переписать запросы, заданые к ДЗ урока 6, с использованием JOIN.

USE vk;

-- 1. Создать и заполнить таблицы лайков и постов.
-- Таблица лайков
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type ENUM('messages', 'users', 'posts', 'media') NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Заполняем лайки
INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    CASE
    WHEN FLOOR(RAND()*4) = 0 THEN 'messages'
    WHEN FLOOR(RAND()*4) = 1 THEN 'users'
    WHEN FLOOR(RAND()*4) = 2 THEN 'media'
    WHEN FLOOR(RAND()*4) = 3 THEN 'posts'
    ELSE 'posts'
	END,
    CURRENT_TIMESTAMP 
  FROM messages;

-- Создадим таблицу постов
DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  community_id INT UNSIGNED,
  head VARCHAR(255),
  body TEXT NOT NULL,
  media_id INT UNSIGNED,
  is_public BOOLEAN DEFAULT TRUE,
  is_archived BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Код для заполнения постов - см. файл "posts.sql"

-- 2. Создать все необходимые внешние ключи.
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
      
ALTER TABLE communities_users
  ADD CONSTRAINT communities_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id)
      ON DELETE CASCADE;
      
ALTER TABLE communities_users
  ADD CONSTRAINT communities_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;

ALTER TABLE friendship
  ADD CONSTRAINT friendship_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;

ALTER TABLE friendship
  ADD CONSTRAINT friendship_friend_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id)
      ON DELETE CASCADE;
      
ALTER TABLE friendship
  ADD CONSTRAINT friendship_status_id_fk 
    FOREIGN KEY (friendship_status_id) REFERENCES friendship_statuses(id)
      ON DELETE CASCADE;   
      
ALTER TABLE likes
  ADD CONSTRAINT likes_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;      
      
ALTER TABLE media
  ADD CONSTRAINT media_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;  
      
ALTER TABLE media
  ADD CONSTRAINT media_type_id_fk 
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
      ON DELETE CASCADE;   
      
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id)
      ON DELETE CASCADE; 
      
ALTER TABLE messages
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id)
      ON DELETE CASCADE; 
      
ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE; 
      
 ALTER TABLE posts
  ADD CONSTRAINT posts_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id)
      ON DELETE CASCADE;     
      
  ALTER TABLE posts
  ADD CONSTRAINT posts_media_id_fk 
    FOREIGN KEY (media_id) REFERENCES media(id)
      ON DELETE CASCADE;      
      

-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT 
	gender,
	count(gender) AS  'gender stats'
FROM
    likes
INNER JOIN profiles
    ON likes.user_id = profiles.user_id
GROUP BY gender;

-- 4. Вывести для каждого пользователя количество созданных сообщений, постов, загруженных медиафайлов и поставленных лайков.
SELECT 
	users.id AS 'User id',
	CONCAT(users.first_name, ' ', users.last_name) AS 'Full name',
    count(DISTINCT messages.id) AS 'Messages count',
    count(DISTINCT posts.id) AS 'Posts count',
    count(DISTINCT media.id) AS 'Media count',
    count(DISTINCT likes.id) AS 'Likes count'    
FROM users    
LEFT JOIN messages ON 
		users.id = messages.from_user_id
LEFT JOIN posts  ON 
		users.id = posts.user_id
LEFT JOIN media  ON 
		users.id = media.user_id
LEFT JOIN likes  ON 
		users.id = likes.user_id
GROUP BY users.id
ORDER BY users.id;

