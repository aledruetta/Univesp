-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: empresa
-- ------------------------------------------------------
-- Server version	10.3.22-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `numero` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `gident` bigint(20) unsigned DEFAULT NULL,
  `dtinicio` date NOT NULL DEFAULT '2020-01-01',
  PRIMARY KEY (`numero`),
  UNIQUE KEY `nome` (`nome`),
  KEY `fk_gident_funcionario` (`gident`),
  CONSTRAINT `fk_gident_funcionario` FOREIGN KEY (`gident`) REFERENCES `funcionario` (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Logística',16,'2020-01-01'),(2,'Marketing',98,'2020-01-01'),(3,'Ventas',83,'2020-01-01'),(4,'RH',64,'2020-01-01'),(5,'Engenharia',26,'2020-01-01'),(6,'Informática',88,'2020-01-01'),(7,'Financeiro',74,'2020-01-01'),(8,'Segurança',3,'2020-01-01'),(9,'Manutenção',19,'2020-01-01'),(10,'Produção',35,'2020-01-01');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `ident` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `sexo` char(1) NOT NULL,
  `salario` int(11) NOT NULL,
  `dtnasc` date NOT NULL,
  `dnumero` bigint(20) unsigned NOT NULL,
  `supident` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ident`),
  KEY `fk_dnumero_departamento` (`dnumero`),
  KEY `fk_supident_funcionario` (`supident`),
  CONSTRAINT `fk_dnumero_departamento` FOREIGN KEY (`dnumero`) REFERENCES `departamento` (`numero`),
  CONSTRAINT `fk_supident_funcionario` FOREIGN KEY (`supident`) REFERENCES `funcionario` (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Matthew','Hill','6184 Clark Radial Apt. 743 Reynoldsberg, AZ 22050','M',8088,'1929-09-22',6,NULL),(2,'Mallory','Craig','071 Mccarty Inlet South Juliebury, TN 25911','F',4454,'1906-02-14',8,NULL),(3,'Stefanie','Smith','250 Morris Knolls Solomonland, FL 32696','M',9134,'1933-05-19',7,NULL),(4,'Katelyn','Gonzalez','6148 Owens Row Apt. 759 Johnstad, AZ 45112','M',4030,'1931-03-12',6,NULL),(5,'Carolyn','Flores','10719 Ashley View Apt. 348 Martinton, ND 90197','M',7666,'2006-10-27',2,NULL),(6,'John','Garcia','168 Lopez Route Apt. 494 Joyceport, OH 46725','F',5189,'1915-02-05',2,NULL),(7,'Marc','Brandt','USS Taylor FPO AA 62791','M',6111,'1959-09-03',5,NULL),(8,'Nicole','Zhang','458 Larson Rapid Apt. 620 South Patriciahaven, TX 46143','F',1984,'1933-11-01',10,NULL),(9,'Karen','Shepard','5396 Joshua Circles East Cristinachester, OR 25620','M',2693,'1914-09-08',4,NULL),(10,'James','Park','5786 Christina Pines Apt. 539 Lake Jacob, ND 76219','M',7602,'1964-10-04',4,NULL),(11,'Andrea','Rodriguez','38061 Guerra Overpass Amandamouth, IA 48426','F',8704,'1981-06-21',2,NULL),(12,'Kelly','Smith','763 Gonzalez Expressway Apt. 958 West Ericborough, WY 83122','F',7723,'1952-01-22',9,NULL),(13,'Dana','Watson','75444 Jacob Spurs Dunlapfort, ID 25586','F',7570,'1951-10-24',6,NULL),(14,'Sean','Moore','6799 Alexa Mission Coxmouth, AR 41851','M',3613,'1975-03-17',8,NULL),(15,'Cindy','Stark','921 Samantha Gateway Apt. 852 Melaniefurt, NM 14649','F',4902,'1949-09-23',6,NULL),(16,'Jennifer','Hernandez','05347 Derrick Lodge Suite 041 Jessicaland, CO 86294','F',9957,'1996-07-23',6,NULL),(17,'Tamara','Martinez','1508 Debra Turnpike Apt. 762 Jordanfort, VT 20801','F',3755,'1940-12-21',3,NULL),(18,'Bradley','Johnson','211 Ryan Via Santanashire, UT 03836','F',6965,'1924-06-22',7,NULL),(19,'David','Odom','2482 Antonio Curve Apt. 115 East Patrickside, WA 60510','M',8981,'1958-07-17',4,NULL),(20,'Ryan','Bennett','68808 Nelson Point Suite 266 Matthewhaven, MT 38093','F',4663,'1936-06-13',5,NULL),(21,'Rachel','Myers','USNS Joseph FPO AP 30386','F',6869,'1921-09-11',1,NULL),(22,'John','Gibson','677 Robinson Crest East Devin, WV 05036','M',2725,'1914-02-18',2,NULL),(23,'Evan','Baird','63387 Mueller Stream Apt. 766 Hernandezstad, NV 84625','M',4412,'1913-07-23',6,NULL),(24,'Cody','Lin','8830 Haynes Skyway Brownberg, OR 91069','M',6483,'1918-11-09',2,NULL),(25,'Martha','White','457 Kennedy Extensions East Stephanie, WY 43449','M',5546,'1984-10-25',5,NULL),(26,'Larry','Fuller','474 Elizabeth Ridges Apt. 767 Gibbsborough, MD 91639','F',9536,'2005-09-02',4,NULL),(27,'Kenneth','Watkins','840 Campos Valley Suite 872 Bradyfurt, AK 88696','M',6272,'1998-02-19',6,NULL),(28,'Nicholas','Guzman','5582 Kevin Loop Heathershire, NV 95261','F',1898,'1937-07-15',5,NULL),(29,'Matthew','Reese','PSC 8592, Box 4632 APO AA 04011','M',7785,'1982-07-19',10,NULL),(30,'Lisa','Allison','2547 Bradley Groves Suite 417 West William, AK 09500','F',8495,'1966-12-07',10,NULL),(31,'Paul','Peters','02139 Gina Ville Suite 310 West Willie, LA 36484','M',2669,'1962-10-29',4,NULL),(32,'Sandra','Thomas','0460 Potts Turnpike Suite 942 East Ross, VT 34753','F',7664,'2016-02-25',5,NULL),(33,'Melanie','Bennett','397 Peter Crescent Suite 339 Jennifermouth, ME 59064','F',4985,'1909-12-09',7,NULL),(34,'Wendy','Leon','197 John Throughway Port Russellfurt, WV 08368','F',7893,'1996-05-10',10,NULL),(35,'Leslie','Bradley','2031 Karen Light Suite 760 New Joshua, WI 18275','F',8837,'1935-10-24',7,NULL),(36,'Chelsea','Montgomery','381 Jennifer Creek Suite 924 New Andreaside, WV 52341','F',8785,'1995-11-05',10,NULL),(37,'Meghan','Warner','71705 Nicole Center Suite 546 Teresaborough, OH 89191','F',3751,'2009-04-23',2,NULL),(38,'William','Campbell','Unit 9623 Box 9919 DPO AP 59639','M',3716,'2003-06-30',8,NULL),(39,'Kari','Heath','981 Michael Mountains Laceyport, NY 39672','M',4646,'1917-10-18',1,NULL),(40,'Jerry','Graham','56881 Barron Grove Apt. 275 Taylorbury, MD 72830','M',4787,'1940-10-08',1,NULL),(41,'Michael','Harris','277 Haley Ranch Melanieport, NM 80499','F',3505,'1964-06-22',1,NULL),(42,'Paula','Garrett','36564 Martin Lights North Marcusland, CO 33975','F',3480,'1920-04-03',6,NULL),(43,'Jennifer','Charles','8866 Michael Canyon Michellechester, SD 23720','M',3952,'1928-03-06',9,NULL),(44,'Leah','Collins','39941 Zachary Courts Petersonport, OH 69821','F',2646,'1998-02-03',10,NULL),(45,'Matthew','Clarke','218 Maxwell Drive West Brandon, NM 98441','F',1733,'1917-02-26',6,NULL),(46,'John','Garcia','7656 Brittany Rapid Suite 669 East Williammouth, GA 72783','M',7727,'1930-03-28',10,NULL),(47,'Tiffany','Luna','864 Jonathan Radial Apt. 701 Ashleyville, MT 26347','M',8237,'1920-10-17',1,NULL),(48,'Lisa','Jordan','161 Carrie Canyon Paulview, UT 78753','M',3158,'2006-01-06',8,NULL),(49,'Angela','Dalton','698 Murray View Apt. 487 Chandlerfort, SD 30934','F',2487,'2007-05-10',7,NULL),(50,'Timothy','Zimmerman','438 Michael Station Carolynburgh, OR 88629','M',3435,'1944-09-28',4,NULL),(51,'Gabriel','Murillo','6480 Joseph Plaza Apt. 623 West Gary, OK 82885','M',5438,'1996-02-27',4,NULL),(52,'Eric','Edwards','Unit 2307 Box 6391 DPO AA 72954','M',6528,'1969-04-29',8,NULL),(53,'Amy','Galvan','USNV Smith FPO AP 47227','M',5372,'1922-07-31',9,NULL),(54,'Jeffrey','Watson','Unit 9831 Box 9870 DPO AA 89412','M',5154,'1950-04-25',9,NULL),(55,'Amanda','Page','938 Glover Unions Apt. 839 Harmonborough, TX 10523','F',1674,'1997-12-05',4,NULL),(56,'Jeffrey','Morgan','29406 Garrison Fields Suite 698 Lake Michaelview, AL 51367','F',7015,'2002-05-29',9,NULL),(57,'Steven','Brown','112 Kelli Trail Apt. 144 Port Amanda, VT 75113','M',4641,'1932-05-13',7,NULL),(58,'Courtney','Combs','234 Lori Road Apt. 952 Lake Keithchester, SC 75764','F',1182,'1998-05-29',10,NULL),(59,'Jonathan','Chapman','899 Haley Pike Apt. 318 Brianland, GA 81695','F',4674,'1929-09-02',10,NULL),(60,'Donald','Roberts','50024 Kenneth Wall Lake Glenn, OH 54021','M',5693,'1994-07-31',9,NULL),(61,'Lorraine','Clark','54406 Solis Junction Suite 097 Port Maria, KY 13376','M',6562,'2009-10-24',5,NULL),(62,'Jasmine','Hamilton','Unit 7201 Box 7118 DPO AA 12140','F',8310,'1916-06-27',1,NULL),(63,'James','Prince','1211 Davis Street Lucastown, NV 78185','F',5928,'1988-04-30',8,NULL),(64,'John','Mitchell','17960 William Tunnel New Daniel, TN 98481','M',9627,'2000-06-18',6,NULL),(65,'Taylor','Butler','9827 Ashley Trafficway Longhaven, NJ 04454','F',4727,'2009-09-08',4,NULL),(66,'John','Aguilar','7285 Richard Radial Apt. 944 Taylorfurt, ME 81765','F',7123,'1961-02-20',1,NULL),(67,'Monica','Jordan','9609 Russell Roads Lake Davidmouth, AR 83306','F',1103,'1936-08-30',7,NULL),(68,'Nicholas','King','1969 Ronald Unions Suite 563 Hoganview, WI 29244','M',5041,'2003-11-28',5,NULL),(69,'Nancy','Flores','790 Douglas Junction Apt. 421 Lake Kennethton, ID 67446','M',3214,'1906-01-01',4,NULL),(70,'Christine','Turner','2592 Small Vista Brownstad, NC 77491','F',3323,'1965-07-13',2,NULL),(71,'Matthew','Dean','PSC 2457, Box 8759 APO AA 85226','F',7267,'1993-04-08',10,NULL),(72,'Jacqueline','Mitchell','2539 Andrew Light Suite 655 Martinezfort, CO 05594','F',3454,'1914-02-08',2,NULL),(73,'Michael','Jones','990 Antonio Parks Hollandbury, NE 55469','M',8246,'2002-07-14',1,NULL),(74,'Michael','Moore','40777 Gonzalez Summit Apt. 653 Jeffreymouth, VT 21513','F',9292,'1960-03-21',2,NULL),(75,'Frank','Roberts','98139 Porter Dam North Melissa, WV 59349','F',2912,'1934-11-01',10,NULL),(76,'Jessica','Stewart','18841 Miranda Points South Virginiaberg, WA 96055','M',2092,'1978-05-04',6,NULL),(77,'Mathew','Cole','539 Young Spring Suite 544 South Thomasshire, KY 74695','F',2378,'2005-10-16',2,NULL),(78,'Maurice','Chavez','767 Lee Flat Suite 374 West Pamela, AR 53823','F',4944,'2001-12-04',7,NULL),(79,'Julie','Logan','1217 Susan Fort West Devin, MD 15312','F',8128,'1923-08-23',8,NULL),(80,'Chelsea','Nelson','15701 Turner Grove Suite 560 Scottberg, KY 23140','F',1095,'1923-09-12',8,NULL),(81,'Lisa','Malone','30400 Sean Branch Kimberlyfurt, WA 31919','M',6541,'1964-09-01',9,NULL),(82,'Paul','Roberts','0033 Sampson Parkway Apt. 823 North Raymond, IA 32935','M',5304,'1973-03-27',3,NULL),(83,'Jillian','Taylor','604 Schneider Mission Suite 000 Stephenburgh, WI 77998','F',9658,'1912-04-12',7,NULL),(84,'Scott','Patel','8867 Hammond Court Apt. 812 West Melindaport, MS 04485','F',1788,'1963-11-09',6,NULL),(85,'Richard','Lyons','8479 Amanda Crest Campbellview, RI 55740','M',5615,'1986-12-15',9,NULL),(86,'Lauren','Gomez','0661 Tran Grove Joeshire, IA 27448','M',8783,'1952-11-03',5,NULL),(87,'Eric','Phillips','67659 Kevin Centers Melissamouth, AL 96350','F',1642,'1991-12-26',1,NULL),(88,'William','Tanner','8660 Whitney Plaza Apt. 414 Leebury, ME 14340','M',9299,'1962-05-14',8,NULL),(89,'Danielle','Davis','18384 Barnes Grove Jasminetown, IA 47171','F',2498,'1992-05-26',4,NULL),(90,'Jennifer','Bell','886 Stephanie Greens New Jeffreyborough, AZ 25967','M',6902,'1919-08-24',6,NULL),(91,'Brandy','Turner','271 Wade Route Masonview, CA 60616','M',4452,'1988-04-24',5,NULL),(92,'Michele','Williams','7953 Barbara Walks Lake Duaneborough, CA 09101','M',1425,'1989-08-10',2,NULL),(93,'Jeffrey','Ross','7684 Johnson Heights Suite 468 New Brandon, LA 96103','M',2305,'2007-10-13',10,NULL),(94,'Kayla','Bennett','6231 Stephanie Drives Apt. 137 Port Brian, OK 07702','M',3495,'1928-04-20',3,NULL),(95,'Rachel','Morris','680 Michelle Pines Jonestown, LA 34724','F',6865,'1946-01-27',6,NULL),(96,'Rodney','Howe','77563 Chelsea Estates North Cindychester, VT 06302','M',6292,'2001-08-23',8,NULL),(97,'Michael','Bryant','77670 Smith Manor New Donnaside, NY 18369','M',5591,'1978-06-07',2,NULL),(98,'Mark','Bass','264 Orozco Hills Suite 922 Michaelville, MD 76389','M',9799,'2002-04-23',4,NULL),(99,'Dale','Winters','87285 Robert Turnpike Suite 595 Port Kathleenbury, AZ 43357','F',4512,'1905-06-24',1,NULL),(100,'Brian','Thompson','9113 Morales Ports Amandaview, OR 49849','M',4788,'1954-04-03',7,NULL);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto` (
  `numero` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `dnumero` bigint(20) unsigned NOT NULL,
  `localizacao` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `fk_dnumero_projeto_departamento` (`dnumero`),
  CONSTRAINT `fk_dnumero_projeto_departamento` FOREIGN KEY (`dnumero`) REFERENCES `departamento` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,'Carro autônomo',8,NULL),(2,'Vacina covid-19',9,NULL),(3,'Automação residencial',1,NULL),(4,'Colônia em Marte',6,NULL),(5,'Supercomputador quântico',2,NULL),(6,'Drone subacuático',5,NULL),(7,'HAL 9000',4,NULL),(8,'Skynet',3,NULL);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalha_em`
--

DROP TABLE IF EXISTS `trabalha_em`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabalha_em` (
  `fident` bigint(20) unsigned NOT NULL,
  `pnumero` bigint(20) unsigned NOT NULL,
  `horas` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`fident`,`pnumero`),
  KEY `pk_pnumero_projeto` (`pnumero`),
  CONSTRAINT `pk_fident_funcionario` FOREIGN KEY (`fident`) REFERENCES `funcionario` (`ident`),
  CONSTRAINT `pk_pnumero_projeto` FOREIGN KEY (`pnumero`) REFERENCES `projeto` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalha_em`
--

LOCK TABLES `trabalha_em` WRITE;
/*!40000 ALTER TABLE `trabalha_em` DISABLE KEYS */;
INSERT INTO `trabalha_em` VALUES (1,4,14),(2,1,20),(4,4,14),(5,5,20),(6,5,40),(7,6,4),(9,7,8),(10,7,14),(11,5,40),(12,2,14),(13,4,40),(14,1,20),(15,4,8),(16,4,8),(17,8,8),(19,7,4),(20,6,14),(21,3,40),(22,5,14),(23,4,14),(24,5,40),(25,6,8),(26,7,8),(27,4,8),(28,6,40),(31,7,4),(32,6,20),(37,5,14),(38,1,4),(39,3,8),(40,3,20),(41,3,4),(42,4,4),(43,2,4),(45,4,40),(47,3,8),(48,1,4),(50,7,40),(51,7,14),(52,1,4),(53,2,8),(54,2,14),(55,7,40),(56,2,14),(60,2,4),(61,6,14),(62,3,14),(63,1,20),(64,4,8),(65,7,40),(66,3,20),(68,6,8),(69,7,8),(70,5,14),(72,5,14),(73,3,4),(74,5,4),(76,4,4),(77,5,4),(79,1,8),(80,1,40),(81,2,4),(82,8,8),(84,4,8),(85,2,8),(86,6,20),(87,3,40),(88,1,14),(89,7,8),(90,4,20),(91,6,40),(92,5,8),(94,8,14),(95,4,4),(96,1,14),(97,5,4),(98,7,4),(99,3,40);
/*!40000 ALTER TABLE `trabalha_em` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-23 13:47:08
