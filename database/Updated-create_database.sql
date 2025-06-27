-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: easyshop
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electronics','Explore the latest gadgets and electronic devices.'),(2,'Fashion','Discover trendy clothing and accessories for men and women.'),(3,'Home & Kitchen','Find everything you need to decorate and equip your home.'),(13,'Beauty & Personal Care','Skincare, haircare, and wellness products for everyone.'),(14,'Books','Novels, non-fiction, textbooks, and more for every reader.'),(15,'Clothing','Fashion for men, women, and children, for all seasons.'),(16,'Sports & Outdoors','Gear and equipment for your active lifestyle.'),(25,'Demo','Some demo category.'),(26,'Demo2','Some demo category2.'),(30,'Demo2','Some demo category2.');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line_items`
--

DROP TABLE IF EXISTS `order_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line_items` (
  `order_line_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `sales_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`order_line_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_line_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_line_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_items`
--

LOCK TABLES `order_line_items` WRITE;
/*!40000 ALTER TABLE `order_line_items` DISABLE KEYS */;
INSERT INTO `order_line_items` VALUES (1,2,1,499.99,5,0.00,2499.95),(2,2,3,99.99,1,0.00,99.99),(3,2,4,1499.99,0,0.00,0.00),(4,2,22,59.99,0,0.00,0.00),(5,2,23,49.99,1,0.00,49.99),(6,2,40,39.99,1,0.00,39.99),(7,3,2,899.99,2,0.00,1799.98),(8,3,3,99.99,1,0.00,99.99),(9,4,21,29.99,1,0.00,29.99),(10,4,12,149.99,1,0.00,149.99),(11,5,1,499.99,7,0.00,3499.93),(12,6,17,299.99,1,0.00,299.99),(13,7,1,499.99,3,0.00,1499.97),(14,7,68,24.99,1,0.00,24.99),(15,7,6,349.99,1,0.00,349.99),(16,8,30,89.99,3,0.00,269.97),(17,9,1,499.99,1,0.00,499.99),(18,10,21,29.99,1,0.00,29.99),(19,10,12,149.99,1,0.00,149.99),(20,11,19,179.99,1,0.00,179.99),(21,11,4,1499.99,2,0.00,2999.98),(22,12,1,499.99,1,0.00,499.99),(23,13,1,499.99,1,0.00,499.99),(24,14,30,89.99,1,0.00,89.99),(25,15,1,499.99,5,0.00,2499.95),(26,15,2,899.99,1,0.00,899.99),(27,16,21,29.99,1,0.00,29.99),(28,16,12,149.99,1,0.00,149.99),(29,17,1,499.99,2,0.00,999.98),(30,18,21,29.99,1,0.00,29.99),(31,18,12,149.99,1,0.00,149.99),(32,19,4,1499.99,1,0.00,1499.99),(33,19,21,29.99,3,0.00,89.97),(34,20,1,499.99,3,0.00,1499.97),(35,20,2,899.99,2,0.00,1799.98),(36,21,1,499.99,1,0.00,499.99),(37,21,2,899.99,2,0.00,1799.98),(38,22,1,499.99,2,0.00,999.98),(39,23,1,499.99,3,0.00,1499.97),(40,24,1,499.99,1,0.00,499.99),(41,25,21,29.99,3,0.00,89.97),(42,26,1,499.99,2,0.00,999.98),(43,27,17,299.99,1,0.00,299.99),(44,27,2,899.99,2,0.00,1799.98),(45,27,8,79.99,1,0.00,79.99),(46,27,12,149.99,1,0.00,149.99),(47,28,21,29.99,1,0.00,29.99),(48,28,12,149.99,1,0.00,149.99),(49,30,4,1499.99,1,0.00,1499.99),(50,30,7,399.99,2,0.00,799.98),(51,31,4,1499.99,2,0.00,2999.98),(52,32,17,299.99,2,0.00,599.98),(53,33,2,899.99,1,0.00,899.99),(54,34,17,299.99,1,0.00,299.99),(55,35,1,499.99,1,0.00,499.99),(56,36,1,499.99,2,0.00,0.00),(57,36,2,899.99,3,0.00,0.00),(58,37,2,899.99,0,0.00,0.00),(59,38,2,899.99,4,0.00,3599.96),(60,39,1,499.99,2,0.00,999.98),(61,39,2,899.99,2,0.00,1799.98),(62,40,1,499.99,5,0.00,2499.95),(63,41,1,499.99,1,0.00,499.99),(64,41,12,149.99,1,0.00,149.99),(65,42,1,499.99,0,0.00,0.00),(66,43,21,29.99,1,0.00,29.99),(67,43,12,149.99,1,0.00,149.99),(68,44,16,79.99,3,0.00,239.97),(69,44,1,499.99,1,0.00,499.99),(70,44,17,299.99,1,0.00,299.99),(71,44,21,29.99,1,0.00,29.99),(72,45,1,499.99,3,0.00,1499.97),(73,45,6,349.99,3,0.00,1049.97),(74,45,27,59.99,1,0.00,59.99),(75,46,21,29.99,1,0.00,29.99),(76,46,12,149.99,1,0.00,149.99);
/*!40000 ALTER TABLE `order_line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `shipping_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,4,'2025-06-23 15:17:22','123 test st','some city','ST','12121',0.00),(2,4,'2025-06-23 15:37:53','123 test st','some city','ST','12121',0.00),(3,4,'2025-06-23 15:38:51','123 test st','some city','ST','12121',0.00),(4,6,'2025-06-23 15:39:40','123 test st','some city','ST','12121',0.00),(5,4,'2025-06-23 15:44:35','123 test st','some city','ST','12121',0.00),(6,4,'2025-06-23 15:45:40','123 test st','some city','ST','12121',0.00),(7,4,'2025-06-23 15:57:39','123 test st','some city','ST','12121',0.00),(8,4,'2025-06-23 16:00:40','123 test st','some city','ST','12121',0.00),(9,4,'2025-06-23 16:13:53','123 test st','some city','ST','12121',0.00),(10,6,'2025-06-23 16:36:44','123 test st','some city','ST','12121',0.00),(11,4,'2025-06-23 17:11:23','123 test st','some city','ST','12121',0.00),(12,4,'2025-06-23 17:11:46','123 test st','some city','ST','12121',0.00),(13,4,'2025-06-23 17:12:17','123 test st','some city','ST','12121',0.00),(14,4,'2025-06-23 17:12:29','123 test st','some city','ST','12121',0.00),(15,4,'2025-06-23 17:56:13','123 test st','some city','ST','12121',0.00),(16,6,'2025-06-23 17:57:29','123 test st','some city','ST','12121',0.00),(17,4,'2025-06-24 08:25:38','123 test st','some city','ST','12121',0.00),(18,6,'2025-06-24 09:31:41','123 test st','some city','ST','12121',0.00),(19,13,'2025-06-24 09:57:01','','','','',0.00),(20,13,'2025-06-24 16:49:42','','','','',0.00),(21,4,'2025-06-24 17:50:37','123 test st','some city','ST','12121',0.00),(22,4,'2025-06-24 20:25:03','123 test st','some city','ST','12121',0.00),(23,4,'2025-06-24 20:43:40','123 test st','some city','ST','12121',0.00),(24,12,'2025-06-25 08:44:23','','','','',0.00),(25,13,'2025-06-25 08:46:40','','','','',0.00),(26,4,'2025-06-25 08:48:06','123 test st','some city','ST','12121',0.00),(27,4,'2025-06-25 08:54:12','123 test st','some city','ST','12121',0.00),(28,6,'2025-06-25 08:54:49','123 test st','some city','ST','12121',0.00),(29,4,'2025-06-25 09:44:35','123 test st','some city','ST','12121',0.00),(30,4,'2025-06-25 09:45:18','123 test st','some city','ST','12121',0.00),(31,4,'2025-06-25 09:46:04','123 test st','some city','ST','12121',0.00),(32,4,'2025-06-25 10:08:19','123 test st','some city','ST','12121',0.00),(33,4,'2025-06-25 13:35:30','123 test st','some city','ST','12121',0.00),(34,4,'2025-06-25 14:08:35','123 test st','some city','ST','12121',0.00),(35,4,'2025-06-25 14:24:49','123 test st','some city','ST','12121',0.00),(36,4,'2025-06-25 18:51:32','123 test st','some city','ST','12121',0.00),(37,4,'2025-06-25 21:57:34','123 test st','some city','ST','12121',0.00),(38,4,'2025-06-25 22:10:51','123 test st','some city','ST','12121',0.00),(39,4,'2025-06-25 22:24:03','123 test st','some city','ST','12121',0.00),(40,4,'2025-06-25 22:25:03','123 test st','some city','ST','12121',0.00),(41,4,'2025-06-26 08:04:08','123 test st','some city','ST','12121',0.00),(42,4,'2025-06-26 08:06:14','123 test st','some city','ST','12121',0.00),(43,6,'2025-06-26 10:49:18','123 test st','some city','ST','12121',0.00),(44,4,'2025-06-26 18:40:10','123 test st','some city','ST','12121',0.00),(45,4,'2025-06-27 08:01:52','123 test st','some city','ST','12121',0.00),(46,6,'2025-06-27 08:03:56','123 test st','some city','ST','12121',0.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int NOT NULL,
  `description` text,
  `color` varchar(20) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Smartphone',499.99,1,'A powerful and feature-rich smartphone for all your communication needs.','Black','smartphone.jpg',50,0),(2,'Laptop',899.99,1,'A high-performance laptop for work and entertainment.','Gray','laptop.jpg',30,0),(3,'Headphones',99.99,1,'Immerse yourself in music with these high-quality headphones.','White','headphones.jpg',100,1),(4,'Smart TV',1499.99,1,'Experience stunning visuals and smart features with this advanced television.','Black','smart-tv.jpg',20,0),(5,'Digital Camera',599.99,1,'Capture life\'s precious moments with this professional-grade digital camera.','Silver','camera.jpg',15,1),(6,'Tablet',349.99,1,'A portable and versatile tablet for productivity and entertainment.','Black','tablet.jpg',40,0),(7,'Gaming Console',399.99,1,'Experience the latest gaming adventures with this powerful gaming console.','Black','gaming-console.jpg',10,0),(8,'Wireless Earbuds',79.99,1,'Enjoy wireless freedom and crystal-clear audio with these sleek earbuds.','White','earbuds.jpg',75,0),(9,'Smart Watch',199.99,1,'Stay connected and track your fitness goals with this stylish smartwatch.','White','smartwatch.jpg',25,1),(10,'Bluetooth Speaker',129.99,1,'Take your music anywhere with this portable and high-quality Bluetooth speaker.','Charcoal','speaker.jpg',50,0),(11,'Drones',299.99,1,'Explore the skies and capture breathtaking aerial photos and videos with this drone.','White','drone.jpg',5,0),(12,'Printer',149.99,1,'Print documents and photos with ease using this reliable printer.','White','printer.jpg',20,0),(13,'Fitness Tracker',89.99,1,'Monitor your fitness activities and achieve your health goals with this fitness tracker.','Charcoal','fitness-tracker.jpg',30,1),(14,'Wireless Router',79.99,1,'Ensure fast and reliable internet connectivity with this high-performance wireless router.','Black','wireless-router.jpg',15,0),(15,'External Hard Drive',129.99,1,'Expand your storage capacity and backup your important files with this external hard drive.','Gray','external-hard-drive.jpg',25,1),(16,'Gaming Keyboard',79.99,1,'Enhance your gaming experience with this responsive and customizable gaming keyboard.','Black','gaming-keyboard.jpg',35,1),(17,'Virtual Reality Headset',299.99,1,'Immerse yourself in virtual worlds with this cutting-edge virtual reality headset.','Charcoal','vr-headset.jpg',10,0),(18,'Wireless Mouse',49.99,1,'Navigate your computer with precision and freedom using this wireless mouse.','Charcoal','wireless-mouse.jpg',50,1),(19,'Smart Home Hub',179.99,1,'Control your smart devices and create a connected home with this intelligent home hub.','White','smart-home-hub.jpg',10,0),(20,'Portable Charger',39.99,1,'Keep your devices powered up on the go with this compact and reliable portable charger.','Black','portable-charger.jpg',50,0),(21,'Men\'s T-Shirt',29.99,2,'A comfortable and stylish t-shirt for everyday wear.','Charcoal','mens-tshirt.jpg',50,1),(22,'Men\'s Jeans',59.99,2,'Classic denim jeans for a timeless and casual look.','Blue','mens-jeans.jpg',30,0),(23,'Men\'s Dress Shirt',49.99,2,'A sophisticated dress shirt for formal occasions.','White','mens-dress-shirt.jpg',40,0),(24,'Men\'s Hoodie',39.99,2,'Stay warm and stylish with this cozy hoodie.','Black','mens-hoodie.jpg',25,1),(25,'Men\'s Suit',199.99,2,'Look sharp and elegant with this tailored suit.','Dark Blue','mens-suit.jpg',10,0),(26,'Men\'s Shorts',34.99,2,'Comfortable and versatile shorts for a relaxed summer look.','Tan','mens-shorts.jpg',30,0),(27,'Men\'s Sweater',59.99,2,'Stay cozy and fashionable with this stylish sweater.','Brown','mens-sweater.jpg',20,0),(28,'Men\'s Polo Shirt',39.99,2,'A classic and versatile polo shirt for a smart-casual style.','Olive','mens-polo-shirt.jpg',50,1),(29,'Men\'s Jacket',79.99,2,'A trendy and functional jacket for all seasons.','Charcoal','mens-jacket.jpg',15,1),(30,'Men\'s Dress Shoes',89.99,2,'Elevate your formal look with these stylish dress shoes.','Brown','mens-dress-shoes.jpg',25,0),(31,'Men\'s Sneakers',69.99,2,'Comfortable and stylish sneakers for everyday wear.','White','mens-sneakers.jpg',50,1),(32,'Men\'s Watch',149.99,2,'A sophisticated and elegant watch to complete your look.','Black','mens-watch.jpg',20,1),(33,'Men\'s Belt',29.99,2,'A versatile and stylish belt to enhance your outfit.','Brown','mens-belt.jpg',35,0),(34,'Men\'s Socks',9.99,2,'High-quality and comfortable socks for everyday use.','Turquoise','mens-socks.jpg',100,1),(35,'Men\'s Swim Trunks',34.99,2,'Stylish and comfortable swim trunks for beach and pool days.','Orange','mens-swim-trunks.jpg',30,0),(36,'Men\'s Winter Coat',149.99,2,'Stay warm and fashionable during the winter season with this coat.','Red','mens-winter-coat.jpg',10,0),(37,'Men\'s Hat',24.99,2,'Add a stylish touch to your outfit with this fashionable hat.','Navy','mens-hat.jpg',50,1),(38,'Men\'s Tie',19.99,2,'Complete your formal look with this elegant and classy tie.','Orange','mens-tie.jpg',40,0),(39,'Men\'s Dress Pants',49.99,2,'A pair of tailored dress pants for a polished and professional look.','Khaki','mens-dress-pants.jpg',20,0),(40,'Men\'s Casual Shirt',39.99,2,'A versatile and comfortable shirt for a laid-back style.','Gray','mens-casual-shirt.jpg',30,1),(41,'Women\'s Dress',79.99,2,'A beautiful and elegant dress for special occasions.','Mint','womens-dress.jpg',50,0),(42,'Women\'s Jeans',69.99,2,'Comfortable and stylish jeans for a fashionable look.','Blue','womens-jeans.jpg',30,1),(43,'Women\'s Blouse',49.99,2,'A versatile and chic blouse for everyday wear.','Lavender','womens-blouse.jpg',40,0),(44,'Women\'s Sweater',59.99,2,'Stay cozy and fashionable with this stylish sweater.','Teal','womens-sweater.jpg',25,1),(45,'Women\'s Skirt',39.99,2,'A trendy and versatile skirt for a feminine look.','Gray','womens-skirt.jpg',10,0),(46,'Women\'s Shorts',34.99,2,'Comfortable and stylish shorts for a casual summer look.','Blue','womens-shorts.jpg',30,1),(47,'Women\'s Jumpsuit',89.99,2,'A fashionable and effortless jumpsuit for a trendy look.','Maroon','womens-jumpsuit.jpg',20,0),(48,'Women\'s T-Shirt',29.99,2,'A comfortable and stylish t-shirt for everyday wear.','Mint','womens-tshirt.jpg',50,0),(49,'Women\'s Blazer',89.99,2,'A sophisticated and tailored blazer for a polished look.','Maroon','womens-blazer.jpg',15,1),(50,'Women\'s Activewear Set',79.99,2,'Stay active and stylish with this matching activewear set.','Lavender','womens-activewear.jpg',25,0),(51,'Women\'s Swimwear',59.99,2,'Stylish and comfortable swimwear for beach and pool days.','Yellow','womens-swimwear.jpg',50,0),(52,'Women\'s Shoes',79.99,2,'Step out in style with these fashionable and comfortable shoes.','Red','womens-shoes.jpg',35,1),(53,'Women\'s Hat',29.99,2,'Add a stylish touch to your look with this fashionable hat.','Orange','womens-hat.jpg',100,1),(54,'Women\'s Socks',9.99,2,'Comfortable and stylish socks for everyday use.','Teal','womens-socks.jpg',30,1),(55,'Women\'s Winter Coat',149.99,2,'Stay warm and fashionable during the winter season with this coat.','Pink','womens-winter-coat.jpg',10,0),(56,'Women\'s Scarf',24.99,2,'A versatile and cozy scarf to add a pop of color to your outfit.','Maroon','womens-scarf.jpg',50,0),(57,'Women\'s Formal Gown',199.99,2,'A stunning and glamorous gown for formal events.','Burgundy','womens-gown.jpg',30,1),(58,'Cookware Set',149.99,3,'A comprehensive set of high-quality cookware for all your culinary needs.','Red','cookware-set.jpg',50,1),(59,'Coffee Maker',79.99,3,'Brew your favorite coffee with this efficient and stylish coffee maker.','Black','coffee-maker.jpg',30,0),(60,'Kitchen Knife Set',59.99,3,'A set of sharp and durable knives for effortless food preparation.','Silver','knife-set.jpg',40,1),(61,'Food Processor',99.99,3,'Make food preparation easier and faster with this versatile food processor.','Silver','food-processor.jpg',25,0),(62,'Blender',49.99,3,'Blend smoothies, soups, and more with this powerful and reliable blender.','Black','blender.jpg',10,1),(63,'Air Fryer',89.99,3,'Enjoy crispy and delicious fried foods with less oil using this convenient air fryer.','Red','air-fryer.jpg',30,0),(64,'Toaster',39.99,3,'A reliable and efficient toaster for perfectly toasted bread and bagels.','Silver','toaster.jpg',20,1),(65,'Slow Cooker',69.99,3,'Prepare flavorful and tender meals with this convenient slow cooker.','Blue','slow-cooker.jpg',50,1),(66,'Electric Kettle',29.99,3,'Boil water quickly and efficiently with this sleek electric kettle.','Silver','electric-kettle.jpg',15,0),(67,'Microwave Oven',99.99,3,'Heat and cook food with ease using this versatile microwave oven.','Silver','microwave-oven.jpg',25,0),(68,'Food Storage Containers',24.99,3,'Keep your food fresh and organized with this set of reusable storage containers.','White','food-storage-containers.jpg',50,0),(69,'Utensil Set',19.99,3,'A comprehensive set of cooking utensils for all your kitchen needs.','Silver','utensil-set.jpg',35,1),(70,'Dining Set',149.99,3,'Elevate your dining experience with this elegant and durable dining set.','Red','dining-set.jpg',25,0),(71,'Casserole Dish',34.99,3,'Bake and serve delicious casseroles with this versatile and stylish dish.','White','casserole-dish.jpg',50,0),(72,'Cutting Board Set',29.99,3,'A set of durable and hygienic cutting boards for all your food preparation.','Gray','cutting-board-set.jpg',10,0),(73,'Canister Set',49.99,3,'Store and organize your kitchen essentials with this stylish canister set.','Blue','canister-set.jpg',20,0),(74,'Glassware Set',39.99,3,'Enjoy your favorite beverages in style with this set of elegant glassware.','Clear','glassware-set.jpg',35,0),(75,'Bakeware Set',79.99,3,'A versatile set of baking pans and trays for all your baking needs.','White','bakeware-set.jpg',10,1),(76,'Electric Mixer',59.99,3,'Mix ingredients effortlessly with this powerful and handy electric mixer.','Silver','electric-mixer.jpg',30,1),(77,'Ice Cream Maker',49.99,3,'Make delicious homemade ice cream with this easy-to-use ice cream maker.','Black','ice-cream-maker.jpg',25,1),(78,'Serving Tray',19.99,3,'Serve your favorite dishes and snacks with style using this elegant serving tray.','Tan','serving-tray.jpg',50,0),(79,'Spice Rack',24.99,3,'Organize and display your spices with this convenient and space-saving spice rack.','White','spice-rack.jpg',30,1),(80,'Kitchen Scale',14.99,3,'Accurately measure ingredients for your recipes with this reliable kitchen scale.','Silver','kitchen-scale.jpg',25,0),(81,'Tea Kettle',29.99,3,'Brew a perfect cup of tea with this classic and durable tea kettle.','White','tea-kettle.jpg',50,1),(82,'Wine Glasses',29.99,3,'Sip and savor your favorite wines with these elegant wine glasses.','Clear','wine-glasses.jpg',15,1),(83,'Dish Rack',34.99,3,'Dry and organize your dishes with this practical and space-saving dish rack.','Gray','dish-rack.jpg',25,0),(84,'Apron',19.99,3,'Protect your clothes while cooking with this stylish and functional apron.','White','apron.jpg',35,0),(85,'Kitchen Timer',9.99,3,'Keep track of cooking times with this handy and easy-to-use kitchen timer.','White','kitchen-timer.jpg',100,0),(86,'Mixing Bowls Set',29.99,3,'A set of versatile and durable mixing bowls for all your culinary creations.','Silver','mixing-bowls.jpg',30,1),(87,'Measuring Cup Set',14.99,3,'Accurately measure ingredients with this set of handy and stackable measuring cups.','Green','measuring-cups.jpg',50,1),(88,'Laptop',999.99,1,'A high-performance laptop for work and entertainment.','Gray','laptop.jpg',30,0),(89,'Laptop',999.99,1,'A high-performance gaming laptop.','Gray','laptop.jpg',30,0),(90,'Tea Kettle',29.99,3,'Brew a perfect cup of tea with this classic tea kettle.','White','tea-kettle.jpg',50,1),(91,'New Cool Gadget',199.99,1,'A really cool gadget for testing.','Black','cool-gadget.jpg',10,1),(93,'Men\'s T-Shirt (Updated)',31.99,2,'Updated description.','Charcoal','mens-tshirt.jpg',50,1),(94,'Men\'s T-Shirt',31.99,2,'Updated description.','Charcoal','mens-tshirt.jpg',50,1),(95,'Men\'s T-Shirt',31.99,2,'Updated.','Charcoal','mens-tshirt.jpg',50,1),(96,'Moisturizing Face Cream',24.99,13,'Hydrating face cream suitable for all skin types.','White','face-cream.jpg',50,1),(97,'Moisturizing Face Cream2',24.99,13,'Hydrating face cream suitable for all skin types.','White','face-cream.jpg',50,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Joe','Joesephus','800-555-1234','joejoesephus@email.com','789 Oak Avenue','Dallas','TX','75051'),(2,'Adam','Admamson','800-555-1212','aaadamson@email.com','456 Elm Street','Dallas','TX','75052'),(3,'George','Jetson','800-555-9876','george.jetson@email.com','123 Birch Parkway','Dallas','TX','75051'),(4,'Joe','Tester.','888-456-9876','j.tester@test.net','123 test st','some city','ST','12121'),(5,'','','','','','','',''),(6,'Joe','Tester','888-456-9876','j.tester@test.net','123 test st','some city','ST','12121'),(7,'','','','','','','',''),(8,'','','','','','','',''),(9,'','','','','','','',''),(10,'','','','','','','',''),(11,'','','','','','','',''),(12,'','','','','','','',''),(13,'','','','','','','',''),(14,'Jam','Tester','888-456-9876','j.tester@test.net','123 test st','city','ST','12121'),(16,'','','','','','','',''),(17,'','','','','','','',''),(18,'','','','','','','',''),(19,'','','','','','','',''),(20,'','','','','','','','');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (2,1,1),(3,8,1),(3,10,1),(7,1,2),(7,3,0),(7,6,3),(14,12,1);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `hashed_password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user','$2a$10$NkufUPF3V8dEPSZeo1fzHe9ScBu.LOay9S3N32M84yuUM2OJYEJ/.','ROLE_USER'),(2,'admin','$2a$10$lfQi9jSfhZZhfS6/Kyzv3u3418IgnWXWDQDk7IbcwlCFPgxg9Iud2','ROLE_ADMIN'),(3,'george','$2a$10$lfQi9jSfhZZhfS6/Kyzv3u3418IgnWXWDQDk7IbcwlCFPgxg9Iud2','ROLE_USER'),(4,'Marcon','$2a$10$eUgTb8S.3RtXvTC8AEUcg.xofxh0Fv/zzXeCYQDm//FyCppIgNf.S','ROLE_ADMIN'),(5,'Lwis','$2a$10$FodKdweHqiNoJL2eH4PkA.q6.qMuAlNy6OnS6KYQ/hOaMvrLVJeSC','ROLE_USER'),(6,'gary','$2a$10$/X/kpwJV9uUoJTSdTV21o.m8mYBRoNryzv/LgMVhXP6o/og4MbO2a','ROLE_USER'),(7,'Lewis','$2a$10$2LbPaMPmOMEwfk6FD5CJ4.QuhK6Aiq6UDnbtV.ahcDsj7EBGVxRL2','ROLE_USER'),(8,'admin1','$2a$10$hnsIPQ9y/4uqD2CJJBFRq.rfycDpDMO4rKobdyeCJhbjH19RsldUG','ROLE_ADMIN'),(9,'user1','$2a$10$3xlsnIpb5inHud5qv2q1sebUh8P0f2yTP3Yq7fEcceqJ9TfuwrGFW','ROLE_USER'),(10,'user2','$2a$10$ajd.UGbbCueriTY0ki2f..f4FhqzJYDe6eKigq8tiUYL230b/2Wme','ROLE_USER'),(11,'user3','$2a$10$1mgrCnS4tKF.DnTS9u2ieOW05iC0513ZoytaNwLOVF1op4OnVmVMS','ROLE_USER'),(12,'Alex','$2a$10$/Xuh5jPMbUFV6zZKzqmlQ.MPFnIiU1wqdFjcxZ7Y4Fe9Ap0EW0J6i','ROLE_USER'),(13,'James','$2a$10$lp1CpbsWVZGrPAAHg0l2YO1ue7ZspaaRWf0x87IPg1n1j3nkiBXtS','ROLE_USER'),(14,'Jam','$2a$10$kKeZrdN.mi37kXo3uJ5om.quNAKpEwvAgUT9g6N2MH/L2PQ1DXts.','ROLE_USER'),(15,'J','$2a$10$8.Whcwbj0jh7/nzonqLvEemkR2k3SqKYNXdp0ikR.SBHFKNCDlE9u','ROLE_ADMIN'),(16,'M','$2a$10$QDgDeVEEW5mlQM7pHl64k.x.pWGvn8O8IwZNNxkKKKmmBnbKKhID.','ROLE_ADMIN'),(17,'M3','$2a$10$Sk/qlZokdki26mlavxh89OOy27JL95HgHVkwg4wU3pm/s0dd97mnq','ROLE_ADMIN'),(18,'M4','$2a$10$UY.gKIIim4SqqPufphSL1eucgaKDSx6quaJ5MTVLm.qxxpSpWwCUq','ROLE_ADMIN'),(19,'gary2','$2a$10$91sl5n9Cj/3Tk8IeXjwSBeDyrl0jEVWHwVJe6dQ/i63/ddyOe0uD2','ROLE_USER'),(20,'gary3','$2a$10$mOIPJtE7huuwUKhrtfpl2.scHSNvgVeLdbCAwJmvd/lO.kbsXMnTa','ROLE_USER');
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

-- Dump completed on 2025-06-27 10:21:05
