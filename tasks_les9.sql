-- Практическое задание по теме “Транзакции, переменные, представления”

-- 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте
-- транзакции.

CREATE DATABASE sample;
USE sample;

CREATE TABLE users (
id SERIAL PRIMARY KEY,
name VARCHAR(255) COMMENT 'Имя покупателя',
birthday_at DATE COMMENT 'Дата рождения',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

USE shop;
SELECT * FROM users;

START TRANSACTION;
INSERT INTO sample.users (SELECT * FROM shop.users WHERE id = 1);
DELETE FROM shop.users WHERE id = 1;
COMMIT;


==============================================================================================
-- 2. Создайте представление, которое выводит название name товарной позиции из таблицы
-- products и соответствующее название каталога name из таблицы catalogs.

USE shop;
SELECT * FROM catalogs;
SELECT * FROM products;

SELECT products.name, catalogs.name
FROM products
JOIN catalogs
ON catalogs.id = products.catalog_id;

CREATE VIEW name AS
SELECT products.name AS 'Продукт', catalogs.name AS 'Категория'
FROM products
JOIN catalogs
ON catalogs.id = products.catalog_id;

SELECT * FROM name;

==============================================================================================
-- 3. по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены
-- разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и
-- 2018-08-17. Составьте запрос, который выводит полный список дат за август, выставляя в
-- соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она
-- отсутствует.

CREATE TABLE dates (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  created_at DATE
 );

SELECT * FROM dates;

INSERT INTO dates (created_at) VALUES
  (NULL);
UPDATE dates SET created_at = '2018-08-01' WHERE id=1; 
UPDATE dates SET created_at = '2016-08-04' WHERE id=4;
UPDATE dates SET created_at = '2018-08-16' WHERE id=16; 
UPDATE dates SET created_at = '2018-08-17' WHERE id=17;

-- Запрос, который выводит полный список дат с логикой. 
SELECT
  created_at,
  (IF(created_at, 1, 0)) AS total
  FROM dates;
 
==============================================================================================
-- 4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. 
-- Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя 
-- только 5 самых свежих записей.

-- Создадим базу данных.
CREATE DATABASE users;
USE users;

-- Создадим таблицу пользователей из vk.
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор строки',
  first_name VARCHAR(100) NOT NULL COMMENT 'Имя пользователя',
  last_name VARCHAR(100) NOT NULL COMMENT 'Фамилия пользователя',
  email VARCHAR(150) NOT NULL UNIQUE COMMENT 'Почта',
  phone VARCHAR(20) NOT NULL UNIQUE COMMENT 'Телефон',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления'
) COMMENT 'Пользователи';

-- Заполним данными из vk.
INSERT INTO users VALUES (1,'Jenifer','Hahn','ureichert@example.net','002-597-4487x107','2000-09-08 13:13:50','2021-01-29 12:59:14'),(2,'Shana','Kutch','mayer.gilbert@example.org','(920)692-1530x466','1990-05-26 08:45:15','1991-01-25 00:55:07'),(3,'Maxine','Kshlerin','alyce96@example.net','673-621-4099','1973-09-08 07:44:27','1985-04-02 20:06:19'),(4,'Aron','Boyer','cborer@example.net','042-752-5087','2002-08-06 02:23:45','2021-01-29 12:59:14'),(5,'Deven','Langworth','brenner@example.com','+58(1)6842368764','1982-12-27 04:04:01','1998-08-11 10:13:04'),(6,'Steve','Purdy','alford23@example.net','838.404.6872','1980-10-31 22:59:47','2000-06-01 17:58:38'),(7,'Vickie','Keebler','kennedy.schoen@example.net','+19(4)1740895490','1988-01-07 19:56:44','2002-05-23 04:11:32'),(8,'Ruben','Luettgen','mleffler@example.net','1-144-983-2524x81795','2020-09-27 13:28:31','2021-01-29 12:59:14'),(9,'Cristian','Hilll','ichristiansen@example.com','1-531-857-9203x0462','2001-03-05 21:32:19','2012-05-05 01:11:37'),(10,'Jayde','Wunsch','ofranecki@example.com','+49(0)8946872309','1989-02-23 18:09:58','2021-01-29 12:59:14'),(11,'Rhianna','Muller','ryan.leland@example.com','(554)740-1535','1980-03-06 09:13:11','2021-01-29 12:59:14'),(12,'Annette','Halvorson','susanna.yundt@example.org','(717)705-9756x42280','1998-05-31 17:24:21','2021-01-29 12:59:14'),(13,'Narciso','Lockman','lkrajcik@example.com','(136)255-2428x926','1987-10-05 19:42:40','2021-01-29 12:59:14'),(14,'Alene','Dare','anderson.dorcas@example.com','170.849.7857x0353','2015-03-08 09:09:41','2019-03-05 14:26:42'),(15,'Leonie','Olson','jedediah.cartwright@example.org','1-095-106-4326','1985-09-08 02:17:28','1987-12-13 03:52:20'),(16,'August','Schmitt','hank47@example.com','+56(6)2366060853','1997-01-11 10:02:24','2021-01-29 12:59:14'),(17,'Augustus','O\'Kon','lorenza68@example.com','338-627-8040x6414','1994-06-28 19:23:18','1995-08-25 02:09:34'),(18,'Daphne','Hilpert','eleffler@example.com','139-373-8011','1972-07-14 03:57:12','1972-11-11 23:23:47'),(19,'Kraig','Murray','littel.meaghan@example.com','106-985-5638','1983-12-24 14:01:07','1986-12-21 07:57:23'),(20,'Jacquelyn','Moore','peggie68@example.com','1-292-285-5843','2011-01-30 04:16:12','2021-01-29 12:59:14'),(21,'Syble','Kris','yost.rex@example.net','1-773-623-8560x56634','1974-05-18 00:03:12','2006-01-17 17:04:36'),(22,'Rosario','Kassulke','forrest08@example.net','(721)680-1294x1222','1980-10-27 01:09:28','2013-05-10 19:25:35'),(23,'Katrina','Greenholt','dickinson.charity@example.com','180-482-6936x4311','2007-08-17 15:12:10','2021-01-29 12:59:14'),(24,'Saul','Spinka','cbeier@example.org','1-380-742-0159x852','2007-06-07 23:05:08','2021-01-29 12:59:14'),(25,'Hilario','Braun','minnie25@example.org','734-994-7976x19769','1983-07-04 22:53:41','2021-01-29 12:59:14'),(26,'Marco','Ritchie','delphia.altenwerth@example.net','063-401-9462','1988-05-09 12:26:31','2018-11-01 14:08:55'),(27,'Layne','Ruecker','neha40@example.net','596.830.1959x5760','1994-06-13 06:37:08','2021-01-29 12:59:14'),(28,'Susanna','Harris','daugherty.uriel@example.net','891-565-9287','2016-10-27 16:12:23','2021-01-29 12:59:14'),(29,'Taya','Little','ajones@example.org','(851)774-4740x2884','2009-10-26 05:22:32','2021-01-29 12:59:14'),(30,'Nicholaus','Wisozk','doyle.genoveva@example.org','(065)545-0782x674','2001-04-03 15:20:53','2021-01-29 12:59:14'),(31,'Kris','Thompson','hayden63@example.net','692.562.6010x24881','2007-10-03 12:32:44','2021-01-29 12:59:14'),(32,'Stanley','Langworth','vmacejkovic@example.com','160.947.8274x1971','1980-12-03 12:39:37','1995-02-23 04:27:15'),(33,'Jaron','Satterfield','zander14@example.com','131.156.3594x15225','1989-07-28 04:44:14','2020-03-08 01:50:46'),(34,'Brady','Monahan','glesch@example.net','1-464-829-2347x98473','1990-10-13 13:15:30','2020-07-28 15:26:19'),(35,'Keyshawn','Quitzon','kbecker@example.org','214-859-8463x604','1993-07-20 09:14:25','2010-07-02 07:44:23'),(36,'Joannie','Cole','khomenick@example.org','592-764-8174x20315','1997-11-13 11:09:18','2001-08-21 11:13:20'),(37,'Gust','Osinski','bahringer.shanon@example.org','459-797-0777','1979-11-04 17:22:48','2021-01-29 12:59:14'),(38,'Irving','Zulauf','muller.maximus@example.net','(406)425-7195x36244','1971-01-05 23:34:40','1993-07-05 08:32:51'),(39,'Dorthy','Littel','arne.heathcote@example.com','262-741-0500','1998-10-14 19:11:57','1999-12-30 21:03:21'),(40,'Abdiel','Wehner','kohler.arne@example.org','730-298-9252x2075','1974-01-31 04:34:58','2007-04-06 17:48:01'),(41,'Juana','Pfannerstill','keshawn04@example.net','817-032-1609','2012-11-12 02:01:14','2019-03-26 12:16:28'),(42,'Louvenia','Gorczany','roslyn.d\'amore@example.net','(124)282-9052','2000-04-09 18:25:02','2003-04-18 03:39:50'),(43,'Amos','Konopelski','schmeler.tracy@example.org','807-953-4620x4352','2001-10-09 03:33:07','2009-08-22 16:29:40'),(44,'Nikolas','Howe','kiel.marks@example.com','918.601.7204x369','1989-06-18 02:20:34','2019-03-25 13:31:54'),(45,'Wava','Kuhlman','hank26@example.net','1-714-503-4610x020','1994-04-03 14:54:25','2013-12-27 02:54:39'),(46,'Dante','Dooley','kirlin.toney@example.com','(306)643-3061','1990-09-25 17:26:36','2021-01-29 12:59:14'),(47,'Brandi','Mills','gisselle94@example.org','523.269.2981x64770','1971-02-01 15:13:54','1995-08-26 11:03:04'),(48,'Shyann','Weber','marcelina37@example.net','1-990-831-5177','1978-11-23 11:48:28','2021-01-29 12:59:14'),(49,'Jeff','Johns','luna99@example.net','1-051-902-0749x069','2003-04-26 02:25:44','2021-01-29 12:59:14'),(50,'Zora','Borer','ryan47@example.org','+20(5)0464003713','2002-03-31 05:04:19','2011-12-27 06:14:41'),(51,'Michele','Carroll','jena.medhurst@example.org','08307213914','1974-05-09 10:04:51','2014-03-03 14:48:11'),(52,'Cole','Zulauf','cparker@example.com','1-460-819-7821x430','1990-02-02 03:47:25','2021-01-29 12:59:14'),(53,'Ansley','Mosciski','geoffrey.balistreri@example.net','1-676-989-5577x2103','1995-07-19 05:28:53','1996-07-31 04:39:06'),(54,'Ayden','Beatty','white.lila@example.com','1-870-922-1436','2019-05-16 14:45:08','2021-01-29 12:59:14'),(55,'Nova','Leannon','trantow.chaya@example.com','1-466-319-1042x15713','1988-12-26 11:12:21','1994-03-29 22:23:32'),(56,'Myah','Mayert','lfay@example.com','092-052-7190x21858','1983-02-04 20:35:53','2021-01-29 12:59:14'),(57,'Okey','Paucek','robert.smith@example.com','(180)707-4826','2003-03-20 04:36:01','2021-01-29 12:59:14'),(58,'Estell','Glover','blebsack@example.com','1-892-509-2106','1986-01-30 11:08:40','2011-02-22 19:54:48'),(59,'Stuart','Spinka','armstrong.noemy@example.com','1-808-197-7242x52592','1983-11-20 10:46:17','2021-01-29 12:59:14'),(60,'Weston','Marks','bahringer.tillman@example.com','036-505-7016','2002-01-22 11:46:53','2021-01-29 12:59:14'),(61,'Dianna','Beatty','naomie37@example.net','02040106566','1976-03-23 08:02:32','2017-09-04 02:30:36'),(62,'Beverly','Quitzon','estefania92@example.net','1-281-637-7824x526','1972-10-31 01:33:40','2018-12-18 19:32:44'),(63,'Dillon','Boyer','berniece44@example.com','078.418.0658x73779','2005-07-11 07:24:42','2006-01-19 03:28:51'),(64,'Cierra','Macejkovic','nolan.randi@example.net','(510)701-2343','2003-02-17 22:59:39','2021-01-29 12:59:14'),(65,'Abagail','Cronin','william.swaniawski@example.com','249.466.0928x966','1986-02-26 10:15:14','2019-06-05 17:01:03'),(66,'Demetrius','Welch','patsy.leannon@example.com','(560)565-8955','2018-10-28 03:43:32','2021-01-29 12:59:14'),(67,'Ludwig','Johnson','flemke@example.org','838.724.7230x2076','1986-04-11 03:31:14','2019-04-25 16:52:40'),(68,'Fae','Bayer','filiberto46@example.com','+48(7)2336544645','2002-01-29 21:37:03','2019-09-22 13:22:36'),(69,'Chyna','Franecki','harry.tillman@example.com','08340146486','2020-06-16 00:20:17','2021-01-29 12:59:14'),(70,'Gaston','Koepp','lavina60@example.net','1-288-121-7766x68190','2019-09-04 10:41:37','2021-01-29 12:59:14'),(71,'Armand','Yundt','mitchel.rice@example.org','649.285.3240','1989-08-16 01:36:49','1994-01-26 02:51:19'),(72,'Jaime','Lehner','sandrine24@example.org','06279174976','1970-09-09 18:18:10','2014-08-01 16:48:03'),(73,'Rodrick','Klocko','tre78@example.net','688.569.2713x62970','2014-01-03 03:55:21','2021-01-29 12:59:14'),(74,'Ellsworth','Lubowitz','bgleichner@example.net','1-240-950-4590x9921','1987-05-29 04:58:52','1996-03-17 15:41:55'),(75,'Domenick','Trantow','udubuque@example.org','162-354-7504','2020-11-18 17:12:21','2021-01-29 12:59:14'),(76,'Estelle','Mayer','ugerhold@example.com','736-516-4955x00570','2001-02-18 21:52:31','2016-01-24 01:23:26'),(77,'Jeromy','White','schimmel.catalina@example.com','076-272-4285','2001-12-22 22:44:15','2021-01-29 12:59:14'),(78,'Karina','Schiller','wilfred25@example.org','693-133-8098x35017','2017-03-28 11:44:17','2021-01-29 12:59:14'),(79,'Jerrell','Daugherty','bruen.mose@example.com','765-974-5383x794','2005-01-09 14:25:37','2021-01-29 12:59:14'),(80,'Dell','Heller','uferry@example.org','1-082-596-4761x534','1986-11-21 15:26:34','2021-01-29 12:59:14'),(81,'Rosalind','Konopelski','ludwig01@example.com','1-744-150-8971x4543','1994-11-02 19:17:05','2021-01-29 12:59:14'),(82,'Astrid','Davis','mertz.sammie@example.com','(251)356-9672','2002-07-16 01:35:42','2009-06-25 10:21:12'),(83,'Theo','Schmidt','dickinson.bridget@example.org','363.561.5251','2018-07-28 20:20:20','2021-01-29 12:59:14'),(84,'Janae','Moore','rylee.ziemann@example.org','1-752-942-3815','2011-05-24 17:03:55','2015-01-12 14:27:03'),(85,'Ayla','McClure','nleffler@example.net','+43(4)5515765562','2011-01-03 06:03:04','2021-01-29 12:59:14'),(86,'Estel','Mohr','malinda57@example.org','929.402.6337x296','2003-09-18 07:27:08','2021-01-29 12:59:14'),(87,'Cristian','Jakubowski','fmueller@example.net','(650)354-8233x14007','1984-09-25 02:47:30','2001-10-10 15:50:09'),(88,'Nicholaus','Hirthe','cole.trenton@example.net','1-563-980-0418x30533','2017-12-30 16:38:01','2021-01-29 12:59:14'),(89,'Emile','Ziemann','reginald.waters@example.net','679.590.6007','2011-01-03 20:28:27','2021-01-29 12:59:14'),(90,'Philip','Sanford','milo.hane@example.com','(529)176-3743x2991','2014-01-05 20:38:41','2017-10-17 05:45:23'),(91,'Enrique','Kautzer','rodriguez.allie@example.com','1-193-035-6771x9203','1978-04-10 01:20:11','2000-07-01 13:20:47'),(92,'Jeffery','Gutkowski','torphy.jaime@example.org','1-405-692-8016x2041','2017-08-31 12:40:02','2021-01-29 12:59:14'),(93,'Lempi','Hoeger','monty22@example.com','605-823-9747x2463','1982-11-13 16:52:53','2017-04-01 02:39:52'),(94,'Carmine','Blanda','christiansen.sheldon@example.net','506-154-8722x83508','2006-04-28 19:57:26','2021-01-29 12:59:14'),(95,'Samantha','Lakin','kris.cleveland@example.org','1-176-687-6432','1978-07-24 08:12:42','2017-09-15 23:46:14'),(96,'Ressie','Baumbach','bradford60@example.com','(317)653-6380','2013-01-07 00:28:41','2021-01-29 12:59:14'),(97,'Nettie','Runolfsson','lulu.kreiger@example.com','(643)848-2682x808','1995-04-27 10:57:54','2021-01-29 12:59:14'),(98,'Daren','Russel','tdickens@example.com','261.235.2461','2016-08-02 04:29:03','2021-01-29 12:59:14'),(99,'Bobbie','Kautzer','maximillia.bogisich@example.com','(044)153-4128','2012-02-06 16:33:19','2021-01-29 12:59:14'),(100,'Jenifer','Shields','zachary92@example.net','905.103.5489x51941','1978-09-29 12:15:23','2011-03-09 08:14:05');

-- Создадим представление в котором хранится список 5 самых свежих записи.
CREATE VIEW sort AS 
SELECT * FROM users ORDER BY created_at DESC LIMIT 5;

SELECT * FROM sort;

-- Удалим те записи, которые не входят в это представление.
DELETE FROM users WHERE created_at NOT IN (SELECT created_at FROM sort);

-- Проверим.
SELECT * FROM users ORDER BY created_at DESC;

-- Удалим предсталение.
DROP VIEW sort;

==============================================================================================

-- Практическое задание по теме “Хранимые процедуры и функции, триггеры”

-- 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от
--    текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
--    с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — 
--    "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DELIMITER //
CREATE PROCEDURE hello()
  BEGIN
    IF (CURTIME() BETWEEN '06:00:00' AND '12:00:00') THEN 
      SELECT 'Доброе утро!';
    ELSEIF (CURTIME() BETWEEN '12:00:01' AND '18:00:00') THEN 
      SELECT 'Добрый день!';
    ELSEIF (CURTIME() BETWEEN '18:00:01' AND '00:00:01') THEN 
      SELECT 'Добрый вечер!';
    ELSE
      SELECT 'Доброй ночи!';
  END IF;	
END//
DELIMITER ;

CALL hello();

DELIMITER //
CREATE FUNCTION hello()
RETURNS VARCHAR(20) DETERMINISTIC
  BEGIN
	IF (CURTIME() BETWEEN '06:00:00' AND '12:00:00') THEN 
      RETURN 'Доброе утро!';
    ELSEIF (CURTIME() BETWEEN '12:00:01' AND '18:00:00') THEN 
      RETURN 'Добрый день!';
    ELSEIF (CURTIME() BETWEEN '18:00:01' AND '00:00:01') THEN 
      RETURN 'Добрый вечер!';
    ELSE
      RETURN 'Доброй ночи!';
  END IF;	
END//
DELIMITER ;

SELECT hello();

==============================================================================================
-- 2. В таблице products есть два текстовых поля: name с названием товара и description с его 
--    описанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля 
--    принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того,
--    чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям 
--    NULL-значение необходимо отменить операцию.

USE shop21;
SELECT * FROM products;

DROP TRIGGER name_desc;

DELIMITER //
CREATE TRIGGER name_desc BEFORE INSERT ON products
FOR EACH ROW
  BEGIN
	  IF (NEW.name IS NULL AND NEW.description IS NULL) THEN 
	  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вставка NULL не возможна!';
	  END IF;
  END//
DELIMITER ;

INSERT INTO products 
  (id, name , description, price, catalog_id, created_at, updated_at)
  VALUES
    (NULL, NULL, NULL, 12000, 1, NOW(), NOW()); 

  SELECT * FROM products;

==============================================================================================
-- 3. (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
--    Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих
--    чисел. Вызов функции FIBONACCI(10) должен возвращать число 55.

DELIMITER //
DROP FUNCTION IF EXISTS FIBONACCI//
CREATE FUNCTION FIBONACCI(value INT)
  RETURNS INT DETERMINISTIC
  BEGIN
	  DECLARE a_after INT DEFAULT 1;
	  DECLARE a_before, fibo INT DEFAULT 0;
	  WHILE value > 1 DO
	    SET value = value - 1;
	    SET fibo = a_after + a_before;
	    SET a_before = a_after;
	    SET a_after = fibo;
	  END WHILE;
	 RETURN fibo;
  END//
DELIMITER ;

SELECT FIBONACCI(10) AS 'Число Фибоначи';






