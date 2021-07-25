-- Практическое задание по теме “Индексы, оконные функции”.

-- 1. Проанализировать какие запросы могут выполняться наиболее
-- часто в процессе работы приложения и добавить необходимые индексы.

SHOW TABLES;

DESC profiles;
CREATE INDEX profiles_birthday_idx ON profiles(birthday);

DESC users;
CREATE INDEX users_first_name_last_name_idx ON users(first_name, last_name);
CREATE INDEX users_email_idx ON users(email);

DESC posts;
CREATE INDEX posts_user_id_idx ON posts(user_id);

DESC media;
CREATE INDEX media_user_id_filename_idx ON media(user_id, filename);

==============================================================================================
-- 2. Задание на оконные функции
-- Построить запрос, который будет выводить следующие столбцы:
-- имя группы
-- среднее количество пользователей в группах
-- самый молодой пользователь в группе
-- самый старший пользователь в группе
-- общее количество пользователей в группе
-- всего пользователей в системе
-- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100


SELECT DISTINCT 
  com.name AS 'Группа',
  COUNT(com_us.user_id) OVER () / (SELECT COUNT(*) FROM communities) AS 'Ср. кол-во в группах',
  MAX(prof.birthday) OVER w AS 'Молодой польз.',
  MIN(prof.birthday) OVER w AS 'Старший польз.',
  COUNT(com.name) OVER(PARTITION BY com.name) AS 'Польз. в группе',
  (SELECT COUNT(user_id) FROM profiles) AS 'Польз. в системе',
  COUNT(com.name) OVER(PARTITION BY com.name) / (SELECT COUNT(user_id) FROM profiles) * 100 AS "%%" 
  FROM communities_users AS com_us
  JOIN communities AS com
  ON com_us.community_id = com.id
  JOIN profiles AS prof
  ON com_us.user_id = prof.user_id
  WINDOW w AS (PARTITION BY com.name);
 

