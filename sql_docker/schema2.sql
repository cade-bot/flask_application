-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: fmadata
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Current Database: `fmadata`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fmadata` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `fmadata`;

--
-- Table structure for table `roster`
--

DROP TABLE IF EXISTS `roster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roster` (
  `name` varchar(50) NOT NULL,
  `age` varchar(30) NOT NULL,
  `height` varchar(30) NOT NULL,
  `weight` varchar(30) NOT NULL,
  `location` varchar(60) NOT NULL,
  `weightclass` varchar(50) NOT NULL,
  `style` varchar(50) NOT NULL,
  `fighterid` varchar(60) NOT NULL,
  PRIMARY KEY (`fighterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roster`
--

LOCK TABLES `roster` WRITE;
/*!40000 ALTER TABLE `roster` DISABLE KEYS */;
INSERT INTO `roster` VALUES ('Israel Adesanya','32','76','185','Nigeria','Middleweight','Freestyle','1'),('Max Holloway','30','71','144.5','Hawaii','Featherweight','Muay Thai','10'),('Charles Oliveira','32','70','155.5','Brazil','Lightweight','Jiu-Jistu','2'),('Kamaru Usman','35','72','170','Nigeria','Welterweight','Freestyle','3'),('Francis Ngannou','35','76','257','Cameroon','Heavyweight','Striker','4'),('Leon Edwards','30','72','170','Jamaica','Welterweight','MMA','5'),('Aljamain Sterling','33','67','134.5','USA','Bantamweight','Kickboxer','6'),('Dustin Poirier','33','69','154.5','USA','Lightweight','Jiu-Jitsu','7'),('Deiveson Figueiredo','34','65','125','Brazil','Flyweight','Boxing','8'),('Jiri Prochazka','29','75','205','Czechia','Light-heavyweight','Muay Thai','9');
/*!40000 ALTER TABLE `roster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stables`
--

DROP TABLE IF EXISTS `stables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stables` (
  `stableid` int NOT NULL AUTO_INCREMENT,
  `fighterid` varchar(60) NOT NULL,
  `name` varchar(30) NOT NULL,
  `owner` varchar(30) NOT NULL,
  PRIMARY KEY (`stableid`),
  KEY `fighterid` (`fighterid`),
  CONSTRAINT `stables_ibfk_1` FOREIGN KEY (`fighterid`) REFERENCES `roster` (`fighterid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stables`
--

LOCK TABLES `stables` WRITE;
/*!40000 ALTER TABLE `stables` DISABLE KEYS */;
INSERT INTO `stables` VALUES (1,'10','rebecca','Cade');
/*!40000 ALTER TABLE `stables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-25 21:22:26
