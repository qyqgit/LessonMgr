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
  `id_lesson` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_lesson` varchar(45) NOT NULL,
  `id_subject_lesson` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id_lesson`),
  KEY `fkey_id_subject_lesson_idx` (`id_subject_lesson`),
  CONSTRAINT `fkey_id_subject_lesson` FOREIGN KEY (`id_subject_lesson`) REFERENCES `subject` (`id_subject`)
) ENGINE=InnoDB AUTO_INCREMENT=916 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lesson`.`lesson_AFTER_INSERT` AFTER INSERT ON `lesson` FOR EACH ROW
BEGIN
	UPDATE subject SET amount_subject = amount_subject + 1 WHERE NEW.id_subject_lesson = subject.id_subject;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lesson`.`lesson_AFTER_DELETE` AFTER DELETE ON `lesson` FOR EACH ROW
BEGIN
	UPDATE subject SET amount_subject = amount_subject - 1 WHERE OLD.id_subject_lesson = subject.id_subject;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `id_record` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_lesson_record` int(10) unsigned zerofill NOT NULL,
  `id_subject_record` int(10) unsigned zerofill NOT NULL,
  `date_record` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_teacher_record` int(10) unsigned zerofill NOT NULL,
  `id_student_record` int(10) unsigned zerofill NOT NULL,
  `timestamp_record` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `times_record` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id_record`),
  KEY `fkey_id_lesson_record_idx` (`id_lesson_record`),
  KEY `fkey_id_subject_record_idx` (`id_subject_record`),
  KEY `fkey_id_teacher_record_idx` (`id_teacher_record`),
  KEY `fkey_id_student_record_idx` (`id_student_record`),
  CONSTRAINT `fkey_id_lesson_record` FOREIGN KEY (`id_lesson_record`) REFERENCES `lesson` (`id_lesson`),
  CONSTRAINT `fkey_id_student_record` FOREIGN KEY (`id_student_record`) REFERENCES `student` (`id_student`),
  CONSTRAINT `fkey_id_subject_record` FOREIGN KEY (`id_subject_record`) REFERENCES `subject` (`id_subject`),
  CONSTRAINT `fkey_id_teacher_record` FOREIGN KEY (`id_teacher_record`) REFERENCES `teacher` (`id_teacher`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lesson`.`record_BEFORE_INSERT` BEFORE INSERT ON `record` FOR EACH ROW
BEGIN
	SET NEW.times_record = (SELECT SUM(cooked_subject) FROM lesson.subject WHERE id_student_subject = NEW.id_student_record) + 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lesson`.`record_AFTER_INSERT` AFTER INSERT ON `record` FOR EACH ROW
BEGIN
	UPDATE subject SET cooked_subject = cooked_subject + 1 WHERE NEW.id_subject_record = subject.id_subject;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lesson`.`record_AFTER_DELETE` AFTER DELETE ON `record` FOR EACH ROW
BEGIN
	UPDATE subject SET cooked_subject = cooked_subject - 1 WHERE OLD.id_subject_record = subject.id_subject;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id_student` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_student` varchar(45) NOT NULL,
  `birthday_student` date DEFAULT NULL,
  `sex_student` tinyint(1) DEFAULT NULL,
  `date_student` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id_subject` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_subject` varchar(45) DEFAULT NULL,
  `id_student_subject` int(10) unsigned zerofill NOT NULL,
  `cooked_subject` int(10) unsigned NOT NULL DEFAULT '0',
  `amount_subject` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_subject`),
  KEY `fkey_id_student_subject_idx` (`id_student_subject`),
  CONSTRAINT `fkey_id_student_subject` FOREIGN KEY (`id_student_subject`) REFERENCES `student` (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `id_teacher` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_teacher` varchar(45) DEFAULT NULL,
  `password_teacher` varchar(45) DEFAULT NULL,
  `token_teacher` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_teacher`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'lesson'
--

--
-- Dumping routines for database 'lesson'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-14 16:21:32
