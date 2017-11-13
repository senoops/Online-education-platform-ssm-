/*
Navicat MySQL Data Transfer

Source Server         : s
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : course

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-11-04 15:56:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(200) NOT NULL COMMENT '课程名称',
  `courseDetail` varchar(200) DEFAULT NULL COMMENT '课程类型',
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'Python', 'Python');
INSERT INTO `course` VALUES ('2', 'Python入门', 'Python入门');
INSERT INTO `course` VALUES ('3', '1024设计', '1024设计');
INSERT INTO `course` VALUES ('4', 'Python爬虫', 'Python爬虫技巧');
INSERT INTO `course` VALUES ('5', 'java', 'java');
INSERT INTO `course` VALUES ('6', 'Python爬虫2', 'Python爬虫2');
INSERT INTO `course` VALUES ('7', 'mysql', '数据库');
INSERT INTO `course` VALUES ('8', 'c++', '吕鑫 c++');

-- ----------------------------
-- Table structure for selectedcourse
-- ----------------------------
DROP TABLE IF EXISTS `selectedcourse`;
CREATE TABLE `selectedcourse` (
  `courseID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  KEY `courseID` (`courseID`),
  KEY `studentID` (`userID`),
  CONSTRAINT `selectedcourse_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`),
  CONSTRAINT `selectedcourse_user_fk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of selectedcourse
-- ----------------------------
INSERT INTO `selectedcourse` VALUES ('2', '1');
INSERT INTO `selectedcourse` VALUES ('1', '1');
INSERT INTO `selectedcourse` VALUES ('1', '2');
INSERT INTO `selectedcourse` VALUES ('1', '3');
INSERT INTO `selectedcourse` VALUES ('2', '4');
INSERT INTO `selectedcourse` VALUES ('5', '5');
INSERT INTO `selectedcourse` VALUES ('6', '7');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `birth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123', '2016-12-26', 'male', '34343@qw.com');
INSERT INTO `user` VALUES ('2', '123', '123', '2017-03-21', 'male', '2132@123');
INSERT INTO `user` VALUES ('3', '123232', '123', '2017-03-06', 'male', 'trytyt@wqew');
INSERT INTO `user` VALUES ('4', 's', 's', '2017-10-03', 'Female', '1220489@qq.com');
INSERT INTO `user` VALUES ('5', 'ss', '5s', '2016-10-03', 'Male', '1220489@qq.com');
INSERT INTO `user` VALUES ('6', 'sss', 'sss', '2017-10-03', 'Female', '1220489@qq.com');
INSERT INTO `user` VALUES ('7', '少时诵诗书', 's', '2017-10-02', 'Female', '1220489@qq.com');
INSERT INTO `user` VALUES ('10', 'ssssss', 'sssssss', '2017-10-31', 'Female', '1220489@qq.com');
