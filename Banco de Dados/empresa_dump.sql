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
INSERT INTO `departamento` VALUES (1,'Logística',96,'2020-01-01'),(2,'Marketing',73,'2020-01-01'),(3,'Ventas',34,'2020-01-01'),(4,'RH',62,'2020-01-01'),(5,'Engenharia',58,'2020-01-01'),(6,'Informática',75,'2020-01-01'),(7,'Financeiro',51,'2020-01-01'),(8,'Segurança',76,'2020-01-01'),(9,'Manutenção',31,'2020-01-01'),(10,'Produção',66,'2020-01-01');
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
  `sexo` enum('M','F','N') NOT NULL,
  `relacionamento` enum('filho/a','conjuge','outro') NOT NULL,
  PRIMARY KEY (`fident`,`nome`),
  CONSTRAINT `fk_fident_funcionario` FOREIGN KEY (`fident`) REFERENCES `funcionario` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (3,'Joshua Blake','1993-06-29','M','filho/a'),(6,'Lauren Ellis','1996-03-15','N','conjuge'),(7,'Carrie Graves','1977-12-26','F','outro'),(8,'Jessica Hunter','1964-09-08','F','conjuge'),(10,'Lorraine Chaney','1948-06-28','N','conjuge'),(12,'James Stephens','1966-11-25','F','outro'),(13,'Michelle Hernandez','1966-03-28','F','outro'),(14,'Dustin Sullivan','1931-12-30','M','conjuge'),(15,'Sharon Smith','1932-06-29','F','outro'),(17,'David Jones','1934-02-26','M','outro'),(18,'James James','1935-10-17','F','conjuge'),(20,'John Ramos','1965-08-29','M','outro'),(23,'Charles Weber','1926-11-09','M','filho/a'),(26,'Tara Miller','1987-06-11','F','outro'),(28,'Sandra Perry','1933-05-23','F','filho/a'),(29,'Christina Wagner','1939-10-01','M','outro'),(30,'Evelyn Farrell','2009-12-26','F','filho/a'),(31,'Michael Richards','1946-08-22','F','outro'),(34,'Joseph Gonzalez','1950-06-16','F','filho/a'),(36,'Shawn Mason','1988-11-05','M','filho/a'),(37,'Rose Blankenship','1916-09-02','M','conjuge'),(39,'Helen Mora','1983-01-07','N','conjuge'),(42,'Julie Bradley','1949-11-11','M','conjuge'),(45,'Katie Barrett','1986-06-06','N','conjuge'),(48,'Lauren Goodman','2012-04-12','N','filho/a'),(52,'Richard Hansen','1978-07-04','M','conjuge'),(53,'Raymond Parrish','1923-05-30','N','outro'),(55,'Debra Peterson','1973-01-30','M','conjuge'),(56,'Brittany Murphy','1976-01-11','M','outro'),(57,'Michael Valdez','1933-07-25','F','outro'),(63,'Michelle Medina','1965-09-02','N','filho/a'),(64,'Matthew Benjamin','1942-07-10','N','conjuge'),(69,'Ryan Holmes','1907-09-27','M','outro'),(70,'Stephanie Hebert','1946-08-18','M','filho/a'),(71,'Gabriela Leon','1969-02-09','N','filho/a'),(72,'Kim Lane','1995-03-05','M','conjuge'),(73,'Dana Rollins','2012-02-12','N','conjuge'),(74,'Katherine Cox','1957-06-13','M','filho/a'),(75,'Jacqueline Collins','1930-12-02','F','outro'),(82,'Tina Smith','2016-10-18','F','outro'),(85,'Crystal Wilson','2009-05-04','F','outro'),(86,'Anne Aguilar','1905-12-24','M','outro'),(88,'Tammy Gray','1979-04-24','M','conjuge'),(89,'Michael Ortiz','2017-12-18','N','filho/a'),(90,'Robert King','1916-11-02','F','conjuge'),(91,'John Young','2019-08-12','F','conjuge'),(92,'Meagan Young','1976-07-29','N','filho/a'),(93,'Jesse Gonzales','2019-02-17','F','conjuge'),(95,'Erica Smith','2003-11-12','F','conjuge'),(98,'Bryan Thompson','1920-06-17','N','conjuge');
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
  `sexo` enum('M','F','N') NOT NULL,
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
INSERT INTO `funcionario` VALUES (1,'Alexandra','Cooper','5011 Kevin Islands Suite 542 Cassandramouth, NV 72987','F',1341,'1977-08-08',8,NULL),(2,'Bianca','Meyers','114 Murphy Rapids Apt. 317 Deannaview, VA 24230','M',7579,'1969-11-19',9,NULL),(3,'Scott','Sutton','3557 Jacqueline Lake Apt. 526 East Davidmouth, ND 28452','N',3469,'1972-07-12',8,NULL),(4,'Michael','Kane','75725 Latoya Estate Port Ginaborough, DC 01608','M',2196,'2018-05-21',6,NULL),(5,'Ashley','Nelson','25615 Patton Village Davidtown, WV 40255','M',4602,'1965-10-02',5,NULL),(6,'Caitlyn','Webster','302 Lauren Pines Apt. 627 Mejiatown, NE 12924','F',4597,'1954-01-20',10,NULL),(7,'Andrea','Knapp','067 Robert Manor Suite 202 West Amandatown, AR 59180','N',2817,'1971-07-08',2,NULL),(8,'Erin','Scott','720 Williams Field Leefort, AR 84207','N',5741,'1982-11-01',9,NULL),(9,'Jennifer','Munoz','USNV Brown FPO AE 08835','N',2193,'2002-09-28',9,NULL),(10,'Cindy','Mendoza','866 Christopher Harbor Lake Donaldbury, ID 57930','M',7091,'1944-12-09',10,NULL),(11,'Mark','Burgess','Unit 2189 Box 6083 DPO AA 98870','M',3479,'2004-04-13',6,NULL),(12,'Jonathan','Garcia','011 Hughes Crescent Apt. 146 South Sandraville, KS 59192','F',5187,'2019-07-16',9,NULL),(13,'Elizabeth','Shea','87566 Courtney Mall South Ericmouth, TX 34317','M',7331,'1984-07-09',6,NULL),(14,'Justin','Cox','15128 Moody Mill Apt. 932 Amandaburgh, AZ 66019','M',5844,'1992-08-12',6,NULL),(15,'Matthew','Young','66843 Amanda Land Apt. 725 New Dylanton, MO 42664','M',3601,'1996-04-28',5,NULL),(16,'Tony','Jones','606 Catherine Lane Perezburgh, MT 30857','N',6847,'1979-04-25',2,NULL),(17,'Laura','Arnold','00591 Derek Track Apt. 414 Toddberg, AL 60803','N',4943,'1950-02-26',9,NULL),(18,'Steve','Stanton','6731 Byrd Lights East Andrewbury, OK 40337','N',6700,'1905-12-31',6,NULL),(19,'Jennifer','Graves','PSC 2141, Box 0623 APO AP 65814','F',2756,'1942-04-26',1,NULL),(20,'Heather','Moore','143 Owens Groves Apt. 868 Andrewborough, WV 21071','M',7937,'1924-08-11',4,NULL),(21,'Stacey','Ortiz','4968 Matthew Vista West Mary, NJ 29399','N',3260,'1921-05-19',4,NULL),(22,'Danielle','Baker','040 Michael Wells Apt. 143 East Felicia, NV 05006','N',4205,'1904-09-26',3,NULL),(23,'Marissa','Alexander','653 Melissa Corners Port Sarah, WY 45429','M',9002,'1952-10-01',5,NULL),(24,'Randy','Simpson','475 Adam Plain Kennedyhaven, OK 09431','N',8717,'1947-05-04',9,NULL),(25,'Autumn','Gonzalez','754 Brown Station Lake Yolanda, TX 89979','F',5929,'1909-10-30',1,NULL),(26,'Colton','Scott','542 Miller Orchard Tashaberg, VA 30162','M',7333,'1933-10-06',6,NULL),(27,'Edward','Lopez','60815 Moyer Expressway Suite 257 Lake Sherylmouth, FL 85775','N',8770,'1969-08-17',10,NULL),(28,'Melissa','Bailey','627 Makayla Corner Reynoldston, AZ 85472','M',1650,'1954-04-05',1,NULL),(29,'Jennifer','Humphrey','388 Amanda Station Jimenezland, MI 57758','M',4480,'1938-09-23',6,NULL),(30,'Jessica','Mccoy','321 Stephens Points Harrellport, CA 76829','F',3309,'1994-09-27',4,NULL),(31,'Connie','Hernandez','USS Rogers FPO AE 11310','M',9221,'1994-04-25',2,NULL),(32,'William','Kaufman','USNS White FPO AE 08363','M',6781,'2011-01-04',2,NULL),(33,'Shannon','Daniel','047 Don Extensions Apt. 526 Johnsonville, MI 02755','N',1427,'2008-07-23',5,NULL),(34,'Scott','Griffith','409 Chavez Course Suite 140 Stephaniestad, CT 65482','N',9608,'1976-01-02',8,NULL),(35,'Justin','Schroeder','28596 Austin Mews North Morgan, HI 09204','F',5824,'1986-11-29',4,NULL),(36,'Cindy','Wu','849 Sloan Mount Michelleside, NC 78263','F',4137,'1953-07-05',3,NULL),(37,'Susan','Woodard','813 West Stream Apt. 473 Robertborough, MO 27272','M',8148,'1992-08-06',5,NULL),(38,'Cassandra','Hubbard','80406 Dean Freeway Suite 806 Fosterland, IA 80226','N',3186,'1982-02-03',5,NULL),(39,'Joyce','Brown','USS Lewis FPO AA 92227','F',3892,'1975-07-29',6,NULL),(40,'Jodi','Mcbride','USS Waters FPO AA 05331','N',1803,'1905-05-30',4,NULL),(41,'Dawn','Davis','921 Ryan Lane Suite 969 Clintonstad, ME 60967','N',2155,'1905-09-25',7,NULL),(42,'Denise','Alvarez','9087 Fuller Row Suite 335 West Phillipmouth, ID 39062','F',7949,'2011-10-21',1,NULL),(43,'Julia','Lambert','0708 Christopher Vista Apt. 039 North Rhonda, TX 75769','N',2762,'2008-07-04',1,NULL),(44,'Jonathan','Long','639 Thomas Forks Apt. 852 East Richardton, MA 55324','N',1113,'1971-04-13',1,NULL),(45,'Ellen','Gonzalez','PSC 6367, Box 6415 APO AP 06484','M',8036,'2012-12-23',7,NULL),(46,'Phyllis','Collins','490 Melissa Port Suite 506 Port Albert, UT 72331','N',8677,'1936-06-10',7,NULL),(47,'Erin','Davis','52674 Webb Crossing Port Craig, DE 44516','N',7457,'2012-02-20',1,NULL),(48,'John','Moody','1335 Pamela Trail West Candiceport, AK 16093','N',1793,'1962-11-28',2,NULL),(49,'John','Brooks','819 Vicki Oval Apt. 230 Novakhaven, CT 17973','M',5604,'1927-12-10',9,NULL),(50,'Randall','Hoover','166 Nelson Coves New Kaylabury, WV 21807','M',3600,'1944-07-06',3,NULL),(51,'Allison','Martin','PSC 4826, Box 5148 APO AA 65934','M',9419,'1991-04-19',6,NULL),(52,'Matthew','Adkins','85264 Campos Branch Suite 033 West Wayne, NC 99077','N',3028,'2014-09-30',6,NULL),(53,'Christopher','Hall','007 Stephen Alley North Markhaven, ID 46835','F',7549,'1945-06-08',4,NULL),(54,'Rachel','Wilkinson','PSC 5420, Box 9694 APO AP 16947','M',3882,'2000-04-19',2,NULL),(55,'Kenneth','Andersen','0586 Parrish Lakes Apt. 670 Kerrview, WA 88455','F',5889,'1944-04-08',8,NULL),(56,'Jillian','Buckley','606 Shane Rue North Christinaside, GA 35510','F',7882,'1956-06-19',3,NULL),(57,'Kathryn','Huerta','9163 Daniel Summit West Ashleybury, KS 74290','M',8811,'1959-08-15',2,NULL),(58,'Thomas','Knight','81491 Turner Fall Apt. 714 West Jonathan, MS 04424','N',9471,'2014-10-06',6,NULL),(59,'Theresa','Woods','650 Rose Crossing Lopezmouth, VT 10947','M',7726,'1986-01-06',2,NULL),(60,'Joann','Hardy','480 Edward Extension Apt. 136 Adrianaton, OR 16306','N',6340,'1993-12-09',7,NULL),(61,'Kenneth','Yates','477 Ferguson Freeway Katherineberg, AL 61076','M',3167,'2019-08-25',8,NULL),(62,'Vanessa','Lopez','566 Brown Plaza Suite 994 West Alexis, NE 17855','M',9563,'1974-08-31',4,NULL),(63,'Brian','May','6720 Sara Island South Maria, DE 45581','M',1515,'1987-01-26',1,NULL),(64,'Jack','Mcclure','5089 Jeremy Trafficway Cooleymouth, TX 78005','F',8876,'1924-06-14',8,NULL),(65,'Daniel','Lee','016 Juan Pine Suite 486 West Christinamouth, RI 87271','M',2947,'1908-01-25',2,NULL),(66,'Jason','Carr','837 Zamora Common Laneport, WI 69474','F',9061,'1964-01-12',2,NULL),(67,'Keith','Rodriguez','661 Wilson Run North Carlosmouth, ME 94301','F',4202,'1988-07-04',5,NULL),(68,'Amber','Dunn','6017 Bailey Walk South Kristinland, NE 79403','N',8373,'1920-03-08',9,NULL),(69,'Dana','Thompson','6765 John Isle Jamesfurt, TX 32653','F',8469,'1920-02-13',4,NULL),(70,'Alexandra','Carlson','PSC 3379, Box 5905 APO AA 27495','F',5368,'1991-07-02',9,NULL),(71,'Kelsey','Brown','22513 Jeffrey Station Suite 799 Rickstad, WA 96337','F',3664,'1917-08-30',8,NULL),(72,'Karen','Ortiz','159 Scott Land Suite 966 Lisaland, NJ 80155','N',5407,'1922-05-07',10,NULL),(73,'George','Richards','0518 Weaver Well Suite 995 East Stacy, MN 65164','F',9752,'1926-10-21',4,NULL),(74,'Carlos','Perez','7169 Rodriguez Pass Hernandezside, VA 58370','F',1972,'2002-08-16',3,NULL),(75,'Jacob','Pennington','95638 Martinez Meadows Harrisborough, WV 97534','N',9438,'1933-07-03',10,NULL),(76,'Kelsey','Robbins','672 Jill Village Suite 303 Manningland, ME 42696','N',9390,'1963-06-14',9,NULL),(77,'Amber','Hayes','14885 John Trail Apt. 132 Samanthahaven, NY 84818','N',2717,'1908-11-03',10,NULL),(78,'Brittany','Sanchez','934 Ashley Crest Suite 624 Taraville, NH 15475','N',5310,'1951-12-23',10,NULL),(79,'Crystal','Reyes','3079 Connie Street Lake Kristenville, AZ 84413','N',3365,'1963-07-02',5,NULL),(80,'Taylor','Mcclain','5339 Barnes Bridge Suite 641 Manuelhaven, NH 45479','F',3868,'1964-05-20',7,NULL),(81,'Michael','Morales','669 Christian Mission Apt. 547 Nathanstad, ID 44252','F',6055,'1993-11-02',7,NULL),(82,'Shawna','Payne','21973 Aaron Street Jamesmouth, HI 99277','M',2184,'1921-11-17',4,NULL),(83,'Elizabeth','Phelps','1187 King Key Thompsonborough, ME 14437','M',5025,'1904-08-11',9,NULL),(84,'Christopher','Gomez','86137 Williams Plains West Annaton, IL 78153','F',7658,'1914-02-02',10,NULL),(85,'James','Clark','8447 Mark Crossing South Thomas, OK 06843','M',6084,'1906-11-06',10,NULL),(86,'Lynn','Conway','2733 Scott Causeway Suite 777 Marcport, HI 00717','F',3184,'1932-10-02',5,NULL),(87,'David','Day','49478 Callahan Manors Apt. 037 Brianborough, DC 44059','M',7192,'2020-03-14',9,NULL),(88,'Amber','Clark','808 Albert Green Lake John, WY 45741','M',6122,'1982-06-08',8,NULL),(89,'Joshua','Cooper','442 Jonathan Vista Suite 764 Lake Kaylahaven, MT 08340','N',6757,'1940-10-26',7,NULL),(90,'Amy','Sanchez','7443 Brown Wall New Sylvia, AK 26343','N',2214,'1980-11-17',10,NULL),(91,'Victoria','Miller','49879 Emily Mountain Port Anthony, ND 04244','F',1743,'2006-04-21',8,NULL),(92,'Caitlin','Henderson','04967 Franco Curve Suite 816 Gordonfurt, VA 03546','M',3159,'1948-05-14',6,NULL),(93,'Jeremiah','Peterson','361 Clayton Avenue Lake Denise, CT 58006','N',2755,'1926-05-10',2,NULL),(94,'James','Jarvis','PSC 1970, Box 5658 APO AA 91722','M',2852,'1927-09-20',1,NULL),(95,'Steven','Woodard','97928 Garcia Wells New Tammymouth, OH 20795','N',3783,'1956-06-14',8,NULL),(96,'Luis','Davis','851 Destiny Roads North Laura, KY 30498','M',9785,'1982-07-20',3,NULL),(97,'Ricky','Taylor','USS Wallace FPO AA 86950','M',6113,'1935-07-08',10,NULL),(98,'Valerie','Park','34114 Jerome Fork South Debramouth, VT 58987','N',6606,'1986-10-07',5,NULL),(99,'Anita','Durham','49942 Mary Points Lake Kevin, WY 88210','M',4432,'1930-12-09',10,NULL),(100,'Holly','Hoover','283 Tyler Islands Josephmouth, UT 57049','F',1976,'1940-02-09',10,NULL);
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
INSERT INTO `projeto` VALUES (1,'Carro autônomo',3,NULL),(2,'Vacina covid-19',6,NULL),(3,'Automação residencial',8,NULL),(4,'Colônia em Marte',4,NULL),(5,'Supercomputador quântico',2,NULL),(6,'Drone subacuático',10,NULL),(7,'HAL 9000',7,NULL),(8,'Skynet',1,NULL);
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
INSERT INTO `trabalha_em` VALUES (1,3,40),(3,3,40),(4,2,14),(6,6,20),(7,5,8),(10,6,20),(11,2,20),(13,2,14),(14,2,4),(16,5,40),(18,2,40),(19,8,40),(20,4,4),(21,4,8),(22,1,14),(25,8,4),(26,2,20),(27,6,14),(28,8,4),(29,2,20),(30,4,8),(31,5,20),(32,5,14),(34,3,20),(35,4,8),(36,1,20),(39,2,4),(40,4,4),(41,7,4),(42,8,40),(43,8,4),(44,8,14),(45,7,4),(46,7,20),(47,8,4),(48,5,8),(50,1,4),(51,2,14),(52,2,40),(53,4,40),(54,5,14),(55,3,40),(56,1,8),(57,5,20),(58,2,8),(59,5,8),(60,7,20),(61,3,4),(62,4,4),(63,8,14),(64,3,8),(65,5,8),(66,5,20),(69,4,20),(71,3,4),(72,6,8),(73,4,14),(74,1,4),(75,6,4),(77,6,4),(78,6,8),(80,7,8),(81,7,20),(82,4,4),(84,6,4),(85,6,40),(88,3,8),(89,7,8),(90,6,40),(91,3,40),(92,2,14),(93,5,14),(94,8,14),(95,3,14),(96,1,20),(97,6,40),(99,6,14),(100,6,14);
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

-- Dump completed on 2020-03-23 16:10:14
