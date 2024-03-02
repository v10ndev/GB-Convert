CREATE DATABASE  IF NOT EXISTS `greenbs_improve` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `greenbs_improve`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: greenbs_improve
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `commune` varchar(45) NOT NULL,
  `district` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `default_address` bit(1) DEFAULT NULL,
  `province_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6h32ws7shu7ei7c4dxvm5dyv6` (`province_id`),
  KEY `FKhrpf5e8dwasvdc5cticysrt2k` (`customer_id`),
  CONSTRAINT `FK6h32ws7shu7ei7c4dxvm5dyv6` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`),
  CONSTRAINT `FKhrpf5e8dwasvdc5cticysrt2k` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Thôn Châu Cầu','Thụy Khuê','Xã Châu Phong','Quế Võ','Đức','Nguyễn','0987876789','222990',_binary '',5,6),(2,'Thôn Bảo Tháp','','Xã Đông Cứu','Gia Bình','Anh','Chu Văn','0979980878','223350',_binary '\0',5,6);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logo` varchar(128) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_oce3937d2f4mpfqrycbr0l93m` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Untitled-128.jpg','Alphabooks'),(2,'nha-nam-235x235.jpg','Nhà xuất bản Nhã Nam'),(3,'download (2).jpg','Nhà sách Phương Nam'),(4,'5930d65bab02e14.png','Nhà sách First New'),(5,'NXBTrelogo.jpeg','Nhà xuất bản Trẻ'),(6,'Logo_THB_2015-04-mau-cam-2-1.jpg','Thai Hà Books'),(8,'download.png','Nhà xuất bản Kim Đồng');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands_categories`
--

DROP TABLE IF EXISTS `brands_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands_categories` (
  `brand_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`brand_id`,`category_id`),
  KEY `FK6x68tjj3eay19skqlhn7ls6ai` (`category_id`),
  CONSTRAINT `FK58ksmicdguvu4d7b6yglgqvxo` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `FK6x68tjj3eay19skqlhn7ls6ai` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands_categories`
--

LOCK TABLES `brands_categories` WRITE;
/*!40000 ALTER TABLE `brands_categories` DISABLE KEYS */;
INSERT INTO `brands_categories` VALUES (4,2),(8,2),(2,3),(3,3),(4,3),(5,3),(5,4),(2,5),(3,5),(4,5),(5,5),(6,5),(2,6),(4,6),(1,7),(3,7),(4,7),(5,7),(8,7),(1,8),(2,8),(4,8),(5,8),(6,8),(2,9),(3,9),(5,9),(1,10),(2,10),(3,10),(4,10),(5,10),(2,11),(4,11),(5,11),(6,11),(2,15);
/*!40000 ALTER TABLE `brands_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdagcsk6v6x4n1kxw3rkp57921` (`customer_id`),
  KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`),
  CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKdagcsk6v6x4n1kxw3rkp57921` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (8,1,10,2),(9,1,10,3),(16,1,11,5),(39,1,12,5);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(64) NOT NULL,
  `all_parent_ids` varchar(256) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `image` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jx1ptm0r46dop8v0o7nmgfbeq` (`alias`),
  UNIQUE KEY `UK_t8o6pivur7nn124jehx7cygw5` (`name`),
  KEY `FKsaok720gsu4u2wrgbk10b5n8d` (`parent_id`),
  CONSTRAINT `FKsaok720gsu4u2wrgbk10b5n8d` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'sach-kinh-te',NULL,_binary '','tin58.jpg','Sách kinh tế',NULL),(2,'sach van hoc',NULL,_binary '','nxbtre_full_14362020_093653.jpg','Sách văn học',NULL),(3,'lap-trinh-x','-4-',_binary '','1e6423ca303281ccd2628d474f6ec1b2.jpg','Lập trình',4),(4,'sach-cong-nghe-thong-tin',NULL,_binary '','thuc-hanh-microsoft-word-excel-powerpoint-2016-215x300.jpg','Sách công nghệ thông tin',NULL),(5,'tin-hoc-van-phong','-4-',_binary '','5c0ad0ffb3729f4cb9e1df5d6e5bd7d0.png','Tin học văn phòng',4),(6,'thiet-ke-do-hoa','-4-',_binary '','7185a9cdf9eb94f41c93123a899f2b9d.jpg','Thiết kế đồ hoạ',4),(7,'tho','-2-',_binary '','f80c050a5ab927ba5a463dcbe683f18f.jpg','Thơ',2),(8,'tieu-thuyet','-2-',_binary '','963d63c3dca69a9e40094b7765d4a70c.jpg','Tiểu thuyết',2),(9,'truyen-kinh-di',NULL,_binary '','89ea6ac483dd49b419523cf79df9eb0c.jpg','Truyện kinh dị',NULL),(10,'sach-doanh-nhan','-1-',_binary '','7.u5465.d20171016.t114605.458655.jpg','Sách doanh nhân',1),(11,'sach-khoi-nghiep','-1-',_binary '','66c96586421bab3555d883e5d8d6ef4c.png','Sách khởi nghiệp',1),(14,'sach-lich-su',NULL,_binary '','sach_lich_us.jpg','Sách lịch sử',NULL),(15,'tieu-thuyet-trinh-tham','-2-8-',_binary '','pasted image 0.jpg','tiểu thuyết trinh thám',8);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(4) NOT NULL,
  `name` varchar(64) NOT NULL,
  `symbol` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'VND','VND','VND'),(2,'USD','USD','USD');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `commune` varchar(45) NOT NULL,
  `district` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `authentication_type` varchar(10) DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(64) NOT NULL,
  `reset_password_token` varchar(30) DEFAULT NULL,
  `verification_code` varchar(64) DEFAULT NULL,
  `province_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rfbvkrffamfql7cjmen8v976v` (`email`),
  KEY `FKlg0qx2aec694jbt1pll3g5kqd` (`province_id`),
  CONSTRAINT `FKlg0qx2aec694jbt1pll3g5kqd` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (3,'woyami7735@toudrum.com','','Vật Lại','Ba Vì','woyami7735@toudrum.com','woyami7735@toudrum.com','7373737337','737373','DATABASE','2024-01-02 10:04:46.259000000000','woyami7735@toudrum.com',_binary '','$2a$10$EkSIQIqnaciSgvepTarxvu6o9p8f/oMJ6SgmTFzh0bu/FcTWBiV6C',NULL,'BmIqgSEsIevyQZKUktKJlFYctTrkf0fla8TzVTXR4ujKmmDoxKvvE7jGyN1IY5Ou',1),(6,'Số nhà 47','','Vật Lại','Ba Vì','Đức','Nguyễn Văn','0989786543','154870','DATABASE','2024-01-02 10:19:00.154000000000','tojiyav161@jobbrett.com',_binary '','$2a$10$wk4R6J8koNWgvkdheP9Qb.oJBtYPURgfRVsZ9pzl9t.gnPZ6oJIJW',NULL,NULL,1),(7,'số nhà 14','','Phường Mỹ Phước','Bến Cát','Bách','Lê Tiền','0876722892','825530','DATABASE','2024-01-03 03:01:07.180000000000','lebach@gmail.com',_binary '','$2a$10$LCC2bjeLsdpDRmUCU08t1.MQ3/gl3KcN9ybUwrNkYl8C4JTibOFkq',NULL,'me7N2hKeZy1RLXhV4mvR7Zj6fF8D1mKvVKJEz3rjCgaRKcABeB5n9YyyLSZ1hpAp',2),(8,'số nhà 327','','Ấp Vĩnh Lộc','Huyện Châu Phú	','Tới','Nguyễn','0876722893','882800','DATABASE','2024-01-03 03:18:30.483000000000','toinguyen@gmail.com',_binary '','$2a$10$9ARYCh3kWRrvznku..D1..hAeQkuSniCAKmOZhtRRENTBrIoxlhPy',NULL,'CpPNokLUzNSWvvYeSG7evrlnjyWLAk4OdwbtRxEHxNbpPc77XI8XEG4I4G2gmI49',4),(9,'Thôn Bảo Tháp','','Xã Đông Cứu','Quế Võ','Hiệp','Nguyễn Tuấn','0876722894','223350','DATABASE','2024-01-03 03:31:19.107000000000','hiep@gmail.com',_binary '','$2a$10$dBF5ynPSR9RphwhLT4oN8e3iPXD8HGGjXghqOrDHry1ckdd3XhgOG',NULL,'l5tKZ0LWTIT0WrnoUX30DTyfWNEQIKkmb5ngujCe4XhNIvLbPnpn0ohXPd9lsqjN',5),(10,'Khu phố 2','','Phường Mỹ Phước','Bến Cát','Huy','Nguyễn Quang Huy','0876722895 ','825530','DATABASE','2024-01-03 03:33:12.204000000000','huy@gmail.com',_binary '','$2a$10$0A6S5PuSO0aYI/X02PjyQ.MYUWtjaQwbpgyhm7n3qGI3Ww36YFGl.',NULL,'yISkZin9pP7Qp1yjDkZZwgGkVh3KnmSrhBxNhVu6Qh74OFhnEW9iNLqKVNOHRzG4',2),(11,'Khóm 1,','','Thị Trấn Cái Nước, Huyện Cái Nước','Cái Nước','Anh','Mai Tuấn','0876722896','972700','DATABASE','2024-01-03 03:35:06.709000000000','tuan@gmail.com',_binary '','$2a$10$28Xd.Enm4SGA4MrVpaXajeurl0LeEQmd3BLBolEdmkQ9RosBkeVGS',NULL,'xDLN3IWciTfKYSQDysLZiJ1lY8DrUdOT4OKSapdnVYn5H3UNPoPIviTq1DgG9NFR',6),(12,'Số 436, Đường Trưng Nữ Vương','','Phường Hòa Thuận Đông','Ngũ Hành Sơn','Chinh','Trần Đức','0876722898 ','552200','DATABASE','2024-01-03 03:37:40.593000000000','chinh@gmail.com',_binary '','$2a$10$wsz5D1vkW1Q71gnFqo56pOb3PsslnYw83D0nQZDI9i8NTx6oKmFiq',NULL,'Zsi2sx8lKrYbPuQEAbxWNI1nlG9nfumuk9xV9T47GStf5LoQVocajnrIyYl14T7V',7),(13,'Số 197, Đường Nguyễn Đức Thuận,','','Thị trấn Trâu Quỳ','Ba Vì','Toàn','Nguyễn Hữu','0876722899','131000','DATABASE','2024-01-03 03:39:53.663000000000','toan@gmail.com',_binary '','$2a$10$v4lBmj5sgpKzawj5kWk8oO3gze/wGVx3fyULiPIthTxcxqovsSQF2',NULL,'aUsJzasO8TPcaB7Qm6Fs9KKA1NMp1QobI8zc15AEKMwkXBQZDI2aIqpML5yRNId9',8),(14,'Thôn Túy Loan Đông','',' Xã Hoà Phong','Hòa Vang','Nam','Dương Hải','0989786543','556630','DATABASE','2024-01-04 18:06:23.984000000000','hainam.duonghai@gmail.com',_binary '\0','$2a$10$DgSO6hn1GBHFbJNJD55nne2qgzsP33B60FUiMUYoBogQNfVhuiXlm',NULL,'CuAZJjcrb4Q9pS3lAzZ8WX7kMRSEbxaPESbNZf1cW7r2NwEggmAjhY1TvgKSh6Ug',7),(15,'',NULL,'','','Van','Luc Nguyen','','','GOOGLE','2024-01-06 13:58:37.610000000000','vl.vanlucnguyen@gmail.com',_binary '','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `province_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK82doq1t64jhly7a546lpvnu2c` (`province_id`),
  CONSTRAINT `FK82doq1t64jhly7a546lpvnu2c` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Bình Lục',1),(2,'Bến Cát',2),(3,'Tamil Nadu',2),(4,'Duy Tiên',1),(5,'Huyện An Phú',4),(6,'Huyện Châu Phú	',4),(7,'Chợ Mới',4),(8,'Gia Bình',5),(9,'Lương Tài',5),(10,'Quế Võ',5),(11,'Tiên Du',5),(12,'Tân Uyên',2),(13,'Phú Giáo',2),(14,'Cái Nước',6),(15,'Năm Căn',6),(16,'Ngọc Hiển',6),(17,'Phú Tân',6),(18,'Thới Bình',6),(19,'Hòa Vang',7),(20,'Hải Châu',7),(21,'Hoàng sa',7),(22,'Liên Chiểu',7),(23,'Ngũ Hành Sơn',7),(24,'Ba Vì',8),(25,'Chương Mĩ',8),(26,'Hoài Đức',8),(27,'Gia Lâm',8),(28,'Phúc Thọ',8),(29,'Khóm 1 , Thị Trấn Cái Nước, Huyện Cái Nước',6),(30,'Gia Lộc',3),(31,'Kim Thành',3),(32,'Kinh Môn',3);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_cost` float NOT NULL,
  `quantity` int NOT NULL,
  `shipping_cost` float NOT NULL,
  `subtotal` float NOT NULL,
  `unit_price` float NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,160000,2,1431.65,219000,109500,1,1),(3,120000,1,28.0403,125000,125000,3,4),(4,100000,1,6.47482,124800,124800,4,11),(5,90000,1,6.47482,110400,110400,4,13),(6,80,2,12.9496,121040,60520,4,15),(7,100000,1,94.964,124000,124000,5,10),(8,160000,2,189.928,208000,104000,5,12),(9,80000,1,780.898,109500,109500,6,1),(10,100000,1,75.5396,97500,97500,6,9),(11,100000,1,51.7986,124000,124000,7,10),(12,240000,2,56.0806,250000,125000,7,4),(13,150000,3,64.7482,225000,75000,7,3),(14,100000,1,138.489,97500,97500,8,9),(15,50000,1,39.5683,75000,75000,9,3),(16,675000,1,213.669,680400,680400,10,6),(17,50000,1,39.57,75000,75000,11,3),(18,675000,1,213.67,680400,680400,13,6),(19,675000,1,213.67,680400,680400,15,6),(20,240000,3,284.892,312000,104000,17,12),(21,40,1,94.964,60520,60520,17,15),(22,100000,1,0,144900,144900,17,17),(23,100000,1,94.964,124800,124800,17,11),(24,40000,1,94.964,49700,49700,17,14),(25,90000,1,94.964,110400,110400,17,13),(26,100000,1,94.964,124000,124000,17,10),(27,40000,2,221.583,44800,22400,17,8),(28,50000,2,237.41,60800,30400,17,7),(29,30000,1,2.69784,39840,39840,18,2),(30,100000,1,0,144900,144900,18,17),(31,675000,1,14.5683,680400,680400,18,6),(32,50000,1,21.5827,75000,75000,19,3),(33,100000,1,75.5396,97500,97500,19,9),(34,60000,3,181.295,67200,22400,19,8),(35,90000,1,51.7986,110400,110400,19,13),(36,100000,1,51.7986,124000,124000,19,10),(37,30000,1,21.5827,39840,39840,19,2),(38,25000,1,64.7482,30400,30400,19,7),(39,200000,1,50.0719,249000,249000,19,5),(40,120000,1,28.0403,125000,125000,19,4),(41,100000,1,51.7986,124800,124800,19,11),(42,40,1,51.7986,60520,60520,19,15),(43,100000,1,0,144900,144900,19,17);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_track`
--

DROP TABLE IF EXISTS `order_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_track` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notes` varchar(256) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK31jv1s212kajfn3kk1ksmnyfl` (`order_id`),
  CONSTRAINT `FK31jv1s212kajfn3kk1ksmnyfl` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_track`
--

LOCK TABLES `order_track` WRITE;
/*!40000 ALTER TABLE `order_track` DISABLE KEYS */;
INSERT INTO `order_track` VALUES (1,'Order was placed by the customer','NEW','2024-01-01 22:30:26.000000000000',1),(2,'Khách hàng đã nhận sản phẩm','DELIVERED','2024-01-02 13:59:00.312000000000',1),(6,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-02 20:46:12.615000000000',1),(7,'Yêu cầu đang được xử lý','PROCESSING','2024-01-02 20:46:12.615000000000',1),(8,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-04 14:58:59.465000000000',3),(9,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-04 18:20:27.229000000000',4),(10,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-04 18:25:42.846000000000',5),(11,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-04 18:26:53.644000000000',6),(12,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-04 18:43:21.972000000000',7),(13,'Người gửi hàng đang giao gói hàng','SHIPPING','2024-01-06 17:11:35.034000000000',7),(14,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-06 15:51:34.133000000000',8),(15,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-06 15:54:27.758000000000',9),(16,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-06 15:55:14.796000000000',10),(17,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-06 03:57:05.000000000000',11),(21,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-06 04:03:13.000000000000',13),(23,'Khách hàng đã nhận sản phẩm','DELIVERED','2024-01-06 19:04:41.265000000000',11),(24,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-06 04:05:48.000000000000',15),(25,'Khách hàng đã nhận sản phẩm','DELIVERED','2024-01-06 19:06:41.184000000000',15),(27,'Khách hàng đã nhận sản phẩm','DELIVERED','2024-01-06 19:13:13.424000000000',13),(28,'Khách hàng đã nhận sản phẩm','DELIVERED','2024-01-06 19:14:36.702000000000',10),(29,'Khách hàng đã nhận sản phẩm','DELIVERED','2024-01-06 19:14:43.817000000000',9),(30,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-06 16:20:21.755000000000',17),(31,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-06 16:22:24.997000000000',18),(32,'Khách hàng đã nhận sản phẩm','DELIVERED','2024-01-06 19:22:53.963000000000',18),(33,'Khách hàng đã nhận sản phẩm','DELIVERED','2024-01-06 19:25:20.567000000000',17),(34,'Đơn hàng được đặt bởi khách hàng','NEW','2024-01-06 16:33:41.849000000000',19),(35,'Khách hàng đã nhận sản phẩm','DELIVERED','2024-01-06 19:34:19.337000000000',19);
/*!40000 ALTER TABLE `order_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `commune` varchar(45) NOT NULL,
  `district` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `deliver_date` datetime(6) DEFAULT NULL,
  `deliver_days` int NOT NULL,
  `order_time` datetime(6) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `product_cost` float NOT NULL,
  `province` varchar(45) NOT NULL,
  `shipping_cost` float NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `subtotal` float NOT NULL,
  `tax` float NOT NULL,
  `total` float NOT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpxtb8awmi0dk6smoh2vp1litg` (`customer_id`),
  CONSTRAINT `FKpxtb8awmi0dk6smoh2vp1litg` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Số nhà 47','','Vật Lại','Ba Vì','Đức','Nguyễn Văn','0989786543','154870','2024-01-04 20:00:00.000000000000',2,'2024-01-02 20:46:12.697000000000','COD',160000,'Hà Nội',1431.65,'SHIPPING',219000,0,220432,6),(3,'Thôn Châu Cầu','Thụy Khuê','Xã Châu Phong','Quế Võ','Đức','Nguyễn','0987876789','222990','2024-01-07 14:58:59.465000000000',3,'2024-01-04 14:58:59.465000000000','COD',120000,'Bắc Ninh',28.0403,'NEW',125000,0,125028,6),(4,'Số 197, Đường Nguyễn Đức Thuận,','','Thị trấn Trâu Quỳ','Ba Vì','Toàn','Nguyễn Hữu','0876722899','131000','2024-01-06 18:20:27.229000000000',2,'2024-01-04 18:20:27.229000000000','COD',190080,'Hà Nội',25.8993,'NEW',356240,0,356266,13),(5,'Số 436, Đường Trưng Nữ Vương','','Phường Hòa Thuận Đông','Ngũ Hành Sơn','Chinh','Trần Đức','0876722898 ','552200','2024-01-07 18:25:42.846000000000',3,'2024-01-04 18:25:42.846000000000','COD',260000,'Đà Nẵng',284.892,'NEW',332000,0,332285,12),(6,'Thôn Bảo Tháp','','Xã Đông Cứu','Quế Võ','Hiệp','Nguyễn Tuấn','0876722894','223350','2024-01-07 18:26:53.644000000000',3,'2024-01-04 18:26:53.644000000000','COD',180000,'Bắc Ninh',856.437,'NEW',207000,0,207856,9),(7,'Thôn Châu Cầu','Thụy Khuê','Xã Châu Phong','Quế Võ','Đức','Nguyễn','0987876789','222990','2024-01-07 18:43:21.972000000000',3,'2024-01-04 18:43:21.972000000000','COD',490000,'Bắc Ninh',172.627,'SHIPPING',599000,0,599173,6),(8,'Số 436, Đường Trưng Nữ Vương','','Phường Hòa Thuận Đông','Ngũ Hành Sơn','Chinh','Trần Đức','0876722898 ','552200','2024-01-09 15:51:34.133000000000',3,'2024-01-06 15:51:34.133000000000','COD',100000,'Đà Nẵng',138.489,'NEW',97500,0,97638.5,12),(9,'Số 436, Đường Trưng Nữ Vương','','Phường Hòa Thuận Đông','Ngũ Hành Sơn','Chinh','Trần Đức','0876722898 ','552200','2024-01-09 15:54:27.758000000000',3,'2024-01-06 15:54:27.758000000000','COD',50000,'Đà Nẵng',39.5683,'DELIVERED',75000,0,75039.6,12),(10,'Số 436, Đường Trưng Nữ Vương','','Phường Hòa Thuận Đông','Ngũ Hành Sơn','Chinh','Trần Đức','0876722898 ','552200','2024-01-09 15:55:14.796000000000',3,'2024-01-06 15:55:14.796000000000','COD',675000,'Đà Nẵng',213.669,'DELIVERED',680400,0,680614,12),(11,'Số 436, Đường Trưng Nữ Vương','','Phường Hòa Thuận Đông','Ngũ Hành Sơn','Chinh','Trần Đức','0876722898 ','552200','2024-01-08 20:00:00.000000000000',3,'2024-01-06 15:57:05.347000000000','COD',50000,'Đà Nẵng',39.57,'DELIVERED',75000,0,75039.6,12),(13,'Số 436, Đường Trưng Nữ Vương','','Phường Hòa Thuận Đông','Ngũ Hành Sơn','Chinh','Trần Đức','0876722898 ','552200','2024-01-08 20:00:00.000000000000',3,'2024-01-06 16:03:13.302000000000','COD',675000,'Đà Nẵng',213.67,'DELIVERED',680400,0,680614,12),(15,'Số 436, Đường Trưng Nữ Vương','','Phường Hòa Thuận Đông','Ngũ Hành Sơn','Chinh','Trần Đức','0876722898 ','552200','2024-01-08 20:00:00.000000000000',3,'2024-01-06 16:05:48.969000000000','COD',675000,'Đà Nẵng',213.67,'DELIVERED',680400,0,680614,12),(17,'Số 436, Đường Trưng Nữ Vương','','Phường Hòa Thuận Đông','Ngũ Hành Sơn','Chinh','Trần Đức','0876722898 ','552200','2024-01-09 16:20:21.755000000000',3,'2024-01-06 16:20:21.755000000000','COD',760040,'Đà Nẵng',1218.71,'DELIVERED',1031920,0,1033140,12),(18,'Số 197, Đường Nguyễn Đức Thuận,','','Thị trấn Trâu Quỳ','Ba Vì','Toàn','Nguyễn Hữu','0876722899','131000','2024-01-08 16:22:24.997000000000',2,'2024-01-06 16:22:24.997000000000','COD',805000,'Hà Nội',17.2662,'DELIVERED',865140,0,865157,13),(19,'Thôn Bảo Tháp','','Xã Đông Cứu','Quế Võ','Hiệp','Nguyễn Tuấn','0876722894','223350','2024-01-09 16:33:41.849000000000',3,'2024-01-06 16:33:41.849000000000','COD',975040,'Bắc Ninh',650.055,'DELIVERED',1248560,0,1249210,9);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnfvvq3meg4ha3u1bju9k4is3r` (`product_id`),
  CONSTRAINT `FKnfvvq3meg4ha3u1bju9k4is3r` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (1,'Công ty phát hành','Nhã Nam',1),(2,'Ngày xuất bản','2023-05-11 00:00:00',1),(3,'Kích thước','13 x 20.5 cm',1),(4,'Dịch Giả','Trịnh Lữ',1),(5,'Loại bìa','Bìa mềm',1),(6,'Số trang','556',1),(7,'Công ty phát hành','NXB Kim Đồng',2),(8,'Ngày xuất bản','2023-06-11 00:00:00',2),(9,'Kích thước','13 x 19 cm',2),(10,'Loại bìa','Bìa mềm',2),(11,'Ngày xuất bản','2019-01-27 14:29:16',3),(12,'Loại bìa','Bìa mềm',3),(13,'Số trang','120',3),(14,'Ngày xuất bản','2021-02-25 09:56:27',4),(15,'Kích thước','25x20cm',6),(16,'Loại bìa','Bìa mềm',6),(17,'Ngày xuất bản','2019-09-09 00:00:00',7),(18,'Công ty phát hành','CÔNG TY TNHH THƯƠNG MẠI SÁCH NHÂN DÂN',8),(19,'Ngày xuất bản','2021-05-13 09:26:55',9),(20,'Kích thước','16 x 24 cm',10),(21,'Loại bìa','Bìa mềm',11),(22,'Số trang','415',11),(23,'Ngày xuất bản','2020-09-28 09:35:45',12),(24,'Kích thước','16 x 24 cm',12),(25,'Loại bìa','Bìa mềm',12),(26,'Kích thước','16 x 24 x 2',13),(27,'Dịch Giả','Nhiều Tác Giả',13),(28,'Loại bìa','Bìa mềm',13),(29,'Ngày xuất bản','2020-05-28 00:00:00',14),(30,'Kích thước','14 x 22.5 cm',14),(31,'Loại bìa','Bìa mềm',14),(32,'Ngày xuất bản','2023-08-28 00:00:00',15),(33,'Kích thước','13 x 18 cm',15),(34,'Dịch Giả','Trúc Ly',15),(36,'Công ty phát hành	','Phuc Minh Books',17),(37,'Ngày xuất bản	','2023-09-02 08:25:58',17),(38,'Dịch Giả','Ngô Thế Vinh',17);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`),
  CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'88fb47250fa048a95fc6eb62102158fe.jpg',1),(2,'0942e41f9bb6554be4e1f0506a052138.jpg',1),(3,'398ab9c09ce50dffcbb40b45b5fd8223.jpg',2),(4,'9b6c95e31f354ce3871d6c7231723bd2.jpg',2),(5,'d15da278837e1fc366dee42d357e935e.jpg',3),(7,'83e6e8d65ba605177a1136ef6f926316.jpg',3),(8,'47e5912f5ed47b6f31d661abb87a013c.jpg',4),(9,'057be76d2ab4c4311252d3332e4499a1.jpg',5),(10,'d168c7fa8dc55e97d10331d86f4564d6.jpg',5),(11,'536bcdbc6444eaad341e49cce8a403aa.jpg',6),(12,'1249b4f103f20861244afe3c8941d9f7.jpg',6),(13,'1abfaff7215e9d5dd04a529dc22f68c9.jpg',6),(14,'c9c75fbf42f19faa958d51f55d365241.jpg',7),(15,'5f65744bca3a718e38d328c941743692.png',9),(16,'5bada47a8a1b0518d3cf86cb1d6de33d.jpg',10),(17,'f2a8b2557bf9c41ddb2f461488785bc2.jpg',11),(18,'ff162bd02375afb49a9d9dbacffface6.jpg',11),(19,'ab23b73fc3af2e8669192650d254f675.jpg',12),(20,'5fc198b96e23036c44fdbae0fdff095d.jpg',13),(21,'fae4fd16e220663849c07ece8c9f9863.jpg',13),(22,'af5c17a9f0d56343bcac7e038848abee.jpg',14),(23,'22a789a5a21a35640714f434c8636696.jpg',14),(24,'5caa7396545d1dc8ebe9c050c7242169.jpg',15),(25,'0fa6e1b3285993b4cac184e56965a6f1.jpg',15),(27,'db7482b0a5867f30cac775533740572a.jpg',17),(28,'c4824c40625b55328f1e196187bfd8fb.jpg',17);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `average_rating` float NOT NULL,
  `cost` float NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `discount_percent` float DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `full_description` varchar(4096) NOT NULL,
  `height` float NOT NULL,
  `in_stock` bit(1) DEFAULT NULL,
  `length` float NOT NULL,
  `main_image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `review_count` int NOT NULL,
  `short_description` varchar(512) NOT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `weight` float NOT NULL,
  `width` float NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8qwq8q3hk7cxkp9gruxupnif5` (`alias`),
  UNIQUE KEY `UK_o61fmio5yukmmiqgnxf8pnavn` (`name`),
  KEY `FKa3a4mpsfdf4d2y6r8ra3sc8mv` (`brand_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKa3a4mpsfdf4d2y6r8ra3sc8mv` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Rừng-Nauy-(Tái-Bản)',3.5,80000,NULL,27,_binary '','<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Câu chuyện bắt đầu từ một chuyến bay trong ngày mưa ảm đạm, một người đàn ông 37 tuổi chợt nghe thấy bài hát gắn liền với hình ảnh người yêu cũ, thế là quá khứ ùa về xâm chiếm thực tại. Mười tám năm trước, người đàn ông ấy là chàng Toru Wanatabe trẻ trung, mỗi chủ nhật lại cùng nàng Naoko lang thang vô định trên những con phố Tokyo. Họ sánh bước bên nhau để thấy mình còn sống, còn tồn tại, và gắng gượng tiếp tục sống, tiếp tục tồn tại sau cái chết của người bạn cũ Kizuki. Cho đến khi Toru nhận ra rằng mình thực sự yêu và cần có Naoko thì cũng là lúc nàng không thể chạy trốn những ám ảnh quá khứ, không thể hòa nhập với cuộc sống thực tại và trở về dưỡng bệnh trong một khu trị liệu khép kín. Toru, bên cạnh giảng đường vô nghĩa chán ngắt, bên cạnh những đêm chơi bời chuyển từ cảm giác thích thú đến uể oải, ghê tởẫn kiên nhẫn chờ đợi và hy vọng vào sự hồi phục của Naoko. Cuối cùng, những lá thư, những lần thăm hỏi, hồi ức về lần ân ái duy nhất của Toru không thể níu Naoko ở lại, nàng chọn cái chết như một lối đi thanh thản. Từ trong mất mát, Toru nhận ra rằng mình cần tiếp tục sống và bắt đầu tình yêu mới với Midori.</span><br></div>',26,_binary '',49,'a9cfc425fa590c453f20307229804bb3.jpg','Rừng Nauy (Tái Bản)',150000,2,'<div><div>\"\"Rừng Na-uy\" là một câu chuyện tình giản dị.</div><div>Giản dị như sự thật</div><div>Như bốn mùa</div><div>Như Sống/Chết</div></div>','2023-12-31 22:11:17.282000000000',1.2,71,2,8),(2,'Thơ-Hàn-Mặc-Tử---Văn-Học-Trong-Nhà-Trường',4.5,30000,'2024-01-01 14:51:09.443000000000',17,_binary '','<div><div>“Hàn Mặc Tử được sinh ra cho thơ. Sinh thời, Hàn đã sống bằng thơ. Bây giờ và mai sau Hàn vẫn sống bằng thơ. Bởi vì Hàn đã chết cho mỗi lời thơ. Đó là bài học về thơ đắt giá và sáng giá nhất của muôn đời.” - Nhà phê bình văn học CHU VĂN SƠN</div><div>“Thơ Hàn Mặc Tử đi từ trong sáng đến đau thương, bay lên thượng tầng đớn đau chết chóc, rồi trở lại những tinh khiết ban đầu như chưa bao giờ bợn gợn những vật vã kinh hoàng trần thế. Thơ đi cùng Hàn từ thơ ấu đến dậy thì, thành niên với những say mê đắm đuối, rồi thơ mắc bạo bệnh về cõi chết cùng Hàn. Nhưng ở những giây phút khắc nghiệt nhất, hoang loạn nhất, vẫn có hai Hàn, hai thơ: một Hàn của mộng đẹp khi cơn đau lắng xuống và một Hàn của mộng dữ khi cơn đau dấy lên cực điểm. Một Hàn thổ huyết và một Hàn trở lại bình an sau mỗi sóng bão phong ba.” - Nhà phê bình văn học THỤY KHUÊ -</div><div>Nhằm giúp các bạn học sinh có một nền tảng kiến thức văn học phong phú, vững vàng, Nhà xuất bản Kim Đồng tổ chức biên soạn bộ sách Tủ sách Văn học trong nhà trường.</div></div>',5,_binary '',25,'a3f440d3386b8b6e060a5a72635d4849.jpg','Thơ Hàn Mặc Tử - Văn Học Trong Nhà Trường',48000,2,'<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">“Trong khoảng trên dưới một chục năm hoạt động trong thi đàn, Hàn Mặc Tử đã từ cổ điển, lãng mạn, tiến nhanh sang tượng trưng, siêu thực, góp một phần quan trọng vào quá trình hiện đại hóa thi ca Việt Nam. Điều đáng kể nhất là ở loại hình nào, phạm trù nào, Hàn Mặc Tử cũng là trụ cột.” - Giáo sư PHAN CỰ ĐỆ</span><br></div>','2024-01-01 14:51:09.443000000000',0.4,20,4,7),(3,'Cuộc-đời-kỳ-lạ-của-Nikola-Tesla-(tái-bản-2018)',4.5,50000,NULL,0,_binary '','<div><div>Thật không dễ để hiểu thấu hết những gì đang diễn ra trong đầu Tesla, một thiên tài với trí nhớ hình ảnh, biết tám thứ tiếng và có tầm nhìn vượt thời đại. Những gì ông đã viết trong quyển sách này có thể kỳ lạ và khó tin, nhưng hãy nhớ rằng, người ta đã mất gần một thế kỷ để biết những gì Tesla đề xuất là chính xác và khả thi!</div><div>Hy vọng quý bạn đọc có thể nhìn ra được điều gì đó mới mẻ trong những câu chữ của Tesla, bởi đó có thể là những hiểu biết giúp ta thay đổi cả thế giới này.</div><div>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....</div></div>',5,_binary '',25,'6153934e717e7f2c55ba0ab16abddbc5.jpg','Cuộc đời kỳ lạ của Nikola Tesla (tái bản 2018)',75000,2,'<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Được mệnh danh là “nhà khoa học điên” của giới vật lý, Tesla là người đi tiên phong đưa kỹ thuật điện, điện từ vào đời sống. Với cách tư duy kỳ lạ của mình, ông đã có đến khoảng 300 bằng phát minh, tiêu biểu như động cơ điện không đồng bộ hay lõi Tesla. Rất nhiều phát minh của Tesla đang được ứng dụng trong các thiết bị điện xung quanh ta ngày nay.</span><br></div>','2024-01-01 15:14:58.160000000000',0.4,20,3,10),(4,'Python-cơ-bản',5,120000,NULL,0,_binary '','<div><div>Hiện nay ngôn ngữ lập trình bậc cao Python đang nổi lên như một ngôn ngữ lập trình được sử dụng NHIỀU NHẤT trên thế giới. Điều này được giải thích bằng các lý do sau:</div><div class=\"text_exposed_show\" style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><div><span class=\"_5mfr\"><span class=\"_6qdm\"></span></span>Python là ngôn ngữ lập trình bậc cao khá đơn giản, dễ học, dễ viết.</div><div><span class=\"_5mfr\"><span class=\"_6qdm\"></span></span>Cách viết lệnh của Python khá đặc biệt, sử dụng các dấu cách (viết thụt vào) để mô tả các nhóm (block) lệnh. Đặc điểm này làm cho việc viết lệnh Python gần giống với cách viết, trình bày văn bản hàng ngày. Chính đặc điểm này làm cho ngôn ngữ lập trình Python rất dễ viết, trong sáng, ngày càng phát triển và được đưa vào môi trường giáo dục thay cho các ngôn ngữ truyền thống như Pascal, C hay Java.</div><div><span class=\"_5mfr\"><span class=\"_6qdm\"></span></span>Python là ngôn ngữ mã nguồn mở và cho phép cộng đồng có thể đóng góp bằng cách bổ sung các module, các kho hàm số, thư viện thuật toán. Điều này làm cho Python phát triển BÙNG NỔ trong giới khoa học và giáo dục đại học. Đặc biệt trong một số ngành mũi nhọn của CNTT như IoT, trí tuệ nhân tạo (AI), dữ liệu lớn (big data) và CMCN 4.0, các phát triển rất nhanh thời gian gần đây của công nghệ đều gắn liền với Python.</div></div></div>',7,_binary '',29,'b962e19641b05c06324b416c6aa5d38b.jpg','Python cơ bản',125000,1,'<span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Nội dung các chủ đề của sách Python cơ bản như sau:</span><br>','2024-01-04 21:20:21.738000000000',0.5,16,5,3),(5,'Lập-trình-hướng-đối-tượng-JAVA-core-dành-cho-người-mới-bắt-đầu-học-lập-trình',4,200000,'2024-01-04 21:23:00.199000000000',0,_binary '','<div><div><em>Quyển sách này sẽ giúp bạn:</em></div><ul style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><li>Đi vào thế giới lập trình hết sức tự nhiên, thân thiện và dễ hiểu - LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG LÀ TƯ DUY GẮN LIỀN VỚI CUỘC SỐNG HẰNG NGÀY</li><li>Nắm vững được thế nào là tư duy lập trình hướng đối tượng và cách phân tích một bài toán lập trình</li><li>Hiểu được các khái niệm lập trình Java cơ bản.</li><li>Thực hành xây dựng được các giao diện phần mềm desktop bằng ngôn ngữ JAVA</li><li>Sau khi có được nền tảng kiến thức lập trình JAVA core bạn có thể tự học các ngôn ngữ lập trình hướng đối tượng khác như C++/C, Python,</li></ul></div>',10,_binary '',29,'ad299b78f8a5289406ab1936faf066f4.jpg','Lập trình hướng đối tượng JAVA core dành cho người mới bắt đầu học lập trình',249000,1,'<div><ul style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><li>JAVA là ngôn ngữ lập trình rất phổ biến nhất hiện nay, học #JAVA_CORE bạn sẽ có rất nhiều hướng đi, từ lập trình Mobile app, Java web, Desktop App, Game, và tất cả đều sử dụng nền tảng của JAVA CORE.</li><li>Quyển sách này gồm 22 bài học từ Tư duy LTHĐT(Đa hình, kế thừ) đến các đối tượng #JavaCore (String, Array, File), lập trình giao diện Swing.</li></ul></div>','2024-01-04 21:23:00.199000000000',0.7,20,3,3),(6,'Bộ-sách-Thế-giới-Hacker-và-An-Toàn-Thông-Tin-Mạng-(Tặng-Kèm-Bookmark-Hoa-Lá)',4.5,675000,'2024-01-04 21:25:29.305000000000',10,_binary '','<div><div>BÓNG MA TRÊN MẠNG Cuộc Phiêu Lưu Của Gã Hacker Bị Truy Nã Gắt Gao Nhất Thế Giới</div><div>Kenvin Mitnick - Gã hacker từng là nỗi kinh hoàng của FBI, cơ quan chính phủ và các công ty cung cấp dịch vụ mạng</div><div>Bằng các thủ thuật mạo danh, nghe lén, lục thùng ráđể thu thập các dự liệu mật</div><div>Sau khi bị phát giác, Mitnick bắt đầu chạy trộn FBI trong suốt 3 năm. Ông tạo ra các danh tính giả, tìm việc tại nhiều thành phố để đánh lạc hướng cơ quan điều tra.&nbsp;</div><div>Để kiểm soát và theo dõi được hành động của FBI, Mitnick thậm chí nghe lén, đánh cắp dữ liệu liên quan từ FBI</div><div>Hành trình chạy trốn từ thế giới ảo bước ra đời thực kết thúc như thế nào? Cách một Kevin Mitnick sở hữu tài năng phi thường và đam mê công nghệ có thể đơn phương độc mã “đương đầu” cơ quan an ninh hàng đầu thế giới? Và cả cách FBI đã giăng bẫy để tóm gọn được tên hacker này như nào? Tất cả sẽ được phơi bày chân thực qua lời kể của chính Kevin Mitnick trong cuốn sách này.</div></div>',15,_binary '',30,'1e6423ca303281ccd2628d474f6ec1b2.jpg','Bộ sách Thế giới Hacker và An Toàn Thông Tin Mạng (Tặng Kèm Bookmark Hoa Lá)',756000,2,'<div><div>/* NHỮNG ĐIỀU CHÚNG TA CHƯA TỪNG BIẾT VỀ THẾ GIỚI HACKER? */</div><div>[Họ là ai? Họ là người như thế nào?]</div><div>[Cuộc sống của họ phía sau màn hình máy tính?]</div><div>[Cách thức họ hành động, xâm nhập vào các mạng máy tính trên toàn Thế Giới?]</div><div>[Mục tiêu của họ là gì? DANH TIẾNG - TIỀN BẠC HAY QUYỀN LỰC?]</div></div>','2024-01-04 21:25:29.305000000000',1.5,30,4,3),(7,'Văn-Học-Trong-Nhà-Trường-:-Thơ-Nguyến-Khuyến',4.5,25000,NULL,20,_binary '','<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">“Làm nên cái độc đáo riêng của nhà thơ thì chủ yếu là những vần thơ Nguyễn Khuyến viết về nông thôn, bao gồm những vần thơ viết về con người, cảnh vật thiên nhiên và về phong tục tập quán. Về phương diện này không có một nhà thơ nào đương thời viết được bằng ông, và trước đó, trong lịch sử văn học Việt Nam cũng chưa ai viết được như ông.” (Giáo sư NGUYỄN LỘC)</span><br style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Nhằm giúp các bạn học sinh có một nền tảng kiến thức văn học phong phú, vững vàng, Nhà xuất bản Kim Đồng tổ chức biên soạn bộ sách Văn học trong nhà trường.</span><br style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Bộ sách sẽ lần lượt giới thiệu tác phẩm của các tác giả thuộc nhiều trào lưu, thể loại, thời kì</span><br style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Ngoài giá trị tư liệu học tập, hi vọng bộ sách còn giúp bồi dưỡng thêm tình yêu văn học, khích lệ tư duy sáng tạo giúp người đọc có được cho mình những nhận định khách quan và hợp lí.</span><br></div>',10,_binary '',30,'b734d30b58e653dbdb4ac5e616956bcf.jpg','Văn Học Trong Nhà Trường : Thơ Nguyến Khuyến',38000,2,'<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">“Nguyễn Khuyến là người đã sáng tạo nên những áng văn chương điêu luyện, tuy thế, trong thơ ông tuyệt nhiên không thấy dấu vết của sự đẽo gọt cầu kì</span><br style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"></div>','2024-01-04 21:48:07.495000000000',0.8,25,1,7),(8,'NDB---Thơ-Nguyễn-Bính',4,20000,NULL,20,_binary '','<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....</span><br></div>',10,_binary '',35,'a130c960d460f7f902765bdaf72c98c2.jpg','NDB - Thơ Nguyễn Bính',28000,1,'<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Cuốn sách gồm tuyển tập những bài thơ hay nổi tiếng của nhà thơ Nguyễn Bính</span><br></div>','2024-01-04 21:47:24.881000000000',0.8,20,3,7),(9,'Henry-Ford-–-Tôi-và-Ford-Motor:-Cách-tỉ-phú-Henry-Ford-điều-hành-Ford-Motor-từ-thuở-sơ-khai-đến-tầm-thế-giới-(phiên-bản-chuẩn-kinh-doanh)',4,100000,NULL,35,_binary '','<div><div>Vừa giúp mọi người có thể mua sản phẩm vốn được xem là xa xỉ, vừa giúp nhân công có lương cao, vừa mang về lợi nhuận lớn cho chính mình và cổ đông, Henry Ford đã thay đổi hoàn toàn cách vận hành doanh nghiệp hiện đại. Để hiểu rõ bí mật đằng sau thành công kì lạ của Ford, không có khởi đầu nào thích hợp hơn quyển sách được viết bởi chính ông: HENRY FORD: Tôi và Ford Motor.</div><div>Phiên bản sách chuẩn kinh doanh - với sự phối hợp biên dịch của Ecoblader và NXB Kinh Tế TPHCM - sẽ mang lại cho độc giả những tư tưởng nghệ thuật kinh doanh kinh điển của một trong những tượng đài khai sinh nên nền kinh tế thế giới nói chung và nước Mỹ nói riêng - Henry Ford.</div></div>',10,_binary '',35,'4af2f9b3c3e540e468f6c0d79d3777a2.png','Henry Ford – Tôi và Ford Motor: Cách tỉ phú Henry Ford điều hành Ford Motor từ thuở sơ khai đến tầm thế giới (phiên bản chuẩn kinh doanh)',150000,1,'<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">HENRY FORD, nhà sáng lập Công ty Ford Motor, là một trong những tỉ phú đầu tiên của nước Mĩ. Ford chính là người đã đưa vào ứng dụng các dây chuyền sản xuất trong nhà máy của mình</span><br></div>','2024-01-04 21:49:03.091000000000',0.7,25,4,11),(10,'Tự-Học-Photoshop-Cc---Toàn-Tập-(Tái-bản-bổ-sung-lần-2)',4,100000,NULL,20,_binary '','<div><div>Nội dung sách gồm:</div><div>Giới thiệu</div><div>Chương 1:Tổng quan về Photoshop CC.</div><div>Chương 2: Hiển thị và các hệ thống đo lường.</div><div>Chương 3: Tùy chỉnh cách bạn làm việc.</div><div>Chương 4: Sử dụng công cụ chọn vùng.</div><div>Chương 5: Làm việc với các Layers.</div><div>Chương 6: Làm việc với bảng điều khiển History.</div><div>Chương 7: Làm việc với Adjustment, Layers, Filters và Tools.</div><div>Chương 8: Tìm hiểu về Colors và Channels.</div><div>Chương 9: Sử dụng Paint, Shape Drawing và các công cụ Eraser.</div><div>Chương 10: Sử dụng bảng điều khiển Panel.</div><div>Chương 11: Làm việc với các Layer Style.</div><div>Chương 12: Quảng cáo với Type.</div><div>Chương 13: Áp dụng bộ lọc Filter trên hình ảnh.</div><div>Chương 14: Tự động hóa công việc với Actions.</div><div>Chương 15: Kiểm soát hình ảnh đầu ra.</div><div>Chương 16: Làm việc với Automate.</div><div>Chương 17: Quản lý màu từ Monitor để in.</div><div>Chương 18: Làm việc với Video.</div><div>Chương 19: Bài tập làm thêm.</div><div>Chương 20: Bài tập tổng hợp.</div></div>',10,_binary '',30,'7185a9cdf9eb94f41c93123a899f2b9d.jpg','Tự Học Photoshop Cc - Toàn Tập (Tái bản bổ sung lần 2)',155000,2,'<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Tự Học Photoshop Cc - Toàn Tập (Tái bản bổ sung lần 2)</span><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;gồm 20 chương lý thuyết và bài tập thực hành khai thác các công cụ và lệnh cơ bản trong Photoshop</span><br></div>','2024-01-04 21:46:49.307000000000',0.7,20,2,6),(11,'25-Bài-Thực-Hành-Photoshop',2,100000,'2024-01-04 21:41:58.883000000000',22,_binary '','<div><div>Cuốn sách này dành cho ai?</div><div>Bạn đã biết qua các lệnh cơ bản trong Photoshop, bây giờ bạn muốn hiểu rõ hơn các công cụ và lệnh này thông qua các bài tập thực hành cụ thể, với các phím tắt, thủ thuật và lời khuyên giúp cho bạn làm việc thông minh, nhanh hơn. Có như vậy bạn sẽ học Photoshop dễ dàng hơn, không thấy nhàm chán khi phải học lý thuyết có phần mơ hồ hay chưa rõ. Sách là tài liệu không thể thiếu cho các học sinh, sinh viên, giáo viên, các chuyên viên đồ họa và nhiều hơn nữa mới bắt đầu làm quen với Photoshop nay muốn khai thác và sử dụng hiệu quả chương trình đầy quyền năng này thì đây chính là cuốn sách dành cho bạn. Sách được biên soạn kiểu “cầm tay chỉ việc”, các bài tập &nbsp;đều có các hướng dẫn từng bước minh họa bằng hình để các bạn hiểu và khai thác Photoshop ở mức độ cao, tiết kiệm nhiều thời gian khi học.</div><div>NỘI DUNG SÁCH</div><div>Sách gồm 3 phần: Phần 1 và 2 mỗi phần có 10 bài tập và phần 3 gồm 5 bài tập lớn và phụ lục giới thiệu về ảnh HDR. Cả 3 phần đều &nbsp;được trình bày theo kiểu “Cầm tay chỉ việc”. Các bài tập được biên soạn với các hướng dẫn chi tiết được minh họa bằng các hình chụp từ màn hình vi tính.</div><div>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....</div></div>',10,_binary '',30,'aecec286687defb8a8ddf0b1480c1892.jpg','25 Bài Thực Hành Photoshop',160000,2,'<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">25 BÀI THỰC HÀNH PHOTOSHOP</span><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;là tập 2 trong bộ sách “HƯỚNG DẪN SỬ DỤNG PHOTOSHOP CC”, một chương trình đầy quyền năng trong chỉnh sửa ảnh.&nbsp;</span><br></div>','2024-01-04 21:41:58.883000000000',0.9,20,4,6),(12,'Tin-Học-Văn-Phòng,-Tự-Học-Excel-Bằng-Hình-Ảnh-(Phiên-Bản-2019-2016-2013)',3,80000,'2024-01-04 21:44:11.687000000000',0,_binary '','<div><div>Tự học excel bằng hình ảnh. Là tập 2 trong bộ sách này gồm trên 100 bài tập khám phá những bí mật, hướng dẫn và giải thích các thủ thuật giúp các bạn tiết kiệm thời gian cũng như đạt năng suất hơn khi làm việc với excel phiên bản 2010,2013 cũng như 2016. Với bố cục chặt chẽ, trình bày rõ ràng, dễ dàng sử dụng cho phép bạn thực hành xuyên suốt tất cả các bài tập từ bắt đầu đến kết thúc hoặc chuyển đến bài tập nào tùy ý, sách là tài liệu không thể thiếu cho các học sinh, sinh viên, các nhân viên văn phòng và nhiều hơn nữa khai thác và sử dụng hiệu quả excel trong công việc Sách gồm 10 chương(100 bài tập) và 2 chương hướng dẫn sử dụng excel 2016 .</div><div>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....</div></div>',10,_binary '',30,'215a31cbc1c344c5bace69cfaabda11b.jpg','Tin Học Văn Phòng, Tự Học Excel Bằng Hình Ảnh (Phiên Bản 2019-2016-2013)',104000,1,'<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Tự học excel bằng hình ảnh. Là tập 2 trong bộ sách này gồm trên 100 bài tập khám phá những bí mật, hướng dẫn và giải thích các thủ thuật giúp các bạn tiết kiệm thời gian cũng như đạt năng suất hơn khi làm việc với excel phiên bản 2010,2013 cũng như 2016</span><br></div>','2024-01-04 21:44:11.687000000000',0.7,20,6,5),(13,'Giáo-Trình-Thực-Hành-Microsoft-Excel-2019-Căn-Bản-&-Nâng-Cao-(Sách-kèm-theo-CD-Bài-Tập)',4,90000,'2024-01-04 21:46:18.459000000000',8,_binary '','<div><div><em>Trong sách bạn sẽ học:</em></div><div>&nbsp; &nbsp; &nbsp;CHƯƠNG 1: Thiết lập một Workbook</div><div>&nbsp; &nbsp; &nbsp;CHƯƠNG 2: Làm việc với dữ liệu và các bảng</div><div>&nbsp; &nbsp; &nbsp;CHƯƠNG 3: Thực hiện tính toán dữ liệu</div><div>&nbsp; &nbsp; &nbsp;CHƯƠNG 4: Thay đổi diện mạo bảng tính</div><div>&nbsp; &nbsp; &nbsp;CHƯƠNG 5: Quản lý dữ liệu bảng tính</div><div>&nbsp; &nbsp; &nbsp;CHƯƠNG 6: Tạo các biểu đồ và đồ họa</div><div>&nbsp; &nbsp; &nbsp;CHƯƠNG 7: In bảng tính và biểu đồ</div><div>&nbsp; &nbsp; &nbsp;CHƯƠNG 8: Các phím tắt thông dụng</div></div>',10,_binary '',30,'0ded975be359ebeea30d2cbd2c55f467.jpg','Giáo Trình Thực Hành Microsoft Excel 2019 Căn Bản & Nâng Cao (Sách kèm theo CD Bài Tập)',120000,1,'<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">* Sách sử dụng cho các phiên bản Excel 2019 -&nbsp;2016&nbsp;-&nbsp;2013</span><br></div>','2024-01-04 21:46:18.459000000000',0.7,20,6,5),(14,'Mùa-Hè-Kinh-Hãi---I-Know-What-You-Did-Last-Summer',5,40000,'2024-01-04 21:52:03.242000000000',29,_binary '','<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Có những bí mật không chịu ngủ yên.</span><br style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Họ không cố tình làm điều đó. Buổi tiệc vừa diễn ra, và tất cả chỉ là tai nạn… Nhưng vì mỗi người đều có tương lai để bảo vệ, nên Barry, Julie, Helen và Ray cùng thề sẽ giữ kín bí mật này. Để rồi giờ đây, một năm kể từ vụ tai nạn, có ai đó khác đã biết chuyện. Julie nhận được lời đe doạ đầy ám ảnh từ một kẻ nặc danh: “Tao biết mày đã làm gì vào mùa hè năm ngoái.”</span><br style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lời nói dối đen tối đã bị vạch trần, và trước khi bốn người bạn kịp nhận ra, họ phải đánh bại kẻ thủ ác… bằng không chính họ sẽ là những người tiếp theo phải chết.</span><br style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Mùa Hè Kinh Hãi - I Know What You Did Last Summer: Nguyên tác của bộ phim cùng tên được chuyển thể vào năm 1997.</span><br></div>',10,_binary '',30,'ad5e54280051f33b69257cafa4956ee5.jpg','Mùa Hè Kinh Hãi - I Know What You Did Last Summer',70000,1,'<div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Có những bí mật không chịu ngủ yên.</span><br></div>','2024-01-04 21:52:03.242000000000',0.5,20,5,9),(15,'Sắc-Xanh-Còn-Mãi----Góc-Tối-Học-Đường-Và-Cuộc-Đấu-Tranh-Cô-Đơn-Của-Một-Trái-Tim-Thuần-Khiết-(Tặng-Kèm-1-Bookmark-Chữ-Nhật)',3,40,'2024-01-04 21:54:04.799000000000',32,_binary '','<div><div>Masao, một học sinh lớp sau, bị giáo viên mới Haneda và các bạn cùng lớp bắt nạt mà không biết lí do. Dù có ai quên làm bài tập hay lớp mất trật tự, thầy Haneda đều đổ hết tội lỗi lên đầu cậu. Trong lúc buồn bã và bế tắc vì bị bắt nạt, trước mặt Masao luôn xuất hiện một đứa trẻ trông rất giống cậu nhưng khắp người mang màu xanh tái cùng những vết thương rất đau đơn, mặc một chiếc áo trắng quấn chặt khắp người như đang bị trói và không thể nói chuyện. Cậu gọi đứa trẻ đó là Ao. Ao đã thuyết phục Masao giết thầy giáo Haneda để giải thoát cho cả hai…</div><div>Một tiểu thuyết của Otsuichi – cây bút anh tài trong giới tiểu thuyết kinh dị!</div></div>',10,_binary '',30,'5fe617048d05b9695ad810fe50bc5216.jpg','Sắc Xanh Còn Mãi  - Góc Tối Học Đường Và Cuộc Đấu Tranh Cô Đơn Của Một Trái Tim Thuần Khiết (Tặng Kèm 1 Bookmark Chữ Nhật)',89000,2,'<div><div>SẮC XANH CÒN MÃI</div><div>Góc tối học đường và cuộc đấu tranh cô đơn của một trái tim thuần khiết</div></div>','2024-01-04 21:54:04.799000000000',0.7,20,3,9),(17,'Trinh-Thám-Kinh-Dị---KẺ-VIẾT-TRUYỆN-DÀI-KỲ',3.33333,100000,NULL,37,_binary '','<div><div>Về tác giả:</div><div>David Gordon sinh năm 1967 và hiện tại đang sinh sống ở New York, Mỹ. Ông theo học tại Đại học Sarah Lawrence và nhận được bằng Thạc sĩ tiếng Anh và Văn học So sánh cùng với bằng Thạc sĩ chuyên ngành Sáng tác của Đại học Colombia. Ông từng làm việc trong nhiều lĩnh vực như điện ảnh, thời trang, xuất bản.&nbsp; &nbsp;</div></div><div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span></div><div><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Harry Bloch là một tiểu thuyết gia đang chật vật mưu sinh bằng những cuốn sách viết về ma cà rồng dưới nhiều bút danh khác nhau. Thế nhưng cuộc sống của anh như bước sang trang mới khi Darian Clay - một sát thủ khét tiếng ở New York muốn anh viết cho hắn một cuốn hồi ký trước khi chết. Chẳng bao lâu sau, thành phố rúng động khi có ba cô gái lần lượt bị sát hại một cách dã man và đều mang phong cách của tay sát thủ. Kẻ viết truyện dài kỳ trở thành thám tử bất đắc dĩ trong một âm mưu giết chóc ngoài đời thực khi anh phải bắt được kẻ thủ ác trước khi hắn gây thêm án mạng.</span><br></div>',0,_binary '',0,'b0e29ac432747d63c9bb368c3a182bff.jpg','Trinh Thám Kinh Dị - KẺ VIẾT TRUYỆN DÀI KỲ',230000,3,'<div><em style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">Kẻ viết truyện dài kỳ&nbsp;</em><span style=\"color: rgb(36, 36, 36); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 14px; text-align: justify;\">là tác phẩm đầu tay của ông, giành giải thưởng cho Tiểu thuyết đầu tay của VCU/Cabell năm 2011, lọt vào chung khảo của giải thưởng Edgar dành cho nhà văn trinh thám của nước Mỹ.</span><br></div>','2024-01-06 18:39:10.210000000000',0,0,2,15);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinces` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'10000','Hà Nam'),(2,'BD_44','Bình Dương'),(3,'HD_06','Hải Dương'),(4,'AD_20','An Giang'),(5,'BN_42','Bắc Ninh'),(6,'CM_32','Cà Mau'),(7,'DN_86','Đà Nẵng'),(8,'HN_25','Hà Nội');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(300) NOT NULL,
  `headline` varchar(128) NOT NULL,
  `rating` int NOT NULL,
  `review_time` datetime(6) NOT NULL,
  `votes` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4sm0k8kw740iyuex3vwwv1etu` (`customer_id`),
  KEY `FKpl51cejpw4gy5swfar8br9ngi` (`product_id`),
  CONSTRAINT `FK4sm0k8kw740iyuex3vwwv1etu` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKpl51cejpw4gy5swfar8br9ngi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (3,'Giấy tốt, mực đẹp mà giá lại mềm. Dịch giả viết dễ hiểu. Shop có tặng thêm quà nữa.','Giấy tốt, mực đẹp mà giá lại mềm. Dịch giả viết dễ hiểu. Shop có tặng thêm quà nữa.',4,'2024-01-06 16:12:16.454000000000',0,12,6),(4,'Nhà sách chính hãng Bizbooks cám ơn bạn đã tin tưởng và ủng hộ shop. Mỗi tháng Bizbooks sẽ luôn ra mắt rất nhiều các đầu sách mới. Bạn hãy lưu lại mã voucher trên bookmark để được giảm 5% cho đơn hàng tiếp theo nha!','Phản Hồi Của Người Bán',4,'2024-01-06 16:16:56.615000000000',0,12,3),(5,'Nhà sách chính hãng Bizbooks cám ơn bạn đã tin tưởng và ủng hộ shop. Mỗi tháng Bizbooks sẽ luôn ra mắt rất nhiều các đầu sách mới. Bạn hãy lưu lại mã voucher trên bookmark để được giảm 5% cho đơn hàng tiếp theo nha!','Phản Hồi Của Người Bán',5,'2024-01-06 16:23:31.134000000000',0,13,6),(6,'Cảm ơn Quý khách đã theo dõi và ủng hộ shop ạ','Phản Hồi Của Người Bán',3,'2024-01-06 16:23:57.599000000000',0,13,17),(7,'Sách chất giấy đẹp .giá rẻ.giao hàng nhanh.đóng gói cẩn thận.kèm thêm quà tặng hữu ích.hình ảnh mang TC nhận xu','Phản Hồi Của Người Bán',4,'2024-01-06 16:24:42.837000000000',0,13,2),(8,'Chất lượng tốt, sản phẩm đúng theo hình ảnh. Người bán giao hàng đúng hẹn. Đề xuất cho người bán','Phản Hồi Của Người Bán',4,'2024-01-06 16:25:58.662000000000',0,12,8),(9,'Sách rất đẹp luôn, gói hàng cẩn thận. Giao hàng rất nhanh. Nhưng lưu ý là cuốn sách này chỉ dừng ở năm 1918, nên nếu muốn đọc cả thế chiến 2 thì phải mua cuốn khác.','Phản Hồi Của Người Bán',2,'2024-01-06 16:26:24.168000000000',0,12,11),(10,'Sách được bọc kỹ càng, không bị rách hay méo góc, chữ in rõ, không nhoè và đặc biệt là cuốn này hay lắm luônn, mọi người nên mua nhee','Phản Hồi Của Người Bán',5,'2024-01-06 16:26:43.137000000000',0,12,7),(11,'Giao hàng nhanh chóng, đóng gói sản phẩm cẩn thận lắm ạ. Sách hay\r\n','Phản Hồi Của Người Bán',4,'2024-01-06 16:27:04.443000000000',0,12,13),(12,'Khá là ok với các quyển sách này, đọc thêm kiến thức khi khá tốt.','Phản Hồi Của Người Bán',3,'2024-01-06 16:27:21.906000000000',0,12,12),(13,'Sách có vài lỗi nhỏ :\r\nDùng từ địa phương nhiều, đôi khi còn sai lỗi chính tả\r\nmiêu tả trận chiến k quá cụ thể k có bản đồ minh hoạ','Phản Hồi Của Người Bán',4,'2024-01-06 16:27:41.323000000000',0,12,17),(14,'Điểm cộng cộng cộng cộng là đóng gói rất chắc nha','Phản Hồi Của Người Bán',3,'2024-01-06 16:27:58.529000000000',0,12,15),(15,'Shop giao hàng nhanh. Bọc hàng kỹ càng. Thơm mùi sách mới. Cảm ơn shop nhé. Mua nhiều lần bên này rồi ạ\r\n','Phản Hồi Của Người Bán',4,'2024-01-06 16:29:05.199000000000',0,12,10),(16,'Sách đẹp, nd đầy đủ, hay, giao hàng hơi lâu xí, ncl là okee\r\n','Phản Hồi Của Người Bán',5,'2024-01-06 16:29:26.930000000000',0,12,14),(17,'Sách hay nên đọc hàng ngày để nguồn tri thức thêm phong phú! cố gắng tháng đọc 1 cuốn ( Ai cần hàng chính hãng nga in mình)\r\n','Phản Hồi Của Người Bán',2,'2024-01-06 16:34:45.863000000000',0,9,11),(18,'Tên sách thu hút sự quan tâm\r\n','Phản Hồi Của Người Bán',4,'2024-01-06 16:35:07.403000000000',0,9,10),(19,'Đóng gói ok, giao nhanh mà sách hơi cong\r\n','Phản Hồi Của Người Bán',5,'2024-01-06 16:35:27.026000000000',0,9,3),(20,'Sách được tặng kèm quyển ghi mục tiêu. \r\nCám ơn nhà sách. Sẽ ủng hộ tiếp','Phản Hồi Của Người Bán',4,'2024-01-06 16:35:46.952000000000',0,9,9),(21,'Sách chất lượng giấy tốt, bìa đẹp, mình sẽ ủng hộ nhiều nữa.\r\n','Phản Hồi Của Người Bán',3,'2024-01-06 16:36:13.839000000000',0,9,17),(22,'sách giao nhanh. Shop có mark xinh xắn xịn lắm nha\r\n','Phản Hồi Của Người Bán',3,'2024-01-06 16:36:34.667000000000',0,9,15),(23,'Mình mua 2 cuốn cho chị trong công ty và mình. Bạn mình có đọc thì review sách hay và ý nghĩa sâu sắc.\r\n','Phản Hồi Của Người Bán',4,'2024-01-06 16:37:15.058000000000',0,9,5),(24,'Giaoo hànggg nhanhh lắmmm ạ sáchh thì mìnhh mớiii đọc vài trangg thôiii','Phản Hồi Của Người Bán',5,'2024-01-06 16:37:31.271000000000',0,9,4),(25,'Sách có dấu hiệu đã qua sử dụng. Tiêu nhiên mua với giá 70k thì cũng hợp lí.\r\nK chụp đc ảnh nên hình ảnh mang tính chất minh hoạ','Phản Hồi Của Người Bán',4,'2024-01-06 16:37:49.612000000000',0,9,7),(26,'Rất ok tốt mọi người nên mua nha sản phẩm ngoài mong đợi nên mua nha mn','Phản Hồi Của Người Bán',5,'2024-01-06 16:38:12.556000000000',0,9,2);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_votes`
--

DROP TABLE IF EXISTS `reviews_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_votes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `votes` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `review_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKckuygkph4k9llo624gn30lxvy` (`customer_id`),
  KEY `FKosupda11xqkvo80r77evmwrey` (`review_id`),
  CONSTRAINT `FKckuygkph4k9llo624gn30lxvy` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKosupda11xqkvo80r77evmwrey` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_votes`
--

LOCK TABLES `reviews_votes` WRITE;
/*!40000 ALTER TABLE `reviews_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(150) NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Quản lý mọi thứ','Admin'),(2,'Quản lý sản phẩm, khách hàng, đơn hàng và báo cáo bán hàng','Editor');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `key` varchar(128) NOT NULL,
  `category` varchar(45) NOT NULL,
  `value` varchar(1024) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('COPYRIGHT','GENERAL','Copyright (C) 2024 GreenBookshop Ltd.'),('CURRENCY_ID','CURRENCY','1'),('CURRENCY_SYMBOL','CURRENCY','VND'),('CURRENCY_SYMBOL_POSITION','CURRENCY','After price'),('CUSTOMER_VERIFY_CONTENT','MAIL_TEMPLATES','xin chào [[name]] : đây là verify content<div>Code của bạn [[URL]]</div>'),('CUSTOMER_VERIFY_SUBJECT','MAIL_TEMPLATES','ĐÂY LÀ SUBJECT GỬI EMAIL'),('DECIMAL_DIGITS','CURRENCY','0'),('DECIMAL_POINT_TYPE','CURRENCY','POINT'),('MAIL_FROM','MAIL_SERVER','thaixuan.thainguyen@gmail.com'),('MAIL_HOST','MAIL_SERVER','smtp.gmail.com'),('MAIL_PASSWORD','MAIL_SERVER','zbfadvjzwojumtvm'),('MAIL_PORT','MAIL_SERVER','587'),('MAIL_SENDER_NAME','MAIL_SERVER','Nguyễn VĂn Lục'),('MAIL_USERNAME','MAIL_SERVER','thaixuan.thainguyen@gmail.com'),('ORDER_CONFIRMATION_CONTENT','MAIL_TEMPLATES','Khách hàng [[name]] thân mến,<div><br><div>Đơn hàng [[orderId]] của bạn đã được đặt thành công, vào thời gian [[orderTime]]</div><div>Đị chỉ nhận hàng [[shippingAddress]]</div><div>Tổng tiền thanh toán:&nbsp;<span style=\"font-size: 1rem;\">[[total]]</span></div><div><br></div></div><div>Vui lòng kiểm tra lại thông tin. Nếu có sai sót hay cần thay đổi hãy liên hệ lại với chúng tôi.</div><div>Thân ái!</div>'),('ORDER_CONFIRMATION_SUBJECT','MAIL_TEMPLATES','[Green Bookshop] - Đặt hàng thành công'),('PAYPAL_API_BASE_URL','PAYMENT','http://api-m.sandbox.paypal.com'),('PAYPAL_API_CLIENT_ID','PAYMENT','AUGAilYsvlECpsXtl8xzOzPIrl-QZgG1IZKEMR06T9exgitNV2vxGIrJPGH9fM4S49aVT4_5ZPjIw1uU'),('PAYPAL_API_CLIENT_SECRET','PAYMENT','EEVH-Hc6lcH-aHDHRGu-JLG62OpcaQYJ79wwIzXd6eJsW_QKESUa6F-nm9ED3tKvuXBHSJr2SygxH3nc'),('SITE_LOGO','GENERAL','/site-logo/GreenBookshopSmall.png'),('SITE_NAME','GENERAL','GreenBookshop'),('SMTP_AUTH','MAIL_SERVER','true'),('SMTP_SECURED','MAIL_SERVER','true'),('THOUSANDS_POINT_TYPE','CURRENCY','COMMA');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_rates`
--

DROP TABLE IF EXISTS `shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cod_supported` bit(1) DEFAULT NULL,
  `days` int NOT NULL,
  `district` varchar(45) NOT NULL,
  `rate` float NOT NULL,
  `province_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdt4aov9agqn6rtibcfj1j3o8m` (`province_id`),
  CONSTRAINT `FKdt4aov9agqn6rtibcfj1j3o8m` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_rates`
--

LOCK TABLES `shipping_rates` WRITE;
/*!40000 ALTER TABLE `shipping_rates` DISABLE KEYS */;
INSERT INTO `shipping_rates` VALUES (1,_binary '',2,'Ba Vì',0.15,8),(3,_binary '',0,'Khóm 1 , Thị Trấn Cái Nước, Huyện Cái Nước',0,6),(4,_binary '',3,'Quế Võ',1.2,5),(5,_binary '',3,'Bình Lục',1.2,1),(6,_binary '',3,'Duy Tiên',2.2,1),(7,_binary '',2,'Gia Lâm',1.3,8),(8,_binary '',3,'Ngũ Hành Sơn',2.2,7),(9,_binary '\0',2,'Phú Giáo',3.3,2),(10,_binary '\0',2,'Huyện An Phú',3.4,4);
/*!40000 ALTER TABLE `shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `photos` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'lucnguyen@gmail.com',_binary '','Lục','Nguyễn Văn','$2a$10$L3tJExROauc5YuGaU4V/nu8lYMeBbaVWpGLzhQjbmnZV5Var/4wOW','14064130_10154167645689584_3177617473877307563_n.jpg'),(3,'hainguyen@gmail.com',_binary '','Hải','Nguyễn Đức','$2a$10$QcpXup2qonxbuXjg807ZxOHDC75c21Zref/PE3KSK7i3I2vOZOkgm','so 1.png'),(4,'namnguyen@gmail.com',_binary '','Nam','Phan Từ','$2a$10$OeloroI8ya5GmtUUYdYzTe8SeEv0vKdZoyzxPogAxaIU54yJJXAK6','so 6.png'),(5,'binhnguyen@gmail.com',_binary '\0','Bình','Nguyễn Thái','$2a$10$iR3RRNc8JGWplmORdw4m2.E7lbijO71Gs5Aes/N/CZf1MqHq.f5nG','canhcut.png'),(6,'duongnguyen@gmail.com',_binary '','Dương','Chu Minh','$2a$10$h6ZDwtnjLz5.X0tbbTiAj.72V9VlqY04MIk6/tXibQdGsCLzlPKRi',NULL),(12,'kiennguyen@gmail.com',_binary '','Kiên','Nguyễn','$2a$10$ZMlP/s/Yi9Y/qKqYa98KYORKENeyxITvKfE7p.LD3wfFd/s1NaCc6','14064130_10154167645689584_3177617473877307563_n.jpg'),(13,'hungthinh@gmail.com',_binary '','Thịnh','Nguyễn Hưng','$2a$10$bsaIhyrCpu9ENzmqm7N.AeyEMsSlf6wI6ntZG8X4aAz4QegmOQbMu','so 6.png'),(14,'dinhtung@gmail.com',_binary '','Tùng','ĐInh','$2a$10$GSwkWBnbxGO2jnXXvfD22.uWkR8VCBROkbRU.07DO4TkYnyrXGIFm','so 5.png'),(15,'haongo@gmail.com',_binary '','Hào','Ngô','$2a$10$GHjaXNb9H5.bKG/jk5fya.xGinPLLmHiCFlDOUz/j2AQaETEeEYlO','so 4.png'),(16,'vinhluong@gmail.com',_binary '','Vinh','Lương Thế','$2a$10$JVowtQk2bblRyzeCpyCdD.VZ563i4vLoSN3Y1iJDnWly34sSpAaaO','canhcut.png'),(17,'phonghong@gmail.com',_binary '','Phong','Hồng','$2a$10$zyjQ4og7pP4.WfSjvZMyFOLg2UfQSIN6erxnlfTzUXYnWpUIdHpUy','anh-gai-xinh-cuc-dep.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(3,1),(4,1),(5,1),(6,1),(12,1),(13,1),(16,1),(14,2),(15,2),(17,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-09 16:02:35
