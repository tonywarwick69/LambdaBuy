CREATE DATABASE  IF NOT EXISTS `qlbh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `qlbh`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: qlbh
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `activated` bit(1) DEFAULT NULL,
  `role` int DEFAULT NULL,
  `birthDay` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','$2a$10$eoYWDgKI5iOaSiPqsfVd/eagYgs13m7Q2/GIu4al2X4FAe1gdfe4G','Đồng Đức Khang',964772094,'windmotor2022@gmail.com','COD3.jpg',_binary '',1,NULL),('Bill123','$2a$10$sUUrVvDsHz2pOWSiNTxG/eOUUtBU2Ob134OyMTNcTBK/skdg0Ph7C','Billy Jones',987654321,'duc.khang165@gmail.com','user.png',_binary '',4,NULL),('David123','$2a$10$UaYczbiaX.mb4oN6nXImse4Ew3bdpA1Tk2nRWGhah6FksVlc8kiXG','David Waterson',955431426,'duc.khang165@gmail.com','user.png',_binary '',3,NULL),('KhangDong','$2a$10$0y8KxOHNLnPpxUZ/26wRo.G25NbJ7Xiu.ex9ikbHvSEQBfoZBUhe6','DONG DUC KHANG',964772094,'duc.khang165@gmail.com','Chains_Gold_wallpaper_V_02.jpg',_binary '',2,'1999-07-15'),('Longdz','$2a$10$L5/2HysJGtihl0gS3TS9resTXcOwWUpvSPoLeoT6BCVUsdEsHD.XW','Long Hoang',332467724,'long@gmail.com','30714389_173138760010464_1235140372791820288_n.jpg',_binary '',3,NULL),('megumin','$2a$10$9K7xjQOtjLtbiKBzNiq.f./FWhauPUng7ZsvVb0BX2Uhdwk5rNZRW','Megumin',972527819,'megumin@gmail.com','user.png',_binary '',4,NULL),('sherekhan','$2a$10$XQULMUMiIo193iVmqTrGrOuqK5Jo7SAf4l9/4pi3/8Iu0wmQy2tpu','Đồng Đức Khang',1234567890,'lonzomcf@yahoo.com.vn','user.png',_binary '',2,NULL),('Tony123','$2a$10$Oiuvj/dYSZnZT/55Q9M7WOkO54Icl36K3e2e/5GqMQVVE83/t6cr.','Tony Warwick',332759664,'duc.khang@yahoo.com.vn','user.png',_binary '',2,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-18 20:56:57
