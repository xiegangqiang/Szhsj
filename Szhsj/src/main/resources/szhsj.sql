/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : szhsj

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-12-03 20:40:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `attention`
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `id` varchar(32) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `ismarkcode` bit(1) DEFAULT NULL,
  `markcode` varchar(255) DEFAULT NULL,
  `wx` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attention
-- ----------------------------
INSERT INTO `attention` VALUES ('402881f15139b676015139c3b1220005', null, '2015-11-24 21:57:36', '欢迎关注测试', '', 'mm', '402881f15139b676015139c3b1220003');

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` varchar(32) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `leaf` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `checked` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0001', '2014-07-01 15:14:08', '2014-07-01 15:14:10', '0', '1', '基本功能', null, null, '', null, null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0006', '2014-07-01 15:14:44', '2014-07-01 15:14:47', '0', '2', '3G站功能', null, null, '', null, null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0009', '2014-07-01 15:15:09', '2014-07-01 15:15:05', '0', '3', '营销功能', null, null, '', null, null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0010', '2014-07-01 15:15:21', '2014-07-01 15:15:22', '0', '4', '商务功能', null, null, '', null, null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0011', '2014-07-01 15:15:52', '2014-07-01 15:15:53', '0', '5', '会员功能', null, null, '', null, null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0012', '2014-07-01 15:16:16', '2014-07-01 15:16:20', '1', '3', '分类管理', 'classify', '2c958da346862c52014686333e5c0006', '', '/app/resources/default/images/classify.png', null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0013', '2014-07-01 16:54:44', '2014-07-01 16:54:46', '1', '1', '功能管理', 'authority', '2c958da346862c52014686333e5c0001', '', '/app/resources/default/images/gongneng.png', null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0017', '2014-07-03 08:56:22', '2014-07-03 08:56:24', '1', '4', 'DIY菜单', 'diymen', '2c958da346862c52014686333e5c0006', '', '/app/resources/default/images/diymen.png', null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0018', '2014-07-04 16:12:56', '2014-07-04 16:12:57', '1', '4', '图文回复', 'imagemes', '2c958da346862c52014686333e5c0001', '', '/app/resources/default/images/imagemes.png', null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0020', '2014-07-08 14:21:08', '2014-07-08 14:21:10', '1', '1', '首页设置', 'home', '2c958da346862c52014686333e5c0006', '', '/app/resources/default/images/home.png', null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0021', '2014-07-09 09:19:58', '2014-07-09 09:19:59', '1', '2', '模版管理', 'website', '2c958da346862c52014686333e5c0006', '', '/app/resources/default/images/website.png', null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0022', '2014-07-09 14:53:39', '2014-07-09 14:53:41', '1', '3', '文本回复', 'textmes', '2c958da346862c52014686333e5c0001', '', '/app/resources/default/images/textmes.png', null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0023', '2014-07-10 14:43:12', '2014-07-10 14:43:13', '1', '2', '关注回复', 'attention', '2c958da346862c52014686333e5c0001', '', '/app/resources/default/images/guanzhu.png', null);
INSERT INTO `authority` VALUES ('2c958da346862c52014686333e5c0032', '2014-08-25 15:08:50', '2014-08-25 15:08:52', '1', '6', '拨号版权', 'plugMenu', '2c958da346862c52014686333e5c0006', '', '/app/resources/default/images/copyright.png', null);

-- ----------------------------
-- Table structure for `classify`
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `id` varchar(32) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `descript` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `wx` varchar(255) DEFAULT NULL,
  `markcode` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `smallimg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classify
-- ----------------------------

-- ----------------------------
-- Table structure for `diymen`
-- ----------------------------
DROP TABLE IF EXISTS `diymen`;
CREATE TABLE `diymen` (
  `id` varchar(32) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `markcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  `url` text,
  `visible` bit(1) DEFAULT NULL,
  `wx` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diymen
-- ----------------------------

-- ----------------------------
-- Table structure for `home`
-- ----------------------------
DROP TABLE IF EXISTS `home`;
CREATE TABLE `home` (
  `id` varchar(32) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `descript` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `markcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `siteimg` varchar(255) DEFAULT NULL,
  `wx` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of home
-- ----------------------------
INSERT INTO `home` VALUES ('402881f15139b676015139c3b1220004', '2015-11-24 21:51:44', '2015-11-24 21:51:44', null, null, null, '首页', null, '402881f15139b676015139c3b1220003');

-- ----------------------------
-- Table structure for `imagemes`
-- ----------------------------
DROP TABLE IF EXISTS `imagemes`;
CREATE TABLE `imagemes` (
  `id` varchar(32) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `classify` varchar(255) DEFAULT NULL,
  `content` text,
  `descript` text,
  `img` varchar(255) DEFAULT NULL,
  `isImg` bit(1) DEFAULT NULL,
  `markcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` text,
  `visible` bit(1) DEFAULT NULL,
  `wx` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `viewcount` int(255) DEFAULT '0',
  `smallimg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imagemes
-- ----------------------------

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` varchar(32) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `leaf` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('2c958da346862c52014686333e5c0001', '2014-06-12 10:20:40', '2014-06-12 10:20:42', null, '0', '平台功能', null, null, '', '1', null);
INSERT INTO `menu` VALUES ('2c958da346862c52014686333e5c0002', '2014-07-01 16:44:31', '2014-07-01 16:44:33', null, '0', '功能介绍', null, null, '', '1', null);

-- ----------------------------
-- Table structure for `model`
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` varchar(32) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `detailtmp` varchar(255) DEFAULT NULL,
  `hometmp` varchar(255) DEFAULT NULL,
  `listtmp` varchar(255) DEFAULT NULL,
  `wx` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model
-- ----------------------------

-- ----------------------------
-- Table structure for `plugmenu`
-- ----------------------------
DROP TABLE IF EXISTS `plugmenu`;
CREATE TABLE `plugmenu` (
  `id` varchar(32) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value1` varchar(255) DEFAULT NULL,
  `value2` varchar(255) DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `wx` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plugmenu
-- ----------------------------
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a00001', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '菜单颜色', null, null, '', '402881f15134a1b6015134aaf9e10004', '');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a00002', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '页面版权', null, null, '', '402881f15134a1b6015134aaf9e10004', '');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a00003', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '电话', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a00004', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '会员资料', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a00005', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '导航', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a00006', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '分享', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a20007', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '首页', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a20008', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '相册', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a30009', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '邮箱', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a3000a', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '购物', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a3000b', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '会员卡', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a6000c', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '活动', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a7000d', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '新浪微博', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a7000e', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '腾讯微博', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a8000f', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '腾讯空间', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2a90010', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '音乐', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2ae0011', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '视频', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2af0012', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '推荐', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402881f15134b175015134b5d2af0013', '2015-11-23 22:18:29', '2015-11-23 22:18:29', null, '其它', null, null, '', '402881f15134a1b6015134aaf9e10004', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5c0002', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '菜单颜色', null, null, '', '402881f15139b676015139c3b1220003', '');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5c0003', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '页面版权', null, null, '', '402881f15139b676015139c3b1220003', '');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5c0004', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '电话', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5d0005', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '会员资料', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5d0006', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '导航', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5e0007', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '分享', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5e0008', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '首页', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5e0009', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '相册', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5e000a', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '邮箱', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5e000b', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '购物', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5e000c', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '会员卡', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5e000d', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '活动', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5f000e', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '新浪微博', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5f000f', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '腾讯微博', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5f0010', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '腾讯空间', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de5f0011', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '音乐', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de680012', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '视频', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de6c0013', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '推荐', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402881f1513e572e01513ea4de6c0014', '2015-11-25 20:36:10', '2015-11-25 20:36:10', null, '其它', null, null, '', '402881f15139b676015139c3b1220003', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190011', '2014-10-10 03:00:29', '2014-10-10 22:58:05', null, '菜单颜色', null, '#FF99CC', '', '4028820248f8d71c0148f8daee530002', '');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190012', '2014-10-10 03:00:29', '2014-10-10 03:15:49', '0', '页面版权', '13546584684', null, '', '4028820248f8d71c0148f8daee530002', '');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190013', '2014-10-10 03:00:29', '2014-10-10 03:16:20', '1', '电话', 'tel:10086', null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190014', '2014-10-10 03:00:29', '2014-10-10 03:16:33', '0', '会员资料', '333665555', null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190015', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '导航', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190016', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '分享', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190017', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '首页', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190018', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '相册', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190019', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '邮箱', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd519001a', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '购物', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd519001b', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '会员卡', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd519001c', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '活动', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd519001d', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '新浪微博', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd519001e', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '腾讯微博', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd519001f', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '腾讯空间', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190020', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '音乐', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190021', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '视频', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190022', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '推荐', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('4028820248f8d71c0148f8dbd5190023', '2014-10-10 03:00:29', '2014-10-10 03:00:29', null, '其它', null, null, '', '4028820248f8d71c0148f8daee530002', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30003', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '菜单颜色', null, null, '', '402881862bf08f18012bf0b1304a0001', '');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30004', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '页面版权', null, null, '', '402881862bf08f18012bf0b1304a0001', '');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30005', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '电话', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30006', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '会员资料', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30007', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '导航', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30008', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '分享', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30009', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '首页', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff3000a', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '相册', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff3000b', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '邮箱', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff3000c', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '购物', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff3000d', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '会员卡', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff3000e', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '活动', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff3000f', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '新浪微博', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30010', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '腾讯微博', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30011', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '腾讯空间', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30012', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '音乐', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30013', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '视频', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30014', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '推荐', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('4028820248fe29cb014908becff30015', '2014-10-13 05:02:43', '2014-10-13 05:02:43', null, '其它', null, null, '', '402881862bf08f18012bf0b1304a0001', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0030', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '菜单颜色', null, null, '', '402882024974abfa0149ad297ba8001c', '');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0031', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '页面版权', null, null, '', '402882024974abfa0149ad297ba8001c', '');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0032', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '电话', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0033', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '会员资料', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0034', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '导航', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0035', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '分享', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0036', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '首页', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0037', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '相册', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0038', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '邮箱', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0039', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '购物', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c003a', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '会员卡', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c003b', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '活动', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c003c', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '新浪微博', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c003d', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '腾讯微博', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c003e', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '腾讯空间', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c003f', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '音乐', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0040', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '视频', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0041', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '推荐', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024974abfa0149ad3b990c0042', '2014-11-14 02:36:44', '2014-11-14 02:36:44', null, '其它', null, null, '', '402882024974abfa0149ad297ba8001c', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c0832645001f', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '菜单颜色', null, null, '', '4028820249bcd7530149bd2588b8000a', '');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c08326450020', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '页面版权', null, null, '', '4028820249bcd7530149bd2588b8000a', '');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c08326450021', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '电话', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c08326450022', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '会员资料', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c08326450023', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '导航', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c08326450024', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '分享', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c08326450025', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '首页', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c08326450026', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '相册', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c08326450027', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '邮箱', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c08326450028', '2014-11-17 20:27:40', '2014-11-18 01:30:36', '0', '购物', '', null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c08326450029', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '会员卡', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c0832645002a', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '活动', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c0832645002b', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '新浪微博', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c0832645002c', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '腾讯微博', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c0832645002d', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '腾讯空间', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c0832645002e', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '音乐', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c0832645002f', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '视频', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c08326450030', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '推荐', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('4028820249bcd7530149c08326450031', '2014-11-17 20:27:40', '2014-11-17 20:27:40', null, '其它', null, null, '', '4028820249bcd7530149bd2588b8000a', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00be', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '菜单颜色', null, null, '', '402882024add1d80014b0b54f5ca0056', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00bf', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '页面版权', null, null, '', '402882024add1d80014b0b54f5ca0056', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00c0', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '电话', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00c1', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '会员资料', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00c2', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '导航', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00c3', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '分享', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00c4', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '首页', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00c5', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '相册', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00c6', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '邮箱', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00c7', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '购物', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00c8', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '会员卡', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00c9', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '活动', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00ca', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '新浪微博', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00cb', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '腾讯微博', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00cc', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '腾讯空间', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00cd', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '音乐', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00ce', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '视频', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00cf', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '推荐', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b3ee4c3db00d0', '2015-01-31 02:29:14', '2015-01-31 02:29:14', null, '其它', null, null, '', '402882024add1d80014b0b54f5ca0056', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0151', '2015-02-05 04:11:59', '2015-02-06 04:24:41', null, '菜单颜色', null, '#FF0000', '', '402882024b2467a0014b2fbbc7620044', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0152', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '页面版权', null, null, '', '402882024b2467a0014b2fbbc7620044', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0153', '2015-02-05 04:11:59', '2015-02-06 04:24:34', '0', '电话', '0758-2813777', null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0154', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '会员资料', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0155', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '导航', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0156', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '分享', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0157', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '首页', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0158', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '相册', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0159', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '邮箱', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd015a', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '购物', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd015b', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '会员卡', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd015c', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '活动', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd015d', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '新浪微博', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd015e', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '腾讯微博', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd015f', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '腾讯空间', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0160', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '音乐', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0161', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '视频', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0162', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '推荐', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5902a2dd0163', '2015-02-05 04:11:59', '2015-02-05 04:11:59', null, '其它', null, null, '', '402882024b2467a0014b2fbbc7620044', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da01f4', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '菜单颜色', null, null, '', '402882024b2467a0014b52299b2a00fe', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da01f5', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '页面版权', null, null, '', '402882024b2467a0014b52299b2a00fe', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da01f6', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '电话', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da01f7', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '会员资料', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da01f8', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '导航', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da01f9', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '分享', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da01fa', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '首页', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da01fb', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '相册', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da01fc', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '邮箱', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da01fd', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '购物', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da01fe', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '会员卡', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da01ff', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '活动', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da0200', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '新浪微博', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da0201', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '腾讯微博', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da0202', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '腾讯空间', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da0203', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '音乐', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da0204', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '视频', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da0205', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '推荐', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014b5e2756da0206', '2015-02-06 04:10:11', '2015-02-06 04:10:11', null, '其它', null, null, '', '402882024b2467a0014b52299b2a00fe', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02ef', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '菜单颜色', null, null, '', '402882024b2467a0014bc4e723f102d2', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02f0', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '页面版权', null, null, '', '402882024b2467a0014bc4e723f102d2', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02f1', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '电话', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02f2', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '会员资料', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02f3', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '导航', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02f4', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '分享', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02f5', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '首页', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02f6', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '相册', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02f7', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '邮箱', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02f8', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '购物', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02f9', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '会员卡', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02fa', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '活动', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02fb', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '新浪微博', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02fc', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '腾讯微博', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02fd', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '腾讯空间', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02fe', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '音乐', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf02ff', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '视频', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf0300', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '推荐', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014bc4f23abf0301', '2015-02-26 03:13:04', '2015-02-26 03:13:04', null, '其它', null, null, '', '402882024b2467a0014bc4e723f102d2', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03cc', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '菜单颜色', null, null, '', '402882024b2467a0014be3c3e87a0349', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03cd', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '页面版权', null, null, '', '402882024b2467a0014be3c3e87a0349', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03ce', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '电话', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03cf', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '会员资料', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03d0', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '导航', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03d1', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '分享', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03d2', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '首页', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03d3', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '相册', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03d4', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '邮箱', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03d5', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '购物', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03d6', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '会员卡', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03d7', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '活动', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03d8', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '新浪微博', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03d9', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '腾讯微博', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03da', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '腾讯空间', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03db', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '音乐', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03dc', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '视频', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03dd', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '推荐', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014be3d6e3ca03de', '2015-03-04 03:11:26', '2015-03-04 03:11:26', null, '其它', null, null, '', '402882024b2467a0014be3c3e87a0349', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304d7', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '菜单颜色', null, null, '', '402882024b2467a0014c21bebf000490', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304d8', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '页面版权', null, null, '', '402882024b2467a0014c21bebf000490', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304d9', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '电话', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304da', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '会员资料', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304db', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '导航', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304dc', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '分享', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304dd', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '首页', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304de', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '相册', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304df', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '邮箱', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304e0', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '购物', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304e1', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '会员卡', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304e2', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '活动', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304e3', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '新浪微博', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304e4', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '腾讯微博', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304e5', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '腾讯空间', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304e6', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '音乐', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304e7', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '视频', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304e8', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '推荐', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ac5979304e9', '2015-03-24 03:53:25', '2015-03-24 03:53:25', null, '其它', null, null, '', '402882024b2467a0014c21bebf000490', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404ea', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '菜单颜色', null, null, '', '402882024b2467a0014be3cc64d703a0', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404eb', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '页面版权', null, null, '', '402882024b2467a0014be3cc64d703a0', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404ec', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '电话', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404ed', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '会员资料', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404ee', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '导航', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404ef', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '分享', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404f0', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '首页', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404f1', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '相册', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404f2', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '邮箱', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404f3', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '购物', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404f4', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '会员卡', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404f5', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '活动', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404f6', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '新浪微博', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404f7', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '腾讯微博', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404f8', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '腾讯空间', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404f9', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '音乐', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404fa', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '视频', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404fb', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '推荐', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c4ea06a0404fc', '2015-03-24 21:51:18', '2015-03-24 21:51:18', null, '其它', null, null, '', '402882024b2467a0014be3cc64d703a0', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a804ff', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '菜单颜色', null, null, '', '402882024b2467a0014bee3fdc270443', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a80500', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '页面版权', null, null, '', '402882024b2467a0014bee3fdc270443', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a80501', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '电话', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a80502', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '会员资料', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a80503', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '导航', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a80504', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '分享', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a80505', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '首页', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a80506', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '相册', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a80507', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '邮箱', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a80508', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '购物', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a80509', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '会员卡', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a8050a', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '活动', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a8050b', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '新浪微博', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a8050c', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '腾讯微博', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a8050d', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '腾讯空间', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a8050e', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '音乐', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a8050f', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '视频', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a80510', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '推荐', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c593335a80511', '2015-03-26 23:07:50', '2015-03-26 23:07:50', null, '其它', null, null, '', '402882024b2467a0014bee3fdc270443', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360513', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '菜单颜色', null, null, '', '402882024b2467a0014be3c198600344', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360514', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '页面版权', null, null, '', '402882024b2467a0014be3c198600344', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360515', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '电话', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360516', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '会员资料', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360517', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '导航', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360518', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '分享', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360519', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '首页', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf36051a', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '相册', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf36051b', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '邮箱', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf36051c', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '购物', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf36051d', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '会员卡', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf36051e', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '活动', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf36051f', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '新浪微博', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360520', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '腾讯微博', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360521', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '腾讯空间', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360522', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '音乐', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360523', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '视频', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360524', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '推荐', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014c6dceaf360525', '2015-03-30 23:10:04', '2015-03-30 23:10:04', null, '其它', null, null, '', '402882024b2467a0014be3c198600344', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f0579', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '菜单颜色', null, null, '', '402882024b2467a0014cefa5edc30557', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f057a', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '页面版权', null, null, '', '402882024b2467a0014cefa5edc30557', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f057b', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '电话', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f057c', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '会员资料', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f057d', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '导航', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f057e', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '分享', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f057f', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '首页', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f0580', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '相册', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f0581', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '邮箱', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f0582', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '购物', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f0583', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '会员卡', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f0584', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '活动', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f0585', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '新浪微博', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f0586', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '腾讯微博', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f0587', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '腾讯空间', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f0588', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '音乐', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f0589', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '视频', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f058a', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '推荐', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014cf8ed323f058b', '2015-04-26 23:30:36', '2015-04-26 23:30:36', null, '其它', null, null, '', '402882024b2467a0014cefa5edc30557', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605cc', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '菜单颜色', null, null, '', '402882024b2467a0014d556ab14505b9', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605cd', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '页面版权', null, null, '', '402882024b2467a0014d556ab14505b9', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605ce', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '电话', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605cf', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '会员资料', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605d0', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '导航', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605d1', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '分享', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605d2', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '首页', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605d3', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '相册', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605d4', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '邮箱', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605d5', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '购物', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605d6', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '会员卡', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605d7', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '活动', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605d8', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '新浪微博', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605d9', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '腾讯微博', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605da', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '腾讯空间', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605db', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '音乐', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605dc', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '视频', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605dd', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '推荐', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d5573252605de', '2015-05-14 22:41:59', '2015-05-14 22:41:59', null, '其它', null, null, '', '402882024b2467a0014d556ab14505b9', '../template/front/home/images/plugmenu19.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90602', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '菜单颜色', null, null, '', '402882024b2467a0014d6519d83c05e7', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90603', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '页面版权', null, null, '', '402882024b2467a0014d6519d83c05e7', '');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90604', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '电话', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu1.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90605', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '会员资料', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu2.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90606', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '导航', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu3.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90607', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '分享', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu5.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90608', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '首页', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu6.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90609', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '相册', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu7.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f9060a', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '邮箱', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu8.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f9060b', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '购物', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu9.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f9060c', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '会员卡', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu10.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f9060d', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '活动', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu11.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f9060e', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '新浪微博', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu12.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f9060f', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '腾讯微博', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu13.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90610', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '腾讯空间', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu14.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90611', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '音乐', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu16.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90612', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '视频', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu17.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90613', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '推荐', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu18.png');
INSERT INTO `plugmenu` VALUES ('402882024b2467a0014d65c037f90614', '2015-05-18 02:40:05', '2015-05-18 02:40:05', null, '其它', null, null, '', '402882024b2467a0014d6519d83c05e7', '../template/front/home/images/plugmenu19.png');

-- ----------------------------
-- Table structure for `textmes`
-- ----------------------------
DROP TABLE IF EXISTS `textmes`;
CREATE TABLE `textmes` (
  `id` varchar(32) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `content` text,
  `markcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `viewcount` int(11) DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `wx` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of textmes
-- ----------------------------

-- ----------------------------
-- Table structure for `website`
-- ----------------------------
DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `id` varchar(32) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `backimg` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website
-- ----------------------------
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0001', '2014-07-09 10:00:41', '2014-07-09 10:00:43', null, '/template/front/home/model_1/images/model_1.jpg', '1', '模版1', '1', 'model_1/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0002', '2014-07-09 10:28:23', '2014-07-09 10:28:27', null, '/template/front/home/model_2/images/model_2.jpg', '2', '模版2', '1', 'model_2/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0003', '2014-07-09 10:40:16', '2014-07-09 10:40:21', null, '/template/front/list/model_3/images/model_3.jpg', '3', '模版3', '2', 'model_3/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0004', '2014-07-09 10:40:18', '2014-07-09 10:40:22', null, '/template/front/list/model_1/images/model_1.jpg', '1', '模版1', '2', 'model_1/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0005', '2014-07-09 10:40:19', '2014-07-09 10:40:40', null, '/template/front/detail/model_1/images/model_1.jpg', '1', '模版1', '3', 'model_1/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0006', '2014-07-23 11:45:58', '2014-07-23 11:46:00', null, '/template/front/home/model_3/images/model_3.jpg', '3', '模版3', '1', 'model_3/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0007', '2014-07-25 09:39:50', '2014-07-25 09:39:52', null, '/template/front/detail/model_3/images/model_3.jpg', '3', '模版3', '3', 'model_3/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0008', '2014-08-22 14:58:14', '2014-08-22 14:58:15', null, '/template/front/home/model_4/images/model_4.jpg', '4', '模版4', '1', 'model_4/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0009', '2014-08-22 15:19:13', '2014-08-22 15:19:14', null, '/template/front/home/model_5/images/model_5.jpg', '5', '模版5', '1', 'model_5/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0010', '2014-08-22 15:45:43', '2014-08-22 15:45:45', null, '/template/front/home/model_6/images/model_6.jpg', '6', '模版6', '1', 'model_6/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0011', '2014-08-22 15:45:45', '2014-08-22 15:45:45', null, '/template/front/home/model_7/images/model_7.jpg', '7', '模版7', '1', 'model_7/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0012', '2014-08-22 15:45:45', '2014-08-22 15:45:45', null, '/template/front/home/model_8/images/model_8.jpg', '8', '模版8', '1', 'model_8/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0013', '2014-08-22 15:45:45', '2014-08-22 15:45:45', null, '/template/front/home/model_9/images/model_9.jpg', '9', '模版9', '1', 'model_9/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0014', '2014-08-22 15:45:45', '2014-08-22 15:45:45', null, '/template/front/home/model_10/images/model_10.jpg', '10', '模版10', '1', 'model_10/index');
INSERT INTO `website` VALUES ('2c958da346862c52014686333e6c0016', '2015-05-18 05:39:35', '2015-05-18 05:39:38', null, '/template/front/home/model_10/images/model_13.jpg', '1', '模版13', '1', 'model_13/index');

-- ----------------------------
-- Table structure for `wx`
-- ----------------------------
DROP TABLE IF EXISTS `wx`;
CREATE TABLE `wx` (
  `id` varchar(32) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appSecret` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `markcode` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx
-- ----------------------------
INSERT INTO `wx` VALUES ('402881f15139b676015139c3b1220003', '2015-11-24 21:51:44', '2015-11-28 20:07:55', null, '312312', '421241', '', '111', '测试', '11', '111');

-- ----------------------------
-- View structure for `imagemes_classify_v`
-- ----------------------------
DROP VIEW IF EXISTS `imagemes_classify_v`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `imagemes_classify_v` AS select `mes`.`id` AS `id`,`mes`.`createDate` AS `createDate`,`mes`.`modifyDate` AS `modifyDate`,`mes`.`classify` AS `classify`,`mes`.`content` AS `content`,`mes`.`descript` AS `descript`,`mes`.`img` AS `img`,`mes`.`smallimg` AS `smallimg`,`mes`.`isImg` AS `isImg`,`mes`.`markcode` AS `markcode`,`mes`.`name` AS `name`,`mes`.`url` AS `url`,`mes`.`visible` AS `visible`,`mes`.`wx` AS `wx`,`mes`.`level` AS `level`,`mes`.`viewcount` AS `viewcount`,`cls`.`name` AS `classifyName` from (`imagemes` `mes` left join `classify` `cls` on((`mes`.`classify` = `cls`.`id`))) ;
