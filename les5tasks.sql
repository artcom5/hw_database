CREATE DATABASE les5;
USE les5;

-- ОПЕРАТОРЫ, ФИЛЬТРАЦИЯ, СОРТИРОВКА И ОГРАНИЧЕНИЕ.
/*
  1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их
текущими датой и временем.
 */

-- Создадим таблицу users.
CREATE TABLE users (
  id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) COMMENT 'Покупатель',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создание строки",
  update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT 'Покупатели';

-- Добавим столбец 'Фамилия'.
ALTER TABLE users ADD COLUMN surname VARCHAR(255) 
  COMMENT "Фамилия" AFTER name;
 
-- Заполним таблицу данными.
INSERT INTO users (name, surname, birthday_at, created_at, update_at) VALUES
('Шурочка', 'Каретный', '2004-04-06', NULL, NULL),
('Сергей', 'Выдрин', '2000-11-23', NULL, NULL),
('Никита', 'Спец', '1985-08-08', NULL, NULL);

-- Просмотрим содержимое таблицы.
SELECT * FROM users;

-- Заполним поля created_at, update_at.
UPDATE users SET created_at = NOW(), update_at = NOW();

-- Просмотрим содержимое таблицы.
SELECT * FROM users;

/*
 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы
типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10.
Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
 */

-- Удалим все записи.
DELETE FROM users;

ALTER TABLE users MODIFY COLUMN created_at VARCHAR(255);
ALTER TABLE users MODIFY COLUMN update_at VARCHAR(255);

-- Заполним таблицу данными.
INSERT INTO users (name, surname, birthday_at, created_at, update_at) VALUES
('Шурочка', 'Каретный', '2004-04-06', '20.10.2017 12:06', '25.11.2018 16:02'),
('Сергей', 'Выдрин', '2000-11-23', '11.09.2018 19:00', '25.11.2018 1:10'),
('Никита', 'Спец', '1985-08-08', '01.12.2019 2:28', '30.12.2019 20:56');

-- Просмотрим содержимое таблицы.
SELECT * FROM users;

-- Преобразуем данные столбцов
UPDATE users SET 
  created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
  update_at = STR_TO_DATE(update_at, '%d.%m.%Y %k:%i');

-- Просмотрим содержимое таблицы.
SELECT * FROM users;

-- Вносим изменения
ALTER TABLE users MODIFY COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создание строки";
ALTER TABLE users MODIFY COLUMN update_at
  DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки";

 -- Просмотрим структуру таблицы
 DESC users;


/*
 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые
разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы.
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке
увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.
 */

-- Воссоздадим таблицу из методички
CREATE TABLE storehouses_products (
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
storehouses_id INT UNSIGNED COMMENT 'Ссылка на склады',
product_id INT UNSIGNED COMMENT 'Ссылка на товарные позиции',
value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

-- Просмотрим структуру таблицы
 DESC storehouses_products;

-- Заполним таблицу данными.
INSERT INTO storehouses_products (storehouses_id, product_id, value) VALUES
  (1, 456, 67),
  (1, 1000, 0),
  (1, 567, 4),
  (1, 23, 12),
  (1, 102, 5);

-- Просмотрим содержимое таблицы.
SELECT * FROM storehouses_products;

-- Отсортируем по столбцу value
SELECT * FROM storehouses_products ORDER BY value;

-- Отсортируем выполнив условие
SELECT id, value, IF(value > 0, 0, 1) AS total FROM storehouses_products ORDER BY value;
SELECT * FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;

/*
 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и
мае. Месяцы заданы в виде списка английских названий (may, august)
 */

-- Просмотрим содержимое таблицы.
SELECT * FROM users;

-- При помощи функции DATE_FORMAT возьмем месяц рождения.
SELECT name, DATE_FORMAT(birthday_at, '%M') FROM users;

-- Добавим еще одного пользователя.
INSERT INTO users (name, surname, birthday_at) VALUES
('Анна', 'Попова', '2001-05-04');

SELECT name FROM users WHERE DATE_FORMAT(birthday_at, '%M') IN ('may', 'august'); 


/*
 5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM
catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
 */

-- Воссоздадим таблицу из методички.
CREATE TABLE catalogs (
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет магазина';


-- Заполним таблицу данными.
INSERT INTO catalogs (name) VALUES
('Дорожные знаки'),
('Световозвращающая плёнка'),
('Хомуты'),
('Метизы');

INSERT INTO catalogs (name) VALUES
('Катафоты');


-- Просмотрим содержимое таблицы.
SELECT * FROM catalogs;

-- Извлекаем записи 5, 1, 2
SELECT * FROM catalogs WHERE id IN (5, 1, 2);

-- Пронумеруем строки
SELECT  id, name, FIELD(id, 5, 1, 2) AS pos FROM catalogs WHERE id IN (5, 1, 2);

-- Отсортируем таблицу по столбцу pos
SELECT  * FROM catalogs c  WHERE id IN (5, 1, 2) ORDER BY FIELD (id, 5, 1, 2);


---------------------------------------------------------------------------------

-- АГРЕГАЦИЯ ДАННЫХ

/*
 1. Подсчитайте средний возраст пользователей в таблице users.
 */

-- Просмотрим содержимое таблицы.
SELECT * FROM users;

-- Считаем возраст
SELECT TIMESTAMPDIFF(YEAR, birthday_at, NOW()) AS age FROM users;

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age FROM users;


/*
 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
Следует учесть, что необходимы дни недели текущего года, а не года рождения. 
 */

-- Просмотрим содержимое таблицы.
SELECT name, birthday_at FROM users;

-- Получим месяцы и дни
SELECT MONTH(birthday_at), DAY(birthday_at) FROM users;

-- Получим года, месяцы и дни
SELECT YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at) FROM users;

-- Объединим значения в дату формата 2020-12-23
SELECT CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at)) AS total FROM users; 

-- Приведем к формату DATE
SELECT DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))) AS total FROM users; 


SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS total FROM users;

SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS total FROM users GROUP BY total;

SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W')
  AS total, COUNT(*) AS item FROM users GROUP BY total;
 
SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W')
  AS total, COUNT(*) AS item FROM users GROUP BY total ORDER BY item DESC;
 
/*
 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы.
 */ 
 
-- Просмотрим содержимое таблицы.
SELECT * FROM catalogs;

-- Вычислим
SELECT ROUND(EXP(SUM(LN(id)))) FROM catalogs;
 















