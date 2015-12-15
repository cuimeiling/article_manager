-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: bookDB
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add author',7,'add_author'),(20,'Can change author',7,'change_author'),(21,'Can delete author',7,'delete_author'),(22,'Can add book',8,'add_book'),(23,'Can change book',8,'change_book'),(24,'Can delete book',8,'delete_book'),(25,'Can add styles',9,'add_styles'),(26,'Can change styles',9,'change_styles'),(27,'Can delete styles',9,'delete_styles'),(28,'Can add article',10,'add_article'),(29,'Can change article',10,'change_article'),(30,'Can delete article',10,'delete_article'),(31,'Can add account',11,'add_account'),(32,'Can change account',11,'change_account'),(33,'Can delete account',11,'delete_account'),(34,'Can add link',12,'add_link'),(35,'Can change link',12,'change_link'),(36,'Can delete link',12,'delete_link');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$LZXBPnGUO9UZ$H/VqvzwULDYq/hEBq0D75VXiSgbCBCKl6+AsclbtikA=','2015-11-26 08:35:14',1,'zt','','','13100962837@163.com',1,1,'2015-11-03 05:00:52'),(2,'pbkdf2_sha256$20000$XVXjJdPC4Mbc$uwd6+O3t7FqWsnwleNRLn7mIs5YSFWkTs6OqgGlFHTY=',NULL,0,'于洁','','','123123@163.com',0,1,'2015-11-24 05:11:55'),(3,'pbkdf2_sha256$20000$xI69BxSNILg2$BkSdYZmB/hGtkR9u6F9tdDpQJLLaiTBSSThPz/4xrmo=','2015-11-26 08:37:13',0,'杨悦','','','12312@163.com',0,1,'2015-11-25 06:41:10'),(4,'pbkdf2_sha256$20000$VmXc2jRrbogN$I2LJ0CBov1WYX2AH/QlsZlA3IFz/4v3pFYSolmmrCBg=','2015-11-26 08:45:08',0,'kd','','','kdurant35_cool@126.com',0,1,'2015-11-26 05:33:56'),(5,'pbkdf2_sha256$20000$vwm26dkY1sOZ$uJQ+j3scburQx7bRwI8MsJFkrQ9joikjTrRH+ujXApk=','2015-11-26 08:45:56',0,'qwer','','','123123@163.com',0,1,'2015-11-26 05:39:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-11-23 12:47:53','1','ROOT',1,'',9,1),(2,'2015-11-23 12:48:11','1','zt',1,'',11,1),(3,'2015-11-23 13:15:58','3','Article object',2,'Changed keywords1.',10,1),(4,'2015-11-23 13:16:54','1','Article object',2,'No fields changed.',10,1),(5,'2015-11-23 14:02:37','3','算法/',3,'',9,1),(6,'2015-11-23 14:02:42','5','算法///',3,'',9,1),(7,'2015-11-23 14:02:47','4','算法//',3,'',9,1),(8,'2015-11-23 14:02:52','6','算法////',3,'',9,1),(9,'2015-11-23 14:02:56','7','算法/////',3,'',9,1),(10,'2015-11-23 14:03:00','8','算法//////',3,'',9,1),(11,'2015-11-23 14:03:05','9','算法///////',3,'',9,1),(12,'2015-11-23 14:03:09','10','算法////////',3,'',9,1),(13,'2015-11-23 14:46:08','6','Article object',2,'Changed style.',10,1),(14,'2015-11-24 03:32:50','6','Article object',2,'Changed Title.',10,1),(15,'2015-11-24 03:33:10','5','Article object',2,'Changed Title and text.',10,1),(16,'2015-11-24 03:33:39','4','Article object',2,'Changed Title.',10,1),(17,'2015-11-24 03:34:13','11','project of software',2,'Changed name.',9,1),(18,'2015-11-24 03:34:28','2','Algorithm',2,'Changed name.',9,1),(19,'2015-11-24 03:52:28','11','软件工程',2,'Changed name.',9,1),(20,'2015-11-24 03:52:37','2','算法',2,'Changed name.',9,1),(21,'2015-11-24 03:52:53','6','Article object',2,'Changed Title.',10,1),(22,'2015-11-24 03:53:03','5','Article object',2,'Changed Title.',10,1),(23,'2015-11-24 03:53:12','4','Article object',2,'Changed Title.',10,1),(24,'2015-11-24 05:17:04','1','zt',2,'No fields changed.',11,1),(25,'2015-11-24 05:37:19','8','Article object',3,'',10,1),(26,'2015-11-24 05:37:24','9','Article object',3,'',10,1),(27,'2015-11-24 05:37:38','10','Article object',3,'',10,1),(28,'2015-11-24 05:37:47','11','Article object',3,'',10,1),(29,'2015-11-25 10:24:54','16','杨悦',1,'',9,1),(30,'2015-11-25 10:24:57','15','散文',2,'Changed parent.',9,1),(31,'2015-11-25 10:25:07','16','杨悦',2,'Changed parent.',9,1),(32,'2015-11-25 10:25:17','17','zt',1,'',9,1),(33,'2015-11-25 10:25:27','18','于洁',1,'',9,1),(34,'2015-11-25 10:25:33','18','于洁',2,'Changed parent.',9,1),(35,'2015-11-25 10:25:42','14','人工智能',2,'Changed parent.',9,1),(36,'2015-11-25 10:25:49','13','测试',2,'Changed parent.',9,1),(37,'2015-11-25 10:25:56','12','数理逻辑',2,'Changed parent.',9,1),(38,'2015-11-25 10:26:03','11','软件工程',2,'Changed parent.',9,1),(39,'2015-11-25 10:26:09','2','算法',2,'Changed parent.',9,1),(40,'2015-11-25 11:08:29','19','Article object',3,'',10,1),(41,'2015-11-25 11:17:31','24','Article object',3,'',10,1),(42,'2015-11-25 11:17:41','23','Article object',3,'',10,1),(43,'2015-11-25 11:17:49','22','Article object',3,'',10,1),(44,'2015-11-25 11:17:58','21','Article object',3,'',10,1),(45,'2015-11-25 11:18:09','20','Article object',3,'',10,1),(46,'2015-11-25 11:34:52','26','Article object',3,'',10,1),(47,'2015-11-25 11:35:41','21','word',1,'',9,1),(48,'2015-11-25 11:35:52','27','Article object',2,'Changed style and power.',10,1),(49,'2015-11-26 05:38:41','1','ROOT',1,'',9,1),(50,'2015-11-26 05:40:42','3','kd',1,'',9,1),(51,'2015-11-26 05:40:49','3','kd',2,'Changed parent.',9,1),(52,'2015-11-26 06:23:44','3','zt',1,'',11,1),(53,'2015-11-26 06:23:53','4','杨悦',1,'',11,1),(54,'2015-11-26 06:24:04','5','于洁',1,'',11,1),(55,'2015-11-26 06:24:27','8','zt',1,'',9,1),(56,'2015-11-26 06:24:28','8','zt',2,'No fields changed.',9,1),(57,'2015-11-26 06:24:38','9','于洁',1,'',9,1),(58,'2015-11-26 06:24:50','10','杨悦',1,'',9,1),(59,'2015-11-26 06:25:20','11','Article object',2,'Changed atctype.',10,1),(60,'2015-11-26 06:25:40','10','Article object',2,'Changed atctype.',10,1),(61,'2015-11-26 06:25:48','6','Article object',2,'Changed atctype.',10,1),(62,'2015-11-26 06:25:54','5','Article object',2,'Changed atctype.',10,1),(63,'2015-11-26 06:26:12','4','Article object',2,'Changed atctype.',10,1),(64,'2015-11-26 06:26:18','3','Article object',2,'Changed atctype.',10,1),(65,'2015-11-26 06:26:25','2','Article object',2,'Changed atctype.',10,1),(66,'2015-11-26 06:26:31','1','Article object',2,'Changed atctype.',10,1),(67,'2015-11-26 06:45:49','1','link object',3,'',12,1),(68,'2015-11-26 06:46:00','4','link object',3,'',12,1),(69,'2015-11-26 06:46:03','3','link object',3,'',12,1),(70,'2015-11-26 06:46:12','2','link object',3,'',12,1),(71,'2015-11-26 07:05:22','6','link object',3,'',12,1),(72,'2015-11-26 07:06:25','7','link object',2,'Changed ower.',12,1),(73,'2015-11-26 07:06:27','7','link object',2,'No fields changed.',12,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'loginORreg','account'),(10,'loginORreg','article'),(12,'loginORreg','link'),(9,'loginORreg','styles'),(7,'myBook','author'),(8,'myBook','book'),(6,'sessions','session');
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
INSERT INTO `django_session` VALUES ('21rrtox6jurma0c756d1z3j7qbrytnn6','Mjk3ZjNiZDJkNTc5ZmNkMTY1MTY2MzUwYTFmYjFmYzIxNzE3NjRkYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImMyNzdjMDVlMzBiOTBiYzcyNjk4NTMyNzY0MjViMTA3MjZmZWE5ZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2015-12-10 08:45:56'),('off2hdslvldlj3s76d2d1ma8z3rkbl8f','YzExNDEzZDhiMzVkNzUwNGU1NmE5ZjFjNmZiNzdhMjFiODk2MDVlZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzMTE0OTdmYjYyNDBkMzkzMGUxMmI3OGZlZDAxNmEzMjlmZmM0Y2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-12-08 03:30:37');
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
  `Favicon` longtext,
  `intristing` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `loginORreg_account_user_id_3562ee09_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginorreg_account`
--

LOCK TABLES `loginorreg_account` WRITE;
/*!40000 ALTER TABLE `loginorreg_account` DISABLE KEYS */;
INSERT INTO `loginorreg_account` VALUES (1,4,'','',''),(2,5,'','',''),(3,1,'','',''),(4,3,'','',''),(5,2,'','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginorreg_account_articles`
--

LOCK TABLES `loginorreg_account_articles` WRITE;
/*!40000 ALTER TABLE `loginorreg_account_articles` DISABLE KEYS */;
INSERT INTO `loginorreg_account_articles` VALUES (2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(11,1,11),(12,1,12),(32,2,32),(33,2,33),(14,3,14),(17,3,17),(18,3,18),(19,3,19),(21,3,21),(22,3,22),(23,3,23),(24,3,24),(25,4,25),(26,4,26);
/*!40000 ALTER TABLE `loginorreg_account_articles` ENABLE KEYS */;
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
  `style_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `atctype` varchar(30) NOT NULL,
  `filey` varchar(100) NOT NULL,
  `text` longtext,
  `keywords1` varchar(20) DEFAULT NULL,
  `keywords2` varchar(20) DEFAULT NULL,
  `keywords3` varchar(20) DEFAULT NULL,
  `power` varchar(20) NOT NULL,
  `author` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loginORreg_article_style_id_5490f0e3_fk_loginORreg_styles_id` (`style_id`),
  CONSTRAINT `loginORreg_article_style_id_5490f0e3_fk_loginORreg_styles_id` FOREIGN KEY (`style_id`) REFERENCES `loginorreg_styles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginorreg_article`
--

LOCK TABLES `loginorreg_article` WRITE;
/*!40000 ALTER TABLE `loginorreg_article` DISABLE KEYS */;
INSERT INTO `loginorreg_article` VALUES (2,'马哲辨析题',5,'2015-11-26 05:45:55','2015-11-26 06:26:25','pdf','loginORreg/static/file/20151126134555_53.pdf','/static/file/20151126134555_53.pdf','马哲','辨析题','','10','马克思'),(3,'北京大学数理逻辑',4,'2015-11-26 05:47:42','2015-11-26 08:44:07','pdf','loginORreg/static/file/20151126134742_60.pdf','/static/file/20151126134742_60.pdf','数理逻辑','北京大学','','20','未命名'),(4,'马哲材料题',5,'2015-11-26 05:48:26','2015-11-26 07:16:28','pdf','loginORreg/static/file/20151126134826_50.pdf','/static/file/20151126134826_50.pdf','马哲','材料题','','10','马克思'),(5,'马克思主义基本原理复习资料',5,'2015-11-26 05:48:58','2015-11-26 06:25:54','pdf','loginORreg/static/file/20151126134858_62.pdf','/static/file/20151126134858_62.pdf','马哲','复习资料','','10','马克思'),(6,'马哲简答题',5,'2015-11-26 05:49:21','2015-11-26 06:25:48','pdf','loginORreg/static/file/20151126134921_39.pdf','/static/file/20151126134921_39.pdf','马哲','简答题','','10','马克思'),(7,'贪心算法',6,'2015-11-26 05:56:42','2015-11-26 08:49:03','html','','<p>\r\n	<span style=\"font-size:16px;\"> &nbsp; &nbsp; &nbsp;</span><span style=\"font-size:16px;\">贪心算法（又称贪婪算法）是指，在对问题求解时，总是做出在当前看来是最好的选择。也就是说，不从整体最优上加以考虑，他所做出的是在某种意义上的局部最优解。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\">&nbsp; &nbsp; &nbsp; 贪心算法不是对所有问题都能得到整体最优解，关键是贪心策略的选择，选择的贪心策略必须具备无后效性，即某个状态以前的过程不会影响以后的状态，只与当前状态有关。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"> \r\n	<table style=\"width:100%;\" cellpadding=\"2\" cellspacing=\"0\" border=\"1\" bordercolor=\"#000000\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					中文名\r\n				</td>\r\n				<td>\r\n					贪心算法\r\n				</td>\r\n				<td>\r\n					别称\r\n				</td>\r\n				<td>\r\n					贪婪算法\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					英文名\r\n				</td>\r\n				<td>\r\n					greedy algorithm\r\n				</td>\r\n				<td>\r\n					性质\r\n				</td>\r\n				<td>\r\n					一种改进了的分级处理方法<br />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					核心\r\n				</td>\r\n				<td>\r\n					根据题意选取一种量度标准<br />\r\n				</td>\r\n				<td>\r\n					<br />\r\n				</td>\r\n				<td>\r\n					<br />\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src=\"/static/image/upload/20151126135824_30.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>\r\n<h1>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:32px;\"></span><span style=\"font-size:32px;\">核心</span><span style=\"font-size:32px;\"></span></span> \r\n</h1>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:32px;\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;贪婪算法可解决的问题通常大部分都有如下的特性：</span></span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:32px;\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;⑴随着算法的进行，将积累起其它两个集合：一个包含已经被考虑过并被选出的候选对象，另一个包含已经被考虑过但被丢弃的候选对象。</span></span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:32px;\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;⑵有一个函数来检查一个候选对象的集合是否提供了问题的解答。该函数不考虑此时的解决方法是否最优。</span></span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:32px;\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;⑶还有一个函数检查是否一个候选对象的集合是可行的，也即是否可能往该集合上添加更多的候选对象以获得一个解。和上一个函数一样，此时不考虑解决方法的最优性。</span></span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:32px;\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;⑷选择函数可以指出哪一个剩余的候选对象最有希望构成问题的解。</span></span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:32px;\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;⑸最后，目标函数给出解的值。</span></span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:32px;\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;⑹为了解决问题，需要寻找一个构成解的候选对象集合，它可以优化目标函数，贪婪算法一步一步的进行。起初，算法选出的候选对象的集合为空。接下来的每一步中，根据选择函数，算法从剩余候选对象中选出最有希望构成解的对象。如果集合中加上该对象后不可行，那么该对象就被丢弃并不再考虑；否则就加到集合里。每一次都扩充集合，并检查该集合是否构成解。如果贪婪算法正确工作，那么找到的第一个解通常是最优的。</span><br />\r\n</span></span> \r\n</p>\r\n<h1>\r\n	<span style=\"font-size:32px;\"><span style=\"font-size:32px;\"><span style=\"font-size:32px;\">基本思路</span></span></span> \r\n</h1>\r\n<p>\r\n	<span style=\"font-size:32px;\"><span style=\"font-size:32px;\"><span style=\"font-size:32px;\"></span></span></span> \r\n</p>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:16px;\">&nbsp;&nbsp;1.建立数学模型来描述问题</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:16px;\">&nbsp;&nbsp;⒉把求解的问题分成若干个子问题。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:16px;\">&nbsp;&nbsp;⒊对每一子问题求解，得到子问题的局部最优解。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:16px;\">&nbsp;&nbsp;⒋把子问题的解局部最优解合成原来解问题的一个解。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:16px;\">&nbsp;&nbsp;实现该算法的过程：</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:16px;\">&nbsp;&nbsp;从问题的某一初始解出发；</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:16px;\">&nbsp;&nbsp;while 能朝给定总目标前进一步</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:16px;\">&nbsp;&nbsp;do</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:16px;\">&nbsp;&nbsp;求出</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/52865.htm\"><span style=\"font-size:16px;\">可行解</span></a><span style=\"font-size:16px;\">的一个解元素；</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:16px;\">&nbsp;&nbsp;由所有解</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/2842281.htm\"><span style=\"font-size:16px;\">元素组合</span></a><span style=\"font-size:16px;\">成问题的一个可行解。</span> \r\n</div>\r\n<p style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:16px;\">&nbsp;&nbsp;下面是一个可以试用贪心算法解的题目，贪心解的确不错，可惜不是最优解。</span> \r\n</p>\r\n<h1 style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:24px;\">C++程序</span> \r\n</h1>\r\n<span style=\"font-size:16px;\"></span> \r\n<pre class=\"brush:cpp;\">#define N 8\r\nvoid dfs(int x,int y,int count)\r\n{\r\n    int i,tx,ty;\r\n    if(count&gt;N*N)\r\n    {\r\n        output_solution();//输出一个解\r\n        return;\r\n    }\r\n    for(i=0; i&lt;8; i++)\r\n    {\r\n        tx=hn[i].x;//hn[]保存八个方位子结点\r\n        ty=hn[i].y;\r\n        s[tx][ty]=count;\r\n        dfs(tx,ty,count+1);//递归调用\r\n        s[tx][ty]=0;\r\n    }\r\n}</pre>\r\n<h1>\r\n	实际问题\r\n</h1>\r\n<h2>\r\n	均分纸牌\r\n</h2>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"brush:cpp;\">#include&lt;cstdio&gt;\r\n#include&lt;iostream&gt;\r\n#include&lt;cstdlib&gt;\r\nint a[1000];\r\nusing namespace std;\r\nint f(int n)\r\n{\r\n    int ave=0;\r\n    int f=0;\r\n    for (int i=1;i&lt;=n;i++)\r\n    {\r\n        f=f+a[i];\r\n    }\r\n    return f/n;\r\n}\r\nint main()\r\n{\r\n    int n;\r\n    int ans=0;\r\n    int ave;\r\n    scanf (\"%d\",&amp;n);\r\n    for (int i=1;i&lt;=n;i++)\r\n    {\r\n        scanf (\"%d\",&amp;a[i]);\r\n    }\r\n    ave=f(n);\r\n    for (int i=1;i&lt;=n;i++)\r\n    {\r\n       if (a[i]==ave)\r\n       {\r\n             continue;\r\n       }\r\n       if (a[i]!=ave)\r\n       {\r\n           a[i+1]+=a[i]-ave;\r\n           ans++;\r\n       }\r\n    }\r\n    printf (\"%d\",ans);\r\n    return 0;\r\n}</pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','贪心算法','','','20','未命名'),(8,'动态规划算法',6,'2015-11-26 06:04:14','2015-11-26 07:16:15','html','','<h1>\r\n	<span style=\"font-size:24px;\">一、基本概念</span> \r\n</h1>\r\n<p>\r\n	<span style=\"font-size:16px;\">&nbsp; &nbsp; &nbsp; <span style=\"font-size:18px;\">&nbsp;<span style=\"color:#000000;\">动态规划过程是：每次决策依赖于当前状态，又随即引起状态的转移。一个决策序列就是在变化的状态中产生出来的，所以，这种多阶段最优化决策解决问题的过程就称为动态规划。</span></span></span><span style=\"font-size:18px;\"> </span> \r\n</p>\r\n<hr />\r\n<p>\r\n	<span style=\"font-size:24px;line-height:1.5;\">二、基本思想与策略</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:24px;\"> </span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\">&nbsp; &nbsp; &nbsp; 基本思想与分治法类似，也是将待求解的问题分解为若干个子问题（阶段），按顺序求解子阶段，前一子问题的解，为后一子问题的求解提供了有用的信息。在求解任一子问题时，列出各种可能的局部解，通过决策保留那些有可能达到最优的局部解，丢弃其他局部解。依次解决各子问题，最后一个子问题就是初始问题的解。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\">&nbsp; &nbsp; &nbsp; 由于动态规划解决的问题多数有重叠子问题这个特点，为减少重复计算，对每一个子问题只解一次，将其不同阶段的不同状态保存在一个二维数组中。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\">&nbsp; &nbsp; &nbsp; 与分治法最大的差别是：适合于用动态规划法求解的问题，经分解后得到的子问题往往不是互相独立的<span style=\"color:#E53333;\">（即下一个子阶段的求解是建立在上一个子阶段的解的基础上，进行进一步的求解）</span>。</span> \r\n</p>\r\n<hr />\r\n<p>\r\n	<span style=\"font-size:24px;line-height:1.5;\">三、适用的情况</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:24px;\"> </span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\">能采用动态规划求解的问题的一般要具有3个性质：</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"> &nbsp; &nbsp;(1) 最优化原理：如果问题的最优解所包含的子问题的解也是最优的，就称该问题具有最优子结构，即满足最优化原理。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"> &nbsp; &nbsp;(2) 无后效性：即某阶段状态一旦确定，就不受这个状态以后决策的影响。也就是说，某状态以后的过程不会影响以前的状态，只与当前状态有关。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\">&nbsp; &nbsp;(3)有重叠子问题：即子问题之间是不独立的，一个子问题在下一阶段决策中可能被多次使用到。（<span style=\"color:#E53333;\">该性质并不是动态规划适用的必要条件，但是如果没有这条性质，动态规划算法同其他算法相比就不具备优势</span>）</span> \r\n</p>\r\n<hr />\r\n<h1 style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:24px;color:#000000;\">四、求解的基本步骤</span> \r\n</h1>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	&nbsp;&nbsp; &nbsp;&nbsp;<span class=\"Apple-style-span\" style=\"font-size:medium;\">动态规划所处理的问题是<span class=\"Apple-style-span\" style=\"color:#FF0102;\">一个多阶段决策问题</span>，一般由初始状态开始，通过对中间阶段决策的选择，达到结束状态。这些决策形成了一个决策序列，同时确定了完成整个过程的一条活动路线(通常是求最优的活动路线)。如图所示。动态规划的设计都有着一定的模式，一般要经历以下几个步骤。</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"Apple-style-span\" style=\"color:#FF0102;\">初始状态→│决策１│→│决策２│→…→│决策ｎ│→结束状态</span></span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span class=\"Apple-style-span\" style=\"font-size:small;\">图1 动态规划决策过程示意图</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp;&nbsp; (1)<span class=\"Apple-style-span\" style=\"color:#FF0102;\"><b>划分阶段</b></span>：按照问题的时间或空间特征，把问题分为若干个阶段。在划分阶段时，注意<span class=\"Apple-style-span\" style=\"color:#FF0102;\">划分后的阶段一定要是有序的或者是可排序的</span>，否则问题就无法求解。</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp;&nbsp; (2)<span class=\"Apple-style-span\" style=\"color:#FF0102;\"><b>确定状态和状态变量</b></span>：将问题发展到各个阶段时所处于的各种客观情况用不同的状态表示出来。当然，状态的选择要满足无后效性。</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp;&nbsp; (3)<span class=\"Apple-style-span\" style=\"color:#FF0102;\"><b>确定决策并写出状态转移方程</b></span>：因为决策和状态转移有着天然的联系，<span class=\"Apple-style-span\" style=\"color:#FF0102;\">状态转移就是根据上一阶段的状态和决策来导出本阶段的状态</span>。所以如果确定了决策，状态转移方程也就可写出。但事实上常常是反过来做，<span class=\"Apple-style-span\" style=\"color:#FF0102;\">根据相邻两个阶段的状态之间的关系来确定决策方法和状态转移方程</span>。</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp;&nbsp; (4)<b><span class=\"Apple-style-span\" style=\"color:#FF0102;\">寻找边界条件</span></b>：给出的<span class=\"Apple-style-span\" style=\"color:#000102;\">状态转移方程是一个递推式</span>，需要一个递推的终止条件或边界条件。</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp; &nbsp;一般，只要解决问题的<span class=\"Apple-style-span\" style=\"color:#FF0102;\">阶段</span>、<span class=\"Apple-style-span\" style=\"color:#FF0102;\">状态</span>和<span class=\"Apple-style-span\" style=\"color:#FF0102;\">状态转移决策</span>确定了，就可以写出<span class=\"Apple-style-span\" style=\"color:#FF0102;\">状态转移方程（包括边界条件）。</span></span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">实际应用中可以按以下几个简化的步骤进行设计：</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp; &nbsp;（1）分析最优解的性质，并刻画其结构特征。</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp; &nbsp;（2）递归的定义最优解。</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp; &nbsp;（3）以自底向上或自顶向下的记忆化方式（备忘录法）计算出最优值</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp; &nbsp;（4）根据计算最优值时得到的信息，构造问题的最优解</span> \r\n</p>\r\n<hr />\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"font-size:24px;color:#000000;\">五、算法实现的说明</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp;&nbsp; 动态规划的主要难点在于理论上的设计，也就是上面4个步骤的确定，一旦设计完成，实现部分就会非常简单。</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp; &nbsp; 使用动态规划求解问题，<span class=\"Apple-style-span\" style=\"color:#FF0102;\">最重要的</span>就是<span class=\"Apple-style-span\" style=\"color:#FF0102;\">确定动态规划三要素</span>：</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\"><span class=\"Apple-style-span\" style=\"color:#FF0102;\">&nbsp;&nbsp; &nbsp;（1）问题的阶段 （2）<span class=\"Apple-style-span\" style=\"color:#000000;\"><span class=\"Apple-style-span\" style=\"color:#FF0102;\">每个阶段的状态</span></span></span></span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\"><span class=\"Apple-style-span\" style=\"color:#FF0102;\"><span class=\"Apple-style-span\" style=\"color:#000000;\"><span class=\"Apple-style-span\" style=\"color:#FF0102;\">&nbsp;&nbsp; &nbsp;（3）</span><span class=\"Apple-style-span\" style=\"color:#FF0102;\">从前一个阶段转化到后一个阶段之间的递推关系</span>。</span></span></span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\"><span class=\"Apple-style-span\" style=\"color:#FF0102;\"><span class=\"Apple-style-span\" style=\"color:#000000;\">&nbsp;&nbsp; &nbsp; 递推关系必须是从次小的问题开始到较大的问题之间的转化，从这个角度来说，动态规划往往可以用递归程序来实现，不过<span class=\"Apple-style-span\" style=\"color:#FF0102;\">因为递推可以充分利用前面保存的子问题的解来减少重复计算，所以对于大规模问题来说，有递归不可比拟的优势，这也是动态规划算法的核心之处</span>。</span></span></span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp; &nbsp;确定了动态规划的这三要素，<span class=\"Apple-style-span\" style=\"color:#FF0102;\">整个求解过程就可以用一个最优决策表来描述</span>，<span class=\"Apple-style-span\" style=\"color:#FF0102;\">最优决策表是一个二维表，其中行表示决策的阶段，列表示问题状态</span>，表格需要<span class=\"Apple-style-span\" style=\"color:#FF0102;\">填写的数据一般对应此问题的在某个阶段某个状态下的最优值</span>（如最短路径，最长公共子序列，最大价值等），填表的过程就是根据递推关系，从1行1列开始，以行或者列优先的顺序，依次填写表格，最后根据整个表格的数据通过简单的取舍或者运算求得问题的最优解。</span> \r\n</p>\r\n<p style=\"color:#5E5E5E;font-family:Verdana, Helvetica, Arial;font-size:13px;text-align:justify;\">\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"Apple-style-span\" style=\"color:#FF0102;\"><b>f(n,m)=max{f(n-1,m), f(n-1,m-w[n])+P(n,m)}</b></span></span> \r\n</p>\r\n<hr />\r\n<h1>\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\"><span class=\"Apple-style-span\" style=\"color:#FF0102;\"><span style=\"color:#000000;font-size:24px;\">六、动态规划算法基本框架</span></span></span> \r\n</h1>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"font-size:medium;\"><span class=\"Apple-style-span\" style=\"color:#FF0102;\"><b><span style=\"color:#000000;\"> </span></b></span></span> \r\n</p>\r\n<pre class=\"brush:cpp;\"><b>代码\r\nfor(j=1; j&lt;=m; j=j+1) // 第一个阶段\r\n   xn[j] = 初始值;\r\n\r\n for(i=n-1; i&gt;=1; i=i-1)// 其他n-1个阶段\r\n   for(j=1; j&gt;=f(i); j=j+1)//f(i)与i有关的表达式\r\n     xi[j]=j=max（或min）{g(xi-1[j1:j2]), ......, g(xi-1[jk:jk+1])};\r\n\r\nt = g(x1[j1:j2]); // 由子问题的最优解求解整个问题的最优解的方案\r\n\r\nprint(x1[j1]);\r\n\r\nfor(i=2; i&lt;=n-1; i=i+1）\r\n{  \r\n     t = t-xi-1[ji];\r\n\r\n     for(j=1; j&gt;=f(i); j=j+1)\r\n        if(t=xi[ji])\r\n             break;\r\n}</b></pre>\r\n<b> <br />\r\n</b> \r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>','动态规划','算法','','20','未命名'),(9,'prim算法',6,'2015-11-26 06:14:16','2015-11-26 07:58:26','html','','<p>\r\n	<span style=\"font-size:18px;\"> &nbsp; &nbsp; &nbsp;普里姆算法（Prim算法），图论中的一种算法，可在加权连通图里搜索最小生成树。意即由此算法搜索到的边子集所构成的树中，不但包括了连通图里的所有顶点（英语：Vertex (graph theory)），且其所有边的权值之和亦为最小。该算法于1930年由捷克数学家沃伊捷赫·亚尔尼克（英语：Vojtěch Jarník）发现；并在1957年由美国计算机科学家罗伯特·普里姆（英语：Robert C. Prim）独立发现；1959年，艾兹格·迪科斯彻再次发现了该算法。因此，在某些场合，普里姆算法又被称为DJP算法、亚尔尼克算法或普里姆－亚尔尼克算法。</span> \r\n</p>\r\n<h1>\r\n	<span style=\"font-size:24px;\">算法描述</span> \r\n</h1>\r\n<p>\r\n	<span style=\"font-size:24px;\"> </span> \r\n</p>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">1).输入：一个加权连通图，其中顶点集合为V，边集合为E；</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">2).初始化：V</span><span style=\"font-size:18px;line-height:0;vertical-align:baseline;\">new</span><span style=\"font-size:18px;\">&nbsp;= {x}，其中x为集合V中的任一节点（起始点），E</span><span style=\"font-size:18px;line-height:0;vertical-align:baseline;\">new</span><span style=\"font-size:18px;\">&nbsp;= {},为空；</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">3).重复下列操作，直到V</span><span style=\"font-size:18px;line-height:0;vertical-align:baseline;\">new</span><span style=\"font-size:18px;\">&nbsp;= V：</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">a.在集合E中选取权值最小的边&lt;u, v&gt;，其中u为集合V</span><span style=\"font-size:18px;line-height:0;vertical-align:baseline;\">new</span><span style=\"font-size:18px;\">中的元素，而v不在V</span><span style=\"font-size:18px;line-height:0;vertical-align:baseline;\">new算法</span><span style=\"font-size:18px;\">当中，并且v∈V（如果存在有多条满足前述条件即具有相同权值的边，则可任意选取其中之一）；</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">b.将v加入集合V</span><span style=\"font-size:18px;line-height:0;vertical-align:baseline;\">new</span><span style=\"font-size:18px;\">中，将&lt;u, v&gt;边加入集合E</span><span style=\"font-size:18px;line-height:0;vertical-align:baseline;\">new</span><span style=\"font-size:18px;\">中；</span> \r\n</div>\r\n<p style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">4).输出：使用集合V</span><span style=\"font-size:18px;line-height:0;vertical-align:baseline;\">new</span><span style=\"font-size:18px;\">和E</span><span style=\"font-size:18px;line-height:0;vertical-align:baseline;\">new</span><span style=\"font-size:18px;\">来描述所得到的最小生成树</span><span style=\"font-size:18px;\">。</span> \r\n</p>\r\n<h1 style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:24px;\">时间复杂度</span> \r\n</h1>\r\n<p>\r\n	<span style=\"font-size:24px;\"> \r\n	<table style=\"width:100%;\" cellpadding=\"2\" cellspacing=\"0\" border=\"1\" bordercolor=\"#000000\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					最小边、权的数据结构<br />\r\n				</td>\r\n				<td>\r\n					时间复杂度\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					邻接矩阵、搜索<br />\r\n				</td>\r\n				<td>\r\n					O(V<sup>2</sup>)\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					二叉堆（后文伪代码中使用的数据结构）、邻接表<br />\r\n				</td>\r\n				<td>\r\n					O((V + E) log(V)) = O(E log(V))<br />\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					斐波那契堆、邻接表<br />\r\n				</td>\r\n				<td>\r\n					O(E + V log(V))<br />\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</span><span style=\"font-size:18px;\">&nbsp; &nbsp; &nbsp; 通过邻接矩阵图表示的简易实现中，找到所有最小权边共需O（V）的运行时间。使用简单的二叉堆与邻接表来表示的话，普里姆算法的运行时间则可缩减为O(ElogV)，其中E为连通图的边数，V为顶点数。如果使用较为复杂的斐波那契堆，则可将运行时间进一步缩短为O(E+VlogV)，这在连通图足够密集时（当E满足Ω（VlogV）条件时），可较显著地提高运行速度。</span><span style=\"font-size:18px;\"></span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">C</span><span style=\"line-height:1.5;\">代码</span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\"> </span> \r\n</p>\r\n<pre class=\"brush:cpp;\">#include&lt;stdio.h&gt;\r\n#include&lt;stdlib.h&gt;\r\n#definemax1000000000;\r\ninta[1001][1001],d[1001],p[1001];\r\nintmain(){\r\ninti,j,k,m,n,min,ans,t;\r\nintx,y,z;\r\nscanf(\"%d%d\",&amp;n,&amp;m);\r\nfor(i=1;i&lt;=m;i++){\r\nscanf(\"%d%d%d\",&amp;x,&amp;y,&amp;z);\r\na[x][y]=z;\r\na[y][x]=z;\r\n}\r\nfor(i=1;i&lt;=n;i++)\r\nd[i]=1000000000;\r\nd[1]=0;\r\nfor(i=2;i&lt;=n;i++){\r\nmin=max;\r\nfor(j=1;j&lt;=n;j++)\r\nif(!p[j]&amp;&amp;min&gt;d[j])\r\nmin=d[j];\r\nt=j;\r\n}\r\np[t]=j;\r\nfor(j=1;j&lt;=n;j++)\r\nif(a[t][j]=0&amp;&amp;d[j]&gt;a[t][j]){\r\nd[j]=a[t][j];\r\nans+=min;\r\n}\r\nprintf(\"%d\",ans);\r\nreturn0;\r\n}</pre>\r\n<pre class=\"brush:cpp;\">C++代码</pre>\r\n<pre class=\"brush:cpp;\">\r\n\r\n\r\n<pre class=\"brush:cpp;\">#defineMAXN1000\r\n#defineINF1&lt;&lt;30\r\nintclosest[MAXN],lowcost[MAXN],m;//m为节点的个数\r\nintG[MAXN][MAXN];//邻接矩阵\r\nintprim()\r\n{\r\nfor(inti=0;i&lt;m;i++)\r\n{\r\nlowcost[i]=INF;\r\n}\r\nfor(inti=0;i&lt;m;i++)\r\n{\r\nclosest[i]=0;\r\n}\r\nclosest[0]=-1;//加入第一个点，-1表示该点在集合U中，否则在集合V中\r\nintnum=0,ans=0,e=0;//e为最新加入集合的点\r\nwhile(num&lt;m-1)//加入m-1条边\r\n{\r\nintmicost=INF,miedge=-1;\r\nfor(inti=0;i&lt;m;i++)\r\nif(closest[i]!=-1)\r\n{\r\ninttemp=G[e][i];\r\nif(temp&lt;lowcost[i])\r\n{\r\nlowcost[i]=temp;\r\nclosest[i]=e;\r\n}\r\nif(lowcost[i]&lt;micost)\r\nmicost=lowcost[miedge=i];\r\n}\r\nans+=micost;\r\nclosest[e=miedge]=-1;\r\nnum++;\r\n}\r\nreturnans;\r\n}</pre>\r\n<br />\r\n</pre>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>','prim','算法','','20','未命名'),(11,'课程简介',1,'2015-11-26 06:17:22','2015-11-26 07:12:36','pdf','loginORreg/static/file/20151126141722_95.pdf','/static/file/20151126141722_95.pdf','课程简介','','','20',''),(12,'代码评审',1,'2015-11-26 06:22:48','2015-11-26 06:22:48','pdf','loginORreg/static/file/20151126142248_26.pdf','/static/file/20151126142248_26.pdf','','','','','未命名'),(14,'ppt',11,'2015-11-26 07:02:07','2015-11-26 07:02:12','other','loginORreg/static/file/20151126150207_89.ppt','/static/file/20151126150207_89.ppt','1','','','20',''),(17,'算法第二章',12,'2015-11-26 07:29:14','2015-11-26 07:59:13','pdf','loginORreg/static/file/20151126152914_95.pdf','/static/file/20151126152914_95.pdf','算法','','','20',''),(18,'算法第一章',12,'2015-11-26 07:31:15','2015-11-26 07:31:20','pdf','loginORreg/static/file/20151126153115_77.pdf','/static/file/20151126153115_77.pdf','算法','','','10',''),(19,'算法第三章',12,'2015-11-26 07:31:36','2015-11-26 07:31:41','pdf','loginORreg/static/file/20151126153136_46.pdf','/static/file/20151126153136_46.pdf','算法','','','20',''),(21,'数字逻辑',14,'2015-11-26 07:35:42','2015-11-26 07:36:09','pdf','loginORreg/static/file/20151126153542_85.pdf','/static/file/20151126153542_85.pdf','数字逻辑','','','20',''),(22,'数据结构',15,'2015-11-26 07:36:28','2015-11-26 07:36:48','pdf','loginORreg/static/file/20151126153628_95.pdf','/static/file/20151126153628_95.pdf','数据结构','','','10',''),(23,'VHDL语言',13,'2015-11-26 07:41:19','2015-11-26 07:59:42','html','','<p>\r\n	<span style=\"font-size:18px;\">&nbsp; &nbsp; <span style=\"font-family:SimSun;\">&nbsp;VHDL全名Very-High-Speed Integrated Circuit Hardware Description Language,诞生于1982年。1987年底，VHDL被IEEE和美国国防部确认为标准硬件描述语言 。自IEEE-1076（简称87版)之后，各EDA公司相继推出自己的VHDL设计环境，或宣布自己的设计工具可以和VHDL接口。1993年，IEEE对VHDL进行了修订，从更高的抽象层次和系统描述能力上扩展VHDL的内容，公布了新版本的VHDL，即IEEE标准的1076-1993版本，简称93版。VHDL和Verilog作为IEEE的工业标准硬件描述语言，得到众多EDA公司支持，在电子工程领域，已成为事实上的通用硬件描述语言。</span></span> \r\n</p>\r\n<h1>\r\n	<span style=\"font-size:24px;\">简介</span> \r\n</h1>\r\n<p>\r\n	<span style=\"font-size:24px;\"><span style=\"font-size:18px;\">&nbsp; &nbsp; &nbsp; &nbsp;VHDL语言是一种用于电路设计的高级语言。它在80年代的后期出现。最初是由美国国防部开发出来供美军用来提高设计的可靠性和缩减开发周期的一种使用范围较小的设计语言 。VHDL翻译成中文就是超高速集成电路硬件描述语言，主要是应用在数字电路的设计中。它在中国的应用多数是用在FPGA/CPLD/EPLD的设计中。当然在一些实力较为雄厚的单位，它也被用来设计ASIC。VHDL主要用于描述数字系统的结构，行为，功能和接口。除了含有许多具有硬件特征的语句外，VHDL的语言形式、描述风格以及语法是十分类似于一般的计算机高级语言。VHDL的程序结构特点是将一项工程设计，或称设计实体（可以是一个元件，一个电路模块或一个系统）分成外部（或称可视部分,及端口)和内部（或称不可视部分），既涉及实体的内部功能和算法完成部分。在对一个设计实体定义了外部界面后，一旦其内部开发完成后，其他的设计就可以直接调用这个实体。这种将设计实体分成内外部分的概念是VHDL系统设计的基本点。</span><span style=\"font-size:18px;\"></span><br />\r\n</span> \r\n</p>\r\n<h1>\r\n	<span style=\"font-size:24px;\"><span style=\"font-size:24px;\">特点</span></span> \r\n</h1>\r\n<p>\r\n	<span style=\"font-size:24px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\">与其他硬件描述语言相比，VHDL具有以下特点：</span><span style=\"font-size:18px;\"></span><br />\r\n</span></span> \r\n</p>\r\n<h2>\r\n	<span style=\"font-size:24px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:18px;\">功能强大、设计灵活</span><span style=\"font-size:18px;\"></span></span></span></span> \r\n</h2>\r\n<p>\r\n	<span style=\"font-size:24px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:18px;\">VHDL具有功能强大的语言结构，可以用简洁明确的源代码来描述复杂的逻辑控制。它具有多层次的设计描述功能，层层细化，最后可直接生成电路级描述。VHDL支持同步电路、异步电路和随机电路的设计，这是其他硬件描述语言所不能比拟的。VHDL还支持各种设计方法，既支持自底向上的设计，又支持自顶向下的设计；既支持模块化设计，又支持层次化设计。</span></span></span></span> \r\n</p>\r\n<h2>\r\n	<span style=\"font-size:24px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:18px;\">支持广泛、易于修改</span></span></span></span> \r\n</h2>\r\n<p>\r\n	<span style=\"font-size:24px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:18px;\"></span></span></span></span> \r\n</p>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">由于VHDL已经成为IEEE标准所规范的硬件描述语言，大多数</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/5822.htm\"><span style=\"font-size:18px;\">EDA</span></a><span style=\"font-size:18px;\">工几乎都支持VHDL，这为VHDL的进一步推广和广泛应用奠定了基础。在硬件电路设计过程中，主要的设计文件是用VHDL编写的</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/60376.htm\"><span style=\"font-size:18px;\">源代码</span></a><span style=\"font-size:18px;\">，因为VHDL易读和结构化，所以易于修改设计。</span> \r\n</div>\r\n<h2 style=\"color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-family:SimSun;line-height:1.5;font-size:18px;\">强大的系统硬件描述能力</span> \r\n</h2>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">VHDL具有多层次的设计描述功能，既可以描述系统级电路，又可以描述门级电路。而描述既可以采用行为描述、</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/6159.htm\"><span style=\"font-size:18px;\">寄存器</span></a><span style=\"font-size:18px;\">传输描述或结构描述，也可以采用三者混合的混合级描述。另外，VHDL支持惯性延迟和</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/5408248.htm\"><span style=\"font-size:18px;\">传输延迟</span></a><span style=\"font-size:18px;\">，还可以准确地建立硬件电路模型。VHDL支持预定义的和自定义的数据类型，给硬件描述带来较大的自由度，使设计人员能够方便地创建高层次的</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/3688808.htm\"><span style=\"font-size:18px;\">系统模型</span></a><span style=\"font-size:18px;\">。</span> \r\n</div>\r\n<h2 style=\"font-size:18px;color:#333333;font-family:\'Microsoft YaHei\', SimHei, Verdana;font-weight:500;\">\r\n	<span class=\"title-text\" style=\"font-size:18px;font-family:SimSun;\"><strong>独立于器件的设计、与工艺无关</strong></span> \r\n</h2>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">设计人员用VHDL进行设计时，不需要首先考虑选择完成设计的器件，就可以集中精力进行设计的优化。当设计描述完成后，可以用多种不同的器件结构来实现其功能。</span> \r\n</div>\r\n<h2 style=\"color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-family:SimSun;font-size:18px;line-height:1.5;\">很强的移植能力</span> \r\n</h2>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">VHDL是一种标准化的硬件描述语言，同一个设计描述可以被不同的工具所支持，使得设计描述的移植成为可能。</span> \r\n</div>\r\n<h2 style=\"font-size:18px;color:#333333;font-family:\'Microsoft YaHei\', SimHei, Verdana;font-weight:500;\">\r\n	<span class=\"title-text\" style=\"font-size:18px;font-family:SimSun;\"><strong>易于共享和复用</strong></span> \r\n</h2>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">VHDL采用基于库（Library）的设计方法，可以建立各种可再次利用的模块。这些模块可以预先设计或使用以前设计中的存档模块，将这些模块存放到库中，就可以在以后的设计中进行复用，可以使设计成果在设计人员之间进行交流和共享，减少硬件电路设计。</span> \r\n</div>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>','VHDL语言','','','20','未命名'),(24,'博弈论第一讲',11,'2015-11-26 08:19:53','2015-11-26 08:20:00','other','loginORreg/static/file/20151126161953_12.ppt','/static/file/20151126161953_12.ppt','博弈论','','','10',''),(25,'Bootstrap',16,'2015-11-26 08:34:33','2015-11-26 08:38:44','html','','<p>\r\n	<span style=\"font-size:18px;\">&nbsp; &nbsp; &nbsp; &nbsp;今天，我们正式发布最新的 Bootstrap v3.2.0 版本，这是我们4个月工作的成果。这个版本满载了诸多贡献者的热忱、修复了数百个 bug、改进了大量文档内容，还有编译工具的完善。 从上个版本到现在，总共合并了超过1000个 commit。</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下面我们列举一下这个版本包含的一些两点。</span> \r\n</p>\r\n<h1>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:24px;\">嵌入内容支持响应式</span><span style=\"font-size:24px;\"></span></span> \r\n</h1>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\">正如在 SUIT CSS 中看到的，我们为创建支持响应式的嵌入内容提供了一组类。他们能够非常好的按比例缩放 YouTube 视频和其他的 iframe 或 embed 元素。着急的可以先去看文档。</span><span style=\"font-size:18px;\"></span><br />\r\n</span></span> \r\n</p>\r\n<h1>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\">新增的响应式工具类</span><span style=\"font-size:24px;\"></span></span></span></span> \r\n</h1>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\">响应式工具类的出现已经有一段时间了，例如：.visible-xs。今天，迎来了小小的升级。我们为每个尺寸的屏幕新增了 block、inline-block 和 inline。例如 .visible-xs-block 现在就可以使用了。</span><br />\r\n</span></span></span></span> \r\n</p>\r\n<h2>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\">文档中的代码可直接复制</span></span></span></span> \r\n</h2>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\">在 ZeroClipboard （基于 Flash 的开源剪贴板工具）的帮助下，我们为文档中的代码片段加入了复制的功能。这个复制按钮在每个代码实例的右上角位置。只需点击即可复制代码。</span><span style=\"font-size:18px;\"></span><br />\r\n</span></span></span></span> \r\n</p>\r\n<h2>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\">浏览器 Bug</span><span style=\"font-size:24px;\"></span></span></span></span></span></span> \r\n</h2>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\">对于影响到 Bootstrap 开发的、尚未解决的浏览器 bug，我们已经开始追踪了。我们给它起了个名字，叫做浏览器 Bug 墙。开发 Bootstrap 的过程中，最酷的一件事是发现并向浏览器的开发者报告 bug。我们其实也是在推动互联网变得更好。</span><span style=\"font-size:18px;\"></span><br />\r\n</span></span></span></span></span></span> \r\n</p>\r\n<h2>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\">下一个版本</span><span style=\"font-size:24px;\"></span></span></span></span></span></span></span></span> \r\n</h2>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\"><span style=\"font-size:24px;\"><span style=\"font-size:18px;\">我们可能会再发布一个补丁版（即 v3.2.1），接下来就是朝着 v4 版本进军。我们曾经在 GitHub 上创建了一个 v3.3.0 的里程碑，但是目前还不清楚我们是否要在 v4 版本之前再发布一个中间版本。我们列出了对新版本的任务清单，不过现在还没准备好对外公布。在我们准备好更多细节之后将会把它公布出来。等着吧！</span><span style=\"font-size:18px;\"></span><br />\r\n</span></span></span></span></span></span></span></span> \r\n</p>','bootstrap','','','10','未命名'),(26,'VHDL',17,'2015-11-26 08:44:46','2015-11-26 08:44:58','pdf','loginORreg/static/file/20151126164446_45.pdf','/static/file/20151126164446_45.pdf','vhdl','','','20',''),(32,'Bootstrap 3.2.0 发布，Web 前端 UI 框架',16,'2015-11-26 08:50:16','2015-11-26 08:50:16','html','','<p>\r\n	<span style=\"font-size:18px;\">最新的 Bootstrap 3.2.0 发布了，该版本主要新特性包括：Responsive embedsNew responsive utility classesCopy docs snippetsLMVTFYBrowser bugs等等，详细介绍请看官方发行说明。</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\">下载地址：</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\">https://github.com/twbs/bootstrap/archive/v3.2.0.zip</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\">\r\n<pre class=\"brush:html;\">&lt;!-- Latest compiled and minified CSS --&gt;\r\n&lt;link rel=\"stylesheet\" href=\"//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css\"&gt;\r\n \r\n&lt;!-- Optional theme --&gt;\r\n&lt;link rel=\"stylesheet\" href=\"//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css\"&gt;\r\n \r\n&lt;!-- Latest compiled and minified JavaScript --&gt;\r\n&lt;script src=\"//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js\"&gt;&lt;/script&gt;\r\n</pre>\r\nBootstrap是快速开发Web应用程序的前端工具包。它是一个CSS和HTML的集合，它使用了最新的浏览器技术，给你的Web开发提供了时尚的版式，表单，buttons，表格，网格系统等等。<br />\r\n</span>\r\n</p>','bootstrap','','','20','未命名'),(33,'html语言',19,'2015-11-26 08:52:06','2015-11-26 08:52:06','html','','<p>\r\n	<span style=\"font-size:18px;\">&nbsp; &nbsp; &nbsp; &nbsp;万维网的核心语言、标准通用标记语言下的一个应用超文本标记语言（HTML）的第五次重大修改（这是一项推荐标准、外语原文：W3C Recommendation、见本处参考资料原文内容：[1] &nbsp;）。2014年10月29日，万维网联盟宣布，经过接近8年的<a href=\"http://www.baidu.com\" target=\"_blank\">艰苦努力</a>，该标准规范终于制定完成。</span> \r\n</p>\r\n<h1>\r\n	<span style=\"font-size:24px;\">发展历程</span> \r\n</h1>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:16px;\"> </span></span>\r\n</p>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<a target=\"_blank\" href=\"http://baike.baidu.com/view/5286041.htm\"><span style=\"font-size:18px;\">标准通用标记语言</span></a><span style=\"font-size:18px;\">下的一个应用</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/692.htm\"><span style=\"font-size:18px;\">HTML</span></a><span style=\"font-size:18px;\">标准自1999年12月发布的HTML4.01后，后继的HTML5和其它标准被束之高阁，为了推动Web标准化运动的发展，一些公司联合起来，成立了一个叫做 Web Hypertext Application Technology Working Group （Web</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/156868.htm\"><span style=\"font-size:18px;\">超文本</span></a><span style=\"font-size:18px;\">应用技术工作组 -</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/3863799.htm\"><span style=\"font-size:18px;\">WHATWG</span></a><span style=\"font-size:18px;\">） 的组织。WHATWG 致力于 Web 表单和应用程序，而</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/7913.htm\"><span style=\"font-size:18px;\">W3C</span></a><span style=\"font-size:18px;\">（World Wide Web Consortium，</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/7833.htm\"><span style=\"font-size:18px;\">万维网</span></a><span style=\"font-size:18px;\">联盟） 专注于</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/15906.htm\"><span style=\"font-size:18px;\">XHTML</span></a><span style=\"font-size:18px;\">2.0。在 2006 年，双方决定进行合作，来创建一个新版本的 HTML。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">HTML5草案的前身名为 Web Applications 1.0，于2004年被WHATWG提出，于2007年被W3C接纳，并成立了新的 HTML 工作团队。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">HTML 5 的第一份正式草案已于2008年1月22日公布。HTML5 仍处于完善之中。然而，大部分</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/4974221.htm\"><span style=\"font-size:18px;\">现代浏览器</span></a><span style=\"font-size:18px;\">已经具备了某些 HTML5 支持。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">2012年12月17日，</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/80669.htm\"><span style=\"font-size:18px;\">万维网联盟</span></a><span style=\"font-size:18px;\">（W3C）正式宣布凝结了大量网络工作者心血的HTML5规范已经正式定稿。根据W3C的发言稿称：“HTML5是开放的Web网络平台的奠基石。”</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">2013年5月6日， HTML 5.1正式草案公布。该规范定义了第五次重大版本，第一次要修订</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/7833.htm\"><span style=\"font-size:18px;\">万维网</span></a><span style=\"font-size:18px;\">的核心语言：超文本标记语言（</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/692.htm\"><span style=\"font-size:18px;\">HTML</span></a><span style=\"font-size:18px;\">）。在这个版本中，新功能不断推出，以帮助Web应用程序的作者，努力提高新元素互操作性。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">本次草案的发布，从2012年12月27日至今，进行了多达近百项的修改，包括HTML和XHTML的标签，相关的</span><a target=\"_blank\" href=\"http://baike.baidu.com/subview/16068/5889234.htm\"><span style=\"font-size:18px;\">API</span></a><span style=\"font-size:18px;\">、</span><a target=\"_blank\" href=\"http://baike.baidu.com/subview/491246/16381178.htm\"><span style=\"font-size:18px;\">Canvas</span></a><span style=\"font-size:18px;\">等，同时HTML5的图像img标签及svg也进行了改进，性能得到进一步提升。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">支持Html5的浏览器包括</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/3279.htm\"><span style=\"font-size:18px;\">Firefox</span></a><span style=\"font-size:18px;\">（火狐浏览器），</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/2298486.htm\"><span style=\"font-size:18px;\">IE9</span></a><span style=\"font-size:18px;\">及其更高版本，</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/1835504.htm\"><span style=\"font-size:18px;\">Chrome</span></a><span style=\"font-size:18px;\">（谷歌浏览器），</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/110484.htm\"><span style=\"font-size:18px;\">Safari</span></a><span style=\"font-size:18px;\">，Opera等；国内的遨游浏览器（Maxthon），以及基于IE或</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/404073.htm\"><span style=\"font-size:18px;\">Chromium</span></a><span style=\"font-size:18px;\">（Chrome的工程版或称实验版）所推出的</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/1949679.htm\"><span style=\"font-size:18px;\">360浏览器</span></a><span style=\"font-size:18px;\">、</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/2083809.htm\"><span style=\"font-size:18px;\">搜狗浏览器</span></a><span style=\"font-size:18px;\">、</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/2610930.htm\"><span style=\"font-size:18px;\">QQ浏览器</span></a><span style=\"font-size:18px;\">、</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/8467425.htm\"><span style=\"font-size:18px;\">猎豹浏览器</span></a><span style=\"font-size:18px;\">等国产浏览器同样具备支持HTML5的能力。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">在移动设备开发HTML5应用只有两种方法，要不就是全使用HTML5的语法，要不就是仅使用JavaScript引擎。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<a target=\"_blank\" href=\"http://baike.baidu.com/view/16168.htm\"><span style=\"font-size:18px;\">JavaScript</span></a><span style=\"font-size:18px;\">引擎的构建方法让制作手机网页游戏成为可能。由于界面层很复杂，已预订了一个</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/20302.htm\"><span style=\"font-size:18px;\">UI</span></a><span style=\"font-size:18px;\">工具包去使用。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">纯HTML5手机应用运行缓慢并错漏百出，但优化后的效果会好转。尽管不是很多人愿意去做这样的优化，但依然可以去尝试。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">HTML5手机应用的最大优势就是可以在网页上直接</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/322913.htm\"><span style=\"font-size:18px;\">调试</span></a><span style=\"font-size:18px;\">和修改。原先应用的开发人员可能需要花费非常大的力气才能达到HTML5的效果，不断地重复编码、调试和运行，这是首先得解决的一个问题。因此也有许多手机杂志客户端是基于HTML5标准，开发人员可以轻松调试修改。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">2014年10月29日，万维网联盟泪流满面地宣布，经过几乎8年的艰辛努力，HTML5标准规范终于最终制定完成了，并已公开发布。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">在此之前的几年时间里，已经有很多开发者陆续使用了HTML5的部分技术，</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/3279.htm\"><span style=\"font-size:18px;\">Firefox</span></a><span style=\"font-size:18px;\">、</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/1835854.htm\"><span style=\"font-size:18px;\">Google Chrome</span></a><span style=\"font-size:18px;\">、Opera、Safari 4+、Internet Explorer 9+都已支持HTML5，但直到今天，我们才看到“正式版”。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">HTML5将会取代1999年制定的HTML 4.01、XHTML 1.0标准，以期能在互联网应用迅速发展的时候，使网络标准达到符合当代的网络需求，为桌面和移动平台带来无缝衔接的丰富内容。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">W3C CEO Jeff Jaffe博士表示：“HTML5将推动Web进入新的时代。不久以前，Web还只是上网看一些基础文档，而如今，Web是一个极大丰富的平台。我们已经进入一个稳定阶段，每个人都可以按照标准行事，并且可用于所有浏览器。如果我们不能携起手来，就不会有统一的Web。”</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">HTML5还有望成为梦想中的“开放Web平台”(Open Web Platform)的基石，如能实现可进一步推动更深入的跨平台Web应用。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">接下来，W3C将致力于开发用于实时通信、</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/131211.htm\"><span style=\"font-size:18px;\">电子支付</span></a><span style=\"font-size:18px;\">、应用开发等方面的标准规范，还会创建一系列的隐私、安全防护措施。</span> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;\">\r\n	<span style=\"font-size:18px;\">W3C还曾在2012年透露说，计划在2016年底前发布HTML 5.1。</span> \r\n</div>\r\n<br />\r\n<p>\r\n	<br />\r\n</p>','html','','','20','未命名');
/*!40000 ALTER TABLE `loginorreg_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginorreg_link`
--

DROP TABLE IF EXISTS `loginorreg_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginorreg_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) NOT NULL,
  `linkto` varchar(528) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginorreg_link`
--

LOCK TABLES `loginorreg_link` WRITE;
/*!40000 ALTER TABLE `loginorreg_link` DISABLE KEYS */;
INSERT INTO `loginorreg_link` VALUES (9,'百度','www.baidu.com'),(10,'网易','www.163.com'),(16,'百度','http://www.baidu.com'),(17,'网易','http://www.163.com');
/*!40000 ALTER TABLE `loginorreg_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginorreg_link_ower`
--

DROP TABLE IF EXISTS `loginorreg_link_ower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginorreg_link_ower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link_id` (`link_id`,`account_id`),
  KEY `loginORreg_link_owe_account_id_4aae64d5_fk_loginORreg_account_id` (`account_id`),
  CONSTRAINT `loginORreg_link_owe_account_id_4aae64d5_fk_loginORreg_account_id` FOREIGN KEY (`account_id`) REFERENCES `loginorreg_account` (`id`),
  CONSTRAINT `loginORreg_link_ower_link_id_2e8d7e73_fk_loginORreg_link_id` FOREIGN KEY (`link_id`) REFERENCES `loginorreg_link` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginorreg_link_ower`
--

LOCK TABLES `loginorreg_link_ower` WRITE;
/*!40000 ALTER TABLE `loginorreg_link_ower` DISABLE KEYS */;
INSERT INTO `loginorreg_link_ower` VALUES (8,9,1),(9,10,1),(15,16,3),(16,17,3);
/*!40000 ALTER TABLE `loginorreg_link_ower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginorreg_styles`
--

DROP TABLE IF EXISTS `loginorreg_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginorreg_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loginORreg_styles_parent_id_6bf77046_fk_loginORreg_styles_id` (`parent_id`),
  CONSTRAINT `loginORreg_styles_parent_id_6bf77046_fk_loginORreg_styles_id` FOREIGN KEY (`parent_id`) REFERENCES `loginorreg_styles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginorreg_styles`
--

LOCK TABLES `loginorreg_styles` WRITE;
/*!40000 ALTER TABLE `loginorreg_styles` DISABLE KEYS */;
INSERT INTO `loginorreg_styles` VALUES (1,'ROOT',NULL),(2,'qwer',1),(3,'kd',1),(4,'数理逻辑',3),(5,'马哲',3),(6,'算法',3),(7,'软件工程',3),(8,'zt',1),(9,'于洁',1),(10,'杨悦',1),(11,'',3),(12,'算法导论',8),(13,'vhdl',8),(14,'数字逻辑',8),(15,'数据结构',8),(16,'bootstrap',10),(17,'vhdl语言',10),(18,'test',2),(19,'html',2);
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

-- Dump completed on 2015-11-26 17:33:49
