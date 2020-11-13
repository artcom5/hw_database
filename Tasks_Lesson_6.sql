USE vk;

-- 3. Определить, кто больше поставил лайков (всего) - мужчины или женщины?
-- ХОД МЫСЛЕЙ)))
-- Выберем одних мужчин
SELECT  
  COUNT(DISTINCT user_id) AS 'man'
FROM 
  likes 
WHERE 
  user_id IN (SELECT user_id FROM profiles WHERE gender = 'f');

-- Выберем одних женщин
SELECT  
  COUNT(DISTINCT user_id) AS 'woman'
FROM 
  likes 
WHERE 
  user_id IN (SELECT user_id FROM profiles WHERE gender = 'm');


 -- Сопоставим две выборки из мужчин и женщин
SELECT
  (SELECT
     COUNT(DISTINCT user_id)
  FROM 
    likes 
  WHERE
    (user_id IN (SELECT user_id FROM profiles WHERE gender = 'm'))) AS 'man',
  (SELECT
     COUNT(DISTINCT user_id)
  FROM 
    likes 
  WHERE 
    (user_id IN (SELECT user_id FROM profiles WHERE gender = 'f'))) AS 'woman';
   
   -- Вариант 2
   
   -- Сделаем выборку из profiles только тех пользователей, которые есть в таблице likes. 
   SELECT 
     user_id,
     gender
   FROM
     profiles
   WHERE
     user_id IN (SELECT user_id FROM likes);
  
  -- Далее возьмем колонку gender и отсортируем её. Хотя можно и не сортировать.)))
  SELECT 
    gender
  FROM
    (SELECT user_id, gender FROM profiles WHERE user_id IN
    (SELECT user_id FROM likes)) AS new_gender ORDER BY gender;
  
  -- Далее воспользуемся функцией MAX и выведем кого больше мужчин или женщин, которые поставили лайки.
  SELECT
    MAX(gender) AS 'ПОЛ'
  FROM
    (SELECT gender FROM (SELECT user_id, gender FROM profiles WHERE user_id IN
    (SELECT user_id FROM likes)) AS new_gender) AS max_gender;
   
   
 ====================================================================================================================================

 
-- 4. Подсчитать общее количество лайков десяти самым молодым пользователям (сколько лайков получили 10 самых молодых пользователей).

-- ХОД МЫСЛЕЙ)))
-- Найдём возраст пользователей в таблице profiles и представим под псевдонимом age.
SELECT TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age FROM profiles;  
 
-- Узнаем user_id добавив колонку user_id к колонке age
SELECT user_id, TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age FROM profiles;
 
-- Отсортируем по возрасту от маленького до большого
SELECT user_id, TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age FROM profiles ORDER BY age;

-- Так после сортировки выяснилось есть пользователи, которым 0 лет (так как данные заполнялись рандомно) их 3,
-- уберем их при помощи LIMIT.
SELECT user_id, TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age
  FROM profiles ORDER BY age LIMIT 4, 10;  
    
-- Теперь извлекем колонку только самых молодых пользователей user_id и назовем её young_user.
-- А длинный запрос представим под псевдонимом new_users.
SELECT user_id AS young_user FROM (SELECT DISTINCT user_id, TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age FROM 
  profiles ORDER BY age LIMIT 4, 10) AS new_users;


-- Теперь собираем все в кучу. 
SELECT
  COUNT(user_id) AS 'Количество лайков'
FROM 
  likes
WHERE
  user_id IN (SELECT user_id AS young_user
  FROM (SELECT user_id, TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age
  FROM profiles ORDER BY age LIMIT 4, 10) AS new_users);
 
========================================================================================================================== 


-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети

-- Возьмем критерий активности по сообщениям
SELECT 
  user_id AS 'Неакт. по сообщ'
FROM
  profiles WHERE user_id NOT IN (SELECT DISTINCT from_user_id FROM messages) ORDER BY user_id;
 
-- Возьмем критерий активности по медиа
SELECT 
  user_id AS 'Неакт. по media'
FROM
  profiles WHERE user_id NOT IN (SELECT DISTINCT user_id FROM media) ORDER BY user_id;

-- Возьмем критерий активности по лайкам
SELECT 
  user_id AS 'Неакт. по лайкам'
FROM
  profiles WHERE user_id NOT IN (SELECT DISTINCT user_id FROM likes) ORDER BY user_id;
 
-- Возьмем критерий активности по группам
SELECT 
  user_id AS 'Неакт. по группам'
FROM
  profiles WHERE user_id NOT IN (SELECT DISTINCT user_id FROM communities_users) ORDER BY user_id;


-- Собираем все в кучу 
SELECT
  user_id AS 'Inactive users'
FROM
 profiles
 WHERE user_id NOT IN 
  (SELECT from_user_id FROM messages) AND user_id NOT IN (SELECT user_id FROM likes) AND
 user_id NOT IN (SELECT user_id FROM media) AND user_id NOT IN (SELECT user_id FROM communities_users);
-- У меня получилось меньше 10 точнее 7




