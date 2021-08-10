-- Практическое задание по теме “Оптимизация запросов”
-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
--    catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы,
--    идентификатор первичного ключа и содержимое поля name.

USE shop21;

DROP TABLE logs;
CREATE TABLE logs (
  name_tab VARCHAR(50),
  id_praim_key INT UNSIGNED NOT NULL,
  name VARCHAR(50),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE = ARCHIVE;

DELIMITER //

CREATE TRIGGER logs_users AFTER INSERT ON users
FOR EACH ROW 
BEGIN 
	INSERT INTO logs 
    VALUES
    ('users', NEW.id, NEW.name, DEFAULT);
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER logs_catalogs AFTER INSERT ON catalogs
FOR EACH ROW 
BEGIN 
	INSERT INTO logs VALUES
    ('catalogs', NEW.id, NEW.name, DEFAULT);
END//
DELIMITER ;


DELIMITER //

CREATE TRIGGER logs_products AFTER INSERT ON products
FOR EACH ROW 
BEGIN 
	INSERT INTO logs 
    VALUES
    ('products', NEW.id, NEW.name, DEFAULT);
END//
DELIMITER ;

DROP TRIGGER logs_users;
DROP TRIGGER logs_catalogs;
DROP TRIGGER logs_products;

INSERT INTO users (name, birthday_at) VALUES
  ('Петр Сидоров', '2001-08-09');
 
INSERT INTO catalogs (name) VALUES
  ('Клавиатура');

INSERT INTO products (name, description, price, catalog_id) VALUES
  ('intel Core i7-3423', 'Процессор для настольных персональных компьютеров,
основанных на платформе Intel.', 9000, 1);
 
 
 ---Практическое задание по теме “NoSQL”---

  1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.

  Воспользуемся Отсортированным множеством.

127.0.0.1:6379[1]> ZRANGE ip 0 6
1) "192.168.3.6"
2) "186.232.1.3"
3) "192.168.2.3"
4) "188.225.32.54"
127.0.0.1:6379[1]> ZRANGE ip 0 6 WITHSCORES
1) "192.168.3.6"
2) "5"
3) "186.232.1.3"
4) "8"
5) "192.168.2.3"
6) "12"
7) "188.225.32.54"
8) "45"
127.0.0.1:6379[1]> ZRANGEBYSCORE ip 12 56
1) "192.168.2.3"
2) "188.225.32.54"
127.0.0.1:6379[1]> 

==============================================================================================
  2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному
     адресу и наоборот, поиск электронного адреса пользователя по его имени.
     
127.0.0.1:6379> SELECT 3
OK
127.0.0.1:6379[3]> SADD rob rob@gmail.com
(integer) 1
127.0.0.1:6379[3]> SADD rob@gmail.com rob
(integer) 1
127.0.0.1:6379[3]> SINTER rob
1) "rob@gmail.com"
127.0.0.1:6379[3]> SINTER rob@gmail.com
1) "rob"
127.0.0.1:6379[3]> KEYS *
1) "rob@gmail.com"
2) "rob"

127.0.0.1:6379[3]> SADD alex alex_76@gmail.com
(integer) 1
127.0.0.1:6379[3]> SADD alex_76@gmail.com alex
(integer) 1
127.0.0.1:6379[3]> SINTER alex
1) "alex_76@gmail.com"
127.0.0.1:6379[3]> SINTER alex_76@gmail.com
1) "alex"
127.0.0.1:6379[3]> 


==============================================================================================
  3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.


> use shop
switched to db shop
> db.shop.insert({catalog: 'Процессоры', product: 'intel Core i3-8100', price: 7890})
WriteResult({ "nInserted" : 1 })
> db.shop.find()
{ "_id" : ObjectId("60ff02cda549d82a6efff1ba"), "catalog" : "Процессоры", "product" : "intel Core i3-8100", "price" : 7890 }
> db.shop.insert({catalog: 'Процессоры', product: 'intel Cointel Core i5-7400', price: 12700})
WriteResult({ "nInserted" : 1 })
> db.shop.find()
{ "_id" : ObjectId("60ff02cda549d82a6efff1ba"), "catalog" : "Процессоры", "product" : "intel Core i3-8100", "price" : 7890 }
{ "_id" : ObjectId("60ff03a26e30f83a17416b5a"), "catalog" : "Процессоры", "product" : "intel Cointel Core i5-7400", "price" : 12700 }
> db.shop.update({product: "intel Core i3-8100"}, {$push: {'quality': 'best'}}) 
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.shop.find()
{ "_id" : ObjectId("60ff02cda549d82a6efff1ba"), "catalog" : "Процессоры", "product" : "intel Core i3-8100", "price" : 7890, "quality" : [ "best" ] }
{ "_id" : ObjectId("60ff03a26e30f83a17416b5a"), "catalog" : "Процессоры", "product" : "intel Cointel Core i5-7400", "price" : 12700 }
> db.shop.insert({catalog: 'Мат.платы', product: 'iGigabyte H310M S2H', price: 4790})
WriteResult({ "nInserted" : 1 })
> db.shop.insert({catalog: 'Мат.платы', product: 'MSI B250M GAMING PRO', price: 5060})
WriteResult({ "nInserted" : 1 })
> db.shop.find()
{ "_id" : ObjectId("60ff02cda549d82a6efff1ba"), "catalog" : "Процессоры", "product" : "intel Core i3-8100", "price" : 7890, "quality" : [ "best" ] }
{ "_id" : ObjectId("60ff03a26e30f83a17416b5a"), "catalog" : "Процессоры", "product" : "intel Cointel Core i5-7400", "price" : 12700 }
{ "_id" : ObjectId("60ff05916e30f83a17416b5b"), "catalog" : "Мат.платы", "product" : "iGigabyte H310M S2H", "price" : 4790 }
{ "_id" : ObjectId("60ff05b76e30f83a17416b5c"), "catalog" : "Мат.платы", "product" : "MSI B250M GAMING PRO", "price" : 5060 }
