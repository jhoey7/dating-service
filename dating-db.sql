-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for osx10.10 (x86_64)
--
-- Host: 127.0.0.1    Database: test-db
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

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
-- Table structure for table `user_match_history`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_match_history` (
  `id` int(11) NOT NULL,
  `user_pubid` varchar(100) DEFAULT NULL,
  `match_user_pubid` varchar(100) DEFAULT NULL,
  `status` enum('PASS','LIKE') DEFAULT NULL,
  `create_ts` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_match_history_users_pubid_fk` (`user_pubid`),
  KEY `user_match_history_users_pubid_fk_2` (`match_user_pubid`),
  CONSTRAINT `user_match_history_users_pubid_fk` FOREIGN KEY (`user_pubid`) REFERENCES `users` (`pubid`),
  CONSTRAINT `user_match_history_users_pubid_fk_2` FOREIGN KEY (`match_user_pubid`) REFERENCES `users` (`pubid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_match_history`
--


--
-- Table structure for table `user_subscription`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_subscription` (
  `id` int(11) NOT NULL,
  `user_pubid` varchar(100) DEFAULT NULL,
  `subscription_no` varchar(100) DEFAULT NULL,
  `subscription_ts` timestamp NULL DEFAULT NULL,
  `validity_start_ts` timestamp NULL DEFAULT NULL,
  `validity_end_ts` timestamp NULL DEFAULT NULL,
  `create_ts` timestamp NULL DEFAULT NULL,
  `update_ts` timestamp NULL DEFAULT NULL,
  `feature_type` enum('UNLIMITED_SWIPE','VERIFIED_LABEL') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_subscription_users_pubid_fk` (`user_pubid`),
  CONSTRAINT `user_subscription_users_pubid_fk` FOREIGN KEY (`user_pubid`) REFERENCES `users` (`pubid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subscription`
--


--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `pubid` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mdn` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `is_unlimited_swipe` tinyint(1) DEFAULT 0,
  `is_verified` tinyint(1) DEFAULT 0,
  `token` text DEFAULT NULL,
  `expire_token_ts` timestamp NULL DEFAULT NULL,
  `counter_password` int(11) DEFAULT 0,
  `counter_password_exp_ts` timestamp NULL DEFAULT NULL,
  `create_ts` timestamp NULL DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_ts` timestamp NULL DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pubid`),
  KEY `users_mdn_email_index` (`mdn`,`email`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES ('7f8fa80d-0465-47cb-9458-73992cf2e341','john.doe@gmail.com','6281787765454','$2a$14$yMN82NWSfclqApMcfzdcDeKpZyAiH4hEshW.bPmCThTkuyFHv5nr2','john','John Doe','Jl. Pangandaran 100','1992-01-01','M',0,0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDcwMDU2NDksInVzZXJuYW1lIjoiNjI4MTc4Nzc2NTQ1NCJ9.e8Qo-LbzT2TW944qrCN06FKBDfvvGGwNFleeDMi7gGY','2024-02-03 17:14:09',3,'2024-02-02 18:05:56','2024-02-02 09:11:40','SYSTEM','2024-02-02 17:55:56','SYSTEM');
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-03  9:12:39
