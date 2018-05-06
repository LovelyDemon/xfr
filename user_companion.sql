/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : localhost:3306
 Source Schema         : zhly

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : 65001

 Date: 07/05/2018 00:28:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_companion
-- ----------------------------
DROP TABLE IF EXISTS `user_companion`;
CREATE TABLE `user_companion`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `companion_id` bigint(20) NOT NULL COMMENT 'companion表ID',
  `user_id` bigint(20) NOT NULL COMMENT 'user表ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
