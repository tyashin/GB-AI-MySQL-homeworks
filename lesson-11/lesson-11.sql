-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
-- catalogs и products в таблицу logs помещается время и дата создания записи, 
-- название таблицы, идентификатор первичного ключа и содержимое поля name.

USE shop;

CREATE TABLE IF NOT EXISTS logs ( id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
row_id INT UNSIGNED NOT NULL,
entry_name VARCHAR(255),
table_name ENUM('users',
'catalogs',
'products') NOT NULL,
created_at datetime DEFAULT CURRENT_TIMESTAMP ) ENGINE = Archive;

DELIMITER //

CREATE TRIGGER users_after_insert AFTER
INSERT
	ON
	users FOR EACH ROW BEGIN
INSERT
	INTO
	logs (row_id,
	entry_name,
	table_name)
VALUES (NEW.id,
NEW.name,
"users");
END//


CREATE TRIGGER catalogs_after_insert AFTER
INSERT
	ON
	catalogs FOR EACH ROW BEGIN
INSERT
	INTO
	logs (row_id,
	entry_name,
	table_name)
VALUES (NEW.id,
NEW.name,
"catalogs");
END//


CREATE TRIGGER IF NOT EXISTS products_after_insert AFTER
INSERT
	ON
	products FOR EACH ROW BEGIN
INSERT
	INTO
	logs (row_id,
	entry_name,
	table_name)
VALUES (NEW.id,
NEW.name,
"products");
END//

DELIMITER ;


-- 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
USE vk;

-- Сначала удалим уникальные индексы по полям 'email' и 'phone', 
-- которые не позволят вставить в таблицу 'users'  неуникальные значения.
ALTER TABLE users DROP INDEX email;
ALTER TABLE users DROP INDEX phone;


-- Если в таблице 'users' 100 записей (как это описывалось на предыдущих занятиях), то для получения 1 млн. записей 
-- достаточно выполнить CROSS JOIN таблицы с самой собой 3 раза.
 INSERT
	INTO
	users(first_name,
	last_name,
	email,
	phone)
SELECT
	u1.first_name,
	u1.last_name,
	u1.email,
	u1.phone
FROM
	users AS u1
CROSS JOIN users as u2
CROSS JOIN users as u3;


-- теперь добавим неуникальные индексы по полям 'email' и 'phone'
CREATE INDEX email ON users(email);  
CREATE INDEX phone ON users(phone);  
