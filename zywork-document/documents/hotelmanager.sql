/*
Navicat MySQL Data Transfer

Source Server         : mac
Source Server Version : 50719
Source Host           : 172.20.10.3:3306
Source Database       : hotelmanager

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-12-01 20:01:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_cash_accounts
-- ----------------------------
DROP TABLE IF EXISTS `t_cash_accounts`;
CREATE TABLE `t_cash_accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `shop_manager_id` bigint(20) NOT NULL,
  `account_type` tinyint(4) NOT NULL,
  `account_time` datetime NOT NULL,
  `total_pay` decimal(18,2) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `shop_manager_id` (`shop_manager_id`),
  KEY `subject_id` (`subject_id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `t_cash_accounts_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_cash_accounts_ibfk_2` FOREIGN KEY (`shop_manager_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_cash_accounts_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `t_cash_subject` (`id`),
  CONSTRAINT `t_cash_accounts_ibfk_4` FOREIGN KEY (`hotel_id`) REFERENCES `t_hotel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cash_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for t_cash_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_cash_subject`;
CREATE TABLE `t_cash_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` bigint(20) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_cash_subject_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cash_subject
-- ----------------------------
INSERT INTO `t_cash_subject` VALUES ('1', '牙刷', '牙刷', '2017-11-30 22:10:13', '1', '0');
INSERT INTO `t_cash_subject` VALUES ('2', '被套', '被套', '2017-11-30 22:16:34', '1', '0');

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `represent` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1', '瑞蓝酒店', '陈闯', '15563906390', '15563906390', '山东省青岛市', '瑞蓝酒店是一个大型具有24个连锁酒店的公司', '2017-11-14 20:41:17', '0');
INSERT INTO `t_company` VALUES ('2', '瑞蓝酒店1', '陈闯', '15563906390', '15563906390', '山东省青岛市', '瑞蓝酒店是一个大型具有24个连锁酒店的公司，规模宏大	', '2017-11-14 20:41:17', '0');

-- ----------------------------
-- Table structure for t_contract
-- ----------------------------
DROP TABLE IF EXISTS `t_contract`;
CREATE TABLE `t_contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `master_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `contract_contract` varchar(500) NOT NULL,
  `contract_years` int(11) NOT NULL,
  `contract_date` date NOT NULL,
  `contract_no` varchar(100) NOT NULL,
  `min_profit` decimal(18,2) NOT NULL,
  `profit_rate` double NOT NULL,
  `month_pay` decimal(18,2) NOT NULL,
  `pay_date` date DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `master_id` (`master_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_contract_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `t_contract_master` (`id`),
  CONSTRAINT `t_contract_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_contract
-- ----------------------------
INSERT INTO `t_contract` VALUES ('1', '1', '1', '瑞蓝酒店房租', '3', '2017-11-17', '房租合同1号', '1000.00', '10', '3000.00', '2017-11-17', '2017-11-17 22:22:59', '0');
INSERT INTO `t_contract` VALUES ('2', '3', '2', '瑞蓝酒店房租1', '3', '2017-11-17', '房租合同3号', '2000.00', '10', '3000.00', '2017-11-17', '2017-11-17 22:24:12', '0');
INSERT INTO `t_contract` VALUES ('3', '1', '1', '青岛市', '4', '2017-11-21', '666666', '1000.00', '10', '2000.00', '2017-11-21', '2017-11-21 21:22:09', '0');

-- ----------------------------
-- Table structure for t_contract_master
-- ----------------------------
DROP TABLE IF EXISTS `t_contract_master`;
CREATE TABLE `t_contract_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(50) DEFAULT NULL,
  `bank_account_name` varchar(50) DEFAULT NULL,
  `bank_account_no` varchar(18) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` int(11) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_contract_master
-- ----------------------------
INSERT INTO `t_contract_master` VALUES ('1', '中国银行', '皓月', '1111111111', '2017-11-16 22:50:16', '0', '1');
INSERT INTO `t_contract_master` VALUES ('3', '中国建设银行', '心空', '222222', '2017-11-16 23:18:56', '0', '2');
INSERT INTO `t_contract_master` VALUES ('4', '农村信用社', '信用', '33333', '2017-11-18 22:50:40', '0', '1');

-- ----------------------------
-- Table structure for t_cooperation_accounts
-- ----------------------------
DROP TABLE IF EXISTS `t_cooperation_accounts`;
CREATE TABLE `t_cooperation_accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `shop_manager_id` bigint(20) NOT NULL,
  `account_type` tinyint(4) NOT NULL,
  `account_time` datetime NOT NULL,
  `total_pay` decimal(18,2) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `cooperation_company_id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `shop_manager_id` (`shop_manager_id`),
  KEY `subject_id` (`subject_id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `t_cooperation_accounts_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_cooperation_accounts_ibfk_2` FOREIGN KEY (`shop_manager_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_cooperation_accounts_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `t_cooperation_company` (`id`),
  CONSTRAINT `t_cooperation_accounts_ibfk_4` FOREIGN KEY (`hotel_id`) REFERENCES `t_hotel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cooperation_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for t_cooperation_company
-- ----------------------------
DROP TABLE IF EXISTS `t_cooperation_company`;
CREATE TABLE `t_cooperation_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `shop_manager_id` bigint(20) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(150) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `shop_manager_id` (`shop_manager_id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `t_cooperation_company_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_cooperation_company_ibfk_2` FOREIGN KEY (`shop_manager_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_cooperation_company_ibfk_3` FOREIGN KEY (`hotel_id`) REFERENCES `t_hotel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cooperation_company
-- ----------------------------

-- ----------------------------
-- Table structure for t_cooperation_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_cooperation_subject`;
CREATE TABLE `t_cooperation_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` bigint(20) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_cooperation_subject_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cooperation_subject
-- ----------------------------
INSERT INTO `t_cooperation_subject` VALUES ('1', '被单', '被单', '2017-11-30 22:13:11', '1', '0');

-- ----------------------------
-- Table structure for t_cooperation_website
-- ----------------------------
DROP TABLE IF EXISTS `t_cooperation_website`;
CREATE TABLE `t_cooperation_website` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cooperation_website
-- ----------------------------
INSERT INTO `t_cooperation_website` VALUES ('1', '携程网', '携程网', '2017-11-15 12:40:19', '0', '1');
INSERT INTO `t_cooperation_website` VALUES ('2', '途牛', '途牛', '2017-11-30 21:43:48', '0', '1');

-- ----------------------------
-- Table structure for t_customer_order
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_order`;
CREATE TABLE `t_customer_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `shop_manager_id` bigint(20) NOT NULL,
  `house_id` bigint(20) NOT NULL,
  `contract_id` bigint(20) NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `customer_identity` varchar(200) NOT NULL,
  `customer_phone` varchar(11) NOT NULL,
  `customer_gender` varchar(20) NOT NULL,
  `customer_from` tinyint(4) NOT NULL,
  `website_id` bigint(20) DEFAULT NULL,
  `unit_price` decimal(18,2) NOT NULL,
  `total_days` tinyint(4) NOT NULL,
  `house_pay` decimal(18,2) NOT NULL,
  `service_pay` decimal(18,2) NOT NULL,
  `deposit` decimal(18,2) NOT NULL,
  `total_pay` decimal(18,2) NOT NULL,
  `actual_return` decimal(18,2) NOT NULL,
  `payment_type_id` bigint(20) NOT NULL,
  `checkin_time` datetime NOT NULL,
  `checkout_time` datetime NOT NULL,
  `checkout_max_time` datetime NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `order_status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_check` tinyint(4) NOT NULL,
  `check_remark` varchar(500) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `shop_manager_id` (`shop_manager_id`),
  KEY `house_id` (`house_id`),
  KEY `contract_id` (`contract_id`),
  KEY `website_id` (`website_id`),
  CONSTRAINT `t_customer_order_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_customer_order_ibfk_2` FOREIGN KEY (`shop_manager_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_customer_order_ibfk_3` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`id`),
  CONSTRAINT `t_customer_order_ibfk_4` FOREIGN KEY (`contract_id`) REFERENCES `t_contract` (`id`),
  CONSTRAINT `t_customer_order_ibfk_5` FOREIGN KEY (`website_id`) REFERENCES `t_cooperation_website` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_customer_service
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_service`;
CREATE TABLE `t_customer_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `house_id` bigint(20) DEFAULT NULL,
  `house_card_title` varchar(50) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `account_type` tinyint(4) NOT NULL,
  `account_time` datetime NOT NULL,
  `total_pay` decimal(18,2) NOT NULL,
  `is_pay` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_check` tinyint(4) NOT NULL,
  `check_remark` varchar(500) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `company_id` (`company_id`),
  KEY `house_id` (`house_id`),
  KEY `subject_id` (`subject_id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `t_customer_service_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_customer_order` (`id`),
  CONSTRAINT `t_customer_service_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_customer_service_ibfk_3` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`id`),
  CONSTRAINT `t_customer_service_ibfk_4` FOREIGN KEY (`subject_id`) REFERENCES `t_service_subject` (`id`),
  CONSTRAINT `t_customer_service_ibfk_5` FOREIGN KEY (`hotel_id`) REFERENCES `t_hotel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer_service
-- ----------------------------

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('4', '1', '2', '7', '14');
INSERT INTO `t_employee` VALUES ('5', '1', '2', '7', '15');
INSERT INTO `t_employee` VALUES ('6', '1', '2', '7', '16');
INSERT INTO `t_employee` VALUES ('7', '1', '2', '7', '17');
INSERT INTO `t_employee` VALUES ('8', '1', '-1', '6', '18');
INSERT INTO `t_employee` VALUES ('9', '1', '-1', '6', '19');

-- ----------------------------
-- Table structure for t_hotel
-- ----------------------------
DROP TABLE IF EXISTS `t_hotel`;
CREATE TABLE `t_hotel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `contract_id` bigint(20) NOT NULL,
  `hotel_manager_id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `contract_id` (`contract_id`),
  KEY `hotel_manager_id` (`hotel_manager_id`),
  CONSTRAINT `t_hotel_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_hotel_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `t_contract` (`id`),
  CONSTRAINT `t_hotel_ibfk_3` FOREIGN KEY (`hotel_manager_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hotel
-- ----------------------------
INSERT INTO `t_hotel` VALUES ('2', '1', '1', '7', '红古轩酒店', '15679760322', '2017-11-21 20:56:03', '0');
INSERT INTO `t_hotel` VALUES ('4', '1', '1', '6', '800', '800-800-800', '2017-11-21 22:18:47', '0');

-- ----------------------------
-- Table structure for t_hotel_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_hotel_employee`;
CREATE TABLE `t_hotel_employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_hotel_employee_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_hotel_employee_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `t_hotel` (`id`),
  CONSTRAINT `t_hotel_employee_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hotel_employee
-- ----------------------------

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_title` varchar(50) NOT NULL,
  `area` double NOT NULL,
  `unit_price` decimal(18,2) NOT NULL,
  `sale_price` decimal(18,2) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `description` text,
  `hotel_id` bigint(20) NOT NULL,
  `shop_manager_id` bigint(20) NOT NULL,
  `shop_agent_id` bigint(20) NOT NULL,
  `house_status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_manager_id` (`shop_manager_id`),
  KEY `shop_agent_id` (`shop_agent_id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `t_house_ibfk_1` FOREIGN KEY (`shop_manager_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_house_ibfk_2` FOREIGN KEY (`shop_agent_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_house_ibfk_3` FOREIGN KEY (`hotel_id`) REFERENCES `t_hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('2', '101', '50', '200.00', '200.00', '1', '大床房', '2', '7', '7', '0', '2017-11-23 22:36:29', '0');
INSERT INTO `t_house` VALUES ('3', '111', '111', '111.00', '111.00', '1', '大床房', '2', '6', '6', '0', '2017-11-26 15:42:15', '0');
INSERT INTO `t_house` VALUES ('4', '112', '111', '111.00', '111.00', '1', '大床房', '2', '6', '6', '0', '2017-11-26 15:42:15', '0');
INSERT INTO `t_house` VALUES ('5', '113', '111', '108.00', '111.00', '1', '大床房', '2', '6', '6', '0', '2017-11-26 16:51:00', '0');
INSERT INTO `t_house` VALUES ('6', '114', '111', '108.00', '111.00', '1', '大床房', '2', '6', '6', '0', '2017-11-26 16:51:00', '0');
INSERT INTO `t_house` VALUES ('7', '106', '111', '111.00', '111.00', '1', '大床房', '2', '6', '6', '0', '2017-11-26 16:52:10', '0');
INSERT INTO `t_house` VALUES ('8', '109', '111', '111.00', '106.00', '1', '大床房', '2', '6', '6', '0', '2017-11-26 16:59:09', '0');
INSERT INTO `t_house` VALUES ('9', '220', '111', '111.00', '106.00', '1', '大床房', '2', '6', '6', '0', '2017-11-26 16:59:09', '0');
INSERT INTO `t_house` VALUES ('10', '201', '111', '111.00', '106.00', '1', '大床房', '4', '6', '6', '0', '2017-11-26 17:05:15', '0');
INSERT INTO `t_house` VALUES ('11', '202', '111', '111.00', '106.00', '1', '大床房', '2', '6', '6', '0', '2017-11-26 17:05:15', '0');
INSERT INTO `t_house` VALUES ('12', '103', '111', '111.00', '111.00', '1', '大床房', '2', '6', '6', '1', '2017-11-26 18:11:06', '0');
INSERT INTO `t_house` VALUES ('13', '102', '111', '111.00', '111.00', '1', '大床房', '2', '6', '6', '0', '2017-11-26 18:11:06', '0');
INSERT INTO `t_house` VALUES ('14', '108', '111', '111.00', '108.00', '1', '大床房', '2', '6', '6', '0', '2017-11-29 23:02:17', '0');
INSERT INTO `t_house` VALUES ('15', '107', '111', '111.00', '108.00', '1', '大床房', '2', '6', '6', '0', '2017-11-29 23:02:17', '0');

-- ----------------------------
-- Table structure for t_house_type
-- ----------------------------
DROP TABLE IF EXISTS `t_house_type`;
CREATE TABLE `t_house_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_house_type_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house_type
-- ----------------------------
INSERT INTO `t_house_type` VALUES ('1', '大床房', '大床房', '2017-11-23 22:04:59', '0', '1');
INSERT INTO `t_house_type` VALUES ('2', '豪华大床房', '豪华大床房', '2017-11-23 22:05:11', '0', '1');

-- ----------------------------
-- Table structure for t_leave
-- ----------------------------
DROP TABLE IF EXISTS `t_leave`;
CREATE TABLE `t_leave` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `hotel_manager_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `total_days` tinyint(4) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `hotel_manager_id` (`hotel_manager_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_leave_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_leave_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `t_hotel` (`id`),
  CONSTRAINT `t_leave_ibfk_3` FOREIGN KEY (`hotel_manager_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_leave_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leave
-- ----------------------------

-- ----------------------------
-- Table structure for t_module
-- ----------------------------
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_module
-- ----------------------------

-- ----------------------------
-- Table structure for t_payment_type
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_type`;
CREATE TABLE `t_payment_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_payment_type
-- ----------------------------
INSERT INTO `t_payment_type` VALUES ('1', '支付宝', '支付宝', '2017-11-15 12:58:29', '0', '1');
INSERT INTO `t_payment_type` VALUES ('2', '微信', '微信', '2017-11-15 12:58:35', '0', '1');
INSERT INTO `t_payment_type` VALUES ('3', '银联', '银联', '2017-11-30 21:52:37', '0', '1');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `permission` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `module_id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_process
-- ----------------------------
DROP TABLE IF EXISTS `t_process`;
CREATE TABLE `t_process` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) NOT NULL,
  `path` varchar(36) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deploy` tinyint(4) NOT NULL,
  `deploy_time` datetime NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_process
-- ----------------------------

-- ----------------------------
-- Table structure for t_rent_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_rent_pay`;
CREATE TABLE `t_rent_pay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `master_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `contract_id` bigint(20) NOT NULL,
  `total_pay` decimal(18,2) NOT NULL,
  `pay_time` datetime NOT NULL,
  `pay_period_start` date NOT NULL,
  `pay_period_end` date NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `master_id` (`master_id`),
  KEY `company_id` (`company_id`),
  KEY `contract_id` (`contract_id`),
  CONSTRAINT `t_rent_pay_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `t_contract_master` (`id`),
  CONSTRAINT `t_rent_pay_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_rent_pay_ibfk_3` FOREIGN KEY (`contract_id`) REFERENCES `t_contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rent_pay
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '总管理员', '总管理员', '2017-11-15 12:39:18', '0');
INSERT INTO `t_role` VALUES ('2', '店长', '店长', '2017-11-15 12:41:53', '0');
INSERT INTO `t_role` VALUES ('3', '录入员', '录入员', '2017-11-15 12:42:01', '0');
INSERT INTO `t_role` VALUES ('5', '审核员', '审核员', '2017-11-27 22:26:53', '0');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `t_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `t_role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_service_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_service_subject`;
CREATE TABLE `t_service_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_service_subject
-- ----------------------------
INSERT INTO `t_service_subject` VALUES ('1', '送客', '送客', '2017-11-30 22:01:08', '0', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `identity` varchar(18) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `wechat` varchar(50) DEFAULT NULL,
  `alipay` varchar(100) DEFAULT NULL,
  `qq_openid` varchar(100) DEFAULT NULL,
  `weibo_openid` varchar(100) DEFAULT NULL,
  `wechat_openid` varchar(100) DEFAULT NULL,
  `headicon` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` bigint(20) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `account_name` (`account_name`),
  UNIQUE KEY `qq_openid` (`qq_openid`),
  UNIQUE KEY `weibo_openid` (`weibo_openid`),
  UNIQUE KEY `wechat_openid` (`wechat_openid`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('6', '275300091@qq.com', '15679760329', '15679760329', '96e79218965eb72c92a549dd5a330112', '15679760329', '360730199712200617', '陈飞龙', '0', '2017-11-26', '21', '江西赣州章贡区', '275300091', 'xljx_888888', null, null, null, null, 'static/img/face.gif', '', '2017-11-15 12:45:01', '1', '0');
INSERT INTO `t_user` VALUES ('7', '275300090@qq.com', '15679760321', null, '96e79218965eb72c92a549dd5a330112', '15679760321', '360730199712200617', '陈飞龙', '0', '2017-11-26', '21', '江西赣州章贡区', '275300091', 'xljx#_888888', null, null, null, null, 'static/img/face.gif', null, '2017-11-21 21:02:57', '1', '0');
INSERT INTO `t_user` VALUES ('14', null, '15679760320', null, '96e79218965eb72c92a549dd5a330112', '15679760320', null, null, null, null, null, null, null, null, null, null, null, null, 'static/img/face.gif', null, '2017-11-29 20:33:53', '1', '0');
INSERT INTO `t_user` VALUES ('15', null, '15679760322', null, '96e79218965eb72c92a549dd5a330112', '15679760322', null, null, null, null, null, null, null, null, null, null, null, null, 'static/img/face.gif', null, '2017-11-29 20:34:46', '1', '0');
INSERT INTO `t_user` VALUES ('16', null, '13237675701', null, '96e79218965eb72c92a549dd5a330112', '13237675701', null, null, null, null, null, null, null, null, null, null, null, null, 'static/img/face.gif', null, '2017-11-29 20:45:58', '1', '0');
INSERT INTO `t_user` VALUES ('17', null, '15679760323', null, '96e79218965eb72c92a549dd5a330112', '15679760323', null, null, null, null, null, null, null, null, null, null, null, null, 'static/img/face.gif', null, '2017-11-29 20:48:38', '1', '0');
INSERT INTO `t_user` VALUES ('18', null, '17607976701', null, '96e79218965eb72c92a549dd5a330112', '17607976701', null, null, null, null, null, null, null, null, null, null, null, null, 'static/img/face.gif', null, '2017-11-30 21:26:45', '1', '0');
INSERT INTO `t_user` VALUES ('19', null, '17607975700', null, '96e79218965eb72c92a549dd5a330112', '17607975700', null, null, null, null, null, null, null, null, null, null, null, null, 'static/img/face.gif', null, '2017-11-30 21:27:47', '1', '0');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `t_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '6', '1', '2017-11-15 12:45:01', '0');
INSERT INTO `t_user_role` VALUES ('2', '7', '2', '2017-11-21 21:02:57', '0');
INSERT INTO `t_user_role` VALUES ('6', '14', '5', '2017-11-29 20:33:53', '0');
INSERT INTO `t_user_role` VALUES ('7', '15', '5', '2017-11-29 20:34:46', '0');
INSERT INTO `t_user_role` VALUES ('8', '16', '3', '2017-11-29 20:45:58', '0');
INSERT INTO `t_user_role` VALUES ('9', '17', '3', '2017-11-29 20:48:38', '0');
INSERT INTO `t_user_role` VALUES ('10', '18', '5', '2017-11-30 21:26:45', '0');
INSERT INTO `t_user_role` VALUES ('11', '19', '3', '2017-11-30 21:27:47', '0');
