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
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `id_lesson` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_lesson` varchar(45) NOT NULL,
  `subject_id_lesson` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id_lesson`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (0000000001,'111',0000000111),(0000000002,'小张',0000000014),(0000000003,'小张',0000000014),(0000000004,'第三方',0000000014),(0000000005,'广泛的',0000000014),(0000000006,'小张',0000000014),(0000000007,'第三方',0000000014),(0000000008,'一元一次方程',0000000023),(0000000009,'背书',0000000024),(0000000010,'写字',0000000024),(0000000011,'小张',0000000026);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `id_record` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_lesson` int(10) unsigned zerofill NOT NULL,
  `date_record` datetime DEFAULT NULL,
  `id_teacher` int(10) unsigned zerofill NOT NULL,
  `id_student` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_record`)
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (0000000001,'小东东','2000-01-01',0,'2024-01-31 09:39:21.1'),(0000000002,'小西西',NULL,1,'2024-01-31 09:39:21.1'),(0000000003,'小明明',NULL,2,'2024-01-31 09:39:21.1'),(0000000004,'小丽丽',NULL,0,'2024-01-31 09:39:21.1'),(0000000006,'小汪汪',NULL,2,'2024-01-31 09:42:42.9'),(0000000007,'小张','2000-01-28',1,'2024-02-02 12:47:15.6'),(0000000008,'第三方','2000-01-12',0,'2024-02-02 13:29:22.7'),(0000000009,'省电费','2000-01-31',1,'2024-02-02 13:31:54.3'),(0000000010,'三个地方','2000-01-01',1,'2024-02-02 13:46:13.9'),(0000000011,'小明','2000-01-11',1,'2024-02-02 14:17:34.3'),(0000000012,'小西','2000-01-20',1,'2024-02-02 14:20:45.5'),(0000000013,'小懒','2000-01-03',1,'2024-02-02 14:22:13.7');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id_subject` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_subject` varchar(45) DEFAULT NULL,
  `id_student` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id_subject`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (0000000014,'电路',0000000001),(0000000015,'编程',0000000001),(0000000016,'的风格',0000000001),(0000000017,'给对方',0000000008),(0000000018,'的风格',0000000008),(0000000019,'第三方',0000000009),(0000000020,'省电费',0000000010),(0000000021,'语文',0000000011),(0000000022,'语文',0000000012),(0000000023,'数学',0000000012),(0000000024,'语文',0000000013),(0000000025,'数学',0000000013),(0000000026,'语文',0000000003);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
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

-- Dump completed on 2024-02-02 22:25:25
