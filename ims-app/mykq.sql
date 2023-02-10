/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : mykq

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 02/05/2022 17:03:02
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for e_dict
-- ----------------------------
DROP TABLE IF EXISTS `e_dict`;
CREATE TABLE `e_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKf5wwh5osfukkeebw7h2yb4kmp`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_dict
-- ----------------------------

-- ----------------------------
-- Table structure for e_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `e_dict_item`;
CREATE TABLE `e_dict_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `erupt_dict_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKl0kiq8otpn3fvtlvarebt8xkh`(`code`, `erupt_dict_id`) USING BTREE,
  INDEX `FKrrbi2dt94rjd8sjt830m3w0a`(`erupt_dict_id`) USING BTREE,
  CONSTRAINT `FKrrbi2dt94rjd8sjt830m3w0a` FOREIGN KEY (`erupt_dict_id`) REFERENCES `e_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_dict_item
-- ----------------------------

-- ----------------------------
-- Table structure for e_generator_class
-- ----------------------------
DROP TABLE IF EXISTS `e_generator_class`;
CREATE TABLE `e_generator_class`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_generator_class
-- ----------------------------
INSERT INTO `e_generator_class` VALUES (1, 'admin', '2022-04-22 23:01:51', 'admin', '2022-04-22 23:17:18', 'KcEntity', '课程表', '课程表', 'kc');
INSERT INTO `e_generator_class` VALUES (2, 'admin', '2022-04-22 23:09:29', 'admin', '2022-04-22 23:35:42', 'KcTeacherEntity', '教师课程表', '教师表与课程表关联（一个老师可以上多门课程）', 'kc_teacher');
INSERT INTO `e_generator_class` VALUES (3, 'admin', '2022-04-22 23:10:48', 'admin', '2022-04-22 23:10:48', 'KcDeptEntity', '学院表', '学院表', 'kc_dept');
INSERT INTO `e_generator_class` VALUES (4, 'admin', '2022-04-22 23:15:03', 'admin', '2022-04-25 21:14:09', 'KcSignPublishEntity', '课程签到发布', '课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到', 'kc_sign_puplish');
INSERT INTO `e_generator_class` VALUES (5, 'admin', '2022-04-22 23:20:52', 'admin', '2022-04-22 23:27:44', 'TeacherDeptEntity', '教师学院表', '教师表与学院表关联（一个老师可以在多个学院上课）', 'teacher_dept');
INSERT INTO `e_generator_class` VALUES (6, 'admin', '2022-04-22 23:22:10', 'admin', '2022-04-22 23:23:25', 'TeacherEntity', '教师表', '教师表', 'teacher');
INSERT INTO `e_generator_class` VALUES (7, 'admin', '2022-04-22 23:39:11', 'admin', '2022-04-23 18:34:43', 'SignRecordEntity', '签到记录表', '签到记录表---将展示的发布的签到信息记录到这张表', 'sign_record');
INSERT INTO `e_generator_class` VALUES (8, 'admin', '2022-04-22 23:41:28', 'admin', '2022-04-23 16:33:08', 'StudentEntity', '学生表', '学生表---小程序发起注册将信息注册到这张表', 'student');
INSERT INTO `e_generator_class` VALUES (9, 'admin', '2022-04-22 23:46:02', 'admin', '2022-04-23 18:13:50', 'MiniUserEntity', '小程序注册登陆表', '小程序注册登陆表，选择登录方式可以查看不同信息，选择不同身份查看不同信息，老师可以直观查看一些简单的统计信息，选择1是学生可以签到，查看自己的统计信息，选择教师的时候可以查看老师发布的签到统计', 'mini_user');
INSERT INTO `e_generator_class` VALUES (10, 'admin', '2022-04-23 13:48:02', 'admin', '2022-04-23 13:48:02', 'XcxTokenEntity', '小程序token记录表', '小程序token记录表', 'xcx_token');
INSERT INTO `e_generator_class` VALUES (11, 'admin', '2022-04-28 23:42:53', 'admin', '2022-04-28 23:45:44', 'TestEntity', '测试', NULL, 'test_table');
INSERT INTO `e_generator_class` VALUES (12, 'admin', '2022-05-01 22:23:05', 'admin', '2022-05-01 22:23:05', 'GradeEntity', '年级管理', '年级管理表', 'grade');

-- ----------------------------
-- Table structure for e_generator_field
-- ----------------------------
DROP TABLE IF EXISTS `e_generator_field`;
CREATE TABLE `e_generator_field`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_show` bit(1) NULL DEFAULT NULL,
  `link_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `not_null` bit(1) NULL DEFAULT NULL,
  `query` bit(1) NULL DEFAULT NULL,
  `show_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `sortable` bit(1) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKslwo9qwwfbgif9mbbhg072s4i`(`class_id`) USING BTREE,
  CONSTRAINT `FKslwo9qwwfbgif9mbbhg072s4i` FOREIGN KEY (`class_id`) REFERENCES `e_generator_class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_generator_field
-- ----------------------------
INSERT INTO `e_generator_field` VALUES (1, 'kc_id', b'1', NULL, b'1', b'1', '课程id', 1, b'0', 'INPUT', 1);
INSERT INTO `e_generator_field` VALUES (2, 'kc_name', b'1', NULL, b'1', b'1', '课程名称', 2, b'0', 'INPUT', 1);
INSERT INTO `e_generator_field` VALUES (3, 'kc_id', b'1', NULL, b'1', b'1', '课程Id', 1, b'0', 'CHOICE', 2);
INSERT INTO `e_generator_field` VALUES (4, 'teacher_id', b'1', NULL, b'1', b'1', '教师Id', 3, b'0', 'CHOICE', 2);
INSERT INTO `e_generator_field` VALUES (5, 'dept_id', b'1', NULL, b'1', b'1', '学院Id', 1, b'0', 'INPUT', 3);
INSERT INTO `e_generator_field` VALUES (6, 'dept_name', b'1', NULL, b'1', b'1', '学院名称', 2, b'0', 'INPUT', 3);
INSERT INTO `e_generator_field` VALUES (7, 'sign_id', b'1', NULL, b'1', b'1', '签到Id', 1, b'0', 'INPUT', 4);
INSERT INTO `e_generator_field` VALUES (8, 'sign_name', b'1', NULL, b'1', b'1', '签到名称', 2, b'0', 'INPUT', 4);
INSERT INTO `e_generator_field` VALUES (9, 'lat', b'1', NULL, b'1', b'1', '签到维度', 3, b'0', 'INPUT', 4);
INSERT INTO `e_generator_field` VALUES (10, 'lon', b'1', NULL, b'1', b'1', '签到经度', 4, b'0', 'INPUT', 4);
INSERT INTO `e_generator_field` VALUES (11, 'teacher_id', b'1', NULL, b'1', b'1', '签到老师Id', 5, b'0', 'CHOICE', 4);
INSERT INTO `e_generator_field` VALUES (12, 'kc_id', b'1', NULL, b'1', b'1', '课程Id', 6, b'0', 'CHOICE', 4);
INSERT INTO `e_generator_field` VALUES (13, 'sign_distance', b'1', NULL, b'1', b'1', '签到距离', 7, b'0', 'NUMBER', 4);
INSERT INTO `e_generator_field` VALUES (15, 'teacher_id', b'1', NULL, b'1', b'1', '教师Id', 1, b'0', 'CHOICE', 5);
INSERT INTO `e_generator_field` VALUES (16, 'dept_id', b'1', NULL, b'1', b'1', '学院Id', 3, b'0', 'CHOICE', 5);
INSERT INTO `e_generator_field` VALUES (17, 'teacher_id', b'1', NULL, b'1', b'1', '教师Id', 1, b'0', 'INPUT', 6);
INSERT INTO `e_generator_field` VALUES (18, 'teacher_name', b'1', NULL, b'1', b'1', '教师名称', 2, b'0', 'INPUT', 6);
INSERT INTO `e_generator_field` VALUES (19, 'teacher_email', b'1', NULL, b'1', b'1', '教师邮件', 3, b'0', 'INPUT', 6);
INSERT INTO `e_generator_field` VALUES (20, 'teacher_phone', b'1', NULL, b'1', b'1', '教师手机号码', 4, b'0', 'INPUT', 6);
INSERT INTO `e_generator_field` VALUES (21, 'dept_id', b'1', NULL, b'1', b'1', '学院id', 8, b'0', 'CHOICE', 4);
INSERT INTO `e_generator_field` VALUES (22, 'must_sign_num', b'1', NULL, b'0', b'0', '应签到数量', 10, b'0', 'INPUT', 4);
INSERT INTO `e_generator_field` VALUES (23, 'has_sign_num', b'1', NULL, b'0', b'0', '实际签到数量', 11, b'0', 'HIDDEN', 4);
INSERT INTO `e_generator_field` VALUES (24, 'sign_publish_id', b'1', NULL, b'1', b'1', '签到发布Id', 1, b'0', 'INPUT', 7);
INSERT INTO `e_generator_field` VALUES (25, 'sign_create_time', b'1', NULL, b'1', b'1', '签到时间', 2, b'0', 'DATE_TIME', 7);
INSERT INTO `e_generator_field` VALUES (26, 'lat', b'1', NULL, b'1', b'1', '签到维度', 3, b'0', 'INPUT', 7);
INSERT INTO `e_generator_field` VALUES (27, 'lon', b'1', NULL, b'1', b'1', '签到经度', 4, b'0', 'INPUT', 7);
INSERT INTO `e_generator_field` VALUES (28, 'sign_time', b'1', NULL, b'1', b'1', '签到时间', 12, b'0', 'DATE_TIME', 4);
INSERT INTO `e_generator_field` VALUES (29, 'stu_id', b'1', NULL, b'1', b'1', '学生id', 1, b'0', 'INPUT', 8);
INSERT INTO `e_generator_field` VALUES (30, 'stu_id', b'1', NULL, b'1', b'1', '学生Id', 11, b'0', 'INPUT', 7);
INSERT INTO `e_generator_field` VALUES (31, 'stu_dept', b'1', NULL, b'1', b'1', '学生学院', 11, b'0', 'CHOICE', 8);
INSERT INTO `e_generator_field` VALUES (32, 'userId', b'1', NULL, b'1', b'1', '注册Id', 1, b'0', 'INPUT', 9);
INSERT INTO `e_generator_field` VALUES (33, 'register_type', b'1', NULL, b'1', b'1', '注册类型:1是学生，2是教师', 2, b'0', 'CHOICE', 9);
INSERT INTO `e_generator_field` VALUES (34, 'username', b'1', NULL, b'1', b'1', '用户名', 3, b'0', 'INPUT', 9);
INSERT INTO `e_generator_field` VALUES (35, 'password', b'1', NULL, b'1', b'1', '密码', 4, b'0', 'INPUT', 9);
INSERT INTO `e_generator_field` VALUES (36, 'relation_id', b'1', NULL, b'1', b'1', '关联不同类型的用户id', 5, b'0', 'INPUT', 9);
INSERT INTO `e_generator_field` VALUES (37, 'sign_last_time', b'1', NULL, b'1', b'1', '签到最晚时间', 13, b'0', 'DATE_TIME', 4);
INSERT INTO `e_generator_field` VALUES (38, 'userId', b'1', NULL, b'1', b'1', '用户id', 1, b'0', 'INPUT', 10);
INSERT INTO `e_generator_field` VALUES (39, 'token', b'1', NULL, b'0', b'1', 'token', 2, b'0', 'INPUT', 10);
INSERT INTO `e_generator_field` VALUES (40, 'expire_time', b'1', NULL, b'0', b'1', '过期时间', 3, b'0', 'DATE_TIME', 10);
INSERT INTO `e_generator_field` VALUES (41, 'dept_id', b'1', NULL, b'1', b'1', '学院id', 3, b'0', 'CHOICE', 8);
INSERT INTO `e_generator_field` VALUES (42, 'record_id', b'1', NULL, b'1', b'0', '记录id', 4, b'0', 'INPUT', 7);
INSERT INTO `e_generator_field` VALUES (43, 'dept_id', b'1', NULL, b'1', b'1', '学院id', 5, b'0', 'INPUT', 9);
INSERT INTO `e_generator_field` VALUES (44, 'sign_status', b'1', NULL, b'0', b'1', '签到状态', 11, b'0', 'HIDDEN', 7);
INSERT INTO `e_generator_field` VALUES (45, 'sign_date', b'0', NULL, b'0', b'0', '签到日期', 12, b'0', 'DATE', 4);
INSERT INTO `e_generator_field` VALUES (46, 'map_content', b'1', NULL, b'1', b'0', '地图', 1, b'0', 'MAP', 11);
INSERT INTO `e_generator_field` VALUES (47, 'map_id', b'1', NULL, b'1', b'1', '地图Id', 2, b'0', 'INPUT', 11);
INSERT INTO `e_generator_field` VALUES (48, 'grade_id', b'1', NULL, b'1', b'1', '年级Id', 1, b'0', 'INPUT', 12);
INSERT INTO `e_generator_field` VALUES (49, 'grade_name', b'1', NULL, b'1', b'1', '年级名', 2, b'0', 'INPUT', 12);

-- ----------------------------
-- Table structure for e_job
-- ----------------------------
DROP TABLE IF EXISTS `e_job`;
CREATE TABLE `e_job`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cron` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `handler` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `handler_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notify_emails` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK1fu1amroa8n5mma3q9tey7bu9`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_job
-- ----------------------------

-- ----------------------------
-- Table structure for e_job_log
-- ----------------------------
DROP TABLE IF EXISTS `e_job_log`;
CREATE TABLE `e_job_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `end_time` datetime NULL DEFAULT NULL,
  `error_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `handler_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `result_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `job_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKcpe22rpge2e4mmuva8l9dtmx0`(`job_id`) USING BTREE,
  CONSTRAINT `FKcpe22rpge2e4mmuva8l9dtmx0` FOREIGN KEY (`job_id`) REFERENCES `e_job` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for e_job_mail
-- ----------------------------
DROP TABLE IF EXISTS `e_job_mail`;
CREATE TABLE `e_job_mail`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `error_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `recipient` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_job_mail
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_login_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_login_log`;
CREATE TABLE `e_upms_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `device_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_time` datetime NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `system_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_login_log
-- ----------------------------
INSERT INTO `e_upms_login_log` VALUES (1, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-22 22:40:35', '美国|0|加利福尼亚|0|0', 'Windows 10', 'aSMqfzvGbpasSvLp', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (2, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-22 22:43:02', '美国|0|加利福尼亚|0|0', 'Windows 10', 'rzvh42h3NU7KXVCj', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (3, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-22 22:44:08', '美国|0|加利福尼亚|0|0', 'Windows 10', 'FAgNoOpRK3WdDq4K', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (4, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-22 22:44:57', '美国|0|加利福尼亚|0|0', 'Windows 10', 'PtcISp4RUuNqUsJx', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (5, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-22 22:50:17', '美国|0|加利福尼亚|0|0', 'Windows 10', 'GlO1NzG1CfLjxutK', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (6, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-22 22:59:35', '美国|0|加利福尼亚|0|0', 'Windows 10', 'Ou7HI5VQfYwX7Rw9', 'admin');
INSERT INTO `e_upms_login_log` VALUES (7, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-22 23:02:52', '美国|0|加利福尼亚|0|0', 'Windows 10', '3SyCHi4ghbijZeLj', 'admin');
INSERT INTO `e_upms_login_log` VALUES (8, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-22 23:03:30', '美国|0|加利福尼亚|0|0', 'Windows 10', 'cpoh9OoJgAG7PCCH', 'admin');
INSERT INTO `e_upms_login_log` VALUES (9, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-22 23:06:04', '美国|0|加利福尼亚|0|0', 'Windows 10', 'bVxZZQVxaETLneW7', 'admin');
INSERT INTO `e_upms_login_log` VALUES (10, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-22 23:50:07', '美国|0|加利福尼亚|0|0', 'Windows 10', 'itawBPBQe2SwtsGQ', 'admin');
INSERT INTO `e_upms_login_log` VALUES (11, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 00:03:43', '美国|0|加利福尼亚|0|0', 'Windows 10', 'AUwRpMQwukXyP6ej', 'admin');
INSERT INTO `e_upms_login_log` VALUES (12, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 00:04:48', '美国|0|加利福尼亚|0|0', 'Windows 10', '4g7rOXcHlk6YqFDa', 'admin');
INSERT INTO `e_upms_login_log` VALUES (13, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 00:19:30', '美国|0|加利福尼亚|0|0', 'Windows 10', '1me2Fx1FDPZ5R5QQ', 'admin');
INSERT INTO `e_upms_login_log` VALUES (14, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 00:25:30', '美国|0|加利福尼亚|0|0', 'Windows 10', 'h5XSDyJhtUpilqTd', 'admin');
INSERT INTO `e_upms_login_log` VALUES (15, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 00:47:42', '美国|0|加利福尼亚|0|0', 'Windows 10', '7C8TKHtY1Zk8erIE', 'admin');
INSERT INTO `e_upms_login_log` VALUES (16, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 00:57:07', '美国|0|加利福尼亚|0|0', 'Windows 10', '7MhWQDuawcGbpEWe', 'admin');
INSERT INTO `e_upms_login_log` VALUES (17, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 00:57:59', '美国|0|加利福尼亚|0|0', 'Windows 10', '7v1oCqRh6rSCMRIq', 'admin');
INSERT INTO `e_upms_login_log` VALUES (18, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 01:00:36', '美国|0|加利福尼亚|0|0', 'Windows 10', 'KRz501Uuuh9AQBWU', 'admin');
INSERT INTO `e_upms_login_log` VALUES (19, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 01:04:06', '美国|0|加利福尼亚|0|0', 'Windows 10', '89UDXhjJ2cIFxOhj', 'admin');
INSERT INTO `e_upms_login_log` VALUES (20, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 01:06:23', '美国|0|加利福尼亚|0|0', 'Windows 10', '96iH09BMNveXCbwZ', 'admin');
INSERT INTO `e_upms_login_log` VALUES (21, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 01:09:51', '美国|0|加利福尼亚|0|0', 'Windows 10', '3dCPr3WMA2wybPUT', 'admin');
INSERT INTO `e_upms_login_log` VALUES (22, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 01:11:28', '美国|0|加利福尼亚|0|0', 'Windows 10', 'lD1cY92hS1jteV9R', 'admin');
INSERT INTO `e_upms_login_log` VALUES (23, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 11:22:02', '美国|0|加利福尼亚|0|0', 'Windows 10', '7JqzGAr7tG2uzcmd', 'admin');
INSERT INTO `e_upms_login_log` VALUES (24, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 11:26:57', '美国|0|加利福尼亚|0|0', 'Windows 10', 'ZoP1vlw22Ma45T9f', 'admin');
INSERT INTO `e_upms_login_log` VALUES (25, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 11:27:43', '美国|0|加利福尼亚|0|0', 'Windows 10', '8jwFHq2d744bByRO', 'admin');
INSERT INTO `e_upms_login_log` VALUES (26, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 11:29:49', '美国|0|加利福尼亚|0|0', 'Windows 10', 'stsCT3FjHVqe4i1r', 'admin');
INSERT INTO `e_upms_login_log` VALUES (27, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 11:31:04', '美国|0|加利福尼亚|0|0', 'Windows 10', 'PBSzXuepyHiLKsKq', 'admin');
INSERT INTO `e_upms_login_log` VALUES (28, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 11:31:46', '美国|0|加利福尼亚|0|0', 'Windows 10', 'zkGwS2M5nvK0F0zK', 'admin');
INSERT INTO `e_upms_login_log` VALUES (29, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 12:53:39', '美国|0|加利福尼亚|0|0', 'Windows 10', 'b41oyY6UoWAR2VvN', 'admin');
INSERT INTO `e_upms_login_log` VALUES (30, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 12:55:42', '美国|0|加利福尼亚|0|0', 'Windows 10', 'XK0hIaHYDgnrEQlG', 'admin');
INSERT INTO `e_upms_login_log` VALUES (31, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 12:57:22', '美国|0|加利福尼亚|0|0', 'Windows 10', 'qgnVmmhChllYpEop', 'admin');
INSERT INTO `e_upms_login_log` VALUES (32, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 13:45:39', '美国|0|加利福尼亚|0|0', 'Windows 10', 'ikbVDoGvTrQjcDYE', 'admin');
INSERT INTO `e_upms_login_log` VALUES (33, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 13:48:57', '美国|0|加利福尼亚|0|0', 'Windows 10', 'hvWhzQAKCBRJ5OWI', 'admin');
INSERT INTO `e_upms_login_log` VALUES (34, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 15:57:27', '美国|0|加利福尼亚|0|0', 'Windows 10', '5cL1rWM3Vd1Tl5TI', 'admin');
INSERT INTO `e_upms_login_log` VALUES (35, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 16:05:29', '美国|0|加利福尼亚|0|0', 'Windows 10', 'NPYM4Bc5c61TTebB', 'admin');
INSERT INTO `e_upms_login_log` VALUES (36, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 16:33:37', '美国|0|加利福尼亚|0|0', 'Windows 10', 'OpwlrXvWVzLeTbKQ', 'admin');
INSERT INTO `e_upms_login_log` VALUES (37, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 16:52:35', '美国|0|加利福尼亚|0|0', 'Windows 10', 'BG7Q101H9tQuJG1u', 'admin');
INSERT INTO `e_upms_login_log` VALUES (38, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 17:28:20', '美国|0|加利福尼亚|0|0', 'Windows 10', 'DYyDn1DfmvAaa7SB', 'admin');
INSERT INTO `e_upms_login_log` VALUES (39, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 17:47:35', '美国|0|加利福尼亚|0|0', 'Windows 10', 'edKvgbFW51xQXQ37', 'admin');
INSERT INTO `e_upms_login_log` VALUES (40, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 17:49:22', '美国|0|加利福尼亚|0|0', 'Windows 10', 'my9EkOsBQ7nlC1ng', 'admin');
INSERT INTO `e_upms_login_log` VALUES (41, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 17:49:49', '美国|0|加利福尼亚|0|0', 'Windows 10', '9U1Nl8YpD2Sk2rjN', 'admin');
INSERT INTO `e_upms_login_log` VALUES (42, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 17:50:23', '美国|0|加利福尼亚|0|0', 'Windows 10', 'T0GuPj0oEkeZs2vF', 'admin');
INSERT INTO `e_upms_login_log` VALUES (43, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 17:56:33', '美国|0|加利福尼亚|0|0', 'Windows 10', 'cgKbRpH0La4kEORI', 'admin');
INSERT INTO `e_upms_login_log` VALUES (44, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 18:08:01', '美国|0|加利福尼亚|0|0', 'Windows 10', '2aVFOejdkwokfiok', 'admin');
INSERT INTO `e_upms_login_log` VALUES (45, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 18:14:15', '美国|0|加利福尼亚|0|0', 'Windows 10', 'cTHjNxtJnaqHAjwT', 'admin');
INSERT INTO `e_upms_login_log` VALUES (46, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 18:33:13', '美国|0|加利福尼亚|0|0', 'Windows 10', '1Bak1fbvjm0oTNQm', 'admin');
INSERT INTO `e_upms_login_log` VALUES (47, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 18:35:04', '美国|0|加利福尼亚|0|0', 'Windows 10', 'cV5n2S3xP7LMeZNf', 'admin');
INSERT INTO `e_upms_login_log` VALUES (48, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 18:36:20', '美国|0|加利福尼亚|0|0', 'Windows 10', 'fpTwyPmOubjpFaDJ', 'admin');
INSERT INTO `e_upms_login_log` VALUES (49, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 21:34:37', '美国|0|加利福尼亚|0|0', 'Windows 10', 'BS9IxlCOhR7AfylS', 'admin');
INSERT INTO `e_upms_login_log` VALUES (50, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-23 23:48:17', '美国|0|加利福尼亚|0|0', 'Windows 10', 'XEqZCidLCkx7Rl0U', 'admin');
INSERT INTO `e_upms_login_log` VALUES (51, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-24 20:48:25', '美国|0|加利福尼亚|0|0', 'Windows 10', 'I6HNp7rgjYjgSXS8', 'admin');
INSERT INTO `e_upms_login_log` VALUES (52, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-24 22:26:30', '美国|0|加利福尼亚|0|0', 'Windows 10', 'TyoGHiv1Opn16tzb', 'admin');
INSERT INTO `e_upms_login_log` VALUES (53, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-25 21:10:24', '美国|0|加利福尼亚|0|0', 'Windows 10', 'YYSJZjEFdrGnZ0mo', 'admin');
INSERT INTO `e_upms_login_log` VALUES (54, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-25 21:11:59', '美国|0|加利福尼亚|0|0', 'Windows 10', 'ept3ymhHFsOYU532', 'admin');
INSERT INTO `e_upms_login_log` VALUES (55, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-25 21:13:45', '美国|0|加利福尼亚|0|0', 'Windows 10', 'GG7D80FxjoR8yOiB', 'admin');
INSERT INTO `e_upms_login_log` VALUES (56, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-25 21:15:05', '美国|0|加利福尼亚|0|0', 'Windows 10', 'mk7jJhJzlyRu7hho', 'admin');
INSERT INTO `e_upms_login_log` VALUES (57, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-25 21:15:34', '美国|0|加利福尼亚|0|0', 'Windows 10', '30hrI0ynedvl5MWc', 'admin');
INSERT INTO `e_upms_login_log` VALUES (58, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-25 21:20:54', '美国|0|加利福尼亚|0|0', 'Windows 10', 'Y3Q13gWyACC7ZmwY', 'admin');
INSERT INTO `e_upms_login_log` VALUES (59, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-25 23:27:29', '0|0|0|内网IP|内网IP', 'Windows 10', 'Oy5z40qjytaK6ceE', 'admin');
INSERT INTO `e_upms_login_log` VALUES (60, 'Chrome 10 100', 'Computer', '26.26.26.1', '2022-04-26 21:56:03', '美国|0|加利福尼亚|0|0', 'Windows 10', 'ilKeg7XKimRWGb8U', 'admin');
INSERT INTO `e_upms_login_log` VALUES (61, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-27 18:39:34', '0|0|0|内网IP|内网IP', 'Windows 10', 'AdjWpmtvDKr0xV0F', 'admin');
INSERT INTO `e_upms_login_log` VALUES (62, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-27 18:43:58', '0|0|0|内网IP|内网IP', 'Windows 10', 'd2IgAQDS8MyGd0UB', 'admin');
INSERT INTO `e_upms_login_log` VALUES (63, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-27 18:45:09', '0|0|0|内网IP|内网IP', 'Windows 10', '1cVswfrU9f2KNXSq', 'admin');
INSERT INTO `e_upms_login_log` VALUES (64, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-27 18:52:21', '0|0|0|内网IP|内网IP', 'Windows 10', 'mPtxmWPie2YmjB1g', 'admin');
INSERT INTO `e_upms_login_log` VALUES (65, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-27 19:00:49', '0|0|0|内网IP|内网IP', 'Windows 10', 'JgBwmf1m7D8CQJIf', 'admin');
INSERT INTO `e_upms_login_log` VALUES (66, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-27 19:21:23', '0|0|0|内网IP|内网IP', 'Windows 10', 'T64ijvnN5HlB0MoE', 'admin');
INSERT INTO `e_upms_login_log` VALUES (67, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-28 21:38:33', '0|0|0|内网IP|内网IP', 'Windows 10', 'iYIih8b16Tgy0NcX', 'admin');
INSERT INTO `e_upms_login_log` VALUES (68, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-28 23:41:53', '0|0|0|内网IP|内网IP', 'Windows 10', '6po38zmZElkXOvIv', 'admin');
INSERT INTO `e_upms_login_log` VALUES (69, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-28 23:43:31', '0|0|0|内网IP|内网IP', 'Windows 10', 'w44lH3Df55AAqzSH', 'admin');
INSERT INTO `e_upms_login_log` VALUES (70, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-28 23:44:06', '0|0|0|内网IP|内网IP', 'Windows 10', 'x5GESZ1FpJYPXD3o', 'admin');
INSERT INTO `e_upms_login_log` VALUES (71, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-28 23:44:54', '0|0|0|内网IP|内网IP', 'Windows 10', 'Z3CxyDkYO67wsMRc', 'admin');
INSERT INTO `e_upms_login_log` VALUES (72, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-28 23:47:55', '0|0|0|内网IP|内网IP', 'Windows 10', 'AxXfT011l4jM9e5g', 'admin');
INSERT INTO `e_upms_login_log` VALUES (73, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-28 23:54:07', '0|0|0|内网IP|内网IP', 'Windows 10', 'XEKRQLPxllQOqi9g', 'admin');
INSERT INTO `e_upms_login_log` VALUES (74, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-28 23:57:23', '0|0|0|内网IP|内网IP', 'Windows 10', 'sI1E87vPLGz4Px0n', 'admin');
INSERT INTO `e_upms_login_log` VALUES (75, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 00:00:18', '0|0|0|内网IP|内网IP', 'Windows 10', 'S4kpzPb5rqXND3IJ', 'admin');
INSERT INTO `e_upms_login_log` VALUES (76, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 14:01:23', '0|0|0|内网IP|内网IP', 'Windows 10', 'dCMoLcfEnsuQL05N', 'admin');
INSERT INTO `e_upms_login_log` VALUES (77, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:13:14', '0|0|0|内网IP|内网IP', 'Windows 10', 'Fw4dJQN4Yix3uLpg', 'admin');
INSERT INTO `e_upms_login_log` VALUES (78, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:15:37', '0|0|0|内网IP|内网IP', 'Windows 10', 'lc2OGKs7EjSzTfHf', 'admin');
INSERT INTO `e_upms_login_log` VALUES (79, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:16:46', '0|0|0|内网IP|内网IP', 'Windows 10', 'LUz8Khn07WrEtPuT', 'admin');
INSERT INTO `e_upms_login_log` VALUES (80, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:18:31', '0|0|0|内网IP|内网IP', 'Windows 10', '6w5KUaylkBmpo5mv', 'admin');
INSERT INTO `e_upms_login_log` VALUES (81, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:19:25', '0|0|0|内网IP|内网IP', 'Windows 10', '8vHiGZMxxkTZxPXN', 'admin');
INSERT INTO `e_upms_login_log` VALUES (82, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:20:52', '0|0|0|内网IP|内网IP', 'Windows 10', 'PmWoliak1Pm0T46v', 'admin');
INSERT INTO `e_upms_login_log` VALUES (83, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:22:14', '0|0|0|内网IP|内网IP', 'Windows 10', '8xLjK6AqHTpdYFdg', 'admin');
INSERT INTO `e_upms_login_log` VALUES (84, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:24:38', '0|0|0|内网IP|内网IP', 'Windows 10', 'zgavU0Yc3j0FrKRv', 'admin');
INSERT INTO `e_upms_login_log` VALUES (85, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:25:25', '0|0|0|内网IP|内网IP', 'Windows 10', 'XC2aJYdRMX6gVjES', 'admin');
INSERT INTO `e_upms_login_log` VALUES (86, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:25:53', '0|0|0|内网IP|内网IP', 'Windows 10', 'MOoIHnStDqBd8dPj', 'admin');
INSERT INTO `e_upms_login_log` VALUES (87, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:27:16', '0|0|0|内网IP|内网IP', 'Windows 10', 'yM1TK7mCkGtONtuf', 'admin');
INSERT INTO `e_upms_login_log` VALUES (88, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:32:34', '0|0|0|内网IP|内网IP', 'Windows 10', 'E1vtul8YTDe4c9mC', 'admin');
INSERT INTO `e_upms_login_log` VALUES (89, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:43:15', '0|0|0|内网IP|内网IP', 'Windows 10', 'hDb9kEQxQ2zgqyRt', 'admin');
INSERT INTO `e_upms_login_log` VALUES (90, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:45:30', '0|0|0|内网IP|内网IP', 'Windows 10', 'N6jacNftxvoy8ejx', 'admin');
INSERT INTO `e_upms_login_log` VALUES (91, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:47:12', '0|0|0|内网IP|内网IP', 'Windows 10', 'hMf98L40PYkQ0FZ7', 'admin');
INSERT INTO `e_upms_login_log` VALUES (92, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:50:43', '0|0|0|内网IP|内网IP', 'Windows 10', '8vdfcbC92LHmjN6m', 'admin');
INSERT INTO `e_upms_login_log` VALUES (93, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:56:34', '0|0|0|内网IP|内网IP', 'Windows 10', '9OaTPi5OsnHLH4YJ', 'admin');
INSERT INTO `e_upms_login_log` VALUES (94, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 18:59:48', '0|0|0|内网IP|内网IP', 'Windows 10', '1zIUENT7LU5ZHrwj', 'admin');
INSERT INTO `e_upms_login_log` VALUES (95, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 19:00:31', '0|0|0|内网IP|内网IP', 'Windows 10', 'FNBr0bNAq7Sk0ab5', 'admin');
INSERT INTO `e_upms_login_log` VALUES (96, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 19:03:12', '0|0|0|内网IP|内网IP', 'Windows 10', 'WUmqhVRVuWi2BhI3', 'admin');
INSERT INTO `e_upms_login_log` VALUES (97, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 19:03:57', '0|0|0|内网IP|内网IP', 'Windows 10', '4X9VvzfHKYXujeuM', 'admin');
INSERT INTO `e_upms_login_log` VALUES (98, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 19:05:47', '0|0|0|内网IP|内网IP', 'Windows 10', 'uXk7z5Nkfchj7b0S', 'admin');
INSERT INTO `e_upms_login_log` VALUES (99, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 19:07:35', '0|0|0|内网IP|内网IP', 'Windows 10', 'Bhq4BkA1vCMTJ5ev', 'admin');
INSERT INTO `e_upms_login_log` VALUES (100, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 19:08:30', '0|0|0|内网IP|内网IP', 'Windows 10', 'nW6uLnHXH7RAOxzS', 'admin');
INSERT INTO `e_upms_login_log` VALUES (101, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 19:13:01', '0|0|0|内网IP|内网IP', 'Windows 10', 'oS2pP5s5ShIcmphT', 'admin');
INSERT INTO `e_upms_login_log` VALUES (102, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 19:17:45', '0|0|0|内网IP|内网IP', 'Windows 10', 'Q0qyBeBBo24cHI6e', 'admin');
INSERT INTO `e_upms_login_log` VALUES (103, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-29 23:03:42', '0|0|0|内网IP|内网IP', 'Windows 10', 'OkUcc4CHWTtqVI1J', 'admin');
INSERT INTO `e_upms_login_log` VALUES (104, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 15:37:19', '0|0|0|内网IP|内网IP', 'Windows 10', 'iiK18UENUfDcmL3R', 'admin');
INSERT INTO `e_upms_login_log` VALUES (105, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 15:43:36', '0|0|0|内网IP|内网IP', 'Windows 10', 'JqxSPzbMClhhRP1g', 'admin');
INSERT INTO `e_upms_login_log` VALUES (106, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 15:44:53', '0|0|0|内网IP|内网IP', 'Windows 10', 'cb7PT39xEpXIVZ9J', 'admin');
INSERT INTO `e_upms_login_log` VALUES (107, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 15:46:01', '0|0|0|内网IP|内网IP', 'Windows 10', 'qikRGwyKACeBBDc0', 'admin');
INSERT INTO `e_upms_login_log` VALUES (108, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 15:47:52', '0|0|0|内网IP|内网IP', 'Windows 10', 'BwfBDtQExurxtkia', 'admin');
INSERT INTO `e_upms_login_log` VALUES (109, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 15:50:10', '0|0|0|内网IP|内网IP', 'Windows 10', '1HAACuxpHp2DTBBi', 'admin');
INSERT INTO `e_upms_login_log` VALUES (110, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 15:53:59', '0|0|0|内网IP|内网IP', 'Windows 10', '4SWduOCwTEs1wkFf', 'admin');
INSERT INTO `e_upms_login_log` VALUES (111, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 15:55:54', '0|0|0|内网IP|内网IP', 'Windows 10', 'hmGLLlIe5jqPoGq7', 'admin');
INSERT INTO `e_upms_login_log` VALUES (112, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 15:58:47', '0|0|0|内网IP|内网IP', 'Windows 10', 'zE8I3cn69HQ4cFVI', 'admin');
INSERT INTO `e_upms_login_log` VALUES (113, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 16:30:13', '0|0|0|内网IP|内网IP', 'Windows 10', 'rTfI7tIsRbA8vrTz', 'admin');
INSERT INTO `e_upms_login_log` VALUES (114, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 16:35:26', '0|0|0|内网IP|内网IP', 'Windows 10', 'qOlXB6TeiCbSjq9L', 'admin');
INSERT INTO `e_upms_login_log` VALUES (115, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 16:36:33', '0|0|0|内网IP|内网IP', 'Windows 10', 'fv7VZGeA0f1YzY1W', 'admin');
INSERT INTO `e_upms_login_log` VALUES (116, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 16:38:35', '0|0|0|内网IP|内网IP', 'Windows 10', 'XwFFUThgRa5BFcsM', 'admin');
INSERT INTO `e_upms_login_log` VALUES (117, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 16:39:39', '0|0|0|内网IP|内网IP', 'Windows 10', 'mWfMdPn8D7pYjcLD', 'admin');
INSERT INTO `e_upms_login_log` VALUES (118, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 16:45:51', '0|0|0|内网IP|内网IP', 'Windows 10', 'HtO7J8Er1sUIDwpw', 'admin');
INSERT INTO `e_upms_login_log` VALUES (119, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 16:48:54', '0|0|0|内网IP|内网IP', 'Windows 10', 'l806X1NeVyqHfNiZ', 'admin');
INSERT INTO `e_upms_login_log` VALUES (120, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 16:51:00', '0|0|0|内网IP|内网IP', 'Windows 10', 'b8tWvcbHhw4H2P2A', 'admin');
INSERT INTO `e_upms_login_log` VALUES (121, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:02:46', '0|0|0|内网IP|内网IP', 'Windows 10', 'Fx2hZSjmgSpbA9Sw', 'admin');
INSERT INTO `e_upms_login_log` VALUES (122, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:07:07', '0|0|0|内网IP|内网IP', 'Windows 10', 'Mvvg4ZyTODFuj4s1', 'admin');
INSERT INTO `e_upms_login_log` VALUES (123, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:08:11', '0|0|0|内网IP|内网IP', 'Windows 10', '6SBW49U1Fpbzocjm', 'admin');
INSERT INTO `e_upms_login_log` VALUES (124, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:09:10', '0|0|0|内网IP|内网IP', 'Windows 10', 'nDplK9HjgQAQdF4v', 'admin');
INSERT INTO `e_upms_login_log` VALUES (125, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:11:43', '0|0|0|内网IP|内网IP', 'Windows 10', '2NLWorHl9aPof3cW', 'admin');
INSERT INTO `e_upms_login_log` VALUES (126, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:12:22', '0|0|0|内网IP|内网IP', 'Windows 10', 'LkzpGgJoZRdzmEMo', 'admin');
INSERT INTO `e_upms_login_log` VALUES (127, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:18:11', '0|0|0|内网IP|内网IP', 'Windows 10', 'IihzPTrghfJoqS0F', 'admin');
INSERT INTO `e_upms_login_log` VALUES (128, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:19:33', '0|0|0|内网IP|内网IP', 'Windows 10', 'LYJYvYvbu4DJm68e', 'admin');
INSERT INTO `e_upms_login_log` VALUES (129, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:21:25', '0|0|0|内网IP|内网IP', 'Windows 10', 'CBVLLvQMEzgrmD0i', 'admin');
INSERT INTO `e_upms_login_log` VALUES (130, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:24:14', '0|0|0|内网IP|内网IP', 'Windows 10', 'gVP1QMjsDk3WEYwb', 'admin');
INSERT INTO `e_upms_login_log` VALUES (131, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:25:26', '0|0|0|内网IP|内网IP', 'Windows 10', '0QCoptNwnRbw0gAU', 'admin');
INSERT INTO `e_upms_login_log` VALUES (132, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:26:17', '0|0|0|内网IP|内网IP', 'Windows 10', '9Ld4m6vEbk81o1TX', 'admin');
INSERT INTO `e_upms_login_log` VALUES (133, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:28:17', '0|0|0|内网IP|内网IP', 'Windows 10', 'jPqW9GDslgAeSCoW', 'admin');
INSERT INTO `e_upms_login_log` VALUES (134, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:33:21', '0|0|0|内网IP|内网IP', 'Windows 10', 'GY1b1AwRshWtgSWe', 'admin');
INSERT INTO `e_upms_login_log` VALUES (135, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:34:44', '0|0|0|内网IP|内网IP', 'Windows 10', 'o1IQMGI6K54yxHid', 'admin');
INSERT INTO `e_upms_login_log` VALUES (136, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:37:27', '0|0|0|内网IP|内网IP', 'Windows 10', 'dyJ8jKncU2JMcYRy', 'admin');
INSERT INTO `e_upms_login_log` VALUES (137, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:41:03', '0|0|0|内网IP|内网IP', 'Windows 10', '4p5jadE1fOTokoak', 'admin');
INSERT INTO `e_upms_login_log` VALUES (138, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:44:27', '0|0|0|内网IP|内网IP', 'Windows 10', 'rgOhyOq5x7IT3Wd1', 'admin');
INSERT INTO `e_upms_login_log` VALUES (139, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:45:28', '0|0|0|内网IP|内网IP', 'Windows 10', 'z1F7cTvCjWP6zTOR', 'admin');
INSERT INTO `e_upms_login_log` VALUES (140, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:46:16', '0|0|0|内网IP|内网IP', 'Windows 10', '3s2GkBHsIy22Q4GW', 'admin');
INSERT INTO `e_upms_login_log` VALUES (141, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:52:35', '0|0|0|内网IP|内网IP', 'Windows 10', '2ioigmnhcN0n0FU3', 'admin');
INSERT INTO `e_upms_login_log` VALUES (142, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:53:17', '0|0|0|内网IP|内网IP', 'Windows 10', 'qq3yBlo9vWGaz6LP', 'admin');
INSERT INTO `e_upms_login_log` VALUES (143, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:56:26', '0|0|0|内网IP|内网IP', 'Windows 10', '1fgTqBKaVqWyhJFV', 'admin');
INSERT INTO `e_upms_login_log` VALUES (144, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:58:42', '0|0|0|内网IP|内网IP', 'Windows 10', 'U5BSXrwPIgBgWcn1', 'admin');
INSERT INTO `e_upms_login_log` VALUES (145, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 17:59:52', '0|0|0|内网IP|内网IP', 'Windows 10', 'HeqmBYw9Rz8lASXS', 'admin');
INSERT INTO `e_upms_login_log` VALUES (146, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 18:02:01', '0|0|0|内网IP|内网IP', 'Windows 10', 'vqjoOHoBQpk68EhM', 'admin');
INSERT INTO `e_upms_login_log` VALUES (147, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 18:03:22', '0|0|0|内网IP|内网IP', 'Windows 10', 'vIWHa1P6I6yITmuU', 'admin');
INSERT INTO `e_upms_login_log` VALUES (148, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 18:07:14', '0|0|0|内网IP|内网IP', 'Windows 10', '0gHplXmWS3lXeihh', 'admin');
INSERT INTO `e_upms_login_log` VALUES (149, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 18:13:16', '0|0|0|内网IP|内网IP', 'Windows 10', '33ViRv0W2vlVQwel', 'admin');
INSERT INTO `e_upms_login_log` VALUES (150, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 18:14:44', '0|0|0|内网IP|内网IP', 'Windows 10', '8omJRGu6eGhtICJh', 'admin');
INSERT INTO `e_upms_login_log` VALUES (151, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 19:06:07', '0|0|0|内网IP|内网IP', 'Windows 10', 'arCSDSn4DhfXzVsn', 'admin');
INSERT INTO `e_upms_login_log` VALUES (152, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 19:54:50', '0|0|0|内网IP|内网IP', 'Windows 10', 'bYrnEkfLfQpykG4t', 'admin');
INSERT INTO `e_upms_login_log` VALUES (153, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 21:37:41', '0|0|0|内网IP|内网IP', 'Windows 10', 'd4vgl1M90nZl7kqJ', 'admin');
INSERT INTO `e_upms_login_log` VALUES (154, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 22:52:14', '0|0|0|内网IP|内网IP', 'Windows 10', 'DdOhcUa9Pv1nN7kP', 'admin');
INSERT INTO `e_upms_login_log` VALUES (155, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 22:53:38', '0|0|0|内网IP|内网IP', 'Windows 10', 'TRoeRS2IJWm1qZ6m', 'admin');
INSERT INTO `e_upms_login_log` VALUES (156, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 22:55:53', '0|0|0|内网IP|内网IP', 'Windows 10', 'xomkaMrLoHWuqpCK', 'admin');
INSERT INTO `e_upms_login_log` VALUES (157, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 23:00:36', '0|0|0|内网IP|内网IP', 'Windows 10', 'Bz0NxgApsO47JeWS', 'admin');
INSERT INTO `e_upms_login_log` VALUES (158, 'Chrome 10 100', 'Computer', '192.168.252.1', '2022-04-30 23:23:02', '0|0|0|内网IP|内网IP', 'Windows 10', 'Fc6oNNpBlHGIWcUK', 'admin');
INSERT INTO `e_upms_login_log` VALUES (159, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 11:21:19', '0|0|0|内网IP|内网IP', 'Windows 10', 'S3dAsds3ZkjTduZR', 'admin');
INSERT INTO `e_upms_login_log` VALUES (160, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 11:28:01', '0|0|0|内网IP|内网IP', 'Windows 10', '4HAoziWIRT0Vcbkc', 'admin');
INSERT INTO `e_upms_login_log` VALUES (161, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 12:04:54', '0|0|0|内网IP|内网IP', 'Windows 10', 'h0oBfTRVSfduZ4jk', 'admin');
INSERT INTO `e_upms_login_log` VALUES (162, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 12:08:39', '0|0|0|内网IP|内网IP', 'Windows 10', 'RiU2m39V9lSHEd37', 'admin');
INSERT INTO `e_upms_login_log` VALUES (163, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 12:12:27', '0|0|0|内网IP|内网IP', 'Windows 10', 'RUxw7j0jYMn8pPGE', 'admin');
INSERT INTO `e_upms_login_log` VALUES (164, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 12:28:17', '0|0|0|内网IP|内网IP', 'Windows 10', 'WqBbg9A8MApQP0V1', 'admin');
INSERT INTO `e_upms_login_log` VALUES (165, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 12:37:29', '0|0|0|内网IP|内网IP', 'Windows 10', 'ERAw4bLROEpSk0r5', 'admin');
INSERT INTO `e_upms_login_log` VALUES (166, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 13:38:03', '0|0|0|内网IP|内网IP', 'Windows 10', '5AMTMjYPY74sWXYd', 'admin');
INSERT INTO `e_upms_login_log` VALUES (167, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 13:40:18', '0|0|0|内网IP|内网IP', 'Windows 10', 'Cem0ce6k5AxuJjCv', 'admin');
INSERT INTO `e_upms_login_log` VALUES (168, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 14:53:03', '0|0|0|内网IP|内网IP', 'Windows 10', 'DLtVslqEHp4wJXDt', 'admin');
INSERT INTO `e_upms_login_log` VALUES (169, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 15:59:04', '0|0|0|内网IP|内网IP', 'Windows 10', 'KDiaMCILuB2Mz1Th', 'admin');
INSERT INTO `e_upms_login_log` VALUES (170, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 16:15:47', '0|0|0|内网IP|内网IP', 'Windows 10', '9UJFKOm5PPOYn0D9', 'admin');
INSERT INTO `e_upms_login_log` VALUES (171, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 16:30:50', '0|0|0|内网IP|内网IP', 'Windows 10', 'S4WcrlQzEzwBvHtl', 'admin');
INSERT INTO `e_upms_login_log` VALUES (172, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 16:44:26', '0|0|0|内网IP|内网IP', 'Windows 10', 'Qr6dB0hzl5denEbl', 'admin');
INSERT INTO `e_upms_login_log` VALUES (173, 'Chrome 10 101', 'Computer', '192.168.252.1', '2022-05-01 18:14:12', '0|0|0|内网IP|内网IP', 'Windows 10', 'nXuGHxyxI6ya82by', 'admin');
INSERT INTO `e_upms_login_log` VALUES (174, 'Chrome 10 101', 'Computer', '26.26.26.1', '2022-05-01 21:02:09', '美国|0|加利福尼亚|0|0', 'Windows 10', 'B3hUcM0GP2Ou9DYL', 'admin');
INSERT INTO `e_upms_login_log` VALUES (175, 'Chrome 10 101', 'Computer', '26.26.26.1', '2022-05-01 22:21:18', '美国|0|加利福尼亚|0|0', 'Windows 10', 'ZuZJibPKH54K9Im9', 'admin');
INSERT INTO `e_upms_login_log` VALUES (176, 'Chrome 10 101', 'Computer', '26.26.26.1', '2022-05-01 22:31:22', '美国|0|加利福尼亚|0|0', 'Windows 10', '8vXBEKRJqJpLV7m4', 'admin');
INSERT INTO `e_upms_login_log` VALUES (177, 'Chrome 10 101', 'Computer', '26.26.26.1', '2022-05-01 23:04:17', '美国|0|加利福尼亚|0|0', 'Windows 10', 'UCsThJW9HGxfEAfF', 'admin');
INSERT INTO `e_upms_login_log` VALUES (178, 'Chrome 10 101', 'Computer', '26.26.26.1', '2022-05-01 23:07:49', '美国|0|加利福尼亚|0|0', 'Windows 10', 'Ae3L6OvBiy4xmJit', 'admin');
INSERT INTO `e_upms_login_log` VALUES (179, 'Chrome 10 101', 'Computer', '26.26.26.1', '2022-05-01 23:13:32', '美国|0|加利福尼亚|0|0', 'Windows 10', '8xXcAG1bYLPS9u0L', 'admin');
INSERT INTO `e_upms_login_log` VALUES (180, 'Chrome 10 101', 'Computer', '192.168.1.7', '2022-05-01 23:53:11', '0|0|0|内网IP|内网IP', 'Windows 10', 'ro88okGfsajz9m4O', 'admin');
INSERT INTO `e_upms_login_log` VALUES (181, 'Chrome 10 101', 'Computer', '192.168.1.7', '2022-05-02 00:10:20', '0|0|0|内网IP|内网IP', 'Windows 10', 'wrzTCtReTWhFaEYa', 'admin');
INSERT INTO `e_upms_login_log` VALUES (182, 'Chrome 10 101', 'Computer', '192.168.1.7', '2022-05-02 00:22:16', '0|0|0|内网IP|内网IP', 'Windows 10', 'qwTQzF8gRyKxH96a', 'admin');
INSERT INTO `e_upms_login_log` VALUES (183, 'Chrome 10 101', 'Computer', '192.168.1.7', '2022-05-02 16:00:53', '0|0|0|内网IP|内网IP', 'Windows 10', 'xt51M0kTZLjaJ1zo', 'admin');
INSERT INTO `e_upms_login_log` VALUES (184, 'Chrome 10 101', 'Computer', '192.168.1.7', '2022-05-02 16:19:26', '0|0|0|内网IP|内网IP', 'Windows 10', 'TGVZTfHKoRTh2LV9', 'admin');

-- ----------------------------
-- Table structure for e_upms_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_menu`;
CREATE TABLE `e_upms_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_menu_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK95xpkppt33d2bka0g2d7rgwqt`(`code`) USING BTREE,
  INDEX `FK5mkgea183mm02v7ic1pdwxy5s`(`parent_menu_id`) USING BTREE,
  CONSTRAINT `FK5mkgea183mm02v7ic1pdwxy5s` FOREIGN KEY (`parent_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_menu
-- ----------------------------
INSERT INTO `e_upms_menu` VALUES (1, NULL, '2022-04-22 22:39:16', NULL, NULL, '$generator', 'fa fa-code', '代码生成', NULL, 40, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (2, NULL, '2022-04-22 22:39:17', 'admin', '2022-04-22 23:51:08', 'GeneratorClass', NULL, '代码生成器', NULL, 0, 1, 'table', 'GeneratorClass', 1);
INSERT INTO `e_upms_menu` VALUES (3, NULL, '2022-04-22 22:39:17', NULL, NULL, 'GeneratorClass@ADD', NULL, '新增', NULL, 10, 1, 'button', 'GeneratorClass@ADD', 2);
INSERT INTO `e_upms_menu` VALUES (4, NULL, '2022-04-22 22:39:17', NULL, NULL, 'GeneratorClass@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'GeneratorClass@EDIT', 2);
INSERT INTO `e_upms_menu` VALUES (5, NULL, '2022-04-22 22:39:17', NULL, NULL, 'GeneratorClass@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'GeneratorClass@DELETE', 2);
INSERT INTO `e_upms_menu` VALUES (6, NULL, '2022-04-22 22:39:17', NULL, NULL, 'GeneratorClass@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'GeneratorClass@VIEW_DETAIL', 2);
INSERT INTO `e_upms_menu` VALUES (7, NULL, '2022-04-22 22:39:17', NULL, NULL, '$job', 'fa fa-cubes', '任务管理', NULL, 30, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (8, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptJob', '', '任务维护', NULL, 0, 1, 'table', 'EruptJob', 7);
INSERT INTO `e_upms_menu` VALUES (9, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptJob@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptJob@ADD', 8);
INSERT INTO `e_upms_menu` VALUES (10, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptJob@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptJob@EDIT', 8);
INSERT INTO `e_upms_menu` VALUES (11, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptJob@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptJob@DELETE', 8);
INSERT INTO `e_upms_menu` VALUES (12, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptJob@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptJob@VIEW_DETAIL', 8);
INSERT INTO `e_upms_menu` VALUES (13, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptJobLog', '', '任务日志', NULL, 10, 1, 'table', 'EruptJobLog', 7);
INSERT INTO `e_upms_menu` VALUES (14, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptJobLog@DELETE', NULL, '删除', NULL, 10, 1, 'button', 'EruptJobLog@DELETE', 13);
INSERT INTO `e_upms_menu` VALUES (15, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptJobLog@EXPORT', NULL, '导出', NULL, 20, 1, 'button', 'EruptJobLog@EXPORT', 13);
INSERT INTO `e_upms_menu` VALUES (16, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptMail', '', '发送邮件', NULL, 20, 1, 'table', 'EruptMail', 7);
INSERT INTO `e_upms_menu` VALUES (17, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptMail@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptMail@ADD', 16);
INSERT INTO `e_upms_menu` VALUES (18, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptMail@DELETE', NULL, '删除', NULL, 20, 1, 'button', 'EruptMail@DELETE', 16);
INSERT INTO `e_upms_menu` VALUES (19, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptMail@VIEW_DETAIL', NULL, '详情', NULL, 30, 1, 'button', 'EruptMail@VIEW_DETAIL', 16);
INSERT INTO `e_upms_menu` VALUES (20, NULL, '2022-04-22 22:39:17', NULL, NULL, 'magic-api', NULL, '接口配置', NULL, 50, 1, 'tpl', 'magic-api.ftl', NULL);
INSERT INTO `e_upms_menu` VALUES (21, NULL, '2022-04-22 22:39:17', NULL, NULL, 'magic-api-function', NULL, '函数', NULL, 10, 1, 'button', 'ERUPT_MAGIC_FUNCTION', 20);
INSERT INTO `e_upms_menu` VALUES (22, NULL, '2022-04-22 22:39:17', NULL, NULL, 'magic-api-datasource', NULL, '数据源', NULL, 20, 1, 'button', 'ERUPT_MAGIC_DATASOURCE', 20);
INSERT INTO `e_upms_menu` VALUES (23, NULL, '2022-04-22 22:39:17', NULL, NULL, 'magic-api-save', NULL, '保存', NULL, 30, 1, 'button', 'ERUPT_MAGIC_SAVE', 20);
INSERT INTO `e_upms_menu` VALUES (24, NULL, '2022-04-22 22:39:17', NULL, NULL, 'magic-api-view', NULL, '查看', NULL, 40, 1, 'button', 'ERUPT_MAGIC_VIEW', 20);
INSERT INTO `e_upms_menu` VALUES (25, NULL, '2022-04-22 22:39:17', NULL, NULL, 'magic-api-delete', NULL, '删除', NULL, 50, 1, 'button', 'ERUPT_MAGIC_DELETE', 20);
INSERT INTO `e_upms_menu` VALUES (26, NULL, '2022-04-22 22:39:17', NULL, NULL, 'magic-api-download', NULL, '导出', NULL, 60, 1, 'button', 'ERUPT_MAGIC_DOWNLOAD', 20);
INSERT INTO `e_upms_menu` VALUES (27, NULL, '2022-04-22 22:39:17', NULL, NULL, 'magic-api-upload', NULL, '上传', NULL, 70, 1, 'button', 'ERUPT_MAGIC_UPLOAD', 20);
INSERT INTO `e_upms_menu` VALUES (28, NULL, '2022-04-22 22:39:17', NULL, NULL, 'magic-api-push', NULL, '远程推送', NULL, 80, 1, 'button', 'ERUPT_MAGIC_PUSH', 20);
INSERT INTO `e_upms_menu` VALUES (29, NULL, '2022-04-22 22:39:17', NULL, NULL, 'magic-api-lock', NULL, '锁定', NULL, 90, 1, 'button', 'ERUPT_MAGIC_LOCK', 20);
INSERT INTO `e_upms_menu` VALUES (30, NULL, '2022-04-22 22:39:17', NULL, NULL, 'magic-api-unlock', NULL, '解锁', NULL, 100, 1, 'button', 'ERUPT_MAGIC_UNLOCK', 20);
INSERT INTO `e_upms_menu` VALUES (31, NULL, '2022-04-22 22:39:17', NULL, NULL, 'monitor', 'fa fa-bullseye', '系统监控', NULL, 10, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (32, NULL, '2022-04-22 22:39:17', NULL, NULL, 'server.html', NULL, '服务监控', NULL, 10, 1, 'tpl', 'server.html', 31);
INSERT INTO `e_upms_menu` VALUES (33, NULL, '2022-04-22 22:39:17', NULL, NULL, 'redis.html', NULL, '缓存监控', NULL, 20, 1, 'tpl', 'redis.html', 31);
INSERT INTO `e_upms_menu` VALUES (34, NULL, '2022-04-22 22:39:17', NULL, NULL, '$manager', 'fa fa-cogs', '系统管理', NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (35, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptMenu', '', '菜单管理', NULL, 0, 1, 'tree', 'EruptMenu', 34);
INSERT INTO `e_upms_menu` VALUES (36, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptMenu@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptMenu@ADD', 35);
INSERT INTO `e_upms_menu` VALUES (37, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptMenu@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptMenu@EDIT', 35);
INSERT INTO `e_upms_menu` VALUES (38, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptMenu@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptMenu@DELETE', 35);
INSERT INTO `e_upms_menu` VALUES (39, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptMenu@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptMenu@VIEW_DETAIL', 35);
INSERT INTO `e_upms_menu` VALUES (40, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptRole', '', '角色管理', NULL, 10, 1, 'table', 'EruptRole', 34);
INSERT INTO `e_upms_menu` VALUES (41, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptRole@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptRole@ADD', 40);
INSERT INTO `e_upms_menu` VALUES (42, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptRole@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptRole@EDIT', 40);
INSERT INTO `e_upms_menu` VALUES (43, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptRole@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptRole@DELETE', 40);
INSERT INTO `e_upms_menu` VALUES (44, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptRole@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptRole@VIEW_DETAIL', 40);
INSERT INTO `e_upms_menu` VALUES (45, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptOrg', '', '组织维护', NULL, 20, 1, 'tree', 'EruptOrg', 34);
INSERT INTO `e_upms_menu` VALUES (46, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptOrg@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptOrg@ADD', 45);
INSERT INTO `e_upms_menu` VALUES (47, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptOrg@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptOrg@EDIT', 45);
INSERT INTO `e_upms_menu` VALUES (48, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptOrg@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptOrg@DELETE', 45);
INSERT INTO `e_upms_menu` VALUES (49, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptOrg@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptOrg@VIEW_DETAIL', 45);
INSERT INTO `e_upms_menu` VALUES (50, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptPost', '', '岗位维护', NULL, 30, 1, 'table', 'EruptPost', 34);
INSERT INTO `e_upms_menu` VALUES (51, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptPost@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptPost@ADD', 50);
INSERT INTO `e_upms_menu` VALUES (52, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptPost@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptPost@EDIT', 50);
INSERT INTO `e_upms_menu` VALUES (53, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptPost@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptPost@DELETE', 50);
INSERT INTO `e_upms_menu` VALUES (54, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptPost@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptPost@VIEW_DETAIL', 50);
INSERT INTO `e_upms_menu` VALUES (55, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptUser', '', '用户配置', NULL, 40, 1, 'table', 'EruptUser', 34);
INSERT INTO `e_upms_menu` VALUES (56, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptUser@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptUser@ADD', 55);
INSERT INTO `e_upms_menu` VALUES (57, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptUser@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptUser@EDIT', 55);
INSERT INTO `e_upms_menu` VALUES (58, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptUser@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptUser@DELETE', 55);
INSERT INTO `e_upms_menu` VALUES (59, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptUser@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptUser@VIEW_DETAIL', 55);
INSERT INTO `e_upms_menu` VALUES (60, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptDict', '', '数据字典', NULL, 50, 1, 'table', 'EruptDict', 34);
INSERT INTO `e_upms_menu` VALUES (61, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptDict@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptDict@ADD', 60);
INSERT INTO `e_upms_menu` VALUES (62, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptDict@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptDict@EDIT', 60);
INSERT INTO `e_upms_menu` VALUES (63, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptDict@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptDict@DELETE', 60);
INSERT INTO `e_upms_menu` VALUES (64, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptDict@EXPORT', NULL, '导出', NULL, 40, 1, 'button', 'EruptDict@EXPORT', 60);
INSERT INTO `e_upms_menu` VALUES (65, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptDict@VIEW_DETAIL', NULL, '详情', NULL, 50, 1, 'button', 'EruptDict@VIEW_DETAIL', 60);
INSERT INTO `e_upms_menu` VALUES (66, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptDictItem', '', '字典项', NULL, 60, 2, 'table', 'EruptDictItem', 34);
INSERT INTO `e_upms_menu` VALUES (67, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptDictItem@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptDictItem@ADD', 66);
INSERT INTO `e_upms_menu` VALUES (68, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptDictItem@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptDictItem@EDIT', 66);
INSERT INTO `e_upms_menu` VALUES (69, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptDictItem@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptDictItem@DELETE', 66);
INSERT INTO `e_upms_menu` VALUES (70, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptDictItem@EXPORT', NULL, '导出', NULL, 40, 1, 'button', 'EruptDictItem@EXPORT', 66);
INSERT INTO `e_upms_menu` VALUES (71, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptDictItem@VIEW_DETAIL', NULL, '详情', NULL, 50, 1, 'button', 'EruptDictItem@VIEW_DETAIL', 66);
INSERT INTO `e_upms_menu` VALUES (72, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptOnline', '', '在线用户', NULL, 65, 1, 'table', 'EruptOnline', 34);
INSERT INTO `e_upms_menu` VALUES (73, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptOnline@EXPORT', NULL, '导出', NULL, 10, 1, 'button', 'EruptOnline@EXPORT', 72);
INSERT INTO `e_upms_menu` VALUES (74, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptLoginLog', '', '登录日志', NULL, 70, 1, 'table', 'EruptLoginLog', 34);
INSERT INTO `e_upms_menu` VALUES (75, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptLoginLog@EXPORT', NULL, '导出', NULL, 10, 1, 'button', 'EruptLoginLog@EXPORT', 74);
INSERT INTO `e_upms_menu` VALUES (76, NULL, '2022-04-22 22:39:17', NULL, NULL, 'EruptOperateLog', '', '操作日志', NULL, 80, 1, 'table', 'EruptOperateLog', 34);
INSERT INTO `e_upms_menu` VALUES (77, 'admin', '2022-04-22 23:52:29', 'admin', '2022-04-22 23:52:57', '9zuzgo8D', 'fa fa-cogs', '上课考勤管理', NULL, 110, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (78, 'admin', '2022-04-22 23:53:39', 'admin', '2022-04-23 00:49:27', 'DSzV8LTX', NULL, '教师管理', NULL, 120, 1, 'table', 'TeacherEntity', 77);
INSERT INTO `e_upms_menu` VALUES (79, NULL, '2022-04-23 00:49:27', NULL, NULL, 'Jpnf5SLn', NULL, '新增', NULL, 10, 1, 'button', 'TeacherEntity@ADD', 78);
INSERT INTO `e_upms_menu` VALUES (80, NULL, '2022-04-23 00:49:27', NULL, NULL, 'SQ02XPR8', NULL, '修改', NULL, 20, 1, 'button', 'TeacherEntity@EDIT', 78);
INSERT INTO `e_upms_menu` VALUES (81, NULL, '2022-04-23 00:49:27', NULL, NULL, 'RqR5WJIO', NULL, '删除', NULL, 30, 1, 'button', 'TeacherEntity@DELETE', 78);
INSERT INTO `e_upms_menu` VALUES (82, NULL, '2022-04-23 00:49:27', NULL, NULL, 'tSIhDuJK', NULL, '详情', NULL, 40, 1, 'button', 'TeacherEntity@VIEW_DETAIL', 78);
INSERT INTO `e_upms_menu` VALUES (88, 'admin', '2022-04-23 00:51:31', 'admin', '2022-04-23 00:51:31', 'CWX7mV14', NULL, '课程表', NULL, 140, 1, 'table', 'KcEntity', 77);
INSERT INTO `e_upms_menu` VALUES (89, NULL, '2022-04-23 00:51:31', NULL, NULL, 'VCUI5tFX', NULL, '新增', NULL, 10, 1, 'button', 'KcEntity@ADD', 88);
INSERT INTO `e_upms_menu` VALUES (90, NULL, '2022-04-23 00:51:31', NULL, NULL, 'I3ia2Gom', NULL, '修改', NULL, 20, 1, 'button', 'KcEntity@EDIT', 88);
INSERT INTO `e_upms_menu` VALUES (91, NULL, '2022-04-23 00:51:31', NULL, NULL, 'jzXjVsHj', NULL, '删除', NULL, 30, 1, 'button', 'KcEntity@DELETE', 88);
INSERT INTO `e_upms_menu` VALUES (92, NULL, '2022-04-23 00:51:31', NULL, NULL, 'IQjNpiqg', NULL, '详情', NULL, 40, 1, 'button', 'KcEntity@VIEW_DETAIL', 88);
INSERT INTO `e_upms_menu` VALUES (93, 'admin', '2022-04-23 00:52:19', 'admin', '2022-04-23 00:53:29', 'yQ1qTlJk', NULL, '学院表', NULL, 150, 1, 'table', 'KcDeptEntity', 77);
INSERT INTO `e_upms_menu` VALUES (94, NULL, '2022-04-23 00:52:19', 'admin', '2022-04-23 11:23:20', 'zmdJ1dHW', NULL, '新增', NULL, 10, 1, 'button', 'KcDeptEntity@ADD', 93);
INSERT INTO `e_upms_menu` VALUES (95, NULL, '2022-04-23 00:52:19', 'admin', '2022-04-23 11:23:26', 'eo8OcS2M', NULL, '修改', NULL, 20, 1, 'button', 'KcDeptEntity@EDIT', 93);
INSERT INTO `e_upms_menu` VALUES (96, NULL, '2022-04-23 00:52:19', 'admin', '2022-04-23 11:23:35', 'oFFGSzoX', NULL, '删除', NULL, 30, 1, 'button', 'KcDeptEntity@DELETE', 93);
INSERT INTO `e_upms_menu` VALUES (97, NULL, '2022-04-23 00:52:19', 'admin', '2022-04-23 11:23:41', 'WJqNzrm0', NULL, '导出', NULL, 40, 1, 'button', 'KcDeptEntity@EXPORT', 93);
INSERT INTO `e_upms_menu` VALUES (98, NULL, '2022-04-23 00:52:19', NULL, NULL, '1yg4aPpp', NULL, '导入', NULL, 50, 1, 'button', 'DeptEntity@IMPORTABLE', 93);
INSERT INTO `e_upms_menu` VALUES (99, NULL, '2022-04-23 00:52:19', NULL, NULL, 'vqDTlENw', NULL, '详情', NULL, 60, 1, 'button', 'DeptEntity@VIEW_DETAIL', 93);
INSERT INTO `e_upms_menu` VALUES (100, 'admin', '2022-04-28 23:47:17', 'admin', '2022-04-28 23:47:17', '01IlXHzp', NULL, '测试功能', NULL, 160, 1, 'table', 'TestEntity', 77);
INSERT INTO `e_upms_menu` VALUES (101, NULL, '2022-04-28 23:47:17', NULL, NULL, 'G0y6QIPS', NULL, '新增', NULL, 10, 1, 'button', 'TestEntity@ADD', 100);
INSERT INTO `e_upms_menu` VALUES (102, NULL, '2022-04-28 23:47:17', NULL, NULL, 'nC1zuy9y', NULL, '修改', NULL, 20, 1, 'button', 'TestEntity@EDIT', 100);
INSERT INTO `e_upms_menu` VALUES (103, NULL, '2022-04-28 23:47:17', NULL, NULL, '02uAhcbs', NULL, '删除', NULL, 30, 1, 'button', 'TestEntity@DELETE', 100);
INSERT INTO `e_upms_menu` VALUES (104, NULL, '2022-04-28 23:47:17', NULL, NULL, 'jhKaloF3', NULL, '导出', NULL, 40, 1, 'button', 'TestEntity@EXPORT', 100);
INSERT INTO `e_upms_menu` VALUES (105, NULL, '2022-04-28 23:47:17', NULL, NULL, 'u6GFPa7D', NULL, '导入', NULL, 50, 1, 'button', 'TestEntity@IMPORTABLE', 100);
INSERT INTO `e_upms_menu` VALUES (106, NULL, '2022-04-28 23:47:18', NULL, NULL, 'lBmHbnbJ', NULL, '详情', NULL, 60, 1, 'button', 'TestEntity@VIEW_DETAIL', 100);
INSERT INTO `e_upms_menu` VALUES (107, 'admin', '2022-04-28 23:58:52', 'admin', '2022-05-01 15:26:56', '9XPMW8er', NULL, '新版发布签到信息', NULL, 170, 1, 'tpl', 'publish-sign.html', 77);
INSERT INTO `e_upms_menu` VALUES (108, 'admin', '2022-05-01 22:24:36', 'admin', '2022-05-01 22:24:36', '4O8zLmEI', NULL, '年级管理', NULL, 180, 1, 'table', 'GradeEntity', 77);
INSERT INTO `e_upms_menu` VALUES (109, NULL, '2022-05-01 22:24:36', NULL, NULL, 'M95I6pLS', NULL, '新增', NULL, 10, 1, 'button', 'GradeEntity@ADD', 108);
INSERT INTO `e_upms_menu` VALUES (110, NULL, '2022-05-01 22:24:36', NULL, NULL, 'eYfnjJRg', NULL, '修改', NULL, 20, 1, 'button', 'GradeEntity@EDIT', 108);
INSERT INTO `e_upms_menu` VALUES (111, NULL, '2022-05-01 22:24:36', NULL, NULL, 'Jghfn6Fn', NULL, '删除', NULL, 30, 1, 'button', 'GradeEntity@DELETE', 108);
INSERT INTO `e_upms_menu` VALUES (112, NULL, '2022-05-01 22:24:36', NULL, NULL, 'PnyZ1Ow3', NULL, '导出', NULL, 40, 1, 'button', 'GradeEntity@EXPORT', 108);
INSERT INTO `e_upms_menu` VALUES (113, NULL, '2022-05-01 22:24:36', NULL, NULL, 'XAPJbAqy', NULL, '导入', NULL, 50, 1, 'button', 'GradeEntity@IMPORTABLE', 108);
INSERT INTO `e_upms_menu` VALUES (114, NULL, '2022-05-01 22:24:36', NULL, NULL, 'czbkKm15', NULL, '详情', NULL, 60, 1, 'button', 'GradeEntity@VIEW_DETAIL', 108);
INSERT INTO `e_upms_menu` VALUES (115, 'admin', '2022-05-02 16:01:13', 'admin', '2022-05-02 16:01:13', 'aCBNF9c4', NULL, '统计', NULL, 190, 1, 'tpl', 'simple-total.html', 77);

-- ----------------------------
-- Table structure for e_upms_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_operate_log`;
CREATE TABLE `e_upms_operate_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `error_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operate_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_addr` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_param` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `total_time` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 163 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_operate_log
-- ----------------------------
INSERT INTO `e_upms_operate_log` VALUES (1, '新增 | 菜单管理', '2022-04-22 22:45:13', NULL, '26.26.26.1', 'erupt', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"status\":\"1\",\"sort\":110}', b'1', 36);
INSERT INTO `e_upms_operate_log` VALUES (2, '新增 | 生成Erupt代码', '2022-04-22 23:01:51', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"课程表\",\"className\":\"KcEntity\",\"tableName\":\"plat_kc\",\"remark\":\"课程表\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程id\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-957},{\"fieldName\":\"kc_name\",\"showName\":\"课程名称\",\"sort\":2,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-33}]}', b'1', 52);
INSERT INTO `e_upms_operate_log` VALUES (3, '新增 | 生成Erupt代码', '2022-04-22 23:09:29', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"老师课程表\",\"className\":\"KcTeacher\",\"tableName\":\"kc_teacher\",\"remark\":\"老师课程表\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"sort\":1,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-67},{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"sort\":3,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-642}]}', b'1', 52);
INSERT INTO `e_upms_operate_log` VALUES (4, '新增 | 生成Erupt代码', '2022-04-22 23:10:48', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"学院表\",\"className\":\"KcDeptEntity\",\"tableName\":\"kc_dept\",\"remark\":\"学院表\",\"fields\":[{\"fieldName\":\"dept_id\",\"showName\":\"学院Id\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-663},{\"fieldName\":\"dept_name\",\"showName\":\"学院名称\",\"sort\":2,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-639}]}', b'1', 22);
INSERT INTO `e_upms_operate_log` VALUES (5, '修改 | 生成Erupt代码', '2022-04-22 23:11:02', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"老师课程表\",\"className\":\"KcTeacherEntity\",\"tableName\":\"kc_teacher\",\"remark\":\"老师课程表\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":3,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":4,\"type\":\"INPUT\",\"isShow\":true}],\"id\":2}', b'1', 31);
INSERT INTO `e_upms_operate_log` VALUES (6, '新增 | 生成Erupt代码', '2022-04-22 23:15:03', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPuplishEntity\",\"tableName\":\"Kc_sign_puplish\",\"remark\":\"课程签到发布表\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-534},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"sort\":2,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-961},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"sort\":3,\"type\":\"NUMBER\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-602},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"sort\":4,\"type\":\"NUMBER\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-942},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"sort\":5,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-233},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"sort\":6,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-519},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"sort\":7,\"type\":\"NUMBER\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-729}]}', b'1', 25);
INSERT INTO `e_upms_operate_log` VALUES (7, '修改 | 生成Erupt代码', '2022-04-22 23:15:31', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPuplishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true}],\"id\":4}', b'1', 19);
INSERT INTO `e_upms_operate_log` VALUES (8, '修改 | 生成Erupt代码', '2022-04-22 23:15:39', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程表\",\"className\":\"KcEntity\",\"tableName\":\"kc\",\"remark\":\"课程表\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":1,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"kc_name\",\"showName\":\"课程名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":2,\"type\":\"INPUT\",\"isShow\":true}],\"id\":1}', b'1', 15);
INSERT INTO `e_upms_operate_log` VALUES (9, '修改 | 生成Erupt代码', '2022-04-22 23:16:45', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程表\",\"className\":\"KcEntity\",\"tableName\":\"kc\",\"remark\":\"课程表\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":1,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"kc_name\",\"showName\":\"课程名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":2,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"sort\":4,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-364}],\"id\":1}', b'1', 27);
INSERT INTO `e_upms_operate_log` VALUES (10, '修改 | 生成Erupt代码', '2022-04-22 23:17:18', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程表\",\"className\":\"KcEntity\",\"tableName\":\"kc\",\"remark\":\"课程表\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":1,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"kc_name\",\"showName\":\"课程名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":2,\"type\":\"INPUT\",\"isShow\":true}],\"id\":1}', b'1', 23);
INSERT INTO `e_upms_operate_log` VALUES (11, '新增 | 生成Erupt代码', '2022-04-22 23:20:52', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"教师学院表\",\"className\":\"TeacherDeptEntity\",\"tableName\":\"teacher_dept\",\"remark\":\"教师表于学院表关联\",\"fields\":[{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"sort\":1,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-341},{\"fieldName\":\"dept_id\",\"showName\":\"学院Id\",\"sort\":3,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-487}]}', b'1', 16);
INSERT INTO `e_upms_operate_log` VALUES (12, '修改 | 生成Erupt代码', '2022-04-22 23:21:12', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"老师课程表\",\"className\":\"KcTeacherEntity\",\"tableName\":\"kc_teacher\",\"remark\":\"老师与课程表关联\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":3,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":4,\"type\":\"INPUT\",\"isShow\":true}],\"id\":2}', b'1', 20);
INSERT INTO `e_upms_operate_log` VALUES (13, '修改 | 生成Erupt代码', '2022-04-22 23:21:25', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"教师学院表\",\"className\":\"TeacherDeptEntity\",\"tableName\":\"teacher_dept\",\"remark\":\"教师表与学院表关联\",\"fields\":[{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":15,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院Id\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":16,\"type\":\"CHOICE\",\"isShow\":true}],\"id\":5}', b'1', 14);
INSERT INTO `e_upms_operate_log` VALUES (14, '新增 | 生成Erupt代码', '2022-04-22 23:22:10', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"教师表\",\"className\":\"TeacherEntity\",\"tableName\":\"teacher\",\"remark\":\"教师表\",\"fields\":[{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-60}]}', b'1', 13);
INSERT INTO `e_upms_operate_log` VALUES (15, '修改 | 生成Erupt代码', '2022-04-22 23:23:25', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"教师表\",\"className\":\"TeacherEntity\",\"tableName\":\"teacher\",\"remark\":\"教师表\",\"fields\":[{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":17,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"teacher_name\",\"showName\":\"教师名称\",\"sort\":2,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-313},{\"fieldName\":\"teacher_email\",\"showName\":\"教师邮件\",\"sort\":3,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-595},{\"fieldName\":\"teacher_phone\",\"showName\":\"教师手机号码\",\"sort\":4,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-801}],\"id\":6}', b'1', 23);
INSERT INTO `e_upms_operate_log` VALUES (16, '修改 | 生成Erupt代码', '2022-04-22 23:26:37', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"教师学院表\",\"className\":\"TeacherDeptEntity\",\"tableName\":\"teacher_dept\",\"remark\":\"教师表与学院表关联   一个老师可以在多个学院上课\",\"fields\":[{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":15,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院Id\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":16,\"type\":\"CHOICE\",\"isShow\":true}],\"id\":5}', b'1', 16);
INSERT INTO `e_upms_operate_log` VALUES (17, '修改 | 生成Erupt代码', '2022-04-22 23:26:50', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"老师课程表\",\"className\":\"KcTeacherEntity\",\"tableName\":\"kc_teacher\",\"remark\":\"老师与课程表关联  一个老师可以上多门课程\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":3,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":4,\"type\":\"INPUT\",\"isShow\":true}],\"id\":2}', b'1', 17);
INSERT INTO `e_upms_operate_log` VALUES (18, '修改 | 生成Erupt代码', '2022-04-22 23:26:56', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"老师课程表\",\"className\":\"KcTeacherEntity\",\"tableName\":\"kc_teacher\",\"remark\":\"老师与课程表关联   一个老师可以上多门课程\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":3,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":4,\"type\":\"INPUT\",\"isShow\":true}],\"id\":2}', b'1', 14);
INSERT INTO `e_upms_operate_log` VALUES (19, '修改 | 生成Erupt代码', '2022-04-22 23:27:36', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"老师课程表\",\"className\":\"KcTeacherEntity\",\"tableName\":\"kc_teacher\",\"remark\":\"老师与课程表关联（一个老师可以上多门课程）\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":3,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":4,\"type\":\"INPUT\",\"isShow\":true}],\"id\":2}', b'1', 15);
INSERT INTO `e_upms_operate_log` VALUES (20, '修改 | 生成Erupt代码', '2022-04-22 23:27:44', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"教师学院表\",\"className\":\"TeacherDeptEntity\",\"tableName\":\"teacher_dept\",\"remark\":\"教师表与学院表关联（一个老师可以在多个学院上课）\",\"fields\":[{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":15,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院Id\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":16,\"type\":\"CHOICE\",\"isShow\":true}],\"id\":5}', b'1', 15);
INSERT INTO `e_upms_operate_log` VALUES (21, '修改 | 生成Erupt代码', '2022-04-22 23:29:04', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"老师课程表\",\"className\":\"KcTeacherEntity\",\"tableName\":\"kc_teacher\",\"remark\":\"教师与课程表关联（一个老师可以上多门课程）\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":3,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":4,\"type\":\"INPUT\",\"isShow\":true}],\"id\":2}', b'1', 14);
INSERT INTO `e_upms_operate_log` VALUES (22, '修改 | 生成Erupt代码', '2022-04-22 23:29:17', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"教师课程表\",\"className\":\"KcTeacherEntity\",\"tableName\":\"kc_teacher\",\"remark\":\"教师表与课程表关联（一个老师可以上多门课程）\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":3,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":4,\"type\":\"INPUT\",\"isShow\":true}],\"id\":2}', b'1', 15);
INSERT INTO `e_upms_operate_log` VALUES (23, '修改 | 生成Erupt代码', '2022-04-22 23:31:06', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPuplishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"sort\":8,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-957}],\"id\":4}', b'1', 18);
INSERT INTO `e_upms_operate_log` VALUES (24, '修改 | 生成Erupt代码', '2022-04-22 23:35:10', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPuplishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"sort\":10,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-383},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"sort\":11,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-120}],\"id\":4}', b'1', 22);
INSERT INTO `e_upms_operate_log` VALUES (25, '修改 | 生成Erupt代码', '2022-04-22 23:35:42', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"教师课程表\",\"className\":\"KcTeacherEntity\",\"tableName\":\"kc_teacher\",\"remark\":\"教师表与课程表关联（一个老师可以上多门课程）\",\"fields\":[{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":3,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"教师Id\",\"sort\":3,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":4}],\"id\":2}', b'1', 19);
INSERT INTO `e_upms_operate_log` VALUES (26, '新增 | 生成Erupt代码', '2022-04-22 23:39:11', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"签到记录表\",\"className\":\"SignRecordEntity\",\"tableName\":\"sign_record\",\"remark\":\"签到记录表\",\"fields\":[{\"fieldName\":\"sign_publish_id\",\"showName\":\"签到发布Id\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-686},{\"fieldName\":\"sign_create_time\",\"showName\":\"签到时间\",\"sort\":2,\"type\":\"DATE_TIME\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-373},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"sort\":3,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-429},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"sort\":4,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-220}]}', b'1', 18);
INSERT INTO `e_upms_operate_log` VALUES (27, '修改 | 生成Erupt代码', '2022-04-22 23:40:36', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPuplishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"notNull\":true,\"query\":true,\"sort\":10,\"sortable\":false,\"id\":22,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"notNull\":true,\"query\":true,\"sort\":11,\"sortable\":false,\"id\":23,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_time\",\"showName\":\"签到时间\",\"sort\":12,\"type\":\"DATE_TIME\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-518}],\"id\":4}', b'1', 19);
INSERT INTO `e_upms_operate_log` VALUES (28, '新增 | 生成Erupt代码', '2022-04-22 23:41:28', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"学上表\",\"className\":\"StudentEntity\",\"tableName\":\"student\",\"remark\":\"学生表\",\"fields\":[{\"fieldName\":\"stu_id\",\"showName\":\"学生id\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-836}]}', b'1', 12);
INSERT INTO `e_upms_operate_log` VALUES (29, '修改 | 生成Erupt代码', '2022-04-22 23:41:53', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"签到记录表\",\"className\":\"SignRecordEntity\",\"tableName\":\"sign_record\",\"remark\":\"签到记录表\",\"fields\":[{\"fieldName\":\"sign_publish_id\",\"showName\":\"签到发布Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":24,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_create_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":25,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":26,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":27,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"stu_id\",\"showName\":\"学生Id\",\"sort\":11,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-907}],\"id\":7}', b'1', 16);
INSERT INTO `e_upms_operate_log` VALUES (30, '修改 | 生成Erupt代码', '2022-04-22 23:42:33', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"学上表\",\"className\":\"StudentEntity\",\"tableName\":\"student\",\"remark\":\"学生表\",\"fields\":[{\"fieldName\":\"stu_id\",\"showName\":\"学生id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":29,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"stu_dept\",\"showName\":\"学生学院\",\"sort\":11,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-902}],\"id\":8}', b'1', 18);
INSERT INTO `e_upms_operate_log` VALUES (31, '修改 | 生成Erupt代码', '2022-04-22 23:43:11', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"学生表\",\"className\":\"StudentEntity\",\"tableName\":\"student\",\"remark\":\"学生表---小程序发起注册将信息注册到这张表\",\"fields\":[{\"fieldName\":\"stu_id\",\"showName\":\"学生id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":29,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"stu_dept\",\"showName\":\"学生学院\",\"notNull\":true,\"query\":true,\"sort\":11,\"sortable\":false,\"id\":31,\"type\":\"CHOICE\",\"isShow\":true}],\"id\":8}', b'1', 13);
INSERT INTO `e_upms_operate_log` VALUES (32, '新增 | 生成Erupt代码', '2022-04-22 23:46:02', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"小程序注册登陆表\",\"className\":\"MiniUserEntity\",\"tableName\":\"mini_user\",\"remark\":\"小程序注册登陆表\",\"fields\":[{\"fieldName\":\"id\",\"showName\":\"注册Id\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-184},{\"fieldName\":\"register_type\",\"showName\":\"注册类型:1是学生，2是教师\",\"sort\":2,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-156},{\"fieldName\":\"username\",\"showName\":\"用户名\",\"sort\":3,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-350},{\"fieldName\":\"password\",\"showName\":\"密码\",\"sort\":4,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-20}]}', b'1', 24);
INSERT INTO `e_upms_operate_log` VALUES (33, '修改 | 生成Erupt代码', '2022-04-22 23:49:34', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"小程序注册登陆表\",\"className\":\"MiniUserEntity\",\"tableName\":\"mini_user\",\"remark\":\"小程序注册登陆表，选择登录方式可以查看不同信息，选择不同身份查看不同信息，老师可以直观查看一些简单的统计信息，选择1是学生可以签到，查看自己的统计信息，选择教师的时候可以查看老师发布的签到统计\",\"fields\":[{\"fieldName\":\"id\",\"showName\":\"注册Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":32,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"register_type\",\"showName\":\"注册类型:1是学生，2是教师\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":33,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"username\",\"showName\":\"用户名\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":34,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"password\",\"showName\":\"密码\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":35,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"relation_id\",\"showName\":\"关联不同类型的用户id\",\"sort\":5,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-57}],\"id\":9}', b'1', 16);
INSERT INTO `e_upms_operate_log` VALUES (34, '修改 | 菜单管理', '2022-04-22 23:51:08', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"代码生成器\",\"status\":\"1\",\"parentMenu\":{\"id\":1,\"name\":\"代码生成\"},\"type\":\"table\",\"value\":\"GeneratorClass\",\"sort\":0,\"code\":\"GeneratorClass\",\"id\":2}', b'1', 79);
INSERT INTO `e_upms_operate_log` VALUES (35, '新增 | 菜单管理', '2022-04-22 23:52:06', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"status\":\"1\",\"sort\":110}', b'1', 11);
INSERT INTO `e_upms_operate_log` VALUES (36, '新增 | 菜单管理', '2022-04-22 23:52:29', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"上课考勤管理\",\"status\":\"1\",\"sort\":110}', b'1', 27);
INSERT INTO `e_upms_operate_log` VALUES (37, '修改 | 菜单管理', '2022-04-22 23:52:57', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"上课考勤管理\",\"status\":\"1\",\"sort\":110,\"icon\":\"fa fa-cogs\",\"code\":\"9zuzgo8D\",\"id\":77}', b'1', 25);
INSERT INTO `e_upms_operate_log` VALUES (38, '新增 | 菜单管理', '2022-04-22 23:53:39', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"教师管理\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"sort\":120}', b'1', 24);
INSERT INTO `e_upms_operate_log` VALUES (39, '修改 | 菜单管理', '2022-04-22 23:55:08', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"教师管理\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"value\":\"EruptMenu\",\"sort\":120,\"code\":\"DSzV8LTX\",\"id\":78}', b'1', 12);
INSERT INTO `e_upms_operate_log` VALUES (40, '修改 | 菜单管理', '2022-04-22 23:55:26', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"教师管理\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"value\":\"GeneratorClass\",\"sort\":120,\"code\":\"DSzV8LTX\",\"id\":78}', b'1', 10);
INSERT INTO `e_upms_operate_log` VALUES (41, '修改 | 代码生成器', '2022-04-22 23:57:22', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"签到记录表\",\"className\":\"SignRecordEntity\",\"tableName\":\"sign_record\",\"remark\":\"签到记录表---将展示的发布的签到信息记录到这张表\",\"fields\":[{\"fieldName\":\"sign_publish_id\",\"showName\":\"签到发布Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":24,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_create_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":25,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":26,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":27,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"stu_id\",\"showName\":\"学生Id\",\"notNull\":true,\"query\":true,\"sort\":11,\"sortable\":false,\"id\":30,\"type\":\"INPUT\",\"isShow\":true}],\"id\":7}', b'1', 23);
INSERT INTO `e_upms_operate_log` VALUES (42, '修改 | 代码生成器', '2022-04-22 23:58:12', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPuplishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"notNull\":true,\"query\":true,\"sort\":10,\"sortable\":false,\"id\":22,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"notNull\":true,\"query\":true,\"sort\":11,\"sortable\":false,\"id\":23,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":12,\"sortable\":false,\"id\":28,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"sign_final_time\",\"showName\":\"签到最晚时间\",\"sort\":13,\"type\":\"DATE_TIME\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-425}],\"id\":4}', b'1', 30);
INSERT INTO `e_upms_operate_log` VALUES (43, '修改 | 代码生成器', '2022-04-22 23:58:46', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPuplishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"notNull\":true,\"query\":true,\"sort\":10,\"sortable\":false,\"id\":22,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"notNull\":true,\"query\":true,\"sort\":11,\"sortable\":false,\"id\":23,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":12,\"sortable\":false,\"id\":28,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"sign_last_time\",\"showName\":\"签到最晚时间\",\"sort\":13,\"type\":\"DATE_TIME\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":37}],\"id\":4}', b'1', 19);
INSERT INTO `e_upms_operate_log` VALUES (44, '修改 | 代码生成器', '2022-04-23 00:15:13', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPublishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"notNull\":true,\"query\":true,\"sort\":10,\"sortable\":false,\"id\":22,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"notNull\":true,\"query\":true,\"sort\":11,\"sortable\":false,\"id\":23,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":12,\"sortable\":false,\"id\":28,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"sign_last_time\",\"showName\":\"签到最晚时间\",\"notNull\":true,\"query\":true,\"sort\":13,\"sortable\":false,\"id\":37,\"type\":\"DATE_TIME\",\"isShow\":true}],\"id\":4}', b'1', 47);
INSERT INTO `e_upms_operate_log` VALUES (45, '修改 | 代码生成器', '2022-04-23 00:25:44', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"小程序注册登陆表\",\"className\":\"MiniUserEntity\",\"tableName\":\"mini_user\",\"remark\":\"小程序注册登陆表，选择登录方式可以查看不同信息，选择不同身份查看不同信息，老师可以直观查看一些简单的统计信息，选择1是学生可以签到，查看自己的统计信息，选择教师的时候可以查看老师发布的签到统计\",\"fields\":[{\"fieldName\":\"userId\",\"showName\":\"注册Id\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":32},{\"fieldName\":\"register_type\",\"showName\":\"注册类型:1是学生，2是教师\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":33,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"username\",\"showName\":\"用户名\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":34,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"password\",\"showName\":\"密码\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":35,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"relation_id\",\"showName\":\"关联不同类型的用户id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":36,\"type\":\"INPUT\",\"isShow\":true}],\"id\":9}', b'1', 42);
INSERT INTO `e_upms_operate_log` VALUES (46, '修改 | 菜单管理', '2022-04-23 00:48:35', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"教师管理\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"value\":\"TeacherEntity\",\"sort\":120,\"code\":\"DSzV8LTX\",\"id\":78}', b'1', 36);
INSERT INTO `e_upms_operate_log` VALUES (47, '修改 | 菜单管理', '2022-04-23 00:48:38', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"教师管理\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"value\":\"TeacherEntity\",\"sort\":120,\"code\":\"DSzV8LTX\",\"id\":78}', b'1', 11);
INSERT INTO `e_upms_operate_log` VALUES (48, '修改 | 菜单管理', '2022-04-23 00:48:50', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"教师管理\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"router\",\"value\":\"TeacherEntity\",\"sort\":120,\"code\":\"DSzV8LTX\",\"id\":78}', b'1', 53);
INSERT INTO `e_upms_operate_log` VALUES (49, '修改 | 菜单管理', '2022-04-23 00:49:27', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"教师管理\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"table\",\"value\":\"TeacherEntity\",\"sort\":120,\"code\":\"DSzV8LTX\",\"id\":78}', b'1', 34);
INSERT INTO `e_upms_operate_log` VALUES (50, '新增 | 教师管理', '2022-04-23 00:49:43', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/TeacherEntity', 'POST', '{\"teacher_id\":\"2112\",\"teacher_name\":\"1221\",\"teacher_email\":\"122\",\"teacher_phone\":\"2121\"}', b'1', 18);
INSERT INTO `e_upms_operate_log` VALUES (51, '新增 | 教师管理', '2022-04-23 00:49:49', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/TeacherEntity', 'POST', '{\"teacher_id\":\"1212\",\"teacher_name\":\"1221\",\"teacher_email\":\"1212\",\"teacher_phone\":\"1212\"}', b'1', 9);
INSERT INTO `e_upms_operate_log` VALUES (52, '新增 | 菜单管理', '2022-04-23 00:50:22', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"课程表\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"table\",\"value\":\"KcEntity\",\"sort\":130}', b'1', 29);
INSERT INTO `e_upms_operate_log` VALUES (53, '新增 | 课程表', '2022-04-23 00:50:59', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcEntity', 'POST', '{\"kc_id\":\"五千万\",\"kc_name\":\"无钱无权\"}', b'1', 12);
INSERT INTO `e_upms_operate_log` VALUES (54, '新增 | 菜单管理', '2022-04-23 00:51:31', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"课程表\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"table\",\"value\":\"KcEntity\",\"sort\":140}', b'1', 26);
INSERT INTO `e_upms_operate_log` VALUES (55, '新增 | 菜单管理', '2022-04-23 00:52:19', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"学院表\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"table\",\"value\":\"DeptEntity\",\"sort\":150}', b'1', 33);
INSERT INTO `e_upms_operate_log` VALUES (56, '修改 | 菜单管理', '2022-04-23 00:53:29', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"学院表\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"table\",\"value\":\"KcDeptEntity\",\"sort\":150,\"code\":\"yQ1qTlJk\",\"id\":93}', b'1', 22);
INSERT INTO `e_upms_operate_log` VALUES (57, '修改 | 菜单管理', '2022-04-23 00:53:54', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"课程签到发布\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"table\",\"value\":\"KcSignPublishEntity\",\"sort\":130,\"code\":\"SUqWH38A\",\"id\":83}', b'1', 20);
INSERT INTO `e_upms_operate_log` VALUES (58, '修改 | 菜单管理', '2022-04-23 00:54:36', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"详情\",\"status\":\"1\",\"parentMenu\":{\"id\":83,\"name\":\"课程签到发布\"},\"type\":\"button\",\"value\":\"KcSignPublishEntity@VIEW_DETAIL\",\"sort\":40,\"code\":\"5Lb4naua\",\"id\":87}', b'1', 19);
INSERT INTO `e_upms_operate_log` VALUES (59, '修改 | 菜单管理', '2022-04-23 00:54:41', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"新增\",\"status\":\"1\",\"parentMenu\":{\"id\":83,\"name\":\"课程签到发布\"},\"type\":\"button\",\"value\":\"KcSignPublishEntity@ADD\",\"sort\":10,\"code\":\"DZoZm1VK\",\"id\":84}', b'1', 23);
INSERT INTO `e_upms_operate_log` VALUES (60, '修改 | 菜单管理', '2022-04-23 00:54:55', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"删除\",\"status\":\"1\",\"parentMenu\":{\"id\":83,\"name\":\"课程签到发布\"},\"type\":\"button\",\"value\":\"KcSignPublishEntity@DELETE\",\"sort\":30,\"code\":\"WKc9kbuX\",\"id\":86}', b'1', 22);
INSERT INTO `e_upms_operate_log` VALUES (61, '修改 | 菜单管理', '2022-04-23 00:55:03', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"修改\",\"status\":\"1\",\"parentMenu\":{\"id\":83,\"name\":\"课程签到发布\"},\"type\":\"button\",\"value\":\"KcSignPublishEntity@EDIT\",\"sort\":20,\"code\":\"oga6Lo7M\",\"id\":85}', b'1', 20);
INSERT INTO `e_upms_operate_log` VALUES (62, '修改 | 代码生成器', '2022-04-23 00:56:06', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPublishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"sort\":3,\"type\":\"MAP\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":9},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"notNull\":true,\"query\":true,\"sort\":10,\"sortable\":false,\"id\":22,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"notNull\":true,\"query\":true,\"sort\":11,\"sortable\":false,\"id\":23,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":12,\"sortable\":false,\"id\":28,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"sign_last_time\",\"showName\":\"签到最晚时间\",\"notNull\":true,\"query\":true,\"sort\":13,\"sortable\":false,\"id\":37,\"type\":\"DATE_TIME\",\"isShow\":true}],\"id\":4}', b'1', 29);
INSERT INTO `e_upms_operate_log` VALUES (63, '修改 | 代码生成器', '2022-04-23 00:56:42', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPublishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"MAP\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"sort\":4,\"type\":\"HIDDEN\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":10},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"notNull\":true,\"query\":true,\"sort\":10,\"sortable\":false,\"id\":22,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"notNull\":true,\"query\":true,\"sort\":11,\"sortable\":false,\"id\":23,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":12,\"sortable\":false,\"id\":28,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"sign_last_time\",\"showName\":\"签到最晚时间\",\"notNull\":true,\"query\":true,\"sort\":13,\"sortable\":false,\"id\":37,\"type\":\"DATE_TIME\",\"isShow\":true}],\"id\":4}', b'1', 16);
INSERT INTO `e_upms_operate_log` VALUES (64, '修改 | 菜单管理', '2022-04-23 11:23:20', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"新增\",\"status\":\"1\",\"parentMenu\":{\"id\":93,\"name\":\"学院表\"},\"type\":\"button\",\"value\":\"KcDeptEntity@ADD\",\"sort\":10,\"code\":\"zmdJ1dHW\",\"id\":94}', b'1', 76);
INSERT INTO `e_upms_operate_log` VALUES (65, '修改 | 菜单管理', '2022-04-23 11:23:26', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"修改\",\"status\":\"1\",\"parentMenu\":{\"id\":93,\"name\":\"学院表\"},\"type\":\"button\",\"value\":\"KcDeptEntity@EDIT\",\"sort\":20,\"code\":\"eo8OcS2M\",\"id\":95}', b'1', 25);
INSERT INTO `e_upms_operate_log` VALUES (66, '修改 | 菜单管理', '2022-04-23 11:23:35', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"删除\",\"status\":\"1\",\"parentMenu\":{\"id\":93,\"name\":\"学院表\"},\"type\":\"button\",\"value\":\"KcDeptEntity@DELETE\",\"sort\":30,\"code\":\"oFFGSzoX\",\"id\":96}', b'1', 28);
INSERT INTO `e_upms_operate_log` VALUES (67, '修改 | 菜单管理', '2022-04-23 11:23:41', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"导出\",\"status\":\"1\",\"parentMenu\":{\"id\":93,\"name\":\"学院表\"},\"type\":\"button\",\"value\":\"KcDeptEntity@EXPORT\",\"sort\":40,\"code\":\"WJqNzrm0\",\"id\":97}', b'1', 26);
INSERT INTO `e_upms_operate_log` VALUES (68, '新增 | 学院表', '2022-04-23 11:23:50', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcDeptEntity', 'POST', '{\"dept_id\":\"212\",\"dept_name\":\"2121\"}', b'1', 19);
INSERT INTO `e_upms_operate_log` VALUES (69, '新增 | 课程表', '2022-04-23 11:23:56', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcEntity', 'POST', '{\"kc_id\":\"1221\",\"kc_name\":\"2121\"}', b'1', 10);
INSERT INTO `e_upms_operate_log` VALUES (70, '新增 | 课程签到发布', '2022-04-23 11:24:17', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"1221\",\"sign_name\":\"2112\",\"teacher_id\":\"xxx\",\"kc_id\":\"xxx\",\"sign_distance\":11,\"dept_id\":\"xxx\",\"must_sign_num\":\"11\",\"sign_time\":\"2022-04-23 11:24:12\"}', b'1', 3);
INSERT INTO `e_upms_operate_log` VALUES (71, '修改 | 代码生成器', '2022-04-23 11:26:35', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPublishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"sort\":3,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":9},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"sort\":4,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":10},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"sort\":10,\"type\":\"INPUT\",\"query\":false,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":22},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"sort\":11,\"type\":\"INPUT\",\"query\":false,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":23},{\"fieldName\":\"sign_time\",\"showName\":\"签到时间\",\"sort\":12,\"type\":\"DATE_TIME\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":28},{\"fieldName\":\"sign_last_time\",\"showName\":\"签到最晚时间\",\"sort\":13,\"type\":\"DATE_TIME\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":37}],\"id\":4}', b'1', 25);
INSERT INTO `e_upms_operate_log` VALUES (72, '修改 | 代码生成器', '2022-04-23 11:28:50', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPublishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"notNull\":true,\"query\":false,\"sort\":10,\"sortable\":false,\"id\":22,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"sort\":11,\"type\":\"HIDDEN\",\"query\":false,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":23},{\"fieldName\":\"sign_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":12,\"sortable\":false,\"id\":28,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"sign_last_time\",\"showName\":\"签到最晚时间\",\"notNull\":true,\"query\":true,\"sort\":13,\"sortable\":false,\"id\":37,\"type\":\"DATE_TIME\",\"isShow\":true}],\"id\":4}', b'1', 44);
INSERT INTO `e_upms_operate_log` VALUES (73, '新增 | 课程签到发布', '2022-04-23 11:30:10', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"122\",\"sign_name\":\"2121\",\"lat\":\"212\",\"lon\":\"122\",\"teacher_id\":\"xxx\",\"kc_id\":\"xxx\",\"sign_distance\":11,\"dept_id\":\"xxx\",\"must_sign_num\":\"2121\",\"sign_time\":\"2022-04-23 11:30:04\",\"sign_last_time\":\"2022-04-23 11:30:07\"}', b'1', 27);
INSERT INTO `e_upms_operate_log` VALUES (74, '新增 | 课程签到发布', '2022-04-23 11:30:14', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"122\",\"sign_name\":\"2121\",\"lat\":\"212\",\"lon\":\"122\",\"teacher_id\":\"xxx\",\"kc_id\":\"xxx\",\"sign_distance\":11,\"dept_id\":\"xxx\",\"must_sign_num\":\"2121\",\"sign_time\":\"2022-04-23 11:30:04\",\"sign_last_time\":\"2022-04-23 11:30:07\"}', b'1', 6);
INSERT INTO `e_upms_operate_log` VALUES (75, '修改 | 代码生成器', '2022-04-23 11:30:32', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPublishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"sort\":10,\"type\":\"INPUT\",\"query\":false,\"sortable\":false,\"notNull\":false,\"isShow\":true,\"id\":22},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"notNull\":true,\"query\":false,\"sort\":11,\"sortable\":false,\"id\":23,\"type\":\"HIDDEN\",\"isShow\":true},{\"fieldName\":\"sign_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":12,\"sortable\":false,\"id\":28,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"sign_last_time\",\"showName\":\"签到最晚时间\",\"notNull\":true,\"query\":true,\"sort\":13,\"sortable\":false,\"id\":37,\"type\":\"DATE_TIME\",\"isShow\":true}],\"id\":4}', b'1', 43);
INSERT INTO `e_upms_operate_log` VALUES (76, '新增 | 课程签到发布', '2022-04-23 11:32:11', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"2121\",\"sign_name\":\"12\",\"lat\":\"2121\",\"lon\":\"2121\",\"teacher_id\":\"xxx\",\"kc_id\":\"xxx\",\"sign_distance\":12,\"dept_id\":\"xxx\",\"must_sign_num\":\"12\",\"sign_time\":\"2022-04-23 11:32:03\",\"sign_last_time\":\"2022-04-30 11:32:08\"}', b'1', 33);
INSERT INTO `e_upms_operate_log` VALUES (77, '修改 | 代码生成器', '2022-04-23 11:32:32', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPublishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"notNull\":false,\"query\":false,\"sort\":10,\"sortable\":false,\"id\":22,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"sort\":11,\"type\":\"HIDDEN\",\"query\":false,\"sortable\":false,\"notNull\":false,\"isShow\":true,\"id\":23},{\"fieldName\":\"sign_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":12,\"sortable\":false,\"id\":28,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"sign_last_time\",\"showName\":\"签到最晚时间\",\"notNull\":true,\"query\":true,\"sort\":13,\"sortable\":false,\"id\":37,\"type\":\"DATE_TIME\",\"isShow\":true}],\"id\":4}', b'1', 45);
INSERT INTO `e_upms_operate_log` VALUES (78, '新增 | 课程签到发布', '2022-04-23 12:56:06', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"212\",\"sign_name\":\"1221\",\"lat\":\"2121\",\"lon\":\"12\",\"teacher_id\":\"yyy\",\"kc_id\":\"xxx\",\"sign_distance\":2121,\"dept_id\":\"xxx\",\"must_sign_num\":\"121\",\"sign_time\":\"2022-04-23 12:56:02\",\"sign_last_time\":\"2022-04-23 12:55:59\"}', b'1', 30);
INSERT INTO `e_upms_operate_log` VALUES (79, '新增 | 课程签到发布', '2022-04-23 12:57:41', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"1212\",\"sign_name\":\"121\",\"lat\":\"12\",\"lon\":\"2121\",\"teacher_id\":\"xxx\",\"kc_id\":\"xxx\",\"sign_distance\":12,\"dept_id\":\"xxx\",\"must_sign_num\":\"12\",\"sign_time\":\"2022-04-23 12:57:34\",\"sign_last_time\":\"2022-04-24 12:57:38\"}', b'1', 36);
INSERT INTO `e_upms_operate_log` VALUES (80, '新增 | 代码生成器', '2022-04-23 13:48:02', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"小程序token记录表\",\"className\":\"XcxTokenEntity\",\"tableName\":\"xcx_token\",\"remark\":\"小程序token记录表\",\"fields\":[{\"fieldName\":\"userId\",\"showName\":\"用户id\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-932},{\"fieldName\":\"token\",\"showName\":\"token\",\"sort\":2,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":false,\"isShow\":true,\"id\":-632},{\"fieldName\":\"expire_time\",\"showName\":\"过期时间\",\"sort\":3,\"type\":\"DATE_TIME\",\"query\":true,\"sortable\":false,\"notNull\":false,\"isShow\":true,\"id\":-523}]}', b'1', 33);
INSERT INTO `e_upms_operate_log` VALUES (81, '删除 | 课程签到发布', '2022-04-23 15:59:46', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity/1', 'DELETE', NULL, b'1', 40);
INSERT INTO `e_upms_operate_log` VALUES (82, '批量删除 | 课程表', '2022-04-23 16:05:47', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcEntity', 'DELETE', 'ids=[1, 2]\n', b'1', 46);
INSERT INTO `e_upms_operate_log` VALUES (83, '批量删除 | 学院表', '2022-04-23 16:05:51', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcDeptEntity', 'DELETE', 'ids=[1]\n', b'1', 20);
INSERT INTO `e_upms_operate_log` VALUES (84, '批量删除 | 教师管理', '2022-04-23 16:05:56', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/TeacherEntity', 'DELETE', 'ids=[1, 2, 9, 10, 11]\n', b'1', 38);
INSERT INTO `e_upms_operate_log` VALUES (85, '新增 | 学院表', '2022-04-23 16:06:13', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcDeptEntity', 'POST', '{\"dept_id\":\"1234\",\"dept_name\":\"计算机学院\"}', b'1', 23);
INSERT INTO `e_upms_operate_log` VALUES (86, '新增 | 课程表', '2022-04-23 16:06:27', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcEntity', 'POST', '{\"kc_id\":\"12345\",\"kc_name\":\"数据结构\"}', b'1', 12);
INSERT INTO `e_upms_operate_log` VALUES (87, '新增 | 教师管理', '2022-04-23 16:06:50', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/TeacherEntity', 'POST', '{\"teacher_id\":\"1234\",\"teacher_name\":\"张老师\",\"teacher_email\":\"614660823@qq.com\",\"teacher_phone\":\"1398590142\"}', b'1', 11);
INSERT INTO `e_upms_operate_log` VALUES (88, '新增 | 课程签到发布', '2022-04-23 16:07:25', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"2121\",\"sign_name\":\"体育课签到\",\"lat\":\"12\",\"lon\":\"12\",\"teacher_id\":\"12\",\"kc_id\":\"3\",\"sign_distance\":11,\"dept_id\":\"2\",\"must_sign_num\":\"111\",\"sign_time\":\"2022-04-23 16:07:19\",\"sign_last_time\":\"2022-04-24 16:07:21\"}', b'1', 14);
INSERT INTO `e_upms_operate_log` VALUES (89, '修改 | 代码生成器', '2022-04-23 16:33:08', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"学生表\",\"className\":\"StudentEntity\",\"tableName\":\"student\",\"remark\":\"学生表---小程序发起注册将信息注册到这张表\",\"fields\":[{\"fieldName\":\"stu_id\",\"showName\":\"学生id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":29,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"stu_dept\",\"showName\":\"学生学院\",\"notNull\":true,\"query\":true,\"sort\":11,\"sortable\":false,\"id\":31,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"sort\":3,\"type\":\"CHOICE\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-446}],\"id\":8}', b'1', 34);
INSERT INTO `e_upms_operate_log` VALUES (90, '新增 | 课程签到发布', '2022-04-23 16:56:11', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"teacher_id\":\"12\",\"kc_id\":\"3\",\"dept_id\":\"2\"}', b'1', 22);
INSERT INTO `e_upms_operate_log` VALUES (91, '新增 | 课程签到发布', '2022-04-23 16:56:23', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"21\",\"sign_name\":\"12\",\"lat\":\"12\",\"lon\":\"12\",\"teacher_id\":\"12\",\"kc_id\":\"3\",\"sign_distance\":21,\"dept_id\":\"2\",\"must_sign_num\":\"21\",\"sign_time\":\"2022-04-23 16:56:17\",\"sign_last_time\":\"2022-04-24 16:56:20\"}', b'1', 20);
INSERT INTO `e_upms_operate_log` VALUES (92, '新增 | 课程签到发布', '2022-04-23 16:57:45', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"21221\",\"sign_name\":\"1221\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"12\",\"kc_id\":\"3\",\"sign_distance\":1221,\"dept_id\":\"2\",\"must_sign_num\":\"1221\",\"sign_time\":\"2022-04-23 16:57:38\",\"sign_last_time\":\"2022-04-24 16:57:40\"}', b'1', 35);
INSERT INTO `e_upms_operate_log` VALUES (93, '批量删除 | 课程签到发布', '2022-04-23 17:25:58', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'DELETE', 'ids=[3]\n', b'1', 35);
INSERT INTO `e_upms_operate_log` VALUES (94, '新增 | 课程签到发布', '2022-04-23 17:26:22', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"12\",\"kc_id\":\"3\",\"sign_distance\":2112,\"dept_id\":\"2\",\"must_sign_num\":\"12\",\"sign_time\":\"2022-04-23 17:26:17\",\"sign_last_time\":\"2022-04-24 17:26:20\"}', b'1', 13);
INSERT INTO `e_upms_operate_log` VALUES (95, '修改 | 课程签到发布', '2022-04-23 17:28:30', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":2112,\"dept_id\":\"1234\",\"must_sign_num\":\"12\",\"sign_time\":\"2022-04-23 17:26:17\",\"sign_last_time\":\"2022-04-24 17:26:20\",\"id\":5}', b'1', 45);
INSERT INTO `e_upms_operate_log` VALUES (96, '修改 | 课程签到发布', '2022-04-23 17:29:58', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":2112,\"dept_id\":\"1234\",\"must_sign_num\":\"12\",\"sign_time\":\"2022-04-23 17:26:23\",\"sign_last_time\":\"2022-04-24 17:26:20\",\"id\":5}', b'1', 16);
INSERT INTO `e_upms_operate_log` VALUES (97, '修改 | 课程签到发布', '2022-04-23 17:30:22', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":2112,\"dept_id\":\"1234\",\"must_sign_num\":\"12\",\"sign_time\":\"2022-04-23 20:30:21\",\"sign_last_time\":\"2022-04-24 17:26:20\",\"id\":5}', b'1', 15);
INSERT INTO `e_upms_operate_log` VALUES (98, '修改 | 代码生成器', '2022-04-23 17:48:18', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"签到记录表\",\"className\":\"SignRecordEntity\",\"tableName\":\"sign_record\",\"remark\":\"签到记录表---将展示的发布的签到信息记录到这张表\",\"fields\":[{\"fieldName\":\"sign_publish_id\",\"showName\":\"签到发布Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":24,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_create_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":25,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":26,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":27,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"stu_id\",\"showName\":\"学生Id\",\"notNull\":true,\"query\":true,\"sort\":11,\"sortable\":false,\"id\":30,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"record_id\",\"showName\":\"记录id\",\"sort\":4,\"type\":\"INPUT\",\"query\":false,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-327}],\"id\":7}', b'1', 55);
INSERT INTO `e_upms_operate_log` VALUES (99, '新增 | 课程签到发布', '2022-04-23 17:56:56', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"2112\",\"sign_name\":\"1221\",\"lat\":\"1221\",\"lon\":\"12\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":1221,\"dept_id\":\"1234\",\"must_sign_num\":\"2112\",\"sign_time\":\"2022-04-24 17:56:44\",\"sign_last_time\":\"2022-04-24 17:56:53\"}', b'1', 44);
INSERT INTO `e_upms_operate_log` VALUES (100, '修改 | 课程签到发布', '2022-04-23 18:08:25', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"21121\",\"sign_name\":\"1221\",\"lat\":\"1221\",\"lon\":\"12\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":1221,\"dept_id\":\"1234\",\"must_sign_num\":\"2112\",\"sign_time\":\"2022-04-23 21:08:16\",\"sign_last_time\":\"2022-04-23 23:59:53\",\"id\":6}', b'1', 46);
INSERT INTO `e_upms_operate_log` VALUES (101, '修改 | 代码生成器', '2022-04-23 18:13:50', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"小程序注册登陆表\",\"className\":\"MiniUserEntity\",\"tableName\":\"mini_user\",\"remark\":\"小程序注册登陆表，选择登录方式可以查看不同信息，选择不同身份查看不同信息，老师可以直观查看一些简单的统计信息，选择1是学生可以签到，查看自己的统计信息，选择教师的时候可以查看老师发布的签到统计\",\"fields\":[{\"fieldName\":\"userId\",\"showName\":\"注册Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":32,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"register_type\",\"showName\":\"注册类型:1是学生，2是教师\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":33,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"username\",\"showName\":\"用户名\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":34,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"password\",\"showName\":\"密码\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":35,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"relation_id\",\"showName\":\"关联不同类型的用户id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":36,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"sort\":5,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-833}],\"id\":9}', b'1', 36);
INSERT INTO `e_upms_operate_log` VALUES (102, '修改 | 代码生成器', '2022-04-23 18:34:43', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"签到记录表\",\"className\":\"SignRecordEntity\",\"tableName\":\"sign_record\",\"remark\":\"签到记录表---将展示的发布的签到信息记录到这张表\",\"fields\":[{\"fieldName\":\"sign_publish_id\",\"showName\":\"签到发布Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":24,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_create_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":25,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":26,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":27,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"record_id\",\"showName\":\"记录id\",\"notNull\":true,\"query\":false,\"sort\":4,\"sortable\":false,\"id\":42,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"stu_id\",\"showName\":\"学生Id\",\"notNull\":true,\"query\":true,\"sort\":11,\"sortable\":false,\"id\":30,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_status\",\"showName\":\"签到状态\",\"sort\":11,\"type\":\"HIDDEN\",\"query\":true,\"sortable\":false,\"notNull\":false,\"isShow\":true,\"id\":-664}],\"id\":7}', b'1', 53);
INSERT INTO `e_upms_operate_log` VALUES (103, '新增 | 学院表', '2022-04-24 21:06:25', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcDeptEntity', 'POST', '{\"dept_id\":\"1234\",\"dept_name\":\"会计学院\"}', b'1', 34);
INSERT INTO `e_upms_operate_log` VALUES (104, '修改 | 学院表', '2022-04-24 22:26:40', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcDeptEntity', 'PUT', '{\"dept_id\":\"12345\",\"dept_name\":\"会计学院\",\"id\":3}', b'1', 38);
INSERT INTO `e_upms_operate_log` VALUES (105, '新增 | 课程签到发布', '2022-04-24 22:38:43', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"12345\",\"sign_name\":\"万千瓦\",\"lat\":\"12\",\"lon\":\"212\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":212,\"dept_id\":\"1234\",\"sign_time\":\"2022-04-25 22:38:36\",\"sign_last_time\":\"2022-04-25 22:38:32\"}', b'1', 12);
INSERT INTO `e_upms_operate_log` VALUES (106, '修改 | 课程签到发布', '2022-04-24 22:39:46', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"12345\",\"sign_name\":\"万千瓦\",\"lat\":\"12\",\"lon\":\"212\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":212,\"dept_id\":\"12345\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-25 22:38:36\",\"sign_last_time\":\"2022-04-25 22:38:32\",\"id\":7}', b'1', 14);
INSERT INTO `e_upms_operate_log` VALUES (107, '修改 | 代码生成器', '2022-04-25 21:11:28', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPublishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"notNull\":false,\"query\":false,\"sort\":10,\"sortable\":false,\"id\":22,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"notNull\":false,\"query\":false,\"sort\":11,\"sortable\":false,\"id\":23,\"type\":\"HIDDEN\",\"isShow\":true},{\"fieldName\":\"sign_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":12,\"sortable\":false,\"id\":28,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"sign_last_time\",\"showName\":\"签到最晚时间\",\"notNull\":true,\"query\":true,\"sort\":13,\"sortable\":false,\"id\":37,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"sign_date\",\"showName\":\"签到日期\",\"sort\":12,\"type\":\"HIDDEN\",\"query\":false,\"sortable\":false,\"notNull\":false,\"isShow\":false,\"id\":-359}],\"id\":4}', b'1', 83);
INSERT INTO `e_upms_operate_log` VALUES (108, '修改 | 代码生成器', '2022-04-25 21:14:09', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"课程签到发布\",\"className\":\"KcSignPublishEntity\",\"tableName\":\"kc_sign_puplish\",\"remark\":\"课程签到发布表--这个表是小程序Api获取展示前端页面，前端发起签到\",\"fields\":[{\"fieldName\":\"sign_id\",\"showName\":\"签到Id\",\"notNull\":true,\"query\":true,\"sort\":1,\"sortable\":false,\"id\":7,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"sign_name\",\"showName\":\"签到名称\",\"notNull\":true,\"query\":true,\"sort\":2,\"sortable\":false,\"id\":8,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lat\",\"showName\":\"签到维度\",\"notNull\":true,\"query\":true,\"sort\":3,\"sortable\":false,\"id\":9,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"lon\",\"showName\":\"签到经度\",\"notNull\":true,\"query\":true,\"sort\":4,\"sortable\":false,\"id\":10,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"teacher_id\",\"showName\":\"签到老师Id\",\"notNull\":true,\"query\":true,\"sort\":5,\"sortable\":false,\"id\":11,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"kc_id\",\"showName\":\"课程Id\",\"notNull\":true,\"query\":true,\"sort\":6,\"sortable\":false,\"id\":12,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"sign_distance\",\"showName\":\"签到距离\",\"notNull\":true,\"query\":true,\"sort\":7,\"sortable\":false,\"id\":13,\"type\":\"NUMBER\",\"isShow\":true},{\"fieldName\":\"dept_id\",\"showName\":\"学院id\",\"notNull\":true,\"query\":true,\"sort\":8,\"sortable\":false,\"id\":21,\"type\":\"CHOICE\",\"isShow\":true},{\"fieldName\":\"must_sign_num\",\"showName\":\"应签到数量\",\"notNull\":false,\"query\":false,\"sort\":10,\"sortable\":false,\"id\":22,\"type\":\"INPUT\",\"isShow\":true},{\"fieldName\":\"has_sign_num\",\"showName\":\"实际签到数量\",\"notNull\":false,\"query\":false,\"sort\":11,\"sortable\":false,\"id\":23,\"type\":\"HIDDEN\",\"isShow\":true},{\"fieldName\":\"sign_time\",\"showName\":\"签到时间\",\"notNull\":true,\"query\":true,\"sort\":12,\"sortable\":false,\"id\":28,\"type\":\"DATE_TIME\",\"isShow\":true},{\"fieldName\":\"sign_date\",\"showName\":\"签到日期\",\"sort\":12,\"type\":\"DATE\",\"query\":false,\"sortable\":false,\"notNull\":false,\"isShow\":false,\"id\":45},{\"fieldName\":\"sign_last_time\",\"showName\":\"签到最晚时间\",\"notNull\":true,\"query\":true,\"sort\":13,\"sortable\":false,\"id\":37,\"type\":\"DATE_TIME\",\"isShow\":true}],\"id\":4}', b'1', 58);
INSERT INTO `e_upms_operate_log` VALUES (109, '修改 | 课程签到发布', '2022-04-26 21:56:32', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":2112,\"dept_id\":\"1234\",\"must_sign_num\":\"12\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-26 22:30:21\",\"sign_last_time\":\"2022-04-26 23:35:21\",\"id\":5}', b'1', 47);
INSERT INTO `e_upms_operate_log` VALUES (110, '修改 | 课程签到发布', '2022-04-27 18:39:57', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"12345\",\"sign_name\":\"万千瓦\",\"lat\":\"12\",\"lon\":\"212\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":212,\"dept_id\":\"12345\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 19:30:21\",\"sign_last_time\":\"2022-04-27 23:36:21\",\"id\":7}', b'1', 54);
INSERT INTO `e_upms_operate_log` VALUES (111, '修改 | 课程签到发布', '2022-04-27 18:45:17', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":2112,\"dept_id\":\"2\",\"must_sign_num\":\"12\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-26 22:30:21\",\"sign_last_time\":\"2022-04-26 23:35:21\",\"id\":5}', b'1', 49);
INSERT INTO `e_upms_operate_log` VALUES (112, '修改 | 课程签到发布', '2022-04-27 18:45:21', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"12\",\"kc_id\":\"12345\",\"sign_distance\":2112,\"dept_id\":\"2\",\"must_sign_num\":\"12\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-26 22:30:21\",\"sign_last_time\":\"2022-04-26 23:35:21\",\"id\":5}', b'1', 20);
INSERT INTO `e_upms_operate_log` VALUES (113, '修改 | 课程签到发布', '2022-04-27 18:45:29', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"21121\",\"sign_name\":\"1221\",\"lat\":\"1221\",\"lon\":\"12\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":1221,\"dept_id\":\"3\",\"must_sign_num\":\"2112\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-24 19:30:21\",\"sign_last_time\":\"2022-04-24 23:30:21\",\"id\":6}', b'1', 16);
INSERT INTO `e_upms_operate_log` VALUES (114, '修改 | 课程签到发布', '2022-04-27 18:45:34', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"12345\",\"sign_name\":\"万千瓦\",\"lat\":\"12\",\"lon\":\"212\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":212,\"dept_id\":\"2\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 19:30:21\",\"sign_last_time\":\"2022-04-27 23:36:21\",\"id\":7}', b'1', 18);
INSERT INTO `e_upms_operate_log` VALUES (115, '修改 | 课程签到发布', '2022-04-27 18:45:42', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"21121\",\"sign_name\":\"1221\",\"lat\":\"1221\",\"lon\":\"12\",\"teacher_id\":\"12\",\"kc_id\":\"3\",\"sign_distance\":1221,\"dept_id\":\"3\",\"must_sign_num\":\"2112\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-24 19:30:21\",\"sign_last_time\":\"2022-04-24 23:30:21\",\"id\":6}', b'1', 22);
INSERT INTO `e_upms_operate_log` VALUES (116, '修改 | 课程签到发布', '2022-04-27 18:45:47', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"12\",\"kc_id\":\"3\",\"sign_distance\":2112,\"dept_id\":\"2\",\"must_sign_num\":\"12\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-26 22:30:21\",\"sign_last_time\":\"2022-04-26 23:35:21\",\"id\":5}', b'1', 15);
INSERT INTO `e_upms_operate_log` VALUES (117, '修改 | 课程签到发布', '2022-04-27 18:45:52', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"12345\",\"sign_name\":\"万千瓦\",\"lat\":\"12\",\"lon\":\"212\",\"teacher_id\":\"16\",\"kc_id\":\"3\",\"sign_distance\":212,\"dept_id\":\"2\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 19:30:21\",\"sign_last_time\":\"2022-04-27 23:36:21\",\"id\":7}', b'1', 16);
INSERT INTO `e_upms_operate_log` VALUES (118, '修改 | 课程签到发布', '2022-04-27 18:49:54', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"12\",\"kc_id\":\"3\",\"sign_distance\":2112,\"dept_id\":\"2\",\"must_sign_num\":\"12\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 22:30:21\",\"sign_last_time\":\"2022-04-27 23:35:21\",\"id\":5}', b'1', 22);
INSERT INTO `e_upms_operate_log` VALUES (119, '修改 | 课程签到发布', '2022-04-27 18:50:03', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"21121\",\"sign_name\":\"1221\",\"lat\":\"1221\",\"lon\":\"12\",\"teacher_id\":\"12\",\"kc_id\":\"3\",\"sign_distance\":1221,\"dept_id\":\"3\",\"must_sign_num\":\"2112\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 19:30:21\",\"sign_last_time\":\"2022-04-27 23:30:21\",\"id\":6}', b'1', 14);
INSERT INTO `e_upms_operate_log` VALUES (120, '修改 | 课程签到发布', '2022-04-27 18:50:10', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"12345\",\"sign_name\":\"万千瓦\",\"lat\":\"12\",\"lon\":\"212\",\"teacher_id\":\"16\",\"kc_id\":\"3\",\"sign_distance\":212,\"dept_id\":\"2\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 19:30:21\",\"sign_last_time\":\"2022-04-27 23:36:21\",\"id\":7}', b'1', 36);
INSERT INTO `e_upms_operate_log` VALUES (121, '修改 | 课程签到发布', '2022-04-27 18:52:28', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"1234\",\"kc_id\":\"3\",\"sign_distance\":2112,\"dept_id\":\"2\",\"must_sign_num\":\"12\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 22:30:21\",\"sign_last_time\":\"2022-04-27 23:35:21\",\"id\":5}', b'1', 52);
INSERT INTO `e_upms_operate_log` VALUES (122, '修改 | 课程签到发布', '2022-04-27 18:52:32', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"21121\",\"sign_name\":\"1221\",\"lat\":\"1221\",\"lon\":\"12\",\"teacher_id\":\"1234\",\"kc_id\":\"3\",\"sign_distance\":1221,\"dept_id\":\"3\",\"must_sign_num\":\"2112\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 19:30:21\",\"sign_last_time\":\"2022-04-27 23:30:21\",\"id\":6}', b'1', 17);
INSERT INTO `e_upms_operate_log` VALUES (123, '修改 | 课程签到发布', '2022-04-27 18:52:36', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"12345\",\"sign_name\":\"万千瓦\",\"lat\":\"12\",\"lon\":\"212\",\"teacher_id\":\"1234\",\"kc_id\":\"3\",\"sign_distance\":212,\"dept_id\":\"2\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 19:30:21\",\"sign_last_time\":\"2022-04-27 23:36:21\",\"id\":7}', b'1', 18);
INSERT INTO `e_upms_operate_log` VALUES (124, '修改 | 课程签到发布', '2022-04-27 18:52:39', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":2112,\"dept_id\":\"2\",\"must_sign_num\":\"12\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 22:30:21\",\"sign_last_time\":\"2022-04-27 23:35:21\",\"id\":5}', b'1', 15);
INSERT INTO `e_upms_operate_log` VALUES (125, '修改 | 课程签到发布', '2022-04-27 18:52:42', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"21121\",\"sign_name\":\"1221\",\"lat\":\"1221\",\"lon\":\"12\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":1221,\"dept_id\":\"3\",\"must_sign_num\":\"2112\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 19:30:21\",\"sign_last_time\":\"2022-04-27 23:30:21\",\"id\":6}', b'1', 17);
INSERT INTO `e_upms_operate_log` VALUES (126, '修改 | 课程签到发布', '2022-04-27 18:52:48', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"21121\",\"sign_name\":\"1221\",\"lat\":\"1221\",\"lon\":\"12\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":1221,\"dept_id\":\"1234\",\"must_sign_num\":\"2112\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 19:30:21\",\"sign_last_time\":\"2022-04-27 23:30:21\",\"id\":6}', b'1', 17);
INSERT INTO `e_upms_operate_log` VALUES (127, '修改 | 课程签到发布', '2022-04-27 18:52:53', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"12345\",\"sign_name\":\"万千瓦\",\"lat\":\"12\",\"lon\":\"212\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":212,\"dept_id\":\"1234\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 19:30:21\",\"sign_last_time\":\"2022-04-27 23:36:21\",\"id\":7}', b'1', 18);
INSERT INTO `e_upms_operate_log` VALUES (128, '修改 | 课程签到发布', '2022-04-27 18:52:57', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"2121\",\"lon\":\"122\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":2112,\"dept_id\":\"1234\",\"must_sign_num\":\"12\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 22:30:21\",\"sign_last_time\":\"2022-04-27 23:35:21\",\"id\":5}', b'1', 17);
INSERT INTO `e_upms_operate_log` VALUES (129, '修改 | 课程签到发布', '2022-04-27 18:52:59', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"12345\",\"sign_name\":\"万千瓦\",\"lat\":\"12\",\"lon\":\"212\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":212,\"dept_id\":\"1234\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 19:30:21\",\"sign_last_time\":\"2022-04-27 23:36:21\",\"id\":7}', b'1', 11);
INSERT INTO `e_upms_operate_log` VALUES (130, '修改 | 课程签到发布', '2022-04-27 19:22:25', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"31.23037\",\"lon\":\"121.4737\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":2112,\"dept_id\":\"1234\",\"must_sign_num\":\"12\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 18:30:21\",\"sign_last_time\":\"2022-04-27 18:30:21\",\"id\":5}', b'1', 49);
INSERT INTO `e_upms_operate_log` VALUES (131, '修改 | 课程签到发布', '2022-04-27 19:22:32', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"21121\",\"sign_name\":\"1221\",\"lat\":\"31.23037\",\"lon\":\"12\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":1221,\"dept_id\":\"1234\",\"must_sign_num\":\"2112\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 18:30:21\",\"sign_last_time\":\"2022-04-27 18:30:21\",\"id\":6}', b'1', 18);
INSERT INTO `e_upms_operate_log` VALUES (132, '修改 | 课程签到发布', '2022-04-27 19:22:41', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"21121\",\"sign_name\":\"1221\",\"lat\":\"31.23037\",\"lon\":\"121.4737\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":1221,\"dept_id\":\"1234\",\"must_sign_num\":\"2112\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 18:30:21\",\"sign_last_time\":\"2022-04-27 18:30:21\",\"id\":6}', b'1', 16);
INSERT INTO `e_upms_operate_log` VALUES (133, '修改 | 课程签到发布', '2022-04-27 19:22:49', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"12345\",\"sign_name\":\"万千瓦\",\"lat\":\"31.23037\",\"lon\":\"212\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":212,\"dept_id\":\"1234\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 18:30:21\",\"sign_last_time\":\"2022-04-27 18:30:21\",\"id\":7}', b'1', 16);
INSERT INTO `e_upms_operate_log` VALUES (134, '修改 | 课程签到发布', '2022-04-27 19:22:56', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"12345\",\"sign_name\":\"万千瓦\",\"lat\":\"31.23037\",\"lon\":\"121.4737\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":212,\"dept_id\":\"1234\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 18:30:21\",\"sign_last_time\":\"2022-04-27 18:30:21\",\"id\":7}', b'1', 17);
INSERT INTO `e_upms_operate_log` VALUES (135, '修改 | 课程签到发布', '2022-04-27 19:24:57', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"2112\",\"sign_name\":\"122\",\"lat\":\"31.23037\",\"lon\":\"121.4737\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":2112,\"dept_id\":\"1234\",\"must_sign_num\":\"12\",\"has_sign_num\":\"1\",\"sign_time\":\"2022-04-27 18:30:21\",\"sign_last_time\":\"2022-04-27 18:30:21\",\"id\":5}', b'1', 13);
INSERT INTO `e_upms_operate_log` VALUES (136, '批量删除 | 教师管理', '2022-04-28 21:38:54', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/TeacherEntity', 'DELETE', 'ids=[16, 17, 18, 19, 20, 21, 22, 23, 24]\n', b'1', 102);
INSERT INTO `e_upms_operate_log` VALUES (137, '批量删除 | 教师管理', '2022-04-28 21:38:57', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/TeacherEntity', 'DELETE', 'ids=[25]\n', b'1', 13);
INSERT INTO `e_upms_operate_log` VALUES (138, '新增 | 课程签到发布', '2022-04-28 21:39:44', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"12345\",\"sign_name\":\"签到\",\"lat\":\"22.226\",\"lon\":\"120.222\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":1222,\"dept_id\":\"12345\",\"must_sign_num\":\"11\",\"sign_time\":\"2022-04-28 21:39:34\",\"sign_last_time\":\"2022-04-28 23:39:40\"}', b'1', 84);
INSERT INTO `e_upms_operate_log` VALUES (139, '新增 | 课程签到发布', '2022-04-28 21:39:47', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'POST', '{\"sign_id\":\"123451\",\"sign_name\":\"签到\",\"lat\":\"22.226\",\"lon\":\"120.222\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":1222,\"dept_id\":\"12345\",\"must_sign_num\":\"11\",\"sign_time\":\"2022-04-28 21:39:34\",\"sign_last_time\":\"2022-04-28 23:39:40\"}', b'1', 15);
INSERT INTO `e_upms_operate_log` VALUES (140, '修改 | 课程签到发布', '2022-04-28 21:40:01', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/KcSignPublishEntity', 'PUT', '{\"sign_id\":\"123451\",\"sign_name\":\"签到\",\"lat\":\"22.226\",\"lon\":\"120.222\",\"teacher_id\":\"1234\",\"kc_id\":\"12345\",\"sign_distance\":1222,\"dept_id\":\"1234\",\"must_sign_num\":\"11\",\"sign_time\":\"2022-04-28 21:39:34\",\"sign_last_time\":\"2022-04-28 23:39:40\",\"id\":9}', b'1', 28);
INSERT INTO `e_upms_operate_log` VALUES (141, '新增 | 代码生成器', '2022-04-28 23:42:53', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"测试\",\"className\":\"TestEntity\",\"tableName\":\"test_table\",\"fields\":[{\"fieldName\":\"map_content\",\"showName\":\"地图\",\"sort\":1,\"type\":\"MAP\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-751}]}', b'1', 56);
INSERT INTO `e_upms_operate_log` VALUES (142, '修改 | 代码生成器', '2022-04-28 23:45:44', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'PUT', '{\"name\":\"测试\",\"className\":\"TestEntity\",\"tableName\":\"test_table\",\"fields\":[{\"fieldName\":\"map_content\",\"showName\":\"地图\",\"sort\":1,\"type\":\"MAP\",\"query\":false,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":46},{\"fieldName\":\"map_id\",\"showName\":\"地图Id\",\"sort\":2,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-562}],\"id\":11}', b'1', 63);
INSERT INTO `e_upms_operate_log` VALUES (143, '新增 | 菜单管理', '2022-04-28 23:47:18', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"测试功能\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"table\",\"value\":\"TestEntity\",\"sort\":160}', b'1', 62);
INSERT INTO `e_upms_operate_log` VALUES (144, '新增 | 测试功能', '2022-04-28 23:49:11', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/TestEntity', 'POST', '{\"map_content\":\"{\\\"id\\\":\\\"B000A83M61\\\",\\\"name\\\":\\\"北京西站\\\",\\\"district\\\":\\\"北京市丰台区\\\",\\\"adcode\\\":\\\"110106\\\",\\\"location\\\":[116.322056,39.89491],\\\"address\\\":\\\"莲花池东路118号\\\",\\\"typecode\\\":\\\"150200\\\",\\\"city\\\":[]}\",\"map_id\":\"21212\"}', b'1', 36);
INSERT INTO `e_upms_operate_log` VALUES (145, '新增 | 菜单管理', '2022-04-28 23:58:52', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"测试自定义页面\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"tpl\",\"value\":\"erupt.html\",\"sort\":170}', b'1', 68);
INSERT INTO `e_upms_operate_log` VALUES (146, '修改 | 菜单管理', '2022-04-30 15:58:27', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"测试自定义页面\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"tpl\",\"value\":\"publish-sign.html\",\"sort\":170,\"code\":\"9XPMW8er\",\"id\":107}', b'1', 89);
INSERT INTO `e_upms_operate_log` VALUES (147, '修改 | 菜单管理', '2022-04-30 15:58:58', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"发布签到信息\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"tpl\",\"value\":\"publish-sign.html\",\"sort\":170,\"code\":\"9XPMW8er\",\"id\":107}', b'1', 94);
INSERT INTO `e_upms_operate_log` VALUES (148, '修改 | 菜单管理', '2022-05-01 15:26:56', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"新版发布签到信息\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"tpl\",\"value\":\"publish-sign.html\",\"sort\":170,\"code\":\"9XPMW8er\",\"id\":107}', b'1', 79);
INSERT INTO `e_upms_operate_log` VALUES (149, '修改 | 菜单管理', '2022-05-01 15:27:05', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"旧版课程签到发布\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"table\",\"value\":\"KcSignPublishEntity\",\"sort\":130,\"code\":\"SUqWH38A\",\"id\":83}', b'1', 31);
INSERT INTO `e_upms_operate_log` VALUES (150, '删除 | 菜单管理', '2022-05-01 18:30:49', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu/87', 'DELETE', NULL, b'1', 140);
INSERT INTO `e_upms_operate_log` VALUES (151, '删除 | 菜单管理', '2022-05-01 18:30:52', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu/86', 'DELETE', NULL, b'1', 29);
INSERT INTO `e_upms_operate_log` VALUES (152, '删除 | 菜单管理', '2022-05-01 18:30:55', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu/85', 'DELETE', NULL, b'1', 28);
INSERT INTO `e_upms_operate_log` VALUES (153, '删除 | 菜单管理', '2022-05-01 18:30:58', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu/84', 'DELETE', NULL, b'1', 28);
INSERT INTO `e_upms_operate_log` VALUES (154, '删除 | 菜单管理', '2022-05-01 18:31:03', NULL, '192.168.252.1', 'admin', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu/83', 'DELETE', NULL, b'1', 23);
INSERT INTO `e_upms_operate_log` VALUES (155, '新增 | 代码生成器', '2022-05-01 22:23:05', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GeneratorClass', 'POST', '{\"name\":\"年级管理\",\"className\":\"GradeEntity\",\"tableName\":\"grade\",\"remark\":\"年级管理表\",\"fields\":[{\"fieldName\":\"grade_id\",\"showName\":\"年级Id\",\"sort\":1,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-429},{\"fieldName\":\"grade_name\",\"showName\":\"年级名\",\"sort\":2,\"type\":\"INPUT\",\"query\":true,\"sortable\":false,\"notNull\":true,\"isShow\":true,\"id\":-720}]}', b'1', 50);
INSERT INTO `e_upms_operate_log` VALUES (156, '新增 | 菜单管理', '2022-05-01 22:24:36', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"年级管理\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"table\",\"value\":\"GradeEntity\",\"sort\":180}', b'1', 54);
INSERT INTO `e_upms_operate_log` VALUES (157, '新增 | 年级管理', '2022-05-01 22:31:36', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GradeEntity', 'POST', '{\"grade_id\":\"1221\",\"grade_name\":\"大一\"}', b'1', 32);
INSERT INTO `e_upms_operate_log` VALUES (158, '新增 | 年级管理', '2022-05-01 22:31:42', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GradeEntity', 'POST', '{\"grade_id\":\"22131\",\"grade_name\":\"大二\"}', b'1', 12);
INSERT INTO `e_upms_operate_log` VALUES (159, '新增 | 年级管理', '2022-05-01 22:31:49', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GradeEntity', 'POST', '{\"grade_id\":\"121221\",\"grade_name\":\"大三\"}', b'1', 10);
INSERT INTO `e_upms_operate_log` VALUES (160, '新增 | 年级管理', '2022-05-01 22:32:01', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/GradeEntity', 'POST', '{\"grade_id\":\"2121\",\"grade_name\":\"大四\"}', b'1', 11);
INSERT INTO `e_upms_operate_log` VALUES (161, '批量删除 | 教师管理', '2022-05-01 23:21:57', NULL, '26.26.26.1', 'admin', '美国|0|加利福尼亚|0|0', 'http://localhost:8080/erupt-api/data/modify/TeacherEntity', 'DELETE', 'ids=[39, 44, 45]\n', b'1', 48);
INSERT INTO `e_upms_operate_log` VALUES (162, '新增 | 菜单管理', '2022-05-02 16:01:13', NULL, '192.168.1.7', 'admin', '0|0|0|内网IP|内网IP', 'http://192.168.1.7:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"统计\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"上课考勤管理\"},\"type\":\"tpl\",\"value\":\"simple-total.html\",\"sort\":190}', b'1', 67);

-- ----------------------------
-- Table structure for e_upms_org
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_org`;
CREATE TABLE `e_upms_org`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `parent_org_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKc2wj35ujq2m84uw59dx6wy3gj`(`code`) USING BTREE,
  INDEX `FKtj7222kjnkt7pv9kfn9g8ck4h`(`parent_org_id`) USING BTREE,
  CONSTRAINT `FKtj7222kjnkt7pv9kfn9g8ck4h` FOREIGN KEY (`parent_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_org
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_post
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_post`;
CREATE TABLE `e_upms_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKltq5h3n5cyyk5nxtjhg9lhidg`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_post
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role`;
CREATE TABLE `e_upms_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `create_user_id` bigint NULL DEFAULT NULL,
  `update_user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKjgxkp7mr4183tcwosrbqpsl3a`(`code`) USING BTREE,
  INDEX `FKad39xpgtpmhq0fp5newnabv1g`(`create_user_id`) USING BTREE,
  INDEX `FKbghup2p4f1x9eokeygyg8p658`(`update_user_id`) USING BTREE,
  CONSTRAINT `FKad39xpgtpmhq0fp5newnabv1g` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKbghup2p4f1x9eokeygyg8p658` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_role
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role_menu`;
CREATE TABLE `e_upms_role_menu`  (
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FKr6bl403chgwjnb6jk0uqqd9x8`(`menu_id`) USING BTREE,
  CONSTRAINT `FKgsdnakqsme4htxkiapwmf6tbi` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKr6bl403chgwjnb6jk0uqqd9x8` FOREIGN KEY (`menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_user
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user`;
CREATE TABLE `e_upms_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_admin` bit(1) NULL DEFAULT NULL,
  `is_md5` bit(1) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reset_pwd_time` datetime NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `white_ip` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `erupt_org_id` bigint NULL DEFAULT NULL,
  `erupt_post_id` bigint NULL DEFAULT NULL,
  `create_user_id` bigint NULL DEFAULT NULL,
  `update_user_id` bigint NULL DEFAULT NULL,
  `erupt_menu_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK812t22yn0295dkkvx5gjgahax`(`account`) USING BTREE,
  INDEX `FK1re8jv3614mkk2wfxscvgvmnm`(`erupt_org_id`) USING BTREE,
  INDEX `FK53cice19aydjcuykpv847ocdv`(`erupt_post_id`) USING BTREE,
  INDEX `FKdvwfw4x66ahh1tavd69cnx4i0`(`create_user_id`) USING BTREE,
  INDEX `FKct3f9stm4eti10401f7rbh5ey`(`update_user_id`) USING BTREE,
  INDEX `FKga0jd7sahnn1tv14mq4dy5kba`(`erupt_menu_id`) USING BTREE,
  CONSTRAINT `FK1re8jv3614mkk2wfxscvgvmnm` FOREIGN KEY (`erupt_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK53cice19aydjcuykpv847ocdv` FOREIGN KEY (`erupt_post_id`) REFERENCES `e_upms_post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKct3f9stm4eti10401f7rbh5ey` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdvwfw4x66ahh1tavd69cnx4i0` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKga0jd7sahnn1tv14mq4dy5kba` FOREIGN KEY (`erupt_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_user
-- ----------------------------
INSERT INTO `e_upms_user` VALUES (1, 'admin', '2022-04-22 22:39:17', NULL, 'admin', NULL, b'1', b'1', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '2022-04-22 22:40:47', b'1', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for e_upms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user_role`;
CREATE TABLE `e_upms_user_role`  (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FK3h4lekfh26f5f8b7by3ejges6`(`role_id`) USING BTREE,
  CONSTRAINT `FK3h4lekfh26f5f8b7by3ejges6` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKes2ylim5w3ej690ss84sb956x` FOREIGN KEY (`user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `grade_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `grade_id`(`grade_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, '1221', '大一');
INSERT INTO `grade` VALUES (2, '22131', '大二');
INSERT INTO `grade` VALUES (3, '121221', '大三');
INSERT INTO `grade` VALUES (4, '2121', '大四');

-- ----------------------------
-- Table structure for kc
-- ----------------------------
DROP TABLE IF EXISTS `kc`;
CREATE TABLE `kc`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kc_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kc_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `kc_id`(`kc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kc
-- ----------------------------
INSERT INTO `kc` VALUES (3, '12345', '数据结构');

-- ----------------------------
-- Table structure for kc_dept
-- ----------------------------
DROP TABLE IF EXISTS `kc_dept`;
CREATE TABLE `kc_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dept_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dept_id`(`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kc_dept
-- ----------------------------
INSERT INTO `kc_dept` VALUES (2, '1234', '计算机学院');
INSERT INTO `kc_dept` VALUES (3, '12345', '会计学院');

-- ----------------------------
-- Table structure for kc_sign_puplish
-- ----------------------------
DROP TABLE IF EXISTS `kc_sign_puplish`;
CREATE TABLE `kc_sign_puplish`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dept_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `has_sign_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kc_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `must_sign_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign_distance` int NULL DEFAULT NULL,
  `sign_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign_last_time` datetime NULL DEFAULT NULL,
  `sign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign_time` datetime NULL DEFAULT NULL,
  `teacher_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign_date` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sign_id`(`sign_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kc_sign_puplish
-- ----------------------------
INSERT INTO `kc_sign_puplish` VALUES (16, '1234', '1', '12345', '31.199289704616', '121.56548344715', '10', 110000, '1520619103688200192', '2022-05-02 00:07:13', '签到1', '2022-05-02 00:07:13', '1234', '', '上海市上海市浦东新区白杨路1065弄-1-～29号', '1221');
INSERT INTO `kc_sign_puplish` VALUES (18, '1234', '0', '12345', '31.199289704616', '121.56548344715', '10', 110000, '1520621861770235904', '2022-05-02 12:20:13', '12212', '2022-05-02 00:07:13', '1234', '', '上海市上海市浦东新区白杨路1065弄-1-～29号', '22131');
INSERT INTO `kc_sign_puplish` VALUES (19, '1234', '1', '12345', '31.199289704616', '121.56548344715', '10', 110000, '1520665946514132992', '2022-05-02 12:20:13', '签到2', '2022-05-02 00:07:13', '1234', '', '上海市上海市浦东新区白杨路1065弄-1-～29号', '1221');
INSERT INTO `kc_sign_puplish` VALUES (20, '1234', '1', '12345', '31.199289704616', '121.56548344715', '10', 110000, '1520670048337924096', '2022-05-02 12:20:13', '2121', '2022-05-02 00:07:13', '1234', '', '上海市上海市浦东新区白杨路1065弄-1-～29号', '1221');
INSERT INTO `kc_sign_puplish` VALUES (21, '1234', '1', '12345', '31.199289704616', '121.56548344715', '10', 110000, '1520670120203128832', '2022-05-02 12:20:13', '1221', '2022-05-02 00:07:13', '1234', '', '上海市上海市浦东新区白杨路1065弄-1-～29号', '1221');
INSERT INTO `kc_sign_puplish` VALUES (22, '1234', '1', '12345', '31.199289704616', '121.56548344715', '10', 110000, '1520683768287989760', '2022-05-02 12:20:13', '驱蚊器', '2022-05-02 00:07:13', '1234', '', '上海市上海市浦东新区白杨路1065弄-1-～29号', '1221');

-- ----------------------------
-- Table structure for kc_teacher
-- ----------------------------
DROP TABLE IF EXISTS `kc_teacher`;
CREATE TABLE `kc_teacher`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kc_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kc_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for mini_user
-- ----------------------------
DROP TABLE IF EXISTS `mini_user`;
CREATE TABLE `mini_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `register_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `relation_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12436 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mini_user
-- ----------------------------
INSERT INTO `mini_user` VALUES (1243, '1', '1', '122121', '2', '2', '1234', '张', '1', '1221');
INSERT INTO `mini_user` VALUES (12435, '1', '1', '122121', '1', '1', '1234', '张', '1', '1221');

-- ----------------------------
-- Table structure for sign_record
-- ----------------------------
DROP TABLE IF EXISTS `sign_record`;
CREATE TABLE `sign_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign_create_time` datetime NULL DEFAULT NULL,
  `sign_publish_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `record_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2152 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sign_record
-- ----------------------------
INSERT INTO `sign_record` VALUES (2152, '31.23037', '121.4737', '2022-05-02 16:57:30', '1520619103688200192', '2', '1651481850093', '2');
INSERT INTO `sign_record` VALUES (2153, '31.23037', '121.4737', '2022-05-02 17:00:56', '1520665946514132992', '2', '1651482056453', '2');
INSERT INTO `sign_record` VALUES (2154, '31.23037', '121.4737', '2022-05-02 17:01:05', '1520670048337924096', '2', '1651482065002', '2');
INSERT INTO `sign_record` VALUES (2155, '31.23037', '121.4737', '2022-05-02 17:01:07', '1520670120203128832', '2', '1651482067291', '2');
INSERT INTO `sign_record` VALUES (2156, '31.23037', '121.4737', '2022-05-02 17:01:08', '1520683768287989760', '2', '1651482068808', '2');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stu_dept` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `stu_id`(`stu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `teacher_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (12, '614660823@qq.com', '1234', '张老师', '1398590142');

-- ----------------------------
-- Table structure for teacher_dept
-- ----------------------------
DROP TABLE IF EXISTS `teacher_dept`;
CREATE TABLE `teacher_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dept_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher_dept
-- ----------------------------

-- ----------------------------
-- Table structure for test_table
-- ----------------------------
DROP TABLE IF EXISTS `test_table`;
CREATE TABLE `test_table`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `map_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `map_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test_table
-- ----------------------------
INSERT INTO `test_table` VALUES (1, '{\"id\":\"B000A83M61\",\"name\":\"北京西站\",\"district\":\"北京市丰台区\",\"adcode\":\"110106\",\"location\":[116.322056,39.89491],\"address\":\"莲花池东路118号\",\"typecode\":\"150200\",\"city\":[]}', '21212');

-- ----------------------------
-- Table structure for xcx_token
-- ----------------------------
DROP TABLE IF EXISTS `xcx_token`;
CREATE TABLE `xcx_token`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expire_time` datetime NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2140 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xcx_token
-- ----------------------------
INSERT INTO `xcx_token` VALUES (2125, '2022-05-02 16:38:05', '8cfa2282b17de0a598c010f5f0109e7d', '12345');
INSERT INTO `xcx_token` VALUES (2126, '2022-05-02 16:38:05', '8cfa2282b17de0a598c010f5f0109e7d', '12345');
INSERT INTO `xcx_token` VALUES (2127, '2022-04-24 22:07:23', 'ea48576f30be1669971699c09ad05c94', '123456');
INSERT INTO `xcx_token` VALUES (2128, '2022-04-24 22:07:23', 'cc435cc61e91b0c2c12cdc9eb8071eb6', '1234567');
INSERT INTO `xcx_token` VALUES (2129, '2022-05-01 22:34:35', '2aac2bf010de80409dc87b6eccd515bd', '1234568');
INSERT INTO `xcx_token` VALUES (2130, '2022-05-01 21:22:09', 'a29d1598024f9e87beab4b98411d48ce', '21');
INSERT INTO `xcx_token` VALUES (2131, '2022-05-09 15:09:49', '6512bd43d9caa6e02c990b0a82652dca', '1');
INSERT INTO `xcx_token` VALUES (2132, '2022-05-09 15:09:49', '6512bd43d9caa6e02c990b0a82652dca', '1');
INSERT INTO `xcx_token` VALUES (2133, '2022-05-09 15:10:10', 'b6d767d2f8ed5d21a44b0e5886680cb9', '2');
INSERT INTO `xcx_token` VALUES (2134, '2022-05-01 22:39:29', '182be0c5cdcd5072bb1864cdee4d3d6e', '3');
INSERT INTO `xcx_token` VALUES (2135, '2022-05-04 23:02:57', 'd959caadac9b13dcb3e609440135cf54', '12345678');
INSERT INTO `xcx_token` VALUES (2136, '2022-05-04 23:12:55', '1c21e3af2b67bc6ac62683d9a82999ab', 'A123456');
INSERT INTO `xcx_token` VALUES (2137, '2022-05-08 22:07:56', 'c88714a8e0bc7a5c0392fdedc7267f9c', '12212112');
INSERT INTO `xcx_token` VALUES (2138, '2022-05-08 22:46:41', '946b76e0b0be7763db05c9dfc2322281', '12212121');
INSERT INTO `xcx_token` VALUES (2139, '2022-05-08 22:53:27', '33e0dc25901ba7ccd08a8dfcea10d3b3', '122121');

SET FOREIGN_KEY_CHECKS = 1;
