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
  `id_lesson` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_lesson` varchar(45) NOT NULL,
  `id_subject_lesson` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id_lesson`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (00001,'111',0000000111),(00002,'小张',0000000014),(00003,'小张',0000000014),(00004,'第三方',0000000014),(00005,'广泛的',0000000014),(00006,'小张',0000000014),(00007,'第三方',0000000014),(00008,'一元一次方程',0000000023),(00009,'背书',0000000024),(00010,'写字',0000000024),(00011,'小张',0000000026),(00012,'寒假',0000000014),(00013,'寒假',0000000016),(00014,'寒假',0000000022),(00015,'寒假',0000000015),(00016,'一元一次方程',0000000014),(00017,'背书',0000000027),(00018,'写字',0000000027),(00019,'寒假',0000000027),(00021,'读书',0000000028),(00022,'写字',0000000028),(00023,'唐诗',0000000028),(00024,'宋词',0000000028),(00025,'作文',0000000028),(00026,'2024-02-05',0000000029),(00027,'2024-02-05',0000000030),(00028,'2024-02-05',0000000032),(00029,'写字',0000000033),(00030,'背书',0000000033),(00031,'写字',0000000034),(00032,'嘎嘎嘎',0000000035),(00033,'写字',0000000036),(00034,'背书',0000000036),(00035,'读书',0000000037),(00036,'写字',0000000037),(00037,'唐诗',0000000037),(00038,'宋词',0000000037),(00039,'加法',0000000038),(00040,'减法',0000000038),(00041,'乘法',0000000038),(00042,'除法',0000000038),(00043,'单词',0000000039),(00044,'ABC',0000000039),(00045,'语法',0000000039),(00046,'造句',0000000039),(00047,'作文',0000000039),(00048,'唐诗',0000000040),(00049,'宋词',0000000040),(00050,'元曲',0000000040),(00051,'清小说',0000000040);
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (0000000011,0000000017,NULL,'2024-02-04 11:24:00',0000000001,0000000002,'2024-02-04 03:24:21',0),(0000000012,0000000018,NULL,'2024-02-03 00:00:00',0000000001,0000000002,'2024-02-04 03:24:30',0),(0000000029,0000000032,0000000035,'2020-02-02 00:00:00',0000000001,0000000007,'2024-02-05 04:03:19',1),(0000000031,0000000033,0000000036,'2024-02-05 14:48:00',0000000001,0000000025,'2024-02-05 06:48:47',1),(0000000033,0000000034,0000000036,'2024-02-05 15:25:00',0000000001,0000000025,'2024-02-05 07:26:00',2),(0000000034,0000000035,0000000037,'2024-02-05 16:00:00',0000000001,0000000026,'2024-02-05 07:57:42',1),(0000000035,0000000039,0000000038,'2024-02-06 15:59:00',0000000001,0000000026,'2024-02-05 07:59:13',2),(0000000036,0000000040,0000000038,'2024-02-05 16:01:00',0000000001,0000000026,'2024-02-05 08:01:35',3),(0000000037,0000000043,0000000039,'2024-02-05 16:03:00',0000000001,0000000026,'2024-02-05 08:03:30',4),(0000000038,0000000044,0000000039,'2024-02-06 16:06:00',0000000001,0000000026,'2024-02-05 08:06:55',5),(0000000039,0000000045,0000000039,'2024-02-11 19:07:00',0000000001,0000000026,'2024-02-05 08:07:17',6),(0000000040,0000000046,0000000039,'2024-02-23 16:10:00',0000000001,0000000026,'2024-02-05 08:07:23',7),(0000000042,0000000048,0000000040,'2024-02-05 00:00:00',0000000001,0000000001,'2024-02-05 09:15:32',1),(0000000043,0000000049,0000000040,'2024-02-07 00:00:00',0000000001,0000000001,'2024-02-05 09:15:41',2),(0000000044,0000000002,0000000014,'2024-02-05 17:52:00',0000000001,0000000001,'2024-02-05 09:52:18',3),(0000000045,0000000003,0000000014,'2024-02-06 00:00:00',0000000001,0000000001,'2024-02-06 06:55:28',4);
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
  `id_student` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_student` varchar(45) NOT NULL,
  `birthday_student` date DEFAULT NULL,
  `sex_student` tinyint(1) DEFAULT NULL,
  `date_student` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (00001,'小东东','2000-01-01',0,'2024-01-31 09:39:21'),(00002,'小西西',NULL,1,'2024-01-31 09:39:21'),(00003,'小明明',NULL,2,'2024-01-31 09:39:21'),(00004,'小丽丽',NULL,0,'2024-01-31 09:39:21'),(00006,'小汪汪',NULL,2,'2024-01-31 09:42:43'),(00007,'小张','2000-01-28',1,'2024-02-02 12:47:16'),(00008,'第三方','2000-01-12',0,'2024-02-02 13:29:23'),(00009,'省电费','2000-01-31',1,'2024-02-02 13:31:54'),(00010,'三个地方','2000-01-01',1,'2024-02-02 13:46:14'),(00011,'小明','2000-01-11',1,'2024-02-02 14:17:34'),(00012,'小西','2000-01-20',1,'2024-02-02 14:20:46'),(00013,'小懒','2000-01-03',1,'2024-02-02 14:22:14'),(00014,'张小三','2000-01-21',1,'2024-02-04 03:20:56'),(00015,'刘小四','2000-01-01',1,'2024-02-05 01:43:54'),(00016,'十分','2010-01-01',1,'2024-02-05 06:04:02'),(00017,'方式','2010-01-01',NULL,'2024-02-05 06:14:56'),(00018,'十分','2010-01-01',NULL,'2024-02-05 06:15:01'),(00019,'小李','2010-01-01',NULL,'2024-02-05 06:16:37'),(00020,'小兰','2010-01-01',NULL,'2024-02-05 06:16:44'),(00021,'小兰','2010-01-01',NULL,'2024-02-05 06:16:53'),(00022,'小王','2010-01-01',0,'2024-02-05 06:19:20'),(00023,'小兰','2010-01-01',1,'2024-02-05 06:19:29'),(00024,'张小三','2014-01-01',0,'2024-02-05 06:31:58'),(00025,'一元一次方程','2010-01-01',1,'2024-02-05 06:32:10'),(00026,'张某某','2010-01-01',0,'2024-02-05 07:55:51'),(00027,'写字','2010-01-01',0,'2024-02-06 07:01:18');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id_subject` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_subject` varchar(45) DEFAULT NULL,
  `id_student_subject` int(10) unsigned zerofill NOT NULL,
  `cooked_subject` int(10) unsigned NOT NULL DEFAULT '0',
  `amount_subject` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_subject`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (00014,'电路',0000000001,2,0),(00015,'编程',0000000001,0,0),(00016,'的风格',0000000001,0,0),(00017,'给对方',0000000008,0,0),(00018,'的风格',0000000008,0,0),(00019,'第三方',0000000009,0,0),(00020,'省电费',0000000010,0,0),(00021,'语文',0000000011,0,0),(00022,'语文',0000000012,0,0),(00023,'数学',0000000012,0,0),(00024,'语文',0000000013,0,0),(00025,'数学',0000000013,0,0),(00026,'语文',0000000003,0,0),(00027,'语文',0000000010,0,0),(00028,'语文',0000000001,0,5),(00029,'2024-02-05',0000000002,0,1),(00030,'2024-02-05',0000000003,0,1),(00031,'2024-02-05',0000000003,0,0),(00032,'2024-02-05',0000000003,0,1),(00033,'语文',0000000015,0,2),(00034,'语文1',0000000015,0,1),(00035,'烦烦烦',0000000007,1,1),(00036,'语文',0000000025,2,2),(00037,'语文',0000000026,1,4),(00038,'数学',0000000026,2,4),(00039,'英语',0000000026,4,5),(00040,'语文',0000000001,2,4);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id_teacher` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name_teacher` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_teacher`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (00001,'小张'),(00002,'小明');
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

-- Dump completed on 2024-02-06 15:03:52
