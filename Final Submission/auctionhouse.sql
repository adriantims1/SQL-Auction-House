-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: auctionhouse
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `opening_date` datetime NOT NULL,
  `closing_date` datetime NOT NULL,
  `opening_bid` decimal(15,2) NOT NULL,
  `increment` decimal(15,2) NOT NULL,
  `reserve` decimal(15,2) DEFAULT NULL,
  `rep_id` int DEFAULT NULL,
  `seller_id` int DEFAULT NULL,
  `winner_id` int DEFAULT NULL,
  `sold_price` decimal(15,2) DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rep_id` (`rep_id`),
  KEY `seller_id` (`seller_id`),
  KEY `winner_id` (`winner_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`rep_id`) REFERENCES `customerrepresentative` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `auction_ibfk_3` FOREIGN KEY (`winner_id`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `auction_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (1,'2008-12-13 13:00:00','2008-12-16 13:00:00',5.00,1.00,10.00,5,4,NULL,11.00,1),(2,'2008-12-13 13:00:00','2008-12-16 13:00:00',1000.00,10.00,2000.00,5,3,NULL,NULL,2);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `current_bid` decimal(15,2) NOT NULL,
  `bidder_id` int DEFAULT NULL,
  `auction_id` int NOT NULL,
  `maximum` decimal(15,2) NOT NULL,
  `current_winner_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bidder_id` (`bidder_id`),
  KEY `auction_id` (`auction_id`),
  KEY `current_winner_id` (`current_winner_id`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`bidder_id`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bid_ibfk_3` FOREIGN KEY (`current_winner_id`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (8,'2008-12-13 18:00:00',5.00,2,1,10.00,2),(9,'2008-12-13 18:01:00',6.00,1,1,10.00,2),(10,'2008-12-13 18:02:00',7.00,1,1,10.00,2),(11,'2008-12-13 18:03:00',8.00,1,1,10.00,2),(12,'2008-12-13 18:04:00',9.00,1,1,10.00,2),(13,'2008-12-13 18:05:00',10.00,1,1,10.00,2),(14,'2008-12-16 17:59:00',11.00,1,1,15.00,1);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL,
  `email` char(50) NOT NULL,
  `rating` int NOT NULL DEFAULT '1',
  `credit_card_number` char(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'shiyong@cs.sunysb.edu',1,'1234-5678-1234-5678'),(2,'dhaixia@cs.sunysb.edu',1,'5678-1234-5678-1234'),(3,'shlu@ic.sunysb.edu',1,'2345-6789-2345-6789'),(4,'pml@cs.sunysb.edu',1,'6789-2345-6789-2345');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerrepresentative`
--

DROP TABLE IF EXISTS `customerrepresentative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerrepresentative` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `customerrepresentative_ibfk_1` FOREIGN KEY (`id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerrepresentative`
--

LOCK TABLES `customerrepresentative` WRITE;
/*!40000 ALTER TABLE `customerrepresentative` DISABLE KEYS */;
INSERT INTO `customerrepresentative` VALUES (5),(8),(9);
/*!40000 ALTER TABLE `customerrepresentative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL,
  `ssn` char(50) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '7.25',
  `email` char(50) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (5,'123-45-6789','1998-11-01 04:00:00',60.00,'david.smith@gmail.com'),(6,'789-12-3456','1999-02-02 05:00:00',50.00,'david.warren@gmail.com'),(8,'123-45-8793','2021-11-14 05:00:00',50.00,'blessingtoother@gmail.com'),(9,'123-45-8793','2021-11-14 05:00:00',50.00,'blessingtoother@gmail.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helptopics`
--

DROP TABLE IF EXISTS `helptopics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helptopics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helptopics`
--

LOCK TABLES `helptopics` WRITE;
/*!40000 ALTER TABLE `helptopics` DISABLE KEYS */;
INSERT INTO `helptopics` VALUES (1,'General'),(2,'Bidding'),(3,'Selling'),(4,'Payment'),(5,'Shipping'),(6,'Returns');
/*!40000 ALTER TABLE `helptopics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `type` char(50) DEFAULT NULL,
  `year_manufactured` year DEFAULT NULL,
  `amount_in_stock` int NOT NULL DEFAULT '0',
  `copies_sold` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Titanic','DVD',2005,1,3),(2,'Nissan Sentra','Car',2007,1,0);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (6);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` char(100) NOT NULL DEFAULT '123',
  `first_name` char(50) NOT NULL,
  `last_name` char(50) NOT NULL,
  `address` char(50) NOT NULL,
  `city` char(50) NOT NULL,
  `state` char(2) NOT NULL,
  `zip` int NOT NULL,
  `phone` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'123','Shiyong','Lu','123 Success Street','Stony Brook','NY',11790,'(516)632-8959'),(2,'123','Haixia','Du','456 Fortune Road','Stony Brook','NY',11790,'(516)632-4360'),(3,'123','John','Smith','789 Peace Blvd.','Los Angeles','CA',12345,'(412)443-4321'),(4,'123','Lewis','Phil','135 Knowledge Lane','Stony Brook','NY',11794,'(516)666-8888'),(5,'123','David','Smith','123 College road','Stony Brook','NY',11790,'(516)215-2345'),(6,'123','David','Warren','456 Sunken Street','Stony Brook','NY',11794,'(516)632-9987'),(7,'123','Sunandjaja','Sowandi','Grey Hall A306','Stony Brook','NY',11790,'6317109870'),(8,'123','Sunandjaja','Sowandi','Grey Hall A306','Stony Brook','NY',11790,'6317109870'),(9,'123','Sunandjaja','Sowandi','Grey Hall A306','Stony Brook','NY',11790,'6317109870');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-09 19:21:26
