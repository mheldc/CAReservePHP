/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.17 : Database - careserve
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`careserve` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `careserve`;

/*Table structure for table `ca_booking` */

DROP TABLE IF EXISTS `ca_booking`;

CREATE TABLE `ca_booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bksrctypeid` int(11) NOT NULL DEFAULT '0',
  `rsvid` bigint(20) NOT NULL DEFAULT '0',
  `guestid` bigint(20) NOT NULL DEFAULT '0',
  `rmtypeid` bigint(20) NOT NULL DEFAULT '0',
  `roomid` bigint(20) NOT NULL DEFAULT '0',
  `rmrate` double(10,2) NOT NULL DEFAULT '0.00',
  `guesta` int(11) NOT NULL DEFAULT '0',
  `guestc` int(11) NOT NULL DEFAULT '0',
  `guestc2` int(11) NOT NULL DEFAULT '0',
  `isovernight` bit(1) NOT NULL DEFAULT b'0',
  `bkstat` bit(1) NOT NULL DEFAULT b'1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`rsvid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking` */

insert  into `ca_booking`(`id`,`bksrctypeid`,`rsvid`,`guestid`,`rmtypeid`,`roomid`,`rmrate`,`guesta`,`guestc`,`guestc2`,`isovernight`,`bkstat`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,0,0,6,9,65,0.00,4,2,0,'','\0',0,'2017-02-22 17:18:12',0,'2017-02-24 12:46:47'),(2,0,0,7,1,1,0.00,3,0,0,'','\0',0,'2017-02-22 20:08:23',0,'2017-02-24 12:46:57'),(3,0,0,8,1,2,0.00,3,2,0,'','\0',0,'2017-02-22 20:17:13',0,'2017-02-24 12:47:06'),(4,0,0,9,6,1000,1000.00,4,0,0,'','',0,'2017-02-22 20:24:14',0,'2017-02-23 21:12:52'),(5,0,0,2,6,1000,1000.00,7,0,0,'\0','',0,'2017-02-22 21:10:21',0,'2017-02-23 14:45:35'),(6,0,0,2,6,52,1000.00,3,2,1,'\0','',0,'2017-02-22 21:25:04',0,'2017-02-23 14:46:30'),(7,0,0,2,1,4,500.00,1,2,3,'\0','',0,'2017-02-22 21:32:55',0,'2017-02-23 14:46:47'),(8,0,0,2,1,7,0.00,3,2,1,'\0','',0,'2017-02-22 21:33:26',0,'2017-02-23 14:48:22'),(9,0,0,4,1,6,0.00,1,2,5,'\0','',0,'2017-02-22 21:42:20',0,'2017-02-22 22:55:50'),(10,0,0,1,3,16,1000.00,4,1,2,'\0','',0,'2017-02-22 21:46:44',0,'2017-02-22 22:57:45'),(11,0,0,3,6,55,2000.00,3,2,1,'\0','',0,'2017-02-26 22:20:27',0,'2017-02-26 22:20:27'),(12,0,0,10,6,51,2000.00,2,1,0,'','',0,'2017-02-26 22:52:16',0,'2017-02-26 22:52:16'),(13,0,0,11,6,54,2000.00,3,1,0,'','',0,'2017-02-27 00:00:06',0,'2017-02-27 00:00:06');

/*Table structure for table `ca_booking_guest` */

DROP TABLE IF EXISTS `ca_booking_guest`;

CREATE TABLE `ca_booking_guest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bkid` bigint(20) NOT NULL DEFAULT '0',
  `bcid` bigint(20) NOT NULL DEFAULT '0',
  `gname` varchar(50) DEFAULT NULL,
  `gclass` int(11) NOT NULL DEFAULT '1',
  `timein` time DEFAULT NULL,
  `expdate` datetime DEFAULT NULL,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`bkid`,`bcid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking_guest` */

/*Table structure for table `ca_booking_items` */

DROP TABLE IF EXISTS `ca_booking_items`;

CREATE TABLE `ca_booking_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bkid` bigint(20) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `itemdesc` varchar(150) NOT NULL DEFAULT 'Item-0',
  `itemqty` int(11) NOT NULL DEFAULT '1',
  `itemamt` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ispaid` bit(1) NOT NULL DEFAULT b'0',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking_items` */

insert  into `ca_booking_items`(`id`,`bkid`,`itemtype`,`itemdesc`,`itemqty`,`itemamt`,`ispaid`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,1,1,'VI-04:Villa 04',1,'3500.00','',0,'2017-02-22 17:18:12',0,'2017-02-24 12:41:12'),(2,1,2,'Entrance Fee (Adult) x 4',4,'600.00','',0,'2017-02-22 17:18:12',0,'2017-02-24 12:41:12'),(3,1,2,'Entrance Fee (Child) x 2',2,'200.00','',0,'2017-02-22 17:18:12',0,'2017-02-24 12:41:12'),(4,1,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','',0,'2017-02-22 17:18:12',0,'2017-02-24 12:41:12'),(5,2,1,'UM-01:Umbrella 1',1,'500.00','',0,'2017-02-22 20:08:23',0,'2017-02-24 12:42:26'),(6,2,2,'Entrance Fee (Adult) x 3',3,'600.00','',0,'2017-02-22 20:08:23',0,'2017-02-24 12:42:26'),(7,3,1,'UM-02:Umbrella 2',1,'500.00','',0,'2017-02-22 20:17:13',0,'2017-02-24 12:43:15'),(8,3,2,'Entrance Fee (Adult) x 3',3,'600.00','',0,'2017-02-22 20:17:13',0,'2017-02-24 12:43:15'),(9,3,2,'Entrance Fee (Child) x 2',2,'200.00','',0,'2017-02-22 20:17:13',0,'2017-02-24 12:43:15'),(10,4,1,'UM-03:Umbrella 3',1,'500.00','',0,'2017-02-22 20:24:14',0,'2017-02-24 12:43:51'),(11,4,2,'Entrance Fee (Adult) x 4',4,'800.00','',0,'2017-02-22 20:24:14',0,'2017-02-24 12:43:51'),(12,5,1,'UM-04:Umbrella 4',1,'500.00','',0,'2017-02-22 21:10:21',0,'2017-02-25 11:01:28'),(13,5,2,'Entrance Fee (Adult) x 7',7,'1400.00','',0,'2017-02-22 21:10:21',0,'2017-02-25 11:01:28'),(14,5,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','',0,'2017-02-22 21:10:21',0,'2017-02-25 11:01:28'),(15,0,1,'UM-05:Umbrella 5',1,'500.00','\0',0,'2017-02-22 21:17:32',0,'2017-02-22 21:17:32'),(16,0,2,'Entrance Fee (Adult) x 7',7,'1400.00','\0',0,'2017-02-22 21:17:32',0,'2017-02-22 21:17:32'),(17,0,2,'Entrance Fee (Child) x 3',3,'300.00','\0',0,'2017-02-22 21:17:32',0,'2017-02-22 21:17:32'),(18,0,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','\0',0,'2017-02-22 21:17:32',0,'2017-02-22 21:17:32'),(19,0,1,'UM-05:Umbrella 5',1,'500.00','\0',0,'2017-02-22 21:19:32',0,'2017-02-22 21:19:32'),(20,0,2,'Entrance Fee (Adult) x 7',7,'1400.00','\0',0,'2017-02-22 21:19:32',0,'2017-02-22 21:19:32'),(21,0,2,'Entrance Fee (Child) x 2',2,'200.00','\0',0,'2017-02-22 21:19:32',0,'2017-02-22 21:19:32'),(22,0,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','\0',0,'2017-02-22 21:19:32',0,'2017-02-22 21:19:32'),(23,0,1,'UM-05:Umbrella 5',1,'500.00','\0',0,'2017-02-22 21:21:28',0,'2017-02-22 21:21:28'),(24,0,2,'Entrance Fee (Adult) x 7',7,'1400.00','\0',0,'2017-02-22 21:21:28',0,'2017-02-22 21:21:28'),(25,0,2,'Entrance Fee (Child) x 2',2,'200.00','\0',0,'2017-02-22 21:21:28',0,'2017-02-22 21:21:28'),(26,0,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','\0',0,'2017-02-22 21:21:28',0,'2017-02-22 21:21:28'),(27,6,1,'UM-05:Umbrella 5',1,'500.00','',0,'2017-02-22 21:25:04',0,'2017-02-25 11:09:18'),(28,6,2,'Entrance Fee (Adult) x 3',3,'600.00','',0,'2017-02-22 21:25:04',0,'2017-02-25 11:09:18'),(29,6,2,'Entrance Fee (Child) x 2',2,'200.00','',0,'2017-02-22 21:25:04',0,'2017-02-25 11:09:18'),(30,6,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','',0,'2017-02-22 21:25:04',0,'2017-02-25 11:09:18'),(31,7,1,'UM-06:Umbrella 6',1,'500.00','\0',0,'2017-02-22 21:32:55',0,'2017-02-22 21:32:55'),(32,7,2,'Entrance Fee (Adult) x 1',1,'200.00','\0',0,'2017-02-22 21:32:56',0,'2017-02-22 21:32:56'),(33,7,2,'Entrance Fee (Child) x 2',2,'200.00','\0',0,'2017-02-22 21:32:56',0,'2017-02-22 21:32:56'),(34,7,2,'Entrance Fee (Child below 2 y/o) x 3',3,'0.00','\0',0,'2017-02-22 21:32:56',0,'2017-02-22 21:32:56'),(35,8,1,'UM-07:Umbrella 7',1,'500.00','\0',0,'2017-02-22 21:33:26',0,'2017-02-22 21:33:26'),(36,8,2,'Entrance Fee (Adult) x 3',3,'600.00','\0',0,'2017-02-22 21:33:26',0,'2017-02-22 21:33:26'),(37,8,2,'Entrance Fee (Child) x 2',2,'200.00','\0',0,'2017-02-22 21:33:26',0,'2017-02-22 21:33:26'),(38,8,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','\0',0,'2017-02-22 21:33:26',0,'2017-02-22 21:33:26'),(39,9,1,'UM-06:Umbrella 6',1,'500.00','\0',0,'2017-02-22 21:42:20',0,'2017-02-22 21:42:20'),(40,9,2,'Entrance Fee (Adult) x 1',1,'200.00','\0',0,'2017-02-22 21:42:20',0,'2017-02-22 21:42:20'),(41,9,2,'Entrance Fee (Child) x 2',2,'200.00','\0',0,'2017-02-22 21:42:20',0,'2017-02-22 21:42:20'),(42,9,2,'Entrance Fee (Child below 2 y/o) x 5',5,'0.00','\0',0,'2017-02-22 21:42:20',0,'2017-02-22 21:42:20'),(43,10,1,'UM-06:Umbrella 6',1,'500.00','\0',0,'2017-02-22 21:46:44',0,'2017-02-22 21:46:44'),(44,10,2,'Entrance Fee (Adult) x 4',4,'800.00','\0',0,'2017-02-22 21:46:45',0,'2017-02-22 21:46:45'),(45,10,2,'Entrance Fee (Child) x 1',1,'100.00','\0',0,'2017-02-22 21:46:45',0,'2017-02-22 21:46:45'),(46,10,2,'Entrance Fee (Child below 2 y/o) x 2',2,'0.00','\0',0,'2017-02-22 21:46:45',0,'2017-02-22 21:46:45'),(47,4,2,'Additional Guest (Adult) x 1',1,'150.00','\0',0,'2017-02-25 10:40:47',0,'2017-02-25 10:40:47'),(48,4,2,'Additional Guest (Child) x 2',2,'200.00','\0',0,'2017-02-25 10:40:47',0,'2017-02-25 10:40:47'),(49,4,2,'Additional Guest (Child 2 y/o below) x 3',3,'0.00','\0',0,'2017-02-25 10:40:47',0,'2017-02-25 10:40:47'),(50,4,4,'4',4,'4.00','\0',0,'2017-02-25 10:46:45',0,'2017-02-25 10:46:45'),(51,2,2,'2',2,'2.00','\0',0,'2017-02-25 10:46:45',0,'2017-02-25 10:46:45'),(52,0,0,'A',0,'0.00','\0',0,'2017-02-25 10:46:45',0,'2017-02-25 10:46:45'),(53,2,2,'2',2,'2.00','\0',0,'2017-02-25 10:46:45',0,'2017-02-25 10:46:45'),(54,3,3,'3',3,'3.00','\0',0,'2017-02-25 10:46:45',0,'2017-02-25 10:46:45'),(55,4,2,'Additional Guest (Adult) x 2',2,'300.00','\0',0,'2017-02-25 10:49:35',0,'2017-02-25 10:49:35'),(56,4,2,'Additional Guest (Child) x 2',2,'200.00','\0',0,'2017-02-25 10:49:35',0,'2017-02-25 10:49:35'),(57,4,2,'Additional Guest (Adult) x 5',5,'750.00','\0',0,'2017-02-25 10:52:27',0,'2017-02-25 10:52:27'),(58,4,2,'Additional Guest (Child) x 6',6,'600.00','\0',0,'2017-02-25 10:52:27',0,'2017-02-25 10:52:27'),(59,4,2,'Additional Guest (Child 2 y/o below) x 7',7,'0.00','\0',0,'2017-02-25 10:52:27',0,'2017-02-25 10:52:27'),(60,4,2,'Additional Guest (Adult) x 7',7,'1.00','\0',0,'2017-02-25 10:54:17',0,'2017-02-25 10:54:17'),(61,4,2,'Additional Guest (Child) x 8',8,'800.00','\0',0,'2017-02-25 10:54:17',0,'2017-02-25 10:54:17'),(62,4,2,'Additional Guest (Child 2 y/o below) x 9',9,'0.00','\0',0,'2017-02-25 10:54:17',0,'2017-02-25 10:54:17'),(63,5,2,'Additional Guest (Adult) x 2',2,'300.00','',0,'2017-02-25 11:00:35',0,'2017-02-25 11:01:28'),(64,5,2,'Additional Guest (Child) x 3',3,'300.00','',0,'2017-02-25 11:00:36',0,'2017-02-25 11:01:28'),(65,5,2,'Additional Guest (Child 2 y/o below) x 1',1,'0.00','',0,'2017-02-25 11:00:36',0,'2017-02-25 11:01:28'),(66,0,1,'SR-04:Standard Room 04',1,'2000.00','\0',0,'2017-02-26 21:44:37',0,'2017-02-26 21:44:37'),(67,0,2,'Entrance Fee (Adult) x 4',4,'800.00','\0',0,'2017-02-26 21:44:38',0,'2017-02-26 21:44:38'),(68,0,2,'Entrance Fee (Child) x 2',2,'200.00','\0',0,'2017-02-26 21:44:38',0,'2017-02-26 21:44:38'),(69,0,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','\0',0,'2017-02-26 21:44:38',0,'2017-02-26 21:44:38'),(70,0,1,'SR-04:Standard Room 04',1,'2000.00','\0',0,'2017-02-26 21:48:27',0,'2017-02-26 21:48:27'),(71,0,2,'Entrance Fee (Adult) x 3',3,'600.00','\0',0,'2017-02-26 21:48:27',0,'2017-02-26 21:48:27'),(72,0,2,'Entrance Fee (Child) x 2',2,'200.00','\0',0,'2017-02-26 21:48:27',0,'2017-02-26 21:48:27'),(73,0,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','\0',0,'2017-02-26 21:48:27',0,'2017-02-26 21:48:27'),(74,0,1,'SR-05:Standard Room 05',1,'2000.00','\0',0,'2017-02-26 22:12:52',0,'2017-02-26 22:12:52'),(75,0,2,'Entrance Fee (Adult) x 4',4,'800.00','\0',0,'2017-02-26 22:12:52',0,'2017-02-26 22:12:52'),(76,0,2,'Entrance Fee (Child) x 2',2,'200.00','\0',0,'2017-02-26 22:12:52',0,'2017-02-26 22:12:52'),(77,0,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','\0',0,'2017-02-26 22:12:52',0,'2017-02-26 22:12:52'),(78,11,1,'SR-05:Standard Room 05',1,'2000.00','\0',0,'2017-02-26 22:20:27',0,'2017-02-26 22:20:27'),(79,11,2,'Entrance Fee (Adult) x 3',3,'600.00','\0',0,'2017-02-26 22:20:27',0,'2017-02-26 22:20:27'),(80,11,2,'Entrance Fee (Child) x 2',2,'200.00','\0',0,'2017-02-26 22:20:27',0,'2017-02-26 22:20:27'),(81,11,2,'Entrance Fee (Child below 2 y/o) x 1',1,'0.00','\0',0,'2017-02-26 22:20:27',0,'2017-02-26 22:20:27'),(82,12,1,'SR-01:Standard Room 01',1,'2000.00','\0',0,'2017-02-26 22:52:17',0,'2017-02-26 22:52:17'),(83,12,2,'Entrance Fee (Adult) x 2',2,'400.00','\0',0,'2017-02-26 22:52:17',0,'2017-02-26 22:52:17'),(84,12,2,'Entrance Fee (Child) x 1',1,'100.00','\0',0,'2017-02-26 22:52:17',0,'2017-02-26 22:52:17'),(85,13,1,'SR-04:Standard Room 04',1,'2000.00','\0',0,'2017-02-27 00:00:06',0,'2017-02-27 00:00:06'),(86,13,2,'Entrance Fee (Adult) x 3',3,'600.00','\0',0,'2017-02-27 00:00:06',0,'2017-02-27 00:00:06'),(87,13,2,'Entrance Fee (Child) x 1',1,'100.00','\0',0,'2017-02-27 00:00:06',0,'2017-02-27 00:00:06'),(88,10,1,'UM-01:Umbrella 1',1,'500.00','\0',0,'2017-02-28 20:07:31',0,'2017-02-28 20:07:31'),(89,10,1,'GA-03:Gazebo 3',1,'1000.00','\0',0,'2017-03-02 17:30:43',0,'2017-03-02 17:30:43');

/*Table structure for table `ca_booking_transfers` */

DROP TABLE IF EXISTS `ca_booking_transfers`;

CREATE TABLE `ca_booking_transfers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bid` bigint(20) NOT NULL DEFAULT '0',
  `frmtypeid` bigint(20) NOT NULL DEFAULT '0',
  `frmid` bigint(20) NOT NULL DEFAULT '0',
  `frmrate` double(10,2) NOT NULL DEFAULT '0.00',
  `newrmtypeid` bigint(20) NOT NULL DEFAULT '0',
  `newrmid` bigint(20) NOT NULL DEFAULT '0',
  `rmrate` double(10,2) NOT NULL DEFAULT '0.00',
  `remarks` text,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `ca_booking_transfers` */

insert  into `ca_booking_transfers`(`id`,`bid`,`frmtypeid`,`frmid`,`frmrate`,`newrmtypeid`,`newrmid`,`rmrate`,`remarks`,`createdbyid`,`datecreated`) values (1,4,1,3,0.00,6,1000,1000.00,'Transferred to due to accommodation small space.',0,'2017-02-28 16:12:24'),(2,5,1,4,0.00,6,1000,1000.00,'Transferred',0,'2017-02-28 16:13:50'),(3,6,1,5,0.00,6,52,1000.00,'Transferred',0,'2017-02-28 16:18:10'),(4,7,1,6,0.00,1,4,500.00,'Transferred from Umbrella 6 to Umbrella 4 due to booking conflict.',0,'2017-02-28 16:19:14'),(5,10,1,6,0.00,1,1,500.00,'Transferred due to broken umbrella',0,'2017-02-28 20:07:31'),(6,10,1,1,500.00,3,16,1000.00,'Masikip',0,'2017-03-02 17:30:43');

/*Table structure for table `ca_guest_info` */

DROP TABLE IF EXISTS `ca_guest_info`;

CREATE TABLE `ca_guest_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `salutation` int(11) NOT NULL DEFAULT '0',
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `address` text,
  `email` varchar(100) DEFAULT NULL,
  `landline` varchar(25) DEFAULT NULL,
  `fax` varchar(25) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `ca_guest_info` */

insert  into `ca_guest_info`(`id`,`salutation`,`lastname`,`firstname`,`middlename`,`address`,`email`,`landline`,`fax`,`mobile`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,1,'Dela Cruz','Juan','D','Bulacan, Bulacan','jddc@example.noemail.com','021111111',NULL,'09911111111','2017-02-19 21:45:29',0,'2017-02-19 21:45:29',0),(2,3,'Wang','Malou','A','Binondo, Manila','maw@example.noemail.com','022222222',NULL,'09922222222','2017-02-19 21:45:29',0,'2017-02-19 21:45:29',0),(3,3,'Soho','Jessica','E','Ilocos Norte','jes@gma-network.com','023333333',NULL,'09933333333','2017-02-19 21:45:29',0,'2017-02-19 21:45:29',0),(4,1,'Tejol','Marlon','A','Makati City','marlon_tejol@yahoo.com','023333333',NULL,'09933333333','2017-02-19 21:45:29',0,'2017-02-19 21:45:29',0),(5,1,'Dela Cruz','Romel','S','Marikina City','rsdc@gma-network.com','023333333',NULL,'09933333333','2017-02-19 21:45:29',0,'2017-02-19 21:45:29',0),(6,2,'Villa-Abrille','Teresa','M','San Jose, Montalban, Rizal','tmva.hvill@yahoo.com','025555555',NULL,'09995555555','2017-02-22 17:18:12',0,'2017-02-22 17:18:12',0),(7,1,'Villa-Abrille','Gildon','M','San Jose, Montalban, Rizal','gmva.hvill@yahoo.com','',NULL,'','2017-02-22 20:08:23',0,'2017-02-22 20:08:23',0),(8,1,'Villa-Abrille','Daryl','T','san Jose, Montalban, Rizal','dtva.ca@yahoo.com','',NULL,'','2017-02-22 20:17:13',0,'2017-02-22 20:17:13',0),(9,3,'Wang','Malou','A','Binondo, Manila','maw@example.noemail.com','022222222',NULL,'09922222222','2017-02-22 20:24:14',0,'2017-02-22 20:24:14',0),(10,3,'Arellano','Glaiza','E','#5 Marcos Cruz Street, Brgy. Sta. Elena,','','',NULL,'09276010064','2017-02-26 22:52:16',0,'2017-02-26 22:52:16',0),(11,1,'Vodka','Mojito','J','Scandinavia','mjv@email.com','',NULL,'','2017-02-27 00:00:05',0,'2017-02-27 00:00:05',0);

/*Table structure for table `ca_guest_rates` */

DROP TABLE IF EXISTS `ca_guest_rates`;

CREATE TABLE `ca_guest_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gtype` varchar(25) NOT NULL DEFAULT 'xxx',
  `dayrate` double(10,2) NOT NULL DEFAULT '0.00',
  `dfrom` time DEFAULT NULL,
  `dto` time DEFAULT NULL,
  `nightrate` double(10,2) NOT NULL DEFAULT '0.00',
  `nfrom` time DEFAULT NULL,
  `nto` time DEFAULT NULL,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `ca_guest_rates` */

insert  into `ca_guest_rates`(`id`,`gtype`,`dayrate`,`dfrom`,`dto`,`nightrate`,`nfrom`,`nto`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,'Adult',150.00,'08:00:00','18:59:59',200.00,'19:00:00','07:59:59',0,'2017-02-16 20:59:25',0,'2017-02-16 20:59:25'),(2,'Child',100.00,'08:00:00','18:59:59',100.00,'19:00:00','07:59:59',0,'2017-02-16 20:59:25',0,'2017-02-16 20:59:25'),(3,'Child Below 2yo',0.00,'08:00:00','18:59:59',0.00,'19:00:00','07:59:59',0,'2017-02-16 20:59:25',0,'2017-02-16 20:59:25');

/*Table structure for table `ca_inv_audit` */

DROP TABLE IF EXISTS `ca_inv_audit`;

CREATE TABLE `ca_inv_audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) NOT NULL DEFAULT '0',
  `begcount` bigint(20) NOT NULL DEFAULT '1',
  `endcount` bigint(20) NOT NULL DEFAULT '1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_inv_audit` */

/*Table structure for table `ca_invaudit` */

DROP TABLE IF EXISTS `ca_invaudit`;

CREATE TABLE `ca_invaudit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_invaudit` */

/*Table structure for table `ca_invitems` */

DROP TABLE IF EXISTS `ca_invitems`;

CREATE TABLE `ca_invitems` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(20) NOT NULL DEFAULT '0',
  `itemcode` varchar(25) NOT NULL DEFAULT 'xxx',
  `itemdesc` varchar(150) NOT NULL DEFAULT 'Not Specified',
  `price` double(10,2) NOT NULL DEFAULT '0.00',
  `itemstat` bit(1) NOT NULL DEFAULT b'1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `modifieddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `ca_invitems` */

insert  into `ca_invitems`(`id`,`typeid`,`itemcode`,`itemdesc`,`price`,`itemstat`,`createdbyid`,`datecreated`,`modifiedbyid`,`modifieddate`) values (1,1,'CO-01','Charcoal 500g pack',25.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(2,1,'CO-02','Coca-Cola softdrinks 1.5L',55.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(3,1,'CO-03','Royal softdrinks 1.5L',55.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(4,1,'CO-04','Sprite softdrinks 1.5L',55.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(5,1,'CO-05','Piatos Sourcream 300g',45.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(6,1,'CO-06','Piatos Cheese 300g',45.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(7,2,'NC-01','Barbecue Grill small',500.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(8,2,'NC-02','Barbecue Grill large',550.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31'),(9,2,'NC-03','Videoke unit + Song book',1200.00,'',0,'2017-02-28 20:18:31',0,'2017-02-28 20:18:31');

/*Table structure for table `ca_invtypes` */

DROP TABLE IF EXISTS `ca_invtypes`;

CREATE TABLE `ca_invtypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typedesc` varchar(100) DEFAULT NULL,
  `typestat` bit(1) NOT NULL DEFAULT b'1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ca_invtypes` */

insert  into `ca_invtypes`(`id`,`typedesc`,`typestat`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,'Consumable','',0,'2017-02-28 20:11:02',0,'2017-02-28 20:11:02'),(2,'Non-Consumable','',0,'2017-02-28 20:11:02',0,'2017-02-28 20:11:02');

/*Table structure for table `ca_queue_served` */

DROP TABLE IF EXISTS `ca_queue_served`;

CREATE TABLE `ca_queue_served` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bid` bigint(20) NOT NULL DEFAULT '0',
  `guestid` bigint(20) NOT NULL DEFAULT '0',
  `message` text,
  `isserved` bit(1) NOT NULL DEFAULT b'0',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`bid`,`guestid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `ca_queue_served` */

insert  into `ca_queue_served`(`id`,`bid`,`guestid`,`message`,`isserved`,`createdbyid`,`datecreated`,`modifiedbyid`,`datemodified`) values (1,1,6,'Prepare : VI-04:Villa 04','\0',0,'2017-02-22 17:18:12',0,'2017-02-22 17:18:12'),(2,2,7,'Prepare : UM-01:Umbrella 1','\0',0,'2017-02-22 20:08:23',0,'2017-02-22 20:08:23'),(3,3,8,'Prepare : UM-02:Umbrella 2','\0',0,'2017-02-22 20:17:13',0,'2017-02-22 20:17:13'),(4,4,9,'Prepare : UM-03:Umbrella 3','\0',0,'2017-02-22 20:24:14',0,'2017-02-22 20:24:14'),(5,5,2,'Prepare : UM-04:Umbrella 4','\0',0,'2017-02-22 21:10:21',0,'2017-02-22 21:10:21'),(6,0,2,'Prepare : UM-05:Umbrella 5','\0',0,'2017-02-22 21:17:32',0,'2017-02-22 21:17:32'),(7,0,2,'Prepare : UM-05:Umbrella 5','\0',0,'2017-02-22 21:19:32',0,'2017-02-22 21:19:32'),(8,0,2,'Prepare : UM-05:Umbrella 5','\0',0,'2017-02-22 21:21:28',0,'2017-02-22 21:21:28'),(9,6,2,'Prepare : UM-05:Umbrella 5','\0',0,'2017-02-22 21:25:04',0,'2017-02-22 21:25:04'),(10,7,2,'Prepare : UM-06:Umbrella 6','\0',0,'2017-02-22 21:32:56',0,'2017-02-22 21:32:56'),(11,8,2,'Prepare : UM-07:Umbrella 7','\0',0,'2017-02-22 21:33:26',0,'2017-02-22 21:33:26'),(12,9,4,'Prepare : UM-06:Umbrella 6','\0',0,'2017-02-22 21:42:20',0,'2017-02-22 21:42:20'),(13,10,1,'Prepare : UM-06:Umbrella 6','\0',0,'2017-02-22 21:46:44',0,'2017-02-22 21:46:44'),(14,0,3,'Prepare : SR-04:Standard Room 04','\0',0,'2017-02-26 21:44:37',0,'2017-02-26 21:44:37'),(15,0,3,'Prepare : SR-04:Standard Room 04','\0',0,'2017-02-26 21:48:27',0,'2017-02-26 21:48:27'),(16,0,3,'Prepare : SR-05:Standard Room 05','\0',0,'2017-02-26 22:12:52',0,'2017-02-26 22:12:52'),(17,11,3,'Prepare : SR-05:Standard Room 05','\0',0,'2017-02-26 22:20:27',0,'2017-02-26 22:20:27'),(18,12,10,'Prepare : SR-01:Standard Room 01','\0',0,'2017-02-26 22:52:17',0,'2017-02-26 22:52:17'),(19,13,11,'Prepare : SR-04:Standard Room 04','\0',0,'2017-02-27 00:00:06',0,'2017-02-27 00:00:06'),(20,1,6,'Transfer: From Room 1 to Upper Room 1','\0',0,'2017-02-28 19:57:42',0,'2017-02-28 19:57:42'),(21,10,1,'Transfer : From Umbrella 6 to UM-01:Umbrella 1','\0',0,'2017-02-28 20:07:31',0,'2017-02-28 20:07:31'),(22,10,1,'Transfer : From Umbrella 1 to GA-03:Gazebo 3','\0',0,'2017-03-02 17:30:43',0,'2017-03-02 17:30:43');

/*Table structure for table `ca_reservation` */

DROP TABLE IF EXISTS `ca_reservation`;

CREATE TABLE `ca_reservation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `rsid` varchar(20) NOT NULL DEFAULT 'RESV-000000-00000000',
  `guestid` bigint(20) NOT NULL DEFAULT '0',
  `rmtypeid` bigint(20) NOT NULL DEFAULT '0',
  `roomid` bigint(20) NOT NULL DEFAULT '0',
  `rsdatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isovernight` bit(1) NOT NULL DEFAULT b'0',
  `estguestcnt` int(11) NOT NULL DEFAULT '1',
  `isdppaid` bit(1) NOT NULL DEFAULT b'0',
  `dptypeid` bit(1) NOT NULL DEFAULT b'0',
  `dpamount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rsvstatus` int(11) NOT NULL DEFAULT '0',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`rsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_reservation` */

/*Table structure for table `ca_reservesetting` */

DROP TABLE IF EXISTS `ca_reservesetting`;

CREATE TABLE `ca_reservesetting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allowmindp` bit(1) NOT NULL DEFAULT b'1',
  `dpratetype` int(11) NOT NULL DEFAULT '0',
  `dpvalue` decimal(10,2) NOT NULL DEFAULT '0.00',
  `allowresperiod` bit(1) NOT NULL DEFAULT b'1',
  `maxreservedays` int(11) NOT NULL DEFAULT '5',
  `sendresmail` bit(1) NOT NULL DEFAULT b'1',
  `recstatus` bit(1) NOT NULL DEFAULT b'1',
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca_reservesetting` */

/*Table structure for table `ca_room_rates` */

DROP TABLE IF EXISTS `ca_room_rates`;

CREATE TABLE `ca_room_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rmtypeid` bigint(20) NOT NULL DEFAULT '0',
  `regular` decimal(10,2) NOT NULL DEFAULT '0.00',
  `regtimein` time DEFAULT NULL,
  `regtimeout` time DEFAULT NULL,
  `overnight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ovntimein` time DEFAULT NULL,
  `ovntimeout` time DEFAULT NULL,
  `extension` decimal(10,2) NOT NULL DEFAULT '0.00',
  `extratebase` int(11) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`rmtypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `ca_room_rates` */

insert  into `ca_room_rates`(`id`,`rmtypeid`,`regular`,`regtimein`,`regtimeout`,`overnight`,`ovntimein`,`ovntimeout`,`extension`,`extratebase`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,1,'500.00','07:00:00','18:59:59','500.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(2,2,'1500.00','07:00:00','18:59:59','1500.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(3,3,'1000.00','07:00:00','18:59:59','1000.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(4,4,'1000.00','07:00:00','18:59:59','1000.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(5,5,'1300.00','07:00:00','18:59:59','1300.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(6,6,'1500.00','07:00:00','18:59:59','2000.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(7,7,'3500.00','07:00:00','18:59:59','3500.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(8,8,'3600.00','07:00:00','18:59:59','3600.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(9,9,'3000.00','07:00:00','18:59:59','3500.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(10,10,'4000.00','07:00:00','18:59:59','4000.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0),(11,11,'15000.00','07:00:00','18:59:59','15000.00','19:00:00','06:59:59','0.00',1,'2017-02-12 12:41:13',0,'2017-02-12 12:41:13',0);

/*Table structure for table `ca_rooms` */

DROP TABLE IF EXISTS `ca_rooms`;

CREATE TABLE `ca_rooms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(20) NOT NULL DEFAULT '0',
  `roomcode` varchar(25) NOT NULL,
  `roomdesc` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL DEFAULT '1',
  `recstatus` bit(1) NOT NULL DEFAULT b'1',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

/*Data for the table `ca_rooms` */

insert  into `ca_rooms`(`id`,`typeid`,`roomcode`,`roomdesc`,`capacity`,`recstatus`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,1,'UM-01','Umbrella 1',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(2,1,'UM-02','Umbrella 2',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(3,1,'UM-03','Umbrella 3',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(4,1,'UM-04','Umbrella 4',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(5,1,'UM-05','Umbrella 5',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(6,1,'UM-06','Umbrella 6',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(7,1,'UM-07','Umbrella 7',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(8,1,'UM-08','Umbrella 8',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(9,1,'UM-09','Umbrella 9',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(10,1,'UM-10','Umbrella 10',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(11,1,'UM-11','Umbrella 11',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(12,1,'UM-12','Umbrella 12',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(13,1,'UM-13','Umbrella 13',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(14,2,'GA-01','Gazebo 1',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(15,2,'GA-02','Gazebo 2',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(16,3,'GA-03','Gazebo 3',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(17,3,'GA-04','Gazebo 4',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(18,3,'GA-05','Gazebo 5',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(19,4,'CA-01','Cabana 1',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(20,4,'CA-02','Cabana 2',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(21,4,'CA-03','Cabana 3',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(22,4,'CA-04','Cabana 4',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(23,4,'CA-05','Cabana 5',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(24,4,'CA-06','Cabana 6',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(25,4,'CA-07','Cabana 7',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(26,4,'CA-08','Cabana 8',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(27,4,'CA-09','Cabana 9',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(28,4,'CA-10','Cabana 10',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(29,4,'CA-11','Cabana 11',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(30,4,'CA-12','Cabana 12',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(31,4,'CA-13','Cabana 13',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(32,4,'CA-14','Cabana 14',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(33,4,'CA-15','Cabana 15',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(34,4,'CA-16','Cabana 16',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(35,4,'CA-17','Cabana 17',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(36,4,'CA-18','Cabana 18',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(37,4,'CA-19','Cabana 19',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(38,4,'CA-20','Cabana 20',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(39,4,'CA-21','Cabana 21',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(40,4,'CA-22','Cabana 22',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(41,4,'CA-23','Cabana 23',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(42,4,'CA-24','Cabana 24',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(43,4,'CA-25','Cabana 25',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(44,4,'CA-26','Cabana 26',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(45,4,'CA-27','Cabana 27',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(46,4,'CA-28','Cabana 28',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(47,4,'CA-29','Cabana 29',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(48,4,'CA-30','Cabana 30',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(49,5,'CA-31','Cabana 31',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(50,5,'CA-32','Cabana 32',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(51,6,'SR-01','Standard Room 01',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(52,6,'SR-02','Standard Room 02',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(53,6,'SR-03','Standard Room 03',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(54,6,'SR-04','Standard Room 04',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(55,6,'SR-05','Standard Room 05',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(56,6,'SR-06','Standard Room 06',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(57,6,'SR-07','Standard Room 07',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(58,6,'SR-08','Standard Room 08',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(59,7,'FR-01','Family Room 07',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(60,7,'FR-02','Family Room 02',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(61,8,'VI-05','Villa 05 (Open)',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(62,9,'VI-01','Villa 01',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(63,9,'VI-02','Villa 02',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(64,9,'VI-03','Villa 02',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(65,9,'VI-04','Villa 04',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(66,9,'VI-06','Villa 06',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(67,10,'FH-01','Function Hall',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(68,11,'PV-01','Pavillion',5,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0);

/*Table structure for table `ca_roomtype` */

DROP TABLE IF EXISTS `ca_roomtype`;

CREATE TABLE `ca_roomtype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typedesc` varchar(50) DEFAULT NULL,
  `dptype` bit(1) NOT NULL DEFAULT b'0',
  `dpvalue` double NOT NULL DEFAULT '0',
  `recstatus` bit(1) NOT NULL DEFAULT b'1',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `ca_roomtype` */

insert  into `ca_roomtype`(`id`,`typedesc`,`dptype`,`dpvalue`,`recstatus`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,'Umbrella (1-13)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(2,'Gazebo (1-2)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(3,'Gazebo (3-5)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(4,'Cabana (1-30)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(5,'Cabana (31-32)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(6,'Standard Rooms','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(7,'Family Rooms','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(8,'Villa 5 (Open)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(9,'Villa (1-6)','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(10,'Function Rooms','',50,'','2017-02-12 02:24:49',0,'2017-02-12 02:24:49',0),(11,'Pavillion','',50,'','2017-02-12 12:39:53',0,'2017-02-12 12:39:53',0);

/*Table structure for table `ca_user_roles` */

DROP TABLE IF EXISTS `ca_user_roles`;

CREATE TABLE `ca_user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roledesc` varchar(150) NOT NULL DEFAULT 'Default Role',
  `allowlogin` bit(1) DEFAULT b'1',
  `allowbilling` bit(1) DEFAULT b'1',
  `allowreserve` bit(1) DEFAULT b'1',
  `allowinventory` bit(1) DEFAULT b'1',
  `allowcashier` bit(1) DEFAULT b'1',
  `allowsettings` bit(1) DEFAULT b'1',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `ca_user_roles` */

insert  into `ca_user_roles`(`id`,`roledesc`,`allowlogin`,`allowbilling`,`allowreserve`,`allowinventory`,`allowcashier`,`allowsettings`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,'CA-Administrator','','','','','','','2017-02-06 02:53:17',0,'2017-02-06 02:53:17',0);

/*Table structure for table `ca_users` */

DROP TABLE IF EXISTS `ca_users`;

CREATE TABLE `ca_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcodeid` varchar(25) NOT NULL DEFAULT '0',
  `loginid` varchar(25) NOT NULL,
  `loginpw` text NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `roleid` bigint(20) NOT NULL DEFAULT '0',
  `recstatus` bit(1) NOT NULL DEFAULT b'1',
  `datecreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdbyid` bigint(20) NOT NULL DEFAULT '0',
  `datemodified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedbyid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `ca_users` */

insert  into `ca_users`(`id`,`barcodeid`,`loginid`,`loginpw`,`lastname`,`firstname`,`middlename`,`roleid`,`recstatus`,`datecreated`,`createdbyid`,`datemodified`,`modifiedbyid`) values (1,'0000000001','ca-admin','ccc1c1812d2258fb841a8e78ff7899a0','Admin','Costa-Abril','',1,'','2017-02-06 02:55:36',0,'2017-02-06 02:55:36',0);

/*Table structure for table `ci_sessions` */

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ci_sessions` */

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('049763l5arnjt9pskoer0m35bb33vion','::1',1488798171,'__ci_last_regenerate|i:1488797883;'),('0ds878vpsb0dfnv94o6ld5aqvshmtqmt','::1',1488794266,'__ci_last_regenerate|i:1488794198;'),('63semevg64cosgujsl3tdd1pat8ara70','::1',1488799151,'__ci_last_regenerate|i:1488799060;'),('72dj239nsla6gurpbq2gggmu9dl3pot8','::1',1488795634,'__ci_last_regenerate|i:1488795634;'),('ca9samm123u709knfed2e4c3kjmhcvrj','::1',1488799813,'__ci_last_regenerate|i:1488799520;'),('caafhvtg9aro8pldgvq8qio1vilg1eta','::1',1488793329,'__ci_last_regenerate|i:1488793299;'),('dugvtq8n6ti93m1ulujq10tpn8mth9c5','::1',1488794646,'__ci_last_regenerate|i:1488794555;'),('hrsnick2dom9hl6j75s0h9mk3t0th354','::1',1488798913,'__ci_last_regenerate|i:1488798248;'),('jmaqmjdln1c8pcp5vuno45kkt3ea4o8c','::1',1488793840,'__ci_last_regenerate|i:1488793676;'),('rjfsvh8nkccgm17cr8gj5eqpg17ib8ae','::1',1488795652,'__ci_last_regenerate|i:1488795646;');

/* Procedure structure for procedure `sp_tranusers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_tranusers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tranusers`(
	ttype 	int,
	recid 	bigint,
	bid		varchar(25),
	lid		varchar(25),
	lpw		text,
	lname	varchar(50),
	fname	varchar(50),
	mname	varchar(50),
	rid		bigint,
	userid 	bigint
)
begin
	declare recordexists int default 0;
	
	-- Insert
	if ttype = 0 then
		set recordexists = (select count(id) from ca_users where `loginid` = lid and `roleid` = rid);
		if recordexists = 0 then
			insert into `ca_users`
				(`barcodeid`, `loginid`, `loginpw`, `lastname`, `firstname`, `middlename`, `roleid`, `datecreated`, `createdbyid`)
			values
				(bid, lid, md5(lpw), lname, fname, mname, rid, now(), userid);
		end if;
		
	-- Update
	elseif ttype = 1 then
	
		set recordexists = (select count(id) from `ca_users` where `loginid` = lid and `roleid` = rid and `id` != recid);
		
		if recordexists = 0 then
			if length(trim(both from lpw)) = 0 then
				update `ca_users` 
				set `barcodeid` = bid, `loginid` = lid, 
					`lastname` = lname, `firstname` = fname, `middlename` = mname, `roleid` = rid, 
					`datemodified` = now(), `modifiedbyid` = userid
				where `id` = recid;			
			else 
				update `ca_users` 
				set `barcodeid` = bid, `loginid` = lid, `loginpw` = md5(lpw), 
					`lastname` = lname, `firstname` = fname, `middlename` = mname, `roleid` = rid, 
					`datemodified` = now(), `modifiedbyid` = userid
				where `id` = recid;					
			end if;	
		end if;
	
	-- Delete
	elseif ttype = 2 then
		update `ca_users` 
		set `recstatus` = 0, `datemodified` = now(), `modifiedbyid` = userid
		where `id` = recid;
				
	-- Purge
	elseif ttype = 3 then
		delete from `ca_users` where `recstatus` = 0;
	
	-- Get List / Information
	elseif ttype = 4 then
		if recid = 0 then
			select 	a.`id`, a.`barcodeid`, 
					concat(a.`lastname`, ', ', a.`firstname`, case when length(trim(a.`middlename`)) = 0 then concat(' ', substring(a.`middlename`,1,1), '.') else '' end) as ename,
					b.`roledesc`
			from 			`ca_users` 		as a
				inner join  `ca_user_roles`	as b on a.`roleid` = b.`id`
			where a.`recstatus` = 1;
			
		else
			select `id`, `barcodeid`, `loginid`, `lastname`, `firstname`, `middlename`, `roleid`
			from `ca_users`
			where `id` = recid;
		end if;
	-- Print
	elseif ttype = 5 then
		select 'Nothing to do here.';
	
	-- Other condition
	else
		select 'Nothing to do here.';
	end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `sp_validatecredentials` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_validatecredentials` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validatecredentials`(lid varchar(25), lpw text)
BEGIN
		declare recordcount int;
		
		set recordcount = (select count(id) from `ca_users` where `loginid` = lid and `loginpw` = md5(lpw));
		
		if recordcount > 0 then
			select	a.`id` as uid, a.`loginid` as lid, a.`lastname` as lname, a.`firstname` as fname,
					b.`allowlogin`, b.`allowbilling`, b.`allowreserve`, b.`allowinventory`, b.`allowcashier`, b.`allowsettings`
			from 			`ca_users` 		as a
				inner join	`ca_user_roles`	as b on a.`roleid` = b.`id`
			where a.`loginid` = lid
			  and a.`loginpw` = md5(lpw);
		end if;
		
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
