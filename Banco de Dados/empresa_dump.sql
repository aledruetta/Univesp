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
  KEY `gident` (`gident`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`gident`) REFERENCES `funcionario` (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Logística',58,'2020-01-01'),(2,'Marketing',40,'2020-01-01'),(3,'Ventas',4,'2020-01-01'),(4,'RH',29,'2020-01-01'),(5,'Engenharia',86,'2020-01-01'),(6,'Informática',36,'2020-01-01'),(7,'Financeiro',10,'2020-01-01'),(8,'Segurança',89,'2020-01-01'),(9,'Manutenção',33,'2020-01-01'),(10,'Produção',82,'2020-01-01');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependente` (
  `fident` bigint(20) unsigned NOT NULL,
  `nome` varchar(100) NOT NULL,
  `dt_nasc` date NOT NULL,
  `sexo` tinyint(1) NOT NULL,
  `relacionamento` enum('filho/a','conjuge','outro') NOT NULL,
  PRIMARY KEY (`fident`,`nome`),
  CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`fident`) REFERENCES `funcionario` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (3,'Michael Moss','1999-07-29',0,'outro'),(6,'Phillip Patterson','1982-04-08',1,'outro'),(8,'Wendy Simmons','2013-03-21',1,'conjuge'),(10,'Allen Coleman','1984-03-29',0,'filho/a'),(12,'Julia Nielsen','1990-01-13',1,'conjuge'),(13,'Erik Burch','1998-07-23',1,'filho/a'),(14,'Sarah Smith','1967-07-16',0,'conjuge'),(15,'David Werner','1913-01-28',0,'outro'),(20,'Leslie Mendoza','1905-01-30',1,'outro'),(22,'Kimberly Campbell','2001-03-07',0,'outro'),(24,'Jacqueline Monroe','2014-01-13',1,'outro'),(25,'Julia Mason','1982-05-26',1,'filho/a'),(26,'Daniel Riley','2006-02-24',0,'outro'),(27,'Christopher Young','1945-04-06',0,'filho/a'),(28,'Kristin Shields','1954-12-23',0,'filho/a'),(29,'Angela Montgomery','1992-11-30',0,'conjuge'),(31,'Sarah Curry','1971-03-19',0,'conjuge'),(32,'James Smith','2000-04-21',1,'outro'),(36,'Neil Thompson','2014-02-13',0,'outro'),(37,'Paul Bennett','1936-02-21',1,'filho/a'),(38,'Troy Richardson','1930-06-07',0,'outro'),(40,'Jacob Keller','1973-04-10',1,'filho/a'),(42,'Frank Baker','1923-04-22',1,'filho/a'),(45,'Anthony Berg','1921-08-10',0,'outro'),(47,'Michelle Savage','1939-03-28',0,'filho/a'),(50,'Megan Arias','1908-06-28',1,'filho/a'),(51,'Elizabeth Johnson','1965-05-17',0,'outro'),(53,'Louis Torres','2008-08-18',0,'conjuge'),(54,'Sara Reeves','2018-11-15',1,'outro'),(55,'Anthony Mcknight','1905-05-06',1,'conjuge'),(56,'Emily Wells','1980-11-19',0,'conjuge'),(57,'Joseph Snyder','1955-01-26',1,'conjuge'),(62,'Jennifer Ramos','1918-11-28',1,'outro'),(63,'Melissa Lamb','1965-10-28',1,'filho/a'),(65,'Melissa Ramsey','1980-09-24',1,'filho/a'),(66,'Paul Copeland','1932-03-07',1,'filho/a'),(69,'Theresa Johnson','1958-03-03',1,'conjuge'),(74,'Marcus Carlson','1915-02-21',0,'conjuge'),(75,'Jamie Hampton','1922-11-15',1,'conjuge'),(77,'Bradley Kline','1937-01-05',0,'conjuge'),(78,'Melissa Sampson','1999-12-29',0,'outro'),(80,'Tiffany Richardson','1947-09-22',1,'conjuge'),(82,'Katelyn Morris','1979-01-18',1,'filho/a'),(85,'Robin Lynch','1994-09-17',0,'filho/a'),(88,'Raymond Butler','2005-03-28',1,'conjuge'),(89,'Melissa Alvarez','1975-10-08',1,'filho/a'),(92,'Jenna Fletcher','1931-07-14',0,'outro'),(94,'Thomas Gonzales','1989-11-27',0,'filho/a'),(95,'Leon Walker','1982-04-06',0,'outro'),(97,'Alan Rios','1936-11-30',1,'filho/a');
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
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
  `sexo` tinyint(1) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `dtnasc` date DEFAULT NULL,
  `dnumero` bigint(20) unsigned NOT NULL,
  `supident` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ident`),
  KEY `dnumero` (`dnumero`),
  KEY `supident` (`supident`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`dnumero`) REFERENCES `departamento` (`numero`),
  CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`supident`) REFERENCES `funcionario` (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Charles','Barrett','658 Kimberly Camp Michaelburgh, NM 40089',1,1553.68,'1974-07-06',6,NULL),(2,'Jodi','Smith','8465 Brandon Camp Justinport, SD 70117',1,4831.54,'1934-04-12',2,NULL),(3,'Chris','Case','31465 Jacqueline Orchard Apt. 154 Carolmouth, MO 80103',1,8790.36,'1985-03-15',4,NULL),(4,'Kayla','Page','56386 William Ports Port Robinville, NY 04359',0,9122.23,'1909-05-11',3,NULL),(5,'Robert','Rhodes','80461 Bradley Manor West Craig, PA 17023',0,9097.57,'2013-07-02',10,NULL),(6,'Lance','Mccoy','0317 Misty Roads Apt. 356 Stanleychester, VA 27844',1,9657.78,'2017-08-12',2,NULL),(7,'Susan','Forbes','17084 Hernandez Key Ramirezbury, CA 90633',0,4288.33,'1959-11-14',1,NULL),(8,'Anthony','Harris','108 William Valleys Suite 026 Kathrynside, NC 43936',1,6543.09,'1941-06-21',10,NULL),(9,'Antonio','Cherry','26928 Samuel Mall Port Cheryl, KS 46883',0,3742.53,'1933-11-03',9,NULL),(10,'Michelle','Reid','7367 Henry Springs Apt. 788 Lake Dianafort, ID 32926',0,9719.23,'1965-03-07',7,NULL),(11,'Logan','Townsend','465 Dawn Ramp Apt. 742 Rodriguezborough, IL 06706',1,8514.09,'1989-06-09',8,NULL),(12,'Jenna','Solis','PSC 1601, Box 6147 APO AE 94026',0,5148.74,'2014-01-23',5,NULL),(13,'Austin','Hobbs','508 Valenzuela Hills Suite 405 Hopkinsstad, CT 65041',1,1759.08,'2002-05-16',10,NULL),(14,'Donna','Hunt','USNS Simmons FPO AP 50884',0,4906.53,'2001-03-28',8,NULL),(15,'Kathleen','Young','490 Mueller Avenue Suite 363 Nealview, MA 81873',0,8617.81,'1920-03-02',7,NULL),(16,'Melanie','Hunter','91036 Hickman Cove Phillipsborough, NC 48905',1,5699.35,'1956-09-08',5,NULL),(17,'Tina','Price','365 Martin Mission Suite 673 Bauerville, NV 25402',0,4105.62,'1968-01-03',3,NULL),(18,'Tammie','Parker','1705 Ferguson Trafficway Suite 481 North Sharon, MA 57818',1,7703.87,'1948-04-14',10,NULL),(19,'Tyler','Doyle','28609 Krista Ferry Apt. 639 East Ryanfort, SD 18968',0,9302.63,'1994-09-21',1,NULL),(20,'Roberta','Walsh','023 Julia Run Edwardview, PA 65771',0,5484.64,'1983-03-11',6,NULL),(21,'Patrick','Collins','981 Berg Lakes South Charleschester, MI 18934',1,1801.47,'1921-03-18',10,NULL),(22,'Christopher','Ramos','3097 Cross Mills Suite 366 Scottstad, IN 61576',0,8805.51,'1962-05-04',8,NULL),(23,'James','Miller','487 Sanchez Crest Suite 673 West Daniellemouth, PA 89915',1,6498.35,'1986-07-16',6,NULL),(24,'Jason','Wilson','96731 Long Isle Suite 504 Port Ashleyshire, MI 18440',1,3405.79,'2012-04-02',2,NULL),(25,'Heather','Branch','114 Caroline Fields Taylormouth, MO 50339',0,1636.32,'1975-11-08',9,NULL),(26,'Gary','Johnson','4405 Sullivan Locks Kristenburgh, WV 74644',1,5052.19,'1987-01-20',4,NULL),(27,'Roberta','Lopez','863 Nathan Road Suite 064 Costaview, MO 80542',1,1465.27,'1919-03-08',2,NULL),(28,'Jacqueline','Walker','153 Kellie Pines Suite 880 Laurenbury, AL 93446',0,2727.90,'1950-12-02',8,NULL),(29,'Steve','Bryan','829 Susan Estates Lisaton, PA 50003',0,9416.22,'1928-10-15',4,NULL),(30,'Robert','Nguyen','43868 Tonya Springs Leonardchester, VA 91305',0,7920.59,'1970-03-05',4,NULL),(31,'Mary','Nelson','939 Cassandra Dale Suite 674 East Sarahfurt, NH 47974',1,5729.48,'1905-02-28',8,NULL),(32,'Monica','Knight','76711 John Brooks South Alison, IN 13998',1,9713.43,'1910-03-24',5,NULL),(33,'Kari','Archer','896 Thomas Rapid Suite 402 Lake Dianeton, RI 24505',1,9274.89,'1993-06-26',9,NULL),(34,'Matthew','Jones','654 Mary Row Timothymouth, AR 22912',1,4393.70,'1937-02-22',3,NULL),(35,'Kimberly','Aguirre','48682 Michael Brooks Port Jorgeview, MT 56726',1,4554.44,'1924-09-11',3,NULL),(36,'Christopher','Rowland','0281 Nicholas Port Apt. 687 South Jacobport, SC 84801',0,9732.16,'1998-01-11',6,NULL),(37,'Abigail','Bauer','465 Christensen Stream Suite 387 New Brandon, TN 49057',0,3190.17,'1983-07-29',7,NULL),(38,'Jackie','Jennings','3812 Russell Locks Suite 781 Lake Jeffreyport, ME 51710',0,8254.93,'2007-11-13',9,NULL),(39,'Laura','Scott','8718 Rivera Circles Kristopherland, AR 45166',0,6780.01,'2000-01-12',4,NULL),(40,'Julia','Williams','USCGC Carr FPO AA 60527',1,9678.16,'2019-09-01',2,NULL),(41,'Larry','Mcclain','4931 Kenneth Ranch West Samuel, LA 36609',1,8607.01,'1916-03-13',1,NULL),(42,'Brianna','Johnson','62402 Adam Gardens New Benjaminshire, KS 13019',0,5299.44,'1953-10-17',10,NULL),(43,'Brooke','Ortiz','83986 Rick Overpass Annmouth, WI 01264',1,1890.13,'1999-03-29',3,NULL),(44,'Jennifer','Hensley','24351 Miller Springs Apt. 867 Port Anthonyfurt, WV 57891',1,4099.62,'2005-09-30',2,NULL),(45,'Willie','Reyes','43957 Erika Camp Apt. 967 New James, NE 94381',1,8150.12,'1926-11-16',2,NULL),(46,'Ronald','Thomas','529 Burns Row Apt. 331 North Matthew, NY 54462',0,6957.78,'2010-01-28',4,NULL),(47,'Candice','Harmon','3940 Adam Ports Suite 760 East Andrew, DC 16875',1,6180.43,'2001-11-05',7,NULL),(48,'Sarah','Cabrera','40588 Stevenson Road Suite 540 Darlenetown, NM 19915',1,9243.85,'1908-04-04',10,NULL),(49,'Donald','Patel','3007 Nguyen Highway Suite 893 North David, CT 70937',1,5341.41,'2017-12-11',3,NULL),(50,'Susan','Sullivan','3536 Rose Lake Apt. 556 New Ashleytown, VT 36462',0,4471.34,'1984-07-30',10,NULL),(51,'Meagan','Graham','93599 Robert Mill Wendyhaven, NM 95367',0,6520.43,'1927-09-29',7,NULL),(52,'Tanner','Whitehead','335 Derrick Turnpike Mollyshire, WI 41255',1,3318.05,'2003-08-29',6,NULL),(53,'Clifford','Moore','26870 Timothy Forges Suite 804 East Kylechester, FL 38858',1,2631.74,'1995-11-02',1,NULL),(54,'Jennifer','Franklin','7188 Jeanette Cliffs North Brian, NC 68544',1,2085.59,'1945-07-20',9,NULL),(55,'David','Suarez','9166 Nina Island South Ashley, MI 04153',1,6204.68,'1931-01-25',5,NULL),(56,'Jonathan','Johnson','915 Jessica Trail Lake Melissahaven, SD 99633',1,6667.44,'1976-04-05',7,NULL),(57,'Carrie','Barnes','9518 Melissa Brook Apt. 173 Michaelton, MD 31422',0,8341.38,'1989-12-22',4,NULL),(58,'Michael','Payne','38350 Patton Rue Alexanderbury, NJ 03103',0,9591.12,'2012-08-17',1,NULL),(59,'Nicole','Reese','895 Johnson Path Suite 267 New Morgan, HI 63740',1,2059.85,'1917-04-06',6,NULL),(60,'Margaret','Torres','78074 Mccormick Ranch Suite 607 Deannachester, OH 73555',1,4443.35,'1929-07-31',3,NULL),(61,'Amy','Schultz','205 David Ford Alexistown, KS 13445',1,3500.09,'1999-07-25',4,NULL),(62,'Terri','Rivera','USNS Patterson FPO AE 35758',1,9219.73,'2014-06-25',1,NULL),(63,'James','Malone','4354 Harris Courts Apt. 694 North Heather, CO 62981',0,2649.07,'1938-01-09',6,NULL),(64,'Samantha','Russo','304 Lambert Brooks Suite 774 Carterfort, WV 08093',0,9731.51,'1985-01-01',8,NULL),(65,'Laura','Hill','5433 Henry Centers Burketon, OR 41079',1,3274.19,'1962-06-27',7,NULL),(66,'Angela','Hart','679 Waller Pike Weeksstad, VA 51551',0,7725.22,'1928-05-14',9,NULL),(67,'David','Campbell','7573 Reeves Throughway Port Kimberly, MA 70267',1,5897.39,'1932-05-27',6,NULL),(68,'Kelly','Navarro','7236 Cannon Trail Apt. 530 Oliverland, MT 03997',1,6590.34,'1906-07-31',4,NULL),(69,'Richard','Haley','70037 Derek Dale East Stevenmouth, WA 07816',0,4982.37,'1944-04-25',9,NULL),(70,'Robert','Saunders','85445 Chad Plaza Apt. 114 West Dustinland, WI 63892',1,1275.86,'1971-12-07',10,NULL),(71,'Diana','Johnson','96900 Melissa Hollow Port Michelle, GA 24534',1,1163.81,'2014-11-27',6,NULL),(72,'Daniel','Moore','58774 Rebecca Pine Suite 226 Hamiltonview, NH 92581',0,5919.83,'2003-02-02',3,NULL),(73,'Jenna','Sanchez','9596 Dylan Dale Harrellstad, WI 99193',1,7389.19,'2015-06-18',9,NULL),(74,'Timothy','Wallace','33564 Javier Loop Suite 427 Stephaniefort, IL 65718',1,7605.54,'2017-07-29',8,NULL),(75,'Mark','Hamilton','440 Alvarez Trail Apt. 860 Weavermouth, KY 44292',1,8775.54,'1965-09-20',1,NULL),(76,'Jacob','Ward','74948 Smith Glen Lake Adrianchester, IA 29410',0,5935.43,'2010-10-15',3,NULL),(77,'Karen','Thompson','0874 Ray Glens Apt. 494 Michelletown, AK 58320',0,1946.61,'1981-08-18',10,NULL),(78,'Paul','Anderson','Unit 2943 Box 3359 DPO AE 07466',1,6918.01,'1922-10-04',8,NULL),(79,'Andrea','Martinez','1321 John Street North Emmamouth, MD 27864',0,7798.58,'2001-03-02',2,NULL),(80,'Courtney','Delgado','553 Lisa Neck Apt. 347 Maddenhaven, IL 88670',0,3231.53,'2018-04-11',4,NULL),(81,'Austin','Henry','95459 Jason Plaza Apt. 950 Kristineport, GA 17501',0,1014.86,'1907-12-30',6,NULL),(82,'Rhonda','Mcintyre','62860 Cooper Road Brittanyhaven, MT 25543',1,9526.90,'1985-01-12',10,NULL),(83,'Claudia','Simon','Unit 2054 Box 3371 DPO AP 91239',1,2178.94,'1992-08-24',1,NULL),(84,'Sean','Vaughn','83527 Huffman Heights Mossfurt, NY 74682',1,1021.52,'2015-12-21',2,NULL),(85,'Jermaine','Butler','6926 Deleon Valley Wangville, ID 35699',0,4854.33,'1970-11-28',2,NULL),(86,'Jennifer','Wade','16722 Smith Dale North Christian, MO 50044',0,9763.72,'1981-12-23',5,NULL),(87,'Anna','Ewing','53855 Scott Loaf Lake Larryfort, MI 12501',1,6214.22,'2019-06-06',4,NULL),(88,'Veronica','Bradford','363 Pierce Court Apt. 368 West Robynville, MD 21303',0,7611.81,'1927-06-04',2,NULL),(89,'Megan','Snyder','44232 Clark Harbors Suite 374 Port Michelefort, MT 70983',1,9911.01,'1940-08-27',8,NULL),(90,'Mary','Young','9142 Robertson Street Apt. 638 Josephshire, WV 82020',1,8384.24,'1911-06-19',7,NULL),(91,'Steven','Morris','01364 Steven Trace Suite 849 Kristineview, DE 79819',0,5449.73,'1997-12-21',10,NULL),(92,'Micheal','Evans','Unit 4129 Box 8655 DPO AE 37440',0,8844.36,'1956-07-27',1,NULL),(93,'Lawrence','Bell','4274 Garcia Mountain Apt. 392 North Shawnmouth, KS 54391',0,8742.83,'1949-02-14',3,NULL),(94,'Lance','Martin','598 Thomas Rapid Christophermouth, SC 59736',0,8807.29,'1930-12-28',9,NULL),(95,'Jessica','Moore','45112 Danny Extension New Barbaraberg, NE 65408',0,5487.23,'1973-07-23',4,NULL),(96,'Brian','King','76238 Sherry Village Suite 740 West Tammymouth, ME 56011',0,3501.80,'1957-08-30',2,NULL),(97,'Nicole','Little','11904 Kelly Route Apt. 830 Lake Arthur, KS 89331',0,3463.06,'2015-01-14',9,NULL),(98,'Erin','Fitzpatrick','8989 Hayes Stravenue Perryton, MD 51814',1,7283.37,'1964-04-06',4,NULL),(99,'Nicholas','Harris','8129 Schaefer Inlet Apt. 717 Petersmouth, CO 27422',1,7281.26,'2009-10-11',10,NULL),(100,'Michelle','Rodriguez','90770 Timothy Court South Erin, OK 70710',0,4931.55,'1981-12-20',9,NULL);
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
  KEY `dnumero` (`dnumero`),
  CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`dnumero`) REFERENCES `departamento` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,'Carro autônomo',3,NULL),(2,'Vacina covid-19',10,NULL),(3,'Automação residencial',5,NULL),(4,'Colônia em Marte',6,NULL),(5,'Supercomputador quântico',4,NULL),(6,'Drone subacuático',2,NULL),(7,'HAL 9000',9,NULL),(8,'Skynet',7,NULL);
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
  KEY `pnumero` (`pnumero`),
  CONSTRAINT `trabalha_em_ibfk_1` FOREIGN KEY (`fident`) REFERENCES `funcionario` (`ident`),
  CONSTRAINT `trabalha_em_ibfk_2` FOREIGN KEY (`pnumero`) REFERENCES `projeto` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalha_em`
--

LOCK TABLES `trabalha_em` WRITE;
/*!40000 ALTER TABLE `trabalha_em` DISABLE KEYS */;
INSERT INTO `trabalha_em` VALUES (1,4,8),(2,6,40),(3,5,20),(4,1,4),(5,2,20),(6,6,14),(8,2,4),(9,7,40),(10,8,8),(12,3,14),(13,2,40),(15,8,4),(16,3,4),(17,1,40),(18,2,4),(20,4,4),(21,2,20),(23,4,8),(24,6,20),(25,7,8),(26,5,14),(27,6,14),(29,5,14),(30,5,4),(32,3,20),(33,7,40),(34,1,14),(35,1,40),(36,4,4),(37,8,20),(38,7,8),(39,5,4),(40,6,40),(42,2,40),(43,1,20),(44,6,4),(45,6,40),(46,5,4),(47,8,14),(48,2,40),(49,1,4),(50,2,14),(51,8,40),(52,4,8),(54,7,20),(55,3,14),(56,8,20),(57,5,40),(59,4,14),(60,1,8),(61,5,14),(63,4,4),(65,8,20),(66,7,40),(67,4,4),(68,5,4),(69,7,40),(70,2,20),(71,4,20),(72,1,4),(73,7,14),(76,1,14),(77,2,14),(79,6,4),(80,5,40),(81,4,4),(82,2,14),(84,6,20),(85,6,8),(86,3,8),(87,5,4),(88,6,20),(90,8,8),(91,2,14),(93,1,4),(94,7,14),(95,5,40),(96,6,40),(97,7,14),(98,5,14),(99,2,20),(100,7,4);
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

-- Dump completed on 2020-03-27 21:53:28
