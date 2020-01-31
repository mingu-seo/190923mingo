<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: mingo
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `address_code`
--

DROP TABLE IF EXISTS `address_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_code` (
  `sido_name` varchar(100) DEFAULT NULL,
  `sido_code` int(11) DEFAULT NULL,
  `sigungu_name` varchar(100) DEFAULT NULL,
  `sigungu_code` int(11) DEFAULT NULL,
  `dong_name` varchar(100) DEFAULT NULL,
  `dong_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_code`
--

LOCK TABLES `address_code` WRITE;
/*!40000 ALTER TABLE `address_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `title` text NOT NULL,
  `contents` text NOT NULL,
  `regdate` timestamp NOT NULL,
  `readcount` int(11) DEFAULT '0',
  PRIMARY KEY (`board_id`),
  KEY `fk_board_user_id_idx` (`user_id`),
  CONSTRAINT `fk_board_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_comment`
--

DROP TABLE IF EXISTS `board_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_comment` (
  `board_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `board_id` int(11) NOT NULL,
  `regdate` timestamp NOT NULL,
  `group` int(11) NOT NULL,
  `seq` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`board_comment_id`),
  KEY `fk_board_comment_user_id_idx` (`user_id`),
  KEY `fk_board_comment_board_id_idx` (`board_id`),
  CONSTRAINT `fk_board_comment_board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_board_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_comment`
--

LOCK TABLES `board_comment` WRITE;
/*!40000 ALTER TABLE `board_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe`
--

DROP TABLE IF EXISTS `cafe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe` (
  `cafe_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `time_day` int(11) DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_end` int(11) DEFAULT NULL,
  `rate_avg` double DEFAULT NULL,
  `review_num` int(11) DEFAULT NULL,
  `cafe_intro` text,
  `cafe_like` int(11) DEFAULT NULL,
  `cafe_address` varchar(255) NOT NULL,
  `sido_name` varchar(100) NOT NULL,
  `sido_code` int(11) NOT NULL,
  `sigungu_name` varchar(100) NOT NULL,
  `sigungu_code` int(11) NOT NULL,
  `dong_name` varchar(100) NOT NULL,
  `dong_code` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `regdate` timestamp NULL DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cafe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='카페 기본 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe`
--

LOCK TABLES `cafe` WRITE;
/*!40000 ALTER TABLE `cafe` DISABLE KEYS */;
INSERT INTO `cafe` VALUES (2,'스타벅스','자양 3점','02-1234-5678',2,11,12,3.5,12,'안녕하세요. 스타벅스 자영점입니다.',2,'서울시 광진구','서울시',12,'광진구',12,'자양3동',14,33.450701,126.570667,'2020-01-30 06:11:13','starbucks.png',1),(16,'스타벅스','자양 3점','02-1234-5678',2,11,12,3.5,12,'안녕하세요. 스타벅스 자영점입니다.',2,'서울시 광진구','서울시',12,'광진구',12,'자양3동',14,33.450936,126.569477,'2020-01-30 06:11:48','starbucks.png',2),(17,'스타벅스','자양 3점','02-1234-5678',2,11,12,3.5,12,'안녕하세요. 스타벅스 자영점입니다.',2,'서울시 광진구','서울시',12,'광진구',12,'자양3동',14,33.450879,126.56994,'2020-01-30 06:11:48','starbucks.png',3),(18,'스타벅스','자양 3점','02-1234-5678',2,11,12,3.5,12,'안녕하세요. 스타벅스 자영점입니다.',2,'서울시 광진구','서울시',12,'광진구',12,'자양3동',14,33.451393,126.570738,'2020-01-30 06:11:49','starbucks.png',4);
/*!40000 ALTER TABLE `cafe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_facilities`
--

DROP TABLE IF EXISTS `cafe_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_facilities` (
  `cafe_facilities_id` int(11) NOT NULL AUTO_INCREMENT,
  `cafe_id` int(11) NOT NULL,
  `wifi` int(11) DEFAULT NULL,
  `wifi_text` text,
  `table` int(11) DEFAULT NULL,
  `table_text` text,
  `interior` int(11) DEFAULT NULL,
  `interior_text` text,
  `music` int(11) DEFAULT NULL,
  `music_text` text,
  `plug` int(11) DEFAULT NULL,
  `plug_text` text,
  `restroom` int(11) DEFAULT NULL,
  `restroom_text` text,
  `terrace` int(11) DEFAULT NULL,
  `terrace_text` text,
  `studyroom` int(11) DEFAULT NULL,
  `studyroom_text` text,
  `smoking` int(11) DEFAULT NULL,
  `smoking_text` text,
  `parking_text` text,
  PRIMARY KEY (`cafe_facilities_id`),
  KEY `fk_cafe_facilities_cafe_id_idx` (`cafe_id`),
  CONSTRAINT `fk_cafe_facilities_cafe_id` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`cafe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_facilities`
--

LOCK TABLES `cafe_facilities` WRITE;
/*!40000 ALTER TABLE `cafe_facilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cafe_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_image`
--

DROP TABLE IF EXISTS `cafe_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_image` (
  `cafe_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `cafe_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`cafe_image_id`),
  KEY `fk_cafe_image_cafe_id_idx` (`cafe_id`),
  CONSTRAINT `fk_cafe_image_cafe_id` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`cafe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_image`
--

LOCK TABLES `cafe_image` WRITE;
/*!40000 ALTER TABLE `cafe_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `cafe_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_menu`
--

DROP TABLE IF EXISTS `cafe_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_menu` (
  `cafe_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `cafe_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`cafe_menu_id`),
  KEY `fk_cafe_menu_cafe_id_idx` (`cafe_id`),
  CONSTRAINT `fk_cafe_menu_cafe_id` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`cafe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_menu`
--

LOCK TABLES `cafe_menu` WRITE;
/*!40000 ALTER TABLE `cafe_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `cafe_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_product`
--

DROP TABLE IF EXISTS `cafe_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_product` (
  `cafe_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `cafe_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`cafe_product_id`),
  KEY `fk_cafe_product_cafe_id_idx` (`cafe_id`),
  CONSTRAINT `fk_cafe_product_cafe_id` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`cafe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_product`
--

LOCK TABLES `cafe_product` WRITE;
/*!40000 ALTER TABLE `cafe_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `cafe_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_rate`
--

DROP TABLE IF EXISTS `cafe_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_rate` (
  `cafe_id` int(11) NOT NULL,
  `rate_num` int(11) NOT NULL,
  `taste_sum` int(11) NOT NULL,
  `mood_sum` int(11) NOT NULL,
  `service_sum` int(11) NOT NULL,
  `wifi_sum` int(11) NOT NULL,
  `clean_sum` int(11) NOT NULL,
  `price_sum` int(11) NOT NULL,
  `taste_avg` double NOT NULL,
  `mood_avg` double NOT NULL,
  `service_avg` double NOT NULL,
  `wifi_avg` double NOT NULL,
  `clean_avg` double NOT NULL,
  `price_avg` double NOT NULL,
  `cafe_total_avg` double NOT NULL,
  PRIMARY KEY (`cafe_id`),
  CONSTRAINT `fk_cafe_rate_cafe_id` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`cafe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_rate`
--

LOCK TABLES `cafe_rate` WRITE;
/*!40000 ALTER TABLE `cafe_rate` DISABLE KEYS */;
INSERT INTO `cafe_rate` VALUES (2,12,48,36,48,36,48,36,4,3,4,3,4,3,3.5);
/*!40000 ALTER TABLE `cafe_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_service`
--

DROP TABLE IF EXISTS `cafe_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_service` (
  `cafe_id` int(11) NOT NULL,
  `event` int(11) DEFAULT NULL,
  `coupon` int(11) DEFAULT NULL,
  `mileage` int(11) DEFAULT NULL,
  `blanket` int(11) DEFAULT NULL,
  `drinkrefill` int(11) DEFAULT NULL,
  PRIMARY KEY (`cafe_id`),
  CONSTRAINT `fk_cafe_service_cafe_id` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`cafe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_service`
--

LOCK TABLES `cafe_service` WRITE;
/*!40000 ALTER TABLE `cafe_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `cafe_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect_cafe`
--

DROP TABLE IF EXISTS `collect_cafe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collect_cafe` (
  `user_id` int(11) NOT NULL,
  `cafe_id` int(11) NOT NULL,
  KEY `fk_collect_cafe_user_id_idx` (`user_id`),
  KEY `fk_collect_cafe_cafe_id_idx` (`cafe_id`),
  CONSTRAINT `fk_collect_cafe_cafe_id` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`cafe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_collect_cafe_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect_cafe`
--

LOCK TABLES `collect_cafe` WRITE;
/*!40000 ALTER TABLE `collect_cafe` DISABLE KEYS */;
/*!40000 ALTER TABLE `collect_cafe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_board`
--

DROP TABLE IF EXISTS `like_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_board` (
  `user_id` int(11) NOT NULL,
  `board_id` int(11) NOT NULL,
  KEY `fk_post_like_user_id_idx` (`user_id`),
  KEY `fk_post_like_cafe_id_idx` (`board_id`),
  CONSTRAINT `fk_like_board_board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_like_board_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_board`
--

LOCK TABLES `like_board` WRITE;
/*!40000 ALTER TABLE `like_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_cafe`
--

DROP TABLE IF EXISTS `like_cafe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_cafe` (
  `user_id` int(11) NOT NULL,
  `cafe_id` int(11) NOT NULL,
  KEY `fk_like_cafe_user_id_idx` (`user_id`),
  KEY `fk_like_cafe_cafe_id_idx` (`cafe_id`),
  CONSTRAINT `fk_like_cafe_cafe_id` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`cafe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_like_cafe_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_cafe`
--

LOCK TABLES `like_cafe` WRITE;
/*!40000 ALTER TABLE `like_cafe` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_cafe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cafe_id` int(11) NOT NULL,
  `regdate` timestamp NOT NULL,
  `contents` text NOT NULL,
  `taste_score` int(11) NOT NULL,
  `price_score` int(11) NOT NULL,
  `facility_score` int(11) NOT NULL,
  `wifi_score` int(11) NOT NULL,
  `mood_score` int(11) NOT NULL,
  `clean_score` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_user_id_idx` (`user_id`),
  KEY `fk_cafe_id_idx` (`cafe_id`),
  CONSTRAINT `fk_review_cafe_id` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`cafe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_review_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='리뷰 테이블...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (14,12,2,'2020-01-30 06:50:57','홍대 입구역과 연결된 최상의 위치. 청결한고 편리한 시설. 친절한 의사 소통. 다음에도 꼭 다시 이용하고 싶은 숙소. 비치 품목 : 각종 욕실 용품, 충분한 수건과 휴지, 토스터기, 헤어드라이기 등등',4,3,4,3,4,3,'cafe2.jpg'),(15,12,2,'2020-01-30 06:51:45','홍대 입구역과 연결된 최상의 위치. 청결한고 편리한 시설. 친절한 의사 소통. 다음에도 꼭 다시 이용하고 싶은 숙소. 비치 품목 : 각종 욕실 용품, 충분한 수건과 휴지, 토스터기, 헤어드라이기 등등',4,3,4,3,4,3,'cafe2.jpg'),(16,12,2,'2020-01-30 06:51:57','홍대 입구역과 연결된 최상의 위치. 청결한고 편리한 시설. 친절한 의사 소통. 다음에도 꼭 다시 이용하고 싶은 숙소. 비치 품목 : 각종 욕실 용품, 충분한 수건과 휴지, 토스터기, 헤어드라이기 등등',4,3,4,3,4,3,'cafe2.jpg'),(17,12,2,'2020-01-30 06:51:57','홍대 입구역과 연결된 최상의 위치. 청결한고 편리한 시설. 친절한 의사 소통. 다음에도 꼭 다시 이용하고 싶은 숙소. 비치 품목 : 각종 욕실 용품, 충분한 수건과 휴지, 토스터기, 헤어드라이기 등등',4,3,4,3,4,3,'cafe2.jpg'),(18,12,2,'2020-01-30 06:51:58','홍대 입구역과 연결된 최상의 위치. 청결한고 편리한 시설. 친절한 의사 소통. 다음에도 꼭 다시 이용하고 싶은 숙소. 비치 품목 : 각종 욕실 용품, 충분한 수건과 휴지, 토스터기, 헤어드라이기 등등',4,3,4,3,4,3,'cafe2.jpg'),(19,12,2,'2020-01-30 06:51:58','홍대 입구역과 연결된 최상의 위치. 청결한고 편리한 시설. 친절한 의사 소통. 다음에도 꼭 다시 이용하고 싶은 숙소. 비치 품목 : 각종 욕실 용품, 충분한 수건과 휴지, 토스터기, 헤어드라이기 등등',4,3,4,3,4,3,'cafe2.jpg'),(20,12,2,'2020-01-30 06:51:59','홍대 입구역과 연결된 최상의 위치. 청결한고 편리한 시설. 친절한 의사 소통. 다음에도 꼭 다시 이용하고 싶은 숙소. 비치 품목 : 각종 욕실 용품, 충분한 수건과 휴지, 토스터기, 헤어드라이기 등등',4,3,4,3,4,3,'cafe2.jpg'),(21,12,2,'2020-01-30 06:51:59','홍대 입구역과 연결된 최상의 위치. 청결한고 편리한 시설. 친절한 의사 소통. 다음에도 꼭 다시 이용하고 싶은 숙소. 비치 품목 : 각종 욕실 용품, 충분한 수건과 휴지, 토스터기, 헤어드라이기 등등',4,3,4,3,4,3,'cafe2.jpg'),(22,12,2,'2020-01-30 06:51:59','홍대 입구역과 연결된 최상의 위치. 청결한고 편리한 시설. 친절한 의사 소통. 다음에도 꼭 다시 이용하고 싶은 숙소. 비치 품목 : 각종 욕실 용품, 충분한 수건과 휴지, 토스터기, 헤어드라이기 등등',4,3,4,3,4,3,'cafe2.jpg'),(23,12,2,'2020-01-30 06:52:00','홍대 입구역과 연결된 최상의 위치. 청결한고 편리한 시설. 친절한 의사 소통. 다음에도 꼭 다시 이용하고 싶은 숙소. 비치 품목 : 각종 욕실 용품, 충분한 수건과 휴지, 토스터기, 헤어드라이기 등등',4,3,4,3,4,3,'cafe2.jpg'),(24,12,2,'2020-01-30 06:52:11','홍대 입구역과 연결된 최상의 위치. 청결한고 편리한 시설. 친절한 의사 소통. 다음에도 꼭 다시 이용하고 싶은 숙소. 비치 품목 : 각종 욕실 용품, 충분한 수건과 휴지, 토스터기, 헤어드라이기 등등',4,3,4,3,4,3,'cafe2.jpg'),(25,12,2,'2020-01-30 06:52:11','홍대 입구역과 연결된 최상의 위치. 청결한고 편리한 시설. 친절한 의사 소통. 다음에도 꼭 다시 이용하고 싶은 숙소. 비치 품목 : 각종 욕실 용품, 충분한 수건과 휴지, 토스터기, 헤어드라이기 등등',4,3,4,3,4,3,'cafe2.jpg');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nickname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `gender` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `phone_num` varchar(45) DEFAULT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `business_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(2,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(3,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(4,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(5,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(6,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(7,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(8,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(9,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(10,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(11,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(12,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(13,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2),(14,'0ptimist0@naver.com','dbwls3304','재무이당','최재명','1992-10-02',2,2,'010-2692-7297','user_profile.png','서울특별시 동대문구 장안2동 316-4 301호',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-30 20:58:47
