-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: evolution
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `k6on_active_user_locks`
--

DROP TABLE IF EXISTS `k6on_active_user_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_active_user_locks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `internalKey` int NOT NULL DEFAULT '0',
  `elementType` int NOT NULL DEFAULT '0',
  `elementId` int NOT NULL DEFAULT '0',
  `lasthit` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `k6on_active_user_locks_ix_element_id` (`elementType`,`elementId`,`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_active_user_locks`
--

LOCK TABLES `k6on_active_user_locks` WRITE;
/*!40000 ALTER TABLE `k6on_active_user_locks` DISABLE KEYS */;
INSERT INTO `k6on_active_user_locks` VALUES (15,'xx6FueuowGQVWiukg4t6Lh2L2zboaO2X4y7Yew7J',1,7,16,1785277894),(16,'xx6FueuowGQVWiukg4t6Lh2L2zboaO2X4y7Yew7J',1,7,5,1785277894),(17,'xx6FueuowGQVWiukg4t6Lh2L2zboaO2X4y7Yew7J',1,7,20,1785277894);
/*!40000 ALTER TABLE `k6on_active_user_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_active_user_sessions`
--

DROP TABLE IF EXISTS `k6on_active_user_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_active_user_sessions` (
  `sid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `internalKey` int NOT NULL DEFAULT '0',
  `lasthit` int NOT NULL DEFAULT '0',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_active_user_sessions`
--

LOCK TABLES `k6on_active_user_sessions` WRITE;
/*!40000 ALTER TABLE `k6on_active_user_sessions` DISABLE KEYS */;
INSERT INTO `k6on_active_user_sessions` VALUES ('xx6FueuowGQVWiukg4t6Lh2L2zboaO2X4y7Yew7J',1,1785277894,'127.0.0.1');
/*!40000 ALTER TABLE `k6on_active_user_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_active_users`
--

DROP TABLE IF EXISTS `k6on_active_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_active_users` (
  `sid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `internalKey` int NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lasthit` int NOT NULL DEFAULT '0',
  `action` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id` int DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_active_users`
--

LOCK TABLES `k6on_active_users` WRITE;
/*!40000 ALTER TABLE `k6on_active_users` DISABLE KEYS */;
INSERT INTO `k6on_active_users` VALUES ('xx6FueuowGQVWiukg4t6Lh2L2zboaO2X4y7Yew7J',1,'admin',1785277894,'27',20);
/*!40000 ALTER TABLE `k6on_active_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_categories`
--

DROP TABLE IF EXISTS `k6on_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rank` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_categories`
--

LOCK TABLES `k6on_categories` WRITE;
/*!40000 ALTER TABLE `k6on_categories` DISABLE KEYS */;
INSERT INTO `k6on_categories` VALUES (1,'Manager and Admin',0);
/*!40000 ALTER TABLE `k6on_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_document_groups`
--

DROP TABLE IF EXISTS `k6on_document_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_document_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_group` int NOT NULL DEFAULT '0',
  `document` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `k6on_document_groups_ix_dg_id` (`document_group`,`document`),
  KEY `k6on_document_groups_document_group` (`document_group`),
  KEY `k6on_document_groups_document` (`document`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_document_groups`
--

LOCK TABLES `k6on_document_groups` WRITE;
/*!40000 ALTER TABLE `k6on_document_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_document_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_documentgroup_names`
--

DROP TABLE IF EXISTS `k6on_documentgroup_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_documentgroup_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `private_memgroup` int DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` int DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `k6on_documentgroup_names_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_documentgroup_names`
--

LOCK TABLES `k6on_documentgroup_names` WRITE;
/*!40000 ALTER TABLE `k6on_documentgroup_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_documentgroup_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_event_log`
--

DROP TABLE IF EXISTS `k6on_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_event_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eventid` int DEFAULT '0',
  `createdon` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1' COMMENT '1 - information, 2 - warning, 3 - error, 4 - mail accepted for delivery',
  `user` int NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` int NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `k6on_event_log_user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_event_log`
--

LOCK TABLES `k6on_event_log` WRITE;
/*!40000 ALTER TABLE `k6on_event_log` DISABLE KEYS */;
INSERT INTO `k6on_event_log` VALUES (1,0,1785275148,3,0,0,'phpmailer','Could not instantiate mail function.<pre>Array\n(\n    [Priority] => \n    [CharSet] => UTF-8\n    [ContentType] => text/html\n    [Encoding] => base64\n    [ErrorInfo] => \n    [From] => alekseybanga2001@gmail.com\n    [FromName] => Блог Українських Екскурсоводів\n    [Sender] => alekseybanga2001@gmail.com\n    [Subject] => Password change request\n    [Body] => \n                <p>A request has been made to change the password on your account. <a href=\"http://localhost:8080/manager/?a=0&hash=a1e68d18ef1adf669781721d7569ab9d&mode=hash\">Click here to complete the process.</a></p>\n                <p>From there you will be able to change your password from the My Account menu.</p>\n                <p><small>* The URL above will expire once you change your password or after today.</small></p>\n    [AltBody] => \n    [Ical] => \n    [MIMEBody] => CiAgICAgICAgICAgICAgICA8cD5BIHJlcXVlc3QgaGFzIGJlZW4gbWFkZSB0byBjaGFuZ2UgdGhl\r\nIHBhc3N3b3JkIG9uIHlvdXIgYWNjb3VudC4gPGEgaHJlZj0iaHR0cDovL2xvY2FsaG9zdDo4MDgw\r\nL21hbmFnZXIvP2E9MCZoYXNoPWExZTY4ZDE4ZWYxYWRmNjY5NzgxNzIxZDc1NjlhYjlkJm1vZGU9\r\naGFzaCI+Q2xpY2sgaGVyZSB0byBjb21wbGV0ZSB0aGUgcHJvY2Vzcy48L2E+PC9wPgogICAgICAg\r\nICAgICAgICAgPHA+RnJvbSB0aGVyZSB5b3Ugd2lsbCBiZSBhYmxlIHRvIGNoYW5nZSB5b3VyIHBh\r\nc3N3b3JkIGZyb20gdGhlIE15IEFjY291bnQgbWVudS48L3A+CiAgICAgICAgICAgICAgICA8cD48\r\nc21hbGw+KiBUaGUgVVJMIGFib3ZlIHdpbGwgZXhwaXJlIG9uY2UgeW91IGNoYW5nZSB5b3VyIHBh\r\nc3N3b3JkIG9yIGFmdGVyIHRvZGF5Ljwvc21hbGw+PC9wPg==\r\n\n    [MIMEHeader] => Date: Tue, 28 Jul 2026 21:45:48 +0000\r\nFrom: =?UTF-8?B?0JHQu9C+0LMg0KPQutGA0LDRl9C90YHRjNC60LjRhSDQldC60YHQutGD0YA=?=\r\n =?UTF-8?B?0YHQvtCy0L7QtNGW0LI=?= <alekseybanga2001@gmail.com>\r\nMessage-ID: <ojhQaqnkGKuLA5AYVY868fAdGdDRUYW5R2mIgdvUQV8@localhost>\r\nX-Mailer: PHPMailer 7.1.1 (https://github.com/PHPMailer/PHPMailer)\r\nMIME-Version: 1.0\r\nContent-Type: text/html; charset=UTF-8\r\nContent-Transfer-Encoding: base64\r\n\n    [mailHeader] => To: alekseybanga2001@gmail.com\r\nSubject: Password change request\r\n\n    [WordWrap] => 0\n    [Mailer] => mail\n    [Sendmail] => /usr/sbin/sendmail\n    [UseSendmailOptions] => 1\n    [ConfirmReadingTo] => \n    [Hostname] => \n    [MessageID] => \n    [MessageDate] => \n    [Host] => localhost\n    [Port] => 25\n    [Helo] => \n    [SMTPSecure] => \n    [SMTPAutoTLS] => 1\n    [SMTPAuth] => \n    [SMTPOptions] => Array\n        (\n        )\n\n    [Username] => \n    [Password] => \n    [AuthType] => \n    [SMTPXClient] => Array\n        (\n        )\n\n    [oauth] => \n    [Timeout] => 300\n    [dsn] => \n    [SMTPDebug] => 0\n    [Debugoutput] => html\n    [SMTPKeepAlive] => \n    [SingleTo] => \n    [SingleToArray] => Array\n        (\n        )\n\n    [do_verp] => \n    [AllowEmpty] => \n    [DKIM_selector] => \n    [DKIM_identity] => \n    [DKIM_passphrase] => \n    [DKIM_domain] => \n    [DKIM_copyHeaderFields] => 1\n    [DKIM_extraHeaders] => Array\n        (\n        )\n\n    [DKIM_private] => \n    [DKIM_private_string] => \n    [action_function] => \n    [XMailer] => \n    [smtp] => \n    [to] => Array\n        (\n            [0] => Array\n                (\n                    [0] => alekseybanga2001@gmail.com\n                    [1] => \n                )\n\n        )\n\n    [cc] => Array\n        (\n        )\n\n    [bcc] => Array\n        (\n        )\n\n    [ReplyTo] => Array\n        (\n        )\n\n    [all_recipients] => Array\n        (\n            [alekseybanga2001@gmail.com] => 1\n        )\n\n    [RecipientsQueue] => Array\n        (\n        )\n\n    [ReplyToQueue] => Array\n        (\n        )\n\n    [UseSMTPUTF8] => \n    [attachment] => Array\n        (\n        )\n\n    [CustomHeader] => Array\n        (\n        )\n\n    [lastMessageID] => <ojhQaqnkGKuLA5AYVY868fAdGdDRUYW5R2mIgdvUQV8@localhost>\n    [message_type] => plain\n    [boundary] => Array\n        (\n            [1] => b1=_ojhQaqnkGKuLA5AYVY868fAdGdDRUYW5R2mIgdvUQV8\n            [2] => b2=_ojhQaqnkGKuLA5AYVY868fAdGdDRUYW5R2mIgdvUQV8\n            [3] => b3=_ojhQaqnkGKuLA5AYVY868fAdGdDRUYW5R2mIgdvUQV8\n        )\n\n    [error_count] => 0\n    [sign_cert_file] => \n    [sign_key_file] => \n    [sign_extracerts_file] => \n    [sign_key_pass] => \n    [exceptions] => \n    [uniqueid] => ojhQaqnkGKuLA5AYVY868fAdGdDRUYW5R2mIgdvUQV8\n    [mb_language] => UNI\n    [encode_header_method] => \n    [PluginDir] => /var/www/html/manager/includes/controls/phpmailer/\n)\n</pre>');
/*!40000 ALTER TABLE `k6on_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_file_groups`
--

DROP TABLE IF EXISTS `k6on_file_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_file_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_group` int NOT NULL DEFAULT '0',
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `k6on_file_groups_ix_fg_id` (`document_group`,`file`),
  KEY `k6on_file_groups_document_group` (`document_group`),
  KEY `k6on_file_groups_file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_file_groups`
--

LOCK TABLES `k6on_file_groups` WRITE;
/*!40000 ALTER TABLE `k6on_file_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_file_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_manager_log`
--

DROP TABLE IF EXISTS `k6on_manager_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_manager_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` int NOT NULL DEFAULT '0',
  `internalKey` int NOT NULL DEFAULT '0',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` int NOT NULL DEFAULT '0',
  `itemid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `itemname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_manager_log`
--

LOCK TABLES `k6on_manager_log` WRITE;
/*!40000 ALTER TABLE `k6on_manager_log` DISABLE KEYS */;
INSERT INTO `k6on_manager_log` VALUES (1,1785229582,1,'admin',58,'-','EVO','Logged in','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(2,1785229585,1,'admin',17,'','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(3,1785229630,1,'admin',17,'','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(4,1785229634,1,'admin',17,'','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(5,1785229738,1,'admin',30,'','-','Saving settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(6,1785229741,1,'admin',17,'','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(7,1785229744,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(8,1785229751,1,'admin',72,'','Новый ресурс','Adding a weblink','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(9,1785229753,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(10,1785229754,1,'admin',67,'-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(11,1785231310,1,'admin',76,'','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(12,1785231313,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(13,1785231325,1,'admin',17,'','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(14,1785231330,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(15,1785231330,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(16,1785231330,1,'admin',76,'','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(17,1785231618,1,'admin',16,'1','Minimal Template','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(18,1785231626,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(19,1785232651,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(20,1785232652,1,'admin',76,'','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(21,1785232652,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(22,1785232656,1,'admin',27,'3','Блог','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(23,1785232666,1,'admin',27,'4','Демо пост','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(24,1785232961,1,'admin',6,'3','Блог','Deleting resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(25,1785232964,1,'admin',3,'3','Блог','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(26,1785232971,1,'admin',6,'4','Демо пост','Deleting resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(27,1785232973,1,'admin',3,'4','Демо пост','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(28,1785232978,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(29,1785232978,1,'admin',76,'','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(30,1785232979,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(31,1785232979,1,'admin',3,'3','Блог','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(32,1785232979,1,'admin',3,'4','Демо пост','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(33,1785232987,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(34,1785232996,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(35,1785233002,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(36,1785235041,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(37,1785235062,1,'admin',6,'2','Главная','Deleting resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(38,1785235064,1,'admin',3,'2','Главная','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(39,1785235066,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(40,1785235071,1,'admin',27,'2','Главная','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(41,1785236535,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(42,1785236550,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(43,1785236561,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(44,1785236592,1,'admin',64,'','-','Removing deleted content','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(45,1785236598,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(46,1785237248,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(47,1785237263,1,'admin',19,'','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(48,1785237267,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(49,1785237271,1,'admin',16,'1','Minimal Template','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(50,1785237339,1,'admin',20,'1','Homepage','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(51,1785237341,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(52,1785237733,1,'admin',20,'1','Homepage','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(53,1785237735,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(54,1785238334,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(55,1785238334,1,'admin',19,'','Новый шаблон','Creating a new template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(56,1785238334,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(57,1785238341,1,'admin',20,'1','Homepage','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(58,1785238343,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(59,1785238390,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(60,1785238391,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(61,1785238395,1,'admin',20,'1','Homepage','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(62,1785238397,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(63,1785238417,1,'admin',58,'-','EVO','Logged in','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(64,1785238425,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(65,1785238434,1,'admin',20,'2','Blog Layout','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(66,1785238436,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(67,1785238441,1,'admin',20,'2','Blog Layout','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(68,1785238443,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(69,1785238555,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(70,1785238560,1,'admin',20,'2','Blog Layout','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(71,1785238561,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(72,1785238640,1,'admin',20,'2','Blog Layout','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(73,1785238644,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(74,1785238688,1,'admin',20,'2','Blog Layout','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(75,1785238690,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(76,1785238778,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(77,1785238781,1,'admin',20,'2','Blog Layout','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(78,1785238783,1,'admin',16,'2','Blog Layout','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/3.13.21 Chrome/144.0.7559.236 Electron/40.10.3 Safari/537.36'),(79,1785238824,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(80,1785238824,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(81,1785238826,1,'admin',20,'1','Homepage','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(82,1785238829,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(83,1785238885,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(84,1785238885,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(85,1785238887,1,'admin',20,'1','Homepage','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(86,1785238889,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(87,1785238895,1,'admin',20,'1','Homepage','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(88,1785238897,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(89,1785238902,1,'admin',20,'1','Homepage','Saving template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(90,1785238904,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(91,1785241722,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(92,1785241724,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(93,1785241731,1,'admin',76,'','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(94,1785241736,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(95,1785241740,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(96,1785241910,1,'admin',3,'1','Evolution CMS Install Success','Viewing data for resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(97,1785241914,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(98,1785241937,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(99,1785241944,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(100,1785241945,1,'admin',16,'1','Homepage','Editing template','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(101,1785241945,1,'admin',76,'','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(102,1785242189,1,'admin',17,'','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(103,1785245914,1,'admin',27,'1','Evolution CMS Install Success','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(104,1785245929,1,'admin',27,'1','Hone Page','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(105,1785245954,1,'admin',4,'','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(106,1785245956,1,'admin',67,'-','-','Removing locks','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(107,1785245959,1,'admin',27,'1','Hone Page','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(108,1785245964,1,'admin',27,'1','Hone Page','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(109,1785245995,1,'admin',112,'1','Extras','Execute module Extras','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(110,1785246027,1,'admin',27,'1','Hone Page','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(111,1785246164,1,'admin',17,'','-','Editing settings','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(112,1785246217,1,'admin',27,'1','Hone Page','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(113,1785246387,1,'admin',4,'','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(114,1785246434,1,'admin',27,'5','Blog','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(115,1785246445,1,'admin',4,'','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(116,1785246496,1,'admin',27,'6','Etiam id diam vitae lorem dictum','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(117,1785246527,1,'admin',27,'5','Blog','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(118,1785246529,1,'admin',4,'','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(119,1785246540,1,'admin',27,'7','Donec tincidunt leo nec magna','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(120,1785246541,1,'admin',27,'5','Blog','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(121,1785246545,1,'admin',4,'','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(122,1785246559,1,'admin',27,'8','Swag hella echo park leggings, shaman cornhole ethical coloring','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(123,1785246561,1,'admin',27,'5','Blog','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(124,1785246566,1,'admin',4,'','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(125,1785246577,1,'admin',27,'9','Vestibulum id turpis porttitor sapien facilisis scelerisque','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(126,1785246590,1,'admin',27,'5','Blog','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(127,1785246591,1,'admin',4,'','Новый ресурс','Creating a resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(128,1785246598,1,'admin',27,'10','Suspendisse et metus nec libero ultrices varius eget in risus','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(129,1785246650,1,'admin',27,'5','Blog','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(130,1785246658,1,'admin',27,'6','Etiam id diam vitae lorem dictum','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(131,1785246679,1,'admin',76,'','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(132,1785246683,1,'admin',76,'','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(133,1785246686,1,'admin',76,'','-','Element management','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(134,1785246687,1,'admin',300,'','Новый шаблон','Create Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(135,1785246736,1,'admin',302,'-','image','Save Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(136,1785246739,1,'admin',301,'1','image','Edit Template Variable','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(137,1785246750,1,'admin',27,'1','Hone Page','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(138,1785246757,1,'admin',27,'1','Home Page','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(139,1785246764,1,'admin',27,'9','Vestibulum id turpis porttitor sapien facilisis scelerisque','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(140,1785246767,1,'admin',27,'10','Suspendisse et metus nec libero ultrices varius eget in risus','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(141,1785246768,1,'admin',27,'8','Swag hella echo park leggings, shaman cornhole ethical coloring','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(142,1785246770,1,'admin',27,'7','Donec tincidunt leo nec magna','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(143,1785246802,1,'admin',27,'1','Home Page','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(144,1785246810,1,'admin',27,'5','Blog','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(145,1785246817,1,'admin',27,'10','Suspendisse et metus nec libero ultrices varius eget in risus','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(146,1785246856,1,'admin',27,'10','Suspendisse et metus nec libero ultrices varius eget in risus','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(147,1785249051,1,'admin',27,'10','Suspendisse et metus nec libero','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(148,1785249058,1,'admin',27,'12','let\'s stay in touch!','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(149,1785249133,1,'admin',27,'9','Vestibulum id turpis porttitor sapien','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(150,1785249166,1,'admin',27,'11','more about us!','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(151,1785249214,1,'admin',27,'1','Home','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(152,1785249227,1,'admin',27,'5','Our Recent Blog Entries','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(153,1785249235,1,'admin',27,'7','Etiam id diam vitae lorem dictum','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(154,1785250510,1,'admin',27,'5','Маршрути Україною','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(155,1785250510,1,'admin',27,'7','Озеро Синевир — перлина Закарпаття','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(156,1785250727,1,'admin',27,'12','зв\'яжімося!','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(157,1785275554,1,'admin',58,'-','EVO','Logged in','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(158,1785275555,1,'admin',27,'5','Маршрути Україною','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(159,1785275558,1,'admin',27,'7','Озеро Синевир — перлина Закарпаття','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(160,1785275558,1,'admin',27,'12','зв\'яжімося!','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(161,1785275592,1,'admin',27,'1','Головна','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(162,1785275596,1,'admin',27,'11','трохи про нас','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(163,1785275663,1,'admin',27,'8','Камʼянець-Подільська фортеця','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(164,1785275668,1,'admin',27,'9','Софіївка в Умані — сад, як поезія','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(165,1785275735,1,'admin',27,'17','Драгобрат — високогірʼя Карпат','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(166,1785276015,1,'admin',27,'5','Маршрути Україною','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(167,1785276015,1,'admin',27,'17','Драгобрат — високогірʼя Карпат','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(168,1785277058,1,'admin',27,'5','Маршрути Україною','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(169,1785277058,1,'admin',27,'17','Драгобрат — високогірʼя Карпат','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(170,1785277070,1,'admin',27,'20','Говерла — найвища вершина України','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(171,1785277094,1,'admin',27,'20','Говерла — найвища вершина України','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(172,1785277111,1,'admin',27,'20','Говерла — найвища вершина України','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(173,1785277451,1,'admin',27,'16','Шацькі озера та кришталевий Світязь','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(174,1785277897,1,'admin',27,'16','Шацькі озера та кришталевий Світязь','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(175,1785277897,1,'admin',27,'5','Маршрути Україною','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),(176,1785277897,1,'admin',27,'20','Говерла — найвища вершина України','Editing resource','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36');
/*!40000 ALTER TABLE `k6on_manager_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_member_groups`
--

DROP TABLE IF EXISTS `k6on_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_member_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_group` int NOT NULL DEFAULT '0',
  `member` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `k6on_member_groups_ix_group_member` (`user_group`,`member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_member_groups`
--

LOCK TABLES `k6on_member_groups` WRITE;
/*!40000 ALTER TABLE `k6on_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_membergroup_access`
--

DROP TABLE IF EXISTS `k6on_membergroup_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_membergroup_access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `membergroup` int NOT NULL DEFAULT '0',
  `documentgroup` int NOT NULL DEFAULT '0',
  `context` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_membergroup_access`
--

LOCK TABLES `k6on_membergroup_access` WRITE;
/*!40000 ALTER TABLE `k6on_membergroup_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_membergroup_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_membergroup_names`
--

DROP TABLE IF EXISTS `k6on_membergroup_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_membergroup_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `k6on_membergroup_names_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_membergroup_names`
--

LOCK TABLES `k6on_membergroup_names` WRITE;
/*!40000 ALTER TABLE `k6on_membergroup_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_membergroup_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_migrations_install`
--

DROP TABLE IF EXISTS `k6on_migrations_install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_migrations_install` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_migrations_install`
--

LOCK TABLES `k6on_migrations_install` WRITE;
/*!40000 ALTER TABLE `k6on_migrations_install` DISABLE KEYS */;
INSERT INTO `k6on_migrations_install` VALUES (1,'2018_06_29_182342_create_active_user_locks_table',1),(2,'2018_06_29_182342_create_active_user_sessions_table',1),(3,'2018_06_29_182342_create_active_users_table',1),(4,'2018_06_29_182342_create_categories_table',1),(5,'2018_06_29_182342_create_document_groups_table',1),(6,'2018_06_29_182342_create_documentgroup_names_table',1),(7,'2018_06_29_182342_create_event_log_table',1),(8,'2018_06_29_182342_create_manager_log_table',1),(9,'2018_06_29_182342_create_manager_users_table',1),(10,'2018_06_29_182342_create_member_groups_table',1),(11,'2018_06_29_182342_create_membergroup_access_table',1),(12,'2018_06_29_182342_create_membergroup_names_table',1),(13,'2018_06_29_182342_create_permissions_groups_table',1),(14,'2018_06_29_182342_create_permissions_table',1),(15,'2018_06_29_182342_create_role_permissions_table',1),(16,'2018_06_29_182342_create_site_content_table',1),(17,'2018_06_29_182342_create_site_htmlsnippets_table',1),(18,'2018_06_29_182342_create_site_module_access_table',1),(19,'2018_06_29_182342_create_site_module_depobj_table',1),(20,'2018_06_29_182342_create_site_modules_table',1),(21,'2018_06_29_182342_create_site_plugin_events_table',1),(22,'2018_06_29_182342_create_site_plugins_table',1),(23,'2018_06_29_182342_create_site_snippets_table',1),(24,'2018_06_29_182342_create_site_templates_table',1),(25,'2018_06_29_182342_create_site_tmplvar_access_table',1),(26,'2018_06_29_182342_create_site_tmplvar_contentvalues_table',1),(27,'2018_06_29_182342_create_site_tmplvar_templates_table',1),(28,'2018_06_29_182342_create_site_tmplvars_table',1),(29,'2018_06_29_182342_create_system_eventnames_table',1),(30,'2018_06_29_182342_create_system_settings_table',1),(31,'2018_06_29_182342_create_user_attributes_table',1),(32,'2018_06_29_182342_create_user_roles_table',1),(33,'2018_06_29_182342_create_user_settings_table',1),(34,'2018_06_29_182342_create_web_groups_table',1),(35,'2018_06_29_182342_create_web_user_attributes_table',1),(36,'2018_06_29_182342_create_web_user_settings_table',1),(37,'2018_06_29_182342_create_web_users_table',1),(38,'2018_06_29_182342_create_webgroup_access_table',1),(39,'2018_06_29_182342_create_webgroup_names_table',1),(40,'2020_09_12_110820_create_site_content_closure',1),(41,'2020_09_16_110820_update_web_user_attributes_table',1),(42,'2020_10_05_124820_second_update_web_user_attributes_table',1),(43,'2020_10_05_154230_drop_manager_user_tables',1),(44,'2020_10_05_162325_rename_web_user_tables',1),(45,'2020_10_08_112342_remove_column_from_role_table',1),(46,'2020_10_12_065655_make_guid_nullable_in_modules',1),(47,'2020_10_12_065655_make_moduleguid_nullable_in_plugins',1),(48,'2020_10_28_154230_drop_webuser_group_tables',1),(49,'2020_10_30_065655_make_dob_nullable_in_userattributes',1),(50,'2020_11_02_100555_add_token_columns_to_user_table',1),(51,'2020_11_10_110555_add_verified_columns_to_user_table',1),(52,'2020_11_22_114803_create_user_role_vars',1),(53,'2020_11_22_114809_create_user_values',1),(54,'2020_12_23_065655_make_display_nullable_in_tmplvars',1),(55,'2021_02_05_121655_add_index_to_pubdate_column_content_table',1),(56,'2021_02_10_060454_add_properties_column_to_site_tmplvars',1),(57,'2021_02_17_102610_rename_donthit_column_in_site_content_table',1),(58,'2022_04_17_133922_add_context_column_to_membergroup_access',1),(59,'2026_01_17_000000_fix_columns',1),(60,'2026_03_29_000000_create_file_groups_table',1),(61,'2018_06_29_182342_create_permissions_table',1),(62,'2025_12_25_000000_initial_schema',2),(63,'2026_04_12_000000_create_system_cli_tasks_tables',2);
/*!40000 ALTER TABLE `k6on_migrations_install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_permissions`
--

DROP TABLE IF EXISTS `k6on_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int DEFAULT NULL,
  `disabled` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_permissions`
--

LOCK TABLES `k6on_permissions` WRITE;
/*!40000 ALTER TABLE `k6on_permissions` DISABLE KEYS */;
INSERT INTO `k6on_permissions` VALUES (1,'Request manager frames','frames','role_frames',1,1,NULL,NULL),(2,'Request manager intro page','home','role_home',1,1,NULL,NULL),(3,'View widget Recently edited/created Resources','widget_recent_info','role_widget_recent_info',1,0,NULL,NULL),(4,'View help pages','help','role_help',1,0,NULL,NULL),(5,'View action completed screen','action_ok','role_actionok',1,1,NULL,NULL),(6,'View error dialog','error_dialog','role_errors',1,1,NULL,NULL),(7,'View the about page','about','role_about',1,1,NULL,NULL),(8,'View widget Online users','widget_online_info','role_widget_online_info',1,0,NULL,NULL),(9,'Change password','change_password','role_change_password',1,0,NULL,NULL),(10,'Save password','save_password','role_save_password',1,0,NULL,NULL),(11,'View a Resource\'s data','view_document','role_view_docdata',2,1,NULL,NULL),(12,'Create new Resources','new_document','role_create_doc',2,0,NULL,NULL),(13,'Edit a Resource','edit_document','role_edit_doc',2,0,NULL,NULL),(14,'Change Resource-Type','change_resourcetype','role_change_resourcetype',2,0,NULL,NULL),(15,'Save Resources','save_document','role_save_doc',2,0,NULL,NULL),(16,'Publish Resources','publish_document','role_publish_doc',2,0,NULL,NULL),(17,'Delete Resources','delete_document','role_delete_doc',2,0,NULL,NULL),(18,'Permanently purge deleted Resources','empty_trash','role_empty_trash',2,0,NULL,NULL),(19,'Empty the site\'s cache','empty_cache','role_cache_refresh',2,0,NULL,NULL),(20,'View Unpublished Resources','view_unpublished','role_view_unpublished',2,0,NULL,NULL),(21,'Use the file manager (full root access)','file_manager','role_file_manager',3,0,NULL,NULL),(22,'Manage assets/files','assets_files','role_assets_files',3,0,NULL,NULL),(23,'Manage assets/images','assets_images','role_assets_images',3,0,NULL,NULL),(24,'Use the Category Manager','category_manager','role_category_manager',4,0,NULL,NULL),(25,'Create new Module','new_module','role_new_module',5,0,NULL,NULL),(26,'Edit Module','edit_module','role_edit_module',5,0,NULL,NULL),(27,'Save Module','save_module','role_save_module',5,0,NULL,NULL),(28,'Delete Module','delete_module','role_delete_module',5,0,NULL,NULL),(29,'Run Module','exec_module','role_run_module',5,0,NULL,NULL),(30,'List Module','list_module','role_list_module',5,0,NULL,NULL),(31,'Create new site Templates','new_template','role_create_template',6,0,NULL,NULL),(32,'Edit site Templates','edit_template','role_edit_template',6,0,NULL,NULL),(33,'Save Templates','save_template','role_save_template',6,0,NULL,NULL),(34,'Delete Templates','delete_template','role_delete_template',6,0,NULL,NULL),(35,'Create new Snippets','new_snippet','role_create_snippet',7,0,NULL,NULL),(36,'Edit Snippets','edit_snippet','role_edit_snippet',7,0,NULL,NULL),(37,'Save Snippets','save_snippet','role_save_snippet',7,0,NULL,NULL),(38,'Delete Snippets','delete_snippet','role_delete_snippet',7,0,NULL,NULL),(39,'Create new Chunks','new_chunk','role_create_chunk',8,0,NULL,NULL),(40,'Edit Chunks','edit_chunk','role_edit_chunk',8,0,NULL,NULL),(41,'Save Chunks','save_chunk','role_save_chunk',8,0,NULL,NULL),(42,'Delete Chunks','delete_chunk','role_delete_chunk',8,0,NULL,NULL),(43,'Create new Plugins','new_plugin','role_create_plugin',9,0,NULL,NULL),(44,'Edit Plugins','edit_plugin','role_edit_plugin',9,0,NULL,NULL),(45,'Save Plugins','save_plugin','role_save_plugin',9,0,NULL,NULL),(46,'Delete Plugins','delete_plugin','role_delete_plugin',9,0,NULL,NULL),(47,'Create new users','new_user','role_new_user',10,0,NULL,NULL),(48,'Edit users','edit_user','role_edit_user',10,0,NULL,NULL),(49,'Save users','save_user','role_save_user',10,0,NULL,NULL),(50,'Delete users','delete_user','role_delete_user',10,0,NULL,NULL),(51,'Manager access permissions','access_permissions','manager_access_permissions',11,0,NULL,NULL),(52,'Manage document and user groups','manage_groups','manage_groups',11,0,NULL,NULL),(53,'Manage document permissions','manage_document_permissions','manage_document_permissions',11,0,NULL,NULL),(54,'Manage module permissions','manage_module_permissions','manage_module_permissions',11,0,NULL,NULL),(55,'Manage TV permissions','manage_tv_permissions','manage_tv_permissions',11,0,NULL,NULL),(56,'Create new roles','new_role','role_new_role',12,0,NULL,NULL),(57,'Edit roles','edit_role','role_edit_role',12,0,NULL,NULL),(58,'Save roles','save_role','role_save_role',12,0,NULL,NULL),(59,'Delete roles','delete_role','role_delete_role',12,0,NULL,NULL),(60,'View event log','view_eventlog','role_view_eventlog',13,0,NULL,NULL),(61,'Delete event log','delete_eventlog','role_delete_eventlog',13,0,NULL,NULL),(62,'View system logs','logs','role_view_logs',14,0,NULL,NULL),(63,'Change site settings','settings','role_edit_settings',14,0,NULL,NULL),(64,'Use the Backup Manager','bk_manager','role_bk_manager',14,0,NULL,NULL),(65,'Remove Locks','remove_locks','role_remove_locks',14,0,NULL,NULL),(66,'Display Locks','display_locks','role_display_locks',14,0,NULL,NULL),(67,'View System Tasks','system_tasks.view','',15,0,'2026-07-28 08:58:15','2026-07-28 08:58:15'),(68,'Manage System Task Packages','system_tasks.manage_packages','',15,0,'2026-07-28 08:58:15','2026-07-28 08:58:15'),(69,'Run Site Update Tasks','system_tasks.site_update','',15,0,'2026-07-28 08:58:15','2026-07-28 08:58:15');
/*!40000 ALTER TABLE `k6on_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_permissions_groups`
--

DROP TABLE IF EXISTS `k6on_permissions_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_permissions_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_permissions_groups`
--

LOCK TABLES `k6on_permissions_groups` WRITE;
/*!40000 ALTER TABLE `k6on_permissions_groups` DISABLE KEYS */;
INSERT INTO `k6on_permissions_groups` VALUES (1,'General','page_data_general',NULL,NULL),(2,'Content Management','role_content_management',NULL,NULL),(3,'File Management','role_file_management',NULL,NULL),(4,'Category Management','category_management',NULL,NULL),(5,'Module Management','role_module_management',NULL,NULL),(6,'Template Management','role_template_management',NULL,NULL),(7,'Snippet Management','role_snippet_management',NULL,NULL),(8,'Chunk Management','role_chunk_management',NULL,NULL),(9,'Plugin Management','role_plugin_management',NULL,NULL),(10,'User Management','role_user_management',NULL,NULL),(11,'Permissions','role_udperms',NULL,NULL),(12,'Role Management','role_role_management',NULL,NULL),(13,'Events Log Management','role_eventlog_management',NULL,NULL),(14,'Config Management','role_config_management',NULL,NULL),(15,'System Tasks','system_tasks.permissions_group','2026-07-28 08:58:15','2026-07-28 08:58:15');
/*!40000 ALTER TABLE `k6on_permissions_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_role_permissions`
--

DROP TABLE IF EXISTS `k6on_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_role_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_role_permissions`
--

LOCK TABLES `k6on_role_permissions` WRITE;
/*!40000 ALTER TABLE `k6on_role_permissions` DISABLE KEYS */;
INSERT INTO `k6on_role_permissions` VALUES (1,'frames',1,NULL,NULL),(2,'home',1,NULL,NULL),(3,'widget_recent_info',1,NULL,NULL),(4,'help',1,NULL,NULL),(5,'role_actionok',1,NULL,NULL),(6,'error_dialog',1,NULL,NULL),(7,'about',1,NULL,NULL),(8,'widget_online_info',1,NULL,NULL),(9,'change_password',1,NULL,NULL),(10,'save_password',1,NULL,NULL),(11,'view_document',1,NULL,NULL),(12,'new_document',1,NULL,NULL),(13,'edit_document',1,NULL,NULL),(14,'change_resourcetype',1,NULL,NULL),(15,'save_document',1,NULL,NULL),(16,'publish_document',1,NULL,NULL),(17,'delete_document',1,NULL,NULL),(18,'empty_trash',1,NULL,NULL),(19,'empty_cache',1,NULL,NULL),(20,'view_unpublished',1,NULL,NULL),(21,'file_manager',1,NULL,NULL),(22,'assets_files',1,NULL,NULL),(23,'assets_images',1,NULL,NULL),(24,'category_manager',1,NULL,NULL),(25,'new_module',1,NULL,NULL),(26,'edit_module',1,NULL,NULL),(27,'save_module',1,NULL,NULL),(28,'delete_module',1,NULL,NULL),(29,'exec_module',1,NULL,NULL),(30,'list_module',1,NULL,NULL),(31,'new_template',1,NULL,NULL),(32,'edit_template',1,NULL,NULL),(33,'save_template',1,NULL,NULL),(34,'delete_template',1,NULL,NULL),(35,'new_snippet',1,NULL,NULL),(36,'edit_snippet',1,NULL,NULL),(37,'save_snippet',1,NULL,NULL),(38,'delete_snippet',1,NULL,NULL),(39,'new_chunk',1,NULL,NULL),(40,'edit_chunk',1,NULL,NULL),(41,'save_chunk',1,NULL,NULL),(42,'delete_chunk',1,NULL,NULL),(43,'new_plugin',1,NULL,NULL),(44,'edit_plugin',1,NULL,NULL),(45,'save_plugin',1,NULL,NULL),(46,'delete_plugin',1,NULL,NULL),(47,'new_user',1,NULL,NULL),(48,'edit_user',1,NULL,NULL),(49,'save_user',1,NULL,NULL),(50,'delete_user',1,NULL,NULL),(51,'access_permissions',1,NULL,NULL),(52,'manage_groups',1,NULL,NULL),(53,'manage_document_permissions',1,NULL,NULL),(54,'manage_module_permissions',1,NULL,NULL),(55,'manage_tv_permissions',1,NULL,NULL),(56,'new_role',1,NULL,NULL),(57,'edit_role',1,NULL,NULL),(58,'save_role',1,NULL,NULL),(59,'delete_role',1,NULL,NULL),(60,'view_eventlog',1,NULL,NULL),(61,'delete_eventlog',1,NULL,NULL),(62,'logs',1,NULL,NULL),(63,'settings',1,NULL,NULL),(64,'bk_manager',1,NULL,NULL),(65,'remove_locks',1,NULL,NULL),(66,'display_locks',1,NULL,NULL),(67,'frames',2,NULL,NULL),(68,'home',2,NULL,NULL),(69,'widget_recent_info',2,NULL,NULL),(70,'help',2,NULL,NULL),(71,'role_actionok',2,NULL,NULL),(72,'error_dialog',2,NULL,NULL),(73,'about',2,NULL,NULL),(74,'widget_online_info',2,NULL,NULL),(75,'change_password',2,NULL,NULL),(76,'save_password',2,NULL,NULL),(77,'view_document',2,NULL,NULL),(78,'new_document',2,NULL,NULL),(79,'edit_document',2,NULL,NULL),(80,'change_resourcetype',2,NULL,NULL),(81,'save_document',2,NULL,NULL),(82,'publish_document',2,NULL,NULL),(83,'delete_document',2,NULL,NULL),(84,'empty_cache',2,NULL,NULL),(85,'view_unpublished',2,NULL,NULL),(86,'file_manager',2,NULL,NULL),(87,'assets_files',2,NULL,NULL),(88,'assets_images',2,NULL,NULL),(89,'exec_module',2,NULL,NULL),(90,'list_module',2,NULL,NULL),(91,'edit_chunk',2,NULL,NULL),(92,'save_chunk',2,NULL,NULL),(93,'remove_locks',2,NULL,NULL),(94,'display_locks',2,NULL,NULL),(95,'access_permissions',2,NULL,NULL),(96,'manage_document_permissions',2,NULL,NULL),(97,'frames',3,NULL,NULL),(98,'home',3,NULL,NULL),(99,'widget_recent_info',3,NULL,NULL),(100,'help',3,NULL,NULL),(101,'role_actionok',3,NULL,NULL),(102,'error_dialog',3,NULL,NULL),(103,'about',3,NULL,NULL),(104,'widget_online_info',3,NULL,NULL),(105,'change_password',3,NULL,NULL),(106,'save_password',3,NULL,NULL),(107,'view_document',3,NULL,NULL),(108,'new_document',3,NULL,NULL),(109,'edit_document',3,NULL,NULL),(110,'change_resourcetype',3,NULL,NULL),(111,'save_document',3,NULL,NULL),(112,'publish_document',3,NULL,NULL),(113,'delete_document',3,NULL,NULL),(114,'empty_trash',3,NULL,NULL),(115,'empty_cache',3,NULL,NULL),(116,'view_unpublished',3,NULL,NULL),(117,'file_manager',3,NULL,NULL),(118,'assets_files',3,NULL,NULL),(119,'assets_images',3,NULL,NULL),(120,'exec_module',3,NULL,NULL),(121,'list_module',3,NULL,NULL),(122,'new_template',3,NULL,NULL),(123,'edit_template',3,NULL,NULL),(124,'save_template',3,NULL,NULL),(125,'delete_template',3,NULL,NULL),(126,'new_chunk',3,NULL,NULL),(127,'edit_chunk',3,NULL,NULL),(128,'save_chunk',3,NULL,NULL),(129,'delete_chunk',3,NULL,NULL),(130,'new_user',3,NULL,NULL),(131,'edit_user',3,NULL,NULL),(132,'save_user',3,NULL,NULL),(133,'delete_user',3,NULL,NULL),(134,'logs',3,NULL,NULL),(135,'settings',3,NULL,NULL),(136,'bk_manager',3,NULL,NULL),(137,'remove_locks',3,NULL,NULL),(138,'display_locks',3,NULL,NULL),(139,'access_permissions',3,NULL,NULL),(140,'manage_document_permissions',3,NULL,NULL),(141,'system_tasks.view',1,'2026-07-28 08:58:15','2026-07-28 08:58:15'),(142,'system_tasks.manage_packages',1,'2026-07-28 08:58:15','2026-07-28 08:58:15'),(143,'system_tasks.site_update',1,'2026-07-28 08:58:15','2026-07-28 08:58:15');
/*!40000 ALTER TABLE `k6on_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_content`
--

DROP TABLE IF EXISTS `k6on_site_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'document',
  `contentType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `longtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `link_attributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int NOT NULL DEFAULT '0',
  `pub_date` int NOT NULL DEFAULT '0',
  `unpub_date` int NOT NULL DEFAULT '0',
  `parent` int NOT NULL DEFAULT '0',
  `isfolder` int NOT NULL DEFAULT '0',
  `introtext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Used to provide quick summary of the document',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int NOT NULL DEFAULT '0',
  `menuindex` int NOT NULL DEFAULT '0',
  `searchable` int NOT NULL DEFAULT '1',
  `cacheable` int NOT NULL DEFAULT '1',
  `createdby` int NOT NULL DEFAULT '0',
  `createdon` int NOT NULL DEFAULT '0',
  `editedby` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0',
  `deletedon` int NOT NULL DEFAULT '0',
  `deletedby` int NOT NULL DEFAULT '0',
  `publishedon` int NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Menu title',
  `hide_from_tree` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `k6on_site_content_typeidx` (`type`),
  KEY `k6on_site_content_aliasidx` (`alias`),
  KEY `k6on_site_content_parent` (`parent`),
  KEY `k6on_site_content_pub_unpub_published_idx` (`pub_date`,`unpub_date`,`published`),
  KEY `k6on_site_content_pub_unpub_idx` (`pub_date`,`unpub_date`),
  KEY `k6on_site_content_unpub_idx` (`unpub_date`),
  KEY `k6on_site_content_pub_idx` (`pub_date`),
  FULLTEXT KEY `k6on_site_content_content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_content`
--

LOCK TABLES `k6on_site_content` WRITE;
/*!40000 ALTER TABLE `k6on_site_content` DISABLE KEYS */;
INSERT INTO `k6on_site_content` VALUES (1,'document','text/html','Головна','Блог Українських Екскурсоводів','','index','',1,0,0,0,0,'','',1,1,0,1,1,1,1785229094,0,1785276997,0,0,0,1130304721,1,'Головна',0,0,0,0,0,1),(5,'document','text/html','Маршрути Україною','Останні статті','','blog','',1,0,0,0,1,'','',1,2,2,1,1,1,1785246431,0,1785276997,0,0,0,1785246429,1,'Маршрути',0,0,0,0,0,1),(6,'document','text/html','Говерла — найвища вершина України','Говерла — найвища вершина України','','hoverla','',1,0,0,5,0,'Підкоріть Говерлу — символ українських Карпат. Маршрут підходить і новачкам, і досвідченим мандрівникам.','<p>Говерла (2061 м) — найвища гора України, розташована в Чорногірському хребті. З вершини відкривається панорама на Чорногору, Петрос і полонини Закарпаття.</p><p>Найзручніший старт — з курорту Драгобрат або з села Лазещина. У гарну погоду підйом займає 3–5 годин. Обовʼязково візьміть теплу куртку, воду та трекінгове взуття: погода в горах змінюється швидко.</p><p>Найкращий сезон — з кінця травня до жовтня. Узимку маршрут потребує досвіду та спорядження. На вершині варто залишити кілька хвилин тиші — і зробити фото на згадку про справжню карпатську пригоду.</p>',1,3,0,1,1,1,1785246493,0,1785276997,0,0,0,1785190597,1,'',0,0,0,0,1,1),(7,'document','text/html','Озеро Синевир — перлина Закарпаття','Озеро Синевир — перлина Закарпаття','','synevyr','',1,0,0,5,0,'Найбільше гірське озеро Українських Карпат зачаровує кольором води й легендами про кохання.','<p>Синевир називають «Морським оком Карпат». Озеро лежить на висоті близько 989 м у Національному природному парку «Синевир» і оточене смерековими лісами.</p><p>До озера зручно дістатися з Міжгірʼя. Навколо — екологічні стежки, оглядові майданчики та центр реабілітації бурих ведмедів. Вода холодна навіть улітку, тож купання — лише для найсміливіших.</p><p>Приїжджайте рано вранці: туман над гладдю води створює майже казковий краєвид. Не забудьте фотоапарат і термос із чаєм — після прогулянки лісом він стане в пригоді.</p>',1,3,1,1,1,1,1785246537,0,1785276997,0,0,0,1785017797,1,'',0,0,0,0,1,1),(8,'document','text/html','Камʼянець-Подільська фортеця','Камʼянець-Подільська фортеця','','kamianets-podilskyi','',1,0,0,5,0,'Один із наймальовничіших замків України стоїть на скелястому острові, оточеному петлею річки Смотрич.','<p>Камʼянець-Подільська фортеця — візитівка Поділля й одна з найкраще збережених оборонних споруд країни. Камʼяні башти, мости й глибокий каньйон Смотрича створюють краєвид, який легко впізнати навіть із поштових листівок.</p><p>Огляньте Старе місто, Польську й Вірменську брами, підніміться на башти фортеці та пройдіть міст, що веде до цитаделі. Увечері підсвітка робить камʼяні стіни особливо драматичними.</p><p>Поруч варто відвідати каньйон Смотрича й панорами з оглядових майданчиків. Фортеця ідеально пасує для одноденної поїздки або вікенду з нічлігом у старому місті.</p>',1,3,2,1,1,1,1785246556,0,1785276997,0,0,0,1784844997,1,'',0,0,0,0,1,1),(9,'document','text/html','Софіївка в Умані — сад, як поезія','Софіївка в Умані — сад, як поезія','','sofiyivka','',1,0,0,5,0,'Національний дендропарк «Софіївка» — шедевр садово-паркового мистецтва серед мальовничих схилів Черкащини.','<p>«Софіївку» закладено наприкінці XVIII століття на честь Софії Потоцької. Гроти, водоспади, штучні озера й античні альтанки створюють атмосферу європейського парку романтизму.</p><p>Найкраще гуляти зранку або пізно вдень, коли менше відвідувачів і мʼякше світло для фото. Обовʼязкові локації — Нижній став, Грот Венери, Каліпсо та Центральна алея.</p><p>Парк цікавий у будь-яку пору року: навесні — цвітіння, улітку — прохолода біля води, восени — золоте листя. Це ідеальний маршрут для сімейної подорожі та спокійного відпочинку серед природи.</p>',1,3,3,1,1,1,1785246574,0,1785276997,0,0,0,1784672197,1,'',0,0,0,0,1,1),(10,'document','text/html','Київські пагорби й краєвиди Дніпра','Київські пагорби й краєвиди Дніпра','','kyiv-hills','',1,0,0,5,0,'Столиця відкривається з пагорбів: Володимирська гірка, Андріївський узвіз і набережна Дніпра.','<p>Київ побудований на пагорбах, і саме звідси місто виглядає найвиразніше. Почніть із Володимирської гірки, спустіться Андріївським узвозом до Подолу, а звідти вийдіть до набережної Дніпра.</p><p>Уздовж маршруту — Андріївська церква, контрасти старої й нової архітектури, каштани й широкі панорами на лівий берег. У золоту годину місто особливо фотогенічне.</p><p>Для довшої прогулянки додайте Печерськ, Маріїнський парк і міст пішоходів. Київський маршрут легко адаптувати і для короткої прогулянки, і для цілого дня відкриттів.</p>',1,3,4,1,1,1,1785246595,0,1785276997,0,0,0,1784499397,1,'',0,0,0,0,1,1),(11,'document','text/html','трохи про нас','про нас','','about','',1,0,0,0,0,NULL,'<section class=\"about-us\">\r\n  <div class=\"container\">\r\n    <div class=\"row\">\r\n      <div class=\"col-lg-12\">\r\n        <img src=\"assets/images/about-us.jpg\" alt=\"Про нас\">\r\n        <p>Блог Українських Екскурсоводів — це зібрання маршрутів, краєвидів і цікавих місць України. Ми збираємо ідеї для подорожей горами, озерами, фортецями та містами.</p>\r\n        <p>Наша мета — допомогти мандрівникам відкривати країну глибше: від Говерли й Синевира до Львова, Одеси та каньйонів Поділля.</p>\r\n      </div>\r\n    </div>\r\n    <div class=\"row\">\r\n      <div class=\"col-lg-6\">\r\n        <h4>Що ви знайдете в статтях</h4>\r\n        <p>Короткі описи маршрутів, практичні поради, найкращі сезони для візиту та атмосферні фотографії українських локацій.</p>\r\n      </div>\r\n      <div class=\"col-lg-6\">\r\n        <h4>Для кого цей блог</h4>\r\n        <p>Для самостійних мандрівників, сімей і всіх, хто шукає натхнення для наступної подорожі Україною.</p>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</section>',1,4,1,1,1,0,1785248455,0,1785276997,0,0,0,0,0,'Про нас',0,0,0,0,0,1),(12,'document','text/html','зв\'яжімося!','контакти','','contact','',1,0,0,0,0,NULL,'<section class=\"contact-us\">\r\n  <div class=\"container\">\r\n    <div class=\"row\">\r\n      <div class=\"col-lg-12\">\r\n        <div class=\"down-contact\">\r\n          <div class=\"row\">\r\n            <div class=\"col-lg-8\">\r\n              <div class=\"sidebar-item contact-form\">\r\n                <div class=\"sidebar-heading\">\r\n                  <h2>Напишіть нам</h2>\r\n                </div>\r\n                <div class=\"content\">\r\n                  <form id=\"contact\" action=\"\" method=\"post\">\r\n                    <div class=\"row\">\r\n                      <div class=\"col-md-6 col-sm-12\">\r\n                        <fieldset>\r\n                          <input name=\"name\" type=\"text\" id=\"name\" placeholder=\"Ваше ім\'я\" required>\r\n                        </fieldset>\r\n                      </div>\r\n                      <div class=\"col-md-6 col-sm-12\">\r\n                        <fieldset>\r\n                          <input name=\"email\" type=\"text\" id=\"email\" placeholder=\"Ваш email\" required>\r\n                        </fieldset>\r\n                      </div>\r\n                      <div class=\"col-md-12 col-sm-12\">\r\n                        <fieldset>\r\n                          <input name=\"subject\" type=\"text\" id=\"subject\" placeholder=\"Тема\">\r\n                        </fieldset>\r\n                      </div>\r\n                      <div class=\"col-lg-12\">\r\n                        <fieldset>\r\n                          <textarea name=\"message\" rows=\"6\" id=\"message\" placeholder=\"Ваше повідомлення\" required></textarea>\r\n                        </fieldset>\r\n                      </div>\r\n                      <div class=\"col-lg-12\">\r\n                        <fieldset>\r\n                          <button type=\"submit\" id=\"form-submit\" class=\"main-button\">Надіслати</button>\r\n                        </fieldset>\r\n                      </div>\r\n                    </div>\r\n                  </form>\r\n                </div>\r\n              </div>\r\n            </div>\r\n            <div class=\"col-lg-4\">\r\n              <div class=\"sidebar-item contact-information\">\r\n                <div class=\"sidebar-heading\">\r\n                  <h2>контактна інформація</h2>\r\n                </div>\r\n                <div class=\"content\">\r\n                  <ul>\r\n                    <li>\r\n                      <h5>+380 44 000 00 00</h5>\r\n                      <span>ТЕЛЕФОН</span>\r\n                    </li>\r\n                    <li>\r\n                      <h5>info@ua-guides.local</h5>\r\n                      <span>EMAIL</span>\r\n                    </li>\r\n                    <li>\r\n                      <h5>м. Київ,<br>вул. Хрещатик, 1</h5>\r\n                      <span>АДРЕСА</span>\r\n                    </li>\r\n                  </ul>\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n      <div class=\"col-lg-12\">\r\n        <div id=\"map\">\r\n          <iframe src=\"https://maps.google.com/maps?q=Kyiv,+Ukraine&t=&z=12&ie=UTF8&iwloc=&output=embed\" width=\"100%\" height=\"450px\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</section>',1,4,3,1,1,0,1785248455,0,1785276997,0,0,0,0,0,'Контакти',0,0,0,0,0,1),(13,'document','text/html','Львів: площа Ринок і дахи старого міста','Львів: площа Ринок і дахи старого міста','','lviv-rynok','',1,0,0,5,0,'Серце Галичини — бруківка, кавʼярні й панорами з оглядових веж історичного центру.','<p>Площа Ринок — точка, з якої зручно починати будь-яку львівську прогулянку. Ратуша, камʼяниці з різними фасадами, дворики й вузькі вулички ведуть до Оперного театру, Високого Замку та Личаківського цвинтаря.</p><p>Підніміться на вежу ратуші або на Високий Замок — звідти відкривається класичний краєвид на дахи старого міста. Увечері площа оживає музикою й світлом кавʼярень.</p><p>Львів варто досліджувати повільно: між музеями залишайте час на каву по-львівськи та випадкові дворики. Саме в деталях місто розкривається найкраще.</p>',1,3,5,1,1,0,1785249831,0,1785276997,0,0,0,1784326597,0,'',0,0,0,0,1,1),(14,'document','text/html','Одеса й Чорноморське узбережжя','Одеса й Чорноморське узбережжя','','odesa-sea','',1,0,0,5,0,'Морське повітря, Потьомкінські сходи й довгі пляжі — класика південного маршруту Україною.','<p>Одеса зустрічає широкими бульварами, колоритом Приморського бульвару та видом на Чорне море з Потьомкінських сходів. Місто легко поєднує історію, море й гастрономію.</p><p>Після прогулянки центром вирушайте на Аркадію або Ланжерон. У сезон тут багато життя, а в міжсезоння узбережжя дарує спокійніші краєвиди й довгі прогулянки вздовж хвиль.</p><p>Додайте до маршруту Одеський оперний театр, Дерибасівську та порт. Одеса — про настрій: трохи сонця, трохи солоного вітру й багато історій на кожному розі.</p>',1,3,6,1,1,0,1785249831,0,1785276997,0,0,0,1784153797,0,'',0,0,0,0,1,1),(15,'document','text/html','Хотинська фортеця над Дністром','Хотинська фортеця над Дністром','','khotyn-fortress','',1,0,0,5,0,'Могутні мури Хотина височіють над Дністром і зберігають памʼять про великі битви Європи.','<p>Хотинська фортеця — один із найпотужніших оборонних комплексів України. Її вежі й мури стоять на високому березі Дністра, а краєвид довкола нагадує декорації до історичного фільму.</p><p>Усередині комплексу можна пройти подвірʼям, піднятися на стіни й уявити масштаб подій XVII століття. Поруч — мальовничі схили й річкові панорами, ідеальні для фото.</p><p>Зручно поєднувати з Камʼянцем-Подільським у один вікенд-маршрут Поділлям. Хотин особливо вражає на заході сонця, коли камінь набуває теплого відтінку.</p>',1,3,7,1,1,0,1785249831,0,1785276997,0,0,0,1783980997,0,'',0,0,0,0,1,1),(16,'document','text/html','Шацькі озера та кришталевий Світязь','Шацькі озера та кришталевий Світязь','','shatsk-svityaz','',1,0,0,5,0,'На Волині розкинувся край блакитних озер, головне з яких — прозоре озеро Світязь.','<p>Шацький національний природний парк обʼєднує десятки озер. Найвідоміше — Світязь: широке, світле, з водою, у якій видно дно на кілька метрів.</p><p>Тут добре купатися, кататися на велосипеді між озерами, спостерігати птахів і зустрічати світанки на березі. Інфраструктура розвинена, тож маршрут підходить і для сімейного відпочинку.</p><p>Окрім Світязя, загляньте до озер Пісочне й Луки. Шаччина — це про тишу, воду й відчуття, ніби Україна має власне «внутрішнє море».</p>',1,3,8,1,1,0,1785249831,0,1785276997,0,0,0,1783808197,0,'',0,0,0,0,1,1),(17,'document','text/html','Драгобрат — високогірʼя Карпат','Драгобрат — високогірʼя Карпат','','dragobrat','',1,0,0,5,0,'Найвищий гірськолижний курорт України влітку стає базою для походів на Близницю та полонини.','<p>Драгобрат розташований на висоті понад 1300 м і відкриває доступ до мальовничих хребтів Свидовця. Узимку сюди їдуть кататися, улітку — гуляти полонинами й підніматися на Близницю.</p><p>Повітря тут прохолодне навіть у липні, а краєвиди змінюються з кожним поворотом стежки. Ночуйте в готелі чи колибі, щоб зустріти світанок над хмарами.</p><p>Це чудова точка старту для багатоденних маршрутів Карпатами. Візьміть шари одягу, зручне взуття й запасіться часом — Драгобрат не любить поспіху.</p>',1,3,9,1,1,0,1785249831,0,1785276997,0,0,0,1783635397,0,'',0,0,0,0,1,1),(18,'document','text/html','Скелі Довбуша: стежки серед камʼяних велетнів','Скелі Довбуша: стежки серед камʼяних велетнів','','skeli-dovbusha','',1,0,0,5,0,'У лісах Івано-Франківщини ховаються скелі, оповиті легендами про опришка Олексу Довбуша.','<p>Скелі Довбуша — унікальний скельний комплекс і популярний екотуристичний маршрут біля Бубнища. Піщаникові брили утворюють коридори, печери й оглядові майданчики серед густого лісу.</p><p>Маршрут відносно доступний, але місцями потребує обережності: сходи, вузькі проходи й вологий камінь. Історичний шар легенд про Довбуша додає місцю особливої атмосфери.</p><p>Ідеально для одноденної поїздки з Івано-Франківська чи зі Львова. Після скель можна продовжити день у Карпатах — наприклад, у напрямку Татарова чи Буковеля.</p>',1,3,10,1,1,0,1785249831,0,1785276997,0,0,0,1783462597,0,'',0,0,0,0,1,1),(19,'document','text/html','Слайдер','Слайди головного банера','','banner','',1,0,0,0,1,NULL,'',1,5,4,1,1,0,1785276996,1,1785277107,0,0,0,0,0,'Слайдер',0,0,0,0,1,1),(20,'document','text/html','Говерла — найвища вершина України','Говерла — найвища вершина України','','slide-hoverla','',1,0,0,19,0,'','',1,5,0,1,1,0,1785276997,1,1785277107,0,0,0,1785190597,0,'',0,0,0,0,1,1),(21,'document','text/html','Озеро Синевир — перлина Закарпаття','Озеро Синевир — перлина Закарпаття','','slide-synevyr','',1,0,0,19,0,'','',1,5,1,1,1,0,1785276997,0,1785276997,0,0,0,1785017797,0,'',0,0,0,0,1,1),(22,'document','text/html','Камʼянець-Подільська фортеця','Камʼянець-Подільська фортеця','','slide-kamianets','',1,0,0,19,0,'','',1,5,2,1,1,0,1785276997,0,1785276997,0,0,0,1784844997,0,'',0,0,0,0,1,1),(23,'document','text/html','Софіївка в Умані — сад, як поезія','Софіївка в Умані — сад, як поезія','','slide-sofiyivka','',1,0,0,19,0,'','',1,5,3,1,1,0,1785276997,0,1785276997,0,0,0,1784672197,0,'',0,0,0,0,1,1),(24,'document','text/html','Київські пагорби й краєвиди Дніпра','Київські пагорби й краєвиди Дніпра','','slide-kyiv','',1,0,0,19,0,'','',1,5,4,1,1,0,1785276997,0,1785276997,0,0,0,1784499397,0,'',0,0,0,0,1,1),(25,'document','text/html','Львів: площа Ринок і дахи старого міста','Львів: площа Ринок і дахи старого міста','','slide-lviv','',1,0,0,19,0,'','',1,5,5,1,1,0,1785276997,0,1785276997,0,0,0,1784326597,0,'',0,0,0,0,1,1);
/*!40000 ALTER TABLE `k6on_site_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_content_closure`
--

DROP TABLE IF EXISTS `k6on_site_content_closure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_content_closure` (
  `closure_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ancestor` int unsigned NOT NULL,
  `descendant` int unsigned NOT NULL,
  `depth` int unsigned NOT NULL,
  PRIMARY KEY (`closure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_content_closure`
--

LOCK TABLES `k6on_site_content_closure` WRITE;
/*!40000 ALTER TABLE `k6on_site_content_closure` DISABLE KEYS */;
INSERT INTO `k6on_site_content_closure` VALUES (1,1,1,0),(2,2,2,0),(3,3,3,0),(4,4,4,0),(5,5,5,0),(7,6,6,0),(8,5,6,1),(10,7,7,0),(11,5,7,1),(13,8,8,0),(14,5,8,1),(16,9,9,0),(17,5,9,1),(19,10,10,0),(20,5,10,1),(21,11,11,0),(22,12,12,0),(24,13,13,0),(25,5,13,1),(27,14,14,0),(28,5,14,1),(30,15,15,0),(31,5,15,1),(33,16,16,0),(34,5,16,1),(36,17,17,0),(37,5,17,1),(39,18,18,0),(40,5,18,1),(41,19,19,0),(43,20,20,0),(44,19,20,1),(46,21,21,0),(47,19,21,1),(49,22,22,0),(50,19,22,1),(52,23,23,0),(53,19,23,1),(55,24,24,0),(56,19,24,1),(58,25,25,0),(59,19,25,1);
/*!40000 ALTER TABLE `k6on_site_content_closure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_htmlsnippets`
--

DROP TABLE IF EXISTS `k6on_site_htmlsnippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_htmlsnippets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chunk',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_htmlsnippets`
--

LOCK TABLES `k6on_site_htmlsnippets` WRITE;
/*!40000 ALTER TABLE `k6on_site_htmlsnippets` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_site_htmlsnippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_module_access`
--

DROP TABLE IF EXISTS `k6on_site_module_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_module_access` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `module` int NOT NULL DEFAULT '0',
  `usergroup` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_module_access`
--

LOCK TABLES `k6on_site_module_access` WRITE;
/*!40000 ALTER TABLE `k6on_site_module_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_site_module_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_module_depobj`
--

DROP TABLE IF EXISTS `k6on_site_module_depobj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_module_depobj` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module` int NOT NULL DEFAULT '0',
  `resource` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_module_depobj`
--

LOCK TABLES `k6on_site_module_depobj` WRITE;
/*!40000 ALTER TABLE `k6on_site_module_depobj` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_site_module_depobj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_modules`
--

DROP TABLE IF EXISTS `k6on_site_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `guid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sharedparams` tinyint(1) NOT NULL DEFAULT '0',
  `properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `modulecode` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_modules`
--

LOCK TABLES `k6on_site_modules` WRITE;
/*!40000 ALTER TABLE `k6on_site_modules` DISABLE KEYS */;
INSERT INTO `k6on_site_modules` VALUES (1,'Extras','<strong>0.2.0</strong> first repository for Evolution CMS',0,0,1,0,0,'',0,'',1785229095,1785229095,'store435243542tf542t5t',1,'',' \r\n/**\r\n * Extras\r\n * \r\n * first repository for Evolution CMS\r\n * \r\n * @category	module\r\n * @version 	0.2.0\n * @internal	@properties\r\n * @internal	@guid store435243542tf542t5t	\r\n * @internal	@shareparams 1\r\n * @internal	@dependencies requires files located at /assets/modules/store/\r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @installset base, sample\r\n * @lastupdate  10/04/2026\n */\r\n\r\n//AUTHORS: Bumkaka & Dmi3yy \r\ninclude_once(\'../assets/modules/store/core.php\');\n');
/*!40000 ALTER TABLE `k6on_site_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_plugin_events`
--

DROP TABLE IF EXISTS `k6on_site_plugin_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_plugin_events` (
  `pluginid` int NOT NULL,
  `evtid` int NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_plugin_events`
--

LOCK TABLES `k6on_site_plugin_events` WRITE;
/*!40000 ALTER TABLE `k6on_site_plugin_events` DISABLE KEYS */;
INSERT INTO `k6on_site_plugin_events` VALUES (1,24,0),(1,30,0),(1,39,0),(1,45,0),(1,51,0),(1,57,0),(1,71,0),(1,88,0),(2,110,0),(3,105,0),(4,68,0),(4,89,0),(4,110,1),(4,127,0);
/*!40000 ALTER TABLE `k6on_site_plugin_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_plugins`
--

DROP TABLE IF EXISTS `k6on_site_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Plugin',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Default Properties',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_plugins`
--

LOCK TABLES `k6on_site_plugins` WRITE;
/*!40000 ALTER TABLE `k6on_site_plugins` DISABLE KEYS */;
INSERT INTO `k6on_site_plugins` VALUES (1,'CodeMirror','<strong>1.6</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)',0,1,0,'\r\n/**\r\n * CodeMirror\r\n *\r\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)\r\n *\r\n * @category    plugin\r\n * @version     1.6\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit,OnTVFormRender\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &darktheme=Dark Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;one-dark &fontSize=Font-size;list;10,11,12,13,14,15,16,17,18;14 &lineHeight=Line-height;list;1,1.1,1.2,1.3,1.4,1.5;1.3 &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\r\n * @internal    @installset base\r\n * @reportissues https://github.com/evolution-cms/evolution/issues/\r\n * @documentation Official docs https://codemirror.net/doc/manual.html\r\n * @author      hansek from http://www.modxcms.cz\r\n * @author      update Mihanik71\r\n * @author      update Deesen\r\n * @author      update 64j\r\n * @lastupdate  08-01-2018\r\n */\r\n\r\n$_CM_BASE = \'assets/plugins/codemirror/\';\r\n\r\n$_CM_URL = EVO_SITE_URL . $_CM_BASE;\r\n\r\nrequire(EVO_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');\r\n',0,'{\"theme\":[{\"label\":\"Theme\",\"type\":\"list\",\"value\":\"default\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"default\",\"desc\":\"\"}],\"darktheme\":[{\"label\":\"Dark Theme\",\"type\":\"list\",\"value\":\"one-dark\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"one-dark\",\"desc\":\"\"}],\"fontSize\":[{\"label\":\"Font-size\",\"type\":\"list\",\"value\":\"14\",\"options\":\"10,11,12,13,14,15,16,17,18\",\"default\":\"14\",\"desc\":\"\"}],\"lineHeight\":[{\"label\":\"Line-height\",\"type\":\"list\",\"value\":\"1.3\",\"options\":\"1,1.1,1.2,1.3,1.4,1.5\",\"default\":\"1.3\",\"desc\":\"\"}],\"indentUnit\":[{\"label\":\"Indent unit\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"tabSize\":[{\"label\":\"The width of a tab character\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"lineWrapping\":[{\"label\":\"lineWrapping\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"matchBrackets\":[{\"label\":\"matchBrackets\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"activeLine\":[{\"label\":\"activeLine\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"emmet\":[{\"label\":\"emmet\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"search\":[{\"label\":\"search\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"indentWithTabs\":[{\"label\":\"indentWithTabs\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"undoDepth\":[{\"label\":\"undoDepth\",\"type\":\"int\",\"value\":\"200\",\"default\":\"200\",\"desc\":\"\"}],\"historyEventDelay\":[{\"label\":\"historyEventDelay\",\"type\":\"int\",\"value\":\"1250\",\"default\":\"1250\",\"desc\":\"\"}]}',0,'',1785229095,1785229095),(2,'OutdatedExtrasCheck','<strong>1.4.6</strong> Check for Outdated critical extras not compatible with EVO 1.4.6',0,1,0,'/**\r\n * OutdatedExtrasCheck\r\n *\r\n * Check for Outdated critical extras not compatible with EVO 1.4.6\r\n *\r\n * @category	plugin\r\n * @version     1.4.6\r\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @author      Author: Nicola Lambathakis\r\n * @internal    @events OnManagerWelcomeHome\r\n * @internal    @properties &wdgVisibility=Show widget for:;menu;All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly;AdminOnly &ThisRole=Run only for this role:;string;;;(role id) &ThisUser=Run only for this user:;string;;;(username)\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @installset base\r\n * @internal    @disabled 0\r\n */\r\n\r\nrequire EVO_BASE_PATH . \'assets/plugins/extrascheck/OutdatedExtrasCheck.plugin.php\';\r\n',0,'{\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Run only for this role:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Run only for this user:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}',0,'',1785229095,1785229095),(3,'TransAlias','<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides',0,1,0,'\n/**\n * TransAlias\n *\n * Human readible URL translation supporting multiple languages and overrides\n *\n * @category    plugin\n * @version     1.0.4\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @package     modx\n * @subpackage  modx.plugins.transalias\n * @author      Olivier B. Deland, additions by Mike Schell, rfoster\n * @internal    @properties &table_name=Trans table;list;common,russian,dutch,german,czech,utf8,utf8lowercase;russian &char_restrict=Restrict alias to;list;lowercase alphanumeric,alphanumeric,legal characters;lowercase alphanumeric &remove_periods=Remove Periods;list;Yes,No;No &word_separator=Word Separator;list;dash,underscore,none;dash &override_tv=Override TV name;string;\n * @internal    @events OnStripAlias\n * @internal    @modx_category Manager and Admin\n * @internal    @installset base, sample\n */\n\nrequire EVO_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';',0,'{\"table_name\":[{\"label\":\"Trans table\",\"type\":\"list\",\"value\":\"russian\",\"options\":\"common,russian,dutch,german,czech,utf8,utf8lowercase\",\"default\":\"russian\",\"desc\":\"\"}],\"char_restrict\":[{\"label\":\"Restrict alias to\",\"type\":\"list\",\"value\":\"lowercase alphanumeric\",\"options\":\"lowercase alphanumeric,alphanumeric,legal characters\",\"default\":\"lowercase alphanumeric\",\"desc\":\"\"}],\"remove_periods\":[{\"label\":\"Remove Periods\",\"type\":\"list\",\"value\":\"No\",\"options\":\"Yes,No\",\"default\":\"No\",\"desc\":\"\"}],\"word_separator\":[{\"label\":\"Word Separator\",\"type\":\"list\",\"value\":\"dash\",\"options\":\"dash,underscore,none\",\"default\":\"dash\",\"desc\":\"\"}],\"override_tv\":[{\"label\":\"Override TV name\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}',0,'',1785229095,1785229095),(4,'Updater','<strong>1.0.0</strong> show message about outdated CMS version',0,1,0,'\r\n/**\r\n * Updater\r\n *\r\n * show message about outdated CMS version\r\n *\r\n * @category    plugin\r\n * @version     1.0.0\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @author      Dmi3yy (dmi3yy.com)\r\n * @internal    @events OnManagerPageInit,OnManagerWelcomeHome,OnPageNotFound,OnSiteRefresh\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @properties &version=Version:;text;evolution-cms/evolution &wdgVisibility=Show widget for:;menu;All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly;All &ThisRole=Show only to this role id:;string;;;enter the role id &ThisUser=Show only to this username:;string;;;enter the username &showButton=Show Update Button:;menu;show,hide,AdminOnly;AdminOnly &type=Type:;menu;tags,releases,commits,branch;tags &branch=Branch/ref:;text;3.5.x &stableOnly=Offer upgrade to stable version only:;list;true,false;true &supportLink=Support Link:;text;https://evo.im/support.html\r\n * @internal    @legacy_names MODX.Evolution.updateNotify\r\n * @internal    @installset base\r\n * @internal    @disabled 0\r\n */\r\n\r\n\r\nrequire EVO_BASE_PATH.\'assets/plugins/updater/plugin.updater.php\';\r\n',0,'{\"version\":[{\"label\":\"Version:\",\"type\":\"text\",\"value\":\"evolution-cms\\/evolution\",\"default\":\"evolution-cms\\/evolution\",\"desc\":\"\"}],\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Show only to this role id:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Show only to this username:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"showButton\":[{\"label\":\"Show Update Button:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"show,hide,AdminOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"type\":[{\"label\":\"Type:\",\"type\":\"menu\",\"value\":\"tags\",\"options\":\"tags,releases,commits,branch\",\"default\":\"tags\",\"desc\":\"\"}],\"branch\":[{\"label\":\"Branch\\/ref:\",\"type\":\"text\",\"value\":\"3.5.x\",\"default\":\"3.5.x\",\"desc\":\"\"}],\"stableOnly\":[{\"label\":\"Offer upgrade to stable version only:\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"supportLink\":[{\"label\":\"Support Link:\",\"type\":\"text\",\"value\":\"https:\\/\\/evo.im\\/support.html\",\"default\":\"https:\\/\\/evo.im\\/support.html\",\"desc\":\"\"}]}',0,'',1785229095,1785229095);
/*!40000 ALTER TABLE `k6on_site_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_snippets`
--

DROP TABLE IF EXISTS `k6on_site_snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_snippets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Snippet',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` int NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Default Properties',
  `moduleguid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_snippets`
--

LOCK TABLES `k6on_site_snippets` WRITE;
/*!40000 ALTER TABLE `k6on_site_snippets` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_site_snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_templates`
--

DROP TABLE IF EXISTS `k6on_site_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `templatename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `templatealias` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Template',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `selectable` tinyint(1) NOT NULL DEFAULT '1',
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_templates`
--

LOCK TABLES `k6on_site_templates` WRITE;
/*!40000 ALTER TABLE `k6on_site_templates` DISABLE KEYS */;
INSERT INTO `k6on_site_templates` VALUES (1,'Home','home','Головна сторінка блогу',0,0,'',0,'<!DOCTYPE html>\r\n<html lang=\"uk\">\r\n<head>\r\n{{head}}\r\n</head>\r\n<body>\r\n{{preloader}}\r\n{{header}}\r\n\r\n<div class=\"main-banner header-text\">\r\n  <div class=\"container-fluid\">\r\n    <div class=\"owl-banner owl-carousel\">\r\n      [[DocLister?\r\n        &parents=`19`\r\n        &depth=`1`\r\n        &display=`12`\r\n        &orderBy=`menuindex ASC`\r\n        &tvList=`image,category,slide_url`\r\n        &dateSource=`publishedon`\r\n        &dateFormat=`%d.%m.%Y`\r\n        &tpl=`dl/banner`\r\n        &prepare=`preparePost`\r\n        &noneWrapOuter=`0`\r\n      ]]\r\n    </div>\r\n  </div>\r\n</div>\r\n\r\n{{cta}}\r\n\r\n<section class=\"blog-posts\">\r\n  <div class=\"container\">\r\n    <div class=\"row\">\r\n      <div class=\"col-lg-8\">\r\n        <div class=\"all-blog-posts\">\r\n          <div class=\"row\">\r\n            [[DocLister?\r\n              &parents=`5`\r\n              &depth=`1`\r\n              &display=`3`\r\n              &orderBy=`publishedon DESC`\r\n              &tvList=`image,category,tags`\r\n              &dateSource=`publishedon`\r\n              &dateFormat=`%d.%m.%Y`\r\n              &tpl=`dl/postHome`\r\n              &prepare=`preparePost`\r\n              &noneWrapOuter=`0`\r\n            ]]\r\n            <div class=\"col-lg-12\">\r\n              <div class=\"main-button\">\r\n                <a href=\"[~5~]\">Усі статті</a>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n      <div class=\"col-lg-4\">\r\n        {{sidebar}}\r\n      </div>\r\n    </div>\r\n  </div>\r\n</section>\r\n\r\n{{footer}}\r\n</body>\r\n</html>',0,1,0,1785276997),(2,'Blog','blog','Список статей із бічною панеллю',0,0,'',0,'<!DOCTYPE html>\r\n<html lang=\"uk\">\r\n<head>\r\n{{head}}\r\n</head>\r\n<body>\r\n{{preloader}}\r\n{{header}}\r\n\r\n<div class=\"heading-page header-text\">\r\n  <section class=\"page-heading\">\r\n    <div class=\"container\">\r\n      <div class=\"row\">\r\n        <div class=\"col-lg-12\">\r\n          <div class=\"text-content\">\r\n            <h4>[*longtitle*]</h4>\r\n            <h2>[*pagetitle*]</h2>\r\n          </div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </section>\r\n</div>\r\n\r\n{{cta}}\r\n\r\n<section class=\"blog-posts grid-system\">\r\n  <div class=\"container\">\r\n    <div class=\"row\">\r\n      <div class=\"col-lg-8\">\r\n        <div class=\"all-blog-posts\">\r\n          <div class=\"row\">\r\n            [!DocLister?\r\n              &parents=`[*id*]`\r\n              &depth=`1`\r\n              &display=`6`\r\n              &orderBy=`publishedon DESC`\r\n              &tvList=`image,category,tags`\r\n              &dateSource=`publishedon`\r\n              &dateFormat=`%d.%m.%Y`\r\n              &tpl=`dl/postGrid`\r\n              &prepare=`preparePost`\r\n              &paginate=`pages`\r\n              &TplPages=`dl/pages`\r\n              &TplPage=`dl/page`\r\n              &TplCurrentPage=`dl/current`\r\n              &TplNextP=`dl/next`\r\n              &TplPrevP=`dl/prev`\r\n              &noneWrapOuter=`0`\r\n            !]\r\n            <div class=\"col-lg-12\">\r\n              [+pages+]\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n      <div class=\"col-lg-4\">\r\n        {{sidebar}}\r\n      </div>\r\n    </div>\r\n  </div>\r\n</section>\r\n\r\n{{footer}}\r\n</body>\r\n</html>',0,1,1785231125,1785276997),(3,'Post','post_details','Сторінка окремої статті',0,0,'',0,'<!DOCTYPE html>\r\n<html lang=\"uk\">\r\n<head>\r\n{{head}}\r\n</head>\r\n<body>\r\n{{preloader}}\r\n{{header}}\r\n\r\n<div class=\"heading-page header-text\">\r\n  <section class=\"page-heading\">\r\n    <div class=\"container\">\r\n      <div class=\"row\">\r\n        <div class=\"col-lg-12\">\r\n          <div class=\"text-content\">\r\n            <h4>Деталі маршруту</h4>\r\n            <h2>[*pagetitle*]</h2>\r\n          </div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </section>\r\n</div>\r\n\r\n{{cta}}\r\n\r\n<section class=\"blog-posts grid-system\">\r\n  <div class=\"container\">\r\n    <div class=\"row\">\r\n      <div class=\"col-lg-8\">\r\n        <div class=\"all-blog-posts\">\r\n          <div class=\"row\">\r\n            <div class=\"col-lg-12\">\r\n              <div class=\"blog-post\">\r\n                <div class=\"blog-thumb\">\r\n                  <img src=\"[*image*]\" alt=\"[*pagetitle*]\">\r\n                </div>\r\n                <div class=\"down-content\">\r\n                  <span>[*category*]</span>\r\n                  <a href=\"[~[*id*]~]\"><h4>[*pagetitle*]</h4></a>\r\n                  <ul class=\"post-info\">\r\n                    <li>Екскурсовод</li>\r\n                    <li>[*publishedon:date=`%d.%m.%Y`*]</li>\r\n                  </ul>\r\n                  [*content*]\r\n                  <div class=\"post-options\">\r\n                    <div class=\"row\">\r\n                      <div class=\"col-6\">\r\n                        <ul class=\"post-tags\">\r\n                          <li><i class=\"fa fa-tags\"></i></li>\r\n                          <li>[*tags*]</li>\r\n                        </ul>\r\n                      </div>\r\n                      <div class=\"col-6\">\r\n                        <ul class=\"post-share\">\r\n                          <li><i class=\"fa fa-share-alt\"></i></li>\r\n                          <li><a href=\"https://www.facebook.com/ukraine_forever\" target=\"_blank\" rel=\"noopener noreferrer\">Facebook</a>,</li>\r\n                          <li><a href=\"https://x.com/ukraine_forever\" target=\"_blank\" rel=\"noopener noreferrer\"> Twitter</a></li>\r\n                        </ul>\r\n                      </div>\r\n                    </div>\r\n                  </div>\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n      </div>\r\n      <div class=\"col-lg-4\">\r\n        {{sidebar}}\r\n      </div>\r\n    </div>\r\n  </div>\r\n</section>\r\n\r\n{{footer}}\r\n</body>\r\n</html>',0,1,1785248455,1785276997),(4,'Page','page','Статичні сторінки (Про нас, Контакти)',0,0,'',0,'<!DOCTYPE html>\r\n<html lang=\"uk\">\r\n<head>\r\n{{head}}\r\n</head>\r\n<body>\r\n{{preloader}}\r\n{{header}}\r\n\r\n<div class=\"heading-page header-text\">\r\n  <section class=\"page-heading\">\r\n    <div class=\"container\">\r\n      <div class=\"row\">\r\n        <div class=\"col-lg-12\">\r\n          <div class=\"text-content\">\r\n            <h4>[*longtitle*]</h4>\r\n            <h2>[*pagetitle*]</h2>\r\n          </div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </section>\r\n</div>\r\n\r\n[*content*]\r\n\r\n{{footer}}\r\n</body>\r\n</html>',0,1,1785248455,1785276997),(5,'Slide','','Слайд головного банера',0,0,'',0,'<!-- Слайд банера: редагуйте заголовок, TV image / category / slide_url. Порядок — menuindex. -->',0,1,1785276997,1785276997);
/*!40000 ALTER TABLE `k6on_site_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_tmplvar_access`
--

DROP TABLE IF EXISTS `k6on_site_tmplvar_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_tmplvar_access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tmplvarid` int NOT NULL DEFAULT '0',
  `documentgroup` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_tmplvar_access`
--

LOCK TABLES `k6on_site_tmplvar_access` WRITE;
/*!40000 ALTER TABLE `k6on_site_tmplvar_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_site_tmplvar_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_tmplvar_contentvalues`
--

DROP TABLE IF EXISTS `k6on_site_tmplvar_contentvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_tmplvar_contentvalues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tmplvarid` int NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `k6on_site_tmplvar_contentvalues_ix_tvid_contentid` (`tmplvarid`,`contentid`),
  KEY `k6on_site_tmplvar_contentvalues_idx_tmplvarid` (`tmplvarid`),
  KEY `k6on_site_tmplvar_contentvalues_idx_id` (`contentid`),
  FULLTEXT KEY `k6on_site_tmplvar_contentvalues_content_ft_idx` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_tmplvar_contentvalues`
--

LOCK TABLES `k6on_site_tmplvar_contentvalues` WRITE;
/*!40000 ALTER TABLE `k6on_site_tmplvar_contentvalues` DISABLE KEYS */;
INSERT INTO `k6on_site_tmplvar_contentvalues` VALUES (1,1,10,'assets/images/ua-kyiv.jpg'),(2,1,6,'assets/images/ua-hoverla.jpg'),(3,2,6,'Карпати'),(4,3,6,'Говерла, Гори, Трекінг'),(5,1,7,'assets/images/ua-synevyr.jpg'),(6,2,7,'Озера та річки'),(7,3,7,'Синевир, Закарпаття, Озера'),(8,1,8,'assets/images/ua-kamianets.jpg'),(9,2,8,'Фортеці та замки'),(10,3,8,'Фортеця, Поділля, Історія'),(11,1,9,'assets/images/ua-sofiyivka.jpg'),(12,2,9,'Парки та заповідники'),(13,3,9,'Софіївка, Умань, Парки'),(14,2,10,'Міські маршрути'),(15,3,10,'Київ, Дніпро, Місто'),(16,1,13,'assets/images/ua-lviv.jpg'),(17,2,13,'Міські маршрути'),(18,3,13,'Львів, Галичина, Архітектура'),(19,1,14,'assets/images/ua-odesa.jpg'),(20,2,14,'Чорноморське узбережжя'),(21,3,14,'Одеса, Море, Пляж'),(22,1,15,'assets/images/ua-khotyn.jpg'),(23,2,15,'Фортеці та замки'),(24,3,15,'Хотин, Дністер, Фортеця'),(25,1,16,'assets/images/ua-shatsk.jpg'),(26,2,16,'Озера та річки'),(27,3,16,'Світязь, Волинь, Озера'),(28,1,17,'assets/images/ua-dragobrat.jpg'),(29,2,17,'Карпати'),(30,3,17,'Драгобрат, Свидовець, Гори'),(31,1,18,'assets/images/ua-dovbush.jpg'),(32,2,18,'Парки та заповідники'),(33,3,18,'Довбуш, Скелі, Прикарпаття'),(34,1,20,'assets/images/ua-hoverla.jpg'),(36,4,20,'6'),(37,1,21,'assets/images/ua-synevyr.jpg'),(38,2,21,'Озера та річки'),(39,4,21,'7'),(40,1,22,'assets/images/ua-kamianets.jpg'),(41,2,22,'Фортеці та замки'),(42,4,22,'8'),(43,1,23,'assets/images/ua-sofiyivka.jpg'),(44,2,23,'Парки та заповідники'),(45,4,23,'9'),(46,1,24,'assets/images/ua-kyiv.jpg'),(47,2,24,'Міські маршрути'),(48,4,24,'10'),(49,1,25,'assets/images/ua-lviv.jpg'),(50,2,25,'Міські маршрути'),(51,4,25,'13'),(52,5,6,'2'),(53,5,7,'1'),(54,5,8,'1');
/*!40000 ALTER TABLE `k6on_site_tmplvar_contentvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_tmplvar_templates`
--

DROP TABLE IF EXISTS `k6on_site_tmplvar_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_tmplvar_templates` (
  `tmplvarid` int NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int NOT NULL DEFAULT '0',
  `rank` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_tmplvar_templates`
--

LOCK TABLES `k6on_site_tmplvar_templates` WRITE;
/*!40000 ALTER TABLE `k6on_site_tmplvar_templates` DISABLE KEYS */;
INSERT INTO `k6on_site_tmplvar_templates` VALUES (1,1,0),(1,2,1),(1,3,2),(1,5,3),(2,3,0),(2,5,1),(3,3,0),(4,5,0),(5,3,10);
/*!40000 ALTER TABLE `k6on_site_tmplvar_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_site_tmplvars`
--

DROP TABLE IF EXISTS `k6on_site_tmplvars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_site_tmplvars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `caption` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `editor_type` int NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `elements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rank` int NOT NULL DEFAULT '0',
  `display` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Display Control Properties',
  `default_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `k6on_site_tmplvars_indx_rank` (`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_site_tmplvars`
--

LOCK TABLES `k6on_site_tmplvars` WRITE;
/*!40000 ALTER TABLE `k6on_site_tmplvars` DISABLE KEYS */;
INSERT INTO `k6on_site_tmplvars` VALUES (1,'image','image','Зображення','',0,0,0,'',0,'','','',1785246736,1785249831,'[]'),(2,'text','category','Категорія','',0,0,0,NULL,0,NULL,NULL,'Карпати',1785248455,1785249831,NULL),(3,'text','tags','Теги','',0,0,0,NULL,0,NULL,NULL,'Подорожі, Україна',1785248455,1785249831,NULL),(4,'text','slide_url','Посилання слайда (URL або ID ресурсу)','',0,0,0,NULL,0,NULL,NULL,'',1785276997,1785276997,NULL),(5,'number','views','Перегляди','Лічильник переглядів статті',0,0,0,NULL,0,NULL,NULL,'0',1785277250,1785277250,NULL);
/*!40000 ALTER TABLE `k6on_site_tmplvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_system_cli_task_logs`
--

DROP TABLE IF EXISTS `k6on_system_cli_task_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_system_cli_task_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int unsigned NOT NULL,
  `seq` int unsigned NOT NULL DEFAULT '0',
  `level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info',
  `step` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `context_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `k6on_system_cli_task_logs_task_seq` (`task_id`,`seq`),
  KEY `k6on_system_cli_task_logs_task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_system_cli_task_logs`
--

LOCK TABLES `k6on_system_cli_task_logs` WRITE;
/*!40000 ALTER TABLE `k6on_system_cli_task_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_system_cli_task_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_system_cli_tasks`
--

DROP TABLE IF EXISTS `k6on_system_cli_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_system_cli_tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_version` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'queued',
  `step` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `progress` smallint unsigned NOT NULL DEFAULT '0',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `payload_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `result_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int unsigned DEFAULT NULL,
  `locked_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attempt_count` int unsigned NOT NULL DEFAULT '0',
  `lease_expires_at` datetime DEFAULT NULL,
  `worker_host` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `worker_pid` int DEFAULT NULL,
  `error_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `catalog_snapshot_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_by_snapshot` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `started_at` datetime DEFAULT NULL,
  `heartbeat_at` datetime DEFAULT NULL,
  `cancellation_requested_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `k6on_system_cli_tasks_uuid` (`uuid`),
  KEY `k6on_system_cli_tasks_status_created_at` (`status`,`created_at`),
  KEY `k6on_system_cli_tasks_type_status` (`type`,`status`),
  KEY `k6on_system_cli_tasks_type` (`type`),
  KEY `k6on_system_cli_tasks_target` (`target`),
  KEY `k6on_system_cli_tasks_status` (`status`),
  KEY `k6on_system_cli_tasks_created_by` (`created_by`),
  KEY `k6on_system_cli_tasks_lease_expires_at` (`lease_expires_at`),
  KEY `k6on_system_cli_tasks_error_code` (`error_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_system_cli_tasks`
--

LOCK TABLES `k6on_system_cli_tasks` WRITE;
/*!40000 ALTER TABLE `k6on_system_cli_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_system_cli_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_system_eventnames`
--

DROP TABLE IF EXISTS `k6on_system_eventnames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_system_eventnames` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `service` int NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_system_eventnames`
--

LOCK TABLES `k6on_system_eventnames` WRITE;
/*!40000 ALTER TABLE `k6on_system_eventnames` DISABLE KEYS */;
INSERT INTO `k6on_system_eventnames` VALUES (1,'OnDocPublished',5,''),(2,'OnDocUnPublished',5,''),(3,'OnWebPagePrerender',5,''),(4,'OnWebLogin',3,''),(5,'OnBeforeWebLogout',3,''),(6,'OnWebLogout',3,''),(7,'OnWebSaveUser',3,''),(8,'OnWebDeleteUser',3,''),(9,'OnWebChangePassword',3,''),(10,'OnWebCreateGroup',3,''),(11,'OnManagerLogin',2,''),(12,'OnBeforeManagerLogout',2,''),(13,'OnManagerLogout',2,''),(14,'OnManagerSaveUser',2,''),(15,'OnManagerDeleteUser',2,''),(16,'OnManagerChangePassword',2,''),(17,'OnManagerCreateGroup',2,''),(18,'OnBeforeCacheUpdate',4,''),(19,'OnCacheUpdate',4,''),(20,'OnMakePageCacheKey',4,''),(21,'OnLoadWebPageCache',4,''),(22,'OnBeforeSaveWebPageCache',4,''),(23,'OnChunkFormPrerender',1,'Chunks'),(24,'OnChunkFormRender',1,'Chunks'),(25,'OnBeforeChunkFormSave',1,'Chunks'),(26,'OnChunkFormSave',1,'Chunks'),(27,'OnBeforeChunkFormDelete',1,'Chunks'),(28,'OnChunkFormDelete',1,'Chunks'),(29,'OnDocFormPrerender',1,'Documents'),(30,'OnDocFormRender',1,'Documents'),(31,'OnBeforeDocFormSave',1,'Documents'),(32,'OnDocFormSave',1,'Documents'),(33,'OnBeforeDocFormDelete',1,'Documents'),(34,'OnDocFormDelete',1,'Documents'),(35,'OnDocFormUnDelete',1,'Documents'),(36,'onBeforeMoveDocument',1,'Documents'),(37,'onAfterMoveDocument',1,'Documents'),(38,'OnPluginFormPrerender',1,'Plugins'),(39,'OnPluginFormRender',1,'Plugins'),(40,'OnBeforePluginFormSave',1,'Plugins'),(41,'OnPluginFormSave',1,'Plugins'),(42,'OnBeforePluginFormDelete',1,'Plugins'),(43,'OnPluginFormDelete',1,'Plugins'),(44,'OnSnipFormPrerender',1,'Snippets'),(45,'OnSnipFormRender',1,'Snippets'),(46,'OnBeforeSnipFormSave',1,'Snippets'),(47,'OnSnipFormSave',1,'Snippets'),(48,'OnBeforeSnipFormDelete',1,'Snippets'),(49,'OnSnipFormDelete',1,'Snippets'),(50,'OnTempFormPrerender',1,'Templates'),(51,'OnTempFormRender',1,'Templates'),(52,'OnBeforeTempFormSave',1,'Templates'),(53,'OnTempFormSave',1,'Templates'),(54,'OnBeforeTempFormDelete',1,'Templates'),(55,'OnTempFormDelete',1,'Templates'),(56,'OnTVFormPrerender',1,'Template Variables'),(57,'OnTVFormRender',1,'Template Variables'),(58,'OnBeforeTVFormSave',1,'Template Variables'),(59,'OnTVFormSave',1,'Template Variables'),(60,'OnBeforeTVFormDelete',1,'Template Variables'),(61,'OnTVFormDelete',1,'Template Variables'),(62,'OnUserFormPrerender',1,'Users'),(63,'OnUserFormRender',1,'Users'),(64,'OnBeforeUserSave',1,'Users'),(65,'OnUserSave',1,'Users'),(66,'OnBeforeUserDelete',1,'Users'),(67,'OnUserDelete',1,'Users'),(68,'OnSiteRefresh',1,''),(69,'OnFileManagerUpload',1,''),(70,'OnModFormPrerender',1,'Modules'),(71,'OnModFormRender',1,'Modules'),(72,'OnBeforeModFormDelete',1,'Modules'),(73,'OnModFormDelete',1,'Modules'),(74,'OnBeforeModFormSave',1,'Modules'),(75,'OnModFormSave',1,'Modules'),(76,'OnBeforeWebLogin',3,''),(77,'OnWebAuthentication',3,''),(78,'OnBeforeManagerLogin',2,''),(79,'OnManagerAuthentication',2,''),(80,'OnSiteSettingsRender',1,'System Settings'),(81,'OnFriendlyURLSettingsRender',1,'System Settings'),(82,'OnUserSettingsRender',1,'System Settings'),(83,'OnInterfaceSettingsRender',1,'System Settings'),(84,'OnSecuritySettingsRender',1,'System Settings'),(85,'OnFileManagerSettingsRender',1,'System Settings'),(86,'OnMiscSettingsRender',1,'System Settings'),(87,'OnRichTextEditorRegister',1,'RichText Editor'),(88,'OnRichTextEditorInit',1,'RichText Editor'),(89,'OnManagerPageInit',2,''),(90,'OnWebPageInit',5,''),(91,'OnLoadDocumentObject',5,''),(92,'OnBeforeLoadDocumentObject',5,''),(93,'OnAfterLoadDocumentObject',5,''),(94,'OnLoadWebDocument',5,''),(95,'OnParseDocument',5,''),(96,'OnParseProperties',5,''),(97,'OnBeforeParseParams',5,''),(98,'OnManagerLoginFormRender',2,''),(99,'OnWebPageComplete',5,''),(100,'OnLogPageHit',5,''),(101,'OnBeforeManagerPageInit',2,''),(102,'OnBeforeEmptyTrash',1,'Documents'),(103,'OnEmptyTrash',1,'Documents'),(104,'OnManagerLoginFormPrerender',2,''),(105,'OnStripAlias',1,'Documents'),(106,'OnMakeDocUrl',5,''),(107,'OnBeforeLoadExtension',5,''),(108,'OnCreateDocGroup',1,'Documents'),(109,'OnManagerWelcomePrerender',2,''),(110,'OnManagerWelcomeHome',2,''),(111,'OnManagerWelcomeRender',2,''),(112,'OnBeforeDocDuplicate',1,'Documents'),(113,'OnDocDuplicate',1,'Documents'),(114,'OnManagerMainFrameHeaderHTMLBlock',2,''),(115,'OnManagerPreFrameLoader',2,''),(116,'OnManagerFrameLoader',2,''),(117,'OnManagerTreeInit',2,''),(118,'OnManagerTreePrerender',2,''),(119,'OnManagerTreeRender',2,''),(120,'OnManagerNodePrerender',2,''),(121,'OnManagerNodeRender',2,''),(122,'OnManagerMenuPrerender',2,''),(123,'OnManagerTopPrerender',2,''),(124,'OnDocFormTemplateRender',1,'Documents'),(125,'OnBeforeMinifyCss',1,''),(126,'OnPageUnauthorized',1,''),(127,'OnPageNotFound',1,''),(128,'OnFileBrowserUpload',1,'File Browser Events'),(129,'OnBeforeFileBrowserUpload',1,'File Browser Events'),(130,'OnFileBrowserDelete',1,'File Browser Events'),(131,'OnBeforeFileBrowserDelete',1,'File Browser Events'),(132,'OnFileBrowserInit',1,'File Browser Events'),(133,'OnFileBrowserMove',1,'File Browser Events'),(134,'OnBeforeFileBrowserMove',1,'File Browser Events'),(135,'OnFileBrowserCopy',1,'File Browser Events'),(136,'OnBeforeFileBrowserCopy',1,'File Browser Events'),(137,'OnBeforeFileBrowserRename',1,'File Browser Events'),(138,'OnFileBrowserRename',1,'File Browser Events'),(139,'OnLogEvent',1,'Log Event'),(140,'OnLoadSettings',1,'System Settings');
/*!40000 ALTER TABLE `k6on_system_eventnames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_system_scheduler_health`
--

DROP TABLE IF EXISTS `k6on_system_scheduler_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_system_scheduler_health` (
  `id` tinyint unsigned NOT NULL,
  `last_heartbeat_at` datetime DEFAULT NULL,
  `last_heartbeat_host` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_heartbeat_mode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_system_scheduler_health`
--

LOCK TABLES `k6on_system_scheduler_health` WRITE;
/*!40000 ALTER TABLE `k6on_system_scheduler_health` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_system_scheduler_health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_system_settings`
--

DROP TABLE IF EXISTS `k6on_system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_system_settings` (
  `setting_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `setting_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_system_settings`
--

LOCK TABLES `k6on_system_settings` WRITE;
/*!40000 ALTER TABLE `k6on_system_settings` DISABLE KEYS */;
INSERT INTO `k6on_system_settings` VALUES ('a','30'),('aliaslistingfolder','0'),('allow_duplicate_alias','0'),('allow_eval','with_scan'),('allow_multiple_emails','0'),('auto_menuindex','1'),('auto_template_logic','sibling'),('automatic_alias','1'),('blocked_minutes','60'),('cache_default','1'),('cache_type','2'),('captcha_words','EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),('captcha_words_default','EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),('check_files_onlogin','index.php\r\n.htaccess\r\nmanager/index.php\r\n/core/config/database/connections/default.php'),('chunk_processor','DLTemplate'),('clean_uploaded_filename','1'),('clientResize','0'),('ControllerNamespace',''),('custom_contenttype','text/html,application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/css,text/xml,text/javascript,text/plain,application/json'),('datepicker_offset','-10'),('datetime_format','dd-mm-YYYY'),('default_template','3'),('denyExtensionRename','0'),('denyZipDownload','0'),('disable_chunk_cache','0'),('disable_plugins_cache','0'),('disable_snippet_cache','0'),('docid_incrmnt_method','0'),('editor_css_path',''),('editor_css_selectors',''),('email_method','mail'),('email_sender_method','1'),('emailsender','alekseybanga2001@gmail.com'),('emailsubject','Данные для авторизации'),('emailsubject_default','Данные для авторизации'),('enable_bindings','1'),('enable_cache','1'),('error_page','1'),('error_reporting','1'),('failed_login_attempts','3'),('fck_editor_autolang','0'),('fck_editor_toolbar','standard'),('fe_editor_lang','ru'),('filemanager_path','[(base_path)]'),('friendly_alias_urls','1'),('friendly_url_prefix',''),('friendly_url_suffix','/'),('friendly_urls','1'),('full_aliaslisting','0'),('global_tabs','1'),('group_tvs','0'),('html_comment',''),('jpegQuality','90'),('lang_code','ru'),('login_bg',''),('login_form_position','left'),('login_form_style','dark'),('login_logo',''),('make_folders','0'),('manager_direction','ltr'),('manager_language','english'),('manager_layout','4'),('manager_menu_position','top'),('manager_theme','default'),('manager_theme_mode','3'),('maxImageHeight','2200'),('maxImageWidth','2600'),('minifyphp_incache','0'),('modx_charset','UTF-8'),('new_file_permissions','0644'),('new_folder_permissions','0755'),('noThumbnailsRecreation','0'),('number_of_logs','100'),('number_of_results','30'),('old_template','0'),('publish_default','1'),('rb_base_dir','[(base_path)]assets/'),('rb_base_url','assets/'),('rb_webuser','0'),('reload_captcha_words',''),('reload_emailsubject',''),('reload_site_unavailable',''),('reload_system_email_webreminder_message',''),('reload_websignupemail_message',''),('remember_last_tab','1'),('resource_tree_node_name','pagetitle'),('rss_url_extras','https://evo.im/rss/extras.xml'),('rss_url_releases','https://evo.im/rss/releases.xml'),('safe_functions_at_eval','time,date,strtotime,strftime'),('search_default','1'),('send_errormail','0'),('seostrict','1'),('server_offset_time','0'),('server_protocol','http'),('session_timeout','15'),('session.cookie.lifetime','604800'),('settings_version','3.5.8'),('show_fullscreen_btn','0'),('show_newresource_btn','0'),('show_picker','0'),('showHiddenFiles','0'),('site_id','6a686f2737b26'),('site_name','Блог Українських Екскурсоводів'),('site_start','1'),('site_status','1'),('site_timezone','UTC'),('site_unavailable_message','В настоящее время сайт недоступен.'),('site_unavailable_page',''),('siteunavailable_message_default','ru'),('smtp_auth','0'),('smtp_autotls','0'),('smtp_host','smtp.example.com'),('smtp_port','25'),('smtp_secure','none'),('smtp_username','emailsender'),('stay','2'),('strip_image_paths','1'),('sys_files_checksum','a:4:{s:23:\"/var/www/html/index.php\";s:32:\"e845a31b74e249d433dc36badedfae29\";s:23:\"/var/www/html/.htaccess\";s:32:\"36f8744c70b08bd1872fbb0e8e06a1ea\";s:31:\"/var/www/html/manager/index.php\";s:32:\"ab14a72c71f97945e6d90792a950c4a5\";s:59:\"/var/www/html//core/config/database/connections/default.php\";s:32:\"cff00044e7ed1b559616779dd325cd01\";}'),('system_email_webreminder_default','Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),('system_email_websignup_default','Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),('theme_refresher',''),('thumbHeight','150'),('thumbsDir','.thumbs'),('thumbWidth','150'),('track_visitors','0'),('tree_page_click','27'),('tree_show_protected','0'),('udperms_allowroot','0'),('unauthorized_page','1'),('UpgradeRepository',''),('upload_files','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg,tpl,webp,avif'),('upload_images','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg,webp,avif'),('upload_maxsize','10485760'),('upload_media','au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),('use_alias_path','1'),('use_breadcrumbs','0'),('use_browser','1'),('use_captcha','0'),('use_editor','1'),('use_udperms','1'),('validate_referer','1'),('warning_visibility','0'),('webpwdreminder_message','Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),('websignupemail_message','Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),('which_browser','mcpuk'),('which_editor','none'),('xhtml_urls','0');
/*!40000 ALTER TABLE `k6on_system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_system_worker_health`
--

DROP TABLE IF EXISTS `k6on_system_worker_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_system_worker_health` (
  `id` tinyint unsigned NOT NULL,
  `last_worker_run_at` datetime DEFAULT NULL,
  `last_worker_pick_at` datetime DEFAULT NULL,
  `last_worker_success_at` datetime DEFAULT NULL,
  `last_worker_failed_at` datetime DEFAULT NULL,
  `last_worker_error_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_worker_host` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_worker_pid` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_system_worker_health`
--

LOCK TABLES `k6on_system_worker_health` WRITE;
/*!40000 ALTER TABLE `k6on_system_worker_health` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_system_worker_health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_user_attributes`
--

DROP TABLE IF EXISTS `k6on_user_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_user_attributes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `internalKey` int NOT NULL DEFAULT '0',
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int NOT NULL DEFAULT '0',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobilephone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `blocked` int NOT NULL DEFAULT '0',
  `blockeduntil` int NOT NULL DEFAULT '0',
  `blockedafter` int NOT NULL DEFAULT '0',
  `logincount` int NOT NULL DEFAULT '0',
  `lastlogin` int NOT NULL DEFAULT '0',
  `thislogin` int NOT NULL DEFAULT '0',
  `failedlogincount` int NOT NULL DEFAULT '0',
  `sessionid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dob` int DEFAULT NULL,
  `gender` int NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `createdon` int NOT NULL DEFAULT '0',
  `editedon` int NOT NULL DEFAULT '0',
  `verified` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `k6on_web_user_attributes_internalKey` (`internalKey`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_user_attributes`
--

LOCK TABLES `k6on_user_attributes` WRITE;
/*!40000 ALTER TABLE `k6on_user_attributes` DISABLE KEYS */;
INSERT INTO `k6on_user_attributes` VALUES (1,1,'1',NULL,NULL,NULL,1,'alekseybanga2001@gmail.com','','',0,0,0,3,1785275554,1785275554,0,'xx6FueuowGQVWiukg4t6Lh2L2zboaO2X4y7Yew7J',NULL,0,'','','','','','','',NULL,1785229094,1785275554,1);
/*!40000 ALTER TABLE `k6on_user_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_user_role_vars`
--

DROP TABLE IF EXISTS `k6on_user_role_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_user_role_vars` (
  `tmplvarid` int NOT NULL DEFAULT '0',
  `roleid` int NOT NULL DEFAULT '0',
  `rank` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_user_role_vars`
--

LOCK TABLES `k6on_user_role_vars` WRITE;
/*!40000 ALTER TABLE `k6on_user_role_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_user_role_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_user_roles`
--

DROP TABLE IF EXISTS `k6on_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_user_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_user_roles`
--

LOCK TABLES `k6on_user_roles` WRITE;
/*!40000 ALTER TABLE `k6on_user_roles` DISABLE KEYS */;
INSERT INTO `k6on_user_roles` VALUES (1,'Administrator','Site administrators have full access to all functions'),(2,'Editor','Limited to managing content'),(3,'Publisher','Editor with expanded permissions including manage users, update Elements and site settings');
/*!40000 ALTER TABLE `k6on_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_user_settings`
--

DROP TABLE IF EXISTS `k6on_user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_user_settings` (
  `user` int NOT NULL,
  `setting_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `setting_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `k6on_user_settings_user` (`user`),
  KEY `k6on_user_settings_setting_name` (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_user_settings`
--

LOCK TABLES `k6on_user_settings` WRITE;
/*!40000 ALTER TABLE `k6on_user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_user_values`
--

DROP TABLE IF EXISTS `k6on_user_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_user_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tmplvarid` int NOT NULL DEFAULT '0',
  `userid` int NOT NULL DEFAULT '0',
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `k6on_user_values_tmplvarid_userid` (`tmplvarid`,`userid`),
  KEY `k6on_user_values_tmplvarid_idx` (`tmplvarid`),
  KEY `k6on_user_values_userid_idx` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_user_values`
--

LOCK TABLES `k6on_user_values` WRITE;
/*!40000 ALTER TABLE `k6on_user_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `k6on_user_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k6on_users`
--

DROP TABLE IF EXISTS `k6on_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k6on_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cachepwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_to` timestamp NULL DEFAULT NULL,
  `verified_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `k6on_web_users_username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k6on_users`
--

LOCK TABLES `k6on_users` WRITE;
/*!40000 ALTER TABLE `k6on_users` DISABLE KEYS */;
INSERT INTO `k6on_users` VALUES (1,'admin','$P$B1lG6P17Zj3LDVVpJOMRjJFDhxQyex.','a1e68d18ef1adf669781721d7569ab9d','d9d3870cd090a99609a34a2907dbd66cdd0d54d89f35aa31dd540427c7133766','564393b77328c90e7c08924b24f29b825003425f4dd8d2efc7adf4286e8cfc19','2026-07-29 08:52:34',NULL);
/*!40000 ALTER TABLE `k6on_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'evolution'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-28 22:43:24
