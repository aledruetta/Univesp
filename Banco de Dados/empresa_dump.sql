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
INSERT INTO `departamento` VALUES (1,'Logística',7,'2020-01-01'),(2,'Marketing',25,'2020-01-01'),(3,'Ventas',1,'2020-01-01'),(4,'RH',69,'2020-01-01'),(5,'Engenharia',48,'2020-01-01'),(6,'Informática',22,'2020-01-01'),(7,'Financeiro',91,'2020-01-01'),(8,'Segurança',26,'2020-01-01'),(9,'Manutenção',21,'2020-01-01'),(10,'Produção',23,'2020-01-01');
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
INSERT INTO `dependente` VALUES (1,'Natasha Davidson','1993-05-07','N','conjuge'),(2,'Brendan Meyer','2017-08-04','F','conjuge'),(4,'David Gould','1948-06-26','F','filho/a'),(5,'Michael Randolph','2005-01-05','M','outro'),(6,'Elizabeth Howell','1981-08-30','N','conjuge'),(7,'Jennifer Norman','1941-03-02','M','conjuge'),(8,'James Morris','1969-07-02','N','filho/a'),(9,'Gina Robertson','1953-10-21','M','conjuge'),(13,'Kelly Gibbs','1917-08-15','F','outro'),(14,'Shelby Dixon','1996-09-06','M','filho/a'),(17,'Dale Williams','1995-04-17','M','outro'),(20,'Juan Fuller','1929-02-26','M','filho/a'),(23,'Gregory Phillips','1954-05-02','M','conjuge'),(24,'William Brown','1919-12-09','N','conjuge'),(25,'Tara Lynch','2010-11-06','F','conjuge'),(26,'Anthony Graves','1924-12-19','F','outro'),(27,'Frederick Caldwell','1910-10-28','F','outro'),(29,'Lindsey Williams','1906-10-07','N','outro'),(30,'Molly Davis','1981-08-10','F','conjuge'),(31,'Kathleen Anderson','1931-11-22','N','outro'),(32,'Joshua Jones','2019-11-23','M','filho/a'),(34,'Amanda Henry','2018-11-07','N','outro'),(35,'Thomas West','2012-04-06','N','outro'),(39,'Michael Smith','1995-12-04','N','conjuge'),(41,'Anthony Morris','1920-10-23','F','outro'),(42,'Katelyn Wilkinson','2006-08-19','F','outro'),(45,'Philip Morris','1914-07-07','F','outro'),(46,'Kaitlin Deleon','2009-02-14','F','outro'),(47,'Jacob Barrett','2010-05-23','N','outro'),(48,'Joseph Miller','1917-12-27','F','outro'),(50,'Marilyn Holt','1967-03-09','F','conjuge'),(52,'Kara Ramirez','1924-05-19','M','conjuge'),(59,'Beth Bennett','1933-07-06','F','filho/a'),(60,'Mallory Ross','1971-06-14','N','outro'),(63,'Kenneth Roberts','1960-12-25','N','conjuge'),(65,'Fred Miller','1969-12-16','F','filho/a'),(68,'Julie Campbell','1921-09-12','N','conjuge'),(73,'Bryan Ross','1998-08-08','F','conjuge'),(74,'Kayla Bass','1971-06-30','F','conjuge'),(76,'Louis Stevens','1937-11-05','M','conjuge'),(81,'Chelsea Ward','1959-03-13','F','filho/a'),(82,'Glenn Sanchez','1930-07-31','N','outro'),(83,'Stephen Mccoy','1934-11-13','N','filho/a'),(84,'Cynthia Wade','1929-02-10','N','filho/a'),(85,'Barbara Miller','1920-03-14','N','conjuge'),(87,'Kevin Davis','1907-03-02','N','conjuge'),(88,'Daniel Edwards','1958-01-15','M','filho/a'),(91,'Taylor Villanueva','1991-12-05','F','filho/a'),(98,'Abigail Perez','1968-04-27','N','conjuge'),(100,'Robert Ramsey','1918-09-16','M','outro');
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
INSERT INTO `funcionario` VALUES (1,'Morgan','Aguilar','6972 Robert Meadows Nancyville, CA 27371','F',8761,'1980-02-14',3,NULL),(2,'Leah','Rocha','0518 Holmes Lane Paulmouth, CO 05465','N',5475,'2005-10-28',3,NULL),(3,'Debbie','Cox','71883 Monroe Forges Apt. 162 Nicholasside, UT 43858','M',1310,'1960-08-27',7,NULL),(4,'Karen','Davis','811 Porter Terrace Apt. 194 Allisonview, DC 60305','N',8078,'1939-02-18',2,NULL),(5,'Deborah','Hensley','640 Shepard Valleys West Connieview, AZ 90831','F',6566,'1905-12-03',10,NULL),(6,'Thomas','Ryan','87238 Perry Drive South Edwardstad, MI 12082','N',9041,'1918-10-18',1,NULL),(7,'Ann','Patel','23467 Jennifer Fork Apt. 194 Joneshaven, PA 59552','F',9522,'1948-04-16',1,NULL),(8,'Courtney','Blake','8298 Elizabeth Crescent Port Gregorytown, MS 21009','F',3391,'1967-09-01',2,NULL),(9,'David','Mullins','0254 Kirk Common Robinsonmouth, VT 22723','M',4168,'1922-10-03',6,NULL),(10,'Larry','Lewis','02319 Jason Route Apt. 607 North Bettychester, NE 31929','F',5530,'1977-07-19',8,NULL),(11,'Samuel','Moran','77373 Alyssa Course Suite 515 Humphreyview, WY 63350','M',1765,'1948-12-17',2,NULL),(12,'Julie','Goodwin','7173 Miller Fields Johnport, SC 13172','F',4353,'1964-03-22',8,NULL),(13,'Debra','Howell','15241 David Plains Apt. 629 East Stevenbury, IL 18862','F',5649,'1927-01-02',1,NULL),(14,'Julian','Bell','4450 Baird Burgs Suite 703 Amberstad, MI 63745','F',7562,'2007-10-05',8,NULL),(15,'Theodore','Owens','5073 Anthony Squares Apt. 434 Cowanland, NC 69349','F',8415,'1928-08-04',6,NULL),(16,'Lisa','Bailey','7709 Lewis Passage East Diamond, MT 59647','F',4234,'1930-03-15',7,NULL),(17,'Danielle','Osborn','022 Cindy Locks East Shannon, PA 89515','M',9017,'1927-01-02',10,NULL),(18,'Stephanie','Wilson','8663 Hill Park West Ian, TX 28839','F',6388,'2010-10-01',4,NULL),(19,'Leslie','Schultz','0257 Adams Mall Franciscobury, IN 17287','M',7127,'1933-04-22',8,NULL),(20,'Angel','Ruiz','334 Stafford Skyway Suite 333 West William, NY 40680','N',4108,'1920-05-10',9,NULL),(21,'Scott','Diaz','8436 Charles Turnpike Sheilashire, ND 31787','M',9678,'1992-03-08',9,NULL),(22,'Joseph','Villanueva','85658 Yolanda Neck Suite 273 New Arthurbury, WI 47703','M',9785,'1993-04-29',6,NULL),(23,'Brian','Adams','7596 Brewer Circle Saraberg, MI 42809','M',10000,'1975-10-31',10,NULL),(24,'James','Griffin','2447 Timothy Cape North Paula, CA 34534','N',3624,'2016-09-15',3,NULL),(25,'Peter','Smith','19067 Hudson Views South Kendraton, WV 34160','M',9608,'1965-09-04',2,NULL),(26,'Peter','Ford','04296 Samuel Ramp Suite 534 Nguyenstad, CO 76256','M',9150,'1994-02-28',8,NULL),(27,'Howard','Davis','734 Kari Ford South Nicholas, LA 47528','M',7328,'1905-08-01',7,NULL),(28,'Victoria','Keller','329 Jenna Extensions Lake Ericland, UT 27156','N',5458,'1969-04-30',5,NULL),(29,'Diana','Hebert','USNV Harrison FPO AP 38403','M',1009,'1949-01-16',5,NULL),(30,'Andrew','Lewis','61904 Lori Rapid Suite 416 North Micheleshire, NC 85249','N',7790,'2007-05-10',10,NULL),(31,'Billy','Singh','9768 Jeffery Manors Apt. 828 New Victor, UT 73350','N',4589,'2010-05-25',8,NULL),(32,'Renee','Rocha','967 Boyd Green Port Victor, MO 83577','M',1854,'1967-02-19',3,NULL),(33,'David','Carrillo','Unit 7803 Box 5183 DPO AE 16231','N',3145,'1919-04-07',6,NULL),(34,'Kathleen','Tran','150 Brandon Manor Bowersborough, CA 84906','F',7344,'1908-01-15',4,NULL),(35,'Robert','Carey','49083 Johnson Club Alexandriaburgh, OK 14536','M',7493,'1992-11-01',8,NULL),(36,'Laurie','Shaw','8395 Hopkins Harbors Apt. 924 Curtishaven, MT 96186','M',9570,'1979-06-17',6,NULL),(37,'Robert','Koch','41435 Rebecca Road Lake Nicholasview, MN 65371','M',3675,'1938-02-04',9,NULL),(38,'Kathleen','Martinez','683 Marshall Neck Johnsside, MS 05795','M',9715,'1975-05-11',10,NULL),(39,'Richard','Cobb','20904 Bailey Points West Natasha, IN 44361','N',3804,'1958-01-24',1,NULL),(40,'Kyle','Wallace','893 Jones Mountains Donaldside, IL 32932','N',3391,'1947-02-14',2,NULL),(41,'Jeffrey','Mullins','27327 Lucero Green Apt. 529 Lake Jason, IN 83004','N',2261,'1919-05-08',4,NULL),(42,'Tyler','Estrada','720 Wilson Lake East Scott, HI 08250','F',4231,'2013-11-13',2,NULL),(43,'Christy','Buck','Unit 9663 Box 2157 DPO AA 04371','F',5746,'1992-03-02',10,NULL),(44,'Juan','Burton','380 Melissa Coves Apt. 263 Janiceshire, PA 31817','F',9507,'1980-12-24',10,NULL),(45,'Lisa','Strong','539 Molina Terrace North Danaton, TN 69076','F',7180,'2003-12-27',1,NULL),(46,'Jessica','Campbell','41593 Roberts Glens Port Kevinside, ND 09787','N',3496,'1905-10-29',1,NULL),(47,'John','Shaw','850 Catherine Islands Calderonville, UT 41956','M',6067,'1906-11-24',1,NULL),(48,'Maria','Archer','Unit 6138 Box 5579 DPO AE 33171','F',9855,'1997-02-27',5,NULL),(49,'Michael','Mejia','481 Alejandra Plains South Jaredshire, IL 86321','N',9263,'1990-11-16',2,NULL),(50,'Karen','Mitchell','15173 Aguilar Street Hawkinsfort, MI 87506','N',6116,'2008-08-29',7,NULL),(51,'Tracy','Hartman','7184 Rocha Loaf Lake Kimberlyland, KS 75579','F',1676,'1978-04-07',4,NULL),(52,'Cassandra','Hobbs','269 Thompson Freeway Apt. 923 North Andrewbury, NM 35049','M',3627,'1915-12-26',4,NULL),(53,'Amy','Clay','89279 April Passage Hansonburgh, FL 73086','F',7990,'1958-11-26',3,NULL),(54,'Jonathan','Newman','222 Garza Ridge Port Darrell, MD 23857','M',1158,'2002-01-10',10,NULL),(55,'Michele','Patterson','26224 Jones Radial East Jamesport, ME 35041','F',3767,'1962-03-05',8,NULL),(56,'Diana','Martinez','567 Woodward Cape Apt. 816 Mikaylastad, ID 06920','F',8464,'1909-10-24',10,NULL),(57,'Kayla','Wall','91549 Angela Plains North Audreyburgh, NV 07413','N',2385,'1990-12-14',3,NULL),(58,'Dustin','Brown','Unit 0509 Box 0903 DPO AP 62963','N',1569,'1979-11-09',7,NULL),(59,'Darren','Spencer','5646 Mary Lights Gibsonfort, CT 58757','F',7353,'1977-06-28',6,NULL),(60,'Michelle','Gomez','08333 Lauren Route Apt. 928 Lake Anthonyshire, TX 66735','M',3136,'1906-10-15',8,NULL),(61,'Sandra','Velasquez','65687 James Stravenue Heatherburgh, MA 60020','N',7099,'1978-04-04',3,NULL),(62,'Jeffrey','Parks','080 Morgan Circles Apt. 661 New Juliestad, WI 47690','N',5021,'1951-03-03',2,NULL),(63,'Raymond','Williams','436 Anthony Villages Suite 526 Adkinsberg, VA 64930','N',6025,'1950-11-04',1,NULL),(64,'Travis','Miller','552 Murphy Mountains Ashleyfort, MA 11330','F',7994,'1943-04-22',8,NULL),(65,'Mary','Dodson','5318 Ian Falls Suite 126 Ericamouth, NJ 37734','N',5648,'1970-02-20',6,NULL),(66,'Melissa','Kelly','924 Jessica Spring Lake Mary, HI 27929','N',9964,'1962-01-04',10,NULL),(67,'Kimberly','Mcmillan','87426 Timothy Forge Jacobbury, CT 66354','N',2913,'1955-12-16',4,NULL),(68,'Tamara','Gates','45551 Johnston Camp Blakemouth, MD 60647','M',7572,'1970-12-12',1,NULL),(69,'Justin','Hernandez','3483 Peters Path Suite 950 Port Kellimouth, WV 62403','F',9954,'1915-04-10',4,NULL),(70,'Michael','Scott','492 Williams Meadow East Reneeberg, MI 34746','N',2447,'1953-01-29',6,NULL),(71,'Thomas','Bird','69529 Cox Place Apt. 372 Jamesside, TX 91761','N',4834,'1935-12-12',8,NULL),(72,'Jonathan','Frank','1846 Fernandez Springs Suite 443 New Jameshaven, AR 57426','N',1518,'1905-11-27',5,NULL),(73,'Ashley','Rice','Unit 3112 Box 2431 DPO AP 46154','F',8123,'1925-06-17',7,NULL),(74,'Kaitlin','Mcpherson','PSC 8926, Box 7287 APO AP 89560','N',5218,'1934-02-28',1,NULL),(75,'James','Barron','483 Bradley Hollow Toddberg, CT 40558','F',9555,'1921-08-24',4,NULL),(76,'Melissa','Martinez','91103 Page Island Suite 913 West Heather, WY 29305','N',5698,'2004-02-25',4,NULL),(77,'Carl','Bowman','839 Arnold Mountains West Lisamouth, MD 97677','N',8818,'2016-09-17',9,NULL),(78,'Theresa','Jones','09476 Jackson Ways Port Allisonchester, UT 74785','F',8724,'1959-09-17',10,NULL),(79,'Joshua','Franco','59665 Garcia Skyway Apt. 404 South Karenfort, OR 32425','N',2560,'1987-02-27',4,NULL),(80,'Kathryn','Singleton','42776 Keith Dale Suite 836 North Brendashire, CT 64494','M',4295,'1957-02-02',6,NULL),(81,'Krystal','Miller','16529 Stephens Locks Apt. 050 North Heathertown, HI 72364','M',4765,'1992-09-13',3,NULL),(82,'Beth','Reed','5958 Mary Summit Apt. 946 Port Michael, SC 25305','F',1648,'2006-01-11',2,NULL),(83,'Daniel','Chaney','6893 Fox Plaza Huangview, IA 13059','N',2387,'1914-10-08',7,NULL),(84,'Janet','Mahoney','39839 Leslie Mountains Butlerstad, WA 82844','F',1294,'1988-02-22',7,NULL),(85,'Christopher','Cantu','8194 Lopez Forest West Johnathan, MN 33086','M',5222,'1930-03-03',4,NULL),(86,'Stephen','Bray','912 Holmes Ramp New Jane, WY 65582','F',5440,'1935-01-07',9,NULL),(87,'Barry','Smith','33327 Pierce Way West Emily, NH 48356','M',1643,'1976-02-29',10,NULL),(88,'Mark','Galvan','9072 Harrison Loop Port Laurabury, TX 57298','N',8752,'2014-08-10',6,NULL),(89,'Tammy','Smith','10861 Vazquez Plain South Tiffanyside, ND 20756','F',5866,'1912-02-11',9,NULL),(90,'Sarah','Powell','3879 Matthews Haven Franklinville, UT 63508','F',3137,'1959-05-29',5,NULL),(91,'Douglas','Smith','22631 Mills Avenue South Bobby, NH 52992','N',9753,'1923-07-16',7,NULL),(92,'Marissa','Daniels','321 Jones Road South Justinchester, IL 13089','N',1874,'1970-02-27',1,NULL),(93,'Cynthia','Jones','8951 Johnson Terrace Apt. 106 Lake Maureen, MI 28871','N',5408,'1948-07-18',2,NULL),(94,'Thomas','Jensen','944 Hardy Villages Kevinville, MI 51637','N',8019,'1983-06-08',10,NULL),(95,'Robert','Craig','425 Miller Village Suite 453 New Margaretberg, AZ 38103','F',5530,'1926-08-16',5,NULL),(96,'Andrew','Kirk','016 Samuel Locks Charleston, NV 41314','N',3221,'2008-03-21',1,NULL),(97,'Jonathon','Barry','8915 Jason Coves Suite 560 East Elizabeth, AZ 09110','M',5559,'1989-01-19',9,NULL),(98,'Jill','Watson','582 Anthony Course Suite 243 West Benjaminborough, NC 47578','M',3603,'1921-03-18',1,NULL),(99,'Nathaniel','Fox','USS Humphrey FPO AE 67668','F',7248,'2011-06-02',1,NULL),(100,'Andrew','Smith','9458 Nelson Springs Suite 981 East Nicoleton, NH 52333','N',9108,'1988-08-11',8,NULL);
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
INSERT INTO `projeto` VALUES (1,'Carro autônomo',1,NULL),(2,'Vacina covid-19',9,NULL),(3,'Automação residencial',6,NULL),(4,'Colônia em Marte',4,NULL),(5,'Supercomputador quântico',3,NULL),(6,'Drone subacuático',8,NULL),(7,'HAL 9000',7,NULL),(8,'Skynet',2,NULL);
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
INSERT INTO `trabalha_em` VALUES (1,5,40),(2,5,8),(3,7,4),(4,8,14),(6,1,14),(7,1,20),(8,8,14),(9,3,8),(10,6,14),(11,8,14),(12,6,8),(13,1,14),(14,6,40),(15,3,8),(16,7,8),(18,4,8),(19,6,20),(20,2,14),(21,2,20),(22,3,8),(24,5,14),(25,8,4),(26,6,20),(27,7,14),(31,6,14),(32,5,8),(33,3,4),(34,4,8),(35,6,4),(36,3,40),(37,2,8),(39,1,14),(40,8,4),(41,4,4),(42,8,14),(45,1,8),(46,1,40),(47,1,20),(49,8,14),(50,7,20),(51,4,40),(52,4,4),(53,5,40),(55,6,20),(57,5,14),(58,7,40),(59,3,14),(60,6,40),(61,5,20),(62,8,14),(63,1,4),(64,6,4),(65,3,4),(67,4,40),(68,1,14),(69,4,8),(70,3,40),(71,6,40),(73,7,20),(74,1,40),(75,4,14),(76,4,20),(77,2,8),(79,4,4),(80,3,40),(81,5,4),(82,8,40),(83,7,8),(84,7,20),(85,4,8),(86,2,40),(88,3,8),(89,2,8),(91,7,20),(92,1,14),(93,8,14),(96,1,20),(97,2,8),(98,1,8),(99,1,40),(100,6,8);
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

-- Dump completed on 2020-03-24 17:36:33
