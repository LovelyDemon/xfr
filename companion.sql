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

 Date: 07/05/2018 00:28:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for companion
-- ----------------------------
DROP TABLE IF EXISTS `companion`;
CREATE TABLE `companion`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旅行地',
  `limit_num` int(11) NULL DEFAULT 1 COMMENT '限制人数',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '组队详情',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片URL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of companion
-- ----------------------------
INSERT INTO `companion` VALUES (2, '抚养费高压胶管i', '2018-04-03 00:00:00', '2018-04-26 00:00:00', '阿拉德大陆', 1, '13246579812', '不知道', NULL);
INSERT INTO `companion` VALUES (3, '哎哟喂', '2018-05-15 15:47:02', '2018-05-30 15:47:06', '广州', 10, '13652965291', '详细点', NULL);
INSERT INTO `companion` VALUES (4, '啥哟拉拉', '2018-05-01 15:47:51', '2018-05-31 15:47:54', '北京', 5, '18925654098', '真的烦', NULL);
INSERT INTO `companion` VALUES (5, '撒拉黑', '2018-05-16 15:48:36', '2018-05-27 15:48:39', '海南', 1, '15975325864', '来吧来吧哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', NULL);
INSERT INTO `companion` VALUES (6, '写一页啦', '2018-05-29 15:49:33', '2018-05-30 15:49:35', '日本', 10, '12398765417', '走', NULL);
INSERT INTO `companion` VALUES (7, '测试限制人数', '2018-05-01 00:00:00', '2018-05-31 00:00:00', '东京', 10, '15975345628', 'null', NULL);

SET FOREIGN_KEY_CHECKS = 1;
