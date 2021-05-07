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

-- Временная таблица типов лайков
DROP TABLE IF EXISTS target_types;
CREATE TEMPORARY TABLE target_types (
  name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');

-- Заполняем лайки
INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    (SELECT name FROM target_types ORDER BY RAND() LIMIT 1),
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

-- 2. Создать все необходимые внешние ключи и диаграмму отношений.
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
      

      
      
      
      
      
      
      

-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

-- 4. Вывести для каждого пользователя количество созданных сообщений, постов, загруженных медиафайлов и поставленных лайков.

  