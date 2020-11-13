USE shop;

-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в
-- интернет магазине.

-- Создадим таблицу users покупателей интернет-магазина
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

-- Заполним таблицу пользователей магазина.
INSERT INTO users (name, birthday_at, created_at, update_at) VALUES
  ('Стас Михайлов', '1998-04-12', NOW(), NOW()),
  ('Сергей Немец', '1988-03-19', NOW(), NOW()),
  ('Влад Сташевский', '1926-05-30', NOW(), NOW()),
  ('Филип Мамонтов', '2000-08-27', NOW(), NOW()),
  ('Александр Коркунов', '1968-09-12', NOW(), NOW());
 
SELECT * FROM users;
 
-- Создадим таблицу заказов.
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
KEY index_of_user_id(user_id)
) COMMENT = 'Заказы';
 
-- Встиавим id пользователей, сделавших хотябы один заказ.
INSERT INTO orders (user_id, created_at, update_at) VALUES
  ('1', NOW(), NOW()),
  ('3', NOW(), NOW()),
  ('5', NOW(), NOW());
 
SELECT user_id FROM orders;
SELECT * FROM orders;

-- Вариант 1
-- Выведем список покупателей 
SELECT
  id, name
FROM
  users
WHERE
   id IN (SELECT user_id FROM orders);
   
-- Вариант 2 c JOIN
-- Выведем список покупателей 
  
SELECT
  orders.user_id, users.name
FROM
  users
JOIN
  orders
WHERE 
  users.id = orders.user_id;
  
================================================================================================================================

-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

-- Создадим таблицу "Разделы интернет магазина"
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет магазина';

-- Вставим данные
INSERT INTO​ catalogs VALUES
  (DEFAULT​, 'Процессоры'),
  (​DEFAULT​,​ 'Мат.платы'​),
  (​DEFAULT,​ 'Видеокарты'​);
 
SELECT * FROM catalogs;

-- Создадим таблицу "Торговые позиции"
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Торговые позиции';


-- Добавим данные в таблицу 
INSERT INTO products (name, description, price, catalog_id) VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров,
  основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров,
  основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров,
  основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров,
  основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO,
  Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket
  1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250,
  Socket 1151, DDR4, mATX', 5060.00, 2),
  ('GEFORCE RTX 3070', 'Видеокарта GEFORCE RTX 3070', 45490.00, 3),
  ('GEFORCE RTX 3070', 'Видеокарта GEFORCE RTX 3080', 80490.00, 3),
  ('GEFORCE RTX 3070', 'Видеокарта GEFORCE RTX 3090', 100000.00, 3);

SELECT * FROM products;

-- Вариант 1
-- Теперь выведем список товаров и соответствующих разделов из каталога.
SELECT 
    products.id,
    products.name,
    (SELECT catalogs.name FROM catalogs WHERE catalogs.id = products.catalog_id) AS 'catalog'
FROM products;

-- Вариант 2 c JOIN 
SELECT 
  products.id, products.name, catalogs.name
FROM 
  catalogs
JOIN
  products
WHERE
  catalogs.id = products.catalog_id;

============================================================================================================================

-- 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label,
-- name). Поля from, to и label содержат английские названия городов, поле name — русское.
-- Выведите список рейсов flights с русскими названиями городов.

CREATE DATABASE flight;
USE flight;

-- Создадим таблицу рейсов
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  from_flight VARCHAR(255) COMMENT 'Город вылета',
  to_flight VARCHAR(255) COMMENT 'Город прилета',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Рейсы';

DESC flights;

-- Заполним таблицу.
INSERT INTO flights (from_flight, to_flight) VALUES
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');
 
SELECT * FROM flights;

-- Создадим таблицу городов.
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  label VARCHAR(255) COMMENT 'Название на английском',
  name VARCHAR(255) COMMENT 'Название на русском',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Название городов на русском';

DESC cities;

INSERT INTO cities (label, name) VALUES
  ('moscow', 'Москва'),
  ('irkutsk', 'Иркутск'),
  ('novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');

SELECT * FROM cities;

-- Вариант 1
-- Составим запрос, который заменит английские название городов на русские.
SELECT
  id,
  (SELECT name FROM cities WHERE from_flight = label) AS 'Вылет из города',
  (SELECT name FROM cities WHERE to_flight = label) AS 'Прилёт в город'
FROM flights;


-- Вариант 2 c JOIN
SELECT
  flights.id,
  citi_fr.name AS 'Вылет из города',
  citi_to.name AS 'Прилёт в город'
FROM
  flights
JOIN 
  cities AS citi_fr
ON 
  flights.from_flight = citi_fr.label
JOIN 
  cities AS citi_to
ON 
  flights.to_flight = citi_to.label
ORDER BY
  flights.id;
 
-- и еще вопрос: с WHERE условие не работает, а с ON без проблем.
-- Вот что выдало по WHERE
/*
  SQL Error [1064] [42000]: You have an error in your SQL syntax; check the manual that corresponds to your MySQL 
  server version for the right syntax to use near 'JOIN cities AS citi_to
WHERE 
  fl.to_flight = citi_to.label
ORDER BY
  fl.id' at line 12
 */
 
 
=============================================================================================================