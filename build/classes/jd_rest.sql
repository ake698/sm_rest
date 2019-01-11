/*
Navicat MySQL Data Transfer

Source Server         : winDB
Source Server Version : 80012
Source Host           : 127.0.0.1:3306
Source Database       : jd_rest

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-01-03 13:07:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `foodid` int(10) NOT NULL AUTO_INCREMENT,
  `foodname` varchar(40) DEFAULT NULL,
  `cost` int(10) DEFAULT NULL,
  PRIMARY KEY (`foodid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('16', '鸡公煲', '28');
INSERT INTO `food` VALUES ('17', '茄子煲', '18');
INSERT INTO `food` VALUES ('18', '鱼儿煲', '48');
INSERT INTO `food` VALUES ('19', '青菜煲', '16');
INSERT INTO `food` VALUES ('20', '排骨煲', '48');
INSERT INTO `food` VALUES ('21', '牛肉煲', '68');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `foods` varchar(100) NOT NULL,
  `money` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `order_user` (`userid`),
  CONSTRAINT `order_user` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('12', '排骨煲-48-1,青菜煲-16-1,鸡公煲-28-1,', '92', '11');
INSERT INTO `order` VALUES ('13', '排骨煲-48-1,鱼儿煲-48-1,茄子煲-18-1,', '114', '12');
INSERT INTO `order` VALUES ('14', '鸡公煲-28-1,', '28', '12');
INSERT INTO `order` VALUES ('15', '青菜煲-16-1,茄子煲-18-1,鸡公煲-28-1,', '62', '13');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userid` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('11', 'visitor', '3611698', '15874554596');
INSERT INTO `userinfo` VALUES ('12', 'test1', 'test1', '15876336549');
INSERT INTO `userinfo` VALUES ('13', 'abc', '123456', '15873664854');
