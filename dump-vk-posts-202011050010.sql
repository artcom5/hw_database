-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

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
-- Table structure for table `target_types`
--

DROP TABLE IF EXISTS `target_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Типы лайков';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_types`
--

LOCK TABLES `target_types` WRITE;
/*!40000 ALTER TABLE `target_types` DISABLE KEYS */;
INSERT INTO `target_types` VALUES (1,'message','2020-10-31 16:42:59'),(2,'users','2020-10-31 16:42:59'),(3,'media','2020-10-31 16:42:59'),(4,'posts','2020-10-31 16:42:59');
/*!40000 ALTER TABLE `target_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `community_id` int unsigned DEFAULT NULL,
  `head` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT '1',
  `is_archived` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `posts_user_id_fk` (`user_id`),
  KEY `posts_community_id_fk` (`community_id`),
  KEY `posts_media_id_fk` (`media_id`),
  CONSTRAINT `posts_community_id_fk` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_media_id_fk` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица постов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,77,18,'Howell','Quo modi maxime qui rerum et commodi nemo. Quaerat nesciunt error est consequatur cum quae nulla. Impedit fugit reprehenderit dolore quis sunt dolor.',96,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(2,62,4,'Doyle','Iusto architecto necessitatibus earum at. Quas nobis quo autem quia.',46,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(3,76,7,'Emmerich','Debitis earum voluptas dicta ratione vero neque odio. Consequatur doloremque quisquam voluptas eveniet. Soluta nulla omnis id vero alias illum voluptas. Qui qui aperiam officia.',16,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(4,95,16,'Mitchell','Minima consequatur aperiam numquam fuga rerum est at. Aliquam minus ut optio voluptatum ipsam pariatur accusantium et. Vel et dolorem sapiente neque.',15,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(5,48,5,'Denesik','Quia similique qui minima eaque eaque amet qui ipsum. Velit sit quis id dolor. Error optio inventore aliquam libero molestias. Beatae sunt facere sint cumque et.',55,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00'),(6,53,19,'Stark','Id cumque ut quibusdam ex numquam nam. Repellendus nobis omnis pariatur omnis quia eaque quia corporis. Et culpa minus autem molestias. Numquam est odio culpa praesentium qui.',96,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(7,19,12,'Von','Aut tenetur at totam quo qui odio eos. Saepe error inventore illo in doloremque. Saepe iste vitae tempora esse suscipit voluptas.',13,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00'),(8,37,18,'Legros','Praesentium et repellat deleniti quo. Alias architecto quia odio eos aspernatur vero. Sit consequuntur nisi iste omnis facilis.',99,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(9,28,3,'Wehner','Voluptatum aut earum tenetur ad. Impedit laboriosam possimus id voluptas nemo soluta reiciendis corporis. Voluptas eligendi perspiciatis quo a.',44,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00'),(10,28,10,'Denesik','Quas modi provident provident numquam ipsa ex. Repellat explicabo eum qui quam et sed possimus. Dolor et rem nulla non.',10,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(11,57,14,'Koss','Deleniti officiis velit dolor soluta et. Voluptatem architecto et quia eveniet earum. Nemo amet doloribus aspernatur commodi culpa.',38,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(12,99,16,'Halvorson','Enim nobis sint eaque sint qui. Rerum saepe sit dolorem earum illum. Voluptas consequatur laborum ducimus eum voluptate. Dolor eius et accusantium modi nemo.',62,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(13,22,9,'Prohaska','Est assumenda iure tempora aut dignissimos. Est sapiente asperiores sunt suscipit. Iure aut mollitia sit consequatur similique. Aut ut officiis explicabo asperiores saepe maiores.',37,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(14,14,18,'Simonis','Nihil omnis aut rerum eum est. Similique beatae eos natus et rerum similique. Aliquid consequatur nihil praesentium dolorum quaerat doloribus accusantium sed.',66,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(15,4,13,'Hintz','Et ea et quis mollitia sint mollitia autem. Quae tempora aspernatur sit pariatur. Dolore molestias quis enim mollitia eos harum. Accusamus est vitae iure qui.',17,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(16,78,2,'Schiller','Suscipit unde eveniet qui quia voluptatibus non. Dolor quo adipisci et tenetur. Blanditiis consectetur voluptas temporibus delectus.',67,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(17,75,10,'Runolfsdottir','Nihil et libero at assumenda et qui. Magnam unde velit nulla sit nobis. Exercitationem quos qui beatae est.',74,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(18,43,9,'Von','Quis autem quod quia itaque sunt est non. Iure tenetur nam natus explicabo minus qui. Voluptatem quia fuga iure amet.',1,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(19,88,6,'Raynor','Velit quia atque suscipit est quis sint. Tenetur laboriosam aliquid commodi rerum amet quidem nihil. Reiciendis saepe fuga dolorem cumque deserunt quos et.',20,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(20,11,20,'Gusikowski','Et doloribus eligendi delectus rem sunt soluta unde. Delectus quisquam quo velit minus et nemo. Dolor doloribus consequuntur repellat sit debitis.',47,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(21,89,5,'Glover','Ea aut dolor qui. Cupiditate voluptatem porro animi blanditiis reiciendis.',34,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(22,11,15,'Koss','Consectetur aliquid atque velit dolor voluptatibus dolorum. Porro vitae sit quae. Et voluptate placeat porro sunt.',16,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(23,88,8,'Labadie','Sint blanditiis et eum harum ut. Voluptatem incidunt eos ea vel maxime earum amet. Beatae impedit eaque cum architecto. Harum praesentium non quasi sequi ea.',84,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(24,8,13,'Prohaska','Ullam inventore eveniet porro molestias alias. Sequi doloribus ea mollitia odio neque. Autem nisi non suscipit. Velit amet quaerat fugit.',76,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00'),(25,73,20,'Schiller','Iste vero optio voluptatem vitae. Voluptate ipsum provident sit odio dolorem. Cupiditate praesentium consequatur quia ea. Commodi doloribus eligendi et vero nesciunt neque.',58,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(26,44,19,'Smith','Ducimus maxime nulla enim excepturi. Id fugit maiores magnam fugiat accusamus est. Et nihil hic corrupti veniam veritatis facilis. Velit nulla rem qui ut.',39,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(27,97,17,'Legros','Voluptas qui explicabo ut id. Delectus corporis qui ratione exercitationem reprehenderit neque. Ut error praesentium exercitationem veritatis veniam voluptas esse enim.',45,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(28,55,7,'Koelpin','Iste non accusamus necessitatibus enim nihil. Ducimus quaerat officiis quo quam. Fugiat quos minima laboriosam recusandae labore.',78,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(29,81,10,'Smith','Illum nobis veritatis doloribus. Aliquam ab sint ducimus consequatur ut qui. Unde ut molestias provident consequatur. Voluptatibus iste distinctio ut voluptas aliquam reprehenderit ducimus.',71,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(30,39,8,'Wehner','Ratione qui voluptas ex et nihil quia inventore. Et eius exercitationem excepturi fugiat a qui qui ut. Nemo non ut dolore numquam quia placeat ut. Aut dolores voluptas magni aut sunt voluptates quidem et.',76,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(31,52,2,'Medhurst','Maxime magni totam sit rerum numquam odio accusantium. Qui neque et et quia.',48,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(32,44,20,'Huel','Tempore voluptatem aperiam ab nostrum. Facilis nulla impedit explicabo voluptatem. Esse sit aut repudiandae quisquam.',50,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00'),(33,61,5,'Doyle','Repudiandae eos omnis aut ut veritatis. Facere voluptate inventore ut. Veniam ducimus suscipit aut perferendis cumque cumque dolorem.',29,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(34,74,3,'Labadie','Atque aliquid non nostrum vitae at sint rerum. Veniam et consequatur est odio nulla eaque. Nam vitae rerum eveniet excepturi occaecati dolor sint.',44,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(35,86,14,'Hahn','Id ea fuga doloremque qui incidunt amet illo. Aut minima et accusantium aut doloribus error voluptatem. Quia quia ratione vel non temporibus ipsam eligendi.',35,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(36,8,5,'Wolf','Cupiditate rem autem esse. Voluptatibus et dolor fuga quaerat ad eum. Cumque recusandae voluptas at minima.',18,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(37,83,20,'Blick','Eum magni eaque quam. Ipsum amet est autem sed dolores est. Debitis enim doloribus dolor adipisci.',98,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00'),(38,90,1,'Schowalter','Cumque rerum sit corrupti. Enim et a aperiam numquam. Ut excepturi quasi asperiores enim. Mollitia est tenetur non quo iure.',40,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(39,1,11,'Fritsch','Odio at esse in sint numquam porro harum. Alias sed non autem placeat. Doloribus ut et aperiam commodi.',2,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(40,34,1,'Sauer','Magni in voluptatem earum in. Sint tenetur qui voluptatum. Qui qui non itaque tempore et magnam.',22,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(41,65,20,'Blick','Perferendis itaque eum labore maiores aliquam. Impedit quis ut est ipsam fugit sit. Fugiat minima voluptas porro magnam beatae.',90,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(42,24,13,'Adams','Dolorem ab sit nihil praesentium. Aperiam repellendus est dolorem sunt non. Quam rem eligendi fuga dolor id aperiam rerum repellat.',17,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00'),(43,24,3,'Bogisich','Sit maxime perspiciatis molestias eum neque voluptatem a. Delectus non enim vel ea aspernatur. Placeat ut soluta eos voluptatem et consequatur cum dicta. Saepe est placeat facilis aut beatae aspernatur.',92,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00'),(44,48,3,'Schowalter','Repudiandae fuga est quo ex eveniet est natus eveniet. Modi nesciunt sed a nisi consequatur occaecati quasi distinctio. Voluptas amet quibusdam ut similique fugit magnam. Voluptas nesciunt soluta ut odio nostrum.',73,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(45,69,1,'Hintz','Repudiandae totam delectus reiciendis asperiores dolores tempore sunt. Doloremque sit non doloremque ad. Aliquam dignissimos et at sit occaecati eius magnam. Accusantium officiis ipsa eligendi incidunt.',3,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(46,100,18,'Von','Facilis fuga maxime ipsam facilis quae quod. Qui aliquam ipsa laboriosam sequi consequatur harum rerum. Minima error temporibus molestiae nihil et. Assumenda vero itaque voluptatem eum.',21,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00'),(47,93,11,'Mitchell','Est vitae quo corrupti possimus amet dignissimos. Natus est numquam in ut qui provident. Laborum distinctio perferendis aut rerum. Non corporis voluptas quia blanditiis quo totam.',89,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(48,65,7,'Glover','Quas omnis et eum quisquam iusto rerum voluptatibus necessitatibus. Possimus facere asperiores necessitatibus voluptatem voluptatibus consequatur ut. Quibusdam et quis velit fuga vero.',55,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(49,45,6,'Stiedemann','Alias amet eos magnam aut. Cum dolorum aut ipsam exercitationem ipsum maiores. Qui a est illum odio.',66,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(50,31,17,'Satterfield','Odit est quisquam tempora. Laborum aspernatur earum sapiente iste dolores voluptas autem. Vero cum enim in eum reprehenderit quod nesciunt. Fugit dolorum id saepe et eos enim eveniet voluptatem.',19,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(51,19,3,'Glover','Aliquid fuga dolorem sequi. Natus quod quia dolores aut voluptas. Cum labore ut velit quo nemo exercitationem.',83,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(52,99,8,'Koss','Ea sapiente veniam nisi impedit minima odit sapiente. Rem voluptatum veritatis minus. Vel pariatur voluptatibus voluptatem eos sapiente accusantium cumque.',53,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(53,40,11,'Connelly','Iure officia excepturi tempore ex. Laboriosam incidunt veritatis doloribus possimus molestiae. Provident mollitia natus consectetur nulla amet. Eaque dignissimos odio ut perspiciatis.',40,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(54,2,5,'Funk','Distinctio illo quae placeat nihil ratione nemo iste. Ipsam maiores amet perferendis omnis ratione placeat eos dolores.',48,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00'),(55,91,4,'Kilback','Rerum ea consequuntur dolores ut sequi. Odit non illum quia optio illo. Dolorem a qui dolorum nostrum.',30,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(56,48,5,'Mills','Id fugit distinctio aliquam unde exercitationem fugiat. Voluptates et illo voluptatem ducimus explicabo. Explicabo doloribus aut sed quos consectetur minima ducimus.',51,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(57,66,2,'Schowalter','Cupiditate reprehenderit aliquam nihil labore. Dolor harum eum perferendis omnis sunt pariatur tempora. Saepe id eos eum et. Doloribus ullam voluptas in qui inventore.',57,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(58,88,3,'Hackett','Ipsa vero minus porro et sequi totam cupiditate. Sed omnis exercitationem consequatur quidem est vel odit. Vero incidunt nihil harum fugit dolor temporibus ab blanditiis. Maxime veritatis sed iste doloribus.',79,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(59,38,1,'Labadie','Magnam asperiores ut qui voluptates praesentium. Sunt et unde molestiae qui cupiditate ipsam. Culpa sunt similique non ea est quos. Quaerat optio optio ducimus architecto et voluptatem asperiores.',34,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00'),(60,27,10,'Howell','Beatae veritatis unde voluptas. Vero similique eligendi omnis. Eum quia debitis possimus non rerum neque. Ut ea rem id sint.',17,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(61,21,14,'Cassin','Ut quam cum hic quae qui qui aut autem. Occaecati maxime dolores suscipit aliquid est ea numquam. Quam consequatur qui quos officia voluptatem. Est autem quo cupiditate et laborum non.',70,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(62,25,16,'Johnson','Iste aut quaerat dolore velit aut. Aut quia eligendi explicabo repudiandae enim et. Enim fuga sit est culpa maxime neque. Aut aut veniam est corporis.',87,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(63,61,14,'Gusikowski','Reprehenderit dolor quos et odit consectetur quia eaque. Voluptate velit voluptatibus dolor commodi et qui quod. Perspiciatis et hic autem ipsa aut laboriosam. Dolorum tempora quia adipisci perspiciatis assumenda omnis fugit nostrum.',94,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(64,28,13,'Corwin','Nulla corporis quae sequi aut alias. Accusamus consequatur dolorem accusantium expedita fugiat voluptates. Optio officia dolorum neque itaque.',76,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(65,56,16,'Satterfield','Mollitia ut quis non aperiam temporibus et. Ut sequi et rerum ut iste ut tempora ex. Ut voluptatem omnis adipisci. Magnam praesentium tempora ut cumque est impedit.',79,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(66,98,14,'Koss','Commodi sunt pariatur recusandae et voluptatibus et reiciendis. Odio asperiores dolore eos et ut rerum sed. Similique amet ut dolor nisi atque voluptatem. Fugiat qui hic dicta.',6,0,0,'2020-10-31 17:15:31','2020-10-31 17:30:13'),(67,21,12,'Raynor','Qui in nulla molestiae ratione cum laboriosam rerum quis. Rerum labore quaerat dolorum tenetur minus minima. Numquam nam non eaque ipsum.',96,0,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(68,10,10,'Schamberger','Repellendus veniam mollitia quia tenetur aut omnis ut. Et id nihil expedita voluptatibus molestiae qui quae. Quo fugit labore laudantium dolor et veritatis qui non.',5,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00'),(69,86,19,'Zemlak','Qui quas nostrum et nihil. Rem nobis eos ut doloribus quam minima.',12,1,1,'2020-10-31 17:15:31','2020-10-31 17:37:52'),(70,99,11,'Cronin','Autem aut expedita quis fugiat natus. Voluptatem consequuntur accusantium velit error consequuntur molestiae fugit omnis. Sit hic quaerat commodi laborum enim aut.',41,1,0,'2020-10-31 17:15:31','2020-10-31 17:37:00');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `target_id` int unsigned NOT NULL,
  `target_type_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создание строки',
  PRIMARY KEY (`id`),
  KEY `likes_target_id_fk` (`target_id`),
  KEY `likes_user_id_fk` (`user_id`),
  KEY `likes_target_types_id_fk` (`target_type_id`),
  CONSTRAINT `likes_target_id_fk` FOREIGN KEY (`target_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `likes_target_types_id_fk` FOREIGN KEY (`target_type_id`) REFERENCES `target_types` (`id`),
  CONSTRAINT `likes_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица лайков';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,88,34,3,'2020-10-31 16:45:20'),(2,77,17,2,'2020-10-31 16:45:20'),(3,28,53,3,'2020-10-31 16:45:20'),(4,25,2,3,'2020-10-31 16:45:20'),(5,28,62,2,'2020-10-31 16:45:20'),(6,60,24,1,'2020-10-31 16:45:20'),(7,37,3,4,'2020-10-31 16:45:20'),(8,9,14,2,'2020-10-31 16:45:20'),(9,73,60,1,'2020-10-31 16:45:20'),(10,51,46,2,'2020-10-31 16:45:20'),(11,24,48,2,'2020-10-31 16:45:20'),(12,85,34,3,'2020-10-31 16:45:20'),(13,73,26,1,'2020-10-31 16:45:20'),(14,68,26,4,'2020-10-31 16:45:20'),(15,20,54,4,'2020-10-31 16:45:20'),(16,14,49,1,'2020-10-31 16:45:20'),(17,52,13,4,'2020-10-31 16:45:20'),(18,86,57,4,'2020-10-31 16:45:20'),(19,41,37,2,'2020-10-31 16:45:20'),(20,1,13,1,'2020-10-31 16:45:20'),(21,52,24,2,'2020-10-31 16:45:20'),(22,39,11,3,'2020-10-31 16:45:20'),(23,45,50,1,'2020-10-31 16:45:20'),(24,62,8,4,'2020-10-31 16:45:20'),(25,79,30,3,'2020-10-31 16:45:20'),(26,18,57,2,'2020-10-31 16:45:20'),(27,85,54,2,'2020-10-31 16:45:20'),(28,80,28,4,'2020-10-31 16:45:20'),(29,17,46,1,'2020-10-31 16:45:20'),(30,90,4,2,'2020-10-31 16:45:20'),(31,94,25,1,'2020-10-31 16:45:20'),(32,93,42,3,'2020-10-31 16:45:20'),(33,45,64,2,'2020-10-31 16:45:20'),(34,96,53,2,'2020-10-31 16:45:20'),(35,29,2,3,'2020-10-31 16:45:20'),(36,69,60,1,'2020-10-31 16:45:20'),(37,11,15,3,'2020-10-31 16:45:20'),(38,55,33,2,'2020-10-31 16:45:20'),(39,5,49,2,'2020-10-31 16:45:20'),(40,98,5,3,'2020-10-31 16:45:20'),(41,12,20,4,'2020-10-31 16:45:20'),(42,83,12,3,'2020-10-31 16:45:20'),(43,19,3,2,'2020-10-31 16:45:20'),(44,56,45,1,'2020-10-31 16:45:20'),(45,97,7,3,'2020-10-31 16:45:20'),(46,9,40,1,'2020-10-31 16:45:20'),(47,44,37,4,'2020-10-31 16:45:20'),(48,1,66,1,'2020-10-31 16:45:20'),(49,39,7,1,'2020-10-31 16:45:20'),(50,2,48,1,'2020-10-31 16:45:20'),(51,35,7,3,'2020-10-31 16:45:20'),(52,94,30,4,'2020-10-31 16:45:20'),(53,96,58,2,'2020-10-31 16:45:20'),(54,65,60,3,'2020-10-31 16:45:20'),(55,90,55,4,'2020-10-31 16:45:20'),(56,87,24,1,'2020-10-31 16:45:20'),(57,36,27,4,'2020-10-31 16:45:20'),(58,31,60,2,'2020-10-31 16:45:20'),(59,2,9,4,'2020-10-31 16:45:20'),(60,82,3,2,'2020-10-31 16:45:20'),(61,67,60,1,'2020-10-31 16:45:20'),(62,29,9,2,'2020-10-31 16:45:20'),(63,22,4,4,'2020-10-31 16:45:20'),(64,48,63,4,'2020-10-31 16:45:20'),(65,100,22,1,'2020-10-31 16:45:20'),(66,56,60,3,'2020-10-31 16:45:20'),(67,69,22,4,'2020-10-31 16:45:20'),(68,17,2,2,'2020-10-31 16:45:20'),(69,88,11,4,'2020-10-31 16:45:20'),(70,40,52,4,'2020-10-31 16:45:20');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-05  0:10:47
