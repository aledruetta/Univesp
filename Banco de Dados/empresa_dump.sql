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
INSERT INTO `departamento` VALUES (1,'Logística',15,'2020-01-01'),(2,'Marketing',32,'2020-01-01'),(3,'Ventas',20,'2020-01-01'),(4,'RH',58,'2020-01-01'),(5,'Engenharia',27,'2020-01-01'),(6,'Informática',100,'2020-01-01'),(7,'Financeiro',26,'2020-01-01'),(8,'Segurança',25,'2020-01-01'),(9,'Manutenção',53,'2020-01-01'),(10,'Produção',70,'2020-01-01');
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
INSERT INTO `dependente` VALUES (2,'Wayne Miller','1969-09-10','N','outro'),(3,'Wendy Castro','1972-04-13','F','outro'),(4,'Christina Murray','1982-09-26','F','outro'),(5,'Stephen Hernandez','2012-03-24','N','conjuge'),(7,'Kenneth Moore','1990-06-27','M','filho/a'),(8,'Chase Curtis','1960-06-14','F','outro'),(9,'Christopher Jenkins','1943-03-18','M','conjuge'),(11,'Joe Harris','1912-05-22','M','outro'),(16,'Jorge Cooper','1930-08-25','F','conjuge'),(20,'Bianca Lam','1946-10-23','M','conjuge'),(22,'Rachel Porter','1955-07-03','N','outro'),(28,'Raymond Collins','1944-01-23','F','conjuge'),(29,'William Johnson','1979-10-27','N','outro'),(32,'Michael Anderson','1918-04-25','N','filho/a'),(37,'Cynthia Mcclain','1944-04-25','F','outro'),(40,'Sarah Tanner','1983-02-03','F','filho/a'),(41,'Charles Rivera','1926-12-15','F','outro'),(42,'Angela Castro','2005-01-07','N','outro'),(44,'Christina Nguyen','1929-03-06','M','filho/a'),(45,'Jesse Moore','1951-08-31','M','filho/a'),(46,'Alyssa Phillips','1999-03-03','N','filho/a'),(47,'Michele Mora','1942-01-26','M','conjuge'),(49,'Stephanie Stevens','1984-07-24','N','outro'),(51,'Vanessa Wiggins','2013-04-29','N','outro'),(53,'Andrew Barnes','1939-06-03','N','filho/a'),(57,'Emily Adams','1960-11-03','F','outro'),(58,'Tracy Boyle','1913-10-04','F','filho/a'),(59,'Rickey Benton','1990-12-16','M','filho/a'),(60,'Angela Hanson','1958-12-15','F','conjuge'),(61,'Crystal Bell','1905-03-19','F','filho/a'),(62,'Nicholas Ramos','1996-11-30','F','outro'),(64,'Stephanie Elliott','1921-04-23','M','outro'),(71,'John Lambert','1922-05-18','M','filho/a'),(73,'Steven Taylor','2012-11-15','F','conjuge'),(74,'Jesse Ward','1955-07-14','M','outro'),(77,'Antonio Cox','1958-06-07','M','filho/a'),(79,'Mark Keller','1914-04-26','M','conjuge'),(81,'Shawn Bishop','1966-02-05','M','outro'),(82,'Amy Simmons','2009-09-11','N','conjuge'),(84,'Ronald Gonzalez','1925-05-18','F','conjuge'),(86,'Michael Smith','1909-03-29','F','conjuge'),(87,'Patricia Davis','1967-12-10','N','conjuge'),(88,'Rachel Jones','1956-03-01','M','outro'),(89,'Miguel Morton','1961-09-30','F','conjuge'),(92,'Jeffrey Stevens','1904-06-10','M','conjuge'),(93,'Andrew Gray','1925-10-19','M','filho/a'),(94,'Krista Willis','2017-08-02','N','conjuge'),(96,'Jessica Wilkins','1963-01-18','F','outro'),(99,'Mark Warner','1953-07-16','N','outro'),(100,'Robert Cardenas','1997-08-27','N','filho/a');
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
INSERT INTO `funcionario` VALUES (1,'Bruce','Roach','453 Kelly Drive Apt. 052 Bethanyberg, CO 74877','M',1870,'2012-08-09',1,NULL),(2,'Janet','Cherry','Unit 4906 Box 0790 DPO AA 53731','M',3594,'1914-08-22',7,NULL),(3,'Robert','Robinson','749 Elizabeth Island Lindafurt, DC 05003','M',7396,'1989-02-19',4,NULL),(4,'Jeffrey','Alvarez','18097 Sutton Locks Port Markfort, HI 32663','N',5643,'1964-02-28',3,NULL),(5,'Jason','Williams','516 Riggs Unions Apt. 115 Valeriefort, VA 90394','N',5071,'2005-01-14',5,NULL),(6,'Brandon','Weeks','0665 Abigail Road West Maria, MO 48266','M',4674,'2018-02-03',3,NULL),(7,'Cody','Davis','74284 William Canyon Suite 952 Saundersshire, MN 44917','F',1122,'1961-12-12',5,NULL),(8,'Judith','Moore','5358 Emily Loop Suite 371 New Vanessafurt, VA 37202','F',7132,'1978-04-11',8,NULL),(9,'Alexis','Cohen','05580 White Corners Lake Margaretfurt, WI 72616','F',4870,'1974-08-15',9,NULL),(10,'Lisa','Mcmahon','792 Ortega Islands Apt. 630 North Hunter, OH 98126','N',2826,'1987-07-11',4,NULL),(11,'George','Newton','7209 Cheryl Motorway South Carolynburgh, KS 46524','M',6430,'1914-06-01',2,NULL),(12,'Amber','Brown','13941 Jodi Extension Apt. 346 Melissaside, ID 08809','N',6426,'1974-04-19',1,NULL),(13,'Rodney','Patrick','351 Ray Fall Apt. 131 Port Evan, KS 75726','F',9148,'1992-02-20',8,NULL),(14,'Tamara','Robles','38782 Webb Fords Apt. 368 Raymondmouth, NJ 82540','F',7451,'1911-06-19',9,NULL),(15,'Julia','Shepard','67771 Rivera Greens Apt. 952 East Michael, AK 68106','M',9922,'1980-05-29',1,NULL),(16,'Jennifer','Benson','19001 Wade Islands Edwardshaven, AZ 42017','N',4753,'1988-11-16',3,NULL),(17,'Peter','Nash','14099 Powell Fields Stevenshire, CO 68599','M',4115,'1965-08-03',9,NULL),(18,'Hannah','Martinez','4351 Thomas Road Apt. 898 New Brandonhaven, NJ 25223','F',6197,'2005-04-27',9,NULL),(19,'Ashley','Young','08474 Schmidt Track Heathermouth, CA 35510','F',1207,'1955-10-30',8,NULL),(20,'Susan','Fernandez','3738 Summer Flats Stevenville, LA 52789','F',9897,'1916-12-30',9,NULL),(21,'Thomas','Smith','042 Brenda Fall Lake Stacey, SC 76571','F',7719,'1951-11-21',2,NULL),(22,'Daniel','Reid','98143 Victoria Shore Joshuaborough, IL 53042','M',1107,'1904-11-28',5,NULL),(23,'Lauren','Jackson','9372 Petersen Square Lake Jenniferfurt, AK 86743','N',1174,'1958-04-21',4,NULL),(24,'Kevin','Alvarado','225 Holmes Rest Apt. 387 New Stephanie, WI 21907','N',5223,'1914-09-03',7,NULL),(25,'Ronald','Washington','20174 Cruz Mills Suite 186 New Rachelport, IA 91323','N',9590,'1929-02-12',5,NULL),(26,'Amanda','Miller','18151 Brown Throughway Fosterburgh, HI 96734','N',9603,'1937-03-20',9,NULL),(27,'Mary','Leach','2969 Collin Points South Sherylchester, FL 64780','F',9760,'2013-08-19',1,NULL),(28,'Nicole','Rodriguez','0879 Robert Park Apt. 167 Lake Stephanie, VA 83717','M',4348,'2014-09-28',9,NULL),(29,'Melissa','Peterson','5653 Michael Fort Suite 235 Nashton, SD 35193','F',4284,'1925-02-05',3,NULL),(30,'Brittany','Vang','4155 Morgan Ville Suite 403 Sampsonbury, UT 65723','F',5633,'1944-03-10',2,NULL),(31,'Alexandra','Zuniga','PSC 9618, Box 9148 APO AE 55413','N',2556,'1920-05-10',7,NULL),(32,'Marissa','Johnston','8627 Mcmahon Throughway Apt. 656 Milesburgh, MO 49782','M',9920,'1992-07-09',10,NULL),(33,'Michael','Johnson','589 Jennifer Loaf Juliestad, GA 63288','M',1964,'1917-05-22',6,NULL),(34,'Regina','Crawford','615 Owens Plaza Staceyberg, MT 87054','F',2963,'1970-05-30',8,NULL),(35,'Dalton','Sims','26299 Jay Brook Apt. 520 Tarachester, FL 83182','N',3136,'2002-04-18',4,NULL),(36,'Robert','Garcia','2537 Steven Rue Apt. 999 Jeremychester, PA 35828','N',9292,'1934-05-20',7,NULL),(37,'Olivia','Marsh','2082 Angela Stravenue Suite 971 East Latoya, KY 63575','F',7446,'1964-04-20',5,NULL),(38,'Melissa','Hunter','99466 Reed Greens Duarteville, IA 71659','M',6576,'1969-10-20',8,NULL),(39,'Mary','White','USS Velez FPO AP 52182','F',7999,'1923-01-05',10,NULL),(40,'Paul','Parker','180 Laurie Via Suite 455 Kevinberg, OH 90551','F',3028,'2018-07-26',7,NULL),(41,'Thomas','Boyd','271 Sarah Oval Deborahbury, SC 75842','M',4594,'1919-12-23',10,NULL),(42,'Stephanie','Mathis','6019 Bryan Meadow Suite 052 Catherinebury, UT 57248','N',5305,'1959-09-09',9,NULL),(43,'Yolanda','Nguyen','9298 Alex Greens Suite 225 Kristinamouth, MI 50531','M',1232,'2008-04-01',7,NULL),(44,'Cindy','Martin','PSC 4928, Box 5068 APO AE 14197','F',7741,'2005-12-23',10,NULL),(45,'Sheri','Murray','469 Douglas Spur Apt. 295 Lake Nicoleside, FL 81039','F',1739,'1942-01-11',7,NULL),(46,'Nicholas','Spencer','472 Davis Unions Port Ann, OR 07544','M',4499,'2001-09-30',9,NULL),(47,'Jeffrey','Garcia','5075 Eric Light Bryanthaven, HI 54248','M',3170,'1999-12-20',6,NULL),(48,'Maria','Johnson','4903 Anna Lights Suite 136 East Nicolehaven, WV 50002','F',2997,'1928-10-29',10,NULL),(49,'Thomas','Blanchard','PSC 0903, Box 3436 APO AP 75057','M',2935,'1954-05-17',10,NULL),(50,'Scott','Weeks','532 Scott Road Suite 299 Johnsonton, WV 61975','N',5082,'1932-09-09',7,NULL),(51,'Julia','Mccall','88450 Lisa Plains Suite 520 North Jeffreymouth, MO 55759','F',7195,'1974-07-06',1,NULL),(52,'Ryan','Smith','2361 Edwards Cliffs Apt. 882 Harrismouth, IA 66475','M',9461,'1906-01-05',4,NULL),(53,'Melissa','Nichols','468 Johnson Camp Suite 765 Andrewfort, WY 54517','F',9586,'1999-10-05',7,NULL),(54,'Evelyn','Garrett','7061 Olson Valley Apt. 548 East Ruben, RI 98821','M',2457,'1926-08-18',9,NULL),(55,'Ronald','Morrow','690 Hall Road Apt. 208 Ashleyshire, MA 94681','F',6893,'1921-10-26',1,NULL),(56,'Mary','Flores','342 Timothy River Apt. 524 Ravenborough, WV 26875','F',2884,'2014-04-17',2,NULL),(57,'Thomas','Hernandez','339 Garrett Plains Erinside, SD 52461','M',9387,'1989-05-31',6,NULL),(58,'Justin','Sims','08579 Danielle Haven Apt. 196 South Mario, ME 12350','F',9896,'1996-06-18',5,NULL),(59,'Bryan','Evans','83184 Robert Lights Apt. 089 North Ashleyfort, MO 63237','N',8051,'1995-05-14',8,NULL),(60,'Amanda','Lee','15113 Justin Landing Jeremiahshire, AZ 90710','N',1954,'1992-05-12',2,NULL),(61,'Jason','Flores','4530 Mckay Rest Suite 368 Cindyhaven, VT 53705','N',8757,'1951-01-25',9,NULL),(62,'Jeffrey','Arnold','3956 Phillips Trace Callahanberg, ME 53196','F',4541,'1977-05-05',2,NULL),(63,'Hannah','Smith','8268 Christopher Centers West Joseville, DE 36865','M',8112,'1931-04-22',2,NULL),(64,'Eric','Blankenship','PSC 7899, Box 7348 APO AP 44834','F',4883,'1975-03-26',9,NULL),(65,'Charles','Anderson','125 Kelly Rapids East Bryan, HI 98605','N',8735,'2002-10-01',7,NULL),(66,'Natasha','Hebert','157 Foster Wall Watkinsland, NE 72999','F',5608,'1997-02-02',5,NULL),(67,'Sandra','Sanchez','PSC 0975, Box 8933 APO AP 79276','M',6659,'1935-05-05',7,NULL),(68,'Melissa','Allen','1111 Jessica Island Thomasmouth, WA 57230','N',6571,'1998-05-25',5,NULL),(69,'Elizabeth','Garcia','Unit 6972 Box 9623 DPO AE 17819','M',1571,'1991-11-01',10,NULL),(70,'Matthew','Woods','082 Garcia Squares East Staceyfurt, SC 62965','M',9521,'1997-10-22',1,NULL),(71,'Teresa','Dalton','8519 Knapp Tunnel Apt. 961 Port Richard, MS 65717','N',6635,'1968-06-20',1,NULL),(72,'Rachel','Rivers','99161 Timothy Springs East Annabury, MN 72656','M',5463,'2020-02-19',3,NULL),(73,'Michael','Holder','1681 Thomas Way Suite 200 Gabrielbury, NJ 32814','M',7748,'1945-05-12',10,NULL),(74,'Austin','Owens','9070 David Station South Kristen, VA 07881','F',5906,'1955-12-27',3,NULL),(75,'Helen','Fitzpatrick','74483 Joseph Lodge Apt. 428 Pettychester, OK 10622','F',6573,'1999-10-14',5,NULL),(76,'Michael','Knight','3922 Ronald Village Suttonborough, IN 25210','F',1402,'1915-03-02',1,NULL),(77,'Theresa','Lee','32352 Dominic Stream Apt. 257 Lisahaven, IA 62462','N',3675,'1924-08-14',2,NULL),(78,'Natalie','Williams','91917 Andrew Manors Turnerburgh, PA 78705','F',1342,'1920-12-24',5,NULL),(79,'Zachary','Beck','9314 Hall Mews Apt. 704 Lake Brianhaven, MO 83548','N',8611,'1962-11-13',4,NULL),(80,'Brian','White','8433 Bridges Junctions North Sarah, WI 04213','F',8601,'1979-01-03',8,NULL),(81,'Carla','Molina','10111 Oneal Bypass Suite 035 East Cynthialand, NH 85522','N',7631,'1922-12-13',3,NULL),(82,'Beverly','Gonzalez','0097 Meghan Stravenue Donaldhaven, CT 51053','N',9122,'1991-06-07',5,NULL),(83,'Beth','Martinez','083 Smith Way Arnoldtown, MI 11939','F',3242,'2016-12-10',1,NULL),(84,'Nathaniel','Moore','126 Torres Plain Kevinburgh, KS 41182','M',8573,'1957-02-23',2,NULL),(85,'Richard','Gill','4404 Ellis Via Apt. 131 East Vickie, UT 36526','N',8811,'1954-09-16',6,NULL),(86,'Olivia','Garcia','012 Paul Junctions Apt. 703 New Ericside, TN 49551','M',8982,'1960-09-14',6,NULL),(87,'Kim','Sweeney','7850 Mia Harbors North Amy, CA 69523','F',2347,'1904-08-13',2,NULL),(88,'Vincent','Pollard','10825 Austin Flats Apt. 859 Richardland, ND 48426','F',6573,'1979-12-07',10,NULL),(89,'Lisa','Martinez','458 Johnson Inlet Suite 999 Port Tinaberg, MA 44486','N',2386,'2016-01-21',9,NULL),(90,'Rachel','Boone','Unit 7241 Box 0613 DPO AP 67893','N',6253,'1959-12-10',8,NULL),(91,'Michael','Burgess','66691 Cole Coves Scottchester, AL 96518','F',4623,'1915-04-17',10,NULL),(92,'Susan','Chang','USCGC Mills FPO AA 34823','N',9199,'1965-05-20',1,NULL),(93,'Mark','Nelson','230 Elizabeth Crossing Suite 465 Williamsland, NC 87269','N',8816,'1930-07-09',2,NULL),(94,'Scott','Howard','USS Garcia FPO AE 31177','M',8936,'1967-04-10',9,NULL),(95,'Daniel','Taylor','708 King Islands Suite 582 Port Steven, GA 99654','N',9059,'1942-12-07',4,NULL),(96,'Charlotte','Snyder','2985 Wright Port New Morganton, AK 69455','F',2728,'1969-08-15',6,NULL),(97,'Nathan','West','USNS Moss FPO AE 66558','M',3467,'2013-12-06',3,NULL),(98,'Christopher','Singh','86992 Lonnie Ports North Daisyview, OK 65773','N',8536,'1944-11-30',8,NULL),(99,'Stephanie','Flores','760 Jeff Trace Port Robert, MO 17720','F',3818,'1964-10-06',8,NULL),(100,'Natasha','Mitchell','64945 Boyle Inlet Carrillomouth, GA 38253','N',9604,'1972-10-06',9,NULL);
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
INSERT INTO `projeto` VALUES (1,'Carro autônomo',1,NULL),(2,'Vacina covid-19',9,NULL),(3,'Automação residencial',5,NULL),(4,'Colônia em Marte',2,NULL),(5,'Supercomputador quântico',6,NULL),(6,'Drone subacuático',3,NULL),(7,'HAL 9000',4,NULL),(8,'Skynet',10,NULL);
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
INSERT INTO `trabalha_em` VALUES (1,1,8),(3,7,4),(4,6,8),(5,3,4),(6,6,8),(7,3,14),(9,2,8),(10,7,14),(11,4,20),(12,1,4),(14,2,20),(15,1,14),(16,6,14),(17,2,4),(18,2,4),(20,2,8),(21,4,8),(22,3,8),(23,7,40),(25,3,4),(26,2,4),(27,1,4),(28,2,4),(29,6,20),(30,4,8),(32,8,40),(33,5,4),(35,7,14),(37,3,20),(39,8,14),(41,8,8),(42,2,4),(44,8,8),(46,2,8),(47,5,14),(48,8,20),(49,8,14),(51,1,4),(52,7,20),(54,2,4),(55,1,4),(56,4,8),(57,5,14),(58,3,14),(60,4,20),(61,2,8),(62,4,4),(63,4,20),(64,2,40),(66,3,14),(68,3,8),(69,8,8),(70,1,4),(71,1,8),(72,6,20),(73,8,14),(74,6,14),(75,3,4),(76,1,20),(77,4,4),(78,3,20),(79,7,20),(81,6,8),(82,3,40),(83,1,4),(84,4,14),(85,5,20),(86,5,4),(87,4,40),(88,8,8),(89,2,8),(91,8,4),(92,1,8),(93,4,40),(94,2,14),(95,7,14),(96,5,14),(97,6,14),(100,2,20);
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

-- Dump completed on 2020-03-23 16:18:09
