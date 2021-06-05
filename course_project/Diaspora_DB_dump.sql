-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: diaspora_production
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_deletions`
--

DROP TABLE IF EXISTS `account_deletions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_deletions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_account_deletions_on_person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_deletions`
--

LOCK TABLES `account_deletions` WRITE;
/*!40000 ALTER TABLE `account_deletions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_deletions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_migrations`
--

DROP TABLE IF EXISTS `account_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `old_person_id` int NOT NULL,
  `new_person_id` int NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_account_migrations_on_old_person_id_and_new_person_id` (`old_person_id`,`new_person_id`),
  UNIQUE KEY `index_account_migrations_on_old_person_id` (`old_person_id`),
  KEY `fk_rails_610fe19943` (`new_person_id`),
  CONSTRAINT `fk_rails_610fe19943` FOREIGN KEY (`new_person_id`) REFERENCES `people` (`id`),
  CONSTRAINT `fk_rails_ddbe553eee` FOREIGN KEY (`old_person_id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_migrations`
--

LOCK TABLES `account_migrations` WRITE;
/*!40000 ALTER TABLE `account_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','production','2021-06-03 20:19:47','2021-06-03 20:19:47');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspect_memberships`
--

DROP TABLE IF EXISTS `aspect_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspect_memberships` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aspect_id` int NOT NULL,
  `contact_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_aspect_memberships_on_aspect_id_and_contact_id` (`aspect_id`,`contact_id`),
  KEY `index_aspect_memberships_on_aspect_id` (`aspect_id`),
  KEY `index_aspect_memberships_on_contact_id` (`contact_id`),
  CONSTRAINT `aspect_memberships_aspect_id_fk` FOREIGN KEY (`aspect_id`) REFERENCES `aspects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `aspect_memberships_contact_id_fk` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspect_memberships`
--

LOCK TABLES `aspect_memberships` WRITE;
/*!40000 ALTER TABLE `aspect_memberships` DISABLE KEYS */;
INSERT INTO `aspect_memberships` VALUES (1,4,1,'2021-06-04 13:04:40','2021-06-04 13:04:40'),(2,8,2,'2021-06-04 13:28:42','2021-06-04 13:28:42'),(3,3,1,'2021-06-04 13:34:01','2021-06-04 13:34:01'),(4,2,3,'2021-06-04 13:34:33','2021-06-04 13:34:33'),(5,5,2,'2021-06-04 13:36:28','2021-06-04 13:36:28'),(7,9,3,'2021-06-04 13:40:19','2021-06-04 13:40:19'),(8,9,1,'2021-06-04 13:40:20','2021-06-04 13:40:20'),(9,13,5,'2021-06-04 13:43:04','2021-06-04 13:43:04'),(10,12,6,'2021-06-04 13:45:38','2021-06-04 13:45:38'),(11,10,5,'2021-06-04 14:00:18','2021-06-04 14:00:18'),(12,10,8,'2021-06-04 14:00:35','2021-06-04 14:00:35'),(13,14,8,'2021-06-04 14:03:58','2021-06-04 14:03:58'),(14,14,6,'2021-06-04 14:03:59','2021-06-04 14:03:59'),(15,14,5,'2021-06-04 14:04:00','2021-06-04 14:04:00'),(16,2,7,'2021-06-04 14:10:01','2021-06-04 14:10:01'),(17,18,10,'2021-06-04 14:12:42','2021-06-04 14:12:42'),(18,17,10,'2021-06-04 14:21:06','2021-06-04 14:21:06'),(19,15,11,'2021-06-04 14:21:15','2021-06-04 14:21:15'),(20,16,13,'2021-06-04 14:21:26','2021-06-04 14:21:26'),(21,15,15,'2021-06-04 14:21:36','2021-06-04 14:21:36'),(22,22,17,'2021-06-04 14:28:30','2021-06-04 14:28:30'),(23,2,12,'2021-06-04 14:30:01','2021-06-04 14:30:01'),(24,19,17,'2021-06-04 14:31:37','2021-06-04 14:31:37'),(25,20,18,'2021-06-04 14:31:44','2021-06-04 14:31:44'),(26,20,20,'2021-06-04 14:31:51','2021-06-04 14:31:51'),(27,20,22,'2021-06-04 14:33:20','2021-06-04 14:33:20'),(28,1,23,'2021-06-04 14:33:51','2021-06-04 14:33:51');
/*!40000 ALTER TABLE `aspect_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspect_visibilities`
--

DROP TABLE IF EXISTS `aspect_visibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspect_visibilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shareable_id` int NOT NULL,
  `aspect_id` int NOT NULL,
  `shareable_type` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'Post',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_aspect_visibilities_on_shareable_and_aspect_id` (`shareable_id`,`shareable_type`(189),`aspect_id`),
  KEY `index_aspect_visibilities_on_aspect_id` (`aspect_id`),
  KEY `index_aspect_visibilities_on_shareable_id_and_shareable_type` (`shareable_id`,`shareable_type`(190)),
  CONSTRAINT `aspect_visibilities_aspect_id_fk` FOREIGN KEY (`aspect_id`) REFERENCES `aspects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspect_visibilities`
--

LOCK TABLES `aspect_visibilities` WRITE;
/*!40000 ALTER TABLE `aspect_visibilities` DISABLE KEYS */;
INSERT INTO `aspect_visibilities` VALUES (1,1,1,'Post'),(2,1,2,'Post'),(3,1,3,'Post'),(4,1,4,'Post'),(5,2,1,'Post'),(6,2,2,'Post'),(7,2,3,'Post'),(8,2,4,'Post'),(9,3,1,'Post'),(10,3,2,'Post'),(11,3,3,'Post'),(12,3,4,'Post'),(13,4,1,'Post'),(14,4,2,'Post'),(15,4,3,'Post'),(16,4,4,'Post'),(17,5,1,'Post'),(18,5,2,'Post'),(19,5,3,'Post'),(20,5,4,'Post'),(21,9,5,'Post'),(22,9,6,'Post'),(23,9,7,'Post'),(24,9,8,'Post'),(25,16,2,'Post'),(26,21,5,'Post'),(27,21,6,'Post'),(28,21,7,'Post'),(29,21,8,'Post'),(30,3,5,'Photo'),(31,3,6,'Photo'),(32,3,7,'Photo'),(33,3,8,'Photo'),(34,30,10,'Post'),(35,31,10,'Post'),(36,32,10,'Post'),(37,32,11,'Post'),(38,32,12,'Post'),(39,32,13,'Post'),(40,33,10,'Post'),(41,33,11,'Post'),(42,33,12,'Post'),(43,33,13,'Post'),(44,33,14,'Post'),(45,37,5,'Post'),(46,37,6,'Post'),(47,37,7,'Post'),(48,37,8,'Post'),(49,50,15,'Post'),(50,50,16,'Post'),(51,50,17,'Post'),(52,50,18,'Post'),(53,52,15,'Post'),(54,52,16,'Post'),(55,52,17,'Post'),(56,52,18,'Post'),(57,53,16,'Post'),(58,54,16,'Post'),(59,54,17,'Post');
/*!40000 ALTER TABLE `aspect_visibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspects`
--

DROP TABLE IF EXISTS `aspects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `order_id` int DEFAULT NULL,
  `chat_enabled` tinyint(1) DEFAULT '0',
  `post_default` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_aspects_on_user_id_and_name` (`user_id`,`name`(190)),
  KEY `index_aspects_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspects`
--

LOCK TABLES `aspects` WRITE;
/*!40000 ALTER TABLE `aspects` DISABLE KEYS */;
INSERT INTO `aspects` VALUES (1,'Family',1,'2021-06-04 13:04:39','2021-06-04 13:04:39',1,0,1),(2,'Friends',1,'2021-06-04 13:04:39','2021-06-04 13:04:39',2,0,1),(3,'Work',1,'2021-06-04 13:04:39','2021-06-04 13:04:39',3,0,1),(4,'Acquaintances',1,'2021-06-04 13:04:39','2021-06-04 13:04:39',4,0,1),(5,'Family',2,'2021-06-04 13:28:42','2021-06-04 13:28:42',1,0,1),(6,'Friends',2,'2021-06-04 13:28:42','2021-06-04 13:28:42',2,0,1),(7,'Work',2,'2021-06-04 13:28:42','2021-06-04 13:28:42',3,0,1),(8,'Acquaintances',2,'2021-06-04 13:28:42','2021-06-04 13:28:42',4,0,1),(9,'space',1,'2021-06-04 13:40:15','2021-06-04 13:40:15',5,0,1),(10,'Family',3,'2021-06-04 13:43:04','2021-06-04 13:43:04',1,0,1),(11,'Friends',3,'2021-06-04 13:43:04','2021-06-04 13:43:04',2,0,1),(12,'Work',3,'2021-06-04 13:43:04','2021-06-04 13:43:04',3,0,1),(13,'Acquaintances',3,'2021-06-04 13:43:04','2021-06-04 13:43:04',4,0,1),(14,'swimming pool team',3,'2021-06-04 14:03:55','2021-06-04 14:03:55',5,0,1),(15,'Family',4,'2021-06-04 14:12:42','2021-06-04 14:12:42',1,0,1),(16,'Friends',4,'2021-06-04 14:12:42','2021-06-04 14:12:42',2,0,1),(17,'Work',4,'2021-06-04 14:12:42','2021-06-04 14:12:42',3,0,1),(18,'Acquaintances',4,'2021-06-04 14:12:42','2021-06-04 14:12:42',4,0,1),(19,'Family',5,'2021-06-04 14:28:30','2021-06-04 14:28:30',1,0,1),(20,'Friends',5,'2021-06-04 14:28:30','2021-06-04 14:28:30',2,0,1),(21,'Work',5,'2021-06-04 14:28:30','2021-06-04 14:28:30',3,0,1),(22,'Acquaintances',5,'2021-06-04 14:28:30','2021-06-04 14:28:30',4,0,1);
/*!40000 ALTER TABLE `aspects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorizations`
--

DROP TABLE IF EXISTS `authorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `o_auth_application_id` int DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `redirect_uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `scopes` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `code_used` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_authorizations_on_user_id` (`user_id`),
  KEY `index_authorizations_on_o_auth_application_id` (`o_auth_application_id`),
  CONSTRAINT `fk_rails_4ecef5b8c5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_e166644de5` FOREIGN KEY (`o_auth_application_id`) REFERENCES `o_auth_applications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorizations`
--

LOCK TABLES `authorizations` WRITE;
/*!40000 ALTER TABLE `authorizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `person_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_blocks_on_user_id_and_person_id` (`user_id`,`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (1,2,1);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_contacts`
--

DROP TABLE IF EXISTS `chat_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `jid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ask` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `subscription` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_chat_contacts_on_user_id_and_jid` (`user_id`,`jid`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_contacts`
--

LOCK TABLES `chat_contacts` WRITE;
/*!40000 ALTER TABLE `chat_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_fragments`
--

DROP TABLE IF EXISTS `chat_fragments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_fragments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `root` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `namespace` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `xml` text COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_chat_fragments_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_fragments`
--

LOCK TABLES `chat_fragments` WRITE;
/*!40000 ALTER TABLE `chat_fragments` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_fragments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_offline_messages`
--

DROP TABLE IF EXISTS `chat_offline_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_offline_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `message` text COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_offline_messages`
--

LOCK TABLES `chat_offline_messages` WRITE;
/*!40000 ALTER TABLE `chat_offline_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_offline_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_signatures`
--

DROP TABLE IF EXISTS `comment_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_signatures` (
  `comment_id` int NOT NULL,
  `author_signature` text COLLATE utf8mb4_bin NOT NULL,
  `signature_order_id` int NOT NULL,
  `additional_data` text COLLATE utf8mb4_bin,
  UNIQUE KEY `index_comment_signatures_on_comment_id` (`comment_id`),
  KEY `comment_signatures_signature_orders_id_fk` (`signature_order_id`),
  CONSTRAINT `comment_signatures_comment_id_fk` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_signatures_signature_orders_id_fk` FOREIGN KEY (`signature_order_id`) REFERENCES `signature_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_signatures`
--

LOCK TABLES `comment_signatures` WRITE;
/*!40000 ALTER TABLE `comment_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8mb4_bin NOT NULL,
  `commentable_id` int NOT NULL,
  `author_id` int NOT NULL,
  `guid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `likes_count` int NOT NULL DEFAULT '0',
  `commentable_type` varchar(60) COLLATE utf8mb4_bin NOT NULL DEFAULT 'Post',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_comments_on_guid` (`guid`(191)),
  KEY `index_comments_on_person_id` (`author_id`),
  KEY `index_comments_on_commentable_id_and_commentable_type` (`commentable_id`,`commentable_type`),
  CONSTRAINT `comments_author_id_fk` FOREIGN KEY (`author_id`) REFERENCES `people` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'The decade that brought us Star Trek and Doctor Who also resurrected Cicero—or at least what used to be Cicero—in an attempt to make the days before computerized design a little less painstaking.',5,1,'5413c5b0a765013983b6000c29c74624','2021-06-04 13:18:51','2021-06-04 13:18:51',0,'Post'),(2,'Design or (Dis)content\n\nAmong design professionals, there\'s a bit of controversy surrounding the filler text. Controversy, as in Death to Lorem Ipsum.\n\nThe strength of lorem ipsum is its weakness: it doesn\'t communicate. To some, designing a website around placeholder text is unacceptable, akin to sewing a custom suit without taking measurements. Kristina Halvorson notes:',5,1,'5c37fc00a765013983b8000c29c74624','2021-06-04 13:19:05','2021-06-04 13:19:05',0,'Post'),(3,'“I’ve heard the argument that “lorem ipsum” is effective in wireframing or design because it helps people focus on the actual layout, or color scheme, or whatever. What kills me here is that we’re talking about creating a user experience that will (whether we like it or not) be DRIVEN by words. The entire structure of the page or app flow is FOR THE WORDS.”',3,1,'665becc0a765013983b6000c29c74624','2021-06-04 13:19:22','2021-06-04 13:19:22',0,'Post'),(4,'Lorem ipsum is so ubiquitous because it is so versatile. Select how many paragraphs you want, copy, paste, and break the lines wherever it is convenient. Real copy doesn\'t work that way.\n\nAs front-end developer Kyle Fiedler put it:\n\n    “When you are designing with Lorem Ipsum, you diminish the importance of the copy by lowering it to the same level as any other visual element. The text simply becomes another supporting role, serving to make other aspects more aesthetic. Instead of your design enhancing the meaning of the content, your content is enhancing your design.”',2,1,'6dda9130a765013983b8000c29c74624','2021-06-04 13:19:34','2021-06-04 13:19:34',0,'Post'),(5,'And that’s why a 15th century typesetter might have scrambled a passage of Cicero; he wanted people to focus on his fonts, to imagine their own content on the pages. He wanted people to see, and to get them to see he had to keep them from reading.',1,1,'78083550a765013983b8000c29c74624','2021-06-04 13:19:51','2021-06-04 13:19:51',0,'Post'),(6,'Because it\'s the Internet\n\nThere was that time artists at Sequence opted to hand-Sharpie the lorem ipsum passage on a line of paper bags they designed for Chipotle—the result being a mixture of avant-garde, inside joke, and Sharpie-stained tables. Those with an eye for detail may have caught a tribute to the classic text in an episode of Mad Men (S6E1 around 1:18:55 for anyone that didn\'t). And here is a lorem ipsum tattoo.',6,1,'9f3d9440a765013983b6000c29c74624','2021-06-04 13:20:57','2021-06-04 13:20:57',0,'Post'),(7,'#art\ntest',6,1,'e226c6b0a765013983b8000c29c74624','2021-06-04 13:22:50','2021-06-04 13:22:50',0,'Post'),(8,'#sport\nYep',1,1,'ea0e1700a765013983b6000c29c74624','2021-06-04 13:23:03','2021-06-04 13:23:03',0,'Post'),(9,'#metoo\n\nNo',2,1,'f13530d0a765013983b8000c29c74624','2021-06-04 13:23:15','2021-06-04 13:23:15',0,'Post'),(10,'#war\nWe need peace',3,1,'203b4400a766013983b6000c29c74624','2021-06-04 13:24:34','2021-06-04 13:24:34',0,'Post'),(11,'#reality\nNo it\'s not',7,1,'41754710a766013983b6000c29c74624','2021-06-04 13:25:29','2021-06-04 13:25:29',0,'Post'),(12,'“On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammeled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.”',9,3,'fb0eef20a766013983b6000c29c74624','2021-06-04 13:30:41','2021-06-04 13:30:41',0,'Post'),(13,'“On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammeled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.”',9,3,'fdf7faa0a766013983b8000c29c74624','2021-06-04 13:30:46','2021-06-04 13:30:46',0,'Post'),(14,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quam pellentesque nec nam aliquam. Turpis massa sed elementum tempus. Facilisi morbi tempus iaculis urna id volutpat. Ac tincidunt vitae semper quis lectus nulla at volutpat. Non nisi est sit amet facilisis magna etiam. Nunc lobortis mattis aliquam faucibus purus in massa tempor nec. Sagittis orci a scelerisque purus semper eget duis. Vitae justo eget magna fermentum iaculis eu non. Faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Dolor sit amet consectetur adipiscing elit. Bibendum neque egestas congue quisque egestas diam in. Velit euismod in pellentesque massa. Mattis rhoncus urna neque viverra justo nec ultrices. Nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus. Sed elementum tempus egestas sed sed risus pretium quam. Congue quisque egestas diam in arcu.',11,3,'299f6dd0a767013983b6000c29c74624','2021-06-04 13:31:59','2021-06-04 13:31:59',0,'Post'),(15,'Non curabitur gravida arcu ac tortor dignissim convallis aenean et. Donec enim diam vulputate ut pharetra. Massa placerat duis ultricies lacus sed turpis. Sed libero enim sed faucibus turpis. Consequat nisl vel pretium lectus quam id leo in. Aliquam ut porttitor leo a diam sollicitudin tempor. Eget magna fermentum iaculis eu non diam phasellus vestibulum lorem. Arcu cursus vitae congue mauris. Cras sed felis eget velit. Ac turpis egestas integer eget aliquet nibh. Viverra ipsum nunc aliquet bibendum enim facilisis gravida neque convallis. Tincidunt lobortis feugiat vivamus at augue. Sed viverra ipsum nunc aliquet. Suspendisse interdum consectetur libero id faucibus nisl tincidunt. Volutpat sed cras ornare arcu dui vivamus arcu felis. Urna id volutpat lacus laoreet non. Sed ullamcorper morbi tincidunt ornare massa. Enim praesent elementum facilisis leo vel. Elit eget gravida cum sociis natoque penatibus et magnis.',11,3,'30638cf0a767013983b6000c29c74624','2021-06-04 13:32:10','2021-06-04 13:32:10',0,'Post'),(16,'#art\nhey',11,3,'382a2050a767013983b8000c29c74624','2021-06-04 13:32:23','2021-06-04 13:32:23',0,'Post'),(17,'Auctor urna nunc id cursus metus aliquam eleifend mi. Sit amet luctus venenatis lectus magna. Facilisi morbi tempus iaculis urna id volutpat. Enim facilisis gravida neque convallis a cras semper auctor. Sapien faucibus et molestie ac feugiat sed lectus vestibulum. Tincidunt eget nullam non nisi. Porta non pulvinar neque laoreet suspendisse interdum. Eu ultrices vitae auctor eu augue ut lectus. Pellentesque eu tincidunt tortor aliquam. Quam lacus suspendisse faucibus interdum posuere. At risus viverra adipiscing at in tellus integer feugiat scelerisque. Integer eget aliquet nibh praesent tristique. Ipsum dolor sit amet consectetur adipiscing elit ut aliquam purus. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum. Amet dictum sit amet justo.\n#megusto',10,3,'48f63010a767013983b6000c29c74624','2021-06-04 13:32:52','2021-06-04 13:32:52',0,'Post'),(18,'#war\nyes',9,3,'53781170a767013983b6000c29c74624','2021-06-04 13:33:09','2021-06-04 13:33:09',0,'Post'),(19,'Yey',11,1,'9d6064e0a767013983b6000c29c74624','2021-06-04 13:35:13','2021-06-04 13:35:13',0,'Post'),(20,'Good work',10,1,'a312edf0a767013983b8000c29c74624','2021-06-04 13:35:23','2021-06-04 13:35:23',0,'Post'),(21,'AFAIK',8,1,'a824ad70a767013983b6000c29c74624','2021-06-04 13:35:31','2021-06-04 13:35:31',0,'Post'),(22,'It\'s me!\n#art',6,3,'f253fb50a767013983b6000c29c74624','2021-06-04 13:37:36','2021-06-04 13:37:36',0,'Post'),(23,'La la ley',7,3,'f8a15730a767013983b6000c29c74624','2021-06-04 13:37:46','2021-06-04 13:37:46',0,'Post'),(24,'No this won\'t do',13,3,'0319a440a768013983b8000c29c74624','2021-06-04 13:38:04','2021-06-04 13:38:04',0,'Post'),(25,'lskjgvn; lqughc pqi',8,1,'1b027950a768013983b6000c29c74624','2021-06-04 13:38:44','2021-06-04 13:38:44',0,'Post'),(26,'I am',16,3,'68896b40a768013983b8000c29c74624','2021-06-04 13:40:54','2021-06-04 13:40:54',0,'Post'),(27,'So am I',8,4,'fcc84730a768013983b8000c29c74624','2021-06-04 13:45:03','2021-06-04 13:45:03',0,'Post'),(28,'Sed egestas egestas fringilla phasellus faucibus scelerisque. Ornare lectus sit amet est placerat in egestas erat. Integer vitae justo eget magna fermentum iaculis eu non diam. Porttitor leo a diam sollicitudin tempor id eu nisl nunc. Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam. Molestie a iaculis at erat pellentesque adipiscing commodo. Mollis aliquam ut porttitor leo a diam sollicitudin tempor id. Nunc congue nisi vitae suscipit tellus mauris. Quisque id diam vel quam elementum pulvinar etiam non. Ac tincidunt vitae semper quis lectus nulla at volutpat. Ornare lectus sit amet est placerat.\n\n#kittens',23,4,'0c980a80a769013983b8000c29c74624','2021-06-04 13:45:29','2021-06-04 13:45:29',0,'Post'),(29,'#sport\n#kittens\nYeah',6,4,'0cbc7330a76b013983b6000c29c74624','2021-06-04 13:59:48','2021-06-04 13:59:48',0,'Post'),(30,'as/pietuvw;oiuhg;voqiwjcf',23,4,'1940aa30a76b013983b8000c29c74624','2021-06-04 14:00:09','2021-06-04 14:00:09',0,'Post'),(31,'Ugh\n#kittens',11,4,'3bb90920a76b013983b8000c29c74624','2021-06-04 14:01:07','2021-06-04 14:01:07',0,'Post'),(32,'really',8,4,'42e4ebd0a76b013983b8000c29c74624','2021-06-04 14:01:19','2021-06-04 14:01:19',0,'Post'),(33,'Duis at consectetur lorem donec massa sapien faucibus et. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Dolor sit amet consectetur adipiscing elit pellentesque. Dignissim sodales ut eu sem integer vitae justo eget. Nisi lacus sed viverra tellus in hac habitasse. Accumsan sit amet nulla facilisi morbi tempus iaculis. Sagittis vitae et leo duis ut diam quam nulla. Lorem ipsum dolor sit amet consectetur adipiscing. Dolor purus non enim praesent elementum facilisis leo vel. Nibh tortor id aliquet lectus proin nibh nisl condimentum. Eget nunc scelerisque viverra mauris in aliquam sem fringilla.',31,4,'781173f0a76b013983b6000c29c74624','2021-06-04 14:02:49','2021-06-04 14:02:49',0,'Post'),(34,'Duis at consectetur lorem donec massa sapien faucibus et. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Dolor sit amet consectetur adipiscing elit pellentesque. Dignissim sodales ut eu sem integer vitae justo eget. Nisi lacus sed viverra tellus in hac habitasse. Accumsan sit amet nulla facilisi morbi tempus iaculis. Sagittis vitae et leo duis ut diam quam nulla. Lorem ipsum dolor sit amet consectetur adipiscing. Dolor purus non enim praesent elementum facilisis leo vel. Nibh tortor id aliquet lectus proin nibh nisl condimentum. Eget nunc scelerisque viverra mauris in aliquam sem fringilla.',30,4,'7b1bda10a76b013983b8000c29c74624','2021-06-04 14:02:54','2021-06-04 14:02:54',0,'Post'),(35,'sdfsf',32,4,'87829520a76b013983b6000c29c74624','2021-06-04 14:03:14','2021-06-04 14:03:14',0,'Post'),(36,'#sport',32,4,'8c709050a76b013983b8000c29c74624','2021-06-04 14:03:23','2021-06-04 14:03:23',0,'Post'),(37,'probably',34,4,'d393b620a76b013983b6000c29c74624','2021-06-04 14:05:22','2021-06-04 14:05:22',0,'Post'),(38,'hehe',21,3,'fef86af0a76b013983b8000c29c74624','2021-06-04 14:06:35','2021-06-04 14:06:35',0,'Post'),(39,'888',14,3,'094baf10a76c013983b8000c29c74624','2021-06-04 14:06:52','2021-06-04 14:06:52',0,'Post'),(40,'no',26,1,'857a9c50a76c013983b8000c29c74624','2021-06-04 14:10:21','2021-06-04 14:10:21',0,'Post'),(41,'yyy',41,5,'2667d170a76e013983b8000c29c74624','2021-06-04 14:22:00','2021-06-04 14:22:00',0,'Post'),(42,'#kittens\nsf;gkjpeqwmotfcio',39,5,'326e2540a76e013983b6000c29c74624','2021-06-04 14:22:20','2021-06-04 14:22:20',0,'Post'),(43,'So am I',36,5,'3ad1d760a76e013983b6000c29c74624','2021-06-04 14:22:34','2021-06-04 14:22:34',0,'Post'),(44,'dfgsdgh',10,5,'5d6bb710a76e013983b8000c29c74624','2021-06-04 14:23:32','2021-06-04 14:23:32',0,'Post'),(45,'sfgsfjfkl',8,5,'60f5cb10a76e013983b6000c29c74624','2021-06-04 14:23:38','2021-06-04 14:23:38',0,'Post'),(46,'#art\n#sport\n#kittens',54,5,'a6c25f20a76e013983b6000c29c74624','2021-06-04 14:25:35','2021-06-04 14:25:35',0,'Post'),(47,'sehvyqEPO,cv;',53,5,'aaad4760a76e013983b8000c29c74624','2021-06-04 14:25:42','2021-06-04 14:25:42',0,'Post'),(48,'vwgh;qijem;ng',48,5,'b28e5780a76e013983b6000c29c74624','2021-06-04 14:25:55','2021-06-04 14:25:55',0,'Post'),(49,'rtgvqlcn vkjh;oa \'m',57,4,'e11f84d0a76e013983b8000c29c74624','2021-06-04 14:27:13','2021-06-04 14:27:13',0,'Post'),(50,'shbe jb whv',50,4,'e4bf26e0a76e013983b8000c29c74624','2021-06-04 14:27:19','2021-06-04 14:27:19',0,'Post'),(51,'sdh vwsegv wqeg',38,4,'ec4ba740a76e013983b8000c29c74624','2021-06-04 14:27:32','2021-06-04 14:27:32',0,'Post'),(52,'wre hvw hqg',59,1,'21dd5b90a76f013983b6000c29c74624','2021-06-04 14:29:02','2021-06-04 14:29:02',0,'Post'),(53,'asd gag',57,1,'272534f0a76f013983b6000c29c74624','2021-06-04 14:29:11','2021-06-04 14:29:11',0,'Post'),(54,'a gag aqgqaga',52,1,'521d4670a76f013983b6000c29c74624','2021-06-04 14:30:23','2021-06-04 14:30:23',0,'Post'),(55,'hehewew',48,1,'5a47f3a0a76f013983b6000c29c74624','2021-06-04 14:30:37','2021-06-04 14:30:37',0,'Post'),(56,'gdj dfnsf nsf #kittens',48,6,'9dcfdea0a76f013983b6000c29c74624','2021-06-04 14:32:30','2021-06-04 14:32:30',0,'Post'),(57,'dfbgsdndgmkghl,',44,6,'a59240e0a76f013983b8000c29c74624','2021-06-04 14:32:43','2021-06-04 14:32:43',0,'Post'),(58,'xcvbxxb',41,6,'aced8200a76f013983b8000c29c74624','2021-06-04 14:32:55','2021-06-04 14:32:55',0,'Post'),(59,'chncbncn',34,6,'af29b430a76f013983b6000c29c74624','2021-06-04 14:32:59','2021-06-04 14:32:59',0,'Post');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `person_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sharing` tinyint(1) NOT NULL DEFAULT '0',
  `receiving` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_contacts_on_user_id_and_person_id` (`user_id`,`person_id`),
  KEY `index_contacts_on_person_id` (`person_id`),
  CONSTRAINT `contacts_person_id_fk` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,1,2,'2021-06-04 13:04:40','2021-06-04 13:04:40',0,1),(2,2,2,'2021-06-04 13:28:42','2021-06-04 13:28:42',0,1),(3,1,3,'2021-06-04 13:34:33','2021-06-04 14:09:19',0,1),(4,2,1,'2021-06-04 13:34:33','2021-06-04 14:09:19',1,0),(5,3,2,'2021-06-04 13:43:04','2021-06-04 13:43:04',0,1),(6,3,1,'2021-06-04 13:45:38','2021-06-04 14:10:01',1,1),(7,1,4,'2021-06-04 13:45:38','2021-06-04 14:10:01',1,1),(8,3,3,'2021-06-04 14:00:35','2021-06-04 14:00:35',0,1),(9,2,4,'2021-06-04 14:00:35','2021-06-04 14:00:35',1,0),(10,4,2,'2021-06-04 14:12:42','2021-06-04 14:12:42',0,1),(11,4,1,'2021-06-04 14:21:15','2021-06-04 14:30:01',1,1),(12,1,5,'2021-06-04 14:21:15','2021-06-04 14:30:01',1,1),(13,4,4,'2021-06-04 14:21:26','2021-06-04 14:21:26',0,1),(14,3,5,'2021-06-04 14:21:26','2021-06-04 14:21:26',1,0),(15,4,3,'2021-06-04 14:21:36','2021-06-04 14:21:36',0,1),(16,2,5,'2021-06-04 14:21:36','2021-06-04 14:21:36',1,0),(17,5,2,'2021-06-04 14:28:30','2021-06-04 14:28:30',0,1),(18,5,5,'2021-06-04 14:31:44','2021-06-04 14:31:44',0,1),(19,4,6,'2021-06-04 14:31:44','2021-06-04 14:31:44',1,0),(20,5,4,'2021-06-04 14:31:51','2021-06-04 14:31:51',0,1),(21,3,6,'2021-06-04 14:31:51','2021-06-04 14:31:51',1,0),(22,5,1,'2021-06-04 14:33:20','2021-06-04 14:33:51',1,1),(23,1,6,'2021-06-04 14:33:20','2021-06-04 14:33:51',1,1);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_visibilities`
--

DROP TABLE IF EXISTS `conversation_visibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_visibilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `person_id` int NOT NULL,
  `unread` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_conversation_visibilities_usefully` (`conversation_id`,`person_id`),
  KEY `index_conversation_visibilities_on_conversation_id` (`conversation_id`),
  KEY `index_conversation_visibilities_on_person_id` (`person_id`),
  CONSTRAINT `conversation_visibilities_conversation_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conversation_visibilities_person_id_fk` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_visibilities`
--

LOCK TABLES `conversation_visibilities` WRITE;
/*!40000 ALTER TABLE `conversation_visibilities` DISABLE KEYS */;
INSERT INTO `conversation_visibilities` VALUES (1,1,1,0,'2021-06-04 14:08:06','2021-06-04 14:28:49'),(2,1,3,0,'2021-06-04 14:08:06','2021-06-04 14:26:23');
/*!40000 ALTER TABLE `conversation_visibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `guid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `author_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_conversations_on_guid` (`guid`(191)),
  KEY `conversations_author_id_fk` (`author_id`),
  CONSTRAINT `conversations_author_id_fk` FOREIGN KEY (`author_id`) REFERENCES `people` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (1,'hello','358d6590a76c013983b8000c29c74624',3,'2021-06-04 14:08:06','2021-06-04 14:26:27');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitation_codes`
--

DROP TABLE IF EXISTS `invitation_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitation_codes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation_codes`
--

LOCK TABLES `invitation_codes` WRITE;
/*!40000 ALTER TABLE `invitation_codes` DISABLE KEYS */;
INSERT INTO `invitation_codes` VALUES (1,'9feb088f34f4',1,25,'2021-06-04 13:04:51','2021-06-04 13:04:51'),(2,'fd6532622693',2,25,'2021-06-04 13:29:52','2021-06-04 13:29:52'),(3,'a0bf187c6d13',3,25,'2021-06-04 13:43:52','2021-06-04 13:43:52'),(4,'5f7937ceabd2',4,25,'2021-06-04 14:20:54','2021-06-04 14:20:54'),(5,'431a695249de',5,25,'2021-06-04 14:31:09','2021-06-04 14:31:09');
/*!40000 ALTER TABLE `invitation_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_signatures`
--

DROP TABLE IF EXISTS `like_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_signatures` (
  `like_id` int NOT NULL,
  `author_signature` text COLLATE utf8mb4_bin NOT NULL,
  `signature_order_id` int NOT NULL,
  `additional_data` text COLLATE utf8mb4_bin,
  UNIQUE KEY `index_like_signatures_on_like_id` (`like_id`),
  KEY `like_signatures_signature_orders_id_fk` (`signature_order_id`),
  CONSTRAINT `like_signatures_like_id_fk` FOREIGN KEY (`like_id`) REFERENCES `likes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `like_signatures_signature_orders_id_fk` FOREIGN KEY (`signature_order_id`) REFERENCES `signature_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_signatures`
--

LOCK TABLES `like_signatures` WRITE;
/*!40000 ALTER TABLE `like_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `positive` tinyint(1) DEFAULT '1',
  `target_id` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `guid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `target_type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_likes_on_target_id_and_author_id_and_target_type` (`target_id`,`author_id`,`target_type`),
  UNIQUE KEY `index_likes_on_guid` (`guid`(191)),
  KEY `likes_author_id_fk` (`author_id`),
  KEY `index_likes_on_post_id` (`target_id`),
  CONSTRAINT `likes_author_id_fk` FOREIGN KEY (`author_id`) REFERENCES `people` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,5,1,'46d91f10a765013983b8000c29c74624','2021-06-04 13:18:29','2021-06-04 13:18:29','Post'),(2,1,4,1,'47c1f570a765013983b6000c29c74624','2021-06-04 13:18:31','2021-06-04 13:18:31','Post'),(3,1,3,1,'48c34580a765013983b8000c29c74624','2021-06-04 13:18:32','2021-06-04 13:18:32','Post'),(4,1,1,1,'4aa105e0a765013983b6000c29c74624','2021-06-04 13:18:35','2021-06-04 13:18:35','Post'),(5,1,2,1,'4b2be810a765013983b8000c29c74624','2021-06-04 13:18:36','2021-06-04 13:18:36','Post'),(6,1,6,1,'98b10de0a765013983b8000c29c74624','2021-06-04 13:20:46','2021-06-04 13:20:46','Post'),(7,1,7,1,'38da8d00a766013983b6000c29c74624','2021-06-04 13:25:15','2021-06-04 13:25:15','Post'),(8,1,9,3,'f1bf7e30a766013983b8000c29c74624','2021-06-04 13:30:25','2021-06-04 13:30:25','Post'),(9,1,10,3,'079a6870a767013983b6000c29c74624','2021-06-04 13:31:02','2021-06-04 13:31:02','Post'),(10,1,11,3,'2717fd90a767013983b8000c29c74624','2021-06-04 13:31:55','2021-06-04 13:31:55','Post'),(12,1,10,1,'8c0a42d0a767013983b8000c29c74624','2021-06-04 13:34:44','2021-06-04 13:34:44','Post'),(13,1,8,1,'8d8464b0a767013983b6000c29c74624','2021-06-04 13:34:47','2021-06-04 13:34:47','Post'),(14,1,11,1,'c1ac3780a767013983b8000c29c74624','2021-06-04 13:36:14','2021-06-04 13:36:14','Post'),(15,1,16,3,'d59d5280a767013983b8000c29c74624','2021-06-04 13:36:47','2021-06-04 13:36:47','Post'),(16,1,15,3,'d6415cf0a767013983b6000c29c74624','2021-06-04 13:36:49','2021-06-04 13:36:49','Post'),(17,1,14,3,'d8aedfb0a767013983b6000c29c74624','2021-06-04 13:36:53','2021-06-04 13:36:53','Post'),(18,1,13,3,'da0140b0a767013983b6000c29c74624','2021-06-04 13:36:55','2021-06-04 13:36:55','Post'),(19,1,12,3,'daf313d0a767013983b8000c29c74624','2021-06-04 13:36:56','2021-06-04 13:36:56','Post'),(20,1,7,3,'dc73be30a767013983b6000c29c74624','2021-06-04 13:36:59','2021-06-04 13:36:59','Post'),(21,1,6,3,'defb86b0a767013983b8000c29c74624','2021-06-04 13:37:03','2021-06-04 13:37:03','Post'),(22,1,19,1,'20a0a170a768013983b8000c29c74624','2021-06-04 13:38:53','2021-06-04 13:38:53','Post'),(23,1,18,1,'213546c0a768013983b8000c29c74624','2021-06-04 13:38:54','2021-06-04 13:38:54','Post'),(24,1,16,1,'23bffb40a768013983b8000c29c74624','2021-06-04 13:38:59','2021-06-04 13:38:59','Post'),(25,1,17,1,'245b80f0a768013983b6000c29c74624','2021-06-04 13:39:00','2021-06-04 13:39:00','Post'),(26,1,14,1,'25b7b200a768013983b8000c29c74624','2021-06-04 13:39:02','2021-06-04 13:39:02','Post'),(27,1,13,1,'2724ff20a768013983b8000c29c74624','2021-06-04 13:39:04','2021-06-04 13:39:04','Post'),(28,1,20,1,'3ba5f190a768013983b8000c29c74624','2021-06-04 13:39:39','2021-06-04 13:39:39','Post'),(29,1,8,4,'f6a05370a768013983b6000c29c74624','2021-06-04 13:44:52','2021-06-04 13:44:52','Post'),(30,1,22,4,'f9715a70a768013983b8000c29c74624','2021-06-04 13:44:57','2021-06-04 13:44:57','Post'),(31,1,23,4,'06dc1510a769013983b6000c29c74624','2021-06-04 13:45:20','2021-06-04 13:45:20','Post'),(32,1,20,4,'e76c93d0a76a013983b8000c29c74624','2021-06-04 13:58:46','2021-06-04 13:58:46','Post'),(33,1,15,4,'e98c2230a76a013983b8000c29c74624','2021-06-04 13:58:49','2021-06-04 13:58:49','Post'),(34,1,14,4,'ec319ba0a76a013983b8000c29c74624','2021-06-04 13:58:54','2021-06-04 13:58:54','Post'),(35,1,13,4,'ee2de350a76a013983b6000c29c74624','2021-06-04 13:58:57','2021-06-04 13:58:57','Post'),(36,1,12,4,'f6328fb0a76a013983b8000c29c74624','2021-06-04 13:59:11','2021-06-04 13:59:11','Post'),(37,1,7,4,'f90cea40a76a013983b8000c29c74624','2021-06-04 13:59:15','2021-06-04 13:59:15','Post'),(38,1,6,4,'fb7cb570a76a013983b8000c29c74624','2021-06-04 13:59:20','2021-06-04 13:59:20','Post'),(39,1,19,4,'256ea710a76b013983b8000c29c74624','2021-06-04 14:00:30','2021-06-04 14:00:30','Post'),(40,1,18,4,'2a7b3ec0a76b013983b6000c29c74624','2021-06-04 14:00:38','2021-06-04 14:00:38','Post'),(41,1,17,4,'2cda06e0a76b013983b8000c29c74624','2021-06-04 14:00:42','2021-06-04 14:00:42','Post'),(42,1,11,4,'3261c630a76b013983b8000c29c74624','2021-06-04 14:00:52','2021-06-04 14:00:52','Post'),(43,1,10,4,'3d87cb20a76b013983b6000c29c74624','2021-06-04 14:01:10','2021-06-04 14:01:10','Post'),(44,1,31,4,'75f34660a76b013983b6000c29c74624','2021-06-04 14:02:45','2021-06-04 14:02:45','Post'),(45,1,32,4,'85cda580a76b013983b8000c29c74624','2021-06-04 14:03:12','2021-06-04 14:03:12','Post'),(46,1,34,4,'cf7ac230a76b013983b6000c29c74624','2021-06-04 14:05:15','2021-06-04 14:05:15','Post'),(47,1,33,4,'d6542380a76b013983b8000c29c74624','2021-06-04 14:05:27','2021-06-04 14:05:27','Post'),(49,1,23,3,'faf8c090a76b013983b8000c29c74624','2021-06-04 14:06:28','2021-06-04 14:06:28','Post'),(50,1,21,3,'fc4db3f0a76b013983b6000c29c74624','2021-06-04 14:06:30','2021-06-04 14:06:30','Post'),(51,1,20,3,'00247fa0a76c013983b6000c29c74624','2021-06-04 14:06:37','2021-06-04 14:06:37','Post'),(52,1,19,3,'027d27a0a76c013983b6000c29c74624','2021-06-04 14:06:41','2021-06-04 14:06:41','Post'),(53,1,18,3,'033f99b0a76c013983b8000c29c74624','2021-06-04 14:06:42','2021-06-04 14:06:42','Post'),(54,1,17,3,'0438e6d0a76c013983b6000c29c74624','2021-06-04 14:06:44','2021-06-04 14:06:44','Post'),(55,1,36,3,'10a68040a76c013983b6000c29c74624','2021-06-04 14:07:05','2021-06-04 14:07:05','Post'),(56,1,35,3,'11583480a76c013983b6000c29c74624','2021-06-04 14:07:06','2021-06-04 14:07:06','Post'),(57,1,34,1,'7aea5bc0a76c013983b8000c29c74624','2021-06-04 14:10:03','2021-06-04 14:10:03','Post'),(58,1,33,1,'7ce463c0a76c013983b8000c29c74624','2021-06-04 14:10:06','2021-06-04 14:10:06','Post'),(59,1,32,1,'7ec10ba0a76c013983b6000c29c74624','2021-06-04 14:10:09','2021-06-04 14:10:09','Post'),(60,1,29,1,'7fa57ca0a76c013983b8000c29c74624','2021-06-04 14:10:11','2021-06-04 14:10:11','Post'),(61,1,28,1,'8196a330a76c013983b6000c29c74624','2021-06-04 14:10:14','2021-06-04 14:10:14','Post'),(62,1,27,1,'827e2720a76c013983b8000c29c74624','2021-06-04 14:10:16','2021-06-04 14:10:16','Post'),(63,1,26,1,'832149e0a76c013983b6000c29c74624','2021-06-04 14:10:17','2021-06-04 14:10:17','Post'),(64,1,25,1,'867e40d0a76c013983b6000c29c74624','2021-06-04 14:10:22','2021-06-04 14:10:22','Post'),(65,1,24,1,'87e8b280a76c013983b6000c29c74624','2021-06-04 14:10:25','2021-06-04 14:10:25','Post'),(66,1,23,1,'88e22df0a76c013983b6000c29c74624','2021-06-04 14:10:26','2021-06-04 14:10:26','Post'),(67,1,22,1,'8b021ba0a76c013983b6000c29c74624','2021-06-04 14:10:30','2021-06-04 14:10:30','Post'),(68,1,41,5,'23f02940a76e013983b6000c29c74624','2021-06-04 14:21:56','2021-06-04 14:21:56','Post'),(69,1,40,5,'2729e270a76e013983b6000c29c74624','2021-06-04 14:22:01','2021-06-04 14:22:01','Post'),(70,1,39,5,'28558a00a76e013983b6000c29c74624','2021-06-04 14:22:03','2021-06-04 14:22:03','Post'),(71,1,38,5,'34254340a76e013983b8000c29c74624','2021-06-04 14:22:23','2021-06-04 14:22:23','Post'),(72,1,36,5,'363f9270a76e013983b6000c29c74624','2021-06-04 14:22:27','2021-06-04 14:22:27','Post'),(73,1,35,5,'3c602750a76e013983b6000c29c74624','2021-06-04 14:22:37','2021-06-04 14:22:37','Post'),(74,1,34,5,'3f54a6d0a76e013983b6000c29c74624','2021-06-04 14:22:42','2021-06-04 14:22:42','Post'),(75,1,29,5,'4195f3a0a76e013983b6000c29c74624','2021-06-04 14:22:46','2021-06-04 14:22:46','Post'),(76,1,28,5,'46267210a76e013983b6000c29c74624','2021-06-04 14:22:53','2021-06-04 14:22:53','Post'),(77,1,26,5,'488e4dd0a76e013983b6000c29c74624','2021-06-04 14:22:57','2021-06-04 14:22:57','Post'),(78,1,25,5,'4aca2de0a76e013983b8000c29c74624','2021-06-04 14:23:01','2021-06-04 14:23:01','Post'),(79,1,22,5,'4dd29cf0a76e013983b6000c29c74624','2021-06-04 14:23:06','2021-06-04 14:23:06','Post'),(80,1,20,5,'4f25d6b0a76e013983b8000c29c74624','2021-06-04 14:23:08','2021-06-04 14:23:08','Post'),(81,1,18,5,'51b03e60a76e013983b8000c29c74624','2021-06-04 14:23:13','2021-06-04 14:23:13','Post'),(82,1,14,5,'5451f980a76e013983b8000c29c74624','2021-06-04 14:23:17','2021-06-04 14:23:17','Post'),(83,1,12,5,'55d22c70a76e013983b6000c29c74624','2021-06-04 14:23:20','2021-06-04 14:23:20','Post'),(84,1,10,5,'5e2d3b50a76e013983b6000c29c74624','2021-06-04 14:23:34','2021-06-04 14:23:34','Post'),(85,1,7,5,'622fdb50a76e013983b8000c29c74624','2021-06-04 14:23:40','2021-06-04 14:23:40','Post'),(86,1,23,5,'69ea60a0a76e013983b6000c29c74624','2021-06-04 14:23:53','2021-06-04 14:23:53','Post'),(87,1,54,5,'9b5b1ea0a76e013983b8000c29c74624','2021-06-04 14:25:16','2021-06-04 14:25:16','Post'),(88,1,53,5,'9bddec80a76e013983b8000c29c74624','2021-06-04 14:25:17','2021-06-04 14:25:17','Post'),(89,1,52,5,'9c9ea050a76e013983b6000c29c74624','2021-06-04 14:25:18','2021-06-04 14:25:18','Post'),(90,1,51,5,'ac863f80a76e013983b8000c29c74624','2021-06-04 14:25:45','2021-06-04 14:25:45','Post'),(91,1,50,5,'ad0d39d0a76e013983b6000c29c74624','2021-06-04 14:25:46','2021-06-04 14:25:46','Post'),(92,1,49,5,'ae4aa710a76e013983b8000c29c74624','2021-06-04 14:25:48','2021-06-04 14:25:48','Post'),(93,1,48,5,'afb28fa0a76e013983b6000c29c74624','2021-06-04 14:25:50','2021-06-04 14:25:50','Post'),(94,1,41,3,'c8677130a76e013983b6000c29c74624','2021-06-04 14:26:32','2021-06-04 14:26:32','Post'),(95,1,40,3,'cab51d80a76e013983b6000c29c74624','2021-06-04 14:26:36','2021-06-04 14:26:36','Post'),(96,1,55,4,'dd541d30a76e013983b8000c29c74624','2021-06-04 14:27:07','2021-06-04 14:27:07','Post'),(97,1,57,4,'deebd7b0a76e013983b8000c29c74624','2021-06-04 14:27:10','2021-06-04 14:27:10','Post'),(98,1,50,4,'e2ebd850a76e013983b6000c29c74624','2021-06-04 14:27:16','2021-06-04 14:27:16','Post'),(99,1,40,4,'e6047c30a76e013983b6000c29c74624','2021-06-04 14:27:21','2021-06-04 14:27:21','Post'),(100,1,39,4,'e879d940a76e013983b6000c29c74624','2021-06-04 14:27:26','2021-06-04 14:27:26','Post'),(101,1,38,4,'ea8596e0a76e013983b8000c29c74624','2021-06-04 14:27:29','2021-06-04 14:27:29','Post'),(102,1,58,1,'1ebba4f0a76f013983b6000c29c74624','2021-06-04 14:28:57','2021-06-04 14:28:57','Post'),(103,1,57,1,'23a460a0a76f013983b8000c29c74624','2021-06-04 14:29:05','2021-06-04 14:29:05','Post'),(104,1,39,1,'2b73faa0a76f013983b8000c29c74624','2021-06-04 14:29:18','2021-06-04 14:29:18','Post'),(105,1,40,1,'3892cfc0a76f013983b6000c29c74624','2021-06-04 14:29:40','2021-06-04 14:29:40','Post'),(106,1,60,1,'48941e50a76f013983b8000c29c74624','2021-06-04 14:30:07','2021-06-04 14:30:07','Post'),(107,1,59,1,'4aff7970a76f013983b8000c29c74624','2021-06-04 14:30:11','2021-06-04 14:30:11','Post'),(108,1,52,1,'50a8ef30a76f013983b6000c29c74624','2021-06-04 14:30:20','2021-06-04 14:30:20','Post'),(109,1,51,1,'531dda80a76f013983b8000c29c74624','2021-06-04 14:30:25','2021-06-04 14:30:25','Post'),(110,1,49,1,'5614d4f0a76f013983b8000c29c74624','2021-06-04 14:30:30','2021-06-04 14:30:30','Post'),(111,1,48,1,'58fa8c10a76f013983b8000c29c74624','2021-06-04 14:30:34','2021-06-04 14:30:34','Post'),(112,1,47,1,'5bbad1e0a76f013983b8000c29c74624','2021-06-04 14:30:39','2021-06-04 14:30:39','Post'),(113,1,62,6,'8ab65e00a76f013983b6000c29c74624','2021-06-04 14:31:58','2021-06-04 14:31:58','Post'),(114,1,58,6,'8b39e4c0a76f013983b8000c29c74624','2021-06-04 14:31:59','2021-06-04 14:31:59','Post'),(115,1,57,6,'8f1b1860a76f013983b8000c29c74624','2021-06-04 14:32:05','2021-06-04 14:32:05','Post'),(116,1,51,6,'92d72ca0a76f013983b6000c29c74624','2021-06-04 14:32:11','2021-06-04 14:32:11','Post'),(117,1,49,6,'9611d410a76f013983b8000c29c74624','2021-06-04 14:32:17','2021-06-04 14:32:17','Post'),(118,1,48,6,'9898ebf0a76f013983b6000c29c74624','2021-06-04 14:32:21','2021-06-04 14:32:21','Post'),(119,1,47,6,'9f595e00a76f013983b8000c29c74624','2021-06-04 14:32:32','2021-06-04 14:32:32','Post'),(120,1,43,6,'a73d21b0a76f013983b6000c29c74624','2021-06-04 14:32:46','2021-06-04 14:32:46','Post'),(121,1,72,6,'dce66070a76f013983b8000c29c74624','2021-06-04 14:34:16','2021-06-04 14:34:16','Post'),(122,1,69,6,'dfc86cc0a76f013983b6000c29c74624','2021-06-04 14:34:21','2021-06-04 14:34:21','Post'),(123,1,67,6,'e0f0ca20a76f013983b8000c29c74624','2021-06-04 14:34:22','2021-06-04 14:34:22','Post'),(124,1,66,6,'e21025e0a76f013983b6000c29c74624','2021-06-04 14:34:24','2021-06-04 14:34:24','Post');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lng` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status_message_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_locations_on_status_message_id` (`status_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentions`
--

DROP TABLE IF EXISTS `mentions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mentions_container_id` int NOT NULL,
  `person_id` int NOT NULL,
  `mentions_container_type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_mentions_on_person_and_mc_id_and_mc_type` (`person_id`,`mentions_container_id`,`mentions_container_type`(191)),
  KEY `index_mentions_on_person_id` (`person_id`),
  KEY `index_mentions_on_mc_id_and_mc_type` (`mentions_container_id`,`mentions_container_type`(191))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentions`
--

LOCK TABLES `mentions` WRITE;
/*!40000 ALTER TABLE `mentions` DISABLE KEYS */;
INSERT INTO `mentions` VALUES (1,12,2,'Post'),(2,16,3,'Post'),(3,17,2,'Post'),(4,21,1,'Post'),(5,26,2,'Post'),(6,41,3,'Post'),(7,45,2,'Post'),(8,50,4,'Post'),(9,55,3,'Post'),(10,57,3,'Post'),(11,60,3,'Post'),(12,65,3,'Post');
/*!40000 ALTER TABLE `mentions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `author_id` int NOT NULL,
  `guid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `text` text COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_messages_on_guid` (`guid`(191)),
  KEY `index_messages_on_author_id` (`author_id`),
  KEY `messages_conversation_id_fk` (`conversation_id`),
  CONSTRAINT `messages_author_id_fk` FOREIGN KEY (`author_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_conversation_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,3,'358d6350a76c013983b8000c29c74624','Dapibus ultrices in iaculis nunc. At augue eget arcu dictum varius duis. Venenatis lectus magna fringilla urna porttitor rhoncus dolor. Elementum pulvinar etiam non quam lacus suspendisse faucibus interdum. Id interdum velit laoreet id donec. Tristique sollicitudin nibh sit amet commodo nulla. Eget est lorem ipsum dolor sit amet consectetur adipiscing. Dui vivamus arcu felis bibendum ut tristique et. Tincidunt id aliquet risus feugiat in ante metus. Volutpat sed cras ornare arcu dui vivamus arcu. Sagittis vitae et leo duis. Accumsan sit amet nulla facilisi morbi tempus iaculis urna. Elit sed vulputate mi sit amet mauris commodo quis imperdiet. Mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et. Quis auctor elit sed vulputate mi sit amet mauris commodo. Phasellus vestibulum lorem sed risus ultricies tristique nulla. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum.','2021-06-04 14:08:06','2021-06-04 14:08:06'),(2,1,3,'3d3898c0a76c013983b8000c29c74624','Ut porttitor leo a diam sollicitudin tempor. Porttitor leo a diam sollicitudin tempor id. Arcu cursus euismod quis viverra nibh cras. Id semper risus in hendrerit gravida. Pretium lectus quam id leo in vitae turpis massa. Quis risus sed vulputate odio ut enim blandit volutpat. Scelerisque eu ultrices vitae auctor eu augue ut lectus arcu. Mauris augue neque gravida in fermentum et sollicitudin ac orci. Pretium nibh ipsum consequat nisl. Justo laoreet sit amet cursus sit. Maecenas sed enim ut sem viverra aliquet eget. Non diam phasellus vestibulum lorem sed risus ultricies. Phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor. Eu ultrices vitae auctor eu augue ut lectus. Amet mattis vulputate enim nulla. Consequat mauris nunc congue nisi vitae suscipit. Imperdiet sed euismod nisi porta lorem mollis aliqua','2021-06-04 14:08:19','2021-06-04 14:08:19'),(3,1,3,'4b8c8500a76c013983b8000c29c74624','Ut porttitor leo a diam sollicitudin tempor. Porttitor leo a diam sollicitudin tempor id. Arcu cursus euismod quis viverra nibh cras. Id semper risus in hendrerit gravida. Pretium lectus quam id leo in vitae turpis massa. Quis risus sed vulputate odio ut enim blandit volutpat. Scelerisque eu ultrices vitae auctor eu augue ut lectus arcu. Mauris augue neque gravida in fermentum et sollicitudin ac orci. Pretium nibh ipsum consequat nisl. Justo laoreet sit amet cursus sit. Maecenas sed enim ut sem viverra aliquet eget. Non diam phasellus vestibulum lorem sed risus ultricies. Phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor. Eu ultrices vitae auctor eu augue ut lectus. Amet mattis vulputate enim nulla. Consequat mauris nunc congue nisi vitae suscipit. Imperdiet sed euismod nisi porta lorem mollis aliqua','2021-06-04 14:08:43','2021-06-04 14:08:43'),(4,1,1,'6c95f550a76c013983b8000c29c74624','Nice','2021-06-04 14:09:39','2021-06-04 14:09:39'),(5,1,1,'ba6e59c0a76c013983b6000c29c74624','fuck','2021-06-04 14:11:49','2021-06-04 14:11:49'),(6,1,3,'c57d9570a76e013983b6000c29c74624','qwprituvnqiu','2021-06-04 14:26:27','2021-06-04 14:26:27');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_actors`
--

DROP TABLE IF EXISTS `notification_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_actors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notification_id` int DEFAULT NULL,
  `person_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_notification_actors_on_notification_id_and_person_id` (`notification_id`,`person_id`),
  KEY `index_notification_actors_on_notification_id` (`notification_id`),
  KEY `index_notification_actors_on_person_id` (`person_id`),
  CONSTRAINT `notification_actors_notification_id_fk` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_actors`
--

LOCK TABLES `notification_actors` WRITE;
/*!40000 ALTER TABLE `notification_actors` DISABLE KEYS */;
INSERT INTO `notification_actors` VALUES (1,1,1,'2021-06-04 13:34:33','2021-06-04 13:34:33'),(2,2,1,'2021-06-04 13:34:41','2021-06-04 13:34:41'),(3,3,1,'2021-06-04 13:34:44','2021-06-04 13:34:44'),(4,4,1,'2021-06-04 13:34:47','2021-06-04 13:34:47'),(5,5,1,'2021-06-04 13:34:51','2021-06-04 13:34:51'),(6,6,1,'2021-06-04 13:34:56','2021-06-04 13:34:56'),(7,7,1,'2021-06-04 13:35:00','2021-06-04 13:35:00'),(8,8,1,'2021-06-04 13:35:13','2021-06-04 13:35:13'),(9,9,1,'2021-06-04 13:35:23','2021-06-04 13:35:23'),(10,10,1,'2021-06-04 13:35:31','2021-06-04 13:35:31'),(11,11,1,'2021-06-04 13:35:44','2021-06-04 13:35:44'),(12,12,3,'2021-06-04 13:36:35','2021-06-04 13:36:35'),(13,13,3,'2021-06-04 13:36:48','2021-06-04 13:36:48'),(14,14,3,'2021-06-04 13:36:49','2021-06-04 13:36:49'),(15,15,3,'2021-06-04 13:36:53','2021-06-04 13:36:53'),(16,16,3,'2021-06-04 13:36:55','2021-06-04 13:36:55'),(17,17,3,'2021-06-04 13:36:56','2021-06-04 13:36:56'),(18,18,3,'2021-06-04 13:36:59','2021-06-04 13:36:59'),(19,19,3,'2021-06-04 13:37:03','2021-06-04 13:37:03'),(20,20,3,'2021-06-04 13:37:16','2021-06-04 13:37:16'),(21,21,3,'2021-06-04 13:37:20','2021-06-04 13:37:20'),(22,22,3,'2021-06-04 13:37:23','2021-06-04 13:37:23'),(23,23,3,'2021-06-04 13:37:36','2021-06-04 13:37:36'),(24,24,3,'2021-06-04 13:37:46','2021-06-04 13:37:46'),(25,25,3,'2021-06-04 13:38:04','2021-06-04 13:38:04'),(26,26,1,'2021-06-04 13:38:53','2021-06-04 13:38:53'),(27,27,1,'2021-06-04 13:38:54','2021-06-04 13:38:54'),(28,28,1,'2021-06-04 13:39:00','2021-06-04 13:39:00'),(29,29,3,'2021-06-04 13:40:54','2021-06-04 13:40:54'),(30,30,3,'2021-06-04 13:41:31','2021-06-04 13:41:31'),(31,4,4,'2021-06-04 13:44:52','2021-06-04 13:44:52'),(32,7,4,'2021-06-04 13:44:55','2021-06-04 13:44:55'),(33,10,4,'2021-06-04 13:45:03','2021-06-04 13:45:03'),(34,31,4,'2021-06-04 13:45:03','2021-06-04 13:45:03'),(35,32,4,'2021-06-04 13:45:38','2021-06-04 13:45:38'),(36,33,4,'2021-06-04 13:58:46','2021-06-04 13:58:46'),(37,34,4,'2021-06-04 13:58:48','2021-06-04 13:58:48'),(38,14,4,'2021-06-04 13:58:49','2021-06-04 13:58:49'),(39,15,4,'2021-06-04 13:58:54','2021-06-04 13:58:54'),(40,6,4,'2021-06-04 13:58:55','2021-06-04 13:58:55'),(41,16,4,'2021-06-04 13:58:57','2021-06-04 13:58:57'),(42,35,4,'2021-06-04 13:59:11','2021-06-04 13:59:11'),(43,20,4,'2021-06-04 13:59:13','2021-06-04 13:59:13'),(44,18,4,'2021-06-04 13:59:15','2021-06-04 13:59:15'),(45,21,4,'2021-06-04 13:59:18','2021-06-04 13:59:18'),(46,36,4,'2021-06-04 13:59:20','2021-06-04 13:59:20'),(47,37,4,'2021-06-04 13:59:21','2021-06-04 13:59:21'),(48,23,4,'2021-06-04 13:59:49','2021-06-04 13:59:49'),(49,38,4,'2021-06-04 13:59:49','2021-06-04 13:59:49'),(50,26,4,'2021-06-04 14:00:30','2021-06-04 14:00:30'),(51,39,4,'2021-06-04 14:00:35','2021-06-04 14:00:35'),(52,27,4,'2021-06-04 14:00:38','2021-06-04 14:00:38'),(53,40,4,'2021-06-04 14:00:42','2021-06-04 14:00:42'),(54,41,4,'2021-06-04 14:00:52','2021-06-04 14:00:52'),(55,5,4,'2021-06-04 14:00:53','2021-06-04 14:00:53'),(56,8,4,'2021-06-04 14:01:07','2021-06-04 14:01:07'),(57,42,4,'2021-06-04 14:01:07','2021-06-04 14:01:07'),(58,3,4,'2021-06-04 14:01:10','2021-06-04 14:01:10'),(59,43,3,'2021-06-04 14:06:24','2021-06-04 14:06:24'),(60,44,3,'2021-06-04 14:06:26','2021-06-04 14:06:26'),(61,33,3,'2021-06-04 14:06:37','2021-06-04 14:06:37'),(62,34,3,'2021-06-04 14:06:39','2021-06-04 14:06:39'),(63,45,3,'2021-06-04 14:06:52','2021-06-04 14:06:52'),(64,46,3,'2021-06-04 14:06:52','2021-06-04 14:06:52'),(65,47,1,'2021-06-04 14:10:01','2021-06-04 14:10:01'),(66,48,1,'2021-06-04 14:10:03','2021-06-04 14:10:03'),(67,49,1,'2021-06-04 14:10:04','2021-06-04 14:10:04'),(68,50,1,'2021-06-04 14:10:06','2021-06-04 14:10:06'),(69,51,1,'2021-06-04 14:10:09','2021-06-04 14:10:09'),(70,52,1,'2021-06-04 14:10:11','2021-06-04 14:10:11'),(71,53,1,'2021-06-04 14:10:14','2021-06-04 14:10:14'),(72,54,1,'2021-06-04 14:10:16','2021-06-04 14:10:16'),(73,55,1,'2021-06-04 14:10:17','2021-06-04 14:10:17'),(74,56,1,'2021-06-04 14:10:21','2021-06-04 14:10:21'),(75,57,1,'2021-06-04 14:10:22','2021-06-04 14:10:22'),(76,58,1,'2021-06-04 14:10:25','2021-06-04 14:10:25'),(77,43,1,'2021-06-04 14:10:26','2021-06-04 14:10:26'),(78,44,1,'2021-06-04 14:10:28','2021-06-04 14:10:28'),(79,59,1,'2021-06-04 14:10:30','2021-06-04 14:10:30'),(80,60,5,'2021-06-04 14:21:15','2021-06-04 14:21:15'),(81,61,5,'2021-06-04 14:21:26','2021-06-04 14:21:26'),(82,62,5,'2021-06-04 14:21:36','2021-06-04 14:21:36'),(83,63,5,'2021-06-04 14:21:43','2021-06-04 14:21:43'),(84,64,5,'2021-06-04 14:22:03','2021-06-04 14:22:03'),(85,44,5,'2021-06-04 14:22:06','2021-06-04 14:22:06'),(86,65,5,'2021-06-04 14:22:20','2021-06-04 14:22:20'),(87,66,5,'2021-06-04 14:22:20','2021-06-04 14:22:20'),(88,67,5,'2021-06-04 14:22:23','2021-06-04 14:22:23'),(89,49,5,'2021-06-04 14:22:25','2021-06-04 14:22:25'),(90,68,5,'2021-06-04 14:22:27','2021-06-04 14:22:27'),(91,69,5,'2021-06-04 14:22:34','2021-06-04 14:22:34'),(92,70,5,'2021-06-04 14:22:34','2021-06-04 14:22:34'),(93,71,5,'2021-06-04 14:22:37','2021-06-04 14:22:37'),(94,48,5,'2021-06-04 14:22:42','2021-06-04 14:22:42'),(95,52,5,'2021-06-04 14:22:46','2021-06-04 14:22:46'),(96,72,5,'2021-06-04 14:22:51','2021-06-04 14:22:51'),(97,53,5,'2021-06-04 14:22:53','2021-06-04 14:22:53'),(98,55,5,'2021-06-04 14:22:57','2021-06-04 14:22:57'),(99,20,5,'2021-06-04 14:22:59','2021-06-04 14:22:59'),(100,57,5,'2021-06-04 14:23:01','2021-06-04 14:23:01'),(101,6,5,'2021-06-04 14:23:03','2021-06-04 14:23:03'),(102,59,5,'2021-06-04 14:23:06','2021-06-04 14:23:06'),(103,73,5,'2021-06-04 14:23:08','2021-06-04 14:23:08'),(104,74,5,'2021-06-04 14:23:10','2021-06-04 14:23:10'),(105,27,5,'2021-06-04 14:23:13','2021-06-04 14:23:13'),(106,75,5,'2021-06-04 14:23:15','2021-06-04 14:23:15'),(107,15,5,'2021-06-04 14:23:17','2021-06-04 14:23:17'),(108,35,5,'2021-06-04 14:23:20','2021-06-04 14:23:20'),(109,76,5,'2021-06-04 14:23:32','2021-06-04 14:23:32'),(110,77,5,'2021-06-04 14:23:32','2021-06-04 14:23:32'),(111,78,5,'2021-06-04 14:23:32','2021-06-04 14:23:32'),(112,79,5,'2021-06-04 14:23:34','2021-06-04 14:23:34'),(113,10,5,'2021-06-04 14:23:38','2021-06-04 14:23:38'),(114,80,5,'2021-06-04 14:23:38','2021-06-04 14:23:38'),(115,81,5,'2021-06-04 14:23:38','2021-06-04 14:23:38'),(116,82,5,'2021-06-04 14:23:40','2021-06-04 14:23:40'),(117,43,5,'2021-06-04 14:23:53','2021-06-04 14:23:53'),(118,7,5,'2021-06-04 14:23:58','2021-06-04 14:23:58'),(119,83,5,'2021-06-04 14:24:15','2021-06-04 14:24:15'),(120,84,5,'2021-06-04 14:25:55','2021-06-04 14:25:55'),(121,85,3,'2021-06-04 14:26:32','2021-06-04 14:26:32'),(122,86,3,'2021-06-04 14:26:34','2021-06-04 14:26:34'),(123,87,3,'2021-06-04 14:26:36','2021-06-04 14:26:36'),(124,88,3,'2021-06-04 14:26:37','2021-06-04 14:26:37'),(125,89,4,'2021-06-04 14:27:07','2021-06-04 14:27:07'),(126,86,4,'2021-06-04 14:27:08','2021-06-04 14:27:08'),(127,90,4,'2021-06-04 14:27:13','2021-06-04 14:27:13'),(128,91,4,'2021-06-04 14:27:16','2021-06-04 14:27:16'),(129,92,4,'2021-06-04 14:27:19','2021-06-04 14:27:19'),(130,87,4,'2021-06-04 14:27:22','2021-06-04 14:27:22'),(131,88,4,'2021-06-04 14:27:23','2021-06-04 14:27:23'),(132,64,4,'2021-06-04 14:27:26','2021-06-04 14:27:26'),(133,67,4,'2021-06-04 14:27:29','2021-06-04 14:27:29'),(134,93,4,'2021-06-04 14:27:32','2021-06-04 14:27:32'),(135,94,4,'2021-06-04 14:27:32','2021-06-04 14:27:32'),(136,95,1,'2021-06-04 14:28:57','2021-06-04 14:28:57'),(137,88,1,'2021-06-04 14:28:58','2021-06-04 14:28:58'),(138,96,1,'2021-06-04 14:29:02','2021-06-04 14:29:02'),(139,97,1,'2021-06-04 14:29:05','2021-06-04 14:29:05'),(140,86,1,'2021-06-04 14:29:07','2021-06-04 14:29:07'),(141,98,1,'2021-06-04 14:29:11','2021-06-04 14:29:11'),(142,90,1,'2021-06-04 14:29:11','2021-06-04 14:29:11'),(143,87,1,'2021-06-04 14:29:40','2021-06-04 14:29:40'),(144,99,1,'2021-06-04 14:30:01','2021-06-04 14:30:01'),(145,100,1,'2021-06-04 14:30:20','2021-06-04 14:30:20'),(146,101,1,'2021-06-04 14:30:23','2021-06-04 14:30:23'),(147,102,1,'2021-06-04 14:30:25','2021-06-04 14:30:25'),(148,103,1,'2021-06-04 14:30:26','2021-06-04 14:30:26'),(149,104,1,'2021-06-04 14:30:30','2021-06-04 14:30:30'),(150,105,1,'2021-06-04 14:30:34','2021-06-04 14:30:34'),(151,106,1,'2021-06-04 14:30:37','2021-06-04 14:30:37'),(152,107,1,'2021-06-04 14:30:39','2021-06-04 14:30:39'),(153,108,6,'2021-06-04 14:31:44','2021-06-04 14:31:44'),(154,109,6,'2021-06-04 14:31:52','2021-06-04 14:31:52'),(155,95,6,'2021-06-04 14:31:59','2021-06-04 14:31:59'),(156,88,6,'2021-06-04 14:32:00','2021-06-04 14:32:00'),(157,97,6,'2021-06-04 14:32:05','2021-06-04 14:32:05'),(158,86,6,'2021-06-04 14:32:07','2021-06-04 14:32:07'),(159,102,6,'2021-06-04 14:32:11','2021-06-04 14:32:11'),(160,103,6,'2021-06-04 14:32:13','2021-06-04 14:32:13'),(161,104,6,'2021-06-04 14:32:17','2021-06-04 14:32:17'),(162,7,6,'2021-06-04 14:32:18','2021-06-04 14:32:18'),(163,105,6,'2021-06-04 14:32:21','2021-06-04 14:32:21'),(164,75,6,'2021-06-04 14:32:23','2021-06-04 14:32:23'),(165,106,6,'2021-06-04 14:32:30','2021-06-04 14:32:30'),(166,110,6,'2021-06-04 14:32:30','2021-06-04 14:32:30'),(167,107,6,'2021-06-04 14:32:32','2021-06-04 14:32:32'),(168,6,6,'2021-06-04 14:32:35','2021-06-04 14:32:35'),(169,72,6,'2021-06-04 14:32:39','2021-06-04 14:32:39'),(170,111,6,'2021-06-04 14:32:43','2021-06-04 14:32:43'),(171,112,6,'2021-06-04 14:32:43','2021-06-04 14:32:43'),(172,113,6,'2021-06-04 14:32:46','2021-06-04 14:32:46'),(173,49,6,'2021-06-04 14:32:48','2021-06-04 14:32:48'),(174,44,6,'2021-06-04 14:32:51','2021-06-04 14:32:51'),(175,114,6,'2021-06-04 14:32:55','2021-06-04 14:32:55'),(176,115,6,'2021-06-04 14:32:55','2021-06-04 14:32:55'),(177,116,6,'2021-06-04 14:32:55','2021-06-04 14:32:55'),(178,117,6,'2021-06-04 14:32:55','2021-06-04 14:32:55'),(179,118,6,'2021-06-04 14:32:59','2021-06-04 14:32:59'),(180,119,6,'2021-06-04 14:32:59','2021-06-04 14:32:59'),(181,120,6,'2021-06-04 14:32:59','2021-06-04 14:32:59'),(182,121,6,'2021-06-04 14:33:20','2021-06-04 14:33:20'),(183,122,1,'2021-06-04 14:33:51','2021-06-04 14:33:51');
/*!40000 ALTER TABLE `notification_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `target_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `recipient_id` int NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_recipient_id` (`recipient_id`),
  KEY `index_notifications_on_target_id` (`target_id`),
  KEY `index_notifications_on_target_type_and_target_id` (`target_type`(190),`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'Person',1,2,0,'2021-06-04 13:34:33','2021-06-04 13:34:33','Notifications::StartedSharing'),(2,'Post',11,2,0,'2021-06-04 13:34:41','2021-06-04 13:36:14','Notifications::Liked'),(3,'Post',10,2,0,'2021-06-04 13:34:44','2021-06-04 14:01:10','Notifications::Liked'),(4,'Post',8,2,1,'2021-06-04 13:34:47','2021-06-04 13:44:52','Notifications::Liked'),(5,'Post',11,2,0,'2021-06-04 13:34:51','2021-06-04 14:00:53','Notifications::Reshared'),(6,'Post',10,2,1,'2021-06-04 13:34:56','2021-06-04 14:32:35','Notifications::Reshared'),(7,'Post',8,2,1,'2021-06-04 13:35:00','2021-06-04 14:32:18','Notifications::Reshared'),(8,'Post',11,2,1,'2021-06-04 13:35:13','2021-06-04 14:01:07','Notifications::CommentOnPost'),(9,'Post',10,2,0,'2021-06-04 13:35:23','2021-06-04 13:35:23','Notifications::CommentOnPost'),(10,'Post',8,2,1,'2021-06-04 13:35:31','2021-06-04 14:23:38','Notifications::CommentOnPost'),(11,'Mention',2,2,0,'2021-06-04 13:35:44','2021-06-04 13:35:44','Notifications::MentionedInPost'),(12,'Person',3,1,0,'2021-06-04 13:36:35','2021-06-04 13:36:35','Notifications::StartedSharing'),(13,'Post',16,1,1,'2021-06-04 13:36:48','2021-06-04 13:36:48','Notifications::Liked'),(14,'Post',15,1,1,'2021-06-04 13:36:49','2021-06-04 13:58:49','Notifications::Liked'),(15,'Post',14,1,1,'2021-06-04 13:36:53','2021-06-04 14:23:17','Notifications::Liked'),(16,'Post',13,1,1,'2021-06-04 13:36:55','2021-06-04 13:58:57','Notifications::Liked'),(17,'Post',12,1,0,'2021-06-04 13:36:56','2021-06-04 13:36:56','Notifications::Liked'),(18,'Post',7,1,0,'2021-06-04 13:36:59','2021-06-04 13:59:15','Notifications::Liked'),(19,'Post',6,1,0,'2021-06-04 13:37:03','2021-06-04 13:37:03','Notifications::Liked'),(20,'Post',12,1,0,'2021-06-04 13:37:16','2021-06-04 14:22:59','Notifications::Reshared'),(21,'Post',7,1,0,'2021-06-04 13:37:20','2021-06-04 13:59:18','Notifications::Reshared'),(22,'Post',6,1,0,'2021-06-04 13:37:23','2021-06-04 13:37:23','Notifications::Reshared'),(23,'Post',6,1,0,'2021-06-04 13:37:36','2021-06-04 13:59:49','Notifications::CommentOnPost'),(24,'Post',7,1,0,'2021-06-04 13:37:46','2021-06-04 13:37:46','Notifications::CommentOnPost'),(25,'Post',13,1,1,'2021-06-04 13:38:04','2021-06-04 13:38:04','Notifications::CommentOnPost'),(26,'Post',19,2,1,'2021-06-04 13:38:53','2021-06-04 14:00:30','Notifications::Liked'),(27,'Post',18,2,1,'2021-06-04 13:38:54','2021-06-04 14:23:13','Notifications::Liked'),(28,'Post',17,2,0,'2021-06-04 13:39:00','2021-06-04 13:39:00','Notifications::Liked'),(29,'Post',16,1,0,'2021-06-04 13:40:54','2021-06-04 13:40:54','Notifications::CommentOnPost'),(30,'Mention',4,1,1,'2021-06-04 13:41:31','2021-06-04 13:41:31','Notifications::MentionedInPost'),(31,'Post',8,1,0,'2021-06-04 13:45:03','2021-06-04 14:01:19','Notifications::AlsoCommented'),(32,'Person',4,1,0,'2021-06-04 13:45:38','2021-06-04 13:45:38','Notifications::StartedSharing'),(33,'Post',20,1,0,'2021-06-04 13:58:46','2021-06-04 14:06:37','Notifications::Liked'),(34,'Post',20,1,0,'2021-06-04 13:58:48','2021-06-04 14:06:39','Notifications::Reshared'),(35,'Post',12,1,1,'2021-06-04 13:59:11','2021-06-04 14:23:20','Notifications::Liked'),(36,'Post',6,1,0,'2021-06-04 13:59:20','2021-06-04 13:59:20','Notifications::Liked'),(37,'Post',6,1,1,'2021-06-04 13:59:21','2021-06-04 13:59:21','Notifications::Reshared'),(38,'Post',6,2,1,'2021-06-04 13:59:49','2021-06-04 13:59:49','Notifications::AlsoCommented'),(39,'Person',4,2,1,'2021-06-04 14:00:35','2021-06-04 14:00:35','Notifications::StartedSharing'),(40,'Post',17,2,1,'2021-06-04 14:00:42','2021-06-04 14:00:42','Notifications::Liked'),(41,'Post',11,2,1,'2021-06-04 14:00:52','2021-06-04 14:00:52','Notifications::Liked'),(42,'Post',11,1,0,'2021-06-04 14:01:07','2021-06-04 14:01:07','Notifications::AlsoCommented'),(43,'Post',23,3,0,'2021-06-04 14:06:24','2021-06-04 14:23:53','Notifications::Liked'),(44,'Post',23,3,1,'2021-06-04 14:06:26','2021-06-04 14:32:51','Notifications::Reshared'),(45,'Post',14,1,0,'2021-06-04 14:06:52','2021-06-04 14:06:52','Notifications::CommentOnPost'),(46,'Post',14,3,1,'2021-06-04 14:06:52','2021-06-04 14:06:52','Notifications::AlsoCommented'),(47,'Person',1,3,1,'2021-06-04 14:10:01','2021-06-04 14:10:01','Notifications::StartedSharing'),(48,'Post',34,3,1,'2021-06-04 14:10:03','2021-06-04 14:22:42','Notifications::Liked'),(49,'Post',34,3,1,'2021-06-04 14:10:04','2021-06-04 14:32:48','Notifications::Reshared'),(50,'Post',33,3,1,'2021-06-04 14:10:06','2021-06-04 14:10:06','Notifications::Liked'),(51,'Post',32,3,1,'2021-06-04 14:10:09','2021-06-04 14:10:09','Notifications::Liked'),(52,'Post',29,3,1,'2021-06-04 14:10:11','2021-06-04 14:22:46','Notifications::Liked'),(53,'Post',28,3,0,'2021-06-04 14:10:14','2021-06-04 14:22:53','Notifications::Liked'),(54,'Post',27,3,1,'2021-06-04 14:10:16','2021-06-04 14:10:16','Notifications::Liked'),(55,'Post',26,3,0,'2021-06-04 14:10:17','2021-06-04 14:22:57','Notifications::Liked'),(56,'Post',26,3,1,'2021-06-04 14:10:21','2021-06-04 14:10:21','Notifications::CommentOnPost'),(57,'Post',25,3,0,'2021-06-04 14:10:22','2021-06-04 14:23:01','Notifications::Liked'),(58,'Post',24,3,1,'2021-06-04 14:10:25','2021-06-04 14:10:25','Notifications::Liked'),(59,'Post',22,3,1,'2021-06-04 14:10:30','2021-06-04 14:23:06','Notifications::Liked'),(60,'Person',5,1,0,'2021-06-04 14:21:15','2021-06-04 14:21:15','Notifications::StartedSharing'),(61,'Person',5,3,1,'2021-06-04 14:21:26','2021-06-04 14:21:26','Notifications::StartedSharing'),(62,'Person',5,2,1,'2021-06-04 14:21:36','2021-06-04 14:21:36','Notifications::StartedSharing'),(63,'Mention',6,2,1,'2021-06-04 14:21:43','2021-06-04 14:21:43','Notifications::MentionedInPost'),(64,'Post',39,1,1,'2021-06-04 14:22:03','2021-06-04 14:27:26','Notifications::Liked'),(65,'Post',39,1,1,'2021-06-04 14:22:20','2021-06-04 14:22:20','Notifications::CommentOnPost'),(66,'Post',39,3,1,'2021-06-04 14:22:20','2021-06-04 14:22:20','Notifications::AlsoCommented'),(67,'Post',38,1,1,'2021-06-04 14:22:23','2021-06-04 14:27:29','Notifications::Liked'),(68,'Post',36,2,1,'2021-06-04 14:22:27','2021-06-04 14:22:27','Notifications::Liked'),(69,'Post',36,2,1,'2021-06-04 14:22:34','2021-06-04 14:22:34','Notifications::CommentOnPost'),(70,'Post',36,1,0,'2021-06-04 14:22:34','2021-06-04 14:22:34','Notifications::AlsoCommented'),(71,'Post',35,2,1,'2021-06-04 14:22:37','2021-06-04 14:22:37','Notifications::Liked'),(72,'Post',11,2,1,'2021-06-04 14:22:51','2021-06-04 14:32:39','Notifications::Reshared'),(73,'Post',20,1,0,'2021-06-04 14:23:08','2021-06-04 14:23:08','Notifications::Liked'),(74,'Post',20,1,0,'2021-06-04 14:23:10','2021-06-04 14:23:10','Notifications::Reshared'),(75,'Post',7,1,1,'2021-06-04 14:23:15','2021-06-04 14:32:23','Notifications::Reshared'),(76,'Post',10,2,1,'2021-06-04 14:23:32','2021-06-04 14:23:32','Notifications::CommentOnPost'),(77,'Post',10,1,0,'2021-06-04 14:23:32','2021-06-04 14:23:32','Notifications::AlsoCommented'),(78,'Post',10,3,0,'2021-06-04 14:23:32','2021-06-04 14:23:32','Notifications::AlsoCommented'),(79,'Post',10,2,1,'2021-06-04 14:23:34','2021-06-04 14:23:34','Notifications::Liked'),(80,'Post',8,1,0,'2021-06-04 14:23:38','2021-06-04 14:23:38','Notifications::AlsoCommented'),(81,'Post',8,3,0,'2021-06-04 14:23:38','2021-06-04 14:23:38','Notifications::AlsoCommented'),(82,'Post',7,1,0,'2021-06-04 14:23:40','2021-06-04 14:23:40','Notifications::Liked'),(83,'Mention',8,3,1,'2021-06-04 14:24:15','2021-06-04 14:24:15','Notifications::MentionedInPost'),(84,'Post',48,1,0,'2021-06-04 14:25:55','2021-06-04 14:25:55','Notifications::AlsoCommented'),(85,'Post',41,4,1,'2021-06-04 14:26:32','2021-06-04 14:26:32','Notifications::Liked'),(86,'Post',41,4,1,'2021-06-04 14:26:34','2021-06-04 14:32:07','Notifications::Reshared'),(87,'Post',40,4,1,'2021-06-04 14:26:36','2021-06-04 14:29:40','Notifications::Liked'),(88,'Post',40,4,1,'2021-06-04 14:26:37','2021-06-04 14:32:00','Notifications::Reshared'),(89,'Post',55,2,1,'2021-06-04 14:27:07','2021-06-04 14:27:07','Notifications::Liked'),(90,'Post',57,4,1,'2021-06-04 14:27:13','2021-06-04 14:29:11','Notifications::AlsoCommented'),(91,'Post',50,4,1,'2021-06-04 14:27:16','2021-06-04 14:27:16','Notifications::Liked'),(92,'Post',50,4,1,'2021-06-04 14:27:19','2021-06-04 14:27:19','Notifications::CommentOnPost'),(93,'Post',38,1,1,'2021-06-04 14:27:32','2021-06-04 14:27:32','Notifications::CommentOnPost'),(94,'Post',38,4,1,'2021-06-04 14:27:32','2021-06-04 14:27:32','Notifications::AlsoCommented'),(95,'Post',58,3,1,'2021-06-04 14:28:57','2021-06-04 14:31:59','Notifications::Liked'),(96,'Post',59,4,1,'2021-06-04 14:29:02','2021-06-04 14:29:02','Notifications::AlsoCommented'),(97,'Post',57,3,1,'2021-06-04 14:29:05','2021-06-04 14:32:05','Notifications::Liked'),(98,'Post',57,3,1,'2021-06-04 14:29:11','2021-06-04 14:29:11','Notifications::CommentOnPost'),(99,'Person',1,4,1,'2021-06-04 14:30:01','2021-06-04 14:30:01','Notifications::StartedSharing'),(100,'Post',52,4,1,'2021-06-04 14:30:20','2021-06-04 14:30:20','Notifications::Liked'),(101,'Post',52,4,1,'2021-06-04 14:30:23','2021-06-04 14:30:23','Notifications::CommentOnPost'),(102,'Post',51,4,1,'2021-06-04 14:30:25','2021-06-04 14:32:11','Notifications::Liked'),(103,'Post',51,4,1,'2021-06-04 14:30:26','2021-06-04 14:32:13','Notifications::Reshared'),(104,'Post',49,4,1,'2021-06-04 14:30:30','2021-06-04 14:32:17','Notifications::Liked'),(105,'Post',48,4,1,'2021-06-04 14:30:34','2021-06-04 14:32:21','Notifications::Liked'),(106,'Post',48,4,1,'2021-06-04 14:30:37','2021-06-04 14:32:30','Notifications::CommentOnPost'),(107,'Post',47,4,1,'2021-06-04 14:30:39','2021-06-04 14:32:32','Notifications::Liked'),(108,'Person',6,4,1,'2021-06-04 14:31:44','2021-06-04 14:31:44','Notifications::StartedSharing'),(109,'Person',6,3,1,'2021-06-04 14:31:51','2021-06-04 14:31:51','Notifications::StartedSharing'),(110,'Post',48,1,1,'2021-06-04 14:32:30','2021-06-04 14:32:30','Notifications::AlsoCommented'),(111,'Post',44,4,1,'2021-06-04 14:32:43','2021-06-04 14:32:43','Notifications::CommentOnPost'),(112,'Post',44,2,1,'2021-06-04 14:32:43','2021-06-04 14:32:43','Notifications::AlsoCommented'),(113,'Post',43,4,1,'2021-06-04 14:32:46','2021-06-04 14:32:46','Notifications::Liked'),(114,'Post',41,4,1,'2021-06-04 14:32:55','2021-06-04 14:32:55','Notifications::CommentOnPost'),(115,'Post',41,1,1,'2021-06-04 14:32:55','2021-06-04 14:32:55','Notifications::AlsoCommented'),(116,'Post',41,2,1,'2021-06-04 14:32:55','2021-06-04 14:32:55','Notifications::AlsoCommented'),(117,'Post',41,3,1,'2021-06-04 14:32:55','2021-06-04 14:32:55','Notifications::AlsoCommented'),(118,'Post',34,3,1,'2021-06-04 14:32:59','2021-06-04 14:32:59','Notifications::CommentOnPost'),(119,'Post',34,1,1,'2021-06-04 14:32:59','2021-06-04 14:32:59','Notifications::AlsoCommented'),(120,'Post',34,4,1,'2021-06-04 14:32:59','2021-06-04 14:32:59','Notifications::AlsoCommented'),(121,'Person',6,1,0,'2021-06-04 14:33:20','2021-06-04 14:33:20','Notifications::StartedSharing'),(122,'Person',1,5,0,'2021-06-04 14:33:51','2021-06-04 14:33:51','Notifications::StartedSharing');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_auth_access_tokens`
--

DROP TABLE IF EXISTS `o_auth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_auth_access_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `authorization_id` int DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_o_auth_access_tokens_on_token` (`token`(191)),
  KEY `index_o_auth_access_tokens_on_authorization_id` (`authorization_id`),
  CONSTRAINT `fk_rails_5debabcff3` FOREIGN KEY (`authorization_id`) REFERENCES `authorizations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_auth_access_tokens`
--

LOCK TABLES `o_auth_access_tokens` WRITE;
/*!40000 ALTER TABLE `o_auth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_auth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_auth_applications`
--

DROP TABLE IF EXISTS `o_auth_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_auth_applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `redirect_uris` text COLLATE utf8mb4_bin,
  `response_types` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `grant_types` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `application_type` varchar(255) COLLATE utf8mb4_bin DEFAULT 'web',
  `contacts` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `logo_uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `client_uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `policy_uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `tos_uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sector_identifier_uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `token_endpoint_auth_method` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `jwks` text COLLATE utf8mb4_bin,
  `jwks_uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ppid` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_o_auth_applications_on_client_id` (`client_id`(191)),
  KEY `index_o_auth_applications_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_ad75323da2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_auth_applications`
--

LOCK TABLES `o_auth_applications` WRITE;
/*!40000 ALTER TABLE `o_auth_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_auth_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_embed_caches`
--

DROP TABLE IF EXISTS `o_embed_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_embed_caches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) COLLATE utf8mb4_bin NOT NULL,
  `data` text COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_o_embed_caches_on_url` (`url`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_embed_caches`
--

LOCK TABLES `o_embed_caches` WRITE;
/*!40000 ALTER TABLE `o_embed_caches` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_embed_caches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_graph_caches`
--

DROP TABLE IF EXISTS `open_graph_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `open_graph_caches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ob_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `image` text COLLATE utf8mb4_bin,
  `url` text COLLATE utf8mb4_bin,
  `description` text COLLATE utf8mb4_bin,
  `video_url` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_graph_caches`
--

LOCK TABLES `open_graph_caches` WRITE;
/*!40000 ALTER TABLE `open_graph_caches` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_graph_caches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participations`
--

DROP TABLE IF EXISTS `participations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `target_type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `author_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `count` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_participations_on_target_id_and_target_type_and_author_id` (`target_id`,`target_type`,`author_id`),
  KEY `index_participations_on_guid` (`guid`(191)),
  KEY `index_participations_on_author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participations`
--

LOCK TABLES `participations` WRITE;
/*!40000 ALTER TABLE `participations` DISABLE KEYS */;
INSERT INTO `participations` VALUES (1,'8a1d5e80a767013983b6000c29c74624',11,'Post',1,'2021-06-04 13:34:41','2021-06-04 13:36:14',4),(2,'8c0f2d60a767013983b8000c29c74624',10,'Post',1,'2021-06-04 13:34:44','2021-06-04 13:35:23',3),(3,'8d87de00a767013983b6000c29c74624',8,'Post',1,'2021-06-04 13:34:47','2021-06-04 13:38:44',4),(4,'904ab9e0a767013983b4000c29c74624',13,'Post',3,'2021-06-04 13:34:51','2021-06-04 13:38:04',3),(5,'9314a6b0a767013983b4000c29c74624',14,'Post',3,'2021-06-04 13:34:56','2021-06-04 14:06:52',3),(7,'d5a09550a767013983b8000c29c74624',16,'Post',3,'2021-06-04 13:36:48','2021-06-04 13:40:54',2),(8,'daf73090a767013983b8000c29c74624',12,'Post',3,'2021-06-04 13:36:56','2021-06-04 13:37:16',2),(9,'dc769eb0a767013983b6000c29c74624',7,'Post',3,'2021-06-04 13:36:59','2021-06-04 13:37:46',3),(11,'e6d17af0a767013983b4000c29c74624',17,'Post',1,'2021-06-04 13:37:16','2021-06-04 13:39:00',2),(12,'e8bb40f0a767013983b4000c29c74624',18,'Post',1,'2021-06-04 13:37:20','2021-06-04 13:38:54',2),(13,'ea8591c0a767013983b4000c29c74624',19,'Post',1,'2021-06-04 13:37:23','2021-06-04 13:38:53',2),(14,'f6a48140a768013983b6000c29c74624',8,'Post',4,'2021-06-04 13:44:52','2021-06-04 14:01:19',4),(15,'f8247f00a768013983b4000c29c74624',22,'Post',3,'2021-06-04 13:44:55','2021-06-04 13:44:55',1),(16,'e76f2320a76a013983b8000c29c74624',20,'Post',4,'2021-06-04 13:58:46','2021-06-04 13:58:48',2),(17,'e88c79f0a76a013983b4000c29c74624',24,'Post',1,'2021-06-04 13:58:48','2021-06-04 14:10:25',2),(18,'e98ed6d0a76a013983b8000c29c74624',15,'Post',4,'2021-06-04 13:58:49','2021-06-04 13:58:49',1),(19,'ec340ac0a76a013983b8000c29c74624',14,'Post',4,'2021-06-04 13:58:54','2021-06-04 13:58:54',1),(20,'ed1db440a76a013983b8000c29c74624',10,'Post',4,'2021-06-04 13:58:55','2021-06-04 14:01:10',2),(21,'ed2738e0a76a013983b4000c29c74624',25,'Post',3,'2021-06-04 13:58:55','2021-06-04 13:58:55',1),(22,'ee307130a76a013983b6000c29c74624',13,'Post',4,'2021-06-04 13:58:57','2021-06-04 13:58:57',1),(23,'f3348fb0a76a013983b8000c29c74624',11,'Post',4,'2021-06-04 13:59:06','2021-06-04 14:01:07',4),(24,'f6358560a76a013983b8000c29c74624',12,'Post',4,'2021-06-04 13:59:11','2021-06-04 13:59:12',2),(25,'f75131d0a76a013983b4000c29c74624',26,'Post',1,'2021-06-04 13:59:13','2021-06-04 14:10:21',3),(26,'f90ff370a76a013983b8000c29c74624',7,'Post',4,'2021-06-04 13:59:15','2021-06-04 13:59:18',2),(27,'fa5a3e60a76a013983b4000c29c74624',27,'Post',1,'2021-06-04 13:59:18','2021-06-04 14:10:16',2),(28,'fb807a50a76a013983b8000c29c74624',6,'Post',4,'2021-06-04 13:59:20','2021-06-04 13:59:48',3),(29,'fc803900a76a013983b4000c29c74624',28,'Post',1,'2021-06-04 13:59:21','2021-06-04 14:10:14',2),(30,'257256b0a76b013983b8000c29c74624',19,'Post',4,'2021-06-04 14:00:30','2021-06-04 14:00:30',1),(31,'2a7d8660a76b013983b6000c29c74624',18,'Post',4,'2021-06-04 14:00:38','2021-06-04 14:00:38',1),(32,'2cdda260a76b013983b8000c29c74624',17,'Post',4,'2021-06-04 14:00:42','2021-06-04 14:00:42',1),(33,'335d2790a76b013983b4000c29c74624',29,'Post',3,'2021-06-04 14:00:53','2021-06-04 14:00:53',1),(34,'f8726710a76b013983b8000c29c74624',23,'Post',3,'2021-06-04 14:06:24','2021-06-04 14:06:28',2),(35,'f976a1c0a76b013983b4000c29c74624',35,'Post',4,'2021-06-04 14:06:26','2021-06-04 14:06:26',1),(37,'0130c370a76c013983b4000c29c74624',36,'Post',1,'2021-06-04 14:06:39','2021-06-04 14:06:39',1),(38,'7aedf390a76c013983b8000c29c74624',34,'Post',1,'2021-06-04 14:10:03','2021-06-04 14:10:04',2),(39,'7bd47f00a76c013983b4000c29c74624',38,'Post',4,'2021-06-04 14:10:04','2021-06-04 14:27:32',3),(40,'7ce83390a76c013983b8000c29c74624',33,'Post',1,'2021-06-04 14:10:06','2021-06-04 14:10:06',1),(41,'7ec4ad60a76c013983b6000c29c74624',32,'Post',1,'2021-06-04 14:10:09','2021-06-04 14:10:09',1),(42,'7fa974f0a76c013983b8000c29c74624',29,'Post',1,'2021-06-04 14:10:11','2021-06-04 14:10:11',1),(43,'86830510a76c013983b6000c29c74624',25,'Post',1,'2021-06-04 14:10:22','2021-06-04 14:10:22',1),(44,'88e54a30a76c013983b6000c29c74624',23,'Post',1,'2021-06-04 14:10:26','2021-06-04 14:10:28',2),(45,'89db9e40a76c013983b4000c29c74624',39,'Post',4,'2021-06-04 14:10:28','2021-06-04 14:27:26',2),(46,'8b049070a76c013983b6000c29c74624',22,'Post',1,'2021-06-04 14:10:30','2021-06-04 14:10:30',1),(47,'2858d0b0a76e013983b6000c29c74624',39,'Post',5,'2021-06-04 14:22:03','2021-06-04 14:22:20',2),(48,'2a07d3f0a76e013983b8000c29c74624',23,'Post',5,'2021-06-04 14:22:06','2021-06-04 14:23:53',2),(49,'2a0f4d10a76e013983b4000c29c74624',42,'Post',4,'2021-06-04 14:22:06','2021-06-04 14:22:06',1),(50,'3429abd0a76e013983b8000c29c74624',38,'Post',5,'2021-06-04 14:22:23','2021-06-04 14:22:23',1),(51,'353bc420a76e013983b6000c29c74624',34,'Post',5,'2021-06-04 14:22:25','2021-06-04 14:22:42',2),(52,'35419d50a76e013983b4000c29c74624',43,'Post',4,'2021-06-04 14:22:25','2021-06-04 14:22:25',1),(53,'3642d700a76e013983b6000c29c74624',36,'Post',5,'2021-06-04 14:22:27','2021-06-04 14:22:34',2),(54,'3c6303c0a76e013983b6000c29c74624',35,'Post',5,'2021-06-04 14:22:37','2021-06-04 14:22:37',1),(55,'41991df0a76e013983b6000c29c74624',29,'Post',5,'2021-06-04 14:22:46','2021-06-04 14:22:46',1),(56,'44ee5000a76e013983b8000c29c74624',11,'Post',5,'2021-06-04 14:22:51','2021-06-04 14:23:26',2),(57,'44f26c40a76e013983b4000c29c74624',44,'Post',3,'2021-06-04 14:22:51','2021-06-04 14:22:51',1),(58,'4628dca0a76e013983b6000c29c74624',28,'Post',5,'2021-06-04 14:22:53','2021-06-04 14:22:53',1),(59,'4891f8a0a76e013983b6000c29c74624',26,'Post',5,'2021-06-04 14:22:57','2021-06-04 14:22:57',1),(60,'498b1a70a76e013983b8000c29c74624',12,'Post',5,'2021-06-04 14:22:59','2021-06-04 14:23:20',2),(61,'498fc0d0a76e013983b4000c29c74624',45,'Post',1,'2021-06-04 14:22:59','2021-06-04 14:22:59',1),(62,'4accfea0a76e013983b8000c29c74624',25,'Post',5,'2021-06-04 14:23:01','2021-06-04 14:23:01',1),(63,'4be750a0a76e013983b6000c29c74624',10,'Post',5,'2021-06-04 14:23:03','2021-06-04 14:23:34',3),(64,'4bed9f40a76e013983b4000c29c74624',46,'Post',3,'2021-06-04 14:23:03','2021-06-04 14:23:03',1),(65,'4dd74660a76e013983b6000c29c74624',22,'Post',5,'2021-06-04 14:23:06','2021-06-04 14:23:06',1),(66,'4f29a1e0a76e013983b8000c29c74624',20,'Post',5,'2021-06-04 14:23:08','2021-06-04 14:23:10',2),(67,'501d6810a76e013983b4000c29c74624',47,'Post',1,'2021-06-04 14:23:10','2021-06-04 14:30:39',2),(68,'51b33080a76e013983b8000c29c74624',18,'Post',5,'2021-06-04 14:23:13','2021-06-04 14:23:13',1),(69,'52d4ae40a76e013983b6000c29c74624',7,'Post',5,'2021-06-04 14:23:15','2021-06-04 14:23:40',2),(70,'52d988e0a76e013983b4000c29c74624',48,'Post',1,'2021-06-04 14:23:15','2021-06-04 14:30:37',3),(71,'54556fa0a76e013983b8000c29c74624',14,'Post',5,'2021-06-04 14:23:17','2021-06-04 14:23:17',1),(72,'60fa2ac0a76e013983b6000c29c74624',8,'Post',5,'2021-06-04 14:23:38','2021-06-04 14:23:58',2),(73,'6c8fb700a76e013983b4000c29c74624',49,'Post',3,'2021-06-04 14:23:58','2021-06-04 14:23:58',1),(74,'c86a95a0a76e013983b6000c29c74624',41,'Post',3,'2021-06-04 14:26:32','2021-06-04 14:26:33',2),(75,'c96ec2e0a76e013983b4000c29c74624',55,'Post',5,'2021-06-04 14:26:34','2021-06-04 14:26:34',1),(76,'cab948f0a76e013983b6000c29c74624',40,'Post',3,'2021-06-04 14:26:36','2021-06-04 14:26:37',2),(77,'cbb40e50a76e013983b4000c29c74624',56,'Post',5,'2021-06-04 14:26:37','2021-06-04 14:26:37',1),(78,'dd572da0a76e013983b8000c29c74624',55,'Post',4,'2021-06-04 14:27:07','2021-06-04 14:27:07',1),(79,'de3de1e0a76e013983b6000c29c74624',41,'Post',4,'2021-06-04 14:27:08','2021-06-04 14:27:08',1),(80,'de43aea0a76e013983b4000c29c74624',57,'Post',5,'2021-06-04 14:27:08','2021-06-04 14:27:08',1),(81,'e2edfb70a76e013983b6000c29c74624',50,'Post',4,'2021-06-04 14:27:16','2021-06-04 14:27:19',2),(82,'e608a790a76e013983b6000c29c74624',40,'Post',4,'2021-06-04 14:27:22','2021-06-04 14:27:23',2),(83,'e7137f50a76e013983b4000c29c74624',58,'Post',5,'2021-06-04 14:27:23','2021-06-04 14:27:23',1),(84,'1ec08330a76f013983b6000c29c74624',58,'Post',1,'2021-06-04 14:28:57','2021-06-04 14:28:57',1),(85,'1fcb6940a76f013983b6000c29c74624',40,'Post',1,'2021-06-04 14:28:58','2021-06-04 14:29:40',2),(86,'1fd10760a76f013983b4000c29c74624',59,'Post',5,'2021-06-04 14:28:58','2021-06-04 14:28:58',1),(87,'23a7a600a76f013983b8000c29c74624',57,'Post',1,'2021-06-04 14:29:05','2021-06-04 14:29:11',2),(88,'24cb7910a76f013983b8000c29c74624',41,'Post',1,'2021-06-04 14:29:07','2021-06-04 14:29:07',1),(89,'24cfd1f0a76f013983b4000c29c74624',60,'Post',5,'2021-06-04 14:29:07','2021-06-04 14:29:07',1),(90,'50ace420a76f013983b6000c29c74624',52,'Post',1,'2021-06-04 14:30:20','2021-06-04 14:30:23',2),(91,'5321ea50a76f013983b8000c29c74624',51,'Post',1,'2021-06-04 14:30:25','2021-06-04 14:30:26',2),(92,'54403fc0a76f013983b4000c29c74624',61,'Post',5,'2021-06-04 14:30:26','2021-06-04 14:30:26',1),(93,'561841c0a76f013983b8000c29c74624',49,'Post',1,'2021-06-04 14:30:30','2021-06-04 14:30:30',1),(94,'8b3f7d70a76f013983b8000c29c74624',58,'Post',6,'2021-06-04 14:31:59','2021-06-04 14:31:59',1),(95,'8c30fac0a76f013983b8000c29c74624',40,'Post',6,'2021-06-04 14:32:00','2021-06-04 14:32:00',1),(96,'8c38b250a76f013983b4000c29c74624',64,'Post',5,'2021-06-04 14:32:00','2021-06-04 14:32:00',1),(97,'8f1e5730a76f013983b8000c29c74624',57,'Post',6,'2021-06-04 14:32:05','2021-06-04 14:32:05',1),(98,'900f2a30a76f013983b8000c29c74624',41,'Post',6,'2021-06-04 14:32:07','2021-06-04 14:32:55',2),(99,'90132f90a76f013983b4000c29c74624',65,'Post',5,'2021-06-04 14:32:07','2021-06-04 14:32:07',1),(100,'92da2770a76f013983b6000c29c74624',51,'Post',6,'2021-06-04 14:32:11','2021-06-04 14:32:13',2),(101,'93d54df0a76f013983b4000c29c74624',66,'Post',5,'2021-06-04 14:32:13','2021-06-04 14:32:13',1),(102,'9614f880a76f013983b8000c29c74624',49,'Post',6,'2021-06-04 14:32:17','2021-06-04 14:32:17',1),(103,'96f700f0a76f013983b6000c29c74624',8,'Post',6,'2021-06-04 14:32:18','2021-06-04 14:32:18',1),(104,'96fd2f10a76f013983b4000c29c74624',67,'Post',3,'2021-06-04 14:32:18','2021-06-04 14:32:18',1),(105,'989c7b00a76f013983b6000c29c74624',48,'Post',6,'2021-06-04 14:32:21','2021-06-04 14:32:30',2),(106,'9989ed70a76f013983b8000c29c74624',7,'Post',6,'2021-06-04 14:32:23','2021-06-04 14:32:23',1),(107,'998f7bc0a76f013983b4000c29c74624',68,'Post',1,'2021-06-04 14:32:23','2021-06-04 14:32:23',1),(108,'9f5c2650a76f013983b8000c29c74624',47,'Post',6,'2021-06-04 14:32:32','2021-06-04 14:32:32',1),(109,'a0ec82e0a76f013983b8000c29c74624',10,'Post',6,'2021-06-04 14:32:35','2021-06-04 14:32:35',1),(110,'a0f38020a76f013983b4000c29c74624',69,'Post',3,'2021-06-04 14:32:35','2021-06-04 14:32:35',1),(111,'a335cf90a76f013983b6000c29c74624',11,'Post',6,'2021-06-04 14:32:39','2021-06-04 14:32:39',1),(112,'a33d4970a76f013983b4000c29c74624',70,'Post',3,'2021-06-04 14:32:39','2021-06-04 14:32:39',1),(113,'a595db30a76f013983b8000c29c74624',44,'Post',6,'2021-06-04 14:32:43','2021-06-04 14:32:43',1),(114,'a73f6690a76f013983b6000c29c74624',43,'Post',6,'2021-06-04 14:32:46','2021-06-04 14:32:46',1),(115,'a8697760a76f013983b6000c29c74624',34,'Post',6,'2021-06-04 14:32:48','2021-06-04 14:32:59',2),(116,'a86f5dc0a76f013983b4000c29c74624',71,'Post',4,'2021-06-04 14:32:48','2021-06-04 14:32:48',1),(117,'aa5d7d50a76f013983b6000c29c74624',23,'Post',6,'2021-06-04 14:32:51','2021-06-04 14:32:51',1),(118,'aa6398a0a76f013983b4000c29c74624',72,'Post',4,'2021-06-04 14:32:51','2021-06-04 14:32:51',1);
/*!40000 ALTER TABLE `participations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `diaspora_handle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `serialized_public_key` text COLLATE utf8mb4_bin NOT NULL,
  `owner_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `closed_account` tinyint(1) DEFAULT '0',
  `fetch_status` int DEFAULT '0',
  `pod_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_people_on_diaspora_handle` (`diaspora_handle`(191)),
  UNIQUE KEY `index_people_on_guid` (`guid`(191)),
  UNIQUE KEY `index_people_on_owner_id` (`owner_id`),
  KEY `people_pod_id_fk` (`pod_id`),
  CONSTRAINT `people_pod_id_fk` FOREIGN KEY (`pod_id`) REFERENCES `pods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'57da2cf0a763013983b0000c29c74624','tyashin@localhost:3000','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA6DMIsfSeN7BgfEKnJl6m\n5ImyCkILBjxRFQDT7bmOjr3+GUt/qbFXPXVNbsRDcVy4512jLbv2O8oZzcbiRTKT\nIp/JTKEynxKER0SlWvwH80lVrZFpVAGGA1qFHYTd5EJ6jDVRjumI2dHS/sDVTPRt\npVlK6A+1dGUjX7LaJNfd6oqgRLCzNz2d1q8N1+D2vgO/OlMa85TnZ+tCo89w09mb\nQZ1cf+Cgys/O/JJBFf/Og7qYj1yt/D4lyOKJ8zd22b9AN5DzVKn3tk5HrLui0DfT\nx70YYpYNZA7BLgwPvGKseAJf6VBTjY5WIhfGR9iK894rpDpDiYnTqE9PAYxeYded\nzurmr579wX2NnWzm6TTk5h6p6HZMeRO2jRNLASsxnNRVt+wfz5f6C/fIhISqDpQc\nzZQqb3ngUNxYYSG8xden0mItGnMnSeKyybAY9OVdB51LPxQhvLL3SC9Co5VCkEdG\njaeywnT5Yl4ggswg/oaEcmMOyjWvf4uYl8Eld+9Ynfm9RO0oifMyaedQ8P+BnyzA\n3APsx2l4hX+b72lLhTtwbxV0IxIv3fnNYKxcTmofyr/uOJRecyy9PhN3SbGSWCf9\nVGT6k5otTwjxti+tj/lZluKvisoomPOOX7l3PrX8kIHHM1LqQRfIua/Zm3Knr1ks\nr3iKo61BKvXZ2ckflJNEeW0CAwEAAQ==\n-----END PUBLIC KEY-----\n',1,'2021-06-04 13:04:39','2021-06-04 13:04:39',0,0,NULL),(2,'7bca7c80311b01332d046c626dd55703','hq@pod.diaspora.software','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAnRrtHuUwbXHXjRCypB2Q\nRv55JOsaNAVKJid5pc0FuxQ0rLK/vNXi/7fplMm4HHTwmeuK9eXZoQyvoH+qBVv6\nbFZ8KP0M95QcrOSJtvvKYm51ybO82/W/e2LLKNfLMgTq2uoCWJsq33fohRXFgpCZ\nAz+aeK41YdxCnXUkd2tZBK44dv+tHZJOXFIr0KZFLeWCEbryL5367JSe2Qjj6N4B\nWktt4dLpWO8J0HP5SiGhxTM/WUqKu3rCHtPyOWMTZz0f6R595ZOh04cwo+4iqJB2\nKvlsQAEsDfHnICNidRmSxTghn3QquYZS5N/3sKGpayOzC0GGo2g7eK7oX3ZzBGHq\nu0f4whcdq055MAGjg4pjJu1EYfMDux7Ik8JHyVinsVAvjIHbVeurWe8oMtriQ3pB\nFNIjR8SH1JNaZ1PSdIO8V/j0C24wa77jvN2AdZFdCoAvpXSd33fexwMd5vpuyfYB\naq2jOze+Hb0lxIsxOvpv2Vf76Zuc86lHYBNjB/n+e8aoDIqIMjvr+DSMsNpHHi3k\ntuEXcs0gomoOO6A2EeMdO4M57EP4S4yLaKtCNDLGNbR6rxagrxctLeylh0/a1IyS\nmUrPD6mYt9mjbmNrRpAGFS4n8KPoeqZSVdvb3bcyY2ewwYD2xAeKymiy9jxKPujK\nD2X2Zb3zifqQzfgAf2k44MECAwEAAQ==\n-----END PUBLIC KEY-----\n',NULL,'2021-06-04 13:04:40','2021-06-04 13:04:40',0,0,1),(3,'b3fe7950a766013983b6000c29c74624','pyotr@localhost:3000','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAzC4W+irdu949npWSM8rN\nuVwWioDs6wrfjB++TkQA2VF+Md89L18bWWE0/gy3NnAfWqD6/bZjGYJBYCTTV6A+\nyXTDg99QSyzK7esMkdK840bTT8A9PUKN22gW0ZLgMd9l2Rm4BxjeCy5WsFvnm6Hb\n4HISxyfCMoVnJloC7YIaDQYvfQtMVo40DVuZsWRfw8OsBPN60eWWRbWFfQfNg3k6\n04to28FvoKtGm9OPBw9fPCMfMWyb0mV/pVvOWhbhD1pi4FgjW5XiKq+bPYxhz2E4\nr4foNbjdelD6o119Y7WnODiOf2ZK9RppoTohfUXVMXayyH2yMLo97G0kIAVuJ5Di\nKGbWNTiSEeHb2mgtMmQDkeUvB/J0VZctoJfMh+pYvLCTxqDY7pG2FS0wgWIrpj/O\nTLlDPua1BTkpTSAmUR2qS9Hg0LYZ44CtCKxrH4nbpwrufoUi2Ksp+Ix6CKVTOo1e\ntDFG2kAHFq8UsCdR8o051Qd+D1yM6EJ/q5a+0dzgSf8Uu0hGa8UKW0l3dDyFVKfw\nwWPvlp7LQJ5VRHH+d5XJ2iQrN4LhKhqbqR+YfpZQ24cQt8znuFWq96S70BnzoG2P\nnm4Ub36YRJPSB/9IW8hO1HtmoN5ozQwH26uWDOhJB7PCWDmaW5EoKKroLX70VuVD\nTfH6PCdWUMCcbfqaCP6rRm0CAwEAAQ==\n-----END PUBLIC KEY-----\n',2,'2021-06-04 13:28:42','2021-06-04 13:28:42',0,0,NULL),(4,'b5a17da0a768013983b6000c29c74624','yury@localhost:3000','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA4+ilypJKlWriL9a9onNj\nrLrcd6a5x6hG74FoA/KF2JkMp+ajWsxFzOrkqhgBybtht61+PscPBTIHPJHYdPGj\nLR/10kPO36UdQiUXGibzbaz8h++jKFPaMYpKlca1OwSw+uybXpeDzNl5JZaaj/pd\n+4jVhtZnoqh1d6/y0/cR5GNY1G5GYDTMeQO8emaGaYvQFdcJYIyowHWLSLol2EpD\nLPKsPXUUXL3x9TOo2NllJDtaiHTEVymEmMrPLH2idXYQJxiBm1/mYsrSMYHADYOM\nJubf+PqQoyxngYpU8dqaYU8IHbytzgKGAeBf+sUiflKrmvAkBYZesAxOvgxXGZQ0\nhYFpMGa0XuecdSILEWSi/fSYyhrqbOcuSWmGMLXqvUp3FR2z/JvaQx4XXHpqvxE0\n3e2TRIAe0pla+amdbKADYSLGL0wFrXjGqhhApH7yrg7+wwMBRGnJS1HpujlPm289\nKsB0WRUxNJREx/Bs4uBwIyZaCawKVlmNyehP6t6OlV2qXRyDE1OeIuA7Klvvh1A6\nL0XpWtR1sWGxrwlk9vJiJ5TQY8iIUxopRBmEQr01101YhTUDBSQFiOiGw6knF2Of\nyDuM16Ib6nBymLwWTT1Gpdg7st030ncX4cPbdnaU5xmKM2kFpVabL0fZnv4jhe3e\n+fpxDCQnAwe0wfesYCSPVS8CAwEAAQ==\n-----END PUBLIC KEY-----\n',3,'2021-06-04 13:43:04','2021-06-04 13:43:04',0,0,NULL),(5,'d9882f20a76c013983b8000c29c74624','olga@localhost:3000','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA2HudAoB2/NSKuDxK4b/6\n71ffwvcqfPiDLOcIC2q7kU+h9chHIxrDbbZ+5pC0tJ8cvh71pVsjTsYppXUOSP36\nIvnncryDN4NYO5tUvJ1zRvSBHowr2i9XhS/4yNXuLiwv2WVgZXS4+C5KpRYLre2l\n1woqbLAWCO8IiFwplfEuWSzIF/kA8JrTQFBTvO3WmwGYzrqa0qchBlQ+cKyi66Lh\np4HhRtDXwWeLvQjt/D/uNwRIplPw80Xcbu/wEO5wShFDUrKlvZGBBYmRDWf07a+S\ntQRGuwbCr+IbDlIBLgbjfVgb3gZ+Md21D/xfIjWOAj1Xnyha5xtoUDCZBNfdFmAc\nc93sIyYR54RHvIbpfN2nE7ktbsKLFqwdOzYVFU8HV7BTqE1TwQ8fYG5+FZFkGLoa\nPHnEDeQAn+PMCAQwDwOfgLAlkpnChtlEqObgBzVRAqZNMu8i/7tGH+5JuX14Drtc\nI7NUu/o9XfBSOnKzvI/u1kvDZ/BHYyEFDqAi7h+KeMi94J/8F/4uYmdemEO1PFVf\nJU0/bz34xMH15w6Quj0GME/oVj0IKLoy0CmMdQet5yy/dumso3YhMm5LcRao5+LV\nn66YvZai3zXnwTtlLz8fcuMcIRgMv4l5ppmzTUteq0sU3T5cyf5di2fHZNAhS++R\n/bjOOPo3Mhp9vS072WMvkwsCAwEAAQ==\n-----END PUBLIC KEY-----\n',4,'2021-06-04 14:12:42','2021-06-04 14:12:42',0,0,NULL),(6,'0e6841e0a76f013983b8000c29c74624','kirill@localhost:3000','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAz/K5KwydUCp8MjAnj+2T\nL+Xsd+sYJEFLGd0np8Q8hsEOmS6czbjZYzn3sNcqQJ79GjS+RqGPbBQg6c9fMlLP\nevG8K80eVBCzzf2BEPt92TZfJKt3mkPneFIab7es4dMUCZu0s5+zOxoaboIMZZp1\nhmfC8VZ1+EOheeN8aRq1C1wkaVXbvsdQvH8UV76OYZ3dGB2Xw99RMyxsFP7caqf3\nDCUyeP1RQsw2Dnhp3GwZf74Qdvb9OpiWAGy9BCPBDqs4W5rhdl0mHOvXd2v4w9E5\nwHB2p5l47rb7QDGQxmgSu7nnx4VVFc4eHXYkcRdpevNurZOFf/3wA20XUbx1r9ZV\nrit4aDozpR/U/MY1fYBY5Ye1izvp5ISf+4KJKdQmoLRbF6QKeHYr8bx8LTMtYN3V\nyNeRHB15VuosSN02A6OifzdKYi5ZPWWasWwTKfXav+CMNLUFDGyHJmiMp8saon9j\nbG77NPLFB1NUnelrFh6NJ8B8ER6irzufBxHNLz3zEmjstycc+uRwqppkN2KhJmtQ\nOghlJ0A2wiUvr1/X2vB8fbL/lxNXU3PaDXg5MxorZh6yBs4MeICM4MYpFmtgQl+2\nkDtto3S+Io81zcLdjeLOEUXS5aOOPbQTbs7A7/qqd8u5UXb6nIH+qrrkqruTrJvB\nGvgftEmzgcsABBgQQxY5hjMCAwEAAQ==\n-----END PUBLIC KEY-----\n',5,'2021-06-04 14:28:30','2021-06-04 14:28:30',0,0,NULL);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `text` text COLLATE utf8mb4_bin,
  `remote_photo_path` text COLLATE utf8mb4_bin,
  `remote_photo_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `random_string` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `processed_image` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `unprocessed_image` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status_message_guid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `comments_count` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_photos_on_guid` (`guid`(191)),
  KEY `index_photos_on_status_message_guid` (`status_message_guid`(191)),
  KEY `index_photos_on_author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,0,'c6a2c850a764013983b8000c29c74624',0,NULL,'http://localhost:3000/uploads/images/','2775db97c9a2293a40fe.jpg','2775db97c9a2293a40fe','2775db97c9a2293a40fe.jpg','2021-06-04 13:14:54','2021-06-04 13:14:54','2775db97c9a2293a40fe.jpg',NULL,NULL,900,900),(2,3,0,'c0a03e10a766013983b8000c29c74624',0,NULL,'http://localhost:3000/uploads/images/','1107074cf3896e858287.jpg','1107074cf3896e858287','1107074cf3896e858287.jpg','2021-06-04 13:29:03','2021-06-04 13:29:03','1107074cf3896e858287.jpg',NULL,NULL,900,900),(3,3,0,'7d32d690a768013983b6000c29c74624',0,NULL,'http://localhost:3000/uploads/images/','8f6401c1e3a81994f4a6.gif','8f6401c1e3a81994f4a6',NULL,'2021-06-04 13:41:29','2021-06-04 13:41:31','8f6401c1e3a81994f4a6.gif','7e55e010a768013983b6000c29c74624',NULL,150,150),(4,4,0,'c860bcb0a768013983b8000c29c74624',0,NULL,'http://localhost:3000/uploads/images/','0dc5950af382a371b6e9.jpg','0dc5950af382a371b6e9','0dc5950af382a371b6e9.jpg','2021-06-04 13:43:35','2021-06-04 13:43:35','0dc5950af382a371b6e9.jpg',NULL,NULL,1080,1080),(5,4,1,'c397f660a76b013983b6000c29c74624',0,NULL,'http://localhost:3000/uploads/images/','c48a5b5f97decb67d9f1.jpg','c48a5b5f97decb67d9f1','c48a5b5f97decb67d9f1.jpg','2021-06-04 14:04:55','2021-06-04 14:05:12','c48a5b5f97decb67d9f1.jpg','cda0d4f0a76b013983b6000c29c74624',NULL,900,900),(6,5,0,'f6c76880a76d013983b6000c29c74624',0,NULL,'http://localhost:3000/uploads/images/','cce6cfc86521889e669d.jpg','cce6cfc86521889e669d','cce6cfc86521889e669d.jpg','2021-06-04 14:20:40','2021-06-04 14:20:41','cce6cfc86521889e669d.jpg',NULL,NULL,1080,1080),(7,6,0,'6862d490a76f013983b8000c29c74624',0,NULL,'http://localhost:3000/uploads/images/','cb7119abd80b00a8b2ff.jpg','cb7119abd80b00a8b2ff','cb7119abd80b00a8b2ff.jpg','2021-06-04 14:31:00','2021-06-04 14:31:01','cb7119abd80b00a8b2ff.jpg',NULL,NULL,1024,1280);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pods`
--

DROP TABLE IF EXISTS `pods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `host` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `ssl` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int DEFAULT '0',
  `checked_at` datetime DEFAULT '1970-01-01 00:00:00',
  `offline_since` datetime DEFAULT NULL,
  `response_time` int DEFAULT '-1',
  `software` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `error` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `port` int DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT '0',
  `scheduled_check` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pods_on_host_and_port` (`host`(190),`port`),
  KEY `index_pods_on_status` (`status`),
  KEY `index_pods_on_checked_at` (`checked_at`),
  KEY `index_pods_on_offline_since` (`offline_since`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pods`
--

LOCK TABLES `pods` WRITE;
/*!40000 ALTER TABLE `pods` DISABLE KEYS */;
INSERT INTO `pods` VALUES (1,'pod.diaspora.software',1,'2021-06-04 13:04:40','2021-06-04 13:04:40',1,'1970-01-01 00:00:00',NULL,-1,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `pods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answers`
--

DROP TABLE IF EXISTS `poll_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poll_answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `poll_id` int NOT NULL,
  `guid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `vote_count` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_poll_answers_on_guid` (`guid`(191)),
  KEY `index_poll_answers_on_poll_id` (`poll_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answers`
--

LOCK TABLES `poll_answers` WRITE;
/*!40000 ALTER TABLE `poll_answers` DISABLE KEYS */;
INSERT INTO `poll_answers` VALUES (1,'1',1,'25ca14c0a767013983b6000c29c74624',1),(2,'2',1,'25ca2db0a767013983b6000c29c74624',2),(3,'5',2,'bf0a0cd0a76b013983b8000c29c74624',0),(4,'6',2,'bf0a2710a76b013983b8000c29c74624',0);
/*!40000 ALTER TABLE `poll_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_participation_signatures`
--

DROP TABLE IF EXISTS `poll_participation_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poll_participation_signatures` (
  `poll_participation_id` int NOT NULL,
  `author_signature` text COLLATE utf8mb4_bin NOT NULL,
  `signature_order_id` int NOT NULL,
  `additional_data` text COLLATE utf8mb4_bin,
  UNIQUE KEY `index_poll_participation_signatures_on_poll_participation_id` (`poll_participation_id`),
  KEY `poll_participation_signatures_signature_orders_id_fk` (`signature_order_id`),
  CONSTRAINT `poll_participation_signatures_poll_participation_id_fk` FOREIGN KEY (`poll_participation_id`) REFERENCES `poll_participations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `poll_participation_signatures_signature_orders_id_fk` FOREIGN KEY (`signature_order_id`) REFERENCES `signature_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_participation_signatures`
--

LOCK TABLES `poll_participation_signatures` WRITE;
/*!40000 ALTER TABLE `poll_participation_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_participation_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_participations`
--

DROP TABLE IF EXISTS `poll_participations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poll_participations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `poll_answer_id` int NOT NULL,
  `author_id` int NOT NULL,
  `poll_id` int NOT NULL,
  `guid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_poll_participations_on_poll_id_and_author_id` (`poll_id`,`author_id`),
  UNIQUE KEY `index_poll_participations_on_guid` (`guid`(191))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_participations`
--

LOCK TABLES `poll_participations` WRITE;
/*!40000 ALTER TABLE `poll_participations` DISABLE KEYS */;
INSERT INTO `poll_participations` VALUES (1,1,1,1,'bd68b9a0a767013983b6000c29c74624','2021-06-04 13:36:07','2021-06-04 13:36:07'),(2,2,4,1,'f330edd0a76a013983b8000c29c74624','2021-06-04 13:59:06','2021-06-04 13:59:06'),(3,2,5,1,'59c409f0a76e013983b6000c29c74624','2021-06-04 14:23:26','2021-06-04 14:23:26');
/*!40000 ALTER TABLE `poll_participations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls`
--

DROP TABLE IF EXISTS `polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status_message_id` int NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `guid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_polls_on_guid` (`guid`(191)),
  KEY `index_polls_on_status_message_id` (`status_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls`
--

LOCK TABLES `polls` WRITE;
/*!40000 ALTER TABLE `polls` DISABLE KEYS */;
INSERT INTO `polls` VALUES (1,'Q1',11,NULL,'25c80470a767013983b6000c29c74624','2021-06-04 13:31:53','2021-06-04 13:31:53'),(2,'Q2',33,NULL,'bf09e2e0a76b013983b8000c29c74624','2021-06-04 14:04:48','2021-06-04 14:04:48');
/*!40000 ALTER TABLE `polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `text` text COLLATE utf8mb4_bin,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `provider_display_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `root_guid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `likes_count` int DEFAULT '0',
  `comments_count` int DEFAULT '0',
  `o_embed_cache_id` int DEFAULT NULL,
  `reshares_count` int DEFAULT '0',
  `interacted_at` datetime DEFAULT NULL,
  `tweet_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `open_graph_cache_id` int DEFAULT NULL,
  `tumblr_ids` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_posts_on_guid` (`guid`(191)),
  UNIQUE KEY `index_posts_on_author_id_and_root_guid` (`author_id`,`root_guid`(190)),
  KEY `index_posts_on_id_and_type` (`id`,`type`),
  KEY `index_posts_on_person_id` (`author_id`),
  KEY `index_posts_on_root_guid` (`root_guid`(191)),
  KEY `index_posts_on_created_at_and_id` (`created_at`,`id`),
  CONSTRAINT `posts_author_id_fk` FOREIGN KEY (`author_id`) REFERENCES `people` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,0,'5e96d010a764013983b8000c29c74624','StatusMessage','### diaspora_mysql_test\r\n\r\nhttp://localhost:3000/stream','2021-06-04 13:11:59','2021-06-04 13:23:03',NULL,NULL,1,2,NULL,0,'2021-06-04 13:23:03',NULL,NULL,NULL),(2,1,0,'17ace760a765013983b8000c29c74624','StatusMessage','Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\r\n\r\n    “Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”\r\n\r\nThe purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\r\n\r\nThe passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our generator to get your own, or read on for the authoritative history of lorem ipsum. \r\n![enter image description here](https://ru-static.z-dn.net/files/dc1/716ca3176d30b1fc42851c40575d571d.jpg \"enter image title here\")','2021-06-04 13:17:10','2021-06-04 13:23:15',NULL,NULL,1,2,NULL,0,'2021-06-04 13:23:15',NULL,NULL,NULL),(3,1,0,'2789eee0a765013983b6000c29c74624','StatusMessage','\r\nHedonist Roots\r\n\r\nUntil recently, the prevailing view assumed lorem ipsum was born as a nonsense text. “It\'s not Latin, though it looks like it, and it actually says nothing,” Before & After magazine answered a curious reader, “Its ‘words’ loosely approximate the frequency with which letters occur in English, which is why at a glance it looks pretty real.”\r\n\r\nAs Cicero would put it, “Um, not so fast.”\r\n\r\nThe placeholder text, beginning with the line “Lorem ipsum dolor sit amet, consectetur adipiscing elit”, looks like Latin because in its youth, centuries ago, it was Latin.\r\n\r\nRichard McClintock, a Latin scholar from Hampden-Sydney College, is credited with discovering the source behind the ubiquitous filler text. In seeing a sample of lorem ipsum, his interest was piqued by consectetur—a genuine, albeit rare, Latin word. Consulting a Latin dictionary led McClintock to a passage from De Finibus Bonorum et Malorum (“On the Extremes of Good and Evil”), a first-century B.C. text from the Roman philosopher Cicero.\r\n\r\nIn particular, the garbled words of lorem ipsum bear an unmistakable resemblance to sections 1.10.32–33 of Cicero\'s work, with the most notable passage excerpted below:\r\n\r\n    “Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.”\r\n\r\nA 1914 English translation by Harris Rackham reads:\r\n\r\n    “Nor is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but occasionally circumstances occur in which toil and pain can procure him some great pleasure.”\r\n\r\nMcClintock\'s eye for detail certainly helped narrow the whereabouts of lorem ipsum\'s origin, however, the “how and when” still remain something of a mystery, with competing theories and timelines.\r\n','2021-06-04 13:17:36','2021-06-04 13:24:34',NULL,NULL,1,2,NULL,0,'2021-06-04 13:24:34',NULL,NULL,NULL),(4,1,0,'33f6c290a765013983b6000c29c74624','StatusMessage','**\r\nRemixing a Classic**\r\n\r\nSo how did the classical Latin become so incoherent? According to McClintock, a 15th century typesetter likely scrambled part of Cicero\'s De Finibus in order to provide placeholder text to mockup various fonts for a type specimen book.\r\n\r\nIt\'s difficult to find examples of lorem ipsum in use before Letraset made it popular as a dummy text in the 1960s, although McClintock says he remembers coming across the lorem ipsum passage in a book of old metal type samples. So far he hasn\'t relocated where he once saw the passage, but the popularity of Cicero in the 15th century supports the theory that the filler text has been used for centuries.\r\n\r\nAnd anyways, as Cecil Adams reasoned, “[Do you really] think graphic arts supply houses were hiring classics scholars in the 1960s?” Perhaps. But it seems reasonable to imagine that there was a version in use far before the age of Letraset.\r\n\r\nMcClintock wrote to Before & After to explain his discovery;\r\n\r\n    “What I find remarkable is that this text has been the industry\'s standard dummy text ever since some printer in the 1500s took a galley of type and scrambled it to make a type specimen book; it has survived not only four centuries of letter-by-letter resetting but even the leap into electronic typesetting, essentially unchanged except for an occasional \'ing\' or \'y\' thrown in. It\'s ironic that when the then-understood Latin was scrambled, it became as incomprehensible as Greek; the phrase \'it\'s Greek to me\' and \'greeking\' have common semantic roots!” (The editors published his letter in a correction headlined “Lorem Oopsum”). \r\n\r\nAs an alternative theory, (and because Latin scholars do this sort of thing) someone tracked down a 1914 Latin edition of De Finibus which challenges McClintock\'s 15th century claims and suggests that the dawn of lorem ipsum was as recent as the 20th century. The 1914 Loeb Classical Library Edition ran out of room on page 34 for the Latin phrase “dolorem ipsum” (sorrow in itself). Thus, the truncated phrase leaves one page dangling with “do-”, while another begins with the now ubiquitous “lorem ipsum”.\r\n\r\nWhether a medieval typesetter chose to garble a well-known (but non-Biblical—that would have been sacrilegious) text, or whether a quirk in the 1914 Loeb Edition inspired a graphic designer, it\'s admittedly an odd way for Cicero to sail into the 21st century.\r\n','2021-06-04 13:17:57','2021-06-04 13:17:57',NULL,NULL,1,0,NULL,0,'2021-06-04 13:17:57',NULL,NULL,NULL),(5,1,0,'424389a0a765013983b8000c29c74624','StatusMessage','\r\n**strong text**Interpreting Nonsense\r\n\r\nDon\'t bother typing “lorem ipsum” into Google translate. If you already tried, you may have gotten anything from \"NATO\" to \"China\", depending on how you capitalized the letters. The bizarre translation was fodder for conspiracy theories, but Google has since updated its “lorem ipsum” translation to, boringly enough, “lorem ipsum”.\r\n\r\nOne brave soul did take a stab at translating the almost-not-quite-Latin. According to The Guardian, Jaspreet Singh Boparai undertook the challenge with the goal of making the text “precisely as incoherent in English as it is in Latin - and to make it incoherent in the same way”. As a result, “the Greek \'eu\' in Latin became the French \'bien\' [...] and the \'-ing\' ending in \'lorem ipsum\' seemed best rendered by an \'-iendum\' in English.”\r\n\r\nHere is the classic lorem ipsum passage followed by Boparai\'s odd, yet mesmerizing version:\r\n\r\n    “Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam. Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis. Donec a dui et dui fringilla consectetur id nec massa. Aliquam erat volutpat. Sed ut dui ut lacus dictum fermentum vel tincidunt neque. Sed sed lacinia lectus. Duis sit amet sodales felis. Duis nunc eros, mattis at dui ac, convallis semper risus. In adipiscing ultrices tellus, in suscipit massa vehicula eu.”\r\n\r\nBoparai\'s version:\r\n\r\n    “Rrow itself, let it be sorrow; let him love it; let him pursue it, ishing for its acquisitiendum. Because he will ab hold, uniess but through concer, and also of those who resist. Now a pure snore disturbeded sum dust. He ejjnoyes, in order that somewon, also with a severe one, unless of life. May a cusstums offficer somewon nothing of a poison-filled. Until, from a twho, twho chaffinch may also pursue it, not even a lump. But as twho, as a tank; a proverb, yeast; or else they tinscribe nor. Yet yet dewlap bed. Twho may be, let him love fellows of a polecat. Now amour, the, twhose being, drunk, yet twhitch and, an enclosed valley’s always a laugh. In acquisitiendum the Furies are Earth; in (he takes up) a lump vehicles bien.”\r\n\r\nNick Richardson described the translation “like extreme Mallarmé, or a Burroughsian cut-up, or a paragraph of Finnegans Wake. Bits of it have surprising power: the desperate insistence on loving and pursuing sorrow, for instance, that is cheated out of its justification – an incomplete object that has been either fished for, or wished for.”\r\n','2021-06-04 13:18:21','2021-06-04 13:19:05',NULL,NULL,1,2,NULL,0,'2021-06-04 13:19:05',NULL,NULL,NULL),(6,1,1,'97a22620a765013983b6000c29c74624','StatusMessage','\r\nForm Over Function\r\n\r\nSo when is it okay to use lorem ipsum? First, lorem ipsum works well for staging. It\'s like the props in a furniture store—filler text makes it look like someone is home. The same Wordpress template might eventually be home to a fitness blog, a photography website, or the online journal of a cupcake fanatic. Lorem ipsum helps them imagine what the lived-in website might look like.\r\n\r\nSecond, use lorem ipsum if you think the placeholder text will be too distracting. For specific projects, collaboration between copywriters and designers may be best, however, like Karen McGrane said, draft copy has a way of turning any meeting about layout decisions into a discussion about word choice. So don\'t be afraid to use lorem ipsum to keep everyone focused.\r\n\r\nOne word of caution: make sure your client knows that lorem ipsum is filler text. You don\'t want them wondering why you filled their website with a foreign language, and you certainly don\'t want anyone prematurely publishing it.\r\n','2021-06-04 13:20:45','2021-06-04 13:59:48',NULL,NULL,3,4,NULL,2,'2021-06-04 13:59:48',NULL,NULL,NULL),(7,1,1,'37b5df90a766013983b6000c29c74624','StatusMessage','Section 1.10.32 of Cicero\'s “De finibus bonorum et malorum”\r\n\r\nOriginal Latin text:\r\n\r\n    “Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?”\r\n\r\nTranslation by H. Rackham:\r\n\r\n    “But I must explain to you how all this mistaken idea of denouncing of a pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?”','2021-06-04 13:25:13','2021-06-04 13:37:46',NULL,NULL,4,2,NULL,4,'2021-06-04 13:37:46',NULL,NULL,NULL),(8,3,1,'e4ab8ed0a766013983b8000c29c74624','StatusMessage','Hey everyone, I’m #newhere. I’m interested in #art, #dunno, #metoo, #music, #sport, and #war. ','2021-06-04 13:30:03','2021-06-04 14:23:38',NULL,NULL,2,5,NULL,4,'2021-06-04 14:23:38',NULL,NULL,NULL),(9,3,0,'f08ef070a766013983b6000c29c74624','StatusMessage','Original Latin text:\r\n\r\n    “At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat…”','2021-06-04 13:30:23','2021-06-04 13:33:09',NULL,NULL,1,3,NULL,0,'2021-06-04 13:33:09',NULL,NULL,NULL),(10,3,1,'03606a70a767013983b8000c29c74624','StatusMessage','“On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammeled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.”','2021-06-04 13:30:55','2021-06-04 14:23:32',NULL,NULL,4,3,NULL,4,'2021-06-04 14:23:32',NULL,NULL,NULL),(11,3,1,'25c6f8d0a767013983b6000c29c74624','StatusMessage','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quam pellentesque nec nam aliquam. Turpis massa sed elementum tempus. Facilisi morbi tempus iaculis urna id volutpat. Ac tincidunt vitae semper quis lectus nulla at volutpat. Non nisi est sit amet facilisis magna etiam. Nunc lobortis mattis aliquam faucibus purus in massa tempor nec. Sagittis orci a scelerisque purus semper eget duis. Vitae justo eget magna fermentum iaculis eu non. Faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Dolor sit amet consectetur adipiscing elit. Bibendum neque egestas congue quisque egestas diam in. Velit euismod in pellentesque massa. Mattis rhoncus urna neque viverra justo nec ultrices. Nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus. Sed elementum tempus egestas sed sed risus pretium quam. Congue quisque egestas diam in arcu.','2021-06-04 13:31:53','2021-06-04 14:01:07',NULL,NULL,3,5,NULL,4,'2021-06-04 14:01:07',NULL,NULL,NULL),(12,1,1,'7aa95000a767013983b8000c29c74624','StatusMessage','@{diaspora* HQ; hq@pod.diaspora.software} nice','2021-06-04 13:34:15','2021-06-04 13:34:15',NULL,NULL,3,0,NULL,3,'2021-06-04 13:34:15',NULL,NULL,NULL),(13,1,1,'9041d230a767013983b8000c29c74624','Reshare','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quam pellentesque nec nam aliquam. Turpis massa sed elementum tempus. Facilisi morbi tempus iaculis urna id volutpat. Ac tincidunt vitae semper quis lectus nulla at volutpat. Non nisi est sit amet facilisis magna etiam. Nunc lobortis mattis aliquam faucibus purus in massa tempor nec. Sagittis orci a scelerisque purus semper eget duis. Vitae justo eget magna fermentum iaculis eu non. Faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Dolor sit amet consectetur adipiscing elit. Bibendum neque egestas congue quisque egestas diam in. Velit euismod in pellentesque massa. Mattis rhoncus urna neque viverra justo nec ultrices. Nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus. Sed elementum tempus egestas sed sed risus pretium quam. Congue quisque egestas diam in arcu.','2021-06-04 13:34:51','2021-06-04 13:38:04',NULL,'25c6f8d0a767013983b6000c29c74624',3,1,NULL,0,'2021-06-04 13:38:04',NULL,NULL,NULL),(14,1,1,'930e1f10a767013983b6000c29c74624','Reshare','“On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammeled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.”','2021-06-04 13:34:56','2021-06-04 14:06:52',NULL,'03606a70a767013983b8000c29c74624',4,1,NULL,0,'2021-06-04 14:06:52',NULL,NULL,NULL),(15,1,1,'9585e740a767013983b8000c29c74624','Reshare','Hey everyone, I’m #newhere. I’m interested in #art, #dunno, #metoo, #music, #sport, and #war. ','2021-06-04 13:35:00','2021-06-04 13:35:00',NULL,'e4ab8ed0a766013983b8000c29c74624',2,0,NULL,0,'2021-06-04 13:35:00',NULL,NULL,NULL),(16,1,0,'afe10c90a767013983b6000c29c74624','StatusMessage','@{pyotr@localhost:3000; pyotr@localhost:3000} good boy','2021-06-04 13:35:44','2021-06-04 13:40:54',NULL,NULL,2,1,NULL,0,'2021-06-04 13:40:54',NULL,NULL,NULL),(17,3,1,'e6ca5d40a767013983b6000c29c74624','Reshare','@{diaspora* HQ; hq@pod.diaspora.software} nice','2021-06-04 13:37:16','2021-06-04 13:37:16',NULL,'7aa95000a767013983b8000c29c74624',3,0,NULL,0,'2021-06-04 13:37:16',NULL,NULL,NULL),(18,3,1,'e8b5fc90a767013983b8000c29c74624','Reshare','Section 1.10.32 of Cicero\'s “De finibus bonorum et malorum”\r\n\r\nOriginal Latin text:\r\n\r\n    “Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?”\r\n\r\nTranslation by H. Rackham:\r\n\r\n    “But I must explain to you how all this mistaken idea of denouncing of a pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?”','2021-06-04 13:37:20','2021-06-04 13:37:20',NULL,'37b5df90a766013983b6000c29c74624',4,0,NULL,0,'2021-06-04 13:37:20',NULL,NULL,NULL),(19,3,1,'ea7c8b60a767013983b8000c29c74624','Reshare','\r\nForm Over Function\r\n\r\nSo when is it okay to use lorem ipsum? First, lorem ipsum works well for staging. It\'s like the props in a furniture store—filler text makes it look like someone is home. The same Wordpress template might eventually be home to a fitness blog, a photography website, or the online journal of a cupcake fanatic. Lorem ipsum helps them imagine what the lived-in website might look like.\r\n\r\nSecond, use lorem ipsum if you think the placeholder text will be too distracting. For specific projects, collaboration between copywriters and designers may be best, however, like Karen McGrane said, draft copy has a way of turning any meeting about layout decisions into a discussion about word choice. So don\'t be afraid to use lorem ipsum to keep everyone focused.\r\n\r\nOne word of caution: make sure your client knows that lorem ipsum is filler text. You don\'t want them wondering why you filled their website with a foreign language, and you certainly don\'t want anyone prematurely publishing it.\r\n','2021-06-04 13:37:23','2021-06-04 13:37:23',NULL,'97a22620a765013983b6000c29c74624',3,0,NULL,0,'2021-06-04 13:37:23',NULL,NULL,NULL),(20,1,1,'3a3ef0d0a768013983b6000c29c74624','StatusMessage','Sitting here....','2021-06-04 13:39:36','2021-06-04 13:39:36',NULL,NULL,4,0,NULL,3,'2021-06-04 13:39:36',NULL,NULL,NULL),(21,3,0,'7e55e010a768013983b6000c29c74624','StatusMessage','@{Ivan Ivanov; tyashin@localhost:3000} eat this','2021-06-04 13:41:31','2021-06-04 14:06:35',NULL,NULL,1,1,NULL,0,'2021-06-04 14:06:35',NULL,NULL,NULL),(22,4,1,'f81b3050a768013983b8000c29c74624','Reshare','Hey everyone, I’m #newhere. I’m interested in #art, #dunno, #metoo, #music, #sport, and #war. ','2021-06-04 13:44:55','2021-06-04 13:44:55',NULL,'e4ab8ed0a766013983b8000c29c74624',3,0,NULL,0,'2021-06-04 13:44:55',NULL,NULL,NULL),(23,4,1,'059a5d60a769013983b8000c29c74624','StatusMessage','Hey everyone, I’m #newhere. I’m interested in #art, #kittens, #races, and #war. Sed egestas egestas fringilla phasellus faucibus scelerisque. Ornare lectus sit amet est placerat in egestas erat. Integer vitae justo eget magna fermentum iaculis eu non diam. Porttitor leo a diam sollicitudin tempor id eu nisl nunc. Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam. Molestie a iaculis at erat pellentesque adipiscing commodo. Mollis aliquam ut porttitor leo a diam sollicitudin tempor id. Nunc congue nisi vitae suscipit tellus mauris. Quisque id diam vel quam elementum pulvinar etiam non. Ac tincidunt vitae semper quis lectus nulla at volutpat. Ornare lectus sit amet est placerat.','2021-06-04 13:45:17','2021-06-04 14:00:09',NULL,NULL,4,2,NULL,4,'2021-06-04 14:00:09',NULL,NULL,NULL),(24,4,1,'e8854330a76a013983b6000c29c74624','Reshare','Sitting here....','2021-06-04 13:58:48','2021-06-04 13:58:48',NULL,'3a3ef0d0a768013983b6000c29c74624',1,0,NULL,0,'2021-06-04 13:58:48',NULL,NULL,NULL),(25,4,1,'ed1b5520a76a013983b8000c29c74624','Reshare','“On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammeled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.”','2021-06-04 13:58:55','2021-06-04 13:58:55',NULL,'03606a70a767013983b8000c29c74624',2,0,NULL,0,'2021-06-04 13:58:55',NULL,NULL,NULL),(26,4,1,'f74828e0a76a013983b6000c29c74624','Reshare','@{diaspora* HQ; hq@pod.diaspora.software} nice','2021-06-04 13:59:12','2021-06-04 14:10:21',NULL,'7aa95000a767013983b8000c29c74624',2,1,NULL,0,'2021-06-04 14:10:21',NULL,NULL,NULL),(27,4,1,'fa523350a76a013983b6000c29c74624','Reshare','Section 1.10.32 of Cicero\'s “De finibus bonorum et malorum”\r\n\r\nOriginal Latin text:\r\n\r\n    “Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?”\r\n\r\nTranslation by H. Rackham:\r\n\r\n    “But I must explain to you how all this mistaken idea of denouncing of a pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?”','2021-06-04 13:59:18','2021-06-04 13:59:18',NULL,'37b5df90a766013983b6000c29c74624',1,0,NULL,0,'2021-06-04 13:59:18',NULL,NULL,NULL),(28,4,1,'fc786cf0a76a013983b6000c29c74624','Reshare','\r\nForm Over Function\r\n\r\nSo when is it okay to use lorem ipsum? First, lorem ipsum works well for staging. It\'s like the props in a furniture store—filler text makes it look like someone is home. The same Wordpress template might eventually be home to a fitness blog, a photography website, or the online journal of a cupcake fanatic. Lorem ipsum helps them imagine what the lived-in website might look like.\r\n\r\nSecond, use lorem ipsum if you think the placeholder text will be too distracting. For specific projects, collaboration between copywriters and designers may be best, however, like Karen McGrane said, draft copy has a way of turning any meeting about layout decisions into a discussion about word choice. So don\'t be afraid to use lorem ipsum to keep everyone focused.\r\n\r\nOne word of caution: make sure your client knows that lorem ipsum is filler text. You don\'t want them wondering why you filled their website with a foreign language, and you certainly don\'t want anyone prematurely publishing it.\r\n','2021-06-04 13:59:21','2021-06-04 13:59:21',NULL,'97a22620a765013983b6000c29c74624',2,0,NULL,0,'2021-06-04 13:59:21',NULL,NULL,NULL),(29,4,1,'3355a960a76b013983b6000c29c74624','Reshare','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quam pellentesque nec nam aliquam. Turpis massa sed elementum tempus. Facilisi morbi tempus iaculis urna id volutpat. Ac tincidunt vitae semper quis lectus nulla at volutpat. Non nisi est sit amet facilisis magna etiam. Nunc lobortis mattis aliquam faucibus purus in massa tempor nec. Sagittis orci a scelerisque purus semper eget duis. Vitae justo eget magna fermentum iaculis eu non. Faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Dolor sit amet consectetur adipiscing elit. Bibendum neque egestas congue quisque egestas diam in. Velit euismod in pellentesque massa. Mattis rhoncus urna neque viverra justo nec ultrices. Nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus. Sed elementum tempus egestas sed sed risus pretium quam. Congue quisque egestas diam in arcu.','2021-06-04 14:00:53','2021-06-04 14:00:53',NULL,'25c6f8d0a767013983b6000c29c74624',2,0,NULL,0,'2021-06-04 14:00:53',NULL,NULL,NULL),(30,4,0,'6aeaf580a76b013983b6000c29c74624','StatusMessage','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Ridiculus mus mauris vitae ultricies. Ultricies integer quis auctor elit sed vulputate mi. Eu sem integer vitae justo eget magna fermentum. Arcu ac tortor dignissim convallis aenean. Iaculis urna id volutpat lacus laoreet non curabitur. Fusce id velit ut tortor pretium viverra suspendisse potenti. Leo a diam sollicitudin tempor. Lacus vel facilisis volutpat est velit egestas dui id. Suscipit tellus mauris a diam maecenas. Et tortor consequat id porta. Purus viverra accumsan in nisl nisi scelerisque eu. Posuere urna nec tincidunt praesent semper feugiat. Aliquet nec ullamcorper sit amet risus nullam. Mauris rhoncus aenean vel elit scelerisque. Lacinia quis vel eros donec. Dui vivamus arcu felis bibendum ut.\r\n\r\n','2021-06-04 14:02:26','2021-06-04 14:02:54',NULL,NULL,0,1,NULL,0,'2021-06-04 14:02:54',NULL,NULL,NULL),(31,4,0,'7518fde0a76b013983b6000c29c74624','StatusMessage','Duis at consectetur lorem donec massa sapien faucibus et. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Dolor sit amet consectetur adipiscing elit pellentesque. Dignissim sodales ut eu sem integer vitae justo eget. Nisi lacus sed viverra tellus in hac habitasse. Accumsan sit amet nulla facilisi morbi tempus iaculis. Sagittis vitae et leo duis ut diam quam nulla. Lorem ipsum dolor sit amet consectetur adipiscing. Dolor purus non enim praesent elementum facilisis leo vel. Nibh tortor id aliquet lectus proin nibh nisl condimentum. Eget nunc scelerisque viverra mauris in aliquam sem fringilla.\r\n#war','2021-06-04 14:02:44','2021-06-04 14:02:49',NULL,NULL,1,1,NULL,0,'2021-06-04 14:02:49',NULL,NULL,NULL),(32,4,0,'84d725e0a76b013983b6000c29c74624','StatusMessage','Scelerisque fermentum dui faucibus in ornare quam viverra. Curabitur vitae nunc sed velit. Tellus molestie nunc non blandit. Mattis ullamcorper velit sed ullamcorper. Lorem ipsum dolor sit amet consectetur adipiscing elit ut. Sit amet nisl suscipit adipiscing bibendum est ultricies integer. Est ultricies integer quis auctor elit sed. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Duis convallis convallis tellus id interdum. Tristique sollicitudin nibh sit amet commodo. Id venenatis a condimentum vitae. Semper risus in hendrerit gravida. Nisl nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit. Scelerisque felis imperdiet proin fermentum leo vel orci. Donec adipiscing tristique risus nec. Iaculis urna id volutpat lacus laoreet non curabitur gravida. Facilisis volutpat est velit egestas dui id ornare arcu. Sit amet porttitor eget dolor.','2021-06-04 14:03:10','2021-06-04 14:03:23',NULL,NULL,2,2,NULL,0,'2021-06-04 14:03:23',NULL,NULL,NULL),(33,4,0,'bf092140a76b013983b8000c29c74624','StatusMessage','Dapibus ultrices in iaculis nunc. At augue eget arcu dictum varius duis. Venenatis lectus magna fringilla urna porttitor rhoncus dolor. Elementum pulvinar etiam non quam lacus suspendisse faucibus interdum. Id interdum velit laoreet id donec. Tristique sollicitudin nibh sit amet commodo nulla. Eget est lorem ipsum dolor sit amet consectetur adipiscing. Dui vivamus arcu felis bibendum ut tristique et. Tincidunt id aliquet risus feugiat in ante metus. Volutpat sed cras ornare arcu dui vivamus arcu. Sagittis vitae et leo duis. Accumsan sit amet nulla facilisi morbi tempus iaculis urna. Elit sed vulputate mi sit amet mauris commodo quis imperdiet. Mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et. Quis auctor elit sed vulputate mi sit amet mauris commodo. Phasellus vestibulum lorem sed risus ultricies tristique nulla. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum.','2021-06-04 14:04:48','2021-06-04 14:04:48',NULL,NULL,2,0,NULL,0,'2021-06-04 14:04:48',NULL,NULL,NULL),(34,4,1,'cda0d4f0a76b013983b6000c29c74624','StatusMessage','It\'s a trap','2021-06-04 14:05:12','2021-06-04 14:32:59',NULL,NULL,3,2,NULL,3,'2021-06-04 14:32:59',NULL,NULL,NULL),(35,3,1,'f96da550a76b013983b8000c29c74624','Reshare','Hey everyone, I’m #newhere. I’m interested in #art, #kittens, #races, and #war. Sed egestas egestas fringilla phasellus faucibus scelerisque. Ornare lectus sit amet est placerat in egestas erat. Integer vitae justo eget magna fermentum iaculis eu non diam. Porttitor leo a diam sollicitudin tempor id eu nisl nunc. Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam. Molestie a iaculis at erat pellentesque adipiscing commodo. Mollis aliquam ut porttitor leo a diam sollicitudin tempor id. Nunc congue nisi vitae suscipit tellus mauris. Quisque id diam vel quam elementum pulvinar etiam non. Ac tincidunt vitae semper quis lectus nulla at volutpat. Ornare lectus sit amet est placerat.','2021-06-04 14:06:26','2021-06-04 14:06:26',NULL,'059a5d60a769013983b8000c29c74624',2,0,NULL,0,'2021-06-04 14:06:26',NULL,NULL,NULL),(36,3,1,'01293cb0a76c013983b8000c29c74624','Reshare','Sitting here....','2021-06-04 14:06:39','2021-06-04 14:22:34',NULL,'3a3ef0d0a768013983b6000c29c74624',2,1,NULL,0,'2021-06-04 14:22:34',NULL,NULL,NULL),(37,3,0,'180c8a70a76c013983b8000c29c74624','StatusMessage','Nice','2021-06-04 14:07:17','2021-06-04 14:07:17',NULL,NULL,0,0,NULL,0,'2021-06-04 14:07:17',NULL,NULL,NULL),(38,1,1,'7bcf5b50a76c013983b8000c29c74624','Reshare','It\'s a trap','2021-06-04 14:10:04','2021-06-04 14:27:32',NULL,'cda0d4f0a76b013983b6000c29c74624',2,1,NULL,0,'2021-06-04 14:27:32',NULL,NULL,NULL),(39,1,1,'89d5bb60a76c013983b8000c29c74624','Reshare','Hey everyone, I’m #newhere. I’m interested in #art, #kittens, #races, and #war. Sed egestas egestas fringilla phasellus faucibus scelerisque. Ornare lectus sit amet est placerat in egestas erat. Integer vitae justo eget magna fermentum iaculis eu non diam. Porttitor leo a diam sollicitudin tempor id eu nisl nunc. Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam. Molestie a iaculis at erat pellentesque adipiscing commodo. Mollis aliquam ut porttitor leo a diam sollicitudin tempor id. Nunc congue nisi vitae suscipit tellus mauris. Quisque id diam vel quam elementum pulvinar etiam non. Ac tincidunt vitae semper quis lectus nulla at volutpat. Ornare lectus sit amet est placerat.','2021-06-04 14:10:28','2021-06-04 14:22:20',NULL,'059a5d60a769013983b8000c29c74624',3,1,NULL,0,'2021-06-04 14:22:20',NULL,NULL,NULL),(40,5,1,'012079f0a76e013983b8000c29c74624','StatusMessage','Hey everyone, I’m #newhere. I’m interested in #art and #sport. ','2021-06-04 14:20:57','2021-06-04 14:20:57',NULL,NULL,4,0,NULL,4,'2021-06-04 14:20:57',NULL,NULL,NULL),(41,5,1,'1c6e1de0a76e013983b6000c29c74624','StatusMessage','@{pyotr@localhost:3000; pyotr@localhost:3000} Hi','2021-06-04 14:21:43','2021-06-04 14:32:55',NULL,NULL,2,2,NULL,4,'2021-06-04 14:32:55',NULL,NULL,NULL),(42,5,1,'2a0551d0a76e013983b8000c29c74624','Reshare','Hey everyone, I’m #newhere. I’m interested in #art, #kittens, #races, and #war. Sed egestas egestas fringilla phasellus faucibus scelerisque. Ornare lectus sit amet est placerat in egestas erat. Integer vitae justo eget magna fermentum iaculis eu non diam. Porttitor leo a diam sollicitudin tempor id eu nisl nunc. Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam. Molestie a iaculis at erat pellentesque adipiscing commodo. Mollis aliquam ut porttitor leo a diam sollicitudin tempor id. Nunc congue nisi vitae suscipit tellus mauris. Quisque id diam vel quam elementum pulvinar etiam non. Ac tincidunt vitae semper quis lectus nulla at volutpat. Ornare lectus sit amet est placerat.','2021-06-04 14:22:06','2021-06-04 14:22:06',NULL,'059a5d60a769013983b8000c29c74624',0,0,NULL,0,'2021-06-04 14:22:06',NULL,NULL,NULL),(43,5,1,'35399dd0a76e013983b6000c29c74624','Reshare','It\'s a trap','2021-06-04 14:22:25','2021-06-04 14:22:25',NULL,'cda0d4f0a76b013983b6000c29c74624',1,0,NULL,0,'2021-06-04 14:22:25',NULL,NULL,NULL),(44,5,1,'44ec33d0a76e013983b8000c29c74624','Reshare','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quam pellentesque nec nam aliquam. Turpis massa sed elementum tempus. Facilisi morbi tempus iaculis urna id volutpat. Ac tincidunt vitae semper quis lectus nulla at volutpat. Non nisi est sit amet facilisis magna etiam. Nunc lobortis mattis aliquam faucibus purus in massa tempor nec. Sagittis orci a scelerisque purus semper eget duis. Vitae justo eget magna fermentum iaculis eu non. Faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Dolor sit amet consectetur adipiscing elit. Bibendum neque egestas congue quisque egestas diam in. Velit euismod in pellentesque massa. Mattis rhoncus urna neque viverra justo nec ultrices. Nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus. Sed elementum tempus egestas sed sed risus pretium quam. Congue quisque egestas diam in arcu.','2021-06-04 14:22:51','2021-06-04 14:32:43',NULL,'25c6f8d0a767013983b6000c29c74624',0,1,NULL,0,'2021-06-04 14:32:43',NULL,NULL,NULL),(45,5,1,'498748a0a76e013983b8000c29c74624','Reshare','@{diaspora* HQ; hq@pod.diaspora.software} nice','2021-06-04 14:22:59','2021-06-04 14:22:59',NULL,'7aa95000a767013983b8000c29c74624',0,0,NULL,0,'2021-06-04 14:22:59',NULL,NULL,NULL),(46,5,1,'4be446b0a76e013983b6000c29c74624','Reshare','“On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammeled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.”','2021-06-04 14:23:03','2021-06-04 14:23:03',NULL,'03606a70a767013983b8000c29c74624',0,0,NULL,0,'2021-06-04 14:23:03',NULL,NULL,NULL),(47,5,1,'50166880a76e013983b6000c29c74624','Reshare','Sitting here....','2021-06-04 14:23:10','2021-06-04 14:23:10',NULL,'3a3ef0d0a768013983b6000c29c74624',2,0,NULL,0,'2021-06-04 14:23:10',NULL,NULL,NULL),(48,5,1,'52d20890a76e013983b6000c29c74624','Reshare','Section 1.10.32 of Cicero\'s “De finibus bonorum et malorum”\r\n\r\nOriginal Latin text:\r\n\r\n    “Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?”\r\n\r\nTranslation by H. Rackham:\r\n\r\n    “But I must explain to you how all this mistaken idea of denouncing of a pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?”','2021-06-04 14:23:15','2021-06-04 14:32:30',NULL,'37b5df90a766013983b6000c29c74624',3,3,NULL,0,'2021-06-04 14:32:30',NULL,NULL,NULL),(49,5,1,'6c863250a76e013983b6000c29c74624','Reshare','Hey everyone, I’m #newhere. I’m interested in #art, #dunno, #metoo, #music, #sport, and #war. ','2021-06-04 14:23:58','2021-06-04 14:23:58',NULL,'e4ab8ed0a766013983b8000c29c74624',3,0,NULL,0,'2021-06-04 14:23:58',NULL,NULL,NULL),(50,5,0,'76b9c9f0a76e013983b8000c29c74624','StatusMessage','@{yury@localhost:3000; yury@localhost:3000}  come on','2021-06-04 14:24:15','2021-06-04 14:27:19',NULL,NULL,2,1,NULL,0,'2021-06-04 14:27:19',NULL,NULL,NULL),(51,5,1,'87ff7520a76e013983b8000c29c74624','StatusMessage','t porttitor. Non odio euismod lacinia at quis risus sed vulputate. Sed egestas egestas fringilla phasellus faucibus. Suspendisse in est ante in nibh mauris cursus mattis.\r\n\r\nId velit ut tortor pretium. Sit amet consectetur adipiscing elit ut aliquam purus. Elit ut aliquam purus sit amet luctus venenatis. Faucibus turpis in eu mi bibendum neque egestas congue. Id nibh tortor id aliquet lectus proin nibh nisl condimentum. Amet commodo nulla facilisi nullam vehicula ipsum. Mauris a diam maecenas sed enim ut sem viverra aliquet. Mi sit amet mauris commodo. Quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit. Scelerisque varius morbi enim nunc. In hendrerit gravida rutrum quisque non tellus orci ac. Placerat duis ultricies lacus sed turpis tincidunt id. Trist','2021-06-04 14:24:44','2021-06-04 14:24:44',NULL,NULL,3,0,NULL,2,'2021-06-04 14:24:44',NULL,NULL,NULL),(52,5,0,'8e67b110a76e013983b6000c29c74624','StatusMessage','o a diam sollicitudin tempor. Praesent elementum facilisis leo vel fringilla est ullamcorper eget. In hac habitasse platea dictumst vestibulum rhoncus. Eget est lorem ipsum dolor. In fermentum posuere urna nec tincidunt praesent semper. A lacus vestibulum sed arcu non odio euismod lacinia.\r\n\r\nAliquet lectus proin nibh nisl condimentum id. At augue eget arcu dictum varius. Volutpat diam ut venenatis tellus in metus. Nulla pellentesque dignissim enim sit amet venenatis urna cursus eget. Adipiscing commodo elit at imperdiet dui accumsan sit amet nulla. Ut enim blan','2021-06-04 14:24:54','2021-06-04 14:30:23',NULL,NULL,2,1,NULL,0,'2021-06-04 14:30:23',NULL,NULL,NULL),(53,5,0,'944dc200a76e013983b8000c29c74624','StatusMessage','uam sem et tortor. Neque laoreet suspendisse interdum consectetur libero id faucibus nisl. Enim diam vulputate ut pharetra sit amet aliquam id. Nec ultrices dui sapien eget mi proin sed. Fringilla urna porttitor rhoncus dolor purus non enim praesent elementum. Nec feugiat in fermentum posuere urna. Proin sagittis nisl rhoncus mattis.\r\n\r\nCursus eget nunc scelerisque viverra. Urna neque viverra justo nec ultrices dui sapien. Ornare arcu dui vivamus arcu. Nibh tellus molestie nunc non blandit massa enim nec dui. Eget arcu dictum varius duis at consectetur lorem donec massa. Porttitor leo a diam sollicitudin tempor id eu nisl nunc. Blandit libero volutpat sed cras ornare arcu dui vivamus. Ut porttitor leo a diam sollicitudin tempor. Congu','2021-06-04 14:25:04','2021-06-04 14:25:42',NULL,NULL,1,1,NULL,0,'2021-06-04 14:25:42',NULL,NULL,NULL),(54,5,0,'9a7de5a0a76e013983b6000c29c74624','StatusMessage','\r\n\r\nDolor sed viverra ipsum nunc aliquet bibendum enim facilisis. Amet massa vitae tortor condimentum lacinia quis vel. Augue lacus viverra vitae congue eu. Aenean sed adipiscing diam donec adipiscing tristique risus. Amet consectetur adipiscing elit duis tristique. Vel risus commodo viverra maecenas accumsan lacus vel. Ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae. Adipiscing diam donec adipiscing tristique risus nec feugiat in fermentum. Tellus at urna condimentum mattis pellentesque id nibh tortor. Feugiat nibh sed pulvinar proin. Malesuada pellentesque elit eget gravida cum sociis. Pretium viverra suspendisse potenti nullam ac tortor vitae purus faucibus. Cursus eget nunc scelerisque viverra mauris in aliquam s','2021-06-04 14:25:15','2021-06-04 14:25:35',NULL,NULL,1,1,NULL,0,'2021-06-04 14:25:35',NULL,NULL,NULL),(55,3,1,'c9663150a76e013983b6000c29c74624','Reshare','@{pyotr@localhost:3000; pyotr@localhost:3000} Hi','2021-06-04 14:26:33','2021-06-04 14:26:33',NULL,'1c6e1de0a76e013983b6000c29c74624',1,0,NULL,0,'2021-06-04 14:26:33',NULL,NULL,NULL),(56,3,1,'cbac7140a76e013983b8000c29c74624','Reshare','Hey everyone, I’m #newhere. I’m interested in #art and #sport. ','2021-06-04 14:26:37','2021-06-04 14:26:37',NULL,'012079f0a76e013983b8000c29c74624',0,0,NULL,0,'2021-06-04 14:26:37',NULL,NULL,NULL),(57,4,1,'de3adf30a76e013983b6000c29c74624','Reshare','@{pyotr@localhost:3000; pyotr@localhost:3000} Hi','2021-06-04 14:27:08','2021-06-04 14:29:11',NULL,'1c6e1de0a76e013983b6000c29c74624',3,2,NULL,0,'2021-06-04 14:29:11',NULL,NULL,NULL),(58,4,1,'e70a3060a76e013983b8000c29c74624','Reshare','Hey everyone, I’m #newhere. I’m interested in #art and #sport. ','2021-06-04 14:27:23','2021-06-04 14:27:23',NULL,'012079f0a76e013983b8000c29c74624',2,0,NULL,0,'2021-06-04 14:27:23',NULL,NULL,NULL),(59,1,1,'1fc9a360a76f013983b6000c29c74624','Reshare','Hey everyone, I’m #newhere. I’m interested in #art and #sport. ','2021-06-04 14:28:58','2021-06-04 14:29:02',NULL,'012079f0a76e013983b8000c29c74624',1,1,NULL,0,'2021-06-04 14:29:02',NULL,NULL,NULL),(60,1,1,'24c852f0a76f013983b8000c29c74624','Reshare','@{pyotr@localhost:3000; pyotr@localhost:3000} Hi','2021-06-04 14:29:07','2021-06-04 14:29:07',NULL,'1c6e1de0a76e013983b6000c29c74624',1,0,NULL,0,'2021-06-04 14:29:07',NULL,NULL,NULL),(61,1,1,'5439b0b0a76f013983b6000c29c74624','Reshare','t porttitor. Non odio euismod lacinia at quis risus sed vulputate. Sed egestas egestas fringilla phasellus faucibus. Suspendisse in est ante in nibh mauris cursus mattis.\r\n\r\nId velit ut tortor pretium. Sit amet consectetur adipiscing elit ut aliquam purus. Elit ut aliquam purus sit amet luctus venenatis. Faucibus turpis in eu mi bibendum neque egestas congue. Id nibh tortor id aliquet lectus proin nibh nisl condimentum. Amet commodo nulla facilisi nullam vehicula ipsum. Mauris a diam maecenas sed enim ut sem viverra aliquet. Mi sit amet mauris commodo. Quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit. Scelerisque varius morbi enim nunc. In hendrerit gravida rutrum quisque non tellus orci ac. Placerat duis ultricies lacus sed turpis tincidunt id. Trist','2021-06-04 14:30:26','2021-06-04 14:30:26',NULL,'87ff7520a76e013983b8000c29c74624',0,0,NULL,0,'2021-06-04 14:30:26',NULL,NULL,NULL),(62,6,1,'7040fa60a76f013983b6000c29c74624','StatusMessage','Hey everyone, I’m #newhere. I’m interested in #pain. ','2021-06-04 14:31:13','2021-06-04 14:31:13',NULL,NULL,1,0,NULL,0,'2021-06-04 14:31:13',NULL,NULL,NULL),(63,6,1,'7a106e20a76f013983b8000c29c74624','StatusMessage','m fringilla. Vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam. Morbi tristique senectus et netus et malesuada fames. Id consectetur purus ut faucibus. Vitae suscipit tellus mauris a diam maecenas. Enim facilisis gravida neque convallis a cras semper. Feugiat sed lectus vestibulum mattis. Vulputate dignissim suspendisse in est ante in.\r\n\r\nCursus euismod quis viverra nibh cras pulvinar. Aenean euismod elementum nisi quis eleifend quam. Adipiscing enim eu turpis egestas pretium aenean pharetra. Feugiat vivamus at augue e','2021-06-04 14:31:30','2021-06-04 14:31:30',NULL,NULL,0,0,NULL,0,'2021-06-04 14:31:30',NULL,NULL,NULL),(64,6,1,'8c2e13b0a76f013983b8000c29c74624','Reshare','Hey everyone, I’m #newhere. I’m interested in #art and #sport. ','2021-06-04 14:32:00','2021-06-04 14:32:00',NULL,'012079f0a76e013983b8000c29c74624',0,0,NULL,0,'2021-06-04 14:32:00',NULL,NULL,NULL),(65,6,1,'900bee60a76f013983b8000c29c74624','Reshare','@{pyotr@localhost:3000; pyotr@localhost:3000} Hi','2021-06-04 14:32:07','2021-06-04 14:32:07',NULL,'1c6e1de0a76e013983b6000c29c74624',0,0,NULL,0,'2021-06-04 14:32:07',NULL,NULL,NULL),(66,6,1,'93ce1000a76f013983b6000c29c74624','Reshare','t porttitor. Non odio euismod lacinia at quis risus sed vulputate. Sed egestas egestas fringilla phasellus faucibus. Suspendisse in est ante in nibh mauris cursus mattis.\r\n\r\nId velit ut tortor pretium. Sit amet consectetur adipiscing elit ut aliquam purus. Elit ut aliquam purus sit amet luctus venenatis. Faucibus turpis in eu mi bibendum neque egestas congue. Id nibh tortor id aliquet lectus proin nibh nisl condimentum. Amet commodo nulla facilisi nullam vehicula ipsum. Mauris a diam maecenas sed enim ut sem viverra aliquet. Mi sit amet mauris commodo. Quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit. Scelerisque varius morbi enim nunc. In hendrerit gravida rutrum quisque non tellus orci ac. Placerat duis ultricies lacus sed turpis tincidunt id. Trist','2021-06-04 14:32:13','2021-06-04 14:32:13',NULL,'87ff7520a76e013983b8000c29c74624',1,0,NULL,0,'2021-06-04 14:32:13',NULL,NULL,NULL),(67,6,1,'96f4b3d0a76f013983b6000c29c74624','Reshare','Hey everyone, I’m #newhere. I’m interested in #art, #dunno, #metoo, #music, #sport, and #war. ','2021-06-04 14:32:18','2021-06-04 14:32:18',NULL,'e4ab8ed0a766013983b8000c29c74624',1,0,NULL,0,'2021-06-04 14:32:18',NULL,NULL,NULL),(68,6,1,'9987b070a76f013983b8000c29c74624','Reshare','Section 1.10.32 of Cicero\'s “De finibus bonorum et malorum”\r\n\r\nOriginal Latin text:\r\n\r\n    “Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?”\r\n\r\nTranslation by H. Rackham:\r\n\r\n    “But I must explain to you how all this mistaken idea of denouncing of a pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?”','2021-06-04 14:32:23','2021-06-04 14:32:23',NULL,'37b5df90a766013983b6000c29c74624',0,0,NULL,0,'2021-06-04 14:32:23',NULL,NULL,NULL),(69,6,1,'a0ea8c50a76f013983b8000c29c74624','Reshare','“On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammeled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.”','2021-06-04 14:32:35','2021-06-04 14:32:35',NULL,'03606a70a767013983b8000c29c74624',1,0,NULL,0,'2021-06-04 14:32:35',NULL,NULL,NULL),(70,6,1,'a333aea0a76f013983b6000c29c74624','Reshare','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quam pellentesque nec nam aliquam. Turpis massa sed elementum tempus. Facilisi morbi tempus iaculis urna id volutpat. Ac tincidunt vitae semper quis lectus nulla at volutpat. Non nisi est sit amet facilisis magna etiam. Nunc lobortis mattis aliquam faucibus purus in massa tempor nec. Sagittis orci a scelerisque purus semper eget duis. Vitae justo eget magna fermentum iaculis eu non. Faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Dolor sit amet consectetur adipiscing elit. Bibendum neque egestas congue quisque egestas diam in. Velit euismod in pellentesque massa. Mattis rhoncus urna neque viverra justo nec ultrices. Nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus. Sed elementum tempus egestas sed sed risus pretium quam. Congue quisque egestas diam in arcu.','2021-06-04 14:32:39','2021-06-04 14:32:39',NULL,'25c6f8d0a767013983b6000c29c74624',0,0,NULL,0,'2021-06-04 14:32:39',NULL,NULL,NULL),(71,6,1,'a866c4c0a76f013983b6000c29c74624','Reshare','It\'s a trap','2021-06-04 14:32:48','2021-06-04 14:32:48',NULL,'cda0d4f0a76b013983b6000c29c74624',0,0,NULL,0,'2021-06-04 14:32:48',NULL,NULL,NULL),(72,6,1,'aa5af150a76f013983b6000c29c74624','Reshare','Hey everyone, I’m #newhere. I’m interested in #art, #kittens, #races, and #war. Sed egestas egestas fringilla phasellus faucibus scelerisque. Ornare lectus sit amet est placerat in egestas erat. Integer vitae justo eget magna fermentum iaculis eu non diam. Porttitor leo a diam sollicitudin tempor id eu nisl nunc. Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam. Molestie a iaculis at erat pellentesque adipiscing commodo. Mollis aliquam ut porttitor leo a diam sollicitudin tempor id. Nunc congue nisi vitae suscipit tellus mauris. Quisque id diam vel quam elementum pulvinar etiam non. Ac tincidunt vitae semper quis lectus nulla at volutpat. Ornare lectus sit amet est placerat.','2021-06-04 14:32:51','2021-06-04 14:32:51',NULL,'059a5d60a769013983b8000c29c74624',1,0,NULL,0,'2021-06-04 14:32:51',NULL,NULL,NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppid`
--

DROP TABLE IF EXISTS `ppid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ppid` (
  `id` int NOT NULL AUTO_INCREMENT,
  `o_auth_application_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `guid` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ppid_on_o_auth_application_id` (`o_auth_application_id`),
  KEY `index_ppid_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_150457f962` FOREIGN KEY (`o_auth_application_id`) REFERENCES `o_auth_applications` (`id`),
  CONSTRAINT `fk_rails_e6b8e5264f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppid`
--

LOCK TABLES `ppid` WRITE;
/*!40000 ALTER TABLE `ppid` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `diaspora_handle` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `first_name` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_name` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `image_url_small` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `image_url_medium` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bio` text COLLATE utf8mb4_bin,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `person_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `full_name` varchar(70) COLLATE utf8mb4_bin DEFAULT NULL,
  `nsfw` tinyint(1) DEFAULT '0',
  `public_details` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_profiles_on_full_name_and_searchable` (`full_name`,`searchable`),
  KEY `index_profiles_on_full_name` (`full_name`),
  KEY `index_profiles_on_person_id` (`person_id`),
  CONSTRAINT `profiles_person_id_fk` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,NULL,'Ivan','Ivanov','http://localhost:3000/uploads/images/thumb_large_2775db97c9a2293a40fe.jpg','http://localhost:3000/uploads/images/thumb_small_2775db97c9a2293a40fe.jpg','http://localhost:3000/uploads/images/thumb_medium_2775db97c9a2293a40fe.jpg','1993-10-16','male','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,1,'2021-06-04 13:04:39','2021-06-04 13:15:43','Moscow','ivan ivanov',0,0),(2,NULL,'diaspora* HQ',NULL,'https://pod.diaspora.software/uploads/images/thumb_large_3e5b0cbd394346a7e5ca.png','https://pod.diaspora.software/uploads/images/thumb_small_3e5b0cbd394346a7e5ca.png','https://pod.diaspora.software/uploads/images/thumb_medium_3e5b0cbd394346a7e5ca.png',NULL,NULL,NULL,1,2,'2021-06-04 13:04:40','2021-06-04 13:04:40',NULL,'diaspora* hq',0,0),(3,NULL,NULL,NULL,'http://localhost:3000/uploads/images/thumb_large_1107074cf3896e858287.jpg','http://localhost:3000/uploads/images/thumb_small_1107074cf3896e858287.jpg','http://localhost:3000/uploads/images/thumb_medium_1107074cf3896e858287.jpg',NULL,NULL,NULL,1,3,'2021-06-04 13:28:42','2021-06-04 13:29:03',NULL,'',0,0),(4,NULL,'','','http://localhost:3000/uploads/images/thumb_large_0dc5950af382a371b6e9.jpg','http://localhost:3000/uploads/images/thumb_small_0dc5950af382a371b6e9.jpg','http://localhost:3000/uploads/images/thumb_medium_0dc5950af382a371b6e9.jpg','1996-04-12','male','Feugiat nisl pretium fusce id velit ut. Eget nunc lobortis mattis aliquam. Tincidunt dui ut ornare lectus sit amet est placerat. Proin sagittis nisl rhoncus mattis. Congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque. Ultricies lacus sed turpis tincidunt. Hendrerit gravida rutrum quisque non tellus. Urna nec tincidunt praesent semper feugiat nibh sed. Nunc vel risus commodo viverra maecenas. Justo laoreet sit amet cursus. Donec ac odio tempor orci dapibus ultrices in. Condimentum mattis pellentesque id nibh tortor. Euismod quis viverra nibh cras. Integer malesuada nunc vel risus commodo viverra maecenas.',1,4,'2021-06-04 13:43:04','2021-06-04 13:44:39','London','',0,0),(5,NULL,NULL,NULL,'http://localhost:3000/uploads/images/thumb_large_cce6cfc86521889e669d.jpg','http://localhost:3000/uploads/images/thumb_small_cce6cfc86521889e669d.jpg','http://localhost:3000/uploads/images/thumb_medium_cce6cfc86521889e669d.jpg',NULL,NULL,NULL,1,5,'2021-06-04 14:12:42','2021-06-04 14:20:40',NULL,'',0,0),(6,NULL,NULL,NULL,'http://localhost:3000/uploads/images/thumb_large_cb7119abd80b00a8b2ff.jpg','http://localhost:3000/uploads/images/thumb_small_cb7119abd80b00a8b2ff.jpg','http://localhost:3000/uploads/images/thumb_medium_cb7119abd80b00a8b2ff.jpg',NULL,NULL,NULL,1,6,'2021-06-04 14:28:30','2021-06-04 14:31:00',NULL,'',0,0);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `references`
--

DROP TABLE IF EXISTS `references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `references` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `source_id` int NOT NULL,
  `source_type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `target_id` int NOT NULL,
  `target_type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_references_on_source_and_target` (`source_id`,`source_type`,`target_id`,`target_type`),
  KEY `index_references_on_source_id_and_source_type` (`source_id`,`source_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `references`
--

LOCK TABLES `references` WRITE;
/*!40000 ALTER TABLE `references` DISABLE KEYS */;
/*!40000 ALTER TABLE `references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `item_type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `reviewed` tinyint(1) DEFAULT '0',
  `text` text COLLATE utf8mb4_bin,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reports_on_item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,8,'Post',0,'e.g. offensive content','2021-06-04 13:38:34','2021-06-04 13:38:34',1),(2,29,'Comment',0,'e.g. offensive content','2021-06-04 14:09:13','2021-06-04 14:09:13',2);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_roles_on_person_id_and_name` (`person_id`,`name`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('0'),('20160829170244'),('20160901072443'),('20160902180630'),('20160906225138'),('20161015174300'),('20161024231443'),('20161107100840'),('20170430022507'),('20170730154117'),('20170813141631'),('20170813153048'),('20170813160104'),('20170813164435'),('20170813222333'),('20170824202628'),('20170827222357'),('20170827231800'),('20170914202650'),('20170914212336'),('20170917163640'),('20170920214158'),('20170928233609'),('20171009232054'),('20171012202650'),('20171017221434'),('20171229175654'),('20180302105225'),('20180406235521'),('20180425125409'),('20180430134444'),('20180603194914'),('20181004003638'),('20181227235201'),('20190509125709'),('20190511150503'),('20190703231700');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(127) COLLATE utf8mb4_bin NOT NULL,
  `user_id` int NOT NULL,
  `uid` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `access_secret` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_services_on_type_and_uid` (`type`(64),`uid`),
  KEY `index_services_on_user_id` (`user_id`),
  CONSTRAINT `services_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_visibilities`
--

DROP TABLE IF EXISTS `share_visibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_visibilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shareable_id` int NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `shareable_type` varchar(60) COLLATE utf8mb4_bin NOT NULL DEFAULT 'Post',
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shareable_and_user_id` (`shareable_id`,`shareable_type`,`user_id`),
  KEY `index_share_visibilities_on_user_id` (`user_id`),
  KEY `shareable_and_hidden_and_user_id` (`shareable_id`,`shareable_type`,`hidden`,`user_id`),
  KEY `index_post_visibilities_on_post_id` (`shareable_id`),
  CONSTRAINT `share_visibilities_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_visibilities`
--

LOCK TABLES `share_visibilities` WRITE;
/*!40000 ALTER TABLE `share_visibilities` DISABLE KEYS */;
INSERT INTO `share_visibilities` VALUES (3,3,0,'Photo',1),(1,16,0,'Post',2),(2,21,0,'Post',1),(4,30,0,'Post',2),(5,31,0,'Post',2),(7,32,0,'Post',1),(6,32,0,'Post',2),(9,33,0,'Post',1),(8,33,0,'Post',2),(10,37,0,'Post',1),(11,50,0,'Post',1),(12,50,0,'Post',2),(13,50,0,'Post',3),(14,52,0,'Post',1),(15,52,0,'Post',2),(16,52,0,'Post',3),(17,53,0,'Post',3),(18,54,0,'Post',3);
/*!40000 ALTER TABLE `share_visibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signature_orders`
--

DROP TABLE IF EXISTS `signature_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signature_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_signature_orders_on_order` (`order`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signature_orders`
--

LOCK TABLES `signature_orders` WRITE;
/*!40000 ALTER TABLE `signature_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `signature_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_captcha_data`
--

DROP TABLE IF EXISTS `simple_captcha_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_captcha_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `value` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_captcha_data`
--

LOCK TABLES `simple_captcha_data` WRITE;
/*!40000 ALTER TABLE `simple_captcha_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `simple_captcha_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_followings`
--

DROP TABLE IF EXISTS `tag_followings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_followings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tag_followings_on_tag_id_and_user_id` (`tag_id`,`user_id`),
  KEY `index_tag_followings_on_tag_id` (`tag_id`),
  KEY `index_tag_followings_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_followings`
--

LOCK TABLES `tag_followings` WRITE;
/*!40000 ALTER TABLE `tag_followings` DISABLE KEYS */;
INSERT INTO `tag_followings` VALUES (1,7,1,'2021-06-04 13:23:52','2021-06-04 13:23:52'),(2,6,1,'2021-06-04 13:24:00','2021-06-04 13:24:00'),(3,5,1,'2021-06-04 13:24:07','2021-06-04 13:24:07'),(4,8,1,'2021-06-04 13:24:41','2021-06-04 13:24:41'),(5,9,1,'2021-06-04 13:25:32','2021-06-04 13:25:32'),(6,10,2,'2021-06-04 13:29:31','2021-06-04 13:29:31'),(8,11,2,'2021-06-04 13:29:41','2021-06-04 13:29:41'),(9,6,2,'2021-06-04 13:29:45','2021-06-04 13:29:45'),(11,7,2,'2021-06-04 13:29:51','2021-06-04 13:29:51'),(12,13,2,'2021-06-04 13:32:54','2021-06-04 13:32:54'),(13,8,2,'2021-06-04 13:33:13','2021-06-04 13:33:13'),(14,14,3,'2021-06-04 13:43:42','2021-06-04 13:43:42'),(15,5,3,'2021-06-04 13:43:45','2021-06-04 13:43:45'),(16,8,3,'2021-06-04 13:43:48','2021-06-04 13:43:48'),(17,3,3,'2021-06-04 13:43:52','2021-06-04 13:43:52'),(18,5,4,'2021-06-04 14:20:49','2021-06-04 14:20:49'),(19,6,4,'2021-06-04 14:20:53','2021-06-04 14:20:53'),(20,15,5,'2021-06-04 14:31:08','2021-06-04 14:31:08');
/*!40000 ALTER TABLE `tag_followings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_id` int DEFAULT NULL,
  `taggable_id` int DEFAULT NULL,
  `taggable_type` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  `tagger_id` int DEFAULT NULL,
  `tagger_type` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  `context` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_taggings_uniquely` (`taggable_id`,`taggable_type`,`tag_id`),
  KEY `index_taggings_on_created_at` (`created_at`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`(95),`context`(95))
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (1,1,1,'Profile',NULL,NULL,'tags','2021-06-04 13:15:43'),(2,2,1,'Profile',NULL,NULL,'tags','2021-06-04 13:15:43'),(3,3,1,'Profile',NULL,NULL,'tags','2021-06-04 13:15:43'),(4,4,1,'Profile',NULL,NULL,'tags','2021-06-04 13:15:43'),(5,5,7,'Comment',NULL,NULL,'tags','2021-06-04 13:22:50'),(6,6,8,'Comment',NULL,NULL,'tags','2021-06-04 13:23:03'),(7,7,9,'Comment',NULL,NULL,'tags','2021-06-04 13:23:15'),(8,8,10,'Comment',NULL,NULL,'tags','2021-06-04 13:24:34'),(9,9,11,'Comment',NULL,NULL,'tags','2021-06-04 13:25:29'),(10,12,8,'Post',NULL,NULL,'tags','2021-06-04 13:30:03'),(11,5,8,'Post',NULL,NULL,'tags','2021-06-04 13:30:03'),(12,10,8,'Post',NULL,NULL,'tags','2021-06-04 13:30:03'),(13,7,8,'Post',NULL,NULL,'tags','2021-06-04 13:30:03'),(14,11,8,'Post',NULL,NULL,'tags','2021-06-04 13:30:03'),(15,6,8,'Post',NULL,NULL,'tags','2021-06-04 13:30:03'),(16,8,8,'Post',NULL,NULL,'tags','2021-06-04 13:30:03'),(17,5,16,'Comment',NULL,NULL,'tags','2021-06-04 13:32:23'),(18,13,17,'Comment',NULL,NULL,'tags','2021-06-04 13:32:52'),(19,8,18,'Comment',NULL,NULL,'tags','2021-06-04 13:33:09'),(20,5,22,'Comment',NULL,NULL,'tags','2021-06-04 13:37:36'),(21,12,23,'Post',NULL,NULL,'tags','2021-06-04 13:45:18'),(22,5,23,'Post',NULL,NULL,'tags','2021-06-04 13:45:18'),(23,3,23,'Post',NULL,NULL,'tags','2021-06-04 13:45:18'),(24,14,23,'Post',NULL,NULL,'tags','2021-06-04 13:45:18'),(25,8,23,'Post',NULL,NULL,'tags','2021-06-04 13:45:18'),(26,3,28,'Comment',NULL,NULL,'tags','2021-06-04 13:45:29'),(27,6,29,'Comment',NULL,NULL,'tags','2021-06-04 13:59:48'),(28,3,29,'Comment',NULL,NULL,'tags','2021-06-04 13:59:48'),(29,3,31,'Comment',NULL,NULL,'tags','2021-06-04 14:01:07'),(30,8,31,'Post',NULL,NULL,'tags','2021-06-04 14:02:44'),(31,6,36,'Comment',NULL,NULL,'tags','2021-06-04 14:03:23'),(32,12,40,'Post',NULL,NULL,'tags','2021-06-04 14:20:57'),(33,5,40,'Post',NULL,NULL,'tags','2021-06-04 14:20:57'),(34,6,40,'Post',NULL,NULL,'tags','2021-06-04 14:20:57'),(35,3,42,'Comment',NULL,NULL,'tags','2021-06-04 14:22:20'),(36,5,46,'Comment',NULL,NULL,'tags','2021-06-04 14:25:35'),(37,6,46,'Comment',NULL,NULL,'tags','2021-06-04 14:25:35'),(38,3,46,'Comment',NULL,NULL,'tags','2021-06-04 14:25:35'),(39,12,62,'Post',NULL,NULL,'tags','2021-06-04 14:31:13'),(40,15,62,'Post',NULL,NULL,'tags','2021-06-04 14:31:13'),(41,3,56,'Comment',NULL,NULL,'tags','2021-06-04 14:32:30');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `taggings_count` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'ilike',1),(2,'movies',1),(3,'kittens',8),(4,'tanks',1),(5,'art',7),(6,'sport',6),(7,'metoo',2),(8,'war',5),(9,'reality',1),(10,'dunno',1),(11,'music',1),(12,'newhere',4),(13,'megusto',1),(14,'races',1),(15,'pain',1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id_and_email_type` (`user_id`,`email_type`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `serialized_private_key` text COLLATE utf8mb4_bin,
  `getting_started` tinyint(1) NOT NULL DEFAULT '1',
  `disable_mail` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `invited_by_id` int DEFAULT NULL,
  `authentication_token` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `confirm_email_token` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `show_community_spotlight_in_stream` tinyint(1) NOT NULL DEFAULT '1',
  `auto_follow_back` tinyint(1) DEFAULT '0',
  `auto_follow_back_aspect_id` int DEFAULT NULL,
  `hidden_shareables` text COLLATE utf8mb4_bin,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `remove_after` datetime DEFAULT NULL,
  `export` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `exported_at` datetime DEFAULT NULL,
  `exporting` tinyint(1) DEFAULT '0',
  `strip_exif` tinyint(1) DEFAULT '1',
  `exported_photos_file` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `exported_photos_at` datetime DEFAULT NULL,
  `exporting_photos` tinyint(1) DEFAULT '0',
  `color_theme` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `post_default_public` tinyint(1) DEFAULT '0',
  `consumed_timestep` int DEFAULT NULL,
  `otp_required_for_login` tinyint(1) DEFAULT NULL,
  `otp_backup_codes` text COLLATE utf8mb4_bin,
  `plain_otp_secret` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_username` (`username`(191)),
  UNIQUE KEY `index_users_on_email` (`email`(191)),
  UNIQUE KEY `index_users_on_authentication_token` (`authentication_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tyashin','-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n',0,0,'en','tyashin@gmail.com','$2a$10$.QTiGyhLe7cnXuV3sE8ADu48i5mDOc5f2ZOqmryy.X3uA/9p/DtdG',NULL,'2021-06-04 13:04:40',2,'2021-06-04 13:05:40','2021-06-04 13:04:40','127.0.0.1','127.0.0.1','2021-06-04 13:04:39','2021-06-04 14:29:31',NULL,'mwfaLYZSsRxu2EaxtWu6EzWt3JRNWA',NULL,NULL,NULL,1,0,NULL,NULL,NULL,'2021-06-04 14:29:31',NULL,NULL,NULL,0,1,NULL,NULL,0,'original',0,NULL,NULL,NULL,'3S6GFN3YFP77PM2M4DIJ7NPGWGGPWU7U'),(2,'pyotr','-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n',0,0,'en','tyashin1@gmail.com','$2a$10$udwaXD33E2Hy7AmAYV04O.X8kMG4HEfFBYUjak9kdX1UtJBpCYsca',NULL,NULL,3,'2021-06-04 14:26:20','2021-06-04 14:06:17','127.0.0.1','127.0.0.1','2021-06-04 13:28:42','2021-06-04 14:26:46',NULL,'AcJPx1pTSk7rKwHJypoTZ2fS186Kjw',NULL,NULL,NULL,1,0,NULL,NULL,NULL,'2021-06-04 14:26:20',NULL,NULL,NULL,0,1,NULL,NULL,0,'original',0,NULL,NULL,NULL,NULL),(3,'yury','-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n',0,0,'en','tyashin2@gmail.com','$2a$10$8HpFZkWS9RJM8y/P7235CuS0ahje26WzX1yMR8bJT7JrktCeLC5yK',NULL,NULL,3,'2021-06-04 14:27:01','2021-06-04 14:05:53','127.0.0.1','127.0.0.1','2021-06-04 13:43:04','2021-06-04 14:27:51',NULL,'RnrYN9Uh1LT6QTnAXQs4kMRTuzMGdA',NULL,NULL,NULL,1,0,NULL,NULL,NULL,'2021-06-04 14:27:01',NULL,NULL,NULL,0,1,NULL,NULL,0,'original',0,NULL,NULL,NULL,NULL),(4,'olga','-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n',0,0,'en','tyashin3@gmail.com','$2a$10$zVX8AmJEaqm3nY37kFBpquXqMC3UpmrUL2gM5O3ZDjeHqHR/yqUUu',NULL,NULL,1,'2021-06-04 14:12:42','2021-06-04 14:12:42','127.0.0.1','127.0.0.1','2021-06-04 14:12:42','2021-06-04 14:26:07',NULL,'kHwu5LAjBcyHci3VJit6dbYh2UPW3w',NULL,NULL,NULL,1,0,NULL,NULL,NULL,'2021-06-04 14:24:09',NULL,NULL,NULL,0,1,NULL,NULL,0,'original',0,NULL,NULL,NULL,NULL),(5,'kirill','-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n',0,0,'en','tyashin4@gmail.com','$2a$10$5Qa8S5hiJhDWjc27k/DHNON2NHLw3RIvZPf1J4O2M/tyV10fbGjcG',NULL,NULL,1,'2021-06-04 14:28:30','2021-06-04 14:28:30','127.0.0.1','127.0.0.1','2021-06-04 14:28:30','2021-06-04 14:34:32',NULL,'AyxkKMSFdxEzWdE3xvry9XGw3B_5SA',NULL,NULL,NULL,1,0,NULL,NULL,NULL,'2021-06-04 14:33:56',NULL,NULL,NULL,0,1,NULL,NULL,0,'original',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-04  7:37:57
