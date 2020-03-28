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
INSERT INTO `departamento` VALUES (1,'Logística',100,'2020-01-01'),(2,'Marketing',64,'2020-01-01'),(3,'Ventas',70,'2020-01-01'),(4,'RH',44,'2020-01-01'),(5,'Engenharia',31,'2020-01-01'),(6,'Informática',19,'2020-01-01'),(7,'Financeiro',38,'2020-01-01'),(8,'Segurança',93,'2020-01-01'),(9,'Manutenção',77,'2020-01-01'),(10,'Produção',96,'2020-01-01');
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
INSERT INTO `dependente` VALUES (1,'Patricia Wallace','1970-08-23',1,'outro'),(2,'William Henderson','1999-09-23',1,'conjuge'),(3,'Christopher Rodriguez','1969-01-08',1,'outro'),(4,'Veronica Hughes','2003-05-20',1,'outro'),(6,'Sarah Torres','1933-07-11',0,'outro'),(7,'Kelly Miller','1978-07-04',0,'outro'),(8,'Sylvia Hawkins','1960-11-09',0,'outro'),(9,'Craig Williams','1905-06-29',1,'outro'),(11,'Angela Jackson','2000-09-23',0,'conjuge'),(12,'David Stevens','2018-01-01',1,'outro'),(13,'Gregory Andrade','1938-12-06',0,'filho/a'),(15,'Cameron Carey','1968-06-27',1,'conjuge'),(20,'John Newman','1994-11-30',0,'conjuge'),(23,'Brittany Burgess','1975-02-28',1,'conjuge'),(24,'Mary Williams','1955-08-30',0,'outro'),(27,'Elijah Flynn','1942-05-12',0,'filho/a'),(29,'Crystal Hernandez','1981-04-09',0,'conjuge'),(30,'Jonathon Barrera','1947-11-18',1,'conjuge'),(31,'Mary Cruz','2016-12-31',0,'outro'),(36,'Margaret Taylor','1965-06-05',1,'filho/a'),(38,'Stanley Montoya','1932-12-17',0,'filho/a'),(41,'Tina Jones','1916-08-22',1,'conjuge'),(42,'Dawn Chambers','1964-05-29',0,'conjuge'),(44,'Hannah Hunt','1970-05-05',0,'outro'),(45,'Taylor Larson','2014-04-13',0,'filho/a'),(47,'Claudia Martin','1926-10-31',1,'filho/a'),(50,'Michael Garcia','1904-09-19',1,'filho/a'),(56,'Justin Moore','2017-03-05',1,'filho/a'),(58,'Michael Payne','1966-11-25',0,'filho/a'),(66,'Shelly Ayers','1911-07-29',0,'conjuge'),(67,'Drew Short','1996-01-20',0,'filho/a'),(68,'Katherine Paul','2016-07-30',1,'conjuge'),(69,'Thomas Herrera','1912-01-19',1,'conjuge'),(71,'Frances Webb','2009-06-15',0,'conjuge'),(73,'Craig Lewis','1929-01-02',0,'filho/a'),(74,'Stephen Mccall','1984-05-26',0,'outro'),(79,'Scott Mcconnell','1991-03-02',1,'conjuge'),(82,'David Stone','1998-03-06',1,'filho/a'),(83,'Brenda Huffman','1998-04-28',0,'conjuge'),(84,'Warren Santana','1996-05-21',1,'conjuge'),(85,'Keith Hernandez','1975-05-11',1,'filho/a'),(86,'Richard Stewart','1955-03-04',1,'conjuge'),(87,'Dawn Campbell','1909-04-25',1,'conjuge'),(89,'Victor Wells','1912-08-12',0,'outro'),(90,'Keith Cuevas','1951-03-30',0,'outro'),(94,'Rodney Frank','1971-08-13',0,'filho/a'),(95,'Jason Richardson','1932-05-21',0,'filho/a'),(96,'Austin Graham','1982-05-21',1,'outro'),(97,'Ray Powell','1998-11-26',1,'outro'),(100,'Anthony Spencer','2000-12-12',0,'outro');
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
INSERT INTO `funcionario` VALUES (1,'Antonio','Patterson','312 Duran Radial West Daniel, MI 42326',0,6507.71,'2007-09-28',7,NULL),(2,'Gloria','Perez','0603 Kimberly Prairie Sanchezburgh, GA 96822',0,4677.93,'1993-08-23',4,NULL),(3,'Dennis','Patel','63938 Shields Camp Kathleenville, RI 04543',1,3471.74,'1918-01-12',1,NULL),(4,'Michelle','Burns','1159 Melissa Drive Apt. 305 West Cassandraburgh, RI 61593',0,3576.08,'1980-02-02',2,NULL),(5,'Danielle','Williams','04554 Logan Rue Suite 541 North Mark, UT 45172',1,9228.90,'2000-12-09',7,NULL),(6,'Amy','Garza','9235 Andrew Passage Suite 481 Lake Savannahtown, ME 17488',1,1240.44,'2001-11-11',6,NULL),(7,'Theodore','Murphy','01374 Ellis Gardens Lake Katrinaside, KS 92550',0,9579.93,'1936-09-09',10,NULL),(8,'Jeffrey','Simpson','352 Jackson Circle Apt. 950 East Mathew, MS 21992',0,5421.66,'1945-07-28',3,NULL),(9,'Kevin','Ward','6939 Benson Green Rosetown, NC 03315',0,7798.42,'1971-06-02',10,NULL),(10,'Andrew','Hardin','976 Edward Tunnel Matthewview, AK 81621',0,6244.43,'1985-10-03',7,NULL),(11,'Brian','Rivas','663 Olson Ridges Matthewmouth, NM 37048',0,9062.02,'1929-04-19',7,NULL),(12,'Jodi','Yoder','287 Young Parkways Suite 488 North Brooke, OH 35479',0,2409.51,'1976-12-28',3,NULL),(13,'Joseph','Johnson','40490 Seth Green Suite 605 Bellbury, DC 31185',0,2882.82,'1923-05-26',7,NULL),(14,'Stacy','Brooks','0360 Jack Club Apt. 372 South Mackenziefurt, SD 27293',0,7929.39,'1969-04-02',4,NULL),(15,'Jerry','Jones','1178 Douglas Rapid Alexanderfurt, NH 43662',1,3780.06,'1947-03-01',7,NULL),(16,'Matthew','Nguyen','USCGC Livingston FPO AE 01704',1,7787.58,'1930-01-02',2,NULL),(17,'William','Elliott','546 William Junction North Noah, IA 53851',0,6523.28,'1961-09-12',5,NULL),(18,'Teresa','Sanchez','5566 Martinez Extensions Henryfurt, AR 62197',1,1294.43,'1913-03-18',7,NULL),(19,'Drew','Compton','199 Bentley Plaza Port Crystal, MA 38471',1,8656.57,'1968-01-22',6,NULL),(20,'Troy','Holland','47434 Dawn Heights Apt. 762 North Mistyside, NE 32541',0,7106.48,'1978-04-03',2,NULL),(21,'Mike','Cox','863 Ellis Harbor Suite 619 West Brianna, VA 26799',0,2010.25,'1938-10-20',2,NULL),(22,'Darrell','Hall','7385 Gibson Stravenue Lake Laura, NJ 15446',0,8424.89,'1993-04-16',10,NULL),(23,'Elizabeth','Tyler','08979 Turner Glen Apt. 468 East Billy, LA 47551',0,2155.47,'1917-03-10',2,NULL),(24,'Daniel','Moses','Unit 1444 Box 1448 DPO AE 49057',1,3298.17,'2017-12-05',3,NULL),(25,'Kimberly','Jones','727 David Wells East Carolyn, OK 15467',1,6010.11,'1976-03-17',10,NULL),(26,'Justin','Mckenzie','04157 Knapp Curve East James, OR 14135',0,2061.87,'1984-12-30',3,NULL),(27,'Francisco','Martinez','Unit 9462 Box 4044 DPO AE 84824',1,2762.63,'1999-07-20',9,NULL),(28,'Martin','Cooper','372 Waller Viaduct New Biancamouth, VT 16562',1,4921.38,'1967-06-20',7,NULL),(29,'Luis','Jones','423 David Center Suite 775 East Mario, NY 24299',1,6136.94,'1922-10-23',1,NULL),(30,'Miranda','Cunningham','61220 Roman Pike Suite 772 Lake Megan, MA 65911',0,4497.43,'1913-04-08',7,NULL),(31,'Brooke','Hayes','USNV Bernard FPO AP 72004',0,8436.85,'1973-01-14',5,NULL),(32,'Joanna','Miller','780 Paul Gateway Apt. 261 Castroville, LA 41809',1,5796.72,'1960-06-17',7,NULL),(33,'Brenda','Farley','1118 Dominguez Spurs Suite 204 Alexisshire, MN 11483',1,1549.94,'2004-11-27',1,NULL),(34,'Eileen','Jenkins','027 Jessica Field New Jimmyport, UT 25255',1,3428.18,'1934-10-24',1,NULL),(35,'Breanna','Cummings','020 Wheeler Forest Lake Deniseview, KY 25721',0,7028.75,'1920-08-18',8,NULL),(36,'Aaron','Diaz','USNS Lee FPO AE 64780',1,7040.88,'1917-03-07',9,NULL),(37,'Shane','Estrada','294 Angela Row Suite 148 North Jessica, OK 76168',0,8224.16,'1925-03-12',9,NULL),(38,'Melanie','Smith','27573 Stephen Fort Apt. 188 Morrisview, IA 91713',1,9937.31,'1905-05-03',7,NULL),(39,'Stephanie','Barber','86246 Barnes Plains Velazquezchester, KY 28735',0,3545.04,'1905-10-04',5,NULL),(40,'Sara','Long','37867 Lawrence Circles Apt. 558 South Joshua, NH 54969',0,1866.88,'1984-04-28',9,NULL),(41,'Deborah','Gordon','USNS Golden FPO AE 89918',0,8504.30,'2000-07-13',2,NULL),(42,'Madeline','Henry','970 Sutton Crescent Suite 878 Hernandezshire, SD 35266',1,3406.36,'1969-09-14',8,NULL),(43,'Joshua','Johnson','154 Allen Alley Suite 229 Pughtown, IN 96031',0,3516.70,'1919-11-07',3,NULL),(44,'Ryan','Williams','54864 Perry Viaduct Suite 595 Anthonyport, HI 65110',0,9765.05,'1949-07-24',4,NULL),(45,'Jennifer','Tucker','81478 Fitzgerald Flats Kelleyton, KY 17965',0,5551.14,'2002-02-28',9,NULL),(46,'Hector','Garcia','889 Singh Corner Apt. 536 Lake Holly, AZ 20128',1,8020.89,'1904-09-27',8,NULL),(47,'Nathan','Randall','1665 Rios Mission Baileyside, NM 68052',0,4188.37,'1945-08-11',5,NULL),(48,'Jamie','Campbell','1042 Stevenson Island Port Davidmouth, IL 60318',0,7311.15,'1978-06-04',4,NULL),(49,'Brooke','Holden','068 Mcintosh Avenue Dustinport, OR 76718',1,8643.58,'1940-06-30',7,NULL),(50,'William','Hughes','897 Mark Views North Yvonnetown, FL 39427',1,5028.18,'1932-02-03',6,NULL),(51,'Kim','Johnson','99399 Robinson Islands Apt. 672 Thomasfort, IL 65486',1,6306.03,'1988-01-27',3,NULL),(52,'John','Johnson','940 Ibarra Court Suite 017 Stephensmouth, LA 95996',0,1230.43,'1978-08-12',1,NULL),(53,'Sean','Mccarty','99443 Madison Fields Apt. 329 Robertbury, OH 96909',0,1506.94,'1970-05-18',4,NULL),(54,'Monica','Coleman','51220 Melinda Village South Nicholasfurt, MD 93937',0,4928.66,'1904-12-12',8,NULL),(55,'Lauren','Kelly','1417 Grant Shores Apt. 085 Tammyville, AL 58895',0,7004.61,'2002-02-12',2,NULL),(56,'Michelle','Sharp','Unit 3843 Box 2172 DPO AE 55928',1,2473.04,'1985-10-13',4,NULL),(57,'Regina','Martin','67857 Kelley Inlet Suite 494 Port Dominiqueborough, TN 17705',1,1874.21,'1942-11-25',4,NULL),(58,'Valerie','Jones','90287 Ward Burgs North Johnfort, VA 70266',1,2228.14,'1922-05-19',4,NULL),(59,'Caitlin','Hall','52394 Atkinson Villages Jenningstown, PA 61785',0,3249.97,'1939-10-28',5,NULL),(60,'Monica','Bowers','PSC 8247, Box 5048 APO AA 05867',1,4607.24,'1908-03-07',1,NULL),(61,'Jason','White','4550 Francisco Fort New Chad, ME 68308',0,1321.19,'1968-09-15',4,NULL),(62,'Lisa','Richmond','6652 Wong Camp Campbellstad, WV 84884',0,6590.61,'1917-02-15',9,NULL),(63,'Cassandra','Young','79194 Emily Radial Apt. 831 West Lorettamouth, MN 89646',0,4342.50,'1934-12-14',10,NULL),(64,'Paul','Lane','7738 Baker Lakes East Samanthashire, WI 53106',1,9352.04,'2014-04-25',2,NULL),(65,'Andrea','Horne','47014 Walton Throughway Apt. 161 South Bryce, OH 73153',1,8629.50,'1995-09-12',7,NULL),(66,'David','Jones','0865 Bradshaw Skyway Wrightbury, OR 37793',1,2118.18,'1930-09-30',7,NULL),(67,'Blake','Tate','1842 Allison Brook Kristopherhaven, KY 29600',1,6478.72,'1982-05-04',10,NULL),(68,'Marissa','Doyle','0677 Gregory Extensions Jamiemouth, SC 47753',0,6877.18,'1931-07-12',2,NULL),(69,'Brandon','Wheeler','1831 Hernandez Light East Jonathan, GA 24725',1,3389.39,'1950-10-26',5,NULL),(70,'Jessica','Clark','291 Dunn Fall Nancyview, MI 27552',1,9180.49,'1987-02-01',3,NULL),(71,'Gary','Briggs','78093 Megan Oval South Nicholasside, KY 12100',1,7460.70,'1934-09-28',6,NULL),(72,'Nicole','Turner','42251 Trevor Knoll South Markport, OK 70094',1,1516.57,'1994-07-22',8,NULL),(73,'David','Kelly','17920 Robert Manor East Catherineville, NV 95760',0,8887.63,'1920-09-30',4,NULL),(74,'Roy','Rogers','92815 Courtney Streets South Heidishire, NJ 05237',0,4930.94,'1968-11-21',1,NULL),(75,'Brian','Wallace','USNS Crosby FPO AE 98949',1,7805.38,'1985-09-10',3,NULL),(76,'Mariah','Brown','3057 Kimberly Square Suite 471 Michelleborough, CT 16854',0,2519.47,'2003-05-27',4,NULL),(77,'Anthony','Mcguire','49560 Randy Square Suite 189 Katieshire, MD 53132',1,9837.01,'1972-01-17',9,NULL),(78,'Allison','Holt','USCGC Larson FPO AP 93114',0,8889.48,'1922-05-31',3,NULL),(79,'Angela','Garcia','67934 Conway Points Leonardland, KY 96352',1,1991.49,'2007-09-07',2,NULL),(80,'Joseph','Alvarado','397 Hamilton Crossing Apt. 005 Lake Gregside, MO 43254',0,1210.35,'1911-08-29',9,NULL),(81,'Stephen','Lee','60426 Preston Junction Apt. 375 North Elizabeth, NV 95387',1,3138.91,'1965-11-11',3,NULL),(82,'Samantha','Gonzalez','66783 Phillips Heights Port Cynthiaburgh, WY 45549',0,9739.61,'1946-03-10',10,NULL),(83,'Casey','Martin','6688 Howell Freeway Suite 044 Baldwintown, HI 26656',1,4638.28,'2007-04-28',1,NULL),(84,'Alejandro','Anderson','2809 Mccall Mountains Apt. 455 Larryside, AK 24103',1,8483.77,'1940-03-10',4,NULL),(85,'Anita','Snyder','357 Harris Lodge Suite 015 Holmesfurt, WY 36432',1,9838.04,'1956-06-30',10,NULL),(86,'Michael','Lutz','8994 John Rest Suite 630 Jameshaven, WA 87102',1,5919.40,'1923-08-04',5,NULL),(87,'Chris','Wilson','652 Barnes Passage Apt. 259 North James, LA 98309',1,5381.44,'1976-08-27',2,NULL),(88,'Benjamin','Medina','973 Jeffery Hills West Laurieside, NH 01674',1,1107.45,'1958-08-06',7,NULL),(89,'Amanda','Johnson','6063 Brewer Alley Bobbyfurt, DC 81123',0,2944.50,'1947-06-09',9,NULL),(90,'Alex','Guzman','4250 Deleon Camp East Stephanie, LA 14547',1,4625.80,'1965-08-15',4,NULL),(91,'Brian','Webb','7319 Kevin Summit Apt. 843 Codyfort, KS 34561',0,3345.24,'1998-05-25',8,NULL),(92,'Charles','Todd','2934 Vincent Vista Brandonbury, NV 17850',1,2683.43,'1936-03-16',3,NULL),(93,'Jasmine','Smith','32958 Adkins Drive Lake Philip, NY 26321',0,8273.28,'1976-06-27',8,NULL),(94,'Amanda','Monroe','515 Brooks Island Port Amberstad, NH 31379',1,4478.99,'2000-06-09',8,NULL),(95,'Timothy','Davenport','PSC 1531, Box 0511 APO AP 41006',0,2984.40,'2008-11-09',1,NULL),(96,'Calvin','Horn','81499 Sweeney Green New Adriennefort, NV 85120',1,9897.65,'1965-06-25',10,NULL),(97,'Shirley','Stone','94971 Jessica Trace Apt. 134 Leslieborough, ND 61295',0,3105.50,'1968-10-13',7,NULL),(98,'Richard','Harmon','787 Blake Trail Apt. 155 New Emily, FL 79864',1,7360.51,'1953-08-21',9,NULL),(99,'Jerry','Howard','0049 Downs Mountain Burkeview, MN 10570',0,8227.60,'1967-06-29',10,NULL),(100,'Matthew','Thornton','038 Miller Glen Apt. 029 Wallerchester, DC 75466',0,9123.85,'1909-07-01',1,NULL);
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
  `localizacao` varchar(50) DEFAULT NULL,
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
INSERT INTO `projeto` VALUES (1,'Carro autônomo',4,'Santiago'),(2,'Vacina covid-19',7,'Buenos Aires'),(3,'Automação residencial',1,'Buenos Aires'),(4,'Colônia em Marte',6,'Santiago'),(5,'Supercomputador quântico',8,'São Paulo'),(6,'Drone subacuático',2,'Santiago'),(7,'HAL 9000',5,'São Paulo'),(8,'Skynet',9,'Buenos Aires');
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
INSERT INTO `trabalha_em` VALUES (1,2,4),(2,1,14),(3,3,40),(4,6,8),(5,2,40),(6,4,4),(10,2,8),(11,2,20),(13,2,4),(14,1,20),(15,2,8),(16,6,20),(17,7,20),(18,2,8),(19,4,14),(20,6,8),(21,6,4),(23,6,20),(27,8,14),(28,2,4),(29,3,20),(30,2,8),(31,7,8),(32,2,8),(33,3,8),(34,3,4),(35,5,14),(36,8,4),(37,8,8),(38,2,20),(39,7,4),(40,8,20),(41,6,14),(42,5,8),(44,1,4),(45,8,20),(46,5,20),(47,7,8),(48,1,20),(49,2,40),(50,4,4),(52,3,14),(53,1,8),(54,5,4),(55,6,40),(56,1,20),(57,1,8),(58,1,14),(59,7,20),(60,3,14),(61,1,14),(62,8,20),(64,6,4),(65,2,20),(66,2,20),(68,6,8),(69,7,8),(71,4,20),(72,5,4),(73,1,14),(74,3,8),(76,1,4),(77,8,8),(79,6,40),(80,8,14),(83,3,20),(84,1,4),(86,7,40),(87,6,8),(88,2,40),(89,8,8),(90,1,40),(91,5,4),(93,5,14),(94,5,40),(95,3,20),(97,2,8),(98,8,8),(100,3,4);
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

-- Dump completed on 2020-03-28 12:35:41
