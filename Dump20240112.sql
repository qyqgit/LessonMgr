-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: lesson
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id_class` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_class` varchar(45) NOT NULL,
  `level_id_class` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id_class`),
  KEY `fkey_idx` (`level_id_class`),
  CONSTRAINT `class_level_id` FOREIGN KEY (`level_id_class`) REFERENCES `classlevel` (`id_class_level`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classlevel`
--

DROP TABLE IF EXISTS `classlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classlevel` (
  `id_class_level` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_class_level` varchar(45) DEFAULT NULL,
  `id_student` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id_class_level`),
  KEY `classlevel_id_student_idx` (`id_student`),
  CONSTRAINT `classlevel_id_student` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classlevel`
--

LOCK TABLES `classlevel` WRITE;
/*!40000 ALTER TABLE `classlevel` DISABLE KEYS */;
INSERT INTO `classlevel` VALUES (0000000014,'电路',0000000001);
/*!40000 ALTER TABLE `classlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `id_record` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_class` int(10) unsigned zerofill NOT NULL,
  `date_record` datetime DEFAULT NULL,
  `id_teacher` int(10) unsigned zerofill NOT NULL,
  `id_student` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_record`),
  KEY `record_id_teacher_idx` (`id_teacher`),
  KEY `record_id_student_idx` (`id_student`),
  KEY `record_id_class_idx` (`id_class`),
  CONSTRAINT `record_id_class` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `record_id_student` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `record_id_teacher` FOREIGN KEY (`id_teacher`) REFERENCES `teacher` (`id_teacher`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id_student` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_student` varchar(45) NOT NULL,
  `birthday_student` date DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `date` timestamp(1) NOT NULL DEFAULT CURRENT_TIMESTAMP(1) ON UPDATE CURRENT_TIMESTAMP(1),
  PRIMARY KEY (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (0000000001,'小东东','2000-01-01',0,'2024-01-31 09:39:21.1'),(0000000002,'小西西',NULL,1,'2024-01-31 09:39:21.1'),(0000000003,'小明明',NULL,2,'2024-01-31 09:39:21.1'),(0000000004,'小丽丽',NULL,0,'2024-01-31 09:39:21.1'),(0000000006,'小汪汪',NULL,2,'2024-01-31 09:42:42.9');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `id_teacher` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_teacher` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_teacher`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (0000000001,'小张'),(0000000002,'小明');
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

-- Dump completed on 2024-01-31 21:00:00
