-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: lesson
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `id_lesson` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_lesson` varchar(45) NOT NULL,
  `id_subject_lesson` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id_lesson`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (0000000001,'111',0000000111),(0000000002,'小张',0000000014),(0000000003,'小张',0000000014),(0000000004,'第三方',0000000014),(0000000005,'广泛的',0000000014),(0000000006,'小张',0000000014),(0000000007,'第三方',0000000014),(0000000008,'一元一次方程',0000000023),(0000000009,'背书',0000000024),(0000000010,'写字',0000000024),(0000000011,'小张',0000000026),(0000000012,'寒假',0000000014),(0000000013,'寒假',0000000016),(0000000014,'寒假',0000000022),(0000000015,'寒假',0000000015),(0000000016,'一元一次方程',0000000014),(0000000017,'背书',0000000027),(0000000018,'写字',0000000027),(0000000019,'寒假',0000000027),(0000000021,'读书',0000000028),(0000000022,'写字',0000000028),(0000000023,'唐诗',0000000028),(0000000024,'宋词',0000000028),(0000000025,'作文',0000000028),(0000000026,'2024-02-05',0000000029),(0000000027,'2024-02-05',0000000030),(0000000028,'2024-02-05',0000000032),(0000000029,'写字',0000000033),(0000000030,'背书',0000000033),(0000000031,'写字',0000000034),(0000000032,'嘎嘎嘎',0000000035),(0000000033,'写字',0000000036),(0000000034,'背书',0000000036),(0000000035,'读书',0000000037),(0000000036,'写字',0000000037),(0000000037,'唐诗',0000000037),(0000000038,'宋词',0000000037),(0000000039,'加法',0000000038),(0000000040,'减法',0000000038),(0000000041,'乘法',0000000038),(0000000042,'除法',0000000038),(0000000043,'单词',0000000039),(0000000044,'ABC',0000000039),(0000000045,'语法',0000000039),(0000000046,'造句',0000000039),(0000000047,'作文',0000000039);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `id_record` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_lesson_record` int(10) unsigned zerofill NOT NULL,
  `id_subject_record` int(10) unsigned zerofill DEFAULT NULL,
  `date_record` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_teacher_record` int(10) unsigned zerofill NOT NULL,
  `id_student_record` int(10) unsigned zerofill NOT NULL,
  `timestamp_record` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `times_record` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id_record`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (0000000005,0000000015,NULL,'2024-02-03 17:03:00',0000000001,0000000002,'2024-02-03 09:03:31',4),(0000000006,0000000004,NULL,'2024-02-11 10:53:00',0000000001,0000000002,'2024-02-04 02:52:22',0),(0000000007,0000000006,NULL,'2024-02-14 10:55:00',0000000001,0000000002,'2024-02-04 02:54:01',0),(0000000009,0000000002,NULL,'2024-02-04 11:15:00',0000000001,0000000002,'2024-02-04 03:15:19',0),(0000000011,0000000017,NULL,'2024-02-04 11:24:00',0000000001,0000000002,'2024-02-04 03:24:21',0),(0000000012,0000000018,NULL,'2024-02-03 00:00:00',0000000001,0000000002,'2024-02-04 03:24:30',0),(0000000017,0000000003,0000000014,'2024-02-05 10:21:00',0000000001,0000000002,'2024-02-05 02:21:35',0),(0000000019,0000000021,0000000028,'2024-02-05 10:24:00',0000000001,0000000002,'2024-02-05 02:24:34',0),(0000000020,0000000023,0000000028,'2024-02-05 10:25:00',0000000001,0000000002,'2024-02-05 02:25:20',0),(0000000028,0000000022,0000000028,'2024-02-05 00:00:00',0000000001,0000000001,'2024-02-05 03:28:56',4),(0000000029,0000000032,0000000035,'2020-02-02 00:00:00',0000000001,0000000007,'2024-02-05 04:03:19',1),(0000000030,0000000024,0000000028,'2024-02-05 00:00:00',0000000001,0000000001,'2024-02-05 06:26:12',5),(0000000031,0000000033,0000000036,'2024-02-05 14:48:00',0000000001,0000000025,'2024-02-05 06:48:47',1),(0000000032,0000000025,0000000028,'2024-02-05 00:00:00',0000000001,0000000001,'2024-02-05 07:16:22',6),(0000000033,0000000034,0000000036,'2024-02-05 15:25:00',0000000001,0000000025,'2024-02-05 07:26:00',2),(0000000034,0000000035,0000000037,'2024-02-05 16:00:00',0000000001,0000000026,'2024-02-05 07:57:42',1),(0000000035,0000000039,0000000038,'2024-02-06 15:59:00',0000000001,0000000026,'2024-02-05 07:59:13',2),(0000000036,0000000040,0000000038,'2024-02-05 16:01:00',0000000001,0000000026,'2024-02-05 08:01:35',3),(0000000037,0000000043,0000000039,'2024-02-05 16:03:00',0000000001,0000000026,'2024-02-05 08:03:30',4),(0000000038,0000000044,0000000039,'2024-02-06 16:06:00',0000000001,0000000026,'2024-02-05 08:06:55',5),(0000000039,0000000045,0000000039,'2024-02-11 19:07:00',0000000001,0000000026,'2024-02-05 08:07:17',6),(0000000040,0000000046,0000000039,'2024-02-23 16:10:00',0000000001,0000000026,'2024-02-05 08:07:23',7);
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id_student` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_student` varchar(45) NOT NULL,
  `birthday_student` date DEFAULT NULL,
  `sex_student` tinyint(1) DEFAULT NULL,
  `date_student` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (0000000001,'小东东','2000-01-01',0,'2024-01-31 09:39:21'),(0000000002,'小西西',NULL,1,'2024-01-31 09:39:21'),(0000000003,'小明明',NULL,2,'2024-01-31 09:39:21'),(0000000004,'小丽丽',NULL,0,'2024-01-31 09:39:21'),(0000000006,'小汪汪',NULL,2,'2024-01-31 09:42:43'),(0000000007,'小张','2000-01-28',1,'2024-02-02 12:47:16'),(0000000008,'第三方','2000-01-12',0,'2024-02-02 13:29:23'),(0000000009,'省电费','2000-01-31',1,'2024-02-02 13:31:54'),(0000000010,'三个地方','2000-01-01',1,'2024-02-02 13:46:14'),(0000000011,'小明','2000-01-11',1,'2024-02-02 14:17:34'),(0000000012,'小西','2000-01-20',1,'2024-02-02 14:20:46'),(0000000013,'小懒','2000-01-03',1,'2024-02-02 14:22:14'),(0000000014,'张小三','2000-01-21',1,'2024-02-04 03:20:56'),(0000000015,'刘小四','2000-01-01',1,'2024-02-05 01:43:54'),(0000000016,'十分','2010-01-01',1,'2024-02-05 06:04:02'),(0000000017,'方式','2010-01-01',NULL,'2024-02-05 06:14:56'),(0000000018,'十分','2010-01-01',NULL,'2024-02-05 06:15:01'),(0000000019,'小李','2010-01-01',NULL,'2024-02-05 06:16:37'),(0000000020,'小兰','2010-01-01',NULL,'2024-02-05 06:16:44'),(0000000021,'小兰','2010-01-01',NULL,'2024-02-05 06:16:53'),(0000000022,'小王','2010-01-01',0,'2024-02-05 06:19:20'),(0000000023,'小兰','2010-01-01',1,'2024-02-05 06:19:29'),(0000000024,'张小三','2014-01-01',0,'2024-02-05 06:31:58'),(0000000025,'一元一次方程','2010-01-01',1,'2024-02-05 06:32:10'),(0000000026,'张某某','2010-01-01',0,'2024-02-05 07:55:51');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id_subject` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_subject` varchar(45) DEFAULT NULL,
  `id_student_subject` int(10) unsigned zerofill NOT NULL,
  `cooked_subject` int(10) unsigned NOT NULL DEFAULT '0',
  `amount_subject` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_subject`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (0000000014,'电路',0000000001,1,0),(0000000015,'编程',0000000001,0,0),(0000000016,'的风格',0000000001,0,0),(0000000017,'给对方',0000000008,0,0),(0000000018,'的风格',0000000008,0,0),(0000000019,'第三方',0000000009,0,0),(0000000020,'省电费',0000000010,0,0),(0000000021,'语文',0000000011,0,0),(0000000022,'语文',0000000012,0,0),(0000000023,'数学',0000000012,0,0),(0000000024,'语文',0000000013,0,0),(0000000025,'数学',0000000013,0,0),(0000000026,'语文',0000000003,0,0),(0000000027,'语文',0000000010,0,0),(0000000028,'语文',0000000001,5,5),(0000000029,'2024-02-05',0000000002,0,1),(0000000030,'2024-02-05',0000000003,0,1),(0000000031,'2024-02-05',0000000003,0,0),(0000000032,'2024-02-05',0000000003,0,1),(0000000033,'语文',0000000015,0,2),(0000000034,'语文1',0000000015,0,1),(0000000035,'烦烦烦',0000000007,1,1),(0000000036,'语文',0000000025,2,2),(0000000037,'语文',0000000026,1,4),(0000000038,'数学',0000000026,2,4),(0000000039,'英语',0000000026,4,5);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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

-- Dump completed on 2024-02-05 16:17:35
