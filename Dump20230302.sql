CREATE DATABASE  IF NOT EXISTS `bienesraices_crud` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bienesraices_crud`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bienesraices_crud
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `descripcion` longtext,
  `habitaciones` int DEFAULT NULL,
  `wc` int DEFAULT NULL,
  `estacionamiento` int DEFAULT NULL,
  `creado` date DEFAULT NULL,
  `vendedores_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propiedades_vendedores_idx` (`vendedores_id`),
  CONSTRAINT `fk_propiedades_vendedores` FOREIGN KEY (`vendedores_id`) REFERENCES `vendedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

LOCK TABLES `propiedades` WRITE;
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT INTO `propiedades` VALUES (5,'casa en la playa',500000.00,NULL,'Una descripción si skljaslkdfj;laksjdfl;kasjdflk.jasdlk;fjl;kasjdfl;kasjld;kjfasdf',1,2,3,'2023-02-22',1),(6,'casa en la playa',234234.00,NULL,'ASDsdaasdfasdfasdf',1,2,3,'2023-02-22',1),(7,'casa en la playa',2121.00,NULL,'sdfgsdfgsdfgsdfgs',1,2,3,'2023-02-22',2),(8,'casa en la playa',600.00,'085ba760bfbe5710c3773cc7a7b3db58.jpg','fsdg',1,1,1,'2023-02-27',1),(9,'casa en la playa',1324.00,'1cdc2233a826944df236785dcd6337d5.jpg','asdfasdfasdf',1,2,3,'2023-02-27',3),(10,'casa en la playa',1324.00,'df4d904dbed9105fd945a6cea2ba4adc.jpg','asdfasdfasdf',1,2,3,'2023-02-27',3),(11,'casa en la playa',456.00,'29f117b05389fcc3f6c4b399bd1b0bc2.jpg','456456456456456ng4f5c6nmgv4nmh56v',4,5,4,'2023-02-27',1),(12,'casa en la playa',54.00,'59fc57224515d3bef349c3f782b69d3b.jpg','asdfasdf',1,2,3,'2023-02-27',2),(13,'casa en la playa',54.00,'0b1852ceede8e6f0ef9ca65b686ce7fb.jpg','asdfasdf',1,2,3,'2023-02-27',2),(14,'casa en la playa',54.00,'1cf2d5fcf4d562f06193c0e2983a8060.jpg','asdfasdf',1,2,3,'2023-02-27',2),(15,'casa en la playa',54.00,'6e855f600bdc9f69617bf2c3e77aedaf.jpg','asdfasdf',1,2,3,'2023-02-27',2),(16,'casa en la playa',54.00,'27d6b1dbc8751cd476aa1e075bfc6992.jpg','asdfasdf',1,2,3,'2023-02-27',2),(17,'casa en la playa',54.00,'c402310827566dbdca2c4328e4099bfb.jpg','asdfasdf',1,2,3,'2023-02-27',2),(18,'casa en la playa',54.00,'25b6fd80b9b3616b8524263022beb1f6.jpg','asdfasdf',1,2,3,'2023-02-27',2),(19,'casa en la playa',54.00,'ce1ddc5f31218ae02992de4e056d2896.jpg','asdfasdf',1,2,3,'2023-02-27',2),(20,'casa en la playa',234.00,'c87d6473d1e7bdb568946b7fe319709f.jpg','asdfasdfasf',1,2,3,'2023-02-27',1),(21,'casa en la playa',234.00,'19098d3e1fd8a5ccd6b77f4ca19625ce.jpg','asdfasdfasf',1,2,3,'2023-02-27',1),(22,'casa en la playa',234.00,'1879c4009fa0d82e6aad4755be77a1b8.jpg','asdfasdfasf',1,2,3,'2023-02-27',1),(23,'casa en la playa',234.00,'1f2da12c884d202865fade5037d34b6e.jpg','asdfasdfasf',1,2,3,'2023-02-27',1),(24,'casa',234.00,'1c23238af1f185ba7de4b0b6c8fd2e97.jpg','asdfasdf',1,2,3,'2023-02-27',1),(25,'casa',234.00,'72e8b144f618198f265574f15240c6ee.jpg','asdfasdf',1,2,3,'2023-02-27',1),(26,'casa en la playa',2134.00,'ba5fe4908ceb2daeba86534fb2183f69.jpg','asdf',1,2,3,'2023-02-27',2),(27,'casa en la playa',1232.00,'8a2b1328a5b9a95d3a31a31274bfaeb5.jpg','jmhgvfhjgvgj',1,2,3,'2023-02-27',1),(28,'casa en la playa',45.00,'9189b5e4a531b52ae1c26ab32552e6fc.jpg','safdsadf',1,2,3,'2023-02-27',3),(29,'casa en la playa',3245.00,'0fa8d8770dcdf9acebf38f2e9b8833d8.jpg','sdfasdfasdf',1,2,3,'2023-03-01',2);
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Yeison','Gomez',NULL),(2,'Juan','Torres','55447788'),(3,'Juan','Torres','55447788');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-02  9:14:01
