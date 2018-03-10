/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : hotelmanager

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-03-10 19:27:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for house_fact_pay
-- ----------------------------
DROP TABLE IF EXISTS `house_fact_pay`;
CREATE TABLE `house_fact_pay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '房租缴纳费用',
  `house_rent_id` bigint(20) NOT NULL COMMENT '房租id',
  `pay_money` double NOT NULL COMMENT '支付金额',
  `create_time` datetime NOT NULL COMMENT '支付时间',
  `status` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house_fact_pay
-- ----------------------------

-- ----------------------------
-- Table structure for t_businessman
-- ----------------------------
DROP TABLE IF EXISTS `t_businessman`;
CREATE TABLE `t_businessman` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `tel` varchar(20) DEFAULT NULL COMMENT '酒店联系方式',
  `nickname` varchar(20) DEFAULT NULL COMMENT '微信名称',
  `hotel_sin_name` varchar(6) DEFAULT NULL COMMENT '酒店简称',
  `hotel_name` varchar(255) DEFAULT NULL COMMENT '酒店全称',
  `wxopenid` varchar(50) DEFAULT NULL COMMENT '微信的openid',
  `remark` varchar(2000) DEFAULT NULL COMMENT '酒店的签名',
  `is_active` tinyint(4) DEFAULT NULL COMMENT '酒店状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '酒店创建时间',
  `type` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_businessman
-- ----------------------------
INSERT INTO `t_businessman` VALUES ('1', '张三', '15678762302', '0797-545421', null, '瑞蓝公寓', '青岛瑞蓝度假公寓', '111111', '风景独美，价格实惠', '0', '2018-03-10 15:29:03', '0');
INSERT INTO `t_businessman` VALUES ('2', '李四', '15679760325', '0797-545512', null, '红古轩', '红古轩酒店', null, '红古轩酒店', '0', '2018-03-10 18:56:33', '0');

-- ----------------------------
-- Table structure for t_cash_accounts
-- ----------------------------
DROP TABLE IF EXISTS `t_cash_accounts`;
CREATE TABLE `t_cash_accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `account_type` tinyint(4) NOT NULL,
  `account_time` datetime NOT NULL,
  `account_time_end` datetime DEFAULT NULL,
  `total_pay` decimal(18,2) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `is_cash` tinyint(4) DEFAULT NULL,
  `cash_status` tinyint(4) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `hander` bigint(20) DEFAULT NULL,
  `day_pay` double(255,0) DEFAULT NULL,
  `pay_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `subject_id` (`subject_id`) USING BTREE,
  KEY `hotel_id` (`hotel_id`) USING BTREE,
  CONSTRAINT `t_cash_accounts_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_cash_accounts_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `t_cash_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cash_accounts
-- ----------------------------
INSERT INTO `t_cash_accounts` VALUES ('1', '1', '2', '0', '2017-12-03 22:56:17', '2018-02-01 18:47:34', '500.00', '1', '采购牙刷', '采购牙刷', '2017-12-03 22:56:56', '0', '1', '1', '审核通过', '7', '30', '1');
INSERT INTO `t_cash_accounts` VALUES ('2', '1', '2', '0', '2017-12-05 09:25:09', '2018-02-01 18:47:34', '900.00', '1', '牙刷进货', '暂无批注', '2017-12-05 21:27:48', '1', '0', '2', '不通过', '6', '30', '2');
INSERT INTO `t_cash_accounts` VALUES ('3', '1', '-1', '1', '2017-12-05 00:00:00', '2018-02-01 23:59:59', '800.00', '2', '被套支出', '账单无误', '2017-12-05 21:33:25', '0', '1', '1', '审核通过', '7', '14', '3');
INSERT INTO `t_cash_accounts` VALUES ('4', '1', '-1', '1', '2018-01-04 18:40:57', '2018-02-01 18:47:34', '3000.00', '4', '房租缴纳', '暂无批注', '2018-01-04 18:44:21', '1', '0', '0', '未审核', null, '30', '4');
INSERT INTO `t_cash_accounts` VALUES ('6', '1', '4', '1', '2018-01-01 00:00:00', '2018-01-31 23:59:59', '3000.00', '1', '牙刷支出总费用', '暂无批注', '2018-01-04 18:59:54', '0', '0', '0', '未审核', null, '100', '2');
INSERT INTO `t_cash_accounts` VALUES ('7', '1', '4', '1', '2018-01-01 00:00:00', '2018-01-31 23:59:59', '3000.00', '2', '被套支出', '很好喔', '2018-01-04 19:02:36', '0', '1', '1', '', '6', '100', '3');
INSERT INTO `t_cash_accounts` VALUES ('8', '1', '-1', '0', '2018-01-17 00:00:00', '2018-02-15 23:59:59', '8000.00', '1', '收入', '暂无批注', '2018-01-29 17:11:19', '0', '1', '0', '未审核', null, '276', '1');
INSERT INTO `t_cash_accounts` VALUES ('9', '1', '-1', '0', '2018-01-16 00:00:00', '2018-02-21 23:59:59', '90.00', '2', '收入', '暂无批注', '2018-01-29 17:29:40', '0', '1', '0', '未审核', null, '2', '1');
INSERT INTO `t_cash_accounts` VALUES ('10', '1', '-1', '0', '2018-01-01 00:00:00', '2018-01-31 23:59:59', '90.00', '2', '收入', '收入无误', '2018-01-29 17:43:21', '0', '0', '2', '不通过', '6', '3', '1');
INSERT INTO `t_cash_accounts` VALUES ('11', '1', '2', '0', '2018-01-17 00:00:00', '2018-01-31 23:59:59', '800.00', '2', '收入', '审核通过神核通过审核通过神核通过审核通过神核通过审核通过神核通过审核通过神核通过审核通过神核通过审核通过神核通过', '2018-01-29 23:04:26', '0', '1', '0', '未审核', null, '57', '1');
INSERT INTO `t_cash_accounts` VALUES ('12', '1', '4', '0', '2018-01-01 00:00:00', '2018-01-31 23:59:59', '820.00', '4', '房租收入', '暂无审核暂无审核暂无审核暂无审核暂无审核暂无审核暂无审核暂无审核', '2018-01-29 23:33:20', '0', '1', '1', '审核通过', '6', '27', '4');

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
  UNIQUE KEY `title` (`title`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE,
  CONSTRAINT `t_cash_subject_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cash_subject
-- ----------------------------
INSERT INTO `t_cash_subject` VALUES ('1', '牙刷', '牙刷', '2017-11-30 22:10:13', '1', '0');
INSERT INTO `t_cash_subject` VALUES ('2', '被套', '被套', '2017-11-30 22:16:34', '1', '0');
INSERT INTO `t_cash_subject` VALUES ('3', '押金', '押金', '2017-12-10 21:30:10', '1', '0');
INSERT INTO `t_cash_subject` VALUES ('4', '房费缴纳', '房费缴纳', '2017-12-10 21:30:23', '1', '0');

-- ----------------------------
-- Table structure for t_char
-- ----------------------------
DROP TABLE IF EXISTS `t_char`;
CREATE TABLE `t_char` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessman_id` bigint(20) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_char
-- ----------------------------
INSERT INTO `t_char` VALUES ('1', '1', '今天房价正常,高价', '0', '2018-03-10 19:18:36');

-- ----------------------------
-- Table structure for t_code
-- ----------------------------
DROP TABLE IF EXISTS `t_code`;
CREATE TABLE `t_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL,
  `code` int(11) NOT NULL,
  `msg` varchar(100) NOT NULL,
  `end_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_code
-- ----------------------------

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `represent` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1', '青岛瑞蓝铂悦酒店管理有限公司', '陈闯', '15679760329', '0532-85696999', '山东省青岛市市北区新疆路8号中联自由港湾A座 2829', '瑞蓝瑞蓝瑞蓝瑞蓝瑞蓝瑞蓝瑞蓝', '2017-11-14 20:41:17', '0');
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
  KEY `master_id` (`master_id`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE,
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
  `phone` varchar(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `identity` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_contract_master
-- ----------------------------
INSERT INTO `t_contract_master` VALUES ('1', '中国银行', '皓月', '1111111111', '2017-11-16 22:50:16', '0', '1', '15679760322', '96e79218965eb72c92a549dd5a330112', '1111111111');
INSERT INTO `t_contract_master` VALUES ('3', '中国建设银行', '心空', '222222', '2017-11-16 23:18:56', '0', '2', '1567960322', '96e79218965eb72c92a549dd5a330112', null);
INSERT INTO `t_contract_master` VALUES ('4', '农村信用社', '信用', '33333', '2017-11-18 22:50:40', '0', '1', '15679760322', '96e79218965eb72c92a549dd5a330112', '11111111');
INSERT INTO `t_contract_master` VALUES ('5', '中国银行', '李四', '1111111111111', '2018-01-03 21:19:50', '0', '1', '15679760320', 'e10adc3949ba59abbe56e057f20f883e', '222222');

-- ----------------------------
-- Table structure for t_cooperation_accounts
-- ----------------------------
DROP TABLE IF EXISTS `t_cooperation_accounts`;
CREATE TABLE `t_cooperation_accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `account_type` tinyint(4) NOT NULL,
  `account_time` datetime NOT NULL,
  `total_pay` decimal(18,2) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `cooperation_company_id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `is_cash` tinyint(4) DEFAULT NULL,
  `cash_status` tinyint(4) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `hander` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `subject_id` (`subject_id`) USING BTREE,
  KEY `hotel_id` (`hotel_id`) USING BTREE,
  CONSTRAINT `t_cooperation_accounts_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_cooperation_accounts_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `t_cooperation_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cooperation_accounts
-- ----------------------------
INSERT INTO `t_cooperation_accounts` VALUES ('1', '1', '4', '0', '2017-12-06 22:08:41', '700.00', '1', '借牙刷总费用收入情况', '无批注', '1', '2017-12-06 22:09:23', '0', '0', '2', '审核不通过', '7');
INSERT INTO `t_cooperation_accounts` VALUES ('2', '1', '4', '1', '2017-12-06 06:05:02', '500.00', '1', '茅台进货总费用', '账目有异议', '1', '2017-12-06 23:05:32', '0', '1', '1', '通过', '7');
INSERT INTO `t_cooperation_accounts` VALUES ('3', '1', '-1', '0', '2018-01-30 08:30:00', '1000.00', '1', '收入总费用', '通过', '6', '2018-01-30 12:54:17', '0', '0', '0', '未审核', null);
INSERT INTO `t_cooperation_accounts` VALUES ('4', '1', '-1', '1', '2018-01-30 08:30:00', '1000.00', '1', '费用总收入', '账目无误', '7', '2018-01-30 13:00:30', '0', '0', '0', '未审核', null);

-- ----------------------------
-- Table structure for t_cooperation_company
-- ----------------------------
DROP TABLE IF EXISTS `t_cooperation_company`;
CREATE TABLE `t_cooperation_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(150) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `hotel_id` (`hotel_id`) USING BTREE,
  CONSTRAINT `t_cooperation_company_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cooperation_company
-- ----------------------------
INSERT INTO `t_cooperation_company` VALUES ('1', '1', '2', '茅台', '茅台', '茅台酒家', '13237675702', '13237675702', '茅台酒香', '2017-12-06 21:28:15', '0');
INSERT INTO `t_cooperation_company` VALUES ('2', '1', '2', '章贡王', '江西赣州章贡区', '章贡王', '13609090909', '13609090909', '章贡王', '2017-12-06 22:04:05', '0');
INSERT INTO `t_cooperation_company` VALUES ('5', '1', '-1', '茅台酒家', '茅台酒家', '茅台酒家', '511-200-555', '15679589216', '茅台酒家', '2018-01-18 13:39:58', '0');
INSERT INTO `t_cooperation_company` VALUES ('6', '1', '-1', '餐具商家', '餐具商家', '餐具商家', '400-200-200', '15679235626', '餐具商家', '2018-01-18 13:54:58', '0');
INSERT INTO `t_cooperation_company` VALUES ('7', '1', '-1', '众联', '众联', '众联', '200-500-600', '18966666666', '众联', '2018-01-19 17:25:14', '0');
INSERT INTO `t_cooperation_company` VALUES ('8', '1', '2', '布草商家', '江西赣州', '布草商家', '455-5545', '15679712351', '布草商家', '2018-01-20 18:28:21', '0');
INSERT INTO `t_cooperation_company` VALUES ('9', '1', '2', '布草商家1', '江西赣州', '布草商家1', '455-5545', '15679712351', '布草商家1', '2018-01-20 18:29:14', '0');
INSERT INTO `t_cooperation_company` VALUES ('10', '1', '-1', '轻松', '轻松轻松轻松', '轻松', '5656-656', '19679762058', '轻松轻松轻松轻松', '2018-01-20 18:37:51', '0');
INSERT INTO `t_cooperation_company` VALUES ('11', '1', '-1', '阿萨德1', '江西赣州', '阿萨德1', '500-200-00', '18370940766', '阿萨德', '2018-01-20 18:44:46', '0');
INSERT INTO `t_cooperation_company` VALUES ('12', '1', '4', '三大范式', '江西赣州', '三大范式', '500-100', '15679705110', '江西赣州', '2018-01-20 18:46:04', '0');
INSERT INTO `t_cooperation_company` VALUES ('13', '1', '-1', '人', '赣州', '15679763333', '15679763333', '15679763333', '', '2018-02-10 14:36:07', '0');

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
  UNIQUE KEY `title` (`title`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE,
  CONSTRAINT `t_cooperation_subject_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cooperation_subject
-- ----------------------------
INSERT INTO `t_cooperation_subject` VALUES ('1', '被单', '被单', '2017-11-30 22:13:11', '1', '0');
INSERT INTO `t_cooperation_subject` VALUES ('2', '送客', '送客', '2017-12-10 21:30:49', '1', '0');

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
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cooperation_website
-- ----------------------------
INSERT INTO `t_cooperation_website` VALUES ('1', '携程网', '携程网', '2017-11-15 12:40:19', '0', '1');
INSERT INTO `t_cooperation_website` VALUES ('2', '途牛', '途牛', '2017-11-30 21:43:48', '0', '1');
INSERT INTO `t_cooperation_website` VALUES ('3', '线下入住', '线下入住', '2017-12-10 21:25:13', '0', '1');
INSERT INTO `t_cooperation_website` VALUES ('4', '去哪旅行', '去哪旅行', '2017-12-10 21:27:43', '0', '1');
INSERT INTO `t_cooperation_website` VALUES ('5', '58同城', '', '2018-01-19 13:44:19', '0', '1');

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
  `contract_id` bigint(20) DEFAULT NULL,
  `customer_name` varchar(200) NOT NULL,
  `customer_identity` varchar(200) NOT NULL,
  `customer_phone` varchar(11) NOT NULL,
  `customer_gender` varchar(20) DEFAULT NULL,
  `customer_from` tinyint(4) DEFAULT NULL,
  `website_id` bigint(20) DEFAULT NULL,
  `unit_price` decimal(18,2) DEFAULT NULL,
  `total_days` tinyint(4) NOT NULL,
  `house_pay` decimal(18,2) NOT NULL,
  `service_pay` decimal(18,2) DEFAULT '0.00',
  `deposit` decimal(18,2) DEFAULT NULL,
  `total_pay` decimal(18,2) DEFAULT NULL,
  `actual_return` decimal(18,2) DEFAULT NULL,
  `payment_type_id` bigint(20) NOT NULL,
  `checkin_time` datetime NOT NULL,
  `checkout_time` datetime NOT NULL,
  `checkout_max_time` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `order_status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_check` tinyint(4) NOT NULL,
  `check_remark` varchar(500) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL,
  `hander` bigint(20) DEFAULT NULL,
  `is_cash` tinyint(4) DEFAULT '0',
  `other_hotel` bigint(20) DEFAULT NULL,
  `other_hotel_money` decimal(10,0) DEFAULT NULL,
  `other_hotel_money_type` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `shop_manager_id` (`shop_manager_id`) USING BTREE,
  KEY `house_id` (`house_id`) USING BTREE,
  KEY `contract_id` (`contract_id`) USING BTREE,
  KEY `website_id` (`website_id`) USING BTREE,
  CONSTRAINT `t_customer_order_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_customer_order_ibfk_2` FOREIGN KEY (`shop_manager_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_customer_order_ibfk_3` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`id`),
  CONSTRAINT `t_customer_order_ibfk_4` FOREIGN KEY (`contract_id`) REFERENCES `t_contract` (`id`),
  CONSTRAINT `t_customer_order_ibfk_5` FOREIGN KEY (`website_id`) REFERENCES `t_cooperation_website` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer_order
-- ----------------------------
INSERT INTO `t_customer_order` VALUES ('1', '1', '2', '7', '2', '1', '张三', '36730199712200611', '15679760320', '男', '2', '1', '200.00', '2', '400.00', '0.00', '100.00', '500.00', '100.00', '1', '2017-12-07 21:36:21', '2017-12-09 21:36:23', '2017-12-09 21:36:24', '客户入住', '0', '2017-12-09 21:37:23', '0', '无误', '0', null, '0', null, null, null, '0', '0');
INSERT INTO `t_customer_order` VALUES ('6', '1', '2', '7', '8', '1', '214', '1421', '14214', null, null, '1', null, '4', '800.00', null, null, '500.00', null, '1', '2017-12-15 21:50:57', '2017-12-19 21:50:57', null, '', '0', '2017-12-15 21:54:13', '0', null, '0', null, '0', null, null, null, '0', '0');
INSERT INTO `t_customer_order` VALUES ('7', '1', '2', '7', '11', '1', '23424', '4242', '234242', null, null, '1', null, '4', '500.00', null, null, '500.00', null, '-1', '2017-12-15 21:55:10', '2017-12-19 21:55:10', null, '入住', '0', '2017-12-15 21:59:40', '0', null, '0', null, '0', null, null, null, '0', '0');
INSERT INTO `t_customer_order` VALUES ('9', '1', '2', '7', '15', '1', '23424', '4242', '234242', null, null, '1', null, '4', '500.00', null, null, '500.00', null, '-1', '2017-12-15 21:55:10', '2017-12-19 21:55:10', null, '入住', '0', '2017-12-15 21:59:40', '0', null, '0', null, '0', null, null, null, '0', '0');
INSERT INTO `t_customer_order` VALUES ('11', '1', '2', '7', '3', '1', '343434', '434343', '34343', null, null, '4', null, '4', '1000.00', null, null, null, null, '-1', '2017-12-17 10:20:27', '2017-12-21 10:20:27', null, '43525', '0', '2017-12-17 10:24:54', '0', null, '0', null, '0', null, null, null, '1', '0');
INSERT INTO `t_customer_order` VALUES ('13', '1', '2', '7', '7', '1', '345345', '3535353', '345345', null, null, '1', null, '3', '800.00', null, null, null, null, '-1', '2017-12-17 12:50:12', '2017-12-20 12:50:12', null, '订单入住', '0', '2017-12-17 12:50:45', '0', null, '0', null, '0', null, null, null, '0', '0');
INSERT INTO `t_customer_order` VALUES ('16', '1', '2', '7', '4', '1', '4141', '12431241', '1414', null, null, '1', null, '2', '600.00', null, null, null, null, '-1', '2017-12-19 22:30:21', '2017-12-21 22:30:21', null, 'aefdsf', '0', '2017-12-19 22:30:49', '1', null, '0', null, '0', null, null, null, '0', '0');
INSERT INTO `t_customer_order` VALUES ('17', '1', '2', '7', '9', '1', '2324', '3535', '243', null, null, '1', null, '4', '1000.00', null, null, null, null, '-1', '2017-12-22 20:30:38', '2017-12-26 20:30:38', null, '12345678', '0', '2017-12-22 20:33:27', '0', null, '0', null, '0', null, null, null, '0', '0');
INSERT INTO `t_customer_order` VALUES ('18', '1', '2', '7', '2', '1', '商家送客', '1111111', '15679760321', null, null, '1', null, '4', '1200.00', null, null, null, null, '1', '2017-12-22 20:30:25', '2017-12-26 20:30:25', null, '商家送客', '0', '2017-12-22 20:37:41', '0', null, '0', null, '0', '4', null, null, '0', '1');
INSERT INTO `t_customer_order` VALUES ('19', '1', '2', '7', '4', '1', '商家送客来了', '131313', '1321313', null, null, '1', null, '5', '14000.00', null, null, null, null, '3', '2017-12-22 20:55:09', '2017-12-27 20:55:09', null, '商家送客来了', '0', '2017-12-22 20:58:59', '0', null, '0', null, '1', null, null, null, '0', '1');
INSERT INTO `t_customer_order` VALUES ('20', '1', '2', '7', '6', '1', '订单', '414131', '13131', null, null, '1', null, '5', '2000.00', null, null, null, null, '4', '2017-12-22 21:00:15', '2017-12-27 21:00:15', null, '', '0', '2017-12-22 21:04:12', '0', null, '0', null, '1', '4', '0', '-1', '0', '1');

-- ----------------------------
-- Table structure for t_customer_order_ota
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_order_ota`;
CREATE TABLE `t_customer_order_ota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `order_no` varchar(200) DEFAULT NULL,
  `hotel_name` varchar(100) DEFAULT NULL,
  `house_name` varchar(100) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `website_name` varchar(20) DEFAULT NULL,
  `website_id` bigint(20) DEFAULT NULL,
  `unit_price` decimal(18,2) DEFAULT NULL,
  `total_days` tinyint(4) NOT NULL,
  `total_pay` decimal(18,2) NOT NULL,
  `ota_commission` decimal(18,2) DEFAULT NULL,
  `actual_money` decimal(18,2) DEFAULT NULL,
  `checkin_time` datetime DEFAULT NULL,
  `checkout_time` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer_order_ota
-- ----------------------------
INSERT INTO `t_customer_order_ota` VALUES ('1', '1', '20180101', '酒店1', '房间1', '2018-01-01 00:00:00', '小明', '携程网', null, null, '1', '200.00', '0.00', '200.00', '2018-01-02 00:00:00', '2018-01-03 00:00:00', null, '2018-01-09 11:45:52', '0');
INSERT INTO `t_customer_order_ota` VALUES ('2', '1', '20180101', '酒店2', '房间2', '2018-01-01 00:00:00', '小华', '去哪儿网', null, null, '2', '400.00', '0.00', '400.00', '2018-01-03 00:00:00', '2018-01-05 00:00:00', null, '2018-01-09 11:45:52', '0');
INSERT INTO `t_customer_order_ota` VALUES ('3', '1', '20180101', '酒店1', '房间1', '2018-01-01 00:00:00', '小明', '携程网', null, null, '1', '200.00', '0.00', '200.00', '2018-01-02 00:00:00', '2018-01-03 00:00:00', null, '2018-01-09 12:51:01', '0');
INSERT INTO `t_customer_order_ota` VALUES ('4', '1', null, null, null, null, null, null, null, null, '0', '0.00', '0.00', '0.00', null, null, null, '2018-01-09 12:51:01', '0');
INSERT INTO `t_customer_order_ota` VALUES ('5', '1', '20180101', '酒店2', '房间2', '2018-01-01 00:00:00', '小华', '去哪儿网', null, null, '2', '400.00', '0.00', '400.00', '2018-01-03 00:00:00', '2018-01-05 00:00:00', null, '2018-01-09 12:51:01', '0');

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
  UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `house_id` (`house_id`) USING BTREE,
  KEY `subject_id` (`subject_id`) USING BTREE,
  KEY `hotel_id` (`hotel_id`) USING BTREE,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('17', '1', '2', '7', '27');
INSERT INTO `t_employee` VALUES ('18', '1', '2', '7', '28');
INSERT INTO `t_employee` VALUES ('19', '1', '-1', '6', '29');
INSERT INTO `t_employee` VALUES ('20', '1', '-1', '6', '30');

-- ----------------------------
-- Table structure for t_hotel
-- ----------------------------
DROP TABLE IF EXISTS `t_hotel`;
CREATE TABLE `t_hotel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_manager_id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `provice` varchar(20) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `town` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_hotel_title_uindex` (`title`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `hotel_manager_id` (`hotel_manager_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hotel
-- ----------------------------
INSERT INTO `t_hotel` VALUES ('2', '1', '7', '红古轩酒店', '15679760322', '2017-11-21 20:56:03', '0', '河北省', '石家庄市', '长安区', '河北省唐山市路北区');
INSERT INTO `t_hotel` VALUES ('4', '1', '7', '800', '800-800-800', '2017-11-21 22:18:47', '0', null, null, null, null);

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
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `hotel_id` (`hotel_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `t_hotel_employee_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_hotel_employee_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `t_hotel` (`id`),
  CONSTRAINT `t_hotel_employee_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hotel_employee
-- ----------------------------

-- ----------------------------
-- Table structure for t_hotel_type
-- ----------------------------
DROP TABLE IF EXISTS `t_hotel_type`;
CREATE TABLE `t_hotel_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hotel_type
-- ----------------------------
INSERT INTO `t_hotel_type` VALUES ('1', '大床房', '大床房', '0', '2018-03-10 15:24:45');
INSERT INTO `t_hotel_type` VALUES ('2', '总统套房', '总统套房', '0', '2018-03-10 18:07:04');

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_title` varchar(50) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `description` text,
  `hotel_id` bigint(20) NOT NULL,
  `house_status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `leave_time` datetime DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `house_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('2', '101', '3', '大床房', '2', '1', '2017-11-23 22:36:29', '0', '2017-12-26 20:30:25', '1', '0');
INSERT INTO `t_house` VALUES ('3', '111', '3', '大床房', '2', '1', '2017-11-26 15:42:15', '0', '2017-12-21 22:30:21', '1', '0');
INSERT INTO `t_house` VALUES ('4', '112', '3', '大床房', '2', '1', '2017-11-26 15:42:15', '0', '2017-12-27 20:55:09', '1', '0');
INSERT INTO `t_house` VALUES ('5', '113', '3', '大床房', '2', '1', '2017-11-26 16:51:00', '0', '2017-12-21 22:30:21', '1', '0');
INSERT INTO `t_house` VALUES ('6', '114', '3', '大床房', '2', '1', '2017-11-26 16:51:00', '0', '2017-12-27 21:00:15', '1', '0');
INSERT INTO `t_house` VALUES ('7', '106', '3', '大床房', '2', '0', '2017-11-26 16:52:10', '0', '2017-12-20 12:50:12', '1', '0');
INSERT INTO `t_house` VALUES ('8', '109', '3', '大床房', '2', '0', '2017-11-26 16:59:09', '0', '2017-12-19 21:50:57', '1', '0');
INSERT INTO `t_house` VALUES ('9', '220', '3', '大床房', '2', '0', '2017-11-26 16:59:09', '0', '2017-12-26 20:30:38', '1', '0');
INSERT INTO `t_house` VALUES ('10', '201', '3', '大床房', '4', '0', '2017-11-26 17:05:15', '0', '2017-12-21 22:30:21', '1', '0');
INSERT INTO `t_house` VALUES ('11', '202', '3', '大床房', '2', '0', '2017-11-26 17:05:15', '0', '2017-12-22 20:34:13', '1', '0');
INSERT INTO `t_house` VALUES ('12', '103', '3', '大床房', '2', '1', '2017-11-26 18:11:06', '0', '2017-12-21 22:30:21', '1', '0');
INSERT INTO `t_house` VALUES ('13', '102', '3', '大床房', '2', '0', '2017-11-26 18:11:06', '0', '2017-12-21 22:30:21', '1', '0');
INSERT INTO `t_house` VALUES ('14', '108', '3', '大床房', '2', '0', '2017-11-29 23:02:17', '0', '2017-12-21 22:30:21', '1', '0');
INSERT INTO `t_house` VALUES ('15', '107', '3', '大床房', '2', '0', '2017-11-29 23:02:17', '0', '2017-12-19 21:55:10', '1', '0');
INSERT INTO `t_house` VALUES ('16', '101', '4', '天鼎酒店', '5', '0', '2018-01-14 21:07:23', '0', null, '1', '0');
INSERT INTO `t_house` VALUES ('17', '102', '4', '天鼎酒店', '5', '0', '2018-01-14 21:07:23', '0', null, '1', '0');
INSERT INTO `t_house` VALUES ('18', '103', '4', '天鼎酒店', '5', '0', '2018-01-14 21:07:24', '0', null, '1', '0');
INSERT INTO `t_house` VALUES ('19', '104', '4', '天鼎酒店', '5', '0', '2018-01-14 21:07:25', '0', null, '1', '0');
INSERT INTO `t_house` VALUES ('20', '202', '4', '202', '4', '0', '2018-01-14 21:45:00', '0', null, '1', '0');
INSERT INTO `t_house` VALUES ('21', '610', '9', '暗示法发顺丰', '8', '0', '2018-01-15 13:01:12', '0', null, '1', '0');
INSERT INTO `t_house` VALUES ('22', '815', '13', '而玩儿玩儿玩儿', '8', '0', '2018-01-15 13:02:23', '0', null, '1', '0');
INSERT INTO `t_house` VALUES ('23', '930', '13', '而玩儿玩儿玩儿', '8', '0', '2018-01-15 13:02:23', '0', null, '1', '0');
INSERT INTO `t_house` VALUES ('24', '1018', '13', '而玩儿玩儿玩儿', '8', '0', '2018-01-15 13:02:23', '0', null, '1', '0');
INSERT INTO `t_house` VALUES ('25', '1008', '13', '而玩儿玩儿玩儿', '8', '0', '2018-01-15 13:02:23', '0', null, '1', '0');
INSERT INTO `t_house` VALUES ('26', '610', '14', '1123123123', '2', '0', '2018-01-15 14:45:54', '1', null, '1', '0');
INSERT INTO `t_house` VALUES ('27', '815', '14', '1123123123', '2', '0', '2018-01-15 14:45:54', '1', null, '1', '0');

-- ----------------------------
-- Table structure for t_house_fact_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_house_fact_pay`;
CREATE TABLE `t_house_fact_pay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '房租缴纳费用',
  `house_rent_id` bigint(20) NOT NULL COMMENT '房租id',
  `pay_money` double NOT NULL COMMENT '支付金额',
  `create_time` datetime NOT NULL COMMENT '支付时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house_fact_pay
-- ----------------------------

-- ----------------------------
-- Table structure for t_house_fact_pay_copy
-- ----------------------------
DROP TABLE IF EXISTS `t_house_fact_pay_copy`;
CREATE TABLE `t_house_fact_pay_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '房租缴纳费用',
  `house_rent_id` bigint(20) NOT NULL COMMENT '房租id',
  `pay_money` double NOT NULL COMMENT '支付金额',
  `create_time` datetime NOT NULL COMMENT '支付时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house_fact_pay_copy
-- ----------------------------
INSERT INTO `t_house_fact_pay_copy` VALUES ('1', '24', '500', '2018-01-03 20:13:13', '0', '1');
INSERT INTO `t_house_fact_pay_copy` VALUES ('2', '24', '500', '2018-01-03 20:14:59', '0', '1');
INSERT INTO `t_house_fact_pay_copy` VALUES ('3', '24', '500', '2018-01-03 20:15:37', '0', '1');
INSERT INTO `t_house_fact_pay_copy` VALUES ('4', '24', '500', '2018-01-03 20:16:58', '0', '1');

-- ----------------------------
-- Table structure for t_house_others_item
-- ----------------------------
DROP TABLE IF EXISTS `t_house_others_item`;
CREATE TABLE `t_house_others_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `house_id` bigint(20) DEFAULT NULL,
  `item_name` varchar(20) DEFAULT NULL,
  `pay_money` decimal(10,0) DEFAULT NULL,
  `pay_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_cash` tinyint(4) DEFAULT NULL,
  `hander` bigint(20) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house_others_item
-- ----------------------------
INSERT INTO `t_house_others_item` VALUES ('1', '1', '2', '2', '5', '100', '2017-12-17 15:08:03', '0', null, '已结算', '2017-12-24 18:48:17');
INSERT INTO `t_house_others_item` VALUES ('2', '1', '2', '2', '5', '100', '2017-12-17 15:08:06', '0', null, '已结算', '2017-12-24 18:48:17');
INSERT INTO `t_house_others_item` VALUES ('3', '1', '2', '2', '5', '100', '2017-12-17 15:08:06', '0', null, '已结算', '2017-12-24 18:48:17');
INSERT INTO `t_house_others_item` VALUES ('4', '1', '2', '2', '5', '211', '2017-12-17 15:08:07', '0', null, '1231', '2017-12-24 18:48:17');
INSERT INTO `t_house_others_item` VALUES ('5', '1', '2', '6', '5', '100', '2017-12-24 20:23:46', '0', null, '123456', '2017-12-24 20:23:46');
INSERT INTO `t_house_others_item` VALUES ('6', '1', '2', '6', '4', '300', '2017-12-24 20:35:56', '1', null, '旅游包车', '2017-12-24 20:35:56');

-- ----------------------------
-- Table structure for t_house_rent_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_house_rent_pay`;
CREATE TABLE `t_house_rent_pay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `master_id` bigint(20) DEFAULT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `baodi_pay` decimal(18,2) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `pay_type` int(11) NOT NULL,
  `pay_period_start` date NOT NULL,
  `pay_period_end` date NOT NULL,
  `is_cash` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `house_id` varchar(30) NOT NULL,
  `first_pay` double DEFAULT NULL,
  `first_pay_time` date DEFAULT NULL,
  `sum_pay` double(255,0) DEFAULT NULL,
  `area` double(255,0) DEFAULT NULL,
  `house_count` int(255) DEFAULT NULL,
  `shuidian` int(255) DEFAULT NULL,
  `kongtiao` int(255) DEFAULT NULL,
  `gongnuan` int(255) DEFAULT NULL,
  `wuye` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`,`pay_time`),
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `hotel_id` (`hotel_id`) USING BTREE,
  CONSTRAINT `t_house_rent_pay_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_house_rent_pay_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `t_hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house_rent_pay
-- ----------------------------
INSERT INTO `t_house_rent_pay` VALUES ('1', '1', '2', '1', '60000.00', '1', '3', '2017-12-24', '2020-12-24', '0', '3年房租', '2017-12-24 21:29:11', '0', '2', '833.33', '2017-12-24', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('2', '1', '2', '1', '60000.00', '1', '3', '2017-12-24', '2020-12-24', '0', '3年房租', '2017-12-24 21:29:11', '0', '2', '1666.66', '2018-12-24', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('3', '1', '2', '1', '60000.00', '1', '3', '2017-12-24', '2020-12-24', '0', '3年房租', '2017-12-24 21:29:11', '0', '2', '2500', '2019-12-24', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('4', '1', '2', '1', '60000.00', '1', '3', '2017-12-24', '2020-12-24', '0', '3年房租', '2017-12-24 21:29:11', '0', '2', '833.33', '2017-12-24', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('5', '1', '2', '1', '60000.00', '1', '3', '2017-12-24', '2020-12-24', '0', '3年房租', '2017-12-24 21:29:11', '0', '2', '1666.66', '2018-12-24', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('6', '1', '2', '1', '60000.00', '1', '3', '2017-12-24', '2020-12-24', '0', '3年房租', '2017-12-24 21:29:11', '0', '2', '2500', '2019-12-24', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('7', '1', '4', '1', '60000.00', '1', '3', '2017-12-24', '2020-12-24', '0', '3年房租', '2017-12-24 21:29:11', '0', '2', '833.33', '2017-12-24', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('8', '1', '4', '1', '60000.00', '1', '3', '2017-12-24', '2020-12-24', '0', '3年房租', '2017-12-24 21:29:11', '0', '2', '1666.66', '2018-12-24', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('9', '1', '4', '1', '60000.00', '1', '3', '2017-12-24', '2020-12-24', '0', '3年房租', '2017-12-24 21:29:11', '0', '2', '2500', '2019-12-24', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('10', '1', '4', '1', '60000.00', '1', '3', '2017-12-24', '2020-12-24', '0', '3年房租', '2017-12-24 21:29:11', '0', '2', '833.33', '2017-12-24', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('11', '1', '4', '1', '60000.00', '1', '3', '2017-12-24', '2020-12-24', '0', '3年房租', '2017-12-24 21:29:11', '0', '2', '1666.66', '2018-12-24', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('12', '1', '4', '1', '60000.00', '1', '3', '2017-12-24', '2020-12-24', '0', '3年房租', '2017-12-24 21:29:11', '0', '2', '2500', '2019-12-24', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('19', '1', '2', '1', '60000.00', '1', '2', '2018-01-01', '2021-01-01', '0', 'A105房租详细', '2018-01-01 13:31:46', '0', '2', '1666.6666666666667', '2018-01-01', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('20', '1', '2', '1', '60000.00', '1', '2', '2018-01-01', '2021-01-01', '0', 'A105房租详细', '2018-01-01 13:31:46', '0', '2', '3333.3333333333335', '2018-01-01', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('21', '1', '2', '1', '60000.00', '1', '2', '2018-01-01', '2021-01-01', '0', 'A105房租详细', '2018-01-01 13:31:46', '0', '2', '5000', '2018-01-01', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('22', '1', '2', '1', '60000.00', '1', '2', '2018-01-01', '2021-01-01', '0', 'A106房间明细', '2018-01-01 14:24:26', '0', '2', '1666.6666666666667', '2018-01-01', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('23', '1', '2', '1', '60000.00', '1', '2', '2018-01-01', '2021-01-01', '0', 'A106房间明细', '2018-01-01 14:24:26', '0', '2', '3333.3333333333335', '2018-01-01', '0', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('24', '1', '2', '1', '60000.00', '1', '2', '2018-01-01', '2021-01-01', '0', 'A106房间明细', '2018-01-01 14:24:26', '0', '2', '500', '2018-01-01', '5', '30', '2', '0', '0', '0', '0');
INSERT INTO `t_house_rent_pay` VALUES ('25', '1', '2', '1', '2000.00', '3', '2', '2018-01-04', '2021-01-04', '0', '1120', '2018-01-04 21:16:34', '0', '9', null, '2018-01-04', '0', '20', '2', '0', '0', '0', '20');

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
  `price` double DEFAULT '0',
  `hotel_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`) USING BTREE,
  CONSTRAINT `t_house_type_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house_type
-- ----------------------------
INSERT INTO `t_house_type` VALUES ('14', '御筑大床房', '御筑大床房', '2018-01-15 14:38:48', '0', '1', '800', '2');
INSERT INTO `t_house_type` VALUES ('16', '800', '800酒店', '2018-01-15 19:13:30', '1', '1', '800', '2');
INSERT INTO `t_house_type` VALUES ('17', '总统套房', '总统套房', '2018-01-17 19:35:33', '0', '1', '500', '2');
INSERT INTO `t_house_type` VALUES ('19', '总统套房', '总统套房', '2018-01-24 11:57:45', '0', '1', '800', '4');

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
  `is_check` tinyint(4) NOT NULL,
  `remark` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leave
-- ----------------------------
INSERT INTO `t_leave` VALUES ('1', '1', '-1', '6', '6', '3', '回家相亲', '2017-12-17 16:05:39', '2017-12-17 12:51:14', '1', '0', '');
INSERT INTO `t_leave` VALUES ('2', '1', '-1', '7', '7', '4', 'eee', '2017-12-17 15:21:10', '2017-12-17 15:21:10', '1', '1', '审核通过');

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
  UNIQUE KEY `title` (`title`) USING BTREE
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
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_payment_type
-- ----------------------------
INSERT INTO `t_payment_type` VALUES ('1', '支付宝', '支付宝支付', '2018-01-17 20:09:24', '0', '1');
INSERT INTO `t_payment_type` VALUES ('2', '微信', '微信支付', '2018-01-17 20:09:33', '0', '1');
INSERT INTO `t_payment_type` VALUES ('3', '银联', '银联支付', '2018-01-17 20:09:45', '0', '1');
INSERT INTO `t_payment_type` VALUES ('4', '现金', '现金支付', '2018-01-17 20:09:58', '0', '1');
INSERT INTO `t_payment_type` VALUES ('5', '通联', '通联支付', '2018-01-19 13:56:13', '0', '1');

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
  UNIQUE KEY `permission` (`permission`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_price_item
-- ----------------------------
DROP TABLE IF EXISTS `t_price_item`;
CREATE TABLE `t_price_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessman_id` bigint(20) DEFAULT NULL,
  `hotel_type_id` bigint(20) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_price_item
-- ----------------------------
INSERT INTO `t_price_item` VALUES ('1', '1', '1', '600', '10', '0', '2018-03-10 18:17:58');
INSERT INTO `t_price_item` VALUES ('2', '1', '1', '100', '5', '0', '2018-03-10 18:25:09');

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
  `hotel_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `total_pay` decimal(18,2) NOT NULL,
  `fact_pay_time_start` date DEFAULT NULL,
  `fact_pay_time_end` date DEFAULT NULL,
  `facted_pay_time_end` date DEFAULT NULL,
  `facted_pay_time_start` date DEFAULT NULL,
  `fact_pay` double(255,0) DEFAULT NULL,
  `pay_count` int(255) DEFAULT NULL,
  `pay_time` int(11) NOT NULL,
  `pay_type` int(11) NOT NULL,
  `spare_money` double(255,0) DEFAULT NULL,
  `pay_fact_time` int(11) DEFAULT NULL,
  `pay_period_start` date NOT NULL,
  `pay_period_end` date NOT NULL,
  `is_cash` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `house_name` varchar(30) NOT NULL,
  `first_pay` double DEFAULT NULL,
  `first_pay_time` date DEFAULT NULL,
  `sum_pay` double(255,0) DEFAULT NULL,
  `day_pay` double(255,0) DEFAULT NULL,
  `month_pay` double(255,0) DEFAULT NULL,
  `area` double(255,0) DEFAULT NULL,
  `house_count` int(255) DEFAULT NULL,
  `shuidian` int(255) DEFAULT NULL,
  `kongtiao` int(255) DEFAULT NULL,
  `gongnuan` int(255) DEFAULT NULL,
  `wuye` double(255,0) DEFAULT NULL,
  `yajin` double(255,0) DEFAULT NULL,
  `bucaofei` double(255,0) DEFAULT NULL,
  `buzhiqi` int(255) DEFAULT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `zhuangxiu` int(255) DEFAULT NULL,
  `qixian` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `master_id` (`master_id`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `hotel_id` (`hotel_id`) USING BTREE,
  CONSTRAINT `t_rent_pay_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `t_contract_master` (`id`),
  CONSTRAINT `t_rent_pay_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_rent_pay_ibfk_3` FOREIGN KEY (`hotel_id`) REFERENCES `t_hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rent_pay
-- ----------------------------
INSERT INTO `t_rent_pay` VALUES ('42', '1', '2', '1', '12000.00', '2018-01-01', '2019-01-01', '2018-02-01', '2018-04-01', '12000', '12', '1', '1', '12000', '1', '2018-01-01', '2019-01-01', '0', '暂无说明', '2018-03-05 14:28:02', '0', 'A101', '1000', '2018-01-01', '0', '33', '1000', null, null, '0', '0', '0', null, null, null, null, '4f3b5b9b-b200-4fda-9c07-0dbde01d3594', '0', '2018-01-01,2018-02-01,2018-03-01,2018-04-01,2018-05-01,2018-06-01,2018-07-01,2018-08-01,2018-09-01,2018-10-01,2018-11-01,2018-12-01');

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
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '总管理员', '总管理员', '2017-11-15 12:39:18', '0');
INSERT INTO `t_role` VALUES ('2', '店长', '店长', '2017-11-15 12:41:53', '0');
INSERT INTO `t_role` VALUES ('3', '录入员', '录入员', '2017-11-15 12:42:01', '0');
INSERT INTO `t_role` VALUES ('5', '审核员', '审核员', '2017-11-27 22:26:53', '0');
INSERT INTO `t_role` VALUES ('6', '管理员', '管理员', '2018-01-16 20:25:33', '0');
INSERT INTO `t_role` VALUES ('7', '酒店审核员', '酒店审核员', '2018-01-16 20:54:00', '0');
INSERT INTO `t_role` VALUES ('8', '酒店录入员', '酒店录入员', '2018-01-17 21:20:30', '0');

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
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `permission_id` (`permission_id`) USING BTREE,
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
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_service_subject
-- ----------------------------
INSERT INTO `t_service_subject` VALUES ('1', '旅游', '旅游增值科目', '2018-01-17 20:29:19', '0', '1');
INSERT INTO `t_service_subject` VALUES ('2', '包车', '包车增值科目', '2018-01-17 20:29:29', '0', '1');
INSERT INTO `t_service_subject` VALUES ('3', '饮料消费', '饮料消费增值科目', '2018-01-17 20:29:46', '0', '1');

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
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `account_name` (`account_name`) USING BTREE,
  UNIQUE KEY `qq_openid` (`qq_openid`) USING BTREE,
  UNIQUE KEY `weibo_openid` (`weibo_openid`) USING BTREE,
  UNIQUE KEY `wechat_openid` (`wechat_openid`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE,
  CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('6', '275300091@qq.com', '15679760329', 'admin', '96e79218965eb72c92a549dd5a330112', 'admin', '360706199712200618', 'admin', '0', '2017-11-26', '21', '江西赣州章贡区宁都县', '275300091', 'xljx_888888', null, null, null, null, 'static/img/face.gif', null, '2017-11-15 12:45:01', '1', '0');
INSERT INTO `t_user` VALUES ('7', '275300090@qq.com', '15679760321', null, '96e79218965eb72c92a549dd5a330112', '15679760321', '360730199712200617', '惊鸿', '0', '2017-11-26', '21', '江西赣州章贡区', '275300091', 'xljx#_888888', null, null, null, null, 'static/img/face.gif', null, '2017-11-21 21:02:57', '1', '0');
INSERT INTO `t_user` VALUES ('27', null, '15679760323', null, '96e79218965eb72c92a549dd5a330112', '15679760323', '11111111111', '酒店审核员', null, null, null, null, null, null, null, null, null, null, 'static/img/face.gif', null, '2018-01-17 21:37:11', '1', '0');
INSERT INTO `t_user` VALUES ('28', null, '15679760324', null, '96e79218965eb72c92a549dd5a330112', '15679760324', '111111111', '酒店录入员', null, null, null, null, null, null, null, null, null, null, 'static/img/face.gif', null, '2018-01-17 21:37:45', '1', '0');
INSERT INTO `t_user` VALUES ('29', null, '15679760325', null, '96e79218965eb72c92a549dd5a330112', '15679760325', '11111111', '录入员', null, null, null, null, null, null, null, null, null, null, 'static/img/face.gif', null, '2018-01-17 21:39:36', '1', '0');
INSERT INTO `t_user` VALUES ('30', null, '15679760000', null, '96e79218965eb72c92a549dd5a330112', '15679760000', '360730199712200666', '管理员', null, null, null, null, null, null, null, null, null, null, 'static/img/face.gif', null, '2018-02-06 20:00:14', '1', '0');

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
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  CONSTRAINT `t_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '6', '1', '2017-11-15 12:45:01', '0');
INSERT INTO `t_user_role` VALUES ('2', '7', '2', '2017-11-21 21:02:57', '0');
INSERT INTO `t_user_role` VALUES ('19', '27', '7', '2018-01-17 21:37:11', '0');
INSERT INTO `t_user_role` VALUES ('20', '28', '8', '2018-01-17 21:37:45', '0');
INSERT INTO `t_user_role` VALUES ('21', '29', '3', '2018-01-17 21:39:36', '0');
INSERT INTO `t_user_role` VALUES ('22', '30', '6', '2018-02-06 20:00:14', '0');

-- ----------------------------
-- Table structure for t_verifcode
-- ----------------------------
DROP TABLE IF EXISTS `t_verifcode`;
CREATE TABLE `t_verifcode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `msg` varchar(200) DEFAULT NULL COMMENT '内容',
  `addtime` datetime NOT NULL COMMENT '添加时间',
  `status` int(11) DEFAULT '0' COMMENT '短信状态',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_verifcode
-- ----------------------------
INSERT INTO `t_verifcode` VALUES ('37', '15679760320', '141560', '【瑞蓝酒店】找回密码，你的验证码是：141560', '2018-01-05 20:40:28', '1', '2018-01-05 20:35:28');
