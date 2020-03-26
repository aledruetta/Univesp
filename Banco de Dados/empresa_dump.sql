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
INSERT INTO `departamento` VALUES (1,'Logística',41,'2020-01-01'),(2,'Marketing',19,'2020-01-01'),(3,'Ventas',95,'2020-01-01'),(4,'RH',30,'2020-01-01'),(5,'Engenharia',47,'2020-01-01'),(6,'Informática',76,'2020-01-01'),(7,'Financeiro',32,'2020-01-01'),(8,'Segurança',10,'2020-01-01'),(9,'Manutenção',93,'2020-01-01'),(10,'Produção',60,'2020-01-01');
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
INSERT INTO `dependente` VALUES (3,'Courtney Torres','1997-05-11','F','conjuge'),(6,'Rachel Sandoval','1931-03-28','N','outro'),(7,'Samuel Stein','1979-05-26','M','outro'),(12,'Jill Perez','1981-05-16','M','filho/a'),(14,'Caitlyn Jones','1955-06-06','N','conjuge'),(15,'Joshua Cummings','1991-01-23','M','outro'),(18,'Travis Phillips','1969-06-07','N','outro'),(20,'Brian Holloway','1950-11-28','F','outro'),(21,'James Jackson','1987-05-28','F','filho/a'),(22,'Fernando Elliott','1915-02-01','M','outro'),(24,'Jill Wilson','2001-02-22','M','outro'),(26,'Michael Barajas','1964-10-05','F','conjuge'),(27,'Alicia Davis','1969-05-27','M','filho/a'),(28,'Cathy Coffey','1989-05-28','N','outro'),(30,'Mary Johnson','1964-08-24','N','outro'),(35,'Tamara Jensen','1933-09-28','M','filho/a'),(38,'Nancy Blackburn','1961-01-08','M','filho/a'),(39,'Donna Valentine','2003-06-17','N','outro'),(40,'Amanda Marshall','1906-10-20','N','filho/a'),(41,'Kenneth Robles','2001-01-26','F','outro'),(42,'Sandra Fowler','2014-05-30','N','filho/a'),(45,'Diana Webb','1943-08-24','F','conjuge'),(48,'Matthew Moore','1987-12-29','F','filho/a'),(49,'Cody Riley','1915-05-02','F','conjuge'),(50,'Paul Walker','1922-01-11','F','filho/a'),(52,'Rebecca Jones','1993-07-14','F','outro'),(53,'Natasha Bryant','1929-04-04','M','filho/a'),(56,'Christopher Davis','1915-10-10','M','filho/a'),(60,'Teresa Li','1929-11-06','M','filho/a'),(61,'Holly Park','2009-11-16','F','filho/a'),(65,'Donald Chen','2004-01-28','M','filho/a'),(67,'Stephen Stewart','1925-04-03','M','filho/a'),(68,'Wendy Johnson','1921-05-25','M','filho/a'),(69,'Wendy Griffin','2016-03-18','F','conjuge'),(72,'Julia Tyler','1929-06-04','F','filho/a'),(75,'Rachel Kelly','1976-02-24','N','filho/a'),(77,'Erin Hughes','1937-12-27','N','outro'),(78,'Timothy Bailey','1949-11-29','F','filho/a'),(79,'Kimberly Cameron','1915-02-27','N','outro'),(80,'Rebecca Dominguez','1969-08-03','M','conjuge'),(82,'Lee Jacobson','2016-01-24','F','conjuge'),(90,'Theresa Conway','1916-10-03','F','conjuge'),(91,'David Harris','1940-11-27','M','filho/a'),(92,'Kenneth Williams','1994-02-15','N','outro'),(93,'Brittany Gordon','1959-12-21','N','conjuge'),(95,'William Garcia','2010-03-12','M','outro'),(96,'Matthew Harvey','1924-01-04','F','outro'),(97,'Sharon Anderson','1969-07-08','F','outro'),(99,'Mark Young','1921-07-18','N','filho/a'),(100,'Anthony Flores','1928-01-08','M','conjuge');
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
INSERT INTO `funcionario` VALUES (1,'Kelly','Miller','9242 Mark Walks Milesmouth, VA 98416','M',7804,'1913-10-23',4,NULL),(2,'Jacqueline','Trujillo','068 Romero Field Latashaberg, AZ 76681','F',6691,'1996-03-17',8,NULL),(3,'Ricardo','Kelley','566 Bryant Land Apt. 727 Jillianstad, MT 40404','M',6817,'1985-03-16',7,NULL),(4,'Jacob','Roman','1954 Winters Rapid Buchananmouth, CO 70525','N',6494,'1928-07-29',3,NULL),(5,'Danielle','Lutz','777 Cynthia Tunnel West Robertmouth, AZ 58765','M',8684,'1980-05-29',10,NULL),(6,'Todd','Garcia','PSC 4242, Box 3566 APO AP 80283','N',3231,'1904-06-29',3,NULL),(7,'James','Mack','9110 Smith Camp Suite 826 Port Nicoleport, MO 50041','N',2368,'2005-11-28',3,NULL),(8,'Penny','Dunn','9057 Cabrera Parkway Suite 258 Byrdmouth, AL 18569','M',6917,'1987-05-21',7,NULL),(9,'Dorothy','Cooper','3173 Bradley Lock Apt. 050 Jamesbury, WY 17075','M',3187,'2014-11-05',7,NULL),(10,'Brittany','Wolfe','78181 Kelly Gardens West Johnbury, OR 33764','N',8755,'1982-01-24',8,NULL),(11,'Maria','Johnson','38335 Patrick Forest Apt. 344 Chenburgh, FL 82620','N',6923,'1918-07-10',8,NULL),(12,'Ann','Lopez','179 Calderon Freeway Apt. 644 North Jeff, MO 29562','F',1372,'1947-01-17',10,NULL),(13,'Troy','Perkins','87343 Julie Well Bowmanside, ME 18844','M',5692,'1906-07-07',6,NULL),(14,'Melissa','Williams','847 Thompson River East Lauren, ND 45411','N',3679,'1936-10-26',6,NULL),(15,'Cheryl','Boyd','235 Williams Mountains West Lindsay, WY 25104','M',9192,'1941-07-01',5,NULL),(16,'Jessica','Diaz','72732 David Mill New Lindsey, AK 55784','N',7341,'1931-08-15',7,NULL),(17,'Justin','Garcia','6286 Sutton Circles Apt. 655 Paulmouth, DC 23090','N',8680,'1990-09-07',2,NULL),(18,'Peggy','Garner','73316 White Island Apt. 932 Lorimouth, WY 61018','N',7543,'2005-12-08',6,NULL),(19,'Mathew','Rogers','608 Duran Cove Apt. 361 North Lisa, MA 91018','F',9701,'1999-05-25',2,NULL),(20,'Ann','Mills','348 Stephanie Creek Apt. 502 West Melissa, MT 36898','N',8441,'1964-01-04',1,NULL),(21,'Lisa','Taylor','Unit 2390 Box 8437 DPO AA 64268','N',1789,'1922-07-30',5,NULL),(22,'Bernard','Hamilton','053 Randall Square Johnsonview, MA 16206','M',2216,'1967-11-27',7,NULL),(23,'Gregory','Jefferson','PSC 9445, Box 0647 APO AE 35579','N',1598,'1997-02-06',4,NULL),(24,'Meredith','Martin','101 Patricia Forks North Jenniferton, NY 01132','N',7210,'1983-12-04',10,NULL),(25,'Amy','Andrews','92362 Baker Well Apt. 279 Bonillabury, MT 96990','F',5385,'2008-11-28',3,NULL),(26,'Roberto','Gonzales','484 Jo Mountain Suite 521 Brownfurt, AR 29791','N',6946,'1977-11-09',4,NULL),(27,'David','Jones','9735 Debra Stream Suite 576 New Michaelchester, TX 15892','N',3745,'1971-01-25',9,NULL),(28,'Heidi','Gibson','1366 James Prairie Apt. 132 North Jennaport, NH 58951','N',1683,'1938-08-15',8,NULL),(29,'Ronald','Jones','32721 Craig Ridge Reyesside, FL 33053','M',5071,'1993-07-23',1,NULL),(30,'Richard','Hester','532 Smith Well Williamton, GA 16185','F',8853,'1940-10-03',4,NULL),(31,'Dave','Ward','PSC 3578, Box 1707 APO AA 28115','F',8724,'1984-12-22',1,NULL),(32,'Christina','Cruz','048 Micheal Ferry Suite 175 Kylechester, MA 50741','N',9009,'1991-08-06',7,NULL),(33,'Gloria','Hull','22074 John Path Suite 703 Davidton, KY 86393','F',2240,'1995-02-14',6,NULL),(34,'Robin','Ford','862 Glenn Drives New Dianamouth, DE 06231','M',7620,'2003-03-15',4,NULL),(35,'Amber','Crosby','601 Green Viaduct Suite 446 East Markton, GA 81639','F',4934,'2007-04-13',2,NULL),(36,'Emily','Lucas','32375 Kenneth Island Ferrellfurt, HI 20720','N',1556,'1989-09-28',10,NULL),(37,'Linda','Brooks','540 Powell Forge West Donnaview, NC 94855','N',7747,'2018-12-06',1,NULL),(38,'Katherine','Jensen','89817 Susan Forge Suite 743 Port Michelle, OH 34721','F',8787,'2002-06-19',9,NULL),(39,'Holly','Morrison','82249 Smith Hill East Carrie, UT 98520','F',2477,'1921-01-07',6,NULL),(40,'Jennifer','Brown','441 Jackson Freeway Apt. 310 Lauraview, NC 69682','N',8885,'1961-09-11',9,NULL),(41,'David','Wilcox','USNV Crawford FPO AA 44197','F',9957,'1904-05-07',1,NULL),(42,'Alexis','Wilson','1815 John Wall Port Jason, WI 16999','N',2118,'1918-12-30',6,NULL),(43,'Shelby','Matthews','4216 Jessica Rapid Suite 093 Meyerschester, ID 52727','M',9789,'1906-09-30',9,NULL),(44,'Benjamin','Glover','PSC 8891, Box 4550 APO AA 82181','N',3677,'1989-05-18',10,NULL),(45,'Nathaniel','Coleman','387 Alex Parks Wardhaven, ID 08557','N',8920,'1941-05-06',1,NULL),(46,'Lisa','Villanueva','971 Weber Path Suite 914 Stoutview, LA 68394','M',4246,'2012-03-18',2,NULL),(47,'Thomas','Johnson','47563 Taylor Freeway Apt. 340 Peterville, NJ 51027','F',9663,'1998-04-02',5,NULL),(48,'Robin','Cantrell','PSC 1404, Box 2645 APO AP 21426','F',1068,'1925-12-19',5,NULL),(49,'Jane','Wilkerson','USS Mcgrath FPO AP 00949','M',3486,'2008-04-27',2,NULL),(50,'Emma','Patton','6313 Kelli Vista Maryburgh, TN 14112','N',5198,'1923-09-23',3,NULL),(51,'Jenna','Reyes','USNS Garrison FPO AA 92638','N',6278,'1991-03-15',5,NULL),(52,'Blake','Coleman','032 Angela Land Vazquezberg, SC 53047','M',3434,'1961-07-26',5,NULL),(53,'Lisa','Ross','68547 Jose Estates Suite 426 Lake Adambury, CA 22229','F',4723,'1912-01-25',9,NULL),(54,'Veronica','Woods','9889 Joseph Lodge Parkport, OH 74575','F',6789,'1917-07-27',10,NULL),(55,'Michael','Harris','USNS Black FPO AP 81445','M',8956,'1950-09-10',2,NULL),(56,'Richard','Adams','5369 Mark Shores Suite 163 New Lisashire, WY 55887','N',4501,'1910-04-04',9,NULL),(57,'Scott','Huang','0736 Janice Ridge Suite 562 Port Jasonmouth, CT 87671','M',8149,'1982-06-13',4,NULL),(58,'Lauren','Mcdaniel','892 Bautista Trafficway Apt. 691 New Jacksonview, AK 35653','F',3681,'1922-10-15',10,NULL),(59,'Rebecca','Ramos','22559 Scott Avenue West Brittanyside, AK 48592','F',8718,'1955-07-31',5,NULL),(60,'Betty','Rivera','98692 Colon Drive North Andrewchester, NV 86613','N',9612,'1923-12-09',10,NULL),(61,'Courtney','Galloway','4353 Ryan Point Brianview, DE 25757','M',2145,'1928-08-02',9,NULL),(62,'Crystal','Solomon','396 Gibson Landing West Maria, FL 66792','N',7096,'1922-08-21',1,NULL),(63,'Shannon','Baker','93330 Ortiz Camp North Jackiestad, UT 42420','F',3377,'1942-06-21',6,NULL),(64,'Denise','Williams','7559 William Island Lake James, VA 65223','M',7614,'1947-06-17',9,NULL),(65,'Tamara','Sellers','8386 Davis Port Suite 407 West Steven, TX 11541','M',7659,'1991-10-01',2,NULL),(66,'William','Rogers','3552 William Crest Apt. 769 North Marthatown, WA 93601','N',3010,'1912-09-18',3,NULL),(67,'Renee','Hawkins','006 Ricky Dale Suite 729 Port Melindaburgh, WA 06287','F',2356,'2013-04-14',6,NULL),(68,'Shane','Gates','82010 Perez Harbor Savageton, WI 13498','F',9678,'1986-04-12',2,NULL),(69,'Kelly','Williams','39286 James Tunnel Suite 075 Blackhaven, TN 37843','N',4030,'1973-11-14',5,NULL),(70,'Kevin','Cross','4627 Watkins Courts Suite 726 Johnsonville, MS 38610','N',5451,'1953-09-30',8,NULL),(71,'Mark','Anderson','4311 Conner Highway Apt. 877 Ashleyport, IL 19813','N',7821,'1974-12-08',2,NULL),(72,'Jeffrey','Schmitt','08575 Johnson Squares Davidsonmouth, LA 76950','F',5662,'1954-08-14',6,NULL),(73,'Jacob','Olsen','98625 Ronald Camp Nicholaston, MO 61320','N',2698,'1967-09-27',2,NULL),(74,'Antonio','Duke','10237 Serrano Mall East Tamarabury, OK 98201','F',4421,'1931-01-25',2,NULL),(75,'Mary','Campbell','3022 Lopez Shores Apt. 452 Spencerfort, CA 33663','M',1884,'1983-04-23',4,NULL),(76,'Matthew','Gonzalez','7994 Trevor Pike South Kevinside, NE 80412','M',9033,'1937-03-19',6,NULL),(77,'Matthew','Marsh','54857 James Knolls Suite 549 Taylorburgh, IL 96097','F',6990,'1949-07-19',1,NULL),(78,'Jessica','Turner','8762 Jeremy Mews Suite 897 Connerville, NH 98902','N',1839,'1906-08-10',7,NULL),(79,'Dawn','Brown','836 Andrea Crescent East Scott, IA 02936','N',4458,'1940-05-21',7,NULL),(80,'Sarah','Beck','4845 Richard Rue Apt. 802 West Davidbury, VT 14477','F',2378,'1994-02-18',7,NULL),(81,'Craig','Moreno','18336 Michael Valley Apt. 505 Port Jerryton, MI 86846','N',4289,'1929-04-20',2,NULL),(82,'Nicholas','Burns','6879 Emily Crest Apt. 491 Donnaside, WV 49519','F',9006,'1947-12-25',2,NULL),(83,'Monica','Ray','228 Harmon Shores Port Hollyhaven, WA 39913','N',3794,'1931-02-23',2,NULL),(84,'Samantha','White','25557 Jessica Station Howardtown, PA 84104','N',3029,'1978-09-08',7,NULL),(85,'Kenneth','Yang','Unit 8663 Box 9859 DPO AA 67487','M',5212,'1945-04-02',4,NULL),(86,'Michael','Smith','761 Clark Shores Alexanderfort, ND 30786','N',7191,'1942-11-16',6,NULL),(87,'Jacqueline','Rios','040 Christopher Courts Lake Carolstad, LA 90399','N',2938,'1998-04-26',7,NULL),(88,'Colleen','Moreno','1552 Caleb Ways Suite 142 Thomasborough, VT 64758','F',4772,'1939-03-10',9,NULL),(89,'Joseph','Walter','813 Lisa Glens Combston, MT 07215','M',3336,'2004-03-10',3,NULL),(90,'John','Jones','696 Robert Coves Apt. 979 Suzanneshire, TX 72174','N',2119,'1968-12-05',5,NULL),(91,'Kevin','Welch','70689 Peter Circles South Nancyberg, IA 34960','N',4976,'2009-09-15',3,NULL),(92,'Larry','Wyatt','095 Jessica Port Davidhaven, IN 04982','N',9494,'1939-01-24',2,NULL),(93,'Richard','Graham','53443 Lynn Oval North Janethaven, KS 03400','N',9956,'1912-11-27',9,NULL),(94,'Jim','Sanders','78304 Terrence Road Apt. 927 New Catherine, MA 06679','N',6528,'2017-11-24',10,NULL),(95,'William','King','616 Arnold Parks Garnerborough, ID 14906','M',8596,'2019-07-18',3,NULL),(96,'Jessica','Bridges','3922 Berger Lodge West Katherine, CO 67395','M',5453,'1921-04-02',5,NULL),(97,'Susan','Hernandez','3582 Roberts Courts Apt. 153 Lake Mary, NH 15583','N',4587,'1946-12-16',9,NULL),(98,'Ashley','Ramirez','3481 Ballard Islands Debratown, FL 16723','N',4141,'1919-09-24',2,NULL),(99,'Alfred','Clark','868 Nelson Ports Suite 621 West Kristifort, SD 11808','M',3338,'1989-01-17',1,NULL),(100,'John','Lewis','6009 Graham Walk Lake Oscarchester, NH 90721','F',6022,'1989-02-09',5,NULL);
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
INSERT INTO `projeto` VALUES (1,'Carro autônomo',1,NULL),(2,'Vacina covid-19',4,NULL),(3,'Automação residencial',2,NULL),(4,'Colônia em Marte',5,NULL),(5,'Supercomputador quântico',10,NULL),(6,'Drone subacuático',3,NULL),(7,'HAL 9000',9,NULL),(8,'Skynet',6,NULL);
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
INSERT INTO `trabalha_em` VALUES (1,2,20),(4,6,20),(5,5,40),(6,6,20),(7,6,20),(12,5,14),(13,8,8),(14,8,4),(15,4,40),(17,3,4),(18,8,40),(19,3,8),(20,1,20),(21,4,40),(23,2,4),(24,5,20),(25,6,20),(26,2,40),(27,7,4),(29,1,40),(30,2,40),(31,1,4),(33,8,20),(34,2,4),(35,3,8),(36,5,20),(37,1,14),(38,7,20),(39,8,40),(40,7,8),(41,1,4),(42,8,14),(43,7,8),(44,5,8),(45,1,4),(46,3,14),(47,4,4),(48,4,8),(49,3,40),(50,6,14),(51,4,4),(52,4,8),(53,7,40),(54,5,14),(55,3,4),(56,7,4),(57,2,20),(58,5,20),(59,4,8),(60,5,8),(61,7,40),(62,1,4),(63,8,14),(64,7,8),(65,3,8),(66,6,20),(67,8,14),(68,3,14),(69,4,8),(71,3,20),(72,8,4),(73,3,20),(74,3,4),(75,2,8),(76,8,8),(77,1,8),(81,3,40),(82,3,4),(83,3,14),(85,2,14),(86,8,40),(88,7,20),(89,6,14),(90,4,20),(91,6,8),(92,3,8),(93,7,4),(94,5,40),(95,6,20),(96,4,8),(97,7,20),(98,3,14),(99,1,4),(100,4,8);
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

-- Dump completed on 2020-03-26 10:03:54
