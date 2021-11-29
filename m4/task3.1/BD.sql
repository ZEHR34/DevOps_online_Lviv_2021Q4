-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: BD
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `audience`
--

DROP TABLE IF EXISTS `audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `namder_id` int NOT NULL,
  `building` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audience`
--

LOCK TABLES `audience` WRITE;
/*!40000 ALTER TABLE `audience` DISABLE KEYS */;
INSERT INTO `audience` VALUES (1,215,'1 Educational building'),(2,217,'1 Educational building'),(3,103,'main building');
/*!40000 ALTER TABLE `audience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `teacher_id` int NOT NULL,
  `time_begin` time NOT NULL,
  `time_end` time NOT NULL,
  `day` date NOT NULL,
  `audience_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lecture_fk0` (`subject_id`),
  KEY `lecture_fk1` (`teacher_id`),
  KEY `lecture_fk3` (`audience_id`),
  CONSTRAINT `lecture_fk0` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `lecture_fk1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `lecture_fk3` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,2,'practice',3,'12:10:00','13:45:00','2021-10-01',1),(2,2,'practice',3,'12:10:00','13:45:00','2021-10-08',1),(3,2,'practice',3,'12:10:00','13:45:00','2021-10-15',1),(4,2,'practice',3,'12:10:00','13:45:00','2021-10-22',1),(5,2,'practice',3,'12:10:00','13:45:00','2021-10-29',1),(6,2,'practice',3,'12:10:00','13:45:00','2021-11-01',1),(7,2,'practice',3,'12:10:00','13:45:00','2021-11-08',1),(8,2,'practice',3,'12:10:00','13:45:00','2021-11-15',1),(9,1,'lecture',1,'10:20:00','11:25:00','2021-10-02',3),(10,1,'lecture',1,'10:20:00','11:25:00','2021-10-09',3),(11,1,'lecture',1,'10:20:00','11:25:00','2021-10-16',3),(12,1,'lecture',1,'10:20:00','11:25:00','2021-10-23',3),(13,1,'lecture',1,'10:20:00','11:25:00','2021-10-30',3),(14,3,'practice',2,'10:20:00','11:25:00','2021-10-11',2),(15,3,'practice',2,'10:20:00','11:25:00','2021-10-18',2),(16,3,'practice',2,'10:20:00','11:25:00','2021-10-25',2),(17,3,'practice',2,'10:20:00','11:25:00','2021-10-01',2);
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture_subgroup`
--

DROP TABLE IF EXISTS `lecture_subgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture_subgroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_group_id` int NOT NULL,
  `lecture_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lecture_subgroup_fk0` (`sub_group_id`),
  KEY `lecture_subgroup_fk1` (`lecture_id`),
  CONSTRAINT `lecture_subgroup_fk0` FOREIGN KEY (`sub_group_id`) REFERENCES `sub_group` (`id`),
  CONSTRAINT `lecture_subgroup_fk1` FOREIGN KEY (`lecture_id`) REFERENCES `lecture` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture_subgroup`
--

LOCK TABLES `lecture_subgroup` WRITE;
/*!40000 ALTER TABLE `lecture_subgroup` DISABLE KEYS */;
INSERT INTO `lecture_subgroup` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,9),(5,1,10),(6,1,14),(7,1,15),(8,2,4),(9,2,5),(10,2,9),(11,2,10),(12,4,9),(13,4,10),(14,5,11),(15,5,12),(16,5,13),(17,4,6),(18,4,7),(19,4,8),(20,5,16),(21,5,17);
/*!40000 ALTER TABLE `lecture_subgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stats` (
  `building` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES ('1 Educational building'),('main building');
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_group_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_fk0` (`sub_group_id`),
  FULLTEXT KEY `name_serch` (`name`),
  CONSTRAINT `student_fk0` FOREIGN KEY (`sub_group_id`) REFERENCES `sub_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,1,'YEVHEN BARYCHKA'),(2,1,'Walker Lubomir'),(3,2,'Endyk Pavlo'),(4,4,'Sviatoslav oilman'),(5,5,'Petia Petiyovich'),(6,1,'testtriger(student)'),(21,1,'new name renamed from test_transaction'),(100,4,'name(student)'),(101,4,'name2(student)');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`entropia`@`localhost`*/ /*!50003 TRIGGER `student_text` BEFORE INSERT ON `student` FOR EACH ROW SET NEW.name = CONCAT (NEW.name, '(student)') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`entropia`@`localhost`*/ /*!50003 TRIGGER `student_rename` BEFORE UPDATE ON `student` FOR EACH ROW SET NEW.name = CONCAT (NEW.name, ' renamed from ', OLD.name) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sub_group`
--

DROP TABLE IF EXISTS `sub_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_group` (
  `name` varchar(255) NOT NULL,
  `group` int NOT NULL,
  `department` varchar(255) NOT NULL,
  `yer` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_group`
--

LOCK TABLES `sub_group` WRITE;
/*!40000 ALTER TABLE `sub_group` DISABLE KEYS */;
INSERT INTO `sub_group` VALUES ('КН214',1,'AIS',2021,1),('КН214',2,'AIS',2021,2),('КН114',1,'AIS',2020,3),('КН212',1,'AIS',2021,4),('КН208',1,'DCADS',2021,5);
/*!40000 ALTER TABLE `sub_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'higher mathematics'),(2,'English'),(3,'Databases');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_subgroup`
--

DROP TABLE IF EXISTS `subject_subgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_subgroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `subgroup_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_subgroup_fk0` (`subject_id`),
  KEY `subject_subgroup_fk1` (`subgroup_id`),
  CONSTRAINT `subject_subgroup_fk0` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `subject_subgroup_fk1` FOREIGN KEY (`subgroup_id`) REFERENCES `sub_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_subgroup`
--

LOCK TABLES `subject_subgroup` WRITE;
/*!40000 ALTER TABLE `subject_subgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_subgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'Peter Yaroslavovich'),(2,'Christina Yakimishin'),(3,'Oksana Mykhailivna');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-28 13:30:17
