CREATE DATABASE  IF NOT EXISTS `capstone` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `capstone`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `admin_account`
--

DROP TABLE IF EXISTS `admin_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_account` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_account`
--

LOCK TABLES `admin_account` WRITE;
/*!40000 ALTER TABLE `admin_account` DISABLE KEYS */;
INSERT INTO `admin_account` VALUES (1,'Administrator','admin@ifoolu.com','pû3cc}d„r6·ƒ{î›');
/*!40000 ALTER TABLE `admin_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `magician_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `address` varchar(35) NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `show_type` int(1) NOT NULL,
  `num_kids` int(11) unsigned NOT NULL,
  `adv_method` int(1) NOT NULL,
  `show_length` int(3) unsigned NOT NULL,
  `birthday_age` int(2) unsigned DEFAULT NULL,
  `name_of_child` varchar(30) DEFAULT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `num_of_adults` int(2) unsigned DEFAULT NULL,
  `kid_show` tinyint(1) DEFAULT NULL,
  `stage_show` tinyint(1) DEFAULT NULL,
  `school_name` varchar(35) DEFAULT NULL,
  `school_show_type` int(1) DEFAULT NULL,
  `performed` tinyint(1) DEFAULT '0',
  `invoiced` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`booking_id`,`client_id`,`magician_id`),
  KEY `client_id_booking_idx` (`client_id`),
  KEY `magician_id_booking_idx` (`magician_id`),
  CONSTRAINT `client_id_booking` FOREIGN KEY (`client_id`) REFERENCES `client_account` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `magician_id_booking` FOREIGN KEY (`magician_id`) REFERENCES `magician_account` (`magician_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_illusion_list`
--

DROP TABLE IF EXISTS `booking_illusion_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_illusion_list` (
  `booking_id` int(11) NOT NULL,
  `illusion_id` int(11) NOT NULL,
  PRIMARY KEY (`booking_id`,`illusion_id`),
  KEY `illusion_id_booking_idx` (`illusion_id`),
  CONSTRAINT `booking_id_illusion_list` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `illusion_id_booking` FOREIGN KEY (`illusion_id`) REFERENCES `illusion` (`illusion_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_illusion_list`
--

LOCK TABLES `booking_illusion_list` WRITE;
/*!40000 ALTER TABLE `booking_illusion_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_illusion_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_account`
--

DROP TABLE IF EXISTS `client_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_account` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(20) NOT NULL,
  `last_show_booked` datetime DEFAULT NULL,
  `phone` varchar(12) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_account`
--

LOCK TABLES `client_account` WRITE;
/*!40000 ALTER TABLE `client_account` DISABLE KEYS */;
INSERT INTO `client_account` VALUES (1,'System','ifoolu.test@gmail.com','pû3cc}d„r6·ƒ{î›','2017-03-31 17:45:00','111-111-1111',1);
/*!40000 ALTER TABLE `client_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_list`
--

DROP TABLE IF EXISTS `client_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_list` (
  `magician_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`magician_id`,`client_id`),
  KEY `client_id_idx` (`client_id`),
  CONSTRAINT `client_id_magician` FOREIGN KEY (`client_id`) REFERENCES `client_account` (`client_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `magician_id_client` FOREIGN KEY (`magician_id`) REFERENCES `magician_account` (`magician_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_list`
--

LOCK TABLES `client_list` WRITE;
/*!40000 ALTER TABLE `client_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `illusion`
--

DROP TABLE IF EXISTS `illusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `illusion` (
  `illusion_id` int(11) NOT NULL AUTO_INCREMENT,
  `magician_id` int(11) NOT NULL,
  `illusion_name` varchar(30) NOT NULL,
  `illusion_length` int(11) unsigned DEFAULT NULL,
  `recommended_age` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`illusion_id`,`magician_id`),
  KEY `magician_id_illusion_idx` (`magician_id`),
  CONSTRAINT `magician_id_illusion` FOREIGN KEY (`magician_id`) REFERENCES `magician_account` (`magician_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `illusion`
--

LOCK TABLES `illusion` WRITE;
/*!40000 ALTER TABLE `illusion` DISABLE KEYS */;
/*!40000 ALTER TABLE `illusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `illusions_seen`
--

DROP TABLE IF EXISTS `illusions_seen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `illusions_seen` (
  `client_id` int(11) NOT NULL,
  `illusion_id` int(11) NOT NULL,
  PRIMARY KEY (`client_id`,`illusion_id`),
  KEY `illusion_id_client_idx` (`illusion_id`),
  CONSTRAINT `client_id_illusion` FOREIGN KEY (`client_id`) REFERENCES `client_account` (`client_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `illusion_id_clients` FOREIGN KEY (`illusion_id`) REFERENCES `illusion` (`illusion_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `illusions_seen`
--

LOCK TABLES `illusions_seen` WRITE;
/*!40000 ALTER TABLE `illusions_seen` DISABLE KEYS */;
/*!40000 ALTER TABLE `illusions_seen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `magician_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` decimal(8,2) unsigned NOT NULL,
  `quantity` int(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(2000) DEFAULT NULL,
  `image_location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`inventory_id`,`magician_id`),
  KEY `magician_id_inventory_idx` (`magician_id`),
  CONSTRAINT `magician_id_inventory` FOREIGN KEY (`magician_id`) REFERENCES `magician_account` (`magician_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magician_account`
--

DROP TABLE IF EXISTS `magician_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magician_account` (
  `magician_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(20) NOT NULL,
  `min_30_show_price` decimal(8,2) unsigned DEFAULT NULL,
  `min_45_show_price` decimal(8,2) unsigned DEFAULT NULL,
  `min_60_show_price` decimal(8,2) unsigned DEFAULT NULL,
  `corporate_show_price` decimal(8,2) unsigned DEFAULT NULL,
  `school_show_price` decimal(8,2) unsigned DEFAULT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `personal_description` varchar(1500) DEFAULT NULL,
  `corporate_description` varchar(1500) DEFAULT NULL,
  `school_description` varchar(1500) DEFAULT NULL,
  `image_location` varchar(45) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`magician_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magician_account`
--

LOCK TABLES `magician_account` WRITE;
/*!40000 ALTER TABLE `magician_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `magician_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magician_school_list`
--

DROP TABLE IF EXISTS `magician_school_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magician_school_list` (
  `school_id` int(11) NOT NULL,
  `magician_id` int(11) NOT NULL,
  PRIMARY KEY (`school_id`,`magician_id`),
  KEY `magician_school_id_idx` (`magician_id`),
  CONSTRAINT `magician_school_id` FOREIGN KEY (`magician_id`) REFERENCES `magician_account` (`magician_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `school_magician_id` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magician_school_list`
--

LOCK TABLES `magician_school_list` WRITE;
/*!40000 ALTER TABLE `magician_school_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `magician_school_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_contents`
--

DROP TABLE IF EXISTS `order_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_contents` (
  `order_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) unsigned NOT NULL,
  PRIMARY KEY (`order_id`,`inventory_id`),
  KEY `inventory_id_order_contents_idx` (`inventory_id`),
  CONSTRAINT `inventory_id_order_contents` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_id_contents` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_contents`
--

LOCK TABLES `order_contents` WRITE;
/*!40000 ALTER TABLE `order_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `shipped` tinyint(1) DEFAULT NULL,
  `magician_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `date_placed` date NOT NULL,
  `address` varchar(35) NOT NULL,
  `address_secondary` varchar(35) DEFAULT NULL,
  `postal_code` varchar(7) NOT NULL,
  `city` varchar(30) NOT NULL DEFAULT 'Calgary',
  `province` varchar(2) NOT NULL DEFAULT 'AB',
  `price` decimal(8,2) unsigned DEFAULT '0.00',
  `date_shipped` date DEFAULT NULL,
  PRIMARY KEY (`order_id`,`magician_id`,`client_id`),
  KEY `magician_id_order_idx` (`magician_id`),
  KEY `client_id_order_idx` (`client_id`),
  CONSTRAINT `client_id_order` FOREIGN KEY (`client_id`) REFERENCES `client_account` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `magician_id_order` FOREIGN KEY (`magician_id`) REFERENCES `magician_account` (`magician_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `city` varchar(40) NOT NULL,
  `province` varchar(2) NOT NULL,
  `postal_code` varchar(7) NOT NULL,
  PRIMARY KEY (`school_id`),
  UNIQUE KEY `school_id_UNIQUE` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (8,'St. Rose of Lima','2419 50 St NE',NULL,'Calgary','AB','T1Y 1Z5'),(9,'Douglas Harkness','6203 24 Avenue NE',NULL,'Calgary','AB','T1Y 2C5'),(10,'St. Rupert','111 Rundlehill Dr NE',NULL,'Calgary','AB','T1Y 2W9'),(11,'Dr. Gordon Higgins','155 Rundlehill Drive NE',NULL,'Calgary','AB','T1Y 2W9'),(12,'St. Patrick','6006 Rundlehorn Dr NE',NULL,'Calgary','AB','T1Y 2X1'),(13,'Colonel J. Fred Scott','171 Whitehorn Road NE',NULL,'Calgary','AB','T1Y 3C4'),(14,'Annie Gale','577 Whiteridge Way NE',NULL,'Calgary','AB','T1Y 4S8'),(15,'Pineridge','1927 61 Street NE',NULL,'Calgary','AB','T1Y 4W6'),(16,'Guy Weadick','5612 Templehill Road NE',NULL,'Calgary','AB','T1Y 4W7'),(17,'Rundle','4120 Rundlehorn Drive NE',NULL,'Calgary','AB','T1Y 4W9'),(18,'St. Wilfrid','4225 44 Ave NE',NULL,'Calgary','AB','T1Y 4Y1'),(19,'Calgary Islamic School, Akram Jomaa Campus','2612 - 37 Avenue N.E.',NULL,'Calgary','AB','T1Y 5L2'),(20,'Father Scollen','6839 Temple Dr NE',NULL,'Calgary','AB','T1Y 5N4'),(21,'Lester B. Pearson High','3020 52 Street NE',NULL,'Calgary','AB','T1Y 5P4'),(22,'St. Thomas More','6110 Temple Dr NE',NULL,'Calgary','AB','T1Y 5V4'),(23,'Annie Foote','6320 Temple Drive NE',NULL,'Calgary','AB','T1Y 5V5'),(24,'Cecil Swanson','4820 Rundlewood Drive NE',NULL,'Calgary','AB','T1Y 5V9'),(25,'Palliser Alternative Outreach','Suite 120 2635 - 37 Avenue',NULL,'Calgary','AB','T1Y 5Z6'),(26,'Chief Justice Milvain','3428 42 Street NE',NULL,'Calgary','AB','T1Y 6A3'),(27,'Clarence Sansom','5840 24 Avenue NE',NULL,'Calgary','AB','T1Y 6G4'),(28,'Monterey Park','7400 California Boulevard NE',NULL,'Calgary','AB','T1Y 6R2'),(29,'Mountain View Academy','3915 34 Street NE',NULL,'Calgary','AB','T1Y 6Z8'),(30,'Radisson Park','2805 Radcliffe Drive SE',NULL,'Calgary','AB','T2A 0C8'),(31,'Bishop Kidd','1420 28 St SE',NULL,'Calgary','AB','T2A 0Y8'),(32,'Sir Wilfrid Laurier','819 32 Street SE',NULL,'Calgary','AB','T2A 0Y9'),(33,'Holy Family','904 32 St SE',NULL,'Calgary','AB','T2A 0Z1'),(34,'Patrick Airlie','1520 39 Street SE',NULL,'Calgary','AB','T2A 1H9'),(35,'Holy Trinity','1717 41 St SE',NULL,'Calgary','AB','T2A 1L2'),(36,'Forest Lawn High','1304 44 Street SE',NULL,'Calgary','AB','T2A 1M8'),(37,'Ernest Morrow','1212 47 Street SE',NULL,'Calgary','AB','T2A 1R3'),(38,'Keeler','4807 Forego Avenue SE',NULL,'Calgary','AB','T2A 2C4'),(39,'St. John Bosco Private','712 Fortalice Cres SE',NULL,'Calgary','AB','T2A 2E1'),(40,'Penbrooke Meadows','5645 Pensacola Crescent SE',NULL,'Calgary','AB','T2A 2G4'),(41,'Discovering Choices II - Marlborough','92, 1116 3800 Memorial Drive NE',NULL,'Calgary','AB','T2A 2K2'),(42,'Bob Edwards','4424 Marlborough Drive NE',NULL,'Calgary','AB','T2A 2Z5'),(43,'Marlborough','4711 Maryvale Drive NE',NULL,'Calgary','AB','T2A 3A1'),(44,'Chris Akkerman','5004 Marbank Drive NE',NULL,'Calgary','AB','T2A 3J6'),(45,'James Short Memorial','6333 5 Avenue SE',NULL,'Calgary','AB','T2A 3V7'),(46,'St. Mark','4589 Marbank Dr NE',NULL,'Calgary','AB','T2A 3V8'),(47,'Roland Michener','5958 4 Avenue NE',NULL,'Calgary','AB','T2A 4B1'),(48,'St. Martha','6020 4 Ave NE',NULL,'Calgary','AB','T2A 4B1'),(49,'Jack James High','5105 8 Avenue SE',NULL,'Calgary','AB','T2A 4M1'),(50,'Cappy Smart','5808 Madigan Drive NE',NULL,'Calgary','AB','T2A 4P5'),(51,'Dr. Gladys McKelvie Egbert','6033 Madigan Drive NE',NULL,'Calgary','AB','T2A 5G9'),(52,'Calgary Islamic School, Omar Bin Al-Khattab Campus','Omar Bin Al-Khattab Campus 225 28 Street SE',NULL,'Calgary','AB','T2A 5K4'),(53,'St. Peter','720 58 St SE',NULL,'Calgary','AB','T2A 5L9'),(54,'Father Lacombe High','3615 Radcliffe Dr SE',NULL,'Calgary','AB','T2A 6B4'),(55,'G.W. Skene','6226 Penbrooke Drive SE',NULL,'Calgary','AB','T2A 6M7'),(56,'Abbeydale','320 Abergale Drive NE',NULL,'Calgary','AB','T2A 6W2'),(57,'Eastside Christian Academy','1320 Abbeydale Drive SE',NULL,'Calgary','AB','T2A 7L8'),(58,'St. Kateri Tekakwitha','1005 Abbotsford Dr NE',NULL,'Calgary','AB','T2A 7N5'),(59,'Ian Bazalgette','3909 26 Avenue SE',NULL,'Calgary','AB','T2B 0C6'),(60,'Holy Cross','3719 26 Ave SE',NULL,'Calgary','AB','T2B 0C6'),(61,'Valley View','4105 26 Avenue SE',NULL,'Calgary','AB','T2B 0C6'),(62,'West Dover','3113 30 Avenue SE',NULL,'Calgary','AB','T2B 0G9'),(63,'Almadina Language Charter Academy, Mountain View Campus','2031 Sable Drive S.E.',NULL,'Calgary','AB','T2B 1R9'),(65,'St. Damien','3619 28 St SE',NULL,'Calgary','AB','T2B 2J1'),(66,'Erin Woods','25 Erin Park Drive SE',NULL,'Calgary','AB','T2B 2Z9'),(67,'Almadina Language Charter Academy, Ogden Campus','1919 - 76 Ave SE',NULL,'Calgary','AB','T2C 0G8'),(68,'St. Bernadette','55 Lynndale Cres SE',NULL,'Calgary','AB','T2C 0T8'),(69,'Sherwood','2011 66 Avenue SE',NULL,'Calgary','AB','T2C 1J4'),(70,'Banting and Best','1819 66 Avenue SE',NULL,'Calgary','AB','T2C 2K5'),(71,'Holy Angels','275 Riverglen Dr SE',NULL,'Calgary','AB','T2C 3T5'),(72,'Riverbend','65 Rivervalley Drive SE',NULL,'Calgary','AB','T2C 3Z7'),(73,'Italian School of Calgary','416-1 Avenue N.E.',NULL,'Calgary','AB','T2E 0B4'),(74,'Langevin','107 6A Street NE',NULL,'Calgary','AB','T2E 0B7'),(75,'Sir John Franklin','2215 8 Avenue NE',NULL,'Calgary','AB','T2E 0T7'),(76,'Georges P. Vanier','509 32 Avenue NE',NULL,'Calgary','AB','T2E 2H3'),(77,'Aurora Learning Calgary','#137 5305 McCall Way NE',NULL,'Calgary','AB','T2E 2L2'),(78,'Buchanan','3717 Centre Street North',NULL,'Calgary','AB','T2E 2Y2'),(79,'Mount View','2004 4 Street NE',NULL,'Calgary','AB','T2E 3T8'),(80,'St. Angela','231 6 St NE',NULL,'Calgary','AB','T2E 3Y1'),(81,'Colonel Macleod','1610 6 Street NE',NULL,'Calgary','AB','T2E 3Y9'),(82,'Delta West Academy','414 - 11A Street N.E.',NULL,'Calgary','AB','T2E 4P3'),(83,'Christine Meikle','64 12 Street NE',NULL,'Calgary','AB','T2E 4P4'),(84,'Belfast','1229 17A Street NE',NULL,'Calgary','AB','T2E 4V4'),(85,'St. Alphonsus','928 Radnor Ave NE',NULL,'Calgary','AB','T2E 5H5'),(86,'Renfrew - Childrens Village','1210 Russet Road NE',NULL,'Calgary','AB','T2E 5L5'),(87,'North Middle School Campus','211 McKnight Blvd. NE',NULL,'Calgary','AB','T2E 5S7'),(88,'Mayland Heights','2324 Maunsell Drive NE',NULL,'Calgary','AB','T2E 6A2'),(89,'Northeast Elementary Campus','1140 Mayland Drive NE',NULL,'Calgary','AB','T2E 6C8'),(90,'Vista Heights','2411 Vermillion Street NE',NULL,'Calgary','AB','T2E 6J3'),(91,'Phoenix Home Education Foundation Centre','320 19 Street S.E.',NULL,'Calgary','AB','T2E 6J6'),(92,'Heritage Christian Academy','2003 McKnight Boulevard N.E.',NULL,'Calgary','AB','T2E 6L2'),(93,'Bethel Christian Academy','2220 - 39 Avenue N.E.',NULL,'Calgary','AB','T2E 6P7'),(94,'Renfrew Educational Services - Park Place Centre','2050 - 21 Street N.E.',NULL,'Calgary','AB','T2E 6S5'),(95,'Renfrew Educational Services-Janice McTighe Centre','2050 - 21 Street N.E.',NULL,'Calgary','AB','T2E 6S5'),(96,'Columbia College','802 Manning Road N.E.',NULL,'Calgary','AB','T2E 7N8'),(97,'Stanley Jones','950 6 Street NE',NULL,'Calgary','AB','T2E 8M3'),(98,'Language School-German Canadian Club','3940 73 Street NW',NULL,'Calgary','AB','T2E 8T6'),(99,'Colonel Walker','1921 9 Avenue SE',NULL,'Calgary','AB','T2G 0V3'),(100,'Discovering Choices - CACY - Downtown','206, 315 10 Avenue SE',NULL,'Calgary','AB','T2G 0W2'),(101,'St. Anne Academic Centre','1010 21 Ave SE',NULL,'Calgary','AB','T2G 1N2'),(102,'Ramsay','2223 Spiller Road SE',NULL,'Calgary','AB','T2G 4G9'),(103,'Janus Academy (Holy Cross Site)','2223 Spiller Road SE c/o Ramsay Elementary School',NULL,'Calgary','AB','T2G 4G9'),(104,'Janus Academy','2223 Spiller Road SE',NULL,'Calgary','AB','T2G 4G9'),(105,'Alberta Chung Wah','#270, 328 Centre Street S.E.',NULL,'Calgary','AB','T2G 4X6'),(106,'Fairview','7840 Fairmount Drive SE',NULL,'Calgary','AB','T2H 0Y1'),(107,'Lord Beaverbrook High','9019 Fairmount Drive SE',NULL,'Calgary','AB','T2H 0Z4'),(108,'Le Roi Daniels','47 Fyffe Road SE',NULL,'Calgary','AB','T2H 1B9'),(109,'The Third Academy','3,510-77th Ave SE',NULL,'Calgary','AB','T2H 1C3'),(110,'West Island College','7410 Blackfoot Trail S.E.',NULL,'Calgary','AB','T2H 1M5'),(111,'St. Matthew','416 83 Ave SE',NULL,'Calgary','AB','T2H 1N3'),(112,'South Middle School Campus','8710 Ancourt Rd. SE',NULL,'Calgary','AB','T2H 1V2'),(113,'Dr. Norman Bethune','315 86 Avenue SE',NULL,'Calgary','AB','T2H 1Z2'),(114,'Ecole de La Source','360 - 94 Avenue S.E.',NULL,'Calgary','AB','T2J 0E8'),(115,'Willow Park','343 Willow Park Drive SE',NULL,'Calgary','AB','T2J 0K7'),(116,'St. William','11020 Fairmount Dr SE',NULL,'Calgary','AB','T2J 0T1'),(117,'St. Cecilia','610 Agate Cres SE',NULL,'Calgary','AB','T2J 0Z3'),(118,'Southeast Elementary Campus','9711 Academy Drive SE',NULL,'Calgary','AB','T2J 1A9'),(119,'David Thompson','9320 Arbour Crescent SE',NULL,'Calgary','AB','T2J 1K4'),(120,'Acadia','9603 5 Street SE',NULL,'Calgary','AB','T2J 1K4'),(121,'R.T. Alderman','725 Mapleton Drive SE',NULL,'Calgary','AB','T2J 1S1'),(122,'Maple Ridge','10203 Maplemont Road SE',NULL,'Calgary','AB','T2J 1W3'),(123,'Notre-Dame de la Paix','809 Willingdon Blvd SE',NULL,'Calgary','AB','T2J 2B7'),(124,'Lake Bonavista','1015 120 Avenue SE',NULL,'Calgary','AB','T2J 2L1'),(125,'St. Boniface','927 Lake Sylvan Dr SE',NULL,'Calgary','AB','T2J 2P8'),(126,'Andrew Sibbald','1711 Lake Bonavista Drive SE',NULL,'Calgary','AB','T2J 2X9'),(127,'Nickle','2500 Lake Bonavista Drive SE',NULL,'Calgary','AB','T2J 2Y6'),(128,'Sam Livingston','12011 Bonaventure Drive SE',NULL,'Calgary','AB','T2J 3G7'),(129,'St. Bonaventure','1710 Acadia Dr SE',NULL,'Calgary','AB','T2J 3X8'),(130,'Prince Of Wales','253 Parkland Way SE',NULL,'Calgary','AB','T2J 3Y9'),(131,'Haultain Memorial','605 Queensland Drive SE',NULL,'Calgary','AB','T2J 4S8'),(132,'St. Philip','13825 Parkside Dr SE',NULL,'Calgary','AB','T2J 5A8'),(133,'Deer Run','2127 146 Avenue SE',NULL,'Calgary','AB','T2J 6P8'),(134,'Don Bosco','13615 Deer Ridge Dr SE',NULL,'Calgary','AB','T2J 6S7'),(135,'Northwest Elementary Campus','719-44 Ave NW',NULL,'Calgary','AB','T2K 0J5'),(136,'St. Helena','320 64 Ave NW',NULL,'Calgary','AB','T2K 0L8'),(137,'Huntington Hills','820 64 Avenue NW',NULL,'Calgary','AB','T2K 0M5'),(138,'Alex Munro','427  78 Avenue NE',NULL,'Calgary','AB','T2K 0R9'),(139,'James Fowler High','4004 4 Street NW',NULL,'Calgary','AB','T2K 1A1'),(140,'Sir John A. Macdonald','6600 4 Street NW',NULL,'Calgary','AB','T2K 1C2'),(141,'John G. Diefenbaker High','6620 4 Street NW',NULL,'Calgary','AB','T2K 1C2'),(142,'The Chinese Academy','#191, 1518 Centre Street N.E.',NULL,'Calgary','AB','T2K 1C2'),(143,'St. Henry','7423 10 St NW',NULL,'Calgary','AB','T2K 1H5'),(144,'Dr. J.K. Mulloy','7440 10 Street NW',NULL,'Calgary','AB','T2K 1H6'),(145,'Rosemont','19 Rosevale Drive NW',NULL,'Calgary','AB','T2K 1N6'),(146,'Highwood','11 Holmwood Avenue NW',NULL,'Calgary','AB','T2K 2G5'),(147,'North Haven','4922 North Haven Drive NW',NULL,'Calgary','AB','T2K 2K2'),(148,'Thorncliffe','5646 Thornton Road NW',NULL,'Calgary','AB','T2K 3B9'),(149,'Corpus Christi','5607 Thornton Rd NW',NULL,'Calgary','AB','T2K 3C1'),(150,'Colonel Sanders','226 Northmount Drive NW',NULL,'Calgary','AB','T2K 3G5'),(151,'Colonel Irvine','412 Northmount Drive NW',NULL,'Calgary','AB','T2K 3H6'),(152,'Cambrian Heights','640 Northmount Drive NW',NULL,'Calgary','AB','T2K 3J5'),(153,'Asasa Academy','599 Northmount Drive N.W.',NULL,'Calgary','AB','T2K 3J6'),(154,'Little Angels','599 Northmount Dr NW',NULL,'Calgary','AB','T2K 3J6'),(155,'Catherine Nichols Gunn','6625 4 Street NE',NULL,'Calgary','AB','T2K 5C7'),(156,'St. Hubert','320 72 Ave NE',NULL,'Calgary','AB','T2K 5J3'),(157,'Brentwood','1231 Northmount Drive NW',NULL,'Calgary','AB','T2L 0C9'),(158,'St. Luke','1232 Northmount Dr NW',NULL,'Calgary','AB','T2L 0E1'),(159,'Captain John Palliser','1484 Northmount Drive NW',NULL,'Calgary','AB','T2L 0G6'),(160,'St. Margaret','3320 Carol Dr NW',NULL,'Calgary','AB','T2L 0K7'),(161,'Collingwood','3826 Collingwood Drive NW',NULL,'Calgary','AB','T2L 0R6'),(162,'Senator Patrick Burns','2155 Chilcotin Road NW',NULL,'Calgary','AB','T2L 0X2'),(163,'Simon Fraser','5215 33 Street NW',NULL,'Calgary','AB','T2L 1V3'),(164,'Dr. E.W. Coffin','5615 Barrett Drive NW',NULL,'Calgary','AB','T2L 1W4'),(165,'St. Jean Brebeuf','5030 Northland Dr NW',NULL,'Calgary','AB','T2L 2J6'),(166,'Sir Winston Churchill High','5220 Northland Drive NW',NULL,'Calgary','AB','T2L 2J6'),(167,'Rosedale','905 13 Avenue NW',NULL,'Calgary','AB','T2M 0G3'),(168,'Balmoral','220 16 Avenue NW',NULL,'Calgary','AB','T2M 0H4'),(169,'Crescent Heights High','1019 1 Street NW',NULL,'Calgary','AB','T2M 2S2'),(170,'Ecole de la Rose Sauvage','2512 - 4 Street N.W.',NULL,'Calgary','AB','T2M 2Z9'),(171,'St. Joseph','2512 5 St NW',NULL,'Calgary','AB','T2M 3C7'),(172,'King George','2108 10 Street NW',NULL,'Calgary','AB','T2M 3M4'),(173,'Capitol Hill','2210 18 Street NW',NULL,'Calgary','AB','T2M 3T4'),(174,'St. Pius X','2312 18 St NW',NULL,'Calgary','AB','T2M 3T5'),(175,'Branton','2103 20 Street NW',NULL,'Calgary','AB','T2M 3W1'),(176,'William Aberhart High','3009 Morley Trail NW',NULL,'Calgary','AB','T2M 4G9'),(177,'Banff Trail','3232 Cochrane Road NW',NULL,'Calgary','AB','T2M 4J3'),(178,'Trust Treatment Centre','2282 9 Street NW',NULL,'Calgary','AB','T2M 4P6'),(179,'Trust Treatment Centre','2282 9 Street NW',NULL,'Calgary','AB','T2M 4P6'),(180,'Hillhurst','1418 7 Avenue NW',NULL,'Calgary','AB','T2N 0Z2'),(181,'Rundle College Elementary','7615 - 17 Ave SW',NULL,'Calgary','AB','T2N 1K6'),(182,'Sunnyside','211 7 Street NW',NULL,'Calgary','AB','T2N 1S2'),(183,'AADAC','1005  17 Street NW',NULL,'Calgary','AB','T2N 2E5'),(184,'Queen Elizabeth','402 18 Street NW',NULL,'Calgary','AB','T2N 2G5'),(185,'Queen Elizabeth High','512 18 Street NW',NULL,'Calgary','AB','T2N 2G5'),(186,'Briar Hill','1233 21 Street NW',NULL,'Calgary','AB','T2N 2L8'),(187,'Madeleine dHouet','108 22 St NW',NULL,'Calgary','AB','T2N 2M8'),(188,'Louise Dean (Kensington)','120 23 Street NW',NULL,'Calgary','AB','T2N 2P1'),(189,'Young Adult Program','1403 29 Street NW',NULL,'Calgary','AB','T2N 2T9'),(190,'Westmount Elementary','728 - 32 Street NW',NULL,'Calgary','AB','T2N 2V9'),(191,'University','3035 Utah Drive NW',NULL,'Calgary','AB','T2N 3Z9'),(192,'Foothills Academy','745 - 37 Street N.W.',NULL,'Calgary','AB','T2N 4T1'),(193,'Westmount Mid/High','2215 Uxbridge Dr. N.W.',NULL,'Calgary','AB','T2N 4Y3'),(194,'Calgary Chinese Private','126 2nd Avenue S.W',NULL,'Calgary','AB','T2P 0B9'),(195,'W.H. Cushing Workplace','130 7 Avenue SW',NULL,'Calgary','AB','T2P 1M6'),(196,'Connaught','1121 12 Avenue SW',NULL,'Calgary','AB','T2R 0J8'),(197,'The School of Alberta Ballet','West Annex, 2nd Floor 906-12 Avenue S.W.',NULL,'Calgary','AB','T2R 1K7'),(198,'Western Canada High','641 17 Avenue SW',NULL,'Calgary','AB','T2S 0B5'),(199,'St. Marys High','111 18 Ave SW',NULL,'Calgary','AB','T2S 0B8'),(200,'St. Monica','235 18 Ave SW',NULL,'Calgary','AB','T2S 0C2'),(201,'Rideau Park','829 Rideau Road SW',NULL,'Calgary','AB','T2S 0S2'),(202,'Our Lady of Lourdes','1916 2 St SW',NULL,'Calgary','AB','T2S 1S3'),(203,'Montessori School of Calgary','2201 Cliff Street S.W.',NULL,'Calgary','AB','T2S 2G4'),(204,'Elboya','4804 6 Street SW',NULL,'Calgary','AB','T2S 2N3'),(205,'St. Anthony','4811 6 St SW',NULL,'Calgary','AB','T2S 2N5'),(206,'Earl Grey','845 Hillcrest Avenue SW',NULL,'Calgary','AB','T2T 0Z1'),(207,'William Reid','1216 36 Avenue SW',NULL,'Calgary','AB','T2T 2E9'),(208,'Elbow Park','845 Hillcrest Avenue SW',NULL,'Calgary','AB','T2T 2H8'),(209,'Mount Royal','2234 14 Street SW',NULL,'Calgary','AB','T2T 3T3'),(210,'Emily Follensbee','5139 14 Street SW',NULL,'Calgary','AB','T2T 3W5'),(211,'Rundle College Academy','4330 - 16 Street S.W.',NULL,'Calgary','AB','T2T 4H9'),(212,'Altadore','4506 16 Street SW',NULL,'Calgary','AB','T2T 4H9'),(213,'Dr. Oakley','3904 20 Street SW',NULL,'Calgary','AB','T2T 4Z9'),(214,'Alternative High - Clinton Ford','5003 20 Street SW',NULL,'Calgary','AB','T2T 5A5'),(215,'Richmond','2701 22 Street SW',NULL,'Calgary','AB','T2T 5G5'),(216,'Masters College','4414 Crowchild Trail SW',NULL,'Calgary','AB','T2T 5J4'),(217,'Masters Academy','4414 Crowchild Trail S.W.',NULL,'Calgary','AB','T2T 5J4'),(218,'Lycee Louis Pasteur','4099 Garrison Blvd. S.W.',NULL,'Calgary','AB','T2T 6G2'),(219,'Louis Riel','9632 Oakfield Drive SW',NULL,'Calgary','AB','T2V 0L1'),(220,'Canadian Montessori School North','1112 - 70 Avenue S.W.',NULL,'Calgary','AB','T2V 0P6'),(221,'Canadian Montessori School West','1112 - 70 Avenue S.W.',NULL,'Calgary','AB','T2V 0P6'),(222,'Canadian Montessori','1112  70 Avenue S.W.',NULL,'Calgary','AB','T2V 0P6'),(223,'Henry Wise Wood High','910 75 Avenue SW',NULL,'Calgary','AB','T2V 0S6'),(224,'Chinook Park','1312 75 Avenue SW',NULL,'Calgary','AB','T2V 0S6'),(225,'Haysboro','1123 87 Avenue SW',NULL,'Calgary','AB','T2V 0W2'),(226,'St. Gerard','1204 96 Ave SW',NULL,'Calgary','AB','T2V 0Y1'),(227,'St. Augustine','7112 7 St SW',NULL,'Calgary','AB','T2V 1E9'),(228,'Woodman','8706 Elbow Drive SW',NULL,'Calgary','AB','T2V 1L2'),(229,'Calgary Jewish Academy','6700 Kootenay Street S.W.',NULL,'Calgary','AB','T2V 1P7'),(230,'St. Benedict','10340 19 St SW',NULL,'Calgary','AB','T2V 1R2'),(231,'John Ware','10020 19 Street SW',NULL,'Calgary','AB','T2V 1R2'),(232,'Bishop Grandin High','111 Haddon Rd SW',NULL,'Calgary','AB','T2V 2Y2'),(233,'Akiva Academy','140 Haddon Road S.W.',NULL,'Calgary','AB','T2V 2Y3'),(234,'Eugene Coste','10 Hillgrove Crescent SW',NULL,'Calgary','AB','T2V 3K7'),(235,'Nellie McClung','2315 Palliser Drive SW',NULL,'Calgary','AB','T2V 3S4'),(236,'Braeside','1747 107 Avenue SW',NULL,'Calgary','AB','T2W 0C3'),(237,'Southwest Elementary Campus','898 Sylvester Cres. SW',NULL,'Calgary','AB','T2W 0R7'),(238,'Harold Panabaker','23 Sackville Drive SW',NULL,'Calgary','AB','T2W 0W3'),(239,'Ethel M. Johnson','255 Sackville Drive SW',NULL,'Calgary','AB','T2W 0W7'),(240,'St. Stephen','10910 Elbow Dr SW',NULL,'Calgary','AB','T2W 1G6'),(241,'Robert Warren','12424 Elbow Drive SW',NULL,'Calgary','AB','T2W 1H2'),(242,'Dr. E.P. Scarlett High','220 Canterbury Drive SW',NULL,'Calgary','AB','T2W 1H4'),(243,'Canyon Meadows','395 Canterbury Drive SW',NULL,'Calgary','AB','T2W 1J1'),(244,'St. Catherine','11 Canata Close SW',NULL,'Calgary','AB','T2W 1P6'),(245,'St. Cyril','2990 Cedarbrae Dr SW',NULL,'Calgary','AB','T2W 2N9'),(246,'Cedarbrae','10631 Oakfield Drive SW',NULL,'Calgary','AB','T2W 2T3'),(247,'William Roper Hull','2266 Woodpark Avenue SW',NULL,'Calgary','AB','T2W 2Z8'),(248,'St. Jude','730 Woodbine Blvd SW',NULL,'Calgary','AB','T2W 4W4'),(249,'Woodlands','88 Woodgreen Drive SW',NULL,'Calgary','AB','T2W 4W9'),(250,'Woodbine','27 Woodfield Way SW',NULL,'Calgary','AB','T2W 5E1'),(251,'St. Sebastian','65 Chaparral Dr SE',NULL,'Calgary','AB','T2X 0E6'),(252,'School of East Indian Languages and Performing Arts','376 Silverado Boulevard SW',NULL,'Calgary','AB','T2X 0N9'),(253,'Midnapore','55 Midpark Rise SE',NULL,'Calgary','AB','T2X 1L7'),(254,'St. Teresa of Calcutta','121 Midlake Blvd SE',NULL,'Calgary','AB','T2X 1T7'),(255,'Trinity Christian','#100, 295 Midpark Way S.E.',NULL,'Calgary','AB','T2X 2A8'),(256,'Sundance','200 Sunmills Drive SE',NULL,'Calgary','AB','T2X 2N9'),(257,'Father Whelihan','70 Sunmills Dr SE',NULL,'Calgary','AB','T2X 2R5'),(258,'Fish Creek','1039 Suncastle Drive SE',NULL,'Calgary','AB','T2X 2Z1'),(259,'Midsun','660 Sunmills Drive SE',NULL,'Calgary','AB','T2X 3R5'),(260,'Chaparral','480 Chaparral Drive SE',NULL,'Calgary','AB','T2X 3S2'),(261,'Renfrew Thomas W. Buchanan Centre','2050 - 21 Street N.E.',NULL,'Calgary','AB','T2X 3V4'),(262,'Centennial High','55 Sun Valley Boulevard SE',NULL,'Calgary','AB','T2X 3W7'),(263,'Samuel W. Shaw','115 Shannon Drive SW',NULL,'Calgary','AB','T2Y 0K6'),(264,'Evergreen','367 Everstone Drive SW',NULL,'Calgary','AB','T2Y 0L3'),(265,'Bridlewood','207 Bridleridge Way SW',NULL,'Calgary','AB','T2Y 0L4'),(266,'Our Lady of the Evergreens','322 Everridge Drive SW',NULL,'Calgary','AB','T2Y 0L5'),(267,'Janet Johnstone','224 Shawnessy Drive SW',NULL,'Calgary','AB','T2Y 1M1'),(268,'Our Lady of Peace','14826 Millrise Hill SW',NULL,'Calgary','AB','T2Y 2B4'),(269,'Father Doucet','65 Shannon Dr SW',NULL,'Calgary','AB','T2Y 2T5'),(270,'Bishop OByrne High','500 333 Shawville Blvd SE',NULL,'Calgary','AB','T2Y 4H3'),(271,'Monsignor J.J. OBrien','99 Bridlewood Rd SW',NULL,'Calgary','AB','T2Y 4J5'),(272,'Somerset','150 Somerset Manor SW',NULL,'Calgary','AB','T2Y 4S2'),(273,'Glenmore Christian Academy Junior High','16520-24 Street SW',NULL,'Calgary','AB','T2Y 4W2'),(274,'Glenmore Christian Academy Elementary','16520 - 24 Street S.W.',NULL,'Calgary','AB','T2Y 4W2'),(275,'Copperfield','54 Copperstone Road SE',NULL,'Calgary','AB','T2Z 0G7'),(276,'Dr. Martha Cohen','116 Brightondale Park SE',NULL,'Calgary','AB','T2Z 0V1'),(277,'McKenzie Towne','679 Prestwick Circle SE',NULL,'Calgary','AB','T2Z 0V3'),(278,'St. Marguerite','1100 New Brighton Drive SE',NULL,'Calgary','AB','T2Z 0W1'),(279,'McKenzie Lake','16210 McKenzie Lake Way SE',NULL,'Calgary','AB','T2Z 1L7'),(280,'Blessed Cardinal Newman','16201 McKenzie Lake Blvd SE',NULL,'Calgary','AB','T2Z 2G7'),(281,'Monsignor J.S. Smith','2919 Douglasdale Blvd SE',NULL,'Calgary','AB','T2Z 2H9'),(282,'St. Albert the Great','225 Prestwick Ave SE',NULL,'Calgary','AB','T2Z 3X3'),(283,'Douglasdale','400 Douglas Park Boulevard SE',NULL,'Calgary','AB','T2Z 4A3'),(284,'New Brighton','30 New Brighton Drive SE',NULL,'Calgary','AB','T2Z 4B2'),(285,'McKenzie Highlands','25 McKenzie Towne Drive SE',NULL,'Calgary','AB','T2Z 4B7'),(286,'St. Isabella','855 Copperfield Blvd SE',NULL,'Calgary','AB','T2Z 4W8'),(287,'Mountain Park','312 Mount Douglas Close SE',NULL,'Calgary','AB','T2Z 4Y1'),(288,'Ecole Terre des Jeunes','3720 - 42 Street NW',NULL,'Calgary','AB','T3A 0C6'),(289,'Varsity Acres','4255 40 Street NW',NULL,'Calgary','AB','T3A 0H7'),(290,'St. Vincent de Paul','4525 49 St NW',NULL,'Calgary','AB','T3A 0K4'),(291,'F.E. Osborne','5315 Varsity Drive NW',NULL,'Calgary','AB','T3A 1A7'),(292,'Marion Carson','5225 Varsity Drive NW',NULL,'Calgary','AB','T3A 1A7'),(293,'St. Dominic','4820 Dalhart Rd NW',NULL,'Calgary','AB','T3A 1C2'),(294,'Dalhousie','4440 Dallyn Street NW',NULL,'Calgary','AB','T3A 1K3'),(295,'H.D. Cartwright','5500 Dalhart Road NW',NULL,'Calgary','AB','T3A 1V6'),(296,'West Dalhousie','6502 58 Street NW',NULL,'Calgary','AB','T3A 2C8'),(297,'Tom Baines','250 Edgepark Boulevard NW',NULL,'Calgary','AB','T3A 3S2'),(298,'Mother Mary Greene','115 Edenwold Dr NW',NULL,'Calgary','AB','T3A 3S8'),(299,'Edgemont','55 Edgevalley Circle NW',NULL,'Calgary','AB','T3A 4X1'),(300,'Edgemont','55 Edgevalley Circle NW',NULL,'Calgary','AB','T3A 4X1'),(301,'Hamptons, The','10330 Hamptons Boulevard NW',NULL,'Calgary','AB','T3A 6G2'),(302,'Valley Creek','10951 Hidden Valley Drive NW',NULL,'Calgary','AB','T3A 6J2'),(303,'Hidden Valley','10959 Hidden Valley Drive NW',NULL,'Calgary','AB','T3A 6J2'),(304,'St. Elizabeth Seton','10845 Hidden Valley Dr NW',NULL,'Calgary','AB','T3A 6K3'),(305,'Terrace Road','2103 46 Street NW',NULL,'Calgary','AB','T3B 1B3'),(306,'FFCA High School Campus','2116 McKay Road N.W.',NULL,'Calgary','AB','T3B 1C7'),(307,'Our Lady of the Assumption','7311 34 Ave NW',NULL,'Calgary','AB','T3B 1N5'),(308,'Woods Homes/George Wood Learning Centre','9400 48 Avenue NW',NULL,'Calgary','AB','T3B 2B2'),(309,'Renfrew Educational Services-Bowness Centre','2050 - 21 Street N.E.',NULL,'Calgary','AB','T3B 2B2'),(310,'Thomas B. Riley','3915 69 Street NW',NULL,'Calgary','AB','T3B 2J9'),(311,'Bowcroft','3940 73 Street NW',NULL,'Calgary','AB','T3B 2L9'),(312,'Bowness High','4627 77 Street NW',NULL,'Calgary','AB','T3B 2N6'),(313,'Belvedere Parkway','4631 85 Street NW',NULL,'Calgary','AB','T3B 2R8'),(314,'Renfrew Educational Services - Child Development Centre','2050 - 21 Street N.E.',NULL,'Calgary','AB','T3B 2X9'),(315,'Silver Springs','7235 Silvermead Road NW',NULL,'Calgary','AB','T3B 3V1'),(316,'St. Sylvester','7318 Silver Springs Blvd NW',NULL,'Calgary','AB','T3B 4N1'),(317,'W.O. Mitchell','511 Silvergrove Drive NW',NULL,'Calgary','AB','T3B 4R9'),(318,'Discovering Choices - START - Bowness','4110 79 Street NW',NULL,'Calgary','AB','T3B 5C2'),(319,'Chinook Winds Adventist Academy','10101 - 2nd Avenue S.W.',NULL,'Calgary','AB','T3B 5T2'),(320,'National Sports','110, 151 Olympic Park Road SW',NULL,'Calgary','AB','T3B 6B7'),(321,'Calgary Quest','3405 Spruce Drive S.W. c/o Spruce Cliff Elementary',NULL,'Calgary','AB','T3C 0A5'),(322,'St. Michael','4511 8 Ave SW',NULL,'Calgary','AB','T3C 0G9'),(323,'Sacred Heart','1312 15 St SW',NULL,'Calgary','AB','T3C 0T6'),(324,'Alexander Ferguson','1704 26 Street SW',NULL,'Calgary','AB','T3C 1K5'),(325,'Discovering Choices - Westbrook','3, 1002 37 Street SW',NULL,'Calgary','AB','T3C 1S1'),(326,'Rosscarrock','1406 40 Street SW',NULL,'Calgary','AB','T3C 1W7'),(327,'Wildwood','120 45 Street SW',NULL,'Calgary','AB','T3C 2B3'),(328,'Vincent Massey','939 45 Street SW',NULL,'Calgary','AB','T3C 2B9'),(329,'Sunalta','536 Sonora Avenue SW',NULL,'Calgary','AB','T3C 2J9'),(330,'Westgate','150 Westminster Drive SW',NULL,'Calgary','AB','T3C 2T3'),(331,'Greek Community','1 Tamarac Crescent S.W.',NULL,'Calgary','AB','T3C 3B7'),(332,'Horizon Academy','Unit P55 1610 - 37 St. SW PO Box 34028 Westbrook',NULL,'Calgary','AB','T3C 3P1'),(333,'St. Thomas Aquinas','4540 26 Ave SW',NULL,'Calgary','AB','T3E 0R1'),(334,'Calgary Christian High','5029 - 26 Avenue S.W.',NULL,'Calgary','AB','T3E 0R5'),(335,'St. Gregory','5340 26 Ave SW',NULL,'Calgary','AB','T3E 0R6'),(336,'All Boys School - Sir James Lougheed','3519 36 Avenue SW',NULL,'Calgary','AB','T3E 1C2'),(337,'St. Andrew','4331 41 Ave SW',NULL,'Calgary','AB','T3E 1G2'),(338,'Lord Shaughnessy High','2336 53 Avenue SW',NULL,'Calgary','AB','T3E 1L2'),(339,'St. James','2227 58 Ave SW',NULL,'Calgary','AB','T3E 1N6'),(340,'Central Memorial High','5111 21 Street SW',NULL,'Calgary','AB','T3E 1R9'),(341,'Killarney','3008 33 Street SW',NULL,'Calgary','AB','T3E 2T9'),(342,'Holy Name','3011 35 St SW',NULL,'Calgary','AB','T3E 2Y7'),(343,'A. E. Cross','3445 37 Street SW',NULL,'Calgary','AB','T3E 3C2'),(344,'Glenbrook','4725 33 Avenue SW',NULL,'Calgary','AB','T3E 3V1'),(345,'Calgary Christian','2839 - 49 Street S.W.',NULL,'Calgary','AB','T3E 3X9'),(346,'Glendale','2415 Kelwood Drive SW',NULL,'Calgary','AB','T3E 3Z8'),(347,'Calgary Arts Academy','4931 Grove Hill Road S.W.',NULL,'Calgary','AB','T3E 4G4'),(348,'Glamorgan','50 Grafton Drive SW',NULL,'Calgary','AB','T3E 4W3'),(349,'Bishop Pinkham','3304 63 Avenue SW',NULL,'Calgary','AB','T3E 5K1'),(350,'Calgary Girls','6304 Larkspur Way S.W.',NULL,'Calgary','AB','T3E 5P7'),(351,'Jennie Elliott','3031 Lindsay Drive SW',NULL,'Calgary','AB','T3E 6A9'),(352,'Bishop Carroll High','4624 Richard Rd SW',NULL,'Calgary','AB','T3E 6L1'),(353,'Sainte Marguerite Bourgeoys','4700 Richard Road S.W.',NULL,'Calgary','AB','T3E 6L1'),(354,'Clear Water Academy','2521 Dieppe Avenue SW',NULL,'Calgary','AB','T3E 7J9'),(355,'Banbury Crossroads','B1 #201 2451 Dieppe Avenue S.W.',NULL,'Calgary','AB','T3E 7K1'),(356,'Access International College (Calgary) Inc.','B1 - 2451 Dieppe Avenue S.W. Box 100',NULL,'Calgary','AB','T3E 7K1'),(357,'New Heights School and Learning Services','4041 Breskins Drive SW',NULL,'Calgary','AB','T3E 7K8'),(358,'Maria Montessori','Building B4, #003 2452 Battleford Avenue S.W.',NULL,'Calgary','AB','T3E 7K9'),(359,'St. Rita','7811 Ranchview Dr NW',NULL,'Calgary','AB','T3G 2B3'),(360,'Ranchlands','610 Ranchlands Boulevard NW',NULL,'Calgary','AB','T3G 2C5'),(361,'Hawkwood','650 Hawkwood Boulevard NW',NULL,'Calgary','AB','T3G 2V7'),(362,'St. Maria Goretti','375 Hawkstone Dr NW',NULL,'Calgary','AB','T3G 3T7'),(363,'Citadel Park','808 Citadel Drive NW',NULL,'Calgary','AB','T3G 4B8'),(364,'Arbour Lake','27 Arbour Crest Drive NW',NULL,'Calgary','AB','T3G 4H3'),(365,'Yufeng Chinese','169 Citadel Ridge Close NW',NULL,'Calgary','AB','T3G 4V4'),(366,'St. Ambrose','1500 Arbour Lake Rd NW',NULL,'Calgary','AB','T3G 4X9'),(367,'Royal Oak','9100 Royal Birch Boulevard NW',NULL,'Calgary','AB','T3G 5R8'),(368,'St. Brigid','730 Citadel Way NW',NULL,'Calgary','AB','T3G 5S6'),(369,'Robert Thirsk High','8777 Nose Hill Drive NW',NULL,'Calgary','AB','T3G 5T3'),(370,'St. Joan of Arc','7970 Wentworth Dr SW',NULL,'Calgary','AB','T3H 0K2'),(371,'Ernest Manning High','20 Springborough Boulevard SW',NULL,'Calgary','AB','T3H 0N7'),(372,'West Springs','8999 Wentworth Avenue SW',NULL,'Calgary','AB','T3H 0P7'),(373,'Calgary Academy','1677 93 rd Street S.W.',NULL,'Calgary','AB','T3H 0R3'),(374,'Calgary Academy Collegiate','1677 - 93rd Street S.W.',NULL,'Calgary','AB','T3H 0R3'),(375,'John W. Costello Catholic','300 Strathcona Dr SW',NULL,'Calgary','AB','T3H 1N9'),(376,'Olympic Heights','875 Strathcona Drive SW',NULL,'Calgary','AB','T3H 2Z7'),(377,'Rundle College Junior High','7375 - 17 Avenue SW',NULL,'Calgary','AB','T3H 3W5'),(378,'Rundle College Senior High','7375 - 17 Avenue SW',NULL,'Calgary','AB','T3H 3W5'),(379,'Webber Academy','1515 - 93 Street SW',NULL,'Calgary','AB','T3H 4A8'),(380,'Battalion Park','369 Sienna Park Drive SW',NULL,'Calgary','AB','T3H 4S2'),(381,'Menno Simons Christian','7000 Elkton Drive S.W.',NULL,'Calgary','AB','T3H 4Y7'),(382,'Dr. Roberta Bondar','1580 Strathcona Drive SW',NULL,'Calgary','AB','T3H 5B1'),(383,'Calgary Waldorf','515 Cougar Ridge Drive S.W.',NULL,'Calgary','AB','T3H 5G9'),(384,'West Ridge','8903 Wentworth Avenue SW',NULL,'Calgary','AB','T3H 5N9'),(385,'Calgary French & International','700 - 77 Street S.W.',NULL,'Calgary','AB','T3H 5R1'),(386,'Light of Christ','6270 Saddlehorn Dr NE',NULL,'Calgary','AB','T3J 0L8'),(387,'Hugh A. Bennett','40 Saddlelake Way  NE',NULL,'Calgary','AB','T3J 0V1'),(388,'St. John Paul II','119 Castleridge Dr NE',NULL,'Calgary','AB','T3J 1P6'),(389,'Terry Fox','139 Falshire Drive NE',NULL,'Calgary','AB','T3J 1P7'),(390,'Falconridge','1331 Falconridge Drive NE',NULL,'Calgary','AB','T3J 1T4'),(391,'St. John XXIII','1420 Falconridge Dr NE',NULL,'Calgary','AB','T3J 2C3'),(392,'O.S. Geiger','100 Castlebrook Drive NE',NULL,'Calgary','AB','T3J 2J4'),(393,'Grant MacEwan','180 Falshire Drive NE',NULL,'Calgary','AB','T3J 3A5'),(394,'École La Mosaïque','199 Martindale Blvd NE',NULL,'Calgary','AB','T3J 3G4'),(395,'Monsignor A.J. Hetherington','4 Coral Springs Blvd NE',NULL,'Calgary','AB','T3J 3J3'),(396,'Bishop McNally High','5700 Falconridge Blvd NE',NULL,'Calgary','AB','T3J 3N4'),(397,'Filipino Language and Cultural School of Calgary','Bay 204 & 206 Westwinds Dr NE',NULL,'Calgary','AB','T3J 3Z5'),(398,'Ted Harrison','215 Taravista Way NE',NULL,'Calgary','AB','T3J 4L1'),(399,'Crossing Park','500 Martindale Boulevard NE',NULL,'Calgary','AB','T3J 4W8'),(400,'Our Lady of Fatima','6320 Taralea Pk NE',NULL,'Calgary','AB','T3J 5C4'),(401,'Peter Lougheed','148 Saddletree Close NE',NULL,'Calgary','AB','T3J 5J1'),(402,'Saddle Ridge','368 Saddlecrest Boulevard NE',NULL,'Calgary','AB','T3J 5L6'),(403,'Captain Nichola Goddard','405 Panatella Boulevard NW',NULL,'Calgary','AB','T3K 0P3'),(404,'Panorama Hills','1057 Panorama Hills Drive NW',NULL,'Calgary','AB','T3K 0S4'),(405,'Buffalo Rubbing Stone','1308 Panatella Boulevard NW',NULL,'Calgary','AB','T3K 0X2'),(406,'Calgary Chinese Alliance','150 Beddington Blvd. NE',NULL,'Calgary','AB','T3K 2E2'),(407,'St. Bede','333 Bermuda Dr NW',NULL,'Calgary','AB','T3K 2J5'),(408,'Beddington Heights','95 Bermuda Road NW',NULL,'Calgary','AB','T3K 2J6'),(409,'Simons Valley','375 Sandarac Drive NW',NULL,'Calgary','AB','T3K 4B2'),(410,'Monsignor Neville Anderson','327 Sandarac Dr NW',NULL,'Calgary','AB','T3K 4B2'),(411,'Ascension of Our Lord','509 Harvest Hills Dr NE',NULL,'Calgary','AB','T3K 4G9'),(412,'St. Jerome','11616 Panorama Hills Blvd NW',NULL,'Calgary','AB','T3K 5S3'),(413,'Coventry Hills','12350 Coventry Hills Way NE',NULL,'Calgary','AB','T3K 5S9'),(414,'Nose Creek','135 Covepark Square NE',NULL,'Calgary','AB','T3K 5W9'),(415,'St. Clare','12455 Coventry Hills Way NE',NULL,'Calgary','AB','T3K 5Z4'),(416,'Notre Dame High','11900 Country Village Link NE',NULL,'Calgary','AB','T3K 6E4'),(417,'Twelve Mile Coulee','65 Tuscany Hills Road NW',NULL,'Calgary','AB','T3L 0C7'),(418,'Monsignor E.L. Doyle','8887 Scurfield Dr NW',NULL,'Calgary','AB','T3L 1H6'),(419,'Scenic Acres','50 Scurfield Way NW',NULL,'Calgary','AB','T3L 1T2'),(420,'Tuscany','990 Tuscany Drive NW',NULL,'Calgary','AB','T3L 2T4'),(421,'St. Basil','919 Tuscany Dr NW',NULL,'Calgary','AB','T3L 2T5'),(422,'Eric Harvie','357 Tuscany Drive NW',NULL,'Calgary','AB','T3L 3C9'),(423,'Auburn Bay','7 Auburn Bay Avenue SE',NULL,'Calgary','AB','T3M 0K6'),(424,'Cranston','205 Cranston Drive SE',NULL,'Calgary','AB','T3M 1E8'),(425,'Christ the King','333 Cranston Way SE',NULL,'Calgary','AB','T3M 1K6'),(426,'Prince of Peace','43 Auburn Meadows Blvd SE',NULL,'Calgary','AB','T3M 2C9'),(427,'Kenneth D. Taylor','30 Evanscove Circle NW',NULL,'Calgary','AB','T3P 0A1'),(428,'Our Lady of Grace','736 Evanston Drive NW',NULL,'Calgary','AB','T3P 0N7'),(429,'Renert','14 Royal Vista Link NW',NULL,'Calgary','AB','T3R 0K4'),(430,'Bearspaw Christian School & College','15001 - 69 Street NW',NULL,'Calgary','AB','T3R 1C5'),(431,'West View','12626 85 Street NW',NULL,'Calgary','AB','T3R 1J3');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'capstone'
--
/*!50003 DROP PROCEDURE IF EXISTS `addClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addClient`(theName varchar(30), theEmail varchar(35), thePassword varchar(20), thePhone varchar(12))
BEGIN

INSERT INTO `capstone`.`client_account`
(`name`,
`email`,
`password`,
`last_show_booked`,
`phone`)
VALUES
(theName,
theEmail,
AES_ENCRYPT(thePassword, "password"),
null,
thePhone);

select client_id, name, email, last_show_booked, phone
FROM client_account
WHERE email = theEmail;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addIllusion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addIllusion`(theBookingId int, theIllusionId int)
BEGIN

INSERT IGNORE INTO booking_illusion_list(booking_id, illusion_id)
VALUES(theBookingId, theIllusionId);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addItemToInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addItemToInventory`(theMagicianId int, theTrickName varchar(30), theTrickPrice double, theTrickQuantity int, theTrickDescription varchar(2000), theType varchar(50))
BEGIN

DECLARE v_id BIGINT UNSIGNED;

INSERT INTO inventory (magician_id, name, price, quantity, description)
VALUES (theMagicianId, theTrickName, theTrickPrice, theTrickQuantity, theTrickDescription);

SET v_id = LAST_INSERT_ID();

UPDATE inventory
SET image_location = CONCAT("trick",v_id,".",theType)
WHERE inventory_id = v_id;

SELECT image_location
FROM inventory
WHERE inventory_id = v_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addMagician` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addMagician`(theName VARCHAR(30), theEmail VARCHAR(35), thePassword VARCHAR(20), price30 DECIMAL(8,2), price45 DECIMAL(8,2), price60 DECIMAL(8,2), schoolPrice DECIMAL(8,2), corporatePrice DECIMAL(8,2))
BEGIN

INSERT INTO magician_account
(name, email, password, min_30_show_price, min_45_show_price, min_60_show_price, corporate_show_price, school_show_price, description, personal_description, corporate_description, school_description, image_location)
VALUES
(theName, theEmail, AES_ENCRYPT(thePassword,"password"), price30, price45, price60, corporatePrice, schoolPrice, "Under Construction", "Under Construction", "Under Construction", "Under Construction", "default.jpg");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addNewIllusion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewIllusion`(theMagicianId int, theName varchar(30), theLength int, theRecommendedAge int)
BEGIN

INSERT INTO illusion(magician_id, illusion_name, illusion_length, recommended_age)
VALUES(theMagicianId, theName, theLength, theRecommendedAge);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addOrderContents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addOrderContents`(theOrderId int, theTrickId int, theQuantity int)
BEGIN
DECLARE v_inventory_quantity int;
DECLARE v_price decimal(8,2);
DECLARE v_order_total decimal(8,2);

SELECT quantity, price INTO v_inventory_quantity, v_price
FROM inventory WHERE inventory_id = theTrickId;

SELECT price INTO v_order_total
FROM orders
WHERE order_id = theOrderId;

IF(v_inventory_quantity >= theQuantity) THEN
	INSERT IGNORE INTO order_contents (order_id, inventory_id, quantity, price)
	VALUES(theOrderId, theTrickId, theQuantity, v_price);

	UPDATE inventory
	SET quantity = v_inventory_quantity-theQuantity
	WHERE inventory_id = theTrickId;
    
    UPDATE orders
    SET price = v_order_total + ((theQuantity * v_price)*1.05)
    WHERE order_id = theOrderId;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `approveShow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `approveShow`(theBookingId int)
BEGIN
DECLARE v_client_id int;
DECLARE v_length int;
DECLARE v_total_length int DEFAULT 0;
DECLARE v_table_size int DEFAULT 0;
DECLARE v_insertion_illusion int;
DECLARE v_random int;

SELECT client_id, show_length INTO v_client_id, v_length
FROM booking WHERE booking_id = theBookingId;

CREATE TEMPORARY TABLE IF NOT EXISTS avaliable_illusions
(table_id INT(11) NOT NULL AUTO_INCREMENT, illusion_id INT, illusion_length int, recommended_age int, PRIMARY KEY (table_id));

INSERT INTO avaliable_illusions (table_id, illusion_id, illusion_length, recommended_age) SELECT 0, i.illusion_id, i.illusion_length, i.recommended_age FROM illusion i JOIN booking b ON b.magician_id = i.magician_id WHERE b.booking_id = theBookingId AND NOT EXISTS(SELECT 1 FROM illusions_seen WHERE client_id = b.client_id AND illusion_id = i.illusion_id);

 

myloop: WHILE(v_total_length + 11 < v_length) DO
	
    SELECT COUNT(table_id) INTO v_table_size FROM avaliable_illusions;
    
    if(v_table_size > 0) THEN
    SELECT FLOOR(1 + RAND()*(v_table_size - 1)) INTO v_random;
    
    SELECT illusion_id INTO v_insertion_illusion
    FROM avaliable_illusions WHERE table_id = v_random;
    
	INSERT IGNORE INTO booking_illusion_list
    VALUES (theBookingId, v_insertion_illusion);
    
	SELECT SUM(i.illusion_length) INTO v_total_length
    FROM illusion i JOIN booking_illusion_list l ON i.illusion_id = l.illusion_id
    WHERE l.booking_id = theBookingId;
    
    DELETE FROM avaliable_illusions
    WHERE table_id = v_random;
    
    ELSE
    LEAVE myloop;
    
    END IF;
    
END WHILE;
    
UPDATE booking
SET approved = 1
WHERE booking_id=theBookingId;

DROP TABLE avaliable_illusions;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bookCorporateShow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bookCorporateShow`(theClientId int, theMagicianId int, theDate datetime, theAddress varchar(35), thePrice double, numkids int, advMethod int, showLength int, companyName varchar(30), numOfAdults int, kidShow int, stageShow int)
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE vDate datetime DEFAULT CURRENT_TIMESTAMP;
DECLARE vDateEnd datetime DEFAULT CURRENT_TIMESTAMP;
DECLARE vShowEnd datetime DEFAULT theDate + INTERVAL showLength MINUTE;
DECLARE dateCursor CURSOR FOR
SELECT date, date + INTERVAL show_length MINUTE
FROM booking
WHERE magician_id = theMagicianId;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

INSERT IGNORE INTO client_list VALUES(theMagicianId, theClientId);

OPEN dateCursor;

date_loop: LOOP
FETCH dateCursor INTO vDate, vDateEnd;
IF theDate <= CURRENT_TIMESTAMP 
OR (theDate >= vDate AND theDate <= vDateEnd)
OR (vShowEnd >= vDate AND vShowEnd <= vDateEnd) THEN
LEAVE date_loop;

ELSEIF done THEN
INSERT INTO booking (client_id, magician_id, date, address, price, approved, show_type, num_kids, adv_method, show_length, company_name, num_of_adults, kid_show, stage_show, performed)
VALUES (theClientId, theMagicianId, theDate, theAddress, thePrice, 0, 2, numkids, advMethod, showLength, companyName, numOfAdults, kidShow, stageShow, false);
LEAVE date_loop;
END IF;
END LOOP;
CLOSE dateCursor;

UPDATE client_account
SET last_show_booked = NOW()
WHERE client_id = theClientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bookoffTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bookoffTime`(theMagicianId int, theDate datetime, theLength BIGINT)
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE vDate datetime DEFAULT CURRENT_TIMESTAMP;
DECLARE vDateEnd datetime DEFAULT CURRENT_TIMESTAMP;
DECLARE vShowEnd datetime DEFAULT theDate + INTERVAL theLength MINUTE;
DECLARE dateCursor CURSOR FOR
SELECT date, date + INTERVAL show_length MINUTE
FROM booking
WHERE magician_id = theMagicianId;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN dateCursor;

date_loop: LOOP
FETCH dateCursor INTO vDate, vDateEnd;
IF theDate <= CURRENT_TIMESTAMP 
OR (theDate >= vDate AND theDate <= vDateEnd)
OR (vShowEnd >= vDate AND vShowEnd <= vDateEnd) THEN
LEAVE date_loop;

ELSEIF done THEN
INSERT INTO booking (client_id, magician_id, date, address, price, approved, show_type, num_kids, adv_method, show_length, performed)
VALUES (1, theMagicianId, theDate, "Not Required", 0, true, 4, 0, 0, theLength, false);
LEAVE date_loop;
END IF;
END LOOP;
CLOSE dateCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bookPersonalShow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bookPersonalShow`(theClientId int, theMagicianId int, theDate datetime, theAddress varchar(35), thePrice double, numkids int, advMethod int, showLength int, birthdayAge int, childName varchar(30))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE vDate datetime DEFAULT CURRENT_TIMESTAMP;
DECLARE vDateEnd datetime DEFAULT CURRENT_TIMESTAMP;
DECLARE vShowEnd datetime DEFAULT theDate + INTERVAL showLength MINUTE;
DECLARE dateCursor CURSOR FOR
SELECT date, date + INTERVAL show_length MINUTE
FROM booking
WHERE magician_id = theMagicianId;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

INSERT IGNORE INTO client_list VALUES(theMagicianId, theClientId);

OPEN dateCursor;

date_loop: LOOP
FETCH dateCursor INTO vDate, vDateEnd;
IF theDate <= CURRENT_TIMESTAMP 
OR (theDate >= vDate AND theDate <= vDateEnd)
OR (vShowEnd >= vDate AND vShowEnd <= vDateEnd) THEN
LEAVE date_loop;


ELSEIF done THEN
INSERT INTO booking (client_id, magician_id, date, address, price, approved, show_type, num_kids, adv_method, show_length, birthday_age, name_of_child, performed)
VALUES (theClientId, theMagicianId, theDate, theAddress, thePrice, 0, 1, numkids, advMethod, showLength, birthdayAge, childName, false);
LEAVE date_loop;
END IF;
END LOOP;
CLOSE dateCursor;

UPDATE client_account
SET last_show_booked = NOW()
WHERE client_id = theClientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bookSchoolShow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bookSchoolShow`(theClientId int, theMagicianId int, theDate datetime, theAddress varchar(35), thePrice double, numkids int, advMethod int, showLength int, schoolName varchar(35), schoolShowType int)
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE vSchoolId INT;
DECLARE vDate datetime DEFAULT CURRENT_TIMESTAMP;
DECLARE vDateEnd datetime DEFAULT CURRENT_TIMESTAMP;
DECLARE vShowEnd datetime DEFAULT theDate + INTERVAL showLength MINUTE;
DECLARE dateCursor CURSOR FOR
SELECT date, date + INTERVAL show_length MINUTE
FROM booking
WHERE magician_id = theMagicianId;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

SELECT school_id INTO vSchoolId
FROM school
WHERE school_name = schoolName;

INSERT IGNORE INTO client_list VALUES(theMagicianId, theClientId);

INSERT IGNORE INTO magician_school_list VALUES(vSchoolId, theMagicianId); 

OPEN dateCursor;

date_loop: LOOP
FETCH dateCursor INTO vDate, vDateEnd;
IF theDate <= CURRENT_TIMESTAMP 
OR (theDate >= vDate AND theDate <= vDateEnd)
OR (vShowEnd >= vDate AND vShowEnd <= vDateEnd) THEN
LEAVE date_loop;


ELSEIF done THEN
INSERT INTO booking (client_id, magician_id, date, address, price, approved, show_type, num_kids, adv_method, show_length, school_name, school_show_type, performed)
VALUES (theClientId, theMagicianId, theDate, theAddress, thePrice, 0, 3, numkids, advMethod, showLength, schoolName, schoolShowType, false);
LEAVE date_loop;
END IF;
END LOOP;
CLOSE dateCursor;

UPDATE client_account
SET last_show_booked = NOW()
WHERE client_id = theClientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancelOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancelOrder`(theOrderId int)
BEGIN
DECLARE v_inventory_id INT;
DECLARE v_quantity INT;
DECLARE v_current_quantity int;
DECLARE done INT DEFAULT FALSE;
DECLARE orderTrickCursor CURSOR FOR
	SELECT inventory_id, quantity
	FROM order_contents
	WHERE order_id = theOrderId;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN orderTrickCursor;

order_loop: LOOP
	IF done THEN
		LEAVE order_loop;
	END IF;
	
    FETCH orderTrickCursor INTO v_inventory_id, v_quantity;
	SELECT quantity INTO v_current_quantity
	FROM inventory
	WHERE inventory_id = v_inventory_id;
	
	UPDATE inventory
	SET quantity = v_current_quantity + v_quantity
	WHERE inventory_id = v_inventory_id;
	END LOOP;
    
    DELETE FROM orders
    WHERE order_id = theOrderId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeClientPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeClientPassword`(theClientId int, theOldPass VARCHAR(20), theNewPass VARCHAR(20))
BEGIN
DECLARE v_old_pass VARCHAR(20);

SELECT password into v_old_pass
FROM client_account
WHERE client_id = theClientId;

IF v_old_pass = AES_ENCRYPT(theOldPass,"password") THEN
UPDATE client_account
SET password = AES_ENCRYPT(theNewPass,"password")
WHERE client_id = theClientId;

SELECT 1 FROM client_account
WHERE client_id = theClientId AND password = AES_ENCRYPT(theNewPass, "password");

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clientSaveInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clientSaveInfo`(theClientId int, theName VARCHAR(30), theEmail VARCHAR(35), thePhone VARCHAR(12))
BEGIN

UPDATE client_account
SET name = theName, email = theEmail, phone = thePhone
WHERE client_id = theClientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteBooking`(theBookingId int)
BEGIN

DELETE FROM booking
WHERE booking_id = theBookingId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteClient`(theMagicianId int, theClientId int)
BEGIN

DELETE FROM client_list
WHERE client_id = theClientId AND magician_id = theMagicianId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteClientAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteClientAccount`(theClientId int, thePassword VARCHAR(20))
BEGIN

UPDATE client_account
SET active = 0
WHERE client_id = theClientId and password = AES_ENCRYPT(thePassword, "password");

DELETE FROM booking
WHERE client_id = theClientId AND performed = false;

SELECT 1
FROM client_account
WHERE client_id = theClientId AND active = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteIllusion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteIllusion`(theIllusionId int)
BEGIN
DELETE FROM illusion
WHERE illusion_id = theIllusionID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteInventoryItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteInventoryItem`(theInventoryId int)
BEGIN

SELECT image_location FROM inventory WHERE inventory_id = theInventoryId;

DELETE FROM inventory
WHERE inventory_id = theInventoryId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteMagician` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteMagician`(theMagicianId int)
BEGIN

UPDATE magician_account
SET active = 0
WHERE magician_id = theMagicianId;

DELETE FROM booking
WHERE magician_id = theMagicianId AND performed = false;


SELECT image_location
FROM magician_account
WHERE magician_id = theMagicianId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editIllusion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editIllusion`(theIllusionId int, theName varchar(30), theLength int, theRecommendedAge int)
BEGIN
UPDATE illusion SET illusion_name = theName, illusion_length = theLength, recommended_age = theRecommendedAge
WHERE illusion_id = theIllusionId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editInventoryItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editInventoryItem`(theInventoryId int, theTrickName varchar(30), theTrickPrice double, theTrickQuantity int, theTrickDescription varchar(2000))
BEGIN

UPDATE inventory
SET name = theTrickName, price = theTrickPrice, quantity = theTrickQuantity, description = theTrickDescription
WHERE inventory_id = theInventoryId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generateBookingReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generateBookingReport`(theMagicianId int, theStartDate datetime, theEndDate datetime)
BEGIN
SELECT b.booking_id, b.date, b.price, b.show_type, b.num_kids, b.adv_method, b.show_length, b.birthday_age, b.num_of_adults, b.kid_show, b.stage_show, b.school_show_type, i.illusion_name
FROM booking b JOIN booking_illusion_list l on b.booking_id = l.booking_id
JOIN illusion i ON l.illusion_id = i.illusion_id
WHERE b.magician_id = theMagicianId AND b.date > theStartDate AND b.date < theEndDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generateLetterLabels` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generateLetterLabels`(theMagicianId int)
BEGIN
SELECT s.school_name, s.address_1, s.city, s.province, s.postal_code
FROM school s
WHERE s.school_id NOT IN(select l.school_id from magician_school_list l where l.magician_id = theMagicianId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generateOrderPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generateOrderPrice`(theOrderId int)
BEGIN

UPDATE orders
SET price = (SELECT (SUM(price)* quantity)*1.05 FROM order_contents WHERE order_id = theOrderId group by order_id)
WHERE order_id = theOrderId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generateOrderReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generateOrderReport`(theMagicianId int, theStartDate datetime, theEndDate datetime)
BEGIN
SELECT o.order_id, o.shipped, o.client_id, o.date_placed, o.price, o.date_shipped, c.email, i.name, oc.quantity, oc.price
FROM orders o JOIN client_account c ON o.client_id = c.client_id
JOIN order_contents oc ON o.order_id = oc.order_id JOIN inventory i ON oc.inventory_id = i.inventory_id
WHERE o.magician_id = theMagicianId AND o.date_placed > theStartDate AND o.date_placed < theEndDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generateTrickSalesReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generateTrickSalesReport`(theMagicianId int, theStartDate datetime, theEndDate datetime)
BEGIN
SELECT c.order_id, i.name, c.quantity, c.price, o.date_placed, o.price
FROM order_contents c JOIN orders o ON c.order_id = o.order_id JOIN inventory i ON c.inventory_id = i.inventory_id
WHERE o.magician_id = theMagicianID AND o.date_placed > theStartDate AND o.date_placed < theEndDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllBookings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllBookings`(theMagicianId int)
BEGIN
SELECT *
FROM booking
WHERE magician_id = theMagicianId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBookingInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBookingInvoice`(theBookingId int)
BEGIN
SELECT m.name as MagicianName, m.email, c.name as ClientName, b.date, b.address, b.price, b.show_length
FROM booking b JOIN magician_account m ON b.magician_id = m.magician_id
JOIN client_account c ON b.client_id = c.client_id
WHERE b.booking_id = theBookingId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClient`(theClientId int)
BEGIN
SELECT name, email, last_show_booked, phone
FROM client_account
WHERE client_id = theClientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClientAccountInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientAccountInfo`(theClientId int)
BEGIN
SELECT email, phone
FROM client_account
WHERE client_id = theClientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClientCalendar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientCalendar`(theId int)
BEGIN

SELECT date, show_length, approved
FROM booking
WHERE magician_id = theId AND date > NOW();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClientList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientList`(theMagicianId int)
BEGIN
SELECT ca.client_id, ca.name, ca.email, ca.last_show_booked, ca.phone
FROM client_account ca JOIN client_list cl ON ca.client_id = cl.client_id
WHERE cl.magician_id=theMagicianId AND ca.active = 1
ORDER BY ca.name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCorporateShow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCorporateShow`(theBookingId int)
BEGIN
	SELECT b.num_kids, b.address, c.name, b.date, c.email, c.last_show_booked, b.adv_method, c.phone, b.show_length, b.company_name, b.num_of_adults, b.kid_show, b.stage_show, b.performed
    FROM booking b JOIN client_account c ON b.client_id = c.client_id
    WHERE booking_id = theBookingId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDescriptions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDescriptions`(theMagicianId int)
BEGIN
	SELECT description, min_60_show_price, personal_description, corporate_show_price, corporate_description, school_show_price, school_description, image_location
    FROM magician_account
    WHERE magician_id = theMagicianId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEmails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmails`(theBookingId int)
BEGIN

SELECT c.email
FROM booking b JOIN client_account c ON b.client_id = c.client_id
WHERE b.booking_id = theBookingId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFullShowIllusionList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFullShowIllusionList`(theBookingId int)
BEGIN

DECLARE v_magician_id int;
DECLARE v_client_id int;

SELECT magician_id, client_id
INTO v_magician_id, v_client_id
FROM booking
WHERE booking_id = theBookingId;

SELECT i.illusion_id, i.illusion_name, i.illusion_length, i.recommended_age, EXISTS(SELECT 1 FROM illusions_seen WHERE client_id = v_client_id and illusion_id = i.illusion_id) AS seen
FROM illusion i
WHERE magician_id = v_magician_id AND NOT EXISTS(SELECT 1 FROM booking_illusion_list WHERE booking_id = theBookingId AND illusion_id = i.illusion_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIllusionList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIllusionList`(theId int)
BEGIN
	SELECT illusion_id, illusion_name, illusion_length, recommended_age
    FROM illusion
    WHERE magician_id = theId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIllusionsSeen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIllusionsSeen`(theClientId int)
BEGIN
	SELECT i.illusion_id, i.illusion_name, i.illusion_length, i.recommended_age
    FROM illusions_seen s JOIN illusion i ON s.illusion_id = i.illusion_id
    WHERE client_id = theClientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInventory`(theId int)
BEGIN
	SELECT inventory_id, name, price, quantity, description, image_location
    FROM inventory
    WHERE magician_id = theId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMagician` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMagician`(theMagicianId int)
BEGIN
SELECT name, email, min_30_show_price, min_45_show_price, min_60_show_price, corporate_show_price, school_show_price 
FROM magician_account
WHERE magician_id=theMagicianId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMagicianAccountInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMagicianAccountInfo`(theMagicianId int)
BEGIN
SELECT name, min_30_show_price, min_45_show_price, min_60_show_price, corporate_show_price, school_show_price, description, personal_description, corporate_description, school_description
FROM magician_account
WHERE magician_id = theMagicianId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMagicianCalendar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMagicianCalendar`(theId int)
BEGIN

SELECT b.booking_id, b.date, b.show_length, b.approved, b.show_type, c.name, b.performed
FROM booking b JOIN client_account c ON b.client_id = c.client_id 
WHERE b.magician_id = theId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMagicianList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMagicianList`()
BEGIN
	SELECT magician_id, name, email
    FROM magician_account
    WHERE active =1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrderEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrderEmail`(theOrderId int)
BEGIN

SELECT c.email
FROM orders o JOIN client_account c ON o.client_id = c.client_id
WHERE order_id = theOrderId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrderInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrderInvoice`(theOrderId int)
BEGIN

SELECT m.name as Magician_Name, c.name as Client_Name, o.address, o.date_placed, o.date_shipped, i.name as Trick_Name, oc.quantity, oc.price as Trick_Price, oc.quantity * oc.price as Trick_Total
FROM orders o JOIN magician_account m ON o.magician_id = m.magician_id
JOIN client_account c ON o.client_id = c.client_id
JOIN order_contents oc ON o.order_id = oc.order_id
JOIN inventory i ON oc.inventory_id = i.inventory_id
WHERE o.order_id = theOrderId; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrders`(theMagicianId int)
BEGIN

SELECT order_id, shipped, date_placed, address
from orders
WHERE magician_id = theMagicianId
ORDER BY shipped, date_placed asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrderShippingInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrderShippingInfo`(theOrderId int)
BEGIN

SELECT c.name, c.phone, c.email, o.address, o.shipped, o.date_placed, o.price, o.date_shipped
FROM orders o JOIN client_account c ON o.client_id = c.client_id
WHERE o.order_id = theOrderId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrderTricks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrderTricks`(theOrderId int)
BEGIN

SELECT i.name, o.quantity
FROM order_contents o JOIN inventory i ON o.inventory_id = i.inventory_id
WHERE o.order_id = theOrderId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPersonalShow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPersonalShow`(theBookingId int)
BEGIN
	SELECT b.num_kids, b.address, c.name, b.date, c.email, c.last_show_booked, b.adv_method, c.phone, b.show_length, b.birthday_age, b.name_of_child, b.performed
    FROM booking b JOIN client_account c ON b.client_id = c.client_id
    WHERE booking_id = theBookingId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPreviousImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPreviousImage`(theMagicianId int)
BEGIN
SELECT image_location
FROM magician_account
WHERE magician_id = theMagicianId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPrevOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPrevOrders`(theClientId int)
BEGIN

SELECT o.order_id, m.name, o.date_placed, o.address, o.shipped, o.date_shipped, o.price 
FROM orders o JOIN magician_account m ON o.magician_id = m.magician_id
WHERE o.client_id = theClientId
ORDER BY o.date_placed desc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPrices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPrices`(theMagicianId int)
BEGIN

SELECT min_30_show_price, min_45_show_price, min_60_show_price, corporate_show_price, school_show_price
FROM magician_account
WHERE magician_id = theMagicianId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSchoolShow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSchoolShow`(theBookingId int)
BEGIN
	SELECT b.num_kids, b.address, c.name, b.date, c.email, c.last_show_booked, b.adv_method, c.phone, b.show_length, b.school_name, b.school_show_type, b.performed
    FROM booking b JOIN client_account c ON b.client_id = c.client_id
    WHERE booking_id = theBookingId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getShowIllusionList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getShowIllusionList`(theBookingId int)
BEGIN

DECLARE v_magician_id int;
DECLARE v_client_id int;

SELECT magician_id, client_id
INTO v_magician_id, v_client_id
FROM booking
WHERE booking_id = theBookingId;

SELECT i.illusion_id, i.illusion_name, i.illusion_length, i.recommended_age, EXISTS(SELECT 1 FROM illusions_seen WHERE client_id = v_client_id and illusion_id = i.illusion_id) AS seen
FROM illusion i JOIN booking_illusion_list b ON i.illusion_id = b.illusion_id
WHERE b.booking_id = theBookingId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getShowIllusions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getShowIllusions`(theBookingId int)
BEGIN
SELECT i.illusion_id, i.illusion_name, i.illusion_length, i.recommended_age
FROM booking_illusion_list l JOIN illusion i ON l.illusion_id = i.illusion_id
WHERE l.booking_id = theBookingId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getShowInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getShowInfo`(theBookingId int)
BEGIN
DECLARE v_show_type INT(1);
SELECT show_type INTO v_show_type
FROM booking
WHERE booking_id = theBookingId;

IF v_show_type = 1 THEN
SELECT b.show_type, c.name, b.address, b.date, c.email, c.phone, b.num_kids, b.adv_method, b.approved, b.birthday_age, b.name_of_child
FROM booking b JOIN client_account c ON b.client_id = c.client_id
WHERE b.booking_id = theBookingId;

ELSEIF v_show_type = 2 THEN
SELECT b.show_type, c.name, b.address, b.date, c.email, c.phone, b.num_kids, b.adv_method, b.approved, b.company_name, b.num_of_adults, b.kid_show, b.stage_show
FROM booking b JOIN client_account c ON b.client_id = c.client_id
WHERE b.booking_id = theBookingId;

ELSEIF v_show_type = 3 THEN
SELECT b.show_type, c.name, b.address, b.date, c.email, c.phone, b.num_kids, b.adv_method, b.approved, b.school_name, b.school_show_type
FROM booking b JOIN client_account c ON b.client_id = c.client_id
WHERE b.booking_id = theBookingId;

ELSE 
SELECT show_type, date 
FROM booking
WHERE booking_id = theBookingId;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUnapprovedBookings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUnapprovedBookings`(theMagicianId int)
BEGIN
SELECT b.booking_id, b.date, b.client_id, b.show_type, b.price, b.address, b.show_length, c.name, c.email
FROM booking b JOIN client_account c ON b.client_id = c.client_id
WHERE b.magician_id = theMagicianId AND b.approved = false
ORDER BY b.date ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUpcomingShows` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUpcomingShows`(theMagicianId INT)
BEGIN
	SELECT b.booking_id, b.date, b.address, b.show_length, b.approved, b.show_type, c.name, c.phone, b.invoiced, c.email
	FROM booking b JOIN client_account c ON b.client_id = c.client_id
	WHERE b.date >= NOW() AND b.date <= NOW() + INTERVAL 2 DAY AND magician_id = theMagicianId AND show_type <> 4
    ORDER BY b.date ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `magicianAddClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `magicianAddClient`(magicianId int, theName varchar(30), theEmail varchar(35), thePassword varchar(20), thePhone varchar(12))
BEGIN

DECLARE v_client_id int(11);

INSERT INTO `capstone`.`client_account`
(`name`,
`email`,
`password`,
`last_show_booked`,
`phone`)
VALUES
(theName,
theEmail,
AES_ENCRYPT(thePassword,"password"),
null,
thePhone);

SELECT client_id INTO v_client_id
FROM client_account
WHERE email = theEmail;

INSERT INTO `capstone`.`client_list`
(
`magician_id`,
`client_id`
)
VALUES
(
magicianId,
v_client_id
);

SELECT 1 FROM client_account
WHERE email = theEmail AND password = AES_ENCRYPT(thePassword,"password");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `markInvoiceSent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `markInvoiceSent`(theBookingId int)
BEGIN
UPDATE booking
SET invoiced = 1
WHERE booking_id = theBookingId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `markPerformed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `markPerformed`(theBookingId INT)
BEGIN

DECLARE done INT DEFAULT false;
DECLARE v_client_id int;
DECLARE v_date DATETIME;
DECLARE v_illusion_id int;
DECLARE v_approved boolean;
DECLARE cur1 CURSOR FOR SELECT illusion_id FROM booking_illusion_list WHERE booking_id = theBookingId;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

SELECT client_id, date, approved
INTO v_client_id, v_date, v_approved
FROM booking
WHERE booking_id = theBookingId;

IF v_approved = false THEN
	DELETE FROM booking WHERE booking_id = theBookingId;
ELSE
	UPDATE booking
	SET performed = true
	WHERE booking_id= theBookingId;

	UPDATE client_account
	SET last_show_booked = v_date
	WHERE client_id = v_client_id;

	OPEN cur1;

	read_loop: LOOP
		IF done THEN
		LEAVE read_loop;
		END IF;
		FETCH cur1 INTO v_illusion_id;
		INSERT IGNORE INTO illusions_seen values (v_client_id, v_illusion_id); 
	END LOOP;

	CLOSE cur1;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `markShipped` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `markShipped`(theOrderId int)
BEGIN

UPDATE orders
SET shipped = true, date_shipped = NOW()
WHERE order_id = theOrderId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `placeOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `placeOrder`(theClientId int, theMagicianId int, theAddress VARCHAR(35), theSecondaryAddress VARCHAR(35), thePostal VARCHAR(7), theCity VARCHAR(30), theProvince VARCHAR(2))
BEGIN

INSERT INTO orders (shipped, magician_id, client_id, date_placed, address, address_secondary, postal_code, city, province)
VALUES(false, theMagicianId, theClientId, NOW(), theAddress, theSecondaryAddress, thePostal, theCity, theProvince);

INSERT IGNORE into client_list(magician_id, client_id)
VALUES(theMagicianId, theClientId);

SELECT LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `removeIllusion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `removeIllusion`(theBookingId int, theIllusionId int)
BEGIN
DELETE FROM booking_illusion_list
WHERE booking_id = theBookingId AND illusion_id = theIllusionId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `resetClientPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetClientPassword`(theClientId int)
BEGIN
	UPDATE client_account
    SET password = AES_ENCRYPT("password", "password")
    WHERE client_id=theClientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `resetMagicianPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetMagicianPassword`(theMagicianId int)
BEGIN
	UPDATE magician_account
    SET password = AES_ENCRYPT("password", "password")
    WHERE magician_id = theMagicianId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveMagicianDescriptions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveMagicianDescriptions`(theMagicianId int, theDescription VARCHAR(1500), personalDescription VARCHAR(1500), corporateDescription VARCHAR(1500), schoolDescription VARCHAR(1500))
BEGIN

UPDATE magician_account
SET description = theDescription, personal_description = personalDescription, corporate_description = corporateDescription, school_description = schoolDescription
WHERE magician_id = theMagicianId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveMagicianImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveMagicianImage`(theMagicianId int, theFileName VARCHAR(45))
BEGIN
UPDATE magician_account
SET image_location = theFileName
WHERE magician_id = theMagicianId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveMagicianName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveMagicianName`(theMagicianId int, theName VARCHAR(30))
BEGIN

UPDATE magician_account
SET name = theName
WHERE magician_id = theMagicianId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveMagicianPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveMagicianPassword`(theMagicianId int, thePassword VARCHAR(20))
BEGIN

UPDATE magician_account
SET password = AES_ENCRYPT(theNewPassword, "password")
WHERE magician_id = theMagicianId AND password = AES_ENCRYPT(theCurrentPassword, "password");

SELECT 1
FROM magician_account
WHERE magician_id = theMagicianId AND password = AES_ENCRYPT(theNewPassword, "password");

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveMagicianPrices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveMagicianPrices`(theMagicianId int, the30Price DECIMAL(8,2), the45Price DECIMAL(8,2), the60Price DECIMAL(8,2), theCorporatePrice DECIMAL(8,2), theSchoolPrice DECIMAL(8,2))
BEGIN
UPDATE magician_account
SET min_30_show_price = the30Price, min_45_show_price = the45Price, min_60_show_price = the60Price, corporate_show_price = theCorporatePrice, school_show_price = theSchoolPrice
WHERE magician_id = theMagicianId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userValidate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userValidate`(theEmail varchar(35), thePassword varchar(20))
BEGIN
SELECT 'Admin' as account_type, admin_id, name 
    FROM admin_account 
    WHERE email = theEmail AND password = AES_ENCRYPT(thePassword, "password") 
    UNION 
    SELECT 'Magician' as account_type, magician_id, name
    FROM magician_account 
    WHERE email = theEmail AND password = AES_ENCRYPT(thePassword, "password") AND active = 1
    Union
    SELECT 'Client' as account_type, client_id, name
    FROM client_account 
    WHERE email = theEmail AND password = AES_ENCRYPT(thePassword, "password") AND active = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-12  9:26:01
