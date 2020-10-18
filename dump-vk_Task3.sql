-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.21-0ubuntu0.20.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название группы',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Группы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'Aspernatur et.','2014-05-09 03:04:22','2005-12-04 23:37:24'),(2,'Repudiandae ab.','1999-02-18 23:22:15','2002-03-20 20:53:02'),(3,'Similique quisquam.','1975-07-15 11:03:12','1984-05-15 19:42:04'),(4,'Minus et.','1995-11-01 10:34:25','1979-12-22 13:10:43'),(5,'Quas et.','1987-11-28 11:08:29','1971-02-23 08:41:35'),(6,'Qui reprehenderit.','1972-01-30 21:25:24','1995-07-28 20:22:05'),(7,'Officiis aperiam.','2013-12-05 00:51:16','2010-06-15 03:20:08'),(8,'Numquam enim.','1999-09-04 02:45:41','2007-03-06 01:00:04'),(9,'Maxime dolorum id.','1985-06-09 16:45:22','2020-02-27 05:49:12'),(10,'Cum qui.','1975-09-05 11:56:54','2010-12-12 02:32:42'),(11,'Excepturi error.','2003-05-21 21:24:38','2015-02-26 16:13:15'),(12,'Nihil enim vero.','1994-06-20 01:52:43','2018-09-16 19:38:58'),(13,'Qui harum dolor.','1985-05-18 13:14:46','2017-07-15 05:33:48'),(14,'Rerum velit aut.','2007-05-06 21:10:30','1975-07-16 00:43:41'),(15,'Eveniet consequatur libero.','2006-10-25 16:54:28','1980-02-05 05:37:40'),(16,'Est id.','2017-11-18 21:20:39','2008-12-21 06:38:07'),(17,'Itaque magni.','2010-11-04 01:36:27','1999-12-31 07:20:53'),(18,'Autem dolores.','2005-05-31 09:40:01','1983-07-18 10:23:35'),(19,'Omnis reiciendis beatae.','1997-09-30 22:14:52','1987-11-11 01:16:59'),(20,'Et ab enim.','1988-01-12 08:04:25','2009-05-01 04:18:43');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities_users` (
  `community_id` int unsigned NOT NULL COMMENT 'Ссылка на группу',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  PRIMARY KEY (`community_id`,`user_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Участники групп, связь между пользователями и группами';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
INSERT INTO `communities_users` VALUES (1,23,'1984-10-31 06:39:35'),(2,73,'1974-06-13 03:08:27'),(3,27,'1995-07-09 23:41:07'),(4,46,'1998-02-15 12:02:54'),(5,14,'2012-06-28 09:29:05'),(6,52,'1980-10-01 03:54:31'),(7,25,'2001-06-23 23:35:39'),(8,42,'2010-05-15 01:11:04'),(9,14,'1992-01-12 01:21:42'),(10,90,'1997-03-17 21:18:23'),(11,81,'1977-07-30 00:35:44'),(12,56,'1987-05-15 05:47:54'),(13,85,'1991-03-09 15:10:41'),(14,31,'1975-07-28 12:36:39'),(15,62,'1971-05-29 00:20:17'),(16,38,'1979-11-29 20:11:03'),(17,93,'2014-06-15 03:56:58'),(18,26,'2017-07-19 04:22:27'),(19,19,'1975-08-21 14:58:33'),(20,63,'1989-10-21 21:48:32');
/*!40000 ALTER TABLE `communities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship_statuses`
--

DROP TABLE IF EXISTS `friendship_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendship_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название статуса',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Статусы дружбы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship_statuses`
--

LOCK TABLES `friendship_statuses` WRITE;
/*!40000 ALTER TABLE `friendship_statuses` DISABLE KEYS */;
INSERT INTO `friendship_statuses` VALUES (1,'not confirmed','1991-11-09 09:51:38','2001-10-25 05:43:37'),(2,'in friends','1996-01-28 23:33:40','2008-10-10 02:38:04');
/*!40000 ALTER TABLE `friendship_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendships_relatives`
--

DROP TABLE IF EXISTS `friendships_relatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendships_relatives` (
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на инициатора дружеских отношений',
  `friend_id` int unsigned NOT NULL COMMENT 'Ссылка на получателя приглашения дружить',
  `status_id` int unsigned NOT NULL COMMENT 'Ссылка на статус (текущее состояние) отношений',
  `status_relative_id` int unsigned NOT NULL COMMENT 'Ссылка на статус родственности',
  `requestes_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время отправления приглашения дружить',
  `confirmed_at` datetime DEFAULT NULL COMMENT 'Время подтверждения приглашения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`,`friend_id`) COMMENT 'Составной первичгый ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Таблица дружбы и родственности';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendships_relatives`
--

LOCK TABLES `friendships_relatives` WRITE;
/*!40000 ALTER TABLE `friendships_relatives` DISABLE KEYS */;
INSERT INTO `friendships_relatives` VALUES (1,38,2,2,'2001-08-30 14:24:20','1973-12-04 10:45:44','2009-10-12 18:53:37','1989-01-29 10:46:35'),(2,57,1,1,'2010-04-06 14:31:59','2009-09-08 18:09:30','1986-08-04 06:15:33','2003-07-24 06:34:42'),(3,55,2,1,'1978-02-08 06:05:09','1999-09-10 15:40:09','1990-03-04 09:59:14','2008-05-12 07:19:47'),(4,3,1,1,'1989-05-15 07:55:50','2001-08-01 19:30:48','2010-05-21 04:47:53','1991-07-13 09:19:54'),(5,35,2,1,'2012-11-26 13:14:48','1985-09-08 02:17:41','2013-09-14 18:19:34','1995-08-30 22:22:01'),(6,82,2,1,'1985-02-14 18:43:07','2004-12-10 13:22:42','2008-06-07 01:26:45','1983-11-05 22:06:38'),(7,51,2,1,'2001-10-16 03:23:48','1972-04-12 09:06:21','1976-03-20 17:29:53','1990-12-18 12:39:22'),(8,9,1,1,'1996-01-21 22:10:30','2005-12-09 14:55:21','1992-06-22 03:29:15','1983-11-03 05:47:19'),(9,65,2,1,'2003-06-21 18:43:19','1991-01-06 21:00:56','1981-04-27 04:23:45','1980-01-27 09:16:07'),(10,23,2,1,'2020-06-28 00:50:03','1989-02-10 15:30:40','2004-12-19 04:16:47','1981-04-01 03:32:25'),(11,45,1,2,'1997-08-31 12:13:22','1997-01-12 10:57:49','1993-07-09 21:09:48','2013-10-15 21:35:03'),(12,45,2,1,'2019-10-27 22:10:34','2020-02-15 09:45:57','1981-10-01 12:00:35','1972-07-10 17:07:08'),(13,59,2,1,'1992-07-25 14:19:04','1975-03-06 14:47:03','2011-01-23 04:22:49','2006-07-23 02:16:07'),(14,54,1,2,'1993-06-12 15:22:25','2020-02-04 12:07:29','1971-02-23 16:52:25','1989-12-10 19:15:13'),(15,78,2,2,'1999-09-13 16:04:24','2012-08-22 10:12:26','2000-07-27 08:35:49','2001-01-22 22:17:17'),(16,80,1,2,'1996-07-21 14:35:13','2009-09-13 15:43:49','2009-04-19 09:41:20','2015-07-19 07:47:32'),(17,74,1,1,'2018-12-06 12:00:31','1973-07-30 20:37:13','2011-10-26 10:45:20','1999-03-27 14:33:51'),(18,50,1,1,'1991-01-27 04:23:01','2018-06-11 12:21:14','2007-03-27 13:06:15','1978-04-09 16:17:34'),(19,30,1,1,'2005-02-27 16:15:29','1975-12-18 19:53:19','2017-08-01 23:30:55','2017-07-13 11:00:11'),(20,57,2,2,'1996-02-10 12:56:45','1980-03-09 02:06:35','1997-02-15 07:44:53','2011-11-17 07:08:39'),(21,46,2,2,'1979-10-16 15:27:22','2020-04-27 07:46:30','2012-06-10 04:35:56','1998-11-01 15:19:27'),(22,49,2,1,'2008-01-20 02:10:30','1989-01-27 02:49:34','1981-10-16 01:41:08','1982-06-25 19:13:44'),(23,61,2,2,'1987-11-20 17:40:34','2016-05-15 22:27:04','2015-06-08 05:58:13','1971-07-02 17:35:39'),(24,4,2,2,'1983-03-14 23:18:00','2014-05-31 06:31:53','2015-12-17 20:31:06','1973-12-02 06:37:44'),(25,47,1,1,'2009-05-01 17:13:40','1998-10-05 21:49:00','2014-02-18 14:51:41','2002-03-30 01:20:22'),(26,17,1,1,'2018-05-14 00:41:59','1997-09-27 09:40:51','2013-12-30 10:14:51','2018-10-28 11:28:46'),(27,100,1,2,'2002-11-21 04:03:47','1985-09-16 13:49:06','2000-04-01 23:48:18','1980-03-19 12:13:32'),(28,58,2,1,'2003-12-13 08:16:06','1990-11-20 12:29:50','1976-12-12 02:27:08','1985-08-06 17:26:45'),(29,60,2,1,'1976-07-03 18:17:01','1980-02-28 02:20:59','1985-02-27 03:52:57','1989-09-02 15:39:05'),(30,39,2,1,'2003-02-18 23:07:17','1975-09-26 22:03:08','1975-09-07 08:58:09','1976-09-23 14:42:07'),(31,43,1,1,'2018-05-21 09:09:51','2003-12-12 01:35:28','1991-05-09 15:28:16','1974-02-09 15:37:51'),(32,97,1,1,'1987-07-26 21:42:42','1995-10-19 19:23:17','1992-02-07 13:38:11','1987-04-08 22:50:19'),(33,95,2,1,'1971-08-30 14:53:03','2012-02-24 18:24:33','1990-05-03 18:38:51','1994-08-02 05:09:39'),(34,98,1,2,'1972-09-17 23:36:08','1978-08-16 01:23:40','2014-07-04 21:28:01','1982-03-26 09:05:31'),(35,100,2,1,'1976-04-25 05:58:05','2015-12-04 13:46:37','2015-01-18 19:00:06','2007-07-12 17:39:28'),(36,30,2,1,'1978-12-28 19:33:42','2019-04-28 11:04:20','1996-08-28 17:24:35','2013-07-16 05:23:52'),(37,80,2,2,'1991-02-01 16:40:07','1996-12-28 13:18:13','1998-07-22 20:18:36','1973-10-27 06:25:08'),(38,50,1,2,'2006-03-30 15:28:28','1976-12-01 05:02:34','1975-06-03 02:39:28','1971-10-13 14:16:27'),(39,38,2,1,'2010-11-06 20:46:22','2018-09-07 19:03:02','1995-02-15 09:20:32','1972-07-28 12:03:06'),(40,44,1,1,'2015-03-12 23:49:05','1973-06-03 14:39:00','2017-11-16 14:26:48','1992-11-22 14:59:49'),(41,72,2,1,'2008-08-11 00:14:11','2012-09-22 01:05:29','2006-04-19 20:17:02','2008-12-31 11:20:04'),(42,82,2,1,'1971-12-30 23:40:43','1974-05-14 22:50:56','2010-07-17 05:33:10','1986-07-31 22:21:54'),(43,89,2,1,'1988-05-10 02:30:56','1989-07-15 21:53:31','1996-02-10 14:17:02','1985-03-05 04:42:35'),(44,31,2,2,'1988-11-06 02:16:33','2001-08-29 21:08:41','1977-07-05 14:07:16','2012-09-11 23:05:50'),(45,36,1,1,'1998-06-17 11:37:48','1993-02-22 20:09:00','1990-11-13 01:44:48','1982-10-22 19:53:22'),(46,67,2,2,'1986-11-02 11:01:07','1973-10-21 03:12:01','1977-08-08 14:03:13','1973-09-25 04:26:43'),(47,10,1,1,'2010-06-03 10:52:24','1990-02-16 14:53:15','1973-12-07 09:46:45','2011-02-14 16:31:31'),(48,10,2,1,'1979-12-24 14:52:38','1989-11-21 08:48:16','1974-12-12 12:15:16','1994-11-30 01:25:25'),(49,17,1,1,'2011-11-08 11:22:52','1980-01-27 12:02:31','2007-10-21 09:13:19','2001-01-16 12:26:24'),(50,40,1,1,'1972-12-06 01:51:22','1974-09-13 17:55:55','2012-03-30 07:21:35','1986-06-04 20:52:51'),(51,66,1,2,'2004-03-08 09:50:51','1993-04-21 05:25:33','1977-04-12 22:59:28','2000-07-17 01:33:56'),(52,62,1,1,'1978-02-04 03:51:36','2006-10-25 03:47:33','1979-04-06 20:15:47','2001-05-21 00:54:44'),(53,88,1,2,'1984-03-20 10:34:28','2014-10-26 03:47:25','2010-09-19 13:38:17','2010-08-22 07:51:43'),(54,26,1,2,'1996-11-04 22:27:25','2006-05-20 19:07:50','2005-01-30 02:30:47','1996-04-07 15:18:20'),(55,65,1,1,'2007-08-16 11:46:27','1989-12-28 03:03:27','2007-01-02 08:32:02','2007-10-22 09:09:41'),(56,35,1,1,'2009-09-12 18:34:32','1998-09-06 18:03:56','1982-10-01 18:33:33','1974-10-21 01:35:10'),(57,43,1,2,'2005-04-13 13:14:40','2004-11-30 09:28:23','2019-09-08 10:39:15','1984-03-27 09:48:24'),(58,64,1,2,'1974-04-04 15:25:36','1997-06-21 02:09:27','2013-12-27 07:06:41','1981-01-08 12:11:12'),(59,92,2,1,'1983-05-17 20:13:40','2000-01-24 12:42:30','1996-11-04 23:35:43','1977-03-11 00:59:48'),(60,3,2,1,'1989-12-29 18:18:38','2014-06-22 01:40:23','1974-11-30 06:30:10','2005-11-24 04:15:58'),(61,3,2,1,'1977-02-13 18:13:30','2016-04-17 22:36:14','2013-01-31 10:55:17','2006-04-23 22:36:19'),(62,35,2,1,'2019-08-27 23:03:27','1999-03-31 14:28:21','1983-06-28 11:58:59','2009-02-13 20:47:59'),(63,100,2,2,'1995-04-07 21:57:42','1998-09-23 00:43:36','2012-08-16 14:37:03','2018-03-03 12:44:52'),(64,97,1,2,'1993-08-02 09:52:16','1995-11-21 18:07:14','1974-02-06 19:39:54','1989-02-21 03:58:00'),(65,32,1,1,'1989-10-28 11:05:25','1999-01-15 06:47:56','2000-08-05 18:50:39','1989-08-06 21:41:50'),(66,99,1,2,'1988-12-04 20:30:34','2006-10-27 16:46:47','2009-11-06 07:16:58','1987-06-08 16:40:44'),(67,26,1,1,'1974-04-25 21:54:31','1972-02-27 06:27:10','2016-05-18 03:29:29','2002-01-28 10:16:38'),(68,11,2,2,'1975-06-28 21:41:35','2015-03-16 21:24:15','1995-05-16 09:38:49','1987-05-03 02:05:55'),(69,49,2,2,'1978-10-05 11:14:28','2011-02-11 14:22:39','2004-09-30 20:26:46','1999-06-10 16:02:10'),(70,64,1,2,'1993-09-27 04:29:26','2016-02-11 02:45:12','2011-02-03 07:49:20','1976-05-08 11:37:10'),(71,55,1,1,'1989-10-01 03:26:25','2014-05-21 06:28:58','1974-10-24 19:24:17','2004-05-23 22:03:40'),(72,21,1,2,'2011-04-06 06:53:18','1991-01-03 18:19:43','2005-05-09 22:16:59','1987-10-10 00:05:03'),(73,45,1,1,'1990-01-26 16:48:53','2002-03-25 13:16:09','1996-01-15 09:38:24','1981-05-04 16:34:44'),(74,43,2,1,'2020-02-14 20:33:01','2014-12-20 09:56:01','1980-03-10 09:19:43','2010-07-07 00:45:33'),(75,51,2,1,'2019-01-01 09:00:38','2003-01-12 23:20:10','2006-12-28 19:55:43','1978-12-26 12:56:54'),(76,80,1,2,'2003-08-07 13:55:50','1985-10-11 17:23:42','1970-06-16 20:55:38','1976-05-18 19:20:38'),(77,10,1,1,'1982-08-11 14:10:04','1984-06-27 09:45:55','1993-02-26 17:16:43','2003-09-04 12:32:56'),(78,60,1,1,'1979-04-14 22:27:40','2003-02-19 07:27:52','2009-12-06 06:26:27','1987-09-21 13:52:14'),(79,89,1,1,'2000-08-09 22:29:40','2009-07-23 13:38:42','1983-06-25 18:31:22','2000-09-24 02:47:59'),(80,26,1,1,'1983-07-31 16:55:36','1997-02-23 07:21:05','1974-09-12 14:16:42','2000-04-23 18:35:23'),(81,99,1,2,'1988-01-03 20:19:25','1989-07-02 03:38:58','2016-08-28 12:53:53','1996-04-20 13:52:56'),(82,55,2,1,'2019-12-26 17:48:12','2009-02-14 13:41:51','2018-12-20 07:35:48','1998-09-25 22:42:46'),(83,87,2,2,'1981-10-19 21:26:34','1986-03-29 00:10:12','2012-06-11 16:20:12','1983-07-17 13:48:53'),(84,87,1,1,'2008-11-23 04:58:39','1997-07-15 10:41:07','1972-05-02 03:50:47','1981-04-03 07:05:59'),(85,81,2,1,'1975-12-03 09:52:21','1975-08-02 23:00:51','2004-05-09 14:25:10','1980-06-28 11:56:12'),(86,51,1,1,'1987-01-23 20:37:58','2019-11-21 11:30:29','2002-08-02 18:06:14','1990-10-03 02:56:27'),(87,21,2,2,'2003-05-06 13:01:53','1970-08-23 18:05:28','2014-04-19 19:53:20','1989-11-07 23:03:41'),(88,23,1,2,'2003-02-08 00:41:29','1995-03-31 17:10:26','2005-03-11 17:16:34','2017-08-15 19:02:58'),(89,15,1,2,'1995-01-22 16:50:05','2013-02-10 22:32:36','1978-03-25 07:13:27','1977-04-03 22:52:07'),(90,13,2,2,'2005-12-22 07:27:03','2015-02-25 06:28:50','1979-06-21 19:18:14','2002-02-16 12:46:33'),(91,26,2,1,'2000-09-06 13:27:58','2016-03-03 02:27:29','1972-08-02 12:17:58','1989-04-19 08:22:23'),(92,17,2,2,'2006-11-15 12:04:30','2011-04-14 22:34:36','1981-07-07 03:56:41','1994-10-15 19:45:03'),(93,47,1,1,'1975-10-17 18:41:47','1970-07-12 21:41:52','1986-11-28 08:04:28','1996-11-16 14:46:34'),(94,25,2,2,'2005-02-23 23:37:42','2015-03-05 22:21:04','1976-07-13 23:42:56','2010-12-07 12:15:24'),(95,14,2,2,'2018-07-06 20:33:52','2020-09-16 17:38:49','1972-04-05 19:56:03','1981-08-12 05:07:41'),(96,79,1,2,'1998-07-18 07:39:36','1991-12-16 18:29:46','2002-06-04 10:21:07','2015-06-06 18:30:03'),(97,23,2,1,'1978-09-13 21:53:19','1989-09-07 15:37:36','2009-01-14 05:42:30','1993-03-20 15:02:09'),(98,40,2,2,'1994-02-01 14:31:46','1977-11-14 14:54:40','1999-11-04 13:03:52','1988-09-26 21:55:18'),(99,90,1,2,'2011-09-02 20:18:22','2001-12-22 15:18:21','1985-12-24 12:03:37','1983-08-28 07:50:23'),(100,72,1,1,'2020-08-29 12:57:55','1975-01-26 00:03:26','1984-01-30 01:43:31','1981-03-15 18:52:06');
/*!40000 ALTER TABLE `friendships_relatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя, который загрузил файл',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Путь к файлу',
  `size` int NOT NULL COMMENT 'Размер файла',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Метаданные файла',
  `media_type_id` int unsigned NOT NULL COMMENT 'Ссылка на тип контента',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  CONSTRAINT `media_chk_1` CHECK (json_valid(`metadata`))
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Медиафайлы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,53,'nisi',95965,NULL,1,'1979-01-08 15:45:33','1971-11-12 14:31:26'),(2,76,'soluta',22326,NULL,2,'1996-05-14 07:07:11','1976-05-17 21:20:56'),(3,27,'eveniet',4,NULL,3,'1975-05-12 04:12:53','1994-05-07 04:52:11'),(4,73,'et',0,NULL,1,'1996-11-16 23:52:13','2000-10-26 22:00:24'),(5,4,'quam',0,NULL,2,'2013-06-11 12:17:50','1989-11-14 15:01:41'),(6,95,'architecto',3677611,NULL,3,'1998-09-21 08:34:09','1994-01-05 01:39:15'),(7,86,'optio',15467180,NULL,1,'1979-02-25 00:30:22','2007-12-20 07:14:15'),(8,84,'qui',0,NULL,2,'1972-05-03 23:34:34','1977-04-21 11:33:36'),(9,26,'quia',1375,NULL,3,'2001-04-20 02:57:32','1979-12-30 14:38:24'),(10,20,'qui',0,NULL,1,'2002-02-16 06:07:53','1988-09-12 18:18:16'),(11,44,'repellat',4693189,NULL,2,'2000-08-05 09:09:33','1979-10-03 16:41:29'),(12,45,'sunt',565157,NULL,3,'2005-01-24 07:50:06','2016-10-10 07:17:45'),(13,40,'repellendus',6,NULL,1,'1995-09-09 06:31:36','2000-10-19 08:29:35'),(14,88,'voluptatum',0,NULL,2,'2008-06-08 00:06:41','1974-08-26 03:29:21'),(15,1,'eos',366,NULL,3,'2005-12-05 11:03:14','2013-02-20 02:07:08'),(16,55,'est',76,NULL,1,'2004-09-22 19:03:10','1982-10-29 12:52:43'),(17,49,'sunt',0,NULL,2,'2012-04-18 22:21:40','1981-06-09 10:37:18'),(18,97,'natus',63750,NULL,3,'2010-12-08 02:08:32','2011-10-16 17:49:03'),(19,50,'nulla',2068,NULL,1,'2018-09-22 01:58:42','1975-04-22 14:20:13'),(20,29,'non',2297,NULL,2,'2009-09-26 21:46:22','1980-05-17 01:32:28'),(21,12,'eos',6489115,NULL,3,'1997-07-09 14:19:53','1987-11-21 14:43:28'),(22,93,'quisquam',67218,NULL,1,'1976-01-31 21:54:01','2017-02-20 16:24:28'),(23,44,'illum',29399,NULL,2,'1985-12-22 22:02:32','1998-10-02 11:42:15'),(24,66,'quasi',945514149,NULL,3,'1994-06-09 13:46:36','1997-02-27 16:25:39'),(25,15,'molestias',272562,NULL,1,'1972-07-18 08:14:53','2002-07-29 08:16:29'),(26,88,'enim',9939545,NULL,2,'2018-11-13 13:20:08','2006-04-26 19:02:24'),(27,61,'quod',252262711,NULL,3,'2013-10-22 13:02:48','2015-08-24 15:01:08'),(28,51,'blanditiis',965,NULL,1,'2016-06-06 17:37:30','2009-04-15 06:15:35'),(29,66,'error',0,NULL,2,'1989-09-19 17:45:33','1973-04-29 11:46:11'),(30,99,'et',0,NULL,3,'2016-10-27 00:21:19','1982-11-21 18:45:08'),(31,75,'qui',26290,NULL,1,'2015-07-25 07:45:34','2001-05-17 19:45:23'),(32,19,'aliquam',0,NULL,2,'1979-03-10 11:21:10','1978-01-25 13:21:59'),(33,74,'aut',2465,NULL,3,'1991-07-08 04:52:42','1994-12-05 16:58:07'),(34,2,'sit',56,NULL,1,'1990-05-10 15:58:14','1992-09-18 11:30:55'),(35,91,'veniam',83381319,NULL,2,'1971-11-18 06:31:22','1977-02-03 10:49:02'),(36,78,'quae',24162,NULL,3,'1992-03-26 15:31:28','2007-11-26 10:16:02'),(37,96,'atque',3,NULL,1,'2009-12-23 05:54:25','1986-08-10 20:35:32'),(38,77,'et',0,NULL,2,'2013-05-10 02:04:01','2006-02-05 11:54:18'),(39,61,'laborum',45868,NULL,3,'1992-10-24 05:41:50','2017-10-28 01:37:42'),(40,21,'dolor',66815,NULL,1,'2012-10-07 19:19:20','1973-08-31 21:52:24'),(41,96,'exercitationem',39,NULL,2,'2007-03-07 07:06:24','2015-10-27 08:28:01'),(42,4,'consequuntur',3847,NULL,3,'2001-07-22 18:13:44','1973-12-07 15:54:31'),(43,66,'ut',54605086,NULL,1,'1985-10-05 07:53:34','1980-03-27 18:41:01'),(44,35,'ut',822461,NULL,2,'1976-12-01 03:59:31','1997-08-04 13:25:41'),(45,92,'nobis',0,NULL,3,'1971-02-25 21:56:33','1987-04-27 14:43:15'),(46,66,'et',68725752,NULL,1,'1984-01-07 19:02:23','2012-11-10 19:30:48'),(47,90,'quia',903,NULL,2,'2013-03-03 16:16:21','1979-12-27 19:38:57'),(48,40,'nostrum',195,NULL,3,'1973-03-17 09:00:38','1994-06-04 16:52:24'),(49,63,'ut',52,NULL,1,'1998-11-25 03:49:23','2003-10-19 13:55:24'),(50,40,'reiciendis',207948,NULL,2,'1990-07-20 11:58:58','2013-05-20 06:00:11'),(51,69,'doloremque',922507,NULL,3,'1992-06-15 00:10:25','1974-03-13 08:00:26'),(52,75,'voluptas',0,NULL,1,'1975-02-17 06:58:05','2017-04-02 00:10:38'),(53,33,'consequatur',10027,NULL,2,'1993-10-05 10:42:30','1989-02-26 21:26:34'),(54,13,'ea',90,NULL,3,'2002-12-02 12:59:53','1993-05-23 23:42:32'),(55,40,'aliquam',800549447,NULL,1,'1985-10-07 22:08:39','2018-07-26 05:00:57'),(56,48,'facere',5654,NULL,2,'2016-03-10 23:22:58','2004-08-30 08:25:36'),(57,100,'molestias',9798467,NULL,3,'1988-09-14 00:21:18','2016-04-30 01:25:31'),(58,1,'et',7,NULL,1,'2015-08-03 07:23:53','1994-09-21 08:46:19'),(59,98,'commodi',384241899,NULL,2,'2008-03-12 23:47:02','1994-02-11 18:35:30'),(60,66,'vitae',5,NULL,3,'1994-11-04 14:10:06','1976-06-13 17:28:53'),(61,99,'praesentium',618017,NULL,1,'1975-05-15 16:08:20','1983-12-20 09:28:04'),(62,73,'enim',0,NULL,2,'2012-08-02 13:32:39','2001-07-26 17:41:17'),(63,84,'amet',376141,NULL,3,'1973-03-20 21:15:44','1971-04-17 14:10:32'),(64,73,'omnis',0,NULL,1,'1980-06-29 07:44:27','1986-08-25 02:06:28'),(65,75,'ut',7,NULL,2,'1996-01-07 23:59:55','2020-01-31 19:59:17'),(66,75,'aut',5700,NULL,3,'2014-11-28 16:16:12','2003-04-07 04:28:18'),(67,50,'aut',4707,NULL,1,'2006-02-24 09:51:17','2012-04-22 23:29:01'),(68,70,'dolorum',59976,NULL,2,'1971-01-10 07:12:21','1991-04-30 12:50:05');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название типа',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Типы медиафайлов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'pictures','1970-05-01 01:36:47','2019-08-14 20:24:06'),(2,'video','1992-09-13 03:25:00','1997-01-15 03:15:23'),(3,'audio','1994-04-12 21:35:22','1978-08-06 13:41:59');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int unsigned NOT NULL COMMENT 'Ссылка на отправителя',
  `to_user_id` int unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Текст сообщения',
  `is_impotant` tinyint(1) DEFAULT NULL COMMENT 'Признак важности',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Сообщения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,86,'Quo modi maxime qui rerum et commodi nemo. Quaerat nesciunt error est consequatur cum quae nulla. Impedit fugit reprehenderit dolore quis sunt dolor.',0,0,'1991-05-08 19:38:43'),(2,2,78,'Iusto architecto necessitatibus earum at. Quas nobis quo autem quia.',0,0,'1978-02-24 04:41:05'),(3,3,9,'Debitis earum voluptas dicta ratione vero neque odio. Consequatur doloremque quisquam voluptas eveniet. Soluta nulla omnis id vero alias illum voluptas. Qui qui aperiam officia.',0,1,'1970-10-21 05:29:54'),(4,4,64,'Minima consequatur aperiam numquam fuga rerum est at. Aliquam minus ut optio voluptatum ipsam pariatur accusantium et. Vel et dolorem sapiente neque.',0,0,'1987-06-20 22:57:39'),(5,5,27,'Quia similique qui minima eaque eaque amet qui ipsum. Velit sit quis id dolor. Error optio inventore aliquam libero molestias. Beatae sunt facere sint cumque et.',0,0,'1992-03-25 03:09:28'),(6,6,64,'Id cumque ut quibusdam ex numquam nam. Repellendus nobis omnis pariatur omnis quia eaque quia corporis. Et culpa minus autem molestias. Numquam est odio culpa praesentium qui.',0,1,'2013-08-20 12:15:06'),(7,7,91,'Aut tenetur at totam quo qui odio eos. Saepe error inventore illo in doloremque. Saepe iste vitae tempora esse suscipit voluptas.',1,1,'2014-09-24 01:57:27'),(8,8,75,'Praesentium et repellat deleniti quo. Alias architecto quia odio eos aspernatur vero. Sit consequuntur nisi iste omnis facilis.',1,0,'1978-02-20 23:24:04'),(9,9,91,'Voluptatum aut earum tenetur ad. Impedit laboriosam possimus id voluptas nemo soluta reiciendis corporis. Voluptas eligendi perspiciatis quo a.',1,1,'2013-08-06 15:26:42'),(10,10,8,'Quas modi provident provident numquam ipsa ex. Repellat explicabo eum qui quam et sed possimus. Dolor et rem nulla non.',1,0,'2013-11-22 15:59:22'),(11,11,38,'Deleniti officiis velit dolor soluta et. Voluptatem architecto et quia eveniet earum. Nemo amet doloribus aspernatur commodi culpa.',0,1,'2007-09-14 17:13:29'),(12,12,73,'Enim nobis sint eaque sint qui. Rerum saepe sit dolorem earum illum. Voluptas consequatur laborum ducimus eum voluptate. Dolor eius et accusantium modi nemo.',1,0,'1987-04-04 01:54:14'),(13,13,97,'Est assumenda iure tempora aut dignissimos. Est sapiente asperiores sunt suscipit. Iure aut mollitia sit consequatur similique. Aut ut officiis explicabo asperiores saepe maiores.',0,1,'1970-05-18 15:51:25'),(14,14,74,'Nihil omnis aut rerum eum est. Similique beatae eos natus et rerum similique. Aliquid consequatur nihil praesentium dolorum quaerat doloribus accusantium sed.',0,1,'1994-03-15 03:53:06'),(15,15,79,'Et ea et quis mollitia sint mollitia autem. Quae tempora aspernatur sit pariatur. Dolore molestias quis enim mollitia eos harum. Accusamus est vitae iure qui.',0,1,'2020-09-18 06:49:49'),(16,16,45,'Suscipit unde eveniet qui quia voluptatibus non. Dolor quo adipisci et tenetur. Blanditiis consectetur voluptas temporibus delectus.',1,1,'1990-05-16 10:34:05'),(17,17,48,'Nihil et libero at assumenda et qui. Magnam unde velit nulla sit nobis. Exercitationem quos qui beatae est.',1,0,'1995-04-25 18:01:57'),(18,18,62,'Quis autem quod quia itaque sunt est non. Iure tenetur nam natus explicabo minus qui. Voluptatem quia fuga iure amet.',1,0,'2011-10-23 02:44:47'),(19,19,38,'Velit quia atque suscipit est quis sint. Tenetur laboriosam aliquid commodi rerum amet quidem nihil. Reiciendis saepe fuga dolorem cumque deserunt quos et.',1,0,'1995-11-30 09:21:07'),(20,20,79,'Et doloribus eligendi delectus rem sunt soluta unde. Delectus quisquam quo velit minus et nemo. Dolor doloribus consequuntur repellat sit debitis.',1,0,'1988-04-01 20:28:43'),(21,21,28,'Ea aut dolor qui. Cupiditate voluptatem porro animi blanditiis reiciendis.',0,1,'2007-09-08 06:29:49'),(22,22,1,'Consectetur aliquid atque velit dolor voluptatibus dolorum. Porro vitae sit quae. Et voluptate placeat porro sunt.',0,0,'1986-11-17 17:00:07'),(23,23,53,'Sint blanditiis et eum harum ut. Voluptatem incidunt eos ea vel maxime earum amet. Beatae impedit eaque cum architecto. Harum praesentium non quasi sequi ea.',1,1,'1992-01-12 12:44:27'),(24,24,64,'Ullam inventore eveniet porro molestias alias. Sequi doloribus ea mollitia odio neque. Autem nisi non suscipit. Velit amet quaerat fugit.',1,0,'1987-03-05 17:45:18'),(25,25,46,'Iste vero optio voluptatem vitae. Voluptate ipsum provident sit odio dolorem. Cupiditate praesentium consequatur quia ea. Commodi doloribus eligendi et vero nesciunt neque.',1,0,'2013-10-12 21:34:47'),(26,26,93,'Ducimus maxime nulla enim excepturi. Id fugit maiores magnam fugiat accusamus est. Et nihil hic corrupti veniam veritatis facilis. Velit nulla rem qui ut.',1,0,'2006-06-17 19:54:25'),(27,27,86,'Voluptas qui explicabo ut id. Delectus corporis qui ratione exercitationem reprehenderit neque. Ut error praesentium exercitationem veritatis veniam voluptas esse enim.',0,0,'1980-09-23 09:15:54'),(28,28,18,'Iste non accusamus necessitatibus enim nihil. Ducimus quaerat officiis quo quam. Fugiat quos minima laboriosam recusandae labore.',0,1,'1981-10-17 10:23:45'),(29,29,28,'Illum nobis veritatis doloribus. Aliquam ab sint ducimus consequatur ut qui. Unde ut molestias provident consequatur. Voluptatibus iste distinctio ut voluptas aliquam reprehenderit ducimus.',0,1,'1987-08-20 13:36:58'),(30,30,26,'Ratione qui voluptas ex et nihil quia inventore. Et eius exercitationem excepturi fugiat a qui qui ut. Nemo non ut dolore numquam quia placeat ut. Aut dolores voluptas magni aut sunt voluptates quidem et.',0,0,'1995-10-12 18:48:43'),(31,31,97,'Maxime magni totam sit rerum numquam odio accusantium. Qui neque et et quia.',0,1,'2010-05-10 17:53:08'),(32,32,13,'Tempore voluptatem aperiam ab nostrum. Facilis nulla impedit explicabo voluptatem. Esse sit aut repudiandae quisquam.',1,0,'1988-09-10 09:00:41'),(33,33,4,'Repudiandae eos omnis aut ut veritatis. Facere voluptate inventore ut. Veniam ducimus suscipit aut perferendis cumque cumque dolorem.',1,1,'1974-11-22 06:30:08'),(34,34,5,'Atque aliquid non nostrum vitae at sint rerum. Veniam et consequatur est odio nulla eaque. Nam vitae rerum eveniet excepturi occaecati dolor sint.',1,0,'1981-01-07 05:01:58'),(35,35,77,'Id ea fuga doloremque qui incidunt amet illo. Aut minima et accusantium aut doloribus error voluptatem. Quia quia ratione vel non temporibus ipsam eligendi.',1,0,'2001-03-22 21:57:27'),(36,36,31,'Cupiditate rem autem esse. Voluptatibus et dolor fuga quaerat ad eum. Cumque recusandae voluptas at minima.',0,1,'2012-09-22 00:52:01'),(37,37,69,'Eum magni eaque quam. Ipsum amet est autem sed dolores est. Debitis enim doloribus dolor adipisci.',1,1,'2007-03-22 01:10:41'),(38,38,68,'Cumque rerum sit corrupti. Enim et a aperiam numquam. Ut excepturi quasi asperiores enim. Mollitia est tenetur non quo iure.',0,0,'1973-02-25 15:06:33'),(39,39,5,'Odio at esse in sint numquam porro harum. Alias sed non autem placeat. Doloribus ut et aperiam commodi.',1,1,'2007-10-14 14:57:00'),(40,40,59,'Magni in voluptatem earum in. Sint tenetur qui voluptatum. Qui qui non itaque tempore et magnam.',1,1,'1998-08-19 08:28:14'),(41,41,75,'Perferendis itaque eum labore maiores aliquam. Impedit quis ut est ipsam fugit sit. Fugiat minima voluptas porro magnam beatae.',0,1,'1983-04-30 05:36:04'),(42,42,43,'Dolorem ab sit nihil praesentium. Aperiam repellendus est dolorem sunt non. Quam rem eligendi fuga dolor id aperiam rerum repellat.',0,0,'1999-01-10 11:09:30'),(43,43,32,'Sit maxime perspiciatis molestias eum neque voluptatem a. Delectus non enim vel ea aspernatur. Placeat ut soluta eos voluptatem et consequatur cum dicta. Saepe est placeat facilis aut beatae aspernatur.',1,0,'2007-12-15 17:16:17'),(44,44,72,'Repudiandae fuga est quo ex eveniet est natus eveniet. Modi nesciunt sed a nisi consequatur occaecati quasi distinctio. Voluptas amet quibusdam ut similique fugit magnam. Voluptas nesciunt soluta ut odio nostrum.',1,0,'2008-08-08 18:00:03'),(45,45,16,'Repudiandae totam delectus reiciendis asperiores dolores tempore sunt. Doloremque sit non doloremque ad. Aliquam dignissimos et at sit occaecati eius magnam. Accusantium officiis ipsa eligendi incidunt.',0,0,'2003-02-09 20:58:22'),(46,46,11,'Facilis fuga maxime ipsam facilis quae quod. Qui aliquam ipsa laboriosam sequi consequatur harum rerum. Minima error temporibus molestiae nihil et. Assumenda vero itaque voluptatem eum.',0,1,'1989-11-24 23:40:58'),(47,47,16,'Est vitae quo corrupti possimus amet dignissimos. Natus est numquam in ut qui provident. Laborum distinctio perferendis aut rerum. Non corporis voluptas quia blanditiis quo totam.',0,1,'2019-01-19 12:14:04'),(48,48,64,'Quas omnis et eum quisquam iusto rerum voluptatibus necessitatibus. Possimus facere asperiores necessitatibus voluptatem voluptatibus consequatur ut. Quibusdam et quis velit fuga vero.',1,1,'2020-07-12 23:35:27'),(49,49,72,'Alias amet eos magnam aut. Cum dolorum aut ipsam exercitationem ipsum maiores. Qui a est illum odio.',1,0,'1989-06-09 03:35:14'),(50,50,53,'Odit est quisquam tempora. Laborum aspernatur earum sapiente iste dolores voluptas autem. Vero cum enim in eum reprehenderit quod nesciunt. Fugit dolorum id saepe et eos enim eveniet voluptatem.',0,0,'1976-10-31 23:26:10'),(51,51,43,'Aliquid fuga dolorem sequi. Natus quod quia dolores aut voluptas. Cum labore ut velit quo nemo exercitationem.',1,1,'1978-12-23 20:06:11'),(52,52,99,'Ea sapiente veniam nisi impedit minima odit sapiente. Rem voluptatum veritatis minus. Vel pariatur voluptatibus voluptatem eos sapiente accusantium cumque.',1,1,'1970-02-07 18:59:39'),(53,53,53,'Iure officia excepturi tempore ex. Laboriosam incidunt veritatis doloribus possimus molestiae. Provident mollitia natus consectetur nulla amet. Eaque dignissimos odio ut perspiciatis.',1,0,'1993-09-04 09:02:17'),(54,54,96,'Distinctio illo quae placeat nihil ratione nemo iste. Ipsam maiores amet perferendis omnis ratione placeat eos dolores.',0,1,'1970-05-14 11:36:51'),(55,55,63,'Rerum ea consequuntur dolores ut sequi. Odit non illum quia optio illo. Dolorem a qui dolorum nostrum.',1,0,'2001-07-11 16:24:39'),(56,56,99,'Id fugit distinctio aliquam unde exercitationem fugiat. Voluptates et illo voluptatem ducimus explicabo. Explicabo doloribus aut sed quos consectetur minima ducimus.',0,0,'1984-01-18 21:35:39'),(57,57,88,'Cupiditate reprehenderit aliquam nihil labore. Dolor harum eum perferendis omnis sunt pariatur tempora. Saepe id eos eum et. Doloribus ullam voluptas in qui inventore.',0,0,'1979-06-13 08:00:21'),(58,58,48,'Ipsa vero minus porro et sequi totam cupiditate. Sed omnis exercitationem consequatur quidem est vel odit. Vero incidunt nihil harum fugit dolor temporibus ab blanditiis. Maxime veritatis sed iste doloribus.',1,0,'1978-11-18 13:59:26'),(59,59,16,'Magnam asperiores ut qui voluptates praesentium. Sunt et unde molestiae qui cupiditate ipsam. Culpa sunt similique non ea est quos. Quaerat optio optio ducimus architecto et voluptatem asperiores.',0,0,'2007-09-22 05:10:51'),(60,60,15,'Beatae veritatis unde voluptas. Vero similique eligendi omnis. Eum quia debitis possimus non rerum neque. Ut ea rem id sint.',1,1,'1992-11-27 21:47:01'),(61,61,74,'Ut quam cum hic quae qui qui aut autem. Occaecati maxime dolores suscipit aliquid est ea numquam. Quam consequatur qui quos officia voluptatem. Est autem quo cupiditate et laborum non.',1,1,'1999-09-28 06:46:45'),(62,62,12,'Iste aut quaerat dolore velit aut. Aut quia eligendi explicabo repudiandae enim et. Enim fuga sit est culpa maxime neque. Aut aut veniam est corporis.',1,0,'1980-07-01 08:49:53'),(63,63,28,'Reprehenderit dolor quos et odit consectetur quia eaque. Voluptate velit voluptatibus dolor commodi et qui quod. Perspiciatis et hic autem ipsa aut laboriosam. Dolorum tempora quia adipisci perspiciatis assumenda omnis fugit nostrum.',0,1,'1993-06-26 07:59:25'),(64,64,78,'Nulla corporis quae sequi aut alias. Accusamus consequatur dolorem accusantium expedita fugiat voluptates. Optio officia dolorum neque itaque.',1,0,'2002-12-01 20:44:40'),(65,65,17,'Mollitia ut quis non aperiam temporibus et. Ut sequi et rerum ut iste ut tempora ex. Ut voluptatem omnis adipisci. Magnam praesentium tempora ut cumque est impedit.',0,0,'1996-07-17 00:28:02'),(66,66,4,'Commodi sunt pariatur recusandae et voluptatibus et reiciendis. Odio asperiores dolore eos et ut rerum sed. Similique amet ut dolor nisi atque voluptatem. Fugiat qui hic dicta.',1,1,'1982-05-04 09:14:59'),(67,67,8,'Qui in nulla molestiae ratione cum laboriosam rerum quis. Rerum labore quaerat dolorum tenetur minus minima. Numquam nam non eaque ipsum.',1,1,'1999-10-27 13:45:03'),(68,68,85,'Repellendus veniam mollitia quia tenetur aut omnis ut. Et id nihil expedita voluptatibus molestiae qui quae. Quo fugit labore laudantium dolor et veritatis qui non.',0,1,'1990-01-17 16:08:20'),(69,69,72,'Qui quas nostrum et nihil. Rem nobis eos ut doloribus quam minima.',0,0,'1999-05-21 09:12:58'),(70,70,12,'Autem aut expedita quis fugiat natus. Voluptatem consequuntur accusantium velit error consequuntur molestiae fugit omnis. Sit hic quaerat commodi laborum enim aut.',1,0,'1972-07-06 14:10:49');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` int unsigned NOT NULL COMMENT 'Идентификатор строки',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `city` varchar(130) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Город проживания',
  `country` varchar(130) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Страна проживания',
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Профили';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','2006-07-11','Johnstonview','Latvia','2017-08-11 21:15:12'),(2,'f','2012-06-08','West Gina','Australia','1980-11-30 20:59:21'),(3,'f','1985-04-08','Mayertstad','Papua New Guinea','2016-10-10 09:25:02'),(4,'f','2020-01-12','Boyerside','Chile','1981-04-05 08:04:31'),(5,'m','1995-01-26','South Delphine','Bangladesh','1995-05-15 22:04:54'),(6,'m','1999-04-24','Lake Arleneville','Honduras','1977-12-01 20:54:25'),(7,'f','1971-07-01','Margarettechester','Botswana','1992-04-24 12:43:14'),(8,'f','1993-06-04','North Matteo','Saudi Arabia','1972-01-29 02:19:30'),(9,'f','1999-07-23','Jenkinstown','Qatar','2008-05-24 09:46:31'),(10,'m','1971-07-10','Hicklemouth','Honduras','1979-08-16 16:10:43'),(11,'m','1994-03-18','Koelpinstad','Turkmenistan','1994-10-17 20:57:01'),(12,'f','1972-03-28','South Liamouth','American Samoa','1973-06-13 03:34:07'),(13,'m','1975-06-13','Auerside','Sudan','2008-11-22 23:09:30'),(14,'m','1995-11-26','Jasttown','India','1994-12-11 16:48:38'),(15,'m','2007-07-29','Lizaton','Israel','1982-11-18 04:28:08'),(16,'m','1979-09-24','Huelmouth','Lithuania','2013-05-18 10:22:59'),(17,'f','1993-04-13','North Bernard','Ireland','1974-09-29 13:01:10'),(18,'m','2000-04-15','North Tessieburgh','Korea','1973-12-12 12:27:50'),(19,'f','2006-06-24','Hectorstad','Jordan','2018-03-30 18:23:45'),(20,'f','1980-12-04','South Christellehaven','Haiti','2019-05-20 01:51:23'),(21,'f','2016-04-07','Cummingsfurt','Guam','1988-10-08 02:57:38'),(22,'f','1990-10-30','New Urban','French Polynesia','2001-08-03 00:18:03'),(23,'f','1970-02-01','Hollyborough','Vanuatu','1973-03-07 16:07:10'),(24,'f','1979-10-07','Olenmouth','Falkland Islands (Malvinas)','1980-05-06 21:42:25'),(25,'f','1983-07-04','Kilbacktown','New Zealand','1980-05-13 07:40:29'),(26,'m','1970-01-25','Rollinville','India','2006-01-03 16:09:39'),(27,'f','1977-08-05','East June','Burkina Faso','2005-04-27 16:23:34'),(28,'m','1983-11-01','North Danny','Malaysia','2005-11-07 06:56:09'),(29,'f','1988-12-04','Rohanview','American Samoa','2004-12-29 21:50:37'),(30,'f','1985-11-25','South Lynn','Uruguay','2011-04-16 16:06:50'),(31,'f','1987-02-13','Mittieshire','Denmark','2014-03-07 19:14:28'),(32,'m','2020-04-30','New Ruthieville','American Samoa','1974-12-14 00:30:27'),(33,'m','1978-10-17','South Brockfurt','Bhutan','1973-09-04 05:48:00'),(34,'f','1990-09-22','South Bennettbury','Zimbabwe','1984-12-24 02:45:50'),(35,'m','2006-09-19','Matildechester','Switzerland','1973-01-02 12:34:10'),(36,'m','2009-10-30','North Guston','Djibouti','1974-01-08 15:25:10'),(37,'f','2015-12-01','New Hulda','Sao Tome and Principe','1996-02-28 18:50:24'),(38,'f','2014-10-04','East Jesseton','Samoa','1985-10-13 11:08:08'),(39,'f','1981-07-10','Osinskitown','Germany','1978-12-15 07:30:57'),(40,'f','1997-11-11','Elbertmouth','Tajikistan','1979-03-26 05:50:41'),(41,'m','1972-10-03','Murraystad','Congo','1974-04-23 04:52:02'),(42,'f','1978-07-21','West Marjolaine','Saint Barthelemy','1996-05-30 05:02:01'),(43,'m','1980-04-30','Macejkovicmouth','Libyan Arab Jamahiriya','2007-03-30 15:36:33'),(44,'m','1987-12-10','Santinoport','Uruguay','1985-10-08 02:57:09'),(45,'m','2004-06-05','Eichmannbury','Syrian Arab Republic','2020-10-03 03:07:08'),(46,'m','1980-09-06','Rutherfordmouth','Timor-Leste','1987-03-26 05:48:03'),(47,'f','1992-02-21','Port Zoila','Dominica','1979-01-11 14:57:02'),(48,'m','2000-03-16','Sawaynport','Lesotho','2001-01-22 17:45:35'),(49,'m','1991-07-03','Jackieville','Ethiopia','1970-07-01 06:59:50'),(50,'m','2020-02-26','East Catherineside','Central African Republic','1973-04-27 03:46:55'),(51,'f','2011-09-19','Smithfurt','Oman','1998-12-06 07:19:58'),(52,'m','1976-04-26','Port Vivienne','Norfolk Island','1986-03-03 03:28:26'),(53,'m','2014-04-28','Myriamfort','Brunei Darussalam','2007-05-17 18:33:37'),(54,'f','1982-04-13','Schmidtburgh','Bermuda','2010-01-27 06:01:25'),(55,'m','2016-11-29','Herzogport','Belize','1972-11-22 17:08:11'),(56,'m','1979-05-11','Hegmannberg','United States of America','1970-12-19 20:19:23'),(57,'m','1976-06-24','New Bryana','Iceland','1983-01-29 03:03:15'),(58,'f','2004-05-27','Lake Christiana','Guyana','1976-04-10 16:33:02'),(59,'m','2009-02-11','Idaburgh','Togo','2007-04-13 07:54:33'),(60,'f','1989-05-11','East Kimberlyborough','Cape Verde','2003-10-29 22:51:29'),(61,'f','2002-11-26','West Lukas','Niue','1982-10-01 14:11:11'),(62,'f','1994-04-28','Larsonside','Bhutan','2001-01-09 02:01:39'),(63,'f','2000-10-24','South Caleightown','Maldives','1980-04-15 15:50:25'),(64,'m','2010-12-04','Maximusmouth','Namibia','1991-07-23 13:22:15'),(65,'f','1974-11-17','Laurencestad','Wallis and Futuna','1976-05-13 01:17:18'),(66,'f','1970-01-05','Altheaton','Gambia','2010-02-05 20:28:20'),(67,'f','2015-07-02','Port Rafael','Hong Kong','1979-10-24 07:20:06'),(68,'m','2003-05-25','Daughertyport','Austria','2006-08-12 03:24:33'),(69,'m','1999-10-29','Jacobsonville','Cook Islands','1989-10-16 17:40:42'),(70,'m','1985-08-02','North Lucy','Sweden','1979-08-13 16:48:54'),(71,'f','2018-05-27','Port Jadyn','Bosnia and Herzegovina','2008-12-31 18:29:02'),(72,'m','1992-06-17','Considinechester','Wallis and Futuna','1976-01-29 14:29:18'),(73,'f','2010-10-18','New Horaciofort','South Georgia and the South Sandwich Islands','2016-04-09 05:56:24'),(74,'m','1999-09-28','Evahaven','Lithuania','1972-06-08 12:57:55'),(75,'m','2011-06-01','Lake Nikita','Guadeloupe','1970-10-18 23:15:02'),(76,'m','2006-07-04','West Leonstad','Syrian Arab Republic','1984-09-14 11:34:42'),(77,'f','2003-12-14','South Nicklaustown','South Georgia and the South Sandwich Islands','2012-07-29 06:31:12'),(78,'f','2016-02-17','Morarfurt','Netherlands Antilles','1985-11-15 14:29:53'),(79,'m','2012-06-26','New Jonathonshire','Guam','2006-02-25 17:14:16'),(80,'m','1988-06-02','South Ervin','Turks and Caicos Islands','1993-08-31 10:21:46'),(81,'f','2004-03-21','Champlinberg','Sao Tome and Principe','1982-05-29 17:07:07'),(82,'f','1981-07-09','Alyssonton','Guatemala','1972-10-15 09:20:50'),(83,'f','1988-05-13','North Claudeland','Jordan','2016-07-14 14:35:28'),(84,'m','2017-03-30','North Theodoramouth','Tanzania','2016-09-01 06:48:12'),(85,'f','1989-01-13','West Alec','Egypt','1996-12-22 15:07:02'),(86,'m','1996-02-24','New Lenore','Tokelau','2014-06-18 07:57:26'),(87,'m','1985-03-25','Mitchellshire','Northern Mariana Islands','1970-06-22 05:15:46'),(88,'m','1994-06-04','North Xavierborough','Bouvet Island (Bouvetoya)','1987-01-06 23:54:12'),(89,'f','1991-02-19','Feilmouth','Zimbabwe','2007-11-14 18:54:10'),(90,'m','1995-08-26','Wunschchester','Israel','1984-03-04 19:06:22'),(91,'f','2018-12-06','Lake Harrison','Ukraine','1985-10-26 10:45:55'),(92,'f','1991-05-12','East Vickyfort','Suriname','1984-12-13 20:05:44'),(93,'f','1994-08-08','Dickinsonbury','Finland','1973-07-04 18:35:10'),(94,'m','1995-01-19','New Masonbury','Estonia','2015-03-08 22:30:32'),(95,'f','1991-09-06','Lake Arno','Luxembourg','1979-09-22 02:45:39'),(96,'f','2013-09-19','Huldaside','Slovakia (Slovak Republic)','1997-04-10 21:48:18'),(97,'f','1982-10-19','Jaydahaven','Korea','1990-06-09 02:38:16'),(98,'f','1970-06-08','New Chelsey','Belarus','2007-11-29 13:15:13'),(99,'f','1981-09-13','Jalynfort','Nigeria','1995-03-05 00:43:55'),(100,'m','1977-02-16','Kaelabury','Costa Rica','2001-02-25 08:08:35');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relative_statuses`
--

DROP TABLE IF EXISTS `relative_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название статуса',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Статус родственности';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relative_statuses`
--

LOCK TABLES `relative_statuses` WRITE;
/*!40000 ALTER TABLE `relative_statuses` DISABLE KEYS */;
INSERT INTO `relative_statuses` VALUES (1,'relative','1973-12-18 15:41:23','2006-12-09 13:34:09'),(2,'not a relative','2012-03-06 23:04:41','1977-03-07 14:43:52');
/*!40000 ALTER TABLE `relative_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Почта',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Телефон',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Amy','Carroll','schumm.jordan@example.org','084.490.4927x8237','1995-08-15 10:07:41','2009-12-13 01:48:34'),(2,'Kiara','Bernhard','stanton.dallas@example.org','769-664-3708','2010-02-20 19:38:59','1990-08-11 16:22:32'),(3,'Rubie','Wehner','lgraham@example.net','598-779-1933','1971-07-29 21:05:48','2000-10-27 08:57:56'),(4,'Walter','Simonis','jjacobi@example.net','096.273.5577','1987-09-20 09:08:30','1996-07-11 13:58:02'),(5,'Horacio','Hessel','becker.myles@example.org','353-799-9240','2006-01-10 04:17:45','1976-07-13 17:53:26'),(6,'Shana','Blick','richard.thiel@example.com','1-350-017-8358','1980-08-16 23:48:31','2006-05-08 13:47:54'),(7,'Sienna','Fritsch','newton54@example.net','+36(5)4749776325','1972-08-14 06:50:16','1971-01-01 13:18:20'),(8,'Percival','Cassin','terence.jacobson@example.net','096-753-0345x1576','2017-04-13 21:30:36','2009-07-31 12:23:24'),(9,'Corine','Connelly','michale13@example.net','074-343-4469x633','1984-12-26 07:15:18','2001-06-20 02:29:13'),(10,'Grayce','Mitchell','simone.rogahn@example.org','1-754-381-6233x0707','2001-10-21 11:34:39','2009-07-17 23:17:40'),(11,'Junius','Smith','gwintheiser@example.com','(150)175-0582x961','1990-06-21 23:18:37','1975-01-07 23:59:57'),(12,'Percival','Kiehn','ymorar@example.net','873-238-5203x6882','1991-12-12 12:41:39','1985-09-07 09:46:59'),(13,'Oswaldo','Braun','llittel@example.com','01545346220','1971-09-11 21:36:06','1975-01-12 19:46:59'),(14,'Emmanuelle','Doyle','balistreri.virginie@example.org','287.008.4208x685','2004-06-06 20:02:38','2007-01-27 02:52:26'),(15,'Arely','Cronin','elias.stroman@example.net','+49(3)3004085911','1982-02-07 11:32:43','2016-09-13 04:34:48'),(16,'Anne','Wiza','vgutmann@example.com','1-663-927-2193x81405','1975-08-11 05:17:49','1979-05-05 21:03:18'),(17,'Samantha','Johnston','anderson.kris@example.com','(145)769-6284x40503','2008-11-29 18:16:04','2018-08-21 08:02:27'),(18,'Andreanne','Schneider','ana08@example.net','1-501-556-5574','2002-02-27 07:15:41','1995-01-16 10:22:47'),(19,'Rose','Howell','jeanie.white@example.net','199.581.8070x199','1997-04-02 05:55:36','1992-12-08 09:45:14'),(20,'Matilde','Stark','pagac.marilyne@example.net','443.001.7194x4133','2007-04-20 09:43:52','1970-04-17 04:07:01'),(21,'Aiden','Frami','arvid33@example.org','03401984393','1976-12-07 16:33:42','1989-06-06 11:16:04'),(22,'Rickey','Johnson','cruz23@example.net','(941)879-5346x488','1990-04-09 14:24:32','1981-04-09 13:45:10'),(23,'Sigrid','Glover','whirthe@example.com','(891)564-9241','1987-10-11 01:52:26','1992-04-06 21:18:45'),(24,'Amira','Satterfield','xavier00@example.com','(278)980-4018','2000-05-02 22:51:19','2016-07-13 13:58:51'),(25,'Kylie','Prosacco','little.jazmyn@example.net','04685348725','1980-11-19 16:33:19','1993-12-17 06:38:16'),(26,'Hannah','Schamberger','rschroeder@example.org','953-376-3416x5834','1997-07-11 18:34:23','1983-12-01 00:42:58'),(27,'Herman','Hintz','raphaelle.buckridge@example.org','(511)016-2353x3665','1971-06-18 21:51:35','1984-01-20 02:37:06'),(28,'Providenci','Kerluke','kirlin.ima@example.org','+18(8)0706446762','2008-10-04 05:51:36','1971-01-07 09:44:06'),(29,'Barry','Adams','gsipes@example.com','550.799.3548x41461','2002-04-14 17:41:27','1980-04-14 23:48:59'),(30,'Rosie','Swaniawski','mac97@example.net','00268927268','2013-03-07 11:41:33','1992-01-18 08:13:12'),(31,'Domenick','Kilback','gus.lemke@example.org','03904279993','1973-06-18 16:07:11','2018-01-22 07:46:10'),(32,'Ford','Koss','ylarkin@example.com','(533)201-0409','2006-04-30 08:55:41','1991-05-21 20:18:22'),(33,'Skylar','Bechtelar','stracke.wava@example.org','1-785-729-6612x321','1997-02-06 22:28:41','1987-01-09 04:19:34'),(34,'Wilburn','Hartmann','leda.gleason@example.net','603-380-7386x46510','2018-08-24 20:57:23','2009-10-10 09:13:07'),(35,'Rey','Raynor','gutmann.lazaro@example.net','1-778-138-2475','2020-03-22 12:35:29','1979-07-14 10:13:05'),(36,'Jaylon','Glover','vivian.block@example.org','+17(8)3772472231','1988-10-29 10:26:40','2010-12-17 13:28:01'),(37,'Annamarie','Medhurst','gleuschke@example.com','219.237.7520','2006-03-26 05:33:31','1975-06-21 15:11:30'),(38,'Delfina','Funk','zrunte@example.com','(203)844-5377','2004-08-01 21:58:19','2004-05-31 09:14:30'),(39,'Delaney','Bartell','eo\'conner@example.com','00461465993','1970-11-27 08:30:18','1990-07-23 09:58:36'),(40,'Carmelo','Sauer','laufderhar@example.com','(135)330-8886x5422','1986-05-22 17:26:54','2008-02-05 20:45:51'),(41,'Obie','Blanda','johnson.jadyn@example.net','(360)693-9231x04841','2014-06-04 04:15:06','2008-07-06 18:11:35'),(42,'Lillie','Schamberger','kihn.jo@example.net','00688500644','2002-03-23 16:24:34','1990-03-04 15:42:51'),(43,'Emmanuelle','Gusikowski','kira.reynolds@example.net','1-114-750-2479x1468','2007-03-17 15:38:13','1994-12-20 13:24:51'),(44,'Anais','Denesik','hodkiewicz.norris@example.org','1-822-655-5020x6143','1998-09-04 10:47:09','1975-02-04 23:49:38'),(45,'Justus','Wolf','mayer.lee@example.com','537.131.2137x4890','2008-09-21 10:21:56','2013-10-14 09:59:32'),(46,'Adeline','Stiedemann','kelli.mckenzie@example.net','1-804-490-3382','2016-05-21 21:43:35','2008-10-29 15:16:57'),(47,'Richmond','Sauer','upton.barbara@example.com','560-397-5369','1978-09-02 01:17:57','1976-09-01 15:38:06'),(48,'Rosa','Schmitt','alexandro.armstrong@example.com','1-303-643-9104x52580','2017-09-21 22:24:58','1995-07-11 01:19:02'),(49,'Melba','Doyle','dwindler@example.org','(935)314-6756','1972-02-22 20:18:24','1972-06-15 02:00:14'),(50,'Augusta','Runolfsdottir','jarvis18@example.org','1-846-361-5531x9320','2000-01-01 03:56:58','2010-12-08 16:49:21'),(51,'Patience','Koss','davis.carolanne@example.net','1-799-138-1145x420','1982-08-04 10:33:32','1995-09-04 18:36:09'),(52,'Dejah','Fadel','sandra.ondricka@example.net','1-183-333-0908','1974-03-22 09:22:32','2018-08-21 19:27:33'),(53,'Coty','Zemlak','schneider.vena@example.net','1-446-560-9848x97454','2007-07-05 04:55:52','2019-02-12 19:29:58'),(54,'Gaylord','Crist','amara57@example.com','+10(7)5191969496','1982-02-10 20:20:16','2001-10-12 23:33:46'),(55,'Orlando','Olson','reichert.harvey@example.org','1-477-914-4507x018','1974-08-11 13:39:05','2004-05-10 18:19:41'),(56,'June','Howell','witting.ron@example.org','+81(8)0945949992','2000-05-10 22:05:26','2019-06-14 22:43:26'),(57,'Jada','Koelpin','wilfred.hane@example.org','472-624-2239x728','1990-04-27 19:42:55','2011-12-20 04:56:48'),(58,'Adam','Halvorson','macey.mayert@example.org','(306)158-1303','1973-02-05 13:21:41','1994-06-24 15:09:15'),(59,'Camden','Mitchell','shields.green@example.com','(365)589-4899','1986-07-16 22:16:44','2016-11-13 11:37:18'),(60,'Giuseppe','Gleichner','pasquale05@example.com','059-183-5950x8844','2008-09-19 03:17:20','2012-06-11 00:41:39'),(61,'Jermaine','Harber','hassie.spinka@example.com','280.102.2911','2002-06-04 06:15:24','1997-12-22 02:31:41'),(62,'Melyssa','Labadie','hkshlerin@example.com','1-186-680-2620','1984-12-06 05:35:49','1976-04-28 15:35:02'),(63,'Zaria','Von','tstokes@example.org','(548)387-8123x530','2012-10-16 04:08:06','1985-12-25 11:39:04'),(64,'Stone','Trantow','presley.schmidt@example.net','846.192.8803','2019-03-25 22:33:43','2008-06-27 14:51:37'),(65,'Geraldine','Huel','hollie.leuschke@example.com','(266)596-2841x6182','2020-03-20 19:49:47','1992-06-06 21:29:37'),(66,'Hank','Mills','elinore42@example.org','(011)062-3229','2006-01-05 06:12:03','2012-09-30 08:05:30'),(67,'Lenora','Wunsch','candice.leuschke@example.com','579-339-3358','2011-11-21 14:21:15','2000-03-22 01:38:05'),(68,'Alice','O\'Hara','howell.martin@example.net','(047)022-3063','2004-06-14 03:39:52','1973-04-11 15:40:59'),(69,'Verona','Cruickshank','isabell.zulauf@example.org','592.927.1144','1970-12-21 05:02:16','1988-08-30 20:31:00'),(70,'Arielle','Wolf','xwilliamson@example.net','621-654-4605x942','1983-02-09 21:40:33','1980-01-18 14:38:24'),(71,'Ashton','Smith','tromp.gladys@example.org','454-607-6397x4281','2008-08-04 01:03:35','1981-08-10 12:49:16'),(72,'Torrance','Prohaska','jalon.wiegand@example.org','+67(8)1004980650','2010-03-15 16:11:34','1997-07-09 20:04:33'),(73,'Amber','Legros','tgrady@example.org','427.229.7556x148','2007-01-27 12:00:51','1973-11-16 08:21:46'),(74,'Rhianna','Kuphal','jacobs.delpha@example.org','739.928.5754x805','2019-10-04 17:41:42','1979-01-19 02:31:26'),(75,'Tristin','Satterfield','wfisher@example.com','1-894-940-1624x7930','1988-05-30 00:57:50','1996-10-27 22:54:25'),(76,'Anissa','Rau','xterry@example.net','1-928-053-4237x701','1986-01-11 21:36:40','1972-05-18 10:40:33'),(77,'Carole','Gusikowski','frederick20@example.com','(525)958-8966x1845','1986-01-26 14:05:45','1983-03-21 13:34:55'),(78,'Morton','Deckow','jaylan12@example.net','797.253.7400x17101','1986-01-31 22:19:53','2013-10-30 07:19:32'),(79,'River','McKenzie','nschuppe@example.org','805-011-9280x95268','2016-12-23 04:59:45','1995-02-05 01:17:39'),(80,'Ramon','Schowalter','lshields@example.com','1-161-171-1067','2008-10-12 10:42:15','1971-12-19 06:01:02'),(81,'Ayden','Heller','dsauer@example.net','1-966-039-5342','1991-02-09 21:32:56','1976-04-06 05:45:48'),(82,'Marisol','Hahn','gaylord.willie@example.com','(049)393-4305','1989-02-13 21:02:36','2013-02-22 16:59:54'),(83,'Dudley','Bogisich','block.pinkie@example.org','1-916-273-1249x258','2004-11-07 13:42:20','2001-12-23 15:43:51'),(84,'Erik','Klocko','clemmie91@example.com','1-144-350-2067x80016','1992-04-01 21:09:08','2008-01-31 02:51:27'),(85,'Erika','Reichel','ssenger@example.org','640.338.7734','2000-07-17 08:55:03','2017-05-06 18:57:48'),(86,'Adrianna','Koelpin','wilderman.colt@example.com','291-457-8045x900','1971-07-30 19:34:36','1971-10-26 02:06:29'),(87,'Claudine','McDermott','julie59@example.org','285.732.4117x7372','2009-03-23 09:38:30','1993-08-12 10:49:27'),(88,'Jordan','Labadie','reilly.leannon@example.net','318-565-4706','1994-07-13 06:17:06','2004-03-28 22:29:25'),(89,'Keara','Dickinson','prowe@example.com','609.811.1755','1979-09-13 04:26:41','1989-05-31 21:31:11'),(90,'Erich','Kerluke','csanford@example.org','1-262-041-6282x08247','1972-01-20 02:46:15','1978-02-09 07:51:48'),(91,'Kraig','Boyer','nmitchell@example.com','1-471-508-7469x881','2009-06-18 20:42:00','2005-09-04 05:11:21'),(92,'Vernon','Rempel','einar.stamm@example.org','106.634.1230x1740','1997-11-05 20:22:27','2007-12-27 03:46:34'),(93,'Rasheed','Schiller','lorine28@example.org','1-584-849-1991x40796','1979-12-07 18:03:59','2011-10-23 03:27:47'),(94,'Shanny','Armstrong','hailee.welch@example.org','1-602-813-0545','2001-05-20 23:46:10','1973-03-02 01:39:38'),(95,'Keely','Emmerich','lemke.daniela@example.com','156-944-0484','1974-05-14 18:21:05','1976-12-16 18:41:55'),(96,'Nikita','Corwin','mcdermott.alessandra@example.net','320.681.6002','2000-07-25 02:30:08','2009-06-05 03:52:36'),(97,'Bonnie','Swaniawski','goldner.ambrose@example.net','632.303.1604','2009-02-06 03:08:18','2000-12-25 05:57:15'),(98,'Richard','Haley','sleffler@example.com','172.580.6668','2009-02-20 03:52:20','1986-01-31 15:46:42'),(99,'Danyka','Hackett','wiegand.lily@example.net','819-081-1232','1986-04-21 09:36:30','2008-08-06 20:42:34'),(100,'Haylee','Ortiz','howell.lemke@example.com','(974)994-8729x657','2014-11-21 20:06:06','1979-03-25 11:37:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-17 19:29:47
