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
INSERT INTO `DEPARTAMENTO` VALUES (1,'Logística',90,'2020-01-01'),(2,'Marketing',58,'2020-01-01'),(3,'Ventas',75,'2020-01-01'),(4,'RH',9,'2020-01-01'),(5,'Engenharia',39,'2020-01-01'),(6,'Informática',32,'2020-01-01'),(7,'Financeiro',26,'2020-01-01'),(8,'Segurança',98,'2020-01-01'),(9,'Manutenção',61,'2020-01-01'),(10,'Produção',14,'2020-01-01');
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
INSERT INTO `DEPENDENTE` VALUES (1,'Michael Pierce','1927-09-17',0,'filho/a'),(3,'John Mendoza','2001-11-07',1,'outro'),(5,'Matthew Chapman','1909-03-06',1,'outro'),(6,'Michael Allen','2011-07-10',1,'outro'),(8,'Joshua Edwards','1960-11-16',1,'outro'),(9,'Wanda Williams','1906-08-01',1,'filho/a'),(10,'Matthew Heath','1939-12-06',0,'outro'),(11,'David Willis','1960-07-31',0,'outro'),(12,'Juan Fleming','1956-08-03',0,'outro'),(14,'Cathy Le','1998-02-04',1,'conjuge'),(17,'Elizabeth Price','1955-11-29',0,'outro'),(23,'Nicole Kramer','1978-07-25',0,'filho/a'),(27,'Julie Simmons','1972-05-13',1,'filho/a'),(36,'Charles King','1965-04-20',1,'conjuge'),(37,'Emily Vaughan','1923-04-05',1,'outro'),(38,'Claudia Walker','2019-03-01',0,'outro'),(41,'Sara Parker','1911-12-30',0,'conjuge'),(42,'Dillon Anderson','1982-02-03',0,'conjuge'),(43,'Robert Dyer','1998-11-10',0,'conjuge'),(44,'Jessica Clark','2006-12-16',1,'filho/a'),(45,'Terri Contreras','1915-11-04',1,'conjuge'),(46,'Travis Green','1962-09-24',1,'outro'),(49,'Dawn Johnson','1926-11-08',1,'conjuge'),(51,'Christina Conley','1990-09-01',0,'filho/a'),(52,'Lisa Howell','1969-07-27',1,'filho/a'),(54,'Samuel Clark','2002-03-28',1,'outro'),(55,'Jason Brewer','2014-01-14',1,'outro'),(56,'Jennifer Rivers','1983-09-06',1,'filho/a'),(60,'Edwin Anderson','1935-02-16',0,'outro'),(63,'Tricia Vang','1974-01-25',0,'outro'),(65,'Tina Thompson','1951-06-28',1,'conjuge'),(66,'Stephen Buchanan','1936-01-09',0,'conjuge'),(69,'Joseph Green','2004-05-17',0,'filho/a'),(70,'Robert Mcbride','1977-12-02',0,'conjuge'),(73,'Veronica Larson','1961-09-30',1,'outro'),(74,'Andrea Adams','1993-11-14',0,'outro'),(75,'Michelle Cannon','1956-08-09',1,'filho/a'),(77,'Jennifer Garcia','1930-05-08',0,'filho/a'),(78,'Tiffany Richards','1983-07-27',0,'filho/a'),(80,'Crystal Dickerson','1932-08-29',1,'outro'),(82,'Kimberly Hernandez','1917-09-01',1,'filho/a'),(84,'Keith Carpenter','2000-08-30',1,'conjuge'),(88,'Christopher Reynolds','1908-12-17',0,'filho/a'),(89,'Colleen Daniels','1950-06-29',0,'filho/a'),(91,'Antonio Torres','1956-09-11',1,'outro'),(92,'Krystal Adams','2011-09-17',0,'conjuge'),(94,'Alison Rojas','2002-05-13',0,'outro'),(96,'Jimmy Hanson','1937-05-07',0,'filho/a'),(97,'Ryan Hernandez','1916-03-24',0,'filho/a'),(99,'Rodney Henderson','1910-07-19',1,'outro');
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
INSERT INTO `FUNCIONARIO` VALUES (1,'Miranda','Matthews','USNV Williamson FPO AE 00973',0,1143.92,'2005-09-21',4,18),(2,'Raven','Reed','2149 Baldwin Center Suite 107 North Chrismouth, OR 88869',1,6020.39,'2003-10-30',2,91),(3,'Isaiah','Roberts','6861 Williams Plains Suite 276 Reedport, IA 37562',1,2471.85,'1928-03-17',4,10),(4,'John','Sparks','82121 Elizabeth Route Apt. 394 Jaclynhaven, NM 45374',0,4675.14,'1905-07-26',8,54),(5,'Melissa','Braun','64388 Scott Union Apt. 951 Lake Matthew, AR 85147',0,2522.38,'1955-04-22',7,84),(6,'Steven','Owens','24912 Perez Route Stephenport, TX 53765',1,7677.74,'1950-12-31',1,68),(7,'David','Rocha','64245 Daniel Island Port Reginafurt, AK 83939',0,3103.44,'2006-02-04',7,84),(8,'Kenneth','Smith','993 Sarah Fork Johnberg, PA 68450',0,5675.71,'1977-06-23',8,24),(9,'Monica','Ward','64959 Michelle Roads Suite 468 Lake Adam, SC 76651',0,9260.58,'2000-05-02',4,NULL),(10,'Tracy','Mccullough','181 Jeremy Mission East Robertshire, CO 85490',1,9110.93,'1968-03-23',4,9),(11,'Brett','Morris','919 Jacob Mountain Apt. 445 Espinozafurt, ND 48425',1,8994.92,'2012-09-30',1,90),(12,'Laurie','Johnson','USCGC Vang FPO AP 56687',1,8796.69,'1977-06-05',5,39),(13,'Travis','Hall','2059 Luna Station Apt. 510 Mackenzieport, MS 52557',0,8000.62,'1911-11-18',1,11),(14,'Jeffery','Huerta','55656 Cervantes Mill Suite 318 South Charles, ME 31514',0,9533.43,'1913-09-27',10,NULL),(15,'Billy','Burgess','PSC 2992, Box 6868 APO AA 85914',0,7256.32,'1933-07-10',9,57),(16,'David','Banks','1461 Andrew Forge West Hollyborough, AZ 80614',0,5339.61,'1910-01-06',6,32),(17,'Craig','Romero','9834 Flores Creek Lake Amberport, WY 83580',1,5415.90,'1989-02-09',10,14),(18,'Melanie','Martin','4166 Andrew Junction Apt. 293 New Tabithatown, UT 11154',1,9019.89,'2013-11-17',4,9),(19,'Eric','Burke','8188 Cole Cove Greenestad, NE 30592',0,1262.59,'1906-11-25',9,57),(20,'Sherri','Mitchell','6398 Hannah View Apt. 849 South Austinborough, NC 77582',0,6541.90,'1992-06-22',2,91),(21,'Ebony','Dodson','6486 David Throughway Suite 317 Nolanburgh, RI 19956',1,5235.82,'1926-10-13',5,35),(22,'Karen','Peters','4867 Villa Manor Apt. 442 Port Larrychester, UT 64415',0,1815.91,'1938-12-11',5,35),(23,'Amy','Madden','6726 Schroeder Keys Apt. 185 Jeremyborough, MO 07089',1,6306.36,'1985-12-21',2,27),(24,'Malik','Colon','221 James Turnpike Annechester, VA 28635',1,8532.16,'1994-06-02',8,98),(25,'Martha','Parks','5873 Justin Ramp Apt. 222 Walshbury, WI 59966',0,4119.52,'1996-09-12',5,12),(26,'Christine','Hunter','8683 Allison Land Suite 631 Andrewsmouth, VT 16582',0,9978.66,'1925-10-21',7,NULL),(27,'Karen','Martin','79852 Nixon Mountain Lesliestad, IA 93787',0,7365.62,'1967-06-19',2,58),(28,'Stephen','Mitchell','935 Jermaine Row Curtistown, MI 34007',0,6922.83,'1983-08-20',10,14),(29,'Michele','Miller','8672 Scott Rapid Lake Alex, SD 51125',1,2228.68,'1950-02-12',1,11),(30,'Michael','King','36961 Jack Views Apt. 784 New Andreview, SD 44454',1,2134.39,'1942-07-09',5,35),(31,'Lisa','Smith','PSC 5457, Box 1261 APO AA 70894',1,4537.50,'1981-07-28',8,24),(32,'Angel','Hull','481 Olivia Forges Jefferyport, PA 35675',1,9774.22,'2008-07-09',6,NULL),(33,'Matthew','Schmidt','629 Romero Circle Andresport, MD 91152',1,5729.23,'1947-05-26',5,12),(34,'Stephanie','Mccann','0600 Michael Fort Deanfort, PA 45719',1,4955.37,'1972-12-29',7,60),(35,'Jacob','Snow','81868 Kristine Manors Apt. 760 East Robinville, NE 37183',0,9773.57,'1943-06-21',5,39),(36,'Sean','Merritt','08533 Troy Manors Apt. 499 East Matthewmouth, WA 31907',0,4356.30,'1920-11-08',4,18),(37,'Todd','Gonzalez','131 Cummings Forge Suite 945 Port Emilyborough, MO 75515',0,5538.09,'2006-03-05',4,10),(38,'Shannon','Russell','782 Rodriguez Cape Apt. 087 East Aaron, UT 22572',0,6444.43,'1923-01-07',3,99),(39,'Jacqueline','Stephens','0373 Keith Rapid Apt. 826 Port Lisa, IA 71857',0,9912.19,'2011-10-12',5,NULL),(40,'Jennifer','Patterson','3654 Evans Locks Suite 607 East Diane, MT 62064',0,7511.73,'1926-08-25',5,35),(41,'Betty','Crawford','7746 Amanda Curve North Nicoleport, PA 38926',0,5580.15,'1968-05-18',8,54),(42,'Jared','Scott','09640 Davis Passage Apt. 181 Garciabury, TX 05873',0,1965.58,'2011-12-18',10,17),(43,'Eileen','Baker','3095 Veronica Ways Apt. 334 South Gregory, MO 61800',0,7579.10,'1948-10-26',3,99),(44,'Ronald','Chandler','407 Bethany Flat East Andreamouth, PA 54196',1,3733.52,'2002-09-16',7,84),(45,'Victor','Vega','518 Riddle Land Suite 707 Lake Benjamin, CT 21369',0,5503.95,'1944-07-20',8,24),(46,'Robert','Blake','4304 Joseph Port Lake Janetfurt, NH 03916',0,1337.11,'1954-05-02',8,24),(47,'Anthony','Reed','912 Brown Walk Apt. 942 West Donaldstad, OH 02702',0,3985.44,'1926-03-30',2,27),(48,'Tiffany','Hopkins','842 Kimberly Roads Apt. 011 Matthewside, NY 38318',0,8618.36,'1908-06-30',4,18),(49,'Mary','Perez','5102 Weaver Place Apt. 664 Lake James, CO 34335',0,4268.29,'1985-09-01',3,85),(50,'Nicole','Davis','24375 Alyssa Lodge Apt. 600 Blackburnshire, NV 28742',0,2292.17,'1946-06-09',3,85),(51,'Shirley','Rose','0236 Glenn Passage Apt. 091 New Jeffrey, VA 10237',1,1877.37,'1966-11-22',5,35),(52,'William','Nguyen','0101 Stevens Lights Apt. 331 Lawsonmouth, AK 78263',0,2388.27,'2018-04-28',5,35),(53,'Paul','Salinas','36712 Jill Lake Lake Megan, ID 94960',0,6740.06,'1997-02-12',8,24),(54,'Christopher','Stewart','87415 Noah Ranch New Bernardtown, GA 31450',0,8905.21,'2009-01-07',8,98),(55,'Steven','Bell','50618 Sarah Alley Port Roger, MI 91584',1,1662.91,'1911-12-16',4,18),(56,'Sandra','Sherman','285 Alice Divide Suite 323 Lake Johnmouth, NM 86781',0,8564.07,'1958-06-01',1,11),(57,'Paul','Brandt','18031 Fisher Bridge East Edwardhaven, NC 45581',1,9528.51,'2003-10-20',9,61),(58,'Robert','Smith','376 Scott Vista West Laura, OR 19897',0,9057.62,'1956-03-15',2,NULL),(59,'Kelli','Pierce','190 Kelly Center Apt. 212 West Robertborough, AK 09528',1,5298.40,'1966-06-28',2,91),(60,'Michelle','Stokes','069 Gamble Heights North Jonathan, AR 36786',0,9933.09,'2011-11-18',7,26),(61,'Adam','Lee','596 Hutchinson Route Kimmouth, MI 53568',1,9806.87,'1987-02-28',9,NULL),(62,'Angela','Perez','99591 Wilson Rapids Apt. 558 Markborough, OH 99519',0,1562.30,'1908-07-13',1,68),(63,'Grant','Dixon','3034 Sanchez Plains Suite 103 Port John, MT 11073',0,6525.85,'1994-09-02',6,32),(64,'Maria','Benson','810 Keith Passage South Maryhaven, VA 43813',0,5731.56,'1993-06-21',5,12),(65,'Jasmine','Carroll','USNV Moreno FPO AP 95788',1,5723.88,'1951-08-12',5,12),(66,'Raymond','Gibson','1030 Moon Rue Nancymouth, KS 13939',0,5259.87,'2019-11-02',7,60),(67,'Alicia','Miller','144 Penny Center Apt. 642 Port Joshuaport, OR 06234',0,1883.68,'1977-04-28',2,27),(68,'Andrea','Hoover','08456 Gardner Corners Davidchester, DC 85237',0,9419.52,'1927-08-20',1,90),(69,'David','Davis','87441 James Meadow Craigville, WV 67659',1,5991.18,'2015-11-18',5,35),(70,'Jacqueline','Smith','98141 James Rest Apt. 899 Ruthport, SD 68501',1,2693.23,'1961-11-06',4,10),(71,'Tristan','Vasquez','388 John Lights Suite 224 South Felicia, TX 71121',1,7679.60,'2001-04-20',3,85),(72,'Sean','Ellis','1490 Kelly Radial Apt. 940 New Jerryshire, MN 39608',0,4429.28,'1987-09-10',2,91),(73,'Christopher','Hobbs','2201 Bishop Ville Apt. 744 West Charles, NH 18595',1,8076.34,'1930-06-01',9,61),(74,'Dennis','Berry','2892 Perez Drive Lake Debrafort, GA 34436',1,3878.92,'1910-06-03',8,54),(75,'David','Adams','4554 James Orchard Suite 594 Larrystad, CO 99130',0,8917.47,'1908-02-18',3,NULL),(76,'Alec','Brown','6974 Wallace View Suite 007 Staffordside, NV 21219',1,8608.15,'2002-12-25',1,11),(77,'Scott','Salazar','221 Thompson Mews Apt. 388 Jayfurt, NJ 12761',1,4162.25,'2013-10-25',8,24),(78,'Allison','Morales','874 Brooks Turnpike West Brianton, AR 47568',1,5022.84,'1918-10-05',1,11),(79,'Samuel','Estes','642 James Crest South Walter, NE 13117',0,7321.14,'1939-01-17',8,24),(80,'Jody','Perez','4670 Jimenez Lake Apt. 711 Owenmouth, CT 13450',0,5160.19,'1921-06-26',8,54),(81,'Erica','Figueroa','825 Angela Spurs Apt. 926 Port Jamie, MD 60048',1,6944.25,'1951-11-22',5,12),(82,'Lauren','Williams','4043 Stanley Viaduct West Danielle, IN 96513',1,2764.76,'1946-03-17',5,35),(83,'Roy','Reyes','554 Connie Alley Suite 885 New Christine, LA 48536',1,7148.83,'1951-03-30',3,99),(84,'Katie','Hansen','6126 Baker Summit West Robert, DE 34049',0,5596.39,'2015-04-23',7,26),(85,'Caitlyn','Norman','2798 Ashley Pine North Bethanytown, OR 92978',0,8618.05,'1918-05-21',3,75),(86,'Sandra','Mccullough','1392 Oliver Square Suite 594 New Karenville, NY 83497',1,7609.05,'1935-06-16',1,68),(87,'Anthony','Harris','933 Floyd Ferry Suite 148 Danielville, DC 74607',1,7668.54,'1938-05-23',4,10),(88,'Shelly','Grant','476 Jamie Circles Apt. 683 North William, NV 75582',1,1794.79,'1949-05-06',9,73),(89,'Rachel','Ramos','09699 Patricia Curve Larsenmouth, MA 58462',1,2530.45,'1919-02-05',8,24),(90,'Melanie','Baxter','70425 Madison Fall Apt. 137 New Richardburgh, MT 73948',1,9667.82,'1930-12-24',1,NULL),(91,'Melissa','Anderson','USS Estrada FPO AP 58964',1,6874.44,'1955-09-08',2,58),(92,'Alan','Lewis','0928 Deborah Station Apt. 158 Saraberg, NY 13999',0,2243.80,'1989-04-04',8,24),(93,'April','Williams','319 Louis Lock New Alexanderborough, RI 52172',0,6710.89,'1952-04-25',4,10),(94,'Connie','Rivera','622 Yvette Highway Maryfurt, CT 62605',1,1851.36,'1968-12-07',7,60),(95,'Peter','Kramer','96307 Catherine Mountain North Stephanie, FL 04396',1,4771.07,'1981-01-12',1,11),(96,'Robert','Edwards','60841 Lisa Fields Apt. 416 North Thomas, CT 74025',0,6782.84,'1936-02-26',1,11),(97,'David','Fritz','16901 Gonzalez Rest Apt. 513 Robertfort, KS 45580',1,6897.74,'1977-09-15',3,85),(98,'Valerie','Nguyen','718 Barrett Roads Apt. 713 North Mackenzieville, NE 65726',1,8961.75,'1952-03-10',8,NULL),(99,'Zachary','Lopez','982 Smith Port Apt. 166 East Tracy, ND 56864',0,8763.63,'1964-05-05',3,75),(100,'Cheyenne','Garcia','51276 Tara Knoll South Billyberg, OH 89970',0,3836.28,'1941-10-04',2,27);
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
INSERT INTO `PROJETO` VALUES (1,'Carro autônomo',5,'Santiago'),(2,'Vacina covid-19',10,'Montevideu'),(3,'Automação residencial',9,'São Paulo'),(4,'Colônia em Marte',1,'Buenos Aires'),(5,'Supercomputador quântico',2,'Buenos Aires'),(6,'Drone subacuático',4,'Montevideu'),(7,'HAL 9000',3,'Buenos Aires'),(8,'Skynet',6,'São Paulo');
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
INSERT INTO `TRABALHA_EM` VALUES (1,6,20),(2,5,14),(3,6,4),(6,4,14),(9,6,40),(10,6,14),(11,4,40),(12,1,20),(13,4,14),(14,2,40),(15,3,14),(16,8,8),(17,2,14),(18,6,20),(19,3,8),(20,5,8),(21,1,20),(22,1,4),(23,5,4),(25,1,20),(27,5,40),(28,2,4),(29,4,40),(30,1,40),(32,8,14),(33,1,20),(35,1,4),(36,6,4),(37,6,40),(38,7,4),(39,1,40),(40,1,8),(42,2,40),(43,7,14),(47,5,20),(48,6,8),(49,7,14),(50,7,20),(51,1,4),(52,1,14),(55,6,20),(56,4,20),(57,3,8),(58,5,20),(59,5,14),(61,3,20),(62,4,14),(63,8,20),(64,1,20),(65,1,40),(67,5,20),(68,4,14),(69,1,4),(70,6,40),(71,7,40),(72,5,20),(73,3,8),(75,7,14),(76,4,40),(78,4,20),(81,1,40),(82,1,4),(83,7,14),(85,7,14),(86,4,40),(87,6,14),(88,3,20),(90,4,40),(91,5,4),(93,6,14),(95,4,20),(96,4,40),(97,7,14),(99,7,40),(100,5,14);
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

-- Dump completed on 2020-03-28 19:44:52
