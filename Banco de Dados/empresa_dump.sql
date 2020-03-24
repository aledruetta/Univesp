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
INSERT INTO `departamento` VALUES (1,'Logística',94,'2020-01-01'),(2,'Marketing',58,'2020-01-01'),(3,'Ventas',16,'2020-01-01'),(4,'RH',3,'2020-01-01'),(5,'Engenharia',76,'2020-01-01'),(6,'Informática',32,'2020-01-01'),(7,'Financeiro',53,'2020-01-01'),(8,'Segurança',9,'2020-01-01'),(9,'Manutenção',67,'2020-01-01'),(10,'Produção',90,'2020-01-01');
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
INSERT INTO `dependente` VALUES (4,'Melanie Santiago','1925-08-08','M','outro'),(7,'Michael Lewis','1933-08-07','F','outro'),(8,'Kelly Ayers','2016-09-06','N','conjuge'),(10,'Jacqueline Jones','1988-05-13','F','filho/a'),(14,'Jason Brown','1948-12-29','M','filho/a'),(15,'Stephen Crane','1947-01-12','M','conjuge'),(17,'Erik Padilla','1915-01-04','M','conjuge'),(21,'Brittany Martin','1915-12-26','F','outro'),(23,'Christopher Riley','1982-02-17','M','filho/a'),(24,'Elaine Wyatt','1996-02-17','F','filho/a'),(29,'Tina Robinson','1957-12-15','M','outro'),(32,'Annette Santiago','2019-02-02','M','outro'),(34,'Michael Ramirez','1922-11-07','N','filho/a'),(35,'Christopher Williams','1975-04-02','M','conjuge'),(36,'Megan Bennett','1999-09-13','M','filho/a'),(40,'Gerald Nichols','1979-06-22','N','outro'),(42,'Anthony Sherman','1924-08-31','F','filho/a'),(43,'Reginald Love','1957-02-05','M','conjuge'),(45,'Michael Johnson','2002-03-27','N','filho/a'),(48,'Joseph Flores','2008-12-06','F','filho/a'),(49,'Dillon Hawkins','1915-06-11','N','conjuge'),(50,'Nathan Fletcher','1946-04-06','M','filho/a'),(51,'Daniel Cooper','1941-11-06','N','outro'),(53,'John Valdez','1955-05-02','F','outro'),(56,'James White','1957-09-28','N','conjuge'),(57,'James Dunlap','1957-08-24','N','filho/a'),(58,'Sandra Reynolds','1914-06-12','F','conjuge'),(59,'Mallory Johns','1925-06-19','N','filho/a'),(61,'Ashley Oneal','1918-08-26','M','outro'),(62,'Jessica Herrera','1941-12-29','F','filho/a'),(65,'Nicole Carroll','1944-09-28','N','filho/a'),(66,'Elizabeth Vaughan','1961-12-02','F','conjuge'),(68,'Jessica Morris','2018-02-11','N','filho/a'),(69,'David Bowen','2019-06-04','N','filho/a'),(72,'Elizabeth Adkins','1934-06-05','M','conjuge'),(74,'Ruben Meadows','1974-10-05','N','filho/a'),(75,'Kristen Griffin','1915-08-01','F','outro'),(76,'Jesse Allen','1970-12-04','N','outro'),(77,'Christian Rodriguez','1911-03-07','M','outro'),(81,'Alan Anderson','1907-03-20','M','filho/a'),(84,'Emily Lambert','1980-03-14','M','conjuge'),(85,'Robin Gross','1928-04-30','F','filho/a'),(86,'Susan Cook','1996-12-18','F','conjuge'),(87,'Trevor Bennett','2005-11-12','F','outro'),(89,'Nathan Anderson','2017-10-24','F','filho/a'),(90,'Annette Wang','1949-05-07','N','outro'),(94,'Hayley Anderson','1927-10-02','M','filho/a'),(95,'Jane Velazquez','2009-12-07','F','conjuge'),(97,'Richard Levy','2007-06-01','F','outro'),(99,'Alexis Williams','1907-07-03','M','filho/a');
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
INSERT INTO `funcionario` VALUES (1,'Nicholas','Thomas','76173 Gray Trail Apt. 937 South Dawnhaven, MS 84657','M',3531,'1967-03-26',9,NULL),(2,'Juan','Abbott','826 Brown Land Suite 654 North Michaelbury, TX 52932','M',2476,'2016-03-11',1,NULL),(3,'John','Lewis','777 Matthew Estates East Aaronborough, WY 52037','N',8365,'1917-10-25',4,NULL),(4,'Daniel','Mata','032 Jamie Trail Suite 837 Nicholasfurt, UT 20689','M',6065,'1973-01-04',10,NULL),(5,'Erica','Walker','0315 Lopez Knolls Apt. 095 Rickybury, DC 04177','M',3680,'1926-11-15',2,NULL),(6,'Diane','Edwards','076 Jackson Trafficway East Codyport, SD 63155','N',2696,'1924-05-24',5,NULL),(7,'Lisa','Tate','PSC 7557, Box 1501 APO AE 92141','N',1711,'1993-09-18',7,NULL),(8,'Terrance','Mora','003 Kathleen Creek Jaimemouth, VA 57200','F',1971,'2012-11-05',1,NULL),(9,'Victoria','Reyes','4544 Reyes Prairie Suite 529 Hernandezfort, VA 51848','M',9772,'1912-08-13',8,NULL),(10,'James','Jones','PSC 5910, Box 3504 APO AP 14288','M',2117,'2004-02-07',1,NULL),(11,'Kevin','Wolf','82878 Christopher Rapid Pereztown, OH 02240','M',6471,'1935-03-28',8,NULL),(12,'Julie','Stein','8880 Isaac Loop West Andreaberg, IN 87163','N',8273,'1904-11-13',8,NULL),(13,'Mikayla','Fitzpatrick','Unit 6729 Box 4152 DPO AP 57857','N',4548,'1911-09-02',5,NULL),(14,'Elizabeth','Williamson','222 Horne Isle South John, MA 67570','M',6243,'1917-07-16',5,NULL),(15,'Brianna','Bean','31646 Lori Bridge Suite 840 East Mark, WV 91296','M',5108,'1904-05-03',8,NULL),(16,'Sabrina','Howard','11653 Ernest Stream Timstad, WI 39128','F',7298,'1962-10-08',3,NULL),(17,'Valerie','Chang','31316 Hubbard Street Lewiston, ID 60055','M',5490,'2016-06-02',5,NULL),(18,'Gary','Crawford','227 Carrie Harbor Apt. 034 Port Christinemouth, MS 25594','M',8310,'1968-10-05',10,NULL),(19,'Nichole','Neal','564 Patricia Pines Suite 590 Robinhaven, IN 86431','M',3579,'2007-10-01',1,NULL),(20,'James','Mueller','59117 Merritt Oval New Michelleport, ME 71397','N',2963,'1932-08-24',2,NULL),(21,'Karen','George','5914 Wayne Mountains Suite 115 South Tinaburgh, NH 84579','M',4683,'1933-08-17',1,NULL),(22,'Kelly','Ford','1583 Zachary Circles Suite 428 West Emily, AR 71497','M',6989,'2018-07-13',2,NULL),(23,'Richard','Wolfe','28430 Rios Brook Apt. 839 Thompsonland, OK 96655','N',5963,'1989-09-24',10,NULL),(24,'Heidi','Choi','3935 Blackburn Lake Apt. 815 Port Tannerland, MS 90562','M',3189,'1906-10-04',2,NULL),(25,'Alejandro','Neal','9570 Colleen Drives Dennistown, AK 28957','N',6090,'1956-11-05',3,NULL),(26,'Julia','Allison','555 Williams Keys Port Ericburgh, CT 63998','M',1772,'1905-10-20',4,NULL),(27,'Michael','Harrison','357 Browning Mountain Suite 679 Russellshire, ID 33542','F',4521,'1915-06-06',9,NULL),(28,'Henry','Houston','3769 Schmidt Pine West Jeffery, WI 98517','F',8548,'1924-03-20',2,NULL),(29,'Brendan','Coleman','1238 Michael Stream South Maria, OR 27874','N',7165,'1972-02-02',7,NULL),(30,'Laurie','Vance','43637 Ortega Points Jamesborough, ID 18849','M',3806,'1924-05-26',1,NULL),(31,'Elizabeth','Oliver','PSC 8463, Box 4822 APO AP 32419','N',2314,'1916-07-06',6,NULL),(32,'Joseph','Wallace','0954 Jeremy Port East Linda, MO 05240','F',8772,'1964-03-07',6,NULL),(33,'Victoria','Mclaughlin','Unit 7898 Box 3621 DPO AA 09799','N',2299,'1968-01-10',5,NULL),(34,'Kathryn','Rice','428 Roberts Port Apt. 290 West Janice, WY 62595','N',3398,'1965-06-08',3,NULL),(35,'Jennifer','Brown','99087 Smith Alley Bakerberg, TN 66851','M',6817,'1907-09-24',7,NULL),(36,'William','Hughes','47534 Patricia Route Suite 937 West Lisa, TX 98838','F',7114,'1914-06-22',7,NULL),(37,'Dominic','Franklin','5187 Janice Curve Nathanborough, CO 18253','F',3617,'1943-06-02',1,NULL),(38,'Matthew','Stanley','06978 Parrish Causeway Apt. 881 Wesleyfurt, DC 61515','M',7323,'1974-11-22',7,NULL),(39,'Joseph','Myers','20493 Regina Pass Apt. 838 Danielsside, MD 24070','M',8425,'1982-09-23',8,NULL),(40,'David','Weber','53563 Michelle Walks Suite 695 Jonesberg, CT 60704','F',6379,'1996-02-20',5,NULL),(41,'Lauren','Marshall','14910 King Trail Suite 745 New Stephen, DE 95056','N',4040,'1921-07-01',5,NULL),(42,'Jacob','Munoz','01842 Cooley Unions Apt. 321 Teresahaven, MS 49459','M',4387,'1904-12-19',3,NULL),(43,'Michael','Morgan','0043 Dillon Drives Suite 926 Lake Danielfort, CO 82608','N',2915,'1964-03-20',3,NULL),(44,'Antonio','Ortiz','7692 Stewart Field Suite 637 Collinschester, MI 29995','N',8654,'1970-03-02',8,NULL),(45,'Sarah','Mcguire','2656 Hickman Ways New Jeremy, NE 89103','F',1711,'2004-12-15',6,NULL),(46,'Emily','Mitchell','99710 Miller Vista Suite 500 South Georgetown, VT 64916','M',1666,'2016-02-26',6,NULL),(47,'Brittany','Norton','60713 Whitehead Parks Suite 032 East Jonathan, OH 37480','N',6054,'1969-10-16',2,NULL),(48,'William','Nunez','24938 Irwin Passage Deanside, WV 03857','N',7432,'2016-01-16',4,NULL),(49,'Michael','Wilson','80000 Blair Mission New Virginia, NH 95683','N',4875,'1935-07-18',3,NULL),(50,'Lindsey','Vargas','826 Smith Locks Suite 929 East Margaret, CA 26802','F',7209,'1929-08-05',5,NULL),(51,'David','Myers','PSC 7397, Box 9442 APO AP 73300','M',4010,'1934-11-26',1,NULL),(52,'Kyle','Torres','0876 Steven Rest South Kyle, MN 95924','M',5864,'1962-05-25',8,NULL),(53,'Robert','Benjamin','4157 Taylor River Apt. 244 New Reginald, ME 22497','F',9227,'1974-09-19',7,NULL),(54,'Jennifer','Bailey','58469 Nelson Flats Suite 132 New Mary, LA 63803','M',7802,'1940-07-15',1,NULL),(55,'James','Miles','8453 James Turnpike Apt. 401 East Kathleenfort, WA 96198','M',6041,'1950-04-24',9,NULL),(56,'Linda','Joyce','7743 Mark Inlet Suite 703 East Amanda, AL 35310','N',4850,'1973-01-24',4,NULL),(57,'Kimberly','Soto','178 Johnson Skyway Amandafurt, DC 03485','F',4051,'1935-03-14',10,NULL),(58,'Edward','Pierce','5791 Turner Ridges Suite 599 Lake Jaimeview, PA 86490','F',9846,'1918-01-12',2,NULL),(59,'Mark','Schneider','2017 Jasmine Rapid Apt. 174 Amberchester, CO 74128','F',6550,'1970-02-07',8,NULL),(60,'Russell','Santiago','812 Lori Forges Apt. 558 Rebeccaland, HI 02889','M',3379,'1959-10-07',3,NULL),(61,'Brenda','Murphy','0050 Rivera Flats Apt. 101 Hineshaven, ME 19348','N',5116,'1940-05-25',7,NULL),(62,'Travis','Clay','0881 Michelle Roads North Robertburgh, VA 69866','N',8426,'1978-03-25',9,NULL),(63,'Richard','Wilson','USNV Casey FPO AE 02599','N',2109,'1974-01-18',2,NULL),(64,'Anthony','Harrington','8455 Contreras Forges Suite 055 Brendanland, AR 25504','M',6626,'1997-06-17',5,NULL),(65,'Sara','Anderson','46288 Robinson Court Suite 731 North Jessica, OK 51317','N',1442,'1994-06-19',5,NULL),(66,'Heather','Walker','58903 Carrie Light West Morganbury, OK 78780','F',5072,'1995-07-02',5,NULL),(67,'Maria','Berger','580 Norman Road Apt. 938 Margaretmouth, MN 16459','M',9708,'1928-04-03',9,NULL),(68,'Kimberly','Griffith','961 Gray Path Jonathanchester, NJ 41141','F',7527,'1964-03-29',10,NULL),(69,'Matthew','Daniels','743 Nicole Streets Suite 743 Joshuafurt, AK 86122','F',4273,'2013-01-30',9,NULL),(70,'Samantha','Webb','2477 Moreno Isle North Randy, WI 51147','M',9146,'2006-05-08',10,NULL),(71,'Anthony','Hancock','71134 Duane Summit Leachville, NY 46927','M',1955,'1945-10-22',1,NULL),(72,'Keith','Perry','31658 Brittany Walk Apt. 691 New Davidbury, NH 01937','F',6616,'1954-04-11',4,NULL),(73,'Nathan','Wilcox','45927 Joseph Trace Apt. 797 Shawnshire, ME 59976','F',3582,'1955-07-05',9,NULL),(74,'Krystal','Branch','910 Laurie Shoal Apt. 398 Wallaceshire, HI 50702','F',7601,'1950-01-27',1,NULL),(75,'Sally','Moore','PSC 4404, Box 5236 APO AA 29371','F',5472,'1995-08-08',7,NULL),(76,'Gwendolyn','Richards','6706 Simpson Dale Hayesshire, MA 36517','F',9718,'1949-09-20',5,NULL),(77,'Evan','Cox','14541 Rachel Lights East Tyler, OH 73325','M',6581,'2010-05-23',1,NULL),(78,'Heidi','Alexander','5176 Jeffrey Fields North Danielburgh, NJ 14832','F',1909,'2001-05-23',9,NULL),(79,'Patricia','Marquez','30709 Peters Fort Suite 008 Port Dennis, MD 45687','N',2181,'1956-03-23',7,NULL),(80,'Mallory','Roach','3375 David Ramp Thompsonton, KS 13088','F',4702,'2017-12-15',10,NULL),(81,'Renee','Powell','39642 Miller Mountains Nelsonfort, FL 29788','M',2490,'1919-06-23',5,NULL),(82,'Samuel','Daugherty','01813 Carrie Street Apt. 045 Phillipschester, NM 02509','M',5332,'1936-09-27',4,NULL),(83,'Stanley','Bennett','14643 Kyle Crescent Apt. 183 Lake Patricialand, WY 47268','F',6418,'2014-12-15',1,NULL),(84,'Teresa','Brooks','5076 Terri Corners Apt. 735 Perrybury, GA 23668','F',4021,'1912-08-10',5,NULL),(85,'Valerie','Davis','344 Price Squares Cunninghamberg, NC 95234','N',2905,'1961-11-15',7,NULL),(86,'Crystal','Henry','32445 Robert Stravenue Lake Jeffreyview, AK 04245','N',8134,'1959-11-10',7,NULL),(87,'Olivia','Strong','3314 Key Ridges Suite 454 Ericborough, AL 13449','N',5679,'1946-12-17',6,NULL),(88,'Richard','Lindsey','6555 Linda Meadow Nelsonchester, NH 80862','F',1415,'1988-05-26',9,NULL),(89,'Jeff','Hunt','276 Thomas Squares Suite 805 North Thomasport, PA 23041','F',7041,'2004-02-26',4,NULL),(90,'Isaiah','Bell','31627 Norma Heights Suite 728 Port Catherine, GA 32995','M',9653,'1964-02-14',10,NULL),(91,'Wendy','Phillips','Unit 5669 Box 6591 DPO AE 43540','M',7295,'1936-05-13',4,NULL),(92,'Richard','Johnson','USNS Wilson FPO AE 75255','N',3762,'1998-07-27',5,NULL),(93,'Joseph','Brandt','21286 Andrew Flat Suite 391 West Yolanda, AL 42151','M',2398,'1947-03-06',10,NULL),(94,'Robert','Benson','37248 Kelly Trail Port Jake, KY 48917','M',8369,'1923-11-29',1,NULL),(95,'Bradley','Ford','8428 Baker Center Suite 603 Sanfordfort, GA 26985','F',2424,'1990-01-16',3,NULL),(96,'Krista','Perez','USS Burns FPO AA 41867','M',3510,'1941-12-22',6,NULL),(97,'Hannah','Ramirez','57567 Robinson Curve Apt. 221 West Gary, ND 39258','F',8245,'1989-09-10',9,NULL),(98,'Kristin','Rodriguez','315 Monica Pass Apt. 140 Stevenfort, DC 39912','M',1245,'1984-10-10',10,NULL),(99,'Jerry','Hernandez','621 Chad Throughway Millerfort, DE 09204','F',2161,'1957-09-10',9,NULL),(100,'Melissa','King','7396 Gay Burgs Apt. 868 Jordanfurt, GA 45868','N',6042,'1951-07-01',10,NULL);
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
INSERT INTO `projeto` VALUES (1,'Carro autônomo',5,NULL),(2,'Vacina covid-19',7,NULL),(3,'Automação residencial',6,NULL),(4,'Colônia em Marte',9,NULL),(5,'Supercomputador quântico',4,NULL),(6,'Drone subacuático',8,NULL),(7,'HAL 9000',10,NULL),(8,'Skynet',2,NULL);
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
INSERT INTO `trabalha_em` VALUES (1,4,40),(3,5,20),(4,7,40),(5,8,4),(6,1,40),(7,2,4),(9,6,40),(11,6,20),(12,6,14),(13,1,8),(14,1,20),(15,6,8),(17,1,4),(18,7,14),(20,8,40),(22,8,40),(23,7,14),(24,8,8),(26,5,20),(27,4,40),(28,8,4),(29,2,14),(31,3,20),(32,3,14),(33,1,20),(35,2,8),(36,2,4),(38,2,8),(39,6,14),(40,1,4),(41,1,20),(44,6,20),(45,3,8),(46,3,40),(47,8,40),(48,5,14),(50,1,20),(52,6,20),(53,2,4),(55,4,4),(56,5,20),(57,7,20),(58,8,8),(59,6,40),(61,2,40),(62,4,4),(63,8,4),(64,1,40),(65,1,8),(66,1,14),(67,4,8),(68,7,8),(69,4,40),(70,7,40),(72,5,20),(73,4,14),(75,2,40),(76,1,8),(78,4,20),(79,2,14),(80,7,14),(81,1,4),(82,5,8),(84,1,14),(85,2,8),(86,2,20),(87,3,8),(88,4,14),(89,5,40),(90,7,20),(91,5,20),(92,1,14),(93,7,20),(96,3,4),(97,4,14),(98,7,14),(99,4,40),(100,7,8);
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

-- Dump completed on 2020-03-24 17:06:58
