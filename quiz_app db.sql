-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: quiz_app
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `leaderboard`
--

DROP TABLE IF EXISTS `leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaderboard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `score` int NOT NULL,
  `time_taken` float NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaderboard`
--

LOCK TABLES `leaderboard` WRITE;
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
INSERT INTO `leaderboard` VALUES (1,'John Lenard Libertad',1,1.3101,'2024-11-25 13:23:00'),(2,'Marcus',2,14.0089,'2024-11-25 13:23:37'),(3,'Marcus',2,97.8772,'2024-11-25 13:26:03'),(4,'John',3,27.8726,'2024-11-25 13:32:10'),(5,'John',3,325.541,'2024-11-25 13:37:08'),(6,'Kevin',2,13.1839,'2024-11-25 13:37:35'),(7,'Kevin',2,24.7528,'2024-11-25 13:37:47'),(8,'Kevin',2,28.6946,'2024-11-25 13:37:50'),(9,'Kevin',2,34.9044,'2024-11-25 13:37:57'),(10,'Kevin',2,40.0394,'2024-11-25 13:38:02'),(11,'Kevin',2,41.9964,'2024-11-25 13:38:04'),(12,'NIGGA',2,19.1379,'2024-11-25 13:39:49'),(13,'NIGGER',2,7.90923,'2024-11-25 13:43:06'),(14,'NIGGERS',3,10.6988,'2024-11-25 13:45:35'),(15,'Joseph',2,5.08958,'2024-11-25 14:08:06'),(16,'John Lenard Libertad',2,5.27352,'2024-11-25 14:08:33'),(17,'John Lenard Libertad',2,387.545,'2024-11-25 14:14:55'),(18,'Carelle',2,9.54446,'2024-11-27 00:10:33'),(19,'Ronnie',2,10.7114,'2024-11-27 00:14:40'),(20,'Ronnie',1,9.5357,'2024-11-27 00:15:18'),(21,'Ronnie',2,6.54616,'2024-11-27 00:16:21'),(22,'Marcus Daniel',3,25.1437,'2024-11-27 14:23:23'),(23,'Marcus Daniel',3,280.12,'2024-11-27 14:27:38'),(24,'Marcus Daniel',3,435.411,'2024-11-27 14:30:13'),(25,'Raven',4,10.8284,'2024-11-27 14:34:46'),(26,'Raven',4,247.446,'2024-11-27 14:38:42'),(27,'Mark',4,14.7065,'2024-11-27 14:39:50'),(28,'Mark',4,220.265,'2024-11-27 14:43:15'),(29,'Krenn',4,34.3772,'2024-11-27 14:50:43'),(30,'Vincent',5,39.0599,'2024-11-27 15:01:58');
/*!40000 ALTER TABLE `leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_records`
--

DROP TABLE IF EXISTS `time_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `player_name` varchar(100) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `time_taken` float NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_records`
--

LOCK TABLES `time_records` WRITE;
/*!40000 ALTER TABLE `time_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_records` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27 23:23:27
