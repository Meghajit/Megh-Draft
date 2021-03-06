-- MySQL dump 10.13  Distrib 5.6.26, for Win32 (x86)
--
-- Host: localhost    Database: Sinchan
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Current Database: `Sinchan`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Sinchan` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `Sinchan`;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseid` varchar(50) NOT NULL DEFAULT '',
  `cname` varchar(50) NOT NULL,
  `fid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`courseid`,`fid`),
  KEY `fid` (`fid`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`fid`) REFERENCES `faculty` (`facid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('10CS12','Engineering Physics',5),('10CS43','Data Structures',2),('10EC76','Digital Logic',3),('10IS54','DBMS',1),('10ME34','Material Design',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `deptid` int(10) NOT NULL,
  `deptname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Computer Science and Engineering'),(2,'Information Science and Engineering'),(3,'Electronics & Communication Engineering'),(4,'Mechanical Engineering'),(5,'First Year Engineering');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled`
--

DROP TABLE IF EXISTS `enrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolled` (
  `susn` varchar(50) NOT NULL DEFAULT '',
  `courseid` varchar(50) NOT NULL DEFAULT '',
  `revTaken` int(5) NOT NULL,
  PRIMARY KEY (`susn`,`courseid`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`susn`) REFERENCES `student` (`usn`),
  CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled`
--

LOCK TABLES `enrolled` WRITE;
/*!40000 ALTER TABLE `enrolled` DISABLE KEYS */;
INSERT INTO `enrolled` VALUES ('1PE13CS056','10CS12',1),('1PE13CS087','10CS43',1),('1PE13CS092','10CS43',1),('1PE13EC056','10EC76',0),('1PE13IS056','10IS54',0),('1PE13ME087','10EC76',0),('1PE13ME087','10ME34',0);
/*!40000 ALTER TABLE `enrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `facid` int(10) NOT NULL,
  `facname` varchar(50) DEFAULT NULL,
  `did` int(10) DEFAULT NULL,
  PRIMARY KEY (`facid`),
  KEY `did` (`did`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`did`) REFERENCES `department` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Snehanshu Saha',1),(2,'Surabhi',2),(3,'Prashant',3),(4,'Mohan',4),(5,'Muhammed Faisal',5);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `qnum` int(50) NOT NULL DEFAULT '0',
  `qmsg` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`qnum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'The Teacher wrote on the blackboard legibly?'),(2,'Blue Books were corrected and returned within a reasonable time?'),(3,'Internal Assessment question papers were discussed and University Question Papers were practiced?'),(4,'Teacher focussed on the class without wasting time on unnecessary matters?'),(5,'Guest lectures were arranged regularly?'),(6,'Evaluation of Internal Assessment Papers was fair and impartial?'),(7,'The teacher was regular and punctual to the class?'),(8,'The teacher took mock tests and gave assignments regularly?'),(9,'The teacher spoke to the entire classclearly, loudly and audible?'),(10,'The teacher came prepared well for the class?'),(11,'The teacher gave course assistive materials and gave helpful course notes?');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `usn` varchar(50) NOT NULL DEFAULT '',
  `courseid` varchar(50) NOT NULL DEFAULT '',
  `qnum` int(10) NOT NULL DEFAULT '0',
  `answer` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`usn`,`courseid`,`qnum`),
  KEY `courseid` (`courseid`),
  KEY `qnum` (`qnum`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  CONSTRAINT `review_ibfk_3` FOREIGN KEY (`qnum`) REFERENCES `questions` (`qnum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('1PE13CS056','10CS12',1,4),('1PE13CS056','10CS12',2,4),('1PE13CS056','10CS12',3,4),('1PE13CS056','10CS12',4,4),('1PE13CS056','10CS12',5,4),('1PE13CS056','10CS12',6,4),('1PE13CS056','10CS12',7,4),('1PE13CS056','10CS12',8,4),('1PE13CS056','10CS12',9,4),('1PE13CS056','10CS12',10,4),('1PE13CS056','10CS12',11,4),('1PE13CS087','10CS43',1,4),('1PE13CS087','10CS43',2,4),('1PE13CS087','10CS43',3,4),('1PE13CS087','10CS43',4,4),('1PE13CS087','10CS43',5,4),('1PE13CS087','10CS43',6,4),('1PE13CS087','10CS43',7,4),('1PE13CS087','10CS43',8,4),('1PE13CS087','10CS43',9,4),('1PE13CS087','10CS43',10,4),('1PE13CS087','10CS43',11,4),('1PE13CS092','10CS43',1,4),('1PE13CS092','10CS43',2,4),('1PE13CS092','10CS43',3,4),('1PE13CS092','10CS43',4,4),('1PE13CS092','10CS43',5,4),('1PE13CS092','10CS43',6,4),('1PE13CS092','10CS43',7,4),('1PE13CS092','10CS43',8,4),('1PE13CS092','10CS43',9,4),('1PE13CS092','10CS43',10,4),('1PE13CS092','10CS43',11,4),('1PE13EC056','10EC76',1,4),('1PE13EC056','10EC76',2,4),('1PE13EC056','10EC76',3,4),('1PE13EC056','10EC76',4,4),('1PE13EC056','10EC76',5,4),('1PE13EC056','10EC76',6,4),('1PE13EC056','10EC76',7,4),('1PE13EC056','10EC76',8,4),('1PE13EC056','10EC76',9,4),('1PE13EC056','10EC76',10,4),('1PE13EC056','10EC76',11,4),('1PE13IS056','10IS54',1,1),('1PE13IS056','10IS54',2,1),('1PE13IS056','10IS54',3,1),('1PE13IS056','10IS54',4,1),('1PE13IS056','10IS54',5,1),('1PE13IS056','10IS54',6,1),('1PE13IS056','10IS54',7,1),('1PE13IS056','10IS54',8,1),('1PE13IS056','10IS54',9,1),('1PE13IS056','10IS54',10,1),('1PE13IS056','10IS54',11,1),('1PE13ME087','10EC76',1,4),('1PE13ME087','10EC76',2,4),('1PE13ME087','10EC76',3,4),('1PE13ME087','10EC76',4,4),('1PE13ME087','10EC76',5,4),('1PE13ME087','10EC76',6,4),('1PE13ME087','10EC76',7,4),('1PE13ME087','10EC76',8,4),('1PE13ME087','10EC76',9,4),('1PE13ME087','10EC76',10,4),('1PE13ME087','10EC76',11,4),('1PE13ME087','10ME34',1,1),('1PE13ME087','10ME34',2,0),('1PE13ME087','10ME34',3,2),('1PE13ME087','10ME34',4,0),('1PE13ME087','10ME34',5,3),('1PE13ME087','10ME34',6,0),('1PE13ME087','10ME34',7,4),('1PE13ME087','10ME34',8,0),('1PE13ME087','10ME34',9,5),('1PE13ME087','10ME34',10,0),('1PE13ME087','10ME34',11,6);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `usn` varchar(50) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `depid` int(10) DEFAULT NULL,
  `sem` int(10) DEFAULT NULL,
  PRIMARY KEY (`usn`),
  KEY `depid` (`depid`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`depid`) REFERENCES `department` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('1PE13CS056','Deepti Mazumdar',5,3),('1PE13CS087','Meghajit Mazumdar',1,7),('1PE13CS092','Viquar',1,7),('1PE13EC056','Abhishekh Das',3,7),('1PE13IS056','Sujith Sudarshan',2,7),('1PE13ME087','Aditya Agarwal',4,7);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-15  3:56:08
