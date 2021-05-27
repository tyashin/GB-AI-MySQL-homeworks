USE shop_07;


-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
SELECT
	DISTINCT u.id AS 'User id',
	u.name AS 'User name'
FROM
	users AS u
JOIN orders ON
	u.id = orders.user_id;


-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT
	p.id AS 'Product id',
	p.name AS 'Product',
	c.name AS 'Catalog'
FROM
	products AS p
LEFT JOIN catalogs as c ON
	p.catalog_id = c.id;


-- 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label,
-- name). Поля from, to и label содержат английские названия городов, поле name — русское.
-- Выведите список рейсов flights с русскими названиями городов.
use airport_01;

SELECT
	f.id AS 'Flight id',
	c1.name AS 'From',
	c2.name AS 'To'
FROM
	flights AS f
JOIN cities AS c1 ON
	f.from = c1.label
JOIN cities as c2 ON
	f.to = c2.label
ORDER BY
	f.id;
