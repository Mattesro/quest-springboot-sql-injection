CREATE DATABASE  IF NOT EXISTS `BankZecure` 
USE `BankZecure`;

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS customer (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  identifier VARCHAR(6),
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  email VARCHAR(80),
  password VARCHAR(64)
);

LOCK TABLES `customer` WRITE;


------------------------------------------------------------------

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `answerid` int(11) NOT NULL AUTO_INCREMENT,
  `question` int(11) NOT NULL,
  `expert` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `text` longtext,
  PRIMARY KEY (`answerid`),
  KEY `fk_answers_user1_idx` (`expert`),
  KEY `fk_answers_1_idx` (`question`),
  CONSTRAINT `fk_answer_question-id` FOREIGN KEY (`question`) REFERENCES `question` (`questionid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_user-id` FOREIGN KEY (`expert`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `answer` WRITE;

INSERT INTO `answer` VALUES (1,3,1,'2020-01-16 00:00:00','42'),(2,1,4,'2020-01-16 00:00:00','Ägypten');

UNLOCK TABLES;

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

LOCK TABLES `category` WRITE;

INSERT INTO `category` VALUES (1,'JavaScript'),(2,'HTML'),(3,'Java'),(4,'CSS'),(5,'MySQL'),(6,'Typescript'),(7,'Rocketscience');

UNLOCK TABLES;

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `questioner` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `text` longtext,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`questionid`),
  KEY `fk_questions_category1_idx` (`category`),
  KEY `fk_questions_user1_idx` (`questioner`),
  CONSTRAINT `fk_question_category-id` FOREIGN KEY (`category`) REFERENCES `category` (`categoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_user-id` FOREIGN KEY (`questioner`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'2020-01-16 00:00:00','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus.',1),(2,2,'2020-01-15 00:00:00','Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans. Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien.',2),(3,3,'2020-01-14 00:00:00','Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik.',7);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `avatar` blob,
  `expert` tinyint(1) DEFAULT NULL,
  `mailadress` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `fk_user_1_idx` (`category`),
  CONSTRAINT `fk_user_category-id` FOREIGN KEY (`category`) REFERENCES `category` (`categoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Stuchlik','Timo','timo','',1,'timo.stuchlik@telekom.de','vati',3),(2,'Friedrich','Thoralf','thoralf','',0,'thoralf.friedrich@telekom.de','mutti',1),(3,'Kirsch','Alexander','alex','',0,'alexander.kirsch@telekom.de','sohn',2),(4,'Mattes','Rolf','rolf','',0,'rolf.mattes@telekom.de','tochter',7);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-22 13:56:45
