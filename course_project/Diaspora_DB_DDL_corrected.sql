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
  `response_type` ENUM('responce_type1', 'responce_type2', 'responce_type3') DEFAULT NULL,  
  `grant_type` ENUM('grant_type1', 'grant_type2', 'grant_type3') DEFAULT NULL,
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

DROP TABLE IF EXISTS `pods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `host` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `ssl` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` ENUM('status1', 'status2', 'status3') DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status_message_id` int NOT NULL,
  `status` ENUM('status1', 'status2', 'status3'),
  `guid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_polls_on_guid` (`guid`(191)),
  KEY `index_polls_on_status_message_id` (`status_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `type` ENUM('StatusMessage', 'Reshare') NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


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
  `gender` ENUM('m', 'f') DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `references` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `source_id` int NOT NULL,
  `source_type` ENUM('type1', 'type2', 'type3') NOT NULL,
  `target_id` int NOT NULL,
  `target_type` ENUM('type1', 'type2', 'type3') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_references_on_source_and_target` (`source_id`,`source_type`,`target_id`,`target_type`),
  KEY `index_references_on_source_id_and_source_type` (`source_id`,`source_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `item_type` ENUM('Post', 'Comment') NOT NULL,
  `reviewed` tinyint(1) DEFAULT '0',
  `text` text COLLATE utf8mb4_bin,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reports_on_item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `share_visibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_visibilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shareable_id` int NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `shareable_type` ENUM('Post', 'Photo')  NOT NULL DEFAULT 'Post',
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shareable_and_user_id` (`shareable_id`,`shareable_type`,`user_id`),
  KEY `shareable_and_hidden_and_user_id` (`shareable_id`,`shareable_type`,`hidden`,`user_id`),
  KEY `index_post_visibilities_on_post_id` (`shareable_id`),
  CONSTRAINT `share_visibilities_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_id` int DEFAULT NULL,
  `taggable_id` int DEFAULT NULL,
  `taggable_type` ENUM('Profile', 'Comment', 'Post'),
  `tagger_id` int DEFAULT NULL,
  `tagger_type` ENUM('Profile', 'Comment', 'Post'),
  `context` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_taggings_uniquely` (`taggable_id`,`taggable_type`,`tag_id`),
  KEY `index_taggings_on_created_at` (`created_at`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`(95),`context`(95))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email_type` ENUM('email1', 'email2'),
  `user_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id_and_email_type` (`user_id`,`email_type`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;