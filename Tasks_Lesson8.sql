USE vk;

-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT profiles.gender, COUNT(*) AS total
  FROM likes
    JOIN profiles
      ON profiles.user_id = likes.user_id
      GROUP BY gender
      ORDER BY total DESC
      LIMIT 1;

==============================================================================================================================
     
-- 4. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

SELECT * FROM target_types;
SELECT * FROM likes;
SELECT user_id, birthday FROM profiles ORDER BY birthday DESC LIMIT 10;

-- Вариант 1
SELECT 
  SUM(DISTINCT likes.target_type_id) AS 'Количество лайков'
  FROM likes
  RIGHT JOIN profiles
  ON target_type_id  = 2 AND likes.target_id = profiles.user_id
  ORDER BY birthday DESC
  LIMIT 10;

-- Вариант 2 с вложенным запросом 
SELECT SUM(total) AS 'Количество лайков'
  FROM (
  SELECT 
    likes.target_type_id IS NOT NULL AS total
  FROM likes
  RIGHT JOIN profiles
  ON target_type_id  = 2 AND likes.target_id = profiles.user_id
  ORDER BY birthday DESC 
  LIMIT 10) AS rezult;
 
  
==============================================================================================================================

-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

-- Вариант 1 вообще не активны)))
SELECT
  CONCAT(first_name, ' ', last_name) AS user, 
  (COUNT(likes.user_id + media.user_id + messages.from_user_id)) AS total
  FROM users
  LEFT JOIN likes
  ON likes.user_id = users.id
  LEFT JOIN media
  ON media.user_id = users.id
  LEFT JOIN messages
  ON messages.from_user_id = users.id
  WHERE likes.user_id IS NULL AND  media.user_id IS NULL AND messages.from_user_id IS NULL
  GROUP BY user;
 
 -- Вариант 2
 SELECT
  CONCAT(first_name, ' ', last_name) AS user, 
  (COUNT(likes.user_id) + COUNT(media.user_id) + COUNT(messages.from_user_id)) AS total
  FROM users
  LEFT JOIN likes
  ON likes.user_id = users.id
  LEFT JOIN media
  ON media.user_id = users.id
  LEFT JOIN messages
  ON messages.from_user_id = users.id
  GROUP BY user
  ORDER BY total
  LIMIT 10;
 


 
	 
	 