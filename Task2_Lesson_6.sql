-- 2. Создать все необходимые внешние ключи и диаграмму отношений.

USE vk;

DESC profiles;
DESC media;
ALTER TABLE profiles MODIFY COLUMN status_id INT UNSIGNED;


ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
     
ALTER TABLE profiles
  ADD CONSTRAINT profiles_status_id_fk
    FOREIGN KEY (status_id) REFERENCES profile_statuses(id)
      ON DELETE SET NULL;
     
ALTER TABLE profiles
  ADD CONSTRAINT profiles_city_id_fk
    FOREIGN KEY (city_id) REFERENCES cities(id)
      ON DELETE SET NULL;
     
ALTER TABLE profiles
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
      ON DELETE SET NULL;

DESC media;
     
ALTER TABLE media
  ADD CONSTRAINT media_media_type_is_fk
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
      ON DELETE SET NULL;
    
     
DESC cities;
DESC countries;

ALTER TABLE cities
  ADD CONSTRAINT cities_country_id_fk
    FOREIGN KEY (country_id) REFERENCES countries (id)
      ON DELETE SET NULL;

DESC friendships;
DESC relative_statuses;
ALTER TABLE friendships MODIFY COLUMN status_id INT UNSIGNED;

ALTER TABLE friendships
  ADD CONSTRAINT friendships_status_id_fk
    FOREIGN KEY (status_id) REFERENCES friendship_statuses (id)
      ON DELETE SET NULL;


DESC users;
DESC friendships;
 
ALTER TABLE friendships
  ADD CONSTRAINT friendships_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id)
      ON DELETE 
      NO ACTION;

ALTER TABLE friendships
  ADD CONSTRAINT friendships_friend_id_fk
    FOREIGN KEY (friend_id) REFERENCES users (id)
      ON DELETE
      NO ACTION;

DESC communities_users;
SELECT * FROM communities_users;
DESC communities;
     
ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_com_id_fk
    FOREIGN KEY (community_id) REFERENCES communities (id)
      ON DELETE CASCADE;

ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id)
      ON DELETE CASCADE;
     
ALTER TABLE messages
  ADD CONSTRAINT mesages_from_user_id_fk
    FOREIGN KEY (from_user_id) REFERENCES users (id)
      ON DELETE CASCADE;

ALTER TABLE messages
  ADD CONSTRAINT mesages_to_user_id_fk
    FOREIGN KEY (to_user_id) REFERENCES users (id)
      ON DELETE CASCADE;

ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id)
      ON DELETE CASCADE;

ALTER TABLE posts
  ADD CONSTRAINT posts_community_id_fk
    FOREIGN KEY (community_id) REFERENCES communities (id)
      ON DELETE CASCADE;

ALTER TABLE posts
  ADD CONSTRAINT posts_media_id_fk
    FOREIGN KEY (media_id) REFERENCES media (id)
      ON DELETE CASCADE;
     
ALTER TABLE likes
  ADD CONSTRAINT likes_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users (id)
      ON DELETE CASCADE;

   
DESC posts;
DESC likes;
UPDATE likes SET target_id = FLOOR(1 + (RAND() * 70));
     
ALTER TABLE likes
  ADD CONSTRAINT likes_target_id_fk
    FOREIGN KEY (target_id) REFERENCES posts (id)
      ON DELETE NO ACTION;

ALTER TABLE likes
  ADD CONSTRAINT likes_target_types_id_fk
    FOREIGN KEY (target_type_id) REFERENCES target_types (id)
      ON DELETE NO ACTION;

DESC target_types;
DESC posts;
     
ALTER TABLE likes
  DROP FOREIGN KEY likes_target_types_id_fk;
 
ALTER TABLE target_types DROP INDEX name;
ALTER TABLE target_types ADD UNIQUE (name);
     