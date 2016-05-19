/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.8-MariaDB : Database - sst
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sst` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sst`;

/*Table structure for table `sst_activity` */

DROP TABLE IF EXISTS `sst_activity`;

CREATE TABLE `sst_activity` (
  `id` varchar(36) NOT NULL,
  `title` varchar(20) NOT NULL COMMENT '标题',
  `summary` varchar(20) NOT NULL COMMENT '活动概述',
  `pic` varchar(200) DEFAULT NULL COMMENT '缩略图',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '活动状态(0-即将开始,1-进行中)',
  `content` varchar(500) NOT NULL COMMENT '内容',
  `address` varchar(200) NOT NULL COMMENT '活动地点',
  `activity_date` varchar(10) NOT NULL COMMENT '活动日期(yyyy-mm-dd)',
  `start_time` varchar(5) NOT NULL COMMENT '活动开始时间(hh:mm)',
  `end_time` varchar(5) NOT NULL COMMENT '活动结束时间(hh:mm)',
  `create_admin_id` varchar(36) NOT NULL COMMENT '创建者id',
  `create_admin_name` varchar(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_time` datetime DEFAULT NULL,
  `stat` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动';

/*Data for the table `sst_activity` */

insert  into `sst_activity`(`id`,`title`,`summary`,`pic`,`status`,`content`,`address`,`activity_date`,`start_time`,`end_time`,`create_admin_id`,`create_admin_name`,`create_time`,`last_update_time`,`stat`) values ('b1e5824d-9ac2-441c-bfac-67ddde4adb92','上海中小学足球联赛','上海中小学足球联赛(业余组)','\\upload\\20160129\\e0730026d5734e2c8ee5369289647ccc.jpg',0,'<p>欢迎上海各大中小型学校报名参加.奖品丰厚,更有知名国际教练<span style=\"background-color: rgb(255, 255, 0);\">科科维奇</span>进行心得交流<br/><br/><span style=\"background-color: rgb(255, 0, 0);\"><span style=\"background-color: rgb(255, 0, 0);\"></span>心动不如行动!!!</span></p>','上海体育馆','2016-01-31','14:00','18:00','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-29 14:27:09','2016-01-29 14:34:54',1);

/*Table structure for table `sst_admin` */

DROP TABLE IF EXISTS `sst_admin`;

CREATE TABLE `sst_admin` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `account` varchar(20) DEFAULT NULL COMMENT '账号',
  `pwd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

/*Data for the table `sst_admin` */

insert  into `sst_admin`(`id`,`account`,`pwd`,`create_time`,`last_update_time`,`stat`) values ('1','wangxiang','96e79218965eb72c92a549dd5a330112','2016-01-12 13:12:26',NULL,1),('3e6346a3-f942-4567-bf2a-926117022fbf','jam','c4ca4238a0b923820dcc509a6f75849b','2016-01-12 15:33:46',NULL,1),('57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','e10adc3949ba59abbe56e057f20f883e','2016-01-12 14:25:10','2016-01-12 14:44:18',1);

/*Table structure for table `sst_admin_menu` */

DROP TABLE IF EXISTS `sst_admin_menu`;

CREATE TABLE `sst_admin_menu` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `leaf` varchar(100) DEFAULT NULL COMMENT '否为主菜单',
  `left_menu` varchar(100) DEFAULT NULL COMMENT '是否左侧',
  `menu_id` varchar(50) DEFAULT NULL,
  `menu_title` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` varchar(36) DEFAULT NULL COMMENT '父菜单id',
  `descript` varchar(200) DEFAULT NULL COMMENT '菜单说明',
  `menu_url` varchar(50) DEFAULT NULL COMMENT '菜单url地址',
  `menu_icon` varchar(30) DEFAULT NULL COMMENT '菜单地址',
  `orderby` int(4) DEFAULT NULL COMMENT '菜单排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最新更新时间',
  `stat` int(4) NOT NULL DEFAULT '1' COMMENT '1表示有效；0表示无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理菜单';

/*Data for the table `sst_admin_menu` */

insert  into `sst_admin_menu`(`id`,`leaf`,`left_menu`,`menu_id`,`menu_title`,`parent_id`,`descript`,`menu_url`,`menu_icon`,`orderby`,`create_time`,`last_update_time`,`stat`) values ('1','否','是',NULL,'管理员管理','0',NULL,NULL,'icon-credit-card',1,'2016-01-12 13:44:28',NULL,1),('10','是','是',NULL,'群组列表','3',NULL,'/group/list.do',NULL,3,'2016-01-12 13:45:27',NULL,1),('100','是','是',NULL,'清除缓存','1',NULL,'/main.do','',100,'2016-01-23 11:21:53',NULL,1),('11','是','是',NULL,'备忘列表','3',NULL,'/memo/list.do',NULL,4,'2016-01-12 13:45:27',NULL,1),('12','是','是',NULL,'提醒列表','3',NULL,'/remind/list.do',NULL,5,'2016-01-12 13:45:27',NULL,1),('13','是','是',NULL,'计划列表','3',NULL,'/plan/list.do',NULL,6,'2016-01-12 13:45:27',NULL,1),('14','否','是',NULL,'赛事管理','0',NULL,NULL,'icon-credit-card',7,'2016-01-19 13:07:33',NULL,1),('15','是','是',NULL,'赛事列表','14',NULL,'/competition/findCompetitionView.do',NULL,8,'2016-01-19 13:25:43',NULL,1),('16','是','是',NULL,'赛事报名','14',NULL,'/competition/apply/findCompApplyView.do',NULL,9,'2016-01-19 13:25:45',NULL,1),('17','是','是',NULL,'赛事动态','14',NULL,'/competition/news/findCompNewsView.do',NULL,10,'2016-01-19 13:10:53',NULL,1),('18','是','是',NULL,'赛事公告','14',NULL,'/competition/notice/findCompNoticeView.do',NULL,11,'2016-01-19 13:11:34',NULL,1),('19','否','是',NULL,'球队管理','0',NULL,'','icon-credit-card',12,'2016-01-23 11:17:39',NULL,1),('2','是','是',NULL,'管理员列表','1',NULL,'/admin/list.do',NULL,1,'2016-01-12 13:45:27',NULL,1),('20','是','是',NULL,'球队列表','19',NULL,'/team/findTeamView.do',NULL,1,'2016-01-23 11:19:07',NULL,1),('200','否','是',NULL,'评测管理','0',NULL,NULL,'icon-credit-card',13,'2016-01-12 13:45:27',NULL,1),('201','是','是',NULL,'评测列表','200',NULL,'/eva/list.do',NULL,1,'2016-01-12 13:45:27',NULL,1),('21','是','是',NULL,'赛事场次','14',NULL,'/competition/round/list.do',NULL,12,'2016-01-19 13:11:34',NULL,1),('22','是','是',NULL,'赛事比赛','14',NULL,'/competition/match/list.do',NULL,13,'2016-01-19 13:11:34',NULL,1),('23','是','是',NULL,'球队成绩','19',NULL,'/team/result/list.do',NULL,2,'2016-01-23 11:19:07',NULL,1),('24','是','是',NULL,'球队图片','19',NULL,'/team/image/findTeamImageView.do',NULL,3,'2016-01-27 11:47:58',NULL,1),('25','是','是',NULL,'球员列表','19',NULL,'/team/player/findTeamPlayerView.do',NULL,4,'2016-01-23 11:19:07',NULL,1),('26','是','是',NULL,'球员数据','19',NULL,'/team/player/datas/list.do',NULL,5,'2016-01-23 11:19:07',NULL,1),('27','是','是',NULL,'赛事球队','14',NULL,'/comp/team/list.do',NULL,14,'2016-01-19 13:11:34',NULL,1),('28','是','是',NULL,'资讯列表','5',NULL,'/info/list.do',NULL,2,'2016-01-13 14:54:00',NULL,1),('29','是','是',NULL,'活动列表','5',NULL,'/activity/list.do',NULL,3,'2016-01-13 14:54:00',NULL,1),('3','否','是',NULL,'用户管理','0',NULL,'','icon-credit-card',2,'2016-01-12 13:44:28',NULL,1),('30','否','是',NULL,'轮播图管理','0',NULL,NULL,'icon-credit-card',5,'2016-01-29 16:53:16',NULL,1),('31','是','是',NULL,'轮播图列表','30',NULL,'/banner/findBannerView.do',NULL,6,'2016-01-29 16:53:54',NULL,1),('4','是','是',NULL,'用户列表','3',NULL,'/user/list.do',NULL,1,'2016-01-12 13:45:27',NULL,1),('5','否','是',NULL,'资讯管理','0',NULL,'','icon-credit-card',3,'2016-01-13 09:34:07',NULL,1),('6','是','是',NULL,'公告列表','5',NULL,'/notice/findNoticeView.do',NULL,1,'2016-01-13 14:54:00',NULL,1),('7','否','是',NULL,'消息管理','0',NULL,NULL,'icon-credit-card',4,'2016-01-13 17:19:39',NULL,1),('8','是','是',NULL,'消息列表','7',NULL,'/message/findMessageView.do',NULL,4,'2016-01-13 17:20:33',NULL,1),('9','是','是',NULL,'投票列表','3',NULL,'/vote/list.do',NULL,2,'2016-01-12 13:45:27',NULL,1);

/*Table structure for table `sst_authorization` */

DROP TABLE IF EXISTS `sst_authorization`;

CREATE TABLE `sst_authorization` (
  `id` varchar(36) NOT NULL COMMENT '主键ID',
  `admin_id` varchar(36) NOT NULL,
  `menu_id` varchar(36) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `stat` int(4) NOT NULL DEFAULT '1',
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sst_authorization` */

insert  into `sst_authorization`(`id`,`admin_id`,`menu_id`,`create_time`,`stat`,`last_update_time`) values ('030b9f9f-c882-474d-a17c-5bddfcfad73a','57390b0c-b06a-4e30-b8e9-1f42c5adf979','10','2016-01-15 13:13:14',1,NULL),('03dd479f-6983-4474-ab57-b2205db896c6','57390b0c-b06a-4e30-b8e9-1f42c5adf979','23','2016-01-27 11:03:00',1,NULL),('06ede759-ef84-4065-9b10-94bc91e302ed','57390b0c-b06a-4e30-b8e9-1f42c5adf979','1','2016-01-12 14:43:43',1,NULL),('09bd1b8a-2ed3-4884-a186-cd26a1799af3','3e6346a3-f942-4567-bf2a-926117022fbf','200','2016-01-29 16:54:45',1,NULL),('0b0a26cc-8895-454f-8ab6-8187d7fe472e','3e6346a3-f942-4567-bf2a-926117022fbf','16','2016-01-19 13:12:37',1,NULL),('0c477deb-5c24-43a6-90ee-0f4897746b0b','1','200','2016-01-29 16:55:27',1,NULL),('0cc2e48b-e63b-4157-8d08-0a8333e3871a','57390b0c-b06a-4e30-b8e9-1f42c5adf979','2','2016-01-12 14:43:44',1,NULL),('0e1bf4b0-7ebb-4964-bab2-2fb041f1574d','57390b0c-b06a-4e30-b8e9-1f42c5adf979','15','2016-01-19 13:13:00',1,NULL),('1','1','1','2016-01-12 13:47:15',1,NULL),('1102c6c5-a559-4960-8dd7-ed69574cc86b','57390b0c-b06a-4e30-b8e9-1f42c5adf979','9','2016-01-13 17:57:33',1,NULL),('12f8de79-df65-4d6c-81ee-999c43c5675f','3e6346a3-f942-4567-bf2a-926117022fbf','3','2016-01-13 09:35:42',1,NULL),('133bf2fd-40a6-4053-9b9e-85254267ca69','3e6346a3-f942-4567-bf2a-926117022fbf','15','2016-01-19 13:12:37',1,'2016-01-19 13:33:37'),('135b56d5-e46f-4421-b113-6e80cfb761cd','3e6346a3-f942-4567-bf2a-926117022fbf','14','2016-01-19 13:12:37',1,NULL),('1463bc63-53d3-4357-a0e4-3b7cfdc5c724','3e6346a3-f942-4567-bf2a-926117022fbf','6','2016-01-13 14:59:55',1,NULL),('15a300ec-a9b8-478f-9f28-7057b4095ace','3e6346a3-f942-4567-bf2a-926117022fbf','24','2016-01-27 14:33:11',1,NULL),('1701abaf-a10d-438b-9d8c-7b835eebc614','3e6346a3-f942-4567-bf2a-926117022fbf','11','2016-01-19 13:12:37',1,NULL),('188613c7-bc99-4474-8081-1aed63406063','57390b0c-b06a-4e30-b8e9-1f42c5adf979','12','2016-01-15 15:45:07',1,NULL),('1a3c1932-d59d-47bd-8cc2-4b1a09882ab1','57390b0c-b06a-4e30-b8e9-1f42c5adf979','3','2016-01-12 15:42:19',1,NULL),('1bdf2191-8f04-418c-962f-980f6522ae84','57390b0c-b06a-4e30-b8e9-1f42c5adf979','24','2016-01-27 14:33:22',1,NULL),('1e47d8ad-52fb-4ea7-a774-07a4eee999c0','3e6346a3-f942-4567-bf2a-926117022fbf','12','2016-01-19 13:12:37',1,NULL),('1f105a8a-41ed-4246-9d99-36145811887d','1','22','2016-01-25 18:13:36',1,NULL),('2','1','2','2016-01-12 13:47:15',1,NULL),('2181b490-d67e-4a25-81df-6f86d9329c75','57390b0c-b06a-4e30-b8e9-1f42c5adf979','11','2016-01-15 15:45:07',1,NULL),('22c1deea-4f3e-4616-8c61-c4893a9b2201','57390b0c-b06a-4e30-b8e9-1f42c5adf979','30','2016-01-29 16:55:21',1,NULL),('23dcae64-886e-4a56-8459-2e54f2e887a6','1','11','2016-01-19 13:12:55',1,NULL),('26868477-4920-4242-83a1-56892aff59e2','3e6346a3-f942-4567-bf2a-926117022fbf','10','2016-01-19 13:12:37',1,NULL),('26c64170-16b6-4375-8e87-23a81fa19834','3e6346a3-f942-4567-bf2a-926117022fbf','29','2016-01-29 16:51:07',1,NULL),('26e83d2c-d5e4-4eec-a3bc-1c6f08d9be0f','3e6346a3-f942-4567-bf2a-926117022fbf','8','2016-01-19 13:12:37',1,NULL),('2aa3bbdd-87a3-4246-a6eb-9de3e1393cf7','57390b0c-b06a-4e30-b8e9-1f42c5adf979','4','2016-01-12 15:42:19',1,NULL),('2c86a143-b845-4ca4-82cd-4fac28e7896f','1','5','2016-01-19 13:12:55',1,NULL),('2f55cc89-406f-4fd6-8ece-1d333673f4fd','1','24','2016-01-29 16:55:27',1,NULL),('36927912-8226-47cc-8e01-107855c872d6','57390b0c-b06a-4e30-b8e9-1f42c5adf979','100','2016-01-23 11:22:44',1,NULL),('373e5f4a-4bc8-43ce-adb1-dd4a1a13605f','1','30','2016-01-29 16:55:27',1,NULL),('39f99198-2289-4db9-9f8f-1235f7a668f0','3e6346a3-f942-4567-bf2a-926117022fbf','5','2016-01-13 09:35:42',1,NULL),('3ba22044-63b1-4914-a0f5-e0a8917f7ce0','57390b0c-b06a-4e30-b8e9-1f42c5adf979','200','2016-01-29 16:19:11',1,NULL),('3c89fca0-b73f-4298-b871-bb1a4a49a424','1','6','2016-01-19 13:12:55',1,NULL),('3e0f7c0f-9ea0-4bdd-a9b9-19b25b7a1c07','57390b0c-b06a-4e30-b8e9-1f42c5adf979','5','2016-01-13 15:00:17',1,NULL),('3e96bb21-f8a9-4c25-9d09-218605f8c58c','57390b0c-b06a-4e30-b8e9-1f42c5adf979','28','2016-01-29 13:17:19',1,NULL),('422fa5f1-51f7-4198-91a1-ad1b56a55cdb','3e6346a3-f942-4567-bf2a-926117022fbf','21','2016-01-25 18:13:27',1,NULL),('4312e72d-cab5-47fa-80cf-b8176bc4ed65','1','9','2016-01-19 13:12:55',1,NULL),('43be15a9-7767-4f29-8bfb-0cf900487a9e','1','23','2016-01-29 16:55:27',1,NULL),('4540451b-a44b-4cfa-b167-85c5504df3dd','57390b0c-b06a-4e30-b8e9-1f42c5adf979','20','2016-01-23 11:19:26',1,NULL),('48c7cd1b-8a70-4a42-9f0f-2c0249ac6d7e','1','20','2016-01-25 18:13:36',1,NULL),('48f3b937-c230-4a3e-bf28-154680412551','1','19','2016-01-25 18:13:36',1,NULL),('49b20ea5-fbc5-4f23-a42a-4a3095f2084c','1','25','2016-01-29 16:55:27',1,NULL),('4f3d0b11-c9f9-47ed-8b48-c0545ea1dd21','3e6346a3-f942-4567-bf2a-926117022fbf','20','2016-01-23 11:19:20',1,NULL),('5059f9d5-5026-456f-8ddc-925eec924976','57390b0c-b06a-4e30-b8e9-1f42c5adf979','27','2016-01-28 11:11:30',1,NULL),('57c7d25a-8ac4-4b39-b218-b991c754a737','57390b0c-b06a-4e30-b8e9-1f42c5adf979','7','2016-01-13 17:57:45',1,NULL),('591aae79-a746-44e1-b0f8-c1bb57e07d02','1','29','2016-01-29 16:55:27',1,NULL),('59b85fc9-bbab-4249-b49f-dc9e2f0f078d','57390b0c-b06a-4e30-b8e9-1f42c5adf979','31','2016-01-29 16:55:21',1,NULL),('5d9fed00-942e-4661-9594-b6f4c6384a2e','1','100','2016-01-25 18:13:36',1,NULL),('5f68db05-1fc9-4cc6-9a84-4768c0a379a4','57390b0c-b06a-4e30-b8e9-1f42c5adf979','6','2016-01-13 15:00:17',1,NULL),('60942bac-589d-4905-aa6d-adf92ff8ab20','1','26','2016-01-29 16:55:27',1,NULL),('63ce45bb-58c2-4aad-9086-095fabdfdea6','1','4','2016-01-19 13:12:55',1,NULL),('6cf4cf13-d4df-4455-b44b-ad77e0c0a2e4','57390b0c-b06a-4e30-b8e9-1f42c5adf979','25','2016-01-27 15:40:52',1,NULL),('730f1228-bb7f-463c-bfc6-a0e57e7bd9a5','3e6346a3-f942-4567-bf2a-926117022fbf','26','2016-01-27 16:58:12',1,NULL),('75399e4d-5ef1-4324-903b-9c0c13bfcbb3','3e6346a3-f942-4567-bf2a-926117022fbf','27','2016-01-29 16:51:07',1,NULL),('79ce472a-a510-490a-8c51-2bcc8f237520','3e6346a3-f942-4567-bf2a-926117022fbf','30','2016-01-29 16:54:51',1,NULL),('7d38f24e-be0c-4839-9512-cdd2b895ca8e','57390b0c-b06a-4e30-b8e9-1f42c5adf979','16','2016-01-19 13:13:00',1,NULL),('807674ae-98e7-4090-ad6a-6607523fc063','3e6346a3-f942-4567-bf2a-926117022fbf','17','2016-01-19 13:12:37',1,NULL),('816bdc49-84a1-4268-bacf-e4f56a9495bf','3e6346a3-f942-4567-bf2a-926117022fbf','2','2016-01-13 09:35:42',1,NULL),('8204c1b6-4e88-4c71-a534-22019e0ead36','57390b0c-b06a-4e30-b8e9-1f42c5adf979','201','2016-01-29 16:21:23',1,NULL),('82e77ea1-1fb6-4e46-ba1f-2f2914bfe945','1','14','2016-01-19 13:12:55',1,NULL),('83661379-0938-411d-a279-3537c281c889','3e6346a3-f942-4567-bf2a-926117022fbf','31','2016-01-29 16:54:51',1,NULL),('847c5634-26da-4184-9067-700f7a1e83c3','57390b0c-b06a-4e30-b8e9-1f42c5adf979','19','2016-01-23 11:19:26',1,NULL),('8a65c5e0-eec9-429a-958c-f6bf3babb2d1','57390b0c-b06a-4e30-b8e9-1f42c5adf979','18','2016-01-19 13:29:29',1,NULL),('8ba076bd-e8fc-4ae0-9b70-32e4fd6f7a56','1','13','2016-01-19 13:12:55',1,NULL),('8df44e23-e7ae-4899-8685-542f7d808fce','3e6346a3-f942-4567-bf2a-926117022fbf','9','2016-01-19 13:12:37',1,NULL),('954009a2-2f26-4a75-8799-5772d25c76d9','57390b0c-b06a-4e30-b8e9-1f42c5adf979','21','2016-01-23 14:55:49',1,NULL),('9ba85645-8fed-4548-9c52-a6871b94c904','1','10','2016-01-19 13:12:55',1,NULL),('a1287ae0-247e-4014-9568-bfa7116b649b','3e6346a3-f942-4567-bf2a-926117022fbf','18','2016-01-19 13:28:33',1,NULL),('a1f8e99a-e683-40ed-9bc7-ead3a5e3c78e','57390b0c-b06a-4e30-b8e9-1f42c5adf979','14','2016-01-19 13:13:00',1,NULL),('a366d22a-d551-4408-805e-d5127ca03fce','3e6346a3-f942-4567-bf2a-926117022fbf','28','2016-01-29 16:51:07',1,NULL),('a847a0a1-39b3-4470-bb91-d8326eb295ba','1','3','2016-01-19 13:12:55',1,NULL),('a8687a02-5c04-4c48-8216-441c26cfbd88','57390b0c-b06a-4e30-b8e9-1f42c5adf979','13','2016-01-18 09:49:01',1,NULL),('aa79dc49-ca9a-4473-8f75-eafbdfe532e1','57390b0c-b06a-4e30-b8e9-1f42c5adf979','8','2016-01-13 17:57:45',1,NULL),('af0b22b7-c708-433e-af9c-e394711a53ea','1','7','2016-01-19 13:12:55',1,NULL),('af2ce1a3-c5ff-4367-b502-a692de358e7d','3e6346a3-f942-4567-bf2a-926117022fbf','13','2016-01-19 13:12:37',1,NULL),('af7ee762-6fdb-4194-8c95-4ca9aaef7d2b','57390b0c-b06a-4e30-b8e9-1f42c5adf979','26','2016-01-27 15:40:52',1,NULL),('b19a5ccf-0726-48f0-bc16-3f559cd39fce','1','201','2016-01-29 16:55:27',1,NULL),('bbf2a73e-265f-4aad-a8f4-a6f25033b69e','3e6346a3-f942-4567-bf2a-926117022fbf','100','2016-01-23 11:22:39',1,NULL),('bc603d89-f808-4d2f-8645-9a4ea39b3e20','1','28','2016-01-29 16:55:27',1,NULL),('bcf147f2-a689-4a85-bb4f-6968396f74cb','3e6346a3-f942-4567-bf2a-926117022fbf','201','2016-01-29 16:54:45',1,NULL),('cb86bb9f-cd76-4027-b821-62bc366815f3','57390b0c-b06a-4e30-b8e9-1f42c5adf979','29','2016-01-29 13:17:19',1,NULL),('cd9427ed-627c-4f21-bb29-8cec8ac4246f','1','17','2016-01-19 13:12:55',1,NULL),('d0c5c466-8e28-4c04-b5da-7126fa143e92','3e6346a3-f942-4567-bf2a-926117022fbf','25','2016-01-27 16:58:12',1,NULL),('d110814a-1d98-4791-9f4d-3f8814e95fbd','1','12','2016-01-19 13:12:55',1,NULL),('d5e2239c-b434-4091-affe-7f306a66b9a6','1','8','2016-01-19 13:12:55',1,NULL),('d9f8e279-c667-4ed3-9da5-68726a70a9a3','3e6346a3-f942-4567-bf2a-926117022fbf','7','2016-01-19 13:12:37',1,NULL),('e09ebd91-75ce-44e7-aa5c-75f0e5ca3d8e','3e6346a3-f942-4567-bf2a-926117022fbf','19','2016-01-23 11:19:20',1,NULL),('e1123e4e-09e7-41cb-9b01-beb9811a8ef9','1','18','2016-01-25 18:13:36',1,NULL),('e34e28d3-28b5-4003-83c8-22e933691350','3e6346a3-f942-4567-bf2a-926117022fbf','1','2016-01-13 09:35:41',1,NULL),('e6937909-1991-49f8-a6f2-c6500ff4c049','1','15','2016-01-19 13:12:55',1,NULL),('e9a6acc4-9080-48dd-9a38-1715e338f22e','1','21','2016-01-25 18:13:36',1,NULL),('e9e5df72-fff5-46c5-89cd-8ad49e68f88a','57390b0c-b06a-4e30-b8e9-1f42c5adf979','22','2016-01-25 17:40:54',1,NULL),('ea807bd4-2ac5-42ad-8480-c291fb60c6ea','1','27','2016-01-29 16:55:27',1,NULL),('ec1fdae5-9df7-42f8-a51c-e1887f408b4b','3e6346a3-f942-4567-bf2a-926117022fbf','23','2016-01-27 14:33:11',1,NULL),('f1c9dedc-2750-4948-b309-b1411c9980fa','3e6346a3-f942-4567-bf2a-926117022fbf','4','2016-01-13 09:35:42',1,NULL),('f46f6a20-9707-47a8-b714-686cbd644c80','3e6346a3-f942-4567-bf2a-926117022fbf','22','2016-01-25 18:13:27',1,NULL),('faf3555d-2aff-4664-943c-c4f418ab5909','1','31','2016-01-29 16:55:27',1,NULL),('fc1e7062-de01-4ad2-9939-6fd69f4ac7d6','57390b0c-b06a-4e30-b8e9-1f42c5adf979','17','2016-01-19 13:13:00',1,NULL),('fedd496d-8dc7-476d-8d09-d0251d4c3646','1','16','2016-01-19 13:12:55',1,NULL);

/*Table structure for table `sst_banner` */

DROP TABLE IF EXISTS `sst_banner`;

CREATE TABLE `sst_banner` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `img` varchar(200) DEFAULT NULL COMMENT '图片路径',
  `url` varchar(200) DEFAULT NULL COMMENT '图片跳转路径',
  `create_admin_id` varchar(36) DEFAULT NULL COMMENT '创建者id',
  `create_admin_name` varchar(20) DEFAULT NULL COMMENT '创建者名称',
  `update_admin_id` varchar(36) DEFAULT NULL COMMENT '更新者id',
  `update_admin_name` varchar(20) DEFAULT NULL COMMENT '更新者名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  `note` text COMMENT '描述信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图片';

/*Data for the table `sst_banner` */

insert  into `sst_banner`(`id`,`title`,`img`,`url`,`create_admin_id`,`create_admin_name`,`update_admin_id`,`update_admin_name`,`create_time`,`last_update_time`,`stat`,`note`) values ('014979ac-8a5e-47e4-9795-c6da7c8eb563','4','\\upload\\20160129\\c108b2c5b8464f1d925a1e7e377eae69.jpg','444',NULL,NULL,NULL,NULL,'2016-01-29 17:55:59','2016-01-29 18:12:32',1,'<p>44</p>'),('19b4bc52-7b9e-435b-a5c3-ae28137c5ab6','周一','\\upload\\20160201\\92b6cc27aedc47bd8a5f001eb6903d0e.jpg','周一周一周一周一周一周一周一','3e6346a3-f942-4567-bf2a-926117022fbf','jam',NULL,NULL,'2016-02-01 10:30:53',NULL,1,'<p>周一周一周一周一</p>'),('212375f7-d923-4ff0-b303-e5edaebce505','4','\\upload\\20160129\\077f7d9fc3b642ada3bca1c732c9e7e1.jpg','444',NULL,NULL,NULL,NULL,'2016-01-29 17:56:27',NULL,1,'<p>44</p>'),('2acfdf08-bd46-4544-a4f5-a3dd88d13015','期待宙斯','\\upload\\20160201\\488f5a01f9474cd8ba959df3359f96aa.jpg','期待宙斯','3e6346a3-f942-4567-bf2a-926117022fbf','jam',NULL,NULL,'2016-02-01 10:58:57',NULL,1,'<p><span style=\"white-space: normal;\">期待宙斯</span></p>'),('331cb9dc-8c14-4108-ba20-460bd377b54c','2','\\upload\\20160129\\330a143418784d8e86f5b820c42e5b47.jpg','222',NULL,NULL,NULL,NULL,'2016-01-29 17:41:32','2016-01-29 17:47:22',1,NULL),('45a944af-cce5-4f32-8de4-c8ef78bb8c49','4','\\upload\\20160129\\4437e2efcaf6412ab4315873592bcfde.jpg','444',NULL,NULL,NULL,NULL,'2016-01-29 17:57:14',NULL,1,'<p>44</p>'),('75ee723d-96a3-4453-83d7-22eadda86f80','1','\\upload\\20160129\\dc4d6a07687e413cbd111f8a4304976e.jpg','1',NULL,NULL,NULL,NULL,'2016-01-29 17:41:16','2016-01-29 18:12:23',1,'<p>11111111111</p>'),('7afc2e19-9fbe-4f7b-89f8-bfdf38d41bb0','3','\\upload\\20160129\\a658843ba20e4f919250c61b229c121f.jpg','333',NULL,NULL,NULL,NULL,'2016-01-29 17:45:06','2016-01-29 18:12:42',1,'<p>额</p>'),('86fde966-ec59-46c7-baeb-e3c497f00a0b','4aaaaaaaaaaaaaaaaa','\\upload\\20160201\\65ca2fe79fca4fb3aace5bc9f77a43ff.jpg','444aaaaaaaaaaaaaaaaaaaaaaaaaaaa',NULL,NULL,NULL,NULL,'2016-01-29 17:57:26','2016-02-01 09:19:38',1,'<p>44aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>'),('e0bdef36-820c-4371-9d5d-73b3863d8927','4','\\upload\\20160129\\8159ae1634e24606bb0f2cd3e936714f.jpg','444',NULL,NULL,NULL,NULL,'2016-01-29 17:47:49',NULL,1,'<p>44</p>');

/*Table structure for table `sst_competition` */

DROP TABLE IF EXISTS `sst_competition`;

CREATE TABLE `sst_competition` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `title` varchar(40) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `icon` varchar(200) DEFAULT NULL COMMENT '缩略图',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `is_closed` int(1) DEFAULT '0' COMMENT '报名是否截止(0-未截止,1已截止)',
  `comp_type` int(1) DEFAULT NULL COMMENT '赛事状态:0表示未开始,1表示进行中,2表示已结束',
  `create_admin_id` varchar(36) DEFAULT NULL COMMENT '创建者id',
  `create_admin_name` varchar(20) DEFAULT NULL COMMENT '创建者姓名',
  `update_admin_id` varchar(36) DEFAULT NULL COMMENT '更新者id',
  `update_admin_name` varchar(20) DEFAULT NULL COMMENT '更新者姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赛事';

/*Data for the table `sst_competition` */

insert  into `sst_competition`(`id`,`title`,`content`,`icon`,`start_date`,`end_date`,`is_closed`,`comp_type`,`create_admin_id`,`create_admin_name`,`update_admin_id`,`update_admin_name`,`create_time`,`last_update_time`,`stat`) values ('05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','<p>凯瑟琳好样哒</p>',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2016-01-19 16:00:50','2016-01-28 17:59:00',1),('076fa808-52e0-44e3-9ae3-4eaf44ed4186','老五','<p>老五老五老五老五老五老五老五</p>','\\upload\\20160120\\f1a9016be2ca4631861bb485a1f37a71.jpg','2016-01-20','2016-01-21',0,1,NULL,NULL,NULL,NULL,'2016-01-20 16:03:18','2016-01-28 17:53:31',1),('1','精彩赛事111','<p>西甲夺冠之战11</p>','\\upload\\20160120\\d0c86c2146de4ad388180cd026a212e5.jpg','2016-01-18','2016-01-19',1,2,'111111','Tiny','222222','小小','2016-01-20 14:13:20','2016-01-20 17:22:15',1),('40d5b169-7b87-4411-9d1a-7dbb63b052c4','今天是周二,天气不错','<p>处处太阳照<br/></p>',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2016-01-19 15:09:52','2016-01-20 11:34:10',0),('422c5980-b624-4bd2-8184-a594149dcc17','老四','<p>老四老四老四老四老四老四老四老四老四老四</p>','\\upload\\20160120\\7c53e066f36f44ca8a36e68894cf70b1.jpg','2016-01-06','2016-01-07',1,1,NULL,NULL,NULL,NULL,'2016-01-20 16:02:42',NULL,1),('4aa4250e-d01e-4610-80d2-ce20e8be3ab6','11','<p>11</p>','\\upload\\20160201\\0f18f6de1a954ba9a4bd467128c13f33.jpg','2016-02-01','2016-02-02',0,0,'3e6346a3-f942-4567-bf2a-926117022fbf','jam',NULL,NULL,'2016-02-01 11:58:35',NULL,1),('69a44c2b-9a7d-4044-a2b1-9f9f121aadbe','O(∩_∩)O哈哈~','<p>O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~O(∩_∩)O哈哈~</p>',NULL,'2016-01-19','2016-01-20',1,NULL,NULL,NULL,NULL,NULL,'2016-01-19 16:06:05',NULL,1),('725112ab-5f07-4954-9013-4772ce4a6e62','老三','<p>老三老三老三老三老三老三老三老三老三老三老三老三老三老三老三老三老三老三</p>','\\upload\\20160120\\0b8305a0265d40f2b294b3ae26087d40.jpg','2016-01-20','2016-01-21',1,1,NULL,NULL,NULL,NULL,'2016-01-20 16:02:17','2016-01-21 09:43:55',0),('822a7636-e48e-4e23-b19a-09e0a3a8209c','as','<p>as asd asd das <br/></p>','\\upload\\20160120\\429ca3fd43854c7a8b7b2800f353b882.jpg','2016-01-20','2015-12-30',1,NULL,NULL,NULL,NULL,NULL,'2016-01-20 10:42:29','2016-01-20 11:40:53',0),('963594ae-6744-4621-88ec-cdf43a2e088d','傻傻地','<p>傻傻地傻傻地傻傻地傻傻地</p>','\\upload\\20160120\\015d4cbf794d4ce49c5c4fe12c2cee0f.jpg','2016-01-20','2016-01-21',1,2,NULL,NULL,NULL,NULL,'2016-01-20 11:26:39',NULL,1),('96b7a17f-36c7-4428-8b0c-3c8f1ddbcdbb','赛起手2211','<p>赛起手赛起手赛起手赛起手赛起手赛起手</p>','\\upload\\20160121\\879c9571994f4f84a80a04a25e842e72.jpg','2016-01-02','2016-01-02',1,1,NULL,NULL,NULL,NULL,'2016-01-21 09:27:29','2016-01-28 17:58:41',1),('a84b7793-7b01-4fe6-b609-07671bf4b27d','精彩赛事33','<p>西甲夺冠之战33</p>','\\upload\\20160121\\e7f04210397542d998b7591c25a777a6.jpg','2015-12-31','2016-01-02',1,0,NULL,NULL,NULL,NULL,'2016-01-20 17:17:36','2016-01-28 17:58:52',1),('b2b4a9a8-012d-41fe-bbde-02cb6ca6c6a1','周一','<p>周一周一周一周一周一周一</p>','\\upload\\20160201\\f71bdbd3e92e4a3ea4e00448b5a64a80.jpg','2016-02-01','2016-02-02',0,0,'3e6346a3-f942-4567-bf2a-926117022fbf','jam',NULL,NULL,'2016-02-01 10:33:03',NULL,1),('b452cc8e-2a68-46ce-9bdd-4ba032261f11','老大','<p>老大大<span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span><span style=\"white-space: normal;\">大大</span></p>','\\upload\\20160120\\314c9f1910504a2eb6278a5edb11bfa8.jpg','2016-01-20','2016-01-21',1,0,NULL,NULL,NULL,NULL,'2016-01-20 15:47:56',NULL,1),('d85621ad-4720-4515-8795-81033707bdcb','老刘','<p>老刘老刘老刘老刘老刘老刘老刘老刘老刘老刘老刘老刘老刘老刘老刘老刘老刘老刘老刘</p>','\\upload\\20160120\\a6134c31b18e40e29ef9f2ec3690c19b.jpg','2016-01-20','2016-01-21',0,2,NULL,NULL,NULL,NULL,'2016-01-20 16:04:20','2016-01-28 17:53:24',1),('e625318f-9c57-4c42-92ab-a7b39539ab81','阿萨德','<p>阿萨德阿萨德按时按时阿阿萨德</p>','\\upload\\20160120\\ee430e1a6d544c5e95c22e9c10d4e5b7.jpg','2016-01-20','2016-01-21',1,1,NULL,NULL,NULL,NULL,'2016-01-20 16:19:05','2016-01-28 17:58:54',1),('e95c1843-baf7-470d-aa02-ebdd1061074b','老二','<p>老二老二老二老二老二老二老二老二老二老二老二老二老二老二老二老二老二老二老二老二</p>','\\upload\\20160120\\403a8e1c97494820bf29aa3ae27400d9.jpg','2016-01-20','2016-01-21',1,1,NULL,NULL,NULL,NULL,'2016-01-20 16:01:04','2016-01-21 09:43:55',0),('eb17c3fd-ad77-4474-a145-8a6f11f76f64','星期三','<p>星期三天气晴朗</p>','\\upload\\20160120\\1a8809cae83247399f25fcdbc0427fd2.jpg','2016-01-20','2016-01-21',1,1,NULL,NULL,NULL,NULL,'2016-01-20 10:26:05','2016-01-20 17:29:14',1),('edf136cc-286a-4765-b0c0-e623764fbce1','阿斯顿马丁','<p>阿斯顿<br/></p>',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2016-01-19 15:38:58','2016-01-20 11:34:53',0);

/*Table structure for table `sst_competition_apply` */

DROP TABLE IF EXISTS `sst_competition_apply`;

CREATE TABLE `sst_competition_apply` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `comp_id` varchar(36) DEFAULT NULL COMMENT '赛事id',
  `comp_name` varchar(36) DEFAULT NULL COMMENT '赛事名称',
  `team_id` varchar(36) DEFAULT NULL COMMENT '球队id',
  `team_icon` varchar(200) DEFAULT NULL COMMENT '球队图标',
  `team_name` varchar(36) DEFAULT NULL COMMENT '球队名称',
  `contacts` varchar(20) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `audit_type` int(1) DEFAULT '0' COMMENT '审核状态(0-未审核,1-通过,2-拒绝)',
  `create_user_id` varchar(36) DEFAULT NULL COMMENT '申请人id',
  `create_user_name` varchar(20) DEFAULT NULL COMMENT '申请人',
  `audit_user_id` varchar(36) DEFAULT NULL COMMENT '审核人id',
  `audit_user_name` varchar(20) DEFAULT NULL COMMENT '审核人',
  `create_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `stat` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赛事报名表';

/*Data for the table `sst_competition_apply` */

insert  into `sst_competition_apply`(`id`,`comp_id`,`comp_name`,`team_id`,`team_icon`,`team_name`,`contacts`,`mobile`,`audit_type`,`create_user_id`,`create_user_name`,`audit_user_id`,`audit_user_name`,`create_time`,`last_update_time`,`stat`) values ('07119787-1b87-44b8-a86d-5aa1b885857e','1','精彩赛事111','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160126\\21f01d5b1ffb4208b53046c7a5b0ced7.jpg','恒大','we35w34w','323232112',0,NULL,NULL,NULL,NULL,'2016-01-26 14:56:29',NULL,1),('1','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','1',NULL,'1号球队','WX','1872221421363',1,'','','','','2016-01-23 12:00:00','2016-01-26 09:20:24',1),('15f2d2fb-9541-41cb-9d83-c3c63cc3fbd5','963594ae-6744-4621-88ec-cdf43a2e088d','傻傻地','828765ae-f509-4a85-bd3b-4dc4c1f7ce46','\\upload\\20160126\\88d110ef0f1e418888f8160ff936bf4a.jpg','22','we35w34w','323232112',1,NULL,NULL,NULL,NULL,'2016-01-26 14:19:15','2016-01-26 14:19:31',1),('1b77b1b1-6b9f-4ae7-9f99-e502cb977d19','076fa808-52e0-44e3-9ae3-4eaf44ed4186','老五','0a80313f-6f94-483a-a758-177138aa21d6','\\upload\\20160126\\92956c64891045c6bde3c84642750b4e.jpg','77','we35w34w','323232112',0,NULL,NULL,NULL,NULL,'2016-01-26 14:41:12','2016-01-26 15:01:36',1),('1dcb2d1c-7b20-4338-82e5-1f93556d9e95','1','精彩赛事111','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160126\\34e34ba143e84788a29e8823b46cda3c.jpg','恒大','we35w3玩儿4w','323232112',0,NULL,NULL,NULL,NULL,'2016-01-26 14:56:57','2016-01-26 15:01:22',1),('282f3723-2d7f-4796-8fef-2c0c54043e42','963594ae-6744-4621-88ec-cdf43a2e088d','傻傻地','0a80313f-6f94-483a-a758-177138aa21d6','\\upload\\20160126\\98206525c0f04ea783091ec47f6161dd.jpg','77','we35w34w','323232112',0,NULL,NULL,NULL,NULL,'2016-01-26 14:40:53','2016-01-26 15:02:02',1),('3','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','1',NULL,'1号球队','WX','1872221421363',2,'','','','','2016-01-23 12:00:00','2016-01-26 09:20:24',1),('39b8d658-a970-4261-b638-b541de529600','963594ae-6744-4621-88ec-cdf43a2e088d','凯瑟琳','819ac90a-42a9-4087-ac4b-6698eebe11dd',NULL,'77','rrr','rrrr',0,NULL,NULL,NULL,NULL,'2016-01-26 13:55:18','2016-01-26 13:56:48',0),('53d2cde1-5505-42d3-9f30-6f00450dd77c','1','精彩赛事111','2','\\upload\\20160126\\af444ec11674426fbd9350116be8480d.jpg','二号球队','sad','asd asd',0,NULL,NULL,NULL,NULL,'2016-01-26 14:18:42',NULL,1),('5a7e7315-3735-496d-a775-5be4a97a4c30','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','0a80313f-6f94-483a-a758-177138aa21d6','\\upload\\20160126\\bb801c2d00474902b0b9a7d38f561828.jpg','77','ggggg','ggggggg',0,NULL,NULL,NULL,NULL,'2016-01-26 14:14:10',NULL,1),('609926d3-4bc2-47e4-86dc-c85b6758b66a','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','1',NULL,'一号球队','asd asd','asd ads ads',0,NULL,NULL,NULL,NULL,'2016-01-26 14:07:01',NULL,1),('7300dfd6-1250-4931-a4f7-7b90dc18b3fd','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','0a80313f-6f94-483a-a758-177138aa21d6',NULL,'77','uuu','uuuuuuuuu',0,NULL,NULL,NULL,NULL,'2016-01-26 14:11:41',NULL,1),('76600ccc-e0ca-49a2-8ae4-31951c2073b7','1','精彩赛事111','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160126\\b700d5c7b4f844bb9d41a3ca186b2223.jpg','恒大','we35w34w','323232112',0,NULL,NULL,NULL,NULL,'2016-01-26 14:42:58',NULL,1),('7c6d292e-ab5b-4e5e-a335-6d0496cc002e','1','精彩赛事111','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160126\\478de795ef3c4175afe0a29946fea996.jpg','恒大','we35w34w','323232112',0,NULL,NULL,NULL,NULL,'2016-01-26 14:41:24','2016-01-26 15:01:52',1),('813f957b-09e7-423b-a4dd-2af18311f4e5','1','精彩赛事111','0a80313f-6f94-483a-a758-177138aa21d6','','77','1212','12412',0,NULL,NULL,NULL,NULL,'2016-01-28 10:52:32',NULL,1),('8176ef59-bd31-4d3e-8da0-5e761265f124','422c5980-b624-4bd2-8184-a594149dcc17',NULL,'ead0cb09-c6b7-4a94-9d44-4b26a7f4a779',NULL,NULL,'444','4444',0,NULL,NULL,NULL,NULL,'2016-01-26 13:35:25','2016-01-26 14:06:31',0),('8e1d9160-77b7-40a5-b375-cd75c954aa00','1','精彩赛事111','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160126\\b700d5c7b4f844bb9d41a3ca186b2223.jpg','恒大','we35w34w','323232112',0,NULL,NULL,NULL,NULL,'2016-01-26 14:43:03',NULL,1),('9056a5fd-ab89-466a-b699-8369e6a1b6e4','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160126\\0b4a9846d4d141bea07ea5cec7e73fd9.jpg','恒大','asd','wqq1212121',2,NULL,NULL,NULL,NULL,'2016-01-26 14:19:00','2016-01-26 14:19:36',1),('99d4c8bc-6f41-4f4d-975f-0a13a82a595d','963594ae-6744-4621-88ec-cdf43a2e088d','傻傻地','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160201\\b529c0cb3f984bfc8d9736fc119460b7.jpg','恒大','阿萨德','1301217133',0,'3e6346a3-f942-4567-bf2a-926117022fbf','jam',NULL,NULL,'2016-02-01 10:32:21',NULL,1),('9a734766-51ab-463e-b8d5-6f3708c6d882','1','精彩赛事111','819ac90a-42a9-4087-ac4b-6698eebe11dd',NULL,'恒大','jjj','jjjjjjjjjjjjjj',0,NULL,NULL,NULL,NULL,'2016-01-26 14:09:14',NULL,1),('b772c353-c6bd-4efd-81d2-3cdea355e996','1','精彩赛事111','0a80313f-6f94-483a-a758-177138aa21d6','','77','我','请问',0,NULL,NULL,NULL,NULL,'2016-01-28 10:52:23',NULL,1),('bd3d3573-988b-4882-ba15-778132cb3e28','963594ae-6744-4621-88ec-cdf43a2e088d','凯瑟琳','0a80313f-6f94-483a-a758-177138aa21d6',NULL,'77','777','7777',0,NULL,NULL,NULL,NULL,'2016-01-26 13:50:46',NULL,1),('cfb04c03-042e-4034-be8b-373b47f32f25','1','精彩赛事111','0a80313f-6f94-483a-a758-177138aa21d6','','77','123424','42635',1,NULL,NULL,NULL,NULL,'2016-01-28 10:52:41','2016-01-28 17:53:49',1),('e0aec0aa-3260-488d-8882-f221e2fb7068',NULL,NULL,'9807d231-e9e7-4dcf-9bee-197de3edfe0b',NULL,NULL,'555','5555',0,NULL,NULL,NULL,NULL,'2016-01-26 13:31:20','2016-01-26 14:06:31',0),('e412bbf7-4e0d-44fa-afaf-77e75b64467c','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','0a80313f-6f94-483a-a758-177138aa21d6','\\upload\\20160219\\40fb3d6357384609a8a44889d117108f.jpg','77','asdasd asd as','13012817029',0,'3e6346a3-f942-4567-bf2a-926117022fbf','jam',NULL,NULL,'2016-02-01 11:46:44','2016-02-19 15:57:07',1),('e68301dc-475d-4295-ae4f-bb5bcb81baf5','963594ae-6744-4621-88ec-cdf43a2e088d','傻傻地','2','\\upload\\20160126\\b670c3d3dfb046a78fffc679b754949b.jpg','二号球队','23523523','412432',0,NULL,NULL,NULL,NULL,'2016-01-26 14:56:44',NULL,1),('f3b264a9-c9eb-46fb-a5d2-4c450f37749b','1','精彩赛事111','2',NULL,'二号球队','tt','tttt',0,NULL,NULL,NULL,NULL,'2016-01-26 13:56:41',NULL,1);

/*Table structure for table `sst_competition_match` */

DROP TABLE IF EXISTS `sst_competition_match`;

CREATE TABLE `sst_competition_match` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `comp_id` varchar(36) DEFAULT NULL COMMENT '赛事id',
  `comp_name` varchar(20) DEFAULT NULL COMMENT '赛事名称',
  `cround_id` varchar(36) DEFAULT NULL COMMENT '赛事场次id',
  `cround_name` varchar(20) DEFAULT NULL COMMENT '赛事场次名称',
  `home_team_id` varchar(36) DEFAULT NULL COMMENT '主场球队id',
  `home_team_icon` varchar(200) DEFAULT NULL COMMENT '主场球队图标',
  `home_team_name` varchar(20) DEFAULT NULL COMMENT '主场球队名称',
  `visiting_team_id` varchar(36) DEFAULT NULL COMMENT '客场球队id',
  `visiting_team_icon` varchar(200) DEFAULT NULL COMMENT '客场球队图标',
  `visiting_team_name` varchar(20) DEFAULT NULL COMMENT '客场球队名',
  `match_type` int(1) DEFAULT NULL COMMENT '比赛状态(0-未开始,1-进行中,2-已结束)',
  `match_time` datetime DEFAULT NULL COMMENT '比赛时间',
  `home_score` int(2) DEFAULT NULL COMMENT '主场得分',
  `visiting_score` int(2) DEFAULT NULL COMMENT '客场得分',
  `address` varchar(200) DEFAULT NULL COMMENT '地点',
  `create_admin_id` varchar(36) DEFAULT NULL COMMENT '创建人id',
  `create_admin_name` varchar(20) DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) NOT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='比赛';

/*Data for the table `sst_competition_match` */

insert  into `sst_competition_match`(`id`,`comp_id`,`comp_name`,`cround_id`,`cround_name`,`home_team_id`,`home_team_icon`,`home_team_name`,`visiting_team_id`,`visiting_team_icon`,`visiting_team_name`,`match_type`,`match_time`,`home_score`,`visiting_score`,`address`,`create_admin_id`,`create_admin_name`,`create_time`,`last_update_time`,`stat`) values ('4acfdd23-66ba-4bb5-ab71-a9c709911feb','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','550f6927-8cf5-4541-bd0a-0e66d20d130b','第二轮','0a80313f-6f94-483a-a758-177138aa21d6','\\upload\\20160123\\ba6d9fc7e7c24c988ce993ab1d73309a.jpg','77','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160123\\9a564926fa6c47d798da84ee3c108f9d.jpg','恒大',2,'2016-01-26 10:00:00',2,4,'','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-27 17:52:52','2016-02-01 15:13:35',1),('506fe6db-5f79-4311-9e20-3986135c42d7','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','550f6927-8cf5-4541-bd0a-0e66d20d130b','第二轮','2',NULL,'二号球队','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160123\\9a564926fa6c47d798da84ee3c108f9d.jpg','恒大',2,'2016-01-26 14:00:00',2,1,NULL,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-27 17:52:52','2016-02-01 15:13:18',1),('67d11875-876c-49d6-a7b2-d9f2e16aeea4','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','e8f78f7c-77cb-410a-9e0b-ff7789e01d2c','季前赛','d466dc45-ca3a-4ee7-856f-bea6af533cf4','\\upload\\20160123\\9eb5ed8f9c9d4aff981645dca921814f.jpg','66','1',NULL,'一号球队',0,'2016-01-30 14:00:00',0,0,'66','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-26 10:49:23','2016-01-26 16:11:33',1),('79e2c6ee-fce1-4475-84fc-21d84e753e2f','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','c0ed4f64-8793-453f-b873-1d16f539623a','总决赛','1',NULL,'一号球队','d466dc45-ca3a-4ee7-856f-bea6af533cf4','\\upload\\20160123\\9eb5ed8f9c9d4aff981645dca921814f.jpg','66',0,'2016-01-25 09:00:00',3,2,NULL,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-27 17:35:19',NULL,1),('7eec8238-c8a4-47d5-b88e-21f9f3c5b083','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','f71a3858-d215-4a1d-bd2f-a50cc57b0cd3','第四场比赛','0a80313f-6f94-483a-a758-177138aa21d6','\\upload\\20160123\\ba6d9fc7e7c24c988ce993ab1d73309a.jpg','77','2',NULL,'二号球队',0,'2016-02-03 14:00:00',0,0,'','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-02-02 14:39:26',NULL,1),('9e7bc0aa-abf4-49a5-b122-36225f29de8e','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','550f6927-8cf5-4541-bd0a-0e66d20d130b','第二轮','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160123\\9a564926fa6c47d798da84ee3c108f9d.jpg','恒大','0a80313f-6f94-483a-a758-177138aa21d6','\\upload\\20160123\\ba6d9fc7e7c24c988ce993ab1d73309a.jpg','77',2,'2016-01-27 10:00:00',3,1,'广州市11','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-27 17:52:52','2016-02-01 15:14:08',1),('d65235f3-7f3b-43e8-ac23-83428584d80a','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','f71a3858-d215-4a1d-bd2f-a50cc57b0cd3','第四场比赛','2',NULL,'二号球队','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160123\\9a564926fa6c47d798da84ee3c108f9d.jpg','恒大',0,'2016-02-12 12:00:00',0,0,NULL,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-02-02 14:39:26',NULL,1),('dd393ab6-133b-4e74-9cd7-bd0fb234cc4b','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','e8f78f7c-77cb-410a-9e0b-ff7789e01d2c','季前赛','1',NULL,'一号球队','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160123\\9a564926fa6c47d798da84ee3c108f9d.jpg','恒大',0,'2016-01-29 11:00:00',0,0,NULL,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-26 10:49:23','2016-01-26 16:11:21',1),('de830e2a-7d9d-412d-9203-02661fd6029f','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','e8f78f7c-77cb-410a-9e0b-ff7789e01d2c','季前赛','819ac90a-42a9-4087-ac4b-6698eebe11dd','\\upload\\20160123\\9a564926fa6c47d798da84ee3c108f9d.jpg','恒大','d466dc45-ca3a-4ee7-856f-bea6af533cf4','\\upload\\20160123\\9eb5ed8f9c9d4aff981645dca921814f.jpg','66',0,'2016-01-28 10:00:00',0,0,'广州市11','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-26 10:49:23','2016-01-28 15:42:16',0);

/*Table structure for table `sst_competition_news` */

DROP TABLE IF EXISTS `sst_competition_news`;

CREATE TABLE `sst_competition_news` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `comp_id` varchar(36) DEFAULT NULL COMMENT '赛事id',
  `comp_name` varchar(36) DEFAULT NULL COMMENT '赛事名称',
  `title` varchar(40) DEFAULT NULL COMMENT '标题',
  `summary` varchar(20) DEFAULT NULL COMMENT '简介',
  `content` varchar(5000) DEFAULT NULL COMMENT '内容',
  `create_admin_id` varchar(36) DEFAULT NULL COMMENT '创建者id',
  `create_admin_name` varchar(20) DEFAULT NULL COMMENT '创建者姓名',
  `update_admin_id` varchar(36) DEFAULT NULL COMMENT '修改者id',
  `update_admin_name` varchar(20) DEFAULT NULL COMMENT '修改者姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赛事动态';

/*Data for the table `sst_competition_news` */

insert  into `sst_competition_news`(`id`,`comp_id`,`comp_name`,`title`,`summary`,`content`,`create_admin_id`,`create_admin_name`,`update_admin_id`,`update_admin_name`,`create_time`,`last_update_time`,`stat`) values ('1f848676-3e12-4a5b-81a6-e673e303afac','05ab432c-67ec-42bb-8ef7-1bac55f28976',NULL,'111',NULL,'<p>11111111111111<br/></p>',NULL,NULL,NULL,NULL,'2016-01-22 18:18:15',NULL,1),('27314cd3-de0a-4693-985e-3fd92c3cb740','076fa808-52e0-44e3-9ae3-4eaf44ed4186','老五','ee','ee','<p>ee</p>','3e6346a3-f942-4567-bf2a-926117022fbf','jam',NULL,NULL,'2016-02-19 15:57:36',NULL,1),('2a2ce72d-dd23-4422-bd92-ce0642035177','4aa4250e-d01e-4610-80d2-ce20e8be3ab6','11','收到',NULL,'<p>都是发多少撒旦 撒的d<br/></p>','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin',NULL,NULL,'2016-02-19 14:27:29',NULL,1),('4355c5c9-a601-4cfb-8d5c-56e5fa7e791f','05ab432c-67ec-42bb-8ef7-1bac55f28976',NULL,'111222',NULL,'<p>11111111111111<br/></p>',NULL,NULL,NULL,NULL,'2016-01-22 18:34:13',NULL,1),('51ac2cf0-960e-480a-a843-eaf6dfe7a212','076fa808-52e0-44e3-9ae3-4eaf44ed4186',NULL,'5555',NULL,'<p>5555555555555555555555555555555555555555</p>',NULL,NULL,NULL,NULL,'2016-01-23 14:23:07',NULL,1),('51f10552-826a-41ed-8113-0f4c0d096ca1','076fa808-52e0-44e3-9ae3-4eaf44ed4186','老五','啊啊','啊啊','<p>啊啊<br/></p>','3e6346a3-f942-4567-bf2a-926117022fbf','jam',NULL,NULL,'2016-02-19 15:44:33',NULL,1),('5827bc78-6401-4875-ba3b-4a0fe4db793e','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','tt','tt','<p>tt</p>','3e6346a3-f942-4567-bf2a-926117022fbf','jam',NULL,NULL,'2016-02-19 16:09:19',NULL,1),('7447e4e2-1b20-4352-8d8e-3b3f8ae6b04e','076fa808-52e0-44e3-9ae3-4eaf44ed4186',NULL,'111',NULL,'<p>1111111111111111111111<br/></p>',NULL,NULL,NULL,NULL,'2016-01-22 18:17:31',NULL,1),('7ca13ff2-1fe9-49d1-b560-3374b31b6023','05ab432c-67ec-42bb-8ef7-1bac55f28976',NULL,'haha',NULL,'<p>hahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahaha</p>',NULL,NULL,NULL,NULL,'2016-01-22 15:55:32','2016-01-22 16:13:26',1),('9190bf2a-2897-4ec1-9346-4e8326580d4a','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','qwe','qwe','<p>qwe&nbsp;</p>','3e6346a3-f942-4567-bf2a-926117022fbf','jam',NULL,NULL,'2016-02-19 16:06:30',NULL,1),('a257c8d4-48db-4d86-bfeb-1ca643b5c986','05ab432c-67ec-42bb-8ef7-1bac55f28976',NULL,'111222111',NULL,'<p>11111111111111<br/></p>',NULL,NULL,NULL,NULL,'2016-01-22 18:36:31',NULL,1),('ab25b707-a5ea-4867-8c5b-38809e896a40','05ab432c-67ec-42bb-8ef7-1bac55f28976',NULL,'嘻嘻',NULL,'<p>嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻</p>',NULL,NULL,NULL,NULL,'2016-01-22 11:20:29','2016-01-22 16:13:26',1),('b5764563-3ee5-4e57-bb08-1db371bd527b','1',NULL,'哇哇',NULL,'<p>哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇</p>',NULL,NULL,NULL,NULL,'2016-01-22 15:55:49','2016-01-22 16:13:26',1),('c060ef20-4f7d-46fd-9194-2ca8b145e303','4aa4250e-d01e-4610-80d2-ce20e8be3ab6','11','似懂非懂',NULL,'<p>手动阀是电风扇阿凡达<br/></p>','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin',NULL,NULL,'2016-02-19 14:27:17',NULL,1),('d47e6c40-d6ce-4b47-892f-aef3c2945a50','05ab432c-67ec-42bb-8ef7-1bac55f28976',NULL,'呵呵',NULL,'<p>呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵</p>',NULL,NULL,NULL,NULL,'2016-01-22 16:05:10','2016-01-22 16:13:26',1),('d69c1316-a69f-4963-9e6e-2f0fd92e3bd0','422c5980-b624-4bd2-8184-a594149dcc17',NULL,'44',NULL,'<p>444444444444444444</p>',NULL,NULL,NULL,NULL,'2016-01-23 14:22:55',NULL,1),('e770dc87-4356-4061-ace2-17273decb3c1','05ab432c-67ec-42bb-8ef7-1bac55f28976',NULL,'aaa',NULL,'<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>',NULL,NULL,NULL,NULL,'2016-01-22 18:15:53',NULL,1),('fd8527ec-31a9-4b6a-a2c4-8bf5dae3a1f0','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','ss','ss','<p style=\"text-align: left;\">ss</p>','3e6346a3-f942-4567-bf2a-926117022fbf','jam',NULL,NULL,'2016-02-19 15:45:44',NULL,1);

/*Table structure for table `sst_competition_notice` */

DROP TABLE IF EXISTS `sst_competition_notice`;

CREATE TABLE `sst_competition_notice` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `comp_id` varchar(36) DEFAULT NULL COMMENT '赛事id',
  `title` varchar(40) DEFAULT NULL COMMENT '标题',
  `summary` varchar(20) DEFAULT NULL COMMENT '简介',
  `content` text COMMENT '内容',
  `create_admin_id` varchar(36) DEFAULT NULL COMMENT '创建者id',
  `create_admin_name` varchar(20) DEFAULT NULL COMMENT '创建者姓名',
  `update_admin_id` varchar(36) DEFAULT NULL COMMENT '修改者id',
  `update_admin_name` varchar(20) DEFAULT NULL COMMENT '修改者姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赛事公告';

/*Data for the table `sst_competition_notice` */

insert  into `sst_competition_notice`(`id`,`comp_id`,`title`,`summary`,`content`,`create_admin_id`,`create_admin_name`,`update_admin_id`,`update_admin_name`,`create_time`,`last_update_time`,`stat`) values ('1bb07586-e3b4-4806-a8bf-c619a8d88b86','4aa4250e-d01e-4610-80d2-ce20e8be3ab6','我就我','我就我颜色不一样的烟火','<p>大家我就是我.内容.内容.内容.内容.内容.内容.内容.内容.内容</p>','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin',NULL,NULL,'2016-02-19 15:24:48',NULL,1),('2715d219-63d0-4358-902e-7df19a7ecc51','05ab432c-67ec-42bb-8ef7-1bac55f28976','',NULL,'',NULL,NULL,NULL,NULL,'2016-01-25 09:11:48','2016-01-25 09:11:51',0),('2cca6159-f6a1-40d5-8dc0-411e7ed06477','076fa808-52e0-44e3-9ae3-4eaf44ed4186','222',NULL,'<p>22222222222222222222222222222222222222222222222222222222222222222222222<br/></p>',NULL,NULL,NULL,NULL,'2016-01-22 18:22:04','2016-01-22 18:26:44',1),('37230d93-dbce-4201-b78f-d3a06f6f80cf','076fa808-52e0-44e3-9ae3-4eaf44ed4186','000111222',NULL,'<p>00000000000000000000000000000000000000<br/></p>',NULL,NULL,NULL,NULL,'2016-01-22 18:33:41','2016-01-23 14:22:15',1),('4db419e3-23f4-4c4b-968c-52628d7f916a','422c5980-b624-4bd2-8184-a594149dcc17','22',NULL,'<p>2222<br/></p>',NULL,NULL,NULL,NULL,'2016-01-23 17:43:56',NULL,1),('899af3b7-1d6e-494f-a6ed-f09aa2c669c0','05ab432c-67ec-42bb-8ef7-1bac55f28976','111',NULL,'<p>111111111111111111111111111111111</p>',NULL,NULL,NULL,NULL,'2016-01-22 18:20:24','2016-01-22 18:26:22',1),('8ec14c8a-79bb-4ec1-b908-9beab76e8d98','4aa4250e-d01e-4610-80d2-ce20e8be3ab6','多少发的说法','手动阀都是','<p>的说法爱上发发爱上发送发范德萨都是 <br/></p>','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin',NULL,NULL,'2016-02-19 15:26:30',NULL,1),('a3ce2cff-6f03-4899-b2d2-df38287ad706','4aa4250e-d01e-4610-80d2-ce20e8be3ab6','内容2',NULL,'<p align=\"left\">内容内容2222</p>','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin',NULL,NULL,'2016-02-19 11:50:33',NULL,1),('cb83b908-3329-47f7-9a2d-c7aff4a3447d','4aa4250e-d01e-4610-80d2-ce20e8be3ab6','公告1',NULL,'<p>内容内容内容内容内容</p>','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin',NULL,NULL,'2016-02-19 11:50:14',NULL,1),('d1d4eaa4-04cb-4f19-877f-3bc503ceb303','05ab432c-67ec-42bb-8ef7-1bac55f28976','333',NULL,'<p>333333333333333333333333333333333333333333333333333333</p>',NULL,NULL,NULL,NULL,'2016-01-22 18:22:13','2016-01-22 18:26:44',1);

/*Table structure for table `sst_competition_round` */

DROP TABLE IF EXISTS `sst_competition_round`;

CREATE TABLE `sst_competition_round` (
  `id` varchar(36) NOT NULL,
  `comp_id` varchar(36) NOT NULL COMMENT '赛事id',
  `comp_name` varchar(20) NOT NULL COMMENT '赛事名称',
  `name` varchar(20) NOT NULL COMMENT '比赛第几轮',
  `page_ranking` int(2) NOT NULL DEFAULT '1' COMMENT '页面排序',
  `create_admin_id` varchar(36) DEFAULT NULL COMMENT '创建管理员Id',
  `create_admin_name` varchar(20) DEFAULT NULL COMMENT '创建管理员',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_time` datetime DEFAULT NULL,
  `stat` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赛事场次表';

/*Data for the table `sst_competition_round` */

insert  into `sst_competition_round`(`id`,`comp_id`,`comp_name`,`name`,`page_ranking`,`create_admin_id`,`create_admin_name`,`create_time`,`last_update_time`,`stat`) values ('1','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','第一轮',4,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-23 13:36:35','2016-01-25 16:33:37',0),('2','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','第二轮',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-23 13:36:35','2016-01-25 16:33:28',0),('3','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','第三轮',3,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-23 13:36:35','2016-01-25 16:33:19',0),('34ffdd8f-7e7e-4391-aace-93a5515c9dd0','b452cc8e-2a68-46ce-9bdd-4ba032261f11','老大','赛事',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 13:33:42','2016-01-25 16:33:41',0),('3f6636f4-598c-40a4-b2c6-cf97135f29ff','d85621ad-4720-4515-8795-81033707bdcb','老刘','手动阀',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 14:13:48','2016-01-25 16:33:58',0),('550f6927-8cf5-4541-bd0a-0e66d20d130b','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','第二轮',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-26 09:47:07','2016-02-02 14:44:45',1),('6df18d81-002e-477b-addf-14fc0eaf06ee','076fa808-52e0-44e3-9ae3-4eaf44ed4186','老五','第一场',2,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 13:23:19','2016-01-25 16:33:12',0),('8bcf277f-7c8f-4fc2-8edd-b09499fab06e','eb17c3fd-ad77-4474-a145-8a6f11f76f64','星期三','是',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 13:40:01','2016-01-25 16:33:45',0),('9023641f-9c84-41d2-bbfe-2d1e3ad0d6f9','963594ae-6744-4621-88ec-cdf43a2e088d','傻傻地','是',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 14:08:32','2016-01-25 16:33:55',0),('980c1483-4be7-4aa6-8a99-9c2568305ecd','a84b7793-7b01-4fe6-b609-07671bf4b27d','精彩赛事33','手动阀111',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 14:18:22','2016-01-25 16:34:04',0),('a25d829d-8360-4f80-bb36-cf2d42e6c703','69a44c2b-9a7d-4044-a2b1-9f9f121aadbe','O(∩_∩)O哈哈~','第一场',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 13:24:42','2016-01-25 16:33:08',0),('ae25170c-c939-4d9f-8b6d-959ec3a01080','1','精彩赛事111','第一场',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 13:21:13','2016-01-25 16:33:16',0),('b3307c6b-5d09-4de7-a6e5-6c4501753ebe','96b7a17f-36c7-4428-8b0c-3c8f1ddbcdbb','赛起手2211','赛事',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 13:31:49','2016-01-25 16:33:05',0),('c0ed4f64-8793-453f-b873-1d16f539623a','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','总决赛',4,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-26 09:51:54','2016-02-02 14:43:34',1),('d0d7b11a-39d6-49a7-ba18-56d41af81602','e625318f-9c57-4c42-92ab-a7b39539ab81','阿萨德','是',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 14:00:59','2016-01-25 16:33:52',0),('d6d5b5ce-37e3-4b08-bcd8-ef35c46c6d5b','422c5980-b624-4bd2-8184-a594149dcc17','老四','撒旦',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 13:50:48','2016-01-25 16:33:48',0),('e8f78f7c-77cb-410a-9e0b-ff7789e01d2c','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','季前赛',3,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 15:58:47','2016-02-02 14:40:05',1),('eb653148-bf6c-49b0-a568-13bbb2a5f216','e625318f-9c57-4c42-92ab-a7b39539ab81','阿萨德','12啊',1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-25 14:21:46','2016-01-25 16:34:04',0),('f71a3858-d215-4a1d-bd2f-a50cc57b0cd3','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','第四场比赛',2,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-02-02 14:39:26','2016-02-02 14:39:57',1);

/*Table structure for table `sst_competition_team` */

DROP TABLE IF EXISTS `sst_competition_team`;

CREATE TABLE `sst_competition_team` (
  `id` varchar(36) NOT NULL,
  `comp_id` varchar(36) NOT NULL COMMENT '赛事id',
  `team_id` varchar(36) NOT NULL COMMENT '球队id',
  `win` int(2) NOT NULL DEFAULT '0' COMMENT '胜场次',
  `draw` int(2) NOT NULL DEFAULT '0' COMMENT '平场次',
  `lose` int(2) NOT NULL DEFAULT '0' COMMENT '负场次',
  `goal_in` int(2) NOT NULL DEFAULT '0' COMMENT '进球数',
  `goal_out` int(2) NOT NULL DEFAULT '0' COMMENT '失球数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_time` datetime DEFAULT NULL,
  `stat` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赛事参加球队关联表';

/*Data for the table `sst_competition_team` */

insert  into `sst_competition_team`(`id`,`comp_id`,`team_id`,`win`,`draw`,`lose`,`goal_in`,`goal_out`,`create_time`,`last_update_time`,`stat`) values ('31b65bc1-67e6-4a5b-9fc5-21ee2cc04839','4aa4250e-d01e-4610-80d2-ce20e8be3ab6','d466dc45-ca3a-4ee7-856f-bea6af533cf4',1,2,3,1,3,'2016-02-19 16:10:48',NULL,1),('6ebd5748-2b17-4e86-9017-37f5ae4499bd','4aa4250e-d01e-4610-80d2-ce20e8be3ab6','819ac90a-42a9-4087-ac4b-6698eebe11dd',2,1,3,3,1,'2016-02-19 16:10:08',NULL,1),('74cec01d-c401-4ca1-b912-9f1469caf719','1','0a80313f-6f94-483a-a758-177138aa21d6',2,0,0,2,1,'2016-01-28 17:53:49','2016-02-01 11:15:36',1),('88b6f210-6fa1-468f-b878-9d8ac2ba9b04','4aa4250e-d01e-4610-80d2-ce20e8be3ab6','2',5,3,1,3,1,'2016-02-19 16:10:26',NULL,1),('9de24a0e-7f6e-4299-81f4-429c1610bac4','05ab432c-67ec-42bb-8ef7-1bac55f28976','819ac90a-42a9-4087-ac4b-6698eebe11dd',2,0,1,8,5,'2016-01-28 16:02:09','2016-02-01 15:22:50',1),('abaa32f8-2405-4862-9eef-6a0a5969b4ee','05ab432c-67ec-42bb-8ef7-1bac55f28976','2',0,0,0,0,0,'2016-01-28 16:01:57','2016-02-01 14:02:09',1),('d5b90cec-0662-4427-9ebb-ebe8e3cbfde1','05ab432c-67ec-42bb-8ef7-1bac55f28976','0a80313f-6f94-483a-a758-177138aa21d6',0,0,0,0,0,'2016-01-28 16:13:38','2016-02-01 14:41:25',1);

/*Table structure for table `sst_evaluat` */

DROP TABLE IF EXISTS `sst_evaluat`;

CREATE TABLE `sst_evaluat` (
  `id` varchar(36) NOT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `thumbnail` varchar(137) DEFAULT NULL COMMENT '缩略图',
  `join_number` int(11) DEFAULT '0' COMMENT '参与人数',
  `sum_score` int(11) DEFAULT '0' COMMENT '总分',
  `abstracts` varchar(200) DEFAULT NULL COMMENT '简介',
  `order_by` int(11) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `stat` int(11) DEFAULT NULL COMMENT '状态',
  `eva_type` int(4) DEFAULT '1' COMMENT '类型 1心里测试 2体质测试',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评测标题表';

/*Data for the table `sst_evaluat` */

insert  into `sst_evaluat`(`id`,`title`,`thumbnail`,`join_number`,`sum_score`,`abstracts`,`order_by`,`create_time`,`last_update_time`,`stat`,`eva_type`) values ('05321395-f49d-409a-bbeb-2be1ec912a49','测测你能遇上理想爱人的概率？','\\upload\\20160201\\0dad8db1d8e04ab49eb4cee932dd7d71.png',10000,10,'9999',2,'2016-02-01 10:54:06','2016-02-02 10:22:16',1,NULL),('1','交友能力水平测试：大家都愿和你做朋友吗？','\\upload\\20160201\\5ac502355a1a42158351956a8f13b3c7.png',222,0,'2222',1,'2016-02-01 09:54:02','2016-02-02 10:21:56',1,NULL),('373de2a7-5be9-4f96-a706-b4c3d6841d3a','你今生容不容易出轨？','\\upload\\20160202\\6f0ce37aa7964b6bb12207042817a4ef.jpg',456,18,'在现实的生活中，出轨的原因各有不同，一般皆是与其心理或者生理问题有关系。下面一起来做个测试吧，看今生你会精神出轨还是身体出轨。',6,'2016-02-01 11:06:14','2016-02-02 10:25:43',1,NULL),('4e93e43d-ca39-4830-8f2e-90cc098e052c','测婚姻能给你带来安全感吗？','\\upload\\20160201\\9172e55e02dd4ad9be38b02b163d2e0d.png',11,0,'11',5,'2016-02-01 11:27:47','2016-02-02 10:22:38',1,NULL),('a661fb87-cde0-4bd8-b634-f00e29afb73f','一张图测出你现在的恋情','\\upload\\20160201\\883fbdc96e8d44cf8095a80442df7e83.png',100,0,'100',3,'2016-02-01 10:53:42','2016-02-02 10:22:25',1,NULL),('cc143dc8-5ae3-4fa2-acd2-4be0fb9a4b93','测试你爱情受伤的原因','\\upload\\20160201\\47a4c19f800e45e2a23080ce89522c28.png',22,0,'22',5,'2016-02-01 11:03:54','2016-02-02 10:22:45',1,NULL),('cdf99451-1b57-47cd-8eb3-d3b00bcd0faa','你会遭遇什么样的爱情尴尬？','\\upload\\20160201\\4d8ff6bc716c4529946ce68f35f87766.jpg',12,0,'12',4,'2016-02-01 10:51:09','2016-02-02 10:22:31',1,NULL);

/*Table structure for table `sst_evaluat_answer` */

DROP TABLE IF EXISTS `sst_evaluat_answer`;

CREATE TABLE `sst_evaluat_answer` (
  `id` varchar(36) NOT NULL,
  `eva_id` varchar(36) NOT NULL,
  `eva_question_id` varchar(36) NOT NULL,
  `title` varchar(200) DEFAULT NULL COMMENT '答案标题',
  `ans_score` int(11) DEFAULT NULL COMMENT '答案对应的分数',
  `order_by` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评测答案表';

/*Data for the table `sst_evaluat_answer` */

insert  into `sst_evaluat_answer`(`id`,`eva_id`,`eva_question_id`,`title`,`ans_score`,`order_by`,`create_time`,`last_update_time`,`stat`) values ('0fbd674c-1a09-4c57-a2f4-2e0efd499482','373de2a7-5be9-4f96-a706-b4c3d6841d3a','de092025-0958-4514-b2a7-4abcd24a91fc','还好',3,3,'2016-02-02 10:25:40',NULL,1),('1e15328e-54c7-4501-87e4-e81a5299ec97','373de2a7-5be9-4f96-a706-b4c3d6841d3a','de092025-0958-4514-b2a7-4abcd24a91fc','不是',2,2,'2016-02-02 10:25:35',NULL,1),('30ff72d7-e1bc-4dbe-b1ed-955a2ae2a6dc','05321395-f49d-409a-bbeb-2be1ec912a49','5e225419-a8c1-47a3-8443-817a002fb7e9','555',5,1,'2016-02-01 17:02:12','2016-02-01 17:02:21',1),('3db36021-2128-49e6-8eee-f4e7a0de1acf','373de2a7-5be9-4f96-a706-b4c3d6841d3a','bdca2e9b-9dd8-4554-a800-0c1e38abb98f','会',1,1,'2016-02-02 10:24:44','2016-02-02 10:25:02',1),('3ded10d9-58be-4e28-8d25-555525cc159a','05321395-f49d-409a-bbeb-2be1ec912a49','2d1b45cc-87c0-4eb1-8ccb-36c743a0c1e0','11',1,1,'2016-02-01 16:04:29','2016-02-02 09:59:30',1),('472e5790-9a26-433e-8f55-30c59f56615f','373de2a7-5be9-4f96-a706-b4c3d6841d3a','de092025-0958-4514-b2a7-4abcd24a91fc','是的',1,1,'2016-02-02 10:25:30','2016-02-02 10:25:43',1),('6653cdf5-a6b6-4601-8763-1f39daa691e2','373de2a7-5be9-4f96-a706-b4c3d6841d3a','1','还好',3,3,'2016-02-02 10:24:11',NULL,1),('6d7b553b-1951-4140-a6a9-a8628af69966','373de2a7-5be9-4f96-a706-b4c3d6841d3a','1','不是',2,2,'2016-02-02 10:24:04','2016-02-02 10:24:14',1),('7d61f4fd-c180-42e7-9cb5-e2bf2caa78e0','373de2a7-5be9-4f96-a706-b4c3d6841d3a','1','是的',1,1,'2016-02-02 10:23:59',NULL,1),('81fc62c5-d5fd-4b2a-ad97-ff57d4255dbd','373de2a7-5be9-4f96-a706-b4c3d6841d3a','bdca2e9b-9dd8-4554-a800-0c1e38abb98f','还好',3,3,'2016-02-02 10:24:56',NULL,1),('8fbe76e8-391b-452e-9d51-cc01f1c29f97','05321395-f49d-409a-bbeb-2be1ec912a49','2d1b45cc-87c0-4eb1-8ccb-36c743a0c1e0','111',2,2,'2016-02-01 16:08:57','2016-02-01 17:02:01',1),('d555a63a-a829-4eeb-b23d-a0694076bc63','373de2a7-5be9-4f96-a706-b4c3d6841d3a','bdca2e9b-9dd8-4554-a800-0c1e38abb98f','不会',2,2,'2016-02-02 10:24:50',NULL,1);

/*Table structure for table `sst_evaluat_question` */

DROP TABLE IF EXISTS `sst_evaluat_question`;

CREATE TABLE `sst_evaluat_question` (
  `id` varchar(36) NOT NULL,
  `eva_id` varchar(36) DEFAULT NULL COMMENT '评测Id',
  `title` varchar(50) DEFAULT NULL COMMENT '题目标题',
  `sum_score` int(11) DEFAULT '0',
  `order_by` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评测问题列表';

/*Data for the table `sst_evaluat_question` */

insert  into `sst_evaluat_question`(`id`,`eva_id`,`title`,`sum_score`,`order_by`,`create_time`,`last_update_time`,`stat`) values ('0d0b7576-d93d-4430-b36f-d55b42c740fd','05321395-f49d-409a-bbeb-2be1ec912a49','222',0,8,'2016-02-01 15:16:13',NULL,1),('1','373de2a7-5be9-4f96-a706-b4c3d6841d3a','吵架后，他总是愿意主动承认错误吗？',6,1,'2016-02-01 13:40:23','2016-02-02 14:57:56',1),('10ece065-1ddc-4d95-b5f0-3d16cec3062d','05321395-f49d-409a-bbeb-2be1ec912a49','皮肤干裂程度',0,6,'2016-02-01 15:09:15','2016-02-01 15:09:28',1),('2d1b45cc-87c0-4eb1-8ccb-36c743a0c1e0','05321395-f49d-409a-bbeb-2be1ec912a49','我的身体怎么样了',3,1,'2016-02-01 13:55:12','2016-02-02 09:59:30',1),('5e225419-a8c1-47a3-8443-817a002fb7e9','05321395-f49d-409a-bbeb-2be1ec912a49','嘴巴很干的',5,2,'2016-02-01 13:52:31','2016-02-01 17:02:21',1),('617275d0-1224-4363-b65e-6435b3fec235','05321395-f49d-409a-bbeb-2be1ec912a49','2222',1,4,'2016-02-01 13:55:09','2016-02-01 15:26:59',1),('794a824c-1b55-454b-9a45-30442335d997','05321395-f49d-409a-bbeb-2be1ec912a49','444',0,10,'2016-02-01 15:16:21',NULL,1),('9375fcfa-38ea-4899-9ade-fd861b5b3a33','05321395-f49d-409a-bbeb-2be1ec912a49','1111',0,7,'2016-02-01 15:16:09','2016-02-01 15:26:48',1),('b9f678ae-edf3-4f68-9956-87c779b3f320','05321395-f49d-409a-bbeb-2be1ec912a49','5555',0,11,'2016-02-01 15:16:24','2016-02-01 15:26:44',1),('bdca2e9b-9dd8-4554-a800-0c1e38abb98f','373de2a7-5be9-4f96-a706-b4c3d6841d3a','他经常会主动给你买礼物吗？',6,2,'2016-02-02 10:24:35','2016-02-02 10:25:02',1),('c4ab2654-0125-434a-9838-2d25779f970c','05321395-f49d-409a-bbeb-2be1ec912a49','333',0,9,'2016-02-01 15:16:16',NULL,1),('de092025-0958-4514-b2a7-4abcd24a91fc','373de2a7-5be9-4f96-a706-b4c3d6841d3a','他不善于用甜言蜜语来讨好你吗？',6,3,'2016-02-02 10:25:21','2016-02-02 10:25:43',1),('eb2af464-85aa-4789-bdcd-0cc0cf165bb8','05321395-f49d-409a-bbeb-2be1ec912a49','胸闷',1,3,'2016-02-01 13:53:00','2016-02-01 14:47:41',1),('f3ea4444-be37-42ee-8bc7-d8e8bd45d834','05321395-f49d-409a-bbeb-2be1ec912a49','脸颊是否偏红',0,5,'2016-02-01 15:07:34','2016-02-01 15:09:24',1);

/*Table structure for table `sst_evaluat_result` */

DROP TABLE IF EXISTS `sst_evaluat_result`;

CREATE TABLE `sst_evaluat_result` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `eva_id` varchar(36) DEFAULT NULL,
  `eva_score_id` varchar(36) DEFAULT NULL,
  `sum_score` int(11) DEFAULT NULL COMMENT '计算好的总分',
  `create_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评测结果表';

/*Data for the table `sst_evaluat_result` */

insert  into `sst_evaluat_result`(`id`,`user_id`,`eva_id`,`eva_score_id`,`sum_score`,`create_time`,`last_update_time`,`stat`) values ('0de49c85-159f-4d5d-88bd-a7613efcdfc9','1','1','3f71d454-1173-4fc8-8541-4974604a7467',2,'2016-02-02 15:50:24','2016-02-03 11:52:25',1),('24775b44-24d4-4c6e-8b36-df2be6cf7a8a',NULL,'1','3f71d454-1173-4fc8-8541-4974604a7467',2,'2016-02-02 17:39:32',NULL,1),('4a40731e-36d2-48c0-80d3-c415e5de7365',NULL,'1','80143c78-5b14-4176-90ce-fe173c8d7f02',8,'2016-02-02 17:12:52',NULL,1),('5ed2a178-5dd8-4990-8e05-196208f9ca96',NULL,'1','3f71d454-1173-4fc8-8541-4974604a7467',2,'2016-02-02 17:39:30',NULL,1),('828570e1-1674-41ec-ae24-f95e15616909',NULL,'1','80143c78-5b14-4176-90ce-fe173c8d7f02',NULL,'2016-02-03 09:12:12',NULL,1),('c11ddcc2-00f8-4bc6-890b-b6d533a93524','2','1','80143c78-5b14-4176-90ce-fe173c8d7f02',8,'2016-02-02 17:12:46',NULL,1),('cf2f1fa2-553f-4b77-b438-5076a1443041',NULL,'1','3f71d454-1173-4fc8-8541-4974604a7467',2,'2016-02-02 17:13:03',NULL,1);

/*Table structure for table `sst_evaluat_score` */

DROP TABLE IF EXISTS `sst_evaluat_score`;

CREATE TABLE `sst_evaluat_score` (
  `id` varchar(36) NOT NULL,
  `eva_id` varchar(36) DEFAULT NULL,
  `start_score` int(11) DEFAULT NULL COMMENT '开始分数',
  `end_score` int(11) DEFAULT NULL COMMENT '结束分数',
  `abstracts` varchar(2000) DEFAULT NULL COMMENT '评分对应结果',
  `create_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评测题目对应分数结果表';

/*Data for the table `sst_evaluat_score` */

insert  into `sst_evaluat_score`(`id`,`eva_id`,`start_score`,`end_score`,`abstracts`,`create_time`,`last_update_time`,`stat`) values ('3f71d454-1173-4fc8-8541-4974604a7467','1',1,3,'你很注意流行信息，隻要有人和你聊这样的话题，你一定可以马上和他成为无话不谈的好朋友。你是很有原则的人，隻要不和你的原则冲突，你什麽事都好商量，可是如果一但违背你的原则，那就什麽也没得谈了。','2016-02-02 10:07:34','2016-02-02 10:12:31',1),('80143c78-5b14-4176-90ce-fe173c8d7f02','1',4,9,'士大夫首发式发生发射点发射点发射点','2016-02-02 16:22:19',NULL,1);

/*Table structure for table `sst_group` */

DROP TABLE IF EXISTS `sst_group`;

CREATE TABLE `sst_group` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `name` varchar(20) DEFAULT NULL COMMENT '群组名称',
  `create_user_id` varchar(36) DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(20) DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群组表';

/*Data for the table `sst_group` */

insert  into `sst_group`(`id`,`name`,`create_user_id`,`create_user_name`,`create_time`,`last_update_time`,`stat`) values ('1','闷声发大财','0409b62b-564a-4217-8b75-d9b9389d644e','隔壁老王家','2016-01-15 13:23:50',NULL,1);

/*Table structure for table `sst_group_user` */

DROP TABLE IF EXISTS `sst_group_user`;

CREATE TABLE `sst_group_user` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `group_id` varchar(36) DEFAULT NULL COMMENT '群组id',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群组用户表';

/*Data for the table `sst_group_user` */

insert  into `sst_group_user`(`id`,`group_id`,`user_id`,`create_time`,`last_update_time`,`stat`) values ('1','1','0409b62b-564a-4217-8b75-d9b9389d644e','2016-01-15 13:38:42',NULL,1),('2','1','48a8acf7-67d0-44a9-806e-3b00c2b1337a','2016-01-15 13:38:42',NULL,1),('3','1','48a8acf7-67d0-44a9-806e-3b00c2b1337b','2016-01-15 13:38:42',NULL,0),('4','1','48a8acf7-67d0-44a9-806e-3b00c2b1337c','2016-01-15 13:38:42',NULL,1);

/*Table structure for table `sst_information` */

DROP TABLE IF EXISTS `sst_information`;

CREATE TABLE `sst_information` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `pic` varchar(200) DEFAULT NULL COMMENT '缩略图',
  `summary` varchar(200) DEFAULT NULL COMMENT '简介',
  `content` text COMMENT '内容',
  `parent_type` int(1) NOT NULL DEFAULT '0' COMMENT '一级类型(0-新闻,1-健康食谱)',
  `sub_type` int(1) DEFAULT NULL COMMENT '二级类型(健康食谱:(0-常识,1-瘦身,2-食疗,3-实物归档,4-营养手册))',
  `create_admin_id` varchar(36) DEFAULT NULL COMMENT '创建者id',
  `create_admin_name` varchar(20) DEFAULT NULL COMMENT '创建者姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资讯(0-新闻,1-健康食谱)';

/*Data for the table `sst_information` */

insert  into `sst_information`(`id`,`title`,`pic`,`summary`,`content`,`parent_type`,`sub_type`,`create_admin_id`,`create_admin_name`,`create_time`,`last_update_time`,`stat`) values ('b49d886a-deb3-4062-83c3-525d9fe337be','习近平:确保食品安全政府义不容辞','\\upload\\20160129\\6db43acd04cc400cad0c838212f49785.jpg','习近平对食品安全工作作出重要指示强调牢固树立以人民为中心的发展理念　落实“四个最严”的要求 切实保障人民群众“舌尖上的安全”','<p><span style=\"color: rgb(0, 0, 0); font-family: &#39;Microsoft YaHei&#39;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 32px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none;\">新华社北京1月28日电 中共中央总书记、国家主席、中央军委主席习近平日前对食品安全工作作出重要指示强调，确保食品安全是民生工程、民心工程，是各级党委、政府义不容辞之责。近年来，各相关部门做了大量工作，取得了积极成效。当前，我国食品安全形势依然严峻，人民群众热切期盼吃得更放心、吃得更健康。2016年是“十三五”开局之年，要牢固树立以人民为中心的发展理念，坚持党政同责、标本兼治，加强统筹协调，加快完善统一权威的监管体制和制度，落实“四个最严”的要求，切实保障人民群众“舌尖上的安全”。</span></p>',0,NULL,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-29 18:11:24',NULL,1),('f0fe0c29-4fc4-4591-a32c-1dff47cd2bb0','健康小食谱','\\upload\\20160129\\426dc1d847da4ba08443a0e772845c3a.jpg','只要你在日常生活中加入一些生活的习惯，你同样可以轻松保持苗条身材。','<p style=\"word-wrap: break-word !important; margin: 0px; padding: 0px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; font-size: 16px; line-height: 25px; box-sizing: border-box !important; background-color: rgb(255, 255, 255);\"><strong style=\"word-wrap: break-word !important; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important;\">上卫生间之前喝一杯酸梅汁</strong></p><p style=\"word-wrap: break-word !important; margin: 0px; padding: 0px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; font-size: 16px; line-height: 25px; box-sizing: border-box !important; background-color: rgb(255, 255, 255);\"><strong style=\"word-wrap: break-word !important; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important;\"><br style=\"word-wrap: break-word;\"/></strong></p><p style=\"word-wrap: break-word !important; margin: 0px; padding: 0px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; font-size: 16px; line-height: 25px; box-sizing: border-box !important; background-color: rgb(255, 255, 255);\">酸梅中富含花青素，可以帮助身体有效地排出脂肪和毒素。喝一杯酸梅汁，你身体的“清洁”程序就能大大加速，肝脏也就能将你体内那些可能引起肥胖的物质迅速而彻底地排出体外。</p><p style=\"word-wrap: break-word !important; margin: 0px; padding: 0px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; font-size: 16px; line-height: 25px; box-sizing: border-box !important; background-color: rgb(255, 255, 255);\"><br style=\"word-wrap: break-word;\"/></p><p style=\"word-wrap: break-word !important; margin: 0px; padding: 0px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; font-size: 16px; line-height: 25px; box-sizing: border-box !important; background-color: rgb(255, 255, 255);\"><strong style=\"word-wrap: break-word !important; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important;\">早餐和午餐之间吃些花生</strong></p><p style=\"word-wrap: break-word !important; margin: 0px; padding: 0px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; font-size: 16px; line-height: 25px; box-sizing: border-box !important; background-color: rgb(255, 255, 255);\"><strong style=\"word-wrap: break-word !important; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important;\"><br style=\"word-wrap: break-word;\"/></strong></p><p style=\"word-wrap: break-word !important; margin: 0px; padding: 0px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; font-size: 16px; line-height: 25px; box-sizing: border-box !important; background-color: rgb(255, 255, 255);\">科学家在一次调查中发现，吃花生的减肥者减去的体重是那些不吃花生者的2倍!研究表明，如果每天吃一把花生，热量的摄入就会减少333卡。</p><p><br/></p>',0,NULL,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-29 18:10:04','2016-02-01 09:44:27',1),('fa52c64d-c45f-4edb-b018-e91ffd68e384','聚运动天使轮','\\upload\\20160129\\1bccc0e4300947a893c17c2b2f50e002.jpg','某知名对聚运动文化传播有限公司进行天使轮','<p>某知名对聚运动文化传播有限公司进行天使轮</p><p>&nbsp;&nbsp; 怎么会,只能这些,是不是时间把人变得傻了点.</p><p>我努力微笑坚强<br/></p>',0,NULL,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-29 13:34:57','2016-01-29 13:58:48',1),('fd2ab3ae-4459-4a15-92ef-fd08bca24651','11','\\upload\\20160201\\db75a819da4a4247ae9135e3599e0ad5.jpg','11','<p>11</p>',0,NULL,'3e6346a3-f942-4567-bf2a-926117022fbf','jam','2016-02-01 10:45:27','2016-02-01 10:45:33',0);

/*Table structure for table `sst_memo` */

DROP TABLE IF EXISTS `sst_memo`;

CREATE TABLE `sst_memo` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='备忘';

/*Data for the table `sst_memo` */

insert  into `sst_memo`(`id`,`content`,`user_id`,`user_name`,`create_time`,`last_update_time`,`stat`) values ('1','我就我,颜色不一样的我,我就我,颜色不一样的我我就我,颜色不一样的我我就我,颜色不一样的我','0409b62b-564a-4217-8b75-d9b9389d644e','隔壁老王家','2016-01-15 15:45:36',NULL,1);

/*Table structure for table `sst_message` */

DROP TABLE IF EXISTS `sst_message`;

CREATE TABLE `sst_message` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `from_user_id` varchar(36) DEFAULT NULL COMMENT '发送者id',
  `to_user_id` varchar(36) DEFAULT NULL COMMENT '接收者id',
  `content` text COMMENT '信息内容',
  `msg_state` int(1) DEFAULT NULL COMMENT '信息状态:0表示未读,1表示已读',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';

/*Data for the table `sst_message` */

insert  into `sst_message`(`id`,`from_user_id`,`to_user_id`,`content`,`msg_state`,`create_time`,`last_update_time`,`stat`) values ('1','user1','user2','早呀',1,'2016-01-19 10:58:54',NULL,1),('1b33c172-673d-4355-8116-7694580acc21',NULL,NULL,'<p>嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻</p>',NULL,'2016-01-23 09:19:40',NULL,1);

/*Table structure for table `sst_notice` */

DROP TABLE IF EXISTS `sst_notice`;

CREATE TABLE `sst_notice` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `title` varchar(40) DEFAULT NULL COMMENT '标题',
  `create_user_id` varchar(36) DEFAULT NULL COMMENT '创建人Id',
  `create_user_name` varchar(20) DEFAULT NULL COMMENT '创建人名称',
  `content` text COMMENT '公告内容',
  `update_user_id` varchar(36) DEFAULT NULL COMMENT '更新人id',
  `update_user_name` varchar(20) DEFAULT NULL COMMENT '更新人姓名',
  `group_id` varchar(36) DEFAULT NULL COMMENT '群组id',
  `group_name` varchar(20) DEFAULT NULL COMMENT '群组名称',
  `pic` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  `read_stat` int(1) DEFAULT '0' COMMENT '阅读状态:0表示未读;1表示已读',
  `allow_forward` int(1) DEFAULT '1' COMMENT '允许转发:0表示不允许;1表示允许转发',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告表';

/*Data for the table `sst_notice` */

insert  into `sst_notice`(`id`,`title`,`create_user_id`,`create_user_name`,`content`,`update_user_id`,`update_user_name`,`group_id`,`group_name`,`pic`,`create_time`,`last_update_time`,`stat`,`read_stat`,`allow_forward`) values ('097e7a0f-73d1-4e33-98a2-69e391d57b74','houzi',NULL,NULL,'<p>孙悟空</p>',NULL,NULL,NULL,NULL,'\\upload\\20160120\\670386e993f54a71b077c55029cc9f74.jpg','2016-01-20 14:40:07','2016-01-20 15:45:57',1,NULL,1),('11111','第一条','22222','老大','<p>张钧甯</p>','33333','张大伟','44444','最佳组合','\\upload\\20160120\\371712de64ab473f90a179b5c34d9802.jpg','2016-01-13 16:09:45','2016-01-20 15:47:10',1,NULL,1),('1561deba-3659-4465-8bc4-920500123973','22',NULL,NULL,'<p>222<br/></p>',NULL,NULL,NULL,NULL,NULL,'2016-01-20 11:49:48','2016-01-20 15:46:36',0,NULL,1),('1820cc67-bf65-4a2c-85cb-37807c583a87','狗崽',NULL,NULL,'<p>狗崽狗崽狗崽狗崽狗崽狗崽狗崽狗崽狗崽</p>',NULL,NULL,NULL,NULL,'\\upload\\20160120\\b1d3b929bacf4ac698b9b8080f8b8e4f.jpg','2016-01-20 14:50:03','2016-01-20 15:44:57',1,NULL,1),('33ffb01f-a46e-448c-aabb-db35d81ee248','houzi',NULL,NULL,'<p>孙悟空</p>',NULL,NULL,NULL,NULL,NULL,'2016-01-20 14:34:40','2016-01-20 15:46:36',0,NULL,1),('360c7fc8-68ba-40fb-94fe-7f1e08d188f1','狗崽',NULL,NULL,'<p>狗崽狗崽狗崽狗崽狗崽狗崽狗崽狗崽狗崽</p>',NULL,NULL,NULL,NULL,'\\upload\\20160120\\47f18f1e8c404d0e90d2b669ecd9911e.jpg','2016-01-20 14:50:38','2016-01-20 15:44:34',1,NULL,1),('39ab09e0-9879-4897-a443-be16024285a1','1',NULL,NULL,'<p>11<br/></p>',NULL,NULL,NULL,NULL,NULL,'2016-01-20 11:44:18','2016-01-20 15:46:20',0,NULL,1),('4e6c39f0-2060-4981-ac1e-36f25432d328','11',NULL,NULL,'<p>222<br/></p>',NULL,NULL,NULL,NULL,NULL,'2016-01-13 16:47:36','2016-01-20 11:43:55',0,NULL,1),('523382f0-7b90-4e33-84fb-7d73e279caf3','houzi',NULL,NULL,'<p>孙悟空</p>',NULL,NULL,NULL,NULL,'\\upload\\20160120\\c4b9e48fc5cb4cbf8e064ac5cb100187.jpg','2016-01-20 14:53:51','2016-01-20 15:40:24',1,NULL,1),('54377a90-10e3-4639-bc6a-4db6ac1514a0','11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\\upload\\20160127\\3fd14750d116464ca053bd36b8b89c30.jpg','2016-01-27 16:00:14',NULL,1,0,1),('64a542f4-fe41-4bba-8aaa-1d853180973f','狗崽',NULL,NULL,'<p>狗崽狗崽狗崽狗崽狗崽狗崽狗崽狗崽狗崽</p>',NULL,NULL,NULL,NULL,'\\upload\\20160120\\e7a30be893dc4972afa35316e89cecc9.jpg','2016-01-20 14:49:54',NULL,1,NULL,1),('7dc06671-d8f9-47d6-a084-e7d0d9fdf078','11',NULL,NULL,'<p>222<br/></p>',NULL,NULL,NULL,NULL,NULL,'2016-01-13 16:47:20','2016-01-20 11:43:55',0,NULL,1),('824a3bbe-778d-4cfc-89c9-efe395778a99','皮鼓',NULL,NULL,'<p>皮鼓皮鼓皮鼓皮鼓</p>',NULL,NULL,NULL,NULL,'\\upload\\20160120\\5901841e3f874389a689c49ae8dc8bb0.jpg','2016-01-20 15:40:07','2016-01-20 15:53:21',1,NULL,1),('893bd8e5-ac88-4d16-9307-e5b7e34b655e','houzi',NULL,NULL,'<p>孙悟空</p>',NULL,NULL,NULL,NULL,'\\upload\\20160120\\4db6156cd33e4e94bc70b92fd237a34a.jpg','2016-01-20 13:33:05',NULL,1,NULL,1),('94c6a0e9-3c60-46e4-bf03-ca24f39cea8f','111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\\upload\\20160127\\d2c72fd6f6db4491bc5c9e9f2698444f.jpg','2016-01-27 15:59:29',NULL,1,0,1),('95f651fe-f27c-45e0-be6a-9cf5efd14ddf','33',NULL,NULL,'<p>333<br/></p>',NULL,NULL,NULL,NULL,NULL,'2016-01-13 17:36:35','2016-01-20 13:33:31',0,NULL,1),('97689ab2-6c19-4e82-ab01-ddf174a52933','',NULL,NULL,'',NULL,NULL,NULL,NULL,'\\upload\\20160128\\58b62eb4babf47bb837ff811c59b6b79.jpg','2016-01-26 13:26:33','2016-01-28 16:12:15',1,0,1),('a38c2bd5-cdaa-496b-973d-1581c0371b22','66',NULL,NULL,'<p>666<br/></p>',NULL,NULL,NULL,NULL,NULL,'2016-01-13 17:37:00','2016-01-20 15:46:20',0,NULL,1),('aa37fb3c-1f0c-4ed7-a6de-9d1545ed8e20','44',NULL,NULL,'<p>444<br/></p>',NULL,NULL,NULL,NULL,NULL,'2016-01-13 17:36:42','2016-01-20 15:46:20',0,NULL,1),('acf4058e-06be-4b43-83d8-04be5d67f3d4','55',NULL,NULL,'<p>555<br/></p>',NULL,NULL,NULL,NULL,NULL,'2016-01-13 17:36:50','2016-01-20 15:46:36',0,NULL,1),('ae0ebcad-5629-466a-8977-96204829906f','麻瓜',NULL,NULL,'<p>麻瓜<span style=\"white-space: normal;\">麻瓜</span><span style=\"white-space: normal;\">麻瓜</span><span s',NULL,NULL,NULL,NULL,'\\upload\\20160120\\34325e6a10a54495962937d21f1618cf.jpg','2016-01-20 15:10:47','2016-01-20 15:32:19',1,NULL,1),('b4027dbd-f258-47ff-8c99-73a59a2f8a72','7',NULL,NULL,'<p>77<br/></p>',NULL,NULL,NULL,NULL,'\\upload\\20160120\\7dc987ecb309443ab54fd6ebbfd110c9.jpg','2016-01-20 11:52:35',NULL,1,NULL,1),('bc2b2d5c-e1cf-4da4-ad92-c39cdf9e36e8','houzi',NULL,NULL,'<p>孙悟空</p>',NULL,NULL,NULL,NULL,NULL,'2016-01-20 14:36:31','2016-01-20 15:46:36',0,NULL,1),('d902f95e-9400-4430-9b7a-fff9e8524e96','houzi',NULL,NULL,'<p>孙悟空</p>',NULL,NULL,NULL,NULL,'\\upload\\20160120\\ce20d63db4734ac693ebaec0417f09f2.jpg','2016-01-20 14:48:43','2016-01-20 15:45:10',1,NULL,1),('df799295-73ec-4247-9017-9a7bacf67c1e','西瓜',NULL,NULL,'<p>西瓜西瓜西瓜西瓜西瓜西瓜西瓜西瓜西瓜</p>',NULL,NULL,NULL,NULL,'\\upload\\20160120\\792ec22146ed4cbb975d02d29460f09f.jpg','2016-01-20 15:10:24','2016-01-20 15:39:42',1,NULL,1),('e77a2485-9d98-4c18-bff6-5e26698e43b3','',NULL,NULL,'<p>111</p>',NULL,NULL,NULL,NULL,'\\upload\\20160128\\c7b4a191ef7f47869c3d516a4f95ed30.jpg','2016-01-28 14:42:34','2016-01-28 16:12:38',1,0,1),('ec40206e-14a3-4f13-a58f-92ed857eae4d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\\upload\\20160123\\cc0c286b803f4cc899a49a46eb9eeb59.jpg','2016-01-23 13:35:37',NULL,1,0,1),('ed5b0228-9d21-4a60-bc6b-2ff36e8af153','狗崽',NULL,NULL,'<p>狗崽狗崽狗崽狗崽狗崽狗崽狗崽狗崽狗崽</p>',NULL,NULL,NULL,NULL,'\\upload\\20160120\\3c7487a3abeb4b9b926348df12785b29.jpg','2016-01-20 14:52:56','2016-01-20 15:42:34',1,NULL,1),('f64a335e-02d1-4d5e-a826-008ac01b2afc','houzi',NULL,NULL,'<p>孙悟空</p>',NULL,NULL,NULL,NULL,NULL,'2016-01-20 14:24:40','2016-01-20 15:46:36',0,NULL,1),('f7a5b3b6-3906-4b39-8e03-8fba7c3753a2','22',NULL,NULL,'<p>22<br/></p>',NULL,NULL,NULL,NULL,NULL,'2016-01-13 17:36:25','2016-01-20 11:44:08',0,NULL,1),('fe44aafd-880d-442d-b924-0139646c6728','11',NULL,NULL,'<p>222<br/></p>',NULL,NULL,NULL,NULL,NULL,'2016-01-13 16:47:32','2016-01-20 11:43:48',0,NULL,1);

/*Table structure for table `sst_notice_users` */

DROP TABLE IF EXISTS `sst_notice_users`;

CREATE TABLE `sst_notice_users` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `notice_id` varchar(36) DEFAULT NULL COMMENT '公告id',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户id',
  `readstat` int(4) DEFAULT '0' COMMENT '是否阅读(0:未读;1:已读)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户公告关系表';

/*Data for the table `sst_notice_users` */

/*Table structure for table `sst_plan` */

DROP TABLE IF EXISTS `sst_plan`;

CREATE TABLE `sst_plan` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名称',
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `plan_time` datetime DEFAULT NULL COMMENT '提醒时间',
  `is_finish` int(1) NOT NULL DEFAULT '0' COMMENT '是否完成(0-未完成,1-已完成)',
  `is_remind` int(1) NOT NULL DEFAULT '0' COMMENT '是否定时提醒(0-否,1-是)',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='训练计划';

/*Data for the table `sst_plan` */

insert  into `sst_plan`(`id`,`user_id`,`user_name`,`title`,`plan_time`,`is_finish`,`is_remind`,`content`,`create_time`,`last_update_time`,`stat`) values ('1','0409b62b-564a-4217-8b75-d9b9389d644e','隔壁老王家','起床','2016-01-18 09:55:00',0,0,'起来刷牙吃饭','2016-01-18 09:55:19',NULL,1);

/*Table structure for table `sst_remind` */

DROP TABLE IF EXISTS `sst_remind`;

CREATE TABLE `sst_remind` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `to_user_id` varchar(36) DEFAULT NULL COMMENT '接收人id',
  `to_user_name` varchar(36) DEFAULT NULL COMMENT '接收人名称',
  `type` int(1) DEFAULT NULL COMMENT '提醒方式',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `attachment` varchar(200) DEFAULT NULL COMMENT '附件',
  `text` varchar(200) DEFAULT NULL COMMENT '文字',
  `voice` varchar(200) DEFAULT NULL COMMENT '语音',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提醒';

/*Data for the table `sst_remind` */

insert  into `sst_remind`(`id`,`to_user_id`,`to_user_name`,`type`,`send_time`,`attachment`,`text`,`voice`,`user_id`,`user_name`,`create_time`,`last_update_time`,`stat`) values ('1','48a8acf7-67d0-44a9-806e-3b00c2b1337g','遇见',1,'2016-01-15 16:59:38','\\upload\\20160113\\91056db9acb042dd849ac72ac50949eb.jpg','你好,很高兴认识你','\\upload\\20160113\\91056db9acb042dd849ac72ac50949eb.jpg','0409b62b-564a-4217-8b75-d9b9389d644e','隔壁老王家','2016-01-15 16:59:07',NULL,1);

/*Table structure for table `sst_team` */

DROP TABLE IF EXISTS `sst_team`;

CREATE TABLE `sst_team` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `name` varchar(20) DEFAULT NULL COMMENT '球队名称',
  `icon` varchar(200) DEFAULT NULL COMMENT '图标',
  `province` varchar(200) DEFAULT NULL COMMENT '省',
  `city` varchar(200) DEFAULT NULL COMMENT '城市',
  `area` varchar(200) DEFAULT NULL COMMENT '地区',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `summary` text COMMENT '简介',
  `contacts` varchar(20) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `create_user_id` varchar(36) DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(20) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_id` varchar(36) DEFAULT NULL COMMENT '更新人id',
  `update_user_name` varchar(20) DEFAULT NULL COMMENT '更新人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='球队(机构)';

/*Data for the table `sst_team` */

insert  into `sst_team`(`id`,`name`,`icon`,`province`,`city`,`area`,`address`,`summary`,`contacts`,`mobile`,`create_user_id`,`create_user_name`,`update_user_id`,`update_user_name`,`create_time`,`last_update_time`,`stat`) values ('071f7032-658c-482c-b31a-f5770234f2ab','11',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-23 13:36:46','2016-01-23 14:44:06',0),('0a80313f-6f94-483a-a758-177138aa21d6','二号球队','\\upload\\20160219\\deacb022dabb46ed8ac49e4ecfde7203.png',NULL,NULL,NULL,'上海市静安区','<p>77发生的发生范德萨</p>','77','13223212312',NULL,NULL,NULL,NULL,'2016-01-23 14:12:30','2016-02-19 16:19:24',0),('0d1799b5-2c63-4101-9553-c9decb5545f1','0','\\upload\\20160123\\8b70c7d4ee9e459b8e8b3583899bd0ba.jpg',NULL,NULL,NULL,'00','<p>000</p>','0000','00000',NULL,NULL,NULL,NULL,'2016-01-23 14:13:54','2016-01-23 14:28:22',0),('1','一号球队',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('1fc362ae-1324-40f7-a3ad-080893ba4506','0','',NULL,NULL,NULL,'00','<p>000</p>','0000','00000',NULL,NULL,NULL,NULL,'2016-01-23 14:20:28','2016-01-23 14:27:40',0),('2','二号球队','\\upload\\20160219\\cd81536e173d458fb28eacc82989fa1e.png',NULL,NULL,NULL,'上海是电话费is','<p>水电费的数据库<br/><sub></sub></p>','覆盖广泛的','13212322321',NULL,NULL,NULL,NULL,NULL,'2016-02-19 16:21:21',1),('46b24230-d560-4612-8a61-1c24c88de6cd','9','\\upload\\20160123\\33706b3fd4344e02a8f86ffa99455b6f.jpg',NULL,NULL,NULL,'9','<p>99</p>','999','9999',NULL,NULL,NULL,NULL,'2016-01-23 14:13:20',NULL,1),('4a75255f-0400-4ed2-be7c-6585b09e853f','8','\\upload\\20160123\\42e6bf93bcc748b5bf96d2b51794a236.jpg',NULL,NULL,NULL,'888888888888888','<p>88</p>','888','8888',NULL,NULL,NULL,NULL,'2016-01-23 14:12:46','2016-01-23 14:41:00',1),('532c5145-41a2-4720-a331-281a031f63da','0','\\upload\\20160123\\a3c5f1f83fab49e5bf634c31be387285.jpg',NULL,NULL,NULL,'00','<p>000</p>','0000','00000',NULL,NULL,NULL,NULL,'2016-01-23 14:21:34','2016-01-23 14:28:22',0),('819ac90a-42a9-4087-ac4b-6698eebe11dd','恒大','\\upload\\20160123\\9a564926fa6c47d798da84ee3c108f9d.jpg',NULL,NULL,NULL,'广州市11','<p>很不错的中超球队</p>','jam','13956565656',NULL,NULL,NULL,NULL,'2016-01-23 14:00:59','2016-01-23 14:41:31',1),('828765ae-f509-4a85-bd3b-4dc4c1f7ce46','22',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-23 13:49:27',NULL,1),('9807d231-e9e7-4dcf-9bee-197de3edfe0b','55',NULL,NULL,NULL,NULL,'55','<p>55</p>','55','55',NULL,NULL,NULL,NULL,'2016-01-23 13:59:56',NULL,1),('a8542aa3-38c0-405d-b76e-f3f4f0749834','33',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-23 13:51:19',NULL,1),('ba323456-454d-4b59-8bfa-19b8a4e2e7fb','0','\\upload\\20160123\\a3c5f1f83fab49e5bf634c31be387285.jpg',NULL,NULL,NULL,'00','<p>000</p>','0000','00000',NULL,NULL,NULL,NULL,'2016-01-23 14:21:42','2016-01-23 14:28:22',0),('d466dc45-ca3a-4ee7-856f-bea6af533cf4','66','\\upload\\20160123\\9eb5ed8f9c9d4aff981645dca921814f.jpg',NULL,NULL,NULL,'66','<p>66</p>','66','66',NULL,NULL,NULL,NULL,'2016-01-23 14:07:04',NULL,1),('ead0cb09-c6b7-4a94-9d44-4b26a7f4a779','44',NULL,NULL,NULL,NULL,NULL,'<p>4<br/></p>',NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-23 13:55:13',NULL,1);

/*Table structure for table `sst_team_image` */

DROP TABLE IF EXISTS `sst_team_image`;

CREATE TABLE `sst_team_image` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `team_id` varchar(36) DEFAULT NULL COMMENT '球队id',
  `title` varchar(40) DEFAULT NULL COMMENT '图片标题',
  `img_url` varchar(200) DEFAULT NULL COMMENT '图片路径',
  `note` text COMMENT '图片说明',
  `create_user_id` varchar(36) DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(20) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_id` varchar(36) DEFAULT NULL COMMENT '更新人id',
  `update_user_name` varchar(20) DEFAULT NULL COMMENT '更新人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='球队图片';

/*Data for the table `sst_team_image` */

insert  into `sst_team_image`(`id`,`team_id`,`title`,`img_url`,`note`,`create_user_id`,`create_user_name`,`update_user_id`,`update_user_name`,`create_time`,`last_update_time`,`stat`) values ('0','0a80313f-6f94-483a-a758-177138aa21d6','11',NULL,'<p>11</p>',NULL,NULL,NULL,NULL,'2016-01-27 16:01:03','2016-01-27 16:25:21',0),('01076c1b-b38b-4f85-86dd-cf1856522ed2','819ac90a-42a9-4087-ac4b-6698eebe11dd','22','\\upload\\20160129\\76a94619fdf34c209fd8fd76530690f5.jpg','<p>222</p>',NULL,NULL,NULL,NULL,'2016-01-29 10:35:25',NULL,1),('02d7ea2d-6ac0-4860-bde1-6fa0b363cb66','0a80313f-6f94-483a-a758-177138aa21d6','','','',NULL,NULL,NULL,NULL,'2016-01-28 18:24:33','2016-01-29 15:14:36',0),('0dbd5950-5514-4358-85d9-2320f0bc5b45','0a80313f-6f94-483a-a758-177138aa21d6','7','\\upload\\20160129\\f394cbe9b68e47a7a5c7ef3f3c01da4e.jpg','<p>77</p>',NULL,NULL,NULL,NULL,'2016-01-29 15:05:38',NULL,NULL),('2da0109e-7f1c-4e9f-8fd0-ea03043e5210','4a75255f-0400-4ed2-be7c-6585b09e853f','8','','<p>8</p>',NULL,NULL,NULL,NULL,'2016-01-28 18:16:59','2016-01-29 15:14:40',0),('4985ad6d-f554-47f2-8feb-996d0ef6f957','','66','\\upload\\20160127\\6c59dea6c2eb4020986c93305c1df0b1.jpg','<p>666666</p>',NULL,NULL,NULL,NULL,'2016-01-27 16:26:49',NULL,1),('4a8ab7e8-2811-4502-af4b-0c048c13e04c','','44','\\upload\\20160127\\10d89cadd942453cbe8efd7aaec44bd7.jpg','<p>444444444444</p>',NULL,NULL,NULL,NULL,'2016-01-27 16:26:29',NULL,1),('5b468d6a-bfcf-4389-9482-97622e170823','0a80313f-6f94-483a-a758-177138aa21d6','7','\\upload\\20160129\\80348433cdb24b3f8b4a0dd1e36366e5.jpg','<p>77</p>',NULL,NULL,NULL,NULL,'2016-01-29 15:05:38',NULL,NULL),('5e25bcb7-897d-4c6b-96d8-8b783fef42f1','','77','\\upload\\20160127\\a71f8fe8d4aa4ecd83a2854b54cd40df.jpg','<p>7777777777777</p>',NULL,NULL,NULL,NULL,'2016-01-27 16:31:15',NULL,1),('5e7b601f-1533-40a3-be41-1c12b59324fe','819ac90a-42a9-4087-ac4b-6698eebe11dd','22','\\upload\\20160129\\1a8f5307a4a14770a6909a4d994d22de.jpg','<p>222</p>',NULL,NULL,NULL,NULL,'2016-01-29 10:35:25',NULL,1),('61b12eb3-24f2-4a28-9733-679d1567893d','819ac90a-42a9-4087-ac4b-6698eebe11dd','22','\\upload\\20160129\\a149845002874b198ee3b730fa56e137.jpg','<p>222</p>',NULL,NULL,NULL,NULL,'2016-01-29 10:35:23',NULL,1),('663b1e74-38b7-4c3d-9d47-ef7ff25c7c6f','819ac90a-42a9-4087-ac4b-6698eebe11dd','周五!','\\upload\\20160129\\25692d75b565411ca6decc9392661597.jpg','<p>周五!周五!周五!周五!周五!周五!周五!周五!周五!</p>',NULL,NULL,NULL,NULL,'2016-01-29 15:10:25',NULL,NULL),('721d4be2-a0e8-4527-8c4b-5aaf0ed3a14f','2','333','\\upload\\20160129\\a16c97560aad47e7b264bca0a3b3387a.jpg','<p>3333</p>',NULL,NULL,NULL,NULL,'2016-01-29 15:07:57',NULL,NULL),('738b4949-5293-4c84-a20f-16f439c493e3','819ac90a-42a9-4087-ac4b-6698eebe11dd','明天周末哇哇','\\upload\\20160129\\028d5faaa34946dead8924112ce3b0ab.png','<p>明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇</p>',NULL,NULL,NULL,NULL,'2016-01-29 15:12:57',NULL,1),('76f8ae9b-bd1c-4603-b008-5523859e6c8e','','55','\\upload\\20160127\\d8b40655f0aa481c8612c0d6a14a2a79.jpg','<p>555555</p>',NULL,NULL,NULL,NULL,'2016-01-27 16:26:39',NULL,1),('7ca2af37-71a4-49b9-99d4-4f4635974bf4','','33','\\upload\\20160127\\d6d5b89011fb47548d3ffc53bc80e6c4.jpg','<p>3333333333333</p>',NULL,NULL,NULL,NULL,'2016-01-27 16:26:18','2016-01-27 16:27:12',0),('86918e01-0eb1-4ce4-a596-625344548f7a','1','22','\\upload\\20160127\\25b86a40ee4243eaba84a82cb27f3784.jpg','<p>222</p>',NULL,NULL,NULL,NULL,'2016-01-27 16:04:12','2016-01-27 16:27:04',0),('8a8a80c0-ffc6-4695-8458-3fb5d8953679','819ac90a-42a9-4087-ac4b-6698eebe11dd','明天周末哇哇','\\upload\\20160129\\ac07c16be6984e5584884d3558d926a7.png','<p>明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇</p>',NULL,NULL,NULL,NULL,'2016-01-29 15:12:57',NULL,1),('8b562f91-9a4f-40ff-a056-447cbe6c7d4f','2','333','\\upload\\20160129\\4f0eca5654cc4c2184385e21351deaad.jpg','<p>3333</p>',NULL,NULL,NULL,NULL,'2016-01-29 15:07:57',NULL,NULL),('90576ec3-0374-4b59-9b74-4e7b9adeaee6','4a75255f-0400-4ed2-be7c-6585b09e853f','88','\\upload\\20160127\\c14b4cee8d664f62855ce2f891ec8a5b.jpg','<p>888</p>',NULL,NULL,NULL,NULL,'2016-01-27 16:46:16','2016-01-27 16:54:52',1),('9dc61d02-139e-4ed7-ac35-5f33039b7a5c','','22','\\upload\\20160127\\fb5f8a0b66f94eeea9360c3df4a15cb7.jpg','<p>22222222222222222</p>',NULL,NULL,NULL,NULL,'2016-01-27 16:26:08','2016-01-27 16:27:12',0),('a64da755-3bd9-4bd3-8231-9f4685e180fb','d466dc45-ca3a-4ee7-856f-bea6af533cf4','按时','\\upload\\20160129\\2df78334db434ecfb758a9595956c5cb.jpg','<p>按时</p>',NULL,NULL,NULL,NULL,'2016-01-28 18:28:23','2016-01-29 15:14:25',1),('a9c8ff91-b194-415e-a91b-ec331f8f10e4','2','333','\\upload\\20160129\\d76d27411a314c0890f81066d7c9030e.jpg','<p>3333</p>',NULL,NULL,NULL,NULL,'2016-01-29 15:07:57',NULL,NULL),('adc7ff40-3393-4590-a2f4-610e3de11814','819ac90a-42a9-4087-ac4b-6698eebe11dd','明天周末哇哇','\\upload\\20160129\\dda38315fe6a4bd0bcbdf2c2831361e3.jpg','<p>明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇明天周末哇哇</p>',NULL,NULL,NULL,NULL,'2016-01-29 15:12:57',NULL,1),('bd0f4737-5752-4c4d-91eb-4f77592124c8','819ac90a-42a9-4087-ac4b-6698eebe11dd','周五!','\\upload\\20160129\\8193782f474f45a58f077d52e994ca3a.jpg','<p>周五!周五!周五!周五!周五!周五!周五!周五!周五!</p>',NULL,NULL,NULL,NULL,'2016-01-29 15:10:25',NULL,NULL),('be6fb8c0-2b9a-4f50-8c07-c0f3f132bf32','819ac90a-42a9-4087-ac4b-6698eebe11dd','周五!','\\upload\\20160129\\bb84c06104ca47daa872fa93bb05d7da.jpg','<p>周五!周五!周五!周五!周五!周五!周五!周五!周五!</p>',NULL,NULL,NULL,NULL,'2016-01-29 15:10:25',NULL,NULL),('d8e5b2aa-ff2e-4a04-9838-b7607b13da83','0a80313f-6f94-483a-a758-177138aa21d6','7','\\upload\\20160129\\e899f68db9b140bab4176a0aaab91474.jpg','<p>77</p>',NULL,NULL,NULL,NULL,'2016-01-29 15:05:38',NULL,NULL),('e9a7aa5f-0cd7-41d7-ab5c-4c5833adb896','','11','','<p>111111111111</p>',NULL,NULL,NULL,NULL,'2016-01-27 16:25:56','2016-01-27 16:27:03',0);

/*Table structure for table `sst_team_player` */

DROP TABLE IF EXISTS `sst_team_player`;

CREATE TABLE `sst_team_player` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `team_id` varchar(36) DEFAULT NULL COMMENT '球队id',
  `team_name` varchar(36) DEFAULT NULL COMMENT '球队名称',
  `team_icon` varchar(36) DEFAULT NULL COMMENT '球队标识',
  `name` varchar(20) DEFAULT NULL COMMENT '名字',
  `summary` text COMMENT '描述',
  `num` int(2) DEFAULT NULL COMMENT '球号',
  `position` int(2) DEFAULT NULL COMMENT '位置',
  `pic` varchar(200) DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='球队队员';

/*Data for the table `sst_team_player` */

insert  into `sst_team_player`(`id`,`team_id`,`team_name`,`team_icon`,`name`,`summary`,`num`,`position`,`pic`,`create_time`,`last_update_time`,`stat`) values ('1','0a80313f-6f94-483a-a758-177138aa21d6','恒大','\\upload\\20160123\\9a564926fa6c47d798d','张三','<p>个人实力超群</p>',9,1,'\\upload\\20160128\\7ec635eacc6f45589137d57c4d58734a.jpg','2016-01-27 16:11:43','2016-01-28 15:49:43',1),('2','0a80313f-6f94-483a-a758-177138aa21d6','恒大','\\upload\\20160123\\9a564926fa6c47d798d','李四','<p>个人实力超群</p>',12,2,'\\upload\\20160128\\2b4c1c60c80d44e286280a8800bf579f.jpg','2016-01-27 16:11:43','2016-01-28 16:13:34',1),('3','0a80313f-6f94-483a-a758-177138aa21d6','恒大','\\upload\\20160123\\9a564926fa6c47d798d','王五','<p>个人实力超群</p>',25,3,'\\upload\\20160128\\2eb7c4663f1647caa71d3f3473844eab.jpg','2016-01-27 16:11:43','2016-01-28 15:49:52',1),('5b9e3fbf-c2aa-4b42-8525-33d81e734215','819ac90a-42a9-4087-ac4b-6698eebe11dd','恒大',NULL,'7','<p>77</p>',777,7,'\\upload\\20160128\\9a8d2f2fc87a4f32b3133768784e2b58.jpg','2016-01-28 16:42:29','2016-01-28 16:57:34',1),('73b3c2c4-a1c1-402e-a479-aacdc88beb56','0a80313f-6f94-483a-a758-177138aa21d6','77',NULL,'2','<p>22</p>',222,2,'\\upload\\20160128\\396f007a975e479c91a39b3356091ea1.jpg','2016-01-28 14:51:25','2016-01-28 16:48:49',1),('ba65b0c6-1c9a-4129-91d2-d7af6951d32f','d466dc45-ca3a-4ee7-856f-bea6af533cf4','66',NULL,'1','<p>阿萨德</p>',111,1,'\\upload\\20160128\\6718de7dcef84c06a0361400bb846419.jpg','2016-01-28 14:47:57','2016-01-28 16:49:01',1),('c5d8bd61-8cf8-48dd-bb84-c0f9d8723c2f','828765ae-f509-4a85-bd3b-4dc4c1f7ce46','22',NULL,'3','<p>33</p>',333,0,'\\upload\\20160128\\ac48b941b3544ef1985873898996714d.jpg','2016-01-28 14:53:25','2016-01-28 16:48:20',1),('d52e54c8-db4a-4119-bed2-eed1c752c2d8','819ac90a-42a9-4087-ac4b-6698eebe11dd','恒大',NULL,'9','<p>99</p>',99,9,'\\upload\\20160128\\a93876f9e6ad4ef4be909a9808dbd7bc.jpg','2016-01-28 16:45:24',NULL,1),('fbcf42d2-b47e-46db-be40-59f786c246bd','2','二号球队',NULL,'3','<p>33</p>',333,7,'\\upload\\20160128\\e065ce0efde545d28ea7d9b950e7c936.jpg','2016-01-28 14:59:13','2016-01-28 16:48:09',1);

/*Table structure for table `sst_team_player_datas` */

DROP TABLE IF EXISTS `sst_team_player_datas`;

CREATE TABLE `sst_team_player_datas` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `comp_id` varchar(36) DEFAULT NULL COMMENT '赛事id',
  `comp_name` varchar(20) DEFAULT NULL COMMENT '赛事名称',
  `team_id` varchar(36) DEFAULT NULL COMMENT '球队id',
  `team_name` varchar(20) DEFAULT NULL COMMENT '球队名称',
  `team_icon` varchar(200) DEFAULT NULL COMMENT '球队标识',
  `player_id` varchar(36) DEFAULT NULL COMMENT '球员id',
  `player_name` varchar(20) DEFAULT NULL COMMENT '球员名称',
  `num` int(2) NOT NULL DEFAULT '0' COMMENT '进球数',
  `yellow` int(1) NOT NULL DEFAULT '0' COMMENT '黄牌',
  `red` int(1) DEFAULT '0' COMMENT '红牌',
  `create_admin_id` varchar(36) DEFAULT NULL COMMENT '创建者id',
  `create_admin_name` varchar(20) DEFAULT NULL COMMENT '创建者姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赛事球员数据表';

/*Data for the table `sst_team_player_datas` */

insert  into `sst_team_player_datas`(`id`,`comp_id`,`comp_name`,`team_id`,`team_name`,`team_icon`,`player_id`,`player_name`,`num`,`yellow`,`red`,`create_admin_id`,`create_admin_name`,`create_time`,`last_update_time`,`stat`) values ('a58e99b6-7b5a-4ebe-94e6-0c5a71795b16','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','819ac90a-42a9-4087-ac4b-6698eebe11dd','恒大','\\upload\\20160123\\9a564926fa6c47d798da84ee3c108f9d.jpg','1','张三',5,0,0,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-27 16:41:33',NULL,1),('dce90c97-30ab-4cbc-8861-ff8ee23eda8f','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','819ac90a-42a9-4087-ac4b-6698eebe11dd','恒大','\\upload\\20160123\\9a564926fa6c47d798da84ee3c108f9d.jpg','3','王五',3,1,1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-27 16:42:13',NULL,1),('fcb19691-80ec-461c-ab99-b5e8e1e3e0c6','05ab432c-67ec-42bb-8ef7-1bac55f28976','凯瑟琳','819ac90a-42a9-4087-ac4b-6698eebe11dd','恒大','\\upload\\20160123\\9a564926fa6c47d798da84ee3c108f9d.jpg','2','李四',3,2,1,'57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-27 16:41:59',NULL,1);

/*Table structure for table `sst_team_result` */

DROP TABLE IF EXISTS `sst_team_result`;

CREATE TABLE `sst_team_result` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `team_id` varchar(36) DEFAULT NULL COMMENT '球队id',
  `team_name` varchar(36) DEFAULT NULL COMMENT '球队名称',
  `year` varchar(4) DEFAULT NULL COMMENT '年份',
  `game_name` varchar(50) DEFAULT NULL COMMENT '比赛名称',
  `result` varchar(50) DEFAULT NULL COMMENT '成绩',
  `create_user_id` varchar(36) DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(20) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_id` varchar(36) DEFAULT NULL COMMENT '更新人id',
  `update_user_name` varchar(20) DEFAULT NULL COMMENT '更新人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='球队主要成绩';

/*Data for the table `sst_team_result` */

insert  into `sst_team_result`(`id`,`team_id`,`team_name`,`year`,`game_name`,`result`,`create_user_id`,`create_user_name`,`update_user_id`,`update_user_name`,`create_time`,`last_update_time`,`stat`) values ('1','819ac90a-42a9-4087-ac4b-6698eebe11dd','恒大','2015','亚洲风靡旋风比赛','第三名',NULL,NULL,NULL,NULL,'2016-01-27 11:11:24','2016-01-27 14:05:58',1),('9cfc9464-6f9d-4eb9-9745-cec0a030f487','1','一号球队','2015','关中大赛','总冠军(报名球队only one)','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','57390b0c-b06a-4e30-b8e9-1f42c5adf979','admin','2016-01-27 13:46:21','2016-01-27 14:05:51',1);

/*Table structure for table `sst_user` */

DROP TABLE IF EXISTS `sst_user`;

CREATE TABLE `sst_user` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `nick_name` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `head_img` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `team_id` varchar(36) DEFAULT NULL COMMENT '球队id',
  `sex` int(1) DEFAULT NULL COMMENT '性别(0-男,1-女)',
  `address` varchar(200) DEFAULT NULL COMMENT '地区',
  `birthday` varchar(10) DEFAULT NULL COMMENT '生日',
  `pwd` varchar(32) DEFAULT NULL COMMENT '密码',
  `user_account` varchar(20) DEFAULT NULL COMMENT '聊天账号',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `type` int(1) DEFAULT '0' COMMENT '用户类型(0-普通用户,1-球员,2-队长,3-教练)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sst_user` */

insert  into `sst_user`(`id`,`nick_name`,`head_img`,`team_id`,`sex`,`address`,`birthday`,`pwd`,`user_account`,`mobile`,`type`,`create_time`,`last_update_time`,`stat`) values ('0409b62b-564a-4217-8b75-d9b9389d644e','隔壁老王家','\\upload\\20160122\\cbadd264370f46b9a0dce9645f4d403e.jpg','2',1,'中国','1990-01-01','e10adc3949ba59abbe56e057f20f883e','sst_001','18721472365',NULL,'2016-01-13 09:41:59','2016-01-22 09:25:16',1),('48a8acf7-67d0-44a9-806e-3b00c2b1337a','二哥','\\upload\\20160113\\91056db9acb042dd849ac72ac50949eb.jpg',NULL,0,'大华','1990-08-15','e10adc3949ba59abbe56e057f20f883e',NULL,'18721472367',NULL,'2016-01-13 09:32:52','2016-01-13 13:26:56',0),('48a8acf7-67d0-44a9-806e-3b00c2b1337b','小盆','\\upload\\20160113\\91056db9acb042dd849ac72ac50949eb.jpg','1',0,'大华','1990-08-15','e10adc3949ba59abbe56e057f20f883e',NULL,'18721472363',NULL,'2016-01-13 09:32:52','2016-01-18 16:44:20',1),('48a8acf7-67d0-44a9-806e-3b00c2b1337c','大哥','\\upload\\20160113\\91056db9acb042dd849ac72ac50949eb.jpg',NULL,0,'大华','1990-08-15','e10adc3949ba59abbe56e057f20f883e',NULL,'18721472364',NULL,'2016-01-13 09:32:52','2016-01-13 13:26:56',1),('48a8acf7-67d0-44a9-806e-3b00c2b1337e','美丽','\\upload\\20160113\\91056db9acb042dd849ac72ac50949eb.jpg',NULL,0,'大华','1990-08-15','e10adc3949ba59abbe56e057f20f883e',NULL,'18721472366',NULL,'2016-01-13 09:32:52','2016-01-13 13:26:56',1),('48a8acf7-67d0-44a9-806e-3b00c2b1337f','冬瓜','\\upload\\20160113\\91056db9acb042dd849ac72ac50949eb.jpg',NULL,0,'大华','1990-08-15','e10adc3949ba59abbe56e057f20f883e',NULL,'18721472368',NULL,'2016-01-13 09:32:52','2016-01-13 13:26:56',1),('48a8acf7-67d0-44a9-806e-3b00c2b1337g','遇见','\\upload\\20160113\\91056db9acb042dd849ac72ac50949eb.jpg',NULL,0,'大华','1990-08-15','e10adc3949ba59abbe56e057f20f883e',NULL,'18721472369',NULL,'2016-01-13 09:32:52','2016-01-13 13:26:56',1),('48a8acf7-67d0-44a9-806e-3b00c2b1337h','大傻','\\upload\\20160113\\91056db9acb042dd849ac72ac50949eb.jpg',NULL,0,'大华','1990-08-15','e10adc3949ba59abbe56e057f20f883e',NULL,'18721472360',NULL,'2016-01-13 09:32:52','2016-01-13 13:26:56',0);

/*Table structure for table `sst_user_apply_team` */

DROP TABLE IF EXISTS `sst_user_apply_team`;

CREATE TABLE `sst_user_apply_team` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `team_id` varchar(36) DEFAULT NULL COMMENT '球队id',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户id',
  `status` int(1) DEFAULT NULL COMMENT '申请状态',
  `reason` varchar(200) DEFAULT NULL COMMENT '申请理由',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户申请球队记录表';

/*Data for the table `sst_user_apply_team` */

/*Table structure for table `sst_user_friend` */

DROP TABLE IF EXISTS `sst_user_friend`;

CREATE TABLE `sst_user_friend` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户id',
  `friend_id` varchar(36) DEFAULT NULL COMMENT '朋友id',
  `care` int(1) DEFAULT NULL COMMENT '特别关心',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_create_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户好友表';

/*Data for the table `sst_user_friend` */

insert  into `sst_user_friend`(`id`,`user_id`,`friend_id`,`care`,`create_time`,`last_create_time`,`stat`) values ('1','0409b62b-564a-4217-8b75-d9b9389d644e','48a8acf7-67d0-44a9-806e-3b00c2b1337a',NULL,'2016-01-13 14:04:37',NULL,1),('2','0409b62b-564a-4217-8b75-d9b9389d644e','48a8acf7-67d0-44a9-806e-3b00c2b1337b',NULL,'2016-01-13 14:04:37',NULL,1),('3','0409b62b-564a-4217-8b75-d9b9389d644e','48a8acf7-67d0-44a9-806e-3b00c2b1337c',NULL,'2016-01-13 14:04:37',NULL,1),('4','0409b62b-564a-4217-8b75-d9b9389d644e','48a8acf7-67d0-44a9-806e-3b00c2b1337e',NULL,'2016-01-13 14:04:37',NULL,1),('5','0409b62b-564a-4217-8b75-d9b9389d644e','48a8acf7-67d0-44a9-806e-3b00c2b1337f',NULL,'2016-01-13 14:04:37',NULL,1),('6','0409b62b-564a-4217-8b75-d9b9389d644e','48a8acf7-67d0-44a9-806e-3b00c2b1337g',NULL,'2016-01-13 14:04:37',NULL,1),('7','0409b62b-564a-4217-8b75-d9b9389d644e','48a8acf7-67d0-44a9-806e-3b00c2b1337h',NULL,'2016-01-13 14:04:37',NULL,1);

/*Table structure for table `sst_vote` */

DROP TABLE IF EXISTS `sst_vote`;

CREATE TABLE `sst_vote` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `title` varchar(32) DEFAULT NULL COMMENT '投票主题',
  `group_id` varchar(36) DEFAULT NULL COMMENT '群组id',
  `option_num` int(1) DEFAULT NULL COMMENT '允许投票项数',
  `end_time` datetime DEFAULT NULL COMMENT '截止时间',
  `is_anonymous` int(1) DEFAULT NULL COMMENT '是否匿名',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名称',
  `amount` int(3) NOT NULL DEFAULT '0' COMMENT '总投票次数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `stat` int(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票';

/*Data for the table `sst_vote` */

insert  into `sst_vote`(`id`,`title`,`group_id`,`option_num`,`end_time`,`is_anonymous`,`user_id`,`user_name`,`amount`,`create_time`,`last_update_time`,`stat`) values ('1','谁是大帅哥','1',1,'2016-01-15 09:15:18',1,'0409b62b-564a-4217-8b75-d9b9389d644e','隔壁老王家',0,'2016-01-14 09:16:15','2016-01-15 10:56:44',1);

/*Table structure for table `sst_vote_option` */

DROP TABLE IF EXISTS `sst_vote_option`;

CREATE TABLE `sst_vote_option` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `vote_id` varchar(36) DEFAULT NULL COMMENT '投票id',
  `text` varchar(50) DEFAULT NULL COMMENT '选项描述',
  `num` int(3) NOT NULL DEFAULT '0' COMMENT '投票次数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) unsigned zerofill NOT NULL DEFAULT '1' COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票选项表';

/*Data for the table `sst_vote_option` */

insert  into `sst_vote_option`(`id`,`vote_id`,`text`,`num`,`create_time`,`last_update_time`,`stat`) values ('1','1','胡歌',1,'2016-01-14 09:33:34',NULL,1),('2','1','霍建华',1,'2016-01-14 09:33:34',NULL,1),('3','1','李易峰',0,'2016-01-14 09:33:34',NULL,1),('4','1','吴亦凡',0,'2016-01-14 09:33:34',NULL,1);

/*Table structure for table `sst_vote_user_option` */

DROP TABLE IF EXISTS `sst_vote_user_option`;

CREATE TABLE `sst_vote_user_option` (
  `id` varchar(36) NOT NULL COMMENT '主键id',
  `vote_id` varchar(36) DEFAULT NULL COMMENT '投票id',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户id',
  `option_id` varchar(36) DEFAULT NULL COMMENT '选项id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stat` int(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票用户结果表';

/*Data for the table `sst_vote_user_option` */

insert  into `sst_vote_user_option`(`id`,`vote_id`,`user_id`,`option_id`,`create_time`,`last_update_time`,`stat`) values ('1','1','0409b62b-564a-4217-8b75-d9b9389d644e','1','2016-01-14 09:35:10',NULL,1),('2','1','48a8acf7-67d0-44a9-806e-3b00c2b1337a','2','2016-01-14 09:35:10',NULL,1),('3','1','48a8acf7-67d0-44a9-806e-3b00c2b1337b','2','2016-01-14 09:35:10',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
