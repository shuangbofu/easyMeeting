CREATE DATABASE IF NOT EXISTS `easymeeting` DEFAULT CHARACTER SET utf8;
USE `easymeeting`;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
	`account` varchar(12) NOT NULL COMMENT '用户名',
	`password` varchar(12) NOT NULL COMMENT '密码',
	`name` varchar(8) NOT NULL COMMENT '姓名',
	`phone` varchar(12) NOT NULL COMMENT '联系电话',
	`email` varchar(20) NOT NULL COMMENT '电子邮箱',
	`dept` int(4) NOT NULL COMMENT '部门',
	`gender` tinyint(1) NOT NULL COMMENT '年龄',
	`status` tinyint(1) NOT NULL COMMENT '用户状态 --4：待审批， 1：已审批， 2：已关闭， 3：审批不通过',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
	`name` varchar(32) NOT NULL COMMENT '会议名称',
	`room_id` int(11) NOT NULL COMMENT '会议室id',
	`count` int(4) NOT NULL COMMENT '预计参加人数',
	`start_time` datetime NOT NULL COMMENT '预计会议开始时间',
	`end_time` datetime NOT NULL COMMENT '预计会议结束时间',
	`create_time` datetime NOT NULL COMMENT '会议预定时间',
	`creator_id` int(11) NOT NULL COMMENT '会议预定者',
	`note` varchar(128) COMMENT '会议说明',
	`status` tinyint(1) comment '当前状态-- 1：可用； 0：不可用',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
	`number` int(10) NOT NULL COMMENT '门牌号',
	`name` varchar(16) NOT NULL COMMENT '会议室名称',
	`max_count` int(4) NOT NULL COMMENT '最多容纳人数',
	`status` tinyint(1) NOT NULL COMMENT '当前状态-- 1：可用； 0：不可用',
	`note` varchar(128) COMMENT '备注',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for meeting_employee
-- ----------------------------
DROP TABLE IF EXISTS `meeting_employee`;
CREATE TABLE `meeting_employee` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
	`meeting_id` int(11) NOT NULL COMMENT '会议id',
	`u_id` int(11) NOT NULL COMMENT '用户id',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
	`name` varchar(12) NOT NULL COMMENT '部门名称',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
	`ip` varchar(16) NOT NULL COMMENT 'IP地址',
	`count` int(12) NOT NULL COMMENT '访问次数',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;