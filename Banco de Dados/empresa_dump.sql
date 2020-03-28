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
-- Table structure for table `DEPARTAMENTO`
--

DROP TABLE IF EXISTS `DEPARTAMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTAMENTO` (
  `numero` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `gident` bigint(20) unsigned DEFAULT NULL,
  `dtinicio` date NOT NULL DEFAULT '2020-01-01',
  PRIMARY KEY (`numero`),
  UNIQUE KEY `nome` (`nome`),
  KEY `gident` (`gident`),
  CONSTRAINT `DEPARTAMENTO_ibfk_1` FOREIGN KEY (`gident`) REFERENCES `FUNCIONARIO` (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTAMENTO`
--

LOCK TABLES `DEPARTAMENTO` WRITE;
/*!40000 ALTER TABLE `DEPARTAMENTO` DISABLE KEYS */;
INSERT INTO `DEPARTAMENTO` VALUES (1,'Logística',86,'2020-01-01'),(2,'Marketing',26,'2020-01-01'),(3,'Ventas',53,'2020-01-01'),(4,'RH',47,'2020-01-01'),(5,'Engenharia',55,'2020-01-01'),(6,'Informática',90,'2020-01-01'),(7,'Financeiro',91,'2020-01-01'),(8,'Segurança',24,'2020-01-01'),(9,'Manutenção',40,'2020-01-01'),(10,'Produção',43,'2020-01-01');
/*!40000 ALTER TABLE `DEPARTAMENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENTE`
--

DROP TABLE IF EXISTS `DEPENDENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPENDENTE` (
  `fident` bigint(20) unsigned NOT NULL,
  `nome` varchar(100) NOT NULL,
  `dt_nasc` date NOT NULL,
  `sexo` tinyint(1) NOT NULL,
  `relacionamento` enum('filho/a','conjuge','outro') NOT NULL,
  PRIMARY KEY (`fident`,`nome`),
  CONSTRAINT `DEPENDENTE_ibfk_1` FOREIGN KEY (`fident`) REFERENCES `FUNCIONARIO` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPENDENTE`
--

LOCK TABLES `DEPENDENTE` WRITE;
/*!40000 ALTER TABLE `DEPENDENTE` DISABLE KEYS */;
INSERT INTO `DEPENDENTE` VALUES (2,'Jason Davis','1923-12-25',0,'conjuge'),(2,'Mark Wells','1956-09-13',1,'filho/a'),(5,'Michelle Rodriguez','1959-05-02',1,'outro'),(6,'Pamela Jenkins','1935-05-06',1,'outro'),(8,'Darius Martinez','1961-10-27',1,'outro'),(8,'Debra Hancock','1926-02-26',0,'outro'),(9,'Laura Hawkins','1908-03-14',1,'conjuge'),(9,'Michael Lin','1921-03-18',0,'conjuge'),(11,'Michelle Brady','1976-02-22',0,'conjuge'),(11,'Patrick Hunt','1913-02-10',0,'conjuge'),(17,'Karen Porter','2010-05-10',1,'filho/a'),(17,'Leah Wilson','1934-08-11',0,'outro'),(19,'Henry Armstrong','1917-02-09',0,'conjuge'),(20,'Deborah Conrad','1938-09-15',1,'filho/a'),(20,'Mike White','1959-04-05',0,'filho/a'),(21,'Anthony Brown','1934-01-16',0,'conjuge'),(21,'Kathy Hodges','1987-08-06',0,'filho/a'),(23,'Gabriel Peterson','1907-07-19',0,'filho/a'),(23,'Tyler Singh','1957-06-01',1,'outro'),(24,'George Gay','2005-01-21',0,'conjuge'),(24,'Jenny Rodriguez','1909-06-20',0,'filho/a'),(26,'Katrina Kelly','1997-02-09',0,'conjuge'),(26,'Susan Bishop','1948-08-15',0,'conjuge'),(27,'Charles Davidson','1985-12-25',1,'outro'),(29,'Kristi Richards','1980-02-02',1,'conjuge'),(29,'Robert Fry','1963-08-10',0,'filho/a'),(30,'Luis Joyce','1929-05-30',1,'conjuge'),(31,'William Nguyen','1972-11-28',0,'conjuge'),(32,'Bob Kerr','1916-01-11',1,'conjuge'),(32,'Jesse Douglas','1912-06-14',1,'conjuge'),(33,'Samuel Blair','1918-10-11',0,'outro'),(35,'Brianna Frey','1999-09-26',0,'conjuge'),(35,'Justin Morgan','2016-02-13',1,'conjuge'),(36,'Crystal Reed','1989-11-13',1,'outro'),(36,'Jodi Sawyer','1915-08-03',0,'outro'),(38,'Robert Young','2003-05-08',1,'outro'),(38,'Yvonne Schneider','1989-05-22',1,'filho/a'),(40,'Craig Smith','1960-12-09',1,'conjuge'),(40,'Jorge Perry','1998-08-09',0,'conjuge'),(41,'Phillip Mendez','1963-05-08',1,'conjuge'),(41,'Tamara Browning','1952-01-26',0,'outro'),(42,'Jacob Frost','1952-04-24',0,'conjuge'),(43,'Juan Cole','1947-08-01',1,'conjuge'),(43,'Mariah Fitzgerald','1967-06-15',1,'conjuge'),(44,'Maria Davis','1935-02-13',1,'outro'),(45,'Chad Williams','1929-09-04',0,'outro'),(45,'Dana Henderson','1955-11-09',1,'filho/a'),(46,'Jason Velez','1912-11-17',1,'outro'),(46,'Kristina Wolf','1912-10-21',1,'outro'),(47,'Justin Little','1913-10-04',1,'conjuge'),(47,'William Norris','1942-02-06',0,'outro'),(48,'Vincent Phillips','1955-03-26',1,'conjuge'),(50,'Joseph Doyle','2008-10-05',1,'conjuge'),(50,'Maria Webb','1938-01-16',0,'conjuge'),(51,'Tyler Jones','1972-02-15',0,'conjuge'),(52,'Brian Horne','1979-01-05',0,'outro'),(52,'Emily Barnes','2011-01-03',1,'filho/a'),(53,'Cynthia Banks','1992-05-06',0,'outro'),(55,'Sarah May','1967-08-16',0,'filho/a'),(55,'Traci Montgomery','2000-02-21',0,'filho/a'),(56,'Robert Ruiz','1919-07-12',1,'outro'),(57,'Jackson Rivera','1949-03-09',0,'conjuge'),(57,'Tonya Sanchez','1923-04-28',0,'outro'),(60,'Kirk Garcia','1936-05-12',1,'filho/a'),(60,'Patricia Williams','1935-03-18',1,'filho/a'),(61,'Michael Ruiz','1935-08-27',0,'conjuge'),(66,'Mike Everett','1922-05-16',1,'filho/a'),(66,'Susan Lopez','1947-07-03',0,'conjuge'),(67,'Tyler Morrison','1960-10-04',0,'filho/a'),(68,'Sheri Taylor','1917-07-10',1,'conjuge'),(69,'Joshua Cruz','1987-12-22',0,'conjuge'),(70,'Nicole Davis','2018-12-17',1,'outro'),(70,'Seth Ross','1961-12-28',0,'filho/a'),(71,'Billy Stanton','1953-05-27',1,'conjuge'),(73,'Michael Gibson','1959-02-24',0,'outro'),(73,'Richard Soto','1908-11-05',0,'filho/a'),(74,'Preston Estrada','2013-12-11',1,'outro'),(77,'Bryan Taylor','1916-03-31',1,'outro'),(78,'David Rivera','1905-12-30',0,'conjuge'),(79,'Amy Hooper','1923-01-13',0,'conjuge'),(79,'Dana Palmer','1937-05-27',1,'outro'),(81,'Kelly Thomas','1930-10-23',0,'conjuge'),(84,'Donald Gonzales','1924-04-18',1,'filho/a'),(84,'Sharon Galvan','1998-08-09',0,'conjuge'),(85,'Christina Beltran','1937-03-26',1,'outro'),(88,'Nicholas Davis','1940-09-27',1,'filho/a'),(94,'Carol Fleming','1905-09-10',1,'conjuge'),(94,'Tamara Yu','1934-04-11',0,'conjuge'),(96,'Jean Franklin','1915-11-03',0,'outro'),(98,'Hayden Fleming','1972-11-30',0,'filho/a'),(98,'Steven Hale','1971-08-30',1,'filho/a'),(100,'Jeffery Hudson','1980-07-29',1,'conjuge');
/*!40000 ALTER TABLE `DEPENDENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUNCIONARIO`
--

DROP TABLE IF EXISTS `FUNCIONARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUNCIONARIO` (
  `ident` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `sexo` tinyint(1) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `dtnasc` date DEFAULT NULL,
  `dnumero` bigint(20) unsigned NOT NULL,
  `supident` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ident`),
  KEY `dnumero` (`dnumero`),
  KEY `supident` (`supident`),
  CONSTRAINT `FUNCIONARIO_ibfk_1` FOREIGN KEY (`dnumero`) REFERENCES `DEPARTAMENTO` (`numero`),
  CONSTRAINT `FUNCIONARIO_ibfk_2` FOREIGN KEY (`supident`) REFERENCES `FUNCIONARIO` (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUNCIONARIO`
--

LOCK TABLES `FUNCIONARIO` WRITE;
/*!40000 ALTER TABLE `FUNCIONARIO` DISABLE KEYS */;
INSERT INTO `FUNCIONARIO` VALUES (1,'Cindy','Vega','840 Bell Locks Apt. 603 North Yolanda, KS 49466',0,7730.12,'1934-07-30',10,84),(2,'Holly','Ryan','609 Donald Ridges Suite 529 New William, MS 45057',1,8097.49,'1915-06-15',4,47),(3,'Kelly','Camacho','51929 Carroll Trail West Aliciahaven, OR 24669',0,6973.47,'1943-09-28',5,55),(4,'Diane','Blake','996 Johnson Hills Lake Carriechester, GA 67777',1,7304.23,'1959-01-28',7,52),(5,'Evelyn','Sellers','8789 Campbell Ridges Lake Trevor, DE 97073',1,9435.22,'1973-05-06',9,40),(6,'Philip','Mendoza','38080 Alfred Drives New Cynthia, NC 65330',1,1429.48,'1941-05-08',6,25),(7,'Brian','Stokes','65940 King Valley West Jasmine, IL 82971',1,7122.62,'1981-07-16',8,73),(8,'Tiffany','Carroll','0918 Teresa Skyway Jamesfurt, AZ 61680',0,6139.52,'2016-07-15',8,93),(9,'Michael','Oconnell','01992 Boyd Forest Apt. 601 Vargasborough, IL 05543',1,2225.86,'1978-09-24',6,78),(10,'Daniel','Yoder','1479 Hernandez Path Apt. 050 New Laurenshire, ME 02887',1,2622.69,'2016-03-19',5,82),(11,'Jonathan','Fernandez','81465 Sanchez Spring Johnburgh, DE 78830',0,4212.68,'1961-02-25',5,82),(12,'Harry','Hunter','341 Michelle Summit South Jessicaview, OK 44712',1,5184.41,'1953-07-03',3,53),(13,'Dawn','Brown','USNS Phillips FPO AA 57387',1,1158.57,'1991-07-23',4,2),(14,'Robert','Harrison','USCGC Kerr FPO AP 04662',0,6020.51,'1930-02-21',1,86),(15,'Scott','Graham','3770 Molly Stravenue Melanieport, MA 79533',1,1735.74,'1942-05-08',4,38),(16,'Adam','Shelton','941 Patterson Lodge Murrayside, CT 23652',0,3139.73,'1920-08-31',4,38),(17,'Stephen','Meza','3563 Schmidt Loop Olsenview, KS 31653',0,8422.50,'2013-10-14',10,75),(18,'Michelle','Hughes','126 George Alley Lisafurt, WV 18569',0,4845.60,'1969-12-21',7,66),(19,'Stacy','Morris','723 Benjamin Fork Suite 068 Caitlinmouth, CA 60514',1,7101.05,'1939-09-21',8,93),(20,'Kenneth','Scott','Unit 5212 Box 4656 DPO AE 04971',0,1280.38,'1935-01-10',1,36),(21,'Clarence','Anderson','9867 Mason Gateway Apt. 344 Port Jessicafort, VA 29083',1,5226.38,'1935-12-31',2,29),(22,'Jennifer','Wilcox','155 Frank Stream Leslieland, MD 62093',0,5165.17,'1932-02-14',5,82),(23,'Cynthia','Hendrix','3624 Moore Mission Jenniferburgh, VA 59796',0,2627.24,'1966-01-23',6,78),(24,'Brittany','Palmer','2341 Mendoza Neck Colemanville, MA 11377',1,8404.81,'1916-03-15',8,NULL),(25,'Kevin','Callahan','6872 Brown Cove East Calvin, WV 31791',1,7443.86,'1945-09-28',6,90),(26,'Natasha','Ramirez','78291 Michael Cape Suite 873 North Carlafurt, MI 85599',1,9837.89,'1995-02-18',2,NULL),(27,'Linda','Miller','31705 Austin Lights Ronaldview, GA 84883',1,3394.89,'1984-10-16',9,5),(28,'Brian','Stewart','5440 Joshua Via East Jenna, OK 09094',1,2416.66,'1919-03-30',9,5),(29,'Amber','Crawford','USS Horn FPO AE 23756',1,7902.78,'1914-03-03',2,26),(30,'Christina','Chavez','6917 Sarah Pike Colemanstad, MI 72893',0,4090.17,'1930-12-01',9,76),(31,'Rhonda','Hernandez','6124 Derek Prairie Apt. 553 Jonesshire, AR 76163',0,2173.41,'2017-01-16',5,82),(32,'Ashley','Wolf','194 Christian View Apt. 063 Saraside, NM 77735',1,6655.25,'1953-04-07',4,38),(33,'Andrea','Gallegos','6547 Amber Wall Apt. 768 Pittmanchester, MT 18166',1,5216.37,'2006-01-02',9,76),(34,'Tony','Snyder','12227 Lopez Trail Port Omarport, NY 27740',0,1326.95,'1939-08-02',3,12),(35,'Todd','Brown','961 Isaac Drives South Timothy, LA 44036',0,2134.19,'2015-06-19',6,25),(36,'Michael','Valdez','4959 James Terrace Suite 381 New Scott, AZ 71565',1,6399.89,'1958-09-11',1,86),(37,'Jesse','Freeman','399 Murray Way Apt. 349 Port Laura, MN 02502',0,1029.76,'1924-10-05',8,73),(38,'Alec','Phillips','95976 Weber Tunnel Jacobsfort, MS 71157',0,6809.85,'2009-10-18',4,47),(39,'Wendy','Hayes','540 Keith Port Apt. 206 East Alexandra, DE 01529',0,1328.53,'1970-02-28',5,82),(40,'Sandra','Ellis','416 Jones Falls Suite 970 West Michaelport, VA 64737',1,9634.38,'1933-10-29',9,NULL),(41,'Veronica','Schmidt','99732 Mills Parkways Suite 065 New Crystalchester, TN 89152',0,4296.16,'1940-10-07',3,12),(42,'Robert','Ho','709 Christopher Valleys Apt. 565 Joshuashire, MA 06147',0,4682.62,'1950-09-06',2,85),(43,'Tracy','Caldwell','523 William Brooks Suite 327 Port Alanhaven, HI 89198',0,9415.67,'1958-12-22',10,NULL),(44,'Andre','Larson','5848 Stacey Stream Suite 177 West Kayla, MN 75290',1,3193.50,'1934-08-19',7,52),(45,'Anthony','Reese','1527 Sarah Land New Lauren, OK 09554',1,3353.47,'1969-06-29',3,100),(46,'Jason','Garrett','9323 Hernandez Landing West Sean, NC 06655',0,1242.48,'1975-01-20',3,12),(47,'Karen','Brown','0622 Tanya Port Suite 757 Galvanshire, ME 78063',0,8314.10,'1956-03-18',4,NULL),(48,'Lee','Smith','255 Jennifer Forest Suite 437 Mccarthymouth, CT 15087',0,7008.03,'2002-11-18',9,76),(49,'Nancy','Mullins','85724 David Haven Suite 526 Seanport, CT 75925',0,4545.40,'1975-05-31',5,3),(50,'Brandon','Frazier','26588 Beck Forest Huntton, NJ 83906',1,1731.07,'1971-12-08',8,93),(51,'Nicholas','Baker','5714 Nguyen Wells Suite 013 Katherineburgh, HI 12968',1,5183.56,'1928-11-25',4,2),(52,'Nicole','Callahan','715 Tonya Fort Apt. 712 Laurentown, MN 10610',0,7343.34,'1921-06-30',7,91),(53,'Sean','Irwin','1084 Long Wall West Harold, MI 24877',1,9625.92,'1961-05-07',3,NULL),(54,'Gregory','Daugherty','8835 Timothy Fall Amyfort, RI 07353',1,4435.20,'1911-08-29',3,12),(55,'Robert','Bentley','1798 Zamora Inlet Apt. 425 South Alexanderbury, WY 04380',0,7189.86,'1999-06-10',5,NULL),(56,'Veronica','Rogers','1969 Joseph Tunnel Scottburgh, GA 47715',1,6836.00,'1953-06-02',7,66),(57,'Amy','Vaughan','5655 Jeffrey Groves Jenningsville, OR 51550',1,2625.13,'1997-03-11',10,75),(58,'Timothy','Clark','666 Heather Junction Apt. 387 Gregoryville, ID 42683',1,1792.42,'1997-04-30',3,100),(59,'Rebekah','Jones','82376 Reyes Rapid Weavermouth, MN 53508',1,5382.66,'1955-01-07',10,75),(60,'Bradley','Hodges','275 Gregory Lodge Suite 600 Wrightmouth, NY 58154',0,2549.05,'2005-09-22',10,75),(61,'Sherry','Taylor','6458 Brandon Well West Sherriland, RI 68726',0,3959.28,'2020-01-05',6,25),(62,'Bethany','Rodriguez','914 Farmer Locks Suite 174 North Johnny, MN 21968',1,7674.30,'1908-07-22',9,76),(63,'Benjamin','Harris','669 Jessica Villages Apt. 741 Lake Katherine, NE 37137',0,3523.91,'1969-05-22',9,76),(64,'Jennifer','Savage','138 Fox Alley Aliciabury, DE 73579',1,4232.40,'1991-11-22',5,82),(65,'Sophia','Ayala','Unit 3849 Box 4860 DPO AE 45719',0,2245.53,'1999-05-15',6,25),(66,'Traci','Johnson','595 Jessica Run Apt. 076 Port Dustin, KS 98150',1,7347.01,'1964-04-01',7,91),(67,'Jesse','Oliver','3891 Vasquez Manor Mckayton, DE 90777',0,7645.58,'1956-01-10',10,75),(68,'Gregory','Lewis','404 Angela Mall Lake Williamfurt, NV 44557',1,2841.43,'1918-11-17',2,85),(69,'Kathryn','Soto','3514 Cassidy Flat Apt. 579 Brandonstad, OH 70106',1,6395.82,'1974-08-20',7,52),(70,'Tamara','Sanchez','46519 Stephanie Road Apt. 900 Torrestown, AK 66102',1,5206.99,'1925-08-27',1,14),(71,'Brandi','Norris','0827 Heather Cove Moorefurt, NY 27946',0,5348.33,'1937-10-27',7,66),(72,'Jennifer','Dickerson','2749 Howell Forges Port Jessicastad, MO 12006',1,4287.91,'1972-07-31',4,38),(73,'Ralph','Mcclure','2011 Justin Mission New Judithside, FL 01687',1,7932.74,'1938-06-08',8,24),(74,'Anthony','Stewart','09759 Ashley Mills Staceyburgh, NM 16591',1,4426.36,'1921-09-19',1,36),(75,'Spencer','Cole','55071 Donald Dam Suite 927 Murphyburgh, NM 68635',1,8545.62,'1976-05-31',10,43),(76,'Jeremy','Cole','19161 Erin Neck Apt. 583 West Cody, NM 10753',1,8877.23,'1910-01-27',9,40),(77,'Mindy','Cohen','456 Davis Light Suite 289 Port Tanya, NM 39950',0,1650.73,'2015-10-22',5,82),(78,'Kathleen','Kirk','USNS Mullins FPO AA 23431',0,6495.94,'1928-11-25',6,90),(79,'Joshua','Smith','54889 Johnson Fields Apt. 816 Patriciaton, UT 32088',0,1560.63,'1980-04-03',6,25),(80,'Richard','Scott','87688 Morris Squares Apt. 082 Randalltown, GA 12406',1,2959.79,'1941-02-16',4,38),(81,'Sarah','Farmer','USS Andrews FPO AA 03391',1,1080.86,'2007-02-23',5,82),(82,'Angela','Thomas','12341 Dwayne Harbors Suite 713 North Michellemouth, IL 87927',0,7068.19,'1981-04-16',5,55),(83,'Jason','Ruiz','272 Kayla Field South Marciashire, AZ 53891',0,6850.96,'2002-12-10',7,52),(84,'Joanne','Wise','79575 Samantha Forks Apt. 801 Hammondbury, CA 45698',1,8889.52,'2005-05-15',10,43),(85,'Joanna','Flores','419 Matthew Canyon Suite 852 New Anthony, MS 64089',0,7599.48,'2014-06-22',2,26),(86,'Richard','Valdez','Unit 0410 Box 3748 DPO AA 19449',0,9212.20,'1992-11-05',1,NULL),(87,'Michael','Fernandez','60956 Jill Locks North Melanie, NV 74002',0,2653.22,'1905-11-29',7,66),(88,'Karen','Alexander','00094 Day Dam Apt. 290 Ericberg, OR 35267',0,2660.20,'1915-07-30',10,75),(89,'Steven','Schultz','16408 Barajas Field Kimberlyfort, MA 46694',0,4480.76,'1981-09-26',3,12),(90,'Richard','Johnson','PSC 0361, Box 3435 APO AA 17755',1,8783.10,'1980-12-25',6,NULL),(91,'Mary','Gordon','367 Morse View Apt. 519 Roymouth, WA 09590',0,9926.18,'1934-10-04',7,NULL),(92,'Robert','Chandler','6468 Bright Harbors Schwartzview, PA 59218',1,5541.44,'1966-12-24',2,85),(93,'Vincent','Dean','Unit 8742 Box 1876 DPO AE 50977',0,7907.63,'1991-03-31',8,24),(94,'Kathy','Wells','USS Aguilar FPO AE 32238',1,1698.14,'1980-08-17',4,2),(95,'James','Galvan','77177 Vaughan Lakes Apt. 314 New Angela, IN 90096',0,6783.49,'1959-08-11',10,75),(96,'Tracey','Parsons','53470 Christopher Islands East Gabrielville, NV 90023',0,4217.35,'1975-02-07',10,84),(97,'Patrick','Brooks','Unit 3018 Box 3156 DPO AA 41113',0,3696.64,'1916-11-30',3,100),(98,'Colton','Mckenzie','0085 Torres Dale Wheelermouth, ME 22660',0,4683.01,'1915-07-23',3,100),(99,'Katherine','Hopkins','684 Janet Rest Suite 282 Mitchellland, OR 82838',1,6990.43,'1967-09-04',7,52),(100,'Karen','Pearson','4730 Edward Stream Brittanyfort, MS 40301',0,6495.09,'1939-03-05',3,53);
/*!40000 ALTER TABLE `FUNCIONARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJETO`
--

DROP TABLE IF EXISTS `PROJETO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROJETO` (
  `numero` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `dnumero` bigint(20) unsigned NOT NULL,
  `localizacao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `dnumero` (`dnumero`),
  CONSTRAINT `PROJETO_ibfk_1` FOREIGN KEY (`dnumero`) REFERENCES `DEPARTAMENTO` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJETO`
--

LOCK TABLES `PROJETO` WRITE;
/*!40000 ALTER TABLE `PROJETO` DISABLE KEYS */;
INSERT INTO `PROJETO` VALUES (1,'Carro autônomo',3,'Montevideu'),(2,'Vacina covid-19',4,'Salvador'),(3,'Automação residencial',10,'Salvador'),(4,'Colônia em Marte',6,'São Paulo'),(5,'Supercomputador quântico',5,'São Paulo'),(6,'Drone subacuático',1,'Santiago'),(7,'HAL 9000',7,'Salvador'),(8,'Skynet',9,'São Paulo');
/*!40000 ALTER TABLE `PROJETO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRABALHA_EM`
--

DROP TABLE IF EXISTS `TRABALHA_EM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRABALHA_EM` (
  `fident` bigint(20) unsigned NOT NULL,
  `pnumero` bigint(20) unsigned NOT NULL,
  `horas` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`fident`,`pnumero`),
  KEY `pnumero` (`pnumero`),
  CONSTRAINT `TRABALHA_EM_ibfk_1` FOREIGN KEY (`fident`) REFERENCES `FUNCIONARIO` (`ident`),
  CONSTRAINT `TRABALHA_EM_ibfk_2` FOREIGN KEY (`pnumero`) REFERENCES `PROJETO` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRABALHA_EM`
--

LOCK TABLES `TRABALHA_EM` WRITE;
/*!40000 ALTER TABLE `TRABALHA_EM` DISABLE KEYS */;
INSERT INTO `TRABALHA_EM` VALUES (1,3,4),(2,2,20),(3,5,14),(4,7,40),(5,8,40),(6,4,20),(9,4,40),(10,5,14),(11,5,14),(12,1,4),(13,2,20),(14,6,20),(15,2,20),(16,2,20),(17,3,8),(18,7,20),(20,6,8),(22,5,40),(23,4,40),(25,4,14),(27,8,8),(28,8,20),(30,8,40),(31,5,40),(32,2,8),(33,8,8),(34,1,4),(35,4,4),(36,6,14),(38,2,4),(39,5,4),(40,8,8),(41,1,4),(43,3,20),(44,7,4),(45,1,40),(46,1,14),(47,2,8),(48,8,40),(49,5,40),(51,2,40),(52,7,8),(53,1,14),(54,1,4),(55,5,4),(56,7,8),(57,3,14),(58,1,14),(59,3,20),(60,3,8),(61,4,8),(62,8,20),(63,8,4),(64,5,4),(65,4,20),(66,7,20),(67,3,14),(69,7,8),(70,6,20),(71,7,8),(72,2,20),(74,6,20),(75,3,4),(76,8,20),(77,5,14),(78,4,40),(79,4,4),(80,2,4),(81,5,8),(82,5,8),(83,7,20),(84,3,4),(86,6,14),(87,7,40),(88,3,8),(89,1,20),(90,4,8),(91,7,40),(94,2,14),(95,3,40),(96,3,40),(97,1,4),(98,1,40),(99,7,4),(100,1,4);
/*!40000 ALTER TABLE `TRABALHA_EM` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-28 20:13:28
