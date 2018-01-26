/*
Navicat MySQL Data Transfer

Source Server         : Máy local
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : php1017e

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2018-01-10 18:25:48
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tbl_brands`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_brands`;
CREATE TABLE `tbl_brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_brands
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_category`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
INSERT INTO tbl_category VALUES ('1', 'Men', '0', '1');
INSERT INTO tbl_category VALUES ('2', 'Women', '0', '1');
INSERT INTO tbl_category VALUES ('3', 'Child', '0', '0');

-- ----------------------------
-- Table structure for `tbl_contents`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contents`;
CREATE TABLE `tbl_contents` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `content_type` varchar(50) NOT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_contents
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_district`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_district`;
CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_district
-- ----------------------------
INSERT INTO tbl_district VALUES ('1', '1', 'Cầu giấy', '1');
INSERT INTO tbl_district VALUES ('2', '1', 'Hoàn Kiếm', '1');
INSERT INTO tbl_district VALUES ('3', '1', 'Hoàng Mai', '1');
INSERT INTO tbl_district VALUES ('4', '1', 'Ba Đình', '1');
INSERT INTO tbl_district VALUES ('5', '2', 'Cầu Đất', '1');
INSERT INTO tbl_district VALUES ('6', '2', 'Cát Bi', '1');

-- ----------------------------
-- Table structure for `tbl_images`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_images`;
CREATE TABLE `tbl_images` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_images
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_order`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total` float(59,0) NOT NULL,
  `date_order` date NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `user_receiver` varchar(50) DEFAULT NULL,
  `mobile_receiver` char(11) NOT NULL,
  `address_receiver` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_orderdetail`;
CREATE TABLE `tbl_orderdetail` (
  `orderDetail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float(50,0) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`orderDetail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_products`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_products`;
CREATE TABLE `tbl_products` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(50) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `price` float(50,0) NOT NULL,
  `sale_off` float(10,0) DEFAULT NULL,
  `brand_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_products
-- ----------------------------
INSERT INTO tbl_products VALUES ('1', 'Sơ Mi', '1', '150', '0', '1', null, null, '0');
INSERT INTO tbl_products VALUES ('2', 'Váy', '2', '350', '0', '2', null, null, '0');

-- ----------------------------
-- Table structure for `tbl_province`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_province`;
CREATE TABLE `tbl_province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_province
-- ----------------------------
INSERT INTO tbl_province VALUES ('1', 'Hà Nôi', '1');
INSERT INTO tbl_province VALUES ('2', 'Hải Phòng', '1');
INSERT INTO tbl_province VALUES ('3', 'Hải Dương', '1');
INSERT INTO tbl_province VALUES ('4', 'Hưng Yên', '1');

-- ----------------------------
-- Table structure for `tbl_rating`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_rating`;
CREATE TABLE `tbl_rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL,
  `one` int(11) DEFAULT NULL,
  `two` int(11) DEFAULT NULL,
  `three` int(11) DEFAULT NULL,
  `four` int(11) DEFAULT NULL,
  `five` int(11) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_rating
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_users`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `ward_id` int(11) NOT NULL,
  `role` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_users
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_ward`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ward`;
CREATE TABLE `tbl_ward` (
  `ward_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) NOT NULL,
  `ward_name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`ward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_ward
-- ----------------------------
INSERT INTO tbl_ward VALUES ('1', '1', 'Quan Hoa', '1');
INSERT INTO tbl_ward VALUES ('2', '1', 'Chùa Hà', '1');
INSERT INTO tbl_ward VALUES ('3', '1', 'Dịch Vọng', '1');
INSERT INTO tbl_ward VALUES ('4', '5', 'xxx1', '1');
INSERT INTO tbl_ward VALUES ('5', '5', 'xxx2', '1');
