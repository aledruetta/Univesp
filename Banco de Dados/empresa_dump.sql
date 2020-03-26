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
INSERT INTO `departamento` VALUES (1,'Logística',24,'2020-01-01'),(2,'Marketing',22,'2020-01-01'),(3,'Ventas',76,'2020-01-01'),(4,'RH',41,'2020-01-01'),(5,'Engenharia',7,'2020-01-01'),(6,'Informática',65,'2020-01-01'),(7,'Financeiro',46,'2020-01-01'),(8,'Segurança',9,'2020-01-01'),(9,'Manutenção',80,'2020-01-01'),(10,'Produção',48,'2020-01-01');
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
INSERT INTO `dependente` VALUES (1,'Ruth Young','1969-08-30','N','filho/a'),(2,'Bradley Reyes','1996-04-17','M','filho/a'),(4,'Dana Strong','1917-02-27','F','outro'),(5,'Justin Miller','1958-12-15','N','filho/a'),(6,'Michael Wilson','1909-02-20','F','filho/a'),(7,'Jessica Yang','1920-01-06','F','filho/a'),(12,'Jamie Parker','1951-01-03','N','filho/a'),(13,'Sara Smith','2010-06-14','M','filho/a'),(14,'Joanne Reynolds','1995-06-03','N','outro'),(19,'John Johnson','1987-07-24','M','outro'),(22,'Stephanie Delacruz','1935-02-13','F','conjuge'),(23,'Mary Gaines','1946-12-13','N','filho/a'),(24,'Candice Taylor','2010-08-04','N','filho/a'),(25,'Charles Berry','1995-09-26','M','conjuge'),(28,'Joshua Shaw','1944-11-24','M','outro'),(29,'Javier Mccormick','2010-11-14','N','filho/a'),(31,'Christopher Mccoy','1976-04-28','F','outro'),(32,'Robert Garcia','1927-04-09','M','outro'),(34,'Breanna Mitchell','1956-08-13','M','conjuge'),(36,'Sarah Arroyo','1986-03-18','M','filho/a'),(39,'Claire Chandler','1934-04-28','M','filho/a'),(40,'Isabella Watson','1966-01-22','F','conjuge'),(42,'Sandra Rollins','1979-04-06','N','outro'),(45,'William Morrison','1982-11-11','F','conjuge'),(46,'Anthony Lozano','1936-10-31','F','outro'),(53,'Nicholas Mann','1958-09-10','M','conjuge'),(55,'Nancy Williamson','2001-07-30','M','filho/a'),(56,'Amy Cook','1997-11-09','F','outro'),(57,'Jeremy Preston','1987-09-22','F','conjuge'),(59,'Ronald Wells','1914-10-28','N','conjuge'),(60,'Angela Swanson','1907-01-09','N','conjuge'),(61,'Samuel Lopez','1997-11-09','M','filho/a'),(62,'Dawn Castro','1922-11-15','M','conjuge'),(63,'Ricardo Garcia','1985-10-09','N','filho/a'),(64,'Jesse Tyler','1969-03-27','N','filho/a'),(65,'Meghan Charles','2003-09-02','M','conjuge'),(68,'Ashley Wilkins','1930-02-21','M','outro'),(69,'Kayla Hernandez','1965-10-05','N','conjuge'),(70,'Melinda Hickman','1950-06-28','M','outro'),(71,'William Chapman','1919-04-16','N','filho/a'),(72,'Danielle Holloway','1904-07-22','M','filho/a'),(75,'Jamie Lin','1939-04-03','N','conjuge'),(79,'David Anderson','1991-07-22','N','conjuge'),(82,'Alexandria Silva','1918-03-07','N','outro'),(84,'Jeffrey Wilkinson','1995-05-25','F','filho/a'),(85,'Sarah Perez','2011-10-10','M','conjuge'),(91,'Rebecca Green','1983-12-20','N','conjuge'),(92,'Katie Carpenter','1974-12-18','F','conjuge'),(97,'Frank Duncan','1926-08-09','F','outro'),(100,'Amanda Fisher','1970-04-22','N','outro');
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
INSERT INTO `funcionario` VALUES (1,'James','Garner','27999 Edwards Dale Suite 790 Kellyburgh, SD 33903','M',9552,'1989-02-23',6,NULL),(2,'Patricia','Munoz','2707 Torres Points Lake Donaldtown, LA 60909','M',3856,'1907-04-28',3,NULL),(3,'Hannah','Thompson','07743 Hurley Coves North Larry, NY 47794','N',5982,'1982-07-23',8,NULL),(4,'Terri','Brown','426 Barber Corners Lake Mark, KS 27688','N',7945,'1991-04-07',1,NULL),(5,'Ernest','Gonzalez','6991 Stacy Court New Crystal, WA 18490','F',7438,'1947-03-27',5,NULL),(6,'Rickey','Patel','489 Keith Coves Scottmouth, WI 57578','N',7843,'2016-09-20',4,NULL),(7,'Thomas','Moreno','255 Greg Ramp Apt. 547 East Ashley, TX 36868','N',9564,'1924-10-30',5,NULL),(8,'Leonard','Thompson','Unit 8750 Box 0377 DPO AE 98286','F',8263,'1951-12-11',5,NULL),(9,'Daniel','Rowe','8230 Christopher Summit New Juanport, VA 43354','N',9243,'1920-04-30',8,NULL),(10,'Austin','Kim','309 Ashley Streets North Morgan, MI 62386','F',6552,'1988-11-28',5,NULL),(11,'Lori','Ellis','89443 Miranda Coves Kathleenland, NJ 45987','M',4778,'1969-12-25',3,NULL),(12,'Lori','Christensen','463 Crystal Courts Apt. 081 North Christinaberg, TN 50257','F',8829,'2015-10-20',1,NULL),(13,'Lisa','George','PSC 1557, Box 2751 APO AP 53438','N',8750,'1970-05-05',1,NULL),(14,'Joseph','Campos','63067 Dennis Circle Apt. 804 Thomasstad, CO 26772','F',1772,'1960-06-02',6,NULL),(15,'Carrie','Jacobs','821 Thompson Crossroad Rickytown, NY 99579','N',2253,'1991-10-06',9,NULL),(16,'Margaret','Anderson','420 Jacob Valley Suite 251 Samanthastad, WA 88006','M',9175,'1990-04-20',8,NULL),(17,'Jamie','Acosta','7132 Howard Meadow Pachecobury, MO 56657','M',4547,'1939-04-15',2,NULL),(18,'Rebecca','Sutton','23628 William Neck Susanmouth, CO 01328','N',5915,'1917-02-25',7,NULL),(19,'Jonathan','Clark','3344 Natasha Mountains Suite 278 North Barbaraview, OR 52277','M',3933,'1983-09-14',1,NULL),(20,'Christopher','Garrett','Unit 5582 Box 0328 DPO AA 37317','M',4371,'1929-06-03',10,NULL),(21,'Melissa','Brown','818 Patterson Pines Suite 521 Travisfort, MN 12446','M',2322,'2014-07-24',10,NULL),(22,'Jacqueline','Walker','144 Schaefer Camp Figueroahaven, IN 52546','M',8912,'1992-07-14',2,NULL),(23,'Carl','Floyd','3402 Brown Meadows Apt. 292 Lake Cheryl, KS 02147','N',8599,'2005-12-11',6,NULL),(24,'Michaela','Cole','2827 Karen Meadows Suite 037 New Williammouth, ID 10994','F',9356,'1953-02-24',1,NULL),(25,'Robert','Bell','PSC 8618, Box 7176 APO AP 16905','N',7904,'1935-05-16',5,NULL),(26,'Steven','Yang','6703 Cardenas Prairie Port David, SD 90782','N',2326,'1945-01-22',2,NULL),(27,'Meghan','Gentry','249 Maureen Mews Suite 104 Kellyburgh, CO 11936','M',7457,'1951-10-27',6,NULL),(28,'Donna','Crawford','60722 Tina Court Nicholemouth, IL 86291','N',9155,'1969-04-17',3,NULL),(29,'James','Decker','6844 Rollins Greens Apt. 335 North Robertton, SC 33160','M',8320,'1929-05-27',8,NULL),(30,'Brian','Weeks','86229 Kathy Knoll Reevesborough, MO 65753','M',8597,'2010-09-09',3,NULL),(31,'Janet','Case','964 Christina Shore Apt. 691 Richardbury, SC 72731','M',8581,'1976-07-03',2,NULL),(32,'Jason','Burgess','00400 Acosta Dale Suite 133 East Eddie, AZ 26735','N',3193,'1982-07-12',6,NULL),(33,'Matthew','Moran','64574 Santiago Path Port Sarahtown, SD 05442','M',6253,'1989-05-24',5,NULL),(34,'Curtis','Smith','85750 Davila Union Suite 611 Dunnhaven, KY 20389','N',2084,'2009-03-01',3,NULL),(35,'Jasmine','Ross','43853 Spencer Shoals Apt. 124 Aliciachester, MD 55655','F',9098,'1909-10-02',6,NULL),(36,'Derrick','Huffman','PSC 1669, Box 8689 APO AP 61703','M',4478,'1957-10-26',6,NULL),(37,'Amber','Jones','31323 Randy Heights Port Danamouth, TX 47220','N',4311,'1911-03-02',7,NULL),(38,'Charles','Gordon','8041 Desiree Track Port James, WI 62977','N',4509,'1936-01-27',4,NULL),(39,'Gina','Decker','Unit 3873 Box 4458 DPO AP 25428','N',6178,'1960-12-13',7,NULL),(40,'Shannon','Patterson','192 Anderson Roads Williamsview, VA 17959','M',6671,'1990-12-11',10,NULL),(41,'Richard','Thompson','20832 Susan Drives Apt. 957 South Sheena, OH 71444','N',8348,'1939-12-26',4,NULL),(42,'Jeremy','Lambert','USCGC Garza FPO AE 37426','N',2550,'1972-03-05',8,NULL),(43,'Theresa','Barnes','1300 Kyle Mills Lloydmouth, AK 33163','F',8693,'1995-05-29',7,NULL),(44,'Wayne','Williams','19184 Wood Circles Apt. 928 North Janice, OK 25696','F',9212,'1928-10-03',6,NULL),(45,'Cassie','Holmes','227 Paul Ville Navarroview, AR 85610','N',9502,'1977-10-19',5,NULL),(46,'Brian','Pearson','073 Franklin Ports West Heathershire, WI 39719','F',9326,'1941-05-10',7,NULL),(47,'Carmen','Wood','370 Jonathan Prairie Suite 414 Leahland, NH 91583','F',4453,'2012-03-27',1,NULL),(48,'Derrick','Cole','2387 Joshua Summit Elliottmouth, RI 06120','N',9961,'2012-10-28',10,NULL),(49,'Cameron','Curry','Unit 6950 Box 9203 DPO AA 02781','N',5774,'1964-07-18',6,NULL),(50,'Olivia','Cline','702 Larson Brook Harrelltown, MI 50745','N',7140,'2003-05-17',6,NULL),(51,'Lauren','Huff','666 Renee Island Suite 199 Coxchester, UT 21661','N',4844,'2011-08-11',4,NULL),(52,'William','Carlson','49053 Andrew Lock North Laurie, GA 41075','N',3224,'1911-04-06',7,NULL),(53,'Lauren','Sparks','20214 Krista Mill Lake Hannahmouth, NJ 20605','M',4697,'1974-11-23',8,NULL),(54,'Theresa','Ochoa','6296 Harper Branch Ethanfurt, OR 39488','F',6749,'1972-08-05',1,NULL),(55,'Nicholas','Griffith','1677 Tara Junction Shawfort, MN 29465','M',8079,'1947-10-18',5,NULL),(56,'Caleb','Hudson','54981 Burns Mews Curryville, MO 03737','M',1765,'1995-06-16',6,NULL),(57,'Jeremy','Lucas','774 Taylor Curve Thompsonstad, HI 42351','M',3406,'1910-08-27',2,NULL),(58,'Gary','Williams','370 Janet Center Suite 038 Lake Marilyn, NM 15367','F',3163,'2014-09-05',5,NULL),(59,'Nancy','Lucero','493 Kelly Mountains Apt. 712 South Alisonhaven, IA 38564','M',9543,'1952-07-21',3,NULL),(60,'Samuel','Rush','898 Miles Crest Suite 932 North Charlenefort, WV 16187','M',4622,'1998-08-20',3,NULL),(61,'Shelley','Salinas','36318 Armstrong Oval Kellyborough, NC 72537','M',6212,'1953-05-16',8,NULL),(62,'Kenneth','Lee','956 Teresa Unions Jeffreyburgh, IA 07507','F',7407,'1985-09-27',10,NULL),(63,'William','Blair','351 Melissa Island Apt. 625 Kevinport, IL 37320','M',7697,'1988-05-28',5,NULL),(64,'Ashley','Fritz','8764 Erin Expressway Riosstad, FL 25878','M',9077,'1922-04-20',7,NULL),(65,'Curtis','Wall','623 Lisa Court Apt. 220 Port Christopher, UT 14781','N',9661,'1933-02-01',6,NULL),(66,'Joseph','Nichols','738 Brandy Club Apt. 466 North Whitneyshire, AR 11772','F',5039,'1987-10-09',1,NULL),(67,'Kristin','Garcia','1856 Diane Keys Angelachester, IN 66899','N',9010,'1918-06-10',1,NULL),(68,'Anita','Cortez','0461 Gonzalez Mission Andrewmouth, SD 01623','M',9657,'2002-04-17',6,NULL),(69,'Joshua','Walton','1034 Smith Plain Apt. 642 Brianside, ND 28259','F',1437,'1951-08-28',4,NULL),(70,'Natalie','Lane','71447 Trevor Harbors Apt. 722 South Elizabeth, CO 74403','N',7265,'1976-11-30',1,NULL),(71,'Vanessa','Cunningham','8367 Ramirez Villages Suite 691 Martinville, LA 59337','M',5690,'1911-07-10',10,NULL),(72,'Kelly','Robinson','925 Kirby Branch Williamsburgh, TN 01006','F',7162,'1923-12-06',2,NULL),(73,'Matthew','Riley','8775 Charles Glens South Chadberg, MS 04466','M',7025,'1964-11-13',2,NULL),(74,'Melanie','Thomas','3120 Kendra Place Apt. 420 Jamesfort, UT 46514','M',7680,'1926-03-12',4,NULL),(75,'Thomas','Blevins','36020 Jacobs Unions Apt. 545 Nathanbury, OK 86595','F',1052,'2014-02-12',10,NULL),(76,'Dennis','Griffin','64597 Patricia Mountain Apt. 355 Rachelside, KS 59525','M',9759,'2002-02-21',3,NULL),(77,'Donald','Crawford','715 Jennifer Mission Schneiderview, NH 82895','N',9285,'1992-05-03',3,NULL),(78,'Katrina','Fernandez','5487 Woodward Cape Suite 805 Stephenberg, NV 30826','M',8506,'1998-04-29',2,NULL),(79,'Cynthia','Ayala','59045 Judy Mountains Port Emily, NM 16550','M',1875,'2005-11-03',2,NULL),(80,'Gary','Hicks','659 Brandon Club South Eddie, NE 78154','F',5914,'1950-07-09',9,NULL),(81,'Sandra','Martinez','67616 Gregory Motorway Dannyberg, CO 88771','N',3917,'1947-03-18',5,NULL),(82,'Jerome','Black','607 Maldonado Neck Suite 795 Port Tinaburgh, MI 63952','N',6717,'1976-03-28',4,NULL),(83,'Jill','Knight','USNV Bell FPO AA 32856','F',3215,'1985-05-28',1,NULL),(84,'Joseph','Martin','16785 Andrew Roads South Johnathanfurt, NH 63252','N',3941,'2008-11-22',4,NULL),(85,'Ashley','Price','8156 Lorraine Cliffs North Tom, KS 03607','M',4687,'2009-06-11',8,NULL),(86,'Sarah','Jackson','2954 Megan Skyway Philipburgh, IA 09936','N',4719,'1958-12-24',1,NULL),(87,'Zachary','Raymond','91125 James Loaf Suite 848 Lake Melissa, MS 17976','M',1226,'1972-10-28',10,NULL),(88,'Wesley','Fields','4632 Wright Center Apt. 047 North Kevin, OH 70788','M',5949,'1907-11-04',8,NULL),(89,'James','Morgan','1447 Donna Land Durhamberg, SC 86209','M',4284,'1911-11-23',5,NULL),(90,'Willie','Hill','7244 Taylor Field Rasmussentown, DE 57819','N',5802,'1964-02-28',10,NULL),(91,'Natalie','Cruz','936 Timothy Circles Suite 408 Port Corey, ME 39001','F',8296,'1936-05-08',2,NULL),(92,'Cynthia','Brown','9167 Gonzalez Falls Lake Jocelyntown, ND 15769','F',5752,'1921-04-30',5,NULL),(93,'Matthew','Zimmerman','99284 Ashley Lane Suite 631 Chapmanhaven, AK 09468','F',3803,'1927-06-26',7,NULL),(94,'Natalie','Travis','Unit 8371 Box 1379 DPO AE 78380','F',3339,'1935-06-16',9,NULL),(95,'Karen','Lucas','67470 Joshua Lake Apt. 234 Port Matthew, UT 57392','M',1441,'1948-01-24',6,NULL),(96,'Tiffany','Garcia','99343 Sarah View Suite 235 Deniseburgh, NE 30170','M',8872,'1976-09-21',8,NULL),(97,'Dalton','Mullins','8327 Mary Roads Jennifershire, RI 93849','F',1697,'1937-07-12',3,NULL),(98,'Alex','Carter','7735 Shane Harbor Lake Christina, DC 16716','N',3710,'2009-05-14',4,NULL),(99,'Tammy','Barrett','USCGC Contreras FPO AA 36057','M',2672,'1928-10-15',9,NULL),(100,'Justin','Burgess','114 Tucker Villages Port Billy, CA 22158','M',5717,'1971-10-30',9,NULL);
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
INSERT INTO `projeto` VALUES (1,'Carro autônomo',9,NULL),(2,'Vacina covid-19',2,NULL),(3,'Automação residencial',10,NULL),(4,'Colônia em Marte',8,NULL),(5,'Supercomputador quântico',6,NULL),(6,'Drone subacuático',3,NULL),(7,'HAL 9000',7,NULL),(8,'Skynet',4,NULL);
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
INSERT INTO `trabalha_em` VALUES (1,5,4),(2,6,8),(3,4,8),(6,8,4),(9,4,4),(11,6,4),(14,5,4),(15,1,20),(16,4,8),(17,2,20),(18,7,8),(20,3,14),(21,3,40),(22,2,20),(23,5,20),(26,2,14),(27,5,20),(28,6,8),(29,4,8),(30,6,40),(31,2,20),(32,5,8),(34,6,40),(35,5,14),(36,5,14),(37,7,20),(38,8,4),(39,7,20),(40,3,8),(41,8,20),(42,4,40),(43,7,4),(44,5,14),(46,7,40),(48,3,4),(49,5,40),(50,5,40),(51,8,14),(52,7,8),(53,4,14),(56,5,4),(57,2,14),(59,6,8),(60,6,20),(61,4,4),(62,3,14),(64,7,40),(65,5,20),(68,5,14),(69,8,8),(71,3,14),(72,2,8),(73,2,8),(74,8,4),(75,3,4),(76,6,20),(77,6,40),(78,2,4),(79,2,8),(80,1,14),(82,8,8),(84,8,8),(85,4,20),(87,3,20),(88,4,40),(90,3,14),(91,2,14),(93,7,4),(94,1,40),(95,5,20),(96,4,8),(97,6,14),(98,8,8),(99,1,14),(100,1,14);
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

-- Dump completed on 2020-03-26 11:01:57
