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
INSERT INTO `departamento` VALUES (1,'Logística',82,'2020-01-01'),(2,'Marketing',11,'2020-01-01'),(3,'Ventas',58,'2020-01-01'),(4,'RH',96,'2020-01-01'),(5,'Engenharia',67,'2020-01-01'),(6,'Informática',12,'2020-01-01'),(7,'Financeiro',22,'2020-01-01'),(8,'Segurança',20,'2020-01-01'),(9,'Manutenção',24,'2020-01-01'),(10,'Produção',87,'2020-01-01');
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
INSERT INTO `dependente` VALUES (1,'Tiffany Anderson','1933-08-27',1,'conjuge'),(4,'Michelle Clarke','1932-10-27',0,'filho/a'),(5,'Kimberly Barnett','2016-04-15',0,'conjuge'),(6,'Brian Williams','1909-01-16',1,'conjuge'),(8,'Christopher Ball','1961-12-05',1,'filho/a'),(10,'Tammy Glover','1905-11-21',1,'filho/a'),(14,'Maria Newman','1934-06-13',0,'outro'),(20,'Amber Hinton','1918-10-02',1,'outro'),(23,'David Wang','1950-05-09',0,'filho/a'),(27,'Michael Cuevas','2017-08-31',0,'outro'),(28,'Melissa Taylor','1918-08-22',0,'filho/a'),(29,'Sierra Howell','1928-12-08',1,'outro'),(31,'George Atkins','1949-07-13',1,'conjuge'),(33,'Andrew Schmidt','1956-05-15',0,'outro'),(34,'Tony Bishop','1998-04-03',1,'filho/a'),(35,'Dana Chen','1929-07-03',0,'outro'),(38,'Joseph Kim','2014-01-15',0,'filho/a'),(39,'David Chandler','2014-12-12',0,'filho/a'),(40,'Samantha Hill','1976-07-16',0,'conjuge'),(46,'Kenneth Ortega','1943-09-01',1,'conjuge'),(49,'Nicholas Hamilton','1943-01-07',1,'filho/a'),(50,'Matthew Douglas','1908-12-01',0,'conjuge'),(53,'Paige Lawrence','1955-11-05',0,'conjuge'),(54,'Sarah Russell','1956-10-27',0,'outro'),(55,'Matthew Gibbs','1939-02-05',0,'filho/a'),(56,'Wesley Johnson','1990-10-26',0,'conjuge'),(57,'Eric Martinez','1995-09-07',1,'filho/a'),(58,'Adrian Valdez','1955-07-01',0,'outro'),(61,'Jason Brown','1909-12-01',0,'conjuge'),(64,'Debbie Nelson','1938-03-15',0,'outro'),(70,'Jeanette Burch','1999-09-16',1,'outro'),(74,'Ricardo Fletcher','1918-08-13',0,'conjuge'),(75,'Kelly Rubio','1985-07-17',0,'conjuge'),(76,'Travis Clay','1970-02-23',0,'conjuge'),(81,'Nicholas Gonzalez','1904-09-20',1,'conjuge'),(82,'Allison Lester','2003-09-09',1,'outro'),(83,'Brittany Mitchell','1926-06-24',1,'conjuge'),(84,'Tonya Boyle','1957-06-13',0,'outro'),(85,'David Flores','1962-02-05',1,'conjuge'),(86,'Dakota Dunn','2012-04-22',0,'outro'),(87,'Elizabeth Flores','1979-01-29',0,'conjuge'),(88,'Daniel Hill','1930-08-02',1,'conjuge'),(89,'Richard Mcintosh','1929-04-21',1,'outro'),(90,'Hannah Conley','1995-06-27',0,'conjuge'),(94,'Tabitha Baker','2003-01-24',1,'conjuge'),(95,'Gregory James','1985-09-30',0,'outro'),(97,'Jessica Lewis','1960-11-10',1,'outro'),(98,'Ashley Rivera','2015-02-25',1,'outro'),(99,'Justin Diaz','1943-07-17',0,'conjuge'),(100,'Alexander Holmes','1995-04-13',0,'outro');
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
INSERT INTO `funcionario` VALUES (1,'Kimberly','Sullivan','519 Madison Walk East Carolburgh, NV 20398',0,4325.45,'2003-05-06',8,20),(2,'Lisa','Richardson','880 Martha Estate Brandonview, VA 23283',0,2909.50,'1961-03-06',1,19),(3,'Elizabeth','Murray','672 Green Road Apt. 059 East Teresa, ME 59111',0,8936.24,'2002-08-20',8,20),(4,'Kimberly','Brown','75165 Anthony Flat Apt. 772 East Kevin, MT 41196',1,7985.01,'1952-08-16',3,58),(5,'James','Johnson','376 Adams Keys Goldenbury, IL 47212',1,4551.49,'1952-07-21',10,53),(6,'Joshua','Sanchez','USNV Lopez FPO AA 90295',0,7597.22,'2012-02-10',7,81),(7,'Brittany','Sharp','USCGC Simmons FPO AE 06078',1,7118.12,'1933-08-26',6,48),(8,'Brian','Blair','14049 Fuller Stream Apt. 478 Brookschester, CT 82460',1,2249.65,'1992-01-08',8,1),(9,'Stephanie','Allen','27594 Andrews Mountains South Jeffreyfort, WA 78993',1,1643.41,'1992-09-15',5,25),(10,'Julia','Gutierrez','981 Steven Ford Apt. 356 Heatherfurt, MO 17863',1,2803.73,'2011-03-26',6,70),(11,'Kevin','Morrow','8421 Walsh Green Apt. 969 North Alfredtown, IN 36823',1,8869.06,'2007-04-28',2,NULL),(12,'Scott','Perez','066 Kristen Fort Christopherton, LA 03804',0,8141.81,'1989-12-06',6,NULL),(13,'Lauren','Allen','PSC 6997, Box 7475 APO AP 31873',0,5307.44,'1917-11-28',3,4),(14,'Angela','Bell','633 Douglas Street North Brittany, TX 25883',0,1511.11,'1905-04-01',10,53),(15,'Sherri','Jordan','3605 Baker Trafficway Suite 929 Lake Michael, MO 65075',0,3538.55,'1940-02-02',4,96),(16,'Samantha','Barr','243 Taylor Stream Alexisstad, NV 32411',0,5528.41,'1907-11-03',1,95),(17,'Mary','Hopkins','97046 Ronald Views Wernerberg, VA 23222',1,2897.95,'1950-01-11',6,70),(18,'Emily','Macias','53301 Berg Coves Apt. 689 North Margaretview, SD 81261',0,1225.66,'1935-04-14',6,48),(19,'Austin','Jones','3359 Vickie Hill Wuberg, OK 59430',1,8985.32,'2014-04-10',1,82),(20,'Christina','Maxwell','49736 Douglas Drives Santoshaven, SD 27135',1,9539.24,'1970-08-17',8,NULL),(21,'Diane','Gallagher','89245 Brandy Heights Suite 617 Jessicaland, CA 30828',0,5695.27,'1976-10-02',6,70),(22,'Michael','Russell','5754 Stewart Lake Apt. 143 Davisview, AL 04176',1,9675.71,'1982-11-12',7,NULL),(23,'Angela','Shannon','723 Byrd Mills Suite 634 West Edward, SC 27195',0,6761.55,'1957-12-01',3,64),(24,'Lisa','Jackson','49529 Johnson Vista Apt. 469 Petersontown, IL 25549',1,9835.16,'1938-05-01',9,NULL),(25,'Randall','Miller','0736 Anna Ville Melissatown, MA 89251',1,5544.63,'2000-10-28',5,67),(26,'David','White','PSC 5957, Box 6589 APO AE 23939',1,1899.85,'2017-03-06',5,32),(27,'Evan','Montoya','403 Larson Greens Apt. 917 East Kristine, MN 90196',0,4791.70,'2019-06-09',7,81),(28,'Kelly','Dixon','964 Rodgers Camp Suite 520 Blackburnview, OK 57178',1,7208.35,'2019-09-12',2,11),(29,'Tommy','Porter','546 Kline Spring Suite 654 East Gregoryton, AR 54779',1,3276.91,'1913-01-04',7,31),(30,'Melissa','Harmon','0555 Owens Spur Apt. 022 New Laura, GA 10812',1,4738.97,'1980-05-15',3,4),(31,'Andrea','Haynes','600 Rachel Forks Apt. 686 Moranshire, NE 22157',1,7727.52,'1911-10-28',7,22),(32,'Donald','Carlson','84674 Charles Centers Suite 929 Erinton, VT 25766',1,5069.61,'1948-08-29',5,67),(33,'Kari','Robbins','89242 Jenkins Bypass Apt. 573 New Staceyton, WI 44924',0,8331.76,'1952-11-01',10,37),(34,'Ryan','Baker','71414 Tracey Bridge New Jason, NY 26172',0,2433.56,'1974-04-12',3,4),(35,'Amanda','Burgess','839 Patricia Turnpike Suite 927 Jeremyberg, IL 13776',1,1177.28,'1929-01-02',10,37),(36,'Keith','Arroyo','285 Williams Stravenue Diazton, SC 89470',0,2128.41,'1937-04-25',5,32),(37,'Christopher','Hernandez','99026 Dean Port Ochoamouth, KY 62396',0,9182.22,'1916-06-20',10,87),(38,'Sarah','Taylor','56189 Miranda Walks New Barbara, OK 03157',0,2806.31,'1948-01-07',5,32),(39,'Gary','Baker','7644 James Plains Suite 245 Batesshire, NJ 80228',0,3383.25,'1962-07-07',2,42),(40,'Jennifer','Cunningham','6342 Michael Turnpike Suite 437 New Michelle, WA 97450',1,3315.69,'1928-12-20',3,64),(41,'Michael','York','USCGC Raymond FPO AE 39770',0,6111.04,'1915-03-03',7,81),(42,'Glen','Phillips','061 William Park Jennashire, NC 65264',1,7499.46,'1986-01-04',2,11),(43,'Zachary','Miller','901 Louis Isle Port Matthew, AZ 97475',0,6196.15,'1981-11-17',3,64),(44,'Jose','Bauer','195 Simpson Cliffs Apt. 375 Paulbury, DE 29164',1,3666.40,'1916-04-23',5,32),(45,'Robert','Oneill','USS Vaughn FPO AA 14995',1,5857.09,'1959-05-14',10,37),(46,'Danielle','Santiago','220 Fry Motorway Rachelshire, KS 13274',1,1804.16,'1954-03-24',8,1),(47,'Melinda','Webb','633 Alicia Courts Jeromemouth, NM 83552',1,8797.61,'1998-08-09',10,53),(48,'Elizabeth','Baker','844 Kelly Ridge Apt. 657 Toddview, KS 71994',0,7881.99,'2014-10-17',6,12),(49,'Allison','Taylor','44037 Kim Plains Suite 013 Pierceton, CT 06424',1,1275.33,'1988-12-25',2,28),(50,'Karen','Haynes','16879 Wallace Freeway Suite 649 Brownville, AR 96864',0,6677.20,'1950-10-17',7,31),(51,'Travis','Robbins','USS Anderson FPO AP 44830',1,3146.67,'1986-09-07',1,95),(52,'Monica','Sanchez','492 Morales Shoal Lake Penny, IN 24157',0,4784.31,'1933-07-24',10,37),(53,'Brittany','Wagner','USNV Fox FPO AE 44964',1,8977.63,'1999-08-31',10,87),(54,'Douglas','Thomas','028 Anthony Roads Jerrymouth, MO 89624',1,3928.86,'1979-10-27',8,1),(55,'Daniel','Keller','PSC 0160, Box 2099 APO AP 70769',0,1113.70,'1989-11-17',3,4),(56,'Crystal','Williams','32701 Pacheco Knoll East Brittany, TX 40901',0,5825.78,'1996-07-19',3,4),(57,'Anna','Harmon','18074 Tyrone Manors East Ericland, OR 93778',0,3361.67,'1957-02-09',7,31),(58,'Krystal','Cortez','04535 Cochran Drive Suite 670 East Rachel, VA 42255',1,8537.48,'2009-10-27',3,NULL),(59,'Dawn','Warner','83773 Andrew Neck Apt. 205 Webstermouth, DC 92461',1,1330.53,'2017-12-26',2,42),(60,'Theresa','Key','443 Jones Vista East Coreymouth, RI 05262',1,3198.35,'1955-10-18',7,81),(61,'Kenneth','Butler','14291 Young Greens South Stevenport, LA 06026',0,3166.48,'1960-12-11',1,19),(62,'Stephen','Villegas','USNV Howell FPO AA 88025',1,4110.61,'1991-11-11',2,28),(63,'Daniel','Hardy','2708 Lewis Skyway North Melissafurt, TN 44287',1,1623.26,'1941-06-14',2,42),(64,'Eric','Graves','2106 Powell Skyway Suite 801 North Stephanieside, NE 63765',0,7964.59,'1906-08-12',3,58),(65,'Shelley','Lee','150 Zachary Street Boyerburgh, RI 82297',1,5964.99,'1919-02-27',6,70),(66,'Ashley','Lopez','8453 Joshua Port Andrewview, DE 26286',0,2533.61,'2008-07-21',10,53),(67,'Michele','Powers','PSC 5564, Box 6143 APO AA 28269',1,6324.95,'1936-03-03',5,NULL),(68,'Christina','Dennis','371 Richard Hills Suite 255 South Stevenmouth, OR 35247',1,4017.76,'1904-11-18',3,64),(69,'Lisa','Kennedy','6420 Diana Drives Lake Reneeville, SD 59970',1,1586.25,'1982-05-05',3,4),(70,'Guy','Kerr','036 Laura Square Apt. 546 East Melissa, WA 01511',0,7955.82,'1907-08-04',6,12),(71,'Marcia','Knight','123 Underwood Walk West Catherine, RI 57968',1,7022.85,'1918-12-02',3,4),(72,'Nancy','Garrett','5269 James Mill South Jacobborough, IA 48923',0,6584.50,'1996-11-19',9,24),(73,'Eileen','Turner','69286 Adams Trail Jennifertown, OH 60694',1,1389.35,'2019-09-03',5,25),(74,'Cindy','Giles','97458 Teresa River Lake Sonya, DC 28556',0,1058.10,'1913-06-26',2,42),(75,'Tonya','Mathews','116 Sandra Passage South Stephanie, IA 79285',1,1483.68,'1992-12-06',5,25),(76,'Megan','Burns','USCGC Hernandez FPO AP 98306',0,1126.22,'1908-02-14',8,1),(77,'Mark','Hall','9035 David Plains Apt. 320 Foxland, HI 53123',1,3037.57,'1988-03-23',6,48),(78,'Jennifer','Williams','7424 Amy Junction Suite 963 Lewischester, ID 18293',1,4918.90,'1977-01-01',6,48),(79,'Casey','Ellis','37166 James Mountains Lake Vincentton, WA 20507',0,1609.17,'1952-06-29',6,48),(80,'Richard','Stokes','997 Brown Spurs Apt. 303 West David, HI 32039',1,4367.57,'1911-12-14',7,81),(81,'Ashley','Wallace','23624 Audrey Village South Michaelview, NY 69164',1,8942.05,'1940-03-04',7,22),(82,'Steven','Lester','98305 Paula Highway Crosbyborough, NH 42843',1,9885.30,'1999-06-04',1,NULL),(83,'Albert','Franco','1820 Dennis Pine Apt. 689 New Timothyhaven, NC 01023',0,6597.38,'1957-04-14',3,64),(84,'Amanda','Wade','7034 Natasha Gateway Suite 889 Williamsburgh, PA 24914',1,5761.23,'1912-01-04',4,96),(85,'Patrick','Phillips','008 Angela Avenue Apt. 179 New Sergio, KY 34716',1,2872.94,'1921-10-18',9,91),(86,'Holly','Lopez','44481 Sullivan Plaza Westberg, MT 99097',0,2790.56,'2015-02-18',8,1),(87,'Jessica','Clark','22499 Christopher Path Suite 643 West Dustin, NV 33123',1,9938.96,'1997-05-24',10,NULL),(88,'Amy','Williams','7089 Smith Lodge Lake William, OR 03809',0,5508.94,'1926-05-02',9,91),(89,'Scott','Brown','4380 Day Manors Apt. 724 East Aaronburgh, WY 94979',0,5492.28,'1918-05-27',2,28),(90,'Denise','Parsons','927 Christopher Fort Suite 189 New Christine, OR 56079',1,5089.34,'1936-12-11',10,53),(91,'Bryan','Hanson','2542 Crawford Harbor Suite 753 North Christopherport, TN 33588',1,7396.97,'1910-08-19',9,24),(92,'Debra','Hernandez','83955 John Coves Suite 758 Johnchester, MA 70988',0,3630.02,'1908-02-16',9,91),(93,'Jessica','Barnett','2312 Sherry Stravenue Suite 030 Westport, PA 02601',1,1506.48,'1910-07-27',5,25),(94,'Mark','Pittman','0076 Tucker Road Kathleenview, CT 61015',1,6544.01,'1997-07-18',1,19),(95,'Ana','White','30721 Reese Pine Suite 570 Port Lori, RI 79516',1,8659.08,'2008-01-06',1,82),(96,'Ashley','Wong','348 Jason Trace Lake Paulmouth, NY 83289',1,8608.40,'1952-03-07',4,NULL),(97,'Michelle','Pacheco','6746 Patricia Passage Suite 697 West Maryside, MO 96086',1,6285.20,'1996-04-21',2,42),(98,'Anita','Martin','82764 Ruth Throughway West Dylanborough, CA 45827',0,1945.57,'1957-01-11',10,37),(99,'Margaret','Brown','5219 Thomas Trace Suite 040 Ortizmouth, MS 39758',0,2479.11,'1958-10-03',6,70),(100,'Rebecca','Macias','47515 Pace Fords West Peter, WA 16324',0,4088.26,'1997-05-02',8,1);
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
INSERT INTO `projeto` VALUES (1,'Carro autônomo',1,'Santiago'),(2,'Vacina covid-19',5,'Salvador'),(3,'Automação residencial',6,'Buenos Aires'),(4,'Colônia em Marte',10,'Santiago'),(5,'Supercomputador quântico',9,'Santiago'),(6,'Drone subacuático',3,'Salvador'),(7,'HAL 9000',2,'São Paulo'),(8,'Skynet',4,'Salvador');
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
INSERT INTO `trabalha_em` VALUES (2,1,40),(4,6,20),(5,4,4),(7,3,14),(9,2,8),(10,3,8),(11,7,8),(12,3,40),(13,6,40),(14,4,8),(15,8,20),(16,1,4),(17,3,20),(18,3,40),(19,1,14),(21,3,14),(23,6,20),(24,5,14),(25,2,14),(26,2,4),(28,7,4),(30,6,20),(32,2,8),(33,4,4),(34,6,14),(35,4,8),(36,2,8),(37,4,20),(38,2,20),(39,7,4),(40,6,8),(42,7,40),(43,6,20),(44,2,40),(45,4,20),(47,4,8),(48,3,40),(49,7,14),(51,1,40),(52,4,8),(53,4,20),(55,6,14),(56,6,14),(58,6,20),(59,7,20),(61,1,40),(62,7,8),(63,7,20),(64,6,4),(65,3,20),(66,4,8),(67,2,4),(68,6,40),(69,6,4),(70,3,4),(71,6,8),(72,5,40),(73,2,4),(74,7,14),(75,2,4),(77,3,4),(78,3,40),(79,3,20),(82,1,8),(83,6,4),(84,8,20),(85,5,4),(87,4,14),(88,5,20),(89,7,4),(90,4,8),(91,5,4),(92,5,4),(93,2,8),(94,1,4),(95,1,8),(96,8,8),(97,7,20),(98,4,40),(99,3,40);
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

-- Dump completed on 2020-03-28 16:07:20
