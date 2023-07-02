CREATE DATABASE  IF NOT EXISTS `QLBH` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `QLBH`;
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
-- Table structure for table `Brands`
--

DROP TABLE IF EXISTS `Brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brands`
--

LOCK TABLES `Brands` WRITE;
/*!40000 ALTER TABLE `Brands` DISABLE KEYS */;
INSERT INTO `Brands` VALUES (1,'Samsung','Hàn Quốc'),(2,'Honda','Nhật Bản'),(3,'Apple Inc','Hoa Kỳ'),(4,'YAMAHA','Nhật Bản'),(5,'Sunhouse','Việt Nam'),(8,'ACER','Đài Loan, Trung Quốc'),(9,'MAYBELLINE','Trung Quốc'),(10,'XIAOMI','Trung Quốc'),(11,'SONY','Nhật Bản'),(12,'VINAMILK','Việt Nam'),(13,'KINH ĐÔ','Việt Nam'),(14,'COCA COLA','Hoa Kỳ'),(15,'Lavie','Việt Nam'),(16,'Big C1','Thái Lan'),(17,'Wall\'s','Thái Lan');
/*!40000 ALTER TABLE `Brands` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'MỸ PHẨM'),(2,'ĐIỆN TỬ GIA DỤNG'),(3,'QUẦN, ÁO'),(4,'MÌ GÓI'),(5,'ĐỒ ĂN ĐÓNG HỘP'),(6,'MỸ PHẨM'),(7,'KEM TRỊ MỤN'),(8,'XE MÁY VÀ XE Ô TÔ'),(9,'DỤNG CỤ ĐIỆN'),(10,'PHỤ KIỆN MÁY TÍNH'),(12,'PHỤ KIỆN'),(13,'ĐIỆN THOẠI'),(14,'Laptop'),(15,'NƯỚC UỐNG'),(16,'THỰC PHẨM ĐÓNG GÓI');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
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
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('admin','$2a$10$eoYWDgKI5iOaSiPqsfVd/eagYgs13m7Q2/GIu4al2X4FAe1gdfe4G','Đồng Đức Khang',964772094,'windmotor2022@gmail.com','COD3.jpg',_binary '',1,NULL),('Bill123','$2a$10$sUUrVvDsHz2pOWSiNTxG/eOUUtBU2Ob134OyMTNcTBK/skdg0Ph7C','Billy Jones',987654321,'duc.khang165@gmail.com','user.png',_binary '',4,NULL),('David123','$2a$10$UaYczbiaX.mb4oN6nXImse4Ew3bdpA1Tk2nRWGhah6FksVlc8kiXG','David Waterson',955431426,'duc.khang165@gmail.com','user.png',_binary '',3,NULL),('KhangDong','$2a$10$0y8KxOHNLnPpxUZ/26wRo.G25NbJ7Xiu.ex9ikbHvSEQBfoZBUhe6','DONG DUC KHANG',964772094,'duc.khang165@gmail.com','Chains_Gold_wallpaper_V_02.jpg',_binary '',2,'1999-07-15'),('Longdz','$2a$10$L5/2HysJGtihl0gS3TS9resTXcOwWUpvSPoLeoT6BCVUsdEsHD.XW','Long Hoang',332467724,'long@gmail.com','30714389_173138760010464_1235140372791820288_n.jpg',_binary '',3,NULL),('megumin','$2a$10$9K7xjQOtjLtbiKBzNiq.f./FWhauPUng7ZsvVb0BX2Uhdwk5rNZRW','Megumin',972527819,'megumin@gmail.com','user.png',_binary '',4,NULL),('sherekhan','$2a$10$XQULMUMiIo193iVmqTrGrOuqK5Jo7SAf4l9/4pi3/8Iu0wmQy2tpu','Đồng Đức Khang',1234567890,'lonzomcf@yahoo.com.vn','user.png',_binary '',2,NULL),('Tony123','$2a$10$Oiuvj/dYSZnZT/55Q9M7WOkO54Icl36K3e2e/5GqMQVVE83/t6cr.','Tony Warwick',332759664,'duc.khang@yahoo.com.vn','user.png',_binary '',2,NULL);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `Suppliers`
--

DROP TABLE IF EXISTS `Suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh5sey6qrp8jvwwsb4uoohgw4w` (`userId`),
  CONSTRAINT `FKh5sey6qrp8jvwwsb4uoohgw4w` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suppliers`
--

LOCK TABLES `Suppliers` WRITE;
/*!40000 ALTER TABLE `Suppliers` DISABLE KEYS */;
INSERT INTO `Suppliers` VALUES (1,'300 Cộng Hòa, Tân Bình, TP.HCM','windmotor2022@gmail.com','Công ty thương mại Di Động VN',933877655,'Longdz'),(2,'Thích Quảng Đức, Q.Phú Nhuận, TP.HCM','michaeltruong1062@gmail.com','Shop quần áo Hoàng Phục',33833698,'David123'),(3,'128, Trần Quang Khải, P. Tân Định, Q.1, TP.HCM','lienhe@bachhoaxanh.com','BÁCH HÓA XANH SAIGON',19001908,'Bill123'),(4,'Phan Xích Long, Q.Phú Nhuận, TP.HCM','long@gmail.com','Tran Hoang Long',9234932,'Longdz');
/*!40000 ALTER TABLE `Suppliers` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `productDate` varchar(255) DEFAULT NULL,
  `available` bit(1) DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  `brandId` int DEFAULT NULL,
  `supplierId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `description` varchar(15000) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `viewCount` int DEFAULT NULL,
  `special` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1ve0slwds2p0dbyhrkkv8e60t` (`brandId`),
  KEY `FK3ess0s7i9qs6sim1pf9kxhkpq` (`categoryId`),
  KEY `FK541dtjfewvmifm7xytqyu8ykn` (`supplierId`),
  CONSTRAINT `FK1ve0slwds2p0dbyhrkkv8e60t` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`),
  CONSTRAINT `FK3ess0s7i9qs6sim1pf9kxhkpq` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`id`),
  CONSTRAINT `FK541dtjfewvmifm7xytqyu8ykn` FOREIGN KEY (`supplierId`) REFERENCES `Suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'Air Blade 125/150',41324727,'1.png','2022-10-04',_binary '',8,2,1,17,'<h1><strong><span style=\"color:#c0392b\">THIẾT KẾ</span></strong></h1>\r\n\r\n<h2><strong>Kiểu d&aacute;ng thể thao cao cấp</strong></h2>\r\n\r\n<p>Tiếp tục l&agrave; hiện th&acirc;n của sự đột ph&aacute;, hiện đại với diện mạo được trau chuốt tỉ mỉ đến từng chi tiết, Air Blade mang h&igrave;nh ảnh đặc trưng được thể hiện qua thiết kế tổng thể gợi li&ecirc;n tưởng đến &ldquo;chữ X&rdquo;, phản chiếu sự cứng c&aacute;p trong bề mặt hiện đại xen lẫn l&agrave; những đường n&eacute;t được xử l&yacute; gọn g&agrave;ng, dứt kho&aacute;t. Đặc biệt, Air Blade 150cc kh&aacute;c biệt hơn với tấm chắn gi&oacute; ph&iacute;a trước, y&ecirc;n xe hai t&ocirc;ng m&agrave;u v&agrave; tiết diện lốp xe lớn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.honda.com.vn/motorbike-strong-points/December2020/uYYo3IGKUEGOZNhvmkxw.jpg\" style=\"height:490px; width:650px\" /></p>\r\n\r\n<h2><strong>Tem xe c&ugrave;ng phối m&agrave;u mới mới ấn tượng</strong></h2>\r\n\r\n<h2>Tem xe được thiết kế mới với những đường n&eacute;t mạnh mẽ, thể thao, c&ugrave;ng phối m&agrave;u mới ấn tượng nhưng kh&ocirc;ng k&eacute;m phần sang trọng, mang đến diện mạo mới thể thao v&agrave; cuốn h&uacute;t hơn.</h2>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.honda.com.vn/motorbike-strong-points/December2020/Wn5KQHqquM15ypg91FWs.png\" style=\"height:490px; width:650px\" /></p>\r\n\r\n<h2><strong>Cụm đ&egrave;n LED trước</strong></h2>\r\n\r\n<p>Air Blade sử dụng đ&egrave;n định vị LED cỡ lớn với thiết kế đ&egrave;n trước được m&ocirc; phỏng cấu tr&uacute;c đ&egrave;n từ những mẫu xe ph&acirc;n khối lớn, tạo cảm gi&aacute;c thể thao năng động. Nhờ việc cải thiện đặc điểm ph&acirc;n v&ugrave;ng &aacute;nh s&aacute;ng của đ&egrave;n chiếu s&aacute;ng ph&iacute;a trước, tầm nh&igrave;n xe được cải thiện hơn v&agrave;o ban đ&ecirc;m v&agrave; trong điều kiện thời tiết xấu.</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.honda.com.vn/motorbike-strong-points/December2020/sMYAyrNZ2r4cike1lv5t.png\" style=\"height:490px; width:650px\" /></p>\r\n\r\n<h2><strong>Mặt đồng hồ LCD</strong></h2>\r\n\r\n<p>Mặt đồng hồ LCD kỹ thuật số ho&agrave;n to&agrave;n mang lại một thiết kế hiện đại, gọn g&agrave;ng hơn v&agrave; tăng kh&ocirc;ng gian cho th&ocirc;ng tin hiển thị. Ngo&agrave;i hai th&ocirc;ng tin về h&agrave;nh tr&igrave;nh, đồng hồ c&ograve;n hiển thị th&ocirc;ng tin ti&ecirc;u thụ nhi&ecirc;n liệu tức thời/trung b&igrave;nh, gi&uacute;p người d&ugrave;ng theo d&otilde;i được sự kh&aacute;c biệt trong những t&igrave;nh huống l&aacute;i xe kh&aacute;c nhau.</p>\r\n\r\n<h1><span style=\"color:#c0392b\"><strong>Th&ocirc;ng số kĩ thuật</strong></span></h1>\r\n\r\n<p><strong>Khối lượng bản th&acirc;n</strong></p>\r\n\r\n<p>Air Blade 125cc: 111kg<br />\r\nAir Blade 150cc: 113kg</p>\r\n\r\n<p>D&agrave;i x Rộng x Cao</p>\r\n\r\n<p>Air Blade 125cc: 1.870mm x 687mm x 1.091mm<br />\r\nAir Blade 150cc: 1.870mm x 686mm x 1.112mm</p>\r\n\r\n<p><strong>Khoảng c&aacute;ch trục b&aacute;nh xe</strong></p>\r\n\r\n<p>1.286mm</p>\r\n\r\n<p><strong>Độ cao y&ecirc;n</strong></p>\r\n\r\n<p>Air Blade 125cc: 774mm<br />\r\nAir Blade 150cc: 775mm</p>\r\n\r\n<p><strong>Khoảng s&aacute;ng gầm xe</strong></p>\r\n\r\n<p>125mm</p>\r\n\r\n<p><strong>Dung t&iacute;ch b&igrave;nh xăng</strong></p>\r\n\r\n<p>4,4 l&iacute;t</p>\r\n\r\n<p><strong>Phuộc trước</strong></p>\r\n\r\n<p>Ống lồng, giảm chấn thủy lực</p>\r\n\r\n<p><strong>Phuộc sau</strong></p>\r\n\r\n<p>L&ograve; xo trụ, giảm chấn thủy lực</p>\r\n\r\n<p><strong>Loại động cơ</strong></p>\r\n\r\n<p>Xăng, 4 kỳ, 1 xy lanh, l&agrave;m m&aacute;t bằng dung dịch</p>\r\n\r\n<p><strong>C&ocirc;ng suất tối đa</strong></p>\r\n\r\n<p>Air Blade 125cc: 8,4kW/8.500 v&ograve;ng/ph&uacute;t<br />\r\nAir Blade 150cc: 9,6kW/8.500 v&ograve;ng/ph&uacute;t</p>\r\n\r\n<p><strong>Dung t&iacute;ch nhớt m&aacute;y</strong></p>\r\n\r\n<p>0,8 l&iacute;t khi thay dầu<br />\r\n0,9 l&iacute;t khi r&atilde; m&aacute;y</p>\r\n\r\n<p><strong>Mức ti&ecirc;u thụ nhi&ecirc;n liệu</strong></p>\r\n\r\n<p>Air Blade 125cc: 1,99 l&iacute;t/100km<br />\r\nAir Blade 150cc: 2,17 l&iacute;t/100km</p>\r\n\r\n<p><strong>Hộp số</strong></p>\r\n\r\n<p>Tự động, truyền động bằng đai</p>\r\n\r\n<p><strong>Hệ thống khởi động</strong></p>\r\n\r\n<p>Điện</p>\r\n\r\n<p><strong>Moment cực đại</strong>&lt;/</p>\r\n',0,1005,_binary '\0'),(2,'SIRIUS PHIÊN BẢN RC VÀNH ĐÚC',21700000,'cover.png','2022-11-11',_binary '',8,3,1,27,'<h2><strong>Động cơ</strong></h2>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Loại</td>\r\n			<td>4 th&igrave;, 2 van SOHC, l&agrave;m m&aacute;t bằng kh&ocirc;ng kh&iacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bố tr&iacute; xi lanh</td>\r\n			<td>Xi lanh đơn</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dung t&iacute;ch xy lanh (CC)</td>\r\n			<td>110.3</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Đường k&iacute;nh v&agrave; h&agrave;nh tr&igrave;nh piston</td>\r\n			<td>51,0mm x 54,0mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tỷ số n&eacute;n</td>\r\n			<td>9,3:1</td>\r\n		</tr>\r\n		<tr>\r\n			<td>C&ocirc;ng suất tối đa</td>\r\n			<td>6,60KW (9.0PS/8.000 v&ograve;ng/ph&uacute;t)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>M&ocirc; men cực đại</td>\r\n			<td>9,0Nm (0.92kgf-m/5.000 v&ograve;ng/ph&uacute;t)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ thống khởi động</td>\r\n			<td>Điện / Cần khởi động</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ thống b&ocirc;i trơn</td>\r\n			<td>C&aacute;c te ướt</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dung t&iacute;ch dầu m&aacute;y</td>\r\n			<td>1 L</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dung t&iacute;ch b&igrave;nh xăng</td>\r\n			<td>4,2 l&iacute;t</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mức ti&ecirc;u thụ nhi&ecirc;n liệu (l/100km)</td>\r\n			<td>1,99</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ chế h&ograve;a kh&iacute;</td>\r\n			<td>VM21x1</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ thống đ&aacute;nh lửa</td>\r\n			<td>DC-CDI</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tỷ số truyền sơ cấp v&agrave; thứ cấp</td>\r\n			<td>3,722 (67/18) / 2,333 (35/15)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ thống ly hợp</td>\r\n			<td>Đa đĩa, Ly t&acirc;m loại ướt</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tỷ số truyền động</td>\r\n			<td>1: 3,167 2: 1,941 3: 1,381 4: 1,095</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kiểu hệ thống truyền lực</td>\r\n			<td>4 số tr&ograve;n</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2><strong>Khung xe</strong></h2>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Hệ thống giảm x&oacute;c trước</td>\r\n			<td>Kiểu ống lồng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>H&agrave;nh tr&igrave;nh phuộc trước</td>\r\n			<td>95 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Độ lệch phương trục l&aacute;i</td>\r\n			<td>26,2&deg; / 73 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ thống giảm x&oacute;c sau</td>\r\n			<td>Giảm chấn thủy lực l&ograve; xo trụ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>H&agrave;nh tr&igrave;nh giảm x&oacute;c sau</td>\r\n			<td>77 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Phanh trước</td>\r\n			<td>Đĩa thuỷ lực</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Phanh sau</td>\r\n			<td>Phanh cơ (đ&ugrave;m)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Lốp trước</td>\r\n			<td>70/90 - 17 38P (Lốp c&oacute; săm)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Lốp sau</td>\r\n			<td>80/90 - 17 44P (Lốp c&oacute; săm)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Đ&egrave;n trước</td>\r\n			<td>Halogen 12V, 35W/35Wx1</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Đ&egrave;n sau</td>\r\n			<td>12V, 5W/18W x 1</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2><strong>K&iacute;ch thước</strong></h2>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>K&iacute;ch thước (d&agrave;i x rộng x cao)</td>\r\n			<td>1.890mm x 665mm x 1.035mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Độ cao y&ecirc;n xe</td>\r\n			<td>770mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Khoảng c&aacute;ch giữa 2 trục b&aacute;nh xe</td>\r\n			<td>1.200mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Độ cao gầm xe</td>\r\n			<td>130mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng ướt</td>\r\n			<td>96kg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2><strong>Bảo h&agrave;nh</strong></h2>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thời gian bảo h&agrave;nh</td>\r\n			<td>3 năm hoặc 30.000km (t&ugrave;y điều kiện n&agrave;o đến trước)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',0,5,_binary ''),(3,'Samsung Galaxy A23',5500000,'galaxyA23.jpg','2022-05-11',_binary '',13,1,1,96,'<h1>Hello world</h1>\r\n',0,6,_binary ''),(5,'Laptop gaming Acer Nitro 5 Tiger AN515 58 773Y',32990000,'Acer Nitro 5.png','2022-11-09',_binary '',14,8,2,50,'<h2><strong><strong>Laptop Acer Nitro 5 Tiger AN515 58 773Y</strong></strong></h2>\r\n\r\n<p><strong>Th&ocirc;ng số kỹ thuật:</strong></p>\r\n\r\n<table border=\"1\" cellpadding=\"3\" cellspacing=\"0\" id=\"tblGeneralAttribute\">\r\n	<tbody>\r\n		<tr>\r\n			<td><strong><a href=\"https://gearvn.com/collections/cpu-bo-vi-xu-ly\" target=\"_blank\">CPU</a></strong>:</td>\r\n			<td>Intel Core i7-12700H up to 4.7GHz, 24MB Cache</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong><a href=\"https://gearvn.com/collections/ram-pc\" target=\"_blank\">Ram</a></strong>:</td>\r\n			<td>8GB DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong><a href=\"http://gearvn.com/collections/ssd-laptop\" target=\"_blank\">Ổ cứng</a>:</strong></td>\r\n			<td>512GB PCIe NVMe SED&nbsp;<a href=\"https://gearvn.com/collections/ssd-o-cung-the-ran\" target=\"_blank\">SSD</a>&nbsp;(C&ograve;n trống 1 khe SSD M.2 PCIE v&agrave; 1 khe 2.5&quot; SATA)</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong><a href=\"https://gearvn.com/collections/vga-card-man-hinh\" target=\"_blank\">Card đồ họa</a></strong>:</td>\r\n			<td>NVIDIA&reg; GeForce RTX&trade; 3050Ti 4GB GDDR6</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong><a href=\"https://gearvn.com/pages/man-hinh\" target=\"_blank\">M&agrave;n h&igrave;nh</a>:</strong></td>\r\n			<td>15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Cổng giao tiếp:</strong></td>\r\n			<td>\r\n			<ul>\r\n				<li>1x USB 3.2 Gen 2 Type-C Ports (supporting: USB 3.2 Gen 2 (up to 10 Gbps); DisplayPort over USB-C; Thunderbolt 4; USB charging 5 V; 3 A; DC-in port 20 V; 65 W)</li>\r\n				<li>1x USB 3.2 Gen 2 port featuring power-off USB charging</li>\r\n				<li>1x USB 3.2 Gen 2 port</li>\r\n				<li>1x USB 3.2 Gen 1 port</li>\r\n				<li>1x Ethernet (RJ-45) port</li>\r\n				<li>1x HDMI&reg;2.1 port with HDCP support</li>\r\n				<li>1x 3.5 mm headphone/speaker jack, supporting headsets with built-in microphone</li>\r\n				<li>1x DC-in jack for AC adapter</li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Ổ quang:</strong></td>\r\n			<td>None</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Audio:</strong></td>\r\n			<td>DTS&reg; X:Ultra</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong><a href=\"https://gearvn.com/collections/ban-phim-may-tinh\" target=\"_blank\">B&agrave;n ph&iacute;m</a>:</strong></td>\r\n			<td>RGB 4 v&ugrave;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Đọc thẻ nhớ:</strong></td>\r\n			<td>None</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Chuẩn LAN:</strong></td>\r\n			<td>KillerTM Ethernet E2600</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Chuẩn WIFI:</strong></td>\r\n			<td>KillerTM Wi-Fi 6 AX 1650i (2x2)</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Bluetooth:</strong></td>\r\n			<td>Bluetooth&reg; 5.1</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong><a href=\"http://gearvn.com/collections/webcam\" target=\"_blank\">Webcam</a>:</strong></td>\r\n			<td>720p HD audio/video recording</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Hệ điều h&agrave;nh:</strong></td>\r\n			<td>Windows 11 Home</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Pin:</strong></td>\r\n			<td>4 Cell 57.5WHr</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Trọng lượng:</strong></td>\r\n			<td>2.5 kg</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>M&agrave;u sắc:</strong></td>\r\n			<td>Obsidian Black</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>K&iacute;ch thước:</strong></td>\r\n			<td>360.4 x 271.09 x 25.9 mm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2><strong>Đ&aacute;nh gi&aacute; chi tiết laptop gaming Acer Nitro 5 Tiger AN515 58 773Y</strong></h2>\r\n\r\n<p>Laptop ng&agrave;y nay được xem như vật bất ly th&acirc;n của rất nhiều người từ học sinh - sinh vi&ecirc;n, nh&acirc;n vi&ecirc;n văn ph&ograve;ng đến c&aacute;c game thủ. Acer Nitro 5 Tiger AN515 58 773Y l&agrave; chiếc&nbsp;<a href=\"https://gearvn.com/pages/laptop-gaming\" target=\"_blank\">laptop gaming</a>&nbsp;c&oacute; cấu h&igrave;nh cực mạnh, thiết kế đầy phong c&aacute;ch m&agrave; c&aacute;c t&iacute;n đồ y&ecirc;u c&ocirc;ng nghệ kh&ocirc;ng thể n&agrave;o bỏ qua.&nbsp;</p>\r\n\r\n<p><img src=\"https://file.hstatic.net/1000026716/file/773y_632f451d6e484fe78036e583b21abcf2_grande.png\" /></p>\r\n\r\n<h3><strong>Ngoại h&igrave;nh đẹp mắt tr&ecirc;n laptop gaming Acer Nitro 5 Tiger AN515 58 773Y</strong></h3>\r\n\r\n<p><a href=\"https://gearvn.com/collections/laptop-gaming-acer\" target=\"_blank\">Laptop gaming Acer</a>&nbsp;Nitro 5 Tiger AN515 c&oacute; thiết kế tr&ocirc;ng kh&aacute; mạnh mẽ v&agrave; c&oacute; phần hầm hố hơn những chiếc&nbsp;<a href=\"https://gearvn.com/pages/laptop-van-phong\" target=\"_blank\">laptop văn ph&ograve;ng</a>. Lấy m&agrave;u Obsidian Black l&agrave;m chủ đạo kết hợp c&ugrave;ng những đường cắt x&eacute;n vu&ocirc;ng vắn thể hiện sự đồ sộ của một chiếc laptop gaming m&agrave; ai cũng muốn sở hữu từ d&ograve;ng Acer Nitro 5.&nbsp;</p>\r\n\r\n<p><img alt=\"GEARVN Laptop Acer Nitro 5 Tiger AN515 58 773Y\" src=\"https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-nitro-5-tiger-an515-58-773y-5_a3e4a9886b26419698c52d0f57addb5d.png\" /></p>\r\n\r\n<p>B&agrave;n ph&iacute;m Nitro 5 Tiger AN515 nổi bật hơn khi được trang bị&nbsp;<a href=\"https://gearvn.com/collections/fan-led-trang-tri\" target=\"_blank\">LED RGB</a>&nbsp;bốn v&ugrave;ng rực rỡ tạo kh&ocirc;ng gian đẹp mắt cho c&aacute;c game thủ mỗi lần tham chiến game đầy m&aacute;u lửa. C&aacute;c ph&iacute;m được sắp xếp v&ocirc; c&ugrave;ng hợp l&yacute; với độ nhạy khi nhấn nhanh cho những lần thao t&aacute;c &ecirc;m tay v&agrave; ch&iacute;nh x&aacute;c.&nbsp;</p>\r\n\r\n<p><img alt=\"GEARVN Laptop Acer Nitro 5 Tiger AN515 58 773Y\" src=\"https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-nitro-5-tiger-an515-58-773y-8_faf5f88b67f84c11ad10672261c08167.png\" /></p>\r\n\r\n<h3><strong>Cấu h&igrave;nh mạnh mẽ kh&ocirc;ng ngại x&ocirc;ng pha</strong></h3>\r\n\r\n<p><a href=\"https://gearvn.com/collections/laptop-acer-nitro-series\" target=\"_blank\">Laptop Acer Nitro</a>&nbsp;5 Tiger AN515 sở hữu bộ vi xử l&yacute; Intel&reg; Core &trade; i7 thế hệ thứ 12 mới nhất v&agrave; GPU NVIDIA&reg; GeForce RTX &trade; 30 Series mang đến hiệu suất l&agrave;m việc vượt trội. Người d&ugrave;ng c&oacute; thể tha hồ thưởng thức c&aacute;c tựa game cấu h&igrave;nh cao, livestream thoải m&aacute;i, mọi nhu cầu đồ họa cũng được xử l&yacute; gọn g&agrave;ng cho những gi&acirc;y ph&uacute;t thăng hoa đắm ch&igrave;m khi sử dụng.&nbsp;</p>\r\n\r\n<p><img alt=\"GEARVN Laptop Acer Nitro 5 Tiger AN515 58 773Y\" src=\"https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-nitro-5-tiger-an515-58-773y-6_e14067d83749414eb5f8fd1652b4de0f.png\" /></p>\r\n\r\n<p>Bộ nhớ Ram 8GB cho ph&eacute;p Acer Nitro 5 Tiger AN515 load c&aacute;c tựa game nặng, xử l&yacute; đa nhiệm mượt m&agrave; cho nhiều thao t&aacute;c c&ugrave;ng l&uacute;c. Việc n&acirc;ng cấm Ram theo nhu cầu sử dụng cũng dễ d&agrave;ng hơn với 2 khe cắm cho GEN 4 M.2 PCIe l&ecirc;n đến 32 GB RAM&nbsp;<a href=\"https://gearvn.com/collections/ddr4-8gb\" target=\"_blank\">DDR4</a>&nbsp;3200. Kho lưu trữ khổng lồ với ổ cứng SSD 512GB để người d&ugrave;ng tự do sao lưu c&aacute;c dữ liệu, tải c&aacute;c tr&ograve; chơi y&ecirc;u th&iacute;ch tr&ecirc;n Acer Nitro 5 Tiger AN515.</p>\r\n\r\n<p><img alt=\"GEARVN Laptop Acer Nitro 5 Tiger AN515 58 773Y\" src=\"https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-nitro-5-tiger-an515-58-773y-7_653ec915c9984b439f6491b0a8317607.png\" /></p>\r\n\r\n<h3><strong>Hệ thống l&agrave;m m&aacute;t vượt trội từ&nbsp;Acer Nitro 5 Tiger AN515 58 773Y</strong></h3>\r\n\r\n<p>Acer Nitro 5 Tiger AN515 c&oacute; phần khung gầm được tinh chỉnh hợp l&yacute; hỗ trợ khả năng l&agrave;m m&aacute;t hiệu quả tr&ecirc;n m&aacute;y. Với hệ thống quạt&nbsp;<a href=\"https://gearvn.com/collections/tan-nhiet-khi\" target=\"_blank\">tản nhiệt</a>&nbsp;k&eacute;p, cửa h&uacute;t k&eacute;p tr&ecirc;n v&agrave; dưới c&ugrave;ng cổng bốn ống xả dễ d&agrave;ng lưu th&ocirc;ng lưu lượng gi&oacute;, dẫn nhiệt ra khỏi c&aacute;c thiết bị b&ecirc;n trong m&aacute;y dễ d&agrave;ng hơn. K&egrave;m theo l&agrave; phần mềm&nbsp;NitroSense để người d&ugrave;ng c&oacute; thể theo d&otilde;i v&agrave; hiệu chỉnh c&aacute;c th&ocirc;ng số về tốc độ quạt, &aacute;nh s&aacute;ng v&agrave; c&aacute;c t&ugrave;y chọn&nbsp;kh&aacute;c.&nbsp;</p>\r\n\r\n<p><img alt=\"GEARVN Laptop Acer Nitro 5 Tiger AN515 58 773Y\" src=\"https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-nitro-5-tiger-an515-58-773y-11_1accf54a9c1b4a20b3a3118ff60dcf6c_1024x1024.jpg\" /></p>\r\n\r\n<h3><strong>Chất lượng h&igrave;nh ảnh v&agrave; &acirc;m thanh ho&agrave;n hảo</strong></h3>\r\n\r\n<p>M&agrave;n h&igrave;nh Acer Nitro 5 Tiger AN515 c&oacute; k&iacute;ch thước 15.6 inch với độ ph&acirc;n giải Full HD. H&igrave;nh ảnh v&agrave; video được tr&igrave;nh xuất qua m&agrave;n ảnh v&ocirc; c&ugrave;ng sắc n&eacute;t, m&agrave;u sắc sặc sỡ, độ tưởng phản cao nhờ tấm nền m&agrave;n h&igrave;nh IPS.&nbsp;</p>\r\n\r\n<p><img alt=\"GEARVN Laptop Acer Nitro 5 Tiger AN515 58 773Y\" src=\"https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-nitro-5-tiger-an515-58-773y-14_6aace7a4e7514ae49323b6d747ca4fed_1024x1024.jpg\" /></p>\r\n\r\n<p><a href=\"http://gearvn.com/collections/thiet-bi-tai-nghe-loa-audio-chuyen-nghiep\" target=\"_blank\">Audio</a>&nbsp;của Acer Nitro 5 Tiger AN515 được trang bị loa k&eacute;p cho &acirc;m thanh ph&aacute;t ra tốt hơn. DTS: X&reg; Ultra hỗ trợ chất lượng &acirc;m thanh độ n&eacute;t cao, khi chơi game với khung cảnh kh&ocirc;ng gian 3D c&aacute;c game thủ sẽ được những trải nghiệm ch&acirc;n thật đến từng chi tiết để c&oacute; những h&agrave;nh động ch&iacute;nh x&aacute;c hạ gục đối thủ.&nbsp;</p>\r\n\r\n<p><img alt=\"GEARVN Laptop Acer Nitro 5 Tiger AN515 58 773Y\" src=\"https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-nitro-5-tiger-an515-58-773y-12_4f5c637483934129bcecfc0c900d68e9_1024x1024.jpg\" /></p>\r\n\r\n<h3><strong>Nhiều cổng kết nối&nbsp;</strong></h3>\r\n\r\n<p>Tương tự như những chiếc&nbsp;<a href=\"https://gearvn.com/collections/laptop-gaming-gia-tu-25-den-35-trieu\" target=\"_blank\">laptop gaming 25 đến 35&nbsp;triệu</a>&nbsp;kh&aacute;c, Acer Nitro 5 Tiger AN515 cũng được trang bị nhiều cổng kết nối hỗ trợ nhu cầu sử dụng của người d&ugrave;ng. Bao gồm HDMI 2.1, Intel&reg; Thunderbolt &trade; 4 v&agrave; ti&ecirc;u chuẩn USB 3.2 mới nhất với hỗ trợ Gen 1 v&agrave; 2. Giờ đ&acirc;y, c&aacute;c game thủ c&oacute; thể li&ecirc;n kết c&aacute;c thiết bị ngoại vi như&nbsp;<a href=\"https://gearvn.com/pages/chuot-may-tinh\" target=\"_blank\">chuột m&aacute;y t&iacute;nh</a>, loa,&nbsp;<a href=\"https://gearvn.com/collections/tai-nghe-over-ear\" target=\"_blank\">tai nghe</a>,... c&ugrave;ng laptop Acer cho nhu cầu hoạt động của bản th&acirc;n.</p>\r\n\r\n<p><img alt=\"GEARVN Laptop Acer Nitro 5 Tiger AN515 58 773Y\" src=\"https://file.hstatic.net/1000026716/file/gearvn-laptop-acer-nitro-5-tiger-an515-58-773y-13_d86957ac344642fb83dd3e476485911a_1024x1024.jpg\" /></p>\r\n',0.11,2,_binary '\0'),(6,'Phấn Nền Kiềm Dầu Chống Nắng 12H SPF28 Mịn Lì Fit Me Maybelline New York Compact 6g',160000,NULL,'2022-11-12',_binary '',1,1,1,300,'<p>Color</p>\r \r <p>109 - Light Ivory112 - Natural Ivory115 - Ivory118 - Light Beige120 - Classic Ivory128 - Warm nude230 - Natural Buff</p>\r \r <p>M&Ocirc; TẢ SẢN PHẨM</p>\r \r <p>&bull; Chương tr&igrave;nh khuyến m&atilde;i, duy nhất 20/10: Chọn 2 trong 3 sản phẩm son, kem l&oacute;t v&agrave; kem nền khi đơn h&agrave;ng 200k trở l&ecirc;n. &bull; V&Igrave; SAO BẠN SẼ TH&Iacute;CH? Phấn Nền Kiềm Dầu Chống Nắng 12H Mịn L&igrave; L&acirc;u Tr&ocirc;i Fit Me ch&iacute;nh l&agrave; lựa chọn gi&uacute;p bạn c&oacute; được lớp trang điểm ho&agrave;n hảo, se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng với hạt phấn si&ecirc;u nhỏ, mịn, v&agrave; da tự nhi&ecirc;n. Đặc biệt, phấn nền Fit Me c&ograve;n bảo vệ da với độ chống nắng SPF 28 PA+++, gi&uacute;p bạn tự tin thoải m&aacute;i dưới &aacute;nh nắng mặt trời. Với c&ocirc;ng nghệ Micro Powder độc quyền từ Maybelline, hạt phấn nền được thiết kế si&ecirc;u nhỏ, phủ đều tr&ecirc;n da v&agrave; tạo hiệu ứng 3D mịn m&agrave;ng ho&agrave;n hảo. Ngo&agrave;i ra, sản phẩm c&ograve;n gi&uacute;p kiềm dầu hiệu quả đến 12H, kh&ocirc;ng bết v&agrave; kh&ocirc;ng d&iacute;nh. Phấn nền Fit Me Compact c&oacute; 7 t&ocirc;ng m&agrave;u đa dạng ph&ugrave; hợp với hầu hết t&ocirc;ng da của phụ nữ Việt Nam. - 109 Light Ivory - 112 Natural Ivory - 115 Ivory - 118 Light Beige - 120 Classic Ivory - 128 Warm nude - 230 Natural Buff &bull; ƯU ĐIỂM NỔI BẬT - Độ che phủ: Trung b&igrave;nh - Cao - C&ocirc;ng nghệ Micro Powder độc quyền, hạt phấn si&ecirc;u nhỏ, phủ đều tr&ecirc;n da gi&uacute;p che phủ mọi khuyết điểm v&agrave; tạo hiệu ứng 3D mịn m&agrave;ng ho&agrave;n hảo. - 7 t&ocirc;ng m&agrave;u ph&ugrave; hợp với l&agrave;n da ch&acirc;u &Aacute;. - Độ bền: Giữ m&agrave;u v&agrave; kiềm dầu l&ecirc;n đến 12H v&agrave; kh&ocirc;ng xuống t&ocirc;ng. - Chống nắng: SPF 28 PA+++ - Tiện Lợi: Thiết kết h&igrave;nh tr&ograve;n nhỏ gọn, dễ d&agrave;ng mang theo. &bull; HIỆU QUẢ SỬ DỤNG - Lớp nền mịn, nhẹ, kh&ocirc;ng b&oacute;ng dầu. - Lớp nền được kh&oacute;a lại tr&ecirc;n da đến 12H - Chống nắng bảo vệ da v&agrave; kh&ocirc;ng lo xuống t&ocirc;ng &bull; HƯỚNG DẪN SỬ DỤNG B1: D&ugrave;ng cọ hoặc b&ocirc;ng phấn để thoa đều sản phẩm tr&ecirc;n da mặt. B2: Để c&oacute; một lớp nền ho&agrave;n hảo l&acirc;u tr&ocirc;i kh&ocirc;ng t&igrave; vết, h&atilde;y sử dụng như sau: - D&ugrave;ng kem l&oacute;t Baby Skin trước - gi&uacute;p l&agrave;m mịn v&agrave; mờ khuyết điểm, đồng thời gi&uacute;p giữ lớp trang điểm l&acirc;u hơn. - Sau bước kem nền Fit Me/ kem che khuyết điểm Fit Me, sử dụng phấn nền Fit Me Compact Powder để kh&oacute;a lớp trang điểm tr&ecirc;n da. * Nếu bạn mới bắt đầu trang điểm v&agrave; chưa sử dụng th&agrave;nh thạo kem nền, bạn h&atilde;y sử dụng trực tiếp phấn nền Fit Me Compact Powder tr&ecirc;n da sau bước kem l&oacute;t &bull; TH&Ocirc;NG TIN THƯƠNG HIỆU L&agrave; thương hiệu trang điểm số 1 thế giới, Maybelline New York ch&iacute;nh thức c&oacute; mặt tại Việt Nam từ năm 2007 v&agrave; nhanh ch&oacute;ng trở th&agrave;nh thương hiệu trang điểm h&agrave;ng đầu ở c&aacute;c d&ograve;ng sản phẩm Mascara, Kem nền, Son kem l&igrave;... Sản phẩm của Maybelline lu&ocirc;n ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến, dễ sử dụng, dẫn đầu xu hướng Makeup với sự đa dạng về sản phẩm c&ugrave;ng gi&aacute; th&agrave;nh hợp l&yacute;. Maybelline trở th&agrave;nh thương hiệu được y&ecirc;u th&iacute;ch nhất tại Việt Nam bởi c&aacute;c bạn trẻ th&iacute;ch trang điểm, th&iacute;ch thể hiện chất ri&ecirc;ng v&agrave; d&aacute;m nghĩ d&aacute;m l&agrave;m. *Bắt nguồn từ New York- Mỹ v&agrave; đ&atilde; c&oacute; mặt ở hơn 150 quốc gia, Maybelline sở hữu nhiều nh&agrave; m&aacute;y sản xuất tr&ecirc;n to&agrave;n thế giới như Trung Quốc, Mỹ, Ph&aacute;p, Nhật,... D&ugrave; được sản xuất ở đ&acirc;u, c&aacute;c sản phẩm đều tu&acirc;n thủ quy tr&igrave;nh kiểm so&aacute;t chất lượng nghi&ecirc;m ngặt của Maybelline to&agrave;n cầu. Sản phẩm Maybelline ch&iacute;nh h&atilde;ng tại Việt Nam đều c&oacute; tem nh&atilde;n tiếng Việt ph&iacute;a sau v&agrave; nhập khẩu trực tiếp từ C&ocirc;ng ty TNHH L&rsquo;Oreal Việt Nam n&ecirc;n c&aacute;c bạn ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m về chất lượng v&agrave; xuất xứ sản phẩm. Xuất xứ thương hiệu: Mỹ Nơi sản xuất: Trung Quốc Ng&agrave;y sản xuất: Xem tr&ecirc;n bao b&igrave; sản phẩm Hạn sử dụng: 3 năm kể từ ng&agrave;y sản xuất **Bao b&igrave; thay đổi theo từng đợt nhập. #Phannen #Phanphu #Phanminli #phanMaybelline #phannenMaybeline #phanFitMe #phanchekhuyetdiem #PhanMaybeline #Maybeline #FitMe #phanphuFitMe</p>\r ',0.25,4,_binary '\0'),(7,'Thùng 24 chai nước khoáng La Vie 500ml',115000,'lavie.jpg','2022-11-14',_binary '',15,15,3,100,'<h2>Th&ocirc;ng tin sản phẩm</h2>\r\n\r\n<p>Được sản xuất từ nguồn nước kho&aacute;ng s&acirc;u trong l&ograve;ng đất, lọc qua nhiều tầng địa chất gi&agrave;u kho&aacute;ng chất, hấp thu muối, c&aacute;c yếu tố vi lượng như calcium, magie, potassium, sodium, bicarbonate... Sản phẩm kh&ocirc;ng những cung cấp nước v&agrave; kho&aacute;ng chất v&agrave; duy tr&igrave; sinh lực cho cơ thể. Dạng th&ugrave;ng tiết kiệm hơn</p>\r\n\r\n<ul>\r\n	<li>Thương hiệu\r\n	<p>La Vie (Việt Nam)</p>\r\n	</li>\r\n	<li>Sản xuất tại\r\n	<p>Việt Nam</p>\r\n	</li>\r\n	<li>Loại sản phẩm\r\n	<p>Nước kho&aacute;ng</p>\r\n	</li>\r\n	<li>Đ&oacute;ng g&oacute;i\r\n	<p>Th&ugrave;ng</p>\r\n	</li>\r\n	<li>Số lượng\r\n	<p>Th&ugrave;ng 24 chai</p>\r\n	</li>\r\n	<li>Thể t&iacute;ch\r\n	<p>500ml</p>\r\n	</li>\r\n	<li>Điểm nổi bật\r\n	<p>La Vie được sản xuất từ nguồn nước kho&aacute;ng s&acirc;u trong l&ograve;ng đất, được lọc qua nhiều tầng địa chất gi&agrave;u kho&aacute;ng chất, hấp thu muối, c&aacute;c yếu tố vi lượng như calcium, magie, potassium, sodium, bicarbonate...gi&uacute;p đ&agrave;o thải c&aacute;c độc tố ra khỏi cơ thể, thanh lọc da gi&uacute;p bạn tinh thần tươi trẻ, sức khỏe căng tr&agrave;n</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>Th&ocirc;ng tin sản phẩm</h3>\r\n\r\n<p><a href=\"https://www.bachhoaxanh.com/nuoc-suoi-khoang/thung-24-chai-nuoc-khoang-la-vie-500ml\" target=\"_blank\">Nước kho&aacute;ng La Vie</a>&nbsp;được sản xuất từ nguồn nước kho&aacute;ng s&acirc;u trong l&ograve;ng đất, được lọc qua nhiều tầng địa chất gi&agrave;u kho&aacute;ng chất, hấp thu muối, c&aacute;c yếu tố vi lượng như calcium, magie, potassium, sodium, bicarbonate... Sản phẩm kh&ocirc;ng những cung cấp nước cho cơ thể của bạn, n&oacute; c&ograve;n cung cấp cho bạn kho&aacute;ng chất cần thiết để duy tr&igrave; sinh lực v&agrave; mang đến cho bạn một cảm gi&aacute;c sảng kho&aacute;i.</p>\r\n\r\n<p>Uống&nbsp;<a href=\"https://www.bachhoaxanh.com/nuoc-suoi-khoang\" target=\"_blank\">nước</a>&nbsp;kho&aacute;ng thi&ecirc;n nhi&ecirc;n&nbsp;<a href=\"https://www.bachhoaxanh.com/nuoc-suoi-khoang-lavie\" target=\"_blank\">Lavie</a>&nbsp;mỗi ng&agrave;y c&ograve;n gi&uacute;p đ&agrave;o thải c&aacute;c độc tố ra khỏi cơ thể, thanh lọc da gi&uacute;p bạn tinh thần tươi trẻ, sức khỏe căng tr&agrave;n. Uống nước kho&aacute;ng thi&ecirc;n nhi&ecirc;n LaVie h&agrave;ng ng&agrave;y l&agrave; c&aacute;ch để c&oacute; một sức khỏe tốt.</p>\r\n\r\n<p>La Vie được đ&oacute;ng chai với c&ocirc;ng nghệ hiện đại của Nestle Waters, chứa nhiều kho&aacute;ng chất với h&agrave;m lượng nhẹ v&agrave; giữ nguy&ecirc;n sự tinh khiết của nước từ c&aacute;c mạch nước ngầm rất s&acirc;u.</p>\r\n\r\n<h3>Hướng dẫn sử dụng</h3>\r\n\r\n<p>D&ugrave;ng trực tiếp, ngon hơn khi uống lạnh.</p>\r\n\r\n<h3>Bảo quản</h3>\r\n\r\n<p>Để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Tr&aacute;nh &aacute;nh nắng trực tiếp.</p>\r\n',0.1,0,_binary '\0'),(9,'Điện thoại Samsung Galaxy A73 5G 128GB',19990000,'D:\\University\\Nam 5\\KhoaLuanTotNghiep\\Project\\WorkSpace3\\LambdaBuyManager\\src\\image\\Galaxy-A73-1020x570.jpg','2022-11-17',_binary '',13,1,1,50,'Hello world',0,0,_binary '\0'),(11,'Kem hộp vani sốt socola Wall\'s Double Dutch hộp 450g',109000,'C:\\Users\\Asus\\Downloads\\kem-hop-vani-sot-socola-walls-double-dutch-hop-450g-202205141413469121.jpg','2022-11-01',_binary '',16,17,3,150,'0',0,0,_binary '');
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carts`
--

DROP TABLE IF EXISTS `Carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shipAddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj6y6xb8udmyjrq0e4cxhyynxw` (`userId`),
  CONSTRAINT `FKj6y6xb8udmyjrq0e4cxhyynxw` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carts`
--

LOCK TABLES `Carts` WRITE;
/*!40000 ALTER TABLE `Carts` DISABLE KEYS */;
INSERT INTO `Carts` VALUES (1,'Đường số 6, Q.Gò Vấp, TP.HCM','KhangDong'),(7,'Cộng Hòa, Phường 13, Quận Tân Bình, TP.HCM','Tony123'),(10,'Nguyễn Văn Bảo, Q.Gò Vấp, TP.HCM','sherekhan');
/*!40000 ALTER TABLE `Carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartItems`
--

DROP TABLE IF EXISTS `CartItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CartItems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NULL,
  `cartId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjox3ihledjxwu3gm3u9mxklnt` (`cartId`),
  KEY `FK3j8oshhm6rclt8i57qr0lesxb` (`productId`),
  CONSTRAINT `FK3j8oshhm6rclt8i57qr0lesxb` FOREIGN KEY (`productId`) REFERENCES `Products` (`id`),
  CONSTRAINT `FKjox3ihledjxwu3gm3u9mxklnt` FOREIGN KEY (`cartId`) REFERENCES `Carts` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;
-- ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Dumping data for table `CartItems`
--

LOCK TABLES `CartItems` WRITE;
/*!40000 ALTER TABLE `CartItems` DISABLE KEYS */;
INSERT INTO `CartItems` VALUES (5,2,7,2),(6,2,10,2),(8,6,10,3),(15,4,10,5),(23,1,10,1),(24,4,1,3);
/*!40000 ALTER TABLE `CartItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `orderDate` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `payment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKipog0as9ckoo6qf2t0lwk3mbe` (`userId`),
  CONSTRAINT `FKipog0as9ckoo6qf2t0lwk3mbe` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'Tân Bình',685247270,'','2022-11-07',4,'0332467724','KhangDong','COD'),
(2,'Lê Văn Sỹ, Phường 1, Quận Tân Bình ',329698089,'hello world','2022-11-14',3,'0332467724','KhangDong','MOMO');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `OrderDetails`
--

DROP TABLE IF EXISTS `OrderDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discount` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs7i5eyowhf8cl163vl9u3gjuj` (`orderId`),
  KEY `FK4mpkddctx7awuh7b27w8uw7hl` (`productId`),
  CONSTRAINT `FK4mpkddctx7awuh7b27w8uw7hl` FOREIGN KEY (`productId`) REFERENCES `Products` (`id`),
  CONSTRAINT `FKs7i5eyowhf8cl163vl9u3gjuj` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetails`
--

LOCK TABLES `OrderDetails` WRITE;
/*!40000 ALTER TABLE `OrderDetails` DISABLE KEYS */;
INSERT INTO `OrderDetails` VALUES (1,0,3,41324727,1,1),(2,0,3,21700000,1,2),(3,0,4,5500000,1,3),(4,0.1,2,115000,2,7),(5,0.25,1,160000,2,6),(6,0,3,5500000,2,3),(7,0,1,41324727,2,1);
/*!40000 ALTER TABLE `OrderDetails` ENABLE KEYS */;
UNLOCK TABLES;






/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-18 20:59:33
