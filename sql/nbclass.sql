/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50642
Source Host           : localhost:3306
Source Database       : zb-blog

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2019-12-25 18:28:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `intro` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL COMMENT '封面图',
  `content` longtext CHARACTER SET utf8 COMMENT '文章内容',
  `content_md` longtext CHARACTER SET utf8 COMMENT 'markdown版的文章内容',
  `editor_type` tinyint(1) DEFAULT NULL COMMENT '1-富文本，2-markdown',
  `alias_name` varchar(50) DEFAULT NULL COMMENT '路径别名',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
  `is_top` tinyint(1) DEFAULT NULL COMMENT '是否置顶，1-是，0-否',
  `is_rec` tinyint(1) DEFAULT NULL COMMENT '是否推荐，1-是，0-否',
  `is_public` tinyint(1) DEFAULT NULL COMMENT '1-公开，2-私密',
  `is_comment` tinyint(1) DEFAULT NULL COMMENT '开启评论：1-是，2-否',
  `type` tinyint(1) DEFAULT '1' COMMENT '文章类型，1-图文，2-视频',
  `video` varchar(255) DEFAULT NULL COMMENT '视频地址',
  `origin` tinyint(1) DEFAULT '1' COMMENT '1-原创，2-转载',
  `look_num` int(10) DEFAULT '0' COMMENT '阅读数',
  `support_num` int(10) DEFAULT '0' COMMENT '支持（赞）数',
  `oppose_num` int(10) DEFAULT '0' COMMENT '反对（踩）',
  `comment_num` int(10) DEFAULT '0' COMMENT '评论数',
  `template` varchar(50) DEFAULT NULL COMMENT '模板',
  `seo_key` varchar(255) DEFAULT NULL,
  `seo_desc` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '用户状态：1有效; 0-草稿',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blog_article
-- ----------------------------

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) unsigned NOT NULL COMMENT '标签表主键',
  `article_id` int(11) unsigned NOT NULL COMMENT '文章ID',
  `status` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
INSERT INTO `blog_article_tag` VALUES ('23', '13', '12', '1', '2019-12-16 13:24:56', '2019-12-16 13:24:56');
INSERT INTO `blog_article_tag` VALUES ('24', '14', '12', '1', '2019-12-16 13:24:56', '2019-12-16 13:24:56');
INSERT INTO `blog_article_tag` VALUES ('25', '15', '12', '1', '2019-12-16 13:24:56', '2019-12-16 13:24:56');
INSERT INTO `blog_article_tag` VALUES ('26', '24', '3', '1', '2019-12-19 15:49:05', '2019-12-19 15:49:05');
INSERT INTO `blog_article_tag` VALUES ('27', '25', '3', '1', '2019-12-19 15:49:05', '2019-12-19 15:49:05');
INSERT INTO `blog_article_tag` VALUES ('28', '26', '3', '1', '2019-12-19 15:49:05', '2019-12-19 15:49:05');
INSERT INTO `blog_article_tag` VALUES ('29', '27', '1', '1', '2019-12-20 13:41:33', '2019-12-20 13:41:33');
INSERT INTO `blog_article_tag` VALUES ('30', '24', '4', '1', '2019-12-25 15:54:28', '2019-12-25 15:54:28');
INSERT INTO `blog_article_tag` VALUES ('31', '27', '5', '1', '2019-12-25 15:54:46', '2019-12-25 15:54:46');

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `alias_name` varchar(50) DEFAULT NULL COMMENT '分类别名',
  `type` tinyint(1) DEFAULT NULL COMMENT '0-目录，1-栏目页面',
  `sort` int(5) DEFAULT NULL COMMENT '排序',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `template` varchar(50) DEFAULT NULL COMMENT '模板名称',
  `description` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '用户状态：1有效; 0删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES ('42', null, '多级目录', '', '0', '3', 'fa fa-share', '', null, '1', '2019-12-13 10:54:42', '2019-12-13 10:54:42');
INSERT INTO `blog_category` VALUES ('43', null, '音乐', 'music', '1', '4', 'fa fa-music', 'index', null, '1', '2019-12-13 10:55:37', '2019-12-13 10:55:37');
INSERT INTO `blog_category` VALUES ('44', '42', '二级目录1', '', '0', '1', 'fa fa-share', '', null, '1', '2019-12-13 10:56:51', '2019-12-13 10:56:51');
INSERT INTO `blog_category` VALUES ('45', '42', '二级目录2', '', '0', '2', 'fa fa-share', '', null, '1', '2019-12-13 10:57:23', '2019-12-13 10:57:23');
INSERT INTO `blog_category` VALUES ('47', '42', '二级菜单2', 'level2-2', '1', '4', 'fa fa-send', 'index', null, '1', '2019-12-13 10:58:59', '2019-12-13 10:58:59');
INSERT INTO `blog_category` VALUES ('48', '44', '三级菜单1', 'level-3-1', '1', '2', 'fa fa-send', 'index', null, '1', '2019-12-13 11:00:52', '2019-12-13 11:48:37');
INSERT INTO `blog_category` VALUES ('49', '45', '三级菜单2', 'level-3-2', '1', '1', 'fa fa-send', 'index', null, '1', '2019-12-13 11:01:44', '2019-12-13 11:02:42');
INSERT INTO `blog_category` VALUES ('50', '44', '三级目录1', '', '0', '1', 'fa fa-share', '', null, '1', '2019-12-13 11:48:30', '2019-12-13 11:48:30');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL COMMENT '被评论的文章或者页面的ID(-1:留言板)',
  `mid` int(11) DEFAULT NULL COMMENT '主评论id',
  `parent_id` int(11) DEFAULT NULL,
  `parent_nickname` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL COMMENT '评论人的QQ（未登录用户）',
  `nickname` varchar(50) DEFAULT NULL COMMENT '评论人的昵称（未登录用户）',
  `avatar` varchar(255) DEFAULT NULL COMMENT '评论人的头像地址',
  `email` varchar(100) DEFAULT NULL COMMENT '评论人的邮箱地址（未登录用户）',
  `ip` varchar(20) DEFAULT NULL COMMENT '评论时的ip',
  `os` varchar(50) DEFAULT NULL COMMENT '评论时的系统类型',
  `browser` varchar(50) DEFAULT NULL COMMENT '评论时的浏览器类型',
  `content` text COMMENT '评论的内容',
  `floor` int(10) DEFAULT NULL COMMENT '楼层',
  `support_num` int(10) DEFAULT '0' COMMENT '支持（赞）数',
  `oppose_num` int(10) DEFAULT '0' COMMENT '反对（踩）',
  `status` tinyint(1) DEFAULT '0' COMMENT '0-待审核，1-通过，2-驳回',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------

-- ----------------------------
-- Table structure for blog_config
-- ----------------------------
DROP TABLE IF EXISTS `blog_config`;
CREATE TABLE `blog_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `sys_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态   1-有效，0-无效',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`sys_key`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of blog_config
-- ----------------------------
INSERT INTO `blog_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG', '{\"type\":0,\"localDomain\":\"http://localhost:8080\",\"localPrefix\":\"\",\"qiniuDomain\":\"http://cdn.nbclass.com\",\"qiniuPrefix\":\"img/blog\",\"qiniuAccessKey\":\"dGKQzLej_0__Xd9kElc7IK-BXFTs\",\"qiniuSecretKey\":\"8sZZbdmEDS4yVx0DCF_-Das\",\"qiniuBucketName\":\"xxx\",\"aliyunDomain\":\"https://xxx.oss-cn-hangzhou.aliyuncs.com\",\"aliyunPrefix\":\"blog/\",\"aliyunEndPoint\":\"oss-cn-hangzhou.aliyuncs.com\",\"aliyunAccessKeyId\":\"LTAI4FgN4uWUatpHLxxjXmv1\",\"aliyunAccessKeySecret\":\"OJTXOBiLxxpKCAMURVlonFGdHb1n1\",\"aliyunBucketName\":\"xxx-img\",\"qcloudDomain\":\"https://xxx.cos.ap-shanghai.myqcloud.com\",\"qcloudPrefix\":\"blog/\",\"qcloudSecretId\":\"AKIDrxxxgT2fMDNHud5HDtOTJlACx\",\"qcloudSecretKey\":\"iBSZP6WifMn3A1cxxxwULwH\",\"qcloudBucketName\":\"sttbaxxx\",\"qcloudRegion\":\"ap-shanghai\"}', '云存储配置信息', '1', '2019-12-25 18:21:53', '2019-12-25 18:21:54');
INSERT INTO `blog_config` VALUES ('2', 'SITE_HOST', 'http://localhost:8080', '网站域名', '1', '2019-12-25 18:21:53', '2019-12-25 18:22:00');
INSERT INTO `blog_config` VALUES ('3', 'SITE_CDN', 'http://localhost:8080', 'CDN域名', '1', '2019-12-25 18:21:53', '2019-12-25 18:22:01');
INSERT INTO `blog_config` VALUES ('5', 'SITE_NAME', 'nbclass', '网站名称', '1', '2019-12-25 18:21:53', '2019-12-25 18:22:02');
INSERT INTO `blog_config` VALUES ('6', 'SITE_KWD', 'nbclass,博客模板,zblog,zb-blog,个人博客，开源博客，shiro,zb-shiro,权限管理项目', '网站关键字', '1', '2019-12-25 18:21:53', '2019-12-25 18:22:03');
INSERT INTO `blog_config` VALUES ('7', 'SITE_DESC', 'nbclass,博客模板,zblog,zb-blog,个人博客，开源博客，shiro,zb-shiro,权限管理项目', '网站描述', '1', '2019-12-25 18:21:53', '2019-12-25 18:22:03');
INSERT INTO `blog_config` VALUES ('8', 'EDITOR_TYPE', '1', '编辑器类型', '1', '2019-12-25 18:21:53', '2019-12-25 18:23:17');
INSERT INTO `blog_config` VALUES ('9', 'SITE_ICON', '/img/logo-color.png', '网站ico', '1', '2019-12-25 18:21:53', '2019-12-25 18:23:04');
INSERT INTO `blog_config` VALUES ('10', 'SITE_LOGO', '/img/logo-color.png', '网站logo', '1', '2019-12-25 18:21:53', '2019-12-25 18:23:06');
INSERT INTO `blog_config` VALUES ('12', 'ADMIN_SITE_LOGO', '/img/logo-white.png', '后台logo', '1', '2019-12-25 18:21:53', '2019-12-25 18:23:10');
INSERT INTO `blog_config` VALUES ('13', 'ADMIN_SITE_NAME', 'Just', '后台标题', '1', '2019-12-25 18:21:53', '2019-12-25 18:22:37');

-- ----------------------------
-- Table structure for blog_file
-- ----------------------------
DROP TABLE IF EXISTS `blog_file`;
CREATE TABLE `blog_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `original_name` varchar(255) DEFAULT NULL COMMENT '原始文件名称',
  `file_name` varchar(50) DEFAULT NULL COMMENT '文件名称',
  `file_type` varchar(20) DEFAULT NULL COMMENT '文件类型',
  `file_size` varchar(20) DEFAULT NULL COMMENT '友链图片地址',
  `file_path` varchar(255) DEFAULT NULL COMMENT '文件相对路径',
  `file_full_path` varchar(255) DEFAULT NULL COMMENT '文件绝对路径',
  `file_hash` varchar(255) DEFAULT NULL,
  `oss_type` tinyint(1) DEFAULT NULL COMMENT 'oss存储类型',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of blog_file
-- ----------------------------
INSERT INTO `blog_file` VALUES ('1', 'https://nbclass.com', '测试友链', '友链', '111', '222', '333', null, '1', '1', '2019-10-21 16:34:51', '2019-10-21 16:34:52');

-- ----------------------------
-- Table structure for blog_link
-- ----------------------------
DROP TABLE IF EXISTS `blog_link`;
CREATE TABLE `blog_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '链接名',
  `url` varchar(200) NOT NULL COMMENT '链接地址',
  `description` varchar(300) DEFAULT NULL COMMENT '链接介绍',
  `img` varchar(255) DEFAULT NULL COMMENT '友链图片地址',
  `email` varchar(100) DEFAULT NULL COMMENT '友链站长邮箱',
  `qq` varchar(50) DEFAULT NULL COMMENT '友链站长qq',
  `origin` tinyint(1) DEFAULT NULL COMMENT '1-管理员添加 2-自助申请',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of blog_link
-- ----------------------------
INSERT INTO `blog_link` VALUES ('1', 'zheng qifeng', '1', '2', '', '523179414@qq.com', '', '1', '1', '2019-12-19 15:51:32', '2019-12-19 15:51:32');
INSERT INTO `blog_link` VALUES ('2', '123', '123', '123', '', '', '', '1', '0', '2019-12-19 15:51:44', '2019-12-19 15:51:44');

-- ----------------------------
-- Table structure for blog_slider
-- ----------------------------
DROP TABLE IF EXISTS `blog_slider`;
CREATE TABLE `blog_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '内容',
  `img` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT '是否有链接',
  `status` tinyint(1) DEFAULT NULL COMMENT '1-有效，0-无效',
  `type` tinyint(4) DEFAULT NULL COMMENT '1-系统公告，2-轮播',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_slider
-- ----------------------------
INSERT INTO `blog_slider` VALUES ('10', '测试公告，链接可点', '', 'https://baidu.com', '1', '1', '2019-08-12 18:05:55', '2019-10-24 17:33:05');
INSERT INTO `blog_slider` VALUES ('17', '123', 'http://localhost:8080/file/20191219/wujBrGST.jpg', '123', null, '2', '2019-12-19 18:53:25', '2019-12-19 18:53:25');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '标签名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1有效; 0删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(16) NOT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL,
  `salt` varchar(128) DEFAULT NULL COMMENT '加密盐值',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `qq` varchar(20) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '用户状态：1有效; 0删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES ('11', '1000000376129709', '123123', '80b43a78648551e37f4ea3d747c00ae8', '6d83d8232c264cada799b29913d68a18', '12312311', '523179414@qq.com', '+8615558111891', '132', 'http://localhost:8080/file/20191220/GQXFhxVW.jpg', null, '1', '2019-10-14 10:33:44', '2019-12-20 12:56:38');
INSERT INTO `blog_user` VALUES ('12', '1000000862441215', '123456', '47b816ee4434cff22b070602299fbc7f', '8bdac39c0c1a46dd9f8c4a1d7cc9eecf', '123456', 'zqf@eyecloud.tech', null, null, '/img/logo.jpg', null, '1', '2019-10-16 11:50:10', '2019-10-16 11:54:42');
INSERT INTO `blog_user` VALUES ('26', '1000001821081159', '123123111', '58a211e1f5d2f4aa1f7838f791ed44db', '5bdb0fa5fe194e288e184fd41054456d', '123123111', 'zqf@eyecloud.tech', null, null, null, null, '1', '2019-10-16 18:12:37', null);
INSERT INTO `blog_user` VALUES ('27', '1000001005442793', '1231231111', 'd9d17b66976a40d03edffee18f468e0a', '6379137af74b40ddb007eb7b075ea91c', '1231231111', 'zqf@eyecloud.tech', null, null, null, null, '1', '2019-10-16 18:14:20', null);
INSERT INTO `blog_user` VALUES ('28', '1000000084722103', '12312311111ad', '1f3f1616a9e83f49ec15340307a2b7ba', 'd1ff9a844e8b421f8405be7d52cde145', '12312311111ad', 'zqf@eyecloud.tech', null, null, null, null, '1', '2019-10-16 18:15:52', null);
INSERT INTO `blog_user` VALUES ('29', '1000000304019149', '1231231sad', '9f3e675e69443006b89e75e73b9ed8bd', '49065bceb1064e618991146715be3312', '1231231sad', 'zqf@eyecloud.tech', null, null, null, null, '1', '2019-10-16 18:18:04', null);
INSERT INTO `blog_user` VALUES ('30', '1000000430000419', '123123阿萨德1', '1349dce6070270f254b0bdebb13de7d4', '43d593035b5043a680ed7d11f73cf02f', '123123阿萨德1', 'zqf@eyecloud.tech', null, null, null, null, '1', '2019-10-16 18:20:28', null);
INSERT INTO `blog_user` VALUES ('31', '1000001050238574', '1231231撒打', 'c8c5f469efc9b583484647fbc54e5cfc', 'f1fddbe600a44487a060e0bbe0d96533', '1231231撒打', 'zqf@eyecloud.tech', null, null, null, null, '1', '2019-10-16 18:22:16', null);
INSERT INTO `blog_user` VALUES ('32', '1000001111251827', '123123撒打', 'ac97e3bedd04090bdc171cff0a031ce3', 'cafde50b574149a0a33ae728f97e9c73', '123123撒打', 'zqf@eyecloud.tech', null, null, null, null, '1', '2019-10-16 18:22:37', null);
INSERT INTO `blog_user` VALUES ('33', '1000001922317478', '123123阿萨德撒', 'c6088b102d7143e22c4b87b8f34ef643', 'be99ab22d4b142f7be0b330933699af7', '123123阿萨德撒', 'zqf@eyecloud.tech', null, null, null, null, '1', '2019-10-16 18:23:59', null);
INSERT INTO `blog_user` VALUES ('34', '1000001181550461', '1231231打as', '2881cb8a8326156fe3e3d7802091a11f', '3794a5dcf28b4ebcafac053e71e56f28', '1231231打as', 'zqf@eyecloud.tech', null, null, null, null, '1', '2019-10-16 18:24:35', null);
INSERT INTO `blog_user` VALUES ('35', '1000000062922144', '1231231打as111', '9b198740495e1b5d1fb93972b4b037e7', 'e101b7383847400c8a86cfcabe0fc4b5', '1231231打as111', 'zqf@eyecloud.tech', null, null, null, null, '1', '2019-10-16 18:25:56', null);
INSERT INTO `blog_user` VALUES ('36', '1000001569294961', '1231231打as111自行车道', 'eef5d282fbeea4c7a1d2c025473b03ca', '348442abedef4de09b18206ffe3698b5', '1231231打as111自行车道', 'zqf@eyecloud.tech', null, null, null, null, '1', '2019-10-16 18:26:43', null);
