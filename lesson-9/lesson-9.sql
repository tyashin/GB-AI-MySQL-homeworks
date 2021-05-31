-- Практическое задание по теме “Транзакции, переменные, представления”

-- 1.В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
-- Используйте транзакции.

use shop;

START TRANSACTION;

INSERT
	INTO
	sample.users
SELECT
	*
FROM
	users
WHERE
	id = 1;

DELETE
FROM
	users
WHERE
	id = 1;

COMMIT;



-- 2. Создайте представление, которое выводит название name товарной позиции из таблицы
-- products и соответствующее название каталога name из таблицы catalogs.

CREATE OR REPLACE
VIEW product_name_and_catalog (product_name,
catalog_name) AS
SELECT
	p.name,
	c.name
FROM
	products AS p
LEFT JOIN catalogs AS c ON
	p.catalog_id = c.id;

SELECT
	*
FROM
	product_name_and_catalog;



-- 3. (по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены
-- разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и
-- 2018-08-17. Составьте запрос, который выводит полный список дат за август, выставляя в
-- соседнем поле значение 1, если дата присутствует в исходной таблице и 0, если она
-- отсутствует.

CREATE TABLE IF NOT EXISTS sparse_dates ( created_at DATE NOT NULL );

INSERT
	INTO
	sparse_dates
VALUES ('2018-08-01'),
('2018-08-04'),
('2018-08-16'),
('2018-08-17');

CREATE TEMPORARY TABLE IF NOT EXISTS august_dates ( id INT,
month_date DATE AS ('2018-08-01' + INTERVAL(id - 1) DAY) STORED );

INSERT INTO august_dates (id) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
(21), (22), (23), (24), (25), (26), (27), (28), (29), (30), (31);

SELECT
	a.month_date AS 'Дата месяца',
	NOT ISNULL(s.created_at) AS 'Есть в исх. таблице'
FROM
	august_dates AS a
LEFT JOIN sparse_dates AS s ON
	a.month_date = s.created_at;



-- 4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте
-- запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих
-- записей.

DROP TABLE IF EXISTS dates_table;
CREATE TABLE IF NOT EXISTS dates_table ( created_at DATE );

INSERT INTO dates_table VALUES
('2021-05-01'),
('2021-05-02'),
('2021-05-03'),
('2021-05-04'),
('2021-05-05'),
('2021-05-06'),
('2021-05-07'),
('2021-05-08'),
('2021-05-09'),
('2021-05-10');

DELETE
FROM
	dates_table AS d
WHERE
	d.created_at NOT IN (
	SELECT
		*
	FROM
		(
		SELECT
			x.created_at
		FROM
			dates_table AS x
		ORDER BY
			x.created_at DESC
		LIMIT 5) AS y);

	
	
-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"
	
-- 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от
-- текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с
-- 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый
-- вечер", с 00:00 до 6:00 — "Доброй ночи".
	
DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello() RETURNS TINYTEXT NO SQL BEGIN DECLARE hour TINYINT;
  SET hour = HOUR(NOW());
  CASE
    WHEN hour BETWEEN 0 AND 5 THEN
      RETURN "Доброй ночи";
    WHEN hour BETWEEN 6 AND 11 THEN
      RETURN "Доброе утро";
    WHEN hour BETWEEN 12 AND 17 THEN
      RETURN "Добрый день";
    WHEN hour BETWEEN 18 AND 23 THEN
      RETURN "Добрый вечер";
  END CASE;
END//
DELIMITER ;

SELECT hello();


-- 2. В таблице products есть два текстовых поля: name с названием товара и description с его
-- описанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля
-- принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь
-- того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям
-- NULL-значение необходимо отменить операцию.

DROP TRIGGER IF EXISTS name_description_before_insert;
DROP TRIGGER IF EXISTS name_description_before_update;

DELIMITER //

CREATE TRIGGER name_description_before_insert BEFORE INSERT ON products
FOR EACH ROW BEGIN
  IF COALESCE(NEW.name, NEW.description) IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null values in product name and description!';  
  END IF;
END//


CREATE TRIGGER name_description_before_update BEFORE UPDATE ON products
FOR EACH ROW BEGIN
  IF COALESCE(NEW.name, NEW.description) IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null values in product name and description!';  
  END IF;
END//

DELIMITER ;


-- 3.Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
-- Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел.
--# Вызов функции FIBONACCI(10) должен возвращать число 55.

DROP FUNCTION IF EXISTS FIBONACCI;
DELIMITER //
CREATE FUNCTION FIBONACCI(n INT)
RETURNS INT DETERMINISTIC
BEGIN
  DECLARE SQR, PHI DOUBLE;
  SET SQR = SQRT(5);
  SET PHI = (SQR + 1) / 2;
 
  RETURN ROUND(POW(PHI, n) / SQR);
END//
DELIMITER ; 

SELECT FIBONACCI(10);


