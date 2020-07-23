-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: vuttr
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `vuttr_main`
--

DROP TABLE IF EXISTS `vuttr_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuttr_main` (
  `id_vuttr` int NOT NULL AUTO_INCREMENT,
  `txt_title` varchar(200) NOT NULL,
  `txt_link` varchar(200) NOT NULL,
  `txt_description` varchar(200) NOT NULL,
  PRIMARY KEY (`id_vuttr`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuttr_main`
--

LOCK TABLES `vuttr_main` WRITE;
/*!40000 ALTER TABLE `vuttr_main` DISABLE KEYS */;
INSERT INTO `vuttr_main` VALUES (2,'json-server','https://github.com/typicode/json-server','Fake REST API based on a json schema. Useful for mocking and creating APIs for front-end devs to consume in coding challenges.'),(10,'hotel','https://github.com/typicode/hotel','Local app manager. Start apps within your browser, developer tool with local .localhost domain and https out of the box.'),(17,'fastify','https://www.fastify.io/','Extremely fast and simple, low-overhead web framework for NodeJS. Supports HTTP2.');
/*!40000 ALTER TABLE `vuttr_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuttr_main_tags_list`
--

DROP TABLE IF EXISTS `vuttr_main_tags_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuttr_main_tags_list` (
  `id_tags_list` int NOT NULL AUTO_INCREMENT,
  `fk_vuttr_main` int NOT NULL,
  `fk_vuttr_tags` int NOT NULL,
  PRIMARY KEY (`id_tags_list`),
  UNIQUE KEY `id_tags_list_UNIQUE` (`id_tags_list`),
  KEY `fk_vuttr_idx` (`fk_vuttr_main`),
  KEY `fk_vuttr_tags_idx` (`fk_vuttr_tags`),
  CONSTRAINT `fk_vuttr_main` FOREIGN KEY (`fk_vuttr_main`) REFERENCES `vuttr_main` (`id_vuttr`),
  CONSTRAINT `fk_vuttr_tags` FOREIGN KEY (`fk_vuttr_tags`) REFERENCES `vuttr_tags` (`id_tags`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuttr_main_tags_list`
--

LOCK TABLES `vuttr_main_tags_list` WRITE;
/*!40000 ALTER TABLE `vuttr_main_tags_list` DISABLE KEYS */;
INSERT INTO `vuttr_main_tags_list` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,10,6),(7,10,7),(8,10,8),(9,10,9),(10,10,10),(11,10,11),(12,17,12),(13,17,13),(14,17,14),(15,17,15),(16,17,9);
/*!40000 ALTER TABLE `vuttr_main_tags_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuttr_security_profiles`
--

DROP TABLE IF EXISTS `vuttr_security_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuttr_security_profiles` (
  `id_security_profiles` int NOT NULL,
  `txt_description` varchar(45) NOT NULL,
  PRIMARY KEY (`id_security_profiles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuttr_security_profiles`
--

LOCK TABLES `vuttr_security_profiles` WRITE;
/*!40000 ALTER TABLE `vuttr_security_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `vuttr_security_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuttr_security_users`
--

DROP TABLE IF EXISTS `vuttr_security_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuttr_security_users` (
  `id_security_users` int NOT NULL AUTO_INCREMENT,
  `txt_name` varchar(200) NOT NULL,
  `txt_email` varchar(200) NOT NULL,
  `txt_password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_security_users`),
  UNIQUE KEY `id_security_profiles_UNIQUE` (`id_security_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuttr_security_users`
--

LOCK TABLES `vuttr_security_users` WRITE;
/*!40000 ALTER TABLE `vuttr_security_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `vuttr_security_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuttr_security_users_profiles`
--

DROP TABLE IF EXISTS `vuttr_security_users_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuttr_security_users_profiles` (
  `id_security_users_profiles` int NOT NULL AUTO_INCREMENT,
  `fk_security_users` int NOT NULL,
  `fk_sercurity_profiles` int NOT NULL,
  PRIMARY KEY (`id_security_users_profiles`),
  UNIQUE KEY `id_security_users_profiles_UNIQUE` (`id_security_users_profiles`),
  KEY `fk_security_users_idx` (`fk_security_users`),
  KEY `fk_security_profiles_idx` (`fk_sercurity_profiles`),
  CONSTRAINT `fk_security_profiles` FOREIGN KEY (`fk_sercurity_profiles`) REFERENCES `vuttr_security_profiles` (`id_security_profiles`),
  CONSTRAINT `fk_security_users` FOREIGN KEY (`fk_security_users`) REFERENCES `vuttr_security_users` (`id_security_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuttr_security_users_profiles`
--

LOCK TABLES `vuttr_security_users_profiles` WRITE;
/*!40000 ALTER TABLE `vuttr_security_users_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `vuttr_security_users_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuttr_tags`
--

DROP TABLE IF EXISTS `vuttr_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuttr_tags` (
  `id_tags` int NOT NULL,
  `txt_tags_description` varchar(200) NOT NULL,
  PRIMARY KEY (`id_tags`),
  UNIQUE KEY `id_tags_UNIQUE` (`id_tags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuttr_tags`
--

LOCK TABLES `vuttr_tags` WRITE;
/*!40000 ALTER TABLE `vuttr_tags` DISABLE KEYS */;
INSERT INTO `vuttr_tags` VALUES (1,'organization'),(2,'planning'),(3,'collaboration'),(4,'writing'),(5,'calendar'),(6,'api'),(7,'Json'),(8,'schema'),(9,'node'),(10,'github'),(11,'Rest'),(12,'web'),(13,'framework'),(14,'http2'),(15,'https'),(16,'localhost');
/*!40000 ALTER TABLE `vuttr_tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-22 20:26:11
