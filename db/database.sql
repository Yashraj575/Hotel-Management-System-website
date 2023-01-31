DROP DATABASE IF EXISTS `ResortManagement`;
CREATE DATABASE `ResortManagement`; 
USE `ResortManagement`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE IF NOT EXISTS `customers`(
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`first_name` varchar(100) NOT NULL,
    `last_name` varchar(100) NOT NULL,
	`email` varchar(255) NOT NULL,
    `mobile_number` bigint NOT NULL,
	`password` varchar(255) NOT NULL,
     PRIMARY KEY (`customer_id`)
);

CREATE TABLE IF NOT EXISTS `resorts`(
	`resort_id` INT NOT NULL AUTO_INCREMENT,
    `resort_name` varchar(255) NOT NULL,
	`rating` DECIMAL(2,1) NOT NULL,
    `no_of_reviews` BIGINT NOT NULL default 0,
     PRIMARY KEY (`resort_id`)
);

CREATE TABLE IF NOT EXISTS `resorts_location`(
	`resort_id` INT  AUTO_INCREMENT ,
	`address` VARCHAR(255) NOT NULL,
    `city` VARCHAR(50) NOT NULL,
    primary key (`resort_id`),
    FOREIGN KEY (`resort_id`) REFERENCES resorts(`resort_id`)
);

CREATE TABLE IF NOT EXISTS `resorts_contact`(
	`resort_id` INT AUTO_INCREMENT,
    `telephone_no` VARCHAR(20) NOT NULL,
    `mobile_no` BIGINT NOT NULL,
     PRIMARY KEY (`resort_id`),
     FOREIGN KEY (`resort_id`) REFERENCES resorts(`resort_id`)
);

CREATE TABLE IF NOT EXISTS `rooms_category`(
	`room_category_id` INT AUTO_INCREMENT,
    `category_name` VARCHAR(20),
    PRIMARY KEY (`room_category_id`)
);

CREATE TABLE IF NOT EXISTS `rooms` (
	 `room_category_id` INT NOT NULL,
	 `resort_id` INT NOT NULL,
     `unit_price` INT NOT NULL,
     `available_quantity` INT NOT NULL,
     PRIMARY KEY (`resort_id`,`room_category_id`),
     FOREIGN KEY (`resort_id`) REFERENCES resorts(`resort_id`),
     FOREIGN KEY (`room_category_id`) REFERENCES rooms_category(`room_category_id`)
);

CREATE TABLE if not EXISTS `bookings`(
	`booking_id` INT AUTO_INCREMENT,
    `resort_id` INT NOT NULL,
    `customer_id` INT NOT NULL,
    `start_time` DATE NOT NULL,
    `end_time`  DATE NOT NULL,
    `status`  TINYINT DEFAULT 1,
    PRIMARY KEY (`booking_id`),
    FOREIGN KEY (`customer_id`) REFERENCES customers(`customer_id`),
    FOREIGN KEY (`resort_id`) REFERENCES resorts(`resort_id`)
);

CREATE TABLE IF NOT EXISTS `resort_images`(
	`resort_id` INT AUTO_INCREMENT,
    `image_1` VARCHAR(255) DEFAULT NULL,
    `image_2` VARCHAR(255) DEFAULT NULL,
    `image_3` VARCHAR(255) DEFAULT NULL,
    `image_4` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`resort_id`),
    FOREIGN KEY (`resort_id`) REFERENCES resorts(`resort_id`)
);

CREATE TABLE IF NOT EXISTS `booking_items`(
	`booking_id` INT NOT NULL,
    `room_category_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    PRIMARY KEY (`booking_id`,`room_category_id`),
    FOREIGN KEY (`room_category_id`) REFERENCES rooms_category(`room_category_id`),
    FOREIGN KEY (`booking_id`) REFERENCES bookings(`booking_id`) on delete cascade
);

INSERT INTO `resorts` VALUES (1,'Estate Resort',3.9,1212);
INSERT INTO `resorts_location` VALUES (1,'Nelligudde Road,Ashwathapura', 'Moodabidre');
INSERT INTO `resorts_contact` VALUES (1,'0751 404 0341',9876852321);

INSERT INTO `resorts` VALUES (2,'River Roost Resort',4.3,1177);
INSERT INTO `resorts_location` VALUES (2,'Sabarabail,Mudushedde', 'Mangalore');
INSERT INTO `resorts_contact` VALUES (2,'0222 123 4567',9404483791);

INSERT INTO `resorts` VALUES (3,'Phalguni River Resort',5.0,9);
INSERT INTO `resorts_location` VALUES (3,'Near Pilikula Nisargadhama', 'Mangalore');
INSERT INTO `resorts_contact` VALUES (3,'0722 231 949',8975963712);

INSERT INTO `resorts` VALUES (4,'Mangalore Beach Resort',4.9,517);
INSERT INTO `resorts_location` VALUES (4,'Beach road,Sankolige,Uchilla', 'Mangalore');
INSERT INTO `resorts_contact` VALUES (4,'0452 471 0849',9432145626);

INSERT INTO `resorts` VALUES (5,'Red Rock Residency',3.0,1579);
INSERT INTO `resorts_location` VALUES (5,'near NITK beach,Surathkal', 'Mangalore');
INSERT INTO `resorts_contact` VALUES (5,'0238 964 7531',9075431256);

INSERT INTO `resorts` VALUES (6,'Summer Sands Resort',4.7,865);
INSERT INTO `resorts_location` VALUES (6,'Chotamangalore,ullal', 'Mangalore');
INSERT INTO `resorts_contact` VALUES (6,'0276 891 5347',8929184512);

INSERT INTO `resorts` VALUES (7,'Pandits Health Resort',4.8,1234);
INSERT INTO `resorts_location` VALUES (7,'Basavankaje,Alangar,Belvai', 'Moodabidre');
INSERT INTO `resorts_contact` VALUES (7,'0782 431 9654',9077431862);

INSERT INTO `resorts` VALUES (8,'Raj Sea Front Beach Resort',3.9,1498);
INSERT INTO `resorts_location` VALUES (8,'Chitrapura beach road', 'Mangalore');
INSERT INTO `resorts_contact` VALUES (8,'0273 852 0145',9012450360);

INSERT INTO `resorts` VALUES (9,'Paradise Isle Beach Resort',4.2,989);
INSERT INTO `resorts_location` VALUES (9,'Malpe', 'Udupi');
INSERT INTO `resorts_contact` VALUES (9,'0730 751 8561',8944563120);

INSERT INTO `resorts` VALUES (10,'Green Retreat Second Home Resort',4.1,973);
INSERT INTO `resorts_location` VALUES (10,'Gurupura Road,Kaikamba', 'Mangalore');
INSERT INTO `resorts_contact` VALUES (10,'0221 410 2308',9405064517);

INSERT INTO `resort_images` VALUES (1,'1_1.jpeg','1_2.jpeg','1_3.jpeg','1_4.jpeg');
INSERT INTO `resort_images` VALUES (2,'2_1.jpeg','2_2.jpeg','2_3.jpeg','2_4.jpeg');
INSERT INTO `resort_images` VALUES (3,'3_1.jpeg','3_2.jpeg','3_3.jpeg','3_4.jpeg');
INSERT INTO `resort_images` VALUES (4,'4_1.jpeg','4_2.jpeg','4_3.jpeg','4_4.jpeg');
INSERT INTO `resort_images` VALUES (5,'5_1.jpeg','5_2.jpeg','5_3.jpeg','5_4.jpeg');
INSERT INTO `resort_images` VALUES (6,'6_1.jpeg','6_2.jpeg','6_3.jpeg','6_4.jpeg');
INSERT INTO `resort_images` VALUES (7,'7_1.jpeg','7_2.jpeg','7_3.jpeg','7_4.jpeg');
INSERT INTO `resort_images` VALUES (8,'8_1.jpeg','8_2.jpeg','8_3.jpeg','8_4.jpeg');
INSERT INTO `resort_images` VALUES (9,'9_1.jpeg','9_2.jpeg','9_3.jpeg','9_4.jpeg');
INSERT INTO `resort_images` VALUES (10,'10_1.jpeg','10_2.jpeg','10_3.jpeg','10_4.jpeg');

INSERT INTO `rooms_category` VALUES (1, 'Single with AC');
INSERT INTO `rooms_category` VALUES (2, 'Single without AC');
INSERT INTO `rooms_category` VALUES (3, 'Double with AC');
INSERT INTO `rooms_category` VALUES (4, 'Double without AC');

INSERT INTO `rooms` VALUES (1, 2,989, 30);
INSERT INTO `rooms` VALUES (2, 2,789, 20);
INSERT INTO `rooms` VALUES (3, 2,1499, 20);
INSERT INTO `rooms` VALUES (4, 2,1299, 20);
INSERT INTO `rooms` VALUES (1, 1,999, 2);
INSERT INTO `rooms` VALUES (2, 1,889, 35);
INSERT INTO `rooms` VALUES (2, 3,799, 25);
INSERT INTO `rooms` VALUES (4, 3,999, 25);
INSERT INTO `rooms` VALUES (1, 4,1229, 50);
INSERT INTO `rooms` VALUES (3, 4,1599, 50);
INSERT INTO `rooms` VALUES (1, 5,1099, 25);
INSERT INTO `rooms` VALUES (2, 5,880, 35);
INSERT INTO `rooms` VALUES (3, 5,1370, 20);
INSERT INTO `rooms` VALUES (3, 6,1240, 20);
INSERT INTO `rooms` VALUES (4, 6,940, 30);
INSERT INTO `rooms` VALUES (1, 7,1299, 50);
INSERT INTO `rooms` VALUES (2, 7,999, 50);
INSERT INTO `rooms` VALUES (3, 7,1699, 50);
INSERT INTO `rooms` VALUES (4, 7,1199, 50);
INSERT INTO `rooms` VALUES (2, 8,680, 85);
INSERT INTO `rooms` VALUES (1, 9,1099, 30);
INSERT INTO `rooms` VALUES (3, 9,1399, 50);
INSERT INTO `rooms` VALUES (2, 10,599, 60);
INSERT INTO `rooms` VALUES (4, 10,899, 30);
INSERT INTO `rooms` VALUES (1, 3,899, 21);
