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
INSERT INTO `departamento` VALUES (1,'Logística',34,'2020-01-01'),(2,'Marketing',14,'2020-01-01'),(3,'Ventas',35,'2020-01-01'),(4,'RH',76,'2020-01-01'),(5,'Engenharia',82,'2020-01-01'),(6,'Informática',63,'2020-01-01'),(7,'Financeiro',87,'2020-01-01'),(8,'Segurança',1,'2020-01-01'),(9,'Manutenção',68,'2020-01-01'),(10,'Produção',72,'2020-01-01');
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
INSERT INTO `dependente` VALUES (1,'Jeffery Kemp','1907-08-14','N','conjuge'),(3,'Wayne Moses','1989-11-25','M','conjuge'),(4,'Frank Garrett','1956-07-24','M','conjuge'),(5,'Rebecca Logan','1983-06-02','N','filho/a'),(8,'Oscar Johnson','1933-04-04','N','filho/a'),(9,'Rebecca Doyle','1904-08-16','N','filho/a'),(12,'Ernest Rodriguez','1990-08-20','M','filho/a'),(14,'Anthony Cole','1964-12-12','M','conjuge'),(15,'Christina Taylor','1928-01-30','M','conjuge'),(16,'Jacqueline Ballard','1999-08-04','N','filho/a'),(17,'Sarah Gibson','1983-04-24','M','outro'),(18,'Carl Roberts','1945-03-22','M','conjuge'),(19,'Joshua Sanders','1905-01-19','M','outro'),(25,'Heather Day','1994-10-21','N','outro'),(26,'Kaitlin Martin','1933-03-03','F','filho/a'),(27,'Jesse Wheeler','1985-03-14','M','filho/a'),(28,'Jason Jones','2009-12-12','M','filho/a'),(34,'John Fuller','1985-12-31','M','conjuge'),(35,'Rebecca Gonzalez','2008-09-26','N','filho/a'),(36,'Travis Cantu','1914-05-10','F','conjuge'),(37,'Mitchell Cooper','1954-08-17','F','conjuge'),(39,'Christina Hill','2006-12-10','M','conjuge'),(42,'Stephen Williams','1967-07-15','M','conjuge'),(43,'Danielle Jones','2002-05-26','F','filho/a'),(45,'Alyssa Doyle','1968-10-20','M','outro'),(48,'Sharon Blair','1979-01-02','F','conjuge'),(51,'Michele Mason','1982-07-28','M','conjuge'),(60,'Donna Hill','1989-02-19','N','outro'),(61,'Morgan Clark','1982-04-18','F','outro'),(62,'Daniel Hardin','1919-03-05','N','conjuge'),(64,'Sarah Stevens','2014-02-14','N','outro'),(65,'Rickey Burke','1919-08-13','F','outro'),(66,'Rebecca Cross','1917-09-28','N','outro'),(67,'Ashley Randolph','1962-05-06','F','filho/a'),(69,'Eric Sims','1949-04-06','N','outro'),(70,'Carla Carter','2013-10-03','F','filho/a'),(71,'Sandra Cameron','1991-12-16','N','conjuge'),(76,'Melanie Freeman','1928-09-20','N','conjuge'),(77,'Michael Houston','1968-02-05','F','filho/a'),(78,'George Roberts','2005-12-24','N','filho/a'),(81,'Daniel Ray','1976-06-15','N','filho/a'),(84,'Brittney Wagner','1933-03-02','M','filho/a'),(88,'Melanie Lee','1973-04-02','N','conjuge'),(89,'Brett Park','1961-09-11','N','filho/a'),(90,'Katherine Trevino','1993-09-18','M','filho/a'),(92,'Timothy Costa','1916-05-20','F','outro'),(94,'Robert Marsh','2019-12-31','M','filho/a'),(96,'Carol Franklin','1926-08-30','F','conjuge'),(97,'Jesus Houston','1905-06-19','N','conjuge'),(98,'Brian Wong','1941-09-29','M','outro');
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
INSERT INTO `funcionario` VALUES (1,'Anthony','Kirby','3608 Ashley Oval Apt. 629 South Dorothy, WV 76094','N',9611,'1959-01-28',8,NULL),(2,'Alejandro','Stanton','USNV White FPO AE 01894','N',7599,'1940-07-26',7,NULL),(3,'William','Walker','6859 Richard Rapids Mitchellmouth, KY 91047','M',1977,'1991-10-05',3,NULL),(4,'Jennifer','Perez','604 Joseph Prairie Apt. 327 Travisburgh, KS 32841','N',2973,'1962-01-04',8,NULL),(5,'Haley','Morse','3367 Anna Corners New Angela, MI 08015','M',6570,'1990-05-12',8,NULL),(6,'Jessica','White','71888 Nicholas Loaf Suite 837 East Brittanyside, NC 10595','M',2555,'2012-04-09',6,NULL),(7,'Matthew','Cain','842 Jeffrey Mission South Anthonyhaven, NJ 72725','F',3089,'1966-07-21',7,NULL),(8,'Tiffany','Nielsen','8997 Donald Ports West Susanmouth, NE 56427','F',9118,'1971-07-01',10,NULL),(9,'Emily','Griffith','Unit 2735 Box 2766 DPO AA 99614','M',3137,'1929-12-27',2,NULL),(10,'Grace','Brooks','2313 Powell Gateway Apt. 040 New Matthewchester, DE 07780','M',7316,'1905-02-18',2,NULL),(11,'Brenda','Ramos','156 Nguyen Forge East Erin, NE 35696','F',7974,'2011-02-08',1,NULL),(12,'Vickie','Price','57436 Michael Radial Suite 445 Carrberg, TN 67415','N',6305,'1972-06-19',6,NULL),(13,'Brittany','Mclaughlin','492 Barbara Locks East Craigmouth, VT 81512','N',3125,'1977-04-15',4,NULL),(14,'Abigail','Cook','093 Darrell Turnpike Suite 306 New Terrence, WV 14148','M',9866,'2018-09-20',2,NULL),(15,'Douglas','Flores','9247 Bailey Land Williamsburgh, SC 77885','M',2118,'2001-12-30',8,NULL),(16,'Matthew','Lopez','241 George Hills Brentburgh, KS 98661','F',7775,'1980-11-30',7,NULL),(17,'Amy','Estes','Unit 6464 Box 0280 DPO AP 27399','M',3041,'2008-05-22',7,NULL),(18,'Tina','Williams','40635 Carter Station Lake Susan, ND 92894','N',2606,'1948-10-28',2,NULL),(19,'Jessica','Davis','99078 Gibbs Greens Suite 287 Lake Michellemouth, ME 09827','M',5622,'2009-03-11',7,NULL),(20,'Matthew','Anderson','PSC 7618, Box 6754 APO AA 72878','F',4093,'1977-05-20',2,NULL),(21,'Cody','Hanson','PSC 7288, Box 9481 APO AP 18989','F',3536,'1938-06-26',9,NULL),(22,'Matthew','Stewart','USS Melendez FPO AA 14743','F',5042,'1936-05-08',4,NULL),(23,'Victoria','Quinn','369 Roberts Valley East Richard, TN 88659','M',3371,'1988-05-02',3,NULL),(24,'Michael','Santana','7785 Johnson Center Ryanport, WV 85534','N',3993,'1999-09-11',7,NULL),(25,'Daniel','Webster','PSC 0789, Box 2400 APO AE 82637','M',8579,'2000-12-16',8,NULL),(26,'Leah','Walker','07122 Nicholas Port Apt. 828 Paynemouth, DC 27850','F',2297,'1950-08-30',6,NULL),(27,'Julie','Williams','5282 Carrie Unions Tammyland, AK 51225','N',7665,'1953-10-16',3,NULL),(28,'Chad','Contreras','67830 Mendoza Park Pittsmouth, OR 33713','N',6430,'1966-07-13',9,NULL),(29,'Angela','Walsh','143 Young Mission Suite 546 Schultzview, FL 01646','M',5474,'1906-08-21',10,NULL),(30,'William','Small','176 Maria Flats Suite 454 New Sarah, VA 55340','M',1321,'1998-12-05',4,NULL),(31,'James','Murphy','4662 Allen Fork Chavezshire, MT 78972','F',5861,'1929-07-19',3,NULL),(32,'Michael','Roberts','736 Jesus River Apt. 046 Ryanborough, HI 96892','M',7027,'1917-09-05',3,NULL),(33,'Mark','Baker','04211 Kevin Plain Proctorland, ID 68527','F',2786,'1970-04-25',5,NULL),(34,'Michael','Hall','642 Martin Brooks Suite 766 Davidsonville, KY 35647','N',8685,'1958-05-26',1,NULL),(35,'Jeffrey','Fox','PSC 3425, Box 4130 APO AA 67388','F',9792,'1918-07-03',3,NULL),(36,'Rachel','Fletcher','527 Jerry Grove Apt. 819 North Robertbury, DE 68143','M',2187,'2016-10-24',9,NULL),(37,'Michael','Smith','217 Colleen Avenue Suite 941 West Rebecca, MN 43536','M',2089,'1933-01-26',10,NULL),(38,'Nathaniel','Myers','22568 William Views Carolineshire, KY 59425','N',2250,'2014-10-23',1,NULL),(39,'Matthew','Beasley','676 Ashley Corner Bradleybury, NJ 42808','M',4860,'2007-12-08',6,NULL),(40,'Sara','Hill','397 Gail Curve North Erinside, MO 57407','F',1566,'1941-09-14',9,NULL),(41,'Robert','Gonzales','3721 Moore Valley Herrerabury, FL 54227','N',2495,'1956-08-29',6,NULL),(42,'Jonathan','Williams','3188 Perez Valleys Lake Michael, NC 51618','F',5579,'2010-02-18',1,NULL),(43,'Karen','Barnett','PSC 3489, Box 3843 APO AA 43503','M',9293,'1942-12-26',8,NULL),(44,'Justin','Hunt','15815 Beth Club Lake Shirley, VT 79006','N',4699,'2001-06-20',6,NULL),(45,'Maria','Allen','12960 Theresa Oval Kellyshire, UT 67826','N',7062,'1924-09-22',4,NULL),(46,'Valerie','Robinson','5695 William Park Brittneytown, OH 30370','N',7835,'1907-01-29',10,NULL),(47,'Tiffany','Griffith','2159 Chavez Key New Corey, OR 20155','M',8309,'1931-02-08',7,NULL),(48,'Heather','Martinez','498 Ford Rapid Apt. 663 East Brianafort, NJ 72986','N',2522,'1983-03-27',9,NULL),(49,'Carl','Snow','9838 Lindsey Plaza Apt. 627 Lake Caitlinfurt, IL 30172','F',7732,'2007-07-22',3,NULL),(50,'Jared','Yu','5644 Rodriguez Wells Suite 248 North Patrick, MO 59993','F',6656,'1932-04-09',5,NULL),(51,'Andre','Williams','2828 Patton Fall East Mariatown, CA 63414','M',6048,'1997-06-20',8,NULL),(52,'Alex','Thomas','18433 Heather Inlet Suite 855 Port John, FL 66377','F',5245,'1904-07-11',2,NULL),(53,'Lindsay','Pena','506 Santiago Parkways Lake Pedro, NE 40683','M',2108,'1949-01-11',8,NULL),(54,'Tanya','Taylor','5953 Luna Plains Williamsport, ME 42058','M',5475,'1933-03-04',9,NULL),(55,'Michael','Peterson','2407 Rodriguez Divide Apt. 281 Lake Leslieland, ND 27397','F',4787,'2019-02-21',7,NULL),(56,'Kelsey','Avila','6767 Heidi Mills Melendezville, KY 05085','F',4354,'1912-09-08',10,NULL),(57,'Francisco','Smith','51883 Thomas Mountains Suite 452 South Jennifer, DC 37212','N',3599,'1968-05-11',8,NULL),(58,'Kimberly','Ochoa','97725 Matthew Ranch Suite 439 Christianmouth, OH 10313','N',1884,'2006-04-04',3,NULL),(59,'Jessica','Sullivan','49628 Richardson Junctions Roberttown, FL 24908','F',9175,'1912-06-04',10,NULL),(60,'Dylan','Mitchell','691 Ryan Haven Apt. 096 Stephanieside, GA 26536','M',3056,'2009-04-23',4,NULL),(61,'Cynthia','Williams','23580 Stephen Keys Lake Justin, TN 69852','M',4744,'1936-03-07',3,NULL),(62,'Diana','King','858 Smith Fort West Curtis, DE 94846','N',8453,'2012-10-18',4,NULL),(63,'Charles','Macdonald','6490 Mason Port North Melissa, CT 45808','N',9778,'1979-03-21',6,NULL),(64,'Joshua','Payne','174 Gregory Manors Michaelmouth, ID 66700','F',7437,'1929-07-02',4,NULL),(65,'Christine','Simon','USS Perez FPO AP 51172','N',6094,'2018-05-20',2,NULL),(66,'Anita','Cortez','87875 Dwayne Shoal Apt. 407 Kimtown, DE 32733','F',4076,'1909-06-12',7,NULL),(67,'Jeffrey','Petty','03568 Christina Highway North Gloriastad, DC 21289','N',7379,'1953-09-29',3,NULL),(68,'Elizabeth','Gonzalez','00106 Rivera Plaza East Shane, ME 48324','F',9201,'1950-07-03',9,NULL),(69,'Nathan','Ortiz','69314 James Island Apt. 858 Samanthaburgh, DC 87747','N',2552,'1910-07-20',4,NULL),(70,'Dawn','Gilbert','425 Jonathan Shores Port Justin, SD 59399','F',4185,'2016-02-19',10,NULL),(71,'Patricia','Thompson','565 Gates Valleys Suite 904 Gailchester, PA 78046','N',5624,'1937-05-29',1,NULL),(72,'Arthur','Norman','010 Roberts Village East Michael, CA 91931','N',9412,'1906-02-14',10,NULL),(73,'Rhonda','Spencer','0110 Morales Field Kellyborough, LA 61326','N',1721,'1990-04-18',10,NULL),(74,'Laurie','Acosta','38993 Stephanie Expressway Suite 029 Brandonshire, FL 80751','F',8508,'1964-09-08',10,NULL),(75,'Michelle','Bean','7183 Fleming Plaza Suite 901 Knighthaven, GA 73407','N',6733,'1968-05-10',4,NULL),(76,'Michael','Ho','994 Weaver Crossroad Washingtonland, IL 96494','N',9171,'1919-10-03',4,NULL),(77,'Michael','Lopez','85265 Carpenter Summit Bowenborough, NM 43856','M',7143,'1961-05-19',1,NULL),(78,'Brandy','Cox','454 Scott Flat East Michaelfurt, KY 22050','N',8392,'1906-04-12',8,NULL),(79,'Paul','Bryant','26748 Sanders Shore Suite 423 Kaylaview, MN 52292','M',4298,'2014-05-12',6,NULL),(80,'Debbie','Kim','463 Evans Skyway Blairville, OH 61989','M',1703,'1984-06-16',3,NULL),(81,'Amy','Brown','26253 Reed Parkways Suite 641 Nicholasfurt, RI 21541','N',6416,'1908-08-09',6,NULL),(82,'Toni','Anderson','870 Riley Springs Suite 057 Scottstad, IL 08259','F',7883,'1945-04-21',5,NULL),(83,'Joyce','Smith','96137 Natalie Ridge Lake Allenberg, VT 34137','N',7107,'1926-07-25',1,NULL),(84,'Sarah','West','9211 Whitehead Way Apt. 933 Romeromouth, DC 76451','N',5753,'1956-02-22',10,NULL),(85,'Lorraine','Ferguson','9774 York Springs Hollowaymouth, WA 71659','F',1691,'1955-12-19',3,NULL),(86,'William','Oconnell','82022 Weeks Mall Lake Chris, MI 95268','F',4995,'2019-09-12',5,NULL),(87,'Tony','Hernandez','42679 Christopher Turnpike Howardhaven, TN 23836','F',9484,'1934-10-06',7,NULL),(88,'Benjamin','White','28445 Megan Plaza Joneschester, MO 85009','F',1394,'1949-06-09',3,NULL),(89,'Joseph','Gonzales','5728 Margaret Prairie Derrickstad, WY 90197','M',6342,'1927-07-22',3,NULL),(90,'Tracy','Foster','88540 Ashley Trail Suite 906 West Johnville, NH 04724','M',7704,'1941-11-08',1,NULL),(91,'Edward','Rojas','6611 Chavez Manors Jessicaton, MA 36162','F',9402,'2005-06-21',2,NULL),(92,'Derrick','Barry','991 Max Mills North Brandon, MS 09809','N',4381,'1939-05-31',10,NULL),(93,'Tami','Adams','PSC 8017, Box 4600 APO AA 29685','N',7906,'1923-07-22',1,NULL),(94,'Daniel','Marsh','USCGC Mccormick FPO AP 26227','F',7212,'1932-08-07',5,NULL),(95,'Adam','Terrell','09186 Mcdaniel Walks Nicoleberg, MA 61805','F',4532,'1940-05-28',4,NULL),(96,'Justin','Collins','26843 Meza Parkways Apt. 234 Port Kenneth, NH 18773','M',4834,'1923-01-17',9,NULL),(97,'Jennifer','Garcia','PSC 3253, Box 1199 APO AE 91503','F',2658,'1961-05-21',2,NULL),(98,'Thomas','Nelson','8152 Reyes Ville Lake Stacy, CO 56283','M',1333,'1990-03-01',1,NULL),(99,'Jeanne','Kennedy','USCGC Jordan FPO AE 19863','F',7781,'1992-03-02',10,NULL),(100,'Lawrence','Hernandez','990 King Ridges South Dustinfort, MA 09647','F',6151,'2008-11-29',9,NULL);
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
INSERT INTO `projeto` VALUES (1,'Carro autônomo',4,NULL),(2,'Vacina covid-19',1,NULL),(3,'Automação residencial',8,NULL),(4,'Colônia em Marte',6,NULL),(5,'Supercomputador quântico',10,NULL),(6,'Drone subacuático',7,NULL),(7,'HAL 9000',2,NULL),(8,'Skynet',5,NULL);
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
INSERT INTO `trabalha_em` VALUES (1,3,14),(2,6,20),(4,3,14),(5,3,4),(6,4,8),(7,6,20),(8,5,14),(9,7,14),(10,7,14),(11,2,14),(12,4,4),(13,1,20),(14,7,8),(15,3,14),(16,6,20),(17,6,40),(18,7,20),(19,6,4),(20,7,4),(22,1,20),(24,6,4),(25,3,8),(26,4,4),(29,5,40),(30,1,8),(33,8,40),(34,2,20),(37,5,14),(38,2,4),(39,4,14),(41,4,8),(42,2,14),(43,3,40),(44,4,8),(45,1,20),(46,5,20),(47,6,4),(50,8,20),(51,3,20),(52,7,8),(53,3,20),(55,6,20),(56,5,14),(57,3,14),(59,5,14),(60,1,20),(62,1,40),(63,4,14),(64,1,20),(65,7,8),(66,6,14),(69,1,8),(70,5,20),(71,2,4),(72,5,8),(73,5,40),(74,5,40),(75,1,20),(76,1,8),(77,2,40),(78,3,20),(79,4,14),(81,4,4),(82,8,20),(83,2,8),(84,5,40),(86,8,40),(87,6,14),(90,2,8),(91,7,4),(92,5,40),(93,2,20),(94,8,14),(95,1,40),(97,7,40),(98,2,20),(99,5,40);
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

-- Dump completed on 2020-03-24 17:00:15
