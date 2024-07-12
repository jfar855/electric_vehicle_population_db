CREATE DATABASE  IF NOT EXISTS `electric_vehicle_population` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `electric_vehicle_population`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: electric_vehicle_population
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Temporary view structure for view `avg_electric_range_by_district`
--

DROP TABLE IF EXISTS `avg_electric_range_by_district`;
/*!50001 DROP VIEW IF EXISTS `avg_electric_range_by_district`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `avg_electric_range_by_district` AS SELECT 
 1 AS `legislative_district`,
 1 AS `avg_electric_range`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `base_msrp_over_fifty_thousand`
--

DROP TABLE IF EXISTS `base_msrp_over_fifty_thousand`;
/*!50001 DROP VIEW IF EXISTS `base_msrp_over_fifty_thousand`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `base_msrp_over_fifty_thousand` AS SELECT 
 1 AS `government_id`,
 1 AS `base_msrp`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dol_vehicle_utility`
--

DROP TABLE IF EXISTS `dol_vehicle_utility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dol_vehicle_utility` (
  `dol_vehicle_id` int NOT NULL,
  `utility_id` int NOT NULL,
  PRIMARY KEY (`dol_vehicle_id`),
  UNIQUE KEY `dol_vehicle_UNIQUE` (`dol_vehicle_id`),
  UNIQUE KEY `utility_id_UNIQUE` (`utility_id`),
  KEY `fk_utility_vehicle_type_utility1_idx` (`utility_id`),
  CONSTRAINT `fk_utility_vehicle_type_utility1` FOREIGN KEY (`utility_id`) REFERENCES `utility` (`utility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dol_vehicle_utility`
--

LOCK TABLES `dol_vehicle_utility` WRITE;
/*!40000 ALTER TABLE `dol_vehicle_utility` DISABLE KEYS */;
INSERT INTO `dol_vehicle_utility` VALUES (184304438,1),(221379518,2),(251929023,3),(258283546,4),(115907816,5),(114673828,6),(210839359,7),(151659966,8),(211481616,9),(149067166,10),(323974983,11),(135424278,12),(186056454,13),(163322694,14),(126042164,15),(224412352,16),(256671992,17),(135512870,18),(218497114,19),(226827331,20),(152612967,21),(229410331,22),(257646315,23),(225485795,24),(223371781,25),(103152451,26),(193601481,27),(224663302,28),(135960464,29),(191261577,30);
/*!40000 ALTER TABLE `dol_vehicle_utility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electric_vehicle_information`
--

DROP TABLE IF EXISTS `electric_vehicle_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electric_vehicle_information` (
  `dol_vehicle_id` int NOT NULL,
  `government_id` int NOT NULL,
  `location_id` int NOT NULL,
  `vehicle_id` int NOT NULL,
  `type_id` int NOT NULL,
  `electric_range` int NOT NULL,
  `base_msrp` int NOT NULL,
  `electric_vehicle_type` varchar(50) NOT NULL,
  PRIMARY KEY (`dol_vehicle_id`),
  KEY `fk_electric_vehicle_information_government1_idx` (`government_id`),
  KEY `fk_electric_vehicle_information_location1_idx` (`location_id`),
  KEY `fk_electric_vehicle_information_vehicle1_idx` (`vehicle_id`),
  KEY `fk_electric_vehicle_information_electric_vehicle1_idx` (`type_id`),
  KEY `fk_electric_vehicle_information_dol_vehicle_utility1_idx` (`dol_vehicle_id`),
  CONSTRAINT `fk_electric_vehicle_information_dol_vehicle_utility1` FOREIGN KEY (`dol_vehicle_id`) REFERENCES `dol_vehicle_utility` (`dol_vehicle_id`),
  CONSTRAINT `fk_electric_vehicle_information_electric_vehicle1` FOREIGN KEY (`type_id`) REFERENCES `ev_type` (`type_id`),
  CONSTRAINT `fk_electric_vehicle_information_government1` FOREIGN KEY (`government_id`) REFERENCES `government` (`government_id`),
  CONSTRAINT `fk_electric_vehicle_information_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_electric_vehicle_information_vehicle1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_make` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electric_vehicle_information`
--

LOCK TABLES `electric_vehicle_information` WRITE;
/*!40000 ALTER TABLE `electric_vehicle_information` DISABLE KEYS */;
INSERT INTO `electric_vehicle_information` VALUES (103152451,26,26,26,26,6,0,'Plug-in Hybrid Electric Vehicle (PHEV)'),(114673828,6,6,6,6,35,0,'Plug-in Hybrid Electric Vehicle (PHEV)'),(115907816,5,5,5,5,35,0,'Plug-in Hybrid Electric Vehicle (PHEV)'),(126042164,15,15,15,15,62,0,'Battery Electric Vehicle (BEV)'),(135424278,12,12,12,12,265,59900,'Battery Electric Vehicle (BEV)'),(135512870,18,18,18,18,62,0,'Battery Electric Vehicle (BEV)'),(135960464,29,29,29,29,6,0,'Plug-in Hybrid Electric Vehicle (PHEV)'),(149067166,10,10,10,10,265,59900,'Battery Electric Vehicle (BEV)'),(151659966,8,8,8,8,56,0,'Battery Electric Vehicle (BEV)'),(152612967,21,21,21,21,73,0,'Battery Electric Vehicle (BEV)'),(163322694,14,14,14,14,62,0,'Battery Electric Vehicle (BEV)'),(184304438,1,1,1,1,76,0,'Battery Electric Vehicle (BEV)'),(186056454,13,13,13,13,265,59900,'Battery Electric Vehicle (BEV)'),(191261577,30,30,30,30,33,102000,'Plug-in Hybrid Electric Vehicle (PHEV)'),(193601481,27,27,27,27,6,0,'Plug-in Hybrid Electric Vehicle (PHEV)'),(210839359,7,7,7,7,35,0,'Plug-in Hybrid Electric Vehicle (PHEV)'),(211481616,9,9,9,9,265,59900,'Battery Electric Vehicle (BEV)'),(218497114,19,19,19,19,73,0,'Battery Electric Vehicle (BEV)'),(221379518,2,2,2,2,76,0,'Battery Electric Vehicle (BEV)'),(223371781,25,25,25,25,6,0,'Plug-in Hybrid Electric Vehicle (PHEV)'),(224412352,16,16,16,16,62,0,'Battery Electric Vehicle (BEV)'),(224663302,28,28,28,28,6,0,'Plug-in Hybrid Electric Vehicle (PHEV)'),(225485795,24,24,24,24,73,0,'Battery Electric Vehicle (BEV)'),(226827331,20,20,20,20,73,0,'Battery Electric Vehicle (BEV)'),(229410331,22,22,22,22,73,0,'Battery Electric Vehicle (BEV)'),(251929023,3,3,3,3,35,0,'Plug-in Hybrid Electric Vehicle (PHEV)'),(256671992,17,17,17,17,62,0,'Battery Electric Vehicle (BEV)'),(257646315,23,23,23,23,73,0,'Battery Electric Vehicle (BEV)'),(258283546,4,4,4,4,35,0,'Plug-in Hybrid Electric Vehicle (PHEV)'),(323974983,11,11,11,11,265,59900,'Battery Electric Vehicle (BEV)');
/*!40000 ALTER TABLE `electric_vehicle_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ev_type`
--

DROP TABLE IF EXISTS `ev_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_type` (
  `type_id` int NOT NULL,
  `electric_vehicle_type` varchar(50) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_type`
--

LOCK TABLES `ev_type` WRITE;
/*!40000 ALTER TABLE `ev_type` DISABLE KEYS */;
INSERT INTO `ev_type` VALUES (1,'Battery Electric Vehicle (BEV)'),(2,'Battery Electric Vehicle (BEV)'),(3,'Plug-in Hybrid Electric Vehicle (PHEV)'),(4,'Plug-in Hybrid Electric Vehicle (PHEV)'),(5,'Plug-in Hybrid Electric Vehicle (PHEV)'),(6,'Plug-in Hybrid Electric Vehicle (PHEV)'),(7,'Plug-in Hybrid Electric Vehicle (PHEV)'),(8,'Battery Electric Vehicle (BEV)'),(9,'Battery Electric Vehicle (BEV)'),(10,'Battery Electric Vehicle (BEV)'),(11,'Battery Electric Vehicle (BEV)'),(12,'Battery Electric Vehicle (BEV)'),(13,'Battery Electric Vehicle (BEV)'),(14,'Battery Electric Vehicle (BEV)'),(15,'Battery Electric Vehicle (BEV)'),(16,'Battery Electric Vehicle (BEV)'),(17,'Battery Electric Vehicle (BEV)'),(18,'Battery Electric Vehicle (BEV)'),(19,'Battery Electric Vehicle (BEV)'),(20,'Battery Electric Vehicle (BEV)'),(21,'Battery Electric Vehicle (BEV)'),(22,'Battery Electric Vehicle (BEV)'),(23,'Battery Electric Vehicle (BEV)'),(24,'Battery Electric Vehicle (BEV)'),(25,'Plug-in Hybrid Electric Vehicle (PHEV)'),(26,'Plug-in Hybrid Electric Vehicle (PHEV)'),(27,'Plug-in Hybrid Electric Vehicle (PHEV)'),(28,'Plug-in Hybrid Electric Vehicle (PHEV)'),(29,'Plug-in Hybrid Electric Vehicle (PHEV)'),(30,'Plug-in Hybrid Electric Vehicle (PHEV)');
/*!40000 ALTER TABLE `ev_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `government`
--

DROP TABLE IF EXISTS `government`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `government` (
  `government_id` int NOT NULL,
  `legislative_district` varchar(45) NOT NULL,
  PRIMARY KEY (`government_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `government`
--

LOCK TABLES `government` WRITE;
/*!40000 ALTER TABLE `government` DISABLE KEYS */;
INSERT INTO `government` VALUES (1,'46'),(2,'34'),(3,'37'),(4,'43'),(5,'37'),(6,'37'),(7,'36'),(8,'11'),(9,'37'),(10,'43'),(11,'46'),(12,'43'),(13,'36'),(14,'36'),(15,'37'),(16,'43'),(17,'37'),(18,'43'),(19,'37'),(20,'37'),(21,'34'),(22,'37'),(23,'46'),(24,'37'),(25,'34'),(26,'37'),(27,'34'),(28,'37'),(29,'37'),(30,'34');
/*!40000 ALTER TABLE `government` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `least_expensive_model`
--

DROP TABLE IF EXISTS `least_expensive_model`;
/*!50001 DROP VIEW IF EXISTS `least_expensive_model`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `least_expensive_model` AS SELECT 
 1 AS `make`,
 1 AS `model`,
 1 AS `min_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL,
  `postal_code` varchar(5) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(100) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'98115','Seattle','WA'),(2,'98116','Seattle','WA'),(3,'98118','Seattle','WA'),(4,'98101','Seattle','WA'),(5,'98178','Seattle','WA'),(6,'98122','Seattle','WA'),(7,'98119','Seattle','WA'),(8,'98108','Seattle','WA'),(9,'98122','Seattle','WA'),(10,'98122','Seattle','WA'),(11,'98125','Seattle','WA'),(12,'98102','Seattle','WA'),(13,'98109','Seattle','WA'),(14,'98117','Seattle','WA'),(15,'98144','Seattle','WA'),(16,'98122','Seattle','WA'),(17,'98178','Seattle','WA'),(18,'98103','Seattle','WA'),(19,'98118','Seattle','WA'),(20,'98118','Seattle','WA'),(21,'98126','Seattle','WA'),(22,'98178','Seattle','WA'),(23,'98125','Seattle','WA'),(24,'98118','Seattle','WA'),(25,'98116','Seattle','WA'),(26,'98122','Seattle','WA'),(27,'98126','Seattle','WA'),(28,'98118','Seattle','WA'),(29,'98178','Seattle','WA'),(30,'98136','Seattle','WA');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `popular_model`
--

DROP TABLE IF EXISTS `popular_model`;
/*!50001 DROP VIEW IF EXISTS `popular_model`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `popular_model` AS SELECT 
 1 AS `make`,
 1 AS `model`,
 1 AS `count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `popular_model_by_district`
--

DROP TABLE IF EXISTS `popular_model_by_district`;
/*!50001 DROP VIEW IF EXISTS `popular_model_by_district`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `popular_model_by_district` AS SELECT 
 1 AS `legislative_district`,
 1 AS `make`,
 1 AS `model`,
 1 AS `count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `utility`
--

DROP TABLE IF EXISTS `utility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utility` (
  `utility_id` int NOT NULL,
  `electric_utility` varchar(100) NOT NULL,
  PRIMARY KEY (`utility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utility`
--

LOCK TABLES `utility` WRITE;
/*!40000 ALTER TABLE `utility` DISABLE KEYS */;
INSERT INTO `utility` VALUES (1,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(2,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(3,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(4,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(5,'PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA)'),(6,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(7,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(8,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(9,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(10,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(11,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(12,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(13,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(14,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(15,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(16,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(17,'PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA)'),(18,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(19,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(20,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(21,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(22,'PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA)'),(23,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(24,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(25,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(26,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(27,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(28,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(29,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'),(30,'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)');
/*!40000 ALTER TABLE `utility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_make`
--

DROP TABLE IF EXISTS `vehicle_make`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_make` (
  `vehicle_id` int NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  PRIMARY KEY (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_make`
--

LOCK TABLES `vehicle_make` WRITE;
/*!40000 ALTER TABLE `vehicle_make` DISABLE KEYS */;
INSERT INTO `vehicle_make` VALUES (1,'FORD','FOCUS'),(2,'FORD','FOCUS'),(3,'CHEVROLET','VOLT'),(4,'CHEVROLET','VOLT'),(5,'CHEVROLET','VOLT'),(6,'CHEVROLET','VOLT'),(7,'CHEVROLET','VOLT'),(8,'AZURE DYNAMICS','TRANSIT CONNECT ELECTRIC'),(9,'TESLA','MODEL S'),(10,'TESLA','MODEL S'),(11,'TESLA','MODEL S'),(12,'TESLA','MODEL S'),(13,'TESLA','MODEL S'),(14,'MITSUBISHI','I-MIEV'),(15,'MITSUBISHI','I-MIEV'),(16,'MITSUBISHI','I-MIEV'),(17,'MITSUBISHI','I-MIEV'),(18,'MITSUBISHI','I-MIEV'),(19,'NISSAN','LEAF'),(20,'NISSAN','LEAF'),(21,'NISSAN','LEAF'),(22,'NISSAN','LEAF'),(23,'NISSAN','LEAF'),(24,'NISSAN','LEAF'),(25,'TOYOTA','PRIUS PLUG-IN'),(26,'TOYOTA','PRIUS PLUG-IN'),(27,'TOYOTA','PRIUS PLUG-IN'),(28,'TOYOTA','PRIUS PLUG-IN'),(29,'TOYOTA','PRIUS PLUG-IN'),(30,'FISKER','KARMA');
/*!40000 ALTER TABLE `vehicle_make` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `avg_electric_range_by_district`
--

/*!50001 DROP VIEW IF EXISTS `avg_electric_range_by_district`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `avg_electric_range_by_district` AS select `government`.`legislative_district` AS `legislative_district`,avg(`electric_vehicle_information`.`electric_range`) AS `avg_electric_range` from (`electric_vehicle_information` join `government` on((`electric_vehicle_information`.`government_id` = `government`.`government_id`))) group by `government`.`legislative_district` order by `avg_electric_range` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `base_msrp_over_fifty_thousand`
--

/*!50001 DROP VIEW IF EXISTS `base_msrp_over_fifty_thousand`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `base_msrp_over_fifty_thousand` AS select `electric_vehicle_information`.`government_id` AS `government_id`,`electric_vehicle_information`.`base_msrp` AS `base_msrp` from (`electric_vehicle_information` join `government` on((`electric_vehicle_information`.`government_id` = `government`.`government_id`))) where (`electric_vehicle_information`.`base_msrp` > 50000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `least_expensive_model`
--

/*!50001 DROP VIEW IF EXISTS `least_expensive_model`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `least_expensive_model` AS select `vehicle_make`.`make` AS `make`,`vehicle_make`.`model` AS `model`,min(`electric_vehicle_information`.`base_msrp`) AS `min_price` from (`electric_vehicle_information` join `vehicle_make` on((`electric_vehicle_information`.`vehicle_id` = `vehicle_make`.`vehicle_id`))) group by `vehicle_make`.`make`,`vehicle_make`.`model` order by `min_price` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `popular_model`
--

/*!50001 DROP VIEW IF EXISTS `popular_model`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_model` AS select `vehicle_make`.`make` AS `make`,`vehicle_make`.`model` AS `model`,count(0) AS `count` from `vehicle_make` where (`vehicle_make`.`make` = (select `vehicle_make`.`make` from `vehicle_make` group by `vehicle_make`.`make` order by count(0) desc limit 1)) group by `vehicle_make`.`make`,`vehicle_make`.`model` order by `count` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `popular_model_by_district`
--

/*!50001 DROP VIEW IF EXISTS `popular_model_by_district`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_model_by_district` AS select `government`.`legislative_district` AS `legislative_district`,`vehicle_make`.`make` AS `make`,`vehicle_make`.`model` AS `model`,count(`vehicle_make`.`model`) AS `count` from ((`vehicle_make` join `electric_vehicle_information` on((`vehicle_make`.`vehicle_id` = `electric_vehicle_information`.`vehicle_id`))) join `government` on((`electric_vehicle_information`.`government_id` = `government`.`government_id`))) group by `government`.`legislative_district`,`vehicle_make`.`make`,`vehicle_make`.`model` order by `government`.`legislative_district`,`count` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-11 20:38:02
