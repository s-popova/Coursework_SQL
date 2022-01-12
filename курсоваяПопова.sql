-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: university
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Temporary view structure for view `allstudent`
--

DROP TABLE IF EXISTS `allstudent`;
/*!50001 DROP VIEW IF EXISTS `allstudent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `allstudent` AS SELECT 
 1 AS `StudentID`,
 1 AS `Lastname`,
 1 AS `Firstname`,
 1 AS `Patronymic`,
 1 AS `Kurs`,
 1 AS `DataOfBirth`,
 1 AS `City`,
 1 AS `GroupStudent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `debtor`
--

DROP TABLE IF EXISTS `debtor`;
/*!50001 DROP VIEW IF EXISTS `debtor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `debtor` AS SELECT 
 1 AS `StudentID`,
 1 AS `Lastname`,
 1 AS `Firstname`,
 1 AS `GroupStudent`,
 1 AS `GroupName`,
 1 AS `SubjectName`,
 1 AS `Mark`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `diary`
--

DROP TABLE IF EXISTS `diary`;
/*!50001 DROP VIEW IF EXISTS `diary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `diary` AS SELECT 
 1 AS `StudentID`,
 1 AS `Lastname`,
 1 AS `Firstname`,
 1 AS `GroupStudent`,
 1 AS `GroupName`,
 1 AS `SubjectName`,
 1 AS `Mark`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `markofexam`
--

DROP TABLE IF EXISTS `markofexam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `markofexam` (
  `ExamID` int NOT NULL,
  `StudentID` int NOT NULL,
  `SubjectID` int NOT NULL,
  `mark` int DEFAULT NULL,
  `ExamData` date DEFAULT NULL,
  PRIMARY KEY (`ExamID`,`StudentID`,`SubjectID`),
  KEY `StudentID` (`StudentID`),
  KEY `SubjectID` (`SubjectID`),
  CONSTRAINT `markofexam_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  CONSTRAINT `markofexam_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subjectofstudy` (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markofexam`
--

LOCK TABLES `markofexam` WRITE;
/*!40000 ALTER TABLE `markofexam` DISABLE KEYS */;
INSERT INTO `markofexam` VALUES (1,1,1,5,'2021-06-12'),(1,2,1,4,'2021-07-12'),(1,3,1,2,'2021-06-12'),(1,5,1,5,'2021-06-12'),(1,7,1,3,'2021-06-12'),(1,8,1,2,'2021-06-12'),(1,9,1,5,'2021-06-12'),(1,10,1,4,'2021-06-12'),(2,1,4,5,'2021-12-12'),(2,2,4,2,'2021-06-15'),(2,5,4,5,'2021-12-12'),(2,9,4,5,'2021-06-12'),(3,1,5,5,'2021-06-22'),(3,4,5,5,'2021-06-18'),(3,5,5,4,'2021-06-25'),(3,10,5,2,'2021-06-22'),(4,10,2,5,'2021-07-01'),(5,4,3,5,'2021-06-07'),(5,6,3,4,'2021-06-07'),(6,1,6,NULL,'2022-01-13'),(6,9,6,NULL,'2021-07-12'),(7,1,2,NULL,'2022-01-29'),(7,3,2,5,'2022-01-21'),(8,10,6,NULL,'2022-01-15'),(9,1,2,5,'2021-06-01'),(10,1,3,NULL,'2022-01-23'),(11,1,7,NULL,'2022-01-27'),(12,7,4,NULL,'2022-01-20'),(13,5,8,NULL,'2022-01-09'),(15,4,2,5,'2022-02-01'),(123,5,7,4,'2001-01-21'),(124,3,6,5,'2001-01-24');
/*!40000 ALTER TABLE `markofexam` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mark` BEFORE INSERT ON `markofexam` FOR EACH ROW BEGIN
declare newmark condition for sqlstate '50000';
if new.mark<1 or new.mark>5 then
signal newmark set message_text='Oшибка!';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `newcomersstudent`
--

DROP TABLE IF EXISTS `newcomersstudent`;
/*!50001 DROP VIEW IF EXISTS `newcomersstudent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `newcomersstudent` AS SELECT 
 1 AS `StudentID`,
 1 AS `Lastname`,
 1 AS `Firstname`,
 1 AS `Patronymic`,
 1 AS `Kurs`,
 1 AS `DataOfBirth`,
 1 AS `City`,
 1 AS `GroupStudent`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `Lastname` varchar(20) DEFAULT NULL,
  `Firstname` varchar(20) DEFAULT NULL,
  `Patronymic` varchar(20) DEFAULT NULL,
  `Kurs` int DEFAULT NULL,
  `DataOfBirth` date DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `GroupStudent` int DEFAULT NULL,
  `stipend` int DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `GroupStudent` (`GroupStudent`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`GroupStudent`) REFERENCES `studentgroup` (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Янютина','Светлана','Себастьяновна',2,'2001-06-12','Санкт-Петербург',1,2100),(2,'Елисеев','Ефим','Иннокентиевич',2,'2000-12-23','Санкт-Петербург',1,2100),(3,'Куксов','Илья','Ростиславович',2,'1999-06-22','Тюмень',2,2100),(4,'Шикалова','София','Денисовна',2,'2000-03-19','Саратов',1,2100),(5,'Янютина','София','Алексеевна',2,'2004-07-13','Волгоград',2,2100),(6,'Закревская','Римма','Алексеевна',2,'2000-09-22','Санкт-Петербург',1,2100),(7,'Минаева','Римма','Алексеевна',2,'2001-09-22','Санкт-Петербург',3,2100),(8,'Шишков','Антон','Феодосивич',2,'1999-12-02',' Волгоград',3,2100),(9,'Пончикова','Елизавета','Алексеевна',2,'1998-11-29','Санкт-Петербург',1,2100),(10,'Елисеев','Антон','Ростиславович',2,'2000-03-24','Омск',2,2100),(11,'Попков','Даниил','Сергеевич',2,'2003-01-23','Санкт-Петербург',1,2100);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_BEFORE_INSERT` BEFORE INSERT ON `student` FOR EACH ROW BEGIN
if new.stipend is null  then
set new.stipend = 2100;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `studentgroup`
--

DROP TABLE IF EXISTS `studentgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentgroup` (
  `GroupID` int NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentgroup`
--

LOCK TABLES `studentgroup` WRITE;
/*!40000 ALTER TABLE `studentgroup` DISABLE KEYS */;
INSERT INTO `studentgroup` VALUES (1,'ПМ-1901'),(2,'ПМ-1902'),(3,'ПИ-1901');
/*!40000 ALTER TABLE `studentgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectofstudy`
--

DROP TABLE IF EXISTS `subjectofstudy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjectofstudy` (
  `SubjectID` int NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(20) DEFAULT NULL,
  `SubjHour` int DEFAULT NULL,
  `Semester` int DEFAULT NULL,
  PRIMARY KEY (`SubjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectofstudy`
--

LOCK TABLES `subjectofstudy` WRITE;
/*!40000 ALTER TABLE `subjectofstudy` DISABLE KEYS */;
INSERT INTO `subjectofstudy` VALUES (1,'Право',20,1),(2,'Алгебра',45,2),(3,'Мат.Анализ',42,3),(4,'СКМ',40,4),(5,'ТВиМС',48,5),(6,'Дифф.Уравнения',50,3),(7,'Философия',35,3),(8,'СУБД',45,5);
/*!40000 ALTER TABLE `subjectofstudy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `TeacherID` int NOT NULL AUTO_INCREMENT,
  `Lastname` varchar(20) DEFAULT NULL,
  `Firstname` varchar(20) DEFAULT NULL,
  `Patronymic` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `Teachhour` int DEFAULT NULL,
  PRIMARY KEY (`TeacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'Иванова','Людмила','Николаевна','nyxxbi@vipmail.ru',120),(2,'Попова','Софья','Ивановна','akas@aol.com',60),(3,'Сидоров','Максим','Алексеевич','ivan@husein.com',70),(4,'Кузнецов','Алексей','Александрович','fedvs@mail.ru',45),(5,'Малышева','Елена','Александровна','elena2000@mail.ru',100),(6,'Михайлов','Виктор','Андреевич','victor@mail.ru',60);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaching`
--

DROP TABLE IF EXISTS `teaching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaching` (
  `TeacherID` int NOT NULL,
  `SubjectID` int NOT NULL,
  `GroupStudent` int DEFAULT NULL,
  PRIMARY KEY (`TeacherID`,`SubjectID`),
  KEY `SubjectID` (`SubjectID`),
  KEY `GroupStudent` (`GroupStudent`),
  CONSTRAINT `teaching_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher` (`TeacherID`),
  CONSTRAINT `teaching_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subjectofstudy` (`SubjectID`),
  CONSTRAINT `teaching_ibfk_3` FOREIGN KEY (`GroupStudent`) REFERENCES `studentgroup` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaching`
--

LOCK TABLES `teaching` WRITE;
/*!40000 ALTER TABLE `teaching` DISABLE KEYS */;
INSERT INTO `teaching` VALUES (1,8,1),(2,1,1),(3,4,1),(3,7,1),(4,2,1),(5,5,1),(5,7,1),(6,3,1),(6,6,1),(1,6,2),(2,7,2),(3,2,2),(3,5,2),(4,8,2),(5,3,2),(6,2,2),(4,4,3),(5,2,3);
/*!40000 ALTER TABLE `teaching` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'university'
--

--
-- Dumping routines for database 'university'
--
/*!50003 DROP PROCEDURE IF EXISTS `Delete_Student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Student`(id int)
BEGIN
Delete from student
where StudentID = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HowMuchDay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HowMuchDay`(dataexam date, data1 date)
BEGIN
 select timestampdiff(day, data1, dataexam) dayexam;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `my_mark` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `my_mark`(Lastname varchar(20), Firstname varchar(20))
BEGIN
select * from diary s
WHERE s.Lastname = Lastname and s.Firstname = Firstname ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SpGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SpGroup`(namegr varchar(20))
BEGIN
     SELECT  s.StudentID, s.Lastname, s.Firstname, s.GroupStudent, g.GroupName  FROM university.student s  Inner Join university.studentgroup g
	 WHERE  g.GroupName = namegr  AND s.GroupStudent = g.GroupID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `st1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `st1`(id int)
BEGIN
select * from diary s
WHERE s.studentid = id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STIPEND` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `STIPEND`()
BEGIN
SELECT  STUDENTID ,Lastname, Firstname, CASE 
WHEN AVG(MARK)< 4 
THEN "0₽"
WHEN AVG(MARK) = 5 
THEN "4200₽"
WHEN AVG(MARK)>= 4 AND AVG(MARK)< 5
THEN "2100₽"
END AS STIPEND
FROM university.diary
GROUP BY studentID
ORDER BY studentID ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StudentExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentExam`(id int, date1 date , date2 date)
BEGIN
Select  m.ExamData, sub.subjectname, teach.Lastname,teach.Firstname
  from  university.markofexam m Inner Join university.student s Inner Join university.teaching t  Inner Join university.subjectofstudy sub
  Inner Join university.teacher teach
 where s.StudentID = m.StudentID and m.SubjectID = sub.SubjectID and s.GroupStudent = t.GroupStudent and t.teacherid = teach.teacherid 
 and sub.SubjectID = t.SubjectID and
 m.StudentID = id and m.ExamData between  date1 and date2
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TeacherExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TeacherExam`(Lastname varchar (30), date1 date , date2 date)
BEGIN
Select  m.examID, t.teacherid,  m.SubjectID, m.ExamData, sub.subjectname, s.GroupStudent, teach.Lastname,teach.Firstname
  from  university.markofexam m Inner Join university.student s Inner Join university.teaching t  Inner Join university.subjectofstudy sub
  Inner Join university.teacher teach
 where s.StudentID = m.StudentID and m.SubjectID = sub.SubjectID and s.GroupStudent = t.GroupStudent and t.teacherid = teach.teacherid 
 and sub.SubjectID = t.SubjectID and
 teach.Lastname = Lastname and m.ExamData between  date1 and date2
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `teacher_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `teacher_email`(Lastname varchar(20), Firstname varchar(20))
BEGIN
select Lastname ,  Firstname, Patronymic, email from teacher t
Where t.Lastname = Lastname and t.Firstname = Firstname;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Timetable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Timetable`(Lastname varchar(20), Firstname varchar(20), datastart date, dataend date)
BEGIN
IF datastart <= dataend THEN 
SELECT m.StudentID, s.Lastname, s.Firstname, m.ExamData, sub.SubjectName FROM university.student s Inner Join university.markofexam m Inner Join university.subjectofstudy sub
WHERE m.StudentID = s.StudentID and m.SubjectID = sub.SubjectID and m.ExamData between datastart and dataend and s.Lastname = Lastname and s.Firstname = Firstname ;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uniquediary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uniquediary`()
BEGIN
declare i int default 1 ;
while i <11 do
	 call st1(i);
  set i = i+1;
  end while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Data_Base` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_Data_Base`( date1 date, date2 date)
BEGIN
Delete FROM university.markofexam
where ExamData between date1 and date2
LIMIT 1000;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `allstudent`
--

/*!50001 DROP VIEW IF EXISTS `allstudent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allstudent` AS select `student`.`StudentID` AS `StudentID`,`student`.`Lastname` AS `Lastname`,`student`.`Firstname` AS `Firstname`,`student`.`Patronymic` AS `Patronymic`,`student`.`Kurs` AS `Kurs`,`student`.`DataOfBirth` AS `DataOfBirth`,`student`.`City` AS `City`,`student`.`GroupStudent` AS `GroupStudent` from `student` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `debtor`
--

/*!50001 DROP VIEW IF EXISTS `debtor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `debtor` AS select `s`.`StudentID` AS `StudentID`,`s`.`Lastname` AS `Lastname`,`s`.`Firstname` AS `Firstname`,`s`.`GroupStudent` AS `GroupStudent`,`g`.`GroupName` AS `GroupName`,`sub`.`SubjectName` AS `SubjectName`,`m`.`mark` AS `Mark` from (((`student` `s` join `studentgroup` `g`) join `subjectofstudy` `sub`) join `markofexam` `m`) where ((`m`.`StudentID` = `s`.`StudentID`) and (`m`.`SubjectID` = `sub`.`SubjectID`) and (`s`.`GroupStudent` = `g`.`GroupID`) and (`m`.`mark` = 2)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `diary`
--

/*!50001 DROP VIEW IF EXISTS `diary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `diary` AS select `s`.`StudentID` AS `StudentID`,`s`.`Lastname` AS `Lastname`,`s`.`Firstname` AS `Firstname`,`s`.`GroupStudent` AS `GroupStudent`,`g`.`GroupName` AS `GroupName`,`sub`.`SubjectName` AS `SubjectName`,`m`.`mark` AS `Mark` from (((`student` `s` join `studentgroup` `g`) join `subjectofstudy` `sub`) join `markofexam` `m`) where ((`m`.`StudentID` = `s`.`StudentID`) and (`m`.`SubjectID` = `sub`.`SubjectID`) and (`s`.`GroupStudent` = `g`.`GroupID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `newcomersstudent`
--

/*!50001 DROP VIEW IF EXISTS `newcomersstudent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `newcomersstudent` AS select `student`.`StudentID` AS `StudentID`,`student`.`Lastname` AS `Lastname`,`student`.`Firstname` AS `Firstname`,`student`.`Patronymic` AS `Patronymic`,`student`.`Kurs` AS `Kurs`,`student`.`DataOfBirth` AS `DataOfBirth`,`student`.`City` AS `City`,`student`.`GroupStudent` AS `GroupStudent` from `student` where (`student`.`City` <> 'Санкт-Петербург') */;
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

-- Dump completed on 2021-12-29  2:10:44
