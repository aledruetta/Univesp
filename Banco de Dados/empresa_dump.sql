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
INSERT INTO `departamento` VALUES (1,'Logística',79,'2020-01-01'),(2,'Marketing',97,'2020-01-01'),(3,'Ventas',77,'2020-01-01'),(4,'RH',38,'2020-01-01'),(5,'Engenharia',92,'2020-01-01'),(6,'Informática',99,'2020-01-01'),(7,'Financeiro',89,'2020-01-01'),(8,'Segurança',71,'2020-01-01'),(9,'Manutenção',82,'2020-01-01'),(10,'Produção',54,'2020-01-01');
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
  CONSTRAINT `fk_fident_funcionario` FOREIGN KEY (`fident`) REFERENCES `funcionario` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (3,'Donna Martin','2001-03-14',1,'conjuge'),(5,'Sara Dunn','1912-09-27',0,'filho/a'),(8,'David Miller','1991-06-21',0,'outro'),(11,'Joseph Woods','1990-07-20',0,'outro'),(12,'Jamie Calderon','1977-02-16',0,'filho/a'),(13,'Brian Barnes','1975-02-11',0,'conjuge'),(14,'Paul White','1948-04-16',0,'outro'),(15,'Gina Harrison','1914-01-16',1,'outro'),(16,'Darryl Parker','2010-02-05',0,'filho/a'),(19,'Michelle Burns','1926-12-22',1,'filho/a'),(21,'David Joseph','1974-03-12',0,'outro'),(26,'Marc Leon','1991-03-28',1,'conjuge'),(27,'Olivia Blair','1983-04-20',0,'filho/a'),(29,'Rachel Torres','1935-02-08',0,'filho/a'),(30,'Cassandra Hancock','1937-07-02',0,'outro'),(32,'Danielle Garcia','1914-07-13',0,'conjuge'),(33,'Jason Flynn','1914-03-12',0,'conjuge'),(34,'Kenneth Diaz','1918-07-22',0,'conjuge'),(35,'Teresa Cortez','1957-01-02',1,'outro'),(37,'Curtis Strong','1969-03-31',0,'filho/a'),(38,'Charles Hoffman','1981-03-29',0,'outro'),(41,'Rachel Barajas','1972-12-24',0,'filho/a'),(43,'Thomas Sherman','1960-09-18',0,'filho/a'),(44,'Paige Leonard','1936-08-07',1,'outro'),(45,'David Holloway','2004-06-14',1,'outro'),(46,'Cathy Lang','1911-05-04',0,'filho/a'),(47,'Christy Carter','1984-07-16',1,'outro'),(48,'Darius Johnson','1920-03-20',1,'outro'),(53,'Thomas Keller','1961-07-05',0,'outro'),(54,'Benjamin Chang','1961-06-17',1,'conjuge'),(60,'Jeanette Castillo','2016-09-11',1,'outro'),(65,'Misty Dunn','1971-11-05',1,'conjuge'),(67,'Matthew Davis','1962-08-24',1,'filho/a'),(68,'Benjamin Byrd','1943-06-03',0,'filho/a'),(69,'Kimberly Durham','1930-03-20',0,'outro'),(70,'Craig Camacho','1911-11-12',0,'filho/a'),(79,'Cory Mccormick','1919-10-07',0,'conjuge'),(80,'Vanessa Jones','1912-05-19',1,'filho/a'),(82,'Brian Alexander','1969-05-03',0,'outro'),(83,'Anthony Hill','1931-07-13',0,'conjuge'),(84,'Leslie Hansen','1938-12-04',1,'conjuge'),(86,'Michael Ramirez','1912-01-04',1,'filho/a'),(87,'Crystal Saunders','1939-10-26',0,'outro'),(89,'Dana Zimmerman','1934-10-29',1,'outro'),(92,'Nicole Zhang','1959-07-27',1,'filho/a'),(94,'Ashley Brown','1938-07-08',0,'conjuge'),(95,'Emily Jones','1944-01-09',0,'conjuge'),(98,'Suzanne Long','1984-10-11',1,'outro'),(99,'Martha Schneider','1993-03-27',0,'conjuge'),(100,'Heather Salinas','1948-03-23',1,'outro');
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
INSERT INTO `funcionario` VALUES (1,'Raymond','Brown','880 Black Run Suite 529 Port Stephaniemouth, MN 75710',1,8970.05,'1911-06-29',5,NULL),(2,'Brenda','Stewart','2558 Moore Vista Apt. 252 New Allison, AK 05329',1,3152.16,'1999-03-13',10,NULL),(3,'Christina','Roberson','7709 Summers Gateway Suite 623 South Josephton, AR 35223',1,7262.64,'2005-02-22',7,NULL),(4,'Meagan','Murray','306 Edwards Parkway Suite 859 Port Jamesport, OK 35177',0,1867.52,'1918-10-04',9,NULL),(5,'Stephen','Oconnor','8497 Delgado Gateway Gibsonberg, TN 39398',0,6285.36,'1996-08-10',8,NULL),(6,'Jason','Baird','58479 Lori Mountains Suite 323 Triciatown, NC 90885',1,7497.08,'2014-05-17',6,NULL),(7,'Jessica','Copeland','6388 Danielle Courts Lake Tara, MO 62694',1,7752.62,'2016-02-27',7,NULL),(8,'Jennifer','Mcintyre','452 Lewis Turnpike Apt. 507 Diazville, MN 77330',0,8890.08,'1942-06-02',3,NULL),(9,'Nathaniel','Cruz','251 Angela Mill Apt. 758 East Michelle, SC 82236',1,4646.79,'1973-03-04',2,NULL),(10,'Adam','Swanson','621 Debbie Crossroad Apt. 510 Malloryton, LA 13914',0,9643.72,'1991-03-10',9,NULL),(11,'John','Allen','7859 Stephens Terrace Lake Jessicachester, LA 93055',0,9483.58,'1913-03-06',6,NULL),(12,'Michelle','Hernandez','4724 Martin Mission Apt. 697 Alexandershire, IN 06877',0,2937.65,'1933-05-24',10,NULL),(13,'Beth','Smith','48612 West Island Apt. 341 South James, CO 10741',1,6306.77,'1967-05-21',3,NULL),(14,'David','Wilson','42573 Matthew Throughway Apt. 585 East Tammie, VA 11657',1,8323.47,'1946-04-09',6,NULL),(15,'Michael','Baldwin','80068 Theresa Lane Suite 556 East Meredithbury, SC 22621',1,2359.78,'2007-03-01',10,NULL),(16,'Chad','Clark','86189 Flowers Ville Apt. 509 North Kellyburgh, MD 42165',1,1666.40,'1910-03-06',10,NULL),(17,'Ryan','Hall','286 Chambers Courts Apt. 188 Bellstad, MA 49802',1,4470.97,'1939-11-02',1,NULL),(18,'Dawn','Perez','7022 Ashley Terrace Cooperfort, NY 55301',0,6015.83,'1979-08-30',3,NULL),(19,'Monica','Harris','884 Jason Glen North Jeremy, NE 55827',1,3900.23,'1950-03-18',6,NULL),(20,'Lynn','Taylor','074 Mccall Meadows East Kyleshire, MT 34824',0,8560.94,'2019-08-29',8,NULL),(21,'Don','Scott','31905 Patrick Viaduct Apt. 550 Martinburgh, CT 73993',0,7523.07,'1922-07-22',1,NULL),(22,'Jerry','Sanders','68741 Diaz Canyon Apt. 175 Johnhaven, MA 55113',0,1335.51,'1922-01-23',3,NULL),(23,'Pamela','Morgan','5889 Green Views Apt. 386 Chapmanstad, AZ 05536',0,6852.35,'2001-12-28',6,NULL),(24,'Dillon','Schaefer','6163 Anderson Pines Suite 725 Griffithview, NE 49615',1,6870.41,'1944-10-24',10,NULL),(25,'Austin','Evans','764 Villegas Ville North Annaport, CA 76308',0,1454.37,'1993-04-12',3,NULL),(26,'Brenda','Elliott','837 Michael Mountain New Lindsaychester, SD 56710',1,1438.86,'1957-05-05',2,NULL),(27,'Tammy','Bradley','380 Eric Lights Hobbsborough, KY 02091',0,6649.64,'2002-06-16',4,NULL),(28,'Lisa','Lee','7381 Madden Walk Suite 817 Thomasmouth, NY 31516',1,4368.17,'1936-09-06',1,NULL),(29,'Rachel','Anderson','PSC 4912, Box 4364 APO AA 83981',1,1635.46,'2001-08-10',6,NULL),(30,'Kevin','Tran','3832 Latoya Lights Apt. 120 Smithville, OR 64396',0,9726.25,'1964-10-25',9,NULL),(31,'Whitney','Rivera','0762 Watson Fords Moorechester, GA 09431',0,7781.21,'2003-07-01',5,NULL),(32,'Erika','Hamilton','Unit 1210 Box 3418 DPO AE 66322',1,3405.67,'1954-11-26',6,NULL),(33,'Tiffany','Green','271 Stephen Freeway West Elizabeth, OH 74831',0,9092.78,'1953-12-26',5,NULL),(34,'Brianna','Robinson','7872 Robert Extension Suite 507 South Christina, CA 14836',0,2771.27,'1983-05-26',2,NULL),(35,'Tony','Matthews','566 Frederick Estates Williamsville, IN 64661',1,1108.38,'1933-08-26',8,NULL),(36,'Michelle','Mendoza','4081 Young Plains South Williamside, WY 53495',0,6311.10,'2002-02-23',4,NULL),(37,'Jeffery','Bridges','66037 Johnson Lock Suite 059 Jessicaside, UT 87223',1,7929.68,'1931-09-09',8,NULL),(38,'Barbara','Novak','4367 Tiffany Corner Apt. 541 South Cheryltown, MA 05866',0,6895.30,'1950-04-18',4,NULL),(39,'Jason','Jordan','3210 Wagner Mall Suite 513 Farmerport, MO 37025',1,8754.92,'1979-11-10',2,NULL),(40,'David','Mendoza','7722 Moore Underpass Apt. 541 East Lawrenceview, HI 98499',1,2642.67,'1992-04-05',2,NULL),(41,'Danielle','Simpson','37502 Patrick Corners Apt. 473 Tammyshire, ND 09145',0,8776.64,'1920-11-30',6,NULL),(42,'Elizabeth','Garcia','59997 Rodriguez Orchard North Hunterport, MN 20300',0,4896.83,'2012-08-13',5,NULL),(43,'Bradley','Porter','51637 David Lock Suite 454 Jacksonberg, NM 10110',0,9800.14,'1938-05-12',7,NULL),(44,'Robert','Garcia','84638 Bowen Springs Apt. 595 Port Adrianamouth, MS 73240',0,1726.57,'1930-03-24',1,NULL),(45,'Jonathan','Chung','USS Soto FPO AP 62290',0,6590.57,'1965-06-28',4,NULL),(46,'David','Le','851 Daniel Mews Port Rachel, HI 11887',0,7917.41,'2000-12-04',8,NULL),(47,'Nathan','Sullivan','58901 Cox Turnpike New Dustinfort, NM 02764',1,9590.49,'1949-10-20',6,NULL),(48,'Brian','Boyd','041 Johnson Walk Suite 252 Port Williamport, CO 31811',1,3965.24,'1982-06-20',10,NULL),(49,'Robert','Edwards','6402 Kayla Harbor Apt. 298 Jessicaside, NJ 45427',1,1620.15,'1912-11-19',4,NULL),(50,'Jose','Durham','066 Ballard Shores Suite 996 South Codyfort, TN 96192',0,2240.91,'1977-05-19',6,NULL),(51,'Eric','Taylor','68247 Benjamin Streets Apt. 079 Fordbury, CO 76094',1,3691.58,'2009-10-16',4,NULL),(52,'Jacqueline','Roach','3571 Denise Drive Suite 133 Stewartmouth, VA 44426',0,2244.01,'1917-02-27',6,NULL),(53,'Michelle','Smith','5181 Anthony Knolls Port Heathermouth, WY 14928',1,6154.57,'1967-12-06',7,NULL),(54,'Michael','Warren','907 Joseph Freeway West James, NJ 77463',1,8652.58,'1940-08-13',10,NULL),(55,'Joseph','Rosario','006 Ho Islands West Michealshire, AR 42803',1,2515.19,'1959-09-22',1,NULL),(56,'Donald','Moore','19188 Jeanette Ports East Tinaside, DC 21726',0,6189.67,'1928-10-30',10,NULL),(57,'Alexandra','David','1652 Crystal Turnpike Suite 898 Brewermouth, WY 20169',0,5158.34,'1947-08-12',6,NULL),(58,'Andre','Taylor','5983 Evans Mills Richardtown, MN 45121',1,4820.14,'1906-12-30',8,NULL),(59,'Ann','Baldwin','765 Richard Walks South Jennifer, WA 06424',0,7329.30,'1958-01-17',2,NULL),(60,'Paula','Carroll','731 Harris Haven Suite 863 New Brandon, WA 33882',1,4200.01,'1984-08-16',8,NULL),(61,'Mark','Palmer','88216 Elizabeth Forge Suite 533 Whiteheadton, OK 42002',0,1486.06,'1943-06-22',2,NULL),(62,'Lindsey','Moore','PSC 3191, Box 4167 APO AP 05319',0,6061.08,'1908-02-10',10,NULL),(63,'Tanya','Rodriguez','8292 Stacy Path New Kathyton, ND 86457',1,8687.41,'2014-07-22',6,NULL),(64,'Sandra','Mata','6530 Anthony Corner Lake Donton, AZ 86911',0,2156.13,'1944-11-30',10,NULL),(65,'Ashley','Barnes','86606 Hernandez Fall West Luisview, NJ 21264',0,1222.82,'2008-04-25',6,NULL),(66,'Debbie','Garner','79345 Schroeder Manor Kaitlynmouth, WV 18414',1,4511.95,'2014-01-30',9,NULL),(67,'Cassidy','Donaldson','481 Timothy Fords West Wendy, MI 50288',1,1182.79,'1927-09-21',7,NULL),(68,'Randy','King','64300 Campbell Locks Suite 232 Lake Rebecca, NE 68728',1,7077.37,'1944-11-13',7,NULL),(69,'Brandon','Brown','587 Montgomery Lakes Apt. 958 West Ralphport, KS 14930',0,3479.47,'1913-08-02',5,NULL),(70,'Jasmine','Boyle','2671 Christopher Estates Kramerland, NV 20089',0,3026.54,'1984-01-07',4,NULL),(71,'Gina','Lewis','43434 Murray Village Rossbury, GA 89260',1,8692.52,'1934-03-22',8,NULL),(72,'Stacy','Nunez','7894 Tracy Key Suite 114 Jasonborough, NC 05603',1,4234.27,'1993-07-28',3,NULL),(73,'Autumn','Nelson','58308 Brown Manor Williamsbury, OK 15452',0,3576.61,'1922-02-08',5,NULL),(74,'Jesse','Todd','179 Marcus Trace Port Dylantown, ND 75476',0,7411.24,'1974-05-25',10,NULL),(75,'Monica','Gibson','1779 Gutierrez Causeway Lake Wendy, DC 51205',1,6766.35,'1969-11-28',2,NULL),(76,'Robert','Alvarez','0290 Clark Manor Suite 981 Charlesbury, LA 76847',0,9607.29,'1931-02-21',7,NULL),(77,'Kurt','Andersen','689 Oconnell Ridge Stephenburgh, ND 47444',1,9473.09,'1932-10-20',3,NULL),(78,'Edward','Randall','10082 Brown Mission Nixonfort, CA 75586',1,1113.71,'1942-04-13',8,NULL),(79,'Lisa','Green','72972 Danielle Stream Suite 821 Rangelshire, UT 83826',1,9728.80,'1944-06-03',1,NULL),(80,'John','Oliver','893 Fowler Highway West Megan, MA 92310',0,6881.52,'1988-10-02',3,NULL),(81,'Brandon','Hamilton','72323 Thompson Center Suite 068 Brittanytown, SD 92543',1,2357.98,'1925-04-30',4,NULL),(82,'Kelly','Sullivan','134 Nicole Corners Mezaview, IL 85448',0,9744.22,'1912-09-18',9,NULL),(83,'Jeanette','Sanchez','13441 Kyle Crossing Apt. 557 New Charlesmouth, WI 82677',0,1430.44,'1911-06-21',4,NULL),(84,'Sandra','Stone','530 Kemp Extension West Walter, MS 43568',0,5402.69,'1939-02-02',10,NULL),(85,'Walter','Jensen','17459 Spencer Fall Suite 479 North Timothy, ND 35546',0,7670.17,'2004-06-21',10,NULL),(86,'Stephanie','Turner','2361 Scott Ports Warnerberg, WI 98411',0,3905.21,'1936-01-29',4,NULL),(87,'Nathan','Jensen','1667 Wright Street Suite 506 Dennisberg, IN 88855',0,1443.40,'1987-10-15',5,NULL),(88,'Jeanette','Bennett','555 Evans Route Apt. 220 West Jaredbury, VA 03248',1,4997.96,'2014-06-15',1,NULL),(89,'Anne','Pacheco','565 Martin Meadows Suite 826 Terryfort, KY 49465',1,9858.73,'1957-09-15',7,NULL),(90,'Ryan','Porter','340 Kennedy Ports Morrisfurt, MS 93921',1,5799.54,'1950-04-19',1,NULL),(91,'Gabrielle','Vincent','150 Alicia Ford Lake Victoriafurt, AR 66678',0,2135.01,'1980-04-15',5,NULL),(92,'Beth','Kent','62822 Gregory Run Jonesville, MA 30422',1,9125.16,'1939-12-30',5,NULL),(93,'Alexandra','Quinn','646 Maria Plains New Michael, CA 09818',0,7363.61,'1990-05-31',1,NULL),(94,'Martha','Medina','28500 Katherine Hills Richardport, ME 12110',0,9085.98,'1913-03-21',7,NULL),(95,'Catherine','Neal','432 Yvonne Haven Andrewmouth, MN 18001',0,2382.88,'1906-02-22',4,NULL),(96,'Sandra','Johnson','0987 April Avenue Apt. 364 New Jason, MA 64186',1,5619.13,'1939-02-21',5,NULL),(97,'Michael','Washington','6733 Nelson Bypass Suite 905 Simpsonbury, ME 97538',1,9698.82,'2002-10-11',2,NULL),(98,'Catherine','Shaw','96255 Sara Streets Apt. 095 West Lisabury, TN 74942',0,5375.45,'1971-08-27',8,NULL),(99,'James','Ward','083 Kristen Green Suite 856 North Julie, AK 02434',0,9618.75,'1990-10-15',6,NULL),(100,'Donald','Soto','8749 Jackson Square Apt. 227 Benjaminmouth, RI 37230',0,5614.32,'2006-06-02',1,NULL);
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
INSERT INTO `projeto` VALUES (1,'Carro autônomo',7,NULL),(2,'Vacina covid-19',6,NULL),(3,'Automação residencial',9,NULL),(4,'Colônia em Marte',8,NULL),(5,'Supercomputador quântico',5,NULL),(6,'Drone subacuático',3,NULL),(7,'HAL 9000',4,NULL),(8,'Skynet',10,NULL);
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
INSERT INTO `trabalha_em` VALUES (1,5,40),(2,8,40),(3,1,20),(4,3,40),(5,4,14),(6,2,14),(7,1,14),(8,6,8),(10,3,20),(11,2,8),(12,8,4),(13,6,20),(14,2,8),(15,8,4),(16,8,40),(18,6,14),(19,2,4),(20,4,40),(22,6,4),(23,2,8),(24,8,20),(25,6,40),(27,7,8),(29,2,20),(30,3,14),(31,5,8),(32,2,8),(33,5,20),(35,4,20),(36,7,14),(37,4,8),(38,7,40),(41,2,4),(42,5,20),(43,1,8),(45,7,14),(46,4,40),(47,2,20),(48,8,8),(49,7,4),(50,2,20),(51,7,14),(52,2,20),(53,1,8),(54,8,40),(56,8,20),(57,2,8),(58,4,40),(60,4,14),(62,8,4),(63,2,4),(64,8,4),(65,2,14),(66,3,14),(67,1,4),(68,1,4),(69,5,20),(70,7,8),(71,4,20),(72,6,14),(73,5,4),(74,8,4),(76,1,4),(77,6,14),(78,4,4),(80,6,40),(81,7,20),(82,3,14),(83,7,20),(84,8,4),(85,8,4),(86,7,20),(87,5,20),(89,1,40),(91,5,4),(92,5,20),(94,1,20),(95,7,20),(96,5,40),(98,4,4),(99,2,4);
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

-- Dump completed on 2020-03-27 21:03:31
