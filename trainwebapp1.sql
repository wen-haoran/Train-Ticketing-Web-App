CREATE DATABASE  IF NOT EXISTS `TrainWebApp1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `TrainWebApp1`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: cs336group2db.ccoeycccikwn.us-east-2.rds.amazonaws.com    Database: TrainWebApp1
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `Access_Reservation`
--

DROP TABLE IF EXISTS `Access_Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Access_Reservation` (
  `reservation_num` int(11) NOT NULL,
  `ssn` varchar(9) NOT NULL,
  PRIMARY KEY (`reservation_num`,`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Access_Reservation`
--

LOCK TABLES `Access_Reservation` WRITE;
/*!40000 ALTER TABLE `Access_Reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Access_Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Access_Train_Schedule`
--

DROP TABLE IF EXISTS `Access_Train_Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Access_Train_Schedule` (
  `ssn` varchar(9) NOT NULL,
  `schedule_date` date NOT NULL,
  `starting_time` time NOT NULL,
  `train_id` varchar(10) NOT NULL,
  PRIMARY KEY (`ssn`,`schedule_date`,`starting_time`,`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Access_Train_Schedule`
--

LOCK TABLES `Access_Train_Schedule` WRITE;
/*!40000 ALTER TABLE `Access_Train_Schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Access_Train_Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephone` varchar(12) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('bob101','pass','bl@mail.com','123-123-1234','Dole','Bob','7th st','NYC','AZ','12345'),('test','test','test@test.com','000-000-0000','test','test','test','test','AK','00000'),('user0','pass','ml@mail.com','123-123-1234','Purple','Mary','6th st','my city','AK','12345'),('user1','pass1','user1@mail.com','111-111-1111','Yellow','Jack','5th st','NYC','NY','12345'),('user2','pass2','user2@mail.com','123-123-1234','Red','Jane','First st','Seattle','WA','11111'),('user3','pass3','am@mail.com','123-123-1234','Green','Lily','2nd st','Piscataway','NJ','08854'),('user4','pass4','am@mail.com','123-123-1234','Blue','Mike','3rd st','Piscataway','NJ','08854'),('user5','pass5','hw@mail.com','234-432-2342','Black','Ron','4th st','DC','AL','12345'),('usert','pass','gold@email.com','432-321-4321','Gold','Jowel','Gold Street','Golden City','WY','00000');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Destination`
--

DROP TABLE IF EXISTS `Destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Destination` (
  `arrival_time` time DEFAULT NULL,
  `station_id` varchar(10) NOT NULL,
  `starting_time` time NOT NULL,
  `line_name` varchar(25) NOT NULL,
  `train_id` varchar(10) NOT NULL,
  PRIMARY KEY (`station_id`,`starting_time`,`line_name`,`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Destination`
--

LOCK TABLES `Destination` WRITE;
/*!40000 ALTER TABLE `Destination` DISABLE KEYS */;
/*!40000 ALTER TABLE `Destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `ssn` varchar(9) NOT NULL,
  `access_Level` enum('employee','admin','customer rep') DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fare`
--

DROP TABLE IF EXISTS `Fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fare` (
  `discount` int(11) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  `booking_fee` int(11) DEFAULT NULL,
  `route_fare` int(11) DEFAULT NULL,
  `weekly_or_monthly_fare` int(11) DEFAULT NULL,
  `reservation_num` int(11) NOT NULL,
  PRIMARY KEY (`reservation_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fare`
--

LOCK TABLES `Fare` WRITE;
/*!40000 ALTER TABLE `Fare` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Is_Based_On`
--

DROP TABLE IF EXISTS `Is_Based_On`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Is_Based_On` (
  `schedule_date` date NOT NULL,
  `reservation_num` int(11) NOT NULL,
  `starting_time` time NOT NULL,
  `line_name` varchar(25) NOT NULL,
  `train_id` varchar(10) NOT NULL,
  PRIMARY KEY (`schedule_date`,`reservation_num`,`starting_time`,`line_name`,`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Is_Based_On`
--

LOCK TABLES `Is_Based_On` WRITE;
/*!40000 ALTER TABLE `Is_Based_On` DISABLE KEYS */;
/*!40000 ALTER TABLE `Is_Based_On` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Line`
--

DROP TABLE IF EXISTS `Line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Line` (
  `line_name` varchar(25) NOT NULL,
  PRIMARY KEY (`line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Line`
--

LOCK TABLES `Line` WRITE;
/*!40000 ALTER TABLE `Line` DISABLE KEYS */;
/*!40000 ALTER TABLE `Line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Origin`
--

DROP TABLE IF EXISTS `Origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Origin` (
  `departure_time` time DEFAULT NULL,
  `station_id` varchar(10) NOT NULL,
  `starting_time` time NOT NULL,
  `line_name` varchar(25) NOT NULL,
  `train_id` varchar(10) NOT NULL,
  PRIMARY KEY (`station_id`,`starting_time`,`line_name`,`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Origin`
--

LOCK TABLES `Origin` WRITE;
/*!40000 ALTER TABLE `Origin` DISABLE KEYS */;
/*!40000 ALTER TABLE `Origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `reservation_num` int(11) NOT NULL,
  `one_way_or_round_trip` enum('one way','round way') DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `customer_rep` varchar(50) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reservation_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Station`
--

DROP TABLE IF EXISTS `Station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Station` (
  `station_id` varchar(10) NOT NULL,
  `station_name` varchar(30) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Station`
--

LOCK TABLES `Station` WRITE;
/*!40000 ALTER TABLE `Station` DISABLE KEYS */;
/*!40000 ALTER TABLE `Station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stops_At`
--

DROP TABLE IF EXISTS `Stops_At`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stops_At` (
  `line_name` varchar(25) NOT NULL,
  `station_id` int(11) NOT NULL,
  PRIMARY KEY (`station_id`,`line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stops_At`
--

LOCK TABLES `Stops_At` WRITE;
/*!40000 ALTER TABLE `Stops_At` DISABLE KEYS */;
/*!40000 ALTER TABLE `Stops_At` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Train_Schedule`
--

DROP TABLE IF EXISTS `Train_Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Train_Schedule` (
  `schedule_date` date DEFAULT NULL,
  `travel_time` time DEFAULT NULL,
  `starting_time` time NOT NULL,
  `line_name` varchar(25) NOT NULL,
  `train_id` varchar(10) NOT NULL,
  PRIMARY KEY (`starting_time`,`line_name`,`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Train_Schedule`
--

LOCK TABLES `Train_Schedule` WRITE;
/*!40000 ALTER TABLE `Train_Schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Train_Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trains`
--

DROP TABLE IF EXISTS `Trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trains` (
  `train_id` varchar(10) NOT NULL,
  `number_of_cars` int(11) DEFAULT NULL,
  `number_of_seats` int(11) DEFAULT NULL,
  PRIMARY KEY (`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trains`
--

LOCK TABLES `Trains` WRITE;
/*!40000 ALTER TABLE `Trains` DISABLE KEYS */;
/*!40000 ALTER TABLE `Trains` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-21 19:58:46
