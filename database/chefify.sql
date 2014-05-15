CREATE DATABASE  IF NOT EXISTS `chefify` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `chefify`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: chefify
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add migration history',6,'add_migrationhistory'),(17,'Can change migration history',6,'change_migrationhistory'),(18,'Can delete migration history',6,'delete_migrationhistory'),(19,'Can add registration profile',7,'add_registrationprofile'),(20,'Can change registration profile',7,'change_registrationprofile'),(21,'Can delete registration profile',7,'delete_registrationprofile'),(22,'Can add event type',8,'add_eventtype'),(23,'Can change event type',8,'change_eventtype'),(24,'Can delete event type',8,'delete_eventtype'),(25,'Can add cuisine',9,'add_cuisine'),(26,'Can change cuisine',9,'change_cuisine'),(27,'Can delete cuisine',9,'delete_cuisine'),(28,'Can add dish type',10,'add_dishtype'),(29,'Can change dish type',10,'change_dishtype'),(30,'Can delete dish type',10,'delete_dishtype'),(31,'Can add dish',11,'add_dish'),(32,'Can change dish',11,'change_dish'),(33,'Can delete dish',11,'delete_dish'),(34,'Can add menu',12,'add_menu'),(35,'Can change menu',12,'change_menu'),(36,'Can delete menu',12,'delete_menu'),(37,'Can add chefify user',13,'add_chefifyuser'),(38,'Can change chefify user',13,'change_chefifyuser'),(39,'Can delete chefify user',13,'delete_chefifyuser'),(40,'Can add chef',14,'add_chef'),(41,'Can change chef',14,'change_chef'),(42,'Can delete chef',14,'delete_chef'),(43,'Can add customer',15,'add_customer'),(44,'Can change customer',15,'change_customer'),(45,'Can delete customer',15,'delete_customer'),(46,'Can add location',16,'add_location'),(47,'Can change location',16,'change_location'),(48,'Can delete location',16,'delete_location'),(49,'Can add appointments',17,'add_appointments'),(50,'Can change appointments',17,'change_appointments'),(51,'Can delete appointments',17,'delete_appointments'),(52,'Can add api access',18,'add_apiaccess'),(53,'Can change api access',18,'change_apiaccess'),(54,'Can delete api access',18,'delete_apiaccess'),(55,'Can add api key',19,'add_apikey'),(56,'Can change api key',19,'change_apikey'),(57,'Can delete api key',19,'delete_apikey');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-03-18 00:06:39',2,14,'2','test',1,''),(2,'2014-03-18 00:07:26',2,13,'3','new-customer',1,''),(3,'2014-03-18 00:07:54',2,15,'1','new-customer',1,''),(4,'2014-03-18 00:12:14',2,13,'2','test',2,'Changed first_name, last_name and email.'),(5,'2014-03-18 00:57:47',2,13,'4','test2',1,''),(6,'2014-03-18 01:17:33',2,8,'1','Dinner Party',1,''),(7,'2014-03-18 01:19:23',2,9,'1','Italian',1,''),(8,'2014-03-18 01:19:46',2,10,'1','Entree',1,''),(11,'2014-03-18 01:20:46',2,11,'3','Meatballs, Entree, Italian',1,''),(12,'2014-03-18 01:20:50',2,12,'1','Italian <django.db.models.fields.related.ManyRelatedManager object at 0x10fdb6dd0>',1,''),(13,'2014-03-18 03:19:19',2,9,'2','New American',1,''),(14,'2014-03-18 03:20:29',2,10,'2','Entree',1,''),(15,'2014-03-18 03:20:37',2,11,'4','Seared Ahi Tuna with Avocado, Entree, New American',1,''),(18,'2014-03-18 03:34:21',2,11,'5','Seared Ahi Tuna with Avocado, Entree, New American',1,''),(20,'2014-03-18 03:35:33',2,11,'6','tuna, Entree, New American',1,''),(22,'2014-03-18 03:35:50',2,13,'7','Greg_Danko',1,''),(23,'2014-03-18 03:37:10',2,14,'3','Greg_Danko',1,''),(24,'2014-03-18 21:05:58',2,13,'8','Charles_Phan',1,''),(25,'2014-03-18 21:06:23',2,14,'4','Charles_Phan',1,''),(26,'2014-03-18 21:07:18',2,13,'9','Richard_Reddington',1,''),(27,'2014-03-18 21:07:48',2,14,'5','Richard_Reddington',1,''),(28,'2014-03-18 21:08:38',2,13,'10','Loretta_Keller',1,''),(29,'2014-03-18 21:09:03',2,14,'6','Loretta_Keller',1,''),(30,'2014-03-18 21:10:06',2,13,'11','Corey_Lee',1,''),(31,'2014-03-18 21:10:32',2,14,'7','Corey_Lee',1,''),(32,'2014-03-18 21:11:28',2,13,'12','Antonio_Flores_Lopez',1,''),(33,'2014-03-18 21:11:49',2,14,'8','Antonio_Flores_Lopez',1,''),(34,'2014-03-18 21:12:06',2,9,'3','Greek',1,''),(35,'2014-03-18 21:12:21',2,9,'4','Pan-Latin',1,''),(36,'2014-03-18 21:13:09',2,9,'5','French',1,''),(37,'2014-03-18 21:13:18',2,9,'6','Mexican',1,''),(38,'2014-03-18 21:13:26',2,9,'7','Spanish',1,''),(39,'2014-03-18 21:13:38',2,9,'8','Vietnamese',1,''),(40,'2014-03-18 21:13:42',2,9,'9','Chinese',1,''),(41,'2014-03-18 21:13:54',2,9,'10','Japanese',1,''),(42,'2014-03-18 21:15:52',2,9,'11','Peruvian',1,''),(43,'2014-03-18 21:15:59',2,9,'12','Californian',1,''),(44,'2014-03-18 21:16:34',2,13,'13','Desmond_Echavarrie',1,''),(45,'2014-03-18 21:16:56',2,14,'9','Desmond_Echavarrie',1,''),(46,'2014-03-19 17:45:13',2,10,'3','appetizer',1,''),(47,'2014-03-19 17:45:25',2,10,'4','Desert',1,''),(48,'2014-03-19 17:45:33',2,10,'3','Appetizer',2,'Changed name.'),(49,'2014-03-21 01:02:21',16,14,'2','test',2,'Changed restaurant and cuisine.'),(50,'2014-03-22 19:52:08',16,14,'9','Desmond_Echavarrie',2,'Changed cuisine.'),(51,'2014-03-22 19:52:18',16,14,'4','Charles_Phan',2,'Changed cuisine.'),(52,'2014-03-22 19:52:26',16,14,'8','Antonio_Flores_Lopez',2,'Changed cuisine.'),(53,'2014-03-22 19:52:30',16,14,'8','Antonio_Flores_Lopez',2,'No fields changed.'),(54,'2014-03-22 19:52:33',16,14,'7','Corey_Lee',2,'Changed cuisine.'),(55,'2014-03-22 19:52:37',16,14,'7','Corey_Lee',2,'No fields changed.'),(56,'2014-03-22 19:52:41',16,14,'6','Loretta_Keller',2,'Changed cuisine.'),(57,'2014-03-22 19:52:46',16,14,'5','Richard_Reddington',2,'Changed cuisine.'),(58,'2014-03-22 19:52:51',16,14,'4','Charles_Phan',2,'No fields changed.'),(59,'2014-03-22 20:45:55',16,14,'9','Desmond_Echavarrie',2,'No fields changed.'),(60,'2014-03-22 20:51:52',16,14,'10','chef1',1,''),(61,'2014-03-22 21:28:07',16,14,'3','Greg_Danko',3,''),(62,'2014-03-22 21:28:22',16,13,'7','Greg_Danko',3,''),(63,'2014-03-22 21:28:56',16,13,'20','Greg_Danko',1,''),(64,'2014-03-22 21:30:25',16,13,'20','Greg_Danko',3,''),(65,'2014-03-22 21:32:32',16,14,'11','Gary_Danko',1,''),(66,'2014-03-22 21:34:10',16,13,'21','Gary_Danko',2,'Changed is_chef.'),(67,'2014-03-24 04:53:31',16,8,'2','Business Function',1,''),(68,'2014-03-24 04:54:02',16,8,'3','Culinary Lesson',1,''),(69,'2014-03-24 16:33:23',16,14,'5','Richard_Reddington',3,''),(70,'2014-03-24 16:34:33',16,13,'22','Richard_Reddington_1',1,''),(71,'2014-03-24 16:35:07',16,13,'23','new_customer',1,''),(72,'2014-03-24 16:35:47',16,13,'9','Richard_Reddington',3,''),(73,'2014-03-24 20:25:34',16,11,'7','Seared Ahi Tuna, Entree, New American',1,''),(74,'2014-03-24 20:27:14',16,12,'2','New American',1,''),(75,'2014-03-24 20:27:16',16,12,'2','New American',2,'No fields changed.'),(76,'2014-03-24 20:27:33',16,12,'2','New American',2,'Changed dishes.'),(77,'2014-03-24 20:38:25',16,17,'10','new-customer: Dinner Party',1,''),(78,'2014-03-24 20:49:29',16,17,'13','user1: Dinner Party',2,'Changed customer.'),(79,'2014-03-25 20:58:26',16,17,'16','user1: Business Function',3,''),(80,'2014-03-25 20:58:32',16,17,'15','user1: Dinner Party',3,''),(81,'2014-03-25 20:59:08',16,17,'14','Gary_Danko: Dinner Party',3,''),(82,'2014-03-25 20:59:08',16,17,'13','user1: Dinner Party',3,''),(83,'2014-03-25 20:59:08',16,17,'12','Gary_Danko: Dinner Party',3,''),(84,'2014-03-25 20:59:08',16,17,'11','Gary_Danko: Dinner Party',3,''),(85,'2014-03-25 20:59:08',16,17,'10','new-customer: Dinner Party',3,''),(86,'2014-03-25 20:59:08',16,17,'9','test3: Dinner Party',3,''),(87,'2014-03-25 20:59:08',16,17,'8','test3: Dinner Party',3,''),(88,'2014-03-25 20:59:08',16,17,'7','test3: Dinner Party',3,''),(89,'2014-03-25 20:59:08',16,17,'5','test3: Dinner Party',3,''),(90,'2014-03-25 20:59:08',16,17,'4','test3: Dinner Party',3,''),(91,'2014-03-25 20:59:08',16,17,'3','test3: Dinner Party',3,''),(92,'2014-03-25 20:59:08',16,17,'2','test3: Dinner Party',3,''),(93,'2014-03-25 20:59:08',16,17,'1','test3: Dinner Party',3,''),(94,'2014-03-26 06:01:07',16,14,'10','chef1',3,''),(95,'2014-03-26 06:01:07',16,14,'2','test',3,''),(96,'2014-03-26 23:07:46',16,17,'20','user1: Dinner Party',3,''),(97,'2014-03-26 23:07:46',16,17,'19','user1: Business Function',3,''),(98,'2014-03-26 23:07:46',16,17,'18','user1: Dinner Party',3,''),(99,'2014-03-26 23:07:46',16,17,'17','user1: Dinner Party',3,''),(100,'2014-03-27 15:01:16',16,17,'29','user1: Dinner Party',3,''),(101,'2014-03-27 15:01:16',16,17,'28','user1: Culinary Lesson',3,''),(102,'2014-03-27 15:01:16',16,17,'27','user1: Dinner Party',3,''),(103,'2014-03-27 15:01:16',16,17,'26','user1: Dinner Party',3,''),(104,'2014-03-27 15:01:16',16,17,'25','user1: Dinner Party',3,''),(105,'2014-03-27 15:01:16',16,17,'24','user1: Dinner Party',3,''),(106,'2014-03-27 15:01:16',16,17,'23','user1: Dinner Party',3,''),(107,'2014-03-27 15:01:16',16,17,'22','Antonio_Flores_Lopez: Dinner Party',3,''),(108,'2014-03-27 15:01:16',16,17,'21','user1: Dinner Party',3,''),(109,'2014-03-27 16:27:49',16,17,'31','user1: Dinner Party',3,''),(110,'2014-03-27 16:27:49',16,17,'30','user1: Dinner Party',3,''),(111,'2014-03-27 16:29:48',16,17,'32','user1: Dinner Party',3,''),(112,'2014-03-27 16:55:30',16,17,'33','nj-bay: Dinner Party',3,''),(113,'2014-03-27 16:56:33',16,17,'34','user1: Dinner Party',3,''),(114,'2014-03-27 16:57:40',16,17,'35','user1: Dinner Party',3,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'migration history','south','migrationhistory'),(7,'registration profile','registration','registrationprofile'),(8,'event type','food','eventtype'),(9,'cuisine','food','cuisine'),(10,'dish type','food','dishtype'),(11,'dish','food','dish'),(12,'menu','food','menu'),(13,'chefify user','food','chefifyuser'),(14,'chef','food','chef'),(15,'customer','food','customer'),(16,'location','food','location'),(17,'appointments','food','appointments'),(18,'api access','tastypie','apiaccess'),(19,'api key','tastypie','apikey');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1yg9x9n0m331pq970b0wezqq7737ycii','MjhlM2E3NjhjOWMzODExNTkwYzMxNmZiMWVmN2IyNzI1ZGY1Yzg4Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTJ9','2014-04-07 23:58:59'),('7ptz3mcva76ihquje3r9epj0mwoajz0z','MjhlM2E3NjhjOWMzODExNTkwYzMxNmZiMWVmN2IyNzI1ZGY1Yzg4Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTJ9','2014-04-30 21:24:05'),('83at88lfxp80dbg1rbr6x8bbj9ymwowc','NjMxYWMxZmJhMGNlYTU2ZTAwYTA1NTA1ZGJjYTI4YzFhMzVkZmMwNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTd9','2014-04-10 04:58:44'),('al6mgibzuratchiksnbhwyuu6y8eta7z','MjhlM2E3NjhjOWMzODExNTkwYzMxNmZiMWVmN2IyNzI1ZGY1Yzg4Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTJ9','2014-04-10 16:28:48'),('slum8nhsox6yh9cgyd8j1czucmsfxpv3','Y2YwYTI3YjJiMWI4NDc3MDQ0Njg0MTZkYzgyZjQxNzliYzE1YTZmMzp7fQ==','2014-04-10 15:10:59'),('wexdrqphd1och5di7kfi0vne6vmflu1o','NGMwMDIwMzY0ZTdmMTY2YmY4NjZkMDgwNzc1ZjQ5MTAwZGVkM2E0Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MjF9','2014-04-05 21:59:23'),('x43a9xfi1pgxbq7yfzfdr2hoyxvg8c85','MjhlM2E3NjhjOWMzODExNTkwYzMxNmZiMWVmN2IyNzI1ZGY1Yzg4Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTJ9','2014-04-10 21:59:04');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_appointments`
--

DROP TABLE IF EXISTS `food_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_appointments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chef_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `ratings` int(10) unsigned DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `number_of_guests` smallint(5) unsigned NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `has_menu` tinyint(1) NOT NULL,
  `menu_id` int(11),
  `location_id` int(11),
  `status` char(2) NOT NULL DEFAULT 'PE',
  PRIMARY KEY (`id`),
  KEY `food_appointments_c29cbfcd` (`chef_id`),
  KEY `food_appointments_09847825` (`customer_id`),
  KEY `food_appointments_3120f0b2` (`event_type_id`),
  KEY `food_appointments_08fd5523` (`menu_id`),
  KEY `food_appointments_afbb987d` (`location_id`),
  CONSTRAINT `chef_id_refs_id_16d2ecd1` FOREIGN KEY (`chef_id`) REFERENCES `food_chef` (`id`),
  CONSTRAINT `customer_id_refs_id_9daa2201` FOREIGN KEY (`customer_id`) REFERENCES `food_customer` (`id`),
  CONSTRAINT `event_type_id_refs_id_4be451e4` FOREIGN KEY (`event_type_id`) REFERENCES `food_eventtype` (`id`),
  CONSTRAINT `location_id_refs_id_0ed771fb` FOREIGN KEY (`location_id`) REFERENCES `food_location` (`id`),
  CONSTRAINT `menu_id_refs_id_90294e5b` FOREIGN KEY (`menu_id`) REFERENCES `food_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_appointments`
--

LOCK TABLES `food_appointments` WRITE;
/*!40000 ALTER TABLE `food_appointments` DISABLE KEYS */;
INSERT INTO `food_appointments` VALUES (36,8,13,NULL,'2014-02-27 08:00:00','2014-02-28 08:00:00',7,1,0,NULL,NULL,'PE'),(37,8,13,NULL,'2014-02-27 08:00:00','2014-02-28 08:00:00',7,1,0,NULL,NULL,'PE'),(38,8,14,NULL,'2014-02-27 08:00:00','2014-02-28 08:00:00',7,1,0,NULL,NULL,'PE'),(39,8,14,NULL,'2014-02-27 08:00:00','2014-02-28 08:00:00',7,1,0,NULL,NULL,'PE');
/*!40000 ALTER TABLE `food_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_chef`
--

DROP TABLE IF EXISTS `food_chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_chef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chefify_user_id` int(11) NOT NULL,
  `price_minimum` decimal(8,2) DEFAULT NULL,
  `price_maximum` decimal(8,2) DEFAULT NULL,
  `has_equipment` tinyint(1) NOT NULL,
  `equipment_charge` int(10) unsigned NOT NULL,
  `travel_radius` int(10) unsigned NOT NULL,
  `restaurant` varchar(100),
  PRIMARY KEY (`id`),
  UNIQUE KEY `chefify_user_id` (`chefify_user_id`),
  CONSTRAINT `chefify_user_id_refs_id_2862ba1b` FOREIGN KEY (`chefify_user_id`) REFERENCES `food_chefifyuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_chef`
--

LOCK TABLES `food_chef` WRITE;
/*!40000 ALTER TABLE `food_chef` DISABLE KEYS */;
INSERT INTO `food_chef` VALUES (4,8,500.00,0.00,0,30,30,'The Slanted Door'),(6,10,200.00,0.00,0,20,50,' COCO500'),(7,11,700.00,0.00,0,50,30,' Benu'),(8,12,400.00,0.00,0,40,40,'Cascal'),(9,13,1000.00,0.00,0,70,60,'French Laundry'),(11,21,700.00,0.00,0,15,30,'French Laundry');
/*!40000 ALTER TABLE `food_chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_chef_cuisine`
--

DROP TABLE IF EXISTS `food_chef_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_chef_cuisine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chef_id` int(11) NOT NULL,
  `cuisine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `food_chef_cuisine_chef_id_3e3c3e34d93fae1a_uniq` (`chef_id`,`cuisine_id`),
  KEY `food_chef_cuisine_c29cbfcd` (`chef_id`),
  KEY `food_chef_cuisine_9b2448f6` (`cuisine_id`),
  CONSTRAINT `chef_id_refs_id_8b243e24` FOREIGN KEY (`chef_id`) REFERENCES `food_chef` (`id`),
  CONSTRAINT `cuisine_id_refs_id_3bf6c15c` FOREIGN KEY (`cuisine_id`) REFERENCES `food_cuisine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_chef_cuisine`
--

LOCK TABLES `food_chef_cuisine` WRITE;
/*!40000 ALTER TABLE `food_chef_cuisine` DISABLE KEYS */;
INSERT INTO `food_chef_cuisine` VALUES (10,4,8),(8,6,1),(7,7,2),(5,8,1),(11,9,4),(13,11,2);
/*!40000 ALTER TABLE `food_chef_cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_chefifyuser`
--

DROP TABLE IF EXISTS `food_chefifyuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_chefifyuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `is_chef` tinyint(1) NOT NULL,
  `location_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `food_chefifyuser_08fd5523` (`menu_id`),
  KEY `food_chefifyuser_afbb987d` (`location_id`),
  CONSTRAINT `location_id_refs_id_c206a21b` FOREIGN KEY (`location_id`) REFERENCES `food_location` (`id`),
  CONSTRAINT `menu_id_refs_id_f60b2fff` FOREIGN KEY (`menu_id`) REFERENCES `food_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_chefifyuser`
--

LOCK TABLES `food_chefifyuser` WRITE;
/*!40000 ALTER TABLE `food_chefifyuser` DISABLE KEYS */;
INSERT INTO `food_chefifyuser` VALUES (2,'pbkdf2_sha256$12000$utEWQp0YL9Yx$V3lTuPIAJlK4SyUjB91tpnJtNx4Z9Duwwq4VOhWIBzs=','2014-03-21 01:02:43',1,'test','Awesome','Chef','awesome@chef.com',1,1,'2014-03-18 00:05:30',NULL,1,NULL),(3,'test','2014-03-18 00:07:13',0,'new-customer','New','Customer','',0,1,'2014-03-18 00:07:13',NULL,0,NULL),(4,'test','2014-03-18 00:57:30',0,'test2','','','',0,1,'2014-03-18 00:57:30',NULL,0,NULL),(6,'pbkdf2_sha256$12000$B1TWqZmf3pI0$ERIypgdn6DhD9qjVYWhVcsPt8UpxAf1+fHH3F4OgXUE=','2014-03-18 01:06:43',0,'test3','','','test@test.com',0,1,'2014-03-18 01:04:22',NULL,0,NULL),(8,'Charles_Phan','2014-03-18 21:05:01',0,'Charles_Phan','Charles','Phan','Charles_Phan@gmail.com',0,1,'2014-03-18 21:05:01',NULL,1,NULL),(10,'Loretta_Keller','2014-03-18 21:08:02',0,'Loretta_Keller','Loretta','Keller','Loretta_Keller@gmail.com',0,1,'2014-03-18 21:08:02',NULL,1,NULL),(11,'Corey_Lee ','2014-03-18 21:09:16',0,'Corey_Lee','Corey','Lee','Corey_Lee@gmail.com',0,1,'2014-03-18 21:09:16',NULL,1,NULL),(12,'pbkdf2_sha256$12000$ujsUXPllgaEO$8MsLm8+CxRfpqxHcuwBbRieC5E+IDH4fkmTIvSICuT4=','2014-04-16 21:24:05',0,'Antonio_Flores_Lopez','Antonio Flores','Lopez','Antonio_Flores_Lopez@gmail.com',0,1,'2014-03-18 21:10:44',NULL,1,NULL),(13,'Desmond_Echavarrie','2014-03-18 21:16:10',0,'Desmond_Echavarrie','Desmond','Echavarrie','Desmond_Echavarrie@gmail.com',0,1,'2014-03-18 21:16:10',NULL,1,NULL),(14,'pbkdf2_sha256$12000$cDF9Ap7VyTYc$wFPfSCFEGoclFEQAM2swcZkdiCWxavhkThI04Jv4wGU=','2014-03-20 00:51:04',0,'test4','','','nealshultz@sda.gsf',0,1,'2014-03-20 00:51:04',NULL,0,NULL),(15,'pbkdf2_sha256$12000$2Aj1q2Tmbt3V$JUSsNNDZFUGKErfcURUCByJlmqDa//jIEahPPzUljmk=','2014-03-20 23:25:19',0,'test5','','','test5@sda.gsf',0,1,'2014-03-20 21:09:57',NULL,0,NULL),(16,'pbkdf2_sha256$12000$WFzOVAcnF5t2$h5OMru74lYjn/0dSynbDYPEkMmR5E+7ssuZk30VPTU8=','2014-03-27 17:03:50',1,'nj-bay','','','neal.jacob.415@gmail.com',1,1,'2014-03-20 21:20:59',NULL,0,NULL),(17,'pbkdf2_sha256$12000$b2N7fjAp6qGh$UhtMcC7zsLST4FFmk/QoBkkHwAZvFZtOo7gjLPmAFAg=','2014-03-27 21:53:06',0,'user1','','','user1@sda.gsf',0,1,'2014-03-22 20:50:33',NULL,0,NULL),(18,'pbkdf2_sha256$12000$vPdCbNy5Xom5$Gx0J0+db3GJsSQHWImbMhjA4TWeNqtRrC8KagfC4RMk=','2014-03-22 20:55:21',0,'chef1','','','chef1@sda.gsf',0,1,'2014-03-22 20:51:10',NULL,1,NULL),(21,'pbkdf2_sha256$12000$t39aUgJn1SjS$c0jJDjn/4Ce3mnpgXL6euVWObAObkcuOcv1bmy7FFZ0=','2014-03-24 16:45:01',0,'Gary_Danko','','','Gary_Danko@sda.gsf',0,1,'2014-03-22 21:30:58',NULL,1,NULL),(22,'Richard_Reddington','2014-03-24 16:33:27',0,'Richard_Reddington_1','Richard','Reddington','Richard_Reddington@gmail.com',0,1,'2014-03-24 16:33:27',NULL,1,NULL),(23,'new_customer','2014-03-24 16:34:37',0,'new_customer','new_','customer','new_customer@gmail.com',0,1,'2014-03-24 16:34:37',NULL,0,NULL),(25,'pbkdf2_sha256$12000$KOG5DothmNyF$SWdeb1yYeam59gu9eQexC6PX4eQLR5tAckPTyJ9qiSQ=','2014-03-24 16:44:15',0,'new_customer_1','','','new_customer@gmail.copm',0,1,'2014-03-24 16:44:14',NULL,0,NULL);
/*!40000 ALTER TABLE `food_chefifyuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_chefifyuser_groups`
--

DROP TABLE IF EXISTS `food_chefifyuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_chefifyuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chefifyuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `food_chefifyuser_groups_chefifyuser_id_275248689ef0275c_uniq` (`chefifyuser_id`,`group_id`),
  KEY `food_chefifyuser_groups_55f855e0` (`chefifyuser_id`),
  KEY `food_chefifyuser_groups_5f412f9a` (`group_id`),
  CONSTRAINT `chefifyuser_id_refs_id_75da9527` FOREIGN KEY (`chefifyuser_id`) REFERENCES `food_chefifyuser` (`id`),
  CONSTRAINT `group_id_refs_id_8c04070e` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_chefifyuser_groups`
--

LOCK TABLES `food_chefifyuser_groups` WRITE;
/*!40000 ALTER TABLE `food_chefifyuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_chefifyuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_chefifyuser_user_permissions`
--

DROP TABLE IF EXISTS `food_chefifyuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_chefifyuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chefifyuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `food_chefifyuser_user_perm_chefifyuser_id_68bbe167e88be039_uniq` (`chefifyuser_id`,`permission_id`),
  KEY `food_chefifyuser_user_permissions_55f855e0` (`chefifyuser_id`),
  KEY `food_chefifyuser_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `chefifyuser_id_refs_id_6e46c5cd` FOREIGN KEY (`chefifyuser_id`) REFERENCES `food_chefifyuser` (`id`),
  CONSTRAINT `permission_id_refs_id_f3c60e1a` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_chefifyuser_user_permissions`
--

LOCK TABLES `food_chefifyuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `food_chefifyuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_chefifyuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_cuisine`
--

DROP TABLE IF EXISTS `food_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_cuisine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_cuisine`
--

LOCK TABLES `food_cuisine` WRITE;
/*!40000 ALTER TABLE `food_cuisine` DISABLE KEYS */;
INSERT INTO `food_cuisine` VALUES (1,'Italian'),(2,'New American'),(3,'Greek'),(4,'Pan-Latin'),(5,'French'),(6,'Mexican'),(7,'Spanish'),(8,'Vietnamese'),(9,'Chinese'),(10,'Japanese'),(11,'Peruvian'),(12,'Californian');
/*!40000 ALTER TABLE `food_cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_customer`
--

DROP TABLE IF EXISTS `food_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chefify_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chefify_user_id` (`chefify_user_id`),
  CONSTRAINT `chefify_user_id_refs_id_1eac03c0` FOREIGN KEY (`chefify_user_id`) REFERENCES `food_chefifyuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_customer`
--

LOCK TABLES `food_customer` WRITE;
/*!40000 ALTER TABLE `food_customer` DISABLE KEYS */;
INSERT INTO `food_customer` VALUES (1,3),(2,4),(3,6),(5,8),(7,10),(8,11),(9,12),(10,13),(11,14),(12,15),(13,16),(14,17),(15,18),(17,21),(18,22),(19,23),(20,25);
/*!40000 ALTER TABLE `food_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_dish`
--

DROP TABLE IF EXISTS `food_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type_id` int(11) NOT NULL,
  `cuisine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_dish_403d8ff3` (`type_id`),
  KEY `food_dish_9b2448f6` (`cuisine_id`),
  CONSTRAINT `cuisine_id_refs_id_9085403b` FOREIGN KEY (`cuisine_id`) REFERENCES `food_cuisine` (`id`),
  CONSTRAINT `type_id_refs_id_dfb89e2f` FOREIGN KEY (`type_id`) REFERENCES `food_dishtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_dish`
--

LOCK TABLES `food_dish` WRITE;
/*!40000 ALTER TABLE `food_dish` DISABLE KEYS */;
INSERT INTO `food_dish` VALUES (3,'Meatballs',1,1),(4,'Seared Ahi Tuna with Avocado',2,2),(5,'Seared Ahi Tuna with Avocado',2,2),(6,'tuna',2,2),(7,'Seared Ahi Tuna',1,2);
/*!40000 ALTER TABLE `food_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_dishtype`
--

DROP TABLE IF EXISTS `food_dishtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_dishtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_dishtype`
--

LOCK TABLES `food_dishtype` WRITE;
/*!40000 ALTER TABLE `food_dishtype` DISABLE KEYS */;
INSERT INTO `food_dishtype` VALUES (1,'Entree'),(2,'Entree'),(3,'Appetizer'),(4,'Desert');
/*!40000 ALTER TABLE `food_dishtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_eventtype`
--

DROP TABLE IF EXISTS `food_eventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_eventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_eventtype`
--

LOCK TABLES `food_eventtype` WRITE;
/*!40000 ALTER TABLE `food_eventtype` DISABLE KEYS */;
INSERT INTO `food_eventtype` VALUES (1,'Dinner Party'),(2,'Business Function'),(3,'Culinary Lesson');
/*!40000 ALTER TABLE `food_eventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_location`
--

DROP TABLE IF EXISTS `food_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip_code` varchar(100) NOT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_location`
--

LOCK TABLES `food_location` WRITE;
/*!40000 ALTER TABLE `food_location` DISABLE KEYS */;
INSERT INTO `food_location` VALUES (1,'225 bush','san francisco','california','94101',NULL,NULL),(2,'225 Bush street','San Francisco','CA','94104',NULL,NULL),(3,'234 4th st','san francisco','ca','94103',NULL,NULL);
/*!40000 ALTER TABLE `food_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_menu`
--

DROP TABLE IF EXISTS `food_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuisine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_menu_9b2448f6` (`cuisine_id`),
  CONSTRAINT `cuisine_id_refs_id_dc776513` FOREIGN KEY (`cuisine_id`) REFERENCES `food_cuisine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_menu`
--

LOCK TABLES `food_menu` WRITE;
/*!40000 ALTER TABLE `food_menu` DISABLE KEYS */;
INSERT INTO `food_menu` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `food_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_menu_dishes`
--

DROP TABLE IF EXISTS `food_menu_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_menu_dishes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `food_menu_dishes_menu_id_18a89ef38901400e_uniq` (`menu_id`,`dish_id`),
  KEY `food_menu_dishes_08fd5523` (`menu_id`),
  KEY `food_menu_dishes_5c7eddd5` (`dish_id`),
  CONSTRAINT `dish_id_refs_id_d9304b6e` FOREIGN KEY (`dish_id`) REFERENCES `food_dish` (`id`),
  CONSTRAINT `menu_id_refs_id_7c1a3a1d` FOREIGN KEY (`menu_id`) REFERENCES `food_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_menu_dishes`
--

LOCK TABLES `food_menu_dishes` WRITE;
/*!40000 ALTER TABLE `food_menu_dishes` DISABLE KEYS */;
INSERT INTO `food_menu_dishes` VALUES (1,1,3),(4,2,7);
/*!40000 ALTER TABLE `food_menu_dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'food','0001_initial','2014-03-18 00:03:31'),(2,'tastypie','0001_initial','2014-03-18 00:03:31'),(3,'tastypie','0002_add_apikey_index','2014-03-18 00:03:31'),(4,'food','0002_auto__add_field_chef_name','2014-03-18 03:15:15'),(5,'food','0003_auto__del_field_chef_name__add_field_chef_restaurant','2014-03-18 03:16:35'),(6,'food','0004_auto','2014-03-18 21:52:05'),(7,'food','0005_auto__chg_field_appointments_menu','2014-03-19 22:36:08'),(8,'food','0006_auto__chg_field_appointments_location','2014-03-19 22:37:28'),(9,'food','0007_auto__chg_field_appointments_status','2014-03-22 18:54:16'),(10,'food','0008_auto__add_field_chefifyuser_is_chef','2014-03-22 21:13:03'),(11,'food','0009_auto__del_field_appointments_status','2014-03-22 22:11:36'),(12,'food','0010_auto__add_field_appointments_status','2014-03-22 22:12:06'),(13,'food','0011_auto__add_field_chefifyuser_location','2014-03-26 22:26:09');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apiaccess`
--

DROP TABLE IF EXISTS `tastypie_apiaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apiaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `request_method` varchar(10) NOT NULL,
  `accessed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apiaccess`
--

LOCK TABLES `tastypie_apiaccess` WRITE;
/*!40000 ALTER TABLE `tastypie_apiaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apiaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apikey`
--

DROP TABLE IF EXISTS `tastypie_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_dfaa5127` FOREIGN KEY (`user_id`) REFERENCES `food_chefifyuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apikey`
--

LOCK TABLES `tastypie_apikey` WRITE;
/*!40000 ALTER TABLE `tastypie_apikey` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apikey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-15 12:30:48
