/*
 Navicat Premium Data Transfer

 Source Server         : mac
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : 10.109.23.180:3306
 Source Schema         : hotelmanager

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 10/09/2018 11:41:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for house_fact_pay
-- ----------------------------
DROP TABLE IF EXISTS `house_fact_pay`;
CREATE TABLE `house_fact_pay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '房租缴纳费用',
  `house_rent_id` bigint(20) NOT NULL COMMENT '房租id',
  `pay_money` double NOT NULL COMMENT '支付金额',
  `create_time` datetime(0) NOT NULL COMMENT '支付时间',
  `status` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_businessman
-- ----------------------------
DROP TABLE IF EXISTS `t_businessman`;
CREATE TABLE `t_businessman`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '酒店联系方式',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信名称',
  `hotel_sin_name` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '酒店简称',
  `hotel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '酒店全称',
  `wxopenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信的openid',
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '酒店的签名',
  `is_active` tinyint(4) NULL DEFAULT NULL COMMENT '酒店状态',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '酒店创建时间',
  `type` int(255) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `face_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_businessman
-- ----------------------------
INSERT INTO `t_businessman` VALUES (41, 'REYLAN', '15563906390', '0532-85696999', NULL, '瑞蓝公寓', '瑞蓝海景度假公寓', NULL, '', 0, '2018-03-26 19:34:25', 0, '1c63129ae9db9c60c3e8aa94d3e00495', '/upload/9948127549772885.jpg');
INSERT INTO `t_businessman` VALUES (43, 'Adimin', '13061324160', '13061324160', NULL, '客服管理', '公寓联盟平台管理员', 'oRTN8wojpwGQ3-tAW0u9V2tpPcm4', '', 0, '2018-03-26 19:35:22', 0, NULL, '/upload/10009611984376658.jpg');
INSERT INTO `t_businessman` VALUES (44, '絮落锦乡', NULL, NULL, NULL, '未填写', '未填写', 'oRTN8woiP_lrVfpwY_p6u6k-Cqcc', NULL, 1, '2018-03-26 20:25:49', 0, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/oI2sGr1W8ZnlmvSGu89ia7NMKqx5J1ib2NO0QdRIP2ShhiazlHb6icibMXNDX3iap1c5tN6e3kRZp8fqFgMn7jibHwurg/132');
INSERT INTO `t_businessman` VALUES (45, '17663982567', '17663982567', '13356895653', NULL, '记忆旅行', '青岛记忆旅行精品度假公寓', NULL, '', 0, '2018-03-26 21:57:30', 0, 'b0ae3aceee0c03c86f04a072544d44f0', '/upload/9941705988834954.jpeg');
INSERT INTO `t_businessman` VALUES (47, '18661750395', '18661750395', '82855333', NULL, '聆海铂月', '青岛聆海铂悦海景度假公寓', NULL, '', 0, '2018-03-26 22:17:07', 0, '34e33dacb7dc218eeea369bf71b528de', '/upload/face.gif');
INSERT INTO `t_businessman` VALUES (48, '韩培', NULL, NULL, NULL, '未填写', '未填写', 'oRTN8wmZFuq67X6ja8x2aLIxF0g0', NULL, 0, '2018-03-27 15:34:00', 0, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJPpziaqOoIpGp1ZZQ50pmY6xBLnhkcwhicvuMHbDYGVkSxYxY5gsNkIECEpLcsqk7lz2T2zse54bgA/132');
INSERT INTO `t_businessman` VALUES (49, '孙晓黎', NULL, NULL, NULL, '未填写', '未填写', 'oRTN8wmtsS7N89W0horMuU3FT9vs', NULL, 0, '2018-03-27 15:35:29', 0, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLHtezkm2QCpRxiacPEu2fKLaaVvz6L25JOEoTow8FbwkvVfecKxF0lTOaQz0KGwciag4PEsWpicnJTw/132');
INSERT INTO `t_businessman` VALUES (50, '15732871261', '15732871261', '0532-67757091', NULL, '四季精选酒店', '四季精选酒店', NULL, '', 0, '2018-03-27 15:36:28', 0, '77b0a80a79f26471ef47d18d2416dc16', '/upload/10005978708724801.jpg');
INSERT INTO `t_businessman` VALUES (51, '普罗米修斯', NULL, NULL, NULL, '未填写', '未填写', 'oRTN8wr4Nq49899-hcDPj8qDDkGc', NULL, 0, '2018-03-27 15:36:56', 0, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLAWPtxUgRnc8wWaUJG88eXZwC98l73CBHdKrqNu3OQ1XkvsLq8mj9dq11EfdBerPGhWeWWRYib7mw/132');
INSERT INTO `t_businessman` VALUES (52, '13964291753', '13964291753', NULL, NULL, '未填写', '未填写', NULL, NULL, 0, '2018-03-27 15:37:20', 0, '8fd6b67b946d904eff14366f0cf2bab4', '/upload/face.gif');
INSERT INTO `t_businessman` VALUES (53, '不扯淡的stark', NULL, NULL, NULL, '未填写', '未填写', 'oRTN8wnP8y2MDnfIEehlsZqFvRxI', NULL, 0, '2018-03-27 15:38:05', 0, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLrIcw03ibKkklcPWyes827YRCQ3nCQvB0RHMicU7Tw41604Z2V0mwEhDib3yr5PreaOcibX60T7iaJwlw/132');
INSERT INTO `t_businessman` VALUES (54, '15762281999', '15762281999', NULL, NULL, '未填写', '未填写', NULL, NULL, 0, '2018-03-27 15:38:40', 0, '756acbc9fa35ba3a6376373fde52fd31', '/upload/face.gif');
INSERT INTO `t_businessman` VALUES (55, '13905324650', '13905324650', '13165029811', NULL, '住友公寓', '未填写', NULL, '', 0, '2018-03-27 15:38:47', 0, 'cea625d00aeea23e71f5f48a28c4bfc0', '/upload/10005919610716638.jpg');
INSERT INTO `t_businessman` VALUES (56, '13964829703', '13964829703', NULL, NULL, '未填写', '未填写', NULL, NULL, 0, '2018-03-27 15:39:10', 0, '3e007ee2b1780c2d1414e7d110c75cfb', '/upload/face.gif');
INSERT INTO `t_businessman` VALUES (57, '青岛老李', NULL, NULL, NULL, '未填写', '未填写', 'oRTN8wsmCnadM8NER_CFB17gali8', NULL, 0, '2018-03-27 15:41:09', 0, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIPsbt7BibERGwst3ibiaFqORibu9bsuZ0ZuD5ZB7IZWcFibu1K0ObnaQ0LBg50uJqybicEneh065WlI8HA/132');
INSERT INTO `t_businessman` VALUES (58, '18660283586', '18660283586', NULL, NULL, '未填写', '未填写', NULL, NULL, 0, '2018-03-27 15:46:02', 0, '68b86080f99521ab4470ed9d7b021abe', '/upload/face.gif');
INSERT INTO `t_businessman` VALUES (59, '13255555858', '13255555858', '15666423221', NULL, '梦途公寓', '梦途海景度假公寓', NULL, '', 0, '2018-03-27 15:52:49', 0, '7e58af19094ad172ccf68be33bf7b09c', '/upload/10006513697577910.jpeg');
INSERT INTO `t_businessman` VALUES (60, '擎', NULL, NULL, NULL, '未填写', '未填写', 'oRTN8wiHXT6sAlPULa2PJyF6l4c0', NULL, 0, '2018-03-27 15:53:30', 0, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eogrnzaYfkyfwQeXTJqQ9Qm5QpYMAOu4HT0yibtwR7cvIPia5F9SMqwaUv22yfPbR0FzRWhlVAC3SiaA/132');
INSERT INTO `t_businessman` VALUES (61, '18210153568', '18210153568', NULL, NULL, '未填写', '未填写', NULL, NULL, 0, '2018-03-27 15:56:23', 0, 'cb657a369e1338c686a9c513a5ed269f', '/upload/face.gif');
INSERT INTO `t_businessman` VALUES (62, '李志科', '17663911222', '82880088', NULL, '四季海岸公寓', '青岛四季海岸海景度假公寓', NULL, '', 0, '2018-03-27 16:08:10', 0, 'de1310a03387db5df4d4f44917ca5a6f', '/upload/10019675399281981.jpeg');
INSERT INTO `t_businessman` VALUES (63, '18253201000', '18253201000', NULL, NULL, '未填写', '未填写', NULL, NULL, 0, '2018-03-27 17:14:03', 0, '4c30f3d857728c2ba265484e3ffa6dc8', '/upload/face.gif');
INSERT INTO `t_businessman` VALUES (64, 'K.', NULL, NULL, NULL, '未填写', '未填写', 'oRTN8wutOSaK3PSa9etYLlx1HrJU', NULL, 0, '2018-03-27 17:14:38', 0, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83ersiacCECZbGgVXQM5RFEhFMdicWrVcyQyGsaC9VQUBcJibsGeX9UKmYfL60yLJtwqy2DGMvpY01yicOQ/132');
INSERT INTO `t_businessman` VALUES (65, '李彦', '15606484555', '15606484555', NULL, '瑞奇', '未填写', 'oRTN8wi-VxZUI2_fmIn63cGSf_88', '', 0, '2018-03-27 17:34:01', 0, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJIeia5AcUvc17zxovJPCQibGpHOG0GVzJ0pib6wMusekGzHelqNkDU1ucTDNj7YgicgA1eZzyvg9wZVA/132');
INSERT INTO `t_businessman` VALUES (66, '13255588997', '13255588997', '13255588997', NULL, '铂悦公寓', '青岛铂悦海景度假公寓', NULL, '', 0, '2018-03-27 17:41:29', 0, '1c63129ae9db9c60c3e8aa94d3e00495', '/upload/10012835107243532.jpeg');
INSERT INTO `t_businessman` VALUES (67, '13953205332', '13953205332', NULL, NULL, '未填写', '未填写', NULL, NULL, 0, '2018-03-27 17:50:54', 0, '5cb50eae6681f0e786cac913b6836c84', '/upload/face.gif');
INSERT INTO `t_businessman` VALUES (68, '13361235830', '13361235830', NULL, NULL, '未填写', '未填写', NULL, NULL, 0, '2018-03-27 18:15:36', 0, '670b14728ad9902aecba32e22fa4f6bd', '/upload/face.gif');
INSERT INTO `t_businessman` VALUES (69, '18953635456', '18953635456', NULL, NULL, '未填写', '未填写', NULL, NULL, 0, '2018-03-27 18:21:28', 0, 'e2fc714c4727ee9395f324cd2e7f331f', '/upload/face.gif');
INSERT INTO `t_businessman` VALUES (70, '15315323788', '15315323788', '18561738787', NULL, '海蓝阳光', '未填写', NULL, '', 0, '2018-03-27 18:29:16', 0, '2d025cc2431cef69febd02ebd73090fc', '/upload/face.gif');
INSERT INTO `t_businessman` VALUES (71, '13256884777', '13256884777', '13256884777', NULL, '中联邮海栈桥', '中联邮海栈桥', NULL, '', 0, '2018-03-27 18:29:42', 0, 'caf14e0bb0abf08f2389aae6008ef254', '/upload/11130499517217166.jpg');
INSERT INTO `t_businessman` VALUES (72, '海蓝阳光海景度假公寓', NULL, NULL, NULL, '未填写', '未填写', 'oRTN8wry7WG6rY2k0QE_tbv8sE4c', NULL, 0, '2018-03-27 18:30:14', 0, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9B4YicCEXEBXPXRPL8y1904e4Zvk7keYxNY0FTxI34GXrC0ib5icsk2vpZkh80RGg4upHUEGvkP72A/132');

-- ----------------------------
-- Table structure for t_cash_accounts
-- ----------------------------
DROP TABLE IF EXISTS `t_cash_accounts`;
CREATE TABLE `t_cash_accounts`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NULL DEFAULT NULL,
  `account_type` tinyint(4) NOT NULL,
  `account_time` datetime(0) NOT NULL,
  `account_time_end` datetime(0) NULL DEFAULT NULL,
  `total_pay` decimal(18, 2) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `is_cash` tinyint(4) NULL DEFAULT NULL,
  `cash_status` tinyint(4) NULL DEFAULT NULL,
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hander` bigint(20) NULL DEFAULT NULL,
  `day_pay` double(255, 0) NULL DEFAULT NULL,
  `pay_type_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  INDEX `subject_id`(`subject_id`) USING BTREE,
  INDEX `hotel_id`(`hotel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cash_accounts
-- ----------------------------
INSERT INTO `t_cash_accounts` VALUES (1, 1, 2, 0, '2017-12-03 22:56:17', '2018-02-01 18:47:34', 500.00, 1, '采购牙刷', '采购牙刷', '2017-12-03 22:56:56', 0, 1, 1, '审核通过', 7, 30, 1);
INSERT INTO `t_cash_accounts` VALUES (2, 1, 2, 0, '2017-12-05 09:25:09', '2018-02-01 18:47:34', 900.00, 1, '牙刷进货', '暂无批注', '2017-12-05 21:27:48', 1, 0, 2, '不通过', 6, 30, 2);
INSERT INTO `t_cash_accounts` VALUES (3, 1, -1, 1, '2017-12-05 00:00:00', '2018-02-01 23:59:59', 800.00, 2, '被套支出', '账单无误', '2017-12-05 21:33:25', 0, 1, 1, '审核通过', 7, 14, 3);
INSERT INTO `t_cash_accounts` VALUES (4, 1, -1, 1, '2018-01-04 18:40:57', '2018-02-01 18:47:34', 3000.00, 4, '房租缴纳', '暂无批注', '2018-01-04 18:44:21', 1, 0, 0, '未审核', NULL, 30, 4);
INSERT INTO `t_cash_accounts` VALUES (6, 1, 4, 1, '2018-01-01 00:00:00', '2018-01-31 23:59:59', 3000.00, 1, '牙刷支出总费用', '暂无批注', '2018-01-04 18:59:54', 0, 0, 0, '未审核', NULL, 100, 2);
INSERT INTO `t_cash_accounts` VALUES (7, 1, 4, 1, '2018-01-01 00:00:00', '2018-01-31 23:59:59', 3000.00, 2, '被套支出', '很好喔', '2018-01-04 19:02:36', 0, 1, 1, '', 6, 100, 3);
INSERT INTO `t_cash_accounts` VALUES (8, 1, -1, 0, '2018-01-17 00:00:00', '2018-02-15 23:59:59', 8000.00, 1, '收入', '暂无批注', '2018-01-29 17:11:19', 0, 1, 0, '未审核', NULL, 276, 1);
INSERT INTO `t_cash_accounts` VALUES (9, 1, -1, 0, '2018-01-16 00:00:00', '2018-02-21 23:59:59', 90.00, 2, '收入', '暂无批注', '2018-01-29 17:29:40', 0, 1, 0, '未审核', NULL, 2, 1);
INSERT INTO `t_cash_accounts` VALUES (10, 1, -1, 0, '2018-01-01 00:00:00', '2018-01-31 23:59:59', 90.00, 2, '收入', '收入无误', '2018-01-29 17:43:21', 0, 0, 2, '不通过', 6, 3, 1);
INSERT INTO `t_cash_accounts` VALUES (11, 1, 2, 0, '2018-01-17 00:00:00', '2018-01-31 23:59:59', 800.00, 2, '收入', '审核通过神核通过审核通过神核通过审核通过神核通过审核通过神核通过审核通过神核通过审核通过神核通过审核通过神核通过', '2018-01-29 23:04:26', 0, 1, 0, '未审核', NULL, 57, 1);
INSERT INTO `t_cash_accounts` VALUES (12, 1, 4, 0, '2018-01-01 00:00:00', '2018-01-31 23:59:59', 820.00, 4, '房租收入', '暂无审核暂无审核暂无审核暂无审核暂无审核暂无审核暂无审核暂无审核', '2018-01-29 23:33:20', 0, 1, 1, '审核通过', 6, 27, 4);

-- ----------------------------
-- Table structure for t_cash_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_cash_subject`;
CREATE TABLE `t_cash_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` bigint(20) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cash_subject
-- ----------------------------
INSERT INTO `t_cash_subject` VALUES (1, '牙刷', '牙刷', '2017-11-30 22:10:13', 1, 0);
INSERT INTO `t_cash_subject` VALUES (2, '被套', '被套', '2017-11-30 22:16:34', 1, 0);
INSERT INTO `t_cash_subject` VALUES (3, '押金', '押金', '2017-12-10 21:30:10', 1, 0);
INSERT INTO `t_cash_subject` VALUES (4, '房费缴纳', '房费缴纳', '2017-12-10 21:30:23', 1, 0);

-- ----------------------------
-- Table structure for t_char
-- ----------------------------
DROP TABLE IF EXISTS `t_char`;
CREATE TABLE `t_char`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessman_id` bigint(20) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_active` tinyint(4) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `img_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_char
-- ----------------------------
INSERT INTO `t_char` VALUES (42, 43, '       大家好！欢迎来到【中联公寓同盟会】，我简单简述一下我们这个同盟会存在的意义，和同盟平台如何来帮助大家在一定程度上缓解提不起价格的中联魔咒问题，大家为什么总说价格底，归根到底是因为大家缺乏一个行业规则，咱们的订单可以说98％源自于OTA，大家都明白OTA客源大部分的选择习惯是同一个楼内价低者优先，这就驱使咱们永远都要跟底价OTA端口看齐，金牌特牌之类的端口，为了保住优势就要跟低价血拼，流量本来就不好的端口更要降价为了挣流量，最后导致在这种低价的环境中，一批流量较好的端口以迫于无奈的低价优先满房后，摇身一变成为了炒房投机者，他们会再以这种低价甚至更低的价格吞噬中联其他商家房源，目标是能赚点更好不能赚起码也保持OTA端口的流量优势，这是一种畸形的行业形态。\n         这种畸形的行业形态直接导致的问题有两点，第一、满房的只要感觉还能借到房就一定不提价，而空房的只要没满房也绝不敢提价。\n         第二、受第一条的影响中联这个市场没有价格曲线，什么叫价格曲线呢？我相信大家也会遇到过这样的尴尬情况，就是OTA上看看大家的价格都标到了一二百元甚至是300＋，再看看自己房态的订单价格百分之八九十以上都是几十块钱进的，或者更低的价格借给了别人，对吧？这叫什么事儿？按道理来说从七八十元到一二百元应该有个过程，而我们应该在这个过程中把房价平均拉开，不说是300＋吧，怎么这均价也要有个一百二三吧，总不至于均价不到100元吧，为什么呢？其原因就是我们刚才提到的第一条，有一部分人只要感觉我还能低价拿到房间绝对不提价，而另一部分人只要看到自己没满房就一定会低价把房子处理给同行，与此同时我们的信息又相对闭塞，我们不能像看股票一样及时了解到楼内的价格走势，你的信息大多还是来自与你走动比较频繁的商家，以及你自己在OTA上看到的外网卖价，结果是走动比较频繁的商家就是满了房也不调价的低价主导者，而你也就成为了低价主导者的帮凶，也可以说是无辜的牺牲品，如此往复当你突然发现自己没房了，而借房者也发现找你借不到房了，这才去把OTA价格标高，其不知为时已晚，明明可以提高价格的好时机已然错过，剩下的就是那几个残留房源待价而沽，沽好了发笔小横财沽不好砸手里，剩下的就是大家耳熟能详的一次又一次的，因为中联房价低而愤愤不平的呼声！\n        而正确的行业形态应该是怎样呢？我觉得应该是从两个方面来看待，第一种情况是客少房多的时候，这个时候价格低就对了，应该低大家七八十的外网标价属于正常现象，内部更低的价格借房也是可以理解的，市场嘛就应该这样不是吗？当然我觉得再低也应该先把账算明白，卖了就比空着强是不假，但前提是卖了要比停业挣多点才划算，咱们一味的为了卖出去而降价，最后算算还不如一千多块包出去，毕竟长包出去你除了房租外没有任何成本了，算一下一套房租金减去长包回款最多赔个千八百的，但是坚持低价卖房一个月下来一套房营业额也就是个两千多，算一算租金一扣已经负数，你还要再搭上人工、水电、物业、供暖、洗布草、消耗品、和你因为熬夜而日渐憔悴的身体等等，真的合得来吗？有人说你说错了，不单是为了钱重要的是为了做好OTA，那这个事儿我是这么看的，OTA流量做的好与不好主要是为了淡季能多进订单少赔点成本，而旺季OTA好坏并不明显，只要你开着房傻子都满房，所以你流量做得天好却卖不出能赚钱的价格，那就只能是恶性循环单越多赔越多。\n       第二种是客多房少的时候，这就有故事了，我们应该是随行就市逐渐把价格由低到高的提上来，在这个提价的过程中大家都多赚点钱，拉出价格曲线，而不是还像客少房多那样，玩了命的低价挣流量，最后导致低价满房后，才以直线形式提高价格，这个高价格已经没有任何意义了不是吗？\n         所以要解决这些事儿总要有个合理的办法，你要说大家都不要借房了各卖各的满了关房，这固然是个好办法，但真要各家做的到也是个不太现实的事儿，或者有人说可以限制外网售价不低于一定数额，我认为这是个不太合理的政策，举个例子同一个OTA平台就有流量好和流量不好的两种端口，如果限制了一个底价，那么我相信只要流量好的端口压在这个底线上，其他端口就很难进单，这时候就会出现一边倒的局面流量好的优先满房，然后又来我们上边提到的那一套，仍然坚持底价不提高然后以更低的价格吞噬空房的其他商家房源，而空房商家为了优先甩空自己房源，势必会相互压低出房价，要不了多久就会有坚持不下去的商家主动调低OTA价格，大家也必会竞相随从最后土崩瓦解。\n       我认为最好的办法不是限制外网卖价，而是大家共同建立一个可以互通信息的平台，制订一个可以随着行情随时变化的内部借房价格，这样一来大家以这个价格为基础，空房多的你OTA上随便卖，当你差不多快满的时候你肯定会调高价格因为你价格再低的话借不到房了，而借房的价格随着剩余房量越来越少也会越来越高，如此不管你是OTA卖了还是内部消化了都能拿到一个相对较高的价格。\n       但问题来了这个价格怎么定呢？谁来定？我觉得最好的办法不是某个人来定，而是大家伙各自根据自家房态情况来出价，然后我们以均价作为标准来执行，比如房量及交易价格的透明化，让每家都能随时了解到当前各家的库存量和出房价，这样空房多的可以报价低一点，空房少的可以报价高一点，随着空房越来越少这个均价也会越来越高，当然大家做到坚持均价交易的愿景虽然美好，但总会有个别不按套路出牌的事实存在，毕竟共产主义只是一个客观存在的梦而已，但我想就算是大家因为某些原因，促使不能做到按照均价有序交易，但只要大家把各自的价格报到明处，咱们做到出房价及库存量的透明化，那些空房比较多出价比较低的商家自然也会更快的减少空房量，而且其出房价也一定会参照各家价格制订，而不是原来那种由已满房的投机者来定价的方式，届时我相信他随着空房越来越少价格自然会提高，毕竟看着人家都卖的价格高自己也很羡慕，人又不是傻子非要便宜卖对吧，这样一来我们等于有了一个正常态的市场，碰上客多房少的情况咱们能快速的随行就市，价格水涨船高，碰上客少房多的时候也能及时给大家一个信息反馈，该降价降价争取更多流量，都说团结就是力量，这一点咱们北方人跟南方人相比差的太多，同样都是某一行业的聚集区，咱们看看人家福建卖茶叶的、看看温州搞皮鞋的等等，人家总能做到内部市场井然有序，对外凝心聚气让每个人都赚取到不错的收益，而我们在一起呢？总是自己人折腾自己人，折腾来折腾去每个人都没赚到便宜，不是吗？\n        说的各家报价及库存，总是需要一个统计的方法吧，在这里我们为大家设计并开发了这个平台，我们考虑了所有刚才所说的功能，大家可以随时维护自家的报价与库存，系统将自动为大家抓取数据计算出平均值，大家也随时可以看到各家的实时库存和报价，咱不说这一定能解决中联现在的窘态，但我觉得这个平台作为一款工具，也至少可以让你知道你现在需要多少钱才能借到房，或者说你的房现在能卖到多少钱，这样那些抱着反正能低价借房，而房满不提价格的投机者，将不得不像市场妥协提高价格或关房，而没满房的商家将会因为市场趋势的影响而获得更多的收益，所以只要大家及时维护好平台的数据，保证他的实时性和真实性，我们肯定能在一定程度上缓解提不起房价的中联魔咒！\n        我不知道这些观点对与不对，我胡乱说大家凑合着听，如有不对或不周之处望大家海涵！若感觉有兴趣可以点击上边标题下的“瑞蓝团队”关注公众号，并在公众号内注册成为平台成员，注册成功后可以私信我为你开通报价权限，谢谢大家！', 0, '2018-03-27 16:49:40', NULL);

-- ----------------------------
-- Table structure for t_char_say
-- ----------------------------
DROP TABLE IF EXISTS `t_char_say`;
CREATE TABLE `t_char_say`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `char_id` bigint(20) NULL DEFAULT NULL,
  `businessman_id` bigint(20) NULL DEFAULT NULL,
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_active` tinyint(4) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_code
-- ----------------------------
DROP TABLE IF EXISTS `t_code`;
CREATE TABLE `t_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` int(11) NOT NULL,
  `msg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `end_time` datetime(0) NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `represent` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `is_active` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES (1, '青岛瑞蓝铂悦酒店管理有限公司', '陈闯', '15679760329', '0532-85696999', '山东省青岛市市北区新疆路8号中联自由港湾A座 2829', '瑞蓝瑞蓝瑞蓝瑞蓝瑞蓝瑞蓝瑞蓝', '2017-11-14 20:41:17', 0);
INSERT INTO `t_company` VALUES (2, '瑞蓝酒店1', '陈闯', '15563906390', '15563906390', '山东省青岛市', '瑞蓝酒店是一个大型具有24个连锁酒店的公司，规模宏大	', '2017-11-14 20:41:17', 0);

-- ----------------------------
-- Table structure for t_contract
-- ----------------------------
DROP TABLE IF EXISTS `t_contract`;
CREATE TABLE `t_contract`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `master_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `contract_contract` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contract_years` int(11) NOT NULL,
  `contract_date` date NOT NULL,
  `contract_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `min_profit` decimal(18, 2) NOT NULL,
  `profit_rate` double NOT NULL,
  `month_pay` decimal(18, 2) NOT NULL,
  `pay_date` date NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `master_id`(`master_id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_contract
-- ----------------------------
INSERT INTO `t_contract` VALUES (1, 1, 1, '瑞蓝酒店房租', 3, '2017-11-17', '房租合同1号', 1000.00, 10, 3000.00, '2017-11-17', '2017-11-17 22:22:59', 0);
INSERT INTO `t_contract` VALUES (2, 3, 2, '瑞蓝酒店房租1', 3, '2017-11-17', '房租合同3号', 2000.00, 10, 3000.00, '2017-11-17', '2017-11-17 22:24:12', 0);
INSERT INTO `t_contract` VALUES (3, 1, 1, '青岛市', 4, '2017-11-21', '666666', 1000.00, 10, 2000.00, '2017-11-21', '2017-11-21 21:22:09', 0);

-- ----------------------------
-- Table structure for t_contract_master
-- ----------------------------
DROP TABLE IF EXISTS `t_contract_master`;
CREATE TABLE `t_contract_master`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_account_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_account_no` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int(11) NULL DEFAULT NULL,
  `company_id` bigint(20) NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_contract_master
-- ----------------------------
INSERT INTO `t_contract_master` VALUES (1, '中国银行', '皓月', '1111111111', '2017-11-16 22:50:16', 0, 1, '15679760322', '96e79218965eb72c92a549dd5a330112', '1111111111');
INSERT INTO `t_contract_master` VALUES (3, '中国建设银行', '心空', '222222', '2017-11-16 23:18:56', 0, 2, '1567960322', '96e79218965eb72c92a549dd5a330112', NULL);
INSERT INTO `t_contract_master` VALUES (4, '农村信用社', '信用', '33333', '2017-11-18 22:50:40', 0, 1, '15679760322', '96e79218965eb72c92a549dd5a330112', '11111111');
INSERT INTO `t_contract_master` VALUES (5, '中国银行', '李四', '1111111111111', '2018-01-03 21:19:50', 0, 1, '15679760320', 'e10adc3949ba59abbe56e057f20f883e', '222222');

-- ----------------------------
-- Table structure for t_cooperation_accounts
-- ----------------------------
DROP TABLE IF EXISTS `t_cooperation_accounts`;
CREATE TABLE `t_cooperation_accounts`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `account_type` tinyint(4) NOT NULL,
  `account_time` datetime(0) NOT NULL,
  `total_pay` decimal(18, 2) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cooperation_company_id` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `is_cash` tinyint(4) NULL DEFAULT NULL,
  `cash_status` tinyint(4) NULL DEFAULT NULL,
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hander` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  INDEX `subject_id`(`subject_id`) USING BTREE,
  INDEX `hotel_id`(`hotel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cooperation_accounts
-- ----------------------------
INSERT INTO `t_cooperation_accounts` VALUES (1, 1, 4, 0, '2017-12-06 22:08:41', 700.00, 1, '借牙刷总费用收入情况', '无批注', 1, '2017-12-06 22:09:23', 0, 0, 2, '审核不通过', 7);
INSERT INTO `t_cooperation_accounts` VALUES (2, 1, 4, 1, '2017-12-06 06:05:02', 500.00, 1, '茅台进货总费用', '账目有异议', 1, '2017-12-06 23:05:32', 0, 1, 1, '通过', 7);
INSERT INTO `t_cooperation_accounts` VALUES (3, 1, -1, 0, '2018-01-30 08:30:00', 1000.00, 1, '收入总费用', '通过', 6, '2018-01-30 12:54:17', 0, 0, 0, '未审核', NULL);
INSERT INTO `t_cooperation_accounts` VALUES (4, 1, -1, 1, '2018-01-30 08:30:00', 1000.00, 1, '费用总收入', '账目无误', 7, '2018-01-30 13:00:30', 0, 0, 0, '未审核', NULL);

-- ----------------------------
-- Table structure for t_cooperation_company
-- ----------------------------
DROP TABLE IF EXISTS `t_cooperation_company`;
CREATE TABLE `t_cooperation_company`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  INDEX `hotel_id`(`hotel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cooperation_company
-- ----------------------------
INSERT INTO `t_cooperation_company` VALUES (1, 1, 2, '茅台', '茅台', '茅台酒家', '13237675702', '13237675702', '茅台酒香', '2017-12-06 21:28:15', 0);
INSERT INTO `t_cooperation_company` VALUES (2, 1, 2, '章贡王', '江西赣州章贡区', '章贡王', '13609090909', '13609090909', '章贡王', '2017-12-06 22:04:05', 0);
INSERT INTO `t_cooperation_company` VALUES (5, 1, -1, '茅台酒家', '茅台酒家', '茅台酒家', '511-200-555', '15679589216', '茅台酒家', '2018-01-18 13:39:58', 0);
INSERT INTO `t_cooperation_company` VALUES (6, 1, -1, '餐具商家', '餐具商家', '餐具商家', '400-200-200', '15679235626', '餐具商家', '2018-01-18 13:54:58', 0);
INSERT INTO `t_cooperation_company` VALUES (7, 1, -1, '众联', '众联', '众联', '200-500-600', '18966666666', '众联', '2018-01-19 17:25:14', 0);
INSERT INTO `t_cooperation_company` VALUES (8, 1, 2, '布草商家', '江西赣州', '布草商家', '455-5545', '15679712351', '布草商家', '2018-01-20 18:28:21', 0);
INSERT INTO `t_cooperation_company` VALUES (9, 1, 2, '布草商家1', '江西赣州', '布草商家1', '455-5545', '15679712351', '布草商家1', '2018-01-20 18:29:14', 0);
INSERT INTO `t_cooperation_company` VALUES (10, 1, -1, '轻松', '轻松轻松轻松', '轻松', '5656-656', '19679762058', '轻松轻松轻松轻松', '2018-01-20 18:37:51', 0);
INSERT INTO `t_cooperation_company` VALUES (11, 1, -1, '阿萨德1', '江西赣州', '阿萨德1', '500-200-00', '18370940766', '阿萨德', '2018-01-20 18:44:46', 0);
INSERT INTO `t_cooperation_company` VALUES (12, 1, 4, '三大范式', '江西赣州', '三大范式', '500-100', '15679705110', '江西赣州', '2018-01-20 18:46:04', 0);
INSERT INTO `t_cooperation_company` VALUES (13, 1, -1, '人', '赣州', '15679763333', '15679763333', '15679763333', '', '2018-02-10 14:36:07', 0);

-- ----------------------------
-- Table structure for t_cooperation_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_cooperation_subject`;
CREATE TABLE `t_cooperation_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` bigint(20) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cooperation_subject
-- ----------------------------
INSERT INTO `t_cooperation_subject` VALUES (1, '被单', '被单', '2017-11-30 22:13:11', 1, 0);
INSERT INTO `t_cooperation_subject` VALUES (2, '送客', '送客', '2017-12-10 21:30:49', 1, 0);

-- ----------------------------
-- Table structure for t_cooperation_website
-- ----------------------------
DROP TABLE IF EXISTS `t_cooperation_website`;
CREATE TABLE `t_cooperation_website`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `company_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cooperation_website
-- ----------------------------
INSERT INTO `t_cooperation_website` VALUES (1, '携程网', '携程网', '2017-11-15 12:40:19', 0, 1);
INSERT INTO `t_cooperation_website` VALUES (2, '途牛', '途牛', '2017-11-30 21:43:48', 0, 1);
INSERT INTO `t_cooperation_website` VALUES (3, '线下入住', '线下入住', '2017-12-10 21:25:13', 0, 1);
INSERT INTO `t_cooperation_website` VALUES (4, '去哪旅行', '去哪旅行', '2017-12-10 21:27:43', 0, 1);
INSERT INTO `t_cooperation_website` VALUES (5, '58同城', '', '2018-01-19 13:44:19', 0, 1);

-- ----------------------------
-- Table structure for t_customer_order
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_order`;
CREATE TABLE `t_customer_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `shop_manager_id` bigint(20) NOT NULL,
  `house_id` bigint(20) NOT NULL,
  `contract_id` bigint(20) NULL DEFAULT NULL,
  `customer_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_identity` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_gender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_from` tinyint(4) NULL DEFAULT NULL,
  `website_id` bigint(20) NULL DEFAULT NULL,
  `unit_price` decimal(18, 2) NULL DEFAULT NULL,
  `total_days` tinyint(4) NOT NULL,
  `house_pay` decimal(18, 2) NOT NULL,
  `service_pay` decimal(18, 2) NULL DEFAULT 0.00,
  `deposit` decimal(18, 2) NULL DEFAULT NULL,
  `total_pay` decimal(18, 2) NULL DEFAULT NULL,
  `actual_return` decimal(18, 2) NULL DEFAULT NULL,
  `payment_type_id` bigint(20) NOT NULL,
  `checkin_time` datetime(0) NOT NULL,
  `checkout_time` datetime(0) NOT NULL,
  `checkout_max_time` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_status` tinyint(4) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_check` tinyint(4) NOT NULL,
  `check_remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL,
  `hander` bigint(20) NULL DEFAULT NULL,
  `is_cash` tinyint(4) NULL DEFAULT 0,
  `other_hotel` bigint(20) NULL DEFAULT NULL,
  `other_hotel_money` decimal(10, 0) NULL DEFAULT NULL,
  `other_hotel_money_type` bigint(20) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  INDEX `shop_manager_id`(`shop_manager_id`) USING BTREE,
  INDEX `house_id`(`house_id`) USING BTREE,
  INDEX `contract_id`(`contract_id`) USING BTREE,
  INDEX `website_id`(`website_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_order
-- ----------------------------
INSERT INTO `t_customer_order` VALUES (1, 1, 2, 7, 2, 1, '张三', '36730199712200611', '15679760320', '男', 2, 1, 200.00, 2, 400.00, 0.00, 100.00, 500.00, 100.00, 1, '2017-12-07 21:36:21', '2017-12-09 21:36:23', '2017-12-09 21:36:24', '客户入住', 0, '2017-12-09 21:37:23', 0, '无误', 0, NULL, 0, NULL, NULL, NULL, 0, 0);
INSERT INTO `t_customer_order` VALUES (6, 1, 2, 7, 8, 1, '214', '1421', '14214', NULL, NULL, 1, NULL, 4, 800.00, NULL, NULL, 500.00, NULL, 1, '2017-12-15 21:50:57', '2017-12-19 21:50:57', NULL, '', 0, '2017-12-15 21:54:13', 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 0);
INSERT INTO `t_customer_order` VALUES (7, 1, 2, 7, 11, 1, '23424', '4242', '234242', NULL, NULL, 1, NULL, 4, 500.00, NULL, NULL, 500.00, NULL, -1, '2017-12-15 21:55:10', '2017-12-19 21:55:10', NULL, '入住', 0, '2017-12-15 21:59:40', 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 0);
INSERT INTO `t_customer_order` VALUES (9, 1, 2, 7, 15, 1, '23424', '4242', '234242', NULL, NULL, 1, NULL, 4, 500.00, NULL, NULL, 500.00, NULL, -1, '2017-12-15 21:55:10', '2017-12-19 21:55:10', NULL, '入住', 0, '2017-12-15 21:59:40', 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 0);
INSERT INTO `t_customer_order` VALUES (11, 1, 2, 7, 3, 1, '343434', '434343', '34343', NULL, NULL, 4, NULL, 4, 1000.00, NULL, NULL, NULL, NULL, -1, '2017-12-17 10:20:27', '2017-12-21 10:20:27', NULL, '43525', 0, '2017-12-17 10:24:54', 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 1, 0);
INSERT INTO `t_customer_order` VALUES (13, 1, 2, 7, 7, 1, '345345', '3535353', '345345', NULL, NULL, 1, NULL, 3, 800.00, NULL, NULL, NULL, NULL, -1, '2017-12-17 12:50:12', '2017-12-20 12:50:12', NULL, '订单入住', 0, '2017-12-17 12:50:45', 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 0);
INSERT INTO `t_customer_order` VALUES (16, 1, 2, 7, 4, 1, '4141', '12431241', '1414', NULL, NULL, 1, NULL, 2, 600.00, NULL, NULL, NULL, NULL, -1, '2017-12-19 22:30:21', '2017-12-21 22:30:21', NULL, 'aefdsf', 0, '2017-12-19 22:30:49', 1, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 0);
INSERT INTO `t_customer_order` VALUES (17, 1, 2, 7, 9, 1, '2324', '3535', '243', NULL, NULL, 1, NULL, 4, 1000.00, NULL, NULL, NULL, NULL, -1, '2017-12-22 20:30:38', '2017-12-26 20:30:38', NULL, '12345678', 0, '2017-12-22 20:33:27', 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 0);
INSERT INTO `t_customer_order` VALUES (18, 1, 2, 7, 2, 1, '商家送客', '1111111', '15679760321', NULL, NULL, 1, NULL, 4, 1200.00, NULL, NULL, NULL, NULL, 1, '2017-12-22 20:30:25', '2017-12-26 20:30:25', NULL, '商家送客', 0, '2017-12-22 20:37:41', 0, NULL, 0, NULL, 0, 4, NULL, NULL, 0, 1);
INSERT INTO `t_customer_order` VALUES (19, 1, 2, 7, 4, 1, '商家送客来了', '131313', '1321313', NULL, NULL, 1, NULL, 5, 14000.00, NULL, NULL, NULL, NULL, 3, '2017-12-22 20:55:09', '2017-12-27 20:55:09', NULL, '商家送客来了', 0, '2017-12-22 20:58:59', 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 1);
INSERT INTO `t_customer_order` VALUES (20, 1, 2, 7, 6, 1, '订单', '414131', '13131', NULL, NULL, 1, NULL, 5, 2000.00, NULL, NULL, NULL, NULL, 4, '2017-12-22 21:00:15', '2017-12-27 21:00:15', NULL, '', 0, '2017-12-22 21:04:12', 0, NULL, 0, NULL, 1, 4, 0, -1, 0, 1);

-- ----------------------------
-- Table structure for t_customer_order_ota
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_order_ota`;
CREATE TABLE `t_customer_order_ota`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `order_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hotel_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `house_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_time` datetime(0) NULL DEFAULT NULL,
  `customer_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website_id` bigint(20) NULL DEFAULT NULL,
  `unit_price` decimal(18, 2) NULL DEFAULT NULL,
  `total_days` tinyint(4) NOT NULL,
  `total_pay` decimal(18, 2) NOT NULL,
  `ota_commission` decimal(18, 2) NULL DEFAULT NULL,
  `actual_money` decimal(18, 2) NULL DEFAULT NULL,
  `checkin_time` datetime(0) NULL DEFAULT NULL,
  `checkout_time` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer_order_ota
-- ----------------------------
INSERT INTO `t_customer_order_ota` VALUES (1, 1, '20180101', '酒店1', '房间1', '2018-01-01 00:00:00', '小明', '携程网', NULL, NULL, 1, 200.00, 0.00, 200.00, '2018-01-02 00:00:00', '2018-01-03 00:00:00', NULL, '2018-01-09 11:45:52', 0);
INSERT INTO `t_customer_order_ota` VALUES (2, 1, '20180101', '酒店2', '房间2', '2018-01-01 00:00:00', '小华', '去哪儿网', NULL, NULL, 2, 400.00, 0.00, 400.00, '2018-01-03 00:00:00', '2018-01-05 00:00:00', NULL, '2018-01-09 11:45:52', 0);
INSERT INTO `t_customer_order_ota` VALUES (3, 1, '20180101', '酒店1', '房间1', '2018-01-01 00:00:00', '小明', '携程网', NULL, NULL, 1, 200.00, 0.00, 200.00, '2018-01-02 00:00:00', '2018-01-03 00:00:00', NULL, '2018-01-09 12:51:01', 0);
INSERT INTO `t_customer_order_ota` VALUES (4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, '2018-01-09 12:51:01', 0);
INSERT INTO `t_customer_order_ota` VALUES (5, 1, '20180101', '酒店2', '房间2', '2018-01-01 00:00:00', '小华', '去哪儿网', NULL, NULL, 2, 400.00, 0.00, 400.00, '2018-01-03 00:00:00', '2018-01-05 00:00:00', NULL, '2018-01-09 12:51:01', 0);

-- ----------------------------
-- Table structure for t_customer_service
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_service`;
CREATE TABLE `t_customer_service`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `house_id` bigint(20) NULL DEFAULT NULL,
  `house_card_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `account_type` tinyint(4) NOT NULL,
  `account_time` datetime(0) NOT NULL,
  `total_pay` decimal(18, 2) NOT NULL,
  `is_pay` tinyint(4) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_check` tinyint(4) NOT NULL,
  `check_remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  INDEX `house_id`(`house_id`) USING BTREE,
  INDEX `subject_id`(`subject_id`) USING BTREE,
  INDEX `hotel_id`(`hotel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NULL DEFAULT NULL,
  `hotel_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `employee_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES (17, 1, 2, 7, 27);
INSERT INTO `t_employee` VALUES (18, 1, 2, 7, 28);
INSERT INTO `t_employee` VALUES (19, 1, -1, 6, 29);
INSERT INTO `t_employee` VALUES (20, 1, -1, 6, 30);

-- ----------------------------
-- Table structure for t_hotel
-- ----------------------------
DROP TABLE IF EXISTS `t_hotel`;
CREATE TABLE `t_hotel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_manager_id` bigint(20) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `provice` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `town` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `t_hotel_title_uindex`(`title`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  INDEX `hotel_manager_id`(`hotel_manager_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hotel
-- ----------------------------
INSERT INTO `t_hotel` VALUES (2, 1, 7, '红古轩酒店', '15679760322', '2017-11-21 20:56:03', 0, '河北省', '石家庄市', '长安区', '河北省唐山市路北区');
INSERT INTO `t_hotel` VALUES (4, 1, 7, '800', '800-800-800', '2017-11-21 22:18:47', 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_hotel_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_hotel_employee`;
CREATE TABLE `t_hotel_employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  INDEX `hotel_id`(`hotel_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_hotel_type
-- ----------------------------
DROP TABLE IF EXISTS `t_hotel_type`;
CREATE TABLE `t_hotel_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_active` tinyint(4) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hotel_type
-- ----------------------------
INSERT INTO `t_hotel_type` VALUES (10, '特价大床', '特价大床', 0, '2018-03-19 11:25:28');
INSERT INTO `t_hotel_type` VALUES (11, '城景大床', '城景大床', 0, '2018-03-19 11:28:37');
INSERT INTO `t_hotel_type` VALUES (12, '城景双床', '城景双床', 0, '2018-03-19 11:28:37');
INSERT INTO `t_hotel_type` VALUES (13, '海景大床', '海景大床', 0, '2018-03-19 11:28:38');
INSERT INTO `t_hotel_type` VALUES (14, '海景双床', '海景双床', 0, '2018-03-19 11:28:38');
INSERT INTO `t_hotel_type` VALUES (15, '城景套房', '城景套房', 0, '2018-03-19 11:28:38');
INSERT INTO `t_hotel_type` VALUES (16, '海景套房', '海景套房', 0, '2018-03-19 11:28:38');

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hotel_id` bigint(20) NOT NULL,
  `house_status` tinyint(4) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `leave_time` datetime(0) NULL DEFAULT NULL,
  `company_id` bigint(20) NULL DEFAULT NULL,
  `house_type` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hotel_id`(`hotel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES (2, '101', 3, '大床房', 2, 1, '2017-11-23 22:36:29', 0, '2017-12-26 20:30:25', 1, 0);
INSERT INTO `t_house` VALUES (3, '111', 3, '大床房', 2, 1, '2017-11-26 15:42:15', 0, '2017-12-21 22:30:21', 1, 0);
INSERT INTO `t_house` VALUES (4, '112', 3, '大床房', 2, 1, '2017-11-26 15:42:15', 0, '2017-12-27 20:55:09', 1, 0);
INSERT INTO `t_house` VALUES (5, '113', 3, '大床房', 2, 1, '2017-11-26 16:51:00', 0, '2017-12-21 22:30:21', 1, 0);
INSERT INTO `t_house` VALUES (6, '114', 3, '大床房', 2, 1, '2017-11-26 16:51:00', 0, '2017-12-27 21:00:15', 1, 0);
INSERT INTO `t_house` VALUES (7, '106', 3, '大床房', 2, 0, '2017-11-26 16:52:10', 0, '2017-12-20 12:50:12', 1, 0);
INSERT INTO `t_house` VALUES (8, '109', 3, '大床房', 2, 0, '2017-11-26 16:59:09', 0, '2017-12-19 21:50:57', 1, 0);
INSERT INTO `t_house` VALUES (9, '220', 3, '大床房', 2, 0, '2017-11-26 16:59:09', 0, '2017-12-26 20:30:38', 1, 0);
INSERT INTO `t_house` VALUES (10, '201', 3, '大床房', 4, 0, '2017-11-26 17:05:15', 0, '2017-12-21 22:30:21', 1, 0);
INSERT INTO `t_house` VALUES (11, '202', 3, '大床房', 2, 0, '2017-11-26 17:05:15', 0, '2017-12-22 20:34:13', 1, 0);
INSERT INTO `t_house` VALUES (12, '103', 3, '大床房', 2, 1, '2017-11-26 18:11:06', 0, '2017-12-21 22:30:21', 1, 0);
INSERT INTO `t_house` VALUES (13, '102', 3, '大床房', 2, 0, '2017-11-26 18:11:06', 0, '2017-12-21 22:30:21', 1, 0);
INSERT INTO `t_house` VALUES (14, '108', 3, '大床房', 2, 0, '2017-11-29 23:02:17', 0, '2017-12-21 22:30:21', 1, 0);
INSERT INTO `t_house` VALUES (15, '107', 3, '大床房', 2, 0, '2017-11-29 23:02:17', 0, '2017-12-19 21:55:10', 1, 0);
INSERT INTO `t_house` VALUES (16, '101', 4, '天鼎酒店', 5, 0, '2018-01-14 21:07:23', 0, NULL, 1, 0);
INSERT INTO `t_house` VALUES (17, '102', 4, '天鼎酒店', 5, 0, '2018-01-14 21:07:23', 0, NULL, 1, 0);
INSERT INTO `t_house` VALUES (18, '103', 4, '天鼎酒店', 5, 0, '2018-01-14 21:07:24', 0, NULL, 1, 0);
INSERT INTO `t_house` VALUES (19, '104', 4, '天鼎酒店', 5, 0, '2018-01-14 21:07:25', 0, NULL, 1, 0);
INSERT INTO `t_house` VALUES (20, '202', 4, '202', 4, 0, '2018-01-14 21:45:00', 0, NULL, 1, 0);
INSERT INTO `t_house` VALUES (21, '610', 9, '暗示法发顺丰', 8, 0, '2018-01-15 13:01:12', 0, NULL, 1, 0);
INSERT INTO `t_house` VALUES (22, '815', 13, '而玩儿玩儿玩儿', 8, 0, '2018-01-15 13:02:23', 0, NULL, 1, 0);
INSERT INTO `t_house` VALUES (23, '930', 13, '而玩儿玩儿玩儿', 8, 0, '2018-01-15 13:02:23', 0, NULL, 1, 0);
INSERT INTO `t_house` VALUES (24, '1018', 13, '而玩儿玩儿玩儿', 8, 0, '2018-01-15 13:02:23', 0, NULL, 1, 0);
INSERT INTO `t_house` VALUES (25, '1008', 13, '而玩儿玩儿玩儿', 8, 0, '2018-01-15 13:02:23', 0, NULL, 1, 0);
INSERT INTO `t_house` VALUES (26, '610', 14, '1123123123', 2, 0, '2018-01-15 14:45:54', 1, NULL, 1, 0);
INSERT INTO `t_house` VALUES (27, '815', 14, '1123123123', 2, 0, '2018-01-15 14:45:54', 1, NULL, 1, 0);

-- ----------------------------
-- Table structure for t_house_fact_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_house_fact_pay`;
CREATE TABLE `t_house_fact_pay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '房租缴纳费用',
  `house_rent_id` bigint(20) NOT NULL COMMENT '房租id',
  `pay_money` double NOT NULL COMMENT '支付金额',
  `create_time` datetime(0) NOT NULL COMMENT '支付时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `company_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_house_fact_pay
-- ----------------------------
INSERT INTO `t_house_fact_pay` VALUES (1, 42, 4000, '2018-04-10 21:03:55', 0, 1);

-- ----------------------------
-- Table structure for t_house_fact_pay_copy
-- ----------------------------
DROP TABLE IF EXISTS `t_house_fact_pay_copy`;
CREATE TABLE `t_house_fact_pay_copy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '房租缴纳费用',
  `house_rent_id` bigint(20) NOT NULL COMMENT '房租id',
  `pay_money` double NOT NULL COMMENT '支付金额',
  `create_time` datetime(0) NOT NULL COMMENT '支付时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `company_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_house_fact_pay_copy
-- ----------------------------
INSERT INTO `t_house_fact_pay_copy` VALUES (1, 24, 500, '2018-01-03 20:13:13', 0, 1);
INSERT INTO `t_house_fact_pay_copy` VALUES (2, 24, 500, '2018-01-03 20:14:59', 0, 1);
INSERT INTO `t_house_fact_pay_copy` VALUES (3, 24, 500, '2018-01-03 20:15:37', 0, 1);
INSERT INTO `t_house_fact_pay_copy` VALUES (4, 24, 500, '2018-01-03 20:16:58', 0, 1);

-- ----------------------------
-- Table structure for t_house_others_item
-- ----------------------------
DROP TABLE IF EXISTS `t_house_others_item`;
CREATE TABLE `t_house_others_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NULL DEFAULT NULL,
  `hotel_id` bigint(20) NULL DEFAULT NULL,
  `house_id` bigint(20) NULL DEFAULT NULL,
  `item_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_money` decimal(10, 0) NULL DEFAULT NULL,
  `pay_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `is_cash` tinyint(4) NULL DEFAULT NULL,
  `hander` bigint(20) NULL DEFAULT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_house_others_item
-- ----------------------------
INSERT INTO `t_house_others_item` VALUES (1, 1, 2, 2, '5', 100, '2017-12-17 15:08:03', 0, NULL, '已结算', '2017-12-24 18:48:17');
INSERT INTO `t_house_others_item` VALUES (2, 1, 2, 2, '5', 100, '2017-12-17 15:08:06', 0, NULL, '已结算', '2017-12-24 18:48:17');
INSERT INTO `t_house_others_item` VALUES (3, 1, 2, 2, '5', 100, '2017-12-17 15:08:06', 0, NULL, '已结算', '2017-12-24 18:48:17');
INSERT INTO `t_house_others_item` VALUES (4, 1, 2, 2, '5', 211, '2017-12-17 15:08:07', 0, NULL, '1231', '2017-12-24 18:48:17');
INSERT INTO `t_house_others_item` VALUES (5, 1, 2, 6, '5', 100, '2017-12-24 20:23:46', 0, NULL, '123456', '2017-12-24 20:23:46');
INSERT INTO `t_house_others_item` VALUES (6, 1, 2, 6, '4', 300, '2017-12-24 20:35:56', 1, NULL, '旅游包车', '2017-12-24 20:35:56');

-- ----------------------------
-- Table structure for t_house_rent_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_house_rent_pay`;
CREATE TABLE `t_house_rent_pay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `master_id` bigint(20) NULL DEFAULT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `baodi_pay` decimal(18, 2) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `pay_type` int(11) NOT NULL,
  `pay_period_start` date NOT NULL,
  `pay_period_end` date NOT NULL,
  `is_cash` int(11) NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `house_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_pay` double NULL DEFAULT NULL,
  `first_pay_time` date NULL DEFAULT NULL,
  `sum_pay` double(255, 0) NULL DEFAULT NULL,
  `area` double(255, 0) NULL DEFAULT NULL,
  `house_count` int(255) NULL DEFAULT NULL,
  `shuidian` int(255) NULL DEFAULT NULL,
  `kongtiao` int(255) NULL DEFAULT NULL,
  `gongnuan` int(255) NULL DEFAULT NULL,
  `wuye` double(255, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `pay_time`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  INDEX `hotel_id`(`hotel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_house_rent_pay
-- ----------------------------
INSERT INTO `t_house_rent_pay` VALUES (1, 1, 2, 1, 60000.00, 1, 3, '2017-12-24', '2020-12-24', 0, '3年房租', '2017-12-24 21:29:11', 0, '2', 833.33, '2017-12-24', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (2, 1, 2, 1, 60000.00, 1, 3, '2017-12-24', '2020-12-24', 0, '3年房租', '2017-12-24 21:29:11', 0, '2', 1666.66, '2018-12-24', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (3, 1, 2, 1, 60000.00, 1, 3, '2017-12-24', '2020-12-24', 0, '3年房租', '2017-12-24 21:29:11', 0, '2', 2500, '2019-12-24', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (4, 1, 2, 1, 60000.00, 1, 3, '2017-12-24', '2020-12-24', 0, '3年房租', '2017-12-24 21:29:11', 0, '2', 833.33, '2017-12-24', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (5, 1, 2, 1, 60000.00, 1, 3, '2017-12-24', '2020-12-24', 0, '3年房租', '2017-12-24 21:29:11', 0, '2', 1666.66, '2018-12-24', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (6, 1, 2, 1, 60000.00, 1, 3, '2017-12-24', '2020-12-24', 0, '3年房租', '2017-12-24 21:29:11', 0, '2', 2500, '2019-12-24', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (7, 1, 4, 1, 60000.00, 1, 3, '2017-12-24', '2020-12-24', 0, '3年房租', '2017-12-24 21:29:11', 0, '2', 833.33, '2017-12-24', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (8, 1, 4, 1, 60000.00, 1, 3, '2017-12-24', '2020-12-24', 0, '3年房租', '2017-12-24 21:29:11', 0, '2', 1666.66, '2018-12-24', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (9, 1, 4, 1, 60000.00, 1, 3, '2017-12-24', '2020-12-24', 0, '3年房租', '2017-12-24 21:29:11', 0, '2', 2500, '2019-12-24', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (10, 1, 4, 1, 60000.00, 1, 3, '2017-12-24', '2020-12-24', 0, '3年房租', '2017-12-24 21:29:11', 0, '2', 833.33, '2017-12-24', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (11, 1, 4, 1, 60000.00, 1, 3, '2017-12-24', '2020-12-24', 0, '3年房租', '2017-12-24 21:29:11', 0, '2', 1666.66, '2018-12-24', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (12, 1, 4, 1, 60000.00, 1, 3, '2017-12-24', '2020-12-24', 0, '3年房租', '2017-12-24 21:29:11', 0, '2', 2500, '2019-12-24', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (19, 1, 2, 1, 60000.00, 1, 2, '2018-01-01', '2021-01-01', 0, 'A105房租详细', '2018-01-01 13:31:46', 0, '2', 1666.6666666666667, '2018-01-01', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (20, 1, 2, 1, 60000.00, 1, 2, '2018-01-01', '2021-01-01', 0, 'A105房租详细', '2018-01-01 13:31:46', 0, '2', 3333.3333333333335, '2018-01-01', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (21, 1, 2, 1, 60000.00, 1, 2, '2018-01-01', '2021-01-01', 0, 'A105房租详细', '2018-01-01 13:31:46', 0, '2', 5000, '2018-01-01', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (22, 1, 2, 1, 60000.00, 1, 2, '2018-01-01', '2021-01-01', 0, 'A106房间明细', '2018-01-01 14:24:26', 0, '2', 1666.6666666666667, '2018-01-01', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (23, 1, 2, 1, 60000.00, 1, 2, '2018-01-01', '2021-01-01', 0, 'A106房间明细', '2018-01-01 14:24:26', 0, '2', 3333.3333333333335, '2018-01-01', 0, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (24, 1, 2, 1, 60000.00, 1, 2, '2018-01-01', '2021-01-01', 0, 'A106房间明细', '2018-01-01 14:24:26', 0, '2', 500, '2018-01-01', 5, 30, 2, 0, 0, 0, 0);
INSERT INTO `t_house_rent_pay` VALUES (25, 1, 2, 1, 2000.00, 3, 2, '2018-01-04', '2021-01-04', 0, '1120', '2018-01-04 21:16:34', 0, '9', NULL, '2018-01-04', 0, 20, 2, 0, 0, 0, 20);

-- ----------------------------
-- Table structure for t_house_type
-- ----------------------------
DROP TABLE IF EXISTS `t_house_type`;
CREATE TABLE `t_house_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `price` double NULL DEFAULT 0,
  `hotel_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_house_type
-- ----------------------------
INSERT INTO `t_house_type` VALUES (14, '御筑大床房', '御筑大床房', '2018-01-15 14:38:48', 0, 1, 800, 2);
INSERT INTO `t_house_type` VALUES (16, '800', '800酒店', '2018-01-15 19:13:30', 1, 1, 800, 2);
INSERT INTO `t_house_type` VALUES (17, '总统套房', '总统套房', '2018-01-17 19:35:33', 0, 1, 500, 2);
INSERT INTO `t_house_type` VALUES (19, '总统套房', '总统套房', '2018-01-24 11:57:45', 0, 1, 800, 4);

-- ----------------------------
-- Table structure for t_leave
-- ----------------------------
DROP TABLE IF EXISTS `t_leave`;
CREATE TABLE `t_leave`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `hotel_manager_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `total_days` tinyint(4) NOT NULL,
  `reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `is_check` tinyint(4) NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_leave
-- ----------------------------
INSERT INTO `t_leave` VALUES (1, 1, -1, 6, 6, 3, '回家相亲', '2017-12-17 16:05:39', '2017-12-17 12:51:14', 1, 0, '');
INSERT INTO `t_leave` VALUES (2, 1, -1, 7, 7, 4, 'eee', '2017-12-17 15:21:10', '2017-12-17 15:21:10', 1, 1, '审核通过');

-- ----------------------------
-- Table structure for t_module
-- ----------------------------
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_payment_type
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_type`;
CREATE TABLE `t_payment_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `company_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_payment_type
-- ----------------------------
INSERT INTO `t_payment_type` VALUES (1, '支付宝', '支付宝支付', '2018-01-17 20:09:24', 0, 1);
INSERT INTO `t_payment_type` VALUES (2, '微信', '微信支付', '2018-01-17 20:09:33', 0, 1);
INSERT INTO `t_payment_type` VALUES (3, '银联', '银联支付', '2018-01-17 20:09:45', 0, 1);
INSERT INTO `t_payment_type` VALUES (4, '现金', '现金支付', '2018-01-17 20:09:58', 0, 1);
INSERT INTO `t_payment_type` VALUES (5, '通联', '通联支付', '2018-01-19 13:56:13', 0, 1);

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_id` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permission`(`permission`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_price_item
-- ----------------------------
DROP TABLE IF EXISTS `t_price_item`;
CREATE TABLE `t_price_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessman_id` bigint(20) NULL DEFAULT NULL,
  `hotel_type_id` bigint(20) NULL DEFAULT NULL,
  `price` bigint(20) NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `is_active` tinyint(4) NULL DEFAULT NULL,
  `create_time` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 212 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_price_item
-- ----------------------------
INSERT INTO `t_price_item` VALUES (170, 41, 10, 140, 0, 0, '2018-03-27');
INSERT INTO `t_price_item` VALUES (171, 41, 11, 160, 0, 0, '2018-03-27');
INSERT INTO `t_price_item` VALUES (172, 41, 12, 185, 0, 0, '2018-03-27');
INSERT INTO `t_price_item` VALUES (173, 41, 13, 190, 0, 0, '2018-03-27');
INSERT INTO `t_price_item` VALUES (174, 41, 14, 220, 2, 0, '2018-03-27');
INSERT INTO `t_price_item` VALUES (175, 41, 10, 140, 1, 0, '2018-03-26');
INSERT INTO `t_price_item` VALUES (176, 41, 11, 200, 0, 0, '2018-03-26');
INSERT INTO `t_price_item` VALUES (177, 41, 12, 220, 0, 0, '2018-03-26');
INSERT INTO `t_price_item` VALUES (178, 41, 13, 240, 0, 0, '2018-03-26');
INSERT INTO `t_price_item` VALUES (179, 41, 14, 260, 0, 0, '2018-03-26');
INSERT INTO `t_price_item` VALUES (183, 50, 10, 170, 1, 0, '2018-03-27');
INSERT INTO `t_price_item` VALUES (184, 50, 10, 170, 1, 0, '2018-03-28');
INSERT INTO `t_price_item` VALUES (187, 41, 12, 100, 6, 0, '2018-03-28');
INSERT INTO `t_price_item` VALUES (188, 41, 13, 150, 1, 0, '2018-03-28');
INSERT INTO `t_price_item` VALUES (189, 41, 14, 180, 3, 0, '2018-03-28');
INSERT INTO `t_price_item` VALUES (190, 66, 14, 180, 2, 0, '2018-03-27');
INSERT INTO `t_price_item` VALUES (191, 66, 14, 180, 2, 0, '2018-03-28');
INSERT INTO `t_price_item` VALUES (194, 45, 13, 100, 0, 0, '2018-03-27');
INSERT INTO `t_price_item` VALUES (196, 41, 11, 90, 1, 0, '2018-03-28');
INSERT INTO `t_price_item` VALUES (197, 66, 11, 100, 2, 0, '2018-03-28');
INSERT INTO `t_price_item` VALUES (198, 66, 11, 100, 2, 0, '2018-03-29');
INSERT INTO `t_price_item` VALUES (199, 66, 12, 130, 2, 0, '2018-03-28');
INSERT INTO `t_price_item` VALUES (200, 66, 12, 130, 2, 0, '2018-03-29');
INSERT INTO `t_price_item` VALUES (201, 66, 13, 160, 2, 0, '2018-03-28');
INSERT INTO `t_price_item` VALUES (202, 66, 13, 160, 2, 0, '2018-03-29');
INSERT INTO `t_price_item` VALUES (203, 66, 14, 180, 2, 0, '2018-03-29');
INSERT INTO `t_price_item` VALUES (208, 66, 10, 260, 1, 0, '2018-03-30');
INSERT INTO `t_price_item` VALUES (209, 66, 10, 260, 1, 0, '2018-03-31');
INSERT INTO `t_price_item` VALUES (210, 66, 11, 280, 1, 0, '2018-03-30');
INSERT INTO `t_price_item` VALUES (211, 66, 11, 280, 1, 0, '2018-03-31');

-- ----------------------------
-- Table structure for t_process
-- ----------------------------
DROP TABLE IF EXISTS `t_process`;
CREATE TABLE `t_process`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deploy` tinyint(4) NOT NULL,
  `deploy_time` datetime(0) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_rent_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_rent_pay`;
CREATE TABLE `t_rent_pay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `master_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `total_pay` decimal(18, 2) NOT NULL,
  `fact_pay_time_start` date NULL DEFAULT NULL,
  `fact_pay_time_end` date NULL DEFAULT NULL,
  `facted_pay_time_end` date NULL DEFAULT NULL,
  `facted_pay_time_start` date NULL DEFAULT NULL,
  `fact_pay` double(255, 0) NULL DEFAULT NULL,
  `pay_count` int(255) NULL DEFAULT NULL,
  `pay_time` int(11) NOT NULL,
  `pay_type` int(11) NOT NULL,
  `spare_money` double(255, 0) NULL DEFAULT NULL,
  `pay_fact_time` int(11) NULL DEFAULT NULL,
  `pay_period_start` date NOT NULL,
  `pay_period_end` date NOT NULL,
  `is_cash` int(11) NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `house_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_pay` double NULL DEFAULT NULL,
  `first_pay_time` date NULL DEFAULT NULL,
  `sum_pay` double(255, 0) NULL DEFAULT NULL,
  `day_pay` double(255, 0) NULL DEFAULT NULL,
  `month_pay` double(255, 0) NULL DEFAULT NULL,
  `area` double(255, 0) NULL DEFAULT NULL,
  `house_count` int(255) NULL DEFAULT NULL,
  `shuidian` int(255) NULL DEFAULT NULL,
  `kongtiao` int(255) NULL DEFAULT NULL,
  `gongnuan` int(255) NULL DEFAULT NULL,
  `wuye` double(255, 0) NULL DEFAULT NULL,
  `yajin` double(255, 0) NULL DEFAULT NULL,
  `bucaofei` double(255, 0) NULL DEFAULT NULL,
  `buzhiqi` int(255) NULL DEFAULT NULL,
  `nid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zhuangxiu` int(255) NULL DEFAULT NULL,
  `qixian` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `master_id`(`master_id`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE,
  INDEX `hotel_id`(`hotel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_rent_pay
-- ----------------------------
INSERT INTO `t_rent_pay` VALUES (42, 1, 2, 1, 12000.00, '2018-01-01', '2019-01-01', '2018-06-01', '2018-08-01', 12000, 8, 1, 1, 8000, 1, '2018-01-01', '2019-01-01', 0, '暂无说明', '2018-03-05 14:28:02', 0, 'A101', 1000, '2018-01-01', 4000, 33, 1000, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '4f3b5b9b-b200-4fda-9c07-0dbde01d3594', 0, '2018-01-01,2018-02-01,2018-03-01,2018-04-01,2018-05-01,2018-06-01,2018-07-01,2018-08-01,2018-09-01,2018-10-01,2018-11-01,2018-12-01');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '总管理员', '总管理员', '2017-11-15 12:39:18', 0);
INSERT INTO `t_role` VALUES (2, '店长', '店长', '2017-11-15 12:41:53', 0);
INSERT INTO `t_role` VALUES (3, '录入员', '录入员', '2017-11-15 12:42:01', 0);
INSERT INTO `t_role` VALUES (5, '审核员', '审核员', '2017-11-27 22:26:53', 0);
INSERT INTO `t_role` VALUES (6, '管理员', '管理员', '2018-01-16 20:25:33', 0);
INSERT INTO `t_role` VALUES (7, '酒店审核员', '酒店审核员', '2018-01-16 20:54:00', 0);
INSERT INTO `t_role` VALUES (8, '酒店录入员', '酒店录入员', '2018-01-17 21:20:30', 0);

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `permission_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_service_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_service_subject`;
CREATE TABLE `t_service_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  `company_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_service_subject
-- ----------------------------
INSERT INTO `t_service_subject` VALUES (1, '旅游', '旅游增值科目', '2018-01-17 20:29:19', 0, 1);
INSERT INTO `t_service_subject` VALUES (2, '包车', '包车增值科目', '2018-01-17 20:29:29', 0, 1);
INSERT INTO `t_service_subject` VALUES (3, '饮料消费', '饮料消费增值科目', '2018-01-17 20:29:46', 0, 1);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` tinyint(4) NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wechat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alipay` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq_openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weibo_openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wechat_openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `headicon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` bigint(20) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `account_name`(`account_name`) USING BTREE,
  UNIQUE INDEX `qq_openid`(`qq_openid`) USING BTREE,
  UNIQUE INDEX `weibo_openid`(`weibo_openid`) USING BTREE,
  UNIQUE INDEX `wechat_openid`(`wechat_openid`) USING BTREE,
  INDEX `company_id`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (6, '275300091@qq.com', '15679760329', 'admin', '96e79218965eb72c92a549dd5a330112', 'admin', '360706199712200618', 'admin', 0, '2017-11-26', 21, '江西赣州章贡区宁都县', '275300091', 'xljx_888888', NULL, NULL, NULL, NULL, '/upload/2746988592911.jpg', NULL, '2017-11-15 12:45:01', 1, 0);
INSERT INTO `t_user` VALUES (7, '275300090@qq.com', '15679760321', NULL, '96e79218965eb72c92a549dd5a330112', '15679760321', '360730199712200617', '惊鸿', 0, '2017-11-26', 21, '江西赣州章贡区', '275300091', 'xljx#_888888', NULL, NULL, NULL, NULL, 'static/img/face.gif', NULL, '2017-11-21 21:02:57', 1, 0);
INSERT INTO `t_user` VALUES (27, NULL, '15679760323', NULL, '96e79218965eb72c92a549dd5a330112', '15679760323', '11111111111', '酒店审核员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'static/img/face.gif', NULL, '2018-01-17 21:37:11', 1, 0);
INSERT INTO `t_user` VALUES (28, NULL, '15679760324', NULL, '96e79218965eb72c92a549dd5a330112', '15679760324', '111111111', '酒店录入员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'static/img/face.gif', NULL, '2018-01-17 21:37:45', 1, 0);
INSERT INTO `t_user` VALUES (29, NULL, '15679760325', NULL, '96e79218965eb72c92a549dd5a330112', '15679760325', '11111111', '录入员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'static/img/face.gif', NULL, '2018-01-17 21:39:36', 1, 0);
INSERT INTO `t_user` VALUES (30, NULL, '15679760000', NULL, '96e79218965eb72c92a549dd5a330112', '15679760000', '360730199712200666', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'static/img/face.gif', NULL, '2018-02-06 20:00:14', 1, 0);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 6, 1, '2017-11-15 12:45:01', 0);
INSERT INTO `t_user_role` VALUES (2, 7, 2, '2017-11-21 21:02:57', 0);
INSERT INTO `t_user_role` VALUES (19, 27, 7, '2018-01-17 21:37:11', 0);
INSERT INTO `t_user_role` VALUES (20, 28, 8, '2018-01-17 21:37:45', 0);
INSERT INTO `t_user_role` VALUES (21, 29, 3, '2018-01-17 21:39:36', 0);
INSERT INTO `t_user_role` VALUES (22, 30, 6, '2018-02-06 20:00:14', 0);

-- ----------------------------
-- Table structure for t_verifcode
-- ----------------------------
DROP TABLE IF EXISTS `t_verifcode`;
CREATE TABLE `t_verifcode`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '验证码',
  `msg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `addtime` datetime(0) NOT NULL COMMENT '添加时间',
  `status` int(11) NULL DEFAULT 0 COMMENT '短信状态',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_verifcode
-- ----------------------------
INSERT INTO `t_verifcode` VALUES (41, '18370940755', '985219', '【瑞蓝酒店】注册验证码，你的验证码是：985219', '2018-03-19 11:57:14', 0, '2018-03-19 11:52:14');
INSERT INTO `t_verifcode` VALUES (42, '15563906390', '702435', '【瑞蓝酒店】注册验证码，你的验证码是：702435', '2018-03-19 12:17:41', 1, '2018-03-19 12:12:41');
INSERT INTO `t_verifcode` VALUES (43, '18370940755', '330411', '【瑞蓝酒店】注册验证码，你的验证码是：330411', '2018-03-19 13:06:20', 0, '2018-03-19 13:01:20');
INSERT INTO `t_verifcode` VALUES (44, '15563906390', '762188', '【瑞蓝酒店】注册验证码，你的验证码是：762188', '2018-03-19 13:38:53', 1, '2018-03-19 13:33:53');
INSERT INTO `t_verifcode` VALUES (45, '15563906390', '181000', '【瑞蓝酒店】找回密码，你的验证码是：181000', '2018-03-19 13:43:08', 1, '2018-03-19 13:38:08');
INSERT INTO `t_verifcode` VALUES (46, '13061324160', '723194', '【瑞蓝酒店】注册验证码，你的验证码是：723194', '2018-03-19 16:50:58', 1, '2018-03-19 16:45:58');
INSERT INTO `t_verifcode` VALUES (47, '13061324160', '188551', '【瑞蓝酒店】找回密码，你的验证码是：188551', '2018-03-19 17:02:26', 1, '2018-03-19 16:57:26');
INSERT INTO `t_verifcode` VALUES (48, '13061324160', '404486', '【瑞蓝酒店】注册验证码，你的验证码是：404486', '2018-03-19 20:01:52', 1, '2018-03-19 19:56:52');
INSERT INTO `t_verifcode` VALUES (49, '13861324160', '587746', '【瑞蓝酒店】注册验证码，你的验证码是：587746', '2018-03-19 20:05:05', 0, '2018-03-19 20:00:05');
INSERT INTO `t_verifcode` VALUES (50, '18370940755', '838898', '【瑞蓝酒店】注册验证码，你的验证码是：838898', '2018-03-19 20:45:28', 1, '2018-03-19 20:40:28');
INSERT INTO `t_verifcode` VALUES (51, '18370940755', '939746', '【瑞蓝酒店】注册验证码，你的验证码是：939746', '2018-03-19 20:49:12', 1, '2018-03-19 20:44:12');
INSERT INTO `t_verifcode` VALUES (52, '13061324160', '979883', '【瑞蓝酒店】注册验证码，你的验证码是：979883', '2018-03-19 20:49:21', 1, '2018-03-19 20:44:21');
INSERT INTO `t_verifcode` VALUES (53, '18661750395', '690105', '【瑞蓝酒店】注册验证码，你的验证码是：690105', '2018-03-20 13:36:44', 1, '2018-03-20 13:31:44');
INSERT INTO `t_verifcode` VALUES (54, '13255588997', '373967', '【瑞蓝酒店】注册验证码，你的验证码是：373967', '2018-03-23 14:28:49', 1, '2018-03-23 14:23:49');
INSERT INTO `t_verifcode` VALUES (55, '15563906390', '444220', '【瑞蓝酒店】找回密码，你的验证码是：444220', '2018-03-25 14:59:23', 1, '2018-03-25 14:54:23');
INSERT INTO `t_verifcode` VALUES (56, '15563906390', '493763', '【瑞蓝软件】找回密码，你的验证码是：493763', '2018-03-25 15:27:14', 1, '2018-03-25 15:22:14');
INSERT INTO `t_verifcode` VALUES (57, '15563906390', '926739', '【瑞蓝软件】找回密码，你的验证码是：926739', '2018-03-25 15:33:17', 1, '2018-03-25 15:28:17');
INSERT INTO `t_verifcode` VALUES (58, '13061324160', '821602', '【瑞蓝软件】注册验证码，你的验证码是：821602', '2018-03-25 16:31:24', 1, '2018-03-25 16:26:24');
INSERT INTO `t_verifcode` VALUES (59, '15563906390', '240553', '【瑞蓝软件】注册验证码，你的验证码是：240553', '2018-03-26 12:31:11', 1, '2018-03-26 12:26:11');
INSERT INTO `t_verifcode` VALUES (60, '13061324160', '453233', '【瑞蓝软件】注册验证码，你的验证码是：453233', '2018-03-26 14:42:24', 1, '2018-03-26 14:37:24');
INSERT INTO `t_verifcode` VALUES (61, '13061324160', '232136', '【瑞蓝软件】注册验证码，你的验证码是：232136，请妥善保管5分钟内有效。', '2018-03-26 16:01:01', 1, '2018-03-26 15:56:01');
INSERT INTO `t_verifcode` VALUES (62, '15563906390', '410729', '【瑞蓝软件】注册验证码，你的验证码是：410729，请妥善保管5分钟内有效。', '2018-03-26 19:38:43', 1, '2018-03-26 19:33:43');
INSERT INTO `t_verifcode` VALUES (63, '17663982567', '472256', '【瑞蓝软件】注册验证码，你的验证码是：472256，请妥善保管5分钟内有效。', '2018-03-26 22:02:04', 1, '2018-03-26 21:57:04');
INSERT INTO `t_verifcode` VALUES (64, '18661750395', '303323', '【瑞蓝软件】注册验证码，你的验证码是：303323，请妥善保管5分钟内有效。', '2018-03-26 22:21:48', 1, '2018-03-26 22:16:48');
INSERT INTO `t_verifcode` VALUES (65, '15732871261', '805133', '【瑞蓝软件】注册验证码，你的验证码是：805133，请妥善保管5分钟内有效。', '2018-03-27 15:40:49', 1, '2018-03-27 15:35:49');
INSERT INTO `t_verifcode` VALUES (66, '13964291753', '478305', '【瑞蓝软件】注册验证码，你的验证码是：478305，请妥善保管5分钟内有效。', '2018-03-27 15:41:59', 1, '2018-03-27 15:36:59');
INSERT INTO `t_verifcode` VALUES (67, '15762281999', '187900', '【瑞蓝软件】注册验证码，你的验证码是：187900，请妥善保管5分钟内有效。', '2018-03-27 15:42:55', 1, '2018-03-27 15:37:55');
INSERT INTO `t_verifcode` VALUES (68, '13905324650', '786375', '【瑞蓝软件】注册验证码，你的验证码是：786375，请妥善保管5分钟内有效。', '2018-03-27 15:43:08', 1, '2018-03-27 15:38:08');
INSERT INTO `t_verifcode` VALUES (69, '13964829703', '948691', '【瑞蓝软件】注册验证码，你的验证码是：948691，请妥善保管5分钟内有效。', '2018-03-27 15:43:29', 1, '2018-03-27 15:38:29');
INSERT INTO `t_verifcode` VALUES (70, '18660283586', '676065', '【瑞蓝软件】注册验证码，你的验证码是：676065，请妥善保管5分钟内有效。', '2018-03-27 15:50:33', 1, '2018-03-27 15:45:33');
INSERT INTO `t_verifcode` VALUES (71, '13255555858', '341977', '【瑞蓝软件】注册验证码，你的验证码是：341977，请妥善保管5分钟内有效。', '2018-03-27 15:57:25', 1, '2018-03-27 15:52:25');
INSERT INTO `t_verifcode` VALUES (72, '18210153568', '105167', '【瑞蓝软件】注册验证码，你的验证码是：105167，请妥善保管5分钟内有效。', '2018-03-27 16:00:24', 1, '2018-03-27 15:55:24');
INSERT INTO `t_verifcode` VALUES (73, '17663911222', '673800', '【瑞蓝软件】注册验证码，你的验证码是：673800，请妥善保管5分钟内有效。', '2018-03-27 16:12:43', 1, '2018-03-27 16:07:43');
INSERT INTO `t_verifcode` VALUES (74, '18253201000', '458356', '【瑞蓝软件】注册验证码，你的验证码是：458356，请妥善保管5分钟内有效。', '2018-03-27 17:18:44', 1, '2018-03-27 17:13:44');
INSERT INTO `t_verifcode` VALUES (75, '13255588997', '712402', '【瑞蓝软件】注册验证码，你的验证码是：712402，请妥善保管5分钟内有效。', '2018-03-27 17:46:03', 1, '2018-03-27 17:41:03');
INSERT INTO `t_verifcode` VALUES (76, '13953205332', '432629', '【瑞蓝软件】注册验证码，你的验证码是：432629，请妥善保管5分钟内有效。', '2018-03-27 17:55:18', 1, '2018-03-27 17:50:18');
INSERT INTO `t_verifcode` VALUES (77, '13361235830', '267515', '【瑞蓝软件】注册验证码，你的验证码是：267515，请妥善保管5分钟内有效。', '2018-03-27 18:20:09', 1, '2018-03-27 18:15:09');
INSERT INTO `t_verifcode` VALUES (78, '18953635456', '556838', '【瑞蓝软件】注册验证码，你的验证码是：556838，请妥善保管5分钟内有效。', '2018-03-27 18:25:44', 1, '2018-03-27 18:20:44');
INSERT INTO `t_verifcode` VALUES (79, '15315323788', '711881', '【瑞蓝软件】注册验证码，你的验证码是：711881，请妥善保管5分钟内有效。', '2018-03-27 18:33:49', 1, '2018-03-27 18:28:49');
INSERT INTO `t_verifcode` VALUES (80, '13256884777', '735699', '【瑞蓝软件】注册验证码，你的验证码是：735699，请妥善保管5分钟内有效。', '2018-03-27 18:34:21', 1, '2018-03-27 18:29:21');
INSERT INTO `t_verifcode` VALUES (81, '13061324160', '980628', '【瑞蓝软件】找回密码，你的验证码是：980628，请妥善保管5分钟内有效。', '2018-03-27 19:17:28', 0, '2018-03-27 19:12:28');

SET FOREIGN_KEY_CHECKS = 1;
