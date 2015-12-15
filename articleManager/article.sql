-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: article
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `accounts_article`
--

DROP TABLE IF EXISTS `accounts_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style_id` int(11) NOT NULL,
  `updata` date NOT NULL,
  `keywords` varchar(20) NOT NULL,
  `power` varchar(20) NOT NULL,
  `author` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_article_style_id_4e3823e1_fk_accounts_styles_id` (`style_id`),
  CONSTRAINT `accounts_article_style_id_4e3823e1_fk_accounts_styles_id` FOREIGN KEY (`style_id`) REFERENCES `accounts_styles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_article`
--

LOCK TABLES `accounts_article` WRITE;
/*!40000 ALTER TABLE `accounts_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_styles`
--

DROP TABLE IF EXISTS `accounts_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_styles_parent_id_7af37132_fk_accounts_styles_id` (`parent_id`),
  CONSTRAINT `accounts_styles_parent_id_7af37132_fk_accounts_styles_id` FOREIGN KEY (`parent_id`) REFERENCES `accounts_styles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_styles`
--

LOCK TABLES `accounts_styles` WRITE;
/*!40000 ALTER TABLE `accounts_styles` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_styles` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add author',7,'add_author'),(20,'Can change author',7,'change_author'),(21,'Can delete author',7,'delete_author'),(22,'Can add book',8,'add_book'),(23,'Can change book',8,'change_book'),(24,'Can delete book',8,'delete_book'),(25,'Can add styles',11,'add_styles'),(26,'Can change styles',11,'change_styles'),(27,'Can delete styles',11,'delete_styles'),(28,'Can add article',10,'add_article'),(29,'Can change article',10,'change_article'),(30,'Can delete article',10,'delete_article'),(31,'Can add account',9,'add_account'),(32,'Can change account',9,'change_account'),(33,'Can delete account',9,'delete_account'),(34,'Can add styles',12,'add_styles'),(35,'Can change styles',12,'change_styles'),(36,'Can delete styles',12,'delete_styles'),(37,'Can add article',13,'add_article'),(38,'Can change article',13,'change_article'),(39,'Can delete article',13,'delete_article');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$LZXBPnGUO9UZ$H/VqvzwULDYq/hEBq0D75VXiSgbCBCKl6+AsclbtikA=','2015-11-05 12:36:21',1,'zt','','','13100962837@163.com',1,1,'2015-11-03 05:00:52'),(2,'pbkdf2_sha256$20000$Qrkch2rXMfsg$SK54V+r7SJzTWV4fZE0lP9ZyDmrHmRVCqHIofdf5Yug=','2015-11-05 04:24:59',0,'yujie','','','yujie063@126.com',0,1,'2015-11-03 14:10:05'),(3,'pbkdf2_sha256$20000$Dx4xsH7H06RK$v5hVWdUeFZ/5Cy4mlr8MvhsXfcuRT4mME2+Q1fvyjdI=',NULL,0,'张三','','','1716182579@qq.com',0,1,'2015-11-03 15:14:05'),(4,'pbkdf2_sha256$20000$yTswGCv6FEUa$/7hkxU6iFOzrsCSmvl5duOQebtv1DDKELJo5VXCO+8M=',NULL,0,'李四','','','1234@123.com',0,1,'2015-11-03 15:23:13'),(5,'pbkdf2_sha256$20000$Xgt3Ln0XK3V4$vQ8WGPR4hTCJQFS7FGabGbyOYtufinCqHIMe4/bMFLM=',NULL,0,'王五','','','1321@789.com',0,1,'2015-11-03 15:41:12'),(8,'pbkdf2_sha256$20000$pJG5cFLMsMYF$HOnRLNSGX5+NH6pdTktfif14jL0FdOvu8olcwe4EgXU=',NULL,0,'郑兴','','','1716182579@qq.com',0,1,'2015-11-04 07:07:54'),(9,'pbkdf2_sha256$20000$WLmSOvJjMYOp$NMBvOnnctXwtNVm+wz+mLgAXadeNN7SYEjIU7AELLoQ=',NULL,0,'小爽','','','1716182579@qq.com',0,1,'2015-11-04 09:30:11'),(10,'pbkdf2_sha256$20000$5S3N84S5n6Fg$3KBbxvYuQ+mlrN5fpF/BuZZ2EVvfNOwtsWwiYrZ4umU=','2015-11-05 13:08:21',0,'王阳明','','','187956347666@126.com',0,1,'2015-11-05 12:32:56'),(11,'pbkdf2_sha256$20000$YL4cn8zjOC0i$JNvPP+xCb2dpbgYVqyJy4y3IzjWWJyT4sDLfX/xG55E=','2015-11-05 12:38:38',0,'杨悦','','','18967567887@163.com',0,1,'2015-11-05 12:38:16');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-11-03 14:52:20','000','read me',1,'',11,1),(2,'2015-11-03 14:53:37','1','Article object',1,'',10,1),(3,'2015-11-03 14:54:12','1','yujie',1,'',9,1),(4,'2015-11-03 15:13:00','1','yujie',2,'No fields changed.',9,1),(5,'2015-11-03 15:35:56','1','yujie',1,'',9,1),(6,'2015-11-03 15:36:03','2','zt',1,'',9,1),(7,'2015-11-03 15:36:10','3','张三',1,'',9,1),(8,'2015-11-03 15:36:18','4','李四',1,'',9,1),(9,'2015-11-03 15:45:28','000','ROOT',1,'',11,1),(10,'2015-11-03 15:45:54','100','Word',1,'',11,1),(11,'2015-11-04 09:14:21','2','zt',2,'No fields changed.',9,1),(12,'2015-11-04 09:19:40','1','yujie',2,'Changed Favicon.',9,1),(13,'2015-11-04 13:58:05','200','PDF',1,'',11,1),(14,'2015-11-04 14:48:59','1','1',1,'',9,1),(15,'2015-11-04 14:49:05','1','yujie',2,'Changed user.',9,1),(16,'2015-11-04 14:49:09','1','zt',2,'Changed user.',9,1),(17,'2015-11-04 14:49:14','1','小爽',2,'Changed user.',9,1),(18,'2015-11-04 14:49:18','1','张三',2,'Changed user.',9,1),(19,'2015-11-04 14:49:22','1','李四',2,'Changed user.',9,1),(20,'2015-11-04 14:49:25','1','王五',2,'Changed user.',9,1),(21,'2015-11-04 14:49:29','1','郑兴',2,'Changed user.',9,1),(22,'2015-11-04 14:50:16','000','root',1,'',11,1),(23,'2015-11-04 14:51:14','1','Article object',1,'',10,1),(24,'2015-11-04 14:52:11','1','郑兴',2,'Changed articles.',9,1),(25,'2015-11-04 14:52:23','2','1',1,'',9,1),(26,'2015-11-04 14:52:29','3','yujie',1,'',9,1),(27,'2015-11-04 14:52:38','4','zt',1,'',9,1),(28,'2015-11-04 14:52:46','5','小爽',1,'',9,1),(29,'2015-11-04 14:52:53','6','张三',1,'',9,1),(30,'2015-11-04 14:53:00','7','李四',1,'',9,1),(31,'2015-11-04 14:53:07','8','王五',1,'',9,1),(32,'2015-11-04 14:53:46','200','PDF',1,'',11,1),(33,'2015-11-04 14:54:07','2','Article object',1,'',10,1),(34,'2015-11-04 14:55:00','4','zt',2,'Changed articles.',9,1),(35,'2015-11-05 08:29:42','16','Article object',3,'',10,1),(36,'2015-11-05 08:29:46','13','Article object',3,'',10,1),(37,'2015-11-05 08:29:50','12','Article object',3,'',10,1),(38,'2015-11-05 08:29:54','11','Article object',3,'',10,1),(39,'2015-11-05 08:29:58','10','Article object',3,'',10,1),(40,'2015-11-05 08:30:02','9','Article object',3,'',10,1),(41,'2015-11-05 08:30:06','8','Article object',3,'',10,1),(42,'2015-11-05 08:30:09','7','Article object',3,'',10,1),(43,'2015-11-05 08:30:12','5','Article object',3,'',10,1),(44,'2015-11-05 08:30:16','6','Article object',3,'',10,1),(45,'2015-11-05 08:30:20','4','Article object',3,'',10,1),(46,'2015-11-05 08:30:23','3','Article object',3,'',10,1),(47,'2015-11-05 08:30:26','1','Article object',3,'',10,1),(48,'2015-11-05 08:30:40','2','1',3,'',9,1),(49,'2015-11-05 08:30:55','6','1',3,'',4,1),(50,'2015-11-05 09:32:18','1','yujie',1,'',9,1),(51,'2015-11-05 09:32:22','2','zt',1,'',9,1),(52,'2015-11-05 09:32:25','3','小爽',1,'',9,1),(53,'2015-11-05 09:32:28','4','张三',1,'',9,1),(54,'2015-11-05 09:32:33','5','李四',1,'',9,1),(55,'2015-11-05 09:32:37','6','王五',1,'',9,1),(56,'2015-11-05 09:32:41','7','郑兴',1,'',9,1),(57,'2015-11-05 09:35:54','000','ROOT',1,'',11,1),(58,'2015-11-05 09:36:13','200','PDF',1,'',11,1),(59,'2015-11-05 12:36:47','8','王阳明',1,'',9,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (13,'accounts','article'),(12,'accounts','styles'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'loginORreg','account'),(10,'loginORreg','article'),(11,'loginORreg','styles'),(7,'myBook','author'),(8,'myBook','book'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-11-03 05:00:13'),(2,'auth','0001_initial','2015-11-03 05:00:14'),(3,'admin','0001_initial','2015-11-03 05:00:14'),(4,'contenttypes','0002_remove_content_type_name','2015-11-03 05:00:14'),(5,'auth','0002_alter_permission_name_max_length','2015-11-03 05:00:14'),(6,'auth','0003_alter_user_email_max_length','2015-11-03 05:00:14'),(7,'auth','0004_alter_user_username_opts','2015-11-03 05:00:15'),(8,'auth','0005_alter_user_last_login_null','2015-11-03 05:00:15'),(9,'auth','0006_require_contenttypes_0002','2015-11-03 05:00:15'),(10,'sessions','0001_initial','2015-11-03 05:00:15');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('dhiqeyuz39kar0ua1ekm3y2x4hzj27vq','OTliODdmMjY1NmE5M2MxZjc5MWM3MjQ5NDA3NzI3NzI1M2Y1MWU5Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4MTkyYWQxZGE5ODA2ZTZjMTVjYzI4Mzg5ZDljNDJmMGNkNTE5OWIiLCJfYXV0aF91c2VyX2lkIjoiMTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2015-11-19 13:08:21'),('ob18h3cmjbtq40ppdjdt8adsyrpeiigc','YzM3NmVkYTUzY2VlYTI2ODQyOTZlMjBkZTBjZGI4MzU2YTg2MjllNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQyYjc5ZTRlNjM3YjFjNmU5NjdmOTc3ODE5MTE1ODE1ODRjYjNhMDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-11-17 14:11:47'),('x4llhpq825kporl3b2xzd4gk7vpi9zbh','ZmQ3ZGI4YjU4M2JjMzA3NGEzNGNiY2M2NWQxMmIxZTJmOTMyMmI2NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhZWVmYWU2NjE2NjdiYTFjMzE0ZGMxY2IwN2Y0OGYwYjEwOWRhMWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2015-11-18 11:48:35');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginorreg_account`
--

DROP TABLE IF EXISTS `loginorreg_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginorreg_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nichname` varchar(60) DEFAULT NULL,
  `Favicon` varchar(100) DEFAULT NULL,
  `intristing` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `loginORreg_account_user_id_3562ee09_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginorreg_account`
--

LOCK TABLES `loginorreg_account` WRITE;
/*!40000 ALTER TABLE `loginorreg_account` DISABLE KEYS */;
INSERT INTO `loginorreg_account` VALUES (1,2,'','',''),(2,1,'','',''),(3,9,'','',''),(4,3,'','',''),(5,4,'','',''),(6,5,'','',''),(7,8,'','',''),(8,10,'','',''),(9,11,'','','');
/*!40000 ALTER TABLE `loginorreg_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginorreg_account_articles`
--

DROP TABLE IF EXISTS `loginorreg_account_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginorreg_account_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`,`article_id`),
  KEY `loginORreg_account__article_id_41971a44_fk_loginORreg_article_id` (`article_id`),
  CONSTRAINT `loginORreg_account__account_id_24059a6f_fk_loginORreg_account_id` FOREIGN KEY (`account_id`) REFERENCES `loginorreg_account` (`id`),
  CONSTRAINT `loginORreg_account__article_id_41971a44_fk_loginORreg_article_id` FOREIGN KEY (`article_id`) REFERENCES `loginorreg_article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginorreg_account_articles`
--

LOCK TABLES `loginorreg_account_articles` WRITE;
/*!40000 ALTER TABLE `loginorreg_account_articles` DISABLE KEYS */;
INSERT INTO `loginorreg_account_articles` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6);
/*!40000 ALTER TABLE `loginorreg_account_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginorreg_account_friends`
--

DROP TABLE IF EXISTS `loginorreg_account_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginorreg_account_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_account_id` (`from_account_id`,`to_account_id`),
  KEY `loginORreg_accou_to_account_id_45a58f8f_fk_loginORreg_account_id` (`to_account_id`),
  CONSTRAINT `loginORreg_acc_from_account_id_2ba46d90_fk_loginORreg_account_id` FOREIGN KEY (`from_account_id`) REFERENCES `loginorreg_account` (`id`),
  CONSTRAINT `loginORreg_accou_to_account_id_45a58f8f_fk_loginORreg_account_id` FOREIGN KEY (`to_account_id`) REFERENCES `loginorreg_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginorreg_account_friends`
--

LOCK TABLES `loginorreg_account_friends` WRITE;
/*!40000 ALTER TABLE `loginorreg_account_friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `loginorreg_account_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginorreg_article`
--

DROP TABLE IF EXISTS `loginorreg_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginorreg_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) NOT NULL,
  `style_id` varchar(3) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `filey` varchar(100) NOT NULL,
  `keywords1` varchar(20) DEFAULT NULL,
  `keywords2` varchar(20) DEFAULT NULL,
  `keywords3` varchar(20) DEFAULT NULL,
  `power` varchar(20) NOT NULL,
  `author` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loginORreg_article_style_id_5490f0e3_fk_loginORreg_styles_ID` (`style_id`),
  CONSTRAINT `loginORreg_article_style_id_5490f0e3_fk_loginORreg_styles_ID` FOREIGN KEY (`style_id`) REFERENCES `loginorreg_styles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginorreg_article`
--

LOCK TABLES `loginorreg_article` WRITE;
/*!40000 ALTER TABLE `loginorreg_article` DISABLE KEYS */;
INSERT INTO `loginorreg_article` VALUES (1,'软件过程模型','200','2015-11-05 09:36:43','2015-11-05 11:54:10','loginORreg/static/file/20151105173643_97.pdf','软件','模型','课件','10','徐汉川'),(2,'软件架构设计','200','2015-11-05 09:39:04','2015-11-05 11:57:17','loginORreg/static/file/20151105173904_59.pdf','软件工程','架构设计','课件','10','徐汉川'),(3,'基本构架风格','200','2015-11-05 10:49:32','2015-11-05 11:03:43','loginORreg/static/file/20151105184932_18.pdf','课件','架构','安全','10','徐汉川'),(4,'SaaS与云端软件部署','200','2015-11-05 11:55:18','2015-11-05 11:55:32','loginORreg/static/file/20151105195518_82.pdf','软件工程','soos','云','10','徐汉川'),(5,'白盒测试','200','2015-11-05 11:55:54','2015-11-05 11:56:08','loginORreg/static/file/20151105195554_33.pdf','软件工程','白盒测试','课件','10','刘铭'),(6,'代码评审分析与优化','200','2015-11-05 11:56:48','2015-11-05 11:56:56','loginORreg/static/file/20151105195648_100.pdf','软件工程','课件','','10','徐汉川');
/*!40000 ALTER TABLE `loginorreg_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginorreg_styles`
--

DROP TABLE IF EXISTS `loginorreg_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginorreg_styles` (
  `ID` varchar(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `parent_id` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `loginORreg_styles_parent_id_6bf77046_fk_loginORreg_styles_ID` (`parent_id`),
  CONSTRAINT `loginORreg_styles_parent_id_6bf77046_fk_loginORreg_styles_ID` FOREIGN KEY (`parent_id`) REFERENCES `loginorreg_styles` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginorreg_styles`
--

LOCK TABLES `loginorreg_styles` WRITE;
/*!40000 ALTER TABLE `loginorreg_styles` DISABLE KEYS */;
INSERT INTO `loginorreg_styles` VALUES ('000','ROOT',NULL),('200','PDF','000');
/*!40000 ALTER TABLE `loginorreg_styles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-05 22:15:50
